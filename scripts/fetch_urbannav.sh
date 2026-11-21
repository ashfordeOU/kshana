#!/usr/bin/env sh
# Fetch the UrbanNav Hong Kong files kshana-bench task (h) reads, OUTSIDE the repository, and lay them out
# as `kshana bench truth|baseline --task h --data <dest-dir>` expects:
#
#   <dest-dir>/<sequence>/ground_truth.txt   NovAtel SPAN-CPT reference trajectory, 1 Hz (publisher's GT file)
#   <dest-dir>/<sequence>/ublox-f9p.obs      RINEX 3 observations, u-blox ZED-F9P
#   <dest-dir>/<sequence>/ublox-f9p.nmea     the same receiver's own NMEA output
#   <dest-dir>/<sequence>/xiaomi-mi8.obs     RINEX 3 observations, Xiaomi Mi 8
#   <dest-dir>/<sequence>/xiaomi-mi8.nmea    the same phone's own NMEA output
#   <dest-dir>/<sequence>/nav.rnx            IGS merged broadcast navigation (BRDC) for the day
#
# Source: UrbanNav (IPNL, The Hong Kong Polytechnic University), https://github.com/IPNL-POLYU/UrbanNavDataset.
# Licence: MIT, which the repository README (section "License") states covers the dataset files, the RINEX,
# IMU and ground-truth data included; LICENSE "Copyright (c) 2026 UrbanNav contributors" (LICENSE SHA-256
# 0fb32ba74223c6015c22fc46cbc10640c2f7bf549040fad6ad43f3bae9c963c7, README SHA-256
# af9412786eb7c9bdf6ae9440335a4a6347d77b951ff108c711fe0848ab7365f5, both read 2026-11-21). The README asks
# users to cite L.-T. Hsu et al., "UrbanNav: An Open-Sourced Multisensory Dataset for Benchmarking Positioning
# Algorithms Designed for Urban Areas", ION GNSS+ 2021, pp. 226-256, doi 10.33012/2021.17895.
# Broadcast navigation: IGS BRDC merged files from the BKG IGS data centre (igs.bkg.bund.de).
#
# Nothing is committed. Dropbox builds the GNSS folder archives on request, so the archive bytes are not
# pinned; every file this script keeps is checked against the SHA-256 below before it is used.
#
# Usage: scripts/fetch_urbannav.sh <dest-dir>
set -eu

DEST="${1:?usage: fetch_urbannav.sh <dest-dir>}"
DL="$DEST/.download"
mkdir -p "$DL"

sha256_of() {
    if command -v sha256sum >/dev/null 2>&1; then sha256sum "$1" | cut -d' ' -f1
    else shasum -a 256 "$1" | cut -d' ' -f1; fi
}

get() { # url file
    if [ ! -f "$2" ]; then
        curl -fsSL --retry 5 --retry-delay 10 -o "$2.part" "$1"
        mv "$2.part" "$2"
    fi
}

check() { # file sha
    GOT="$(sha256_of "$1")"
    if [ "$GOT" != "$2" ]; then
        echo "SHA-256 mismatch for $1: got $GOT, expected $2" >&2
        exit 1
    fi
}

# Copy one member of a zip archive (matched by the end of its name) to a file; absolute and
# parent-directory member names are never written as paths.
member() { # zip suffix out
    python3 -I - "$1" "$2" "$3" <<'PY'
import sys, zipfile
z, suffix, out = sys.argv[1:4]
names = [n for n in zipfile.ZipFile(z).namelist() if n.endswith(suffix) and ".." not in n]
if len(names) != 1:
    sys.exit(f"{z}: expected one member ending {suffix}, found {len(names)}")
with open(out, "wb") as f:
    f.write(zipfile.ZipFile(z).read(names[0]))
PY
}

