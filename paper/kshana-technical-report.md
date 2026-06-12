---
title: "Kshana: An Open, Reproducible Simulator for Positioning, Navigation, and Timing Resilience with Quantum-Sensor Performance Models"
subtitle: "Technical Report"
author:
  - name: Chakshu Baweja
    orcid: 0009-0008-2098-0751
    affiliation: "Ashforde OÜ, Estonia"
date: 9 June 2026
bibliography: paper.bib
abstract: |
  Resilient positioning, navigation, and timing (PNT) — holding an accurate position
  and time solution when Global Navigation Satellite Systems (GNSS) are denied, jammed,
  or spoofed — is a first-order concern for aviation, defence, critical infrastructure,
  and cislunar operations. Emerging quantum sensors (optical-lattice clocks, cold-atom
  inertial sensors, and optical two-way time transfer) promise markedly slower error
  growth across GNSS gaps, yet there is no open, citable tool that quantifies that
  advantage in a reproducible, externally validated way. Practitioners instead rebuild
  private, one-off spreadsheets whose assumptions are neither shared nor checkable, so
  the field lacks a neutral reference for the question "what resilience does this sensor
  architecture buy?" This report describes Kshana, a deterministic, dependency-light Rust
  engine — also callable from Python and runnable entirely in a web browser via
  WebAssembly — that answers that question. Its defining design choice is that the
  quantum-versus-classical comparison is a parameter swap within a single code path, not a
  fork, so a difference in the figures of merit reflects the sensors rather than two
  divergent implementations. Every result is reproducible from a `scenario + seed +
  engine-version` triple; every sensor parameter is traceable to a cited source; and every
  reported quantity is labelled *validated* or *not-modeled*. We detail the engine
  architecture, the per-domain models (orbital propagation, time scales and reference
  frames, clocks, inertial navigation, GNSS geometry, integrity, satellite-based
  augmentation, time transfer, alternative PNT, and cislunar geometry), and the external
  validation: SGP4/SDP4 agreement to 4.12 mm against all 666 AIAA 2006-6753 reference
  states, bit-for-bit agreement with the IAU SOFA/ERFA reference frame transformations,
  Allan-deviation agreement with the NIST/Stable32 NBS14 reference, inertial
  error-growth agreement with the NaveGo reference profile, and force-model validation by
  ephemeris fitting that fits real ESA and NASA precise orbits to the decimetre level
  (Galileo MEO 0.13 m, Swarm-A LEO 0.10 m), with the lunar case (LRO, 6.6 m) reported
  honestly above the 5 m bar. We close with worked
  resilience case studies, a candid account of the tool's limitations, and the roadmap.
keywords: [PNT, GNSS, resilient navigation, quantum sensors, optical clocks, cold-atom interferometry, SGP4, reference frames, integrity, ARAIM, reproducibility, Rust, WebAssembly]
---

