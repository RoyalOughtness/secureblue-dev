# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Disabling the sssd daemons"
systemctl disable sssd
systemctl mask sssd

systemctl disable sssd-kcm
systemctl mask sssd-kcm