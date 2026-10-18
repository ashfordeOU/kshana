# kshana-bench: specification, version 1.0.0

**Licence of this document and of `bench/manifests/`: CC-BY-4.0 (text) and CC0 (manifests) proposed, owner decision pending.**
Until the owner decides, treat both as "all rights reserved by Ashforde OÜ, no licence granted".
The metric and baseline code is part of Kshana and is AGPL-3.0-only.

Advisory statement: Kshana results are modelled or measured against stated references. They are advisory,
not an approval, a certification or a statement of conformance, and a score describes a log or a corpus,
never a product.

## 1. What this is

A fixed set of tasks, splits and metrics for GNSS interference detection and timing holdover, so that
results from different methods can be compared. A submission is a **file**; nothing runs on the
submitter's behalf. `kshana bench score` turns a submission and a split's truth into a result file
(`kshana-bench-result/1`); `kshana bench leaderboard` renders result files into a static page.

What it is not: a proof that a method works in the field, a certification, or a ranking of products. Every
score here is MODELLED unless a row says an external oracle agreed. The tasks use recorded or synthetic
data stated in section 3.

## 2. Versioning

`SPEC_VERSION` is `kshana-bench/1.0.0`. A change to a metric, a split rule or a truth rule is a new major
version, and results from different major versions are never put in one table. Adding a baseline, a manifest
entry or a task is a minor version. A result file carries the spec version it was scored under.

## 3. Tasks

Every task defines a **unit**, a **submission**, **truth**, **metrics**, **splits** and **baselines**. A higher
score always means "more likely impaired" (tasks a, b, d).

### Task (a): detection on receiver logs

- **Data:** JammerTest 2024 (u-blox ZED-F9P logs), Zenodo 10.5281/zenodo.15911589, fetched by script,
  hash pinned (`bench/manifests/a-jammertest2024.json`). Licence and handling: `bench/LICENCES.md`.
- **Unit:** one epoch (1 s bin) after the 60 s calibration, in one scenario folder. Id: `<folder path>#<n>`,
  `n` the index of the epoch among the folder's labelled epochs, in time order.
- **Truth:** the rules of `xval/jammertest-trust/PREREGISTRATION.md`, unchanged and implemented once in
  `receiver_trust::calibration`: windows from `scenario.json`, shifted by -2 h, a 60 s guard,
  clean epochs more than the guard outside every window, jamming epochs inside a window of a folder whose
  attack type includes jamming, spoofing and meaconing epochs reported but not scored, folders whose
  calibration window touches an attack window excluded. The windows are the **scheduled** slots, so a
  detection probability is a lower bound.
- **Submission:** `kshana-bench-predictions/1` with one `score` per epoch id.
- **Metrics:** AUC (Mann-Whitney, ties half), the detection probability at the empirical threshold that
  gives a false-alarm probability of at most 0.01 on the same split (an upper bound, labelled as such), and,
  when the submission states a `threshold`, `P_fa` and `P_d` at it. The event-level metrics (detection
  latency, missed alarms, false alarms, time to recover per scheduled test) come from the Jammertest scorer
  of `kshana jammertest score`; `kshana bench` carries them once that command is merged and the spec
  minor version is raised.
- **Splits:** `dev`, `test`, `holdout` by the rule in section 4 over the evaluable folders.
- **Baselines:** the three receiver-trust monitor statistics (`cn0_drop_db`, `agc_k_sigma`,
  `jam_ind_threshold`) at the 0.35 defaults.

### Task (b): detection on IQ

- **Data:** two sources. (1) Kshana synthetic GPS L1 C/A scenes with stated attenuation events, defined by
  the recipe of `tests/iq_campaign_roc.rs` (no interference waveform is synthesised). (2) TEXBAT, **reference
  only**, for users who hold the files from UT themselves; no hash is pinned (see `bench/LICENCES.md`).
- **Unit:** one scored window of `roc_window_s` seconds of one scene, id `<scene>/<window>`.
- **Metrics:** AUC per alarm kind and the operating point at a declared threshold, as `iq campaign` already
  reports in `roc.json`.
- **Baseline:** the IQ monitors of the open core. The score recorded in `docs/design/DETECTION-ROC.md`
  (`cn0_drop` AUC 0.7855, bar R1 **NOT MET**) is the baseline, **carried from that record, not re-run for
  bench v1**. The result file says so (`provenance: "carried"`).
- **Splits:** the recipe has fixed seeds; `dev` and `test` are named in the manifest. No sealed holdout is
  defined for (b) in v1 because the scenes are regenerated from public code and a hidden set would need a
  hidden seed (section 4).

### Task (c): timing holdover prediction

