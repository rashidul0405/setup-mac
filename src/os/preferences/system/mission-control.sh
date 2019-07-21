#!/usr/bin/env bash

# Mission Control animation duration
defaults write com.apple.dock expose-animation-duration -float 0.1

# Group windows by application
defaults write com.apple.dock expose-group-apps -bool true
