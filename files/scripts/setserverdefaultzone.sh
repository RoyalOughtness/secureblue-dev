# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -oue pipefail

sed -i 's/^DefaultZone=public/DefaultZone=FedoraServer/' /etc/firewalld/firewalld.conf
