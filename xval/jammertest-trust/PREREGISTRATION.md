# Pre-registration: receiver-trust thresholds calibrated on the JammerTest 2024 dataset (CAP-13)

Committed alone, before the calibration harness exists and before any monitor statistic has been
computed on the dataset. The method, the event truth, the metrics, the selection rule and the bars
below are fixed now. Bars may be tightened later, never loosened; a miss is recorded with its
numbers.

## What was seen before this was written (disclosed)

- The dataset's Zenodo record metadata and README (licence, file list, folder layout).
- The extracted folder tree, each scenario's `scenario.json` and `info.txt`, the header line and
  first rows of `mon_rf.csv`, `nav_pvt.csv` and `rinex.csv` of two scenarios, and, for every
  scenario, the first and last `real_time` of `mon_rf.csv` against its `attack_log` (to see whether
  the log covers the stated windows). No C/N0, AGC or jamming-indicator value was summarised and no
  monitor was run.
- Elsewhere in this repository the same dataset has been used before (the spoofing onset oracles
  and `examples/jammertest_probe.rs`, which computes detector AUCs on `agc`, `jamind` and `cn0`).
  Their numbers for these three statistics were not consulted for this calibration; the probe's
  output is not committed.

## Data

"GNSS Dataset Under Jamming, Spoofing, and Meaconing Conditions (JammerTest 2024)", Zenodo record
15911589, concept DOI 10.5281/zenodo.15910563, licence GPL-3.0-or-later (record metadata
`gpl-3.0-or-later`), file `GNSS_DATASET_JAMMING_SPOOFING.tar.gz`, 375,338,522 bytes,
MD5 c7b00c63bb1ee5db80c7692a2b06e169 (matches the record),
SHA-256 73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313. Fetched at run time,
extracted outside the repository; nothing is vendored. 24 scenario folders, one u-blox ZED-F9P
receiver each. This is a third-party recording made at the JammerTest 2024 event; the event
organisers' own redistribution terms for their other logs remain unclear, and only this dataset is
used.

## Pipeline (fixed)

1. **Timeline per scenario folder**, from the dataset's CSV files for all 24 folders (12 folders
   also carry a `.ubx`; see step 6), in 1 s bins of the UTC time stamps (`floor` of the seconds):
   - `mon_rf.csv`: AGC = mean of the `agcCnt_*` blocks of the record, jamming indicator = maximum
     of the `jamInd_*` blocks (the same reduction as the UBX reader `receiver_trust::ingest::read_ubx`);
     several records in one bin: AGC averaged, jamming indicator maximum.
   - `rinex.csv`: per (satellite, band) C/N0 from `snr_L1` (band `L1`) and `snr_L2` (band `L2`),
     kept only inside [10, 64] dB-Hz (the existing `realdata::jammertest` bounds), averaged over the
     samples of the bin.
   - `rinex.csv` time stamps are taken as UTC (they run within 1 s of `mon_rf.csv` `real_time`).
2. **Monitors**: `receiver_trust::monitors::run_monitors` with `MonitorConfig::default()`
   (static platform, `calibration_s` = 60, `cn0_min_sats` = 4), no engine fix. From each
   post-calibration epoch the harness takes the three statistics the monitors decide on:
   `cn0_drop_db` (alarm when `>= cn0_drop_db`), `|agc_z|` (alarm when `> agc_k_sigma`) and
   `jam_ind` (alarm when `> jam_ind_threshold`). These statistics do not depend on the thresholds,
   so the alarm at any threshold is reproduced exactly from them. An epoch where a statistic is not
   defined (too few common satellites, no AGC) counts as "no alarm" for that monitor, in both
   classes.
