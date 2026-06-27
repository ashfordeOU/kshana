#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external IGRF-14 reference vectors for kshana's geomagnetic-field
synthesis (the field part of the alternative/complementary-PNT capability).

Oracle
------
**ppigrf 2.1.0** — "Pure Python IGRF" (Karl M. Laundal, MIT License),
the IAGA-VMOD reference implementation: https://github.com/IAGA-VMOD/ppigrf .
It ships the official IAGA `IGRF14.shc` coefficient file (IGRF 14th generation,
DOI 10.5281/zenodo.14012302) and evaluates the spherical-harmonic synthesis in
geodetic coordinates (height above the WGS-84 ellipsoid), returning the field in
the local east/north/up frame. This is an *independent codebase* from kshana's
`src/igrf.rs` (different language, different Legendre recursion, different
geodetic reduction), so agreement to ~nT is a genuine external check, not a
self-consistency test.

What this validates
-------------------
kshana's `igrf::magnetic_field(lat, lon, alt, year)` spherical-harmonic synthesis
of Earth's main field — the field-evaluation core of the magnetic-anomaly leg of
the alternative/complementary-PNT capability — at the IGRF epoch 2025.0 over a
near-global grid (~1900 points): geographic field components X(north), Y(east),
Z(down), total intensity F, and the derived declination D and inclination I.

Mapping between the two conventions (both use geodetic lat/lon and height above
the WGS-84 ellipsoid):

    kshana X (north_nt)  =  ppigrf Bn
    kshana Y (east_nt)   =  ppigrf Be
    kshana Z (down_nt)   = -ppigrf Bu

D and I are computed here from the field components with the SAME definition
kshana uses (D = atan2(Y, X), I = atan2(Z, H), H = hypot(X, Y)) rather than via
ppigrf's `get_inclination_declination` helper, whose declination uses
`arcsin(Be/H)` (which differs from atan2 when the north component is negative).
The field components Be/Bn/Bu are the unambiguous oracle output; D/I are then a
deterministic function of them, identical on both sides.

Honest scope
------------
This validates the IGRF main-field *synthesis* only. The map-matching / CRLB
geolocation-accuracy layer that consumes this field (how well a platform can fix
its position by matching the field) is a modelling claim and is NOT validated by
this fixture. The shipped model is the degree-13 main field + 2025-2030 secular
variation; this fixture pins the epoch 2025.0 main field.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/ppigrfvenv
    /tmp/ppigrfvenv/bin/pip install ppigrf numpy
    /tmp/ppigrfvenv/bin/python generate_alternative_complementary_pnt_reference.py \
        > alternative_complementary_pnt_reference.txt

Generated with ppigrf 2.1.0 (IGRF14.shc) + numpy.
"""

import datetime as dt
import math

import numpy as np
import ppigrf

# Epoch 2025.0 — exactly the 2025.0 column of IGRF14.shc, so ppigrf's
# time-interpolation returns the published 2025.0 coefficients with no
# interpolation residual. 2025-01-01T00:00 is decimal year 2025.000.
DATE = dt.datetime(2025, 1, 1)
YEAR = 2025.0

# Near-global grid: lat -85..85 step 5, lon -180..165 step 15, alt {0,100,400} km.
LATS = list(range(-85, 86, 5))         # 35 values
LONS = list(range(-180, 166, 15))      # 24 values (-180 .. +165)
ALTS = [0.0, 100.0, 400.0]             # surface, upper atmosphere, LEO-ish
# -> 35 * 24 * 3 = 2520 points (poles excluded to avoid the 1/sinθ singularity);
# three altitudes exercise the radial (RE/r)^(n+2) dependence of the synthesis.


def scalar(x):
    return float(np.ravel(np.asarray(x))[0])


print("# ppigrf 2.1.0 IGRF-14 reference for kshana igrf::magnetic_field.")
print("# Oracle: ppigrf 2.1.0 (Karl M. Laundal, MIT), IGRF14.shc "
      "(IAGA IGRF 14th gen, DOI 10.5281/zenodo.14012302).")
print("# Consumed by tests/alternative_complementary_pnt_reference.rs. "
      "See generate_alternative_complementary_pnt_reference.py.")
print(f"# epoch (decimal year) = {YEAR}")
print("# IGRF lat_deg lon_deg alt_km | X_nT Y_nT Z_nT F_nT D_deg I_deg")
print("#   X=Bn (north), Y=Be (east), Z=-Bu (down); "
      "D=atan2(Y,X), I=atan2(Z,hypot(X,Y))")

n = 0
for alt in ALTS:
    for lat in LATS:
        for lon in LONS:
            Be, Bn, Bu = ppigrf.igrf(float(lon), float(lat), float(alt), DATE)
            Be, Bn, Bu = scalar(Be), scalar(Bn), scalar(Bu)
            x = Bn          # north
            y = Be          # east
            z = -Bu         # down
            h = math.hypot(x, y)
            f = math.hypot(h, z)
            d = math.degrees(math.atan2(y, x))
            i = math.degrees(math.atan2(z, h))
            print(
                f"IGRF {float(lat)!r} {float(lon)!r} {float(alt)!r} | "
                f"{x!r} {y!r} {z!r} {f!r} {d!r} {i!r}"
            )
            n += 1

# Footer comment (ignored by the parser) records the count for humans.
print(f"# total points = {n}")
