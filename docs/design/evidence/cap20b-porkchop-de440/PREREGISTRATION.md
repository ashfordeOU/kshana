# Pre-registration: the porkchop on the DE440 kernel against SPICE + pykep (CAP-20b)

Written 2026-10-13 and committed alone, before the code exists and before the comparison runs.

## What is built

`maneuver::porkchop_kernel(kernel, dep_body, arr_body, dep_jd_tdb, arr_jd_tdb, mu_sun)`: the
existing porkchop sweep (single-revolution prograde Lambert, the 0.5 deg collinearity guard, C3
in km²/s² and arrival V∞ in km/s), with the departure and arrival states read as heliocentric
J2000 states of the given NAIF bodies from a DE440 SPK (`KernelEphemeris`, chained through the
barycentres) instead of the synthetic coplanar-circular bodies. The synthetic `porkchop` stays
as it is.

## Case (fixed now)

Earth (399) to Mars barycentre (4), departures 2026-09-01 + 10 k days (k = 0..15) and arrivals
2027-06-01 + 15 k days (k = 0..18), at 00:00 TDB, mu_sun = 1.32712440041e20 m³/s² (DE440 GM,
`gm_de440.tpc`), on `de440s.bsp` (SHA-256 `c1c7feea...`). The engine reads a bit-for-bit cut of
segments 10, 3, 399 and 4 over the window, made with the existing cutting script.

## Oracle

A separate program that calls no Kshana code: SPICE `spkezr` (CSPICE N0067 through spiceypy
8.3.0) for the heliocentric J2000 states on the full `de440s.bsp`, the same collinearity guard,
and pykep 3.0.1 `lambert_problem(cw = False, multi_revs = 0)` (an independent Lambert, MPL-2.0).
It writes C3 and V∞ per cell.

## Bars

1. The same cells finite (and the same marked NaN) on both sides.
2. Every finite C3 and V∞ within **1e-8** relative.
3. The minimum-C3 cell is the same cell.

## Outcome rule

All hold: a new row "Porkchop on the DE440 ephemeris" is VALIDATED as a Library check of the
sweep (states, Lambert, C3/V∞) against SPICE + pykep. It does not claim a mission design: one
revolution, prograde, no launch constraints. Any fails: a finding, and no row. No bar moved.
