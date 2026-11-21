#!/usr/bin/env sh
# One command from adsb.lol history to an interference atlas, for a stated UTC day range.
#
#   1. scripts/observatory_backcatalogue.sh fetches each day of the adsb.lol readsb archive
#      (scripts/fetch_adsblol_day.sh: parts checked against the pinned SHA-256 in
#      docs/observatory/back-catalogue/fetch/ when the day is pinned, recorded otherwise), runs
#      `kshana interference-map daily` over the region and keeps only the day products.
#   2. `kshana interference-atlas build` turns the day products into one atlas; `verify` checks it.
#   3. NOTICE.txt beside the atlas states the source, its licence and the derived-database terms.
#
# Data: adsb.lol aircraft position archive, ODbL 1.0 (https://opendatacommons.org/licenses/odbl/1-0/).
# The day products and the atlas are Derived Databases of it and are themselves under ODbL 1.0; the
# atlas carries the licence and attribution in its `data_sources` field. Nothing is vendored: the
# archives go to a cache outside the repository and are deleted after each day. Every output is
# MODELLED: it summarises the map's own daily calls and names no cause.
#
# Usage: scripts/interference_atlas_days.sh <first-day YYYY-MM-DD> <days> <out-dir> [south,west,north,east]
# Environment: KSHANA (the binary, default ./target/release/kshana), WORK, KEEP, PINS_DIR (as in the
#              scripts it calls); SKIP_FETCH=1 builds the atlas from the day products already in
#              <out-dir>/products. The day range 2026-09-15 for 30 days is pinned in this repository.
# Writes <out-dir>/products/ (day products), <out-dir>/fetch/ (part hashes), <out-dir>/MANIFEST.json,
# <out-dir>/atlas.json and <out-dir>/NOTICE.txt. None of them belongs in git.
set -eu

FIRST="${1:?usage: interference_atlas_days.sh <first-day> <days> <out-dir> [bbox]}"
COUNT="${2:?usage: interference_atlas_days.sh <first-day> <days> <out-dir> [bbox]}"
OUT="${3:?usage: interference_atlas_days.sh <first-day> <days> <out-dir> [bbox]}"
BBOX="${4:-53.5,9.0,66.0,31.0}"
KSHANA="${KSHANA:-./target/release/kshana}"
HERE="$(cd "$(dirname "$0")" && pwd)"
export KSHANA

if [ "${SKIP_FETCH:-0}" != "1" ]; then
    "$HERE/observatory_backcatalogue.sh" "$FIRST" "$COUNT" "$OUT" "$BBOX"
fi

# The day products of the range, in date order (the product name ends in the date).
LIST=""
i=0
DAY="$FIRST"
while [ "$i" -lt "$COUNT" ]; do
    F="$OUT/products/observatory-adsb-adsb-lol-$DAY.geojson"
    if [ -f "$F" ]; then
        LIST="$LIST $F"
    else
        echo "$DAY: no day product, left out of the atlas" >&2
    fi
    DAY="$(date -u -d "$DAY + 1 day" +%F 2>/dev/null || date -u -j -v+1d -f %F "$DAY" +%F)"
    i=$((i + 1))
done
if [ -z "$LIST" ]; then
    echo "no day products in $OUT/products for the range" >&2
    exit 1
fi

# shellcheck disable=SC2086
"$KSHANA" interference-atlas build $LIST --out "$OUT/atlas.json"
"$KSHANA" interference-atlas verify "$OUT/atlas.json"

cat > "$OUT/NOTICE.txt" <<NOTICE
kshana interference atlas, adsb.lol days $FIRST for $COUNT day(s), region $BBOX (south,west,north,east)

Contains aircraft position data from adsb.lol, made available under the Open Database License
(ODbL 1.0), https://opendatacommons.org/licenses/odbl/1-0/. The day products in products/ and
atlas.json are Derived Databases of that data and are released under ODbL 1.0; keep this notice with
any copy, and offer any Derived Database you make from them under the same licence.

MODELLED: the atlas summarises the map's own daily calls (degraded or not degraded per cell); a cell
not observed is not evidence of a clear cell, persistence is not a cause, and a zone names none.
Inputs and their SHA-256 are listed in atlas.json; the archive parts fetched are in fetch/.
NOTICE
echo "wrote $OUT/atlas.json and $OUT/NOTICE.txt"
