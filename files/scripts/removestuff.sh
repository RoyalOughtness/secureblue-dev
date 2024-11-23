#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

rpm-ostree override remove NetworkManager-bluetooth cups-client cups-ipptool python3-cups bluez gnome-bluetooth gutenprint system-config-printer-udev system-config-printer-libs freerdp-libs bluez-obexd libppd cups-filters-driverless cups tracker-miners liblouisutdml-utils cups-browsed nautilus nautilus-extensions ModemManager evince-libs gnome-classic-session evince-thumbnailer braille-printer-app cups-filters evince-djvu gutenprint-cups libcupsfilters evince-previewer hplip bluez-cups NetworkManager-wwan
rpm-ostree override remove totem-pl-parser qt5-qtbase qt5-qtxmlpatterns qt5-qtx11extras gstreamer1-plugins-good-qt qt5-qtwayland qt5-qtbase-gui qt5-qtsvg qadwaitadecorations-qt5 qt5-qtdeclarative qt5-qtbase-common 
rpm-ostree override remove qemu-guest-agent qemu-user-static qemu-user-static-aarch64 qemu-user-static-alpha qemu-user-static-arm qemu-user-static-cris qemu-user-static-hexagon qemu-user-static-hppa qemu-user-static-loongarch64 qemu-user-static-m68k qemu-user-static-microblaze qemu-user-static-mips qemu-user-static-or1k qemu-user-static-ppc qemu-user-static-riscv qemu-user-static-s390x qemu-user-static-sh4 qemu-user-static-sparc qemu-user-static-x86 qemu-user-static-xtensa
rpm-ostree override remove gvfs-afc gvfs-afp gvfs-archive gvfs-fuse gvfs-gphoto2 gvfs-mtp gvfs-smb
rpm-ostree override remove ImageMagick-libs ImageMagick libspectre libgs ghostscript ghostscript-tools-fonts ghostscript-tools-printing
rpm-ostree override remove flite apr-util-openssl apr-util-lmdb apr-util apr httpd-tools avahi-gobject avahi-tools cifs-utils cifs-utils-info fprintd fprintd-pam espeak-ng spice-webdavd spice-vdagent speech-dispatcher speech-dispatcher-espeak-ng speech-dispatcher-libs speech-dispatcher-utils
rpm-ostree override remove sane-backends sane-backends-drivers-cameras sane-backends-drivers-scanners sane-backends-libs sane-airscan samba-client orca libsane-hpaio hplip-libs sudo sudo-python-plugin
rpm-ostree override remove NetworkManager-vpnc NetworkManager-vpnc-gnome NetworkManager-adsl NetworkManager-openconnect NetworkManager-openconnect-gnome NetworkManager-ssh NetworkManager-ssh-gnome NetworkManager-pptp NetworkManager-pptp-gnome NetworkManager-ppp 