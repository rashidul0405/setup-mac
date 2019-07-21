#!/usr/bin/env bash

# Show all file extensions
defaults write -g AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# On desktop
defaults write com.apple.finder _FXSortFoldersFirstOnDesktop -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

# Open folders in tabs instead of new windows
defaults write com.apple.finder FinderSpawnTab -bool true

# Remove items from the Trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string clmv

# Don't store desktop items on iCloud drive
defaults write com.apple.finder FXICloudDriveDesktop -bool false

# Enable Quit optoin
defaults write com.apple.finder QuitMenuItem -bool true

# Remove annoyance
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

# TODO: show location hard disk, external disk on sidebar