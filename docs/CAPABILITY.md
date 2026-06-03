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
| **Timing & frequency** | partial | Exact van-Loan-Q two-state Kalman clock (NIST SP 1065); overlapping **ADEV, MDEV, TDEV, HDEV** estimators + χ²-based confidence intervals (`src/allan.rs`); honest grid-bounded holdover FoM; clock ensembles | Stable32/AllanTools numeric parity against reference datasets; noise-type-specific edf (current edf is a conservative non-overlapping count); real two-way time-transfer stochastic model | Stable32 parity + edf: P2 |
| **GNSS / PNT processing** | partial | **Geometry simulation only**: DOP, availability, real snapshot + solution-separation RAIM (HPL/VPL) from orbits; **RINEX 3 GPS NAV ingestion** parsed → SV ECEF position & clock bias (IS-GPS-200), usable as a first-class `Propagator` source AND as an inline constellation `rinex` block that drives a scenario end-to-end (`scenarios/orbit-rinex.toml`, CLI/Python/wasm) | **Not a receiver/solver**: no pseudorange/carrier model, no PPP/RTK, no iono/tropo; GPS LNAV only (no Galileo/BeiDou/GLONASS); no SP3 yet | multi-GNSS + SP3: in progress; for real-signal processing use RTKLIB/gLAB |
| **Sensor fusion / INS dead-reckoning** | partial | **3-axis strapdown library** (`src/inertial/{attitude,mechanization,imu_errors}.rs`): quaternion attitude with coning/sculling compensation, full NED mechanization (Earth-rate + transport-rate, WGS-84 Somigliana gravity), and a deterministic IMU error model (**scale-factor, misalignment, g-sensitivity, quantization, rate-ramp** modelled). The default `inertial` scenario **pack** still runs the legacy **1-DOF scalar** error budget (VRW/ARW, bias-instability) with truth-snap GNSS reset | The strapdown library is **not yet wired into the scenario pack/FoM**, and there is **no EKF/complementary GNSS-INS fusion** yet (the pack is open-loop dead-reckoning, not a coupled filter); not modelled in the IMU error model: vibration rectification, temperature-gradient drift | Switch the pack to the 3-axis path + loosely-coupled GNSS/INS EKF: **P2** |
| **Integrity / RAIM / ARAIM** | partial | **Real snapshot RAIM** in `src/raim.rs`: least-squares solution + residual χ² fault detection (exact threshold from a dependency-free incomplete-gamma χ²) and **slope-based HPL/VPL** (pbias from a non-central χ² for the configured P_fa/P_md). Plus the scenario FoM's filter self-consistency (k-σ bound) | RAIM module is **not yet wired into the scenario pipeline FoM** (still reports self-consistency); no ARAIM multi-hypothesis integrity-risk / P_HMI allocation, no fault *exclusion* (FDE) or alert limits; not DO-229/ARAIM-certified | wire RAIM into FoM + ARAIM: **P2** (see [`INTEGRITY.md`](INTEGRITY.md)) |
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
