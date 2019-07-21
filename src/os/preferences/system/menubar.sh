#!/usr/bin/env bash

# Show battery percentage
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.battery" -bool true
defaults write com.apple.menuextra.battery ShowPercent -bool true

# Show volume status
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true