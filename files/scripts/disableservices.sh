#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

systemctl disable switcheroo-control.service  
systemctl mask switcheroo-control.service  
systemctl disable mcelog  
systemctl mask mcelog  
systemctl disable uresourced  
systemctl mask uresourced  
systemctl disable low-memory-monitor  
systemctl mask low-memory-monitor  
systemctl disable systemd-rfkill  
systemctl disable systemd-rfkill.socket  
systemctl mask systemd-rfkill  
systemctl disable mdmonitor  
systemctl mask mdmonitor  
systemctl disable lvm2-lvmpolld  
systemctl disable lvm2-lvmpolld.socket  
systemctl mask lvm2-lvmpolld.socket  
systemctl disable flatpak-system-helper  
systemctl mask flatpak-system-helper  


rm /usr/share/thumbnailers/avif.thumbnailer
rm /usr/share/thumbnailers/gsf-office.thumbnailer
rm /usr/share/thumbnailers/heif.thumbnailer
rm /usr/share/thumbnailers/jxl.thumbnailer
rm /usr/share/thumbnailers/librsvg.thumbnailer
rm /usr/share/thumbnailers/webp-pixbuf.thumbnailer