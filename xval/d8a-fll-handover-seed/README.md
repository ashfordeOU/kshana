<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8a row 4 (`VM-bdfec2e4`): the forced FLL→PLL hand-over seeded with a smoothed frequency: readings

The pre-registration is `docs/design/evidence/d8a-iq-tracking-cn0-rerun/PREREGISTRATION.md` (row 4), signed off on
3 November 2026, under the bars of `docs/design/evidence/fll-handover-floor/PREREGISTRATION.md` (D0 to D4). These
readings are committed **before any engine code** for the change and before any run.

## Readings

1. **The change (one, to the hand-over logic).** A new optional key, `[design.carrier] fll_handover_mean_s` (s;
   `LoopConfig::fll_handover_mean_s`), valid only with `fll_pull_in_max_s`. At a hand-over **forced** by
   `fll_pull_in_max_s`, the carrier loop filter's frequency state is set so that the NCO's Doppler equals the mean of
   the NCO Doppler over the last `fll_handover_mean_s` seconds of the pull-in (every loop update in that span), and its
   frequency-rate state (third-order PLL or second-order FLL only) is set to zero. Nothing else changes: a hand-over
   on the PLI, the return logic and every design without the key are as before. Unset, the key is out of the canonical
   form, so every existing hash stays.
   Why: F3 of the registered results. After a forced hand-over the PLL starts from the FLL's instantaneous frequency,
   whose noise at 31 to 33 dB-Hz can exceed what the 15 Hz PLL pulls in; the mean over the last part of the pull-in
   has a much smaller error.
2. **The scored design.** "seeded": the registered "capped" design (`fll_pull_in_max_s = 1.0`) with
   `fll_handover_mean_s = 0.5`, the last half of the pull-in. The value is fixed here.
3. **Control.** The registered "capped" design (no `fll_handover_mean_s`) on the registered seeds must reproduce the
   committed `tests/fixtures/fll_handover_floor/results.csv` rows (`the_committed_results_reproduce` covers the whole
   registered set).
4. **Inputs.** The registered source (PRN 13, 1500 Hz, 4.1 MHz, 8 s, steady state 2 to 8 s), 31 and 33 dB-Hz, the
   truth and the 25 Hz-off hand-offs; noise seeds k = 1 to 10 (seen) and k = 100 001 to 100 010 (fresh, the plus
   100 000 rule). The pll-only design is run on the same seeds for D3.
5. **Bars, as registered, with "seeded" in place of "capped".** D0 on the default design (the limit is there; seen and
   fresh). D1: the default hash and every existing design hash unchanged, `tests/iq_track_engine.rs` passing. D2: every
   one of the 40 runs per seed set (both C/N0, both hand-offs, ten seeds) with the FLL off at every steady-state epoch,
   phase lock in at least 95 % of them and no half-cycle slip. D3: at 31 and 33 dB-Hz from the truth hand-off, the
   mean steady-state σ of the true carrier phase error within 25 % of pll-only's on the same seeds. D4: the seeded
   design passes the 100 Hz-off pull-in guard at 45 dB-Hz.
6. **Verdict.** MET on re-run only if D0 to D4 hold on the seen and the fresh seeds. A miss is recorded with its numbers
   and pinned. The 29 dB-Hz runs are reported, not graded, as registered.
7. **Development runs (disclosed when made).** Before the scored run, the seeded design may be run once on development
   seeds k = 1001 to 1010 (31 and 33 dB-Hz, both hand-offs) to check the implementation. Their numbers are recorded with
   the result. If they lead to any change of reading 1 or 2, the change is written here as an amendment, before the
   scored run.
