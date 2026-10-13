# Pre-registration: 24 h EGM2008 200×200 Cowell orbit against Orekit 12.2 (FUT-07)

Committed alone, before kshana's 200×200 propagation is compared with the Orekit orbit. Bars are
not loosened after the comparison; a miss is recorded in `RESULTS.md` with its numbers.

## Oracle (already generated, not yet compared)

`tests/fixtures/high_degree_gravity/orekit_orbit_24h_egm2008_200.txt` (generator
`generate_orbit_24h_reference.py`, driver `java/Orbit24hDriver.java`): Orekit 12.2 +
Hipparchus 3.1 (Apache-2.0), `NumericalPropagator` / `DormandPrince853` (Cartesian tolerances from
dP = 1e-6 m, steps 1e-3 to 300 s), point mass plus `HolmesFeatherstoneAttractionModel` 200×200 over
the full ICGEM `EGM2008.gfc` (SHA-256 ab5b524d…70fd, `scripts/fetch_egm2008.sh`), body frame R3(ERA)
about inertial z with UT1 = TT. Epoch 2024-01-01T12:00:00 TT (JD_TT 2460311.0), r0 = (6778136.3, 0,
0) m, v0 = (0, 4766, 6008) m/s; 145 states every 600 s over 86 400 s.

## kshana side (fixed now)

`SphericalHarmonicField::from_gfc_file(KSHANA_EGM2008_GFC, 200)`,
`Geopotential::new(field).with_evaluator(FieldEvaluator::HolmesFeatherstone)` (Era frame,
UT1 − TT = 0), `ForceModel::two_body().with_geopotential(..).third_body(false, false, epoch)`,
`propagate_dopri` with `Tolerance { rtol: 1e-12, atol: 1e-9 }`, one integration continued in 600 s
segments (each segment restarts the driver with the epoch advanced). Data-gated on
`KSHANA_EGM2008_GFC`; the run below is made with the file whose SHA-256 is above.

## Bars (fixed now)

1. Every one of the 145 states: `|Δr| ≤ 0.5 m`, `|Δv| ≤ 5e-4 m/s`.
2. Sensitivity control: the same kshana run truncated to degree 70 must miss the 24 h Orekit state
   by more than 1 m (otherwise degrees 71–200 are not being tested). Reported either way.
3. Reported, no bar: the same run with `FieldEvaluator::Classic` (valid at this inclination).

## What this does not validate

Earth-orientation fidelity (UT1 = TT, no precession–nutation on both sides); degrees above 200 in
an orbit (point accelerations to 2190 are covered by `xval/high-degree-gravity/`).
