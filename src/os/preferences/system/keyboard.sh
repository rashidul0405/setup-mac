#!/usr/bin/env bash

# Configure keyboard repeat 
defaults write -g InitialKeyRepeat -int 25
defaults write -g KeyRepeat -int 2

# Disable "Correct spelling automatically"
# defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Show input menu in menu bar
sudo defaults write /Library/Preferences/com.apple.TextInputMenu visible -bool true

# remove global key shortcut search man page index in terminal - conflicts with Webstorm
defaults write pbs NSServicesStatus -dict-add "com.apple.Terminal - Search man Page Index in Terminal - searchManPages" \
    '<dict>
        <key>enabled_context_menu</key>
        <integer>0</integer>
        <key>enabled_services_menu</key>
        <integer>0</integer>
        <key>presentation_modes</key>
            <dict>
                <key>ContextMenu</key>
                <integer>0</integer>
                <key>ServicesMenu</key>
                <integer>0</integer>
            </dict>
    </dict>'