# Glossary

Plain-language definitions of the terms used in Kshana. Each entry starts with a
one-line "in plain terms" and then adds the precise meaning where it helps.

## Navigation & timing

**PNT — Positioning, Navigation, and Timing.**
Knowing *where* you are, *which way* you are going, and *what time it is* — precisely.
Modern PNT mostly comes from satellite signals (GNSS); Kshana studies what happens to
*time* and *position* when those signals are lost.

**GNSS — Global Navigation Satellite System.**
The satellite constellations that provide PNT: GPS (USA), Galileo (EU), GLONASS
(Russia), BeiDou (China). A receiver that can see ≥ 4 satellites can compute a full
3D position and time fix.

**GNSS outage / denied / degraded / jammed.**
When the satellite signals are unavailable (blocked, jammed, or out of view). During an
outage the system must "coast" on its own onboard sensors. Kshana's whole purpose is to
measure how well it coasts.

**Holdover.**
In plain terms: *how long the clock can keep good time on its own after it loses GNSS.*
A better clock holds longer before its error crosses the allowed limit.

**Dead-reckoning.**
In plain terms: *estimating where you are by adding up your measured motion, with no
outside reference.* Errors accumulate, so a better inertial sensor drifts more slowly.

**Spec / threshold.**
The maximum error you are allowed before the solution counts as "out of spec" — e.g.
"timing must stay within 20 ns" or "position within 100 m".

## The sensors Kshana compares

**Clock (atomic clock).**
A device that keeps time by counting an atom's natural oscillation. Two examples here:
- **CSAC — Chip-Scale Atomic Clock.** A small, deployed, commercial clock (the
  "classical" reference). Good, but drifts noticeably over a long outage.
- **Optical lattice clock (e.g. strontium).** A far more stable "quantum" clock; the
  state of the art in laboratories, not yet flown in space.

**Accelerometer.** Measures acceleration (change in motion). Integrated twice, it gives
position — so any error grows quickly. **Cold-atom accelerometer** is the quantum
version with much better long-term stability; **navigation-grade** is the classical one.

**Gyroscope.** Measures rotation. A small rotation error tilts the platform, which
leaks gravity into the horizontal direction and corrupts the position estimate.

**IMU — Inertial Measurement Unit.** The accelerometer-and-gyroscope package itself:
three axes of each, reporting specific force and angular rate. It measures motion; on
its own it does not know where it is.

**INS — Inertial Navigation System.** An IMU plus the "mechanization" that integrates
its output into attitude, velocity and position. The INS is what dead-reckons through a
GNSS outage, and its accuracy is set by the IMU error processes listed below.

**Time transfer.** Sending a precise time signal between two places (e.g. satellite to
satellite). **Optical** links are far more precise than **RF** (radio) links.

## How errors are modelled (clock noise)

Clock error is built from standard "noise types", each with a known signature:

**White FM (white frequency modulation).** In plain terms: *fast, random jitter in the
clock's rate.* Averaging it down improves with time. Parameter `q_wf`.

**Random-walk FM.** In plain terms: *the clock's rate slowly wanders.* This dominates
long outages. Parameter `q_rw`.

**Flicker FM (1/f noise).** In plain terms: *a stubborn noise floor the clock can never
average below.* It is flat across averaging times. Parameter `flicker_floor`.

**Aging / drift.** A slow, *predictable* change in rate over time; because it is
predictable, Kshana's estimator removes it. Parameter `drift`.

**VRW — Velocity Random Walk.** The accelerometer equivalent of white noise: random
kicks to velocity that build up into position error. Parameter `q_va`.

**ARW — Angular Random Walk.** The gyroscope equivalent: random kicks to orientation.
Parameter `q_arw`.

## How stability is measured

**Allan deviation (`σ_y(τ)`).** In plain terms: *the standard way to state how stable a
clock is over a given averaging time `τ`.* A clock datasheet quotes, e.g.,
`σ_y(1 s) = 3×10⁻¹⁰`. Kshana validates its clock model by computing the Allan deviation
of its own output and checking it matches the published number. (Reference: Riley,
NIST SP 1065.)

**PSD — Power Spectral Density.** How a noise's power is distributed across frequencies;
the formal way to specify white / random-walk / flicker noise.

## The figures of merit (how a run is scored)

The six operational PNT figures of merit Kshana reports (see the README "Output" table):

- **Positioning / Timing performance** — the size of the error, as RMS (root mean
  square, the quadratic average) and as the 95th percentile.
- **Autonomy** — the holdover duration (how long it stays in spec without GNSS).
- **Resilience** — how fast the error grows once GNSS is lost.
- **Availability** — the fraction of the run that has an in-spec solution.
- **Integrity** — *can you trust the system's own estimate of its error?* Kshana reports
  the fraction of outage samples whose true error stays inside the filter's protective
  bound.
- **Security** — robustness to spoofing: a clock-stability-based spoof-detectability
  score (since v0.3.0), meaningful only when a spoofing-attack scenario is configured.
  It is *not* aviation-grade integrity: it computes no horizontal or vertical protection
  level (HPL/VPL) and runs no receiver autonomous integrity monitoring (RAIM), advanced
  or otherwise. Those come from the separate integrity and ARAIM scenario kinds and are
  defined under "Integrity & augmentation" below. Export-sensitive.

