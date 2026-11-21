#!/usr/bin/env sh
# Fetch the public Lucky-7 orbit-determination case OUTSIDE the repository (B2208, docs/AMATEUR-RF-OD.md).
#
# Source: D. Estévez, "Precise orbit determination for Lucky-7" (destevez.net, 15 August 2019) and its
# notebook in github.com/daniestevez/jupyter_notebooks at commit 8c6227921778af31afd50b75aaffd35269cee665:
#   lucky7_posW15.csv     on-board GPS fixes of Lucky-7 (X,Y,Z m Earth-fixed, GPS time of week s), 2019-07-22
#   Lucky-7 orbit.ipynb   the notebook, holding the Space-Track TLEs of launch 2019-038 it ranks against the fixes
# Licence: the repository README states data are CC BY 4.0 "to the extent where this is possible" and that data
# obtained from other sources keep their original copyright (the GPS telemetry comes from the Lucky-7 team; the
# TLEs from Space-Track, whose user agreement limits redistribution). So both files are fetched, never committed.
# Each file is checked against the SHA-256 below before use.
#
# Usage: scripts/fetch_lucky7.sh <dest-dir>; then KSHANA_LUCKY7_DIR=<dest-dir> cargo test --test amateur_od_lucky7
set -eu

DEST="${1:?usage: fetch_lucky7.sh <dest-dir>}"
BASE="https://raw.githubusercontent.com/daniestevez/jupyter_notebooks/8c6227921778af31afd50b75aaffd35269cee665"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

fetch() {
    name="$1"; url="$2"; sha="$3"
    f="$DEST/$name"
    if [ ! -f "$f" ]; then
        curl -fsSL --retry 5 --retry-delay 10 -o "$f.part" "$url"
        mv "$f.part" "$f"
    fi
    got="$(sha256_of "$f")"
    if [ "$got" != "$sha" ]; then
        echo "SHA-256 mismatch for $name: got $got, expected $sha" >&2
        exit 1
    fi
    echo "$f verified (SHA-256 $sha)"
}

mkdir -p "$DEST"
fetch lucky7_posW15.csv "$BASE/lucky7_posW15.csv" \
    41eb694bb7f811840169eb18196ebc646bd92e05dc3ca4e66312a49222b479b7
fetch lucky7_orbit.ipynb "$BASE/Lucky-7%20orbit.ipynb" \
    da1c8d30d7a278a7341c0ffcca8a2be525b6c0d81a6823918d41ab65ac93ed2c
