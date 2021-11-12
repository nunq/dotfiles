# switching between gnome and dwm

## to gnome
```sh
sudo systemctl disable getty@tty2.service
sudo systemctl disable gdm.service
sudo systemctl enable xdm-simple.service
```

## to dwm
```sh
sudo systemctl enable getty@tty2.service
sudo systemctl disable xdm-simple.service
sudo systemctl enable gdm.service
```

