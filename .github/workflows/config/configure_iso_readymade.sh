# Copyright 2025 Universal Blue
# Copyright 2025 The Secureblue Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.
#!/usr/bin/env bash

set -eoux pipefail

IMAGE_REF_TAG="%%REPLACE_IMAGE_REF_TAG%%"
KARGS=""
if [ "$IMAGE_REF_TAG" =~ nvidia ] ; then
  KARGS='bootc_kargs = ["rd.driver.blacklist=nouveau", "modprobe.blacklist=nouveau", "nvidia-drm.modeset=1", "nvidia-drm.fbdev=1"]'
fi 

dnf -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:staging install -y \
  readymade-nightly

dnf -y --enablerepo copr:copr.fedorainfracloud.org:ublue-os:packages install -y \
  bluefin-readymade-config

# Setup dock
tee /usr/share/glib-2.0/schemas/zz1-secureblue.gschema.override <<EOF
[org.gnome.shell]
allow-extension-installation=false
favorite-apps = ['trivalent.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Ptyxis.desktop', 'com.github.tchx84.Flatseal.desktop', 'io.github.flattool.Warehouse.desktop']
enabled-extensions = []

[org.gnome.desktop.interface]
gtk-theme='adw-gtk3'
font-antialiasing="rgba"
monospace-font-name="Monospace 12"


[org.gnome.software]
allow-updates=false
download-updates=false
EOF

# don't autostart gnome-software session service
rm -f /etc/xdg/autostart/org.gnome.Software.desktop

# disable the gnome-software shell search provider
tee /usr/share/gnome-shell/search-providers/org.gnome.Software-search-provider.ini <<EOF
DefaultDisabled=true
EOF

tee /etc/gdm/custom.conf <<"EOF"
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=liveuser
EOF

update-desktop-database

glib-compile-schemas /usr/share/glib-2.0/schemas

systemctl disable rpm-ostree-countme.service
systemctl disable bootloader-update.service
systemctl disable brew-upgrade.timer
systemctl disable brew-update.timer
systemctl disable brew-setup.service
systemctl disable rpm-ostreed-automatic.timer
systemctl disable securebluefirstrun.service
systemctl disable securebluecleanup.service
systemctl --global disable podman-auto-update.timer
systemctl --global disable secureblue-flatpak-setup.timer
systemctl --global disable secureblue-flatpak-setup.service
systemctl --global disable secureblue-key-enrollment-verification.service
systemctl --global disable secureblue-key-enrollment-verification.timer
rm -f /etc/profile.d/ublue-firstboot.sh 
rm -f /usr/share/ublue-os/firstboot/launcher/autostart.desktop
rm -f /etc/systemd/user/org.gnome.Shell@wayland.service.d/override.conf
rm -f /etc/sway/config.d/99-noxwayland.conf
rm -f /etc/systemd/user/plasma-kwin_wayland.service.d/override.conf

chmod u+s /usr/bin/mount
chmod u+s /usr/bin/umount

tee /etc/readymade.toml <<EOF
[install]
allowed_installtypes = ["wholedisk"]
copy_mode = "bootc"
bootc_imgref = "containers-storage:$IMAGE_REF_TAG"
bootc_enforce_sigpolicy = true
bootc_args = ["--skip-fetch-check"]
$KARGS

[[bento]]
title = "page-welcome"
desc = "page-installation-welcome-desc"
link = "https://secureblue.dev"
icon = "explore-symbolic"

[[bento]]
title = "page-installation-help"
desc = "page-installation-help-desc"
link = "https://secureblue.dev/install"
icon = "chat-symbolic"

[[bento]]
title = "page-installation-contrib"
desc = "page-installation-contrib-desc"
link = "https://secureblue.dev/contributing"
icon = "applications-development-symbolic"

[distro]
name = "secureblue"

[[postinstall]]
module = "Script"
EOF

dnf reinstall -y polkit

sed -i 's/PRETTY_NAME="secureblue (powered by Fedora Atomic)"/PRETTY_NAME="secureblue"/' /etc/os-release
cp /etc/os-release /usr/lib/os-release

# Configure
. /etc/os-release
sed -i 's/ANACONDA_PRODUCTVERSION=.*/ANACONDA_PRODUCTVERSION=""/' /usr/{,s}bin/liveinst || true
sed -i 's|^Icon=.*|Icon=/usr/share/pixmaps/fedora-logo-sprite.png|' /usr/share/applications/liveinst.desktop || true
sed -i 's| Fedora| secureblue|' /usr/share/anaconda/gnome/fedora-welcome || true
sed -i 's| in Activities.|.|' /usr/share/anaconda/gnome/fedora-welcome || true

cp /usr/share/pixmaps/fedora-logo-sprite.png /usr/share/pixmaps/fedora-logo-icon.png
chmod 755 /usr/share/pixmaps/fedora-logo-icon.png

cat <<< $(jq '.transports["containers-storage"][""] = [{"type": "insecureAcceptAnything"}]' /etc/containers/policy.json) > /etc/containers/policy.json


rm -f /usr/share/applications/liveinst.desktop
sed -i '/NoDisplay=.*/d' /usr/share/applications/com.fyralabs.Readymade.desktop
cp -f /usr/share/applications/com.fyralabs.Readymade.desktop /etc/xdg/autostart

# Enroll Secureboot Key
tee /usr/share/readymade/postinstall.d/99-mok.sh <<"EOF"
#!/usr/bin/bash
set -x

ENROLLMENT_PASSWORD=secureblue
SECUREBOOT_KEY="/etc/pki/akmods/certs/akmods-secureblue.der"

if [[ ! -d "/sys/firmware/efi" ]]; then
	echo "EFI mode not detected. Skipping key enrollment."
	exit 0
fi

if [[ ! -f "$SECUREBOOT_KEY" ]]; then
	echo "Secure boot key not provided: $SECUREBOOT_KEY"
	exit 0
fi

mokutil --timeout -1 || :
echo -e "$ENROLLMENT_PASSWORD\n$ENROLLMENT_PASSWORD" | mokutil --import "$SECUREBOOT_KEY" || :
EOF
chmod +x /usr/share/readymade/postinstall.d/99-mok.sh


# Entirely remove everything from the livesys configuration for GNOME
# This file isnt necessary for us considering how much setting up for
# Anaconda this does. Instead just inline whatever we actually need.
tee /usr/libexec/livesys/sessions.d/livesys-gnome <<"EOF" 
#!/bin/sh

if [ ! -d /var/lib/gnome-initial-setup ]; then
  # don't run gnome-initial-setup
  mkdir ~liveuser/.config
  : > ~liveuser/.config/gnome-initial-setup-done
fi
EOF
chmod +x /usr/libexec/livesys/sessions.d/livesys-gnome