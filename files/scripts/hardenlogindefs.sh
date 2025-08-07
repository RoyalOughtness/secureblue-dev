# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

PATCH_ARGS=("--forward" "--strip=1" "--no-backup-if-mismatch")

patch /etc/login.defs "${PATCH_ARGS[@]}" < hardenlogindefs.patch
