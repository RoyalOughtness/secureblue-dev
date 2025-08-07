# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

PORTALS_CONF="/usr/share/xdg-desktop-portal/sway-portals.conf"

sed -Ei '/^org\.freedesktop\.impl\.portal\.Screen(Cast|shot)=wlr$/s/=wlr/=none/' "$PORTALS_CONF"
