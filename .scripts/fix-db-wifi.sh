#!/usr/bin/env bash
IFACE="$1"
[[ -z "$1" ]] && IFACE="wlan0"

gw="$(networkctl status --no-pager | grep -oP '(?<=Gateway: ).*?(?= on '$IFACE')')"

sudo systemd-resolve --interface "$IFACE" --set-dns "$gw" --set-domain "~." --set-dnsovertls=false

echo "set dns=$gw for iface=$IFACE, restart systemd-resolved to reset."
echo "opening captive portal ..."

xdg-open "http://captive.apple.com/"
