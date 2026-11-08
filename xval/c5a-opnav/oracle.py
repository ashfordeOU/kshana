#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""C5a oracle (xval/c5a-opnav/README.md): SPICE apparent directions (CN+S for bodies, stelab for stars), the attitude
of reading 5, and OpenCV projectPoints. Calls no Kshana code. Reads NAIF's full de440s.bsp and naif0012.tls.

    KSHANA_NAIF_DIR=/path/to/naif python3 xval/c5a-opnav/oracle.py > xval/c5a-opnav/oracle.json
"""
import hashlib, json, math, os, pathlib, sys

import cv2
import numpy as np
import spiceypy as sp

NAIF = pathlib.Path(os.environ["KSHANA_NAIF_DIR"])
F, CX, CY = 5000.0, 1024.0, 1024.0
DIST = np.array([-0.05, 0.01, 1e-4, -1e-4, 0.0])  # OpenCV order (k1, k2, p1, p2, k3)
K = np.array([[F, 0, CX], [0, F, CY], [0, 0, 1.0]])
OFFSET = (300.0, 200.0)

CASES = [
    ("L1", 301, 70_000, (0, 0), "2025-01-01", [301, 399]),
    ("L2", 301, 150_000, (90, 30), "2026-07-01", [301, 399]),
    ("L3", 301, 250_000, (180, -45), "2028-01-01", [301, 399]),
    ("L4", 301, 400_000, (270, 60), "2029-07-01", [301, 399]),
    ("M1", 4, 1e6, (45, 10), "2026-11-01", [4]),
    ("M2", 4, 3e6, (135, -20), "2027-02-01", [4]),
    ("M3", 4, 5e6, (225, 40), "2028-12-01", [4]),
    ("M4", 4, 1e7, (315, -60), "2029-03-01", [4]),
    ("S1", 399, 400_000, (30, 0), "2025-06-01", "stars"),
    ("S2", 399, 1.5e6, (120, 45), "2026-06-01", "stars"),
    ("S3", 399, 1e7, (210, -30), "2027-06-01", "stars"),
    ("S4", 399, 1e8, (300, 15), "2028-06-01", "stars"),
]
STARS = [(0, 0), (60, 60), (120, -60), (180, 20), (240, -20), (300, 85)]


def unit(v):
    v = np.asarray(v, float)
    return v / np.linalg.norm(v)


def radec(a, b):
    a, b = math.radians(a), math.radians(b)
    return np.array([math.cos(b) * math.cos(a), math.cos(b) * math.sin(a), math.sin(b)])


def rot_min(a, b):
    """The minimal rotation taking unit a to unit b (Rodrigues)."""
    v = np.cross(a, b)
    s, c = np.linalg.norm(v), float(np.dot(a, b))
    if s < 1e-15:
        return np.eye(3)
    k = v / s
    kx = np.array([[0, -k[2], k[1]], [k[2], 0, -k[0]], [-k[1], k[0], 0]])
    return np.eye(3) + s * kx + (1 - c) * kx @ kx


def attitude(t):
    """ICRF-to-camera matrix of reading 5, or None when t cannot be placed."""
    x = np.cross([0.0, 0.0, 1.0], t)
    if np.linalg.norm(x) < 1e-9:
        return None
    x = unit(x)
    y = np.cross(t, x)
    a = np.vstack([x, y, t])  # rows: ICRF -> frame A
    c = unit([OFFSET[0] / F, OFFSET[1] / F, 1.0])
    return rot_min(np.array([0.0, 0.0, 1.0]), c) @ a


def project(rmat, d):
    rvec, _ = cv2.Rodrigues(rmat)
    px, _ = cv2.projectPoints(np.asarray(d, float).reshape(1, 1, 3), rvec, np.zeros(3), K, DIST)
    return [float(px[0, 0, 0]), float(px[0, 0, 1])]


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    sp.furnsh(str(NAIF / "naif0012.tls"))
    sp.furnsh(str(NAIF / "de440s.bsp"))
    out, skipped = [], 0
    for cid, ctr, d_km, (a, b), date, targets in CASES:
        et = sp.str2et(f"{date} 00:00:00 TDB")
        obssta = list(d_km * radec(a, b)) + [0.0, 0.0, 1.0]
        st_c = sp.spkgeo(ctr, et, "J2000", 0)[0]
        v_obs = np.array(st_c[3:]) + np.array([0.0, 0.0, 1.0])  # km/s, barycentric
        rows = []
        if targets == "stars":
            for i, (sa, sb) in enumerate(STARS):
                rows.append((f"star{i}", unit(sp.stelab(list(radec(sa, sb)), list(v_obs)))))
        else:
            for t in targets:
                st, _ = sp.spkcvo(str(t), et, "J2000", "OBSERVER", "CN+S", obssta, et, str(ctr), "J2000")
                rows.append((str(t), unit(st[:3])))
        for name, t in rows:
            r = attitude(t)
            if r is None:
                skipped += 1
                continue
            out.append({
                "case": cid, "target": name, "jd_tdb": 2451545.0 + et / 86400.0, "et": et,
                "centre": ctr, "d_km": d_km, "ra_dec_deg": [a, b],
                "apparent_icrf": list(map(float, t)),
                "quaternion_icrf_to_camera": list(map(float, sp.m2q(r.tolist()))),
                "pixel_opencv": project(r, t),
            })
    print(json.dumps({
        "oracle": "SPICE (spiceypy %s, %s) and OpenCV %s" % (sp.__version__, sp.tkvrsn("TOOLKIT"), cv2.__version__),
        "kernels": {"de440s.bsp": sha(NAIF / "de440s.bsp"), "naif0012.tls": sha(NAIF / "naif0012.tls")},
        "camera": {"f_px": F, "principal_point": [CX, CY], "opencv_dist_k1_k2_p1_p2_k3": list(DIST)},
        "skipped": skipped, "count": len(out), "rows": out,
    }, indent=1))


if __name__ == "__main__":
    main()
