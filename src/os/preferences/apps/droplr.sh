#!/usr/bin/env bash

# Start at login
defaults write com.droplr.droplr-mac DroplrStartAtLogin -bool true

# Hide dock app
defaults write com.droplr.droplr-mac HideDockIcon -bool true

# Automatically upload screen captures
defaults write com.droplr.droplr-mac DMDefaultsUploadScreenshotsKey -bool true

# Don't open drop page after upload
defaults write com.droplr.droplr-mac DMDefaultsOpenDropsKey -bool false

# Login user name
defaults write com.droplr.droplr-mac DroplrKeychainUsername -string "rashidul0405@gmail.com"
