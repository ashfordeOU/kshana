#!/usr/bin/env python3
"""Oracle side of tests/coverage_dop_gnss_lib_py_oracle.rs.

The positions_<preset>.txt files are exported by the engine:
    KSHANA_WRITE_COVERAGE_FIXTURE=1 cargo test --test coverage_dop_gnss_lib_py_oracle write_position
This script reads them, builds the 5 deg grid of receiver points on the sphere of the Earth's
equatorial radius, computes elevation and azimuth in numpy (local vertical along the radial),
applies the 5 deg mask, and gets PDOP from gnss_lib_py.utils.dop.get_dop for every epoch with
at least 4 satellites in view. Writes gnss_lib_py_<preset>.txt.

Usage: $ORACLE_PY tests/fixtures/coverage_dop_gnss_lib_py_oracle/make_fixture.py
"""
import math
import os
import sys

import numpy as np
import gnss_lib_py
from gnss_lib_py.navdata.navdata import NavData
from gnss_lib_py.utils.dop import get_dop

HERE = os.path.dirname(os.path.abspath(__file__))
PRESETS = ["galileo", "gps-baseline"]
MASK_DEG = 5.0
PDOP_MAX = 6.0
STEP_DEG = 5.0


def load(preset):
    with open(os.path.join(HERE, "positions_%s.txt" % preset)) as f:
        head = f.readline()
        re_m = float(head.split("radius")[1].split()[0])
        rows = np.loadtxt(f)
    times = np.unique(rows[:, 0])
    nsat = int(rows[:, 1].max()) + 1
    pos = rows[:, 2:5].reshape(len(times), nsat, 3)
    return re_m, times, pos


def main():
    for preset in PRESETS:
        re_m, times, pos = load(preset)
        ne = len(times)
        lats = [-90.0 + (k + 0.5) * STEP_DEG for k in range(int(180 / STEP_DEG))]
        lons = [-180.0 + (k + 0.5) * STEP_DEG for k in range(int(360 / STEP_DEG))]
        out = ["# gnss_lib_py %s get_dop on positions_%s.txt; ilat ilon fix_pct availability_pct "
               "mean_visible mean_pdop max_pdop" % (gnss_lib_py.__version__, preset)]
        g_av, wsum, worst = 0.0, 0.0, float("inf")
        for a, la in enumerate(lats):
            phi = math.radians(la)
            w = max(math.cos(phi), 0.0)
            for o, lo in enumerate(lons):
                lam = math.radians(lo)
                up = np.array([math.cos(phi) * math.cos(lam), math.cos(phi) * math.sin(lam), math.sin(phi)])
                east = np.array([-math.sin(lam), math.cos(lam), 0.0])
                north = np.cross(up, east)
                user = re_m * up
                d = pos - user  # (ne, nsat, 3)
                rng = np.linalg.norm(d, axis=2)
                el = np.degrees(np.arcsin((d @ up) / rng))
                az = np.degrees(np.arctan2(d @ east, d @ north))
                vis = el >= MASK_DEG
                nvis = vis.sum(axis=1)
                fix = nvis >= 4
                pdops = np.full(ne, np.nan)
                if fix.any():
                    ti, si = np.nonzero(vis & fix[:, None])
                    nav = NavData()
                    nav["gps_millis"] = ti.astype(float)
                    nav["el_sv_deg"] = el[ti, si]
                    nav["az_sv_deg"] = az[ti, si]
                    dop = get_dop(nav, PDOP=True, HDOP=False, VDOP=False)
                    idx = np.asarray(dop["gps_millis"], dtype=int)
                    pdops[idx] = np.asarray(dop["PDOP"], dtype=float)
                n_fix = int(fix.sum())
                n_av = int((fix & (pdops <= PDOP_MAX)).sum())
                fp = 100.0 * n_fix / ne
                ap = 100.0 * n_av / ne
                mv = nvis.sum() / ne
                if n_fix:
                    mean_p = float(np.nanmean(pdops[fix]))
                    max_p = float(np.nanmax(pdops[fix]))
                else:
                    mean_p = max_p = float("nan")
                out.append("%d %d %.17g %.17g %.17g %.17g %.17g" % (a, o, fp, ap, mv, mean_p, max_p))
                g_av += w * n_av / ne
                wsum += w
                worst = min(worst, ap)
            print(preset, "lat row", a, file=sys.stderr, flush=True) if a % 6 == 0 else None
        out.append("global %.17g %.17g" % (100.0 * g_av / wsum, worst))
        with open(os.path.join(HERE, "gnss_lib_py_%s.txt" % preset), "w") as f:
            f.write("\n".join(out) + "\n")


if __name__ == "__main__":
    main()
