# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

rpm-ostree install selinux-policy-devel

cd ./selinux/trivalent
bash trivalent.sh
cd ../..

cd ./selinux/flatpakfull
bash flatpakfull.sh
cd ../..

cd ./selinux/nautilus
bash nautilus.sh
cd ../..

cd ./selinux/systemsettings
bash systemsettings.sh
cd ../..

semodule -i ./selinux/user_namespace/grant_userns.cil
semodule -i ./selinux/user_namespace/harden_userns.cil
semodule -i ./selinux/user_namespace/harden_container_userns.cil
semodule -i ./selinux/flatpakfull/grant_systemd_flatpak_exec.cil

semodule -i ./selinux/user_namespace/userns_deny_unconfined_relabels.cil
