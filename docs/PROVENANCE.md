<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Provenance — every parameter traceable to a published source

Kshana's central honesty discipline is that **every sensor parameter, physical
model, and validation dataset is traceable to a published source** — a datasheet, a
peer-reviewed paper, a signal-in-space ICD (interface control document), or a standard. This document collects
those provenance strings into a single citable reference table.

Provenance is not just documentation: each sensor configuration carries a
`provenance` field (see `with_provenance` in `src/clock/*` and `src/inertial/*`) that
**flows through into the result JSON** (JavaScript Object Notation), so any run carries its own parameter
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
| Microchip (Microsemi) SA.45s / SA65 CSAC (chip-scale atomic clock) | σ_y(1 s) = 3.0×10⁻¹⁰ | Manufacturer datasheet | **flight-qualified** (deployed commercial part) |
| Strontium optical-lattice clock (space goal) | σ_y(1 s) = 1×10⁻¹⁵ | Origlia, Schiller, Bongs et al., [arXiv:1503.08457](https://arxiv.org/abs/1503.08457) | **space goal on ground hardware** — no Sr optical clock has flown |
| Strontium optical-lattice clock (lab record) | σ_y(1 s) = 4.8×10⁻¹⁷ | Oelker et al., *Nature Photonics* (2019) | **ground-lab only** |
| ACES/PHARAO (ISS (International Space Station) benchmark) | order 1×10⁻¹⁶ after multi-day integration | ESA (European Space Agency) ACES/PHARAO, operational on ISS since April 2025 (cite ESA published results) | **flight-qualified** (microwave/maser, not optical) |

The Allan white-frequency coefficient used by the holdover model is `q_wf =
σ_y(1 s)²`; flicker-FM and aging are modelled only where a `flicker_floor` is set
explicitly (see [`VALIDATION.md`](VALIDATION.md)), otherwise they are not modelled.

## 2. Inertial sensor parameters

| Sensor | Key figures | Source | Maturity |
|--------|------------|--------|----------|
| Exail hybrid quantum accelerometer triad | bias stability 6×10⁻⁸ g = 5.88×10⁻⁷ m/s² (24 h); noise 22 µg/√Hz = 2.16×10⁻⁴ (m/s²)/√Hz | Templier et al., *Science Advances* (2022), [arXiv:2209.13209](https://arxiv.org/abs/2209.13209) | **ground-lab** |
| Honeywell QA-2000 navigation-grade quartz accelerometer | bias stability ~160 µg = 1.57×10⁻³ m/s²; noise ~20 µg/√Hz; bias instability ~1 µg | Manufacturer / Groves *AESS (Aerospace and Electronic Systems Society) Tutorial* | **flight-qualified** |
| IMU (inertial measurement unit) error model (scale-factor, misalignment, g-sensitivity, quantization, rate-ramp) | five systematic categories | IEEE (Institute of Electrical and Electronics Engineers) Std 952-1997 §A.2; Groves 2013 §4.3, Table 4.1 | model |
| Strapdown mechanization (NED, coning/sculling) | quaternion attitude §2.2, §5.5; NED mechanization §5.4; gravity §2.4 | Groves, *Principles of GNSS (global navigation satellite system), Inertial, and Multisensor Integrated Navigation Systems*, 2nd ed. | model |

## 3. Time & frequency transfer parameters

| Link | Key figure | Source |
|------|-----------|--------|
| Free-space optical two-way (inter-satellite) | lab floor ~1 fs; 1 ps on-orbit-credible target | Giorgetta et al. (2013, *Nature Photonics*); Deschênes et al. (2016, *PRX*) |
| TWSTFT (Ku-band) | single-session ~0.5 ns | BIPM (International Bureau of Weights and Measures) / PTB (Physikalisch-Technische Bundesanstalt, the German national metrology institute) / NIST (National Institute of Standards and Technology) |

## 4. Orbit, time-system & frame models

| Model | Equation / standard | Reference (source comment) |
|-------|--------------------|----------------------------|
| SGP4/SDP4 (SGP4: Simplified General Perturbations 4; SDP4: Simplified Deep-space Perturbations 4) propagation | the WGS-72 (WGS: World Geodetic System) SGP4 model | Vallado et al., *"Revisiting Spacetrack Report #3"*, **AIAA (American Institute of Aeronautics and Astronautics) 2006-6753** (2006) |
| Leap-second / time systems (UTC/TAI/TT/UT1 (UTC: Coordinated Universal Time; TAI: International Atomic Time; TT: Terrestrial Time; UT1: Universal Time 1, Earth-rotation time)) | integer-leap regime from 1972-01-01 | IERS (International Earth Rotation and Reference Systems Service) Conventions (2010); leap history from IERS Bulletin C |
| Earth Rotation Angle | `θ(Tu) = 2π(0.7790572732640 + 1.00273781191135448·Tu)` | IAU (International Astronomical Union) 2000 resolution B1.8 |
| Broadcast-ephemeris SV (space vehicle, that is a satellite) position/clock | user algorithm, relativistic `F·e·√A·sin Eₖ`, `TGD` | IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System) §20.3.3.4.3.1 / §20.3.3.3.3.1 |
| Galileo / QZSS (Japan's Quasi-Zenith Satellite System) / BeiDou ephemeris constants (μ, Ω̇ₑ, C̄₂₀) | per-system SIS ICDs (interface control documents) | Galileo OS (Open Service) SIS ICD; BeiDou OS SIS ICD (CGCS2000); GLONASS (Russia's Global Navigation Satellite System) ICD (PZ-90 (PZ: Parametry Zemli, the Russian geodetic datum)) |

## 5. GNSS measurement-domain & resilience models

| Model | Equation / standard | Reference |
|-------|--------------------|-----------|
| Klobuchar single-frequency ionosphere | semicircle algorithm | IS-GPS-200 §20.3.3.5.2.5 |
| Saastamoinen zenith troposphere | hydrostatic + wet zenith delay | Davis et al. (1985); Groves §9.4 |
| Niell mapping functions | hydrostatic & wet, elevation mapping | Niell (1996) |
| Anti-jam link budget | `[1/(C/N₀) + (J/S)/(Q·Rc)]⁻¹` → effective C/N₀ → loss of lock | Kaplan & Hegarty, *Understanding GPS/GNSS*, 3rd ed., §9.4 |
| Spoof / energy detection | Neyman–Pearson / two-sided χ²₁ energy test; Φ⁻¹ via Acklam; erf via Abramowitz & Stegun 7.1.26 | classical detection theory |
| Allan-family stability (ADEV/MDEV/TDEV/HDEV (ADEV: Allan deviation; MDEV: modified Allan deviation; TDEV: time deviation; HDEV: Hadamard deviation)) | with confidence intervals | NIST SP (Special Publication) 1065 (Riley); Kasdin, *Proc. IEEE* (1995) |
| RAIM (receiver autonomous integrity monitoring) / integrity (HPL/VPL (HPL: horizontal protection level; VPL: vertical protection level), ARAIM (advanced receiver autonomous integrity monitoring) solution separation) | snapshot & solution-separation | see [`INTEGRITY.md`](INTEGRITY.md) |

## 6. Validation datasets

**Vendoring policy.** We commit a verbatim copy of every validation dataset whose
licence permits redistribution *and* whose size fits comfortably in git, so a clone can
reproduce the validation offline with no network and no link-rot. A dataset is **fetch-gated**
(downloaded by a `scripts/fetch_*.sh` helper into the git-ignored `realdata-cache/`,
with only the small *derived* reference values committed) only when its licence does not
clearly permit redistribution, or when it is too large for git. Each gated dataset records
its specific reason below; nothing is gated for convenience.

| Dataset | Use | Licence | In-repo status |
|---------|-----|---------|----------------|
| AIAA 2006-6753 SGP4 test vectors (all 666) | SGP4 numerical validation — worst 4.12 mm | Published reference vectors (Vallado, AIAA) | **Vendored** `tests/fixtures/sgp4/` |
| ⁸⁸Sr optical-clock ADEV σ_y(τ) (Norcia et al., Science 366:93, 2019) | optical-clock measured-stability fit validation | **CC-BY-4.0** (Creative Commons Attribution 4.0; Zenodo 10.5281/zenodo.3382347) | **Vendored** `tests/fixtures/optical_clock_adev/` |
| NASA/USGS (NASA: National Aeronautics and Space Administration; USGS: United States Geological Survey) SRTM (Shuttle Radar Topography Mission) v3 elevation tile N36W117 (Death Valley, decimated to 6-arc-sec, 722 KB) | terrain-DEM (DEM: digital elevation model) `.hgt` reader validation on real relief (Badwater Basin ≈ −86 m) | **Public domain** (NASA/USGS SRTM v3; via AWS (Amazon Web Services) Open Data `elevation-tiles-prod`) | **Vendored** `tests/fixtures/terrain/N36W117_sub6.hgt` |
| CCSDS 502.0/503.0 Blue Book OEM/TDM (OEM: Orbit Ephemeris Message; TDM: Tracking Data Message) examples | CCSDS parser round-trip validation | Published standard examples (CCSDS) | **Vendored** `tests/fixtures/ccsds/` |
| IGS (International GNSS Service) SP3 (Standard Product 3, the precise-orbit format) precise orbit + RINEX (Receiver Independent Exchange Format) NAV samples | orbit-fit + integrity validation | IGS open data (free for any use, attribution) | **Vendored** `tests/fixtures/igs/` |
| Celestrak TLE (two-line element set) snapshots (`gps-ops`, `galileo`) | real-constellation scenarios | Celestrak terms (attribution; US-Gov-origin (US: United States) TLEs (two-line element sets)) | **Vendored** `tests/fixtures/celestrak/` + live `scripts/fetch_tles.sh` |
| scipy / scikit-learn / filterpy reference outputs | numerical-kernel + estimator validation | Generated locally from BSD/MIT (BSD: Berkeley Software Distribution licence) libraries | **Vendored** `tests/fixtures/scipy/` (+ generator scripts) |
| Stable32 reference deviations (decade ADEV/HDEV ladders) | Allan-estimator parity | Derived summary values (small) | **Vendored** `tests/fixtures/cs5071a/`, `tests/fixtures/phasedat/` |
| 5071A caesium **raw** phase series (556 990 pts, 12 MB) | overlapping ADEV/HDEV on a real Cs clock | **Unclear** — `allantools` is LGPL-3.0 (a software licence) with *no explicit data-redistribution grant*; the file is excluded from the PyPI (Python Package Index) dist | **Fetch-gated** `scripts/fetch_cs5071a.sh`; derived ladders committed |
| **raw** PHASE.DAT (1000-pt regression series) | Stable32 estimator-parity series | **Unclear** — distributed with the commercial Stable32 (Hamilton Technical Services); NIST SP 1065 is public-domain but does not print the values | **Fetch-gated** `scripts/fetch_phasedat.sh`; derived ladders committed |
| JammerTest 2024 GNSS jamming/spoofing capture (1.4 GB) | resilience/anomaly scenario calibration | GPL-3.0-or-later (Zenodo 10.5281/zenodo.15910563) — redistribution permitted, but **size exceeds GitHub's 100 MB file limit** and GPL copyleft conflicts with the AGPL (Affero General Public License) tree | **Fetch-gated**; reference the DOI (digital object identifier) |

The licence status of each fetch-gated dataset was researched against the upstream
authority; the two "unclear" clock datasets stay gated pending an explicit redistribution
grant (we already commit the values we *are* licensed to publish), and the JammerTest set
is gated on size/copyleft grounds despite its open licence.

---

## Chart provenance footer

Every chart Kshana renders — in the browser playground, the CLI (command-line interface)'s `*.chart.svg`
export, and the HTML (HyperText Markup Language) scorecard — is stamped, bottom-right, with:

> `Kshana v<version> · scenario <hash> · kshana.dev`

The `scenario <hash>` is the first 12 hex characters of the run's **scenario hash**: a
SHA-256 (SHA: Secure Hash Algorithm) over the *canonical* scenario definition (seed, thresholds, model parameters,
GNSS windows, and so on). It is the same fingerprint that appears in the one-line run
summary and in the result JSON's `scenario_hash` field. (The integrity and lunar reports
do not carry a `scenario_hash`; their charts fall back to a SHA-256 of the scenario
source TOML (Tom's Obvious Minimal Language), so every chart still has a stable fingerprint.)

Because the hash is deterministic and input-sensitive, a saved or pasted chart image is
self-identifying: it records the engine version, the exact scenario that produced it (for
bit-for-bit reproduction), and the source — and any altered parameter yields a different
hash, so a mislabelled chart is detectable.

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
