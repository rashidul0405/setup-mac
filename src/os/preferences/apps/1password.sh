#!/usr/bin/env bash

# UI
defaults write com.agilebits.onepassword-osx ShowItemCounts -bool true
defaults write com.agilebits.onepassword-osx ShowRichIcons -bool true

# Lock & Security
defaults write com.agilebits.onepassword-osx LockOnIdle -bool true
defaults write com.agilebits.onepassword-osx LockOnMainAppExit -bool false
defaults write com.agilebits.onepassword-osx LockOnScreenSaver -bool true
defaults write com.agilebits.onepassword-osx LockOnSleep -bool true
defaults write com.agilebits.onepassword-osx LockOnUserSwitch -bool true
defaults write com.agilebits.onepassword-osx LockTimeout -int 10
defaults write com.agilebits.onepassword-osx PasteboardClearTimeout -int 90
