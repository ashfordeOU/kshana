<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a results: IQ tracking and C/N0 re-runs

Each row reports on its own, against the pre-registration in this directory (signed off on 3 November 2026). Rows are
added as they are scored.

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
