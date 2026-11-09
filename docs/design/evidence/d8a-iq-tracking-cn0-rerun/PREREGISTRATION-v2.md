<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D8a v2 (0.41.x): row 6, the lab fit with the C/N0 estimator's own response

**Status: Signed off by the owner on 9 November 2026, as drafted (proposed 8 November 2026). No code or data for v2 before this sign-off. Bars may be tightened after a run, never loosened.**

## Why a v2

D8a row 6 (`PREREGISTRATION.md`, signed 3 November 2026) is NOT MET on re-run (`RESULTS.md`). The fit modelled each C/N0
bin at the stated J/S a fixed 0.5 s earlier along the profile (half the M2M4 estimator's 1 s span). That moved the
`δ_eff` bias of the ramp campaigns from about −1.19 dB to about +0.46 dB: the right sign and size for an estimator lag,
but too far. A fixed shift in J/S treats the estimator as a pure delay of the stated profile. It is not: the estimate is
a nonlinear function (M2M4) of moments averaged linearly over the span, so its delay depends on how fast the C/N0
falls. v1 stands as recorded; its bars are not loosened. v2 replaces the shift with the estimator's response and is
scored on new data as well as the old.

## What changes (everything else is v1 unchanged)

1. **The model of a measured bin.** With `[campaign_fit] cn0_model = "estimator-response"` (the fit as it is when
   unset), each C/N0 bin that enters the fit or is compared with the model is modelled as **what the campaign's C/N0
   estimator would read** at the bin's time, from the §3.1 model along the stated profile:
   - the bin's time is the first time in the event at which the stated profile reaches the bin's J/S (v1's rule);
   - over the estimator's span before that time (`cn0_windows` windows of `cn0_window_periods` prompts, from the
     campaign's loop design: 50 × 20 ms for these campaigns), each window's expected per-prompt moments `E|P|²` and
     `E|P|⁴` follow from the modelled C/N0 at the window's centre (signal amplitude and noise variance per prompt from
     the C/N0 and the coherent time; the complex Gaussian moments `A² + 2σ²` and `A⁴ + 8A²σ² + 8σ⁴`);
   - the moments are averaged over the windows as the estimator averages them, and the estimator's own M2M4 formula
     (`m2m4_cn0_from_moments`) turns the averages into the modelled reading.
   No parameter of this response is fitted or chosen from data: it is the estimator's impulse response (a boxcar over
   its span in the moment domain) followed by its transform.
2. **Inputs.** v1's registered and fresh inputs are now seen data. New fresh inputs: the bar-(a′) campaign with seed
   2026 1012 + 200 000 and the (b′) campaigns with seeds 207 000 to 207 049, not run by anyone. The control (unset) must
   reproduce v1's recorded control numbers.
3. **An oracle**, committed before any v2 engine code: a standard-library script that computes the modelled reading of
   a bin from the stated profile, `δ`, `Q`, the baseline and the loop design, independently of the engine, checked
   against the engine's model on every bin of the bar-(a′) campaign within 1e-6 dB.
4. **Batches and scoring** as v1 (`xval/d8a-labfit-lag/README.md`): raw output committed as it lands, unread; one
   scoring at the end by a rule committed with the readings.

## Bars (unchanged from v1)

(a′), (b′), (c) and (d) of `docs/design/LABFIT-FROM-IQ.md` §13.3 and §13.4, on the v1 inputs (registered and fresh, now
seen) **and** the v2 fresh inputs. Met on v2 only if all four hold on both. The `Q` clauses stay NOT MET (not
identifiable, §13.1).

## Disclosures

- v1's results, including its overshoot, are known when this is written, so the direction of v2's effect on the v1
  inputs is partly known. That is why v2 adds fresh inputs and fixes the response from the estimator's definition, with
  nothing chosen from data.
- (d) compares the closed-form threshold with the J/S at the declared loss, a drop dwell later under a ramp (§13.6). v2
  does not change the closed form, so (d) on a ramp is expected to keep its v1 behaviour (2.19 dB on the registered
  campaign); v2 does not claim to address it.

## What a MET and a NOT MET mean

As v1. In addition: MET on v2 does not undo v1's NOT MET. Both are published.
