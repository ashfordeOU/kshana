<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a results: IQ tracking and C/N0 re-runs

Each row reports on its own, against the pre-registration in this directory (signed off on 3 November 2026). Rows are
added as they are scored.

## Row 4. `VM-bdfec2e4`: the capped FLL pull-in, with the forced hand-over seeded by a smoothed frequency

- **Readings:** `xval/d8a-fll-handover-seed/README.md`, committed at 2552a8738 before the engine change. Its reading 7
  development runs (seeds k = 1001 to 1010) were made and recorded before the scored run (4933232c9); no reading was
  changed after them.
- **The change (one, to the hand-over logic):** `[design.carrier] fll_handover_mean_s` (`LoopConfig::
  fll_handover_mean_s`). At a hand-over forced by `fll_pull_in_max_s`, the carrier filter's frequency is set to the mean
  NCO Doppler over the pull-in's last `fll_handover_mean_s` seconds. Opt-in; out of the design hash when unset. Scored
  design "seeded": cap 1.0 s, mean over 0.5 s.
- **Run:** once, 2026-11-08, in release (`tests/iq_fll_handover_seed.rs`, 180 runs, 271 s). Per-run statistics:
  `tests/fixtures/fll_handover_seed/results.csv`.

| bar | seen (k = 1 to 10) | fresh (k = 100 001 to 100 010) | verdict |
|---|---|---|---|
| Control (registered survey, no seeding) | reproduces `fll_handover_floor/results.csv` exactly | | reproduces |
| D0 (the limit is there) | default FLL still on at the end in 9 of 10 | 10 of 10 | MET |
| D1 (additivity) | default hash unchanged; the key in the canonical form only when set; invalid uses refused | | MET |
| D2 at 33 dB-Hz (all 20 hand over and hold) | **20 of 20** | **20 of 20** | MET |
| D2 at 31 dB-Hz | 15 of 20 | 6 of 20 | **NOT MET** |
| D3 at 33 dB-Hz (σ within 25 % of the PLL alone) | 6.073° / 6.056° (ratio 1.003) | 6.078° / 6.043° (1.006) | MET |
| D3 at 31 dB-Hz | 15.281° / 8.420° (1.815) | 23.939° / 8.505° (2.815) | **NOT MET** |
| D4 (100 Hz-off pull-in at 45 dB-Hz) | LOCKED, no false lock or timeout, within 5 Hz | | MET |
| 29 dB-Hz (reported, not graded) | 0 of 20 hold | 0 of 20 hold | |

**Verdict: NOT MET** (D2 and D3 at 31 dB-Hz). At 33 dB-Hz the change takes the capped design from 16 of 20 runs holding
(0.40) to 20 of 20 on the seen and the fresh seeds, with phase jitter within 1 % of the PLL alone, so that half of D2 and
D3 is met on re-run.

What the result says about F3 (the 0.40 hypothesis): at 33 dB-Hz a smoothed frequency at the hand-over is enough, which
supports it there. At 31 dB-Hz it is not: the failing runs return to the FLL for one to three 1 s spells, as in 0.40,
and the seen and fresh seeds differ widely (15 and 6 of 20). A 0.5 s mean of the FLL's frequency is still too noisy at
31 dB-Hz, or the PLL's PLI does not reach `fll_off_pli` within the return dwell for another reason; this run does not
separate the two. Development runs (14 of 20 at 31 dB-Hz) pointed the same way; nothing was tuned on them.

Pins: `tests/iq_fll_handover_seed.rs` (`the_committed_scored_run_gives_the_recorded_verdict` grades the committed
per-run results; the strict survey is ignored with these numbers).

## Row 3. `VM-f5e2ce4e`: cell-averaging CFAR in IQ acquisition, with the reference set over the whole row

- **Readings, study and oracle:** `xval/d8a-cfar-reference/` (README readings 1 to 7, `dev_study.py` and its output,
  `oracle.py`), committed at 40046ebbb before the engine change. The development study is disclosed there: one candidate
  was tried, on PRNs 2 to 6 only; the registered PRN 1 was run under the registered detector only, to check the model
  (it reproduced the recorded 32 of 2495).
- **The change (one, to the reference-cell set):** `CfarReference::Row`, the reference cells every stride-th lag round
  the whole Doppler row outside the guard (`N` = 622 at 2.5 MS/s, guard 2, stride 4), `α` from the registered closed
  form at that `N`. Opt-in through `CfarConfig::with_reference`; the registered window stays the default.
- **Run:** once, 2026-11-08, in release (`tests/iq_acq_cfar_row.rs`). No bar, input or setting was changed after a
  result was seen.

| check | measured | verdict |
|---|---|---|
| Control (registered window) | C2 2052 and 2034, C3 2112 and 2097 of 210 000; C4 32 of 2495; C5 0 | reproduces the record |
| C1 (regression, closed form unchanged) | 18 of 18 cases within 3σ (`tests/iq_acq_cfar.rs`) | MET |
| C2, Gaussian noise, seen seeds 0 to 3 | M = 1: 1.010 %; M = 4: 0.969 % | MET (± 20 % of 1 %) |
| C2, fresh seeds 100 000 to 100 003 | M = 1: 0.980 %; M = 4: 1.033 % | MET |
| C3, 2-bit noise, seen seeds 100 to 103 | M = 1: 0.996 %; M = 4: 1.010 % | MET |
| C3, fresh seeds 100 100 to 100 103 | M = 1: 0.988 %; M = 4: 1.019 % | MET |
| C4, PRN 1, +1250 Hz, 300.25 chips (registered) | detected; peak +1000 Hz; 0.103 chip; **0 of 2495** off-peak above | MET |
| C4, PRN 7, −2500 Hz, 17.5 chips (fresh) | detected; −2500 Hz; 0.096 chip; **3 of 2495** (0.12 %) | MET |
| C4, PRN 13, −750 Hz, 511.0 chips (fresh) | detected; −500 Hz (half-way case); 0.091 chip; **4 of 2495** (0.16 %) | MET |
| C4, PRN 22, +500 Hz, 800.75 chips (fresh) | detected; +500 Hz; 0.054 chip; **0 of 2495** | MET |
| C4, PRN 31, +3000 Hz, 1000.25 chips (fresh) | detected; +3000 Hz; 0.165 chip; **0 of 2495** | MET |
| C5 | 0 decisions change with the input × 7 | MET |
| Oracle (`oracle.py`, run after the scored run) | the same counts (0, 3, 4, 0, 0), detections and peak bins on all five signals | agrees |

**Verdict: MET on re-run**, on the registered and the fresh inputs.

Disclosures:

- The development study chose the change on PRNs 2 to 6 before the run; the reading records that only one candidate was
  tried. The fresh signals and the registered signal were never run under the candidate before the scored run.
- For context, from the oracle after the run: under the registered window the four fresh signals have 62, 28, 43 and 59
  off-peak cells of 2495 above the threshold, all above 1 %. The 0.40 finding was not peculiar to PRN 1.
- The oracle's code-phase field uses a different lag sign convention from the engine's and is not comparable; it was not
  used. Its usage line was corrected after the run (it imports `dev_study.py`, so it cannot run under `python3 -I`).
- With the row set, a cell is compared with the whole row's floor, which in a real search includes any signal's peak
  (1/622 of its weight per reference cell). Detection on these signals is unaffected (every peak detected); weak-signal
  detection loss against the window set was not measured here.
- MODELLED internal consistency against the detector's own closed form and an independent numpy model; no receiver's
  acquisition is checked.

Pins: `tests/iq_acq_cfar_row.rs` (C2/C3 counts, C4 exceedance counts).
