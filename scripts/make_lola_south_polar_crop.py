#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Crop and resample the LOLA south-polar DEM into the small grid Kshana vendors.

Input: LDEM_75S_240M.IMG, the LRO LOLA gridded polar shape map (radius), 240 m/pixel,
polar stereographic, 3812 x 3812 little-endian int16, height = DN * 0.5 m above the
1737.4 km reference sphere (PDS data set LRO-L-LOLA-4-GDR-V1.0). Fetch it from

  https://pds-geosciences.wustl.edu/lro/lro-l-lola-3-rdr-v1/lrolol_1xxx/data/lola_gdr/polar/img/ldem_75s_240m.img

Steps (no other processing; no value is edited or filled):

  1. check the input's SHA-256 against the value recorded in data/lunar-dem/NOTICE.md;
  2. crop the central 3500 x 3500 pixels (lines and samples 157 to 3656, 1-based), which
     keeps the pole at the centre of the crop (a pixel corner, as in the source);
  3. resample by the mean of each 5 x 5 block of DN (an exact integer factor: 1200 m/pixel,
     700 x 700), rounded half to even to an integer DN;
  4. write the result as little-endian int16, row 0 = the first (top) line, with the source's
     orientation (south polar stereographic: longitude 0 up, 90 E to the right).

Usage:  python3 scripts/make_lola_south_polar_crop.py path/to/ldem_75s_240m.img
Writes data/lunar-dem/lola_ldem_75s_1200m_crop.img and prints its SHA-256.
"""
import hashlib
import os
import sys

import numpy as np

SOURCE_SHA256 = "d031efe2611b17dfbf3c158f5e15dc04cd5719349dcbf6384bb21fd97697c490"
N_SRC = 3812
CROP = 3500
FACTOR = 5
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(ROOT, "data", "lunar-dem", "lola_ldem_75s_1200m_crop.img")


def main(path):
    raw = open(path, "rb").read()
    digest = hashlib.sha256(raw).hexdigest()
    if digest != SOURCE_SHA256:
        sys.exit(f"SHA-256 mismatch: {digest} (expected {SOURCE_SHA256})")
    dn = np.frombuffer(raw, dtype="<i2").reshape(N_SRC, N_SRC)
    start = (N_SRC - CROP) // 2
    crop = dn[start:start + CROP, start:start + CROP].astype(np.float64)
    n = CROP // FACTOR
    blocks = crop.reshape(n, FACTOR, n, FACTOR).mean(axis=(1, 3))
    out = np.rint(blocks).astype("<i2")
    out.tofile(OUT)
    print(f"crop start (0-based) {start}; {n} x {n} at {240 * FACTOR} m/pixel")
    print(f"DN min {out.min()} max {out.max()}")
    print("SHA-256", hashlib.sha256(out.tobytes()).hexdigest())


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    main(sys.argv[1])
