# Glossary

Plain-language definitions of the terms used in Kshana. Each entry starts with a
one-line "in plain terms" and then adds the precise meaning where it helps.

## Navigation & timing

**PNT — Positioning, Navigation, and Timing.**
Knowing *where* you are, *which way* you are going, and *what time it is* — precisely.
Modern PNT mostly comes from satellite signals (GNSS, the global navigation satellite
systems defined next); Kshana studies what happens to
*time* and *position* when those signals are lost.

**GNSS — Global Navigation Satellite System.**
The satellite constellations that provide PNT: GPS (the Global Positioning System,
USA), Galileo (EU), GLONASS (Russia's Global Navigation Satellite System), BeiDou (China). A receiver that can see ≥ 4 satellites can compute a full
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
satellite). **Optical** links are far more precise than **RF** (radio-frequency) links.

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
NIST SP 1065 — National Institute of Standards and Technology Special Publication 1065.)

**PSD — Power Spectral Density.** How a noise's power is distributed across frequencies;
the formal way to specify white / random-walk / flicker noise.

## The figures of merit (how a run is scored)

The six operational PNT figures of merit Kshana reports (see the README "Output" table):

**FoM — Figure of Merit.** One number that scores one aspect of a run, reported with
its unit and whether it is validated or modelled. The six below are Kshana's
operational FoMs.

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
  or otherwise. Those come from the separate integrity and ARAIM (advanced RAIM) scenario kinds and are
  defined under "Integrity & augmentation" below. Export-sensitive.

Terms used alongside the figures of merit:

**Spoofing.** In plain terms: *a fake satellite signal that lies about position or time.*
A spoofer feeds the receiver a plausible but wrong answer, which is worse than jamming
because the receiver may not notice.

**1-DOF — one degree of freedom.** A single axis. Kshana's scenario-pack position error
is single-axis; a full 3-D answer needs the three-axis model.

**Monte Carlo ensemble.** Running the same scenario many times with different random
seeds and reporting the spread of the results rather than one run.

**CI — confidence interval.** The range a statistic is expected to fall in at a stated
probability (for example 95 %). In the README's tables and badges "CI" more often means
**continuous integration** — the automated build-and-test run on every change; the
context says which.

**k-sigma bound.** A bound set at *k* standard deviations of the filter's own
uncertainty; the Integrity figure of merit counts how often the true error stays inside it.

**CEP / 2DRMS — circular error probable / twice the distance root mean square.** Two
standard ways of stating 2-D horizontal accuracy: CEP is the radius holding 50 % of fixes;
2DRMS is twice the root-mean-square horizontal error. Kshana does not report either yet.

## Reading a result: the terms in the output

These are the names you meet in a result file or the playground's summary, in plain
terms first.

**Holdover (`holdover_s`).** In plain terms: *how many seconds the system stayed inside
its error limit after GNSS was lost.* Kshana reports the shortest such coast across all
outages in the run, measured on the run's time grid, so it is a lower bound at the
time-step resolution. A holdover equal to the outage length means the limit was never
crossed.

**p95 (`timing_p95_ns`).** In plain terms: *95 % of the time, the timing error was this
small or smaller.* It is the 95th percentile of the error over the outage. A very small
value can display as `0.0` in a short summary; the result JSON (JavaScript Object
Notation) file holds the full-precision number.

**Integrity (`integrity`).** In plain terms: *how often the system's own error estimate
was honest.* It is the fraction of outage samples whose true error stayed inside the
filter's k-sigma bound (defined below). A value near 1 means the estimator did not
understate its error. It is not an aviation protection level; see "Integrity &
augmentation" below and [`INTEGRITY.md`](INTEGRITY.md).

**Security score (`security`).** In plain terms: *how likely a spoofing attack is to be
caught.* It is the probability that the configured attack is detected — one minus the
missed-detection probability `P_md` — derived from the clock's stability. It only means something when the scenario configures a spoofing
attack; with no attack, read any value shown as "not applicable", not as "zero
security".

