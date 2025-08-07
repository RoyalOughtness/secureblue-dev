# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

echo "Enabling faillock in PAM authentication profile"

authselect enable-feature with-faillock 1> /dev/null