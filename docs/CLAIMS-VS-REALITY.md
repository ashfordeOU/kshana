<!-- SPDX-License-Identifier: Apache-2.0 -->
# Claims vs. reality — overclaim ledger

An independent audit of an earlier Kshana version catalogued fourteen **overclaims**
(`OC-0`…`OC-13`): places where a public-facing surface (README, playground, FoM labels,
scenario packs) described a capability more strongly than the code delivered. This page is
the closure ledger: each row states the original overclaim, how it was resolved, and the
evidence. Two resolution kinds appear:

- **De-claimed** — the wording was corrected to match the code (honest re-framing, no
  capability change). "Zero code = zero claim."
- **Superseded** — the real capability was subsequently built and tested, so the strong
  claim became *accurate*.

A regression guard (`tests/no_overclaims.rs`) scans the live public surfaces (`README.md`,
`docs/CAPABILITY.md`, `docs/GLOSSARY.md`, `web/capabilities.json`, `web/index.html`) on
every CI run and fails if any of the retired bare overclaim phrases reappears uncaveated —
so a row cannot silently regress from GREEN.

All fourteen rows are **GREEN**.

| OC | Original overclaim | Resolution | Status | Evidence |
|----|--------------------|-----------|:------:|----------|
| OC-0 | "joint Kalman fusion estimator" implied a single cross-covariance filter; the code ran two independent estimators | **Superseded** — a real cross-covariance coupled clock+position Kalman filter was built | 🟢 | `src/fusion/coupled.rs` (7 tests, incl. a 100-trial coupled-vs-decoupled ensemble — coupled recovers 2.97 m RMS vs 48.8 m decoupled); CAPABILITY "Sensor fusion" → full |
| OC-1 | "clock-aided spoof-detection RAIM" implied a multi-satellite RAIM detector | **De-claimed → Superseded** — re-framed as a clock-stability spoof-detectability bound; the real RAIM/ARAIM (HPL/VPL) then landed | 🟢 | `src/raim.rs` (25 tests — snapshot + solution-separation ARAIM, HPL/VPL, FDE, Stanford diagrams); `docs/INTEGRITY.md` |
| OC-2 | "jamming demonstrator" with no jamming code behind it | **Superseded** — a link-budget jamming model J/S → effective C/N₀ → loss-of-lock was built | 🟢 | `src/jamming.rs` (6 tests); README "Resilience" row |
| OC-3 | "Full IMU Allan-variance noise model on an IMU triad" — the model was single-axis | **De-claimed → Superseded** — re-framed as a 1-DOF error budget; a three-axis strapdown INS then shipped | 🟢 | `src/inertial` three-axis strapdown (quaternion attitude, NED mechanization, coning/sculling); ROADMAP "Inertial" |
| OC-4 | "Hybrid PNT integration" implied a coupled GNSS/INS filter; it was a dead-reckoning error budget | **De-claimed → Superseded** — re-framed as dead-reckoning with a configurable re-lock; real tightly-coupled GNSS/INS fusion then shipped | 🟢 | `src/fusion/tightly_coupled17.rs` (17-state UKF with quantum-CAI dead-reckoning); CAPABILITY "Sensor fusion" → full |
| OC-5 | "validated ~2%" implied a tight enforced gate | **De-claimed** — `VALIDATION.md` states the *enforced* gate (20–25% seed-averaged); "~2%" labelled a typical observation, not the gate | 🟢 | `docs/VALIDATION.md` "On tolerances" header |
| OC-6 | "cross-platform deterministic" without committed evidence | **De-claimed** — toolchain pinned to an exact release; per-scenario golden hashes committed with a reproducibility gate. (Bit-identical *across* OS/arch remains an open item, stated honestly.) | 🟢 | `rust-toolchain.toml` (channel `1.93.0`); `tests/golden.rs`; `scripts/check-reproducible.sh` |
| OC-7 | "hybrid quantum-classical PNT simulator" implied first-principles quantum physics | **De-claimed → Superseded** — re-framed as a PNT-resilience simulator using quantum-sensor performance models; first-principles Mach–Zehnder CAI physics then landed | 🟢 | `src/inertial/quantum_imu.rs` (11 tests — Mach–Zehnder phase, projection noise `1/√(N·C²·T²)`, vibration transfer function); `docs/QUANTUM.md` |
| OC-8 | "Integrity Performance" FoM implied aviation HPL/VPL/RAIM integrity | **De-claimed + Superseded (layered)** — the per-run scenario FoM is honestly labelled *filter self-consistency* (**not** aviation integrity); the real ARAIM HPL/VPL is surfaced *separately* so the two are never conflated | 🟢 | `src/fom.rs:75` (self-consistency, caveated); `src/raim.rs` + `docs/INTEGRITY.md` (real ARAIM) |
| OC-9 | Security FoM presented as always meaningful, even with no attack | **De-claimed** — the Security FoM (`1 − P_md`) is framed within the spoof-detector context and is meaningful only when an attack scenario is configured | 🟢 | README "Resilience" row; the Security FoM is defined at the operationally-harmful spec point |
| OC-10 | "Positioning Performance" FoM implied full position-domain accuracy | **De-claimed** — labelled a 1-DOF `pos_rms_m` for the inertial/hybrid packs, explicitly **not** a 2-D CEP/2DRMS or DOP-weighted accuracy | 🟢 | README figure-of-merit table ("Positioning Performance" row) |
| OC-11 | inertial FoM numbers read as ensemble statistics from single seeds | **De-claimed** — a single run is flagged `monte_carlo: false`; `runs = N` reports mean/spread/bootstrap 95% CI | 🟢 | README FoM table; scenario-coverage envelope tests |
| OC-12 | the "SGP4 GPS constellation" scenario used synthetic placeholder TLEs | **Superseded** — the scenario now embeds a genuine date-stamped Celestrak `gps-ops` snapshot with strict checksums | 🟢 | `scenarios/orbit-sgp4-gps.toml` (real `gps-ops`, `strict_checksum`); `tests/scenario_coverage.rs` |
| OC-13 | README version string drifted from `Cargo.toml` | **De-claimed** — a CI gate asserts the README status badge matches `Cargo.toml` | 🟢 | `scripts/check-version-sync.sh` |

## How a row stays GREEN

The strong claims (OC-0/2/7/8 and the superseded halves of OC-1/3/4/12) are GREEN because
the capability is **shipped and tested** — not because the wording was softened. The
de-claimed rows are GREEN because the live wording matches the code. The guard test makes
the second category enforceable: if a retired overclaim phrase returns to a public surface,
CI goes red. See `tests/no_overclaims.rs`.
