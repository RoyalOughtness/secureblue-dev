#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

curl -Lo /etc/yum.repos.d/negativo17-fedora-multimedia.repo https://negativo17.org/repos/fedora-multimedia.repo
sed -i '0,/enabled=1/{s/enabled=1/enabled=1\npriority=90/}' /etc/yum.repos.d/negativo17-fedora-multimedia.repo

rpm-ostree uninstall mesa-libglapi

rpm-ostree override remove \    
    libva \
    libva-intel-media-driver \
    mesa-dri-drivers \
    mesa-filesystem \
    mesa-libglapi \
    mesa-libEGL \
    mesa-libGL \
    mesa-libgbm \
    mesa-va-drivers \
    mesa-vulkan-drivers
  --install \
    libva \
    libva-intel-media-driver \
    mesa-dri-drivers \
    mesa-filesystem \
    mesa-libEGL \
    mesa-libGL \
    mesa-libgbm \
    mesa-va-drivers \
    mesa-vulkan-drivers

rpm-ostree override replace \
  --experimental \
  --from repo='fedora-multimedia' \
    libheif \
    mesa-libxatracker \
    gstreamer1-plugin-libav \
    gstreamer1-plugin-vaapi \
    unrar
