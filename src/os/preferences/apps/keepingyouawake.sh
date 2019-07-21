#!/usr/bin/env bash

# Activate on launch
defaults write "info.marcel-dierkes.KeepingYouAwake" "info.marcel-dierkes.KeepingYouAwake.ActivateOnLaunch" -bool true

# Start at login
defaults write "info.marcel-dierkes.KeepingYouAwake" "info.marcel-dierkes.KeepingYouAwake.LaunchAtLogin" -bool true

# Automatically check
defaults write "info.marcel-dierkes.KeepingYouAwake" SUEnableAutomaticChecks -bool true
