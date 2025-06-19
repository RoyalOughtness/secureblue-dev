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
sbkey='https://github.com/secureblue/secureblue/raw/refs/heads/live/files/system/etc/pki/akmods/certs/akmods-secureblue.der'

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
EOF

# don't autostart gnome-software session service
rm -f /etc/xdg/autostart/org.gnome.Software.desktop

# disable the gnome-software shell search provider
tee /usr/share/gnome-shell/search-providers/org.gnome.Software-search-provider.ini <<EOF
DefaultDisabled=true
EOF


tee /usr/share/applications/firefox.desktop <<'EOF'
[Desktop Entry]
Name=Installer
Exec=firefox
Icon=/usr/share/pixmaps/fedora-logo-sprite.png
Type=Application
StartupWMClass=firefox
NoDisplay=true
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
rm -f /etc/ld.so.preload

# Configure Anaconda
SPECS=(
    "libblockdev-btrfs"
    "libblockdev-lvm"
    "libblockdev-dm"
    "anaconda-live"
    "anaconda-webui"
)

dnf install -y "${SPECS[@]}"
dnf reinstall -y polkit grub2-tools-minimal util-linux-core pam util-linux sudo usermode open-vm-tools open-vm-tools-desktop shadow-utils nfs-utils fuse3 dbus-daemon plocate lockdev
dnf remove -y hardened_malloc

sed -i 's/PRETTY_NAME="secureblue (powered by Fedora Atomic)"/PRETTY_NAME="secureblue"/' /etc/os-release
cp /etc/os-release /usr/lib/os-release


mkdir -p /usr/share/anaconda/pixmaps/silverblue
tee /usr/share/anaconda/pixmaps/silverblue/fedora-silverblue.css << 'EOF'

@define-color secureblue #f6fafe;

.logo {
    background-image: url("/usr/share/pixmaps/fedora-logo-sprite.png");
    background-position: 50% 20px;
    background-repeat: no-repeat;
    background-color: transparent;
}

/* This is a placeholder to be filled by a product-specific logo. */
.product-logo {
    background-image: none;
    background-color: transparent;
}

AnacondaSpokeWindow #nav-box {
    background-color: @secureblue;
    background-repeat: no-repeat;
    color: white;
}

/* Remove the box-shadow from buttons in the nav-box because it adds a white stripe
 * below the buttons and makes them look dumb */
AnacondaSpokeWindow #nav-box GtkButton {
    box-shadow: none;
}

/* Add the product logo at the top */
.product-logo {
    background-image: none;
}
EOF

# Anaconda Profile Detection
mkdir -p /etc/anaconda/profile.d
tee /etc/anaconda/profile.d/secureblue.conf <<'EOF'
# Anaconda configuration file for secureblue

[Profile]
# Define the profile.
profile_id = secureblue

[Profile Detection]
# Match os-release values
os_id = secureblue

[Network]
default_on_boot = FIRST_WIRED_WITH_LINK

[Bootloader]
efi_dir = fedora
menu_auto_hide = True

[Storage]
default_scheme = BTRFS
btrfs_compression = zstd:1
default_partitioning =
    /     (min 1 GiB, max 70 GiB)
    /home (min 500 MiB, free 50 GiB)
    /var  (btrfs)

[User Interface]
custom_stylesheet = /usr/share/anaconda/pixmaps/silverblue/fedora-silverblue.css

[Localization]
use_geolocation = False
EOF

# Configure
. /etc/os-release
sed -i 's/ANACONDA_PRODUCTVERSION=.*/ANACONDA_PRODUCTVERSION=""/' /usr/{,s}bin/liveinst || true
sed -i 's|^Icon=.*|Icon=/usr/share/pixmaps/fedora-logo-sprite.png|' /usr/share/applications/liveinst.desktop || true
sed -i 's| Fedora| secureblue|' /usr/share/anaconda/gnome/fedora-welcome || true
sed -i 's| in Activities.|.|' /usr/share/anaconda/gnome/fedora-welcome || true

cp /usr/share/pixmaps/fedora-logo-sprite.png /usr/share/pixmaps/fedora-logo-icon.png
chmod 755 /usr/share/pixmaps/fedora-logo-icon.png

# Interactive Kickstart
mkdir -p /usr/share/anaconda/
tee -a /usr/share/anaconda/interactive-defaults.ks <<EOF
ostreecontainer --url=$IMAGE_REF_TAG --transport=containers-storage --no-signature-verification
%include /usr/share/anaconda/post-scripts/install-configure-upgrade.ks
%include /usr/share/anaconda/post-scripts/disable-fedora-flatpak.ks
%include /usr/share/anaconda/post-scripts/secureboot-enroll-key.ks
EOF

# Signed Images
mkdir -p /usr/share/anaconda/post-scripts/
tee /usr/share/anaconda/post-scripts/install-configure-upgrade.ks <<EOF
%post --erroronfail
bootc switch --mutate-in-place --enforce-container-sigpolicy --transport registry $IMAGE_REF_TAG
%end
EOF

# Disable Fedora Flatpak
tee /usr/share/anaconda/post-scripts/disable-fedora-flatpak.ks <<'EOF'
%post --erroronfail
systemctl disable flatpak-add-fedora-repos.service
%end
EOF

# Fetch the Secureboot Public Key
curl --retry 15 -Lo /etc/sb_pubkey.der "$sbkey"

cat <<< $(jq '.transports["containers-storage"][""] = [{"type": "insecureAcceptAnything"}]' /etc/containers/policy.json) > /etc/containers/policy.json


# Enroll Secureboot Key
tee /usr/share/anaconda/post-scripts/secureboot-enroll-key.ks <<'EOF'
%post --erroronfail --nochroot
set -oue pipefail

readonly ENROLLMENT_PASSWORD="secureblue"
readonly SECUREBOOT_KEY="/etc/sb_pubkey.der"

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
%end
EOF