#!/usr/bin/env sh
# Fetch one UTC day of the adsb.lol readsb history archive and extract it for
# `kshana interference-map daily`.
#
# Source: https://github.com/adsblol/globe_history_<year>, release v<YYYY>.<MM>.<DD>-planes-readsb-prod-0,
# a tar split into parts (.tar.aa, .tar.ab, ...). adsb.lol data is ODbL 1.0 (contributor feed CC0);
# credit adsb.lol and link https://opendatacommons.org/licenses/odbl/1-0/. Nothing is vendored: the
# archive goes into a cache directory outside the repository. The publisher states no checksums, so
# the SHA-256 of every part is recorded beside the download and goes into the observatory manifest.
#
# Usage: scripts/fetch_adsblol_day.sh <YYYY-MM-DD> <dest-dir>
#   dest-dir/<tag>.part.<xx>   the downloaded parts (kept; delete them after extraction)
#   dest-dir/<tag>.parts.json  name, bytes and SHA-256 of each part
#   dest-dir/extracted/<day>/  the extracted traces (what `interference-map daily` reads)
# Downloads one part at a time with an identifying User-Agent and resumes a partial file.
#
# Pinned days: when PINS_DIR (default: docs/observatory/back-catalogue/fetch in this checkout) holds
# <tag>.parts.json for the day, from an earlier fetch, every part must match its name, size and SHA-256
# there, and the number of parts must match; otherwise the script stops before extracting. A day without
# a pin file is fetched and its hashes recorded, as before.
set -eu

DAY="${1:?usage: fetch_adsblol_day.sh <YYYY-MM-DD> <dest-dir>}"
DEST="${2:?usage: fetch_adsblol_day.sh <YYYY-MM-DD> <dest-dir>}"
case "$DAY" in
    [0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]) ;;
    *) echo "day must be YYYY-MM-DD" >&2; exit 2 ;;
esac
Y="${DAY%%-*}"; REST="${DAY#*-}"; M="${REST%%-*}"; D="${REST#*-}"
TAG="v$Y.$M.$D-planes-readsb-prod-0"
BASE="https://github.com/adsblol/globe_history_$Y/releases/download/$TAG"
UA="kshana-observatory (https://kshana.dev; research, aggregate maps only)"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

mkdir -p "$DEST/extracted/$DAY"
PARTS=""
for SUF in aa ab ac ad ae af ag ah ai aj; do
    CODE="$(curl -sS -L -A "$UA" -r 0-0 -o /dev/null -w '%{http_code}' "$BASE/$TAG.tar.$SUF" || true)"
    case "$CODE" in
        200|206) ;;
        404) break ;;
        *) echo "unexpected HTTP $CODE for $TAG.tar.$SUF" >&2; exit 1 ;;
    esac
    F="$DEST/$TAG.part.$SUF"
    curl -fsSL -A "$UA" -C - --retry 8 --retry-delay 10 --retry-all-errors -o "$F" "$BASE/$TAG.tar.$SUF"
    PARTS="$PARTS $F"
done
if [ -z "$PARTS" ]; then
    echo "no release found for $DAY ($TAG)" >&2
    exit 1
fi

{
    printf '{"day":"%s","tag":"%s","parts":[' "$DAY" "$TAG"
    SEP=""
    for F in $PARTS; do
        printf '%s{"name":"%s","bytes":%s,"sha256":"%s"}' "$SEP" "$(basename "$F")" "$(wc -c < "$F" | tr -d ' ')" "$(sha256_of "$F")"
        SEP=","
    done
    printf ']}\n'
} > "$DEST/$TAG.parts.json"

HERE="$(cd "$(dirname "$0")" && pwd)"
PINS_DIR="${PINS_DIR:-$HERE/../docs/observatory/back-catalogue/fetch}"
PIN="$PINS_DIR/$TAG.parts.json"
if [ -f "$PIN" ]; then
    WANT_N="$(grep -o '"name":"[^"]*"' "$PIN" | wc -l | tr -d ' ')"
    GOT_N=0
    for F in $PARTS; do
        GOT_N=$((GOT_N + 1))
        ENTRY="$(printf '"name":"%s","bytes":%s,"sha256":"%s"' "$(basename "$F")" "$(wc -c < "$F" | tr -d ' ')" "$(sha256_of "$F")")"
        if ! grep -qF "$ENTRY" "$PIN"; then
            echo "$(basename "$F") does not match its pin in $PIN (name, size or SHA-256)" >&2
            exit 1
        fi
    done
    if [ "$GOT_N" != "$WANT_N" ]; then
        echo "$DAY: $GOT_N parts fetched, $WANT_N pinned in $PIN" >&2
        exit 1
    fi
    echo "$DAY: every part matches $PIN"
else
    echo "$DAY: no pin file in $PINS_DIR; part hashes recorded in $DEST/$TAG.parts.json"
fi

# The parts are one tar cut into pieces: concatenate them in order.
# shellcheck disable=SC2086
cat $PARTS | tar -x -C "$DEST/extracted/$DAY"
echo "extracted $DAY to $DEST/extracted/$DAY"
