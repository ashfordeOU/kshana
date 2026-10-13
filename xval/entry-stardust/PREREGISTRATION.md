# Pre-registration: the `entry-heating` 3-DoF entry against the published Stardust nominal (CAP-28)

Committed on its own on 2026-10-13, before Kshana's entry integration has been run on these
inputs. The bars are not loosened after a run. A miss is recorded with its numbers as a FINDING,
and the row stays MODELLED.

## Disclosure

The module `src/entry_eo_ascent/entry_heating.rs` was written by the previous worker (W43). It
carries a unit test that runs a Stardust-like default case against a loose plausibility band
(peak 25 to 45 g, peak heat flux 500 to 2000 W/cm²). That test was compiled and run once in this
session, before this registration, to check the module builds. Its pass or fail outcome was
visible. No number from it was printed or seen. The inputs below differ from that default: mass
45.8 kg rather than 46 kg, diameter 0.811 m rather than 0.8128 m, and the latitude and heading
stated here.

## Published case (the oracle)

- **Inputs:** P. N. Desai, D. T. Lyons, J. Tooley, J. Kangas, *Entry, Descent, and Landing
  Operations Analysis for the Stardust Entry Capsule*, AIAA/AAS Astrodynamics Specialist
  Conference 2008, NASA NTRS 20090004445:
  - entry interface at a radius of 6503.14 km;
  - inertial entry velocity 12.9 km/s and inertial flight-path angle −8.2 deg (nominal design
    values);
  - capsule mass 45.8 kg.
- **Geometry:** P. N. Desai, R. A. Mitcheltree, F. M. Cheatwood, *Entry Trajectory Issues for
  the Stardust Sample Return Capsule*, International Symposium on Atmospheric Reentry Vehicles and
  Systems, Arcachon, 1999 (NASA NTRS 20050042027), Figure 2: diameter 0.811 m, nose radius
  0.2202 m.
- **Oracle value:** the same 1999 paper, nominal entry with the launch-configuration mass
  properties (Table 3, 45.8 kg): "the SRC aerodynamically decelerates from 12.6 km/s
  (planet-relative velocity) … The maximum deceleration experienced by the SRC during the descent
  is 33.4 g's", from the six-degree-of-freedom POST trajectory with the full aerodynamic database.

## Kshana configuration (fixed now)

`entry-heating` with:

- `body = "earth"`, `atmosphere = "us76"`, rotating Earth.
- `entry_interface_altitude_m = 125003.0`, from 6503.14 km minus the equatorial radius
  6378.137 km, rounded.
- `velocity_frame = "inertial"`, `entry_speed_m_s = 12900`, `flight_path_angle_deg = 8.2`.
- `latitude_deg = 41.0` and `heading_deg = 100.0`. These are an approximate entry location and
  direction over the Pacific, east-south-east toward Utah. They are not given in either paper and
  are an assumption of this registration.
- `mass_kg = 45.8`, `reference_area_m2 = π·0.811²/4`, `nose_radius_m = 0.2202`.
- `drag_coefficient = 1.4828`, the module's default for a 60 deg sphere-cone; neither paper gives
  a single value. In the ballistic approximation the peak deceleration does not depend on the
  ballistic coefficient (Allen and Eggers, NACA Report 1381).
- `lift_to_drag = 0` (ballistic; the capsule flies near 0 deg angle of attack).
- `step_s = 0.05`, `terminal_altitude_m = 10000`.

## Bars

| Id | Quantity | Bar | Basis |
|---|---|---|---|
| E1 | Kshana peak deceleration against 33.4 g | within ±10 % (30.06 to 36.74 g) | 3-DoF point mass with constant C_D against a 6-DoF trajectory with an aerodynamic database and small angles of attack; the atmosphere model and the assumed entry latitude and heading |
| E2 | Kshana planet-relative speed at the entry interface against the paper's 12.6 km/s | within 0.1 km/s | the published value is rounded to 0.1 km/s; this checks the inertial-to-relative conversion and the assumed heading |

Recorded without a bar: the peak stagnation convective heat flux (Sutton–Graves). The papers give
only a design limit (below 1200 W/cm²) and a pre-flight estimate of about 1200 W/cm² for
convective plus radiative heating. Kshana models convective heating only, so the quantities are
not comparable.

Recorded without a bar, as a sensitivity check: the same run with heading 70 deg and with heading
130 deg.

## Outcome rule

If E1 and E2 hold, a ledger row "3-DoF ballistic entry peak deceleration against the published
Stardust nominal" is VALIDATED against this published value (ExternalDataset), stated narrowly as
peak deceleration on one case. The stagnation heating stays MODELLED in its own row whatever the
result. If a bar misses, it is recorded as a FINDING and both rows stay MODELLED.

## Result (first and only run, 2026-10-13)

| Bar | Result | Verdict |
|---|---|---|
| E1 | peak deceleration 35.44 g against 33.4 g (ratio 1.061) | holds |
| E2 | planet-relative entry speed 12.551 km/s against 12.6 km/s | holds |

Recorded without a bar:

- **Heat flux.** The peak stagnation convective heat flux is 746 W/cm² (Sutton–Graves). It is not
  comparable with the published value of about 1200 W/cm² convective plus radiative.
- **Heading sensitivity.** Heading 70 deg gives 35.49 g and heading 130 deg gives 35.71 g.

Under the outcome rule, the peak-deceleration row is VALIDATED on this one published case. The
heating stays MODELLED.
