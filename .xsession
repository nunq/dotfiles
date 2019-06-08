#!/bin/bash
#keymap
setxkbmap de
#top bar
while sleep 1; do
    #vars
    BAT=$(cat /sys/class/power_supply/BAT1/capacity)
    BRIGHTNESS=$(xbacklight -get| sed "s/\..*//")
    NETSIGNAL=$(cat /proc/net/wireless | grep -oP  "..\." | head -n 1 | sed 's/\.//' | sed 's/\..*//')
    SINK=$(pacmd list-sinks|awk '/\* index:/{ print $3 }')
    STATUS=$(cat /sys/class/power_supply/BAT1/status)
    VOLUME=$(pacmd list-sinks | grep -A 7 "index: $SINK" | grep -oP "\/.*?[0-9]{1,3}%.*?\/" | head -n 1 | grep -oP "[0-9]{1,3}%")
    BATIND=""
    BATLABEL="bat:"
    VOLLABEL="vol:"
    if [ "$STATUS" == "Charging" ]; then
      BATIND="*"
    elif [ "$STATUS" == "Discharging" ]; then
      BATIND="%"
    fi
    if [ "$BAT" == "100" ]; then
      BATLABEL=""
      BATIND=""
      BAT="charged"
    fi
    if [ "$(pacmd list-sinks | grep -A 11 "index: $SINK" | grep 'muted:.*' | sed 's/\s//gi')" == "muted:yes" ]; then
      VOLLABEL=""
      VOLUME="muted"
    fi
    if [ "$BRIGHTNESS" -lt "1" ]; then
      xbacklight -set "1.1"
    fi
    xsetroot -name " net:$NETSIGNAL% $VOLLABEL$VOLUME bri:$BRIGHTNESS% $BATLABEL$BAT$BATIND | $(date '+%T %d.%m.%y') "
done &
#autostart
clipmenud &
ssh-agent &
redshift -l "54.12:9.45" &
xautolock -time 2 -corners ---- -cornersize 40 -locker "/usr/bin/pactl set-sink-mute 0 toggle; systemctl suspend" -detectsleep -notify 15 -notifier "notify-send --urgency=critical 'suspending in 15s'" &
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