<!--
This is the EXTENDED technical report. The concise JOSS submission paper lives in
paper/paper.md (kept short per JOSS's 250-1000 word requirement). Both share paper.bib.
Render to PDF with, e.g.:
  pandoc paper/kshana-technical-report.md --citeproc --bibliography=paper/paper.bib \
    -o kshana-technical-report.pdf
-->

# 1. Introduction

## 1.1 The PNT-resilience problem

Global Navigation Satellite Systems (GNSS) underpin a large fraction of modern
positioning, navigation, and timing. They are also fragile: the signals arrive at the
Earth's surface at roughly −160 dBW, tens of decibels below the thermal noise floor, so a
modest jammer can deny a wide area, and a spoofer can inject a counterfeit solution that a
naïve receiver will track. Outages also arise benignly — under foliage and in urban
canyons, in the ionospheric scintillation of high-latitude and equatorial regions, during
solar events, and, increasingly, in cislunar space where no operational GNSS shell yet
exists. *Resilient* PNT is the discipline of bounding position and time error through such
gaps using complementary sensors: inertial measurement units, atomic clocks, terrain and
gravity matching, and signals of opportunity.

## 1.2 Quantum sensing as a resilience lever

The error of an inertial- or clock-coasted solution grows with the instability of the
underlying sensor. Quantum sensors attack exactly that term. Optical-lattice clocks reach
fractional frequency instabilities several orders of magnitude below chip-scale atomic
clocks, slowing the quadratic growth of clock-driven position error during a holdover.
Cold-atom interferometric accelerometers and gyroscopes exhibit far smaller bias
instability and random-walk than navigation-grade micro-electromechanical units, slowing
the cubic-in-time growth of inertial dead-reckoning error. Optical two-way time transfer
reaches femtosecond-class link stability, compressing the time-synchronisation budget of a
distributed system. The promise is compelling; the difficulty is quantifying it *honestly*
and *comparably*, because published quantum-sensor results are reported under heterogeneous
conditions and rarely reduced to the navigation figures of merit an architect needs.

## 1.3 The reproducibility gap

There is no shortage of excellent domain tools (Section 2), but none answers the
performance-resilience question in an open, reproducible, like-for-like way. In practice,
primes and agencies build private spreadsheets and notebooks whose sensor assumptions,
random seeds, and software versions are not shared. Two teams asking "how far does this
architecture drift in a five-minute outage?" can obtain different answers for reasons that
are invisible to a reviewer. The community therefore lacks a neutral, citable reference
implementation — the role that, for example, the AIAA 2006-6753 distribution plays for
SGP4 propagation, or that Stable32 plays for frequency-stability analysis.

## 1.4 Contributions

Kshana (क्षण, Sanskrit for *the precise instant*) is our attempt to fill that gap. Its
contributions are:

1. **A single-engine, like-for-like comparison.** The quantum and classical variants of a
   sensor are the same code driven by different, individually cited coefficients, so a
   difference in the output reflects the sensors, not two implementations.
2. **External, non-circular validation.** Every validated quantity is checked against a
   published reference value or an analytic closed form — never against Kshana's own
   output — and every expected value in the test suite is derived by hand from the physics.
3. **Reproducibility by construction.** Each result is fully determined by a `scenario +
   seed + engine-version` triple and emitted as schema-versioned, self-describing JSON.
4. **An honesty contract.** Each figure of merit is labelled *validated* or *not-modeled*,
   and an in-repository ledger reconciles every public claim against the code.
5. **Zero-friction access.** The same core compiles to a native binary, a Python
   extension, and a WebAssembly module that runs the full engine in a browser with no
   install, and it exchanges data with existing pipelines through standard formats (RINEX,
   IGS SP3, CCSDS OEM/OMM).

This report expands on the concise software paper [@baweja2026kshana] with the full model
catalogue, validation evidence, and a candid limitations analysis.

# 2. Background and Related Work

## 2.1 GNSS vulnerabilities and resilient PNT

The vulnerability of GNSS to jamming, spoofing, and natural obscuration is well documented
in the navigation literature [@kaplan2017; @misra2010]. Mitigations span the receiver
(antenna nulling, multi-frequency, multi-constellation), the system (Satellite-Based
Augmentation Systems, integrity monitoring), and the architecture (complementary inertial,
clock, and map-based sensors). Kshana models the architecture layer: it does not replace a
receiver or a SBAS, but quantifies how a given sensor mix performs when GNSS is degraded.

## 2.2 Astrodynamics and mission-design tools

General-purpose astrodynamics is well served. NASA's General Mission Analysis Tool (GMAT)
[@nasa_gmat] and the Orekit library [@orekit] provide high-fidelity propagation, manoeuvre
design, and mission analysis; mature libraries implement SGP4/SDP4 from the canonical
specification, including the Rust `sgp4` crate [@sgp4crate] against which Kshana
cross-checks. These tools are deeper than Kshana in trajectory design and force modelling.
Kshana's orbital layer exists to feed its *navigation* questions — constellation geometry,
dilution of precision, and availability — and interoperates with these tools through SP3
and CCSDS OMM rather than competing with them.

## 2.3 Real-signal GNSS processing

For processing *real* observations, RTKLIB [@takasu2009], gLAB, and Ginan are established;
the GeoRust ecosystem provides Rust RINEX/SP3 parsing. These operate downstream of real
signals. Kshana is the *upstream* performance-simulation layer that answers the resilience
question before signals exist, and consumes/produces RINEX and SP3 so the two regimes meet.

## 2.4 Inertial-navigation simulation

NaveGo [@gonzalez2017navego] and KF-GINS are widely used open inertial/GNSS simulation
frameworks, and Groves' textbook [@groves2013] is the standard reference for the
error-growth relations Kshana implements. Kshana reuses NaveGo's published sensor reference
profiles as a validation oracle (Section 5) rather than reimplementing its scope.

## 2.5 Frequency stability and timing

Allan-variance analysis of clocks is standardised around Stable32 [@stable32] and the NIST
handbook [@riley2008nist], which also provides the canonical NBS14 dataset. Kshana's
clock-stability estimators are validated against those references.

## 2.6 Quantum-sensor performance models

The quantum-sensor coefficients Kshana uses are drawn from the primary literature:
strontium optical-lattice clock stability [@origlia2015], cold-atom interferometric
inertial sensing [@templier2022], and optical two-way time-frequency transfer
[@giorgetta2013; @deschenes2016]. Kshana does not model the quantum physics from first
principles; it parametrises each sensor by its *published, cited* performance and asks
what that performance buys at the navigation level.

## 2.7 The intersection Kshana occupies

Each tool above is strong in its niche. None combines, in one open and externally validated
package: (1) a like-for-like quantum-versus-classical sensor comparison; (2) SGP4/SDP4
validated against the full community reference set; (3) RAIM/ARAIM integrity for both
terrestrial and lunar geometries; and (4) a zero-install in-browser tier. Kshana occupies
that intersection.

# 3. System Architecture

## 3.1 Design principles

Four principles shape the engine. **Determinism:** identical inputs yield byte-identical
outputs, with all randomness drawn from an explicit, recorded seed. **One engine:** every
scenario kind dispatches into shared infrastructure, so the quantum/classical axis is a
parameter, never a branch in logic. **Provenance:** each sensor model carries a
machine-readable `provenance` string tracing its coefficients to a citation. **Honesty
labelling:** each figure of merit is tagged *validated* (checked against an external
oracle), *modeled* (physically reasonable but unverified), or *not-modeled* (explicitly out
of scope), so a reader never mistakes a placeholder for a result.

## 3.2 The scenario → engine → figure-of-merit pipeline

A *scenario* is a small TOML document. Its `kind` field selects a domain pack; its
remaining fields parametrise the sensors, the timeline, and the GNSS environment. The
engine composes the relevant sensor models over a common time grid and reduces the
trajectory to a set of domain figures of merit. The output is a schema-versioned,
self-describing JSON document — carrying the scenario, the seed, the engine version, and
the labelled figures — together with a standalone SVG chart suitable for direct inclusion
in a report. Because the output embeds everything needed to regenerate it, a result is its
own provenance record.

## 3.3 The pack model and dispatch

The scenario catalogue spans the following domains, each a self-contained pack composed
from shared primitives:

| Domain | Representative scenario kinds |
| --- | --- |
| Orbital mechanics | `orbit` (SGP4/SDP4, multi-GNSS, real-TLE, Molniya, RINEX/SP3 export) |
| Clocks & timing | `clock` (holdover, ensemble), `timetransfer` (optical/RF/PPP) |
| Inertial navigation | `inertial` (strapdown dead-reckoning, quantum vs. navigation-grade) |
| GNSS geometry | `gnss-sim`, `gnss-ins` (measurement-domain simulation, coupled INS) |
| Integrity | `integrity` (RAIM/ARAIM, HPL/VPL), `lunar-integrity` (cislunar ARAIM) |
| Augmentation | SBAS protection levels (DO-229E), dual-frequency iono-free |
| Fusion | `hybrid`, `fusion` (EKF/UKF, multi-sensor PNT) |
| Alternative PNT | `terrain-nav`, `gravity-map-nav`, `combined-altpnt` |
| Threats | `jamming` (J/S → C/N₀), `spoof` (spoofing, meaconing detection) |
| Trade studies | `sweep`, `sweep-nd` (one- and N-dimensional parameter sweeps) |

A trade-study pack (`sweep`, `sweep-nd`) drives any scalar parameter across a grid and
collects the resulting figures, turning a single scenario into a design surface.

## 3.4 Reproducibility model

Reproducibility is enforced, not aspirational. The triple `(scenario, seed,
engine-version)` fully determines a run; the engine records all three in the output; and a
continuous-integration check re-runs reference scenarios across operating systems and
compares results bit-for-bit. There are no hidden clocks, no ambient randomness, and no
network dependence at run time.

## 3.5 Multi-target compilation

The same Rust core compiles to three targets without behavioural divergence: a native
command-line binary; a Python extension (via PyO3) for notebook and pipeline use; and a
WebAssembly module that powers an in-browser playground, so a reviewer can run the full
engine — not a cut-down demo — with no installation. A cross-target smoke suite guards
against divergence between the three.

## 3.6 Interoperability

Kshana reads and writes the formats existing pipelines use: RINEX observation/navigation
files, IGS SP3-c/d precise ephemerides, and the CCSDS Orbit Ephemeris Message (OEM) and
Orbit Mean-Elements Message (OMM). A Kshana constellation can therefore be exported to
flight-dynamics tools (e.g. GMAT, Orekit) or seeded from real broadcast ephemerides.

# 4. Models and Methods

## 4.1 Orbital propagation

Kshana provides two complementary propagators. The first is a validated SGP4/SDP4
implementation operating on two-line elements, used for constellation geometry and
availability against real catalogues. The second is a numerical (Cowell) propagator with a
configurable force model: an EGM2008 spherical-harmonic geopotential to degree and order
70, third-body luni-solar perturbations, solar-radiation pressure, atmospheric drag, and a
general-relativistic correction. The numerical propagator is used where mean-element theory
is insufficient and is verified against the universal-variable Kepler solution.

On top of the numerical propagator Kshana builds a **force-model validation engine that
fits agency precise ephemerides** [@montenbruck2000], used to validate the force model
against real agency precise-orbit products rather than against analytic forms alone. The
ephemeris-fitting force model extends the propagator with the solid-Earth, ocean, and atmospheric **tides**
of the IERS Conventions 2010 [@petit2010iers], a high-degree geopotential (EGM2008 for Earth,
and the GRAIL **GRGM660PRIM** field for the Moon [@lemoine2013grail]), conical-shadow
solar-radiation pressure with an estimated reflectivity coefficient, and the Schwarzschild
and Lense–Thirring relativistic terms. The estimator itself is a Gauss–Newton batch
least-squares fit with a **variational state-transition matrix** (cross-checked against a
whole-arc finite difference to better than 1 × 10⁻⁶), inverse-variance observation
weighting, n-sigma outlier editing, and an optional reduced-dynamic tier of cycle-per-revolution
empirical accelerations (one- and two-per-rev). The same generic estimator (the
`precise_od::ForceModel` trait) fits an Earth satellite or, through a distinct Moon-centred
force model evaluating the GRAIL field in the lunar body-fixed principal-axis frame (the IAU
2015 mean-Earth orientation composed with the fixed DE421 mean-Earth→principal-axis offset),
a lunar orbiter — so the selenocentric validation reuses, rather than re-implements, the
Earth machinery. The corresponding residuals against ESA and NASA reference orbits are
reported in Section 5.4.

## 4.2 Time scales and reference frames

Navigation lives or dies on consistent time and frames. Kshana implements the UTC/TAI/TT/UT1
time scales and the IAU 2006/2000A precession-nutation theory, reducing from the Geocentric
Celestial Reference System to the International Terrestrial Reference System through the
Celestial Intermediate Origin (CIO) based transformation, including polar motion. This
chain is validated bit-for-bit against the IAU SOFA / ERFA reference routines (Section 5).

## 4.3 Clocks and frequency stability

Clock behaviour is modelled by power-law noise processes and reduced through the Allan
family of deviations — ADEV, MDEV, TDEV, and HDEV — used both to characterise a clock and
to propagate a holdover error during a GNSS outage. Clock models range from chip-scale
atomic and oven-controlled crystal oscillators to strontium optical-lattice clocks, each
parametrised from cited stability data.

## 4.4 Inertial navigation

A strapdown inertial pack propagates position, velocity, and attitude from accelerometer
and gyroscope measurements, with error models capturing bias instability, velocity- and
angle-random-walk, and scale-factor error. The quantum variant substitutes cold-atom
interferometric sensor coefficients; because the mechanisation is shared, the resulting
divergence isolates the sensor contribution.

## 4.5 GNSS geometry and availability

Walker and custom constellations are generated and propagated; for any user trajectory the
engine computes satellite visibility, the geometry (dilution-of-precision) matrices, and
multi-constellation availability, including against real two-line-element catalogues for
GPS and Galileo.

## 4.6 Integrity

The integrity pack implements Receiver Autonomous Integrity Monitoring and its Advanced
(ARAIM) form, computing horizontal and vertical protection levels (HPL/VPL) from the
geometry and the modelled error distributions, for both terrestrial and lunar geometries.

## 4.7 Satellite-based augmentation

A SBAS pack computes protection levels following the DO-229E framework, including the
dual-frequency iono-free combination, allowing augmentation performance to be compared
across single- and dual-frequency configurations.

## 4.8 Time transfer

The time-transfer pack models optical two-way time-frequency transfer, radio-frequency
two-way satellite time-and-frequency transfer (TWSTFT), and precise-point-positioning time
transfer, reducing each to an equivalent ranging or synchronisation error.

## 4.9 Alternative PNT

When GNSS is unavailable, position can be constrained by matching onboard measurements to a
map. Kshana models terrain-aided navigation against a digital elevation model, gravity-map
matching, and magnetic-anomaly navigation (with an IGRF reference field), as well as a
combined estimator that fuses these alternative observables.

## 4.10 Lunar and cislunar geometry

For cislunar operations Kshana includes a Circular Restricted Three-Body Problem (CR3BP)
propagator — used, for example, for near-rectilinear halo orbit geometry — and a LunaNet /
Lunar Augmented Navigation Service geometry model that supports lunar integrity (ARAIM)
analysis where no terrestrial-style GNSS shell exists.

## 4.11 Threats

The threat packs quantify resilience under attack. The jamming model maps a
jammer-to-signal ratio to an effective carrier-to-noise-density degradation; the spoofing
and meaconing packs model counterfeit-signal injection and the consistency tests
(power, clock, and geometry) that a defended receiver uses to detect it.

# 5. Validation

## 5.1 Methodology

Kshana is validated against *external* oracles — published reference values and analytic
closed forms — and never against its own output. Every expected value in the test suite is
derived by hand from the physics or transcribed from a cited reference, so a passing test
constitutes independent corroboration rather than a self-consistency check. Sensor
coefficients are consolidated, with citations, in an in-repository provenance document.

## 5.2 Headline validation results

| Quantity | Result | Oracle |
| --- | --- | --- |
| SGP4/SDP4 position error | worst-case **4.12 mm** over all 666 reference states | AIAA 2006-6753 distribution [@vallado2006] |
| SGP4/SDP4 velocity error | worst-case **1.85 × 10⁻⁹ km/s** | AIAA 2006-6753 [@vallado2006] |
| SGP4 independent cross-check | sub-micron agreement | `sgp4` crate [@sgp4crate] |
| Frame reduction (nutation) | Δψ, Δε reproduced to **1 × 10⁻¹³** at JD_TT 2453736.5 | IAU SOFA/ERFA `eraNut00a` [@iausofa] |
| GCRS→ITRS chain | bit-for-bit | ERFA `eraXys06a` / `eraC2tcio` [@iausofa] |
| Allan deviation (NBS14) | within **1 × 10⁻⁴** | Stable32 [@stable32] / NIST [@riley2008nist] |
| Geometry (regular tetrahedron) | GDOP = √10/2 ≈ **1.5811**, PDOP 1.5, TDOP 0.5 | analytic closed form [@misra2010; @kaplan2017] |
| Inertial error growth | within **5 %** of NaveGo 3DM-GX3-35 profile | NaveGo [@gonzalez2017navego]; [@groves2013] |
| Two-body propagation | sub-metre over 24 h; energy & angular momentum to ~1 × 10⁻⁹ | universal-variable Kepler |

The SGP4 result is, to our knowledge, agreement with the full community reference set rather
than a sampled subset: all 666 published reference states are reproduced, with a worst-case
position residual of 4.12 mm — well inside the table's own tolerance and consistent with
double-precision arithmetic.

## 5.3 Cross-validation against independent implementations

Beyond closed-form and reference-table checks, Kshana cross-validates against independent
*implementations*: the `sgp4` crate for propagation, and an independent NAIF/SPICE-derived
reference (via the pure-Rust ANISE reimplementation) for the celestial-to-terrestrial frame
rotation, agreeing to the metre level over a representative GNSS orbit. Independent
agreement across two unrelated implementations is stronger evidence than either alone.

## 5.4 Force-model validation by ephemeris fitting against agency products

The strongest external test of the force model is to fit it, through the batch estimator of
Section 4.1, to **real agency precise-orbit products** and report the post-fit residual. The
observations are the published orbit fixes; the dynamics use the same IERS Earth-orientation
data as the observations; and every residual is reported in radial/along-track/cross-track
(RTN) and 3-D, with the raw (no-fit) overlap alongside. Three regimes are covered —
medium- and low-Earth orbit, and a distinct Moon-centred regime:

| Dataset | Regime | Product | n_obs | 3-D RMS (dynamic) | 3-D RMS (reduced-dynamic) | Bar |
| --- | --- | --- | --- | --- | --- | --- |
| Galileo E11 | MEO | ESA/ESOC `ESA0MGNFIN` (ITRF) | 97 | **0.13 m** | 0.07 m | < 5 m ✓ |
| Swarm-A | LEO (~430 km) | ESA L2 `SW_OPER_SP3ACOM_2_` (~2 cm) | 181 | 2.69 m | **0.10 m** | < 5 m ✓ |
| LRO (NAIF −85) | Lunar (~98 km) | JPL Horizons reconstruction [@giorgini1996horizons] | 241 | 12.6 m | **6.6 m** | honest, > 5 m |

For the Galileo medium-Earth orbit the pure-force (state + reflectivity) fit reaches
**13 cm** against ESA/ESOC's final multi-GNSS orbit, and the empirical tier halves it to
7 cm. For the Swarm-A low-Earth orbit the dynamic fit is dominated by an along-track
signature — the textbook drag residual at ~430 km with a static density model — that the
reduced-dynamic empirical tier absorbs to **~10 cm** against ESA's own ~2 cm science orbit.
Both Earth regimes clear the 5 m bar comfortably.

The lunar case is reported **honestly above the bar**. Fitting the GRAIL field in the lunar
body-fixed frame to a real Lunar Reconnaissance Orbiter arc from JPL Horizons gives a
**12.6 m** dynamic and **6.6 m** reduced-dynamic (one- and two-per-rev) residual; the
estimator is not the limit (the result is identical at field degree/order 100 and 150 and at
integrator tolerance 1 × 10⁻⁶ versus 1 × 10⁻⁹). To identify what *does* set the floor we ran a
**DE-grade cross-validation**: a workspace-excluded crate that swaps only the two analytic frame
inputs — the lunar orientation and the Earth/Sun ephemeris — for the JPL DE440 numerically
integrated lunar principal-axis orientation and the DE440 ephemeris (read via the pure-Rust ANISE
SPICE reimplementation), and re-runs the same estimator. The result corrects the natural
hypothesis: DE-grade inputs improve the raw overlap (53.8 → 41.5 m) and the **dynamic** fit
(12.6 → 12.0 m) — so the analytic orientation/ephemeris error is real and limits those tiers — but
leave the **reduced-dynamic** residual essentially unchanged (6.65 → 6.67 m). The empirical
cycle-per-revolution tier already absorbs the orientation/ephemeris error, so the operational
~6.6 m floor is set not by frame fidelity but by a residual that tier cannot absorb, most
consistent with the satellite's unmodelled non-gravitational accelerations (thermal re-radiation
and outgassing) over the short four-hour arc. The constructive corollary is that Kshana's lean,
kernel-free analytic lunar stack already matches DE-grade fidelity for the reduced-dynamic
(operational) lunar orbit; crossing five metres requires a spacecraft non-gravitational model and
a longer multi-arc fit, not better frames. We report the 6.6 m figure as-is rather than tune a
parameter to manufacture a sub-5 m number, in keeping with the honesty contract.

