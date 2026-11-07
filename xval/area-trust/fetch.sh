#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
# B5 T4: fetch the public IGS files of the scored fortnight (readings 8 to 10 in README.md) into a directory
# outside the repository. Nothing here is vendored. Each file's SHA-256 is written to MANIFEST.tsv in that
# directory and compared with the digests committed in xval/area-trust/MANIFEST.tsv. The Hatanaka-compressed observation
# files are expanded with the `hatanaka` Python package (MIT; `pip install hatanaka`) into gzipped RINEX.
#
#   bash xval/area-trust/fetch.sh <dir>
set -euo pipefail
dir=${1:?usage: fetch.sh <dir>}
here=$(cd "$(dirname "$0")" && pwd)
mkdir -p "$dir"
cd "$dir"
base=https://igs.bkg.bund.de/root_ftp/IGS
stations="MADR00ESP CEBR00ESP YEBE00ESP VILL00ESP"
get() { # url file
  [ -s "$2" ] && return 0
  for i in 1 2 3 4 5 6; do
    curl -sS --fail --max-time 300 -o "$2.part" "$1" && mv "$2.part" "$2" && return 0
    sleep $((i * 5))
  done
  echo "failed: $1" >&2
  return 1
}
: > MANIFEST.new
for d in $(seq 6 19); do
  doy=$(printf %03d "$d")
  nav=BRDC00WRD_R_2025${doy}0000_01D_MN.rnx.gz
  get "$base/BRDC/2025/$doy/$nav" "$nav"
  printf '%s\t%s\t%s\n' "$nav" "$(sha256sum "$nav" | cut -d' ' -f1)" "$base/BRDC/2025/$doy/$nav" >> MANIFEST.new
  for s in $stations; do
    f=${s}_R_2025${doy}0000_01D_30S_MO.crx.gz
    get "$base/obs/2025/$doy/$f" "$f"
    printf '%s\t%s\t%s\n' "$f" "$(sha256sum "$f" | cut -d' ' -f1)" "$base/obs/2025/$doy/$f" >> MANIFEST.new
    out=${f%.crx.gz}.rnx.gz
    [ -s "$out" ] || python3 -c 'import sys, gzip, hatanaka; open(sys.argv[2], "wb").write(gzip.compress(hatanaka.decompress(open(sys.argv[1], "rb").read()), mtime=0))' "$f" "$out"
  done
done
mv MANIFEST.new MANIFEST.tsv
# The digests recorded when T4 was run are committed beside this script.
diff "$here/MANIFEST.tsv" MANIFEST.tsv && echo "every file matches xval/area-trust/MANIFEST.tsv"
