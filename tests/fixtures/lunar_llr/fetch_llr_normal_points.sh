#!/bin/sh
# SPDX-License-Identifier: AGPL-3.0-only
#
# Re-download the committed lunar laser ranging normal-point files and verify
# that every byte matches what is committed.
#
# Source: the EUROLAS Data Center (EDC) at DGFI-TUM, one of the two ILRS data
# centres, open archive, no login:
#
#   https://edc.dgfi.tum.de/pub/slr/data/npt_crd/<target>/<year>/<target>_<yyyymm>.npt
#
# Slice: the five lunar retroreflector targets over 2015-04..2015-06.
#
# The script downloads into a scratch directory and compares against
# normal_points/SHA256SUMS.  It NEVER overwrites a committed file: if a hash
# has moved upstream it says so and exits non-zero, because a silently
# re-issued measurement file is exactly the thing this fixture exists to pin.
#
# Usage:  sh fetch_llr_normal_points.sh

set -eu

BASE="https://edc.dgfi.tum.de/pub/slr/data/npt_crd"
YEAR=2015
MONTHS="04 05 06"
TARGETS="apollo11 apollo14 apollo15 luna17 luna21"

here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
sums="$here/normal_points/SHA256SUMS"
[ -f "$sums" ] || { echo "missing $sums" >&2; exit 1; }

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

for t in $TARGETS; do
  for m in $MONTHS; do
    f="${t}_${YEAR}${m}.npt"
    url="$BASE/$t/$YEAR/$f"
    if ! curl -fsS --max-time 120 -o "$tmp/$f" "$url"; then
      echo "FAILED to download $url" >&2
      exit 1
    fi
  done
done

# Compare against the committed digests, in the committed order.
( cd "$tmp" && shasum -a 256 -c "$sums" ) || {
  echo >&2
  echo "At least one upstream normal-point file no longer matches the committed" >&2
  echo "digest. Do NOT overwrite the fixture: read the new file, work out what" >&2
  echo "the data centre changed, and decide deliberately." >&2
  exit 1
}

echo "all normal-point files re-downloaded and byte-identical to the committed fixture"