# 6. Reproducibility and Software Quality

Kshana is engineered as research software intended to be trusted and reused. The repository
runs continuous integration on every change: formatting and linting gates, the full test
suite, a cross-platform reproducibility matrix that compares results across operating
systems, and a line-coverage gate (the engine sits near 97 % line coverage). Each release
ships prebuilt binaries, a CycloneDX Software Bill of Materials, SLSA build-provenance
attestation, and an auto-generated validation summary, and is archived on Zenodo with a
citable DOI. A repository-level policy and CI guard enforce that every reported figure
traces to a cited source and that no result is presented as validated unless an external
oracle backs it. The full software is open source under the Apache-2.0 licence.

# 7. Illustrative Case Studies

## 7.1 GNSS-outage inertial dead-reckoning

The motivating comparison is inertial coasting through a GNSS outage. Over a 350-second
gap, a cold-atom (quantum) accelerometer holds the dead-reckoned position error near the
100-metre specification line, while a navigation-grade unit diverges to tens of kilometres
under the same dynamics — a difference of roughly three orders of magnitude that arises
solely from the sensor coefficients, since the mechanisation is shared
(\autoref{fig:dr}). The resulting figure is reproducible from
`scenarios/imu-deadreckoning.toml`.

![Dead-reckoning position error during a GNSS outage: the cold-atom (quantum)
accelerometer holds near the 100 m spec line while the navigation-grade unit diverges to
tens of kilometres over the same 350 s outage. Generated by Kshana from
`scenarios/imu-deadreckoning.toml`.\label{fig:dr}](figure-deadreckoning.png)

