#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Set global parameters
DIR="$(dirname "${BASH_SOURCE[0]}")"
while getopts "v" arg; do
  case $arg in
    v)
      VERBOSE=true
      ;;
  esac
done

# Include scripts
. $DIR/utils.sh
. $DIR/helpers.sh
. $DIR/os/defaults.sh

chapter "Checking internet connection..."
check_internet_connection

chapter "Caching password..."
ask_for_sudo

chapter "Reminding login to App Store..."
remind_login_to_app_store

chapter 'Checking for SSH key...'
setup_ssh_key

chapter "Installing Dependencies..."
setup_xcode_command_line_tools
setup_oh_my_zsh
setup_homebrew

# Tap brew repositories
if [ -e $cwd/packages/taps ]; then
    chapter "Adding repositories to homebrew formulae..."
    for repo in $(<$cwd/packages/taps); do
        tap_brew_repo $repo
    done
fi

# Install brews
if [ -e $cwd/packages/brews ]; then
    chapter "Installing Homebrew formulae..."
    for brew in $(<$cwd/packages/brews); do
        install_brew $brew
    done
fi

#  Install yarn packages
if [ -e $cwd/packages/yarn ]; then
    chapter "Installing yarn packages..."
    for pkg in $(<$cwd/packages/yarn); do
        install_yarn_package $pkg
    done
fi

# Install fonts
if [ -e $cwd/packages/fonts ]; then
    chapter "Installing fonts via Homebrew..."
    for font in $(<$cwd/packages/fonts); do
        install_font_via_brew $font
    done
fi

# Install applications
if [ -e $cwd/packages/casks ]; then
    chapter "Installing apps via Homebrew..."
    for cask in $(<$cwd/packages/casks); do
        install_application_via_brew $cask
    done
fi

# Install applications from mac app store
chapter "Installing apps from App Store..."
if [ -x mas ]; then
    print_warning "Please install mas-cli first: brew mas. Skipping."
else
    if [ -e $cwd/packages/apps ]; then
        if mas_setup; then
            # Workaround for associative array in Bash 3
            # https://stackoverflow.com/questions/6047648/bash-4-associative-arrays-error-declare-a-invalid-option
            for app in $(<$cwd/packages/apps); do
                KEY="${app%%::*}"
                VALUE="${app##*::}"
                install_application_via_app_store $KEY $VALUE
            done
        else
            print_warning "Please signin to App Store first. Skipping."
        fi
    fi
fi

# Configure dotfiles
chapter 'Setting up .dotfiles...'
tar -c --exclude .aliases $cwd/.dotfiles/ | tar -x -C $HOME/
# cp -n $cwd/.dotfiles/.aliases $HOME/.aliases
# cp -r $cwd/.dotfiles/. $HOME/

# Adjust preferences
chapter 'Setting up preferences...'
set_preferences
kill_affected_apps

# Congrats
chapter 'Congratulations...'
printf "${bold}Congrats! You're ready to roll :) Some changes may not be available until restart. ${normal}"

exit 0