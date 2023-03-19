#!/bin/bash
# without these cron, etc cant get pulseaudio volume, etc
export DISPLAY=":0"
export PULSE_RUNTIME_PATH="/run/user/1000/pulse/"

#top bar
barupdate() {
  #vars
  BAT=$(cat /sys/class/power_supply/BAT1/capacity)
  ISONLINE=$(networkctl status -n 0 --no-pager | grep -oP '(?<=State: ).*?(?=$)')
  SINK=$(pacmd list-sinks | awk '/\* index:/{ print $3 }')
  STATUS=$(cat /sys/class/power_supply/BAT1/status)
  VOLUME=$(pactl get-sink-volume "$SINK" | grep -oP "[0-9]{1,3}%" | head -n 1)
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
  if [[ "$(pactl get-sink-mute "$SINK")" =~ "yes" ]]; then
    VOLLABEL=""
    VOLUME="muted"
  fi
  if [ "$ISONLINE" == "routable" ] ; then
    NETSTAT="connected"
  else
    NETSTAT="no networks"
  fi
  # cursor setting is required bc this script gets called from cron
  xsetroot -cursor_name left_ptr -name " $(date +%H:%M) | $(date +%a | tr '[A-Z]' '[a-z]') $(date +%d/%m/%Y) | $NETSTAT $VOLLABEL$VOLUME $BATLABEL$BAT$BATIND "
}

startup() {
  #keymap
  setxkbmap de
  #autostart
  clipmenud &
  ssh-agent &
  networkd-dispatcher &
  start-pulseaudio-x11 &
  /usr/bin/nextcloud --background &
  picom &
  dunst &
  eval $(gnome-keyring-daemon --start) # keyring
  export SSH_AUTH_SOCK # https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
  xset s off #disable screensaver
  redshift  &
  xautolock -time 15 -corners ---- -cornersize 40 -locker "/usr/bin/pactl set-sink-mute 0 1; systemctl suspend" -detectsleep -notify 25 -notifier "notify-send --urgency=critical -t 5000 'suspending in 20s'" &
  echo off > ~/.cache/dwmespresso.txt # see ~/.scripts/espresso
  echo off > ~/.cache/nsynctoggle.txt #init dnd state
  #enable touch to click & natural scrolling & enable touchpad while typing
  TOUCHPADID=$(xinput list | grep -oP "Touchpad.*id=[0-9]*\S" | sed "s/.*id=//")
  MOUSEID=$(xinput list | grep -oP "Logitech M280.*id=[0-9]*\S" | sed "s/.*id=//" | head -n 1) # mouse id
  TOUCH_TO_CLICK_PROP=$(xinput list-props $TOUCHPADID | grep -oP "Tapping Enabled \(.*?\)" | sed "s/.*Tapping Enabled (//" | sed "s/)//")
  NAT_SCROLLING_PROP=$(xinput list-props $TOUCHPADID | grep -oP "Natural Scrolling Enabled \(.*?\)" | sed "s/.*Natural Scrolling Enabled (//" | sed "s/)//")
  DISABLE_WHILE_TYPING_PROP=$(xinput list-props $TOUCHPADID | grep -oP "Disable While Typing Enabled \(.*?\)" | sed "s/.*Disable While Typing Enabled (//" | sed "s/)//")
  xinput set-prop "$MOUSEID" "$NAT_SCROLLING_PROP" 0 &
  xinput set-prop "$TOUCHPADID" "$TOUCH_TO_CLICK_PROP" 1 &
  xinput set-prop "$TOUCHPADID" "$NAT_SCROLLING_PROP" 1 &
  xinput set-prop "$TOUCHPADID" "$DISABLE_WHILE_TYPING_PROP" 0 &
  #wallpaper
  hsetroot -solid "$(shuf -n 1 ~/.config/bgcolors)"
  # set default sound card output
  sudo -u nils pactl --server "unix:/run/user/1000/pulse/native" set-card-profile 0 output:analog-stereo+input:analog-stereo
  # setup dwm bar
  ~/.xsession barupdate
  #finally
  exec ~/.scripts/startdwm
}

case $1 in
  barupdate)
    barupdate ;;
  *)
    startup ;;
esac
