# Pre-registration: range-rate / az-el batch OD with an elevation mask, against Orekit 12.2

Committed alone, before kshana's tracking-OD path is run on the Orekit fixture. It fixes what is
compared, how, and the pass bars. Bars may later be tightened, never loosened; a miss is recorded
with its numbers in `RESULTS.md`, not tuned away.

## What is compared

kshana: `orbit_determination::determine_orbit_batch_tracking` (Gauss–Newton on
`H = (∂h/∂x(t))·Φ(t,t0)`, analytic measurement partials, variational STM integrated by fixed-step
RK4 with the closed-form two-body + J2 gravity gradient), `simulate_tracking` / `is_visible`
(elevation mask), `propagate_with_stm`.

Oracle: Orekit 12.2 + Hipparchus 3.1 (Apache-2.0), OpenJDK 21. `BatchLSEstimator` with the
Levenberg–Marquardt optimizer over a `NumericalPropagatorBuilder` (Orekit's own variational
equations and partial chain); `NumericalPropagator.setupMatricesComputation` for the STM.
Driver: `tests/fixtures/od_tracking_measurements/java/OrekitTrackingOd.java`.

Identical physics on both sides (the pattern of the existing range-only Orekit comparison):
two-body + J2 in GCRF, fixed-step classical RK4 of step `dt`; stations are fixed inertial points on
a 6378 km sphere; measurements are instantaneous and geometric (no light time, no aberration, no
refraction) through custom Orekit measurement classes (`GeometricRange`, `GeometricRangeRate`,
`GeometricAzEl`) whose values the driver cross-checks against Orekit's own `TopocentricFrame`
range / range-rate / azimuth / elevation. Orekit's stock `RangeRate` and `AngularAzEl` (which
include light time) are not used. The elevation mask is applied once, by the driver, when it
simulates the measurements; seeded Gaussian noise (σ = 5 m range, 5 mm/s range-rate, 1e-4 rad
azimuth and elevation) is added once and the noisy values are written to the fixture, so both
estimators fit identical data with identical weights `1/σ²`. Initial guess: truth +
(1000, −800, 600) m, (1.0, −0.8, 0.6) m/s.

Scenarios (8): `rr_leo`, `azel_leo`, `mixed_leo` (range + range-rate + az/el), `azel_meo`
noiseless; `rr_leo_noisy`, `azel_leo_noisy`, `mixed_leo_noisy`, `mixed_meo_noisy`. Masks 5° or 10°.

## Bars (every scenario must pass every applicable bar)

| # | Quantity | Bar |
|---|---|---|
| B1 | Visible set: kshana `simulate_tracking` from the truth state with the same stations, mask and kinds, vs the fixture's observation list | identical (epoch, station, kind) sequence |
| B2 | Noiseless measurement values, kshana simulation vs Orekit's | range ≤ 1e-3 m; range-rate ≤ 1e-6 m/s; azimuth, elevation ≤ 1e-9 rad |
| B3 | STM `Φ(t_k,t0)` at three epochs (noiseless scenarios), each 3×3 block | max abs element difference ≤ 1e-6 × max abs element of Orekit's block |
| B4 | Recovered epoch state, noiseless: kshana vs Orekit | position ≤ 1e-2 m; velocity ≤ 1e-5 m/s |
| B5 | Recovered epoch state, noiseless: kshana vs truth | position ≤ 1e-2 m; velocity ≤ 1e-5 m/s |
| B6 | Recovered epoch state, noisy: kshana vs Orekit | position ≤ 5e-2 m; velocity ≤ 5e-5 m/s |
| B7 | Post-fit residual RMS per measurement type, noisy: kshana vs Orekit | relative difference ≤ 1e-3 |
| B8 | Post-fit residual RMS per type, noiseless (kshana) | ≤ 1e-3 × that type's σ |
| B9 | kshana convergence | `converged` true in all 8 scenarios |

## What this does not show

It does not exercise light time, Earth rotation, real station coordinates, refraction, biases,
higher-order gravity or non-gravitational forces, or any sequential filter for range-rate/angles.
A pass makes the tracking-OD estimator, its analytic partials and its variational STM VALIDATED
against Orekit for this teaching model only.
