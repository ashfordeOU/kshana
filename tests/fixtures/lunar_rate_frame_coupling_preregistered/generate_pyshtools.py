#!/usr/bin/env python3
"""pyshtools 4.14.1 (BSD-3-Clause) oracle for entry 2 of tests/lunar_rate_frame_coupling_preregistered.rs.

Run in a Python environment with pyshtools 4.14.1 and numpy, in a directory holding the two ICGEM
files AIUB-GRL350A.gfc and AIUB-GRL350B.gfc (not redistributed; see NOTICE.md for the URLs and
SHA-256), with stdout redirected to pyshtools_equatorial.txt. Expands each degree-350 field on
the sphere r = a_m = 1738140 m (Ashby and Patla 2024) and averages the radial gravity and the
potential over the longitudes of the equator row of the Driscoll-Healy grid.
"""
print("# pyshtools 4.14.1 SHGravCoeffs.from_file(format='icgem', lmax=350).expand(a=1738140, f=0, lmax=350)")
print("# key | value | unit | note")
import sys, numpy as np, pyshtools
a = 1738140.0
for f in ["AIUB-GRL350A", "AIUB-GRL350B"]:
    c = pyshtools.SHGravCoeffs.from_file(f + ".gfc", format="icgem", lmax=350)
    g = c.expand(a=a, f=0.0, lmax=350, extend=True)
    lats = g.rad.lats()
    i = int(np.argmin(np.abs(lats)))
    assert abs(lats[i]) < 1e-12, lats[i]
    nlon = g.rad.data.shape[1] - 1  # drop the repeated 360 deg column
    rad = g.rad.data[i, :nlon].mean()
    pot = g.pot.data[i, :nlon].mean()
    print(f"{f}.mean_radial_gravity_m_s2 | {rad:.12e} | m s^-2 | equator row {i}, {nlon} longitudes, r = {a} m")
    print(f"{f}.mean_potential_m2_s2 | {pot:.12e} | m^2 s^-2 | same row")
    print(f"{f}.gm | {c.gm} | r0 {c.r0}", file=sys.stderr)
