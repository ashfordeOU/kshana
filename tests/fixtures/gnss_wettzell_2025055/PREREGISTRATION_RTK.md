# Pre-registration: RTK double differences with LAMBDA integer fixing on real RINEX (WTZR-WTZZ)

Committed on its own on 2026-10-13, BEFORE the RTK code (`src/rtk_real.rs`, to be written)
exists and before any double-difference solution is computed on these data. The bars are not
loosened after the run; a miss is recorded with its numbers and the row stays MODELLED.

## Inputs (fixed now)

Base WTZR (`wtzr_2025055_0006_G.rnx`) and rover WTZZ (`wtzz_2025055_0003_G.rnx`), the IGS
stations at Wettzell about 1.4 m apart, both with LEIAR25.R3 LEIT antennas; 2025-02-24
00:00:00-02:59:30 (the rover slice), 30 s, GPS `C1C L1C C2W L2W`. Satellite positions from the IGS
final orbit (`../sp3_clock_igs_oracle/igs_2025055_G.sp3`) and clocks only for the transmit time.
Elevation mask 15 deg.

## Processing (fixed now)

Double differences of code and carrier on L1 and L2 against the highest satellite; static
baseline states (antenna reference point to antenna reference point) and single-difference float
ambiguities per satellite and frequency in a Kalman filter with the full double-difference
covariance; zenith-referenced noise 3 mm (phase) and 0.3 m (code) per undifferenced observation,
scaled by `1 + 1/sin ε`; no ionosphere or troposphere terms (identical at 1.4 m, antenna
heights within 0.3 m); a single-difference ambiguity is re-initialised on a loss-of-lock flag or
a geometry-free jump above 0.05 m at either receiver. Every epoch the double-difference float
ambiguities and their covariance go to `lambda::resolve`; the fix is accepted when the ratio is at
least 3, and the fixed baseline is the float baseline conditioned on the fixed integers. No
fix-and-hold.

## Reference (published data)

The ITRF2020 baseline: (WTZZ solution 3 + 0.2840 m up) − (WTZR solution 3 + 0.0710 m up), both
propagated from 2015.0 with their (identical) velocities, the antenna heights from the RINEX
headers. The antenna type is the same at both ends, so its offsets cancel to well under a
millimetre at this separation. Disclosed: ITRF2020 data end in 2021; an undocumented later
equipment change at either station would show as an offset.

## Criteria (fixed now), over 00:00:00-02:59:30

- **K1**: at least 90 % of the epochs from 00:10:00 have an accepted fix (ratio ≥ 3).
- **K2**: over the accepted fixes, the median 3-D error of the fixed baseline against the ITRF2020
  baseline is at most 0.010 m and the 95th percentile at most 0.020 m.
- **K3**: the float baseline at the last epoch is within 0.05 m of the ITRF2020 baseline.
- **D** (discrimination): over 00:00:00-00:09:30, the median 3-D error of the solutions with an
  accepted fix is at most half the median of the float solutions at the same epochs (fixing must
  add information while the float solution is still converging). If no fix is accepted in that
  window, D fails.
- **Non-vacuity**: at least 300 epochs processed.

Outcome rule: if K1, K2, K3 and D hold, RTK with LAMBDA on real data is VALIDATED against the
published ITRF2020 baseline. Otherwise MODELLED, numbers recorded. An RTKLIB comparison
(`rnx2rtkp` kinematic/static with `pos2-armode = continuous`) is a separate, data-gated
registration.
