# Lunar frame datum from an observing campaign, condition-scaled NumPy bar: results

Pre-registration: `PREREGISTRATION.md` (committed alone at `b887eb05`). Harness, fresh date and
step 0 committed before the NumPy oracle was run (`887eccad`). Run: 2026-10-13, NumPy 2.5.4,
SciPy 1.18.1.

**Outcome: NOT MET. A finding; the row stays MODELLED and no bar is moved.**

## Correction to the pre-registration's background

The pre-registration says `50863551` is not in the history. It is: the clone the pre-registration
was written in was shallow.

## Fresh date

D = 2026-12-01: the first day on or after 2026-12-01 that the engine-only probe
(`examples/mr05_fresh_date_probe.rs`) accepted. It reported 45 observations, Helmert defect 0 and a
full-rank station block with the stations estimated. Engine inputs:
`tests/fixtures/lunar_frame_campaign_cond_bar/fresh_inputs.json`.

## Step 0: the pseudo-inverse fallback (NOT MET on the fresh scenarios)

`tests/lunar_frame_campaign_pinv_fallback.rs` (the rebuilt datum sigmas equal the engine's to 1e-15):

* Six original scenarios: no matrix upstream of the Helmert matrix falls back. On
  `collinear_beacons` only the Helmert matrix falls back (defect 2, as stated). The tightest
  margin is the `stations_estimated` beacon information, at 2.6e-9 of its largest eigenvalue
  (a factor 2.6 above `rel_tol`). Its Helmert matrix sits at 4.7e-9. **So the 6.8e-6 P2 gap of
  0.30 is not a pseudo-inverse truncation.**
* Fresh scenarios: the south-pole beacon (-89.67 deg) has no observation on D (15 observations
  each for the other three). Its three columns of the beacon information are exactly zero, and
  `fim::crlb` falls back to the pseudo-inverse:
  * `stations_estimated_fresh`: beacon information rank 8/12; independence-discarded rank 9/12.
  * `stations_fixed_fresh`: beacon information rank 9/12; independence-discarded rank 9/12.

  The Helmert matrix stays full rank in both (7.6e-9 and 1.7e-6 of the largest eigenvalue),
  because the three observed beacons span the datum. The probe rule, which looks only at the
  Helmert defect and the station block, therefore accepted a day on which one beacon is
  unobserved. The engine reports this rank deficiency only through `crlb`'s nulls.

## SPICE leg (unchanged, six scenarios)

`lunar_frame_campaign_finding_stations_estimated_p2_precision` passes: the SPICE leg still
holds on all six scenarios.

## P2 leg at the condition-scaled bar

| Scenario | kappa(F) | kappa(T'FT) | t | Result |
|---|---|---|---|---|
| default | 1.32e5 | 3.80e5 | 4.2e-10 | all hold |
| arc_16h | 1.40e5 | 4.02e5 | 4.5e-10 | all hold (weakest direction 2.1e-8 of 1.6e-7 rad) |
| arc_48h | 4.07e3 | 1.17e4 | 1.3e-11 | all hold |
| stations_estimated | 5.32e8 | 2.59e8 | 5.9e-7 | **8 checks fail**: datum sigmas 1 to 5 at 3.0e-6 to 6.8e-6, translation norm 3.6e-6, condition 9.1e-6, independence-discarded norm 3.5e-6. Eigenvalues (worst 9.7e-14), the weakest direction and the correlation hold |
| delay_sigma_3x | 1.32e5 | 3.80e5 | 4.2e-10 | all hold |
| collinear_beacons | 1.30e5 | 1.34e8 | 1.5e-7 | all hold (null space 3.0e-8 rad) |
| stations_estimated_fresh | 3.84e8 | 3.74e7 | 4.3e-7 | **not evaluable**: the unchanged oracle raises `LinAlgError: Singular matrix` (NumPy `inv` of the independence-discarded covariance, singular because of the unobserved beacon) |
| stations_fixed_fresh | 1.39e5 | 5.78e5 | 6.4e-10 | all hold (worst 5.4e-2 of the bar) |

The wrapper (`run_p2.py`) catches that exception and records it; it never substitutes a value.
That handling was added after the first attempt raised, and before any comparison was made.
The oracle code is unchanged. The test counts the scenario as a failed check.

## What this says

* On the stations-estimated problem, the engine and NumPy differ by about 10 times the
  heuristic `10 kappa u` bar. The 50-digit row (`tests/lunar_frame_campaign_mpmath_oracle.rs`)
  already found the engine to be the less accurate side, inside a rigorous first-order
  backward-error bound. A condition-scaled bar of this form does not cover the cancellation in
  the engine's Schur complement. A more accurate route (the `srif` solver) or a rigorous bar
  would need its own pre-registration.
* The fresh date exposed an input condition the engine accepts silently: a beacon with no
  observation, where the datum is still realised from the others. Reporting it explicitly (or
  refusing it) is an engine change, and it would be pre-registered separately before it is
  made.

Pinned: `finding_step0_fresh_beacon_information_falls_back` and
`finding_p2_condition_scaled_bar_not_met_on_the_estimated_scenarios`. The strict tests are
ignored with the finding.
