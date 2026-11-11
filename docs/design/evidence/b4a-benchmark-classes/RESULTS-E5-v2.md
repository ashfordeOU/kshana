<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B4a E5 v2: B-iq spoofing on TEXBAT: result

Pre-registration: `PREREGISTRATION-E5-v2.md` (signed 9 November 2026). Readings: `xval/bench-e/README.md`, E5v2-1 to
E5v2-9 and their two amendments. Scored once on 11 November 2026 at 22:16:13 UTC, on main `635a1887f`, with
`kshana bench texbat-score xval/bench-e/texbat-v2 --out xval/bench-e/texbat-v2/E5-SCORE.json` (scorer merged in
`92cec695f` before the score). v1's E5 stays published as NOT ASSESSABLE.

| Bar | Result |
|---|---|
| E5 B-iq spoofing: one-vs-rest AUC of `spoofing` on all ten TEXBAT recordings (post-onset windows) ≥ 0.70 | **NOT MET**: AUC 0.6941 (2 729 spoofing and 922 nominal 1 s windows; 8 and 2 recordings; the minimum-data rule holds) |

Reported without a bar:
- **Recording-level AUC** (each recording's median window score, 10 units): 0.8125.
- **Per spoofing recording against the two clean ones:** ds1 0.468, ds2 0.714, ds3 0.384, ds4 0.822, ds5 0.942,
  ds6 0.579, ds7 0.901, ds8 0.750.

## Data and how it was run

- All ten recordings were fetched and hashed by the owner on the owner's computer; each size and SHA-256 is pinned in
  `bench/manifests/b-iq.json` before its score file was made, and each score file carries its recording's hash
  (checked again by the scorer). The recordings never left the owner's machine; only the score files (window start
  times and scores, no IQ) are committed in `xval/bench-e/texbat-v2/`.
- No window scored `+∞` (no tracked PRN) in any file.

## Disclosures

- The score command was written after nine of the ten score files were committed, and merged before the tenth
  arrived and before any AUC was computed. Its arithmetic is the plan's (rank-sum AUC with ties as 1/2, `null` as
  `+∞`, the minimum-data rule), checked on synthetic documents (`tests/texbat_e5v2.rs`).
- Before the score, the uploaded files were displayed whole in the working session, so individual window values were
  seen; no class statistic or AUC was computed from them. A check before the score counted `null` scores per file
  (none).

## What it shows (descriptive, after the score)

- The distortion-only baseline separates the strong attacks (ds5, ds7, ds4, ds8) and misses the matched-power,
  time-push and protected attacks (ds1, ds3, ds6), where the window scores of spoofed and clean data overlap.
- The recording-level AUC (0.81) is higher than the window-level one: the median separates recordings better than
  single 1 s windows do. It carries no bar.

## Why the two disclosures cannot have moved the result (added 11 November 2026, after the score)

- **Everything that decides a score was fixed before any TEXBAT data reached the repository.** The first score
  files were committed in `2517d5893` (9 November 2026, 23:05 UTC). Before that:
  - E5 v2 signed off (`b668cad13`, 17:00 UTC) and its readings, onset 110 s, 1 s windows, the score rule
    (`256793667`, 17:04 UTC; amendments `9b97022c0` 17:05 and `feed4d355` 17:40 UTC);
  - the thresholds τ_S and τ_P set on synthetic data (`2b2cf102e`, 17:56 UTC), and the window-score command merged
    (`abadbc32b`, 19:02 UTC);
  - E5-PD signed off with τ_ΔP = 1 dB and the 60-window baseline (`013016cc0`, 22:50 UTC), coded in `ff43383e1`
    (23:01 UTC).

  The score command added on 11 November only counts: it reads the committed window scores and computes the
  registered AUC. It has no parameter.
- **An independent recomputation gives the same numbers.** `xval/bench-e/texbat-v2/oracle_e5.py` (Python standard
  library only, sharing no code with the engine; exact pair-by-pair AUC with fractions) recomputes E5 v2 and E5-PD
  from the ten committed files. Every field of `E5-SCORE.json` agrees with it to 1e-12: E5 v2 AUC 0.6940656673044165
  (NOT MET), E5-PD AUC 0.7409736925549811 (MET).
- **For later benchmarks** (`xval/bench-e/README.md`): the scorer and its independent check are committed before the
  first data file, and data files are handed over as one archive that is checked and committed without displaying
  its contents.
