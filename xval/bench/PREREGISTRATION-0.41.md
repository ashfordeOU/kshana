<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D4 (0.41): kshana-bench re-runs (A2, D1, R1), task (a) event-level metrics, task (d) second track

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Numbers marked *proposed* are new; every other number is an existing bar and is not changed.
All bench scores stay MODELLED.

## Why this row

Three bench bars are NOT MET and pinned, and three parts of the spec were left open:

| Item | Record | State |
|---|---|---|
| A2: `agc_k_sigma` AUC >= 0.80 on the task (a) `test` split | [`RESULTS-v2.md`](RESULTS-v2.md) | NOT MET, 0.766 |
| D1: some detector has `optimism_gap > 0.05` on task (d) `test` at scale 0.5 | `RESULTS-v1.md`, `RESULTS-v2.md` | NOT MET, largest 0.0301 |
| R1: `cn0_drop` AUC >= 0.95 (task (b) baseline, carried from `docs/design/DETECTION-ROC.md`) | `DETECTION-ROC.md` | NOT MET, 0.7855; not re-run for the bench |
| Task (a) event-level metrics | `bench/SPEC.md` task (a) | not carried: waited for the Jammertest scorer |
| Task (d) second track (scale 0.25) | [`RESULTS-0.40.md`](RESULTS-0.40.md) | scored as D3, EXPLORATORY (scale chosen after D1 missed), MET |

The 0.40 bars A3, D3, R3 and R4 are not touched. None of them closes A2, D1 or R1, and nothing here does unless the
original bar is met under the conditions below.

## 1. A2 on a new public archive (original bar)

- **Bar:** A2 unchanged: `agc_k_sigma` at the 0.35 defaults, AUC >= **0.80** on the `test` split.
- **What changes:** the data. A2's 2024 split has been seen in full, so a re-run on it would only repeat 0.766. The
  re-run uses a later public archive of u-blox F9-class receiver logs from a Jammertest campaign (2025 or later),
  published with scenario timing that the task (a) truth rule can read. The spec 2.0.0 stratified split rule is applied to
  its evaluable folders, and A2 is scored on that archive's `test` split.
- **Rule:** the archive is named and its SHA-256 pinned at sign-off, before any file of it is opened for this row. If no
  such archive is public at sign-off, A2's re-run is "not run" and A2 stays NOT MET.
- **Meaning:** MET on the new archive would say the AGC statistic reaches 0.80 on an unseen campaign's test folders. The
  2024 result stays recorded beside it; the row says both.

## 2. D1 on a sealed holdout (original bar)

- **Bar:** D1 unchanged: on the held-out corpus at severity scale 0.5, at least one of the five detectors has
  `optimism_gap > 0.05`.
- **What changes:** the corpus. `test` (seed 2000) is deterministic and has been seen; re-running it repeats 0.0301.
  The owner seals a task (d) holdout seed with `kshana bench seal --task d --seed-file <file> --new` and commits only the
  hash to `bench/holdout/COMMITMENTS.json` **before** any 0.41 code touching task (d) is written. The bar is scored once
  on that holdout by the owner or an operator they name, and `reveal-check` confirms the seed.
- **Meaning:** a holdout is a new draw of the same synthetic population. MET would say the benchmark separates an
  optimistic detector at scale 0.5 on that draw; it would not say anything about detectors in the field.

## 3. Task (d) second track on the same holdout (D3 bar, still EXPLORATORY)

- **Bar:** D3 unchanged (`optimism_gap > 0.05` for at least one detector at scale 0.25), scored on the sealed holdout of
  section 2.
- The label stays **EXPLORATORY**: the scale was chosen after D1 missed, and a new draw does not remove that. The holdout
  only removes the chance that the `test` seed was unusual. The second track enters the spec at the next minor version
  only with this caveat in its text.

## 4. Task (b) baseline: R1 re-run, not carried

The bench's task (b) result file changes from `provenance: "carried"` to a re-run. The re-run of R1 is defined once, in
[`docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION.md`](../../docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION.md)
(row `VM-6254a75d`), with R1's bar unchanged. The bench carries that run's numbers and its verdict; it does not score R1
a second time.

## 5. Task (a) event-level metrics (new; scorer bars only)

Task (a) gains the event-level metrics named in the spec (detection latency, missed alarms, false alarms, time to recover
per scheduled test), computed by `kshana jammertest score`. As everywhere in the bench, **no bar says a baseline is good**.
The bars test the scorer path:

| Id | Statement | Bar (*proposed*) |
|---|---|---|
| E1 | Parity: for each baseline and each split of the 2024 archive, the event-level metrics in the bench result file equal those of `kshana jammertest score` run directly on the same folders and thresholds | equal (integers exactly; times and rates within 1e-12 relative) |
| E2 | Hand-computed fixture: a committed synthetic folder of 3 scheduled tests with stated alarm times | every metric equals the hand-computed value in a fixture committed before the scorer is wired into the bench (owner decision 3) |
| E3 | Determinism | two runs give byte-identical result files (S3 extended to the new fields) |

The baseline event-level values are reported with the split they were scored on and no verdict.

## Verdicts

Each section reports on its own. A2 and D1 are recorded as met on re-run only if their original bar is met on the new
data as described; otherwise they stay NOT MET, pinned, with the new number beside the old.

## Owner decisions at sign-off

1. The archive for A2 (name, URL, SHA-256), or accept "not run".
2. Seal the task (d) holdout seed now, before any 0.41 task (d) code.
3. The E1 to E3 scorer bars; the hand-computed fixture is written and committed with the sign-off commit's successor,
   before the scorer is wired into the bench.

## Sign-off (3 November 2026)

The task (d) holdout seed is sealed before any task (d) code. A2 is "not run" unless the archive is pinned before scoring.
