# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Disabling print services"
systemctl disable cups.socket
systemctl mask cups.socket
systemctl disable cups.service
systemctl mask cups.service

systemctl disable cups-browsed
systemctl mask cups-browsed
