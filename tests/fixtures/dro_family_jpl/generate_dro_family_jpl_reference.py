#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the Earth-Moon planar DRO family (paper P6, L29).

ORACLE (primary, published vectors):
  NASA/JPL Solar System Dynamics -- Three-Body Periodic Orbit Database
  (Dynamical Systems group; periodic_orbits.api, version "1.0",
   source "NASA/JPL Three-Body Periodic Orbits API"). Public-domain U.S.
   Government data (JPL/Caltech/NASA). The DRO family is queried for the EXACT
   system used by kshana::dro / kshana::cr3bp:
       sys=earth-moon  family=dro
   Each catalog row is a perpendicular x-axis crossing state {x, y=0, z=0,
   vx=0, vy, vz=0}, with the Jacobi constant C and the period T in
   non-dimensional CR3BP units (mean motion = 1). The catalog lists the
   NEAR-SIDE x-axis crossing of the retrograde DRO (x < 1-mu, vy > 0).

  Four planar members are selected by their near-side crossing distance from the
  Moon so the family spans perilune ~11,500 .. ~46,000 km -- exactly the band the
  paper's DRO constellation seeding claim spans (4 planar DROs, perilune ~11,500
  to ~46,000 km).

ORACLE (independent integrator, for perilune AND the far-side crossing):
  A planar DRO has TWO perpendicular x-axis crossings: the near-side one (given by
  the catalog row) and the FAR-side one (x > 1-mu, vy < 0). kshana::dro's public
  `dro_from_crossing(x_cross, ...)` is parametrised by the FAR-side crossing
  abscissa (it holds x_cross > 1-mu fixed and corrects the single free vy0 < 0).
  Both crossings belong to the SAME periodic orbit, so its frame-independent
  invariants -- Jacobi constant C, period T, and perilune radius -- are identical
  regardless of which crossing parametrises it.

  Here **scipy.integrate.solve_ivp (DOP853, rtol=atol=1e-13)** -- an integrator
  *independent* of kshana's fixed-step RK4 -- propagates the JPL catalog (near-side)
  initial state for one JPL period and (a) records the FAR-side crossing abscissa
  `far_x` (where kshana is seeded), and (b) takes the minimum Moon distance as the
  perilune radius. The perilune is therefore a two-integrator cross-check (scipy
  DOP853 oracle vs kshana RK4), not a self-check, and `far_x` is derived by scipy
  from the JPL state -- kshana is never consulted to build this fixture.

WHAT IS COMPARED (all non-dimensional CR3BP invariants of the periodic orbit):
  (1) Jacobi constant C            (from the JPL catalog row)
  (2) Period T                     (from the JPL catalog row)
  (3) Perilune radius              (scipy DOP853 min Moon-distance from the JPL state)
  The Rust test seeds kshana `dro_from_crossing` at `far_x` (held fixed), lets the
  single-shooting STM corrector converge on vy0, and compares the converged orbit's
  C (via kshana::cr3bp::jacobi_constant), period T and perilune radius to these.

UNITS NOTE (load-bearing for honesty):
  The dimensionless CR3BP ODE depends ONLY on the mass ratio mu, so the non-dim
  period T, Jacobi C and the non-dim perilune are frame-independent invariants and
  are compared directly. kshana's mu = 0.012150585609624 matches the JPL system
  mass_ratio = 1.215058560962404e-02 to 12 significant figures. The ONLY
  de-dimensionalisation difference is the length unit: JPL uses
  lunit = 389703.265 km whereas kshana::cr3bp hard-codes EARTH_MOON_DIST_KM =
  384400 km. That 1.4% choice is a unit *labelling* convention, not a dynamics
  error, so the perilune is validated in the JPL length unit: the test converts
  kshana's perilune (km, 384400 convention) back to non-dim (/384400) then into the
  JPL lunit before comparing.

HONEST SCOPE (recommended_status: Modelled):
  This validates the differential-correction CORE of kshana::dro -- that the planar
  single-shooting STM corrector, holding the far-side crossing abscissa fixed,
  converges from a JPL-derived seed onto the SAME periodic DRO the JPL catalog
  reports, to a tight tolerance on every non-dimensional invariant (C, T, perilune).
  The paper's HEADLINE claim -- WHICH four DROs constitute a good constellation
  (the chosen perilune amplitudes/phases) -- remains **Modelled**: that is a
  scenario design choice, not a certified optimum, and is NOT asserted here. What
  is validated is that each seeded member is a genuine JPL-catalog DRO.

REPRODUCE (offline w.r.t. kshana; needs network for the JPL API):
    /tmp/kshana-oracles/.venv/bin/python \
        generate_dro_family_jpl_reference.py \
        > dro_family_jpl_reference.txt
  (numpy + scipy + urllib only; commit the .txt -- the Rust test reads it, so CI
   needs no Python and no network.)

