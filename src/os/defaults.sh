#!/usr/bin/env bash

PREFERENCES_DIR="$(dirname "${BASH_SOURCE[0]}")/preferences"

set_preferences () {
    # System
    . ${PREFERENCES_DIR}/system/general.sh
    . ${PREFERENCES_DIR}/system/dock.sh
    . ${PREFERENCES_DIR}/system/finder.sh
    . ${PREFERENCES_DIR}/system/keyboard.sh
    . ${PREFERENCES_DIR}/system/menubar.sh
    . ${PREFERENCES_DIR}/system/mission-control.sh
    . ${PREFERENCES_DIR}/system/mouse.sh
    . ${PREFERENCES_DIR}/system/screensaver.sh
    . ${PREFERENCES_DIR}/system/trackpad.sh
    . ${PREFERENCES_DIR}/system/misc.sh

    # Apps
    . ${PREFERENCES_DIR}/apps/1password.sh
    . ${PREFERENCES_DIR}/apps/alfred.sh
    . ${PREFERENCES_DIR}/apps/dash.sh
    . ${PREFERENCES_DIR}/apps/droplr.sh
    . ${PREFERENCES_DIR}/apps/iterm.sh
    . ${PREFERENCES_DIR}/apps/keepingyouawake.sh
    . ${PREFERENCES_DIR}/apps/moom.sh
    . ${PREFERENCES_DIR}/apps/sourcetree.sh
}

kill_affected_apps() {
    apps=(
        #"Activity Monitor"
        #"Calendar"
        "cfprefsd"
        "Dock"
        "Finder"
        # "SystemUIServer"
        #"Terminal"
        # "1Password"
        # "1Password mini"
        # "Alfred"
        # "Dash"
        # "Droplr"
        # "iTerm2"
        # "KeepingYouAwake"
        # "Moom"
        # "Sourcetree"
    )
    for app in "${apps[@]}"; do
        execute_command killall "${app}"
    done
}
