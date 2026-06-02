<!-- SPDX-License-Identifier: Apache-2.0 -->
# Capability map — what Kshana does, partially does, and does not do

Kshana is a **PNT-performance-and-resilience simulator**, not a full space-systems
toolkit. This page is the honest scope map: for every capability area a procurement or
research reviewer might check, it states the status, what actually exists in the code,
what is missing, and where it sits on the roadmap. Status is one of:

- **yes** — implemented and validated to a stated level;
- **partial** — a real but limited model (scope explicitly bounded below);
- **none** — not modelled (out of scope today).

Nothing here is aspirational: "partial" never means "almost done", it means "this much
and no more". See also [`VALIDATION.md`](VALIDATION.md), [`INTEGRITY.md`](INTEGRITY.md),
and [`QUANTUM-MODELS.md`](QUANTUM-MODELS.md).

## Core PNT (where Kshana actually plays)

| Capability | Status | What exists | What is missing | Roadmap |
|------------|--------|-------------|-----------------|---------|
| **Orbit determination & propagation** | partial | Dependency-free **SGP4/SDP4**, validated to 4.12 mm vs all 666 AIAA 2006-6753 vectors; analytic Keplerian + J2-secular; inertial velocity exposed | No numerical integrator (Cowell/Encke), no force model beyond J2-secular, no orbit *determination* (fit from observations) | numerical propagator + force models: P2+ |
| **Time systems** | partial | `src/timescales.rs`: Julian-date API (civil↔JD, MJD), UTC↔TAI via the full IERS leap-second table (10→37 s, 1972→2017), TAI→TT, UT1 via DUT1, and the IAU-2000 **Earth Rotation Angle** | Single-`f64` JD (~50 µs resolution near 2020; two-part JD on the roadmap); pre-1972 rubber-seconds not modelled; DUT1 not predicted | **done** (foundation); two-part JD: P2 |
| **Reference frames** | none | Output is in **TEME** only | No TEME→ECEF/ITRF/J2000 rotations (ERA is available to drive them) | **P1** (next): frame reduction on top of `timescales.rs` |
| **Timing & frequency** | partial | Exact van-Loan-Q two-state Kalman clock (NIST SP 1065), overlapping **ADEV curve** exposed, honest grid-bounded holdover FoM, clock ensembles | MDEV/TDEV/HDEV, ADEV confidence intervals, finite-window calibration error | MDEV/TDEV + CIs: P1 |
| **GNSS / PNT processing** | partial | **Geometry simulation only**: DOP, availability, RAIM-margin geometry from orbits | **Not a receiver/solver**: no pseudorange/carrier model, no PPP/RTK, no iono/tropo, no RINEX/SP3 I/O | format I/O (RINEX/SP3): P2; for real-signal processing use RTKLIB/gLAB |
| **Sensor fusion / INS dead-reckoning** | partial | **1-DOF scalar accelerometer error budget** (VRW/ARW, bias-instability, accel random-walk), open-loop dead-reckoning with truth-snap GNSS reset | **No 3-axis mechanisation, no EKF/complementary GNSS-INS fusion**, no scale-factor/misalignment/g-sensitivity | 3-axis strapdown + coupled filter: P2 |
| **Integrity / RAIM / ARAIM** | partial | **Filter self-consistency only** — fraction of outage samples inside the Kalman k-σ bound | **No HPL/VPL, no integrity risk / P_HMI, no alert limits, no multi-SV RAIM/ARAIM**; not DO-229E/316/ED-259A | real position-domain RAIM/ARAIM: **P1** (see [`INTEGRITY.md`](INTEGRITY.md)) |
| **Spoofing / jamming threat modelling** | partial | **Analytic clock-stability spoof-*detectability* bound** + a ramping false-time spoof demonstrator (`spoof` kind) | **Jamming: none** (no J/S, no C/N0 degradation, no anti-jam metric); spoof model is analytic, not stochastic multi-path | jamming/J-S model: P2 |
| **Quantum PNT sensor physics** | partial | Quantum sensors as **published Allan/noise-budget coefficients** (CSAC, optical, cold-atom) | No first-principles physics (Mach-Zehnder phase, projection/shot noise, systematics) | first-principles models: P2+ ([`QUANTUM-MODELS.md`](QUANTUM-MODELS.md)) |
| **Constellation design** | partial | Synthetic Walker + real-TLE multi-constellation visibility & DOP (GPS+Galileo to 100%) | Geodetic vs geocentric "up" refinement; coverage/figure-of-merit optimisation | geodetic geometry: P2 |
| **Verification & validation** | partial | One world-class island (SGP4 vs 666 AIAA vectors); deterministic Allan checks | Golden tests pin few exact numbers; calibration on single seeds (see V&V roadmap) | golden numerics + calibration ensembles: P1 (M17/M18) |

## Broader space-systems domains (out of scope today)

These are **none** — listed so the scope is unambiguous, not implied by silence. Each is
a deliberate non-goal for now; Kshana is a PNT simulator, not GMAT/STK/Orekit.

| Capability | Status | Note / roadmap |
|------------|--------|----------------|
| Mission design / trajectory optimization | none | no Lambert, maneuvers, transfers, optimizer — not planned near-term |
| AOCS / GNC / attitude | none | no attitude representation; the IMU "gyro" is a scalar tilt channel |
| Reference frames → Earth-fixed | none | **P1** brings TEME→ECEF/ITRF (listed above under frames) |
| Comms & link budgets | none | no RF/optical link, EIRP/G-T, access scheduling |
| Ground segment & operations | none | no ground-station entity, pass scheduling, or ops timeline |
| Telemetry / TT&C / CCSDS | none | bespoke TOML-in/JSON-out; CCSDS/SPICE interop is an interoperability roadmap item (P2) |
| Interoperability & standards (RINEX/SP3/SPICE/CCSDS) | none | **P2** — the "annex adjacent domains via standard formats" strategy |
| Space weather / environment (iono/atmo/radiation) | none | iono/TEC is a known GNSS error source omitted even in the PNT niche; P2+ |
| Gravity-map / alt-PNT navigation | none | no gravimeter/gradiometer or geoid reference; candidate niche, P3 |
| Re-entry / EDL, Launch analysis, EO/payload | none | out of scope |
| Lunar / cislunar PNT (LunaNet) | none | SDP4 + multi-constellation + integrity make Kshana the *closest* open base, but no SPICE/LunaNet interface yet — P3 |

## Ecosystem & readiness (tracked honestly, not a code capability)

| Area | Status | Note |
|------|--------|------|
| Language bindings & packaging | partial | Rust + Python (abi3) + WASM on three registries; string-in/string-out bindings |
| Education / onboarding UX | partial | Browser playground (a real structural white-space); guided mode is roadmap |
| Community / governance | none | single-founder; no Zenodo DOI/JOSS/citations yet (founder-gated outreach) |
| Funding & procurement readiness | none | TRL ~3; no agency citations/contracts yet (see strategy notes) |

_Last aligned with the 2026-06-02 grand audit's 27-row capability matrix._
