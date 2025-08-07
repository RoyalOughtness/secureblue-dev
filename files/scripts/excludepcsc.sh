# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

sed -i '/^add_dracutmodules+=" .* "/s/ pcsc / /' /usr/lib/dracut/dracut.conf.d/90-ublue-luks.conf
