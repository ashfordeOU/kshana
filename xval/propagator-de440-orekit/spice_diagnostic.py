# SPDX-License-Identifier: AGPL-3.0-only
"""Post-hoc diagnostic for the DE440-tier ephemeris miss (not a comparison bar).

Reads the committed cut kernel with SPICE (spiceypy 8.2.0, MIT) at SPICE's exact TT->TDB and at
kshana's two-term TDB-TT series, and compares both with Orekit's DE440 Sun/Moon (BODY lines of
the committed fixture). Run with the NAIF leap-second kernel naif0012.tls in $KSHANA_NAIF_DIR:
    python -I xval/propagator-de440-orekit/spice_diagnostic.py
"""
import math, os
import spiceypy as sp

FIX = "tests/fixtures/propagator_de440_orekit_oracle/"
sp.furnsh(os.path.join(os.environ["KSHANA_NAIF_DIR"], "naif0012.tls"))
sp.furnsh(FIX + "de440s_2024-03-18_2024-03-23.bsp")
EPOCH = 2460388.5
v3 = lambda s: [float(x) for x in s.split(",")]
worst = {"spice": [0.0, 0.0], "kshana": [0.0, 0.0]}
for line in open(FIX + "propagator_de440_orekit_oracle.txt"):
    if not line.startswith("BODY"):
        continue
    f = [x.strip() for x in line.split("|")]
    t = float(f[0].split()[3])
    tt = (EPOCH - 2451545.0) * 86400 + t
    g = math.radians(357.53 + 0.98560028 * (EPOCH + t / 86400 - 2451545.0))
    for key, et in (("spice", sp.unitim(tt, "TDT", "TDB")),
                    ("kshana", tt + 0.001657 * math.sin(g) + 0.000022 * math.sin(2 * g))):
        s = sp.spkpos("SUN", et, "J2000", "NONE", "EARTH")[0] * 1e3
        m = sp.spkpos("MOON", et, "J2000", "NONE", "EARTH")[0] * 1e3
        worst[key][0] = max(worst[key][0], math.dist(s, v3(f[1])))
        worst[key][1] = max(worst[key][1], math.dist(m, v3(f[2])))
for k, (ws, wm) in worst.items():
    print(f"{k:7s} TDB: worst |dSun| {ws:.4f} m, |dMoon| {wm:.5f} m against Orekit")
