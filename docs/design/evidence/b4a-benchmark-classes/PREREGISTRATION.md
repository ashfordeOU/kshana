<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B4a (0.41): a multi-class benchmark task for jamming, spoofing and meaconing

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any
implementing code or data.** Numbers marked *proposed* are for the owner to fix at sign-off. After sign-off the bars may
be tightened after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers and pinned by a test that
asserts the miss. Public sources only. Advisory software, not certified navigation equipment.

## Why this row

kshana-bench (`bench/SPEC.md`, v2.0.0) scores **binary** detection: task (a) on receiver logs, task (b) on IQ, task (d)
on a synthetic corpus. A monitoring network's operator needs a different answer: not only "is something wrong" but
"which kind of interference is it": broadband or narrowband jamming, spoofing (a counterfeit signal), or meaconing (a
re-broadcast of the real signal). B4a adds a multi-class task, task (e), with its truth, metrics and splits fixed now,
and pre-registers the bars of the open-core baseline on it. Natural confounders (scintillation, solar radio bursts,
multipath, obstruction) are B4b and get their own pre-registration once this task exists.

## 1. Classes

`nominal`, `jamming`, `spoofing`, `meaconing`. Each unit has exactly one true class. Units whose class cannot be stated
from the published labels are excluded and counted.

## 2. Data (public sources only, never vendored)

| Source | Licence and handling | Units | Classes it supplies |
|---|---|---|---|
| **Jammertest 2024 dataset**, Zenodo record 15911589, https://zenodo.org/records/15911589, `GNSS_DATASET_JAMMING_SPOOFING.tar.gz`, SHA-256 `73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313` (already pinned) | GPL-3.0-or-later; fetched by `xval/oracles/setup.sh`, extracted outside the repository; only per-unit ids, hashes and labels go in a manifest (`bench/LICENCES.md`) | 1 s epochs after calibration, per folder | `nominal` (clean epochs), `jamming`, `spoofing`, `meaconing` |
| **TEXBAT**, https://radionavlab.ae.utexas.edu/texbat | Research use permitted, redistribution requested not to happen; no standard licence (`bench/LICENCES.md`). The user fetches the files; the bench never distributes them. The first fetch pins SHA-256 per file in a manifest revision **before** any score on them | 10 s windows (*proposed*) of raw IQ, from the start of each recording plus every 10 s to the end of the first 300 s | `nominal` (clean static and dynamic recordings), `spoofing` (each spoofing scenario) |
| **OAKBAT**, https://doi.ccs.ornl.gov (landing page via the bench licence review) | Licence not stated; **excluded** until the owner obtains and cites terms (`bench/LICENCES.md`, open item 2) | — | — |

Jammertest editions after 2024 enter only through a new dataset with a stated public licence and an amendment to this
file committed before that data is read.

**Labels.**

- *Jammertest 2024:* the truth rules of task (a) (`xval/jammertest-trust/PREREGISTRATION.md`, implemented in
  `receiver_trust::calibration`): windows from each folder's `scenario.json` shifted by −2 h, 60 s guard, folders whose
  calibration window touches a window excluded. Within a window the class is read from the folder's `attack_type` (the dataset's own field name)
  string: contains "Meaconing" → `meaconing`; else contains "Spoofing" → `spoofing`; else contains "Jamming" →
  `jamming`. A folder whose `attack_type` names both spoofing and jamming is labelled `spoofing` for its windows, and the
  number of such epochs is reported (the class is mixed and is disclosed, not hidden). Outside windows and guard:
  `nominal`. Windows are scheduled slots at one-minute resolution, so labels near a slot edge may be wrong.
- *TEXBAT:* the recording's published scenario name: clean recordings → `nominal`; every spoofing scenario → `spoofing`
  for all windows after the scenario's published spoofing onset, and `nominal` before it. Windows that straddle the
  onset are excluded.

## 3. Task (e): definition

- **Submission:** `kshana-bench-predictions/1` extended with one class label and four class scores (summing to 1, or any
  monotone scores; only the label and the ranking of each score are used) per unit.
- **Metrics** (pooled per source; sources are never pooled together):
  - confusion matrix `M[a][b]` = units of true class `a` labelled `b`;
  - per-class recall `R_a = M[a][a] / Σ_b M[a][b]`, precision `P_b = M[b][b] / Σ_a M[a][b]`;
  - **balanced accuracy** `BA = mean_a R_a` over the classes present in the split;
  - **macro-F1** `= mean_a 2·P_a·R_a / (P_a + R_a)` over present classes (0 where undefined);
  - per-class one-vs-rest **AUC** of that class's score (rank statistic, ties counted half, as in task (a));
  - **interference-type confusion**: the share of `jamming` units labelled `spoofing` or `meaconing`, and of
    `spoofing` + `meaconing` units labelled `jamming`.
