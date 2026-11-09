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

## E5 v2 readings (9 November 2026, before any E5 v2 code and before any TEXBAT byte is read)

These read `docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION-E5-v2.md`, signed off on 9 November 2026.
- **The sources** are the two documents the TEXBAT page links:
  - Humphreys, Bhatti, Shepard and Wesson, "The Texas Spoofing Test Battery", ION GNSS 2012
    (`tbION_for_distribution.pdf`);
  - "TEXBAT ds7 and ds8" (`texbat_ds7_and_ds8.pdf`).

  The owner downloaded both in a browser. They are kept privately, not in this repository; only the facts below are
  transcribed.
- **The owner's hashes so far.** Two TEXBAT files have been fetched and hashed by the owner, `ds1.bin` and
  `cleanStatic.bin`, and no Kshana code has read either.

E5v2-1. **Recordings and classes.**
- `nominal`: `cleanStatic.bin` and `cleanDynamic.bin`, every window.
- `spoofing`: `ds1.bin` to `ds8.bin`.
- The file names and the class of each are fixed here. A file whose SHA-256 differs from the pinned manifest is
  refused, not scored.

E5v2-2. **Spoofing onset (truth).** What the sources state:
- **ds1 to ds6:** "No spoofing signals were injected during the first 100 seconds or so" (2012 paper, section
  "Recording procedure").
- **ds1 (switch):** "a disruption began between 90 and 100 seconds".
- **ds2:** "the initial takeover (at around 80 seconds)".
- **ds7 and ds8:** spoofing is injected over 110–130 s: "0-110 No spoofing present … 110-130 A spoofing signal is
  injected".

One onset is used for all eight: **t₀ = 110 s.** It is the latest stated or implied start, so no window that is
labelled `spoofing` can precede the spoofer. The cost is fewer spoofing windows: those between the true onset and
110 s are excluded, neither class. No spoofing recording is excluded entirely.

E5v2-3. **Windows.**
- **The data.** Complex int16 little-endian I/Q (I then Q), 25 Msps, complex baseband, so the IF is 0 Hz (the
  format `examples/texbat_probe.rs` reads).
- **The windows.** Window `w` covers samples `[w·25 000 000, (w + 1)·25 000 000)`, that is 1 s, starting at the
  file's first sample. A trailing partial window is dropped.
- **Which windows count.** Every window of a nominal recording counts. For a spoofing recording, only windows with
  `w ≥ 110` count.

E5v2-4. **The front end per window.** Each window is processed on its own:
- `iqif::FeatureStageConfig::texbat_like()`: 25 Msps, IF 0, Doppler ±6 kHz in 250 Hz steps, acquisition threshold
  2.5, 1 000 one-ms epochs, the default tracking loops;
- acquisition on the window's first millisecond for PRNs 1 to 32, then tracking for the window.

E5v2-5. **Statistics per tracked PRN**, both independent of the signal's scale. Epochs 1 to 20 are dropped (loop
pull-in), so each uses epochs 21 to 1 000.
- `S` = the mean of the early-minus-late imbalance `|E − L| / (E + L)` (`CorrelatorDump::el_imbalance`).
- `P` = the standard deviation of `20·log10|prompt|` (dB). This is a scale-free measure of prompt-power fluctuation;
  the authentic and counterfeit signals interacting makes the prompt power oscillate.

E5v2-6. **Thresholds, fixed on synthetic data only.**
- **The data.** `τ_S` and `τ_P` are the 99th percentiles (nearest-rank) of `S` and `P` over a synthetic clean set:
  - `sdr::synth_if` at 25 Msps baseband, amplitude 1;
  - noise `σ = √(3·fs / (4·10^(45/10)))`, which is `C/N0` = 45 dB-Hz for that generator. Each component is
    `σ·(u₁ + u₂)` with `uᵢ` uniform on (−1, 1), so the complex noise power is `4σ²/3`;
  - 64 windows: PRNs 1 to 32, each at carrier offsets +1 500 Hz and −2 500 Hz; code phase `(17·prn) mod 1023`
    chips; generator seed = window index + 1;
  - each window run through E5v2-4 and E5v2-5, tracking the PRN it carries.
- **When.** The thresholds are computed by a committed test and written into the baseline config before any
  TEXBAT byte is read.

E5v2-7. **The window score.**
- `max over tracked PRNs of max(S/τ_S, P/τ_P)`.
- A window with no tracked PRN scores `+∞`: no authentic tracking is itself an alarm.
- Only the ranking enters the AUC.

E5v2-8. **The owner's command** (`kshana bench texbat-windows <file> --out <file>.scores.json`):
1. streams the file's SHA-256 and size and refuses a mismatch with the manifest;
2. writes, per window, the start second and the score (and `S`, `P` and the PRN count), with no IQ;
3. the owner sends the ten JSON files, and they are committed.

E5v2-9. **Scoring.**
- **AUC:** one-vs-rest AUC of `spoofing` over all counted windows of the ten files (Mann-Whitney, ties half). `+∞`
  ranks above every finite score, and ties among `+∞` count half.
- **Minimum:** each class needs at least 2 recordings and 300 counted windows. With about 420 to 480 windows per
  file this is expected to hold, and the count is reported.
- **Also reported, without a bar:** the recording-level AUC (each recording's median window score, 10 units).
- **Scored once.**

### Amendment to E5v2-4, before any E5 v2 code and before any TEXBAT byte is read (9 November 2026)

- **Why.** Searching for PRNs 1 to 32 in every 1 s window, with the engine's brute-force acquisition (49 Doppler
  bins × 1 023 code phases × 25 000 samples per PRN), would take days per recording. That cost was found while
  sizing the code. No code had been written and no TEXBAT byte had been read.
- **Acquisition.** Done once per recording, on its first millisecond, for PRNs 1 to 32, with E5v2-4's settings.
- **Tracking.** Every acquired PRN is tracked continuously through the whole recording by the engine's loops (the
  `sdr::track` loop, refactored to carry its state across windows without changing its arithmetic). A window's
  statistics (E5v2-5) come from that window's 1 000 epochs, epochs 21 to 1 000 as before.
- **Unchanged.** "No tracked PRN" in E5v2-7 now means no PRN was acquired at the start of the recording. The
  synthetic thresholds of E5v2-6 are unchanged: each synthetic window is still acquired and then tracked for 1 s.
- **Parallelism.** PRNs may be tracked in parallel threads, since each PRN's loop is independent. The output is
  the same bytes whatever the thread count.
- **Effect on what is measured.** This is how a receiver meets an attack: it is locked before the spoofer starts,
  and it keeps tracking through the takeover.

### Amendment to E5v2-6, before any TEXBAT byte is read (9 November 2026)

- **What happened.** The first computation of the thresholds stopped: at least one of the 64 synthetic windows did
  not acquire. A 1 ms acquisition at 45 dB-Hz gives peak ratios of about 3.6 to 4.1 against the 2.5 threshold, so
  an unlucky noise draw can fall below it. The reading had no rule for this case.
- **The rule.** A synthetic window that does not acquire is excluded from the threshold set, and the number
  excluded is reported. The thresholds are the 99th percentiles over the windows that acquire.
- No TEXBAT byte had been read.
