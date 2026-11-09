<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D8b v2 (0.41.x): row 8, the M3 timing bound with the C/N0 estimator's delay

**Status: Signed off by the owner on 9 November 2026, as drafted (proposed 8 November 2026). No code or data for v2 before this sign-off. Bars may be tightened after a run, never loosened.**

## Why a v2

D8b row 8 (`PREREGISTRATION.md`, signed 3 November 2026) is NOT MET on re-run (`RESULTS.md`): with the C/N0 detector
on a 0.020 s stride, every attenuation is detected, but the median time to detect is 0.221 s (seen) and 0.201 s
(fresh) against M3's bound of 2 × `ARL1` detector samples × the stride, 0.007 s. The bound assumes the detector sees
the full 6 dB step from its first sample after the onset. It does not: the C/N0 estimate averages the last 1 s, so it
falls only as attenuated windows enter it, and no stride removes that. v1 and the original M3 stand as recorded; their
bars are not loosened. v2 states a bound that includes the estimator's delay, fixed by formula before any v2 run.

## What changes (everything else is M3 and v1 unchanged)

1. **The bound.** For each satellite-event, `D_est` is the time after the onset at which a **noise-free** CUSUM
   crosses `h`. That CUSUM is the channel's own (`k = 3/(2σ0)`, `h = 5`, its baseline `σ0`, the 0.020 s stride), fed
   the **noise-free** C/N0 estimate of the 6 dB step:
   - each 20 ms window's expected moments come from its C/N0, before or after the step;
   - they are averaged over the estimator's 50 windows;
   - the M2M4 formula is applied, as in the D8a v2 row 6 estimator response.

   M3's timing clause becomes: **the median time to detect is no more than the median over the events of
   `D_est + 2 × ARL1(k, h, 6 dB/σ0) × stride`**. The second term is M3's original noise allowance, kept as written. The
   detection clause (`P_md = 0` over 18) is unchanged.
2. **No free parameter.** `D_est` follows from the loop design (estimator span, window length, coherent time), the
   channel's baseline C/N0 and `σ0`, the step size and the CUSUM settings. Nothing is chosen from data.
3. **An oracle**, committed before any v2 engine code: a standard-library script that computes `D_est` and the bound
   for each event from the dumped baselines, `σ0` and settings, independently of the engine, agreeing with the engine's
   bound within 1e-9 s.
4. **Inputs.** The registered stepped campaign (seeds 200 to 205) and v1's fresh one (100 200 to 100 205), now seen,
   and new fresh recordings with seeds 200 200 to 200 205, not run by anyone. The stride is the campaign default since
   v1 (one NWPR window, 0.020 s). M4, and M1 and M2, are re-run as regressions.

## Bars

- **M3 v2:** detection clause as M3; timing clause as above; on the seen and the new fresh seeds.
- **M4:** as registered, on the same campaigns.
- **Informativeness (reported):** the bound must be below the estimator's whole span (1 s) for every event. Otherwise
  it is too loose to say anything, and v2 is recorded as uninformative, not as MET.

## Disclosures

- The v1 times to detect (0.221 s and 0.201 s) are known when this is written, so the bound's form is chosen knowing
  the order of the delay. That is why `D_est` has no free parameter, and why the new fresh seeds must meet it too.
- `D_est` treats the estimate as its expected value. A noisy estimate crosses the CUSUM's threshold earlier or later;
  M3's `2 × ARL1` term is the only allowance for that, as in the original bar.

## What a MET and a NOT MET mean

As v1. In addition: MET on v2 does not undo v1's or M3's NOT MET. All are published.
