# Glossary

Plain-language definitions of the terms used in Kshana. Each entry starts with a
one-line "in plain terms" and then adds the precise meaning where it helps. Abbreviations
not defined in a section are in the A-to-Z table near the end,
[Every other abbreviation, A to Z](#every-other-abbreviation-a-to-z).

## Navigation & timing

**PNT — Positioning, Navigation, and Timing.**
Knowing *where* you are, *which way* you are going, and *what time it is* — precisely.
Modern PNT mostly comes from satellite signals (GNSS, the global navigation satellite
systems defined next); Kshana studies what happens to
*time* and *position* when those signals are lost.

**GNSS — Global Navigation Satellite System.**
The satellite constellations that provide PNT: GPS (the Global Positioning System,
USA (United States of America)), Galileo (EU), GLONASS (Russia's Global Navigation Satellite System), BeiDou (China). A receiver that can see ≥ 4 satellites can compute a full
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
2DRMS is twice the root-mean-square horizontal error. The library can compute both from
a position covariance (`src/fom.rs`), but no scenario kind reports them yet.

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
attack. With no attack configured, the one-line summary prints `security n/a (no attack)`
and the result marks the figure `applicable: false` in its `figure_tiers` block; the value
stays in the document and means "not applicable", not "zero security".

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

## Spectrum and interference terms

These terms appear in the `spectrum` kind; see [`SPECTRUM.md`](SPECTRUM.md).

- **BPSK(n) — binary phase-shift keying at n × 1.023 Mchip/s.** The rectangular-chip
  modulation of GPS L1 coarse/acquisition (C/A) and L2 civil (L2C) (n = 1) and GPS L5 and Galileo E5a (n = 10). Its
  spectrum is a sinc² with nulls every n × 1.023 MHz.
- **BOC(m, n) — binary offset carrier.** A spreading code at n × 1.023 Mchip/s
  multiplied by a square-wave subcarrier at m × 1.023 MHz, which splits the spectrum
  into two lobes either side of the carrier.
- **MBOC(6,1,1/11) — multiplexed binary offset carrier.** The power spectral density
  10/11 × BOC(1,1) + 1/11 × BOC(6,1), agreed for Galileo E1 open service and GPS L1C;
  Galileo transmits it as composite BOC (CBOC).
- **CW — continuous wave.** An unmodulated carrier: a single tone.
- **J/S — jammer-to-signal ratio.** Received jammer power over received signal power,
  in decibels.
- **SSC — spectral separation coefficient.** κ = ∫ G_s(f) G_j(f) df over the receiver
  band: how much of a unit-power interferer's spectrum lands where the signal's does.
  The effective carrier-to-noise density is [1/(C/N₀) + (J/S)·κ]⁻¹.
- **Noise figure.** How much a receiver adds to the thermal noise, as a ratio F in
  decibels; the system noise temperature is T_ant + 290 K × (F − 1).
- **Waterfall.** A time-frequency picture of a spectrum: frequency across, time down,
  colour for power.
- **Welch estimate.** A power spectral density estimated by averaging windowed,
  overlapping periodograms (Welch 1967).
- **SigMF — Signal Metadata Format.** An open recording format: a JSON `.sigmf-meta`
  file describing a raw `.sigmf-data` file of samples (here complex `cf32_le`,
  `ci16_le` or `ci8`).
- **IQ — in-phase and quadrature.** The two components of a complex baseband sample.

## LEO-PNT signal terms

These terms appear in the `leo-signal` kind and the multi-band `spectrum` scenarios; see
[`LEO-SIGNAL.md`](LEO-SIGNAL.md).

- **LEO-PNT — low Earth orbit positioning, navigation and timing.** Navigation signals
  broadcast from satellites a few hundred to about 1200 km up: stronger and faster-moving
  than GNSS from medium Earth orbit.
- **RNSS, RDSS, MSS, EESS — Radio Navigation Satellite Service, Radio Determination
  Satellite Service, Mobile Satellite Service, Earth Exploration-Satellite Service.** ITU
  (International Telecommunication Union) service allocations a band can sit in.
- **Pilot, data and acquisition components.** The parts of one signal: a data-free pilot
  for ranging, a data component that carries the navigation message, and a short,
  low-rate acquisition component that is easy to find.
- **FDMA — frequency-division multiple access.** Components or satellites separated by
  carrier frequency rather than by code.
- **Gabor (RMS) bandwidth.** β = √(∫ f² G df / ∫ G df) over the receiver band: the spread
  of a signal's power in frequency, which sets how finely it can range.
- **DLL — delay lock loop.** The code-tracking loop; its early-late correlator spacing and
  noise bandwidth set the thermal-noise ranging jitter.
- **EFQPSK — enhanced Feher quadrature phase-shift keying.** A constant-envelope
  modulation (Xona Pulsar); approximated here by a rectangular-chip spectrum.
- **OFDM — orthogonal frequency-division multiplexing.** A multicarrier waveform
  (the Starlink downlink); drawn here as a flat band.
- **TEC — total electron content.** Electrons per square metre along the path;
  1 TECU = 10¹⁶ el/m². The first-order ionospheric delay is 40.3·TEC/f² metres.
- **EIRP — effective isotropic radiated power.** Transmit power times antenna gain toward
  the receiver.

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

**SISRE — Signal-in-Space Range Error.**
In plain terms: *how far off a satellite's broadcast orbit and clock make the range a
typical user measures.* The orbit error is split into radial, along-track and cross-track
parts and weighted by how much each shows up along an average line of sight, then
combined with the clock error (Montenbruck et al. 2018). For a low Earth orbit satellite
the along- and cross-track parts weigh far more than for GPS, because users see it from
far off nadir. Used by the `leo-navmsg` kind.

**RAC — Radial, Along-track, Cross-track.**
The three directions an orbit error is resolved into: out from the Earth's centre, along
the direction of flight, and perpendicular to the orbit plane. The `leo-navmsg` kind's
`kepler-rac` model adds a correction polynomial in each.

**SVID — Space-Vehicle Identifier.** The number a navigation message uses to name the
satellite that sent it.

**IOD — Issue of Data.** A counter that changes whenever a satellite's navigation message
content changes, so a receiver can tell a new message from a repeat. (Not to be confused
with an in-orbit demonstration, also abbreviated IOD, as in ESA's Celeste IOD.)

**TOW — Time of Week.** Seconds since the start of the current GNSS week (Sunday 00:00).

**CRC-24Q — 24-bit cyclic redundancy check (Qualcomm polynomial).** The error-detecting
check RTCM 10403 and Galileo messages carry: a 24-bit remainder of the message bits
divided by the polynomial `0x1864CFB`. A receiver recomputes it and discards a message
that does not match.

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
The measured, slightly irregular wobble and spin of the Earth (polar motion, UT1 (Universal Time 1, Earth-rotation time)−UTC —
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

## Every other abbreviation, A to Z

Every abbreviation used in the repository documentation (`docs/` and the four READMEs)
that no section above defines, plus a few that one does, repeated for lookup. Each page
also spells its abbreviations out at first use; this table is the one place to look them
all up. A few entries are identifiers or names rather than abbreviations, and say so.

| Abbreviation | Stands for | Where it comes up |
|---|---|---|
| 3GPP | Third Generation Partnership Project | the body that writes the 5G standards, including non-terrestrial networks |
| 5G | fifth-generation mobile network | including its non-terrestrial-network (NTN) positioning |
| ABI | application binary interface | Python wheel tags |
| ABMF | the IGS station at Le Moule, Guadeloupe | a four-character station identifier |
| AC | alternating current | as in the AC-Stark (light-shift) effect |
| ADD | Algorithm Description Document | the WG-C ARAIM reference airborne algorithm |
| ADEV / OADEV | Allan deviation / overlapping Allan deviation | see Allan deviation above |
| ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3) | inertial-sensor part numbers (Analog Devices; Safran Sensonor; MicroStrain) | identifiers, not abbreviations |
| AEM | Attitude Ephemeris Message | a CCSDS message |
| AESS | Aerospace and Electronic Systems Society | of the IEEE |
| AF | averaging factor | the integer multiple of the sample interval in an Allan-type estimator |
| AFS | Augmented Forward Signal | the LunaNet lunar navigation signal |
| AGC | automatic gain control | a jamming indicator in a receiver front end |
| AHP | Analytic Hierarchy Process | a multi-criteria weighting method (Saaty) |
| AI / ML | artificial intelligence / machine learning |  |
| AL / HAL / VAL | alert limit / horizontal alert limit / vertical alert limit | the error an integrity monitor must bound |
| AltBOC | alternative binary offset carrier | the Galileo E5 modulation |
| AM-HM | arithmetic mean–harmonic mean (inequality) |  |
| AOCS | attitude and orbit control system |  |
| AOS / TCA / LOS | acquisition of signal / time of closest approach / loss of signal | the events of a ground-station pass (LOS also means line of sight; the context says which) |
| API | application programming interface |  |
| APID | application process identifier | the CCSDS Space Packet header field |
| APS | American Physical Society |  |
| APV | approach with vertical guidance | APV-I: 40 m horizontal, 50 m vertical alert limits |
| ARL | average run length | the mean time a change detector takes to alarm |
| ARM / ARM64 | the Arm processor architecture / its 64-bit form |  |
| ASD | amplitude spectral density | the square root of a power spectral density |
| AU | astronomical unit | 149 597 870.7 km |
| AUC / ROC | area under the curve / receiver operating characteristic | detector evaluation |
| AWS | Amazon Web Services | hosts an open mirror of the SRTM elevation tiles |
| BEL | building entry loss | ITU-R P.2109 |
| BI | bias instability | the flat minimum of an inertial sensor's Allan deviation |
| BIPM | Bureau International des Poids et Mesures (International Bureau of Weights and Measures) | publishes Circular T |
| BKG | Bundesamt für Kartographie und Geodäsie (German Federal Agency for Cartography and Geodesy) | runs an IGS data mirror |
| BSD | Berkeley Software Distribution | as in the BSD licences |
| BSP | binary SPK | a binary SPICE ephemeris kernel file |
| BSTAR | the drag term of a two-line element set |  |
| CAI | cold-atom interferometer | see QUANTUM.md |
| CARIOQA-PMP | Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation |  |
| CC / CC BY | Creative Commons / Creative Commons Attribution | a data or text licence |
| CDDIS | Crustal Dynamics Data Information System | NASA's space-geodesy archive |
| CDF | cumulative distribution function |  |
| CFAR | constant false-alarm rate | an acquisition-detector threshold rule |
| CGCS2000 | China Geodetic Coordinate System 2000 | the BeiDou datum |
| CIP | Celestial Intermediate Pole |  |
| CIRS | Celestial Intermediate Reference System |  |
| CISA | Cybersecurity and Infrastructure Security Agency | of the US DHS |
| CM / CL | civil moderate / civil long | the two time-multiplexed GPS L2C codes |
| CMPL | common-mode protection level | the bound on errors a residual test cannot see |
| CN | converged Newtonian | the SPICE light-time aberration correction |
| C/N0 (C/N₀) | carrier-to-noise density ratio | in dB-Hz |
| COPRAS | COmplex PRoportional ASsessment | a multi-criteria ranking method |
| COSPAR | Committee on Space Research | issues international satellite designators |
| CPR | cycle per revolution | an empirical orbit acceleration at the orbital frequency |
| CPU / GPU / NPU | central / graphics / neural processing unit |  |
| CRB / CRLB | Cramér–Rao bound / Cramér–Rao lower bound | the smallest variance an unbiased estimator can reach |
| CRD | Consolidated laser Ranging Data format | ILRS normal-point files |
| CRPA | controlled-reception-pattern antenna | an anti-jam antenna array |
| CR / RI | consistency ratio / random index | the AHP consistency check (accept CR < 0.10) |
| CS GROUP | the French company that maintains Orekit | a company name, not an abbreviation to expand |
| CSK | code shift keying |  |
| CSS | Cascading Style Sheets |  |
| CSV | comma-separated values |  |
| CUSUM | cumulative sum | a sequential change detector |
| CV | cross-validation | (common view in time transfer; the context says which) |
| CZML | Cesium Language | the JSON scene format of CesiumJS |
| dB / dBW / dB-Hz | decibel / decibel-watt / decibel-hertz | power ratio, absolute power, and a C/N0 unit |
| DC | direct current | the zero-frequency limit |
| DCM | direction cosine matrix | a rotation matrix |
| DCO | Developer Certificate of Origin |  |
| DCT | design control table | a link-budget table (the JPL DESCANSO Galileo X-band example) |
| DE / DE421 / DE430 / DE440 / DE441 | JPL Development Ephemeris (versions 421, 430, 440, 441) | planetary and lunar ephemerides; "DE-grade" means accuracy of that class |
| DEM | digital elevation model |  |
| DESCANSO | Deep Space Communications and Navigation Systems Center of Excellence | JPL monograph series |
| DGFI-TUM | Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (German Geodetic Research Institute at the Technical University of Munich) | hosts the EUROLAS Data Center |
| DGNSS | differential GNSS |  |
| DHS | Department of Homeland Security | US |
| DoD | Department of Defense | US |
| DOF / DoF | degree of freedom | see 1-DOF above |
| DOI | digital object identifier |  |
| DOR / Δ-DOR | differential one-way ranging / delta differential one-way ranging | deep-space angular tracking |
| DP5 / RK4 / RK5 / DOP853 | Dormand–Prince 5(4) / Runge–Kutta 4 / Runge–Kutta 5 / Dormand–Prince 8(5,3) | numerical integrators |
| DRMS | distance root mean square | see 2DRMS |
| DS00002980D / DS00002985D / DS00003047A | Microchip datasheet document numbers | identifiers, not abbreviations |
| DSAC | Deep Space Atomic Clock | the NASA trapped-mercury-ion clock |
| DUT1 | UT1 minus UTC | the Earth-rotation correction |
| Eb/N0 | energy per bit over noise density |  |
| ECI0 | the inertial frame aligned with the Earth-fixed frame at the start of a run | used by the leo-pass interop exports |
| ECMAScript / ES | the standard behind JavaScript / an ES module |  |
| ECOM2 | Empirical CODE Orbit Model 2 | a GNSS solar-pressure model (CODE: Center for Orbit Determination in Europe) |
| ECSS | European Cooperation for Space Standardization | ECSS-E-ST-10-02 is its verification standard |
| ED | EUROCAE document | as in ED-259A |
| EDL | entry, descent and landing |  |
| EEE | electrical, electronic and electromechanical (parts) | space product assurance |
| EGM / EGM2008 | Earth Gravitational Model (the 2008 release) | NGA |
| EIGEN | European Improved Gravity model of the Earth by New techniques |  |
| ELECTRE | ELimination Et Choix Traduisant la REalité (elimination and choice expressing reality) | an outranking multi-criteria method |
| ELP/MPP02 | Éphéméride Lunaire Parisienne, the MPP02 version (Chapront) | an analytic lunar theory |
| EME2000 | Earth mean equator and equinox of J2000 | an inertial frame |
| EML | early-minus-late | a code discriminator |
| EMT | effective monitor threshold | an ARAIM output |
| ENU / NED | east-north-up / north-east-down | local-level frames |
| EO | Earth observation |  |
| EPM / EPM2021 | Ephemerides of Planets and the Moon (the 2021 release) | IAA RAS ephemeris |
| ERA | Earth rotation angle |  |
| ESKF | error-state Kalman filter |  |
| ESS | effective sample size | of a particle filter |
| ESSR | European Space Software Repository | ESA |
| ET | ephemeris time | SPICE's name for TDB |
| EUROCAE | European Organisation for Civil Aviation Equipment |  |
| EUROLAS | European Laser Network | satellite and lunar laser ranging |
| FAQ | frequently asked questions |  |
| FCC | Federal Communications Commission | US |
| FCNN | fully connected neural network |  |
| FD | finite difference |  |
| FDE | fault detection and exclusion |  |
| FES / FES2004 | Finite Element Solution (the 2004 release) | an ocean-tide model |
| FIM | Fisher information matrix |  |
| FNV-1a | Fowler–Noll–Vo hash, variant 1a | used to pin golden outputs |
| FOC / IOV | full operational capability / in-orbit validation | satellite generations (Galileo, Xona Pulsar) |
| FOV / IFOV | field of view / instantaneous field of view |  |
| FPGA / MCU / RTOS | field-programmable gate array / microcontroller unit / real-time operating system |  |
| FSL / FSPL | free-space loss / free-space path loss | ITU-R P.525 |
| GB / KB / MB | gigabyte / kilobyte / megabyte |  |
| GCRF | Geocentric Celestial Reference Frame |  |
| GDAL | Geospatial Data Abstraction Library |  |
| GEO | geostationary orbit |  |
| GeoJSON | Geographic JavaScript Object Notation | IETF RFC 7946 |
| GG | gravity gradient | as in gravity-gradient torque |
| GHz / kHz | gigahertz / kilohertz |  |
| GIM | global ionosphere map |  |
| GINS / KF-GINS | GNSS/INS integration / the Wuhan University Kalman-filter GNSS/INS data set and code |  |
| GIS | geographic information system |  |
| GIVE | grid ionospheric vertical error | an SBAS message term |
| gLAB | GNSS-Lab Tool | a GNSS data-processing suite distributed by ESA |
| GLIBC | the GNU C library |  |
| GLONASS | Russia's Global Navigation Satellite System (Globalnaya Navigatsionnaya Sputnikovaya Sistema) |  |
| GLS | generalised least squares |  |
| GM | gravitational parameter | the gravitational constant times a body's mass |
| GMAT | General Mission Analysis Tool | NASA |
| GMM-3 | Goddard Mars Model 3 | a Mars gravity field |
| GMST | Greenwich mean sidereal time |  |
| GNC | guidance, navigation and control |  |
| GPOD | Grid Processing On Demand | ESA |
| GR | general relativity |  |
| GRGM / GRGM660PRIM | the GRAIL lunar gravity models from NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory) |  |
| GRS80 | Geodetic Reference System 1980 |  |
| GSD | ground sample distance |  |
| GSE | ground support equipment |  |
| GSFC | Goddard Space Flight Center | NASA |
| HDEV / OHDEV | Hadamard deviation / overlapping Hadamard deviation | a drift-insensitive stability measure |
| HIL | hardware in the loop |  |
| HMI / MI | hazardously misleading information / misleading information | Stanford-diagram regions |
| HP | Hewlett-Packard |  |
| HTML | HyperText Markup Language |  |
| IAA RAS | Institute of Applied Astronomy of the Russian Academy of Sciences |  |
| IAG | International Association of Geodesy |  |
| IAGA / V-MOD (VMOD) | International Association of Geomagnetism and Aeronomy / its Working Group V-MOD (geomagnetic field modelling) | maintains the IGRF |
| IC | initial condition |  |
| ICAO | International Civil Aviation Organization |  |
| ICD | interface control document | as in the Galileo OS SIS ICD |
| ICGEM | International Centre for Global Earth Models |  |
| ICRF | International Celestial Reference Frame |  |
| ID | identifier (or identification, as in noise-type ID) |  |
| IEEE | Institute of Electrical and Electronics Engineers |  |
| IETF / RFC | Internet Engineering Task Force / Request for Comments |  |
| IF | intermediate frequency | receiver samples |
| IGb14 | the IGS realisation of ITRF2014 |  |
| IGRF / IGRF14 | International Geomagnetic Reference Field | IGRF-14 (file IGRF14.shc) is the 14th generation |
| IGSO | inclined geosynchronous orbit |  |
| IIF | GPS Block II Follow-on | a GPS satellite generation |
| ILRS | International Laser Ranging Service |  |
| ILS | integer least squares | ambiguity resolution |
| IMCCE | Institut de mécanique céleste et de calcul des éphémérides | Paris Observatory; publishes INPOP |
| INPOP21a | Intégration Numérique Planétaire de l'Observatoire de Paris, version 21a | a planetary ephemeris |
| IOAG | Interagency Operations Advisory Group |  |
| ION / ITM | Institute of Navigation / its International Technical Meeting |  |
| IoT | Internet of Things |  |
| IR | integrity risk | the probability of hazardously misleading information |
| IRE | Institute of Radio Engineers | a predecessor of the IEEE |
| ISB | inter-system bias | the clock offset between two GNSS |
| ISL | inter-satellite link |  |
| ISM | integrity support message | ARAIM |
| ISO | International Organization for Standardization | ISO 8601 is its date-time format |
| ISS | International Space Station |  |
| ITRF93 / ITRF2020 | International Terrestrial Reference Frame 1993 / 2020 |  |
| ITU-R | International Telecommunication Union Radiocommunication Sector | its P-series Recommendations model propagation |
| IVS | International VLBI Service for Geodesy and Astrometry |  |
| JD / MJD | Julian date / modified Julian date |  |
| JMLR | Journal of Machine Learning Research |  |
| JOSA | Journal of the Optical Society of America |  |
| JRC / JRC122785 | Joint Research Centre of the European Commission / one of its report numbers |  |
| JS | JavaScript |  |
| JSON | JavaScript Object Notation |  |
| JSTSP | IEEE Journal of Selected Topics in Signal Processing |  |
| KF | Kalman filter |  |
| KML | Keyhole Markup Language | an OGC standard read by Google Earth |
| KP16 / KRAC / LU22 / APOL | record-type labels of Kshana's own LEO navigation-message text format | a Kshana extension, not a standard |
| KPI | key performance indicator |  |
| KSC | Kennedy Space Center |  |
| KVN | Keyword = Value Notation | the text form of CCSDS messages |
| LANS | Lunar Augmented Navigation Service | NASA |
| LAPACK | Linear Algebra PACKage |  |
| LCG | linear congruential generator | the NIST SP 1065 test-series generator |
| LCNS | Lunar Communications and Navigation Services | the ESA Moonlight service |
| LCRNS | Lunar Communications Relay and Navigation Systems | NASA |
| LFSR | linear-feedback shift register | spreading-code generation |
| LGPL | GNU Lesser General Public License |  |
| LIL | law of the iterated logarithm |  |
| LLI / SSI | loss-of-lock indicator / signal-strength indicator | RINEX observation flags |
| LLR | lunar laser ranging |  |
| LLVM | the LLVM compiler infrastructure (originally Low Level Virtual Machine) |  |
| LNAV | legacy navigation message | GPS |
| LNCSS | lunar navigation and communication satellite system | the constellation case studies in NAVIGATION 70(4), navi.613 |
| LNIS | LunaNet Interoperability Specification |  |
| LNSS | Lunar Navigation Satellite System | a proposed lunar constellation |
| LPV / LPV-200 | localiser performance with vertical guidance / its 200 ft decision-height category | aviation approach |
| LRO | Lunar Reconnaissance Orbiter | NASA |
| LS | leap seconds | as in Δt_LS |
| LT | light time |  |
| LTE | Long-Term Evolution | the 4G cellular standard |
| LU | lower–upper (decomposition) |  |
| LuGRE | Lunar GNSS Receiver Experiment | flew to the Moon in 2025 |
| LuPNT | Stanford's lunar PNT library | a name |
| MAAST | MATLAB Algorithm Availability Simulation Tool | Stanford |
| MAIT | manufacturing, assembly, integration and test |  |
| MAR099 / JUP365 / SAT441 | JPL satellite-ephemeris solutions for the moons of Mars, Jupiter and Saturn | identifiers |
| MASPS | minimum aviation system performance standards |  |
| MATLAB | MATrix LABoratory | a numerical computing product |
| MAUT | multi-attribute utility theory |  |
| MC | Monte Carlo |  |
| MCD | Mars Climate Database |  |
| MCDA | multi-criteria decision analysis |  |
| MCI / MCMF | Moon-centred inertial / Moon-centred, Moon-fixed |  |
| MDB | minimal detectable bias |  |
| MDEV | modified Allan deviation |  |
| MEMS | micro-electro-mechanical systems |  |
| MeO / MLRO | MéO (Métrologie Optique), the Grasse laser station / Matera Laser Ranging Observatory | lunar laser-ranging stations |
| ME / PA | mean Earth / principal axes | the two lunar body-fixed frames (MOON_ME, MOON_PA) |
| MGEX | Multi-GNSS Experiment | IGS |
| MIT | Massachusetts Institute of Technology | as in the MIT licence |
| MLP | multilayer perceptron | a small neural network |
| MOD / TOD | mean of date / true of date | equator-and-equinox frames |
| MOORA | Multi-Objective Optimisation on the basis of Ratio Analysis |  |
| MOPS | minimum operational performance standards |  |
| MPL | Mozilla Public License |  |
| MRO110 / MRO110B2 | Mars Reconnaissance Orbiter gravity models 110 and 110B2 |  |
| MSRV | minimum supported Rust version |  |
| MTF | modulation transfer function | optical imaging |
| MVDR | minimum-variance distortionless response | adaptive beamforming |
| MWL | microwave link | the ACES time-transfer link |
| NaN | not a number |  |
| NavIC | Navigation with Indian Constellation |  |
| NAVISP | Navigation Innovation and Support Programme | ESA |
| NAV / OBS | navigation (message) / observation | the two RINEX file types; the Stanford NAV Lab is the Navigation and Autonomous Vehicles Laboratory |
| NBS / NBS14 | the former US National Bureau of Standards / the NBS14 frequency-stability reference data set | used to check Allan estimators |
| NEES / NIS | normalised estimation error squared / normalised innovation squared | filter consistency tests |
| NGA | National Geospatial-Intelligence Agency | US |
| NGS / NOAA | National Geodetic Survey / National Oceanic and Atmospheric Administration | US |
| NIMA / TR8350 | National Imagery and Mapping Agency / its technical report TR8350.2 (the WGS 84 definition) | NIMA is the former name of the NGA |
| NLOS | non-line-of-sight | a reflected-only signal |
| NNLS | non-negative least squares |  |
| NORAD | North American Aerospace Defense Command | keeps the public satellite catalogue |
| NP | Neyman–Pearson | detection theory |
| NPA | non-precision approach | aviation |
| NPB | nutation–precession–bias | the IAU 2006/2000A matrix |
| NRL / NRLMSISE-00 | Naval Research Laboratory / its Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model, 2000 |  |
| NTN | non-terrestrial network | 5G from satellites |
| NTRS | NASA Technical Reports Server |  |
| OC-0 … OC-13 | overclaim identifiers | rows of CLAIMS-VS-REALITY.md |
| OCI | Open Container Initiative | container image format |
| ODE / SDE | ordinary / stochastic differential equation |  |
| ODM | orbit data messages | the CCSDS family that includes OEM and OMM |
| OGC | Open Geospatial Consortium |  |
| OLS / WLS | ordinary / weighted least squares |  |
| OPS-SAT / OPSSAT-AD | ESA's in-orbit software laboratory satellite / its anomaly-detection data set |  |
| OSIP | Open Space Innovation Platform | ESA |
| OSNMA / TESLA | Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication | Galileo signal authentication |
| OS / OSes | Open Service (Galileo, BeiDou), or operating system(s) | the context says which |
| OU | Ornstein–Uhlenbeck | a mean-reverting noise process |
| PA | product assurance (also precision approach, as in K_H,PA) | the context says which |
| PCK | planetary constants kernel | SPICE |
| PDF | Portable Document Format |  |
| Pd / Pfa | probability of detection / probability of false alarm |  |
| PEF | pseudo-Earth-fixed | the frame between TEME and ITRF |
| PG01 / PRN120 / GSAT0101 | satellite identifiers: an SP3 GPS satellite label, an SBAS pseudorandom-noise number, a Galileo satellite name | identifiers, not abbreviations |
| PHARAO | Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite | the ACES caesium clock |
| PL | protection level |  |
| PLL | phase-locked loop |  |
| PMC / PMC10301026 | PubMed Central / one of its article identifiers |  |
| PM / FM | phase modulation / frequency modulation | noise on a clock's phase or on its frequency |
| PN | pseudo-noise | as in PN ranging |
| PNG | Portable Network Graphics |  |
| POD | precise orbit determination |  |
| PPN | parametrised post-Newtonian |  |
| PPP / RTK / SPP | precise point positioning / real-time kinematic / single-point positioning |  |
| PPS | pulse per second |  |
| PR | pull request |  |
| PRN | pseudorandom noise (code number) | how GNSS satellites are named in signals |
| PROMETHEE | Preference Ranking Organization METHod for Enrichment of Evaluations |  |
| PRX | Physical Review X | a journal |
| PSD | power spectral density | see above |
| PS / SPS | Performance Standard / Standard Positioning Service | the GPS SPS PS |
| PTB | Physikalisch-Technische Bundesanstalt | Germany's national metrology institute |
| PTP | Precision Time Protocol | IEEE 1588 |
| PVT | position, velocity and time |  |
| PyO3 / PyPA / PyPI | the Rust–Python binding library / Python Packaging Authority / Python Package Index |  |
| PZ-90 | Parametry Zemli 1990 | the GLONASS geodetic datum |
| QA | quality assurance |  |
| QEMU | Quick Emulator |  |
| QPN | quantum projection noise |  |
| QPSK | quadrature phase-shift keying |  |
| QZSS | Quasi-Zenith Satellite System | Japan |
| RAAN | right ascension of the ascending node |  |
| RAFS | rubidium atomic frequency standard |  |
| RDRR | Resist–Detect–Respond–Recover | the RethinkPNT/Firesmith resilience model |
| RF | radio frequency |  |
| RHEL | Red Hat Enterprise Linux |  |
| RHS | right-hand side |  |
| RMS / RSS | root mean square / root sum square |  |
| RNG | random-number generator |  |
| RNTF | Resilient Navigation and Timing Foundation |  |
| ROI | return on investment |  |
| RPCF | Resilient PNT Conformance Framework | US DHS |
| RTCM | Radio Technical Commission for Maritime Services | its message standard carries CRC-24Q |
| RTKLIB | an open-source GNSS positioning library (real-time kinematic library) |  |
| RTN | radial, transverse, normal | an orbit-fixed frame |
| RW | random walk | as in bias random walk |
| RWFM / WFM / FFM / WPM / FPM | random-walk, white and flicker frequency modulation / white and flicker phase modulation | the power-law clock noise types |
| SA.45s / SA65, OX-208 | Microchip product names (two chip-scale atomic clocks, an oven-controlled crystal oscillator) | names, not abbreviations |
| SD | standard deviation |  |
| SDD | Service Definition Document | as in the Galileo OS SDD |
| SDK | software development kit |  |
| SDR | software-defined radio |  |
| SDS | Space Defense Squadron | the 18th SDS keeps the US satellite catalogue |
| SEP | Sun–Earth–probe angle (also spherical error probable) | the context says which |
| SGD | stochastic gradient descent |  |
| SHA-256 | Secure Hash Algorithm, 256-bit |  |
| SHM | simple harmonic motion |  |
| SI | International System of Units |  |
| SIB | Safety Information Bulletin | EASA; EASA is the European Union Aviation Safety Agency |
| SINEX | Solution INdependent EXchange format | geodetic solutions |
| SIR | sampling importance resampling | a particle filter |
| SIS / SISA | signal in space / signal-in-space accuracy |  |
| SITAN | Sandia Inertial Terrain-Aided Navigation |  |
| SLR | satellite laser ranging |  |
| SMAD | Space Mission Analysis and Design | the textbook |
| SNR | signal-to-noise ratio |  |
| SOS / SSE | sum of squares / sum of squared residuals |  |
| SOTA | state of the art |  |
| SP1065 | NIST Special Publication 1065 | the same document as NIST SP 1065 |
| SPD / PD | symmetric positive definite / positive definite |  |
| SPDX | Software Package Data Exchange | the licence identifiers in file headers |
| SPK | SPICE kernel for spacecraft and planet ephemerides |  |
| SPOF | single point of failure |  |
| SQM | signal quality monitoring | correlator-shape spoofing checks |
| SRIF | square-root information filter |  |
| SRP | solar radiation pressure |  |
| SRTM / SRTMHGT | Shuttle Radar Topography Mission / its height-file format | tiles are named by their south-west corner, for example N36W117 |
| SSD | Solar System Dynamics | the JPL group |
| STEC | slant total electron content |  |
| STK | Systems Tool Kit | a mission-analysis product |
| STL | Satellite Time and Location | Iridium's positioning and timing service |
| STM | state transition matrix |  |
| SV | space vehicle (a satellite) |  |
| SVD | singular value decomposition |  |
| SVG | Scalable Vector Graphics |  |
| TAES | IEEE Transactions on Aerospace and Electronic Systems |  |
| TC / TM | telecommand / telemetry |  |
| TCXO | temperature-compensated crystal oscillator |  |
| TDD | test-driven development |  |
| TDOA / FDOA | time / frequency difference of arrival | passive emitter location |
| TERCOM | terrain contour matching |  |
| TEXBAT | Texas Spoofing Test Battery | recorded GNSS spoofing data (OAKBAT is a data set of the same class) |
| TIE | time interval error |  |
| TIES | Telecommunication Information Exchange Service | ITU member accounts |
| ToA | time of arrival |  |
| TOL | tolerance |  |
| TOPSIS | Technique for Order of Preference by Similarity to Ideal Solution |  |
| TOTDEV / TOTVAR | total deviation / total variance | extended-range stability estimators |
| TPAMI | IEEE Transactions on Pattern Analysis and Machine Intelligence |  |
| TPL | timing protection level | see SLOT-TIMING.md |
| TPS | thermal protection system |  |
| TRN | terrain-referenced navigation |  |
| TR / TN | technical report / technical note |  |
| TU Delft | Delft University of Technology |  |
| TWSTFT / TWTFT | two-way satellite time and frequency transfer / two-way time and frequency transfer |  |
| UBX | the u-blox binary receiver protocol |  |
| UDRE | user differential range error | SBAS |
| UERE | user-equivalent range error |  |
| UFFC | Ultrasonics, Ferroelectrics, and Frequency Control | an IEEE Transactions |
| UHF | ultra high frequency | 300 MHz to 3 GHz |
| UI / UX | user interface / user experience |  |
| ULA | uniform linear array |  |
| ULP | unit in the last place | floating-point precision |
| URA / URE | user range accuracy / user range error | URA bounds for integrity, URE is the accuracy RMS |
| URL | uniform resource locator |  |
| USGS | United States Geological Survey |  |
| USNO | United States Naval Observatory |  |
| USO | ultra-stable oscillator |  |
| USSA76 | US Standard Atmosphere 1976 |  |
| VIKOR | VIseKriterijumska Optimizacija I Kompromisno Resenje (multi-criteria optimisation and compromise solution) |  |
| VLBI | very long baseline interferometry |  |
| WAAS / EGNOS | Wide Area Augmentation System / European Geostationary Navigation Overlay Service | SBAS; see above |
| WASM | WebAssembly |  |
| WASPAS | Weighted Aggregated Sum Product ASSessment |  |
| WG-C | Working Group C of the European Union–United States cooperation on satellite navigation | publishes the ARAIM reference documents |
| WGCCRE | Working Group on Cartographic Coordinates and Rotational Elements | IAU |
| WGN | white Gaussian noise |  |
| WGS72 / WGS84 | World Geodetic System 1972 / 1984 | SGP4 uses WGS72 constants |
| WHU | Wuhan University |  |
| WSM / WPM | weighted sum model / weighted product model | multi-criteria aggregation (WPM also means white phase modulation; the context says which) |
| XML | Extensible Markup Language |  |
| XOR | exclusive or |  |
| X / Y / Z / F (XYZF), D / I | the geomagnetic field components: north, east, down, total intensity; declination, inclination |  |
| YAGNI | you aren't gonna need it | a design principle |
| ZHD | zenith hydrostatic delay |  |

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
