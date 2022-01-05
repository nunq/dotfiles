#!/bin/bash
#keymap
setxkbmap de
#top bar
while :; do
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
    elif [ "$BAT" -le "12" -a "$STATUS" == "Discharging" ]; then
      BATLABEL=""
      BATIND=""
      BAT="charge!"
      notify-send --urgency=critical -t 5000 "your laptop is about to die"
    fi
    if [ "$(pacmd list-sinks | grep -A 11 "index: $SINK" | grep 'muted:.*' | sed 's/\s//gi')" == "muted:yes" ]; then
      VOLLABEL=""
      VOLUME="muted"
    fi
    if [ "$BRIGHTNESS" -lt "1" ]; then
      xbacklight -set "1.1"
    fi
    xsetroot -name " $(date +%H:%M) | $(date +%a | tr '[A-Z]' '[a-z]') $(date +%d/%m/%Y) | net:$NETSIGNAL% $VOLLABEL$VOLUME $BATLABEL$BAT$BATIND "
    sleep 5
done &
#autostart
clipmenud &
ssh-agent &
start-pulseaudio-x11 &
/usr/bin/nextcloud --background &
dunst &
#/usr/lib/mate-polkit/polkit-mate-authentication-agent-1 & # polkit agent
eval $(gnome-keyring-daemon --start) # keyring
export SSH_AUTH_SOCK # https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
xset s off #disable screensaver
redshift  &
xautolock -time 3 -corners ---- -cornersize 40 -locker "/usr/bin/pactl set-sink-mute 0 toggle; systemctl suspend" -detectsleep -notify 25 -notifier "notify-send --urgency=critical -t 5000 'suspending in 20s'" &
echo off > ~/.cache/dwmespresso.txt # see ~/.scripts/espresso
#enable touch to click & natural scrolling & enable touchpad while typing
TOUCHPADID=$(xinput list | grep -oP "Touchpad.*id=[0-9]*\S" | sed "s/.*id=//")
TOUCH_TO_CLICK_PROP=$(xinput list-props $TOUCHPADID | grep -oP "Tapping Enabled \(.*?\)" | sed "s/.*Tapping Enabled (//" | sed "s/)//")
NAT_SCROLLING_PROP=$(xinput list-props $TOUCHPADID | grep -oP "Natural Scrolling Enabled \(.*?\)" | sed "s/.*Natural Scrolling Enabled (//" | sed "s/)//") # mouse id
DISABLE_WHILE_TYPING_PROP=$(xinput list-props $TOUCHPADID | grep -oP "Disable While Typing Enabled \(.*?\)" | sed "s/.*Disable While Typing Enabled (//" | sed "s/)//")
xinput set-prop "$TOUCHPADID" "$TOUCH_TO_CLICK_PROP" 1 &
xinput set-prop 9 "$NAT_SCROLLING_PROP" 0 &
xinput set-prop "$TOUCHPADID" "$NAT_SCROLLING_PROP" 1 &
xinput set-prop "$TOUCHPADID" "$DISABLE_WHILE_TYPING_PROP" 0 &
#wallpaper
~/.scripts/fehbg
#finally
exec ~/.scripts/startdwm
