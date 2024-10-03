#!/usr/bin/env bash

FONT=$1
COLSCHWINDOW=$2
COLSCHBOX=$3
DISPPROMPT=$4

rofi -run-list-command "rofi_aliases"                                               \
    -run-command "bash -i -c '{cmd}'" -show run -display-run "${DISPPROMPT}"        \
    -theme-str 'entry { placeholder: "__"; } inputbar { children: [prompt, entry];}'  \
    -fixed-num-lines 3 -width 100 -padding 120 -font "$FONT" -color-window "${COLSCHWINDOW}"  \
    -color-normal "${COLSCHBOX}"
