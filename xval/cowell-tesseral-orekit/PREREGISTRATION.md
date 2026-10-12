# Pre-registration: the opt-in tesseral Cowell tier against Orekit 12.2 (RM-09)

Committed alone, before kshana's opt-in tesseral propagation is compared with any Orekit output.
The bars below are not loosened after the comparison has been run; a miss is recorded in
`RESULTS.md` with its numbers.

## The change being validated

`propagator::ForceModel::geopotential` (`Geopotential`, `EarthFixedFrame::Era`), added in
d23eb97. It is opt-in: `None` by default, so no existing output moves. It evaluates a
fully-normalized `SphericalHarmonicField` (here the bundled EGM2008 truncated to N×N) in an Earth-fixed
frame reached by a rotation about the inertial z axis by the IAU 2000 Earth rotation angle at
UT1 = TT, evaluated at `epoch_jd_tt + t/86400`.

## Oracle

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0, jars SHA-1 checked against Maven Central), run as a
separate program (`tests/fixtures/cowell_tesseral_orekit_oracle/java/TesseralDriver.java`):
`NumericalPropagator` with `DormandPrince853` (position tolerance seed 1e-11, max step 600 s),
`HolmesFeatherstoneAttractionModel` over the same coefficients read from the committed
`tools/egm2008_to70.gfc`, `NewtonianAttraction` with the field's GM, the body frame rotated by the
same Earth-rotation-angle formula (ported verbatim). Tier G70P adds kshana's own Sun/Moon series
and cannonball SRP exactly as the existing `numerical_cowell_propagator` fixture does.

Cases (24 h, 25 hourly states each): G8 LEO (a = 7000 km, i = 45°, J2000); G70 LEO (same);
G70 POLAR (500 km, i = 89.9°, 2026-01-01 TT); G70 SSO (700 km, i = 98.2°, 2026-01-01 TT);
G70 GTO (400 km × GEO, i = 28.5°, J2000); G70P LEO (+ Sun/Moon + SRP, 2026-01-01 TT).

## kshana side (fixed now)

`propagator::propagate_dopri` (Dormand–Prince 5(4)) with `Tolerance { rtol: 1e-12, atol: 1e-9 }`,
`ForceModel::two_body().with_geopotential(Geopotential::egm2008(N))`, plus for G70P
`.third_body(true, true, epoch).solar_radiation(1.5, 0.02)`; for the others `.third_body(false,
false, epoch)` (sets the epoch only). Each hourly state is propagated from t = 0.

## Bars (fixed now)

1. Every state of every case: `|Δr| ≤ 0.5 m` and `|Δv| ≤ 5e-4 m/s` against Orekit.
   (The zonal tiers of the existing fixture agree to 0.08 m with the same two-integrator
   setup; the 0.5 m bar allows for the rougher 70×70 field without hiding a field or frame error.)
2. Sensitivity (negative controls, must FAIL bar 1 by a wide margin, else the test is not
   discriminating): (a) the same kshana run with the Earth frozen at its epoch orientation must
   miss the G70 LEO 24 h state by more than 100 m; (b) kshana's J2–J6 zonal model must miss the
   G70 LEO 24 h state by more than 100 m.

## What this does not validate

Earth-orientation fidelity (precession–nutation, polar motion, UT1−UTC): both sides use the same
simplified rotation. The CIO frame option (`EarthFixedFrame::Cio`) is checked only internally
(bit-for-bit against `precise_od`, whose frame chain is separately validated). Degrees above 70
(see the high-degree item).
