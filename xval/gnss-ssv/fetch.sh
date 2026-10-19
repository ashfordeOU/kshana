#!/usr/bin/env bash
# Fetch the public sources the gnss-ssv comparison uses. Nothing is vendored: files land in the directory given as
# $1 (default ./ssv-src) and every download is checked against a pinned SHA-256.
#
# Licences (recorded, not assumed):
#  - ICG SSV booklet (UN OOSA ST/SPACE/75): a United Nations publication, public; cited, read, never redistributed here.
#  - NAVCEN GPS IIR/IIR-M antenna panel patterns: published by the U.S. Coast Guard Navigation Center for public use
#    (https://www.navcen.uscg.gov/gps-technical-library); no licence text accompanies the zip, so it is fetched only,
#    used for the S7 shape comparison, and nothing from it is committed.
set -euo pipefail
dir="${1:-ssv-src}"
mkdir -p "$dir"
get() { # url sha256 file
  curl -fsSL --retry 3 -o "$dir/$3" "$1"
  echo "$2  $dir/$3" | sha256sum -c -
}
get https://www.unoosa.org/res/oosadoc/data/documents/2018/stspace/stspace75_0_html/st_space_75E.pdf \
  3bdeb9edd5cfdb98323a3a6df83c2e7f0669785f428a8fe5bb2302aa6a62b4d6 booklet.pdf
get https://www.navcen.uscg.gov/sites/default/files/zip/GPS_IIR_IIR-M_LM.zip \
  045329747a8b4b1cb44f2c430e5feaa6d5e9a3c2dda867b7dbb764c2f65b1c4e iir.zip
