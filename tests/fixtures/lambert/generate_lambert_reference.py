#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the Izzo-2015 Lambert solver.

The oracle is **lamberthub** (J. Martinez Garrido, MIT) — an independent,
third-party implementation of the single-revolution Lambert problem. Lambert's
problem (given two position vectors and a time of flight, find the connecting
two-body arc's boundary velocities) has a unique solution for M = 0, so an
independent solver is a genuine external authority for the departure/arrival
velocities — the same kind of library-vs-library validation DOP gets against
gnss_lib_py and the trade kernels get against scipy.

`lamberthub.izzo2015(mu, r1, r2, tof, M=0, prograde=...)` and kshana's
`maneuver::lambert(r1, r2, tof, mu, prograde)` share conventions exactly
(prograde = +z angular-momentum transfer), so the two are fed byte-identical
inputs and their (v1, v2) are compared component-by-component.

Honest scope: this validates the Lambert *solver* (the load-bearing core of the
maneuver/porkchop capability). The impulsive-burn / finite-burn / porkchop-sweep
layers are checked separately (Tsiolkovsky closed form, propagate-back identity);
they are not what this fixture covers.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/lambertvenv
    /tmp/lambertvenv/bin/pip install lamberthub numpy
    /tmp/lambertvenv/bin/python generate_lambert_reference.py > lambert_reference.txt

Generated with lamberthub 1.0.0 + numpy.
"""

import numpy as np
from lamberthub import izzo2015

MU_EARTH = 3.986_004_418e14  # m^3/s^2 — matches kshana orbit::MU_EARTH
MU_SUN = 1.327_124_400_18e20  # m^3/s^2 — matches kshana maneuver::MU_SUN
AU = 1.495_978_707e11  # m — matches kshana maneuver::AU_M
DAY = 86_400.0

# (name, mu, r1[m], r2[m], tof[s], prograde)
CASES = [
    # --- Earth-bound transfers (LEO/MEO/GEO-scale geometry) ---
    ("leo_quarter_prograde", MU_EARTH, [7.0e6, 0.0, 0.0], [0.0, 7.2e6, 0.0], 1800.0, True),
    ("leo_inclined_prograde", MU_EARTH, [7.0e6, 0.0, 0.0], [1.0e6, 7.0e6, 1.5e6], 2400.0, True),
    ("leo_retrograde", MU_EARTH, [7.0e6, 0.0, 0.0], [0.0, -7.2e6, 0.0], 2600.0, False),
    ("meo_transfer", MU_EARTH, [9.0e6, 1.0e6, 0.0], [-2.0e6, 1.5e7, 0.0], 9000.0, True),
    ("geo_scale", MU_EARTH, [4.2e7, 0.0, 0.0], [-1.0e7, 4.0e7, 0.0], 36000.0, True),
    ("gto_eccentric", MU_EARTH, [7.0e6, 0.0, 0.0], [-3.0e7, 1.5e7, 0.0], 18000.0, True),
    ("short_arc", MU_EARTH, [7.0e6, 0.0, 0.0], [6.9e6, 1.2e6, 2.0e5], 600.0, True),
    ("long_arc", MU_EARTH, [7.0e6, 0.0, 0.0], [-5.0e6, -5.0e6, 0.0], 5400.0, True),
    # --- Heliocentric (interplanetary) transfers ---
    ("helio_earth_mars_like", MU_SUN, [1.0 * AU, 0.0, 0.0], [-1.2 * AU, 0.9 * AU, 0.0], 250.0 * DAY, True),
    ("helio_inclined", MU_SUN, [1.0 * AU, 0.2 * AU, 0.0], [-0.3 * AU, 1.3 * AU, 0.05 * AU], 200.0 * DAY, True),
    ("helio_retrograde", MU_SUN, [1.0 * AU, 0.0, 0.0], [0.0, -1.4 * AU, 0.0], 320.0 * DAY, False),
    ("helio_inner", MU_SUN, [1.0 * AU, 0.0, 0.0], [0.4 * AU, 0.5 * AU, 0.0], 140.0 * DAY, True),
    ("helio_outer", MU_SUN, [1.0 * AU, 0.0, 0.0], [-3.0 * AU, 4.0 * AU, 0.1 * AU], 900.0 * DAY, True),
]


def fmt(xs):
    return ",".join(repr(float(x)) for x in xs)


print("# lamberthub reference for the Izzo-2015 Lambert solver.")
print("# Oracle: lamberthub 1.0.0 izzo2015 (J. Martinez Garrido, MIT) + numpy.")
print("# Consumed by tests/lambert_reference.rs. See generate_lambert_reference.py.")
print("# LAMBERT name | mu | r1x,r1y,r1z | r2x,r2y,r2z | tof | prograde(0/1) | v1x,v1y,v1z | v2x,v2y,v2z   [m,s,m/s]")
for name, mu, r1, r2, tof, prograde in CASES:
    v1, v2 = izzo2015(mu, np.array(r1), np.array(r2), tof, M=0, prograde=prograde)
    print(
        f"LAMBERT {name} | {mu!r} | {fmt(r1)} | {fmt(r2)} | {tof!r} | "
        f"{1 if prograde else 0} | {fmt(v1)} | {fmt(v2)}"
    )
