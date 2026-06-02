<!-- SPDX-License-Identifier: Apache-2.0 -->
# Quantum-sensor models: what Kshana models, and what it does not

Kshana is a **PNT-resilience simulator with quantum-sensor performance models**. It
is *not* a first-principles quantum-physics simulator. This page states exactly what
that means so the "quantum" framing cannot be mistaken for more than it is.

## What IS modelled

Each quantum (and classical) sensor is an **error model** driven by published
noise-budget parameters:

- **Clocks** — white-frequency and random-walk-frequency PSDs, a flicker (1/f) Allan
  floor, and linear drift, sourced from datasheets and papers (CSAC SA.45s; strontium
  optical-lattice goals; ACES/PHARAO). The Allan deviation these produce is validated
  against the standard noise-type slopes (see [`VALIDATION.md`](VALIDATION.md)).
- **Inertial sensors** — a single-axis (1-DOF) accelerometer/gyro error budget:
  velocity random walk, angular random walk, acceleration random walk, and an Allan
  bias-instability floor.
- The engine is **neutral**: "quantum" and "classical" are the same code path with
  different coefficients. The contrast in the figures of merit comes entirely from the
  input noise parameters, each traceable to a cited source.

## What is NOT modelled

None of the underlying quantum physics is simulated:

- no atom-interferometer **Mach–Zehnder phase**, interferometer **contrast**, or
  **cycle time**;
- no **quantum projection / shot noise** from first principles (only its net Allan
  contribution, if supplied as a coefficient);
- no **vibration-coupling tensor**, **laser-phase noise**, or sensor **systematics**;
- no 3-axis mechanisation (the inertial model is 1-DOF — see the IMU note in the
  README and [`VALIDATION.md`](VALIDATION.md)).

Modelling these from first principles is a roadmap item.

## Ground-lab vs. flight-qualified figures

Parameter tables mix maturity levels; treat them accordingly:

| Sensor | Source figure | Maturity |
|--------|---------------|----------|
| CSAC (e.g. SA.45s) | datasheet σ_y(1 s) ≈ 3e-10 | **flight-qualified** (flown, incl. GPS-adjacent use) |
| Strontium optical-lattice clock | σ_y(1 s) goal ≈ 1e-15 (arXiv:1503.08457) | **ground-lab only** — no strontium optical clock has flown |
| Cold-atom accelerometer | published lab Allan figures | **ground-lab / sounding-rocket** |

Optical-clock figures in Kshana are *space goals on ground hardware*. No flown optical
clock exists; the README and result provenance say so explicitly.

## Benchmark: ACES/PHARAO on the ISS (operational since April 2025)

The ESA **ACES/PHARAO** payload — a laser-cooled caesium clock plus an active hydrogen
maser, operating on the ISS since April 2025 — is the current operational on-orbit
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
- [`GLOSSARY.md`](GLOSSARY.md) — FoM definitions.
- [`INTEGRITY.md`](INTEGRITY.md) — what the Integrity and Security FoMs are and are not.
