# SPDX-License-Identifier: AGPL-3.0-only
"""M5 bar B4: independent link budget and detection probability (README readings 1 to 3, 11).

numpy and the standard library only; shares no code with the engine. It propagates plane 1 of the
M2 primary RF layer itself (M2 readings 1 and 2), places the three receivers (lead, -50 km,
-100 km in-track), finds each M1 point's pass (middle receiver >= 10 deg, highest elevation
>= 20 deg, first in 24 h at 10 s steps), and at the pass peak (the step of highest elevation of
the middle receiver) computes P_r, SNR and P_d per receiver for E10, E30, E40, with the source at
10 m. Prints JSON.

    python3 -I oracle.py > oracle_b4.json
"""
import json
import math

import numpy as np

MU = 3.986004418e14
R = 6378137.0
J2 = 1.08262668e-3
WE = 7.2921151467e-5
A = 6928137.0
INC = math.radians(97.59)
F = 1575.42e6
C = 299792458.0
K = 1.380649e-23
TSYS = 500.0
B = 2e6
T = 1.0
PFA = 1e-6
H_SRC = 10.0
POINTS = [(54.60, 14.00), (55.50, 15.80), (55.00, 19.00), (57.00, 19.50), (56.50, 20.20),
          (58.50, 20.50), (59.80, 24.50), (61.50, 19.80), (64.00, 22.00), (57.70, 23.30)]
CLASSES = {"E10": 10.0, "E30": 30.0, "E40": 40.0}

n = math.sqrt(MU / A**3)
p = A
fac = n * J2 * (R / p) ** 2
RAAN_DOT = -1.5 * fac * math.cos(INC)
ARGP_DOT = 0.75 * fac * (5 * math.cos(INC) ** 2 - 1)


def sat_pos(u0, t):
    """Earth-fixed position of a satellite of plane 0 (node 0 deg E at epoch) with initial argument of latitude u0."""
    u = u0 + (n + ARGP_DOT) * t
    node = 0.0 + RAAN_DOT * t - WE * t
    x, y, z = A * math.cos(u), A * math.sin(u) * math.cos(INC), A * math.sin(u) * math.sin(INC)
    return np.array([x * math.cos(node) - y * math.sin(node), x * math.sin(node) + y * math.cos(node), z])


def point(lat, lon, h):
    la, lo = math.radians(lat), math.radians(lon)
    u = np.array([math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)])
    return (R + h) * u, u


def elev(s, pt, u):
    d = s - pt
    return math.degrees(math.asin(float(np.dot(d, u) / np.linalg.norm(d))))


def q(x):
    return 0.5 * math.erfc(x / math.sqrt(2.0))


def wh_tail(x, k):
    m = 1 - 2 / (9 * k)
    s = math.sqrt(2 / (9 * k))
    return q(((x / k) ** (1 / 3) - m) / s)


def threshold(k, pfa):
    lo, hi = k * 0.5, k * 2.0
    for _ in range(200):
        mid = 0.5 * (lo + hi)
        if wh_tail(mid, k) > pfa:
            lo = mid
        else:
            hi = mid
    return 0.5 * (lo + hi)


def main():
    offsets = [0.0, -50e3 / A, -100e3 / A]  # lead, 50 km, 100 km behind
    k = 2 * B * T
    x0 = threshold(k, PFA)
    noise = K * TSYS * B
    out = {"threshold_over_k": x0 / k, "points": []}
    steps = range(0, 86401, 10)
    for (lat, lon) in POINTS:
        pt, u = point(lat, lon, H_SRC)
        el_mid = [elev(sat_pos(offsets[1], t), pt, u) for t in steps]
        peak = None
        i = 0
        while i < len(el_mid):
            if el_mid[i] >= 10.0:
                j = i
                while j < len(el_mid) and el_mid[j] >= 10.0:
                    j += 1
                seg = el_mid[i:j]
                if max(seg) >= 20.0:
                    peak = i + int(np.argmax(seg))
                    break
                i = j
            else:
                i += 1
        t = peak * 10
        rec = []
        for off in offsets:
            s = sat_pos(off, t)
            rng = float(np.linalg.norm(s - pt))
            fspl = 20 * math.log10(4 * math.pi * rng * F / C)
            row = {"range_m": rng, "elev_deg": elev(s, pt, u), "fspl_db": fspl}
            for cname, eirp_dbm in CLASSES.items():
                pr_dbw = eirp_dbm - 30.0 - fspl
                g = 10 ** (pr_dbw / 10) / noise
                pd = wh_tail(x0 / (1 + g), k)
                row[cname] = {"pr_dbw": pr_dbw, "snr": g, "pd": pd}
            rec.append(row)
        out["points"].append({"lat": lat, "lon": lon, "peak_t_s": t, "receivers": rec})
    print(json.dumps(out, indent=1, sort_keys=True))


if __name__ == "__main__":
    main()
