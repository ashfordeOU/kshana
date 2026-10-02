# SPDX-License-Identifier: AGPL-3.0-only
"""Predicted GPS L1 Doppler at the LuGRE surface-phase L1 batches, for
tests/lugre_surface_acquisition_doppler_oracle.rs. Independent of Kshana.

Receiver: the Blue Ghost landing site from the Firefly landing-site kernel
clps_to19d_bgm1_ls_250302_v01.bsp of the NAIF CLPS SPICE archive, with the CLPS frame kernels
and the generic lunar orientation kernels it needs (downloaded by this script), relative to the
Earth in J2000. GPS: ESA/ESOC final multi-GNSS orbits of the day (Earth-fixed, 5-minute records,
10-point Lagrange), rotated to J2000 with spiceypy's ITRF93 at the transmit time; light time
iterated. Predicted Doppler -(d rho / dt) / lambda_L1 by a central difference of +/- 0.5 s at
header time + 0.1 s (the centre of the 200 ms refinement window). Visible when the straight path
clears a 6 378 137 m Earth sphere and the satellite is above the receiver's lunar horizon
(1 737 400 m sphere about the Moon's centre).

Usage: predict_surface.py <LuGRE dir> <naif dir> <work dir> <out csv>
"""
import datetime as dt
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
RM = 1737400.0
CLPS = "https://naif.jpl.nasa.gov/pub/naif/pds/pds4/clps/clps_spice/spice_kernels"
GENERIC = "https://naif.jpl.nasa.gov/pub/naif/generic_kernels"
BATCHES = [
    "IQS_L1_20250303_061300_300MS_S_OP38_0",
    "IQS_L1_20250304_070323_400MS_S_OP40_0",
    "IQS_L1_20250314_100945_2000MS_S_OP73_0",
    "IQS_L1_20250314_124717_500MS_S_OP74_0",
    "IQS_L1_20250315_130727_2000MS_S_OP76_0",
    "IQS_L1_20250316_151230_300MS_S_OP77_0",
    "IQS_L1_20250316_191504_300MS_S_OP77_1",
    "IQS_L1_20250316_220402_300MS_S_OP78_0",
    "IQS_L1_20250316_221128_300MS_S_OP78_1",
]


def fetch(url, dst):
    if not os.path.exists(dst):
        urllib.request.urlretrieve(url, dst)
    return dst


def listing(url):
    html = urllib.request.urlopen(url, timeout=120).read().decode("utf-8", "replace")
    return sorted(set(re.findall(r'href="([^"/?][^"]*)"', html)))


def kernels(naif):
    """Furnish the generic and CLPS kernels the landing-site SPK needs."""
    for k in ("naif0012.tls", "de440s.bsp", "earth_latest_high_prec.bpc"):
        sp.furnsh(os.path.join(naif, k))
    got = []
    for f in listing(f"{CLPS}/fk/"):
        if f.endswith(".tf") and ("to19d" in f or "bgm1" in f or "moon" in f):
            got.append(fetch(f"{CLPS}/fk/{f}", os.path.join(naif, f)))
    for f in listing(f"{GENERIC}/pck/"):
        if re.match(r"moon_pa_de440_\d+\.bpc$", f):
            got.append(fetch(f"{GENERIC}/pck/{f}", os.path.join(naif, f)))
    for f in listing(f"{GENERIC}/fk/satellites/"):
        if re.match(r"moon_de440_\d+\.tf$", f):
            got.append(fetch(f"{GENERIC}/fk/satellites/{f}", os.path.join(naif, f)))
    ls = fetch(f"{CLPS}/spk/clps_to19d_bgm1_ls_250302_v01.bsp",
               os.path.join(naif, "clps_to19d_bgm1_ls_250302_v01.bsp"))
    for k in got + [ls]:
        sp.furnsh(k)
    ids = [int(i) for i in sp.spkobj(ls)]
    print("landing-site kernel bodies:", ids, "kernels:", [os.path.basename(g) for g in got])
    return ids[0]


def sp3(work, day):
    week = (day - GPS0).days // 7
    name = f"ESA0MGNFIN_{day.year}{day.timetuple().tm_yday:03d}0000_01D_05M_ORB.SP3.gz"
    path = fetch(f"http://navigation-office.esa.int/products/gnss-products/{week}/{name}",
                 os.path.join(work, name))
    recs, t = {}, None
    for line in gzip.open(path, "rt"):
        if line.startswith("*"):
            y, mo, d, h, mi, s = line[1:].split()[:6]
            t = (dt.datetime(int(y), int(mo), int(d), int(h), int(mi)) - GPS0).total_seconds() + float(s)
        elif line.startswith("PG") and t is not None:
            xyz = [float(v) * 1e3 for v in line[4:46].split()[:3]]
            if all(abs(v) > 1.0 for v in xyz):
                recs.setdefault(int(line[2:4]), []).append((t, xyz))
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


def state(recs, site, t):
    et = et_of(t)
    rx = np.array(sp.spkpos(str(site), et, "J2000", "NONE", "399")[0]) * 1e3
    tau = 0.0
    for _ in range(6):
        sat = np.array(sp.pxform("ITRF93", "J2000", et_of(t - tau))) @ lagrange(recs, t - tau)
        tau = np.linalg.norm(rx - sat) / C
    d = rx - sat
    s = np.clip(-np.dot(sat, d) / np.dot(d, d), 0.0, 1.0)
    clear_earth = np.linalg.norm(sat + s * d) > RE
    moon = np.array(sp.spkpos("301", et, "J2000", "NONE", "399")[0]) * 1e3
    up = (rx - moon) / np.linalg.norm(rx - moon)
    above_horizon = np.dot(-d / np.linalg.norm(d), up) > 0.0
    return np.linalg.norm(d), bool(clear_earth and above_horizon)


def main():
    lugre, naif, work, out = sys.argv[1:5]
    os.makedirs(work, exist_ok=True)
    site = kernels(naif)
    rows = []
    for name in BATCHES:
        with open(os.path.join(lugre, "L0", "IQS", name + ".bin"), "rb") as f:
            t0 = struct.unpack("<d", f.read(18)[10:18])[0]
        t = t0 + 0.1
        day = GPS0 + dt.timedelta(seconds=t - LEAP)
        recs = sp3(work, dt.datetime(day.year, day.month, day.day))
        for prn in range(1, 33):
            if prn not in recs:
                continue
            r1, v = state(recs[prn], site, t + 0.5)
            r0, _ = state(recs[prn], site, t - 0.5)
            rows.append((f"L0/IQS/{name}.sdrx", prn, -(r1 - r0) / (C / L1), int(v)))
    with open(out, "w") as f:
        f.write("snapshot,prn,predicted_doppler_hz,visible\n")
        for s, p, fd, v in rows:
            f.write(f"{s},{p},{fd:.3f},{v}\n")
    print(f"{len(rows)} predictions, {sum(r[3] for r in rows)} visible")


if __name__ == "__main__":
    main()
