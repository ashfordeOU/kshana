<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Quantum inertial-sensor physics (cold-atom interferometer)

Most of Kshana drives its quantum sensors from **published Allan/noise coefficients**
— datasheet lookups (see [`QUANTUM-MODELS.md`](QUANTUM-MODELS.md) and
[`PROVENANCE.md`](PROVENANCE.md)). This document covers the one place where the engine
instead computes sensor performance **from first principles**: the cold-atom
interferometer (CAI) accelerometer model in
[`src/inertial/quantum_imu.rs`](../src/inertial/quantum_imu.rs).

It is deliberately a *minimal, honest* physics layer — the quantum-projection-noise
floor and the interferometer scale factor — not a full instrument simulator. The
sections below state exactly what is and is not modelled.

## What is modelled

A three-pulse (π/2–π–π/2) Mach–Zehnder atom interferometer (Kasevich & Chu 1991;
Peters, Chung & Chu 2001), the standard cold-atom accelerometer geometry:

| Quantity | Formula | Notes |
|----------|---------|-------|
| Effective wavevector | `k_eff = 4π/λ` | Two-photon Raman; Rb-87 D2 (780.241 nm) → `k_eff ≈ 1.611×10⁷ rad/m`. |
| Interferometer phase | `Φ = k_eff · a · T²` | Uniform specific force `a` along `k_eff`, pulse separation `T`. The `T²` scaling is the dominant sensitivity lever (microgravity buys long `T`). |
| Quantum projection noise | `σ_Φ = 1/(C·√N)` | Per shot, fringe contrast `C`, atom number `N` — the shot-noise limit of a two-port population readout. |
| Per-shot acceleration sensitivity | `σ_a = σ_Φ / (k_eff·T²)` | Phase noise referred to acceleration. |
| Shot-noise-limited ASD (amplitude spectral density) | `n_a = σ_a·√T_c` | Sampling every cycle time `T_c`; units (m/s²)/√Hz. |
| Velocity-random-walk PSD (power spectral density) | `q_va = n_a²` | **The coefficient the classical `AccelModel` consumes** — now *derived*, not supplied. |
| Contrast decay | `C(t) = C₀·exp(−t/τ_c)` | Decoherence over the interrogation. |
| Vibration transfer function | `\|H(ω)\| = (4/ω²)·sin²(ωT/2)` | Acceleration→phase response of the ideal three-pulse geometry (Cheinet et al. 2008); DC (zero-frequency) limit `T²`. |
| Vibration-limited phase | `σ_Φ² = k_eff²·S_a·T³/3` | Flat acceleration PSD `S_a` along the Raman axis; `∫₀^∞\|H\|²dω = (2π/3)T³`. |
| Vibration-limited accel | `σ_a = √(S_a/(3T))` | Per shot; note `k_eff` cancels — set only by the platform PSD and interrogation time. |
| Fringe ambiguity | `a_max = π/(k_eff·T²)`, range in cells `a_max/σ_a = π/σ_Φ` | The fringe phase is read modulo 2π, so a single reading is unambiguous only inside ±`a_max` and aliases every `2·a_max` outside it; the cell count does not depend on `k_eff` or `T`. |
| Axis projection | `a_∥ = k̂_eff · a` | First-order coupling is rank-1: only the along-beam component enters the phase. |
| Coriolis / rotation phase | `Φ_cor = 2·k_eff·v_⊥·Ω·T²` | Rotation systematic for a moving vehicle (Lan et al. 2012); equivalent bias `2·v_⊥·Ω` = the classical Coriolis term. |
| AC-Stark (light-shift) phase (AC: alternating current) | `Φ_LS = (δ_LS,1 − δ_LS,3)/Ω_eff` | One-photon light shift; a *constant* shift cancels by π/2–π–π/2 symmetry (Peters 2001; Gauguet 2008). |

The closing of the loop is the point: `CaiAccelerometer::q_va()` produces exactly the
white-acceleration PSD that the rest of the inertial stack already integrates into a
velocity/position error — so a quantum sensor's noise can be traced to its atom number,
interrogation time, and contrast rather than to a datasheet line.

A worked figure (Rb-87, `T = 10 ms`, `N = 10⁶`, `C = 0.5`, `T_c = 0.5 s`): `Φ(1 g) ≈
1.58×10⁴ rad`, `σ_Φ = 2×10⁻³ rad`, `σ_a ≈ 1.24×10⁻⁶ m/s²` (≈ 0.13 µg) per shot, and a
shot-noise floor `n_a ≈ 0.09 µg/√Hz`. With a modest platform vibration PSD `S_a =
10⁻¹⁰ (m/s²)²/Hz` the **vibration-limited** per-shot floor is `σ_a ≈ 5.8×10⁻⁵ m/s²`
(≈ 5.9 µg) — about 46× the shot-noise floor, showing why real devices are vibration-,
not projection-, limited. The same interferometer reads specific force unambiguously only
within `a_max ≈ 1.95×10⁻³ m/s²` (≈ 199 µg), about 1 571 resolution cells: `Φ(1 g)` is
thousands of fringes, so a single reading of 1 g is aliased.

