#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle for tests/earth_orbit_path_sgp4_erfa_oracle.rs (package D8, legs 1 and 2).

Leg 1: python-sgp4 2.24 (D. Vallado's reference SGP4, MIT licence), WGS-72, improved mode 'i',
TEME positions (m) of teme_cases.csv -> reference_sgp4_teme.csv.
Leg 2: pyerfa 2.0.1.5 (ERFA, BSD-3-Clause): per frame_cases.csv instant, GCRS->ITRS =
c2t06a(TT, UT1, xp, yp) with TT from utctai/taitt and UT1 from utcut1, and TEME->ITRS =
c2t06a . pnm06a^T . rz(-ee06a) (TEME: the true equator of date with the mean equinox) ->
erfa_matrices.csv (18 numbers per row, row-major).
"""
import sys
from pathlib import Path

import erfa
import numpy as np
import sgp4
from sgp4.api import WGS72, Satrec

DIR = Path(__file__).resolve().parent
AS2R = np.pi / 648000.0


def rows(name):
    return [[float(x) for x in l.split(",")] for l in open(DIR / name) if l.strip() and not l.startswith("#")]


def leg1():
    out = [f"# python-sgp4 {sgp4.__version__} TEME position (m): x,y,z\n"]
    for k, f in enumerate(rows("teme_cases.csv")):
        s = Satrec()
        s.sgp4init(WGS72, "i", 1, (f[0] - 2433281.5) + f[1], f[8], 0.0, 0.0, f[3], f[6], f[4], f[7], f[2], f[5])
        err, r, _ = s.sgp4(f[9], f[10])
        if err:
            sys.exit(f"sgp4 error {err} at case {k}")
        out.append(",".join(repr(x * 1e3) for x in r) + "\n")
    (DIR / "reference_sgp4_teme.csv").write_text("".join(out))


def leg2():
    out = [f"# pyerfa {erfa.__version__} (liberfa {erfa.version.erfa_version}): GCRS->ITRS (9), TEME->ITRS (9), row-major\n"]
    for f in rows("frame_cases.csv"):
        u1, u2, dut1, xp, yp = f
        a1, a2 = erfa.utctai(u1, u2)
        t1, t2 = erfa.taitt(a1, a2)
        b1, b2 = erfa.utcut1(u1, u2, dut1)
        c2t = erfa.c2t06a(t1, t2, b1, b2, xp * AS2R, yp * AS2R)
        teme_to_gcrs = erfa.pnm06a(t1, t2).T @ erfa.rz(-erfa.ee06a(t1, t2), np.eye(3))
        m = c2t @ teme_to_gcrs
        out.append(",".join(repr(float(x)) for x in list(c2t.ravel()) + list(m.ravel())) + "\n")
    (DIR / "erfa_matrices.csv").write_text("".join(out))


if __name__ == "__main__":
    leg1()
    leg2()
    print("done")
