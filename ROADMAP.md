<!-- SPDX-License-Identifier: Apache-2.0 -->
# Kshana roadmap

This is the phased, honest roadmap for Kshana. It complements two other sources of
truth: [`CHANGELOG.md`](CHANGELOG.md) records *released* history, and
[`docs/CAPABILITY.md`](docs/CAPABILITY.md) tracks the maturity of *each* capability
(`validated` / `runnable` / `library` / `partial` / `not-modeled`). When those
disagree with this file, the per-capability table in `docs/CAPABILITY.md` wins.

Horizons are indicative, not commitments. Kshana is pre-1.0; the public
scenario/result schema may still change (breaking changes are called out in the
[`CHANGELOG.md`](CHANGELOG.md)).

## Shipped (on `main`)

A validated, fully reproducible engine spanning the PNT stack:

- **Orbit & geometry** — SGP4/SDP4 propagation validated to 4.12 mm against all 666
  AIAA 2006-6753 vectors; real-TLE and synthetic Walker constellations;
  multi-constellation visibility, dilution of precision, and GNSS availability.
- **Time systems** — IERS leap-second UTC/TAI/TT/UT1, Julian-date API, IAU-2000
  Earth Rotation Angle; GMST-based TEME↔ECEF and WGS-84 geodetic frames.
- **Inertial** — three-axis strapdown INS (quaternion attitude, NED mechanization,
  coning/sculling, deterministic IMU error model).
- **Fusion** — loosely-coupled 15-state GNSS/INS error-state EKF with closed-loop
  feedback, plus a tightly-coupled pseudorange update that corrects with fewer than
  four satellites.
- **Integrity** — snapshot and solution-separation (ARAIM-style) RAIM with HPL/VPL,
  FDE, and Stanford diagrams.
- **Clock & timing** — two-state holdover Kalman, Allan-family stability with
  confidence intervals, optical/RF two-way time transfer.
- **GNSS measurement domain** — Klobuchar ionosphere, Saastamoinen + Niell
  troposphere, pseudorange/Doppler, snapshot RAIM.
- **Resilience** — link-budget jamming (J/S → effective C/N₀ → loss of lock) and a
  stochastic time-spoof detector (Neyman–Pearson / χ²₁ energy test, Monte-Carlo
  P_fa/P_md, Security FoM = 1 − P_md).
- **Interoperability** — RINEX-3/4, SP3-c/d, CCSDS OEM 2.0 export.
- **Surfaces** — Rust library, CLI, Python (PyO3) and WebAssembly (wasm-bindgen)
  bindings, and an in-browser playground.

## P1 — surface and harden (near-term)

- ITRF-precise frame reduction: polar motion and sub-arcsecond nutation on top of
  the shipped GMST-based TEME↔ECEF.
- Two-part Julian dates (the single-`f64` JD is ~50 µs near 2020).
- Surface the loosely-/tightly-coupled GNSS/INS navigator across more scenario packs.
- Golden numerics and calibration ensembles for the V&V suite; committed
  cross-platform golden hashes (reproducibility milestone).
- Provenance as a first-class, citable asset (`docs/PROVENANCE.md`).

## P2 — Quantum physics layer

Today Kshana's quantum sensors are driven by **published Allan/noise-budget
coefficients** (ACES/SHM/CSAC/optical-clock datasheets), not simulated from first
principles. The P2 layer adds first-principles cold-atom-interferometer (CAI)
physics so error budgets can be *derived*, not just *supplied*:

- **Mach–Zehnder CAI phase**, interferometer contrast, and cycle time. *(Delivered —
  `src/inertial/quantum_imu.rs`; see [`docs/QUANTUM.md`](docs/QUANTUM.md).)*
- **Quantum projection / shot noise** from first principles (not only its net Allan
  contribution). *(Delivered — derives the `q_va` PSD the classical model consumes.)*
- **Vibration-coupling tensor**, laser-phase noise, and sensor systematics. *(Still to
  do — the dominant real-device terms; the model is currently the shot-noise floor.)*
- Two-part JD-backed long-horizon timing; carrier-phase + explicit receiver-clock
  state in tight coupling; a trajectory library beyond the single deterministic path.

See [`docs/QUANTUM-MODELS.md`](docs/QUANTUM-MODELS.md) for exactly what is and is not
modelled today. If you need first-principles CAI error budgets (e.g.
CARIOQA-PMP-grade or X-37B-style validation), the P2 layer is the path — and we
welcome collaboration: see [Support & professional services](README.md#support--professional-services).

## P3 — interoperability & standards depth

- Additional CCSDS message types (ODM/AEM/TDM) and SPICE interop.
- Receiver-domain parity (e.g. gLAB) for the GNSS measurement chain; multi-fault
  ARAIM.
- Mission-design / orbit-determination adjacencies (currently out of scope).

---

*Maintained by Ashforde OÜ. Roadmap items are prioritised against real user and
tender needs; nothing here is a delivery commitment.*