Generated with: NASA/JPL periodic_orbits.api v1.0 + scipy DOP853 + numpy.
"""

import json
import sys
import urllib.request

import numpy as np
from scipy.integrate import solve_ivp

JPL_URL = "https://ssd-api.jpl.nasa.gov/periodic_orbits.api?sys=earth-moon&family=dro"

# Select four planar DROs by near-side crossing distance from the Moon (km), so the
# family spans the paper's perilune band ~11,500 .. ~46,000 km.
TARGET_PERILUNE_KM = [11500.0, 20000.0, 30000.0, 46000.0]


def fetch():
    with urllib.request.urlopen(JPL_URL, timeout=120) as r:
        raw = r.read()
    return json.loads(raw)


def analyse(x0, vy0, period, mu):
    """Independent (scipy DOP853) analysis of the JPL DRO state over one period:
    returns (perilune_nondim, far_side_crossing_x). NOT kshana's integrator."""
    om = 1.0 - mu

    def rhs(_t, s):
        x, y, z, vx, vy, vz = s
        r1 = ((x + mu) ** 2 + y * y + z * z) ** 0.5
        r2 = ((x - om) ** 2 + y * y + z * z) ** 0.5
        return [
            vx, vy, vz,
            2 * vy + x - om * (x + mu) / r1 ** 3 - mu * (x - om) / r2 ** 3,
            -2 * vx + y - om * y / r1 ** 3 - mu * y / r2 ** 3,
            -om * z / r1 ** 3 - mu * z / r2 ** 3,
        ]

    s0 = [x0, 0.0, 0.0, 0.0, vy0, 0.0]
    sol = solve_ivp(rhs, [0.0, period], s0, method="DOP853",
                    rtol=1e-13, atol=1e-13, dense_output=True,
                    max_step=period / 20000.0)
    ts = np.linspace(0.0, period, 400001)
    y = sol.sol(ts)
    dm = np.sqrt((y[0] - om) ** 2 + y[1] ** 2)
    peri_nd = float(dm.min())

    # Far-side perpendicular x-axis crossing: first y=0 crossing with x > 1-mu.
    yy = y[1]
    far_x = None
    for i in range(1, len(ts)):
        if yy[i - 1] * yy[i] < 0.0:
            frac = -yy[i - 1] / (yy[i] - yy[i - 1])
            tc = ts[i - 1] + frac * (ts[i] - ts[i - 1])
            sc = sol.sol(tc)
            if sc[0] > om:
                # Newton-refine the crossing abscissa on y(t)=0.
                for _ in range(60):
                    sc = sol.sol(tc)
                    if abs(sc[1]) < 1e-14:
                        break
                    tc -= sc[1] / sc[4]
                far_x = float(sol.sol(tc)[0])
                break
    if far_x is None:
        raise RuntimeError("no far-side x-axis crossing found")
    return peri_nd, far_x


def main():
    d = fetch()
    sysd = d["system"]
    lunit = float(sysd["lunit"])         # JPL length unit (km)
    tunit = float(sysd["tunit"])         # JPL time unit (s)
    mu = float(sysd["mass_ratio"])
    rsec = float(sysd["radius_secondary"])
    rows = d["data"]
    om = 1.0 - mu

    # Candidate near-side crossings (x < 1-mu) keyed by crossing distance from Moon.
    cand = []
    for row in rows:
        x = float(row[0]); vy = float(row[4])
        c = float(row[6]); per = float(row[7])
        near_km = abs(x - om) * lunit
        cand.append((near_km, x, vy, c, per))

    members = []
    for tkm in TARGET_PERILUNE_KM:
        best = min(cand, key=lambda cc: abs(cc[0] - tkm))
        members.append(best)

    print("# NASA/JPL Three-Body Periodic Orbit Database -- Earth-Moon planar DRO family.")
    print(f"# Query: {JPL_URL}")
    print("# Selected: 4 planar DROs spanning perilune ~11,500 .. ~46,000 km (paper P6, L29).")
    print("# Catalog row fields: x,y,z,vx,vy,vz,jacobi,period,stability (non-dim, mean motion=1).")
    print("# The catalog lists the NEAR-side x-axis crossing (x<1-mu, vy>0).")
    print(f"# system mass_ratio={mu!r}  lunit_km={lunit!r}  tunit_s={tunit!r}  radius_secondary_km={rsec!r}")
    print("# far_x = the FAR-side x-axis crossing (x>1-mu) of the SAME orbit, found by scipy")
    print("#   DOP853 (rtol=atol=1e-13) from the JPL near-side state. kshana::dro is seeded there.")
    print("# peri_nondim = min Moon-distance over one period, scipy DOP853 -- integrator")
    print("#   independent of kshana's RK4; peri_km_jpl = peri_nondim * lunit.")
    print("# Consumed by tests/validate_p6_dro_family_jpl.rs.")
    print(f"# SYSTEM mass_ratio={mu!r} lunit_km={lunit!r} tunit_s={tunit!r}")
    print("# DRO name | near_x0 | near_vy0 | far_x | jacobi_C | period_T | period_days | peri_nondim | peri_km_jpl_lunit")
    for near_km, x, vy, c, per in members:
        peri_nd, far_x = analyse(x, vy, per, mu)
        peri_km_jpl = peri_nd * lunit
        days = per * tunit / 86400.0
        name = f"DRO_peri{peri_km_jpl:.0f}km"
        print(
            f"DRO {name} | {x!r} | {vy!r} | {far_x!r} | {c!r} | {per!r} | "
            f"{days!r} | {peri_nd!r} | {peri_km_jpl!r}"
        )
    print(f"# {len(members)} planar DRO members written.", file=sys.stderr)


if __name__ == "__main__":
    main()
