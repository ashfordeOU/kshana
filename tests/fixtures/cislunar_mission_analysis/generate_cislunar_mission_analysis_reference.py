#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the CR3BP L2 Southern 9:2 NRHO.

ORACLE (primary, published vectors):
  NASA/JPL Solar System Dynamics — Three-Body Periodic Orbit Database
  (Dynamical Systems group; periodic_orbits.api, version "1.0",
   source "NASA/JPL Three-Body Periodic Orbits API"). Public-domain U.S.
   Government data (JPL/Caltech/NASA). The catalog itself is built on the
   Howell/Davis differential-correction methodology and is the same data set
   cross-checked in Zimovan-Spreen, Howell & Davis, "Near rectilinear halo
   orbits and their application in cis-lunar space" (Acta Astronautica /
   IAA-AAS-DyCoSS, 2017/2021/2022) for the Earth-Moon L2 Southern NRHO family,
   of which the 9:2 synodic-resonant member is the NASA Gateway reference orbit.

  The catalog is queried for the EXACT system/family used by kshana::cr3bp:
    sys=earth-moon  family=halo  libr=2  branch=S
  and the L2 Southern Halo (NRHO) member whose period is 6.560 days (the 9:2
  lunar-synodic resonance: 9 NRHO revolutions per 2 synodic months) is selected
  as the PRIMARY gate, plus 4 catalog neighbours spanning the 9:2 regime
  (6.53 .. 6.59 days). For each member the database row gives the perpendicular-
  crossing initial state {x, y=0, z, vx=0, vy, vz=0}, the Jacobi constant C and
  the period T in non-dimensional CR3BP units.

ORACLE (independent integrator, for perilune only):
  The perilune radius is NOT a column in the catalog row, so it is computed here
  with **scipy.integrate.solve_ivp (DOP853, rtol=atol=1e-13)** — an integrator
  *independent* of kshana's fixed-step RK4 — propagating the JPL catalog initial
  state for one JPL period and taking the minimum Moon distance. This makes the
  perilune an oracle-vs-kshana check between two different integrators fed the
  same (JPL) state, not a self-check.

