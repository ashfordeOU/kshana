# Pre-registration: the propagator's opt-in DE440 ephemeris tier against Orekit 12.2 (RM-33, FUT-10)

Committed alone, before kshana's DE440-tier propagation or its Sun/Moon positions are compared
with any Orekit output. Bars are not loosened after the run; a miss is recorded in `RESULTS.md`.

## What is validated

`propagator::ForceModel::with_ephemeris` (the opt-in ephemeris tier; default `None` keeps the
analytic Sun/Moon series and every existing output). With a `KernelEphemeris` over
`tests/fixtures/propagator_de440_orekit_oracle/de440s_2024-03-18_2024-03-23.bsp` (a bit-for-bit cut
of NAIF de440s.bsp, SHA-256 c1c7feea…49f2, made and SPICE-checked by `make_kernel_cut.py`), the
third-body and SRP terms read the geocentric Sun and Moon at TDB = TT + (TDB − TT) from the kernel.

## Oracle

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0, jars SHA-1-checked), run as a separate program
(`java/De440Driver.java`): NumericalPropagator + DormandPrince853 (tolerance seed 1e-11) in GCRF,
NewtonianAttraction (3.986004418e14), ThirdBodyAttraction for the Sun and Moon from **Orekit's own
DE440 reader on orekit-data's `DE-440-ephemerides/lnxp1990.440`** (the same JPL integration in a
different file format and reader), and for tier D2 cannonball SRP (P0 = 1361/c at 1 AU, spherical
Earth conical shadow, Cr 1.5, A/m 0.02 m²/kg). Epoch 2024-03-19 00:00 TT; 24 h, 25 hourly states.
Cases: D1 LEO (7000 km, 45°), D1 GEO (42 164 km, 0.1°), D1 HEO (1000 km × 40 000 km, 63.4°),
D2 LEO, D2 GEO. Orekit also prints its GCRF Sun and Moon positions at each output epoch.

## kshana side (fixed now)

`ForceModel::two_body().third_body(true, true, epoch)` (+ `.solar_radiation(1.5, 0.02)` for D2)
`.with_ephemeris(Arc::new(KernelEphemeris::open(cut)))`, `propagate_dopri` with
`Tolerance { rtol: 1e-12, atol: 1e-9 }`, one integration continued hour by hour (epoch advanced
each hour). Sun/Moon positions from `KernelEphemeris::relative_position_jd2(body, earth,
tt_to_tdb_jd2(tt))`.

## Bars (fixed now)

1. Ephemeris check, every output epoch: |Δ Sun| ≤ **3 m** and |Δ Moon| ≤ **0.2 m** against Orekit's
   DE440 positions. (kshana's TDB − TT is a two-term series good to a few tens of µs: up to ~1 m on
   the Sun at 30 km/s, ~3 cm on the Moon; Orekit uses its own TDB model.)
2. Orbits, every state of every case: |Δr| ≤ **0.5 m** and |Δv| ≤ **5e-4 m/s**.
3. Sensitivity control: the same kshana D1 GEO run with the default analytic Sun/Moon series must
   miss the 24 h Orekit state by more than **1 m** (otherwise the comparison does not resolve the
   ephemeris tier). Reported either way.

## What this does not validate

DE440 itself (both sides read the same JPL integration), the TT→TDB conversion beyond the bar of
item 1, kernels outside the cut window, the Earth-orientation chain (not used: the integration
frame is GCRF and no Earth-fixed term is enabled).
