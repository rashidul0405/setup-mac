#!/usr/bin/env bash

## Software Updates
# Check for software updates daily
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ScheduleFrequency -int 1
# Automatically check for updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Disable download updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false
# Install system data files and security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -bool true
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# Set time zome automatically using current location
sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool true

# Temperature in Celsius
defaults write -g AppleTemperatureUnit -string Celsius

# Turn on dnd when screen is locked or sleeping or mirroring
sudo defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplayLock -bool true
sudo defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplaySleep -bool true
sudo defaults -currentHost write com.apple.notificationcenterui dndMirroring -bool true

# Disable guest user login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Wake the machine when the lid is opened
sudo pmset -a lidwake 1

# Enable power nap
sudo pmset -a powernap 1

# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15

# Stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Safari
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true
