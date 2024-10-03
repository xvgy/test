#!/usr/bin/env bash

PROC_ID=$(pgrep picom)
SUP_ID=$(echo $PROC_ID | awk '{print $2}')
PROC_ID=$(echo $PROC_ID | awk '{print $1}')

if [ -z "$SUP_ID" ]
then
    echo not yet
    dbus-launch picom --config $HOME/.picom.conf 2>&1 >/dev/null &
    # dbus-launch picom --experimental-backends --config $HOME/.picom.conf 2>&1 >/dev/null &
    exit
fi

if [ $PROC_ID -gt 1 ] && ! [ -z "$SUP_ID" ]
then
    echo killing
    kill $PROC_ID
    dbus-launch picom --config $HOME/.picom.conf 2>&1 >/dev/null &
    # dbus-launch picom --experimental-backends --config $HOME/.picom.conf 2>&1 >/dev/null &
fi
