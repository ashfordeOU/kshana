<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Quantum-sensor models: what Kshana models, and what it does not

Kshana is a **PNT-resilience (PNT: positioning, navigation and timing) simulator with quantum-sensor performance models**. It
is *not* a first-principles quantum-physics simulator. This page states exactly what
that means so the "quantum" framing cannot be mistaken for more than it is.

## What IS modelled

Each quantum (and classical) sensor is an **error model** driven by published
noise-budget parameters:

- **Clocks** — white-frequency and random-walk-frequency PSDs (power spectral densities),
  a flicker (1/f) Allan floor, and linear drift, sourced from datasheets and papers: the
  CSAC (chip-scale atomic clock) Microchip SA.45s; the strontium optical-lattice clock of
  Origlia et al. (arXiv:1503.08457), a space-oriented goal; and the six `ClockClass`
  defaults (CSAC; USO, ultra-stable oscillator; DSAC, Deep Space Atomic Clock; TCXO,
  temperature-compensated crystal oscillator; OCXO, oven-controlled crystal oscillator;
  RAFS, rubidium atomic frequency standard), each citing one source. The Allan deviation
  these produce is validated against the standard noise-type slopes (see
  [`VALIDATION.md`](VALIDATION.md)). One optical-clock curve is real: the measured
  ⁸⁸Sr tweezer-clock Allan deviation of Norcia et al. (*Science* 2019) is reproduced by the
  noise fit, a VALIDATED row in [`VERIFICATION-MATRIX.md`](VERIFICATION-MATRIX.md); the
  holdover figures built on the optical class stay MODELLED.
- **Inertial sensors** — in the `inertial` and hybrid packs, a single-axis (1-DOF, one
  degree of freedom) accelerometer/gyro error budget: velocity random walk, angular random
  walk, acceleration random walk, and an Allan bias-instability floor. The `gnss-ins` and
  `hybrid-ukf` kinds instead run the three-axis strapdown mechanisation in
  `src/inertial/` (quaternion attitude, north-east-down navigation equations, a
  deterministic IMU error model).
- The quantum scenario kinds — `quantum-trade`, `quantum-time-transfer`,
  `quantum-anomaly-detect`, `quantum-gnss-free-nav` and `hybrid-ukf` — are built from
  these error models and are MODELLED; `quantum-time-transfer`, `quantum-anomaly-detect`
  and `quantum-gnss-free-nav` also report a representativeness record with the gaps to
  flight.
- The engine is **neutral**: "quantum" and "classical" are the same code path with
  different coefficients. The contrast in the figures of merit comes entirely from the
  input noise parameters, each traceable to a cited source.

## What is NOT modelled

For the clock and time-transfer sensors, none of the underlying quantum physics is
simulated — only the net Allan contribution, supplied as a coefficient. For the
**cold-atom accelerometer** a first-principles layer now exists (see below); the
remaining systematics are still coefficient-level or unmodelled:

- the atom-interferometer **Mach–Zehnder phase** (`Φ = k_eff·a·T²`), **quantum
  projection / shot noise** (`σ_Φ = 1/(C·√N)`), interferometer **contrast** decay,
  **cycle time**, and the **vibration-coupling transfer function** (`|H(ω)| =
  (4/ω²)sin²(ωT/2)`, white-PSD variance `σ_Φ² = k_eff²·S_a·T³/3`) *are now modelled from
  first principles* for the CAI (cold-atom interferometer) accelerometer
  (`src/inertial/quantum_imu.rs`), deriving the white-acceleration PSD `q_va` the
  classical model consumes, together with the **fringe-ambiguity dynamic range**
  (`a_max = π/(k_eff·T²)`) — see [`QUANTUM.md`](QUANTUM.md);
- the **Coriolis** systematic (`coriolis_phase` / `coriolis_accel_bias`, the
  `2·v⊥·Ω` cross-coupling) and the **AC-Stark (AC: alternating-current) / light-shift** systematic
  (`ac_stark_phase`, which cancels under a symmetric two-photon detuning) *are now
  modelled and unit-tested* in `src/inertial/quantum_imu.rs`;
