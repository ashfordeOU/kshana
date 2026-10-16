#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# Validate NDM/XML messages against the CCSDS NDM/XML 4.0.0 master schema, fetched at run time
# from the SANA registry (the schemas carry no redistribution licence, so they are not vendored)
# and checked against the SHA-256 digests in SHA256SUMS beside this script; a mismatch fails.
#
#   bash xval/ndm-xsd/validate.sh <message.xml>...
#
# Needs curl, sha256sum and xmllint (libxml2). Data-gated: not part of any test verdict.
set -euo pipefail
here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
base=https://sanaregistry.org/r/ndmxml_unqualified
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
while read -r _ f; do
  curl -fsSL --retry 3 -o "$tmp/$f" "$base/$f"
done < "$here/SHA256SUMS"
(cd "$tmp" && sha256sum --quiet -c "$here/SHA256SUMS")
status=0
for x in "$@"; do
  xmllint --noout --schema "$tmp/ndmxml-4.0.0-master-4.0.xsd" "$x" || status=1
done
exit $status
