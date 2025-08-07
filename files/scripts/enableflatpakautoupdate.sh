# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

systemctl --global enable flatpak-user-update.timer
systemctl enable flatpak-system-update.timer