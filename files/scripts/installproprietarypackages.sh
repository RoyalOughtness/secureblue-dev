# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

# Install from Fedora
rpm-ostree install libopenjph

curl -Lo /etc/yum.repos.d/negativo17-fedora-multimedia.repo https://negativo17.org/repos/fedora-multimedia.repo
sed -i '/^enabled=1/a\priority=90' /etc/yum.repos.d/negativo17-fedora-multimedia.repo

rpm-ostree override replace \
  --experimental \
  --from repo='fedora-multimedia' \
    libheif \
    libva \
    libva-intel-media-driver \
    intel-gmmlib \
    intel-mediasdk \
    mesa-dri-drivers \
    mesa-filesystem \
    mesa-libEGL \
    mesa-libGL \
    mesa-libgbm \
    mesa-libxatracker \
    mesa-va-drivers \
    mesa-vulkan-drivers \
    gstreamer1-plugin-libav \
    gstreamer1-plugin-vaapi \
    rar
