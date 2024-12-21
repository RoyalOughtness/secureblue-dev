#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail


curl -Lo /etc/yum.repos.d/negativo17-fedora-multimedia.repo https://negativo17.org/repos/fedora-multimedia.repo
sed -i '0,/enabled=1/{s/enabled=1/enabled=1\npriority=90/}' /etc/yum.repos.d/negativo17-fedora-multimedia.repo

dnf5 install adw-gtk3-theme gnome-tweaks gnome-shell gdm mesa-dri-drivers mesa-libEGL mesa-vulkan-drivers systemd-oomd-defaults tracker tracker-miners plymouth-system-theme polkit nautilus ptyxis gnome-session-wayland-session gnome-color-manager gnome-control-center dconf adobe-source-code-pro-fonts NetworkManager-openvpn-gnome gnome-settings-daemon papirus-icon-theme
