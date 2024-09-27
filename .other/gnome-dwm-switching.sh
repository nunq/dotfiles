#!/usr/bin/bash
# switching between gnome and dwm

case $1 in
  gnome)
    # you should probably install
    # gnome-shell gdm gnome-shell-extensions mutter orca gnome-user-share gnome-settings-daemon gnome-tweaks gnome-session gnome-control-center gnome-menus menulibre gnome-disk-utility gnome-power-manager gnome-bluetooth gjs gnome-color-manager dconf-editor gupnp libgdm libgnomekbd gupnp-igd gst-plugins-bad grilo grilo-plugins libgusb nm-connection-editor
    # 2022-04 del:
    # aalib accountsservice alsa-card-profiles apache apr apr-util brltty cdparanoia chromaprint cifs-utils clutter clutter-gst clutter-gtk cogl colord-gtk4 cups-pk-helper dbus-python dotconf faac faad2 gnome-bluetooth-3.0 gnome-desktop-4 gom graphene gssdp gst-plugin-pipewire gst-plugins-bad-libs gst-plugins-base gst-plugins-good gtk4 js91 ldb libadwaita libao libavtp libbs2b libbsd libcaca libdc1394 libdca libdmapsharing libdv libfdk-aac libfreeaptx libgme libgtop libkate libldac liblrdf libltc libmd libmediaart libmicrodns libmpcdec libnma-gtk4 liboauth libopenmpt libshout libspeechd libsrtp libvisual libxklavier lilv lmdb lua lv2 mjpegtools mpg123 neon openal pipewire pipewire-media-session python-psutil python-pyxdg qrencode raptor serd shared-color-targets sord spandsp speech-dispatcher sratom svt-hevc taglib talloc tevent twolame wavpack wildmidi zbar zvbi zxing-cpp colord colord-gtk colord-gtk-common dconf-editor gdm geoclue gjs gnome-bluetooth gnome-color-manager gnome-control-center gnome-disk-utility gnome-menus gnome-power-manager gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-tweaks gnome-user-share grilo grilo-plugins gst-plugins-bad gupnp gupnp-igd libcheese libgdm libgnomekbd libgusb libnice menulibre mod_dnssd mutter orca python-atspi python-importlib-metadata python-markdown python-zipp rtmpdump smbclient soundtouch xorg-xwayland
    # 2024-08 installed:
    # yay -S gnome gnome-shell gdm gnome-shell-extensions mutter orca gnome-user-share gnome-settings-daemon gnome-tweaks gnome-session gnome-control-center gnome-menus menulibre gnome-disk-utility gnome-power-manager gnome-bluetooth gjs gnome-color-manager dconf-editor gupnp libgdm libgnomekbd gupnp-igd gst-plugins-bad grilo grilo-plugins libgusb nm-connection-editor
    # gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugin-pipewire
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



