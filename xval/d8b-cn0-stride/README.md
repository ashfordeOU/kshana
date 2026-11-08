<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8b row 8 (`VM-59bb0091`): the C/N0 monitor on a stride shorter than the estimator window: readings and oracle

The pre-registration is `docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION.md` (row 8), signed off on
3 November 2026, under the bars of `docs/design/MONITORS-IN-CAMPAIGN.md` §3 (M3 as written; M1, M2, M4 and the
detection clause of M3 as regressions). This directory holds the readings fixed here **before any engine change**, and
an independent oracle (`oracle.py`, Python standard library only, sharing no code with the engine).

## Readings fixed before the engine change

1. **The change.** In a campaign, the C/N0 monitor's automatic stride (`[monitors.epoch.cn0] stride = 0`, the default)
   becomes one NWPR window of the loop design, `cn0_window_periods / coherent_periods` loop updates, instead of the
   whole estimator, `cn0_windows × cn0_window_periods / coherent_periods`. For the default design (`plain`: 1 ms
   updates, 50 windows of 20 ms) the stride is **20 loop updates, 0.020 s**, against 1000 updates, 1.000 s, before.
   The estimator itself (sliding over 50 windows, 1 s) is not changed. An explicit `stride` is used as given.
   `kshana iq monitor` outside a campaign is not changed.
2. **The control.** `[monitors.epoch.cn0] stride = 1000` restores the old cadence and must reproduce the recorded M3
   (18 of 18 detected; median time to detect 1.001 s against 0.433 s).
3. **The bar, as written.** M3: every satellite-event detected (`P_md = 0` over 18), and the median time to detect no
   more than 2 × `ARL1(k, h, 6 dB/σ0)` detector samples × the stride time, now 0.020 s. `σ0` is each channel's baseline
   spread as the monitor states it; `k = 3/(2σ0)`, `h = 5` (the default CUSUM).
4. **Inputs.** The registered stepped campaign, seeds 200 to 205 (seen), and fresh recordings, seeds 100 200 to
   100 205 (the plus 100 000 rule; not run by anyone). M3 and M4 are scored on both. M1 and M2 (the quiet campaign,
   seed 31) do not use the C/N0 monitor; they are re-run once as regressions.
5. **Verdict.** M3 is met only if both clauses hold on the seen **and** the fresh seeds. M4 must hold on both. A miss is
   recorded with its numbers and pinned.
6. **Oracle check.** For each run, the test writes, per detected `cn0_drop` satellite-event, the time to detect, the
   channel's baseline `σ0`, the threshold `h` and the stride time; `oracle.py` recomputes each event's bound with its
   own Siegmund approximation (`Δ = 6/σ0 − k`, `b = h + 1.166`, `ARL = (e^{−2Δb} + 2Δb − 1)/(2Δ²)`), the median time to
   detect and the median bound (the upper middle value, as the registered test takes it), and must agree with the
   engine's within 1e-9.
7. **Expected outcome, stated before the run.** The timing clause is expected to be missed again. At a 6 dB step
   `ARL1` is a fraction of one detector sample, so the bound is below one stride (about 0.01 s). The sliding estimator
   averages 1 s, so its estimate falls only as attenuated windows enter it; the CUSUM's increment `6·f/σ0 − k` (for a
   fraction `f` of the window attenuated, roughly) needs a few hundred milliseconds. A shorter stride removes the
   one-sample floor of the 0.40 run but not the estimator's own lag. The pre-registration's disclosure applies:
   overlapping windows give correlated estimates, which the ARL1 formula does not assume.
8. **Other campaigns.** The 0.40 monitor tests (`tests/iq_campaign_monitors.rs`) and the detection-ROC tests
   (`tests/iq_campaign_roc.rs`, `tests/iq_campaign_roc_restart.rs`, row 9) were scored at the 1 s cadence. They state `[monitors.epoch.cn0] stride = 1000` explicitly so that their recorded
   numbers keep describing the campaign that produced them; their bars and recipes are not changed. Scoring the ROC
   at the new stride would be a new run under its own pre-registration.
