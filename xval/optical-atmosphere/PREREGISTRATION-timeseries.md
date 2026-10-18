<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration addendum: the optical-atmosphere time series (0.38)

Committed before the module exists and before any run. Bars may be tightened after a run, never loosened. A miss is
recorded NOT MET with its numbers and pinned by a test that asserts the miss.

## What is added, and what is not claimed

An opt-in `[timeseries]` table (`duration_h`, `step_s`, `seed`) makes `optical-atmosphere` also write, per site, **one seeded
realisation** of the link through time: cloud episodes (clear spells with exponential length, cloud outages with the stated
log-normal length), the liquid-water column of each cloud episode (log-normal, the stated climate), a gamma-gamma
scintillation fade at each step, the resulting link margin and the link-up flag. It is a draw from the model the statistical
output already states, drawn so a page can show the model "against time". It is **MODELLED**. No external oracle exists for
it and none is claimed: the checks below are self-consistency and determinism checks, never VALIDATED. Without the table the
output is byte-identical to 0.37.

## Bars fixed now

- **T1 determinism.** The same scenario and seed give the same bytes twice; a different seed gives different bytes.
- **T2 opt-in.** A scenario without `[timeseries]` writes no `timeseries` key and the same JSON as before.
- **T3 consistency of availability.** Over `duration_h = 8760` at `step_s = 600`, for the three default sites and seeds 37 and
  38, the realised availability is within **6 percentage points** of the site's stated `availability_pct`.
- **T4 consistency of cloud.** Over the same runs the realised fraction of steps in a cloud episode is within **5 percentage
  points** of the site's `p_cloud`.
- **T5 definitions.** Every step has `up == (margin_db >= 0 and pointing ok)`, every value is finite, and `margin_db` equals
  the site's `fade_budget_db` minus the step's cloud and scintillation fades.
- **T6 portability.** The module draws only through `portable_distr` and `PortableFloat`, so native and wasm32 give the same
  bytes (checked by the repo's existing portable-maths guard and by T1 on the wasm build's test).
