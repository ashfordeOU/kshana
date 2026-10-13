# Pre-registration: the CR3BP 9:2 NRHO against CAPSTONE's flown orbit (CAP-29d) — a measurement

Written 2026-10-13 and committed alone, before any CAPSTONE ephemeris is fetched or looked at.

## What is measured, and what is not claimed

How well the engine's circular-restricted 9:2 L2 southern NRHO (the
`cr3bp::differential_correct_halo` member of `cr3bp::tests::reproduces_l2_southern_nrho_92_regime`,
seed `[1.0220, 0, -0.1800, 0, -0.1020, 0]`, `EARTH_MOON_MU`) describes the mean geometry of
the orbit CAPSTONE actually flew. A CR3BP orbit is not an ephemeris-model orbit and is not
expected to match a real trajectory epoch by epoch, so nothing here can be VALIDATED: the
outcome is a measurement recorded on the CR3BP row, which stays as it is.

Known before writing (disclosed): the engine member's unit test asserts a period in 6.0 to 7.2
days and a perilune radius in 2 500 to 5 000 km. Published descriptions of CAPSTONE's orbit
give a period of about 6.5 days and a perilune altitude of the order of 1 600 km. The
engine's exact numbers have not been printed for this comparison.

## Data (fixed now)

JPL Horizons API, `COMMAND='-1176'` (CAPSTONE), `EPHEM_TYPE='VECTORS'`, `CENTER='500@301'`,
`REF_SYSTEM='ICRF'`, `REF_PLANE='FRAME'`, `VEC_TABLE='2'`, `OUT_UNITS='KM-S'`, `CSV_FORMAT='YES'`,
step 10 minutes, window 2023-03-01 to 2023-03-31 TDB. If Horizons does not cover that window,
the first 30-day window with full coverage on or after 2023-01-01 is used, and the move is
recorded. The response is committed byte for byte with the URL, the retrieval date and its
SHA-256.

## Quantities

From the Horizons states: every local minimum and maximum of the Moon-centred distance
(refined by a parabola through the three samples around it). The perilune radius `R_p` and
the apolune radius `R_a` are the means of the minima and of the maxima, and the period `P` is
the mean time between successive minima. From the engine member: its period (`period_days`),
perilune radius (`perilune_radius_km(mu, 600)`) and apolune radius (the Moon-centred distance
of its apolune initial state, in the engine's length unit).

## Bars (fixed now)

* period within **3 %** of CAPSTONE's mean;
* apolune radius within **5 %**;
* perilune radius within **20 %** (the perilune is the most sensitive to the ephemeris-model
  corrections a CR3BP orbit lacks).

## Outcome rule

All three hold: the CR3BP NRHO row records "matches CAPSTONE's mean flown geometry (period,
perilune, apolune) within ..." as measured evidence; its status does not change. Any fails: a
finding with its numbers. No bar is moved.
