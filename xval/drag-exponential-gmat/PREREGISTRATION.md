# Pre-registration: the default exponential drag against GMAT R2022a (WP-01, drag cross-check, GMAT leg)

Committed alone, before kshana's drag is compared with any GMAT output and before any GMAT run
of these cases. Bars are not loosened after the run; a miss is recorded in `RESULTS.md` with its
numbers and pinned by a test that asserts the recorded miss.

## Why the exponential tier

GMAT R2022a's help lists NRLMSISE00 only "(with plugin)", and the plugin is not in the public
Linux build: an availability probe (a throwaway polar 600 km, 60 s case, not one of the cases
below, no output kept) gets `Unable to create AtmosphereModel "NRLMSISE00"` from `GmatConsole`,
while the same probe with `Exponential` runs. So the NRLMSISE-00 tier (compared with Orekit in
`xval/drag-tier-orekit/`) has no GMAT counterpart here. MSISE-90 is not NRLMSISE-00 and is not compared as if it were. This leg
compares kshana's **default** density, `forces::atmospheric_density` (the piecewise-exponential
table of Vallado, *Fundamentals*, Table 8-4), with GMAT's `Exponential` model.

## What is compared

`propagator::ForceModel::two_body().third_body(false, false, epoch).drag(0.02)` (the default
`DensityModel::Exponential`), integrated with `propagate_dopri` (`rtol 1e-12, atol 1e-9`), one
integration continued hour by hour; and the same with `drag` off.

## Oracle

GMAT R2022a (NASA GSFC, Apache-2.0 per `License.txt` in the official SourceForge repository at
tag GMAT-R2022a), the Linux build `gmat-ubuntu-x64-R2022a.tar.gz`, run with `GmatConsole` on a
committed script; GMAT is run, never vendored. Conventions fixed now, from the R2022a source
(`ExponentialAtmosphere.cpp`, `AtmosphereModel.cpp`, `DragForce.cpp`, read, not run):

1. **Same table.** GMAT's `ExponentialAtmosphere::SetConstants` holds the same 28 bands
   (base height, density, scale height) as kshana's `atmospheric_density`, value for value, with
   no smoothing between bands.
2. **Height: the model difference.** GMAT takes the **geodetic** height above its Earth
   ellipsoid (equatorial radius 6378.1363 km, flattening of its Earth body) in the Earth-fixed
   frame; kshana takes the **spherical** altitude `|r| − 6378.137 km`. They coincide on the
   equator (to 0.7 m of radius, a density factor of 1 + 1.2e-5 at 400 km) and differ by up to
   about 21 km at the poles. The bars therefore use **equatorial** orbits only, at an epoch where
   GMAT's Earth-fixed equator is the inertial equator to nutation (J2000.0); an inclined case is
   run and reported without a bar, as the size of this model difference.
3. **Rotating atmosphere.** GMAT's relative velocity uses the angular velocity of its Earth-fixed
   frame (refreshed every 0.02 day); kshana's uses `ωₑ = 7.2921151467e-5 rad/s` about the inertial
   z axis. At J2000.0 the two differ by the nutation tilt (about 4e-5 rad) and the length-of-day
   rate, about 3e-6 of the drag.
4. **Drag law.** Both: `a = −½·ρ·(C_D·A/m)·|v_rel|·v_rel`. GMAT spacecraft `Cd = 2.0`,
   `DragArea = 0.01 m²`, `DryMass = 1 kg` (`C_D·A/m = 0.02 m²/kg`, kshana's `drag(0.02)`);
   no SRP, no third bodies.
5. **Gravity: cancelled by construction.** GMAT's point-mass Earth (`GravityField.Earth`,
   degree 0, order 0) uses its gravity file's μ (JGM-2, 398600.4415 km³/s²), kshana uses
   3.986004418e14 m³/s². The bars are therefore on the **drag-induced displacement**: each side
   runs the case with and without drag, and `D(t) = r_drag(t) − r_nodrag(t)` is compared
   (likewise `ΔV(t)` for velocity). Gravity, μ and the integrators then cancel to first order.
   GMAT integrator: `PrinceDormand78`, `Accuracy = 1e-13`, `MaxStep = 60 s`.

## Cases (fixed now)

Epoch 2000-01-01 12:00:00.000 TT (JD 2451545.0), 24 h, 25 hourly states, initial position on the
inertial x axis, MJ2000 equatorial frame (kshana's GCRF; the frame bias of 0.02″ is ignored).

| id | orbit | i | bar |
|---|---|---|---|
| E400 | circular, 400 km (r = 6 778 137 m) | 0° | yes |
| E300 | circular, 300 km | 0° | yes |
| E250x600 | perigee 250 km, apogee 600 km, start at perigee | 0° | yes |
| I400 | circular, 400 km | 51.6° | reported only (convention 2) |

## Bars (fixed now)

With `D_k`, `D_g` the kshana and GMAT drag displacements and `ΔV_k`, `ΔV_g` the velocity analogues:

1. Every state of E400, E300 and E250x600: `|D_k − D_g| ≤ 0.5 m + 1e-3·|D_g|` and
   `|ΔV_k − ΔV_g| ≤ 5e-4 m/s + 1e-3·|ΔV_g|` (the construction of the Orekit drag-tier bar).
2. Discrimination (must hold, else bar 1 does not test drag): `|D_g(24 h)| > 100 m` on each of
   the three; and kshana with `C_D·A/m = 0.0202` (+1 %) on E400 breaks bar 1 at 24 h.
3. I400, reported: `|D_k − D_g|` at 24 h. Predicted sign: GMAT's geodetic height exceeds
   kshana's spherical altitude away from the equator, so GMAT's density is lower and
   `|D_g(24 h)| < |D_k(24 h)|`. No bar.

## Not covered

The exponential model's accuracy against measured density; time-varying space weather (the model
has none); NRLMSISE-00 (no GMAT counterpart; see `xval/drag-tier-orekit/`); Earth orientation
beyond convention 3.
