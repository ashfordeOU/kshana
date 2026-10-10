<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Claims vs. reality — overclaim ledger

An independent audit of an earlier Kshana version catalogued fourteen **overclaims**
(`OC-0`…`OC-13`): places where a public-facing surface (README, playground, FoM (figure of merit) labels,
scenario packs) described a capability more strongly than the code delivered. This page is
the closure ledger: each row states the original overclaim, how it was resolved, and the
evidence. Two resolution kinds appear:

- **De-claimed** — the wording was corrected to match the code (honest re-framing, no
  capability change). "Zero code = zero claim."
- **Superseded** — the real capability was subsequently built and tested, so the strong
  claim became *accurate*.

A regression guard (`tests/no_overclaims.rs`) scans the live public surfaces (`README.md`,
`docs/CAPABILITY.md`, `docs/GLOSSARY.md`, `web/capabilities.json`, `web/index.html`,
`web/README.md`, and the crates.io, PyPI (Python Package Index) and npm front pages
`README.crates.md`, `README.pypi.md`, `README.npm.md`) on every CI (continuous integration) run and fails if any of the retired bare overclaim phrases reappears uncaveated —
so a row cannot silently regress from GREEN.

All fourteen rows are **GREEN**.

| OC (overclaim) | Original overclaim | Resolution | Status | Evidence |
|----|--------------------|-----------|:------:|----------|
| OC-0 | "joint Kalman fusion estimator" implied a single cross-covariance filter; the code ran two independent estimators | **Superseded** — a real cross-covariance coupled clock+position Kalman filter was built | 🟢 | `src/fusion/coupled.rs` (7 tests, incl. a 100-trial coupled-vs-decoupled ensemble that requires the coupled position RMS (root mean square) to be below 0.6× the decoupled one and the coupled filter to win at least 90 of the 100 trials); CAPABILITY "Sensor fusion" → full |
| OC-1 | "clock-aided spoof-detection RAIM (receiver autonomous integrity monitoring)" implied a multi-satellite RAIM detector | **De-claimed → Superseded** — re-framed as a clock-stability spoof-detectability bound; the real RAIM/ARAIM (HPL/VPL (HPL: horizontal protection level; VPL: vertical protection level)) then landed | 🟢 | `src/raim.rs` (30 tests — snapshot + solution-separation ARAIM, HPL/VPL, FDE (fault detection and exclusion), Stanford diagrams); `docs/INTEGRITY.md` |
| OC-2 | "jamming demonstrator" with no jamming code behind it | **Superseded** — a link-budget jamming model J/S → effective C/N₀ → loss-of-lock was built | 🟢 | `src/jamming.rs` (10 tests); README "Resilience" row |
| OC-3 | "Full IMU (inertial measurement unit) Allan-variance noise model on an IMU triad" — the model was single-axis | **De-claimed → Superseded** — re-framed as a 1-DOF (DOF: degree of freedom) error budget; a three-axis strapdown INS (inertial navigation system) then shipped | 🟢 | `src/inertial` three-axis strapdown (quaternion attitude, NED (north-east-down) mechanization, coning/sculling); ROADMAP "Inertial" |
| OC-4 | "Hybrid PNT (positioning, navigation and timing) integration" implied a coupled GNSS/INS (GNSS: global navigation satellite system) filter; it was a dead-reckoning error budget | **De-claimed → Superseded** — re-framed as dead-reckoning with a configurable re-lock; real tightly-coupled GNSS/INS fusion then shipped | 🟢 | `src/fusion/tightly_coupled17.rs` (17-state UKF (unscented Kalman filter) with quantum-CAI (CAI: cold-atom interferometer) dead-reckoning); CAPABILITY "Sensor fusion" → full |
| OC-5 | "validated ~2%" implied a tight enforced gate | **De-claimed** — `VALIDATION.md` states the *enforced* gate (20–25% seed-averaged); "~2%" labelled a typical observation, not the gate | 🟢 | `docs/VALIDATION.md` "On tolerances" header |
| OC-6 | "cross-platform deterministic" without committed evidence | **De-claimed** — toolchain pinned to an exact release; per-scenario golden hashes committed with a reproducibility gate. (Bit-identical *across* OS/arch (OS: operating system) remains an open item, stated honestly.) | 🟢 | `rust-toolchain.toml` (channel `1.93.0`); `tests/golden.rs` (numeric values to 1e-6); `tests/cross_platform_golden.rs` (hash of each result's input fingerprint and shape, run on the Linux, macOS and Windows CI matrix); `scripts/check-reproducible.sh` |
| OC-7 | "hybrid quantum-classical PNT simulator" implied first-principles quantum physics | **De-claimed → Superseded** — re-framed as a PNT-resilience simulator using quantum-sensor performance models; first-principles Mach–Zehnder CAI physics then landed | 🟢 | `src/inertial/quantum_imu.rs` (26 tests — Mach–Zehnder phase, projection noise `1/√(N·C²·T²)`, vibration transfer function, Coriolis + AC-Stark (AC: alternating-current) systematics); `docs/QUANTUM.md` |
| OC-8 | "Integrity Performance" FoM implied aviation HPL/VPL/RAIM integrity | **De-claimed + Superseded (layered)** — the per-run scenario FoM is honestly labelled *filter self-consistency* (**not** aviation integrity); the real ARAIM HPL/VPL is surfaced *separately* so the two are never conflated | 🟢 | `src/fom.rs:80` (`integrity`: self-consistency, caveated); `src/raim.rs` + `docs/INTEGRITY.md` (real ARAIM) |
| OC-9 | Security FoM presented as always meaningful, even with no attack | **De-claimed** — the Security FoM (`1 − P_md`) is framed within the spoof-detector context and is meaningful only when an attack scenario is configured | 🟢 | README "Resilience" row; the Security FoM is defined at the operationally-harmful spec point |
| OC-10 | "Positioning Performance" FoM implied full position-domain accuracy | **De-claimed** — labelled a 1-DOF `pos_rms_m` for the inertial/hybrid packs, explicitly **not** a 2-D CEP/2DRMS (CEP: circular error probable) or DOP-weighted (DOP: dilution of precision) accuracy | 🟢 | README figure-of-merit table ("Positioning Performance" row) |
| OC-11 | inertial FoM numbers read as ensemble statistics from single seeds | **De-claimed** — a single run is flagged `monte_carlo: false`; `runs = N` reports mean/spread/bootstrap 95% CI | 🟢 | README FoM table; scenario-coverage envelope tests |
| OC-12 | the "SGP4 (Simplified General Perturbations 4) GPS (Global Positioning System) constellation" scenario used synthetic placeholder TLEs (two-line element sets) | **Superseded** — the scenario now embeds a genuine date-stamped Celestrak `gps-ops` snapshot with strict checksums | 🟢 | `scenarios/orbit-sgp4-gps.toml` (real `gps-ops`, `strict_checksum`); `tests/scenario_coverage.rs` |
| OC-13 | README version string drifted from `Cargo.toml` | **De-claimed** — a CI gate asserts the README status badge matches `Cargo.toml` | 🟢 | `scripts/check-version-sync.sh` |

## 0.35: claims kept narrow, and one correction

The 0.35 features were written with their limits stated beside the claim, and the same
guards (`tests/no_overclaims.rs`, and the wording guard in `tests/compliance_report.rs`) scan
the pages that describe them. This table is not part of the fourteen-row ledger above; it records, for the
new surfaces, what is claimed and what is not.

| Surface | What is claimed | What is not |
|---|---|---|
| Vessel trust score (`receiver_trust`, `$PKSHT`, gate, Signal K, OpenCPN) | a 0-100 score and reasons from a receiver's own NMEA, MODELLED | advisory, not type-approved navigation equipment; a score for one log is not a statement about other receivers; it does not make a fix more accurate |
| Crew-training NMEA streams | synthetic bridge NMEA with scripted events and an instructor log | text only, no radio-frequency output; never for a vessel's live navigation systems; advisory, not type-approved navigation equipment |
| Evidence packs | a signed technical record that can be verified offline | not a legal opinion; does not say what caused an event, who was responsible, or that the log shows what the receiver really received |
| Interference map | aggregate degraded-navigation cells from openly licensed reports | not a forecast; a route's exposure is a share of cells, not a risk |
| Test-bench export | a scenario's vehicle motion and events in files a laboratory simulator can read | no signal is written; no simulator or receiver performance is claimed |
| Public-framework compliance mapping | which rows a set of runs supports evidence for, with a gap on every row | never that a framework is met or a product approved; a kind label alone is not evidence |

**Correction recorded in 0.35.** An earlier version of `docs/RESILIENCE-CROSSWALK.md` and of
the resilience module's comments described seven "technique categories" of the DHS Resilient
PNT Conformance Framework. Version 2.0 of that framework defines core functions (Prevent,
Respond, Recover), levels 0 to 4 and eight numbered requirements, and no list of seven
categories. The seven sub-score names the scoring engine emits are Kshana's own, and the
crosswalk now says so.

## How a row stays GREEN

The strong claims (OC-0/2/7/8 and the superseded halves of OC-1/3/4/12) are GREEN because
the capability is **shipped and tested** — not because the wording was softened. The
de-claimed rows are GREEN because the live wording matches the code. The guard test makes
the second category enforceable: if a retired overclaim phrase returns to a public surface,
CI goes red. See `tests/no_overclaims.rs`.
