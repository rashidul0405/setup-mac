#!/usr/bin/env bash

# Disable install dockset updates automatically
defaults write com.kapeli.dash automaticallyUpdate -bool false

# Start at login
defaults write com.kapeli.dash shouldStartAtLogin -bool true

# Don't show in dock
defaults write com.kapeli.dash showInDock -bool false

# Disable v3 upgrade alert
defaults write com.kapeli.dash didSuppressV3UpdateAlert -bool true

# Disable download dockset alerts
defaults write com.kapeli.dash didSuppressDownloadDocsetsAlert -bool true