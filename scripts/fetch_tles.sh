#!/usr/bin/env bash
# Fetch a fresh Celestrak `gps-ops` two-line-element snapshot of the operational
# GPS constellation, for use in scenarios/orbit-sgp4-gps.toml and the real-data
# tests. Two-line element sets are open data (US Space Force / 18th Space Defense
# Squadron catalogue, redistributed by Celestrak — Dr T. S. Kelso).
#
# Usage:
#   scripts/fetch_tles.sh [output.tle]
#
# The snapshot vendored in the repo (tests/fixtures/celestrak/gps-ops_2021-07-28.txt
# and the inline block in scenarios/orbit-sgp4-gps.toml) was captured on 2021-07-28.
# Re-run this to refresh it; the SGP4 propagator is validated independently against
# the AIAA 2006-6753 vectors, so any current snapshot is a drop-in replacement.
set -euo pipefail

OUT="${1:-gps-ops-$(date -u +%Y-%m-%d).tle}"
URL="https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle"

echo "Fetching $URL"
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$URL" -o "$OUT"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$OUT" "$URL"
else
  echo "error: need curl or wget" >&2
  exit 1
fi

# Sanity: a gps-ops snapshot is name + L1 + L2 triplets; expect ~30 satellites.
sats="$(grep -c '^1 ' "$OUT" || true)"
echo "Wrote $OUT ($sats satellites)"
if [ "$sats" -lt 20 ]; then
  echo "warning: only $sats satellites parsed — the download may be incomplete" >&2
fi
