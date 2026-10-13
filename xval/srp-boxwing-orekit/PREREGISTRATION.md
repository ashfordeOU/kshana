# Pre-registration: box-wing and ECOM2 SRP against Orekit 12.2 (DS-PA-14)

Committed alone, before any Orekit output for this comparison exists (no driver has been
written or run). Bars are not loosened after the run; a miss is recorded in `RESULTS.md` with
its numbers and pinned by a test that asserts the recorded miss.

## What is compared

`src/srp_boxwing.rs` as reviewed in aca9dc85:

* `boxwing_accel_scaled` (flat-plate sum, Vallado eq. 8-44), for the three shipped models
  `BoxWing::galileo_foc`, `galileo_iov`, `galileo_iov_eol`;
* `boxwing_partials` (`d_scale`, `d_specular[i]`, `d_diffuse[i]`);
* `gnss_yaw_steering` (nominal yaw steering, body to inertial);
* `ecom2_accel` and `ecom2_partials` (ECOM2, D2/B1).

Only the instantaneous model functions are compared. Wiring into `forces` / `precise_od` is a
separate change whose evidence is byte-identical goldens with the option off, not this oracle.
Drag on the box-wing panels is not compared: the module has no panel drag model (Galileo, at
MEO, has none to speak of), and Orekit's `dragAcceleration` has no kshana counterpart here.

## Oracle

Orekit 12.2 + Hipparchus 3.1 (Apache-2.0), jars from Maven Central with their published SHA-1
checked, run as a separate Java program
(`tests/fixtures/srp_boxwing_orekit_oracle/java/BoxWingDriver.java`), output committed as a
text fixture and compared by `tests/srp_boxwing_orekit_oracle.rs`. Orekit is run, never
vendored.

Orekit classes and the conventions fixed now, from the 12.2 source (read, not run):

1. **Panels.** `BoxAndSolarArraySpacecraft(List<Panel>)`. Body panels:
   `FixedPanel(normal, area, doubleSided = false, drag = 0, lift = 0, absorption = α,
   reflection = ρ)`; Orekit's diffuse coefficient is `1 − α − ρ`, which equals kshana's `δ`
   for every shipped material (`α + ρ + δ = 1`). Wings: `PointingPanel(axis = +Y, target = Sun,
   area, ..., α, ρ)` (double-sided, normal = the Sun direction's component perpendicular to the
   axis, the same rule as kshana's `SunPointing`). The panel tables are written into the driver
   in the IGS body frame from the GSC Galileo metadata (section 6); the test first checks that
   the fixture's panel list (area, normal or axis, α, ρ, kind) equals kshana's `BoxWing`
   exactly, so both sides use the same inputs. The transcription of the GSC tables is an input
   and is not what this comparison validates.
2. **Attitude.** Orekit's `Rotation` maps inertial to body (the transpose of kshana's
   body-to-inertial matrix). The fixture stores the body-to-inertial matrix.
3. **Flux and pressure.** `SolarRadiationPressure(dRef = AU_M = 1.495978707e11 m,
   pRef = 1361 / 299792458 N/m², sun, Earth, spacecraft)`, i.e. kshana's
   `SRP_PRESSURE_AU` and `AU_M`. Orekit's default (4.56e-6 N/m² at 1.4959787e11 m) is 0.44 %
   different and is used only as the negative control of bar A3.
4. **Lighting.** Bars A2 use only geometries kshana's `conical_shadow` puts in full sun (ν = 1);
   the driver records Orekit's lighting ratio and the test asserts it is exactly 1 there. All
   other bars pass the flux or the state directly and involve no lighting ratio. kshana is
   called with ν = 1 throughout. (Orekit's ECOM2 applies no lighting ratio; kshana multiplies
   by ν.)
5. **Nominal yaw.** `GenericGNSS` (Orekit's GNSS attitude with no eclipse or noon/midnight
   turn), whose `nominalYaw` is `+Z = −r̂`, `+Y ∥ s × r` with `s` the geocentric Sun. kshana's
   law is `+Z = −r̂`, `+Y = unit(Z × ŝ)`, which is the same axis. Orekit's `Galileo` provider
   (with the modified low-β law and turns) is not used.
6. **ECOM2.** `ECOM2(nD = 2, nB = 1, value, sun, equatorialRadius)`. Orekit's parameter order
   is `[B0, Bcos0, Bsin0, D0, Dcos0, Dcos1, Dsin0, Dsin1, Y0]`, i.e.
   `[B0, B1c, B1s, D0, D2c, D4c, D2s, D4s, Y0]` (Orekit's index names are offset: `Bcos0` is
   the 1·Δu term, `Dcos0` the 2·Δu term); kshana's order is
   `[D0, Y0, B0, D2c, D2s, D4c, D4s, B1c, B1s]`. The driver maps by name. Orekit's code computes
   `Δu = atan2(r·Y, r·X)` with `Y = unit(h × s)`, `X = unit(Y × h)`, i.e. `u − u_s` (its
   comment says `u_s − u`; the code is what is compared). No `(AU/d)²` factor on either side.
