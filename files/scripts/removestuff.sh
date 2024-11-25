#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

rpm-ostree override remove NetworkManager-bluetooth cups-client cups-ipptool python3-cups bluez gnome-bluetooth gutenprint system-config-printer-udev system-config-printer-libs freerdp-libs bluez-obexd libppd cups-filters-driverless cups liblouisutdml-utils cups-browsed ModemManager evince-libs gnome-classic-session evince-thumbnailer braille-printer-app cups-filters evince-djvu gutenprint-cups libcupsfilters evince-previewer hplip bluez-cups NetworkManager-wwan
rpm-ostree override remove qt5-qtbase qt5-qtxmlpatterns qt5-qtx11extras gstreamer1-plugins-good-qt qt5-qtwayland qt5-qtbase-gui qt5-qtsvg qadwaitadecorations-qt5 qt5-qtdeclarative qt5-qtbase-common 
rpm-ostree override remove qemu-guest-agent qemu-user-static qemu-user-static-aarch64 qemu-user-static-alpha qemu-user-static-arm qemu-user-static-cris qemu-user-static-hexagon qemu-user-static-hppa qemu-user-static-loongarch64 qemu-user-static-m68k qemu-user-static-microblaze qemu-user-static-mips qemu-user-static-or1k qemu-user-static-ppc qemu-user-static-riscv qemu-user-static-s390x qemu-user-static-sh4 qemu-user-static-sparc qemu-user-static-x86 qemu-user-static-xtensa
rpm-ostree override remove gvfs-afc gvfs-afp gvfs-archive gvfs-fuse gvfs-gphoto2 gvfs-mtp gvfs-smb fprintd fprintd-pam 
rpm-ostree override remove ImageMagick-libs ImageMagick libspectre libgs ghostscript ghostscript-tools-fonts ghostscript-tools-printing
rpm-ostree override remove orca speech-dispatcher speech-dispatcher-espeak-ng speech-dispatcher-libs speech-dispatcher-utils espeak-ng 
rpm-ostree override remove flite apr-util-openssl apr-util-lmdb apr-util apr httpd-tools avahi-gobject avahi-tools spice-webdavd spice-vdagent 
rpm-ostree override remove sane-backends sane-backends-drivers-cameras sane-backends-drivers-scanners sane-backends-libs sane-airscan samba-client libsane-hpaio hplip-libs sudo sudo-python-plugin
rpm-ostree override remove NetworkManager-vpnc NetworkManager-vpnc-gnome NetworkManager-adsl NetworkManager-openconnect NetworkManager-openconnect-gnome NetworkManager-ssh NetworkManager-ssh-gnome NetworkManager-pptp NetworkManager-pptp-gnome NetworkManager-ppp 
rpm-ostree override remove fuse-overlayfs hplip-common geolite2-city geolite2-country git-core git-core-doc urw-base35-bookman-fonts urw-base35-c059-fonts urw-base35-d050000l-fonts urw-base35-fonts urw-base35-fonts-common urw-base35-gothic-fonts urw-base35-nimbus-mono-ps-fonts urw-base35-nimbus-roman-fonts urw-base35-nimbus-sans-fonts urw-base35-p052-fonts urw-base35-standard-symbols-ps-fonts urw-base35-z003-fonts openconnect hyperv-daemons hyperv-daemons-license hypervfcopyd hypervkvpd hypervvssd gutenprint-libs hfsplus-tools google-noto-naskh-arabic-vf-fonts google-noto-sans-arabic-vf-fonts google-noto-sans-armenian-vf-fonts google-noto-sans-bengali-vf-fonts google-noto-sans-canadian-aboriginal-vf-fonts google-noto-sans-cherokee-vf-fonts google-noto-sans-cjk-vf-fonts google-noto-sans-devanagari-vf-fonts google-noto-sans-ethiopic-vf-fonts google-noto-sans-georgian-vf-fonts google-noto-sans-gujarati-vf-fonts google-noto-sans-gurmukhi-vf-fonts google-noto-sans-hebrew-vf-fonts google-noto-sans-kannada-vf-fonts google-noto-sans-khmer-vf-fonts google-noto-sans-lao-vf-fonts google-noto-sans-math-fonts google-noto-sans-meetei-mayek-vf-fonts google-noto-sans-mono-cjk-vf-fonts google-noto-sans-ol-chiki-vf-fonts google-noto-sans-oriya-vf-fonts google-noto-sans-sinhala-vf-fonts google-noto-sans-tamil-vf-fonts google-noto-sans-telugu-vf-fonts google-noto-sans-thaana-vf-fonts google-noto-sans-thai-vf-fonts google-noto-serif-armenian-vf-fonts google-noto-serif-bengali-vf-fonts google-noto-serif-cjk-vf-fonts google-noto-serif-devanagari-vf-fonts google-noto-serif-ethiopic-vf-fonts google-noto-serif-georgian-vf-fonts google-noto-serif-gujarati-vf-fonts google-noto-serif-gurmukhi-vf-fonts google-noto-serif-hebrew-vf-fonts google-noto-serif-kannada-vf-fonts google-noto-serif-khmer-vf-fonts google-noto-serif-lao-vf-fonts google-noto-serif-oriya-vf-fonts google-noto-serif-sinhala-vf-fonts google-noto-serif-tamil-vf-fonts google-noto-serif-telugu-vf-fonts google-noto-serif-thai-vf-fonts default-fonts-zu default-fonts-other-serif default-fonts-other-sans default-fonts-ar default-fonts-hy default-fonts-bn default-fonts-iu default-fonts-chr default-fonts-cjk-sans default-fonts-mr default-fonts-am default-fonts-ka default-fonts-gu default-fonts-pa default-fonts-yi default-fonts-kn default-fonts-km default-fonts-lo default-fonts-core-math default-fonts-mni default-fonts-cjk-mono default-fonts-sat default-fonts-or default-fonts-si default-fonts-ta default-fonts-te default-fonts-dv default-fonts-th default-fonts-xh default-fonts-cjk-serif default-fonts-vi default-fonts-as default-fonts-mai default-fonts-he default-fonts-ve default-fonts-hi default-fonts-uk default-fonts-ts default-fonts-tn default-fonts-ss default-fonts-ru default-fonts-nso default-fonts-nr default-fonts-nn default-fonts-nb default-fonts-ku default-fonts-ia default-fonts-eu default-fonts-eo default-fonts-el default-fonts-dz  default-fonts-br  default-fonts-bg default-fonts-be default-fonts-ast
rpm-ostree override remove ibus-anthy ibus-anthy-python ibus-chewing ibus-gtk4 ibus-hangul ibus-libpinyin ibus-m17n ntfsprogs ntfs-3g ntfs-3g-libs ntfs-3g-system-compression python3-boto3 python3-botocore python3-brlapi python3-charset-normalizer python3-dateutil  python3-enchant python3-file-magic  python3-louis python3-olefile python3-packaging  python3-pexpect python3-pillow python3-ptyprocess python3-pyatspi python3-regex python3-requests python3-s3transfer python3-simpleaudio python3-speechd python3-urllib3 python3-urllib3+socks ibus-typing-booster sos
rpm-ostree override remove  gspell mtr low-memory-monitor uresourced kasumi-common kasumi-unicode julietaula-montserrat-fonts jomolhari-fonts default-fonts-bo rygel gupnp-dlna gupnp-av gnome-software gnome-user-docs gnome-menus  gnome-app-list epiphany-runtime  gnome-shell-extension-apps-menu gnome-shell-extension-background-logo gnome-shell-extension-launch-new-instance gnome-shell-extension-places-menu  gnome-shell-extension-window-list default-fonts-fa default-fonts-ml default-fonts-ne lvm2 lvm2-libs texlive-lib tcl usb_modeswitch usb_modeswitch-data stix-fonts  sshpass sil-padauk-fonts default-fonts-my qpdf-libs realmd vpnc-script pptp vpnc paktype-naskh-basic-fonts libcamera libcamera-ipa pipewire-plugin-libcamera default-fonts-ur
rpm-ostree override remove  vazirmatn-vf-fonts openssh-server m17n-db m17n-lib
rpm-ostree override remove httpd-filesystem xfsprogs exiv2  gamemode  man-db  gst-editing-services  audit mcelog 



systemctl disable  switcheroo-control.service
systemctl mask  switcheroo-control.service
systemctl disable  flatpak-system-helper.service
systemctl mask  flatpak-system-helper.service
systemctl disable   mdmonitor.service
systemctl mask   mdmonitor.service
systemctl disable   systemd-rfkill.service
systemctl mask   systemd-rfkill.service
systemctl disable   dm-event.service
systemctl mask   dm-event.service
systemctl disable   accounts-daemon.service
systemctl mask   accounts-daemon.service
systemctl disable   rc-local.service
systemctl mask   rc-local.service
systemctl disable grub2-systemd-integration.service    
systemctl mask grub2-systemd-integration.service    
systemctl disable systemd-bsod.service    
systemctl mask systemd-bsod.service  
