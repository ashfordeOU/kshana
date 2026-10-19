<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Integrity and security: what Kshana models, and what it does not

Kshana reports two figures of merit (FoMs) — **Integrity** and **Security** — that are
easy to mistake for the aviation-grade quantities of the same name. This page
states plainly what they are today, what they are *not*, and what the roadmap
adds. If you are evaluating Kshana for a safety-of-life or certification context,
read this first.

## Today (v0.37.0)

### Integrity FoM — filter self-consistency
The Integrity FoM is the fraction of outage samples whose true timing error stays
inside the Kalman filter's own k-sigma protection bound:

```
integrity = (# outage samples with |error| <= k * phase_sigma) / (# outage samples)
```

This measures whether the filter's *self-reported* uncertainty is honest about
its *own* error during a GNSS (global navigation satellite system) outage. It is a useful internal consistency check.

It is **not**:

- a **Horizontal/Vertical Protection Level (HPL/VPL)** — there is no position-domain
  protection level at all (the clock packs are timing-domain);
- an **integrity risk / probability of hazardously misleading information (P_HMI)**;
- an **alert limit** comparison;
- compliant with **RTCA DO-229E / DO-316** or **EUROCAE ED-259A** (RTCA: Radio Technical
  Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation
  Equipment) or any other certification standard.

### Security FoM — analytic spoof-detectability bound
The Security FoM is a **clock-stability-based spoof-detectability bound**: given a
clock's noise (white-frequency and random-walk PSDs (power spectral densities)) and a monitoring window, it
is the analytic detection margin of a single-clock consistency monitor against a
slowly-ramping false-time spoof. A quieter clock (e.g. an optical clock) detects a
smaller, slower spoof than a noisier one (e.g. a CSAC (chip-scale atomic clock)) — that contrast is the point
of the demonstrator.

It is **not** a multi-satellite RAIM (receiver autonomous integrity monitoring) detector. There are no cross-satellite
pseudorange residuals, no protection level, and no P_HMI. The innovation-vs-sigma
test has the same mathematical shape as classical RAIM fault detection (Brown), but
the number is an analytic bound for a given clock, not an RAIM implementation, and
it is meaningful only in the context of a configured spoofing scenario (see the
`spoof` scenario kind, which injects an actual ramping attack).

The output says so. The `clock`, `orbit`, `hybrid` and `fusion` kinds configure no
attack, so their one-line summary prints `security n/a (no attack)` instead of a number,
and their result document marks `fom.security` as `applicable: false`, with the reason,
in its `figure_tiers` block. The value itself stays in the document for anyone who
wants the bound.

## Real snapshot, solution-separation, and ARAIM RAIM (`src/raim.rs`)

A genuine, position-domain RAIM is implemented in `src/raim.rs`, separate from the
self-consistency FoM above:

- **Multi-satellite residual monitoring** — it builds the line-of-sight geometry
  matrix to the visible satellites, forms the least-squares position/clock
  solution, and tests the sum of squared residuals.
- **χ² fault detection** — `SSE/σ²` (SSE: sum of squared residuals) is χ²(n−4) under the no-fault hypothesis; a
  fault is declared above `chi2_{1-P_fa}(n-4)`. The χ² thresholds come from a
  dependency-free regularized incomplete-gamma evaluation (exact, no tables).
- **Slope-based HPL / VPL** — `max_i(slope_i)·pbias·σ`, where `slope_i` is the
  per-satellite position-error sensitivity from the hat matrix and `pbias` is the
  non-central-χ² bias that meets the configured missed-detection probability
  `P_md`.
- **Solution-separation RAIM (MHSS: multiple-hypothesis solution separation)** — for the all-in-view solution and every
  single-satellite exclusion sub-solution, the nested-estimator separation
  `Δ_k = x_k − x₀` both **detects and identifies** the faulted satellite and feeds
  the protection-level bound.
- **ARAIM (advanced receiver autonomous integrity monitoring) integrity-risk (P_HMI) budget** — `araim_raim` solves the smallest HPL/VPL
  whose summed probability of hazardously-misleading information
  `P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)` (Blanch et al., *Baseline ARAIM*) meets
  an explicit integrity-risk allocation, and reports the risk the levels achieve — so
  integrity can be traded against the alert limit directly, instead of leaving it
  implicit in a fixed `K_md` multiplier.
