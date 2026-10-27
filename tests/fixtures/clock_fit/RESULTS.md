<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Results: `[clock_fit]`, the clock kind's holdover driven by a fitted measured series

Pre-registration: `PREREGISTRATION.md` (99c7f5d3, Addendum 1 b25a5566). The generator and reference numbers were
committed (bb0dfcb1) and the code and test (e5e8b386) before the first run. allantools 2024.6, numpy,
rustc 1.93.0, release profile, Linux x86-64.

## Before the comparison: the generator check

The registered check (allantools `oadev` of each synthetic record within 20 % of theory at the listed
averaging times) **missed once**, in two places at tau = 4096 s: C2 seed 20261103 gave 0.701 and C3 seed
20261103 gave 0.80 (the largest deviation, 0.299). At tau = 4096 s a 131 072-sample record holds 32
independent averages, so the sampling scatter of the Allan deviation of random-walk FM is about 15 to 20 % (1 sigma);
the 20 % limit was set without that scatter. At tau up to 512 s every record is within 8.4 %. A diagnostic added
afterwards (the same generator, C3 seed 20261101, 2^21 samples) agrees with theory within 1.4 % at 1, 8, 64, 512 and
4096 s. The registered seeds and records were not changed. The check is not a bar of the engine.

## Run 1 (the code as committed) and what it found

| bar | result | numbers |
|---|---|---|
| F1 (a), (b) | **C1 and C2 met; (a) NOT MET on all three C3 records** | C1 (white FM): `h_0` 1.776e-19, 1.796e-19, 1.732e-19 against 1.8e-19 (within 4 %). C2 (random-walk FM): `h_-2` 1.448e-29, 1.497e-29, 1.477e-29 against 1.52e-29 (within 5 %). C3 (both): `h_0` within 3 %, but `h_-2` fitted **0** on every record. (b) the card's noise deviation within a factor of 1.35 of the true closed form at every fit point: met on all nine. |
| F2 | **missed: null reference** | the generator called `allantools.noise_id`, which does not exist in 2024.6 (the lag-1 method is `allantools.ci.autocorr_noise_id`), caught the error and wrote `null` for every point, so no point was compared (0 of 0 on all eleven records). A fault of the oracle script, not of the engine. |
| F3 (a), (c) | (a) met; (c) missed in the test | the refusal case for "no frequency noise" was a linear phase ramp; a ramp is not exactly noiseless (its fit has rounding-level coefficients) and the run went ahead with a clock of negligible noise. The case did not realise the registered condition. |
| F4 | met | `runs = 20`: `fitted` present, `measured` absent; `runs = 1`: both |

## Fixes to the harness, then Run 2

Two faults of the harness (not of the engine) were fixed in one commit and the comparison re-run unchanged:
the generator now calls `allantools.ci.autocorr_noise_id` and raises on failure; the refusal case for "no
frequency noise" now uses white phase noise only (seeded), whose fit has `h_0 = h_-1 = h_-2 = 0`, and a second
case, an all-zero record, is refused with "0 stability points" (named cause). The ramp is kept as an observed
behaviour: it is not refused (negligible noise).

| bar | result | numbers |
|---|---|---|
| F2 noise identification vs allantools | **met on ten of eleven records; NOT MET on D2** | equal at every fit point on all nine synthetic records (11 to 13 points each) and on D3 (7 of 7). D2, the 5071A record: 4 of 12 points (0.33). |
| F3 | **met** | the wired run equals the run with the values written literally (both clocks, `fom` bit for bit); the refusals each name their cause |

### The two pinned misses

- **F1(a) on C3: NOT MET, pinned.** The registered truth has random-walk FM at `h_-2 = 1.52e-29` beside white FM
  at `h_0 = 1.8e-19`. Their crossover is at tau = sqrt(3 h_0 / (4 pi^2 h_-2)) = 3.0e4 s, a quarter of the record
  length; at the longest averaging time the fit uses (4096 s, edf of at least 30) random-walk FM is 1.9 % of the
  Allan variance. It cannot be identified, and the card fits zero for it. The truth is real; the design of C3
  made the comparison one the fit cannot pass. Not a defect of the engine; recorded, not loosened. A follow-up
  with an identifiable C3 is registered separately (Addendum 2) and run after it is committed.
- **F2 on D2: NOT MET, pinned.** The engine's conditioning logs and removes one phase step of 1.960272139399993e-8 s
  between the first two samples of D2 before it identifies the noise; allantools was given the raw record. With
  that step removed from the record allantools sees, its exponents equal the engine's at **12 of 12** points
  (`alphas_after_step_removal` in `reference.json`, a diagnostic added after run 1, not a replacement of the bar).
  The difference is the conditioning step the card procedure includes by design.

## Run 3: the C4 records (Addendum 2; records and reference committed before this run)

Generator check for C4 (information, not a bar): allantools `oadev` / theory within 19 % at 1, 8, 64, 512 and
4096 s (largest 1.188 at 4096 s, sampling scatter).

| record | `h_0` fitted (true 1.8e-19) | `h_-2` fitted (true 1.52e-27) | ratio | `h_-1` fitted | drift fitted (1/s) |
|---|---|---|---|---|---|
| C4 seed 20261104 | 1.808e-19 | **0** | 0 | 1.97e-23 | 1.05e-15 |
| C4 seed 20261105 | 1.794e-19 | 1.774e-27 | 1.17 | 0 | 8.76e-16 |
| C4 seed 20261106 | 1.800e-19 | 5.83e-28 | **0.38** | 9.87e-24 | -1.75e-16 |

- **F1(a): NOT MET on two of the three C4 records, pinned.** White FM is recovered within 1 % on all three. Where
  random-walk FM is present in the record the fit gives it, in part or in whole, to flicker FM and to the fitted
  linear drift (the quadratic it removes is the first step of the card procedure): a single realisation of
  random-walk FM has an apparent drift of the same order as its noise at the longest averaging times, and
  flicker FM and random-walk FM are close in shape over the one or two octaves where random-walk FM shows. The
  card's Allan deviation still matches the truth: **F1(b) is met on all twelve synthetic records**.
- **F2: met on all twelve synthetic records and D3; NOT MET on D2 (pinned, 12 of 12 like-for-like).**

What this means for a run, stated in `docs/CLOCK-LOG-FORMATS.md`: the fitted `q_wf` is reliable where white FM
dominates, the split between random-walk FM and flicker FM is not reliable from one record, and a holdover
run driven by the fit reproduces the log's stability over the averaging times of the log but extrapolates
differently beyond them, depending on which of the two the fit chose.

## Verdict

F1(b), F3 and F4 met; F1(a) NOT MET on C3 (unidentifiable by construction) and on two of three C4 records
(random-walk FM absorbed by flicker FM and drift); F2 met on eleven of twelve records plus D3 and NOT MET on D2
as registered (met like-for-like). All misses are pinned by `tests/clock_fit_known_noise.rs`. By the verdict
rule the `fitted` block and the holdover driven by it stay **MODELLED**. No VALIDATED row is added.
