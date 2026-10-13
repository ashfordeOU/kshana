#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Builds map.18i (a latitude crop of the CODE GIM for 2018-05-13) - stdlib only.

Commands (run 2026-10-12):

    curl -sSL -o CODG1330.18I.Z https://www.aiub.unibe.ch/download/CODE/2018/CODG1330.18I.Z
    sha256sum CODG1330.18I.Z   # 6f2ef96d339ff0e6fa9ef42f337d9a7ab6ee5c3cc5c8cf94c21080c77ca235c1
    gzip -dc CODG1330.18I.Z > CODG1330.18I
    sha256sum CODG1330.18I     # 95a0ea0d046f20e4fbded109295ae76cfa7fe2f75004883b1baef47c5d3151c4
    python3 -I make_fixture.py CODG1330.18I > map.18i   (fetch.sh does all of this outside the repository)

Transform: header records verbatim except `LAT1 / LAT2 / DLAT` (rewritten for the crop) and
three `COMMENT` records added after `PGM / RUN BY / DATE`; in every TEC and RMS map only the
latitude bands LAT_N..LAT_S are kept, each band record and its value records verbatim.
"""
import hashlib
import sys

LAT_N = 30.0
LAT_S = 5.0
DLAT = -2.5
RAW_SHA256 = "95a0ea0d046f20e4fbded109295ae76cfa7fe2f75004883b1baef47c5d3151c4"


def label(line):
    return line[60:].strip()


def rec(data, lab):
    return f"{data:<60}{lab:<20}"


def main(path):
    raw = open(path, "rb").read()
    digest = hashlib.sha256(raw).hexdigest()
    if digest != RAW_SHA256:
        sys.exit(f"unexpected SHA-256 {digest}")
    lines = raw.decode("ascii").splitlines()
    out = []
    in_header = True
    keep_band = True
    pending = 0
    for line in lines:
        lab = label(line)
        if in_header:
            if lab == "LAT1 / LAT2 / DLAT":
                out.append(rec(f"  {LAT_N:6.1f}{LAT_S:6.1f}{DLAT:6.1f}", lab))
                continue
            out.append(line)
            if lab == "PGM / RUN BY / DATE":
                out.append(rec("Kshana test fixture: latitude crop of CODG1330.18I,", "COMMENT"))
                out.append(rec("bands 30.0 to 5.0 of every TEC and RMS map kept; all", "COMMENT"))
                out.append(rec("other records verbatim (peak-TEC comment is global).", "COMMENT"))
            if lab == "END OF HEADER":
                in_header = False
            continue
        if pending > 0:
            # A value record of the current band. Its 16 I5 fields fill columns 1-80, so the
            # column-61 "label" of a full value record holds numbers: count records instead.
            pending -= 1
            if keep_band:
                out.append(line)
            continue
        if lab == "LAT/LON1/LON2/DLON/H":
            lat = float(line[2:8])
            lon1, lon2, dlon = float(line[8:14]), float(line[14:20]), float(line[20:26])
            n_lon = int(round((lon2 - lon1) / dlon)) + 1
            pending = (n_lon + 15) // 16
            keep_band = LAT_S - 1e-9 <= lat <= LAT_N + 1e-9
            if keep_band:
                out.append(line)
            continue
        out.append(line)
    sys.stdout.write("\n".join(out) + "\n")


if __name__ == "__main__":
    main(sys.argv[1])
