#!/usr/bin/env bash

echo "Building and Loading Policy"

set -x

make -f /usr/share/selinux/devel/Makefile chromium.pp || exit
semodule -d chrome
/usr/sbin/semodule -i chromium.pp -X 600

/sbin/restorecon -F -R -v /usr/lib/chromium-browser/
