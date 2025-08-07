# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Disabling the alsa state daemon"
systemctl disable alsa-state
systemctl mask alsa-state
