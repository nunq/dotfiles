#!/usr/bin/bash
# switching between gnome and dwm

case $1 in
  gnome)
    sudo systemctl disable getty@tty2.service
    sudo systemctl disable xdm-simple.service
    sudo systemctl enable gdm.service
    sudo systemctl disable slock@nils.service
    echo -e "\nplease reboot!" ;;
  dwm)
    sudo systemctl enable getty@tty2.service
    sudo systemctl disable gdm.service
    sudo systemctl enable xdm-simple.service
    sudo systemctl enable slock@nils.service
    echo -e "\nplease reboot!" ;;
  *)
    echo "switch to what? ./gnome-dwm-switching.sh (gnome|dwm)"
    exit 1;;
esac



