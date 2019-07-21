#!/usr/bin/env bash

# Variables
count=1

reset="\033[0m"
highlight="\033[41m\033[97m"
dot="\033[31m▸ $reset"
dim="\033[2m"
blue="\e[34m"
green="\e[32m"
yellow="\e[33m"
tag_green="\e[30;42m"
tag_blue="\e[30;46m"
bold=$(tput bold)
normal=$(tput sgr0)
underline="\e[37;4m"
indent="   "

# Get full directory name of this script
cwd="$(cd "$(dirname "$0")" && pwd)"

_print_in_color() {
    printf "%b" \
        "$(tput setaf "$2" 2> /dev/null)" \
        "$1" \
        "$(tput sgr0 2> /dev/null)"
}

print_in_red() {
    _print_in_color "$1" 1
}

print_in_green() {
    _print_in_color "$1" 2
}

print_in_yellow() {
    _print_in_color "$1" 3
}

print_in_blue() {
    _print_in_color "$1" 4
}

print_in_purple() {
    _print_in_color "$1" 5
}

print_in_cyan() {
    _print_in_color "$1" 6
}

print_in_white() {
    _print_in_color "$1" 7
}

print_result() {

    if [ "$1" -eq 0 ]; then
        print_success "$2"
    else
        print_error "$2"
    fi

    return "$1"

}

print_question() {
    print_in_yellow "  [?] $1\n"
}

print_success() {
    print_in_green "  [✓] $1\n"
}

print_success_muted() {
    printf "  ${dim}[✓] $1${reset}\n" "$@"
}

print_muted() {
    printf "  ${dim}$1${reset}\n" "$@"
}

print_warning() {
    print_in_yellow "  [!] $1\n"
}

print_error() {
    print_in_red "  [𝘅] $1 $2\n"
}

label_blue() {
    printf "\e[30;46m $1 \033[0m\e[34m $2 \033[0m\n"
}

label_green() {
    printf "\e[30;42m $1 \e[0m\e[32m $2 \033[0m\n"
}

step() {
    printf "\n   ${dot}${underline}$@${reset}\n"
}

echo_install() {
    local fmt="$1"; shift
    printf "  [↓] $fmt " "$@"
}

chapter() {
    local fmt="$1"; shift
    printf "\n✦  ${bold}$((count++)). $fmt${normal}\n└─────────────────────────────────────────────────────○\n" "$@"
}

inform() {
    local fmt="$1"; shift
    printf "   ✦  $fmt\n" "$@"
}

ask() {
    # https://djm.me/ask
    local prompt default reply

    while true; do

        if [ "${2:-}" = "Y" ]; then
            prompt="Y/n"
            default=Y
        elif [ "${2:-}" = "N" ]; then
            prompt="y/N"
            default=N
        else
            prompt="y/n"
            default=
        fi

        # Ask the question (not using "read -p" as it uses stderr not stdout)
        echo "  [?] $1 [$prompt] "

        # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
        read reply </dev/tty

        # Default?
        if [ -z "$reply" ]; then
            reply=$default
        fi

        # Check if the reply is valid
        case "$reply" in
            Y*|y*) return 0 ;;
            N*|n*) return 1 ;;
        esac

    done
}

# return 1 if global command line program installed, else 0
cli_is_installed() {
    # set to 1 initially
    local return_=1
    # set to 0 if not found
    type $1 >/dev/null 2>&1 || { local return_=0; }
    # return value
    echo "$return_"
}

mas_setup() {
    if mas account > /dev/null; then
        return 0
    else
        return 1
    fi
}

execute_command(){
    # write your test however you want; this just tests if SILENT is non-empty
    if [ -n "$VERBOSE" ]; then
        "$@"
    else
        "$@" > /dev/null 2>&1
    fi
}