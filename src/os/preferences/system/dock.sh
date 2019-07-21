#!/usr/bin/env bash

# Auto hide the dock
defaults write com.apple.dock autohide -bool true

# Set Dock position: left | bottom | right
defaults write com.apple.dock orientation -string left

# always prefer tabs when opening documents
defaults write -g AppleWindowTabbingMode -string always

# Animate apps on launch
defaults write com.apple.dock launchanim -bool true

# Display a dot indicator on open apps
defaults write com.apple.dock show-process-indicators -bool true

# Do not show recently openned apps
defaults write com.apple.dock show-recents -bool false

# Icon size of Dock items
defaults write com.apple.dock tilesize -int 35

# Only show active running applications
# defaults write com.apple.dock static-only -bool TRUE
