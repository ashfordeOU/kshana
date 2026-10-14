#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE reference for docs/design/evidence/rm34-cr3bp-to-mci/PREREGISTRATION.md.

For each case: the dimensional rotating state (l rho, ldot rho + l w v_nd), with l, w and ldot
from SPICE's own spkezr('MOON', et, 'J2000', 'NONE', 'EARTH'), mapped to J2000 by
sxform('EM_ROT', 'J2000', et) of the two-vector frame in em_rot.tf (which carries the frame's
full angular velocity). Calls no Kshana code. Writes reference.csv beside this script.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/cr3bp_to_mci_spice/generate.py
"""
import hashlib
import json
import os
import pathlib

import numpy as np
import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
FAM = HERE.parent / "cr3bp_families_jpl"
MU = 1.215058560962404e-02
JD0 = 2460676.5  # 2025-01-01 00:00 TDB


def api_state(file, i):
    row = json.loads((FAM / file).read_text())["data"][i]
    return [float(str(x).strip()) for x in row[:6]]


def cases():
    sysd = json.loads((FAM / "halo_L2_S.json").read_text())["system"]
    l1 = float(sysd["L1"][0])
    l2 = float(sysd["L2"][0])
    return [
        ("L1", [l1, 0, 0, 0, 0, 0]),
        ("L2", [l2, 0, 0, 0, 0, 0]),
        ("halo_L2_S_0", api_state("halo_L2_S.json", 0)),
        ("halo_L2_S_10", api_state("halo_L2_S.json", 10)),
        ("dro_0", api_state("dro.json", 0)),
        ("custom", [1 - MU + 0.1, 0.05, 0.02, 0.01, -0.02, 0.03]),
    ]


def main():
    kernels = [NAIF / "de440s.bsp", HERE / "em_rot.tf"]
    rows = ["# SPICE Toolkit %s through spiceypy %s; generate.py" % (sp.tkvrsn("TOOLKIT"), sp.__version__)]
    for k in kernels:
        sp.furnsh(str(k))
        rows.append("# kernel %s sha256 %s" % (k.name, hashlib.sha256(k.read_bytes()).hexdigest()))
    rows.append("# jd_tdb,case,x,y,z,vx,vy,vz,rx_m,ry_m,rz_m,vx_ms,vy_ms,vz_ms")
    for k in range(12):
        jd = JD0 + 2.5 * k
        et = (jd - 2451545.0) * 86400.0
        m = np.array(sp.spkezr("MOON", et, "J2000", "NONE", "EARTH")[0]) * 1e3
        r, v = m[:3], m[3:]
        l = np.linalg.norm(r)
        h = np.cross(r, v)
        w = np.linalg.norm(h) / l**2
        ldot = r.dot(v) / l
        xf = np.array(sp.sxform("EM_ROT", "J2000", et))
        for name, s in cases():
            rho = np.array([s[0] - (1 - MU), s[1], s[2]])
            vnd = np.array(s[3:6])
            rot = np.concatenate([l * rho, ldot * rho + l * w * vnd])
            out = xf @ rot
            rows.append(",".join(["%.10f" % jd, name] + ["%.17e" % x for x in s] + ["%.17e" % x for x in out]))
    (HERE / "reference.csv").write_text("\n".join(rows) + "\n")


if __name__ == "__main__":
    main()
