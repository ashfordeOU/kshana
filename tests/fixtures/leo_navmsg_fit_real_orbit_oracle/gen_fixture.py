#!/usr/bin/env python3
"""Cut the real-orbit fixture of tests/leo_navmsg_fit_real_orbit_oracle.rs.

Input: the TU Graz IfG (ITSG) operational reduced-dynamic orbit files the Liu et al. (2025)
paper used (one day each, 10 s, celestial reference frame, GROOPS ASCII):

    https://ftp.tugraz.at/pub/ITSG/satelliteOrbitProducts/operational/<SAT>/reducedDynamicOrbit/<YYYY>/

Output: one CSV per satellite with Earth-fixed (ITRF) position and velocity at every 10 s
epoch of the day, both midnights included.

The celestial-to-terrestrial rotation is pyerfa's IAU 2006/2000A `c2t06a` with polar motion
and UT1-UTC from IERS finals2000A (Bulletin A columns, linear in MJD). The Earth-fixed velocity
is R v + dR/dt r, with dR/dt by a central difference over +/-0.5 s. Time: GPS = TT - 51.184 s,
UTC = GPS - leap seconds (18 s for both days used). This is format conversion only; the oracle
is the paper's published fit statistics on these same orbits.

Usage (with ~/Code/kshana-oracles/env.sh sourced):

    $ORACLE_PY gen_fixture.py <dir with the four .txt.gz files> <finals2000A.all>
"""

import gzip
import hashlib
import os
import sys

import erfa
import numpy as np

DAYS = [
    ("GRACE-1", "2017-06-01", "grace_a_2017-06-01.csv"),
    ("GRACEFO-1", "2024-01-01", "grace_c_2024-01-01.csv"),
    ("Sentinel-2A", "2024-01-01", "sentinel_2a_2024-01-01.csv"),
    ("Sentinel-6A", "2024-01-01", "sentinel_6a_2024-01-01.csv"),
]
LEAP_S = 18.0  # GPS - UTC on both 2017-06-01 and 2024-01-01
GPS_TT = 51.184  # TT - GPS (s)


def read_finals(path):
    rows = {}
    with open(path) as f:
        for line in f:
            try:
                mjd = int(float(line[7:15]))
                xp = float(line[18:27])
                yp = float(line[37:46])
                dut = float(line[58:68])
            except ValueError:
                continue
            rows[mjd] = (xp, yp, dut)
    return rows


def eop_at(finals, mjd_utc):
    m0 = int(np.floor(mjd_utc))
    f = mjd_utc - m0
    a, b = finals[m0], finals[m0 + 1]
    return tuple(a[k] + f * (b[k] - a[k]) for k in range(3))


def c2t(finals, mjd_gps):
    mjd_utc = mjd_gps - LEAP_S / 86400.0
    xp, yp, dut = eop_at(finals, mjd_utc)
    tt = mjd_gps + GPS_TT / 86400.0
    ut1 = mjd_utc + dut / 86400.0
    as2r = np.pi / 180.0 / 3600.0
    return erfa.c2t06a(2400000.5, tt, 2400000.5, ut1, xp * as2r, yp * as2r)


def read_groops(path):
    with gzip.open(path, "rt") as f:
        lines = f.read().splitlines()
    data = []
    for ln in lines:
        parts = ln.split()
        if len(parts) >= 7 and not ln.startswith("#"):
            try:
                data.append([float(p) for p in parts[:7]])
            except ValueError:
                pass
    return np.array(data)


def main():
    src_dir, finals_path = sys.argv[1], sys.argv[2]
    finals = read_finals(finals_path)
    out_dir = os.path.dirname(os.path.abspath(__file__))
    for sat, day, out in DAYS:
        name = f"{sat}_reducedDynamicOrbit_{day}.txt.gz"
        path = os.path.join(src_dir, name)
        sha = hashlib.sha256(open(path, "rb").read()).hexdigest()
        d = read_groops(path)
        mjd0 = d[0, 0]
        assert abs(mjd0 - round(mjd0)) < 1e-9, "file must start at midnight"
        gps_days = mjd0 - 44244.0
        week = int(gps_days // 7)
        tow0 = (gps_days - 7 * week) * 86400.0
        lines = [
            f"# {sat} {day} ITSG operational reduced-dynamic orbit, converted to ITRF",
            f"# source https://ftp.tugraz.at/pub/ITSG/satelliteOrbitProducts/operational/{sat}/reducedDynamicOrbit/{day[:4]}/{name}",
            f"# source_sha256 {sha}",
            "# conversion pyerfa c2t06a + IERS finals2000A (2026-09-30 copy); see gen_fixture.py",
            f"# gps_week {week} tow0 {tow0:.1f} step_s 10",
            "# t_s,x_m,y_m,z_m,vx_mps,vy_mps,vz_mps",
        ]
        for row in d:
            mjd = row[0]
            t_s = (mjd - mjd0) * 86400.0
            k = round(t_s / 10.0)
            assert abs(t_s - 10.0 * k) < 1e-4, f"non-uniform epoch {t_s}"
            r = row[1:4]
            v = row[4:7]
            rm = c2t(finals, mjd)
            rp = c2t(finals, mjd + 0.5 / 86400.0)
            rn = c2t(finals, mjd - 0.5 / 86400.0)
            rdot = rp - rn  # over 1 s
            re = rm @ r
            ve = rm @ v + rdot @ r
            lines.append(
                f"{10 * k},{re[0]:.3f},{re[1]:.3f},{re[2]:.3f},{ve[0]:.3f},{ve[1]:.3f},{ve[2]:.3f}"
            )
        with open(os.path.join(out_dir, out), "w") as f:
            f.write("\n".join(lines) + "\n")
        print(out, len(d), sha)


if __name__ == "__main__":
    main()
