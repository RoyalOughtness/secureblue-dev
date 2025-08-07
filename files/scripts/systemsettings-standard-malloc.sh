# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

# Unset LD_PRELOAD in all invocations of systemsettings in .desktop files
sed -Ei 's/^Exec=systemsettings( .*)?$/Exec=env LD_PRELOAD= systemsettings\1/' /usr/share/applications/*.desktop
