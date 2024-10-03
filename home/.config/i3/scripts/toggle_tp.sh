#!/usr/bin/env bash

TOUCHPAD_NAME="Synaptics TouchPad" 
TOUCHPAD_ID=$(xinput | grep "$TOUCHPAD_NAME" | awk '{print $6}'| tail -c 3)
PROP_NAME="Tapping Enabled (" 
PROP_QUERY=$(xinput list-props $TOUCHPAD_ID | grep "$PROP_NAME")
PROP_ID=$(echo $PROP_QUERY | awk '{print $4}' | head -c 4 | tail -c 3)
PROP_STATUS=$(echo $PROP_QUERY | awk '{print $5}')

{
    if ! [ -z "$1" ]
    then
        xinput set-prop $TOUCHPAD_ID $PROP_ID 1
        exit
    fi
}

function _toggle
{
    if [ $PROP_STATUS -eq 1 ]
    then
        echo 0
    elif [ $PROP_STATUS -eq 0 ]
    then
        echo 1
    fi
}

xinput set-prop $TOUCHPAD_ID $PROP_ID $(_toggle)