## 7.2 Clock holdover

In a timing holdover, the position-equivalent error contributed by the local oscillator
grows with its instability. Swapping an oven-controlled crystal oscillator for a strontium
optical-lattice clock keeps the time error within a tight specification for the full
outage, whereas a chip-scale clock breaches it mid-outage — again, the same model driven by
cited coefficients.

## 7.3 Optical versus radio-frequency time transfer

For distributed time synchronisation, the engine reports an equivalent ranging error of
roughly 0.3 mm for an optical two-way link against roughly 150 mm for a radio-frequency
TWSTFT link [@giorgetta2013; @deschenes2016], quantifying the synchronisation budget a
quantum-grade link buys a networked architecture.

## 7.4 Constellation geometry and cislunar integrity

For a spacecraft inside the GNSS shell, the engine reports visible-satellite count and fix
availability over a day; for cislunar geometry, the LunaNet pack supports lunar ARAIM
analysis where no terrestrial GNSS is visible — extending the resilience question to the
regime where it is most acute.

# 8. Discussion

Kshana's value is not that any single model is novel — most rest on standard, cited theory
— but that they are assembled into one reproducible, externally validated engine in which
the resilience question can be asked honestly and re-asked by anyone. The like-for-like
constraint is the crux: by forcing the quantum and classical cases through identical code,
the tool removes the most common confound in resilience comparisons, namely two different
implementations masquerading as two different sensors. The reproducibility triple and the
labelled figures of merit make a Kshana result auditable in a way a private spreadsheet is
not, and the standard-format interoperability means the engine augments, rather than
disrupts, existing flight-dynamics and GNSS-processing pipelines.

