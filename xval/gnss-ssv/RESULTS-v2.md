# Results of the v2 campaigns for the `gnss-ssv` bars not met

Bars and rules are those of `PREREGISTRATION-v2.md`, signed off by the owner on 24 October 2026 in commit `5f4250c8` before any
run; no bar changed afterwards. Everything is **MODELLED**: the booklet is a simulation, so even agreement in every cell would be
agreement with another model's computation of the same method, and nothing here moves a ledger row to VALIDATED. This is
evidence-support information, not operational or safety-of-life advice.

**Run 1 stays the run of record and every original miss stays NOT MET: S1, S2, S3, S4, S5 and S7.** S0 and S6 stay MET.
Nothing in this document meets an original bar. `RESULTS.md`, `results-run1.json` and the tests that pin them are untouched.

| Campaign / bar | Verdict | Value |
|---|---|---|
| Control (rule 1) | reproduces run 1 | all 7 bars, every cell identical to `results-run1.json` (`results-v2-control.json`) |
| A1 to A5 (GLONASS angles at the upper end of the source's ranges; **EXPLORATORY**) | NOT MET | identical to S1 to S5: 9 of 52, 4 of 52, 33 of 155, 24 of 156 and 8 of 26 cells outside tolerance |
| B (one reading at a time; **EXPLORATORY**, no bar) | sensitivity table | 2 of the 78 cells missed in run 1 come within tolerance under any single reading, both under the Fibonacci grid; 4 cells that were met go out of tolerance (below) |
| S7b (fit on Classic IIR, test on IIR-M) | **NOT MET** | all 8 IIR-M patterns 3.83 to 3.95 dB RMS against 3 dB (median 3.85); the fit leaves 4.36 dB RMS on its own training set |
| D (held-out published reception cells) | not run: source not pinned | no source was pinned before sign-off, so by the owner's rule it did not run |

## A. GLONASS's reference angles from an independent source (EXPLORATORY)

The manufacturer's presentation pinned at sign-off (SHA-256 `85456b06...4305`) gives the reference off-boresight angle as 14 to 20 degrees
for L1 and 14 to 28 for L3. The booklet's tables B2 and B6 use 20 and 28, the upper ends of those ranges: **the independent source supports the
pre-registered reading of run 1**. Table 4.2's 26 and 34 degrees lie outside the ranges, so **the source does not support the variant
that brought S1, S2 and S4 to every cell in addendum 4**. That variant stays what it was, a diagnostic chosen after seeing run 1.
Since the rule fixed at sign-off sets the angles to the upper ends, the configuration is run 1's, and the control run is campaign A's
result: S1 to S5 are not met, as recorded. The campaign is EXPLORATORY because the rule for turning a range into a number was fixed after the
source had been read; it cannot close any original bar and does not.

## B. One interpretation choice at a time (EXPLORATORY; no bar)

Each reading is the only change from run 1, read on the bars the pre-registration names for it; every cell is in `results-v2-B1.json` to
`-B5.json`, and `results-v2-summary.json` (from `summarise_v2.py`) lists, for each of the 78 cells missed in run 1, the readings that bring it
within its original tolerance.

| Reading | Bars read | Cells outside tolerance, run 1 -> reading | Missed cells now within tolerance | Met cells now outside |
|---|---|---|---|---|
| B1 Fibonacci grid, 2,562 points | S1, S2, S3 | 9 -> 8, 4 -> 4, 33 -> 32 | 2 (the combined-L1 max-outage cells of table B4 and of B9 at 15 dB-Hz) | 0 |
| B2 30-second epochs | S1, S2, S3 | 9 -> 9, 4 -> 4, 33 -> 33 | 0 | 0 |
| B3 antenna with the most satellites | S4, S5 | 24 -> 24, 8 -> 9 | 0 | 1 (HEO, QZSS L5, at least four signals) |
| B4 propagated HEO and lunar trajectories (J2, Sun, Moon) | S5, S6 | 8 -> 8, 0 -> 0 | 0 | 0 |
| B5 cosine user-antenna gain, floor -20 dBi | S1, S3 | 9 -> 9, 33 -> 36 | 0 | 3 (GPS L1 at least four signals and BDS L1 MOD1 at 20 dB-Hz; combined L1 at least one signal at 20 dB-Hz) |

The leftover cells the draft named (GPS L1 at least one signal at 20 dB-Hz; BDS L5 at least four signals at 20 dB-Hz; five HEO cells) are not
brought within tolerance by any single reading. Honest summary: **the GLONASS reference-angle choice is the only reading that was found to
change S1 to S4 materially, and the independent source supports the angles run 1 used, so the table leaves the misses unexplained by the
five readings tried.** B3 has no effect on S4 by construction (one antenna). B1 and B2 move the shell cells by up to a few
percentage points in individual cells (the grid and the epoch step are not the cause of the misses); B5 matters only where a C/N0
threshold is applied. Two details stated before any run: B4 used J2, Sun and Moon (the draft's degree-8 gravity is not available in the integrator the
`ssv` mode uses), and the ties in B3 go to the first listed antenna, the nadir one.
**Not claimed:** that any reading is what the booklet's authors did.

## S7b: the transmit pattern on data it was not fitted to

The registered two-parameter shape (constant roll-off, then a floor) was fitted to the twelve Classic IIR L1 panel patterns (SVN 41, 43, 44, 45,
46, 47, 51, 54, 56, 59, 60, 61; 192 points, theta = 0 to 30 degrees, each normalised to its own peak) by a deterministic grid search:
**0.530 dB per degree, floor 15.06 dB**, training RMS 4.36 dB (the best single training pattern is 3.86 dB, so no training pattern is within
3 dB). The fit uses the training patterns only; the code computes and records it before it reads any IIR-M pattern. The eight IIR-M patterns (SVN 48, 49, 50, 52, 53, 55, 57, 58) are
3.93, 3.85, 3.85, 3.95, 3.83, 3.84, 3.83 and 3.87 dB (in that order; `results-v2-s7b.json` has each): range **3.83 to 3.95 dB, median 3.85 dB, against the bar
of 3 dB for every pattern: S7b is NOT MET**, pinned by a test. The original S7 (6.3 to 8.8 dB for the older stand-in) stays NOT MET too. What the result
says: a roll-off-and-floor shape fitted on its own family cannot reach 3 dB of these panel patterns even in training, and the IIR-M patterns
are not further from the fit than the Classic IIR training patterns (3.86 to 4.66 dB each). It does not say the shape is wrong for any other satellite, or anything about the panels' phase.

## D. Not run

No published high-altitude reception source was pinned before sign-off, so the campaign did not run, and no value was substituted.

## Reproduce

`cargo run --release --example ssv_booklet_check out.json` (control, about 12 minutes); `--ablation=B1` to `B5`; `--s7-only --s7b=l1-azavg.csv` with the
patterns extracted by `extract_patterns.py` from the zip that `fetch.sh` fetches (never vendored); `python3 xval/gnss-ssv/summarise_v2.py xval/gnss-ssv`.
The results are pinned by `tests/ssv_v2_campaigns.rs`.
