<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B4a, kshana-bench task (e): readings and oracle

The pre-registration is `docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION.md`, signed off on 3 November
2026. This directory holds the readings fixed here **before any engine code and before any class label, confusion
matrix or score is computed**. It also holds the independent scorer `oracle.py` (numpy only, sharing no code with
the engine) and the generator of the synthetic predictions file for bar E1 (`make_e1.py`).

## What was looked at before these readings (disclosed)

All of it was done on 8 November 2026, on the archive fetched from Zenodo record 15911589. SHA-256
`73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313` matches the pinned value. The archive was extracted
outside the repository.

- The list of the 24 folders, with each folder's `attack_type` and the number of `attack_log` entries:
  - 4 folders `Spoofing + Jamming`, 7 `Jamming`, 5 `Meaconing`, 8 `Spoofing`;
  - the 5 meaconing folders' logs hold 4 + 2 + 4 + 2 + 2 = 14 `attack_log` entries, which is 7 windows (a start
    and an end each).
- The column headers of `rinex.csv`, `mon_rf.csv` and `nav_pvt.csv`.
- Per folder, the count of `nav_pvt.csv` rows by `fixType`, and the minimum and maximum of `lat` and `lon`. This was
  done to fix the unit of those columns (reading 3).
  - It showed that some stationary spoofing folders report positions kilometres from the antenna. That is the
    forced-position effect the spoofing class is expected to have; it was known from the published campaign plan.
  - No epoch was labelled, no monitor was run and no statistic was computed against any label.
- The per-class evaluable-folder counts come from the published task (a) record
  (`xval/jammertest-trust/RESULTS.md`: 14 of 24 evaluable; the 10 exclusions are named there).

## Readings fixed before the engine code

1. **Unit.** A unit is one 1 s epoch of the task (a) timeline of an evaluable folder (`receiver_trust::calibration`,
   CSV pipeline: `mon_rf.csv` and `rinex.csv` in 1 s bins of the UTC stamp). Epochs inside the 60 s calibration window
   are not units. The evaluable folders are those of task (a), by the same exclusion rule. The unit id is
   `<folder path>#<n>`, as in task (a); the folder path always uses `/` as its separator, whatever the platform
   (E2 needs the same bytes on Windows).
2. **Label.** Each epoch gets a label from task (a)'s window rule:
   - **guard:** within 60 s of a window edge; the epoch is excluded, and the count of excluded epochs is reported per
     folder;
   - **inside a window:** the class comes from `attack_type`, lower-cased:
     - contains `meaconing` → `meaconing`;
     - else contains `spoofing` → `spoofing`;
     - else contains `jamming` → `jamming`;
   - **outside every window and guard:** `nominal`.

   The `Spoofing + Jamming` epochs are labelled `spoofing`, and their count is reported as `mixed_spoofing_jamming`.
3. **Reported fix** (for the position monitor). Fixes come from `nav_pvt.csv` rows with `fixType` 2, 3 or 4, the
   same rule as the UBX reader (`ingest.rs`, `nav_pvt`).
   - **Units.** The `lat` and `lon` columns hold degrees × 1e-7, so `lat_deg = 1e7 × lat`. This was checked on every
     folder against the published site (Andøya, 69.1° to 69.4° N, 15.7° to 16.1° E); an unscaled reading would put
     every fix within a metre of (0°, 0°).
   - **Binning.** Rows are binned to the timeline's 1 s UTC bins by `real_time`; with several rows in a bin, the last
     one is used.
4. **Class strata and splits.** A folder's stratum is the class that reading 2 gives its windows: `jamming`,
   `spoofing` (including `Spoofing + Jamming`) or `meaconing`.
   - The `bench/SPEC.md` §4 rule is applied within each stratum: sort by SHA-256 of the path; the first
     `max(1, round(n/4))` are `holdout`, the next `max(1, round(n/4))` are `test`, the rest are `dev`; rounding is
     half up.
   - `nominal` units come from every folder, in that folder's split.
   - From the published counts (3 jamming, 7 spoofing, 4 meaconing evaluable folders), the expected `test` split is
     1 jamming folder, 2 spoofing folders and 1 meaconing folder. Stated in advance: on `test`, only `nominal` and
     `spoofing` can meet the minimum-data rule (reading 6). The truth run confirms or corrects this count; the rule
     does not change.
5. **Event.** An event is one attack window (a start and its end) of an evaluable folder.
   - Meaconing has at most 7 windows in the whole dataset, fewer than the 20 the sign-off requires. So meaconing is
     reported descriptively in every split, and no bar applies to it.
6. **Minimum data**, per class and split. A class enters BA, macro-F1 and the bars only when the split has at least
   2 folders contributing at least one unit of that class, and at least 300 units of it, and (for meaconing) the
   20-event rule holds.
   - Every metric is also reported over all present classes, labelled "descriptive".
