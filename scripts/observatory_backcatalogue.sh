#!/usr/bin/env sh
# Build the observatory back-catalogue: for each UTC day, fetch the adsb.lol archive, run
# `kshana interference-map daily` over a region, keep the three product files and a manifest, and
# delete the archive and its extraction (one day is several GB; only products are kept).
#
# Usage: scripts/observatory_backcatalogue.sh <first-day YYYY-MM-DD> <days> <out-dir> [south,west,north,east]
# Environment: KSHANA (the binary, default ./target/release/kshana), WORK (cache, default <out-dir>/.work),
#              KEEP=1 to keep the downloaded parts.
# The region defaults to the Baltic box 53.5,9.0,66.0,31.0. A day whose product exists is skipped, so the
# run can be resumed. Products are written under <out-dir>/products/; the per-day fetch records (part
# sizes and SHA-256) under <out-dir>/fetch/. Neither belongs in git: commit only the manifest.
set -eu

FIRST="${1:?usage: observatory_backcatalogue.sh <first-day> <days> <out-dir> [bbox]}"
COUNT="${2:?usage: observatory_backcatalogue.sh <first-day> <days> <out-dir> [bbox]}"
OUT="${3:?usage: observatory_backcatalogue.sh <first-day> <days> <out-dir> [bbox]}"
BBOX="${4:-53.5,9.0,66.0,31.0}"
KSHANA="${KSHANA:-./target/release/kshana}"
WORK="${WORK:-$OUT/.work}"
HERE="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "$OUT/products" "$OUT/fetch" "$WORK"
i=0
DAY="$FIRST"
while [ "$i" -lt "$COUNT" ]; do
    if ls "$OUT/products"/observatory-adsb-adsb-lol-"$DAY".geojson >/dev/null 2>&1; then
        echo "$DAY: product exists, skipped"
    else
        "$HERE/fetch_adsblol_day.sh" "$DAY" "$WORK"
        "$KSHANA" interference-map daily "$WORK/extracted/$DAY" --dataset adsb-lol --day "$DAY" \
            --bbox "$BBOX" --out "$OUT/products"
        cp "$WORK"/v*.parts.json "$OUT/fetch/" 2>/dev/null || true
        rm -rf "$WORK/extracted/$DAY"
        if [ "${KEEP:-0}" != "1" ]; then rm -f "$WORK"/v*.part.*; fi
        rm -f "$WORK"/v*.parts.json
    fi
    # next day (GNU date, then BSD date)
    DAY="$(date -u -d "$DAY + 1 day" +%F 2>/dev/null || date -u -j -v+1d -f %F "$DAY" +%F)"
    i=$((i + 1))
done

# Manifest: SHA-256 of every product file.
MAN="$OUT/MANIFEST.json"
{
    printf '{"schema":"kshana-observatory-backcatalogue/1","first_day":"%s","days":%s,"region":"%s","files":[' "$FIRST" "$COUNT" "$BBOX"
    SEP=""
    for F in "$OUT"/products/*; do
        H="$(if command -v sha256sum >/dev/null 2>&1; then sha256sum "$F" | cut -d' ' -f1; else shasum -a 256 "$F" | cut -d' ' -f1; fi)"
        printf '%s{"name":"%s","bytes":%s,"sha256":"%s"}' "$SEP" "$(basename "$F")" "$(wc -c < "$F" | tr -d ' ')" "$H"
        SEP=","
    done
    printf ']}\n'
} > "$MAN"
echo "wrote $MAN"
