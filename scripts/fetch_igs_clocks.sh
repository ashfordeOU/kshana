#!/usr/bin/env sh
# Fetch 14 days of International GNSS Service (IGS) final combined clocks at 30 s and
# extract the GPS Block IIF satellite clocks used by tests/slot_timing_igs_holdout.rs.
#
# Source: IGS final products (IGS0OPSFIN_*_01D_30S_CLK), GPS weeks 2380-2381
# (2025-08-17 to 2025-08-30), from the public BKG mirror. IGS products are openly
# available with attribution to the IGS; they are not vendored, only fetched into the
# git-ignored cache and checked byte-for-byte against the SHA-256 values below.
#
# Output: realdata-cache/igs/gps_iif_clocks.txt, one line per record:
#   PRN  seconds-since-2025-08-17T00:00:00Z  clock-bias-seconds
#
# Usage: scripts/fetch_igs_clocks.sh [dest-dir]   (default: ./realdata-cache/igs)
set -eu

DEST="${1:-realdata-cache/igs}"
BASE="https://igs.bkg.bund.de/root_ftp/IGS/products"
# GPS Block IIF satellites active in the window, from the IGS satellite metadata SINEX
# (SVN 62, 64-73; SVN 63 held no PRN after 2024).
PRNS="G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

mkdir -p "$DEST"
OUT="$DEST/gps_iif_clocks.txt"
if [ -f "$OUT" ]; then
    echo "IGS clocks already extracted: $OUT"
    exit 0
fi
TMP="$OUT.part"
: > "$TMP"
while read -r WEEK DOY SHA; do
    F="IGS0OPSFIN_2025${DOY}0000_01D_30S_CLK.CLK.gz"
    if [ ! -f "$DEST/$F" ]; then
        curl -fsSL "$BASE/$WEEK/$F" -o "$DEST/$F.part"
        mv "$DEST/$F.part" "$DEST/$F"
    fi
    GOT="$(sha256_of "$DEST/$F")"
    if [ "$GOT" != "$SHA" ]; then
        echo "SHA-256 mismatch for $F: got $GOT, expected $SHA" >&2
        rm -f "$TMP"
        exit 1
    fi
    DAY=$((DOY - 229))
    gzip -dc "$DEST/$F" | awk -v prns="$PRNS" -v day="$DAY" '
        BEGIN { n = split(prns, p, " "); for (i = 1; i <= n; i++) want[p[i]] = 1 }
        $1 == "AS" && ($2 in want) {
            s = day * 86400 + $6 * 3600 + $7 * 60 + $8
            printf "%s %d %s\n", $2, s, $10
        }' >> "$TMP"
done <<LIST
2380 229 4aa9682ba2006b633a64ce8a0c90aca6995f89800d8b48a0e204250b795ca96e
2380 230 64e5b87d6cb52abd48b68f9d9c675538b0734236e3d71ad506b70266c753a693
2380 231 0b6a89ea071ea39a3ac53ca2a57b0d251b1437b808059c677b2833f86ef6edc6
2380 232 590f9609cc255e19620f20e7dfe70fd8c8d2745770914c77462973d848dc8584
2380 233 803305fcac91a29a4ef8098b23127e67526858b98dd20a16ca41aea1d6c8aade
2380 234 91272d5ff66ea7835c79c250fd97c678dc27249ed16846ccaf16cd447d0caf03
2380 235 a0a5e70159c7ec5ee8345b9f0222c64aeb1380bea4d5e7dbd6e682942a44d351
2381 236 303effae1f3013df5c2284dadce20b2535b68022b8a6c5ae9218aa20c1449194
2381 237 d31afe7c1f1e610b62ef76e3f7429d972afcf0a24a5fa5a129ea49a214c6a473
2381 238 88cb559c4a66014090ab71c825f73eda6acd1623a8a8d6b9e166136e21fee749
2381 239 be31e2d451ad8eef8f8000d3410887924fcc6ebd04c72016d1114c6b61699d79
2381 240 a8ca00f3b3c208335acdf8c0c91416327c7d8b14214d1228752ab2c381e85539
2381 241 225d68c870c6ab93913c83c519ee4783a24239f9a101f4206ff63dc7c38f4793
2381 242 0ab16ccbbb0f7bfb23208f0358811e3d26b94cbff4ab07e707b65e23cf8cc502
LIST
mv "$TMP" "$OUT"
echo "IGS clocks extracted: $OUT ($(wc -l < "$OUT") records)"
