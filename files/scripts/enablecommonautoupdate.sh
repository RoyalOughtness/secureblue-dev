# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

systemctl enable rpm-ostreed-automatic.timer
systemctl enable podman-auto-update.timer
systemctl --global enable podman-auto-update.timer
systemctl --global enable secureblue-flatpak-setup.timer