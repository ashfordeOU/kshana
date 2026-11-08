<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C5a optical-navigation measurement model: readings

The pre-registration is `docs/design/evidence/c5a-optical-navigation-model/PREREGISTRATION.md`, signed off on
3 November 2026. This file fixes its readings **before the oracle is run and before any engine code**. MODELLED;
advisory software. Illustrative camera values, not any real camera's.

## Readings

1. **Frames and time.** ICRF is SPICE `J2000`. Epochs are TDB calendar dates; the engine takes the TDB Julian date and
   SPICE the ephemeris time of `str2et('<date> 00:00:00 TDB')`.
2. **Observer.** At each case epoch the centre body's barycentric state `(r_c, v_c)` is read from `de440s.bsp`
   (NAIF ids: Moon 301, Mars barycentre 4, Earth 399). The observer is `r_o = r_c + d·û(a, b)` and
   `v_o = v_c + (0, 0, 1000) m/s`. SPICE takes the same observer as a constant-velocity observer (`spkcvo`, state
   `(d·û, (0, 0, 1) km/s)` relative to the centre in `J2000`, `obsepc` = the case epoch).
3. **Bodies (O1).** SPICE: `spkcvo(target, et, 'J2000', 'OBSERVER', 'CN+S', …)`. Engine: converged Newtonian light
   time (iterate `lt = |r_t(et − lt) − r_o| / c` from `lt = 0` until the change is below 1e-12 s, at most 10 times),
   then stellar aberration with `β = v_o / c` in SPICE's `stelab` form: with `û` the geometric direction and
   `s = |û × β|`, the apparent direction is `û·√(1 − s²) + β − (û·β)·û`. Targets: L cases the Moon and the Earth;
   M cases the Mars barycentre.
4. **Stars (O2).** Fixed unit vectors `û(a, b)`, no proper motion or parallax. SPICE: `stelab(û, v_o)`. Engine: the
   same aberration as reading 3.
5. **Attitude (a given input).** For each target, the attitude is built from the **SPICE** apparent direction `t`
   (so both sides use one attitude): frame A has `z_A = t`, `x_A = unit(ẑ × t)` (ICRF ẑ), `y_A = z_A × x_A`; then the
   minimal rotation that takes the camera boresight `(0, 0, 1)` to `unit(300/5000, 200/5000, 1)` is applied after A.
   A target with `|ẑ × t| < 1e-9` cannot be placed and is skipped and counted. The resulting ICRF-to-camera matrix is
   written to the oracle file as a SPICE `m2q` quaternion (scalar first); the engine reads that quaternion. The camera
   frame is OpenCV's: x right, y down, z along the boresight.
6. **Projection (O3).** OpenCV `projectPoints` with the apparent unit direction as the object point, `rvec` the
   Rodrigues vector of the attitude matrix, `tvec = 0`, `K = [[5000, 0, 1024], [0, 5000, 1024], [0, 0, 1]]` and
   OpenCV's coefficient order `(k1, k2, p1, p2, k3) = (−0.05, 0.01, 1e-4, −1e-4, 0)` (the pre-registration's
   `(k1, k2, k3, p1, p2) = (−0.05, 0.01, 0, 1e-4, −1e-4)`). O3 projects the SPICE direction with both codes.
7. **End to end (O4).** The engine's pixel from its own apparent direction against OpenCV's projection of the SPICE
   direction.
8. **Angles.** The angle between two unit vectors is `atan2(|a × b|, a·b)`, reported in milliarcseconds.
9. **Partials (O5).** The engine returns `∂(u, v)/∂(r_o, v_o)` (2 × 6). The check is a Rust test that calls the
   engine's measurement function only, with central differences of step 1 m (position) and 1 mm/s (velocity), with
   the attitude held fixed. An element passes when its relative difference is at most 1e-6, or, when its central
   difference is below 1e-6 of the largest absolute element of its row, when the absolute difference is at most 1e-12
   (px/m or px/(m/s)).
10. **Additivity (O6).** The model is a new module. No existing source file changes except the module list in
    `src/lib.rs`, so every existing scenario output is unchanged; the existing pinned tests are run as before.
11. **Kernels.** The oracle reads NAIF's full `de440s.bsp` (SHA-256 `c1c7feea…49f2`) and `naif0012.tls`
    (`678e32bd…039b`). The engine test reads a cut of `de440s.bsp` holding segments 10, 3, 301, 399 and 4 over
    2025-01-01 to 2029-07-02, made bit for bit by the existing cutting code
    (`tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py`) and checked by SPICE against the full file at every
    case epoch.
12. **Counts.** L: 4 cases × 2 targets; M: 4 × 1; S: 4 × 6 stars; 36 measurements in all, less any skipped by
    reading 5.
