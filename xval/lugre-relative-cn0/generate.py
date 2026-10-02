# SPDX-License-Identifier: AGPL-3.0-only
"""Build the fixtures of tests/lugre_relative_cn0_visibility.rs (pre-registered in 768cb62b).

Independent of Kshana: Python with numpy, spiceypy and openpyxl. Writes into
tests/fixtures/lugre_relative_cn0/:
  epochs.csv   gps_s, receiver x y z, Sun x y z (ITRF93, m)
  sats.csv     gps_s, prn, svn, block, x y z (SP3 Earth-fixed, m)
  tracked.csv  gps_s, prn, cn0_dbhz (flight GPS L1 C/A C/N0 at the RAW epoch nearest gps_s)
  patterns/<SVN>_L1.csv  L1 gain (directivity minus gain correction factor, dB), rows
               off-nadir 0..90 deg, columns azimuth in Kshana's yaw-steering frame
Epochs: the 10-minute grid points (multiples of 600 s of GPS time) during the transit and
lunar-orbit RAW telemetry with a RAW epoch within 1 s, receiver at least 100 000 km from the Earth's centre.

Pattern axes (NAVCEN release, Marquis and Reigh, NAVIGATION 62(4) 2015, sections IV.C-D):
phi is a right-handed rotation about the IIR body +Z (nadir) from the IIR +X axis, theta runs
across the panel from +Y (theta = -90) through nadir to -Y (+90). The direction (phi, theta)
is cos(theta) Z + sin(theta) h, h = sin(phi) X - cos(phi) Y, i.e. azimuth phi - 90 from +X
toward +Y for theta >= 0 and phi + 90 for theta < 0. The IIR manufacturer +X axis points away
from the Sun (Kouba, GPS Solutions 13(1), 2009; Montenbruck et al., Adv. Space Res. 56, 2015),
180 deg from the +x of kshana::earth_gnss_lunar::yaw_steering_axes, so Kshana's azimuth is
phi + 90 (theta >= 0) or phi - 90 (theta < 0). The two half-cuts that measure the same
direction are averaged in linear power.

Usage: generate.py <LuGRE dir> <navcen unpacked dir> <naif dir> <work dir> <out dir>
"""
import datetime as dt
import glob
import gzip
import math
import os
import re
import sys
import urllib.request

import numpy as np
import openpyxl
import spiceypy as sp

GPS0 = dt.datetime(1980, 1, 6)
LEAP = 18.0
SURFACE_CUT_GPS_S = 1424937618.0
R_MIN_M = 1.0e8


def gps_to_utc(t):
    return GPS0 + dt.timedelta(seconds=t - LEAP)


def raw_cn0(lugre):
    """{epoch rxTime: {prn: cn0}} for GPS L1 C/A (signalId 0), transit (T) and lunar-orbit (L)
    operations only, as the pre-registration states."""
    out = {}
    for p in sorted(glob.glob(os.path.join(lugre, "L0", "TLM", "TLM_RAW_*.txt"))):
        if not re.search(r"_[TL]_OP", os.path.basename(p)):
            continue
        for line in open(p):
            tok = line.split()
            t = float(tok[tok.index("rxTime:") + 1])
            if t >= SURFACE_CUT_GPS_S:
                continue
            cur, meas = None, []
            for k in range(len(tok) - 1):
                if tok[k] == "svid:":
                    cur = {"svid": int(tok[k + 1])}
                    meas.append(cur)
                elif cur is not None and tok[k] in ("cn0:", "signalId:"):
                    cur[tok[k][:-1]] = tok[k + 1]
            g = {m["svid"]: float(m["cn0"]) for m in meas if int(m["signalId"]) == 0}
            if g:
                out[t] = g
    return out


def fetch(url, dst):
    if not os.path.exists(dst):
        urllib.request.urlretrieve(url, dst)
    return dst