**PDOP — position dilution of precision (keys such as `pdop_min`).** In plain terms: *how much the
satellite geometry magnifies ranging error into position error.* Position error is
roughly PDOP times the ranging error, so lower is better. See **DOP** under "Estimation & geometry".

**sigma_y (`σ_y(τ)`, the Allan deviation).** In plain terms: *how much a clock's rate
wobbles when averaged over a time `τ`.* A datasheet line such as `sigma_y(1 s) = 3e-10`
means the rate, averaged over one second, varies by about 3 parts in 10¹⁰. Smaller is a
more stable clock. See "How stability is measured" above.

**q_wf — white-frequency noise intensity.** In plain terms: *the strength of the fast,
random jitter in a clock's rate.* It is the coefficient in `σ_y²(τ) = q_wf / τ` for white
frequency noise, so a scenario sets `q_wf = sigma_y(1 s)²` from the datasheet's one-second
Allan deviation. Its companions are `q_rw` (random-walk frequency noise) and `drift`
(ageing); see "How errors are modelled" above.

## Telecom timing terms

Telecom networks distribute time over packet networks (Precision Time Protocol) from a
GNSS-fed reference clock, and the International Telecommunication Union
Telecommunication Standardization Sector (ITU-T) sets limits on the time error each clock
may add. These terms appear in the `telecom-timing` kind; see
[`TELECOM-TIMING.md`](TELECOM-TIMING.md).

**TE — time error.** In plain terms: *how far a clock's time is from the reference time,
at one instant.* Positive or negative, usually in nanoseconds.

**max|TE| — maximum absolute time error.** In plain terms: *the worst time error seen
over the measurement, ignoring its sign.* It is the headline limit most masks set.

**cTE — constant time error.** In plain terms: *the steady offset part of the time
error* — the average error that does not change over the measurement.

**dTE — dynamic time error.** In plain terms: *the wobbling part of the time error* —
what is left after the constant offset is removed. It is judged with MTIE and TDEV.

**MTIE — maximum time interval error.** In plain terms: *the largest swing in time error
seen within any window of a given length.* For each window length it slides a window
along the record and takes the biggest peak-to-peak change; a mask gives the largest
allowed value per window length.

**TDEV — time deviation.** In plain terms: *the typical (root-mean-square) wander of the
time error at a given averaging time,* after short-term jitter is averaged out. It is a
time-domain cousin of the Allan deviation and, like MTIE, is checked against a mask.

**PRTC — primary reference time clock.** The clock at the top of a telecom timing
chain, normally steered by GNSS. Its performance limits are in ITU-T Recommendation
G.8272.

**ePRTC — enhanced primary reference time clock.** A PRTC with a tighter time-error
limit, backed by a highly stable local atomic clock so it can hold time through a long
GNSS loss. ITU-T Recommendation G.8272.1.

**T-BC — telecom boundary clock.** A network clock that receives time from upstream and
passes it on downstream, adding a little time error of its own. ITU-T Recommendation
G.8273.2.

**T-TSC — telecom time slave clock.** The clock at the end of the chain that receives
time and serves it to the equipment that needs it (for example a radio base station).
Also covered by ITU-T Recommendation G.8273.2.

**OCXO — oven-controlled crystal oscillator.** A quartz oscillator kept at a constant
temperature inside a small oven, which makes it much more stable than an ordinary
quartz oscillator. A common holdover clock in network equipment; it ages (drifts)
noticeably over days.

