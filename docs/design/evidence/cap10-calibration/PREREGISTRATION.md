# CAP-10 calibration ensembles: pre-registration

Written and committed **before** the harness was written or run. A single-seed test shows that
one seed passes. A calibration ensemble re-runs the same check over many independent seeds. It
then reports how often the check passes and, where the check is a confidence interval, how
often the interval covers the known truth. That shows whether the stated interval and the
tolerance hold beyond the lucky seed.

Every oracle here is a closed form on the engine's own models, so every row stays
**MODELLED**.

## Ensembles

**E1. Ledger row "Parameter sweeps and seeded Monte Carlo ensembles over any scenario kind".**
* Inputs: `scenarios/campaign-monte-carlo-clock-holdover.toml`, run K = 200 times.
* Ensemble j (0 ≤ j < 200) sets `monte_carlo.base_seed = 1 000 000 + 1000·j`, so the seed
  ranges do not overlap. It also sets the campaign `seed` (the bootstrap seed) to
  20260928 + j.
* Truth for `final_error`: mean 0, σ = √(9e−20 · 3010) s = 16.459 040 ns. Each ensemble has
  n = 200 realisations.

Per ensemble, the four checks of
`tests/campaign_composition_reference.rs::the_ensemble_mean_and_spread_match_the_white_fm_closed_form`
are evaluated:
* c1: 0 ∈ [ci95_low, ci95_high];
* c2: (n − 1)s²/σ² ∈ [151.37, 254.14];
* c3: |half-width / (1.959 964 σ/√n) − 1| < 0.25;
* c4: |p95 − 1.644 854 σ| < 0.3σ and |p05 + 1.644 854 σ| < 0.3σ.

**E2. `tests/calibration.rs::csac_white_fm_adev_matches_datasheet`.** Over seeds 0 … 199, a
white-FM clock with q_wf = (3e−10)² runs 8192 samples, and ADEV(1 s) must be within 20 % of
3e−10.

**E3. `tests/calibration.rs::csac_white_fm_adev_curve`.** Over seeds 0 … 199, with 40 000
samples, ADEV at τ = 1, 10 and 100 s must each be within 25 % of 3e−10/√τ.

## Pre-registered bars (decided now, not to be relaxed)

* **B1 (E1 c1, coverage).** The count of ensembles whose 95 % interval covers 0 lies in
  [181, 197]. That is the two-sided 99 % acceptance region of Binomial(200, 0.95).
* **B2 (E1 c2).** The count inside the 99 % chi-square interval lies in [194, 200], the 99 %
  region of Binomial(200, 0.99).
* **B3 (E1 c3, c4; E2; E3).** Each single-seed tolerance passes on at least 95 % of seeds
  (≥ 190 of 200). E3 counts a seed as passing only if all three τ pass.

## Predictions, written down now

These are not bars.
* B1: a percentile bootstrap at n = 200 is expected to slightly under-cover. The prediction is
  0.93 to 0.95.
* c3: the half-width check should pass essentially always. The sample σ has about 5 % relative
  spread.
* **c4 is expected to miss B3.** The nearest-rank 5th and 95th percentiles of 200 Gaussian
  samples each have a standard error of about 0.15σ. A 0.3σ tolerance on both is about a
  2-sigma bar twice, so the prediction is a pass fraction of about 0.90 to 0.92. A miss would
  mean the single-seed percentile check is seed-fragile.
* E2: the relative error of ADEV(1 s) should be about 0.8 %. The prediction is 200/200.
* E3: the error at τ = 100 s should be about 3 %. The prediction is 200/200.

## Reporting

The harness writes `docs/CALIBRATION-ENSEMBLES.md` and `docs/data/calibration-ensembles.csv`
(one row per ensemble or seed). It uses the repository generator, never a hand edit. A fast
test re-runs the first ensembles of each row and checks that they equal the committed CSV, and
it checks every bar from the committed CSV.

A miss is reported NOT MET with its numbers, and the single-seed test it concerns is named. The
single-seed tests themselves are not changed by this work.
