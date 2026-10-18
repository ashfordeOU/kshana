# kshana-bench

An open set of tasks, splits and metrics for GNSS interference detection and timing holdover. The
specification is [`bench/SPEC.md`](../bench/SPEC.md) (version 1.0.0; licence of the text and manifests:
CC-BY-4.0 / CC0 proposed, owner decision pending). The dataset licence review is
[`bench/LICENCES.md`](../bench/LICENCES.md). The baselines' bars were fixed before the first scored run in
[`xval/bench/PREREGISTRATION.md`](../xval/bench/PREREGISTRATION.md) and their results are in
[`xval/bench/RESULTS.md`](../xval/bench/RESULTS.md).

What it is: a way to compare methods on the same data with the same metric code. What it is not: a ranking of products, an approval, or evidence that a method works in the field. Every score is MODELLED,
and a score describes a log or a corpus, never a product. Kshana results are advisory.

## Tasks

| Task | Unit | Data | Primary metric |
|---|---|---|---|
| (a) detection on receiver logs | one epoch of a JammerTest 2024 log | fetched by `scripts/fetch_jammertest2024.sh` (GPL-3.0+, never vendored) | AUC |
| (b) detection on IQ | one scored window of a scene | Kshana synthetic scene recipe; TEXBAT reference-only | AUC per alarm kind |
| (c) timing holdover prediction | (satellite, origin) | IGS clocks at 300 s (committed extract, pinned hash) | RMSE at 3600 s |
| (d) out-of-distribution optimism gap | one synthetic case | `impairment-eval` corpus, in and out of distribution | AUC out, and the gap |

## Commands

```text
kshana bench spec
kshana bench cases --task d --split test --scale 0.5 --out cases/        # cases.json + truth.json
kshana bench cases --task c --split test --out cases/
kshana bench truth --task a --data <extracted JammerTest 2024> --split test --out truth.json
kshana bench score --truth truth.json --predictions my-scores.json --out my.result.json
kshana bench baseline --task d --split test --out results/               # the built-in baselines
kshana bench validate results/*.result.json
kshana bench leaderboard results/ --out bench/site/index.html
kshana bench seal --task d --seed-file secret.txt                        # commit to a sealed holdout
kshana bench reveal-check --task d --seed-file secret.txt --commitment <hex>
kshana bench manifest --task a --data <extracted dir> --out manifest.json
kshana bench verify-manifest manifest.json --root <dir>
```

A submission is a file (`kshana-bench-predictions/1`): `scores` (one number per case id; higher is more
likely impaired) for tasks a, b and d, or `predictions` (the phase change in ns at each horizon) for task c. A
result file (`kshana-bench-result/1`) names the spec version, the split, the SHA-256 of the truth and of the
predictions, and the metrics. Results of different major spec versions are never put in one table.

## Honest limits

- The real-data holdouts (a and c) are public, because anyone can download the data. They guard against
  choosing a split after seeing scores, not against tuning on those folders. The sealed holdout of task (d) is
  a commit and reveal: the hash is in `bench/holdout/COMMITMENTS.json`, the seed is held by the owner.
- Task (a) truth is the scheduled attack slots of the event logs at one-minute resolution, so a detection
  probability is a lower bound; the event-level metrics (latency, missed alarms, false alarms) arrive with the
  Jammertest scorer of `kshana jammertest score`.
- The IQ baseline of task (b) is carried from `docs/design/DETECTION-ROC.md`, not re-run for v1.
- The corpus of task (d) is a separability and pipeline check; an AUC on it is an AUC over model-derived labels.
