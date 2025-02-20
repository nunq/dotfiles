#!/usr/bin/env bash

gw="$(networkctl status --no-pager | grep -oP '(?<=Gateway: ).*?(?= on wlan0)')"

sudo systemd-resolve --interface wlan0 --set-dns "$gw" --set-domain "~." --set-dnsovertls=false

echo "set dns=$gw for iface=wlan0, restart systemd-resolved to reset."
echo "opening captive portal ..."

xdg-open "http://captive.apple.com/"
