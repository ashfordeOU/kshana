#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""NAIF reference constants for the eighteen bodies of Kshana's solar-system catalogue.

Reads NAIF generic kernels pck00011.tpc (IAU WGCCRE 2015 radii, pole and prime meridian)
and gm_de440.tpc (DE440 GM values) with the SPICE Toolkit (spiceypy bodvcd), and writes
naif_body_constants.txt beside this script: per body, GM (km^3/s^2), RADII[0] (km),
POLE_RA[0], POLE_DEC[0] (deg), PM[0] (deg), PM[1] (deg/day). Calls no Kshana code.

Pre-registered comparison (fixed before the first comparison; see the test): each Kshana
constant must equal the NAIF value rounded to the significant digits Kshana prints.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/body_constants_naif_oracle/generate_body_constants_naif_oracle.py
"""

import hashlib
import os
import pathlib

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
NAIF = pathlib.Path(os.environ["KSHANA_ORACLES"]) / "data" / "naif"
BODIES = [
    ("Sun", 10), ("Mercury", 199), ("Venus", 299), ("Earth", 399), ("Moon", 301), ("Mars", 499),
    ("Phobos", 401), ("Deimos", 402), ("Jupiter", 599), ("Io", 501), ("Europa", 502),
    ("Ganymede", 503), ("Callisto", 504), ("Saturn", 699), ("Titan", 606), ("Uranus", 799),
    ("Neptune", 899), ("Pluto", 999),
]


def get(code, item, n):
    if not sp.bodfnd(code, item):
        return None
    dim, vals = sp.bodvcd(code, item, n)
    return [float(v) for v in vals[:dim]]


def main():
    lines = ["# NAIF constants read by the SPICE Toolkit (spiceypy %s, %s)" % (sp.__version__, sp.tkvrsn("TOOLKIT"))]
    for k in ["pck00011.tpc", "gm_de440.tpc"]:
        p = NAIF / k
        sp.furnsh(str(p))
        lines.append("# kernel %s sha256 %s" % (k, hashlib.sha256(p.read_bytes()).hexdigest()))
    lines.append("# columns: name naif_id gm_km3_s2 radii0_km pole_ra0_deg pole_dec0_deg pm0_deg pm1_deg_per_day (NA = not in the kernels)")
    for name, code in BODIES:
        gm = get(code, "GM", 1)
        radii = get(code, "RADII", 3)
        ra = get(code, "POLE_RA", 3)
        dec = get(code, "POLE_DEC", 3)
        pm = get(code, "PM", 3)
        vals = [gm[0] if gm else None, radii[0] if radii else None, ra[0] if ra else None,
                dec[0] if dec else None, pm[0] if pm else None, pm[1] if pm else None]
        lines.append("%s %d %s" % (name, code, " ".join("NA" if v is None else repr(float(v)) for v in vals)))
    (HERE / "naif_body_constants.txt").write_text("\n".join(lines) + "\n")
    print("wrote", HERE / "naif_body_constants.txt")


if __name__ == "__main__":
    main()
