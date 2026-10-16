#!/usr/bin/env sh
# Fetch the inputs of the CAP-30 stage-2 Mars orbit determination
# (tests/mro_odf_short_arc_od_oracle.rs) into the git-ignored cache.
#
# None of these is vendored: the MRO reconstruction is 126 MB, and the others are kept beside
# it so the test has one data directory. All are public NASA products (NAIF, PDS Geosciences
# Node). Every file is checked against a pinned SHA-256 and deleted on a mismatch, because these
# inputs back a ledger row. To move a pin, change the URL and the hash together.
#
# Usage: scripts/fetch_mro_od.sh [dest-dir]   (default: ./realdata-cache/mro)
set -eu

DEST="${1:-realdata-cache/mro}"
NAIF=https://naif.jpl.nasa.gov/pub/naif
PDSG=https://pds-geosciences.wustl.edu/mro/mro-m-rss-5-sdp-v1/mrors_1xxx/data/shadr

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

fetch() { # name url sha256
    if [ -f "$DEST/$1" ] && [ "$(sha256_of "$DEST/$1")" = "$3" ]; then
        echo "present: $DEST/$1"
        return 0
    fi
    echo "fetching $2 -> $DEST/$1"
    curl -fSL --retry 3 --max-time 1800 -o "$DEST/$1" "$2"
    got="$(sha256_of "$DEST/$1")"
    if [ "$got" != "$3" ]; then
        echo "sha256 mismatch for $DEST/$1: got $got, expected $3" >&2
        rm -f "$DEST/$1"
        exit 1
    fi
}

mkdir -p "$DEST"
# MRO NAV team reconstructed trajectory, 2007-10-01 to 2008-01-01 (SPK type 1, MRO-M-SPICE-6-V1.0).
fetch mro_psp5.bsp "$NAIF/pds/data/mro-m-spice-6-v1.0/mrosp_1000/data/spk/mro_psp5.bsp" \
    9c26069bcdfca2ef42e5afd3baebb721ffb9dfc22096fcffd59aef430b676c75
# JPL DE440 (short span): Sun, Earth, Mars and Jupiter barycentres.
fetch de440s.bsp "$NAIF/generic_kernels/spk/planets/de440s.bsp" \
    c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2
# DSN station coordinates and velocities (DSN 810-005 module 301 rev. P, ITRF93, epoch 2003.0),
# read from the text setup block of the NAIF station kernel's comment file.
fetch earthstns_itrf93_260814.cmt "$NAIF/generic_kernels/spk/stations/earthstns_itrf93_260814.cmt" \
    567f9516452b849a58c3ff75fa6cec8a81cc336cb7726238c49fe265f294dff5
# GMM-3 Mars gravity field, degree and order 120 (Genova et al. 2016), PDS SHADR table and label.
fetch gmm3_120_sha.tab "$PDSG/gmm3_120_sha.tab" \
    eb4913b1afb6682406e6a9dad5be7918a162fa8462473c9a2e7aae258d4c2c9c
fetch gmm3_120_sha.lbl "$PDSG/gmm3_120_sha.lbl" \
    097f9989fc87bc9adbf04be754734349160228de940f9a242164f3be1b80bb7d

echo "MRO OD inputs ready in $DEST"
echo "Now run: cargo test --release --test mro_odf_short_arc_od_oracle -- --nocapture"
