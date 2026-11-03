<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration C5a (0.41): the optical-navigation measurement model

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Every numeric bar here is new and marked *proposed*. Advisory software, not certified
navigation equipment. Public sources only.

## Why this row

Roadmap item C5a adds an optical-navigation (OpNav) measurement model to the flight-dynamics tools, which already have
light time and the B-plane. The model turns a spacecraft state, a target body or star and a camera into a predicted
image measurement and its partial derivatives. Its bars are set here, before the code exists.

## The model under test (fixed now)

1. **Apparent direction of a body centre**: the Moon, Mars, or another body from the DE440 kernel, as seen from the
   spacecraft, with converged Newtonian light time and stellar aberration from the spacecraft's barycentric velocity
   (the SPICE `CN+S` correction).
2. **Apparent direction of a star**: a fixed catalogue direction (ICRF right ascension and declination, no proper motion
   or parallax) with stellar aberration only.
3. **Camera**: a pinhole camera with focal length in pixels, principal point, and Brown-Conrady distortion (radial
   k1, k2, k3; tangential p1, p2), the convention OpenCV documents for `projectPoints`. The camera attitude is a given
   quaternion; it is not estimated.
4. **Outputs**: the predicted pixel coordinates (u, v) of each target, and the partial derivatives of (u, v) with
   respect to the spacecraft position and velocity.

Not modelled and not claimed: image processing (centroiding, limb fitting, crater matching), the body's shape or phase,
attitude estimation, and any real camera's calibration.

## Oracles (independent, public)

| Oracle | Source | Used for |
|---|---|---|
| SPICE Toolkit via spiceypy | NAIF, <https://naif.jpl.nasa.gov/naif/toolkit.html>; spiceypy (MIT) | apparent directions with `CN+S` (bodies) and stellar aberration (stars, `stlabx` / aberration formula applied to a fixed direction) |
| Kernels | `de440s.bsp` and `naif0012.tls`, <https://naif.jpl.nasa.gov/pub/naif/generic_kernels/>, SHA-256 recorded | both sides read the same files |
| OpenCV `projectPoints` | OpenCV (Apache-2.0), version recorded | projection with distortion, independent of the engine |
| Central differences | a script that calls the engine's measurement function only, step 1 m and 1 mm/s | partial derivatives |

No oracle code is copied into the engine.

## Cases (fixed now)

Twelve geometries, built by rule from the numbers below, so nothing is chosen after code exists. Each observer sits at
distance `d` from its centre body along the ICRF unit vector of right ascension `a` and declination `b`, with a velocity
relative to that body of 1 km/s along ICRF +z; epochs are TDB.

| Case | Centre body | `d` (km) | `a`, `b` (deg) | Epoch (TDB) | Targets |
|---|---|---|---|---|---|
| L1 to L4 | Moon | 70 000; 150 000; 250 000; 400 000 | (0, 0); (90, 30); (180, -45); (270, 60) | 2025-01-01, 2026-07-01, 2028-01-01, 2029-07-01, all 00:00 | Moon, Earth |
| M1 to M4 | Mars barycentre | 1e6; 3e6; 5e6; 1e7 | (45, 10); (135, -20); (225, 40); (315, -60) | 2026-11-01, 2027-02-01, 2028-12-01, 2029-03-01, all 00:00 | Mars barycentre |
| S1 to S4 | Earth | 400 000; 1.5e6; 1e7; 1e8 | (30, 0); (120, 45); (210, -30); (300, 15) | 2025-06-01, 2026-06-01, 2027-06-01, 2028-06-01, all 00:00 | six stars at (a, b) = (0, 0), (60, 60), (120, -60), (180, 20), (240, -20), (300, 85) |

Camera: focal length 5000 px, principal point (1024, 1024), distortion (k1, k2, k3, p1, p2) = (-0.05, 0.01, 0, 1e-4,
-1e-4). For each target the attitude is the one that puts the target's apparent direction 300 px right and 200 px below
the principal point before distortion (a target that cannot be placed is skipped and counted). These values are
illustrative inputs, not any camera's.

## Bars (*proposed*)

| Id | Statement | Bar | Basis |
|---|---|---|---|
| O1 | Apparent body direction against SPICE `CN+S` | at most **1 milliarcsecond** on every body case | both read the same kernel; the remaining differences are time-scale conversion (microseconds) and the light-time iteration, both far below 1 mas |
| O2 | Apparent star direction against SPICE stellar aberration | at most **1 milliarcsecond** on every star case | as O1 |
| O3 | Pixel coordinates against OpenCV, same direction and camera | at most **1e-6 px** | the same closed-form projection evaluated by two codes in double precision |
| O4 | End to end: engine pixel against SPICE direction projected by OpenCV | at most **1e-4 px** | one pixel is 41.25 arcsec at this focal length, so O1's 1 mas is 2.4e-5 px; 1e-4 px keeps a margin over O1 plus O3 and still catches any frame, sign or unit error, which would be orders of magnitude larger |
| O5 | Partials against central differences | relative difference at most **1e-6** per element (absolute 1e-12 px/m for elements below 1e-6 of the row's largest) | finite-difference truncation and round-off at the stated steps |
| O6 | Additivity | every existing scenario's result is byte-identical with and without the new code | standard additivity rule |

## Verdict

All of O1 to O6 met: the measurement model is recorded as a library check against SPICE and OpenCV, **MODELLED** in
the ledger with that oracle text (it reproduces the stated geometry, not a flown camera). Any miss is published with its
numbers and pinned; no bar is loosened.

## What a result would and would not mean

MET says the engine computes the stated apparent directions, projection and partials as SPICE and OpenCV do. It does not
say the model is adequate for a flown mission: image processing, the body's figure and illumination, attitude error and
camera calibration are outside it. A comparison with real images (public PDS optical-navigation image sets with their
camera kernels) would be a separate pre-registration.

## Owner decisions at sign-off

1. The bar values O1 to O5.
2. Whether to plan a real-image comparison now or leave it to a later registration (proposed: later).

## Sign-off (3 November 2026)

Signed as proposed (≤ 1 mas, ≤ 1e-6 px, ≤ 1e-4 px end to end, 1e-6 relative). A real-image comparison is a later, separate pre-registration.
