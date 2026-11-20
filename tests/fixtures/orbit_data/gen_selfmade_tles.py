#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Writes the SELF-MADE two-line element sets used by tests/orbit_data.rs (no real object, no
real catalogue data; catalogue numbers 90001-90099 are used as placeholders).

  gp_source_a.tle, gp_source_b.tle   two "sources" for the same objects (gp-compare)
  gp_audit.tle                       one source with planted defects (gp-audit)

Run from this directory: python3 gen_selfmade_tles.py
"""
import math

MU = 398600.8          # km^3/s^2, WGS-72 (the SGP4 constants)
RE = 6378.135          # km
J2 = 0.001082616      # WGS-72, as SGP4


def checksum(line):
    return sum(int(c) if c.isdigit() else (1 if c == '-' else 0) for c in line[:68]) % 10


def sets(cat, name, epoch_day, inc, raan, ecc, argp, ma, n, elset=999, year=26, bstar="00000-0"):
    l1 = (f"1 {cat:05d}U 26001A   {year:02d}{epoch_day:012.8f}  .00000000  00000-0  {bstar} 0 {elset:4d}")
    l2 = (f"2 {cat:05d} {inc:8.4f} {raan % 360:8.4f} {int(round(ecc * 1e7)):07d} {argp % 360:8.4f} "
          f"{ma % 360:8.4f} {n:11.8f}{1:5d}")
    assert len(l1) == 68 and len(l2) == 68, (len(l1), len(l2))
    return [name, l1 + str(checksum(l1)), l2 + str(checksum(l2))]


def secular(n_rev_day, inc, ecc, dt_days):
    """Secular drift of RAAN, argument of perigee and mean anomaly (deg) over dt_days, from the
    SGP4 initialisation (Hoots and Roehrich 1980, Spacetrack Report No. 3; Vallado et al. 2006,
    AIAA 2006-6753) with WGS-72 constants and no drag (B* = 0), so that a set built with these
    rates is the same orbit as its predecessor propagated by SGP4."""
    xke = 60.0 / math.sqrt(RE ** 3 / MU)
    j4 = -0.00000165597
    no = n_rev_day * 2 * math.pi / 1440.0          # rad/min, Kozai
    c = math.cos(math.radians(inc))
    c2 = c * c
    omeosq = 1 - ecc * ecc
    rteosq = math.sqrt(omeosq)
    ak = (xke / no) ** (2 / 3)
    d1 = 0.75 * J2 * (3 * c2 - 1) / (rteosq * omeosq)
    de = d1 / (ak * ak)
    adel = ak * (1 - de * de - de * (1 / 3 + 134 * de * de / 81))
    de = d1 / (adel * adel)
    nu = no / (1 + de)                              # un-Kozai'd
    ao = (xke / nu) ** (2 / 3)
    pinvsq = 1 / (ao * omeosq) ** 2
    con41 = 3 * c2 - 1
    con42 = 1 - 5 * c2
    t1 = 1.5 * J2 * pinvsq * nu
    t2 = 0.5 * t1 * J2 * pinvsq
    t3 = -0.46875 * j4 * pinvsq * pinvsq * nu
    mdot = nu + 0.5 * t1 * rteosq * con41 + 0.0625 * t2 * rteosq * (13 - 78 * c2 + 137 * c2 * c2)
    argpdot = (-0.5 * t1 * con42 + 0.0625 * t2 * (7 - 114 * c2 + 395 * c2 * c2)
               + t3 * (3 - 36 * c2 + 49 * c2 * c2))
    nodedot = -t1 * c + (0.5 * t2 * (4 - 19 * c2) + 2 * t3 * (3 - 7 * c2)) * c
    dt = dt_days * 1440.0
    return map(math.degrees, (nodedot * dt, argpdot * dt, mdot * dt))


def write(path, rows):
    with open(path, "w") as f:
        f.write("\n".join(rows) + "\n")


base = dict(inc=51.6, raan=100.0, ecc=0.0005, argp=90.0, ma=0.0, n=15.5)
a, b = [], []
a += sets(90001, "SELFMADE 1", 320.5, **base)
b += sets(90001, "SELFMADE 1", 320.5, **base)
a += sets(90002, "SELFMADE 2", 320.5, **base)
b += sets(90002, "SELFMADE 2", 320.5, **{**base, "ma": 0.5})      # about 60 km along track
a += sets(90003, "SELFMADE 3", 320.5, **base)
b += sets(90003, "SELFMADE 3", 320.5, **{**base, "raan": 100.01})  # about 1 km cross track
a += sets(90004, "SELFMADE 4 ONLY IN A", 320.5, **base)
b += sets(90005, "SELFMADE 5 ONLY IN B", 320.5, **base)
write("gp_source_a.tle", a)
write("gp_source_b.tle", b)

audit = []
# 90010: two consistent sets six hours apart (elements advanced by the SGP4 secular rates).
audit += sets(90010, "SELFMADE 10", 320.25, elset=10, **base)
dr, dw, dm = secular(base["n"], base["inc"], base["ecc"], 0.25)
nxt = {**base, "raan": base["raan"] + dr, "argp": base["argp"] + dw, "ma": base["ma"] + dm}
audit += sets(90010, "SELFMADE 10", 320.5, elset=11, **nxt)
# 90011: the second set is 2 degrees of mean anomaly off its predecessor (about 240 km): a jump,
# and its element set number goes back.
audit += sets(90011, "SELFMADE 11", 320.25, elset=20, **base)
audit += sets(90011, "SELFMADE 11", 320.5, elset=19, **{**nxt, "ma": nxt["ma"] + 2.0})
# 90012: a corrupted checksum on line 2.
bad = sets(90012, "SELFMADE 12", 320.5, **base)
bad[2] = bad[2][:-1] + str((int(bad[2][-1]) + 1) % 10)
audit += bad
# 90013: mean motion 17.5 rev/day with e = 0.05: perigee below the surface.
audit += sets(90013, "SELFMADE 13", 320.5, **{**base, "n": 17.5, "ecc": 0.05})
# 90014: epoch 200 days before the reference time the test uses (2026-320.5).
audit += sets(90014, "SELFMADE 14", 120.5, **base)
write("gp_audit.tle", audit)
