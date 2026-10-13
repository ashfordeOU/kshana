#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Crop a PDS SHADR spherical-harmonic table (.tab) to degree N.

Transform (documented in NOTICE.md beside the output):
  * the header record is kept verbatim except that its DEGREE OF FIELD and ORDER OF
    FIELD columns are replaced by min(original, N), right-aligned in the same width;
  * every coefficient record of degree n <= N is kept verbatim; records of degree > N
    are dropped;
  * the fixed-length record padding (trailing blanks) and the CR of each CR/LF record
    terminator are stripped, and records are written with LF endings.
No coefficient value is altered.

Usage: python3 -I crop_shadr.py <input.tab> <N> <output.tab>
"""
import sys


def crop(src: str, nmax: int, dst: str) -> None:
    with open(src, "r", encoding="ascii", newline="") as f:
        lines = f.read().splitlines()
    out = []
    header_done = False
    for line in lines:
        line = line.rstrip("\r").rstrip()
        if not line:
            continue
        fields = line.split(",")
        if not header_done:
            for k in (3, 4):
                w = len(fields[k])
                fields[k] = f"{min(int(fields[k]), nmax):>{w}d}"
            out.append(",".join(fields))
            header_done = True
            continue
        if int(fields[0]) <= nmax:
            out.append(line)
    with open(dst, "w", encoding="ascii", newline="\n") as f:
        f.write("\n".join(out) + "\n")


if __name__ == "__main__":
    crop(sys.argv[1], int(sys.argv[2]), sys.argv[3])
