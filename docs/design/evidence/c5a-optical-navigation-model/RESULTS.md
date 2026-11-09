<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C5a: the optical-navigation measurement model: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings: `xval/c5a-opnav/README.md`. MODELLED:
the model reproduces the stated geometry against SPICE and OpenCV; it is not tested against a flown camera. The camera
values are illustrative.

| Step | Commit |
|---|---|
| Readings 1 to 12 | `b95ce5f02` |
| Oracle (SPICE via spiceypy 8.3.0, CSPICE N0067; OpenCV 5.0.0), its output (36 measurements, 0 skipped) and the de440s cut | `4e71761e1` |
| Engine (`src/opnav.rs`) and the scored run, once | this commit (`xval/c5a-opnav/result.json`) |

The bars were not changed.

## Summary (36 measurements: 8 body directions near the Moon, 4 near Mars, 24 stars)

| Bar | Result |
|---|---|
| O1 body direction against SPICE `CN+S`, ≤ 1 mas | **MET**: worst 0.0016 mas |
| O2 star direction against SPICE `stelab`, ≤ 1 mas | **MET**: worst 3.2e-8 mas |
| O3 pixel against OpenCV, same direction, ≤ 1e-6 px | **MET**: worst 1.3e-11 px |
| O4 end to end against SPICE + OpenCV, ≤ 1e-4 px | **MET**: worst 3.8e-8 px |
| O5 partials against central differences (1 m, 1 mm/s), relative ≤ 1e-6 (absolute 1e-12 for small elements) | **NOT MET**: 258 of 432 elements fail; worst relative difference 1.0 (an element that is zero analytically against a 5e-10 px/m difference) |
| O6 additivity | **MET**: `src/opnav.rs` is a new module. The only other change is its line in `src/lib.rs`; no existing output can change |

**C5a is NOT MET** (O5). The directions and the projection agree with SPICE and OpenCV far inside their bars.

## What the O5 miss shows

- **The largest elements agree.** On every row the largest elements of the analytic and difference partials agree to
  about 1e-7 to 1e-9 relative.
- **The failures are in small and middle-sized elements.** The measurement function takes barycentric positions
  (about 1.5e11 m), which a double resolves to about 3e-5 m. With the registered 1 m step that round-off gives
  differences of order 1e-10 px/m, and the 1 mm/s velocity step divides the pixel's own round-off (about 3e-13 px) by
  2e-3. Elements below about 1e-3 of their row's largest therefore cannot be checked to 1e-6 at these steps. The
  pre-registration's basis assumed round-off would stay below the bar; it does not.
- **A diagnostic with no bar**, added after the scored run (`diagnostic_no_bar_1km_1mps` in `result.json`): with steps
  of 1 km and 1 m/s, the worst relative difference falls from 1.0 to 8.0e-4, and the failing elements from 258 to 69.
  The remaining ones are again small elements. This points to round-off in the differences, not to an error in the
  partials. It does not prove it.
- The scored O1 to O5 numbers in `result.json` are unchanged by adding the diagnostic (checked field by field against
  the first output).
- **For a v2 (to be proposed, not done here):** check the partials in a better-conditioned way, for example
  differences taken on observer-relative coordinates or a complex-step check, with a bar stated relative to the row's
  largest element.

## What this does not show

- It does not test image processing, the body's shape or phase, attitude error or any real camera's calibration.
- A comparison with real optical-navigation images is a later, separate pre-registration.
- Results stay MODELLED.

## v2 (signed off 9 November 2026): the partials against a complex-step oracle

Pre-registration: `PREREGISTRATION-v2.md`. Readings, oracle and its output: `xval/c5a-opnav-v2/`, committed with the
fresh geometries, the longer kernel cut and the test at `72e566af0`, before the scored run. No engine change.

| Bar | Result |
|---|---|
| Oracle self-check: its value against SPICE and OpenCV | 3.6e-8 mas and 4.6e-11 px over 72 measurements (bars 1 mas, 1e-4 px) |
| **O5 v2**: analytic partials against the complex-step oracle, within 1e-6 of each row's largest element, 72 measurements (v1's 36 and 36 fresh) | **MET**: worst 2.3e-11; no failing row |
| O1 to O4 on the 36 fresh measurements (v1's bars) | met: O1 3.7e-3 mas, O2 2.3e-8 mas, O3 4.7e-11 px, O4 8.4e-8 px |
| O5 v2-x, observer-relative central differences (reported, no verdict) | worst 4.0e-5 of the row's largest; 144 of 288 rows above 1e-6 |

**C5a is MET on v2.** v1's O5 stays NOT MET as recorded.

Disclosures and what this shows:

- **The scored run and the result file.** The scored run printed the summary without writing `result_v2.json` (the
  write switch was not set). An identical second run (the computation is deterministic) wrote the file, and its values
  equal the printed summary to every digit.
- **What the result says.** The partials are the derivatives of the stated model to 2.3e-11 of each row's scale: v1's
  failures were the difference check's round-off, as v1's diagnostic suggested.
- **The second check.** The observer-relative differences still carry the rounding of the observer's construction
  (barycentric `r_c + ρ`, about 3e-5 m). They are reported as they fall. Removing that rounding needs an engine entry
  point taking the relative state, which v2 does not add.
- **The bar.** It is relative to the row's largest element, weaker for small elements than v1's, and was chosen after
  v1 (stated in the pre-registration).
- Results stay MODELLED; no real camera or image is checked.