- **Stanford–ESA integrity diagram** (ESA: European Space Agency) — a per-epoch accumulator classifies
  `(error, PL)` into Available / System-Unavailable / Misleading / Hazardously-
  Misleading regions for an availability summary.
- **Reachable end-to-end** — the `integrity` scenario kind runs the above over an
  SGP4 (Simplified General Perturbations 4) or Keplerian constellation, or one read from
  real TLEs (two-line element sets) or a RINEX (Receiver Independent Exchange Format)
  navigation file, and emits a per-epoch HPL/VPL
  availability map against the configured alert limits (`scenarios/integrity-raim.toml`).
  The same run **exports a vertical Stanford diagram**: at each protected epoch a
  seeded, reproducible no-fault range-error draw is mapped through the geometry to an
  actual vertical error and classified against the VPL and the vertical alert limit, so
  the JSON (JavaScript Object Notation) result and CLI (command-line interface) summary
  carry the region counts (integrity events, and HMI: hazardously misleading
  information) — not only an availability fraction. On the bundled
  `scenarios/integrity-raim.toml` the run reports 344 of 361 epochs available (95.3 %)
  at a 40 m horizontal and 50 m vertical alert limit, with 0 integrity events and 0 HMI.
- **Dual-constellation ARAIM with an integrity support message** — `araim_dual_raim`
  adds the **constellation-wide fault mode**: besides the fault-free and single-satellite
  hypotheses, each constellation contributes one hypothesis that removes all of its
  satellites, with prior `P_const`, to the same MHSS integrity-risk sum. The
  `IntegritySupportMessage` (ISM) carries the user range accuracy for integrity
  (`σ_URA`), the accuracy root-mean-square (`σ_URE`), the maximum nominal bias `b_nom`
  folded one-sided into every mode, and the priors `P_sat` and `P_const`; its WG-C
  (Working Group C of the European Union–United States cooperation on satellite navigation,
  whose ARAIM technical subgroup publishes the reference) reference set is σ_URA = 0.75 m,
  σ_URE = 0.67 m, b_nom = 0.75 m, P_sat = 1e-5 and P_const = 1e-4. `P_const = 0`
  reproduces the single-fault `araim_raim` result bit for bit. The `integrity` kind takes
  this path with `araim_dual = true` (`scenarios/araim-gps-galileo.toml`: GPS + Galileo,
  48 satellites, 145 of 145 epochs available at the same alert limits).
- **Protection levels against published reference vectors** — the
  `araim-reference-check` kind runs the engine's `araim_protection_level` and
  `araim_integrity_risk` on the WG-C ARAIM subgroup's own worked examples (the Reference
  Airborne Algorithm Description Document v3.1, 2019, Appendix D, and the Milestone 3
  Report, 2016, Annex A). The worst vertical/horizontal protection-level difference on the
  acceptance vector is 0.0437 m against the documents' own tolerance of 0.05 m. This row
  is VALIDATED in [`VERIFICATION-MATRIX.md`](VERIFICATION-MATRIX.md): it checks the
  protection-level equation, not an operational ISM or a receiver.

## The remaining gap (roadmap)

What `raim.rs` does **not** yet do:

- it is **not folded into the clock/holdover scenario FoM** — those packs still report
  the filter self-consistency Integrity figure above, not an HPL/VPL;
- the fault hypotheses are the fault-free case, **single satellites** and **whole
  constellations** — simultaneous faults on **subsets of two or more satellites (SV: space
  vehicle, that is a satellite)** are not modelled;
- the ISM is a configurable parameter set (with the WG-C reference values), not a
  broadcast operational message or a validated threat model;
- **fault detection and exclusion (FDE)** is single-satellite and snapshot only: solution
  separation names the faulted satellite, and `snapshot_raim_fde` re-solves each
  single-satellite exclusion and returns the excluded satellite with the chi-squared test
  and protection levels of the remaining subset, but no exclusion-protected position is
  reported, and the `integrity` scenario kind does not run the exclusion step.

