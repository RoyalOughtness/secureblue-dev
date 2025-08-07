# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Disabling avahi-daemon"
systemctl disable avahi-daemon.socket
systemctl mask avahi-daemon.socket
systemctl disable avahi-daemon.service
systemctl mask avahi-daemon.service
