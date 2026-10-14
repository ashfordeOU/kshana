#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent recomputation of the jamming kind's terrain shadowing (CAP-06 (b), bars B2, B5).

Shares no code with the engine. From the SRTM tile's bytes and the placement table of
docs/design/evidence/jamming-terrain/PREREGISTRATION.md alone, it does its own tile read and
bilinear interpolation, its own WGS 84 geodetic-to-ECEF and ECEF-to-geodetic round trip of each
antenna, its own great-circle profile, bulge and nu, and its own ITU-R P.526-15 section 4.1
knife-edge loss.

Usage: python3 -I oracle.py <N36W117_sub6.hgt> <jamming-demo.toml> <expected.json>
"""
import json
import math
import sys
import tomllib

import numpy as np

HGT, DEMO, OUT = sys.argv[1:4]
N_SIDE, LL_LAT, LL_LON = 601, 36.0, -117.0
GEOID_N, K, STEP, R_E, AGL = -31.0, 4.0 / 3.0, 30.0, 6_371_000.0, 2.0
C = 299_792_458.0
RECEIVER = (36.250, -116.825)
JAMMERS = [
    (36.450, -116.870), (36.220, -116.727), (36.170, -116.990), (36.100, -116.800),
    (36.300, -116.900), (36.200, -116.550), (36.400, -116.400), (36.050, -116.500),
    (36.600, -116.600), (36.300, -116.300),
]
NU_B5 = [-0.78, -0.5, 0.0, 1.0, 2.4, 5.0]

# The tile: big-endian int16, first row northernmost. Flip so row 0 is the south edge.
grid = np.fromfile(HGT, dtype=">i2").astype(float).reshape(N_SIDE, N_SIDE)[::-1, :]
STEP_DEG = 1.0 / (N_SIDE - 1)


def bilinear(lat, lon):
    def axis(x, x0):
        t = (x - x0) / STEP_DEG
        i = min(max(math.floor(t), 0), N_SIDE - 2)
        return i, min(max(t - i, 0.0), 1.0)

    i, fi = axis(lat, LL_LAT)
    j, fj = axis(lon, LL_LON)
    q = grid[i:i + 2, j:j + 2]
    if (q == -32768).any():
        raise ValueError(f"void at {lat}, {lon}")
    return ((1 - fi) * (1 - fj) * q[0, 0] + (1 - fi) * fj * q[0, 1]
            + fi * (1 - fj) * q[1, 0] + fi * fj * q[1, 1])


A, F = 6_378_137.0, 1 / 298.257223563
E2 = F * (2 - F)


def to_ecef(lat, lon, h):
    la, lo = math.radians(lat), math.radians(lon)
    n = A / math.sqrt(1 - E2 * math.sin(la) ** 2)
    return np.array([(n + h) * math.cos(la) * math.cos(lo), (n + h) * math.cos(la) * math.sin(lo),
                     (n * (1 - E2) + h) * math.sin(la)])


def to_geodetic(r):
    x, y, z = r
    p = math.hypot(x, y)
    lat = math.atan2(z, p * (1 - E2))
    for _ in range(60):
        n = A / math.sqrt(1 - E2 * math.sin(lat) ** 2)
        h = p / math.cos(lat) - n
        lat = math.atan2(z, p * (1 - E2 * n / (n + h)))
    n = A / math.sqrt(1 - E2 * math.sin(lat) ** 2)
    h = p / math.cos(lat) - n
    return lat, math.atan2(y, x), h


def antenna(lat, lon):
    """Geodetic (rad, rad, ellipsoidal m) after the ECEF round trip, 2 m above the DEM."""
    return to_geodetic(to_ecef(lat, lon, bilinear(lat, lon) + AGL + GEOID_N))


def j_loss(nu):
    return 6.9 + 20 * math.log10(math.sqrt((nu - 0.1) ** 2 + 1) + nu - 0.1) if nu > -0.78 else 0.0


def profile(jam, rx, lam):
    def unit(g):
        return np.array([math.cos(g[0]) * math.cos(g[1]), math.cos(g[0]) * math.sin(g[1]),
                         math.sin(g[0])])

    uj, ur = unit(jam), unit(rx)
    theta = math.atan2(np.linalg.norm(np.cross(uj, ur)), float(uj @ ur))
    d = theta * R_E
    hj, hr = jam[2] - GEOID_N, rx[2] - GEOID_N
    best, i = None, 0
    while (i + 1) * STEP < d:
        i += 1
        d1 = i * STEP
        f = d1 / d
        p = (math.sin((1 - f) * theta) * uj + math.sin(f * theta) * ur) / math.sin(theta)
        lat = math.degrees(math.atan2(p[2], math.hypot(p[0], p[1])))
        lon = math.degrees(math.atan2(p[1], p[0]))
        d2 = d - d1
        h = bilinear(lat, lon) + d1 * d2 / (2 * K * R_E) - (hj + (hr - hj) * d1 / d)
        nu = h * math.sqrt(2 * d / (lam * d1 * d2))
        if best is None or nu > best[0]:
            best = (nu, i)
    return {"profile_points": i, "obstacle_index": best[1], "nu_max": best[0],
            "diffraction_loss_db": j_loss(best[0]), "path_length_m": d}


freq = tomllib.load(open(DEMO, "rb")).get("freq_hz", 1_575_420_000.0)
lam = C / freq
rx = antenna(*RECEIVER)
rows = [dict(jammer_lat_deg=la, jammer_lon_deg=lo, **profile(antenna(la, lo), rx, lam))
        for la, lo in JAMMERS]
json.dump({"numpy": np.__version__, "freq_hz": freq, "placements": rows,
           "knife_edge_loss_db": [{"nu": v, "j_db": j_loss(v)} for v in NU_B5]},
          open(OUT, "w"), indent=1)
for r in rows:
    print(f"{r['jammer_lat_deg']:.3f} {r['jammer_lon_deg']:.3f}  points {r['profile_points']:5d}"
          f"  nu {r['nu_max']:9.4f}  loss {r['diffraction_loss_db']:7.3f} dB")
