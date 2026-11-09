<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B4a E5 v2 (0.41.x): B-iq spoofing on TEXBAT, scoreable by design

**Status: SIGNED. Proposed 9 November 2026 and signed off by the owner the same day, as drafted. No code read any
TEXBAT byte before it, and no score exists.** Numbers marked *proposed* are now fixed. After sign-off, bars may be
tightened, never loosened.

## Why a v2

E5 v1 (`PREREGISTRATION.md`, section 5) cannot be scored as registered, whatever the data shows.
- **Splits.** TEXBAT's recordings are split by the SPEC §4 rule per class stratum. The 2 clean recordings give
  1 holdout, **1 test** and 0 dev. The 8 spoofing recordings give 2 holdout, **2 test** and 4 dev.
- **Units.** A unit is a 10 s window over the first 300 s: 30 per recording.
- **Minimum.** A class enters the bars only with at least 2 recordings and 300 units in the scored split. The test
  split has 1 clean recording and 60 spoofing units, so neither class qualifies.

This was found while writing E5's scoring rule, before any TEXBAT byte was read. The owner had fetched and hashed
two files, `ds1.bin` and `cleanStatic.bin`, and nothing else. v1's E5 is recorded as **NOT ASSESSABLE (below the
minimum by design)**, with this reason. It is not a pass and not a miss of the bar.

## What changes

1. **No split for B-iq.** B-iq is a fixed baseline: a threshold rule written before the run, with nothing fitted to
   TEXBAT. A split protects a method trained on dev data. B-iq has none, so it is scored on **all ten recordings**:
   - `nominal`: `cleanStatic.bin`, `cleanDynamic.bin`;
   - `spoofing`: `ds1.bin` to `ds8.bin`.

   The v1 split rule still applies to any trained submission.
2. **Units: 1 s windows** (*proposed*) over each whole recording, starting at the recording's first sample.
3. **Truth onset.**
   - **The source.** For each spoofing recording, the spoofer onset time is transcribed into the readings from its
     published description, before any TEXBAT byte is read:
     - Humphreys, Bhatti, Shepard and Wesson, "The Texas Spoofing Test Battery", ION GNSS 2012;
     - the TEXBAT page's ds7 and ds8 description.
   - **What is excluded.** Windows of a spoofing recording that start before its onset are excluded, neither
     class, as task (e) excludes pre-onset epochs.
   - **If a recording's onset is not stated.** It is excluded entirely, and the reading says so.
4. **The B-iq score (fixed in the readings before the run).**
   - Per window: the `examples/texbat_probe.rs` front end (acquisition and tracking of every candidate PRN). The
     score is the largest, over tracked PRNs, of each SQM and prompt-power statistic divided by its fixed threshold.
   - A window with no tracked PRN scores `+∞`, an alarm.
   - Thresholds are written into the baseline config before the run. AUC uses only the scores' ranking.
5. **Minimum data.** v1's rule applies unchanged: at least 2 recordings and 300 units per class. Units come from
   1 s windows that are correlated within a recording, so the result also reports a recording-level AUC (each
   recording's median window score, 10 units) with no bar.
6. **Running on the owner's computer.** The files are never redistributed and never leave the owner's machine.
   - A command, `kshana bench texbat-windows <file> --out <file>.scores.json`:
     1. checks the file's SHA-256 against the pinned manifest and refuses a mismatch;
     2. computes the per-window scores;
     3. writes a small JSON with no IQ samples, only window start times and scores.
   - The ten score files are committed (scores only). `kshana bench score` computes E5 from them once.

## Bar (unchanged)

| Id | Bar |
|---|---|
| E5 B-iq spoofing | On all ten TEXBAT recordings (post-onset windows): one-vs-rest AUC of `spoofing` **≥ 0.70** |

## Process

1. Sign-off.
2. The manifest pins all ten files: size and SHA-256 from the owner's fetch. Two are already recorded.
3. Readings (onset times, the B-iq score and thresholds), then the code, then the ten score files, then one score.
4. `RESULTS-E5-v2.md` records MET or NOT MET. v1's E5 stays published as NOT ASSESSABLE.
