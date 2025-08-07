# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

SUDO_PACKAGES_TO_REMOVE=('sudo-python-plugin')

if [[ "$IMAGE_NAME" != *"kinoite"* ]]; then
    SUDO_PACKAGES_TO_REMOVE+=('sudo')
fi

rpm-ostree override remove "${SUDO_PACKAGES_TO_REMOVE[@]}"

rm -rf /usr/bin/sudo
