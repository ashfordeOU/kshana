# SPDX-License-Identifier: AGPL-3.0-only
"""Predicted GPS L1 Doppler at each LuGRE L1 snapshot, for
tests/lugre_acquisition_predicted_doppler_oracle.rs. Independent of Kshana.

For every non-surface L1 snapshot (OP5 and OP12 excluded, in error as later found; kept as run) and PRN 1-32 present in the ESA/ESOC
final multi-GNSS orbit of the day: receive time t = the receiver time in the IQS header (GPS
seconds); receiver position in J2000 from the Firefly-reconstructed Blue Ghost cruise SPK
(NAIF body -2711) relative to the Earth; GPS position from the SP3 (Earth-fixed, 5-minute
records) by 10-point Lagrange interpolation, rotated to J2000 with spiceypy's ITRF93 frame
(earth_latest_high_prec.bpc) at the transmit time t - tau, tau the one-way light time
iterated to convergence; range rate by central difference at t +/- 0.5 s; predicted Doppler
-(d rho / dt) / lambda_L1. Visible when the straight path clears a 6 378 137 m sphere.

Usage: predict.py <LuGRE dir> <naif dir> <work dir> <out csv>
"""
import datetime as dt
import glob
import gzip
import os
import re
import struct
import sys
import urllib.request

import numpy as np
import spiceypy as sp

C = 299792458.0
L1 = 1575.42e6
GPS0 = dt.datetime(1980, 1, 6)
LEAP = 18.0
RE = 6378137.0
SURFACE_CUT_GPS_S = 1424937618.0
EXCLUDED = ("_OP5_0", "_OP12_0")


def sp3(work, day):
    week = (day - GPS0).days // 7
    name = f"ESA0MGNFIN_{day.year}{day.timetuple().tm_yday:03d}0000_01D_05M_ORB.SP3.gz"
    path = os.path.join(work, name)
    if not os.path.exists(path):
        urllib.request.urlretrieve(
            f"http://navigation-office.esa.int/products/gnss-products/{week}/{name}", path)
    recs, t = {}, None
    for line in gzip.open(path, "rt"):
        if line.startswith("*"):
            y, mo, d, h, mi, s = line[1:].split()[:6]
            t = (dt.datetime(int(y), int(mo), int(d), int(h), int(mi)) - GPS0).total_seconds() + float(s)
        elif line.startswith("PG") and t is not None:
            prn = int(line[2:4])
            xyz = [float(v) * 1e3 for v in line[4:46].split()[:3]]
            if all(abs(v) > 1.0 for v in xyz):
                recs.setdefault(prn, []).append((t, xyz))
    return recs


def lagrange(recs, t, n=10):
    ts = np.array([r[0] for r in recs])
    k = int(np.searchsorted(ts, t))
    lo = max(0, min(len(ts) - n, k - n // 2))
    xs, ys = ts[lo:lo + n], np.array([r[1] for r in recs[lo:lo + n]])
    out = np.zeros(3)
    for i in range(n):
        w = 1.0
        for j in range(n):
            if j != i:
                w *= (t - xs[j]) / (xs[i] - xs[j])
        out += w * ys[i]
    return out


def et_of(gps_s):
    utc = GPS0 + dt.timedelta(seconds=gps_s - LEAP)
    return sp.str2et(utc.strftime("%Y-%m-%d %H:%M:%S.%f") + " UTC")


def state(recs, craft, t):
    """(range m, visible) for receive time t (GPS s)."""
    rx = np.array(sp.spkpos(str(craft), et_of(t), "J2000", "NONE", "399")[0]) * 1e3
    tau = 0.0
    for _ in range(6):
        ts = t - tau
        sat = np.array(sp.pxform("ITRF93", "J2000", et_of(ts))) @ lagrange(recs, ts)
        tau = np.linalg.norm(rx - sat) / C
    d = rx - sat
    # Closest approach of the segment to the Earth's centre.
    s = np.clip(-np.dot(sat, d) / np.dot(d, d), 0.0, 1.0)
    visible = np.linalg.norm(sat + s * d) > RE
    return np.linalg.norm(d), visible


def main():
    lugre, naif, work, out = sys.argv[1:5]
    os.makedirs(work, exist_ok=True)
    for k in ("naif0012.tls", "de440s.bsp", "earth_latest_high_prec.bpc",
              "clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp"):
        sp.furnsh(os.path.join(naif, k))
    craft = -2711
    rows = []
    for b in sorted(glob.glob(os.path.join(lugre, "L0", "IQS", "IQS_L1_*.bin"))):
        name = os.path.basename(b)
        if "_S_OP" in name or any(x in name for x in EXCLUDED):
            continue
        with open(b, "rb") as f:
            t = struct.unpack("<d", f.read(18)[10:18])[0]
        if t >= SURFACE_CUT_GPS_S:
            continue
        day = GPS0 + dt.timedelta(seconds=t - LEAP)
        recs = sp3(work, dt.datetime(day.year, day.month, day.day))
        snap = "L0/IQS/" + name[:-4] + ".sdrx"
        for prn in range(1, 33):
            if prn not in recs:
                continue
            r1, v = state(recs[prn], craft, t + 0.5)
            r0, _ = state(recs[prn], craft, t - 0.5)
            rows.append((snap, prn, -(r1 - r0) / (C / L1), int(v)))
    with open(out, "w") as f:
        f.write("snapshot,prn,predicted_doppler_hz,visible\n")
        for s, p, fd, v in rows:
            f.write(f"{s},{p},{fd:.3f},{v}\n")
    print(f"{len(rows)} predictions")


if __name__ == "__main__":
    main()