3. **Event truth** from each folder's `scenario.json` `attack_log`: each event whose text contains
   "start" opens a window, the next event containing "end" or "stop" closes it. The time stamps are
   tagged `Z` but are local time (CEST, UTC+2), as documented in `examples/jammertest_probe.rs` and
   consistent with every log starting 2-5 minutes before the first window after a 2 h shift and
   with no window falling inside any log without it; windows are shifted by -2 h. No other shift
   is tried.
   - **Attack (jamming)** epoch: inside a window by at least the guard (60 s from either edge) in a
     folder whose `attack_type` contains "Jamming" (`Jamming`, `Spoofing + Jamming`). The class is
     the folder's `attack_type`, not the event text, because the event texts are inconsistent (the
     spoofing folders' events say "jamming").
   - **Attack (spoofing / meaconing)** epoch: the same, in the other folders. Reported only; not
     used for selection or bars, and not used as clean.
   - **Clean** epoch: post-calibration, and more than the guard (60 s) outside every window of its
     own folder.
   - Everything else (inside the guard bands) is excluded.
   - Limitation stated now: the windows are the scheduled slots, at one-minute resolution, not
     radio-frequency on/off times; a jammer may be off for part of a slot (a motorcade drives away
     from it), so the detection probability is a lower bound of the true one, and other tests at the
     event may have transmitted outside this folder's windows, so a "clean" epoch is "outside this
     dataset's logged windows", not "proven interference-free".
4. **Folder exclusion**: a folder whose calibration window (first 60 s of the log) lies less than
   the guard (60 s) before the start of a window, or inside one, is excluded (its baseline would be
   formed under attack); so is a folder where `run_monitors` returns an error. Excluded folders are
   listed with the reason.
5. **Metrics** per monitor, on a fixed grid:
   - `cn0_drop_db`: 0.5 to 30.0 dB in steps of 0.5;
   - `agc_k_sigma`: 0.5 to 20.0 in steps of 0.5, 21 to 100 in steps of 1, 110 to 1000 in steps of 10;
   - `jam_ind_threshold`: 0 to 254 in steps of 1.
   At each grid value: `Pfa` = alarmed clean epochs / clean epochs, `Pd` = alarmed jamming epochs /
   jamming epochs (pooled over folders), plus the area under the ROC curve (Mann-Whitney, no-alarm
   epochs of undefined statistic placed below every value). Also reported: the same at the 0.35
   default thresholds (6 dB, 5 sigma, 80), per rover state (stationary, dynamic) and the
   spoofing/meaconing Pd, and the "union" monitor (any of the three alarms, the measurement-domain
   `degraded` verdict restricted to these three).
6. **Reader cross-check (descriptive)**: for folders that carry a `.ubx`, the same pipeline on the
   timeline of `receiver_trust::ingest::read_ubx` (time from its UTC start label plus `t_s`); Pfa
   and Pd at the default and calibrated thresholds are reported beside the CSV ones. No bar.

## Selection rule (fixed)

For each monitor, on a set of folders: the calibrated threshold is the **smallest grid value whose
pooled clean-epoch Pfa is at most alpha = 0.01**. If no grid value meets it, the monitor is not
calibrated (it keeps its default in the profile) and its bar fails.

- **Held-out evaluation**: leave one folder out. For each evaluable folder, select on all other
  evaluable folders, apply to the held-out folder, and pool the held-out counts over folders.
- **Shipped thresholds**: the selection on all evaluable folders. They ship only as the opt-in
  profile `[monitors] profile = "jammertest-2024-calibrated"`; the default rule, the 0.35 receiver
  trust score and its 20 corpora stay byte-identical.

## Bars (on the pooled leave-one-folder-out held-out counts)

- **B1** (false alarms, per monitor): held-out clean-epoch Pfa <= 0.02 for each of the three
  calibrated thresholds.
- **B2** (union): the union of the three calibrated monitors has held-out clean-epoch Pfa <= 0.05
  and held-out jamming-epoch Pd >= 0.50.
- **Minimum data**: at least 3 evaluable jamming folders and at least 1,000 clean epochs; otherwise
  the result is "insufficient data" and the row stays MODELLED.

## Ledger decision (fixed)

The CAP-13 ledger row is VALIDATED (oracle: the dataset's published event logs) only if B1 holds for
all three monitors, B2 holds and the minimum data holds. Otherwise it is MODELLED, the numbers are
recorded, and the profile still ships (opt-in) with its RESULTS and the failed bar named. Either way
the claim is narrow: these thresholds on this receiver type (u-blox ZED-F9P) at this event, against
scheduled-slot truth. Maritime trust-score bands are not calibrated here; they need vessel-operator
or maritime-authority trial data (partner-gated).