- three further CAI error terms *are now modelled* as library functions in
  `src/inertial/cai_error_terms.rs` (0.36; MODELLED; not yet reachable from a scenario
  kind):
  - **Raman laser-phase noise**: the sensitivity-function weighting of Cheinet et al.
    (2008), Eq. 8, with the white-phase closed form `σ_Φ² = (π/2)²·S_φ⁰/τ_R` (Eq. 18 at one
    cycle) and a numeric route for any phase-noise spectrum, plus the laser frequency noise
    that the retro-reflection delay `t_d = 2L/c` does not cancel (Le Gouët et al. 2007,
    Eqs. 9 to 11);
  - **wavefront curvature** (pure defocus only): the bias `δg = σ_v²/R` of a thermal cloud
    on a beam of curvature radius `R`, and its reduction when only atoms inside a
    detection radius are counted (after Louchet-Chauvet et al. 2011 and Schkolnik et al.
    2015); higher-order aberrations are not modelled;
  - **fringe-ambiguity resolution**: the probability of a wrong fringe index,
    `erfc(π/(√2·s))`, for a classical-accelerometer aid (Lautier et al. 2014) and for two
    interrogation times (after Bonnin et al. 2018), with the inverse that gives the
    largest classical noise for a stated failure probability.

  Each closed form is checked against an independent numerical route (frequency-domain
  quadrature, or a Monte Carlo over atoms or shots) and its limiting cases. The one
  published number reproduced is Cheinet et al.'s white-phase-noise level: −111 dB·rad²/Hz
  at `τ_R` = 20 µs gives about 1 mrad per shot (0.99 mrad; the paper derives that level
  with its Eq. 17, flicker plus white). None of this is a measurement of any instrument;
- still **not** modelled: higher-order wavefront aberrations, the phase noise of a
  specific laser system, and clock-side first-principles physics;
- the quantum-versus-classical `inertial` pack is single-axis; the three-axis strapdown
  path runs only in `gnss-ins` and `hybrid-ukf` (see the IMU, inertial measurement unit,
  note in the README and [`VALIDATION.md`](VALIDATION.md)).

Completing the quantum-physics layer (reaching the CAI error terms from a scenario kind,
higher-order wavefront aberrations and clock-side first-principles physics) is the
remaining P2 work in
[`ROADMAP.md`](../ROADMAP.md).

## Ground-lab vs. flight-qualified figures

Parameter tables mix maturity levels; treat them accordingly:

| Sensor | Source figure | Maturity |
|--------|---------------|----------|
| CSAC (e.g. SA.45s) | datasheet σ_y(1 s) ≈ 3e-10 | **deployed** commercial part (radiation-tolerant space variants exist) |
| Strontium optical-lattice clock | σ_y(1 s) goal ≈ 1e-15 (arXiv:1503.08457) | **ground-lab** — Kshana knows of no published in-orbit performance for one |
| Cold-atom accelerometer | published lab Allan figures | **ground-lab / sounding-rocket** |

Optical-clock figures in Kshana are *space goals on ground hardware*. No flown optical
clock exists; the README and result provenance say so explicitly.

## Benchmark: ACES/PHARAO on the ISS (operational since April 2025)

The ESA (European Space Agency) **ACES/PHARAO** payload (ACES: Atomic Clock Ensemble in
Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — a laser-cooled caesium clock plus an active hydrogen
maser, operating on the ISS (International Space Station) since April 2025 — is the current operational on-orbit
clock-stability benchmark (target fractional stability of order 1e-16 after a few days
of integration). Kshana's optical-clock model represents a *more aggressive* ground-lab
goal than ACES's flown caesium/maser performance; when comparing Kshana's optical
numbers to "what has actually flown", ACES/PHARAO is the honest reference point, and it
is a microwave/maser system, not an optical-lattice clock.

> The exact ACES in-orbit performance figures should be cited from ESA's published
> results as they are released; the point here is the *maturity gap*, not a specific
> number — Kshana's optical figures are goals, not flown performance.

## See also

- [`VALIDATION.md`](VALIDATION.md) — per-parameter `validated` / `not modeled` labels.
- [`GLOSSARY.md`](GLOSSARY.md) — figure-of-merit (FoM) definitions and every abbreviation.
- [`INTEGRITY.md`](INTEGRITY.md) — what the Integrity and Security FoMs are and are not.
- [`QUANTUM.md`](QUANTUM.md) — the first-principles cold-atom accelerometer.
