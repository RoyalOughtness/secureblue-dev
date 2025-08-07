#!/usr/bin/env bash

# SPDX-FileCopyrightText 2025 The Secureblue Authors
#
# SPDX-License-Identifier: Apache-2.0 OR MIT

set -euo pipefail

cd ../po
for po_file in */*.po; do
    lang_code=$(dirname -- "$po_file")
    mo_filename=$(basename -- "$po_file" | sed 's/\.po$/.mo/')
    msgfmt -o /usr/share/locale/"$lang_code"/LC_MESSAGES/"$mo_filename" -- "$po_file"
done
