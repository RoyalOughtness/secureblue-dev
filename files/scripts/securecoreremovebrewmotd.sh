# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

sed -i '/brew help/d' /usr/share/ublue-os/motd/secureblue.md
