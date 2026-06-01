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

- **Positioning / Timing performance** — the size of the error (RMS and 95th percentile).
- **Autonomy** — the holdover duration (how long it stays in spec without GNSS).
- **Resilience** — how fast the error grows once GNSS is lost.
- **Availability** — the fraction of the run that has an in-spec solution.
- **Integrity** — *can you trust the system's own estimate of its error?* Kshana reports
  the fraction of outage samples whose true error stays inside the filter's protective
  bound.
- **Security** — robustness to spoofing/threats (not yet modelled; export-sensitive).

## Estimation & geometry

**Estimator.** The algorithm that predicts the true position/time during an outage from
the sensor model. Kshana has an analytic holdover predictor and a **Kalman filter**.

**Kalman filter.** In plain terms: *an algorithm that tracks a quantity and also tracks
how uncertain it is.* Kshana uses its uncertainty bound to compute Integrity.

**Walker constellation.** A standard way to describe a satellite constellation by its
number of orbital planes and satellites per plane (GPS is roughly a 24/6 Walker shell).

**Elevation mask.** The minimum angle above the local horizon at which a satellite is
considered usable; signals too low are excluded.

**Occultation.** When the Earth physically blocks the line of sight to a satellite.

## Reproducibility & licensing

**Reproducible (deterministic).** The same input always gives bit-for-bit identical
output — `scenario + seed + version → identical result`. No hidden randomness.

**Seed.** The number that initialises the (deterministic) random generator, so runs are
repeatable.

**Open core.** The business model: the engine is free and open source (Apache-2.0);
the sustaining business is support, integration, and proprietary add-ons — not license
fees.

**Apache-2.0.** A permissive open-source licence allowing commercial use, modification,
and distribution, with a patent grant.
