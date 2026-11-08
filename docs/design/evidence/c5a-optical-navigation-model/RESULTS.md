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
