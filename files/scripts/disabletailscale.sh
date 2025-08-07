# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Disabling tailscale"
systemctl disable tailscaled
systemctl mask tailscaled
