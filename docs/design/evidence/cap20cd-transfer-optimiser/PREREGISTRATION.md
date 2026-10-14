# Pre-registration: the impulsive transfer optimiser on DE440 (CAP-20c) and the Earth-Mars C3 cross-check (CAP-20d)

Written 2026-10-14. Committed alone, before the optimiser exists and before any comparison is
run. The bars are not loosened after the run. A miss is recorded with its numbers and pinned by
a test that asserts it.

## What is built

`maneuver::optimise_transfer_kernel(kernel, dep_body, arr_body, dep_window, arr_window,
objective, transfer_type, mu_sun, grid_step_days)` finds the departure and arrival dates of a
two-impulse ballistic transfer that minimise one objective, as a continuous optimum rather than
a grid cell. It builds on the existing `porkchop_kernel` machinery: heliocentric J2000 states
from the DE440 SPK, the single-revolution prograde Lambert solver `maneuver::lambert(.., true)`,
and the 0.5 deg collinearity guard.

- **Objective:** `MinC3` (departure C3 = |v1 - v_dep|^2, km²/s²) or `MinArrivalVinf`
  (|v2 - v_arr|, km/s).
- **Transfer type:** Type I is a transfer angle below 180 deg and Type II above, measured in the
  prograde sense about the frame's +Z axis, the same convention the prograde Lambert solver
  uses. So Type I means (r1 x r2)_z > 0. A candidate of the other type, a non-positive time of
  flight, a collinear geometry or a Lambert failure scores +infinity.
- **Method:** a grid over both windows at `grid_step_days` (2 days here), then 2-D Nelder-Mead
  on (departure, arrival) in days from the best grid cell. Initial simplex steps are 1 day; it
  stops when the simplex spans less than 1e-7 day and the objective spread is less than 1e-13
  relative, or after 4000 iterations.

## Case (fixed now)

Earth (399) to the Mars barycentre (4), mu_sun = 1.32712440041e20 m³/s². The engine reads the
committed DE440 cut `tests/fixtures/porkchop_de440/de440s_2026-08-30_2028-04-15.bsp`.
Departure window 2026-09-15 to 2027-01-15 and arrival window 2027-05-01 to 2028-03-01, both
00:00 TDB inclusive, grid step 2 days. Four optimisations: (Type I, MinC3), (Type II, MinC3),
(Type I, MinArrivalVinf), (Type II, MinArrivalVinf).

## Oracle A (library, decides the status)

A separate Python program that calls no Kshana code:
- SPICE `spkezr` (spiceypy 8.3.0) on the same committed cut, for heliocentric J2000 states;
- pykep 3.0.1 `lambert_problem(cw=False, multi_revs=0)`;
- the same type rule and collinearity guard, and the same 2-day grid;
- SciPy 1.18.1 `optimize.minimize(method="Nelder-Mead", xatol=1e-7, fatol=1e-13)` from its own
  best grid cell.

It writes the optimum per case.

**Bars, per optimisation:**
- A1: the optimised objective within **1e-7 relative**.
- A2: departure and arrival dates each within **0.01 day**.
- A3: the non-optimised quantity at the optimum (V∞ for MinC3, C3 for MinArrivalVinf) within
  **1e-4 relative**.

## Reference B (published, plainly secondary)

NASA/TM-2010-216764 (*Interplanetary Mission Design Handbook:
Earth-to-Mars Mission Opportunities 2026 to 2045*, NASA Glenn, October 2010; NTRS 20100037210,
PDF SHA-256 e90b9692110ad00de14f76aa9c59a265d40e8aae240eb72d9b0747baaa4fd39c), Table 2,
"Earth to Mars, 2026 Opportunity, Energy Minima". The values were computed with MIDAS:
ballistic Lambert, ephemeris not stated, departure and arrival dates searched in 2-day steps,
values printed to about two decimals. This is not an independent computation of the same
quantity; it is the published number a mission designer would quote.

| case | published | B bar |
|---|---|---|
| B1: Type II min C3 | 9.144 km²/s², 10/31/26 to 8/19/27 | C3 within 2 % (8.961 to 9.327) |
| B2: Type I min C3 | 11.11 km²/s², 11/14/26 to 8/9/27 | C3 within 2 % (10.888 to 11.332) |
| B3: Type II min arrival V∞ | 2.565 km/s, 11/6/26 to 9/8/27 | V∞ within 2 % (2.514 to 2.616) |
| B4 | dates of B1 to B3 | each date within 4 days of the table's |

The table's Type I minimum-V∞ row repeats its minimum-C3 row, so it is not used.

## Decision

- Oracle A holds on all four optimisations: a new ledger row "Impulsive transfer optimiser on
  the DE440 ephemeris" is VALIDATED (Library: SPICE + pykep + SciPy). It claims the continuous
  date optimum of a single-revolution ballistic two-impulse transfer, not a mission design: no
  launch-vehicle, parking-orbit, deep-space-manoeuvre or multi-revolution options.
- Any A bar misses: a finding, and the row is MODELLED with the miss recorded.
- Reference B is recorded as MET or NOT MET in the row and the results. It does not change the
  status.