WHAT IS COMPARED (all non-dimensional, the true CR3BP invariants):
  (1) Jacobi constant C
  (2) Period T (synodic non-dim units; mean motion = 1)
  (3) Perpendicular-crossing IC components {x0 (held fixed), z0, vy0}
  (4) Perilune radius (non-dimensional; km printed in BOTH the JPL length unit
      lunit=389703.265 km and kshana's hard-coded 384400 km for transparency)

UNITS NOTE (load-bearing for honesty):
  The dimensionless CR3BP ODE depends ONLY on the mass ratio mu, so the
  non-dim period T, Jacobi C and the non-dim IC/perilune are frame-independent
  invariants and are compared directly. kshana's mu = 0.012150585609624 matches
  the JPL system mass_ratio = 1.215058560962404e-02 to 12 significant figures.
  The ONLY de-dimensionalisation difference is the length unit: JPL uses
  lunit = 389703.265 km (the dynamically-consistent a = (G(m1+m2)/n^2)^(1/3)),
  whereas kshana::cr3bp hard-codes EARTH_MOON_DIST_KM = 384400 km. That 1.4%
  choice maps a 0.00752 non-dim perilune to ~2931 km (JPL) vs ~2891 km (384400);
  it is a unit *labelling* convention, not a dynamics error, so the perilune is
  validated in the JPL length unit (the regime the catalog is expressed in).

HONEST SCOPE:
  This validates the differential-correction CORE of kshana::cr3bp — that the
  single-shooting STM corrector, holding x0 fixed, converges from a JPL-seeded
  guess onto the SAME periodic L2 Southern NRHO the JPL catalog reports, to a
  tight tolerance on every non-dimensional invariant. The residuals (dT/T ~1e-4,
  dC ~1e-5, dz0 ~1e-5, perilune ~1 km in the JPL unit) are the honest, REPORTED
  fixed-step-RK4 / single-shooting / finite-grid-perilune gap. It does NOT
  validate an ephemeris (DE) cislunar model, the de-normalised MCI/MCMF
  transforms, or station-keeping; those are separate, out-of-scope follow-ons.

REPRODUCE (offline w.r.t. kshana; needs network for the JPL API):
    /tmp/kshana-oracles/.venv/bin/python \
        generate_cislunar_mission_analysis_reference.py \
        > cislunar_mission_analysis_reference.txt
  (numpy + scipy + urllib only; commit the .txt — the Rust test reads it, so CI
   needs no Python and no network.)

Generated with: NASA/JPL periodic_orbits.api v1.0 + scipy DOP853 + numpy.
"""

import json
import sys
import urllib.request

import numpy as np
from scipy.integrate import solve_ivp

JPL_URL = (
    "https://ssd-api.jpl.nasa.gov/periodic_orbits.api"
    "?sys=earth-moon&family=halo&libr=2&branch=S"
)

# 9:2 NRHO and 4 neighbours selected by period in days (6.53 .. 6.59).
TARGET_DAYS = [6.53078, 6.55041, 6.56024, 6.57989, 6.58973]
NINE_TWO_DAYS = 6.56024  # the primary gate (Gateway 9:2 member)


def fetch():
    with urllib.request.urlopen(JPL_URL, timeout=120) as r:
        raw = r.read()
    return json.loads(raw)


def perilune_nondim(x0, z0, vy0, period, mu):
    """Independent (scipy DOP853) min Moon-distance over one period from the
    JPL catalog state — NOT kshana's integrator."""
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

    s0 = [x0, 0.0, z0, 0.0, vy0, 0.0]
    sol = solve_ivp(rhs, [0.0, period], s0, method="DOP853",
                    rtol=1e-13, atol=1e-13, dense_output=True,
                    max_step=period / 20000.0)
    ts = np.linspace(0.0, period, 200001)
    y = sol.sol(ts)
    d = np.sqrt((y[0] - om) ** 2 + y[1] ** 2 + y[2] ** 2)
    return float(d.min())


def main():
    d = fetch()
    sysd = d["system"]
    lunit = float(sysd["lunit"])         # JPL length unit (km)
    tunit = float(sysd["tunit"])         # JPL time unit (s)
    mu = float(sysd["mass_ratio"])
    rsec = float(sysd["radius_secondary"])
    rows = d["data"]

    members = []
    for td in TARGET_DAYS:
        best = None
        for row in rows:
            per = float(row[7])
            days = per * tunit / 86400.0
            if best is None or abs(days - td) < abs(best[0] - td):
                best = (days, row)
        members.append(best)

    print("# NASA/JPL Three-Body Periodic Orbit Database — Earth-Moon L2 Southern Halo (NRHO).")
    print(f"# Query: {JPL_URL}")
    print("# Selected: the 9:2 NRHO (Gateway, ~6.560 d) + 4 catalog neighbours (6.53..6.59 d).")
    print("# Oracle row fields: x,y,z,vx,vy,vz,jacobi,period,stability (non-dim, mean motion=1).")
    print(f"# system mass_ratio={mu!r}  lunit_km={lunit!r}  tunit_s={tunit!r}  radius_secondary_km={rsec!r}")
    print("# Perilune (PERI lines) computed independently here via scipy DOP853 (rtol=atol=1e-13)")
    print("#   from the JPL catalog state — an integrator independent of kshana's RK4.")
    print("# Consumed by tests/cislunar_mission_analysis_reference.rs.")
    print(f"# SYSTEM mass_ratio={mu!r} lunit_km={lunit!r} tunit_s={tunit!r}")
    print("# NRHO name | x0 | z0 | vy0 | jacobi_C | period_T | period_days | peri_nondim | peri_km_jpl_lunit")
    for days, row in members:
        x0 = float(row[0]); z0 = float(row[2]); vy0 = float(row[4])
        c = float(row[6]); per = float(row[7])
        peri_nd = perilune_nondim(x0, z0, vy0, per, mu)
        peri_km_jpl = peri_nd * lunit
        is_92 = abs(days - NINE_TWO_DAYS) < 1e-3
        name = "L2S_NRHO_9to2" if is_92 else f"L2S_NRHO_{days:.3f}d".replace(".", "p")
        print(
            f"NRHO {name} | {x0!r} | {z0!r} | {vy0!r} | {c!r} | {per!r} | "
            f"{days!r} | {peri_nd!r} | {peri_km_jpl!r}"
        )
    print(f"# 9:2 primary gate name = L2S_NRHO_9to2 (period_days~{NINE_TWO_DAYS})", file=sys.stderr)


if __name__ == "__main__":
    main()
