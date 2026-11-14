#!/usr/bin/env sh
# Fetch the schemas tests/connect_042_w2.rs validates against when they are present: the OMG XTCE 1.2
# XML schema (bytes checked) and the OASIS STIX 2.1 JSON schemas of the objects Kshana writes
# (identity, location, extension-definition and the common core). Neither is vendored.
# Usage: scripts/fetch_042_w2_schemas.sh [dest-dir]   (default: ./realdata-cache)
set -eu
DEST="${1:-realdata-cache}"
XTCE_URL="https://www.omg.org/spec/XTCE/20180204/SpaceSystem.xsd"
XTCE_SHA256="acc3fafc8f16e6c8993335d27c4a1931b2b7eb0e7d1a57b73e745056ca93060d"
STIX="https://raw.githubusercontent.com/oasis-open/cti-stix2-json-schemas/master/schemas"
mkdir -p "$DEST/xtce"
curl -fSL --retry 3 --max-time 120 -o "$DEST/xtce/SpaceSystem.xsd" "$XTCE_URL"
if command -v sha256sum >/dev/null 2>&1; then got="$(sha256sum "$DEST/xtce/SpaceSystem.xsd" | cut -d' ' -f1)"
else got="$(shasum -a 256 "$DEST/xtce/SpaceSystem.xsd" | cut -d' ' -f1)"; fi
if [ "$got" != "$XTCE_SHA256" ]; then
    echo "sha256 mismatch: got $got, expected $XTCE_SHA256" >&2
    rm -f "$DEST/xtce/SpaceSystem.xsd"
    exit 1
fi
# The schema imports the W3C xml namespace schema by its web address; keep a local copy beside it
# and point the import there, so validation needs no network.
curl -fSL --retry 3 --max-time 60 -o "$DEST/xtce/xml.xsd" "https://www.w3.org/2001/03/xml.xsd"
sed 's#schemaLocation="http://www.w3.org/2001/03/xml.xsd"#schemaLocation="xml.xsd"#' \
    "$DEST/xtce/SpaceSystem.xsd" > "$DEST/xtce/SpaceSystem.local.xsd"
for f in common/binary.json common/core.json common/dictionary.json common/extension-definition.json \
    common/extension.json common/external-reference.json common/granular-marking.json \
    common/hashes-type.json common/hex.json common/identifier.json common/properties.json \
    common/timestamp.json common/url-regex.json sdos/identity.json sdos/location.json; do
    mkdir -p "$DEST/stix21/schemas/$(dirname "$f")"
    curl -fSL --retry 3 --max-time 60 -o "$DEST/stix21/schemas/$f" "$STIX/$f"
done
echo "schemas ready: $DEST/xtce/SpaceSystem.local.xsd, $DEST/stix21/schemas"