## Integrity & augmentation

Integrity is the *trust* question: not "how big is my error?" but "can I bound it, and
will I be told when the bound is broken?" These are the aviation terms for that.

**RAIM — Receiver Autonomous Integrity Monitoring.**
In plain terms: *the receiver checks the satellites against each other.* With more
satellites than the four a fix needs, the leftovers (the residuals) should be small; a
large residual means one satellite is lying, and the receiver can say so without help
from the ground. Implemented in [`src/raim.rs`](../src/raim.rs).

**ARAIM — Advanced Receiver Autonomous Integrity Monitoring.**
The modern, dual-frequency multi-constellation form of RAIM. It is fed an integrity
support message stating each satellite's assumed error and fault probability, and
returns protection levels rather than a pass/fail flag. Full treatment, with every
assumption, in [`ARAIM_REFERENCE.md`](ARAIM_REFERENCE.md).

**MHSS — Multiple Hypothesis Solution Separation.**
The method ARAIM uses. For each way the constellation could be faulted it forms a
solution that excludes the suspect satellites, and bounds how far that sub-solution can
sit from the all-in-view one.

**HPL / VPL — Horizontal / Vertical Protection Level.**
In plain terms: *the radius the system promises the true error is inside, at a stated
integrity risk.* It is a bound the algorithm computes, not a measured error. A run is
available when the protection level stays under the alert limit the operation allows
(VAL, the vertical alert limit; HAL, the horizontal one).

**SBAS — Satellite-Based Augmentation System.**
A ground network that watches GNSS, computes corrections and integrity bounds, and
broadcasts them from geostationary satellites. **WAAS — Wide Area Augmentation
System** is the United States one; EGNOS is the European equivalent. Kshana computes
protection levels in the DO-229E weighted-least-squares form
([`src/sbas.rs`](../src/sbas.rs)).

## Estimation & geometry

**Estimator.** The algorithm that predicts the true position/time during an outage from
the sensor model. Kshana has an analytic holdover predictor and a **Kalman filter**.

**Kalman filter.** In plain terms: *an algorithm that tracks a quantity and also tracks
how uncertain it is.* Kshana uses its uncertainty bound to compute Integrity.

**EKF — Extended Kalman Filter.** A Kalman filter for a non-linear problem: it
linearises the model about the current estimate at every step. The standard choice for
coupling GNSS to an INS.

**UKF — Unscented Kalman Filter.** The same job without linearising: it pushes a small
set of deterministically chosen sample points through the true non-linear model and
rebuilds the mean and covariance from where they land. Better behaved when the
non-linearity is strong, which is why the orbit determination uses it.

**DOP — Dilution Of Precision.** In plain terms: *how much the satellites' geometry
amplifies ranging error into position or time error.* Position error ≈ PDOP × ranging
error, so a low number is good geometry. The family: **GDOP** (geometric — position and
time together), **PDOP** (position), **HDOP** (horizontal), **VDOP** (vertical),
**TDOP** (time).

**Walker constellation.** A standard way to describe a satellite constellation by its
number of orbital planes and satellites per plane (GPS is roughly a 24/6 Walker shell).

**Elevation mask.** The minimum angle above the local horizon at which a satellite is
considered usable; signals too low are excluded.

**Occultation.** When the Earth physically blocks the line of sight to a satellite.

## Orbits & cislunar

**CR3BP — Circular Restricted Three-Body Problem.**
The Earth–Moon system treated as two bodies on circular orbits about their common centre
of mass, plus a spacecraft too light to pull back. Near the Moon, a two-body Kepler
ellipse is simply the wrong shape; the CR3BP is the cheapest dynamics that is right
([`src/cr3bp.rs`](../src/cr3bp.rs)).

**NRHO — Near-Rectilinear Halo Orbit.**
A periodic CR3BP orbit that swings close over one lunar pole and far out over the other,
so it is almost a straight line end-on — hence "near-rectilinear". It is the orbit
chosen for the lunar Gateway, and it keeps near-continuous line of sight to Earth.

**DRO — Distant Retrograde Orbit.**
Another CR3BP family: a large, stable orbit that circles the Moon backwards as seen in
the rotating frame.

## Reproducibility & licensing

**Reproducible (deterministic).** The same input always gives bit-for-bit identical
output — `scenario + seed + version → identical result`. No hidden randomness.

**Seed.** The number that initialises the (deterministic) random generator, so runs are
repeatable.

**Open core.** The business model: the engine is free and open source (AGPL-3.0,
dual-licensed commercially); the sustaining business is support, integration,
commercial licences, and proprietary add-ons — not seat fees on the open engine.

**AGPL-3.0.** The GNU Affero General Public License v3 — an OSI-approved, strong
copyleft open-source licence. Like the GPL, but with an extra clause (§13) covering
software offered to users **over a network**: a modified version reached over a network
must offer those users its corresponding source. Kshana's open licence.

**Dual-licensing.** Offering the same code under two licences so users choose: here,
the AGPL-3.0 (open, copyleft) **or** a commercial licence from Ashforde OÜ for
proprietary/closed use the AGPL does not suit. See `LICENSING.md`.