# 9. Limitations and Threats to Validity

We state the limits plainly, in keeping with the tool's honesty contract.

- **Simulation, not flight.** Kshana quantifies *modelled* performance from published
  sensor coefficients; it is not a hardware-in-the-loop testbed and has not been validated
  against a specific flight unit. Its figures are architecture-level estimates, not
  certified performance.
- **Coefficients from the literature.** Quantum-sensor parameters are taken from published
  results obtained under particular laboratory or field conditions; real units will differ,
  and the engine inherits any optimism in its sources. The provenance ledger makes those
  sources explicit precisely so a reader can judge them.
- **Validated ≠ comprehensive.** The validation oracles cover propagation, frames,
  frequency stability, geometry, inertial error growth, and force-model validation by
  ephemeris fitting against agency products. Other quantities are labelled *modeled* rather than *validated*;
  integrity protection levels, for instance, are computed against modelled error
  distributions, not certified against real fault data.
- **Selenocentric ephemeris fitting is above the bar, and the cause is now pinned.** The lunar ephemeris-fitting
  residual (Section 5.4) is 6.6 m reduced-dynamic, *above* the 5 m bar the Earth datasets clear.
  A DE-grade cross-validation (DE440 orientation and ephemeris via ANISE) showed the reduced-dynamic
  floor is *not* the analytic frame fidelity — DE-grade kernels leave it unchanged — but a residual
  the empirical tier cannot absorb, most consistent with the satellite's unmodelled
  non-gravitational dynamics over the short arc. Reaching metre level therefore needs a spacecraft
  non-gravitational model and a longer multi-arc fit, not better frames; the figure is published
  unmodified.
