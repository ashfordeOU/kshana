#!/usr/bin/env sh
# Fetch the full EGM2008 Earth gravity model (degree/order 2190, ICGEM .gfc, 252 MB) used by
# the data-gated tests of tests/gravity_sh_high_degree.rs and by any caller of
# SphericalHarmonicField::from_gfc_file.
#
# EGM2008 is an NGA product released for public use (Pavlis, Holmes, Kenyon and Factor,
# J. Geophys. Res. 117, B04406, 2012); the ICGEM service (GFZ) distributes the coefficient
# file and asks users to cite the service (Ince et al., Earth Syst. Sci. Data 11, 647-674, 2019).
# The file is far too large to vendor, so it goes into the git-ignored cache; Kshana ships
# only the degree-70 block (tools/egm2008_to70.gfc).
#
# Usage: scripts/fetch_egm2008.sh [dest-dir]   (default: ./realdata-cache/egm2008)
# Then:  KSHANA_EGM2008_GFC=realdata-cache/egm2008/EGM2008.gfc \
#        cargo test --test gravity_sh_high_degree -- --nocapture
set -eu

DEST="${1:-realdata-cache/egm2008}"
# The bytes the pre-registered comparison (xval/high-degree-gravity/) was run on.
EXPECT_SHA256="ab5b524da073e63b5bdceb7ca47a0de07a26dd44a1c5798f39fc98dc80af70fd"
URL="https://icgem.gfz.de/getmodel/gfc/c50128797a9cb62e936337c890e4425f03f0461d7329b09a8cc8561504465340/EGM2008.gfc"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

mkdir -p "$DEST"
OUT="$DEST/EGM2008.gfc"
if [ -f "$OUT" ] && [ "$(sha256_of "$OUT")" = "$EXPECT_SHA256" ]; then
    echo "EGM2008 already present: $OUT"
    exit 0
fi

echo "Fetching EGM2008.gfc (252 MB) -> $OUT"
curl -fSL --retry 3 --max-time 1800 -o "$OUT.part" "$URL"
got="$(sha256_of "$OUT.part")"
if [ "$got" != "$EXPECT_SHA256" ]; then
    echo "sha256 mismatch for $OUT: got $got, expected $EXPECT_SHA256" >&2
    rm -f "$OUT.part"
    exit 1
fi
mv "$OUT.part" "$OUT"
echo "EGM2008 ready: $OUT"
echo "Now run: KSHANA_EGM2008_GFC=$OUT cargo test --test gravity_sh_high_degree -- --nocapture"
