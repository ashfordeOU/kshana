<!-- SPDX-License-Identifier: Apache-2.0 -->
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
| Shot-noise-limited ASD | `n_a = σ_a·√T_c` | Sampling every cycle time `T_c`; units (m/s²)/√Hz. |
| Velocity-random-walk PSD | `q_va = n_a²` | **The coefficient the classical `AccelModel` consumes** — now *derived*, not supplied. |
| Contrast decay | `C(t) = C₀·exp(−t/τ_c)` | Decoherence over the interrogation. |
| Vibration transfer function | `\|H(ω)\| = (4/ω²)·sin²(ωT/2)` | Acceleration→phase response of the ideal three-pulse geometry (Cheinet et al. 2008); DC limit `T²`. |
| Vibration-limited phase | `σ_Φ² = k_eff²·S_a·T³/3` | Flat acceleration PSD `S_a` along the Raman axis; `∫₀^∞\|H\|²dω = (2π/3)T³`. |
| Vibration-limited accel | `σ_a = √(S_a/(3T))` | Per shot; note `k_eff` cancels — set only by the platform PSD and interrogation time. |
| Axis projection | `a_∥ = k̂_eff · a` | First-order coupling is rank-1: only the along-beam component enters the phase. |

The closing of the loop is the point: `CaiAccelerometer::q_va()` produces exactly the
white-acceleration PSD that the rest of the inertial stack already integrates into a
velocity/position error — so a quantum sensor's noise can be traced to its atom number,
interrogation time, and contrast rather than to a datasheet line.

A worked figure (Rb-87, `T = 10 ms`, `N = 10⁶`, `C = 0.5`, `T_c = 0.5 s`): `Φ(1 g) ≈
1.58×10⁴ rad`, `σ_Φ = 2×10⁻³ rad`, `σ_a ≈ 1.24×10⁻⁶ m/s²` (≈ 0.13 µg) per shot, and a
shot-noise floor `n_a ≈ 0.09 µg/√Hz`. With a modest platform vibration PSD `S_a =
10⁻¹⁰ (m/s²)²/Hz` the **vibration-limited** per-shot floor is `σ_a ≈ 5.8×10⁻⁵ m/s²`
(≈ 5.9 µg) — ~45× the shot-noise floor, showing why real devices are vibration-, not
projection-, limited.

## What is NOT modelled (and why the floor is optimistic)

The shot-noise floor above is a **fundamental lower bound**. Real CAI accelerometers sit
well above it (≈ 1–50 µg/√Hz). The single dominant term — **vibration coupling** — is now
modelled (the transfer function and white-PSD variance rows above); the remaining gap is
systematics this layer does not yet include:

- **Coriolis / rotation** phase for a rotating frame — **not modelled**.
- **AC-Stark (light-shift)**, wavefront, and other systematics — **not modelled**.
- **Mach–Zehnder fringe ambiguity** (the phase is periodic; large accelerations alias) —
  **not modelled**; the model returns the wrapped phase, not an unwrapped estimate.

Mapping to the literature: Groves, *Principles of GNSS, Inertial, and Multisensor
Integrated Navigation Systems* §12.5 (quantum technology); Cheinet et al., *IEEE Trans.
Instrum. Meas.* 57 (2008) for the interferometer sensitivity/transfer function; Freier et
al., *J. Phys.: Conf. Ser.* 723 (2016) for the mobile-gravimeter error budget; CARIOQA-PMP
for the space-accelerometer parameter regime.

## Status

This is the **P2 quantum-physics-layer** item from [`ROADMAP.md`](../ROADMAP.md): the
Mach–Zehnder phase, projection noise, scale factor, derived `q_va`, contrast decay, **and
the vibration-coupling transfer function / white-PSD variance** are implemented and
unit-tested against hand computation (including a numeric band-integral cross-check of the
transfer function against its analytic `T³` result).

The model is also **wired into the runnable inertial scenario**: an accelerometer in an
inertial-deadreckoning scenario resolves to `ImuKind::QuantumCai` when it carries a `[cai]`
block (wavelength, pulse separation `T`, atom number `N`, contrast `C`, cycle time `T_c`,
and an optional platform `vibration_psd`), and its velocity-random-walk PSD `q_va` is then
**derived** from the interferometer physics — the shot-noise floor plus, when a vibration
PSD is given, the vibration-limited contribution in quadrature — rather than supplied as a
datasheet coefficient. Scenarios without a `[cai]` block are classical and byte-unchanged.

The remaining follow-ons are the Coriolis and light-shift systematics, the PHARAO/ACES and
CARIOQA validation scenarios, and a playground quantum-vs-classical comparison preset.