- **Scope boundaries.** Kshana does not process raw signals, does not perform certified
  integrity, and does not replace high-fidelity mission-design astrodynamics; it
  deliberately occupies the upstream performance-simulation layer and interoperates with
  the tools that do.
- **Adoption is nascent.** As an independent, recently published tool, Kshana has yet to
  accumulate external users, citations, or third-party validation; the open licence,
  reproducibility guarantees, and standard-format interoperability are intended to lower the
  barrier to exactly that scrutiny.

# 10. Conclusion and Future Work

Kshana provides what the resilient-PNT field has lacked: an open, reproducible, externally
validated engine in which the performance benefit of quantum clocks, quantum inertial
sensors, and optical time transfer over classical PNT can be quantified honestly and
re-derived by anyone, from orbit and frame down to the navigation figures of merit. It is
validated against the community's own references — the AIAA 2006-6753 SGP4 distribution,
the IAU SOFA/ERFA frame routines, the NIST/Stable32 stability references, and the NaveGo
inertial profiles — and it runs anywhere, from a native binary to a browser tab.

Planned work includes hardware-in-the-loop comparison against real sensor logs, expansion
of the validated (as opposed to modelled) figure set, metre-level selenocentric ephemeris
fitting via DE-grade lunar orientation and ephemeris, deeper cislunar integrity
modelling, and external community validation through peer review and reuse. We invite practitioners to
reproduce, contest, and extend the results: the engine, the scenarios, and the validation
are all open.

# Data and Code Availability

The complete source, scenario catalogue, validation suite, and documentation are openly
available at <https://kshana.dev> and on GitHub, under the Apache-2.0 licence. Each release
is archived on Zenodo with a citable DOI (10.5281/zenodo.20528627). All case-study figures
in this report are reproducible from the cited scenario files with the engine version
recorded in each output.

# Acknowledgements

We thank the authors of the open reference tools and datasets Kshana validates against —
the AIAA 2006-6753 SGP4 reference distribution, the IAU SOFA / ERFA libraries, NaveGo, and
the NIST and Stable32 frequency-stability references — whose public artifacts make honest,
reproducible validation possible.

# References
