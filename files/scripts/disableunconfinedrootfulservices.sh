# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

systemctl disable uresourced.service
systemctl mask uresourced.service

systemctl disable low-memory-monitor.service
systemctl mask low-memory-monitor.service

systemctl disable thermald.service
systemctl mask thermald.service