7. **Partials.** Orekit 12.2 exposes a derivative only for the global radiation factor
   (`BoxAndSolarArraySpacecraft`'s single radiation parameter driver,
   `RadiationSensitive.GLOBAL_RADIATION_FACTOR`, "global radiation factor"; kshana's `scale`
   `k`): obtained with Hipparchus `Gradient` through the field version of
   `radiationPressureAcceleration`. Per-panel ρ and δ partials have no Orekit derivative; the
   driver gives central finite differences of Orekit's acceleration (h = 1e-3, ρ varied with δ
   fixed and α = 1 − ρ − δ, δ varied with ρ fixed and α adjusted). The model is linear in these
   coefficients, so the difference is exact up to rounding.

## Geometry (fixed now)

Inertial frame GCRF; the Sun is held at a fixed inertial position (a constant
`ExtendedPVCoordinatesProvider`), as in `xval/srp-oblate-shadow-orekit`.

* Orbit: circular, a = 29 599 801 m (Galileo), i = 56°, Ω = 0; satellite at argument of
  latitude u = 0°, 10°, ..., 350° (36 points), circular velocity.
* Sun: 5 directions with β = −60°, −20°, 5°, 30°, 75° to the orbit plane and in-plane
  longitude 40°, at distance 1 AU; plus β = 30° at 0.9833 AU and 1.0167 AU (perihelion and
  aphelion distances). 7 Sun cases × 36 = 252 geometries.
* Random attitudes (bar A1 only): 100 rotations from a seeded uniform quaternion generator in
  the driver (seed 20261013), applied at the first 100 geometries in order, so fixed panels are
  lit from every side, including from behind.
* ECOM2 parameter vectors: the nine unit vectors scaled to 1e-9 m/s², plus one dense vector
  `[B0, B1c, B1s, D0, D2c, D4c, D2s, D4s, Y0] = [2, −1, 0.5, −80, 3, −1.5, 2.5, 0.7, 0.4]·1e-9`.

## Bars (fixed now)

With `a` Orekit's acceleration (m/s²) and `Δ` the kshana − Orekit difference vector:

* **A1 Flat-plate sum, same attitude and flux** (yaw-steering attitudes from `GenericGNSS` and
  the 100 random attitudes; flux passed directly to `radiationPressureAcceleration`; all three
  models): `|Δ| ≤ 1e-12·|a|` at every case.
* **A2 End to end** (kshana: `gnss_yaw_steering` + its own pressure; Orekit: `GenericGNSS` +
  `SolarRadiationPressure` as in convention 3; full-sun geometries only; all three models):
  `|Δ| ≤ 1e-11·|a|` at every case.
* **A3 Negative control (must hold, else A2 does not discriminate the pressure constant)**:
  with Orekit's default `SolarRadiationPressure` constants, `|Δ| / |a|` exceeds 1e-3 at every
  A2 case. Reported either way.
* **B Nominal yaw**: every element of kshana's body-to-inertial matrix within 1e-12 of
  Orekit's `GenericGNSS` (transposed) at every geometry whose Sun direction is more than 0.5°
  from ±r̂ (the yaw singularity; none of the 252 is expected to be excluded, and the count is
  reported).
* **C Radiation-factor partial**: `|d_scale − ∂a/∂k (Orekit Gradient)| ≤ 1e-12·|a|` at every A1
  yaw-steering case, all three models.
* **D Per-panel partials**: for every panel of every model at every A1 yaw-steering case,
  `|d_specular[i] − FD_ρ| ≤ 1e-9·|a|` and `|d_diffuse[i] − FD_δ| ≤ 1e-9·|a|` (unlit panels:
  both sides zero within the same bar).
* **E ECOM2**: for every parameter vector `p` at every geometry,
  `|Δ| ≤ 1e-12·Σ_k |p_k|`; and each `ecom2_partials[k]` within `1e-12` (absolute, per unit
  parameter, m/s² per m/s²) of Orekit's acceleration for the corresponding unit vector.

## What a pass would and would not show

A pass shows kshana evaluates the same flat-plate, yaw-steering and ECOM2 models as Orekit,
with the same conventions, to rounding. It does not show the models are adequate for Galileo
(that needs orbit-determination residuals against precise orbits), does not check the GSC
tables beyond their transcription, and says nothing about thermal re-emission, the modified
low-β yaw law or eclipse turns, none of which either side models here. A VALIDATED label
would apply to the model evaluation only; the Galileo SRP prediction stays MODELLED.
