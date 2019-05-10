#!/bin/bash

#keymap
setxkbmap de

#top bar
while true; do
    #vars
    BATT=$(acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi')
    BRIGHTNESS=$(xbacklight -get| sed "s/\..*//")
    STATUS=$(acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi')
    VOLUME=$(pulsemixer --get-volume | awk '{print $1}')
    VIND="VOL:"
    #NETSIGNAL=$(cat /proc/net/wireless | grep -oP  "..\." | sed '1q' | sed 's/\.//')

    if [ "$STATUS" == "Charging" ]; then
        BIND="▲"
    elif [ "$STATUS" == "Discharging" ]; then
         BIND="▼"
    elif [ "$STATUS" == "Full" ]; then
         BIND="●"
    fi     

    if [ "$(pulsemixer --list-sinks | grep -o 'Name: Built-in Audio Analog Stereo, Mute: .'| grep -o 'Mute: .')" == "Mute: 1"  ]; then
      VIND=""
      VOLUME="muted"
    fi

    if [ "$BRIGHTNESS" -lt "1" ]; then
        xbacklight -set "1.1"
    fi

    xsetroot -name " $VIND$VOLUME BRI:$BRIGHTNESS BAT:$BATT$BIND $(date '+%T %d.%m.%y') "
done &

#firefox touch support
export MOZ_USE_XINPUT2=1 

#autostart
clipmenud &
redshift -l "54.12:9.45" &
xautolock -time 2 -corners ---- -cornersize 50 -locker "/usr/bin/pactl set-sink-mute 0 toggle; systemctl suspend" -detectsleep -notify 30 -notifier "notify-send --urgency=critical 'locking screen in 15s'" &
start-pulseaudio-x11 &
dunst & # ; systemctl --user import-environment DISPLAY &
syncthing -no-browser -home="/home/nils/.config/syncthing" &
#dbus-daemon --session &

#enable touch to click & natural scrolling
TOUCHPADID=$(xinput list | grep -oP "Touchpad.*id=[0-9]*\S" | sed "s/.*id=//")
TTCPROP=$(xinput list-props $TOUCHPADID | grep -oP "Tapping Enabled \(.*?\)" | sed "s/.*Tapping Enabled (//" | sed "s/)//")
NSCPROP=$(xinput list-props 9 | grep -oP "Natural Scrolling Enabled \(.*?\)" | sed "s/.*Natural Scrolling Enabled (//" | sed "s/)//")
xinput set-prop "$TOUCHPADID" "$TTCPROP" 1 &
xinput set-prop "$TOUCHPADID" "$NSCPROP" 1 &

#wallpaper
~/.scripts/fehbg &

#finally
exec ~/.scripts/startdwm