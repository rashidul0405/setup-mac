#!/usr/bin/env bash

# Set appearance in menu.
# Blue     : 1
# Graphite : 6
defaults write -g AppleAquaColorVariant -int 1

# Use dark mode
defaults write -g AppleInterfaceStyle -string Dark
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool false

# Close windows when quiting an app ??!!
# defaults write -g NSQuitAlwaysKeepsWindows -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Sidebar icon size in finder
# Small  : 1
# Large  : 3
defaults write -g NSTableViewDefaultSizeMode -int 2

# Disable smart dashes as they’re annoying when typing code
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false

# Set computer name
# defaults write com.apple.rapport familySyncedName -string "Rashidul\\U2019s MBP"
sudo systemsetup -setcomputername "Rashidul's MBP"

# Enable the expand save panel
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true