#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE reference for docs/design/evidence/fut05b-me-pa-offset-sign/PREREGISTRATION.md.

pxform('MOON_ME', 'MOON_PA', et) (the DE421 frames of moon_080317.tf over
moon_pa_de421_1900-2050.bpc) at three TDB epochs. Calls no Kshana code. Writes
spice_me_to_pa.csv beside this script.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/lunar_me_pa_offset_spice/generate.py
"""
import hashlib
import os
import pathlib

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
KERNELS = ["moon_080317.tf", "moon_pa_de421_1900-2050.bpc"]
# TDB seconds past J2000 of 2000-01-01, 2022-01-01 and 2030-01-01 00:00 TDB.
EPOCHS = [(jd - 2451545.0) * 86400.0 for jd in (2451544.5, 2459580.5, 2462502.5)]


def main():
    rows = ["# SPICE Toolkit %s through spiceypy %s; generate.py" % (sp.tkvrsn("TOOLKIT"), sp.__version__)]
    for k in KERNELS:
        rows.append("# kernel %s sha256 %s" % (k, hashlib.sha256((NAIF / k).read_bytes()).hexdigest()))
        sp.furnsh(str(NAIF / k))
    rows.append("# et_s,m00,m01,m02,m10,m11,m12,m20,m21,m22 (v_PA = M v_ME)")
    for et in EPOCHS:
        m = sp.pxform("MOON_ME", "MOON_PA", et)
        rows.append(",".join(["%.3f" % et] + ["%.17e" % m[i][j] for i in range(3) for j in range(3)]))
    (HERE / "spice_me_to_pa.csv").write_text("\n".join(rows) + "\n")


if __name__ == "__main__":
    main()
