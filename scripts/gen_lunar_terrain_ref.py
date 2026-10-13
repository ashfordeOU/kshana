#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent numpy ray-cast of the lunar terrain horizon on the vendored LOLA crop.

Pre-registered in tests/fixtures/lunar_terrain/PREREGISTRATION.md (committed alone, edbb9b02)
before this script existed. numpy only, no Kshana code: the image layout comes from
data/lunar-dem/NOTICE.md and its descriptor, the projection from the published south polar
stereographic equations written in latitude and longitude.

Writes tests/fixtures/lunar_terrain/reference.json. It checks the arithmetic of
kshana::lunar_terrain::horizon_profile, not the model.

Usage:  python3 scripts/gen_lunar_terrain_ref.py
"""
import json
import math
import os

import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
IMG = os.path.join(ROOT, "data", "lunar-dem", "lola_ldem_75s_1200m_crop.img")
OUT = os.path.join(ROOT, "tests", "fixtures", "lunar_terrain", "reference.json")
N = 700
SCALE = 1200.0
R = 1737400.0
SITES = [(-89.0, 0.0), (-88.0, 90.0), (-86.0, 180.0), (-84.0, 270.0), (-89.66, 129.2)]
ANTENNA = 2.0
AZ_STEP = 1.0
STEP = 600.0
MAX_RANGE = 150000.0

H = np.fromfile(IMG, dtype="<i2").reshape(N, N).astype(np.float64) * 0.5


def height(lat, lon):
    """Bilinear height at (lat, lon) in radians; None outside the pixel centres."""
    rho = 2.0 * R * math.tan((math.pi / 2.0 + lat) / 2.0)
    x, y = rho * math.sin(lon), rho * math.cos(lon)
    s = x / SCALE + (N / 2 - 0.5)
    ln = (N / 2 - 0.5) - y / SCALE
    if not (0.0 <= ln <= N - 1 and 0.0 <= s <= N - 1):
        return None
    l0 = min(int(math.floor(ln)), N - 2)
    s0 = min(int(math.floor(s)), N - 2)
    tl, ts = ln - l0, s - s0
    top = H[l0, s0] * (1 - ts) + H[l0, s0 + 1] * ts
    bot = H[l0 + 1, s0] * (1 - ts) + H[l0 + 1, s0 + 1] * ts
    return top * (1 - tl) + bot * tl


def to_latlon(u):
    return math.asin(max(-1.0, min(1.0, u[2]))), math.atan2(u[1], u[0])


def site(lat_deg, lon_deg):
    la, lo = math.radians(lat_deg), math.radians(lon_deg)
    up = np.array([math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)])
    east = np.cross([0.0, 0.0, 1.0], up)
    east = east / np.linalg.norm(east)
    north = np.cross(up, east)
    north = north / np.linalg.norm(north)
    h0 = height(la, lo)
    obs = (R + h0 + ANTENNA) * up
    n_steps = int(math.floor(MAX_RANGE / STEP))
    profile, truncated = [], 0
    for i in range(int(round(360.0 / AZ_STEP))):
        a = math.radians(i * AZ_STEP)
        d = math.cos(a) * north + math.sin(a) * east
        best = -90.0
        for k in range(1, n_steps + 1):
            th = k * STEP / R
            p = math.cos(th) * up + math.sin(th) * d
            h = height(*to_latlon(p))
            if h is None:
                truncated += 1
                break
            v = (R + h) * p - obs
            vu = float(v @ up)
            horiz = np.linalg.norm(v - vu * up)
            best = max(best, math.degrees(math.atan2(vu, horiz)))
        profile.append(best)
    return {"lat_deg": lat_deg, "lon_deg": lon_deg, "site_height_m": h0,
            "rays_truncated": truncated, "profile_deg": profile}


def main():
    out = {
        "numpy": np.__version__,
        "image_sha256": "639eb45c21e3df38cffbcf8048da4f3a92aa150b9aea534e10712be0dad4edab",
        "antenna_height_m": ANTENNA, "azimuth_step_deg": AZ_STEP,
        "range_step_m": STEP, "max_range_m": MAX_RANGE,
        "sites": [site(la, lo) for la, lo in SITES],
    }
    with open(OUT, "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print("wrote", OUT)


if __name__ == "__main__":
    main()