**CSAC — chip-scale atomic clock.** A very small atomic clock (see "The sensors Kshana
compares" above). More stable over long holdovers than an OCXO, at higher cost and power.

## Evidence tiers: VALIDATED, MODELLED, PARTNER

Every capability in the machine-checked verification matrix
([`VERIFICATION-MATRIX.md`](VERIFICATION-MATRIX.md)) carries one of three tiers.

**VALIDATED.** In plain terms: *checked against someone else's answer.* The capability's
output was compared with an independent external oracle — real measured data, an
independent library written by someone else, or published reference values — and
agreed within a stated tolerance. A continuous-integration check refuses a VALIDATED
row that names no external oracle.

**MODELLED.** In plain terms: *built from sound physics and checked for internal
consistency, but not yet compared with an outside answer.* The figures are meaningful
for comparison and design trades; they are not evidence that a real device will perform
that way. [`MODELLED-RATIONALE.md`](MODELLED-RATIONALE.md) explains why each such row
is modelled.

**PARTNER.** In plain terms: *this part belongs to a hardware or product-assurance
partner, and Kshana claims nothing about it.* The row exists so the gap is visible
rather than silent.

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

**URE — User Range Error.**
In plain terms: *how wrong a satellite's own broadcast orbit and clock make every range
to it.* Also called the signal-in-space error (SISE); it is the per-satellite error
budget ARAIM and RAIM are fed (`sigma_ure_m` in [`src/raim.rs`](../src/raim.rs)).

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
System** is the United States one; EGNOS (the European Geostationary Navigation Overlay
Service) is the European equivalent. Kshana computes protection levels in the DO-229E
weighted-least-squares form (DO-229E is the RTCA minimum operational performance standard
for SBAS receivers; RTCA was formerly the Radio Technical Commission for Aeronautics)
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

**CTI — Composed Timing Integrity.**
Protection levels for *time* rather than position, computed across a hand-over between
different time sources — for example from a satellite-checked (RAIM-available) clock to
a free-running one in holdover — so the bound stays valid through the transition
([`src/integrity/mod.rs`](../src/integrity/mod.rs)).

**TIB — Timing Integrity Benchmark.**
A yardstick for *other people's* timing monitors: it injects a menu of faults and checks
whether the monitor's stated protection level actually bounded its error. It makes no
accuracy claim of its own, so it cannot overstate one
([`src/benchmark/mod.rs`](../src/benchmark/mod.rs)).

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

**EOP — Earth Orientation Parameters.**
The measured, slightly irregular wobble and spin of the Earth (polar motion, UT1−UTC —
Earth-rotation time minus Coordinated Universal Time — and length of day) that is needed
to turn an Earth-fixed position into an inertial one to better than metres. The IERS
(International Earth Rotation and Reference Systems Service) publishes them; Kshana reads its `finals2000A` file via
`--eop`.

## Standards, formats & organisations

The abbreviations the README and the package pages use for standards, file formats,
time scales, frames and the bodies behind them. Each is also spelled out at its first
use in those pages.

*Orbits, frames and time*

- **SGP4 / SDP4 — Simplified General Perturbations 4 / Simplified Deep-space
  Perturbations 4.** The standard analytic propagators for published satellite orbits.
- **TLE — two-line element set.** The public orbit format SGP4 reads.
- **LEO / MEO / GTO / IGSO — low Earth orbit / medium Earth orbit / geostationary
  transfer orbit / inclined geosynchronous orbit.** Orbit regimes; most GNSS satellites fly in MEO.
- **LMO — low Mars orbit.**
- **ECI / ECEF — Earth-centred inertial / Earth-centred, Earth-fixed.** A frame that does
  not rotate with the Earth, and one that does.
- **TEME — true equator, mean equinox.** The frame SGP4 outputs in.
- **GCRS / ITRS / ITRF — Geocentric Celestial Reference System / International
  Terrestrial Reference System / its realisation, the International Terrestrial Reference
  Frame.** The modern inertial and Earth-fixed frames.
- **CIO — Celestial Intermediate Origin.** The reference point of the modern,
  equinox-free Earth-rotation chain.
- **LVLH — local vertical, local horizontal.** A frame that moves with the spacecraft.
- **WGS-84 — World Geodetic System 1984.** The Earth ellipsoid GPS uses.
- **UTC / TAI / TT / UT1 / TDB — Coordinated Universal Time / International Atomic Time /
  Terrestrial Time / Universal Time 1 (Earth-rotation time) / Barycentric Dynamical Time.**
- **LTC / TCL — Lunar Coordinate Time (Temps-Coordonnée Lunaire).** The proposed time
  scale for the Moon.
- **OD — orbit determination.** Recovering an orbit from tracking measurements.
- **CR3BP**, **NRHO** and **DRO** are defined under "Orbits & cislunar" above.

*File formats and messages*

- **SP3 — Standard Product 3.** The precise-orbit file format of the International GNSS
  Service (IGS), in versions c and d.
- **RINEX — Receiver Independent Exchange Format.** The standard file format for GNSS
  observations and broadcast ephemerides.
- **IONEX — IONosphere map EXchange format.**
- **OEM / OMM / TDM — Orbit Ephemeris Message / Orbit Mean-elements Message / Tracking
  Data Message.** Standard messages for orbits and tracking data from the Consultative
  Committee for Space Data Systems (CCSDS).
- **TOML — Tom's Obvious, Minimal Language.** The plain-text format of Kshana scenarios.
- **KIF — Kshana Interchange Format.** Kshana's versioned, self-describing result envelope.

*Standards*

- **DO-229E / DO-316.** RTCA minimum operational performance standards for SBAS
  receivers and for GPS airborne equipment with aircraft-based augmentation.
- **IS-GPS-200 / IS-GPS-705.** The GPS interface specifications (the second covers the
  L5 signal).
- **NIST SP 1065.** The National Institute of Standards and Technology *Handbook of
  Frequency Stability Analysis*.
- **TRL — technology readiness level.** A 1-to-9 scale of hardware maturity.

*Organisations*

- **ESA / ESOC / ESTRACK** — the European Space Agency, its European Space Operations
  Centre, and its European Space Tracking network.
- **NASA / JPL / NAIF / DSN** — the US National Aeronautics and Space Administration, its
  Jet Propulsion Laboratory, its Navigation and Ancillary Information Facility (which
  publishes the SPICE — Spacecraft, Planet, Instrument, C-matrix, Events — toolkit), and
  its Deep Space Network.
- **IGS** — the International GNSS Service. **IERS** — the International Earth Rotation
  and Reference Systems Service. **IAU** — the International Astronomical Union (whose
  SOFA library, Standards of Fundamental Astronomy, and its open port ERFA, Essential
  Routines for Fundamental Astronomy, are Kshana's frame references).
- **CCSDS** — the Consultative Committee for Space Data Systems. **AIAA** — the American
  Institute of Aeronautics and Astronautics. **RTCA** — formerly the Radio Technical
  Commission for Aeronautics.

*Software and supply chain*

- **CLI — command-line interface.** **MCP — Model Context Protocol**, the protocol Kshana's
  agent server speaks. **IDE — integrated development environment.**
- **SBOM — software bill of materials.** **SLSA — Supply-chain Levels for Software
  Artifacts**, the build-provenance framework Kshana's releases are attested under.

## Reproducibility & licensing

**Reproducible (deterministic).** The same input always gives bit-for-bit identical
output — `scenario + seed + version → identical result`. No hidden randomness.

**Seed.** The number that initialises the (deterministic) random generator, so runs are
repeatable.

**Open core.** The business model: the engine is free and open source (AGPL-3.0, the
GNU Affero General Public License defined below; dual-licensed commercially); the sustaining business is support, integration,
commercial licences, and proprietary add-ons — not seat fees on the open engine.

**AGPL-3.0.** The GNU Affero General Public License v3 — an OSI-approved (Open Source
Initiative), strong copyleft open-source licence. Like the GPL (GNU General Public License), but with an extra clause (§13) covering
software offered to users **over a network**: a modified version reached over a network
must offer those users its corresponding source. Kshana's open licence.

**Dual-licensing.** Offering the same code under two licences so users choose: here,
the AGPL-3.0 (open, copyleft) **or** a commercial licence from Ashforde OÜ (an Estonian
private limited company; OÜ = osaühing) for
proprietary/closed use the AGPL does not suit. See `LICENSING.md`.
