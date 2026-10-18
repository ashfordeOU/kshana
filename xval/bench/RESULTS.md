# Results: kshana-bench v1 baselines

The pre-registration is `PREREGISTRATION.md` in this directory, committed alone in 4e1a0ed before `kshana
bench` existed. This is the first and only scored run of the baselines (2026-10-18). No bar, split or setting
was changed after a result was seen. Every figure is MODELLED; no external oracle agrees with a bench score.
The bars are pinned by `tests/bench_baselines.rs` (task a is data-gated by `KSHANA_JAMMERTEST_DIR`).

Command (no network, no data): `kshana bench baseline --task <c|d> --split <dev|test> --out <dir>`. The result
files are in `bench/results/`.

## Scorer correctness (S1 to S5): all met

| bar | measured | verdict |
|---|---|---|
| S1 chance | AUC of seeded random scores within [0.45, 0.55] (n = 2,000 + 2,000) | MET (unit test) |
| S2 perfect | AUC 1.0; task (d) gap 0.0 | MET (unit tests) |
| S3 determinism | two baseline runs byte-identical | MET (`s3_a_baseline_run_is_byte_identical_twice`) |
| S4 holdout commitment | `seal` pure; `reveal-check` rejects a one-byte change and a different task | MET (unit test) |
| S5 reuse | bench `auc_in` equals `impairment_eval::evaluate().auc` for all five detectors, to 1e-12 | MET (unit test) |

## Task (c), holdover: bars C1 to C3 met

Test split (4 satellites, 104 cases), RMSE of the predicted phase change since the origin, ns:

| baseline | 300 s | 900 s | 3600 s | 7200 s |
|---|---|---|---|---|
| `hold` | 2.050 | 6.147 | 24.612 | 49.314 |
| `linear` | 0.023 | 0.050 | 0.162 | 0.243 |
| `quadratic` | 0.024 | 0.053 | 0.183 | 0.290 |

| bar | measured | verdict |
|---|---|---|
| C1 `linear` beats `hold` at 3600 s on test | 0.162 against 24.612 ns | MET |
| C2 `quadratic` does not beat `linear` at 7200 s on test | 0.290 against 0.243 ns | MET (the registered expectation) |
| C3 every RMSE finite on test | yes, 104 cases per baseline | MET |

The dev split (4 other satellites) shows the same ordering: `hold` 26.876, `linear` 0.128, `quadratic` 0.135 ns at
3600 s. What this says: over a 24 h window the clocks' frequency offset dominates, and a straight line through it
predicts the next two hours to a fraction of a nanosecond on 300 s decimated IGS clocks. It says nothing about a
clock in holdover after losing GNSS (the IGS series is steered, and the clock type is not stated).

## Task (d), optimism gap: D2 met, **D1 NOT MET**

Test split, severity scale 0.5, 1,000 cases in and 1,000 out per detector:

| detector | AUC in | AUC out | gap | flag (> 0.05) |
|---|---|---|---|---|
| `energy(cn0-drop)` | 0.595 | 0.565 | 0.030 | no |
| `agc-excess` | 0.848 | 0.819 | 0.030 | no |
| `sqm-imbalance` | 0.882 | 0.882 | 0.001 | no |
| `raim-parity` | 0.682 | 0.672 | 0.010 | no |
| `fused(max-z)` | 0.998 | 0.983 | 0.015 | no |

| bar | measured | verdict |
|---|---|---|
| D1 at least one detector has gap > 0.05 on test at scale 0.5 | largest gap 0.0301 (`energy`) | **NOT MET** |
| D2 every `auc_in` in [0.5, 1.0] on test | 0.595 to 0.998 | MET |

D1 was registered as "the benchmark can tell an optimistic detector from a robust one". On this corpus at scale 0.5
it cannot: every transparent baseline degrades by at most 0.03 when impairment severities are halved. That is a
property of this corpus (a separability and pipeline check, as `impairment_eval` states), not a finding about
detectors in the field. The bar is not loosened. The second track (scale 0.25) is defined in the spec but not scored
here, because choosing it after D1 missed would be a post-hoc search for a result; a later spec minor version may
register it with its own bar. The miss is pinned by `d1_is_not_met_no_detector_exceeds_the_optimism_tolerance_on_the_test_split`,
which fails if the measured gap ever exceeds 0.05, so a change in the corpus is noticed.

## Task (b), IQ: carried, not re-run

The baseline is the recorded R1 result of `docs/design/DETECTION-ROC.md` (`cn0_drop` AUC 0.7855, bar R1 **NOT
MET**), carried into the result file with `provenance: "carried"`. Nothing was re-run for bench v1.

## Sealed holdout of task (d)

The commitment is in `bench/holdout/COMMITMENTS.json`. The seed was generated on 2026-10-18 and handed to the
coordinator for the owner; it is not in this repository. The baselines were scored once on the sealed holdout
(see `bench/results/d-holdout-*.result.json`), by the maintainers, as the operator the spec allows; those scores
carry no bar.
