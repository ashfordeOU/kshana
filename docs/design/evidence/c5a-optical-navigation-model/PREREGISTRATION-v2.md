<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration C5a v2 (0.41.x): the optical-navigation partials, checked in a well-conditioned way

**Status: Signed off by the owner on 9 November 2026, as drafted (proposed 8 November 2026). No code or data for v2 before this sign-off. Bars may be tightened after a run, never loosened.** Advisory software, not navigation equipment. Public sources only.

## Why a v2

C5a v1 (`PREREGISTRATION.md`, signed 3 November 2026) is NOT MET on O5 (`RESULTS.md`, `xval/c5a-opnav/result.json`):
258 of 432 partial-derivative elements differ from central differences by more than 1e-6 relative; the worst relative
difference is 1.0 (an element that is zero analytically against a 5e-10 px/m difference). O1 to O4 and O6 are met. The
largest element of every row agrees to about 1e-7 to 1e-9 relative. The failures are in small elements. The measurement
function takes barycentric positions near 1.5e11 m, which a double resolves to about 3e-5 m, so a 1 m difference step
carries round-off of order 1e-10 px/m. v1's basis assumed the round-off would stay below the bar; it does not. v1 stands
as recorded; O5 is not loosened. v2 changes how the partials are checked and how the bar is stated, and adds fresh
geometries.

## What changes (everything else is v1 unchanged)

1. **The primary oracle: a complex-step check, independent of the engine.**
   - A standard-library-plus-numpy script reimplements the measurement model in complex arithmetic: the light-time
     iteration, stellar aberration, the attitude rotation and the Brown-Conrady projection.
   - The ephemeris enters as constants read from SPICE (spiceypy, the same `de440s.bsp`): the target's position and
     velocity at the converged light-time epoch. A complex perturbation of the observer's state moves that epoch by an
     imaginary amount; the script carries it through the target's velocity, which is exact to first order, all a
     complex step needs.
   - Each partial is `Im f(x + i h e_j)/h` with `h = 1e-20` of the element's unit. The result has no subtractive
     cancellation, so it is accurate to the double's precision whatever the size of `x`.
2. **A second check, reported with its own bar: central differences on observer-relative coordinates.**
   - The engine's measurement function is wrapped so that the observer's state is given **relative to the target body's
     centre**, with the target's barycentric state added inside, in one place. The step is taken on the relative
     coordinates.
   - The steps scale with the geometry: `1e-6 × |r_rel|` in position and `1e-6 × |v_rel|` in velocity.
   - This removes the 1.5e11 m offset from the differenced variable. It is reported against the same bar as the
     complex step, as a cross-check, and is not part of the verdict.
3. **The bar, stated per row.** For each row (u or v) of each measurement, every element of the analytic partials must
   agree with the complex-step value within **1e-6 of the row's largest element** (`|a_j − c_j| ≤ 1e-6 · max_k |c_k|`).
   An element that is exactly zero analytically must be within the same absolute tolerance.
   - Position and velocity partials are separate rows: each row's largest element is taken over its own three
     components.
4. **Inputs.** v1's 12 geometries (36 measurements) are now seen. v2 adds 12 fresh geometries built by v1's rule with
   every parameter moved by a fixed amount: distances × 1.3; right ascensions + 17°; declinations + 7° (−7° where that
   would leave [−80°, 80°]); epochs + 97 days. The targets, camera and attitude rule are v1's.
5. **Order.** The complex-step script and its output on the 24 geometries are committed before any v2 engine change.
   The engine's partials code is not changed for v2; only the check changes. A real error found by the new check would
   be a finding, and its fix would need its own registration.

## Bars

| Id | Statement | Bar |
|---|---|---|
| O5 v2 | Analytic partials against the complex-step oracle, every element, v1 and fresh geometries | within 1e-6 of the row's largest element |
| O5 v2-x (reported) | Central differences on observer-relative coordinates against the analytic partials | same tolerance; reported with no verdict |
| O1 to O4, O6 | as v1, re-run on the fresh geometries as regressions | v1's bars |

C5a is MET on v2 only if O5 v2 and the regressions hold on all 24 geometries.

## Disclosures

- v1's diagnostic (steps of 1 km and 1 m/s: worst relative difference 8.0e-4, 69 elements still failing, all small) is
  known when this is written. So it is known that the largest elements agree, and that small elements are where a check
  is hard. That is why the primary check has no subtractive cancellation, and why the bar is relative to the row's
  largest element rather than to each element. The second change is a weaker bar for small elements than v1's, chosen
  after v1's result; it is stated here as such.
- A complex-step oracle checks the derivative of the model as the oracle states it. The oracle's model is checked
  against SPICE and OpenCV on the values (O1 to O4) before its derivatives are used.

## What a MET and a NOT MET mean

As v1. MET on v2 says the analytic partials are the derivatives of the stated model to 1e-6 of each row's scale; it does
not undo v1's NOT MET, and both are published.