7. **BA and macro-F1** are taken over the entered classes. Recall and precision use the full confusion matrix, in
   which every predicted label counts, entered or not.
   - **E6, tightened before the run.** The pre-registered bar 0.40 is 1.6 times four-class chance. With `k` entered
     classes, E6 compares BA with `max(0.40, 1.6/k)` (0.80 for `k = 2`, 0.533 for `k = 3`, 0.40 for `k = 4`).
     Tightening is allowed; loosening is not.
   - With fewer than 2 entered classes, BA is not defined.
8. **A bar that cannot be scored is NOT MET.** This covers a class below the minimum, an undefined AUC, or missing data. The reason is written beside it, and it
   is never left out.
   - **E3:** jamming must enter the Jammertest `test` split.
   - **E4:** pools the epochs of whichever of `spoofing` and `meaconing` enter; if neither enters, E4 is NOT MET.
   - **E5:** see reading 13.
9. **B-log, the monitors.** `run_monitors` with `MonitorConfig::default()` on the folder timeline, plus the reported fix
   of reading 3.
   - **Not run:** RAIM, Clock and SolveFailure. The dataset carries no broadcast navigation message, and section 2 lists no outside
     navigation source; adding one would be a data source the pre-registration does not name.
   - **PositionJump** runs on `stationary` folders only (from the folder path). The monitor's own documentation says
     its distance from the calibration mean is wrong on a moving antenna. As a descriptive variant only, B-log is
     also reported with PositionJump on every folder.
   - **Consequence, stated in advance:** the clock alarm never fires, so the `meaconing` branch of the mapping
     never fires, and B-log never predicts `meaconing`.
10. **B-log, the mapping.** The rule from section 4, applied per epoch to the alarms of `EpochTrust.alarms`:
    - **measurement-domain alarms** (M): Cn0Drop, Agc, JamInd, LossOfLock;
    - **fix-domain alarms** (F): Raim, Clock, PositionJump, SolveFailure;
    - **AGC within baseline:** Agc not in the epoch's alarms.

    The rule:
    1. no alarm → `nominal`;
    2. M only → `jamming`;
    3. a Clock alarm, no PositionJump, and the clock step within 1 µs of a constant delay → `meaconing` (cannot fire,
       reading 9);
    4. any F alarm with AGC within baseline → `spoofing`;
    5. anything else → `jamming`.
11. **B-log, the scores.** Each statistic is normalised by its threshold; `lost = tracked_median − n_sats`.
    - `jamming` = max of `cn0_drop_db/6`, `|agc_z|/5`, `jam_ind/80`, `lost/4`, over those defined.
    - `spoofing` = `position_offset_m/50` where PositionJump runs.
    - `meaconing` = undefined.
    - `nominal` = −(max of every defined normalised statistic above).

    An undefined score is written as −1e300, which ranks below every real value; undefined scores tie with one
    another. The label comes from the mapping (reading 10), not from the largest score.
12. **Metrics.**
    - **Confusion matrix and recall/precision:** per section 3.
    - **AUC:** one-vs-rest, Mann-Whitney with ties counted half. It is undefined when the class has no positive or
      no negative unit in the split.
    - **F1:** 0 where `P + R = 0` or where P or R is undefined.
    - **Interference-type confusion:** per section 3, over present classes.
    - **Event level:** the majority label of the window's units. Ties are broken by the order `nominal`, `jamming`,
      `spoofing`, `meaconing` (the earliest wins). A window with no unit after the guard is counted as empty.
13. **TEXBAT and B-iq (E5).**
    - No TEXBAT file is in this container: a recording is tens of GB, against about 12 GB of free disk.
    - E5 stays NOT MET, with the reason "data not fetched", until the files are fetched and their SHA-256 values are pinned.
    - The B-iq threshold rule will be written in an amendment, committed before any TEXBAT byte is read.
14. **Truth and predictions files.**
    - **Truth:** `kshana-bench-truth/1`, task `e`, labels `{id, class}`, plus per-folder and per-window summaries,
      written by the engine as compact JSON.
    - **E2:** the SHA-256 of the truth file of each split (`dev`, `test`, `holdout`) is equal on Linux, macOS and
      Windows. CI fetches the archive on each platform.
    - **Predictions:** `kshana-bench-predictions/1`, with `labels: {id: class}` and
      `class_scores: {id: {nominal, jamming, spoofing, meaconing}}`.
15. **E1.**
    - **Input:** `make_e1.py` writes a deterministic truth file and predictions file (`e1_truth.json`,
      `e1_predictions.json`) covering:
      - all four classes;
      - ties within and across classes;
      - undefined scores;
      - a class that is never predicted;
      - a class whose F1 is 0.
    - **Check:** `oracle.py` scores them. The engine must give the same confusion counts exactly, and BA, macro-F1
      and every AUC within 1e-12.
    - **Second case:** the same with `meaconing` removed from the truth, which tests "present classes" and an
      undefined AUC.

## Run once

The first engine run on the Jammertest splits is the scored run. Its numbers go to
`docs/design/evidence/b4a-benchmark-classes/RESULTS.md`, with misses pinned by a test.
