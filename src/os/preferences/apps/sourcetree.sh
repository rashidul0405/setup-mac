#!/usr/bin/env bash

# Git defaults
defaults write com.torusknot.SourceTreeNotMAS gitGlobalIgnoreFile -string "${HOME}/.gitignore_global";
defaults write com.torusknot.SourceTreeNotMAS globalUserEmail -string "rashidul0405@gmail.com";
defaults write com.torusknot.SourceTreeNotMAS globalUserFullName -string "Md Rashidul Islam";

# File status view mode: Split view staging
defaults write com.torusknot.SourceTreeNotMAS fileStatusStagingViewMode -int 1