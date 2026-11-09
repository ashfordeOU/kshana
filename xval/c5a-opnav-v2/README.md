<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# C5a v2: the optical-navigation partials, checked in a well-conditioned way: readings and oracle

The pre-registration is `docs/design/evidence/c5a-optical-navigation-model/PREREGISTRATION-v2.md`, signed off on 9
November 2026. Committed with the oracle and its output **before the engine's v2 run**. No engine code changes for v2.
v1's readings (`xval/c5a-opnav/README.md`) stand unless changed here. MODELLED; illustrative camera values.

## Readings

1. **Geometries.**
   - **v1's 12, now seen:** 36 measurements.
   - **12 fresh, by the registered rule:** distances × 1.3; right ascension + 17° (mod 360); declination + 7°, or − 7°
     where + 7° would leave [−80°, 80°]; epochs + 97 days.
   - **The fresh list:**
     - L1f 91 000 km (17, 7) 2025-04-08;
     - L2f 195 000 km (107, 37) 2026-10-06;
     - L3f 325 000 km (197, −38) 2028-04-07;
     - L4f 520 000 km (287, 67) 2029-10-06;
     - M1f 1.3e6 km (62, 17) 2027-02-06;
     - M2f 3.9e6 km (152, −13) 2027-05-09;
     - M3f 6.5e6 km (242, 47) 2029-03-08;
     - M4f 1.3e7 km (332, −53) 2029-06-06;
     - S1f 520 000 km (47, 7) 2025-09-06;
     - S2f 1.95e6 km (137, 52) 2026-09-06;
     - S3f 1.3e7 km (227, −23) 2027-09-06;
     - S4f 1.3e8 km (317, 22) 2028-09-06.
   - **Targets, camera and attitude rule:** as v1. 36 fresh measurements.
2. **The complex-step oracle** (`oracle_v2.py`, numpy and spiceypy, no Kshana code) reimplements the measurement in
   complex arithmetic:
   - converged Newtonian light time;
   - stellar aberration in v1's `stelab` form;
   - the attitude matrix;
   - Brown-Conrady projection in OpenCV's order.
   It uses unconjugated sums, so the norm is analytic.
   - **Ephemeris.** The target's barycentric position and velocity come from SPICE (`spkgeo`) at the real part of the
     retarded epoch. An imaginary part of the light time enters through the target's velocity, which is exact to first
     order, as a complex step needs.
   - **The step.** `h = 1e-20` m in position and m/s in velocity. Each partial is `Im f(x + i h e_j)/h`.
3. **The oracle's own check** before its derivatives are used: the real part of its direction against SPICE's apparent
   direction, and of its pixel against OpenCV's projection of the SPICE direction, on every measurement. Bars: 1 mas
   and 1e-4 px (v1's O1/O2 and O4). Its run gives 3.6e-8 mas and 4.6e-11 px over 72 measurements.
4. **O5 v2.**
   - Compared quantities: the engine's analytic partials (`opnav::measure`, at its own observer state as v1 computes
     it) against the complex-step values.
   - Bar, per row: `|a_j − c_j| ≤ 1e-6 · max_k |c_k|`, with each row's position elements and velocity elements taken
     separately (so 4 rows of 3 elements per measurement).
   - A row whose complex-step elements are all zero (a star's position row) needs the analytic elements to be zero.
5. **O5 v2-x (reported, no verdict).** Central differences on observer-relative coordinates.
   - The observer is `r_c + ρ`, with the step taken on `ρ` and on the velocity offset. The steps are `1e-6 |ρ|` (m)
     and `1e-6 |v_rel|` (m/s), with `v_rel` the 1 km/s offset.
   - The addition of the centre's barycentric state happens in one place (the observer's construction); its rounding
     is not removed and is reported as it falls.
6. **Regressions.** O1 to O4 on the 36 fresh measurements, against `oracle_v2.json`'s SPICE and OpenCV values with v1's
   bars. O6 holds as v1 (no engine change).
7. **Kernel.** The engine reads a new cut, `tests/fixtures/c5a_opnav/de440s_2025-01-01_2029-10-08.bsp`, made by
   `make_kernel_cut_v2.py` (v1's script with the window and the 24 epochs). The script checks with SPICE that the cut
   is bit for bit identical to the full file at all 24 epochs. SHA-256 `24f7a9ec…19a7`.
8. **Verdict.** C5a is met on v2 only if O5 v2 holds on all 72 measurements and the regressions hold on the fresh ones.
