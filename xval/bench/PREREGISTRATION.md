# Pre-registration: kshana-bench v1 baselines and scorer

Committed alone, before `kshana bench` exists and before any baseline was scored. The bars below
are fixed now. They may be tightened later, never loosened. A miss is recorded as NOT MET with its
numbers and pinned by a test that asserts the miss.

Spec: `bench/SPEC.md` (version 1.0.0). Everything here is MODELLED: no external oracle agrees with
a bench score, and no bar below promotes a ledger row.

## What was seen before this was written (disclosed)

- The recorded results of `xval/jammertest-trust/RESULTS.md`, including the pooled AUC of the three
  receiver-trust statistics on the 14 evaluable JammerTest 2024 folders (0.778, 0.933, 0.678). Bars A1
  and A2 are set knowing them; A1 tests that the bench reproduces them, A2 is a loose floor.
- The verdict text of `tests/clock_state_igs_holdout_oracle.rs` and the file format of the 300 s clock
  fixture. No extrapolation error on it has been computed.
- The documentation of `impairment_eval` and the signatures of its API. No AUC of its detectors on the
  seeds used here (1000, 2000) has been computed. Its tests use other seeds and were not read for numbers.
- The R1/R2 record of `docs/design/DETECTION-ROC.md` (the IQ baseline for task b is carried from it).

## Bars

**Scorer correctness (deterministic, no data).**

- **S1 chance:** scores drawn independently of the labels (ChaCha8, seed 7, 2,000 positive and 2,000
  negative cases) have AUC within [0.45, 0.55].
- **S2 perfect:** scores equal to the label give AUC 1.0 and, for the task (d) gap, a gap of 0.0.
- **S3 determinism:** two runs of the same `bench baseline` command give byte-identical result files.
- **S4 holdout commitment:** `reveal-check` accepts the seed that was sealed and rejects the same seed
  with one byte changed, and `seal` is a pure function of (task, seed).
- **S5 reuse:** for each of the five detectors on the dev corpus of task (d), the bench `auc_in` equals
  `impairment_eval::evaluate(...).auc` for the same corpus to within 1e-12.

**Task (a), receiver logs (data-gated: needs the JammerTest 2024 archive).**

- **A1 reproduction:** the bench pooled AUC over all evaluable folders for `cn0_drop_db`, `agc_k_sigma`
  and `jam_ind_threshold` equals the recorded 0.778, 0.933, 0.678 to within 0.0005 each (the record rounds
  to 3 decimals).
- **A2 floor on the test split:** `agc_k_sigma` AUC >= 0.80 on the `test` split.

**Task (c), holdover (no data fetch: the committed 300 s fixture).**

- **C1:** on `test`, `linear` has a lower RMSE at 3600 s than `hold`.
- **C2:** on `test`, `quadratic` does **not** have a lower RMSE at 7200 s than `linear` (the registered
  expectation is that a quadratic term amplifies noise over a 24 h window).
- **C3:** every baseline's RMSE at every horizon on `test` is finite.

**Task (d), optimism gap (no data).**

- **D1:** on `test` at severity scale 0.5, at least one of the five detectors has `optimism_gap > 0.05`
  (the benchmark can tell an optimistic detector from a robust one).
- **D2:** on `test`, every detector's `auc_in` lies in [0.5, 1.0].

## Not claimed

No bar asserts that a baseline is good. The corpus of (d) is a separability and pipeline check, as
`impairment_eval` states; the real-data holdout of (a) is not secret (`SPEC.md` section 4); the IQ baseline
of (b) is carried, not re-run.
