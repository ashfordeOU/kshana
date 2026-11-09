#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""C5a v2 oracle (README readings 1 to 6): the v1 SPICE/OpenCV quantities for v1's 12 geometries and the 12 fresh ones,
and complex-step partials of an independent complex-arithmetic model of the measurement. Calls no Kshana code.

    KSHANA_NAIF_DIR=/path/to/naif python3 xval/c5a-opnav-v2/oracle_v2.py > xval/c5a-opnav-v2/oracle_v2.json
"""
import datetime
import json
import math
import os
import pathlib
import sys

import numpy as np
import spiceypy as sp

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent.parent / "c5a-opnav"))
import oracle as v1  # noqa: E402  (v1's SPICE/OpenCV functions, unchanged)

C_KM = 299792.458
H = 1e-20


def fresh_cases():
    out = []
    for cid, ctr, d_km, (a, b), date, targets in v1.CASES:
        b2 = b + 7 if -80 <= b + 7 <= 80 else b - 7
        e2 = (datetime.date.fromisoformat(date) + datetime.timedelta(days=97)).isoformat()
        out.append((cid + "f", ctr, d_km * 1.3, ((a + 17) % 360, b2), e2, targets))
    return out


def cnorm(v):
    return np.sqrt(np.sum(v * v))


def model(et, target, r_o, v_o, rmat):
    """Complex-capable apparent direction and pixel. r_o (km), v_o (km/s) barycentric, possibly complex."""
    if isinstance(target, np.ndarray):
        u = target.astype(complex)
    else:
        lt = 0.0 + 0.0j
        for _ in range(20):
            st = sp.spkgeo(target, et - lt.real, "J2000", 0)[0]
            pos = np.array(st[:3], dtype=complex) - np.array(st[3:]) * (1j * lt.imag)
            d = pos - r_o
            new = cnorm(d) / C_KM
            done = abs(new.real - lt.real) < 1e-12 and abs(new.imag - lt.imag) <= 1e-12 * max(abs(new.imag), 1e-300)
            lt = new
            if done:
                break
        st = sp.spkgeo(target, et - lt.real, "J2000", 0)[0]
        pos = np.array(st[:3], dtype=complex) - np.array(st[3:]) * (1j * lt.imag)
        d = pos - r_o
        u = d / cnorm(d)
    beta = v_o / C_KM
    cx = np.cross(u, beta)
    s2 = np.sum(cx * cx)
    app = u * np.sqrt(1.0 - s2) + beta - np.sum(u * beta) * u
    p = rmat @ app
    x, y = p[0] / p[2], p[1] / p[2]
    k1, k2, p1, p2, k3 = v1.DIST
    r2 = x * x + y * y
    rad = 1 + k1 * r2 + k2 * r2 * r2 + k3 * r2 ** 3
    xd = x * rad + 2 * p1 * x * y + p2 * (r2 + 2 * x * x)
    yd = y * rad + p1 * (r2 + 2 * y * y) + 2 * p2 * x * y
    return app, np.array([v1.F * xd + v1.CX, v1.F * yd + v1.CY])


def main():
    sp.furnsh(str(v1.NAIF / "naif0012.tls"))
    sp.furnsh(str(v1.NAIF / "de440s.bsp"))
    rows, worst_dir_mas, worst_px = [], 0.0, 0.0
    for set_name, cases in (("v1", v1.CASES), ("fresh", fresh_cases())):
        for cid, ctr, d_km, (a, b), date, targets in cases:
            et = sp.str2et(f"{date} 00:00:00 TDB")
            st_c = sp.spkgeo(ctr, et, "J2000", 0)[0]
            r_o = np.array(st_c[:3]) + d_km * v1.radec(a, b)
            v_o = np.array(st_c[3:]) + np.array([0.0, 0.0, 1.0])
            obssta = list(d_km * v1.radec(a, b)) + [0.0, 0.0, 1.0]
            if targets == "stars":
                tl = [(f"star{i}", v1.radec(sa, sb), v1.unit(sp.stelab(list(v1.radec(sa, sb)), list(v_o))))
                      for i, (sa, sb) in enumerate(v1.STARS)]
            else:
                tl = []
                for t in targets:
                    st, _ = sp.spkcvo(str(t), et, "J2000", "OBSERVER", "CN+S", obssta, et, str(ctr), "J2000")
                    tl.append((str(t), t, v1.unit(st[:3])))
            for name, tgt, spice_dir in tl:
                rmat = v1.attitude(spice_dir)
                if rmat is None:
                    continue
                app, px = model(et, tgt, r_o.astype(complex), v_o.astype(complex), rmat)
                ang = math.atan2(np.linalg.norm(np.cross(app.real, spice_dir)), float(app.real @ spice_dir))
                ocv = v1.project(rmat, spice_dir)
                worst_dir_mas = max(worst_dir_mas, ang * 180 / math.pi * 3.6e6)
                worst_px = max(worst_px, float(np.max(np.abs(px.real - np.array(ocv)))))
                # Complex step: position in m (r_o km, so h_km = h / 1000), velocity in m/s.
                part = np.zeros((2, 6))
                for j in range(6):
                    dr = np.zeros(3, complex)
                    dv = np.zeros(3, complex)
                    if j < 3:
                        dr[j] = 1j * H / 1000.0
                    else:
                        dv[j - 3] = 1j * H / 1000.0
                    _, pj = model(et, tgt, r_o.astype(complex) + dr, v_o.astype(complex) + dv, rmat)
                    part[:, j] = pj.imag / H
                rows.append({
                    "set": set_name, "case": cid, "target": name, "jd_tdb": 2451545.0 + et / 86400.0, "et": et,
                    "centre": ctr, "d_km": d_km, "ra_dec_deg": [a, b],
                    "apparent_icrf": list(map(float, spice_dir)),
                    "quaternion_icrf_to_camera": list(map(float, sp.m2q(rmat.tolist()))),
                    "pixel_opencv": ocv,
                    "observer_m": list(map(float, r_o * 1000.0)), "observer_mps": list(map(float, v_o * 1000.0)),
                    "partials_complex_step": part.tolist(),
                })
    print(json.dumps({
        "oracle": "SPICE (spiceypy %s) and OpenCV via xval/c5a-opnav/oracle.py; complex step h = %g" % (sp.__version__, H),
        "kernels": {"de440s.bsp": v1.sha(v1.NAIF / "de440s.bsp"), "naif0012.tls": v1.sha(v1.NAIF / "naif0012.tls")},
        "self_check": {"worst_direction_vs_spice_mas": worst_dir_mas, "worst_pixel_vs_opencv_px": worst_px},
        "count": len(rows), "rows": rows,
    }, indent=1))


if __name__ == "__main__":
    main()
