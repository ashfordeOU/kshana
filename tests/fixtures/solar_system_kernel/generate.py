#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE reference for docs/design/evidence/cap31-solar-system-kernel/PREREGISTRATION.md.

spkezr(body, et, 'J2000', 'NONE', 'SUN') for Mercury, Venus, the Earth and the Moon at the three
epochs, on the full de440s.bsp. Calls no Kshana code. Writes reference.csv.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/solar_system_kernel/generate.py
"""
import hashlib
import os
import pathlib

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
EPOCHS_JD = [2461041.5, 2462668.0, 2466519.5]
BODIES = [("Mercury", "MERCURY"), ("Venus", "VENUS"), ("Earth", "EARTH"), ("Moon", "MOON")]


def main():
    spk = NAIF / "de440s.bsp"
    sp.furnsh(str(spk))
    rows = ["# SPICE %s through spiceypy %s; generate.py" % (sp.tkvrsn("TOOLKIT"), sp.__version__),
            "# kernel de440s.bsp sha256 %s" % hashlib.sha256(spk.read_bytes()).hexdigest(),
            "# jd_tdb,body,x_m,y_m,z_m,vx_m_s,vy_m_s,vz_m_s (heliocentric J2000)"]
    for jd in EPOCHS_JD:
        et = (jd - 2451545.0) * 86400.0
        for name, spice in BODIES:
            s = sp.spkezr(spice, et, "J2000", "NONE", "SUN")[0]
            rows.append(",".join(["%.1f" % jd, name] + ["%.17e" % (x * 1e3) for x in s]))
    (HERE / "reference.csv").write_text("\n".join(rows) + "\n")


if __name__ == "__main__":
    main()
