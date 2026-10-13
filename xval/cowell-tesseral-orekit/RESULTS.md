# Results: the opt-in tesseral Cowell tier against Orekit 12.2 (RM-09)

First comparison run 2026-10-12, after the pre-registration (f0e0e65, amended 2da899a) and with the
fixture committed unchanged (9fe9ccb). Test: `tests/cowell_tesseral_orekit_oracle.rs`.

| case | N | worst \|Δr\| over 24 h (m) | worst \|Δv\| (m/s) |
|---|---|---|---|
| G8 LEO (7000 km, 45°, J2000) | 8 | 0.0139 | 1.48e-5 |
| G70 LEO | 70 | 0.0144 | 1.51e-5 |
| G70 POLAR (500 km, 89.9°, 2026-01-01) | 70 | 0.0154 | 1.71e-5 |
| G70 SSO (700 km, 98.2°, 2026-01-01) | 70 | 0.0134 | 1.42e-5 |
| G70 GTO (400 km × GEO, 28.5°) | 70 | 0.0063 | 3.48e-6 |
| G70P LEO (+ Sun/Moon + SRP, 2026-01-01) | 70 | 0.0355 | 3.74e-5 |

**Bar 1 (|Δr| ≤ 0.5 m, |Δv| ≤ 5e-4 m/s): AGREES** on all 150 states; overall worst 0.0355 m,
3.74e-5 m/s. The residual is the two integrators' independent truncation error (kshana DP5(4) at
rtol 1e-12, Orekit DP8(5,3)), the same size as the existing zonal tiers (0.08 m).

**Bar 2, negative controls: both miss as required.** Frozen Earth (field held at the epoch
orientation): 6168.3 m at 24 h on G70 LEO. Zonal-only J2–J6 model: 20871.0 m. (The zonal control
also uses the zonal path's GM, 3.986004418e14, against the field's 3.986004415e14; the frozen-Earth
control isolates the rotation.) The comparison therefore discriminates field and frame errors at
the kilometre level against a centimetre-level agreement.

**Bar tightening after the run** (permitted; never loosened): the test now asserts |Δr| ≤ 0.1 m and
|Δv| ≤ 1e-4 m/s, about three times the measured worst.

Status: the opt-in tesseral evaluation, its Earth-rotation-angle frame plumbing and its integration
are VALIDATED against Orekit to degree/order 70. Not validated: Earth-orientation fidelity (both
sides use UT1 = TT and no precession–nutation in the `Era` frame), the `Cio` frame option (internal
bit-for-bit check against `precise_od` only), degrees above 70.