def sp3_positions(work, day):
    """{(gps_s, prn): (x, y, z) m} from the ESA final multi-GNSS orbit of a day."""
    gpsweek = int((day - GPS0).days // 7)
    doy = day.timetuple().tm_yday
    name = f"ESA0MGNFIN_{day.year}{doy:03d}0000_01D_05M_ORB.SP3.gz"
    p = fetch(f"http://navigation-office.esa.int/products/gnss-products/{gpsweek}/{name}",
              os.path.join(work, name))
    pos, t = {}, None
    for line in gzip.open(p, "rt"):
        if line.startswith("*"):
            y, mo, d, h, mi, s = line[1:].split()[:6]
            t = (dt.datetime(int(y), int(mo), int(d), int(h), int(mi)) - GPS0).total_seconds() + float(s)
        elif line.startswith("PG") and t is not None:
            prn = int(line[2:4])
            x, y_, z = (float(v) * 1e3 for v in line[4:46].split()[:3])
            pos[(round(t), prn)] = (x, y_, z)
    return pos


def svn_blocks(work, when):
    """{prn: (svn, block)} valid at `when` from the IGS satellite metadata file."""
    p = fetch("https://files.igs.org/pub/station/general/igs_satellite_metadata.snx",
              os.path.join(work, "igs_satellite_metadata.snx"))
    text = open(p, errors="replace").read()
    ident = {}
    blk = re.search(r"\+SATELLITE/IDENTIFIER(.*?)-SATELLITE/IDENTIFIER", text, re.S).group(1)
    for l in blk.splitlines():
        if l.startswith(" G"):
            f = l.split()
            ident[f[0]] = f[3]
    prns = {}
    blk = re.search(r"\+SATELLITE/PRN(.*?)-SATELLITE/PRN", text, re.S).group(1)

    def t(s):
        y, d, sec = s.split(":")
        if y == "0000":
            return dt.datetime.max
        return dt.datetime(int(y), 1, 1) + dt.timedelta(days=int(d) - 1, seconds=int(sec))

    for l in blk.splitlines():
        if l.startswith(" G"):
            f = l.split()
            if t(f[1]) <= when <= t(f[2]) and f[3].startswith("G"):
                prns[int(f[3][1:])] = (f[0], ident.get(f[0], "?"))
    return prns


def patterns(navcen, out_dir):
    # L1 gain correction factors (dB), "IIR/IIR-M Gain Correction Values" chart of the
    # release's Marquis Aug 2015 presentation; gain = directivity - GCF.
    gcf = {43: 0.9, 46: 1.0, 51: 0.7, 44: 1.1, 41: 0.9, 54: 0.8, 56: 0.7, 45: 1.1, 47: 1.3,
           59: 1.3, 60: 1.3, 61: 1.2, 53: 1.4, 52: 1.2, 58: 1.3, 55: 1.3, 57: 1.3, 48: 1.4,
           49: 1.3, 50: 1.3}
    os.makedirs(out_dir, exist_ok=True)
    written = []
    for f in glob.glob(os.path.join(navcen, "ppt", "embeddings", "*.xlsx")):
        wb = openpyxl.load_workbook(f, data_only=True)
        ws = wb.worksheets[0]
        m = re.match(r"SVN\s*(\d+)\s+L1\b", ws.title)
        if not m:
            continue
        svn = int(m.group(1))
        rows = list(ws.iter_rows(values_only=True))
        phi = [v for v in rows[1][1:] if isinstance(v, (int, float))]
        table = {}
        for r in rows[3:]:
            if isinstance(r[0], (int, float)):
                table[int(r[0])] = [float(v) for v in r[1:1 + len(phi)]]
        assert phi == list(range(0, 360, 10)), (f, phi[:5])
        assert sorted(table) == list(range(-90, 91, 2)), (f, sorted(table)[:3])
        g = gcf[svn]
        name = f"G{svn:03d}"
        with open(os.path.join(out_dir, f"{name}_L1.csv"), "w") as o:
            o.write("off_nadir_deg\\azimuth_deg," + ",".join(str(a) for a in range(0, 360, 10)) + "\n")
            for th in range(0, 91, 2):
                vals = []
                for az in range(0, 360, 10):
                    a = table[th][phi.index((az - 90) % 360)]
                    b = table[-th][phi.index((az + 90) % 360)]
                    lin = 0.5 * (10 ** (a / 10) + 10 ** (b / 10))
                    vals.append(10 * math.log10(lin) - g)
                o.write(f"{th}," + ",".join(f"{v:.3f}" for v in vals) + "\n")
        written.append(name)
    return sorted(written)


def main():
    lugre, navcen, naif, work, out = sys.argv[1:6]
    os.makedirs(work, exist_ok=True)
    os.makedirs(out, exist_ok=True)
    for k in ("naif0012.tls", "de440s.bsp", "earth_latest_high_prec.bpc",
              "clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp"):
        sp.furnsh(os.path.join(naif, k))
    ids = sp.spkobj(os.path.join(naif, "clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp"))
    craft = [int(i) for i in ids]
    assert len(craft) == 1, craft
    craft = craft[0]
    cov = sp.spkcov(os.path.join(naif, "clps_to19d_bgm1_cru_rec_250115_250302_v01.bsp"), craft)
    windows = [sp.wnfetd(cov, i) for i in range(sp.wncard(cov))]
    pats = patterns(navcen, os.path.join(out, "patterns"))
    cn0 = raw_cn0(lugre)
    times = sorted(cn0)
    grid = sorted({round(t / 600.0) * 600 for t in times})
    ep_rows, sat_rows, trk_rows = [], [], []
    sp3_cache, meta_cache = {}, {}
    for g in grid:
        near = min(times, key=lambda t: abs(t - g))
        if abs(near - g) > 1.0:
            continue
        et = sp.str2et(gps_to_utc(g).strftime("%Y-%m-%d %H:%M:%S") + " UTC")
        if not any(a <= et <= b for a, b in windows):
            continue
        rx, _ = sp.spkpos(str(craft), et, "ITRF93", "NONE", "399")
        rx = [v * 1e3 for v in rx]
        if math.dist(rx, (0, 0, 0)) < R_MIN_M:
            continue
        sun, _ = sp.spkpos("10", et, "ITRF93", "NONE", "399")
        sun = [v * 1e3 for v in sun]
        day = gps_to_utc(g).date()
        if day not in sp3_cache:
            sp3_cache[day] = sp3_positions(work, dt.datetime(day.year, day.month, day.day))
            meta_cache[day] = svn_blocks(work, dt.datetime(day.year, day.month, day.day, 12))
        ep_rows.append((g, *rx, *sun))
        for prn, c in sorted(cn0[near].items()):
            trk_rows.append((g, prn, c))
            p = sp3_cache[day].get((g, prn))
            if p is None:
                continue
            svn, block = meta_cache[day].get(prn, ("?", "?"))
            sat_rows.append((g, prn, svn, block, *p))
    with open(os.path.join(out, "epochs.csv"), "w") as f:
        f.write("gps_s,rx_x,rx_y,rx_z,sun_x,sun_y,sun_z\n")
        for r in ep_rows:
            f.write(",".join([str(r[0])] + [f"{v:.3f}" for v in r[1:]]) + "\n")
    with open(os.path.join(out, "sats.csv"), "w") as f:
        f.write("gps_s,prn,svn,block,x,y,z\n")
        for r in sat_rows:
            f.write(f"{r[0]},{r[1]},{r[2]},{r[3]}," + ",".join(f"{v:.3f}" for v in r[4:]) + "\n")
    with open(os.path.join(out, "tracked.csv"), "w") as f:
        f.write("gps_s,prn,cn0_dbhz\n")
        for r in trk_rows:
            f.write(f"{r[0]},{r[1]},{r[2]:.4f}\n")
    print(f"craft {craft}; {len(ep_rows)} epochs, {len(trk_rows)} tracked records, "
          f"{len(sat_rows)} with orbits; patterns {pats}")


if __name__ == "__main__":
    main()
