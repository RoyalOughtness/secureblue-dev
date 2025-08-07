# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

systemctl --global enable secureblue-key-enrollment-verification.timer
systemctl --global enable secureblue-update-verification.timer
