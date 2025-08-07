# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set positional-arguments := true

# Audit secureblue
audit-secureblue *args:
    #!/bin/sh
    exec /usr/bin/python3 /usr/libexec/secureblue/audit_secureblue.py "$@"

# Run a non-flatpak application with standard memory allocator
with-standard-malloc *args:
    #!/bin/sh
    LD_PRELOAD='' exec "$@"
