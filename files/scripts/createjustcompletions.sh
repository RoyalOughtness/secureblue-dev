# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

just --completions bash | sed -E 's/([\(_" ])just/\1ujust/g' > /usr/share/bash-completion/completions/ujust
