<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B4a E5-PD (0.41.x): power-and-distortion spoofing detection on TEXBAT

**Status: SIGNED. Proposed 9 November 2026 and signed off by the owner the same day, as drafted.** No score of any
kind had been seen: neither E5 v2's nor this one's. Numbers marked *proposed* are fixed at sign-off. After sign-off, bars may be
tightened, never loosened.

## Why a second entry

E5 v2 (`PREREGISTRATION-E5-v2.md`) measures the open engine's baseline IQ detector: signal-quality and
prompt-power statistics from the tracking loops, with fixed thresholds. Power-matched attacks (TEXBAT ds3, ds4, ds7
and ds8) are built to slip past distortion monitors alone.

The published defence against them is **power-and-distortion monitoring**: Wesson, Gross, Humphreys and Evans, "GNSS
Signal Authentication via Power and Distortion Monitoring", IEEE TAES, 2018 (arXiv 1702.06554). A spoofer that
avoids correlation distortion has to add power, and one that matches power produces distortion.

E5-PD is the open engine's power-and-distortion detector, scored with the same rules. Both entries are published,
side by side.

## The method (fixed now)

1. **Recordings, classes, onset, windows and minimum data:** exactly E5 v2's (readings E5v2-1 to E5v2-3 and
   E5v2-9, `xval/bench-e/README.md`): ten recordings, 1 s windows, spoofing counted from 110 s, the same 2-recording
   and 300-window minimum.
   - **One more exclusion:** windows 0 to 59 of **every** recording are not scored. They set each recording's power
     baseline (point 2).
2. **Power statistic `ΔP`, per window.**
   - `ΔP = 10·log10(mean |x|²) − B`, over the window's raw samples (the in-band received power, in dB).
   - `B` is the median of that quantity over the recording's own windows 0 to 59.
   - Every published spoofing onset is later than 60 s (E5v2-2: about 80 s at the earliest), so the baseline uses
     no attacked data. It also uses no class label: it is the same rule for clean and spoofed files.
   - Only a rise counts: spoofing adds power.
3. **Distortion statistics:** E5 v2's `S` (early-minus-late imbalance) and `P` (prompt-power fluctuation) per
   tracked PRN, with E5 v2's synthetic thresholds `τ_S` and `τ_P`. They are read from the E5 v2 score file of the
   same recording, so tracking is not repeated.
4. **The window score:** `max(ΔP / τ_ΔP, maxₚ S/τ_S, maxₚ P/τ_P)`.
   - `τ_ΔP = 1.0 dB` (*proposed*). This is an in-band power rise of 1 dB, the scale at which power monitoring is
     usually set, chosen by judgement and not fitted to any TEXBAT data.
   - A window with no tracked PRN scores `+∞`, as in E5 v2.
5. **The owner's command:** `kshana bench texbat-pd <file> --windows <file>.scores.json --out <file>.pd.json`.
   1. It streams the file once and checks its SHA-256 against the pinned manifest, refusing a mismatch.
   2. It computes `ΔP` per window and combines it with the E5 v2 file's statistics.
   3. It writes scores only, with no IQ samples.
   4. It reads the data once and does no tracking, so it takes a few minutes per file.

## Bar

| Id | Bar |
|---|---|
| E5-PD | On all ten TEXBAT recordings (windows 60 and later; spoofing windows from 110 s): one-vs-rest AUC of `spoofing` **≥ 0.70** |

Also reported, without a bar:
- the AUC per spoofing scenario against the two clean recordings (to show which attacks each detector catches);
- the recording-level AUC;
- E5 v2's AUC on the same windows.

## What it does not claim

It does not claim anything about a real receiver in the field, about attacks outside TEXBAT, or about any method of
Kshana's that is not open. A NOT MET is published as the result.

## Process

1. Sign-off, before any E5 v2 or E5-PD score has been read.
2. The code and its tests on synthetic data.
3. The owner runs the command on each recording that has an E5 v2 score file.
4. One score once all ten are in. `RESULTS-E5-PD.md` sits beside E5 v2's result.
