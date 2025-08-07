# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

sed -i -e '$a\LD_PRELOAD DEFAULT=libhardened_malloc.so' -e '/^LD_PRELOAD[[:space:]]/d' /etc/security/pam_env.conf
