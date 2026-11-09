<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration C3 v2 (0.41.x): the CAPSTONE NRHO with a per-window radiation-pressure estimate

**Status: Signed off by the owner on 9 November 2026, as drafted (proposed 8 November 2026). No code or data for v2 before this sign-off. Bars may be tightened after a run, never loosened.** Advisory software, not navigation equipment. Public sources only.

## Why a v2

C3 v1 (`PREREGISTRATION.md`, signed 3 November 2026; `RESULTS.md`) met C3-R (M1 on A2's window W0: 21.66 km and
4.24 km). It missed C3-H on all three fresh windows of span F (end position 37.25, 36.23 and 49.65 km against 25 km;
periapsis met everywhere). It missed C3-S on H2 (57.13 km) while meeting it on H1 (12.92 km). One cannonball `k`
fitted on E did not carry over the 89 days. v1 stands as recorded; A2 stays NOT MET; no bar is loosened.

## The options weighed

1. **A per-window radiation-pressure estimate, with an attitude-independent area model (proposed as the scored
   change).** C3-S's miss on H2 fits a radiation-pressure acceleration that changes over weeks, through attitude, the
   effective area or small manoeuvres. A cannonball model is already attitude-independent; what v1 did not allow is
   `k` changing between windows. Estimating `k` inside each window, on data before the scored point, tests whether one
   cannonball term holds over one revolution.
2. **An initial-state sensitivity analysis (proposed as a reported analysis, not a bar).** If the end-position spread
   from a plausible initial-state error is close to 25 km, no force model could meet the bar. Then a miss would say
   nothing about the force model. This measures how informative each window is; it does not change the model.

Both are proposed. Only the first carries a verdict.

## What changes

1. **Model M3** = M1 (DE440 Sun, Earth, Venus, Jupiter barycentre, unchanged) plus v1's cannonball radiation pressure
   with conical Earth and Moon shadows, with `k = Cr·A/m` estimated **per window** on the window's first 78 hourly
   samples (the first half).
   - The estimate uses v1's procedure: [0, 0.1] m²/kg, golden-section search to 1e-5, minimising the sum of squared 3-D
     position differences, propagating from the window's first state.
   - The scored point is +156 h, as in A2. Its second half has not entered the estimate.
   - No `k` from any other window is used.
2. **Fresh span G**, fetched by v1's script and rule after sign-off. JPL Horizons `-1176`, Moon-centred, ICRF, TDB,
   hourly, **2023-07-01 00:00 to 2023-09-28 00:00 UTC** (89 days, the length of F, starting after F's end on
   2023-06-29).
   - A2's manoeuvre-hour test is applied with M1, as in v1 step 4. The manoeuvre-free runs of at least 157 samples are
     taken in time order without overlap: **G1, G2, G3**.
   - If G gives fewer than three, those that exist are scored and the count is stated. If Horizons does not cover G in
     full, v2 is "not run". No other span is tried.
3. **The sensitivity analysis (reported, no bar).** On each window of F and G, M1 and M3 are each run 12 more times,
   from the start state perturbed one axis at a time by ±10 m in position and ±1 cm/s in velocity. These are
   illustrative magnitudes: the reconstruction's covariance is not public.
   - For each window, the largest end-position change is reported.
   - A window where it exceeds 12.5 km (half the bar) is marked **low-information**. Its verdict still counts, but the
     result says so.
4. **Data use.** Span F's windows (W0, E, H1, H2) are seen and are reported under M3 with no verdict. Only G's windows
   are scored.

## Bars

| Id | Run | Bar |
|---|---|---|
| C3-S v2 | M3 on G1, G2, G3, each window separately | A2's bars at +156 h: end position at most 25 km, osculating periapsis radius at most 10 km |
| Reported | M1 on G1 to G3; M3 and M1 on W0, E, H1, H2; the sensitivity spreads; each window's `k` | no bar |

C3-S v2 is MET only if both bars hold on every G window that exists. It is its own row. It does not turn A2 or C3-H met.

## Disclosures

- v1's results on F, including that one `k` from E holds on H1 and not on H2, are known when this is written. The
  per-window estimate is chosen knowing them. That is why only fresh windows are scored.
- Estimating `k` on the first half of the same window scored at its end is a weaker test than v1's carry-over: it asks
  whether one cannonball term holds within a revolution, not across weeks. A MET would say that, and no more.
- The perturbation magnitudes of the sensitivity analysis are illustrative. A low-information mark is a caveat, not a
  measurement of the reconstruction's error.

## What a MET and a NOT MET mean

MET says DE440 third bodies plus one cannonball radiation-pressure term estimated on a window's first half reproduce
CAPSTONE's reconstructed end state and periapsis on unseen windows to A2's bars. It does not identify the spacecraft's
area-to-mass ratio and says nothing about orbit determination or station keeping. NOT MET leaves small manoeuvres below
the test, the reconstruction itself, and a non-cannonball radiation model as the named candidates. Results stay
MODELLED.
