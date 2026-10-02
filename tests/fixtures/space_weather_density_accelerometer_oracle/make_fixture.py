#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Builds windows.csv for tests/space_weather_density_accelerometer_oracle.rs.

Inputs (not committed): the TOLEOS DNSxACC_2 daily CDF files listed in NOTICE.md, downloaded
from https://swarm-diss.eo.esa.int/ into DNS_DIR, and the GFZ file
Kp_ap_Ap_SN_F107_since_1932.txt in the same directory. Needs numpy and cdflib.

Usage: make_fixture.py DNS_DIR > windows.csv
       make_fixture.py DNS_DIR --j71 > windows_j71.csv   (amendment 1: points also carry the
       geodetic latitude, local solar time and UTC Modified Julian Date)
The windowing and index rules are the ones pre-registered in the test header.
"""
import datetime as dt
import glob
import math
import os
import re
import sys

import cdflib
import numpy as np

MU = 3.986004418e14
RE = 6371.0e3
CAMPAIGNS = [
    ("CHAMP-2001", "max", "CH_OPER_DNS_ACC_2__2001"),
    ("GRACE-A-2002", "max", "GR_OPER_DNS1ACC_2__2002"),
    ("GRACE-FO-1-2024", "max", "GF_OPER_DNS1ACC_2__2024"),
    ("GRACE-A-2008", "min", "GR_OPER_DNS1ACC_2__2008"),
    ("GRACE-FO-1-2019", "min", "GF_OPER_DNS1ACC_2__2019"),
]


def load_indices(path):
    days, f107, kp = [], [], {}
    for line in open(path):
        if line.startswith("#"):
            continue
        p = line.split()
        d = dt.date(int(p[0]), int(p[1]), int(p[2]))
        days.append(d)
        f107.append(float(p[25]))
        kp[d] = [float(x) for x in p[7:15]]
    return days, np.array(f107), kp


def f107a_centered(series, i):
    # Same rule as kshana::space_weather::f107a_centered (81-day centred mean, clipped).
    lo = max(i - 40, 0)
    hi = min(i + 41, len(series))
    return float(np.mean(series[lo:hi]))


def main():
    root = sys.argv[1]
    j71 = "--j71" in sys.argv[2:]
    days, f107, kp = load_indices(os.path.join(root, "Kp_ap_Ap_SN_F107_since_1932.txt"))
    index = {d: i for i, d in enumerate(days)}
    print("campaign,phase,start_utc,mean_alt_km,n_valid,measured_mean,points")
    for name, phase, prefix in CAMPAIGNS:
        for path in sorted(glob.glob(os.path.join(root, prefix + "*.cdf"))):
            day = dt.datetime.strptime(re.search(r"__(\d{8})T", path).group(1), "%Y%m%d").date()
            c = cdflib.CDF(path)
            t_ms = c.varget("time")
            alt = c.varget("altitude")
            lat = c.varget("latitude")
            lst = c.varget("local_solar_time")
            rho = c.varget("density")
            flag = c.varget("validity_flag")
            t0 = cdflib.cdfepoch.compute_epoch([day.year, day.month, day.day, 0, 0, 0, 0])
            sec = (t_ms - t0) / 1000.0
            valid = (flag == 0) & np.isfinite(rho) & (rho > 0) & np.isfinite(alt)
            if valid.sum() == 0:
                continue
            h_day = float(np.mean(alt[valid]))
            period = 2 * math.pi * math.sqrt((RE + h_day) ** 3 / MU)
            # native sample step, from the median spacing
            step = float(np.median(np.diff(sec)))
            prev = days[index[day] - 1]
            iprev = index[prev]
            f_prev = f107[iprev]
            fa_prev = f107a_centered(f107, iprev)
            k = 0
            while (k + 1) * period <= 86400.0 + 1e-6:
                a, b = k * period, (k + 1) * period
                k += 1
                inwin = (sec >= a) & (sec < b)
                n_expected = round(period / step)
                vw = inwin & valid
                if vw.sum() < 0.8 * n_expected:
                    continue
                mean_alt = float(np.mean(alt[vw]))
                if not (400e3 <= mean_alt <= 500e3):
                    continue
                measured = float(np.mean(rho[vw]))
                pts = []
                for j in np.nonzero(vw)[0]:
                    s = sec[j]
                    if abs(s - 300.0 * round(s / 300.0)) > 1e-3:
                        continue
                    tt = dt.datetime.combine(day, dt.time()) + dt.timedelta(seconds=float(s)) - dt.timedelta(hours=6.7)
                    kd = tt.date()
                    kslot = tt.hour // 3
                    kpv = kp[kd][kslot]
                    pt = f"{alt[j]:.1f}:{f_prev:.1f}:{fa_prev:.4f}:{kpv:.3f}"
                    if j71:
                        mjd = (day - dt.date(1858, 11, 17)).days + float(s) / 86400.0
                        pt += f":{lat[j]:.3f}:{lst[j]:.4f}:{mjd:.6f}"
                    pts.append(pt)
                if not pts:
                    continue
                start = (dt.datetime.combine(day, dt.time()) + dt.timedelta(seconds=a)).strftime("%Y-%m-%dT%H:%M:%S")
                print(f"{name},{phase},{start},{mean_alt/1e3:.3f},{int(vw.sum())},{measured:.6e},{';'.join(pts)}")


if __name__ == "__main__":
    main()
