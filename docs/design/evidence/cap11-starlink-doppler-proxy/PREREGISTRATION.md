# Pre-registration: the Starlink Doppler-positioning proxy against a published experiment (CAP-11, part)

Written 2026-10-14. Committed alone, before the comparison runs. The bars are not loosened
after the run. A miss is recorded with its numbers and pinned by a test that asserts it. This is
a proxy comparison against a published figure. It stays MODELLED whatever the outcome: the
model does not reproduce the experiment's receiver, signals or ephemeris errors.

## Published result

"Unveiling Starlink for PNT", NAVIGATION 72(1), 2025, doi:10.33012/navi.685 (CC BY 4.0; PDF
SHA-256 a5fffd35bbf494d4a747ef94b089d6f4359df5b143242c83dad96bcebe4be585), data set 3 (Columbus,
Ohio, July 2024, 10 min), Section 8.3.2 and Figure 26. The receiver positioned itself with
OFDM-beacon Doppler alone, by weighted nonlinear least squares, with an average of three
satellites available. The figures:
- 90th-percentile 3-D position error of **2 m with a 20 s window**;
- 90th-percentile 3-D position error of **10 m with an 8 s window**.

Both are over 200 Monte Carlo initialisations, with the window swept through the capture.

## Model (fixed now)

The `leo-pvt` kind in `doppler` mode with the `starlink-sop` preset: the first shell, 1584
satellites at 550 km and 53 deg with representative Walker phasing; 11.325 GHz; Doppler error
30 Hz one sigma. Settings:
- a stationary user at 40.0 N, -83.0 E, 220 m (Columbus, as in
  `scenarios/starlink-sop-doppler-positioning.toml`);
- **no height aid** (`height_sigma_m` absent; the published solution used none);
- `duration_s = 20`, `step_s = 0.1`, `windows_s = [8, 20]`.

**Satellite count.** The experiment's upward-pointing LNBF saw about three satellites at a time.
The model matches that with the elevation mask: `mask_deg` is the smallest integer from 25 to 89
for which the 20 s window uses at most 3 satellites at seed 1. The rule looks only at the
satellite count, and it is applied before any position error is read.

**Realisations.** Seeds 1 to 200. The metric is the 90th percentile (nearest rank) of
`error_3d_m` over the 200 seeds, at each window.

## Bars

- **P1:** the 90th-percentile 3-D error at 20 s lies within a factor of two of the published
  2 m, i.e. **1 to 4 m**.
- **P2:** the 90th-percentile 3-D error at 8 s lies within a factor of two of the published
  10 m, i.e. **5 to 20 m**.

## Prediction (stated before the run)

The model has a perfect ephemeris and puts every error into the 30 Hz Doppler sigma, at 10
measurements per second per satellite. The experiment corrected TLE + SGP4 orbits, and its
measurement rate depended on user traffic. The model's geometry is a representative shell
rather than the satellites actually overhead. The model should therefore be optimistic, and a
miss on the low side (below 1 m or below 5 m) is plausible. The outcome is uncertain.

## Decision

The outcome is recorded as it falls and pinned by a test asserting each bar's recorded side.
The existing MODELLED treatment of the `starlink-sop` preset stays; its ledger text cites this
comparison.