- **Event-level** (Jammertest only): per window, the majority label over its epochs, and its confusion matrix.
- **Splits:** the deterministic folder rule of `bench/SPEC.md` §4, applied per class stratum (folders sorted by the
  SHA-256 of the path; first quarter `holdout`, next quarter `test`, rest `dev`). TEXBAT by recording, the same rule.
  As SPEC §4 states, a real-data holdout is not secret.
- **Minimum data:** a class enters BA, macro-F1 and the bars only with at least **2 folders (or recordings) and 300 units**
  in the scored split (*proposed*); otherwise it is reported with "below minimum".

## 4. Baselines (fixed now)

- **B-log** (Jammertest): the shipped receiver-trust monitors at the 0.35 defaults (not the `jammertest-2024` profile,
  which was fitted on these folders), mapped by a rule written now: no alarm → `nominal`; only measurement-domain
  alarms (C/N0 drop, AGC, jamming indicator, loss of lock) → `jamming`; any fix-domain alarm (RAIM, clock, position
  jump, solve failure) with the AGC within baseline → `spoofing`; a clock alarm whose step is within 1 µs of a constant
  delay with no position jump → `meaconing`; any other combination → `jamming`. Scores: the monitor statistics
  normalised by their thresholds, maximum per class group.
- **B-iq** (TEXBAT): the open-core IQ path of `examples/texbat_probe.rs` (software receiver front end, SQM and prompt
  power statistics) with a fixed threshold rule written into the baseline config before the run.

## 5. Bars (*proposed*)

| Id | Bar |
|---|---|
| E1 scorer exactness | On a synthetic predictions file covering every class and tie pattern, the scorer's confusion counts equal an independent numpy script's exactly; BA, macro-F1 and every AUC within **1e-12** |
| E2 truth reproducibility | Regenerating the truth file from the pinned archive gives the same SHA-256 on Linux, macOS and Windows |
| E3 B-log jamming | On the Jammertest `test` split: one-vs-rest AUC of `jamming` **≥ 0.80**, and jamming recall **≥ 0.60** |
| E4 B-log interference type | On the Jammertest `test` split, share of `spoofing` + `meaconing` epochs labelled `jamming` **≤ 0.50** |
| E5 B-iq spoofing | On the TEXBAT `test` split: one-vs-rest AUC of `spoofing` **≥ 0.70** |
| E6 balanced accuracy | B-log on the Jammertest `test` split: BA over present classes **≥ 0.40** (four-class chance is 0.25) |

E1 and E2 decide whether the task ships. E3 to E6 are bars on the baseline; a miss on any of them is published as the
baseline's score, it does not block the task.

## What was seen before this file (disclosed)

- The whole Jammertest 2024 dataset has been used before: receiver-trust calibration (`xval/jammertest-trust/RESULTS.md`:
  pooled AGC monitor AUC 0.933, C/N0 drop 0.778, jamming indicator 0.678 for jamming vs clean; spoofing and meaconing
  epochs reported only), the schedule scorer (`xval/jammertest-score/`, minimum data not met in v1 or v2), and task (a)
  (`bench/results/`, e.g. AGC statistic AUC 0.766 on `test`). E3 to E6 are **not blind** to those numbers; they were not
  derived from them. No multi-class label, confusion matrix or class-mapping rule has been computed on any data.
- Previous records state that the Jammertest 2024 spoofing and meaconing transmissions were received at high power and
  were seen by measurement-domain monitors as interference; E4 is set knowing that a power-based baseline is expected
  to confuse them with jamming.
- TEXBAT: no hash has been pinned and no score is recorded in this repository.

## What a MET and a NOT MET mean

- **MET on E1, E2** means task (e) is defined and scored exactly as stated and can carry leaderboard rows.
- **MET on E3 to E6** means the open-core baseline separates the classes on these public sets to the stated degree.
  It does not mean it classifies a low-power spoofer, a meaconer of a different kind, or interference at another site.
  Sample sizes are small (a handful of folders per split); a score is the behaviour of a few events.
- **NOT MET** on E3 to E6 is the baseline's published score; it sets the bar a better method has to beat.

## Out of scope

Natural confounders (B4b); OAKBAT until its terms are cited; Jammertest editions after 2024 until amended; source
location; waveform identification within a class; any rating of a product.

## Open questions for sign-off

1. OAKBAT: obtain terms, or leave the task with Jammertest and TEXBAT only.
2. The label of folders whose `attack_type` names both spoofing and jamming (this draft: `spoofing`).
3. The minimum-data rule (2 folders, 300 units) and whether the `meaconing` class has enough folders to enter at all;
   if not, the task is three-class in practice and says so.
4. The B-log class-mapping rule, especially the `meaconing` branch, which has no prior evidence behind it.
