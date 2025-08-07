# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Disabling the modem manager"
systemctl disable ModemManager
systemctl mask ModemManager
