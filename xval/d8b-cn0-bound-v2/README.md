<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D8b row 8 v2: the M3 timing bound with the C/N0 estimator's delay: readings and oracle

The pre-registration is `docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION-v2.md`, signed off on 9
November 2026. Committed **before any engine code for v2** and before any v2 run. `oracle.py` (standard library only) is
the oracle.

## Readings

1. **The noise-free estimate of the step.** For a satellite-event, the channel's baseline mean `μ0` (dB-Hz) and spread
   `σ0` (dB, at least 0.1) are the C/N0 monitor's own (the `cn0_drop` test's baseline).
   - The estimator averages `M = 50` windows of `W_w = 20 ms` (coherent time `T = 1 ms`), the campaigns' design.
   - A window has expected moments with unit noise power: `A² = 10^(C/10) T`, `m2 = A² + 1`, `m4 = A⁴ + 4A² + 2`. `C` is
     `μ0` before the onset and `μ0 − 6 dB` after it.
   - The reading with `n` attenuated windows is the M2M4 transform of the averaged moments, as in D8a row 6 v2.
2. **The noise-free CUSUM and `D_est`.**
   - The detector samples the estimate at the stride (0.020 s, one window) at `t = onset + j × stride`, `j = 1, 2, …`.
     At sample `j`, `min(j, M)` windows are attenuated. The window grid is taken as aligned with the onset; the real
     grid is offset by less than one stride, which is stated, not modelled.
   - The drop CUSUM is the monitor's: `z = (C − μ0)/σ0`, `k = 3/(2σ0)`, `g ← max(0, g − z − k)`, alarm when `g > h`
     with `h = 5`.
   - `D_est` is the first `j × stride` with `g > h`.
3. **The bound.**
   - For each detected event, the bound is `D_est + 2 · ARL1(k, h, 6/σ0) · stride`, with Siegmund's approximation as in
     M3.
   - M3 v2's timing clause holds when the median time to detect (alarm time minus onset, as the scorer measures it) is
     no more than the median of the bounds over the events.
   - The detection clause is M3's: 18 of 18 detected.
4. **Informativeness.** If any event's bound is 1 s or more (the estimator's span), the run is recorded as
   uninformative, not as met.
5. **Inputs.**
   - The stepped campaign of `tests/iq_campaign_monitors.rs` (6 recordings × 3 satellites, 6 dB for 6 s), at the
     campaign default stride (one NWPR window, 0.020 s).
   - Seeds 200 to 205 and 100 200 to 100 205, both seen (v1).
   - Seeds 200 200 to 200 205, fresh, run by no one before.
   - M4 is scored on the same campaigns. M1 and M2 do not use this monitor's timing and are re-run unchanged as
     regressions (`tests/iq_campaign_monitors.rs`).
6. **Verdict.** M3 v2 is met only if both clauses hold on all three seed sets (and reading 4 does not apply), and M4
   holds on all three.
7. **Oracle check.** The test dumps each detected event's `μ0`, `σ0`, settings and the engine's `D_est` and bound.
   `oracle.py --check` must agree within 1e-9 s on every event of every set.
