#!/usr/bin/env bash

# Ask for the administrator password upfront.
ask_for_sudo() {
    sudo -v &>/dev/null

    # Keep-alive: update existing `sudo` time stamp until script has finished
    while true; do
        sudo -n true
        sleep 60
        kill -0 "$$" || exit
    done 2>/dev/null &

    print_success "Password cached"
}

remind_login_to_app_store() {
    if ask "Do you want to install applications from Mac App Store? Then please log into the Mac App Store app manually. More info: https://github.com/mas-cli/mas/issues/164. Did you logged in?" Y; then
        print_success "Confirmed app store logged in."
    else
        print_success_muted "Reminded about App Store logged in."
    fi
}

# check internet connection
check_internet_connection() {
    if [ ping -q -w1 -c1 google.com ] &>/dev/null; then
        print_error "Please check your internet connection"
        exit 0
    else
        print_success "Connected to Internet"
    fi
}

# Xcode
setup_xcode_command_line_tools() {
    if type xcode-select >&- && xpath=$(xcode-select --print-path) &&
        test -d "${xpath}" && test -x "${xpath}"; then
        print_success_muted "Xcode already installed. Skipping."
    else
        step "Installing Xcode..."
        execute_command xcode-select --install
        # sleep 1
        # osascript <<EOD
            # tell application "System Events"
                # tell process "Install Command Line Developer Tools"
                # keystroke return
                # click button "Agree" of window "License Agreement"
                # end tell
            # end tell
# EOD
        print_success "Xcode installed!"
    fi
}

# setup ssh and copy to github
copy_key_github() {
    inform 'Public key copied! Paste into Github...'
    [[ -f $pub ]] && cat $pub | pbcopy
    open 'https://github.com/account/ssh'
    read -p "   ✦  Press enter to continue..."
    print_success "SSH key"
    return
}

github_key_check() {
    if ask "SSH key found. Enter it in Github?" Y; then
        copy_key_github
    else
        print_success "SSH key"
    fi
}

create_ssh_key() {
    if ask "No SSH key found. Create one?" Y; then
        ssh-keygen -t rsa
        github_key_check
    else
        return 0
    fi
}

setup_ssh_key() {
    local pub=$HOME/.ssh/id_rsa.pub

    if ! [[ -f $pub ]]; then
        create_ssh_key
    else
        github_key_check
    fi
}

# oh-my-zsh
setup_oh_my_zsh() {
    if [ -d "$HOME/.oh-my-zsh" ]; then
        print_success_muted "Oh My Zsh already installed. Skipping."
    else
        step "Installing Oh My Zsh..."
        execute_command curl -fsSL 'https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh' | bash
        print_success "Oh My Zsh installed!"
    fi

}

# Homebrew
setup_homebrew() {
    if ! [ -x "$(command -v brew)" ]; then
        step "Installing Homebrew..."
        execute_command curl -fsSL 'https://raw.githubusercontent.com/Homebrew/install/master/install.sh' | bash
        print_success "Homebrew installed!"
    else
        step "Updating Homebrew..."
        execute_command brew update
        print_success_muted "Homebrew updated!"
    fi
}

# Tap brew repositories
tap_brew_repo() {
    if test ! $(brew tap | grep $repo); then
        echo_install "Adding $repo"
        execute_command brew tap $repo
        print_in_green "${indent}${indent}${bold}✓ added!${normal}\n"
    else
        print_success_muted "$repo already added. Skipped."
    fi
}

# Install homebrew packages
install_brew() {
    if test ! $(brew list --formula | grep "$brew$"); then
        echo_install "Installing $brew"
        HOMEBREW_NO_AUTO_UPDATE=1 execute_command brew install $brew
        print_in_green "${indent}${indent}${bold}✓ installed!${normal}\n"
    else
        print_success_muted "$brew already installed. Skipped."
    fi
}

# Install yarn packages
install_yarn_package() {
    if [[ $(cli_is_installed $1) == 0 ]]; then
        echo_install "Installing $1"
        execute_command yarn global add $1
        print_in_green "${indent}${indent}${bold}✓ installed!${normal}\n"
    else
        print_success_muted "$1 already installed. Skipped."
    fi
}

# Install fonts via homebrew
install_font_via_brew() {
    if test ! $(brew list --cask | grep $font); then
        echo_install "Installing $font"
        HOMEBREW_NO_AUTO_UPDATE=1 execute_command brew install --cask $font
        print_in_green "${indent}${indent}${bold}✓ installed!${normal}\n"
    else
        print_success_muted "$font already installed. Skipped."
    fi
}

# Install homebrew casks
install_application_via_brew() {
    if [[ ! $(brew list --cask | grep $cask) ]]; then
        echo_install "Installing $cask"
        HOMEBREW_NO_AUTO_UPDATE=1 execute_command brew install --cask $cask --appdir=/Applications
        print_in_green "${indent}${indent}${bold}✓ installed!${normal}\n"
    else
        print_success_muted "$cask already installed. Skipped."
    fi
}

# Install app store applications
install_application_via_app_store() {
    if ! mas list | grep $1 &>/dev/null; then
        echo_install "Installing $2"
        execute_command mas install $1
        print_in_green "${indent}${indent}${bold}✓ installed!${normal}\n"
    else
        print_success_muted "$2 already installed. Skipped."
    fi
}