## What is NOT modelled (and why the floor is optimistic)

The shot-noise floor above is a **fundamental lower bound**. Real CAI instruments sit
above it: a static laboratory gravimeter (Freier et al. 2016, 96 nm/s²/√Hz) about 60×
above the floor computed for its parameters, and a fielded accelerometer triad much
further (the Exail device cited in `scenarios/imu-deadreckoning.toml` quotes
22 µg/√Hz). The dominant term — **vibration coupling** — and the two leading
deterministic systematics — **Coriolis/rotation** and the **AC-Stark light shift** — are
modelled (the transfer-function, Coriolis and light-shift rows above), and so is the
**fringe-ambiguity dynamic range** (`max_unambiguous_accel`, `wrap_phase`,
`accel_from_wrapped_phase`, `dynamic_range_cells`). The remaining gap is what this layer
still does not include:

- **Wavefront aberration** and higher-order beam-pointing systematics — **not modelled**.
- **Fringe-ambiguity resolution** — the model states the unambiguous range and returns
  the wrapped phase; it does not unwrap a reading outside ±`a_max` (for example with a
  classical accelerometer or several interrogation times), and it bounds the range for an
  ideal three-pulse fringe, with no wavefront or contrast-loss terms.

Mapping to the literature: Groves, *Principles of GNSS, Inertial, and Multisensor
Integrated Navigation Systems* §12.5 (quantum technology; GNSS: global navigation
satellite system); Cheinet et al., *IEEE Trans. Instrum. Meas.* 57 (2008) for the
interferometer sensitivity/transfer function (IEEE: Institute of Electrical and
Electronics Engineers); Freier et al., *J. Phys.: Conf. Ser.* 723 (2016) for the
mobile-gravimeter error budget; CARIOQA-PMP (Cold Atom Rubidium Interferometer in Orbit
for Quantum Accelerometry – Pathfinder Mission Preparation) for the space-accelerometer
parameter regime.

## Status

This is the **P2 quantum-physics-layer** item from [`ROADMAP.md`](../ROADMAP.md): the
Mach–Zehnder phase, projection noise, scale factor, derived `q_va`, contrast decay, **and
the vibration-coupling transfer function / white-PSD variance** are implemented and
unit-tested against hand computation (including a numeric band-integral cross-check of the
transfer function against its analytic `T³` result).

The model is also **wired into runnable scenarios**: an accelerometer resolves to
`ImuKind::QuantumCai` when it carries a `cai` table — `[accel_quantum.cai]` or
`[accel_classical.cai]` in an `inertial` scenario, `[accel.cai]` in a `hybrid-ukf` scenario
(`scenarios/hybrid-ukf.toml` ships one) — with the fields `wavelength_m`, `pulse_sep_t`
(`T`), `atom_number` (`N`), `contrast` (`C`), `cycle_time_s` (`T_c`) and an optional
platform `vibration_psd`. Its velocity-random-walk PSD `q_va` is then
**derived** from the interferometer physics — the shot-noise floor plus, when a vibration
PSD is given, the vibration-limited contribution in quadrature — rather than supplied as a
datasheet coefficient. Scenarios without a `[cai]` block are classical and byte-unchanged.

The Coriolis (`coriolis_phase` / `coriolis_accel_bias`) and AC-Stark light-shift
(`ac_stark_phase`) systematics are implemented and unit-tested (the Coriolis equivalent
bias is checked against the classical `2·Ω×v`; the AC-Stark phase against its symmetric
cancellation). A cycle-time drift sweep (`cai_drift_sweep`) reports the quantum-CAI
dead-reckoning position drift versus cycle time — the computational core of a
quantum-vs-classical comparison. The `quantum-gnss-free-nav` kind reuses the same
accelerometer through `QuantumNavBudget`, and `src/inertial/cai_params.rs` carries a
bracketed (best, nominal, conservative) parameter sheet with a citation per figure.

**What the external checks show.** `tests/quantum_inertial_sensor_reference.rs` checks
the transfer function against a numeric time-domain integral of Cheinet's sensitivity
function, `k_eff` against published line wavelengths, and the Coriolis bias against
`|2Ω×v|` — exact matches of the published forms. The shot-noise floor is a one-sided
bracket: for the published parameters of the Peters et al. 2001 caesium gravimeter and
the Freier et al. 2016 GAIN rubidium gravimeter (arXiv:1512.05660) the modelled floor lies
at or below each device's achieved noise and within three orders of it (for GAIN the floor
is 1.53×10⁻⁹ m/s²/√Hz against the achieved 9.6×10⁻⁸, a factor of about 63). That is
consistent with real devices being vibration- or technically limited, but it is a bracket,
not a validation of an instrument noise model, so the matrix row stays MODELLED.

The remaining follow-ons are wavefront/beam-pointing systematics, fringe-ambiguity
resolution, a numerically exact reproduction of the CARIOQA-PMP Monte-Carlo and
Boeing/AOSense GPS-denied (GPS: Global Positioning System) flight-test budgets (which need
the published platform PSDs and per-shot SNR, the signal-to-noise ratio), and a
quantum-vs-classical comparison preset in the browser playground on top of
`cai_drift_sweep`.
