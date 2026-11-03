<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D13 (0.41), part 1: the campaign Monte Carlo percentile check (183 of 200), re-run plan

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are new; every other number is a bar of
[`PREREGISTRATION.md`](PREREGISTRATION.md) in this directory and is not changed.

## Why this row

Ledger row `VM-badb561f` (parameter sweeps and seeded Monte Carlo ensembles). In the calibration ensembles
([`RESULTS.md`](RESULTS.md)), bar **B3** for check **c4** (the nearest-rank p05 and p95 of 200 realisations within 0.3
sigma of the Gaussian quantiles, on at least 190 of 200 seeds) is **NOT MET**: 183 of 200. This was predicted in the
registration (0.90 to 0.92): each percentile has a standard error of about 0.15 sigma, so 0.3 sigma is about a 2-sigma
tolerance applied twice. The engine is not wrong; the single-seed check's tolerance is fragile.

## Re-run of B3 for c4 (original bar)

- Ensembles j = 200 to 399 (fresh: never run), with `monte_carlo.base_seed = 1 000 000 + 1000 j` and campaign seed
  `20260928 + j`, the registered formulas continued; c4 unchanged at 0.3 sigma.
- Bar: B3 unchanged, at least **190 of 200**.
- **Expected, stated now: NOT MET again** (a pass fraction of about 0.91). The re-run confirms the recorded miss on
  unseen seeds; it cannot change the finding, because nothing in the engine is the cause.

## New check c4' and bar B3' (the question the miss raised)

The registered results named a follow-up: widen the single-seed tolerance with a stated derivation, in its own commit.
That is a change to the test under assessment, so it gets its own bar, and B3 for c4 stays NOT MET.

- **c4' (*proposed*):** |p95 - 1.644 854 sigma| < **0.5 sigma** and |p05 + 1.644 854 sigma| < **0.5 sigma**.
- **Derivation, from theory only:** the standard error of the nearest-rank 5th or 95th percentile of n = 200 Gaussian
  samples is `sqrt(0.05 * 0.95 / 200) / phi(1.644 854)` = 0.0154 / 0.1031 = **0.149 sigma**. A tolerance of 0.5 sigma is
  3.35 standard errors; the two-sided miss probability per percentile is about 8e-4, about 1.6e-3 for both, so a correct
  engine passes c4' on about 99.8 % of seeds. The per-seed values of the original 200 ensembles
  (`docs/data/calibration-ensembles.csv`) were **not** used to choose 0.5.
- **Bar B3' (*proposed*):** c4' passes on at least **190 of 200** of the fresh ensembles j = 200 to 399 (the same region
  as B3).
- If B3' is met, the single-seed test in `tests/campaign_composition_reference.rs` takes the c4' tolerance in its own
  commit, citing this file.

## What a result would and would not mean

B3' met says the derived tolerance is robust across seeds; it says nothing new about the engine, which no bar here finds
at fault. The row stays MODELLED (closed forms on the engine's own model).

## Owner decisions at sign-off

1. The c4' tolerance (0.5 sigma).
