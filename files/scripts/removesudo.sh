#!/usr/bin/env bash

set -oue pipefail

SUDO_PACKAGES_TO_REMOVE=('sudo-python-plugin')

if [[ "$IMAGE_NAME" != *"kinoite"* && "$IMAGE_NAME" != *"lxqt"* ]]; then
    SUDO_PACKAGES_TO_REMOVE+=('sudo')
fi

rpm-ostree override remove "${SUDO_PACKAGES_TO_REMOVE[@]}"

rm -rf /usr/bin/sudo
