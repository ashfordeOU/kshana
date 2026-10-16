#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE + pykep + SciPy reference for
docs/design/evidence/cap20cd-transfer-optimiser/PREREGISTRATION.md.

Earth (399) -> Mars barycentre (4) on the committed DE440 cut, departure window
2026-09-15..2027-01-15 and arrival window 2027-05-01..2028-03-01 (00:00 TDB), a 2-day grid,
then SciPy Nelder-Mead (xatol 1e-7, fatol 1e-13, 1-day initial simplex) from the best grid cell, for Type I/II x
min C3 / min arrival V-infinity. Heliocentric J2000 states from SPICE spkezr, pykep 3.0.1
lambert_problem (cw=False, multi_revs=0), mu_sun = 1.32712440041e20, the 0.5 deg collinearity
guard, Type I iff (r1 x r2)_z > 0. Calls no Kshana code. Writes reference.csv.

    python3 -I tests/fixtures/transfer_optimiser/generate.py
"""
import hashlib
import importlib.metadata
import importlib.util
import math
import pathlib
import sys
import types

import numpy as np
import scipy
import spiceypy as sp
from scipy.optimize import minimize

# pykep 3.0.1's package __init__ fails on an unrelated data file; load the compiled core directly
# (as tests/fixtures/porkchop_de440/generate.py does).
spec = importlib.util.find_spec("pykep")
_pkg = types.ModuleType("pykep")
_pkg.__path__ = list(spec.submodule_search_locations)
sys.modules["pykep"] = _pkg
import pykep.core as core  # noqa: E402

HERE = pathlib.Path(__file__).resolve().parent
SPK = HERE.parent / "porkchop_de440" / "de440s_2026-08-30_2028-04-15.bsp"
MU = 1.32712440041e20
DEP = (2461298.5, 2461420.5)
ARR = (2461526.5, 2461831.5)
STEP = 2.0
GUARD = math.radians(0.5)


def state(body, jd):
    et = (jd - 2451545.0) * 86400.0
    return np.array(sp.spkezr(body, et, "J2000", "NONE", "SUN")[0]) * 1e3


def evaluate(jd, ja, ttype):
    """(C3 km2/s2, arrival V-inf km/s) or None."""
    tof = (ja - jd) * 86400.0
    if not tof > 0:
        return None
    try:
        sd, sa = state("EARTH", jd), state("MARS BARYCENTER", ja)
    except sp.stypes.SpiceyError:  # outside the kernel scores +inf, as on the Kshana side
        return None
    r1, r2 = sd[:3], sa[:3]
    ang = math.acos(max(-1.0, min(1.0, r1.dot(r2) / (np.linalg.norm(r1) * np.linalg.norm(r2)))))
    if ang < GUARD or math.pi - ang < GUARD:
        return None
    short = np.cross(r1, r2)[2] > 0
    if short != (ttype == "I"):
        return None
    try:
        lp = core.lambert_problem(r0=list(r1), r1=list(r2), tof=tof, mu=MU, cw=False, multi_revs=0)
    except Exception:  # noqa: BLE001 - a Lambert failure scores +inf, as on the Kshana side
        return None
    vd = np.array(lp.v0[0]) - sd[3:]
    va = np.array(lp.v1[0]) - sa[3:]
    return vd.dot(vd) / 1e6, np.linalg.norm(va) / 1e3


def optimise(ttype, objective):
    k = 0 if objective == "MinC3" else 1

    def f(x):
        e = evaluate(x[0], x[1], ttype)
        return math.inf if e is None else e[k]

    best = (None, math.inf)
    nd = int(math.floor((DEP[1] - DEP[0]) / STEP + 1e-9)) + 1
    na = int(math.floor((ARR[1] - ARR[0]) / STEP + 1e-9)) + 1
    for i in range(nd):
        for j in range(na):
            x = (DEP[0] + i * STEP, ARR[0] + j * STEP)
            v = f(x)
            if v < best[1]:
                best = (x, v)
    x0 = np.array(best[0])
    # 1-day initial steps, as on the Kshana side (SciPy's default is 5 % of each coordinate,
    # i.e. ~1e5 days for a Julian date).
    simplex = np.array([x0, x0 + [1.0, 0.0], x0 + [0.0, 1.0]])
    res = minimize(f, x0, method="Nelder-Mead",
                   options={"xatol": 1e-7, "fatol": 1e-13, "maxiter": 4000, "maxfev": 20000,
                            "initial_simplex": simplex})
    c3, vinf = evaluate(res.x[0], res.x[1], ttype)
    return res.x[0], res.x[1], c3, vinf


def main():
    sp.furnsh(str(SPK))
    rows = [
        "# SPICE %s through spiceypy %s; pykep %s lambert_problem; SciPy %s Nelder-Mead; generate.py"
        % (sp.tkvrsn("TOOLKIT"), sp.__version__, importlib.metadata.version("pykep"), scipy.__version__),
        "# kernel %s sha256 %s" % (SPK.name, hashlib.sha256(SPK.read_bytes()).hexdigest()),
        "# type,objective,dep_jd_tdb,arr_jd_tdb,c3_km2s2,vinf_arr_kms",
    ]
    for ttype in ("I", "II"):
        for objective in ("MinC3", "MinArrivalVinf"):
            jd, ja, c3, vinf = optimise(ttype, objective)
            rows.append("%s,%s,%.12f,%.12f,%.17e,%.17e" % (ttype, objective, jd, ja, c3, vinf))
            print(rows[-1])
    (HERE / "reference.csv").write_text("\n".join(rows) + "\n")


if __name__ == "__main__":
    main()
