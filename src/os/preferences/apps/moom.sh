#!/usr/bin/env bash

open -a Moom --hide --background && killall Moom

# Run as menu bar application
defaults write com.manytricks.Moom "Application Mode" -int 1

# Launch automatically on login
defaults write com.manytricks.Moom "Stealth Mode" -bool true

# Hot key -> Ctrl + M
defaults write com.manytricks.Moom "Keyboard Controls" -dict-add  "Key Code" 46 "Visual Representation"  "\\U2303M"
