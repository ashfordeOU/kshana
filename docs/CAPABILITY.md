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
| **Reference frames** | partial | `src/frames.rs`: GMST-based TEME↔ECEF, WGS-84 geodetic↔ECEF (exact + iterative inverse, machine-precision at all altitudes), and a geodetic ground-station observer (azimuth/elevation/range) | Polar motion (PEF→ITRF) and sub-arcsecond nutation not applied (GMST-only, sub-km on the ground track); full IERS/CIO chain on the roadmap | TEME↔ECEF + geodetic: **done**; ITRF-precise: P2 |
| **Timing & frequency** | partial | Exact van-Loan-Q two-state Kalman clock (NIST SP 1065); overlapping **ADEV, MDEV, TDEV, HDEV** estimators + χ²-based confidence intervals (`src/allan.rs`), **numerically validated against the Stable32 reference deviations for the canonical NBS14 dataset to 1e-4** (`tests/allan_reference.rs`); honest grid-bounded holdover FoM; clock ensembles | noise-type-specific edf (current edf is a conservative non-overlapping count); real two-way time-transfer stochastic model | edf + two-way model: P2 |
| **GNSS / PNT processing** | partial | **Geometry simulation only**: DOP, availability, real snapshot + solution-separation RAIM (HPL/VPL) from orbits; **RINEX 3 multi-GNSS NAV ingestion** (GPS/Galileo/QZSS/BeiDou via IS-GPS-200, GLONASS state-vector) parsed → SV ECEF position & clock bias, usable as a first-class `Propagator` source AND as an inline constellation `rinex` block that drives a scenario end-to-end (`scenarios/orbit-rinex.toml`, CLI/Python/wasm); **RINEX 3/4 OBSERVATION ingestion** (pseudorange/carrier/Doppler/SNR by code) and SP3 precise-orbit read/write | **Not a receiver/solver**: the observation parser reads measurements but there is no pseudorange/carrier *solution*, no PPP/RTK, no iono/tropo; BeiDou-GEO excluded | for real-signal processing use RTKLIB/gLAB |
| **Sensor fusion / INS dead-reckoning** | partial | **3-axis strapdown library** (`src/inertial/{attitude,mechanization,imu_errors}.rs`): quaternion attitude with coning/sculling compensation, full NED mechanization (Earth-rate + transport-rate, WGS-84 Somigliana gravity), and a deterministic IMU error model (**scale-factor, misalignment, g-sensitivity, quantization, rate-ramp** modelled). The default `inertial` scenario **pack** still runs the legacy **1-DOF scalar** error budget (VRW/ARW, bias-instability) with truth-snap GNSS reset | The strapdown library is **not yet wired into the scenario pack/FoM**, and there is **no EKF/complementary GNSS-INS fusion** yet (the pack is open-loop dead-reckoning, not a coupled filter); not modelled in the IMU error model: vibration rectification, temperature-gradient drift | Switch the pack to the 3-axis path + loosely-coupled GNSS/INS EKF: **P2** |
| **Integrity / RAIM / ARAIM** | partial | **Real snapshot RAIM** in `src/raim.rs`: least-squares solution + residual χ² fault detection (exact threshold from a dependency-free incomplete-gamma χ²) and **slope-based HPL/VPL** (pbias from a non-central χ² for the configured P_fa/P_md); **solution-separation (MHSS) RAIM** with fault detection/identification; **ARAIM integrity-risk (P_HMI) budget** (`araim_raim`) that solves the smallest HPL/VPL whose summed `P_HMI = Σ_k p_fault,k·Q((PL−T_k)/σ_k)` meets an explicit integrity-risk allocation, plus a **Stanford(-ESA) integrity-diagram** (exported by the user-runnable `integrity` scenario kind from a seeded no-fault error realization, with availability against alert limits and the region/HMI counts in the JSON result and CLI summary). Plus the scenario FoM's filter self-consistency (k-σ bound) | RAIM is reachable via the `integrity` scenario kind but **not yet folded into the clock/holdover FoM** (those still report self-consistency); the ARAIM budget is **single-fault MHSS** — simultaneous multi-SV-subset faults, the constellation-wide fault mode, and **FDE** beyond identification are not modelled; the snapshot/MHSS/ARAIM cores are exercised on **real IGS precise-orbit (SP3) geometry** (`tests/igs_real_data.rs`), but receiver-domain gLAB parity over a full RINEX arc needs a pseudorange solution Kshana lacks; not DO-229/ARAIM-certified | multi-fault ARAIM + receiver-domain gLAB parity + FoM wiring: **P2** (see [`INTEGRITY.md`](INTEGRITY.md)) |
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
| Telemetry / TT&C / CCSDS | partial | bespoke TOML-in/JSON-out; **CCSDS OEM (Orbit Ephemeris Message) export** (502.0-B KVN, for GMAT/Orekit/STK); other CCSDS message types (ODM/AEM/TDM) and SPICE interop remain a roadmap item (P2) |
| Interoperability & standards (RINEX/SP3/SPICE/CCSDS) | partial | RINEX 3 **multi-GNSS NAV** — GPS, Galileo, QZSS, BeiDou MEO/IGSO (IS-GPS-200) **and GLONASS** (PZ-90 state-vector RK4) — ingested + propagated + runnable as one mixed constellation; **RINEX 3/4 OBSERVATION parser** (pseudorange/carrier/Doppler/SNR by observation code, with LLI/SSI flags); SP3-c/d precise-ephemeris **read ↔ write round trip** (parse + export for Ginan/RTKLIB/gLAB) **and a 9th-order Lagrange propagator** (`Propagator::Sp3Precise`); **CCSDS OEM 2.0 ephemeris writer** (TEME state export for flight-dynamics tools). No BeiDou-GEO, no SP3 clock interpolation, no OEM reader, no observation *solution* (parse only), no SPICE/other-CCSDS yet — **P2** "annex adjacent domains via standard formats" |
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
