#!/usr/bin/env bash

# Quit when all windows closed
defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -bool true

# Don’t display the annoying prompt when quitting iTerm
# defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Hot key `
defaults write com.googlecode.iterm2 HotkeyChar -int 96
defaults write com.googlecode.iterm2 HotkeyCode -int 50
defaults write com.googlecode.iterm2 HotkeyModifiers -int 256

# Load preference from Dropbox
# defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
# defaults write com.googlecode.iterm2 NSNavLastRootDirectory -string "${HOME}/Dropbox/Mac/iTerm2/settings"
# save to file on quit????
# @TODO: theme, etc.
# defaults write com.googlecode.iterm2 "NoSyncNeverRemindPrefsChangesLostForFile_selection" -bool false