The snapshot, solution-separation, and ARAIM cores are exercised on **real IGS (International GNSS Service)
precise-orbit (SP3: Standard Product 3) geometry**, not synthetic constellations alone: `tests/igs_real_data.rs`
forms the line-of-sight geometry from the first epoch of a genuine IGS SP3 product at a
real ground station, and checks that the protection levels are finite and inside the
APV-I (approach with vertical guidance) alert limits of 40 m horizontal and 50 m
vertical, that a 60 m pseudorange bias trips the χ² monitor, that solution
separation **identifies** the faulted satellite, and that ARAIM's levels meet the
allocated `P_HMI`. `tests/araim_dual_real_data.rs` runs the dual-constellation path on
the real 2026-06-07 Celestrak GPS and Galileo catalogues, propagated to one common epoch
(see [`REAL_TLE_GUIDE.md`](REAL_TLE_GUIDE.md) §3). A deeper cross-check — diffing
protection levels epoch by epoch against gLAB (the GNSS-Lab Tool, a GNSS data-processing suite distributed by ESA) over a full
RINEX observation arc — would add receiver-domain parity. It is not done: the `pvt` kind
computes a code single-point position from real RINEX observations, but no protection
level from that solution has been compared with gLAB's.

So `raim.rs` is a real protection-level and integrity-risk core, reachable from the
`integrity` and `araim-reference-check` scenario kinds, exercised on real reference-orbit
geometry, and checked against the WG-C reference vectors. Multi-satellite-subset faults,
receiver-domain gLAB parity and clock-FoM integration remain roadmap items, and none of
this is certification evidence.

## See also

- [`GLOSSARY.md`](GLOSSARY.md) — one-line definitions of every FoM and abbreviation.
- [`ARAIM_REFERENCE.md`](ARAIM_REFERENCE.md) — the ISM parameters and the WG-C reference
  vectors.
- [`SLOT-TIMING.md`](SLOT-TIMING.md) — the timing protection level (TPL) of a coasting
  clock, which is conditional on detection.
- [`VALIDATION.md`](VALIDATION.md) — which quantities are reference-validated vs.
  self-consistency checks.
- `src/security.rs` — the spoof-detectability bound derivation.

## RAIM beside the clock-holdover figures of merit (0.36, opt-in)

A clock scenario may carry an `[integrity]` section (`src/clock_integrity.rs`): a site
(`lat_deg`, `lon_deg`, `height_m`), constellation presets (`systems`, default `gps-baseline`),
a mask, a range-residual sigma, the false-alarm and missed-detection probabilities, the
horizontal and vertical alert limits, an epoch spacing and an optional stated bias on one
satellite. The run then reports a separate `integrity_fom` block: per epoch the satellites in
view, the snapshot RAIM protection levels and a verdict (`available`, `alarm`,
`unavailable-pl-above-al`, `unavailable-too-few-satellites`, `unavailable-gnss-denied`), and
the counts and availability over the run. While the timeline says GNSS is denied, RAIM is
unavailable and nothing is extrapolated; a degraded window is evaluated as nominal. The
holdover figures of merit are unchanged, and without the section the output is byte-identical.
MODELLED: a representative preset sky, synthetic residuals and stated limits. It needs
`runs = 1`.


## The EU-US WG-C ARAIM Milestone 3 maximum-URA reproduction (CAP-05c)

An earlier plan promised a comparison with "Table A-3" of an EU-ARAIM technical note. No public
source for that table could be found (the public Milestone 1 to 3 reports of the EU-US Working
Group C ARAIM Technical Subgroup have no Table A-3), so that comparison is **withdrawn** and
nothing is promised under that name.

What is attempted instead is the report that is public: the **Milestone 3 Report** (25 February
2016, GPS.gov copy, SHA-256 `156147e1...13d8`), Tables 5, 6 and 7, which print for each
constellation configuration and each of RNP 0.1 and RNP 0.3 the largest `sigma_URA` for which 90 %
of users have 99.5 % availability. Twelve printed entries (the Depleted and Baseline rows of the
dual-frequency tables) are checked, under bars pre-registered in
[`xval/araim-m3/PREREGISTRATION.md`](../xval/araim-m3/PREREGISTRATION.md) before any scored run,
with the deviations that cannot be removed stated there: no almanac files, Walker shells instead
of the real slots, a coarser grid and step, and the engine's ADD v4.2 horizontal path in place of
the report's own text. Tables 8 to 13 (single frequency) and the Optimistic rows are not attempted,
with the reasons given there. The result stays MODELLED whatever it is. The study is
`src/bin/gen_araim_m3_study.rs`; its measured coverages are in `xval/araim-m3/results.json` and
scored by `tests/araim_m3_reproduction.rs`. The report itself is cited, not vendored.
