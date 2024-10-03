#!/usr/bin/env bash

SNAPDIR=${HOME}

screencap_source_lock()
{
    [ -f /tmp/.screencaplock ] &&                                           \
        (rm /tmp/.screencaplock && notify-send "Screencap is unlocked.") || \
        (touch /tmp/.screencaplock && notify-send "Screencap is locked.")
}

__screencap_screen()
{
    maim -u ${SNAPDIR}/$(date +%s).png
}

__screencap_select()
{
    maim -u -s ${SNAPDIR}/$(date +%s).png
}

__screencap_clip()
{
    maim -s -u | xclip -selection clipboard -t image/png -i
}

screencap()
{
    MODE=$1

    if [ -f /tmp/.screencaplock ]; then
        notify-send "Screencap is locked."
        exit 2
    fi
    case $MODE in
        "screen")
            __screencap_screen
            ;;
        "select")
            __screencap_select
            ;;
        "clipboard")
            __screencap_clip
            ;;
        *)  ;;
    esac
}

[ -z ${1+x} ] && return

screencap $1
