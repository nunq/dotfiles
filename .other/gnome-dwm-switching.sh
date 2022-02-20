#!/usr/bin/bash
# switching between gnome and dwm

case $1 in
  gnome)
    # you should probably install
    # gnome-shell gdm gnome-shell-extensions mutter orca gnome-user-share gnome-settings-daemon gnome-tweaks gnome-session gnome-control-center gnome-menus menulibre gnome-disk-utility gnome-power-manager gnome-bluetooth gjs gnome-color-manager dconf-editor gupnp libgdm libgnomekbd gupnp-igd gst-plugins-bad grilo grilo-plugins libgusb nm-connection-editor
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



