#!/usr/bin/env bash

# Start after begin idle for time (in seconds)
defaults -currentHost write com.apple.screensaver idleTime -int 120

# Do not show with clock
defaults -currentHost write com.apple.screensaver showClock -bool false