# sequence | GNSS folder | GT file | BRDC day | f9p obs, f9p nmea, mi8 obs, mi8 nmea, GT SHA-256
seq() {
    S="$1"; GNSS="$2"; GT="$3"; DOY="$4"
    mkdir -p "$DEST/$S"
    get "$GNSS?dl=1" "$DL/$S-gnss.zip"
    for r in "ublox.f9p.obs:ublox-f9p.obs:$5" "ublox.f9p.nmea:ublox-f9p.nmea:$6" \
             "xiaomi.mi8.obs:xiaomi-mi8.obs:$7" "xiaomi.mi8.nmea:xiaomi-mi8.nmea:$8"; do
        suffix="${r%%:*}"; rest="${r#*:}"; out="${rest%%:*}"; sha="${rest#*:}"
        [ -f "$DEST/$S/$out" ] || member "$DL/$S-gnss.zip" ".$suffix" "$DEST/$S/$out"
        check "$DEST/$S/$out" "$sha"
    done
    get "$GT?dl=1" "$DEST/$S/ground_truth.txt"
    check "$DEST/$S/ground_truth.txt" "$9"
    NAV="BRDC00WRD_R_2021${DOY}0000_01D_MN.rnx.gz"
    get "https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2021/$DOY/$NAV" "$DL/$NAV"
    case "$DOY" in
        137) check "$DL/$NAV" ec74f91baaa26c3495d0c7c6f4eb2ecbb4621ad3f028efb78cc07e8e97928f47 ;;
        138) check "$DL/$NAV" e69f30b87f36957c21d21878b581a632e66ae5644508450f8653021b6848f768 ;;
        141) check "$DL/$NAV" 541bfe20818b60cabb74a6aceda1ea7b6ad201987cb94456d1054abcb032037e ;;
    esac
    gzip -dc "$DL/$NAV" > "$DEST/$S/nav.rnx"
    echo "$DEST/$S verified"
}

seq medium-urban-1 https://www.dropbox.com/sh/2haoy68xekg95zl/AAAkcN4FwhFxkPY1lXsxbJrxa \
    https://www.dropbox.com/s/twsvwftucoytfpc/UrbanNav_TST_GT_raw.txt 137 \
    49712e514efde9d3e042c2deb3c49d93556c61463b0b566869f27058642b31eb \
    ff2f53a63ddc13d81bebbeba4808f468bddf07ce6941ec2ed11ec2876c812876 \
    4074e42493745fcb700745339d8a4b943b11b356a9eb7a5f2566e459b1ca89f7 \
    931aa282dfccb978cde3b92d78b39fe6aed8c7acabe517e4ec243e99d4fc1a81 \
    9d48bb497878aafbd17290789560394c72ecafec20c9e0eaff448418695d92bf
seq deep-urban-1 https://www.dropbox.com/sh/7ox7718bzcjqtlf/AABH_Kjm65gHQ09K3antBRdua \
    https://www.dropbox.com/s/ej2mkue2w3r36s2/UrbanNav_whampoa_raw.txt 141 \
    b357a8b9847d50d8cd10cd9afdc5d80a046c050c7ded1748710ce784d90ce40a \
    661493761b1d80b91e381623c7aac9943aeb8e7f84488bc4ad1c19df2a147251 \
    40891b5283df4370942fca3d9891ffe19fcdad1b85c6e8f29e322563db3a9f16 \
    187cfd9beb750e25e68e9ea994e78bb013c3f8172217f7a67f213cd7feb2d5b7 \
    cb35bc9ebfb171147d290672a46b9d7426475501c922d84ae81edde92c3ba272
seq harsh-urban-1 https://www.dropbox.com/sh/xej1cxv3a0erffc/AADfhRODJk__Z49WC1R0Nw5ea \
    https://www.dropbox.com/s/zqmxgf59bp7en6c/UrbanNav_mongkok_GT_part_raw.txt 138 \
    24ff4738e3a4abe0fd594c1ae8a315f55a5168144254fdb0b0e4beac1980ebdc \
    268ff333d2894206fc446000a48b696e84978b32c91ea2fc79ae07ed6e5982e8 \
    482ad73e6dcc8a47354e0d0baa210a3585b940ab6c45c94a8734dea07855bdd4 \
    09b668719b893695ee972503c10ebc77887f0f30d5d9fcce0e20634fae7aca7d \
    a05edc4641623a3ddf5d04fe9f36262bf7ae76ce9c87953d5c7840790324a317
seq tunnel-1 https://www.dropbox.com/sh/9new5uwl7f9d2c9/AAAdisSwBOOi40Vf3r5PGtSCa \
    https://www.dropbox.com/s/fqsviiei3r5tu6r/UrbanNav_tunnel_GT_raw.txt 138 \
    67cc7c1ad077cbed19f76d2a4d715faf3a485ec87b3eb25a204aac10f6fb6d29 \
    e1babb76234c90ffddea6ab04dd9642e4dd644900aaae617f15902caebbffa23 \
    a6b2482ce350c226e0d68883e11f1536ba8436bbdca41cd177a7df524264e7f2 \
    18b88b5dade3fc6453a9acd2afd8656ec4d3f59981289728cfc1ed2999e39e6a \
    e16fde14f18763df167f9b6e13f4ff206612240eb6d865a32490d98a3e0990fe
echo "UrbanNav task (h) data in $DEST (the .download directory may be deleted)"
