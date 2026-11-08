<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8b row 7 (`VM-e6a6348d`): the jamming kind's hysteresis on a fresh power ladder: readings and ladder

The pre-registration is `docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION.md` (row 7), signed off on
3 November 2026, under the bars of `docs/design/evidence/jamming-acq-agc/PREREGISTRATION.md` and its supplement 1.
There is **no engine change**. This directory fixes the run set and the readings **before the engine is run** on it.

## Readings fixed before any engine run

1. **The run set.** `scenarios/jamming-demo.toml` unchanged except the jammer's `power_dbw`, on the ladder in
   `ladder.json`, written by `ladder.py` from the scenario file alone (Python standard library; no engine code, no engine
   run): **−34, −33, −32, −31, −29, −28, −27, −26, −24, −23, −22, −21 dBW** (12 runs). −30 and −25 dBW fall in the
   interval but are powers of supplement 1 and are left out, as the pre-registration requires.
2. **The median link.** The closed-form effective C/N0 is the engine's documented chain (`src/jamming.rs` module docs).
   Without an engine run the satellites' elevations are not known, so "the median link" is taken as a satellite at
   **45° elevation**, the middle of the receive pattern's range (−4 dB at the horizon to 0 dB at zenith). The pattern
   moves a link's effective C/N0 under strong jamming by at most about 4 dB between horizon and zenith, so the ladder
   (13 dB wide) still spans the thresholds for every link. The receiver-to-jammer geometry is computed from the file
   (WGS84): 1000.0 m, the jammer at 37.9° elevation from the receiver.
3. **The interval.** The loss threshold is the scenario's `tracking_threshold_dbhz`, 25 dB-Hz; the acquisition threshold
   is H3's registered 32 dB-Hz. The ladder covers median-link effective C/N0 in [22, 35] dB-Hz (`ladder.json` lists the
   value at each power: 34.70 at −34 dBW down to 22.29 at −21 dBW).
4. **Informativeness (the pre-registration's precondition).** Pooled over the 12 runs, with `[acquisition]` at 32 dB-Hz
   and 60 s (H3's settings), the fraction of link-epochs whose effective C/N0 lies in [25, 32) dB-Hz must be at least
   10 %. If not, the set is recorded as uninformative again and the row stays NOT MET.
5. **Bars, as registered.** H2: with acquisition at the tracking threshold and delay 0, `acquired` equals
   `status != "LOST"` on every link of every run. H3: acquisition 32 dB-Hz, delay 60 s; every `acquired` flag equals the
   independent recomputation of `xval/jamming-acq-agc/hysteresis.py` (unchanged, given only the exported per-epoch
   links and effective C/N0), and at least one link has `acquired` different from `status != "LOST"`. H4: over
   acquisition thresholds 25, 28, 32, 36 and 40 dB-Hz (delay 60 s), no epoch's acquired count ever rises.
   H1/G1 (additivity), G2 (quantiser loss) and G3 (AGC reading) are re-run as regressions from their existing tests.
6. **Verdict.** The row is MET only if reading 4 holds and H2, H3 and H4 hold on the ladder, with the regressions
   passing. A miss is recorded with its numbers and pinned.
