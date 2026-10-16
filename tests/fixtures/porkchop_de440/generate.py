#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE + pykep reference for docs/design/evidence/cap20b-porkchop-de440/PREREGISTRATION.md.

Earth (399) -> Mars barycentre (4): heliocentric J2000 states from SPICE spkezr on the full
de440s.bsp, the 0.5 deg collinearity guard, and pykep 3.0.1 lambert_problem (cw=False,
multi_revs=0) with mu_sun = 1.32712440041e20. Calls no Kshana code. Writes reference.csv.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/porkchop_de440/generate.py
"""
import hashlib
import importlib.metadata
import importlib.util
import math
import os
import pathlib
import sys
import types

import numpy as np
import spiceypy as sp

# pykep 3.0.1's package __init__ fails on an unrelated data file; load the compiled core directly
# (as scripts/gen_lambert_multirev_ref.py does).
spec = importlib.util.find_spec("pykep")
_pkg = types.ModuleType("pykep")
_pkg.__path__ = list(spec.submodule_search_locations)
sys.modules["pykep"] = _pkg
import pykep.core as core  # noqa: E402

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
MU = 1.32712440041e20
DEP = [2461284.5 + 10.0 * k for k in range(16)]
ARR = [2461557.5 + 15.0 * k for k in range(19)]
GUARD = math.radians(0.5)


def state(body, jd):
    et = (jd - 2451545.0) * 86400.0
    return np.array(sp.spkezr(body, et, "J2000", "NONE", "SUN")[0]) * 1e3


def main():
    spk = NAIF / "de440s.bsp"
    sp.furnsh(str(spk))
    rows = [
        "# SPICE %s through spiceypy %s; pykep %s lambert_problem; generate.py"
        % (sp.tkvrsn("TOOLKIT"), sp.__version__, importlib.metadata.version("pykep")),
        "# kernel de440s.bsp sha256 %s" % hashlib.sha256(spk.read_bytes()).hexdigest(),
        "# dep_jd_tdb,arr_jd_tdb,c3_km2s2,vinf_arr_kms (nan = guarded or no solution)",
    ]
    for jd in DEP:
        sd = state("EARTH", jd)
        for ja in ARR:
            sa = state("MARS BARYCENTER", ja)
            tof = (ja - jd) * 86400.0
            c3 = vinf = float("nan")
            r1, r2 = sd[:3], sa[:3]
            ang = math.acos(max(-1.0, min(1.0, r1.dot(r2) / (np.linalg.norm(r1) * np.linalg.norm(r2)))))
            if tof > 0 and GUARD <= ang <= math.pi - GUARD:
                lp = core.lambert_problem(r0=list(r1), r1=list(r2), tof=tof, mu=MU, cw=False, multi_revs=0)
                v1, v2 = np.array(lp.v0[0]), np.array(lp.v1[0])
                vd, va = v1 - sd[3:], v2 - sa[3:]
                c3, vinf = vd.dot(vd) / 1e6, np.linalg.norm(va) / 1e3
            rows.append("%.1f,%.1f,%.17e,%.17e" % (jd, ja, c3, vinf))
    (HERE / "reference.csv").write_text("\n".join(rows) + "\n")


if __name__ == "__main__":
    main()
