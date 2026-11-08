# SPDX-License-Identifier: AGPL-3.0-only
"""Independent oracle for D18 acceptance 1: HDOP from a YUMA almanac, written with numpy and no
code shared with src/interference_map/almanac_hdop.rs.

    python3 xval/almanac-hdop/oracle.py > xval/almanac-hdop/expected.json

Reads points.json (the stated epochs, positions, almanac and mask), propagates every healthy
satellite with the almanac equations of IS-GPS-200 (Table 20-IV without the harmonic
corrections, the almanac's toa as the reference time), forms the four-state geometry in the
geodetic east-north-up frame and writes HDOP = sqrt(Q_ee + Q_nn) with Q = inv(H^T H).
"""
import json
import sys
from pathlib import Path

import numpy as np

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]

MU = 3.986005e14  # IS-GPS-200, m^3/s^2
OMEGA_E = 7.2921151467e-5  # IS-GPS-200, rad/s
A_WGS = 6378137.0
F_WGS = 1.0 / 298.257223563
WEEK = 604800.0


def read_yuma(path):
    sats, cur = [], {}
    for line in Path(path).read_text().splitlines():
        if line.startswith("****"):
            if cur:
                sats.append(cur)
            cur = {}
        elif ":" in line:
            k, v = line.split(":", 1)
            cur[k.strip()] = float(v)
    if cur:
        sats.append(cur)
    return sats


def full_week(week_mod, hint):
    # The week congruent to week_mod modulo 1024 nearest to hint.
    cands = [w for w in range(hint - 1024, hint + 1025) if w % 1024 == week_mod % 1024]
    return min(cands, key=lambda w: abs(w - hint))


def sat_ecef(s, t_gps, week):
    a = s["SQRT(A)  (m 1/2)"] ** 2
    e = s["Eccentricity"]
    toa = s["Time of Applicability(s)"]
    tk = t_gps - (week * WEEK + toa)
    n = np.sqrt(MU / a**3)
    m = s["Mean Anom(rad)"] + n * tk
    ek = m
    for _ in range(60):
        ek = ek - (ek - e * np.sin(ek) - m) / (1 - e * np.cos(ek))
    nu = np.arctan2(np.sqrt(1 - e * e) * np.sin(ek), np.cos(ek) - e)
    u = nu + s["Argument of Perigee(rad)"]
    r = a * (1 - e * np.cos(ek))
    xp, yp = r * np.cos(u), r * np.sin(u)
    om = s["Right Ascen at Week(rad)"] + (s["Rate of Right Ascen(r/s)"] - OMEGA_E) * tk - OMEGA_E * toa
    i = s["Orbital Inclination(rad)"]
    return np.array([xp * np.cos(om) - yp * np.cos(i) * np.sin(om),
                     xp * np.sin(om) + yp * np.cos(i) * np.cos(om),
                     yp * np.sin(i)])


def hdop(sats, week, t_gps, lat_deg, lon_deg, h, mask_deg):
    lat, lon = np.radians(lat_deg), np.radians(lon_deg)
    e2 = F_WGS * (2 - F_WGS)
    nrad = A_WGS / np.sqrt(1 - e2 * np.sin(lat) ** 2)
    user = np.array([(nrad + h) * np.cos(lat) * np.cos(lon),
                     (nrad + h) * np.cos(lat) * np.sin(lon),
                     (nrad * (1 - e2) + h) * np.sin(lat)])
    enu = np.array([[-np.sin(lon), np.cos(lon), 0.0],
                    [-np.sin(lat) * np.cos(lon), -np.sin(lat) * np.sin(lon), np.cos(lat)],
                    [np.cos(lat) * np.cos(lon), np.cos(lat) * np.sin(lon), np.sin(lat)]])
    rows = []
    for s in sats:
        if int(s["Health"]) != 0:
            continue
        d = sat_ecef(s, t_gps, week) - user
        los = enu @ (d / np.linalg.norm(d))
        if np.degrees(np.arcsin(np.clip(los[2], -1, 1))) < mask_deg:
            continue
        rows.append([-los[0], -los[1], -los[2], 1.0])
    if len(rows) < 4:
        return len(rows), None
    hm = np.array(rows)
    q = np.linalg.inv(hm.T @ hm)
    return len(rows), float(np.sqrt(q[0, 0] + q[1, 1]))


def main():
    cfg = json.loads((HERE / "points.json").read_text())
    sats = read_yuma(REPO / cfg["almanac"])
    week = full_week(int(sats[0]["week"]), cfg["week_hint"])
    out = []
    for p in cfg["points"]:
        n, h = hdop(sats, week, p["gps_s"], p["lat_deg"], p["lon_deg"], p["h_m"], cfg["mask_deg"])
        out.append({**p, "satellites": n, "hdop": h})
    json.dump({"week": week, "numpy": np.__version__, "results": out}, sys.stdout, indent=1)
    sys.stdout.write("\n")


if __name__ == "__main__":
    main()
