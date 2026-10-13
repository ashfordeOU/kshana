# Pre-registration: joint map estimation (terrain SLAM, RBPF) (WP-10, RM-18)

Committed alone, before the SLAM filter is written or run, and before the known-map
baseline is run on an erroneous map. The bars are not loosened after the run. A miss is
recorded with its numbers and pinned by a test that asserts it. Status is MODELLED whatever
the outcome, because there is no external oracle. The comparison is filter against filter
on injected truth.

## Setting

Everything comes from `scenarios/terrain-slam.toml` unchanged: synthetic DEM seed 1, the
60-waypoint track, drift rate 0.0006 / -0.0005 deg per waypoint, altimeter sigma 8 m,
`map_sigma_m = 15`, 4000 particles, initial sigma 0.006 deg, process sigma 0.0025 deg,
resampling at ESS 0.5.

**Map error.** The stored map is the true DEM plus
`correlated_error_field(12.0, 12.5, 20.0, 20.5, step 0.005, sigma 15 m, L 0.03 deg,
seed s)`, sampled bilinearly. sigma equals the scenario's own `map_sigma_m`, so the
baseline's matching sigma already budgets an error of this size. The altimeter measures
the true DEM. Seeds s = 1..20. Realisation s uses filter and noise seed
`scenario seed + s`. The baseline and SLAM share the error field, the measurement noise
draws and the INS track.

**Baseline (known-map SITAN).** The existing sequential filter (`run_sequential_trn`'s
estimator), holding the erroneous stored map as if it were true, with matching sigma
hypot(8, 15) m, as in the scenario.

**SLAM (Rao-Blackwellised, FastSLAM-style).** The same particles, dynamics and resampling.
Each particle also carries an independent scalar Kalman estimate of the map correction in
each cell of a piecewise-constant 0.02 deg lattice over the DEM patch (25 x 25 cells). A
cell's prior is N(0, 15^2) m^2. A measurement at a particle's hypothesised position touches
the one cell containing it. The weight is the predictive likelihood of
`measured - stored(p)` given that cell's estimate, with variance
`P_cell + hypot(8, 7.5)^2` (the altimeter sigma plus a within-cell allowance of half the
map sigma). The cell estimate is then updated by the scalar Kalman equations. Resampling
copies a particle's cell estimates with it. These design constants are fixed here and are
not tuned after the run.

**Metric.** `matched_rms_m`, the RMS horizontal error of the weighted-mean estimate over all
60 waypoints, against the injected truth.

## Bars

- **S1, improvement:** mean SLAM RMS over the 20 seeds <= 0.9 x mean baseline RMS over the
  same 20 seeds.
- **S2, consistency:** SLAM RMS < baseline RMS in at least 12 of the 20 seeds.
- **S3, no harm on a perfect map:** with zero map error (stored map = DEM; SLAM keeps its
  15 m prior, the baseline keeps its hypot(8, 15) m sigma), over filter seeds 1..20, mean
  SLAM RMS <= 1.1 x mean baseline RMS.

## Prediction (stated before the run)

This is a single pass with no revisits. A cell sees about four measurements before the
track leaves it, so the map correction is only weakly learned. A position offset and a
locally constant map bias are also partly interchangeable. The expected gain is small: S1 is
uncertain, S2 is likely, and S3 is likely.

## Decision

The outcome is recorded as it falls. Each bar is pinned by a test asserting its recorded
side, MET or NOT MET. The ledger row stays Modelled.
