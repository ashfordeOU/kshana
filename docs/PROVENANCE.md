<!-- SPDX-License-Identifier: Apache-2.0 -->
# Provenance — every parameter traceable to a published source

Kshana's central honesty discipline is that **every sensor parameter, physical
model, and validation dataset is traceable to a published source** — a datasheet, a
peer-reviewed paper, a signal-in-space ICD, or a standard. This document collects
those provenance strings into a single citable reference table.

Provenance is not just documentation: each sensor configuration carries a
`provenance` field (see `with_provenance` in `src/clock/*` and `src/inertial/*`) that
**flows through into the result JSON**, so any run carries its own parameter
citations. The tables below are the consolidated, human-readable index of those
strings, plus the algorithmic and validation provenance from the source comments.

Maturity is labelled honestly throughout: **flight-qualified** (has flown),
**ground-lab / sounding-rocket** (demonstrated, not flown), or **space goal on ground
hardware** (an aspirational figure for hardware that has not flown — notably every
strontium optical-lattice clock figure). See [`VALIDATION.md`](VALIDATION.md) for the
per-figure `validated` / `not-modeled` labels and [`QUANTUM-MODELS.md`](QUANTUM-MODELS.md)
for the ground-lab-vs-flight maturity discussion.

---

## 1. Clock & frequency-reference parameters

| Sensor | Key figure | Source | Maturity |
|--------|-----------|--------|----------|
| Microchip (Microsemi) SA.45s / SA65 CSAC | σ_y(1 s) = 3.0×10⁻¹⁰ | Manufacturer datasheet | **flight-qualified** (deployed commercial part) |
| Strontium optical-lattice clock (space goal) | σ_y(1 s) = 1×10⁻¹⁵ | Origlia, Schiller, Bongs et al., [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) | **space goal on ground hardware** — no Sr optical clock has flown |
| Strontium optical-lattice clock (lab record) | σ_y(1 s) = 4.8×10⁻¹⁷ | Oelker et al., *Nature Photonics* (2019) | **ground-lab only** |
| ACES/PHARAO (ISS benchmark) | order 1×10⁻¹⁶ after multi-day integration | ESA ACES/PHARAO, operational on ISS since April 2025 (cite ESA published results) | **flight-qualified** (microwave/maser, not optical) |

The Allan white-frequency coefficient used by the holdover model is `q_wf =
σ_y(1 s)²`; flicker-FM and aging are modelled only where a `flicker_floor` is set
explicitly (see [`VALIDATION.md`](VALIDATION.md)), otherwise they are not modelled.

## 2. Inertial sensor parameters

| Sensor | Key figures | Source | Maturity |
|--------|------------|--------|----------|
| Exail hybrid quantum accelerometer triad | bias stability 6×10⁻⁸ g = 5.88×10⁻⁷ m/s² (24 h); noise 22 µg/√Hz = 2.16×10⁻⁴ (m/s²)/√Hz | Templier et al., *Science Advances* (2022), [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) | **ground-lab** |
| Honeywell QA-2000 navigation-grade quartz accelerometer | bias stability ~160 µg = 1.57×10⁻³ m/s²; noise ~20 µg/√Hz; bias instability ~1 µg | Manufacturer / Groves *AESS Tutorial* | **flight-qualified** |
| IMU error model (scale-factor, misalignment, g-sensitivity, quantization, rate-ramp) | five systematic categories | IEEE Std 952-1997 §A.2; Groves 2013 §4.3, Table 4.1 | model |
| Strapdown mechanization (NED, coning/sculling) | quaternion attitude §2.2, §5.5; NED mechanization §5.4; gravity §2.4 | Groves, *Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems*, 2nd ed. | model |

## 3. Time & frequency transfer parameters

| Link | Key figure | Source |
|------|-----------|--------|
| Free-space optical two-way (inter-satellite) | lab floor ~1 fs; 1 ps on-orbit-credible target | Giorgetta et al. (2013, *Nature Photonics*); Deschênes et al. (2016, *PRX*) |
| TWSTFT (Ku-band) | single-session ~0.5 ns | BIPM / PTB / NIST |

## 4. Orbit, time-system & frame models

| Model | Equation / standard | Reference (source comment) |
|-------|--------------------|----------------------------|
| SGP4/SDP4 propagation | the WGS-72 SGP4 model | Vallado et al., *"Revisiting Spacetrack Report #3"*, **AIAA 2006-6753** (2006) |
| Leap-second / time systems (UTC/TAI/TT/UT1) | integer-leap regime from 1972-01-01 | IERS Conventions (2010); leap history from IERS Bulletin C |
| Earth Rotation Angle | `θ(Tu) = 2π(0.7790572732640 + 1.00273781191135448·Tu)` | IAU 2000 resolution B1.8 |
| Broadcast-ephemeris SV position/clock | user algorithm, relativistic `F·e·√A·sin Eₖ`, `TGD` | IS-GPS-200 §20.3.3.4.3.1 / §20.3.3.3.3.1 |
| Galileo / QZSS / BeiDou ephemeris constants (μ, Ω̇ₑ, C̄₂₀) | per-system SIS ICDs | Galileo OS SIS ICD; BeiDou OS SIS ICD (CGCS2000); GLONASS ICD (PZ-90) |

## 5. GNSS measurement-domain & resilience models

| Model | Equation / standard | Reference |
|-------|--------------------|-----------|
| Klobuchar single-frequency ionosphere | semicircle algorithm | IS-GPS-200 §20.3.3.5.2.5 |
| Saastamoinen zenith troposphere | hydrostatic + wet zenith delay | Davis et al. (1985); Groves §9.4 |
| Niell mapping functions | hydrostatic & wet, elevation mapping | Niell (1996) |
| Anti-jam link budget | `[1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹` → effective C/N₀ → loss of lock | Kaplan & Hegarty, *Understanding GPS/GNSS*, 3rd ed., §9.4 |
| Spoof / energy detection | Neyman–Pearson / two-sided χ²₁ energy test; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun 7.1.26 | classical detection theory |
| Allan-family stability (ADEV/MDEV/TDEV/HDEV) | with confidence intervals | NIST SP 1065 (Riley); Kasdin, *Proc. IEEE* (1995) |
| RAIM / integrity (HPL/VPL, ARAIM solution separation) | snapshot & solution-separation | see [`INTEGRITY.md`](INTEGRITY.md) |

## 6. Validation datasets

| Dataset | Use | Source |
|---------|-----|--------|
| AIAA 2006-6753 SGP4 test vectors (all 666) | SGP4 numerical validation — worst-case 4.12 mm | Vallado et al., AIAA 2006-6753 (`tests/sgp4_verification.rs`) |
| Celestrak `gps-ops` TLE snapshot (2021-07-28, 30 sats) | real-constellation scenario `orbit-sgp4-gps.toml` | [Celestrak](https://celestrak.org/) (`scripts/fetch_tles.sh`); checksum-validated on load |

---

## How to cite & reproduce

Every result is reproducible from `scenario + seed + engine version`. Cite the engine
via [`CITATION.cff`](../CITATION.cff) / the Zenodo concept DOI
[10.5281/zenodo.20528627](https://doi.org/10.5281/zenodo.20528627), and cite the
*parameter* sources above for the figures a given run depends on — they travel in the
result JSON's `provenance` fields, so a published result is self-documenting.

*Where a figure is a space goal on ground hardware (every strontium optical-clock
number) or a ground-lab demonstration (cold-atom accelerometer), this document and the
result provenance say so explicitly. Kshana does not present lab or goal figures as
flown performance.*
