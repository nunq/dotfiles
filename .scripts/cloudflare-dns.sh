#!/bin/bash
sudo systemd-resolve --interface wlan0 --set-dns 1.1.1.1 --set-domain "~." --set-dnsovertls=false
