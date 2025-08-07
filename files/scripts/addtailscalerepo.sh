# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

curl -L https://pkgs.tailscale.com/stable/fedora/tailscale.repo -o /etc/yum.repos.d/tailscale.repo
