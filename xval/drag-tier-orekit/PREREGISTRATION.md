# Pre-registration: the opt-in NRLMSISE-00 drag tier against Orekit 12.2 (RM-13, DS-PA-15)

Committed alone, before kshana's drag-tier propagation is compared with any Orekit output. Bars
are not loosened after the run; a miss is recorded in `RESULTS.md` with its numbers.

## What is compared

`propagator::ForceModel::two_body().third_body(false, false, epoch).drag(0.02)
.drag_density(DensityModel::Nrlmsise00 { f107a, f107, ap })`: quadratic drag against the
co-rotating atmosphere with the NRLMSISE-00 (gtd7d) total mass density at the WGS-84 geodetic
point, the Earth-fixed frame reached by the Earth rotation angle at UT1 = TT, local solar time
UT + lon/15, day of year and seconds of day from JD(TT). Integrated with `propagate_dopri`
(`rtol 1e-12, atol 1e-9`), one integration continued hour by hour.

## Oracle

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0), run as a separate program
(`tests/fixtures/drag_tier_orekit_oracle/java/DragDriver.java`): point mass + `DragForce` with
Orekit's own `NRLMSISE00` implementation and `IsotropicDrag` (Cd·A/m = 0.02 m²/kg, mass 1 kg),
DormandPrince853 in GCRF; the same Earth-rotation-angle body frame, WGS-84, a "mean Sun" giving
local solar time UT + lon/15, and TT as its UT. A separate oracle-against-oracle probe (Orekit vs
pymsis at 60 random points, no kshana code involved) agreed to 5.2e-5 in density, confirming
the convention setup. Cases (24 h, 25 hourly states, epoch 2024-06-01 00:00 TT, circular,
i = 51.6°): L400 (400 km; F10.7a 70, F10.7 68, Ap 4), M400 (150, 160, 15), H400 (230, 250, 80),
M300 (300 km; 150, 160, 15).

## Bars (fixed now)

Let D(t) = |r_kshana,drag(t) − r_kshana,no-drag(t)| be the drag-induced displacement of the
case (the same kshana run with `drag` off).

1. Every state of every case: |Δr| ≤ **0.5 m + 1e-3·D(t)** and |Δv| ≤ **5e-4 m/s + 1e-3·|Δv_drag(t)|**
   (the same construction on velocity). The 1e-3 relative term allows for the two independent
   NRLMSISE-00 implementations (5e-5 in density) and convention residue; the 0.5 m term for the
   two integrators.
2. Sensitivity control: on M400 the same kshana run with the default exponential density must
   miss the 24 h Orekit state by more than **100 m**; and D(24 h) on M400 must exceed 100 m
   (otherwise drag is not being tested). Reported either way.

## Not covered

The model's accuracy against measured density; time-varying space weather; Earth orientation
beyond the Earth rotation angle (both sides use the same simplified frame). The GMAT leg is not
run here (no GMAT installation in this environment); it stays a follow-on.