- **Data:** IGS final 30 s combined clocks of 11 GPS Block IIF satellites, 2025-08-17 to 2025-08-30,
  decimated to 300 s (`tests/fixtures/clock_state_igs_holdout_oracle/clocks.txt`, SHA-256
  `3da6d0a5a7facdc1e564fdeed5f5ada890a2f9cdab6a218fa79a83608a3230a4`; the 30 s source is fetched by
  `scripts/fetch_igs_clocks.sh`). The IGS clock type is not stated by the files and is not claimed.
- **Unit:** a (satellite, origin) pair. Origins are every 12 h from 24 h to 13 d 22 h (26 per satellite).
  The input is the 288 phase samples (24 h at 300 s) up to and including the origin; the task is to predict
  the phase change since the origin at the horizons 300, 900, 3600 and 7200 s.
- **Truth:** the measured phase at origin + horizon minus the phase at the origin, in ns.
- **Submission:** `kshana-bench-predictions/1` with `pred_ns` per horizon per case.
- **Metrics:** RMSE, mean absolute error and bias per horizon, in ns. **Primary: RMSE at 3600 s.**
- **Splits:** by satellite: `dev` G03 G06 G08 G09; `test` G10 G24 G25 G26; `holdout` G27 G30 G32.
- **Baselines:** `hold` (no change), `linear` (least-squares line over the 24 h, extrapolated),
  `quadratic` (least-squares quadratic, extrapolated).

### Task (d): out-of-distribution optimism gap

- **Data:** the synthetic parameter-grounded corpus of `impairment-eval` (`impairment_eval::generate_corpus`),
  an **in-distribution** corpus at severity 1.0 and an **out-of-distribution** corpus with every impairment
  severity scaled (0.5 by default, 0.25 as a second track). Labels are model-derived, and every result says so.
- **Unit:** a case. Id `<split>/<corpus>/<n>`. The cases file has the five measurement-domain observables and
  no label; the labels file has the label and the class.
- **Metrics:** `auc_in`, `auc_out`, `optimism_gap = auc_in - auc_out`, and `optimistic = gap > 0.05`.
- **Splits:** `dev` seeds 1000 (in) and 1000 (out); `test` seed 2000; `holdout` sealed (section 4).
- **Baselines:** the five transparent detectors of `impairment_eval` (`energy`, `agc`, `sqm`, `parity`,
  `fused`).

## 4. Splits and the sealed holdout

**Real-data splits (a).** A scenario folder goes to `dev`, `test` or `holdout` by
`b = u64 from the first 8 bytes of SHA-256(folder path as a UTF-8 string), big-endian, modulo 10`: `0..=5`
dev, `6..=7` test, `8..=9` holdout. The rule is fixed in this spec and was applied before any submission
was scored. **Limit, stated plainly:** the real-data holdout is not secret, because anyone who downloads the
dataset has its folders. It protects against selecting a split after seeing scores. It does not protect
against a method tuned on those folders. Do not read a holdout score on a real-data task as unseen-data
performance unless the method's author states the folders were never used.

**Synthetic splits (b, d).** A holdout can be sealed by commit and reveal. The owner picks a secret seed `s`,
publishes `SHA-256("kshana-bench/holdout/1" || task || s)` (`kshana bench seal`), keeps `s`, and scores
submissions with the corpus regenerated from `s`. After the leaderboard round, `s` is revealed and
`kshana bench reveal-check` confirms it matches. The holdout commitment for this release is listed in
`bench/holdout/COMMITMENTS.json`; **the seed is not in this repository.**

**Leaderboard hygiene.** A result states the split it was scored on. The `holdout` column is filled only by
the owner or an operator they name. One method, one holdout evaluation per round.

## 5. Result file

`kshana-bench-result/1`, written by `kshana bench score` and `kshana bench baseline`:
`schema`, `spec_version`, `task`, `split`, `system` (`name`, `version`, optional `url`), `provenance`
(`"scored"` or `"carried"` with the source), `truth_sha256` (SHA-256 of the truth file scored against),
`predictions_sha256`, `metrics` (the task's metrics), `label` (MODELLED or measured, and what the truth is),
`notice` (the advisory statement). The JSON schema is `bench/schema/result.schema.json`; `kshana bench
validate` checks a file against the rules it encodes.

## 6. Pre-registration

Any baseline that claims a number has its bars in `xval/bench/PREREGISTRATION.md`, committed before the scored
run. A bar is never loosened after a run. A miss is recorded as NOT MET and pinned by a test that asserts the
miss.

## 7. What a leaderboard row may and may not say

A row says: "this file scored X on split S under spec V". It does not mean any product has been rated or approved
by anyone, and no organisation is named as an endorser. Names on the page are the names the
submitter gave their system.
