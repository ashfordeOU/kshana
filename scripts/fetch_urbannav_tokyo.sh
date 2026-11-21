#!/usr/bin/env sh
# Fetch the UrbanNav Tokyo edition of kshana-bench task (h), OUTSIDE the repository, and lay it out as
# `kshana bench truth|baseline --task h --data <dest-dir>` expects:
#
#   <dest-dir>/tokyo-odaiba/tk_reference.csv    Applanix POS LV620 reference trajectory, 10 Hz (publisher's file)
#   <dest-dir>/tokyo-odaiba/ublox-f9p.obs       RINEX 3 observations, u-blox F9P (5 Hz)
#   <dest-dir>/tokyo-odaiba/trimble-netr9.obs   RINEX 3 observations, Trimble NetR9 (10 Hz)
#   <dest-dir>/tokyo-odaiba/nav.rnx             the merged broadcast navigation file in the publisher's data (base.nav)
#   <dest-dir>/tokyo-shinjuku/...               the same for the Shinjuku run
#
# Use a directory of its own: the Hong Kong edition (scripts/fetch_urbannav.sh) and this one are scored
# separately, and `kshana bench` refuses a directory that holds both.
#
# Source: UrbanNav (IPNL, The Hong Kong Polytechnic University), https://github.com/IPNL-POLYU/UrbanNavDataset,
# section "Tokyo Dataset", UrbanNav-TK-20181219, Tokyo_Data.zip (4,452,177,524 bytes). Licence: MIT; the README
# (section "License") states it covers "the dataset files provided through the download links in this README,
# such as ROS bags, GNSS RINEX files, IMU measurements, and ground-truth files" (README SHA-256
# af9412786eb7c9bdf6ae9440335a4a6347d77b951ff108c711fe0848ab7365f5, read 2026-11-21). Keep the LICENSE notice
# ("Copyright (c) 2026 UrbanNav contributors") with any copy. Cite L.-T. Hsu et al., ION GNSS+ 2021,
# doi 10.33012/2021.17895, as the README asks.
#
# The archive (a static file) and every file kept are checked against the SHA-256 below. Only the four files
# per run are kept; the archive (most of it LiDAR bags) is deleted unless KEEP=1. Nothing is committed.
#
# Usage: scripts/fetch_urbannav_tokyo.sh <dest-dir>
set -eu

DEST="${1:?usage: fetch_urbannav_tokyo.sh <dest-dir>}"
URL="https://www.dropbox.com/s/isu1bugpgr8dpas/Tokyo_Data.zip?dl=1"
ZIP_SHA="d32de5fc0b5842080b00ce567e6011a0f8c454573892a827ab9054320d4b1a1f"
ZIP="$DEST/.download/Tokyo_Data.zip"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

check() { # file sha
    GOT="$(sha256_of "$1")"
    if [ "$GOT" != "$2" ]; then
        echo "SHA-256 mismatch for $1: got $GOT, expected $2" >&2
        exit 1
    fi
}

mkdir -p "$DEST/.download"
NEED=0
for f in tokyo-odaiba/tk_reference.csv tokyo-shinjuku/tk_reference.csv; do
    [ -f "$DEST/$f" ] || NEED=1
done
if [ "$NEED" = 1 ]; then
    if [ ! -f "$ZIP" ]; then
        curl -fsSL --retry 5 --retry-delay 10 -C - -o "$ZIP.part" "$URL"
        mv "$ZIP.part" "$ZIP"
    fi
    check "$ZIP" "$ZIP_SHA"
    python3 -I - "$ZIP" "$DEST" <<'PY'
import os, sys, zipfile
zpath, dest = sys.argv[1:3]
z = zipfile.ZipFile(zpath)
names = {"base.nav": "nav.rnx", "reference.csv": "tk_reference.csv",
         "rover_ublox.obs": "ublox-f9p.obs", "rover_trimble.obs": "trimble-netr9.obs"}
for run, seq in (("Odaiba", "tokyo-odaiba"), ("Shinjuku", "tokyo-shinjuku")):
    os.makedirs(os.path.join(dest, seq), exist_ok=True)
    for src, out in names.items():
        with z.open(f"Tokyo_Data/{run}/{src}") as f, open(os.path.join(dest, seq, out), "wb") as g:
            while True:
                b = f.read(1 << 20)
                if not b:
                    break
                g.write(b)
PY
fi

check "$DEST/tokyo-odaiba/tk_reference.csv" fbf3f0054df8e68d7552d1e930221a80bfba45ea37703b64c7abf148750c301d
check "$DEST/tokyo-odaiba/ublox-f9p.obs" 7541282f75349063dadb2338c921ac80f11eb9aa28d181d43692387279c2837f
check "$DEST/tokyo-odaiba/trimble-netr9.obs" 3ebb5c4f95a7a399900109a6b1086f7f359c593abdeb07a453e18f5b2f7e0ee8
check "$DEST/tokyo-odaiba/nav.rnx" c58bd7ecaf7c7a0766fa9bc23ba7b0666172c28c95a13c35ac973f88b2645b35
check "$DEST/tokyo-shinjuku/tk_reference.csv" 794baaec530f34097cd1f77633902bb2195ce30cdec278945eb5ac911ed65d79
check "$DEST/tokyo-shinjuku/ublox-f9p.obs" dece3e6fbbe47e78705570d0e99796460d6d34f75a5dbbf20664a5446def7c3f
check "$DEST/tokyo-shinjuku/trimble-netr9.obs" be239dbd20d9d69a0dbc696f1a4b00d75cd3639354d498eec91f08fa65d000eb
check "$DEST/tokyo-shinjuku/nav.rnx" c58bd7ecaf7c7a0766fa9bc23ba7b0666172c28c95a13c35ac973f88b2645b35
if [ "${KEEP:-0}" != "1" ]; then rm -f "$ZIP"; fi
echo "UrbanNav Tokyo edition of task (h) verified in $DEST"
