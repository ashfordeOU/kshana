#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle fixtures for the PDS SHADR gravity reader: pyshtools point gravity.

pyshtools (BSD-3-Clause, pinned 4.14.1) reads each SHADR table itself and evaluates the
gravity vector (no centrifugal term) at the pre-registered points (PREREGISTRATION.md).
Output columns: id lmax r_m lat_deg lon_deg g_r g_theta g_phi gm r0
(g_theta = south / increasing colatitude, g_phi = east; m/s^2; gm m^3/s^2; r0 m).

Usage (from any directory; paths are arguments):
  python -I gen_oracle.py crop <gmm3_to20.tab> <grail_to20.tab> <out.txt>
  python -I gen_oracle.py full <gmm3_120_sha.tab> <jggrx_0660b_sha.tab> <out.txt>
"""
import sys

import numpy as np
import pyshtools as pysh

KM = 1.0e3
MARS = [
    ("M1", 3646.0 * KM, 0.0, 0.0),
    ("M2", 3646.0 * KM, 37.5, 137.4),
    ("M3", 3646.0 * KM, -63.0, 251.0),
    ("M4", 3646.0 * KM, 85.0, 30.0),
    ("M5", 3646.0 * KM, -89.5, 200.0),
    ("M6", 3646.0 * KM, 89.9, 315.0),
    ("M7", 20428.0 * KM, 0.0, 290.0),
    ("M8", 20428.0 * KM, 45.0, 75.0),
    ("M9", 6000.0 * KM, -20.0, 160.0),
]
MOON = [
    ("L1", 1788.0 * KM, 0.0, 0.0),
    ("L2", 1788.0 * KM, 26.1, 3.6),
    ("L3", 1788.0 * KM, -45.0, 200.0),
    ("L4", 1788.0 * KM, 60.0, 100.0),
    ("L5", 1788.0 * KM, 70.0, 150.0),
    ("L6", 1788.0 * KM, 85.0, 30.0),
    ("L7", 1788.0 * KM, -89.5, 200.0),
    ("L8", 1788.0 * KM, 89.9, 315.0),
    ("L9", 4738.0 * KM, 10.0, 290.0),
    ("L10", 1838.0 * KM, -60.0, 60.0),
]


def load(path):
    return pysh.SHGravCoeffs.from_file(
        path, format="shtools", header=True, errors=True, header_units="km",
        r0_index=0, gm_index=1)


def rows(path, points):
    c = load(path)
    out = []
    for pid, r, lat, lon in points:
        g = c.expand(lat=lat, lon=lon, r=r, omega=0.0)
        out.append("%s %d %.17e %.17e %.17e %.17e %.17e %.17e %.17e %.17e" % (
            pid, c.lmax, r, lat, lon, g[0], g[1], g[2], c.gm, c.r0))
    return out


def main():
    case, mars, moon, dst = sys.argv[1:5]
    lines = [
        "# pyshtools %s, numpy %s; case %s" % (pysh.__version__, np.__version__, case),
        "# id lmax r_m lat_deg lon_deg g_r g_theta(south) g_phi(east) gm_m3s2 r0_m",
    ]
    lines += rows(mars, MARS)
    lines += rows(moon, MOON)
    with open(dst, "w", encoding="ascii", newline="\n") as f:
        f.write("\n".join(lines) + "\n")


if __name__ == "__main__":
    main()
