<!-- SPDX-License-Identifier: Apache-2.0 -->
# Integrity and security: what Kshana models, and what it does not

Kshana reports two figures of merit — **Integrity** and **Security** — that are
easy to mistake for the aviation-grade quantities of the same name. This page
states plainly what they are today, what they are *not*, and what the roadmap
adds. If you are evaluating Kshana for a safety-of-life or certification context,
read this first.

## Today (v0.7.0)

### Integrity FoM — filter self-consistency
The Integrity FoM is the fraction of outage samples whose true timing error stays
inside the Kalman filter's own k-sigma protection bound:

```
integrity = (# outage samples with |error| <= k * phase_sigma) / (# outage samples)
```

This measures whether the filter's *self-reported* uncertainty is honest about
its *own* error during a GNSS outage. It is a useful internal consistency check.

It is **not**:

- a **Horizontal/Vertical Protection Level (HPL/VPL)** — there is no position-domain
  protection level at all (the clock packs are timing-domain);
- an **integrity risk / probability of hazardously misleading information (P_HMI)**;
- an **alert limit** comparison;
- compliant with **DO-229E / DO-316 / ED-259A** or any other certification standard.

### Security FoM — analytic spoof-detectability bound
The Security FoM is a **clock-stability-based spoof-detectability bound**: given a
clock's noise (white-frequency and random-walk PSDs) and a monitoring window, it
is the analytic detection margin of a single-clock consistency monitor against a
slowly-ramping false-time spoof. A quieter clock (e.g. an optical clock) detects a
smaller, slower spoof than a noisier one (e.g. a CSAC) — that contrast is the point
of the demonstrator.

It is **not** a multi-satellite RAIM detector. There are no cross-satellite
pseudorange residuals, no protection level, and no P_HMI. The innovation-vs-sigma
test has the same mathematical shape as classical RAIM fault detection (Brown), but
the number is an analytic bound for a given clock, not an RAIM implementation, and
it is meaningful only in the context of a configured spoofing scenario (see the
`spoof` scenario kind, which injects an actual ramping attack).

## Real snapshot, solution-separation, and ARAIM RAIM (`src/raim.rs`)

A genuine, position-domain RAIM is implemented in `src/raim.rs`, separate from the
self-consistency FoM above:

- **Multi-satellite residual monitoring** — it builds the line-of-sight geometry
  matrix to the visible satellites, forms the least-squares position/clock
  solution, and tests the sum of squared residuals.
- **χ² fault detection** — `SSE/σ²` is χ²(n−4) under the no-fault hypothesis; a
  fault is declared above `chi2_{1-P_fa}(n-4)`. The χ² thresholds come from a
  dependency-free regularized incomplete-gamma evaluation (exact, no tables).
- **Slope-based HPL / VPL** — `max_i(slope_i)·pbias·σ`, where `slope_i` is the
  per-satellite position-error sensitivity from the hat matrix and `pbias` is the
  non-central-χ² bias that meets the configured missed-detection probability
  `P_md`.
- **Solution-separation (MHSS) RAIM** — for the all-in-view solution and every
  single-satellite exclusion sub-solution, the nested-estimator separation
  `Δ_k = x_k − x₀` both **detects and identifies** the faulted satellite and feeds
  the protection-level bound.
- **ARAIM integrity-risk (P_HMI) budget** — `araim_raim` solves the smallest HPL/VPL
  whose summed probability of hazardously-misleading information
  `P_HMI = Σ_k p_fault,k · Q((PL − T_k)/σ_k)` (Blanch et al., *Baseline ARAIM*) meets
  an explicit integrity-risk allocation, and reports the risk the levels achieve — so
  integrity can be traded against the alert limit directly, instead of leaving it
  implicit in a fixed `K_md` multiplier.
- **Stanford(-ESA) integrity diagram** — a per-epoch accumulator classifies
  `(error, PL)` into Available / System-Unavailable / Misleading / Hazardously-
  Misleading regions for an availability summary.
- **Reachable end-to-end** — the `integrity` scenario kind runs the above over an
  SGP4/Keplerian constellation and emits a per-epoch HPL/VPL availability map against
  the configured alert limits (`scenarios/integrity-raim.toml`).

## The remaining gap (roadmap)

What `raim.rs` does **not** yet do:

- it is **not folded into the clock/holdover scenario FoM** — those packs still report
  the filter self-consistency Integrity figure above, not an HPL/VPL;
- the ARAIM budget is **single-fault MHSS** — simultaneous **multi-SV-subset faults**,
  the **constellation-wide fault mode**, and a real **ISM / threat model** are not
  modelled, and **fault exclusion (FDE)** stops at identification.

The snapshot, solution-separation, and ARAIM cores are exercised on **real IGS
precise-orbit (SP3) geometry**, not synthetic constellations alone: `tests/igs_real_data.rs`
forms the line-of-sight geometry from the first epoch of a genuine IGS SP3 product at a
real ground station, and checks that the protection levels are metre-level and
APV-I-available, that a 60 m pseudorange bias trips the χ² monitor, that solution
separation **identifies** the faulted satellite, and that ARAIM's levels meet the
allocated `P_HMI`. (A deeper cross-check — diffing protection levels epoch-by-epoch
against gLAB's own output over a full RINEX observation arc — would add receiver-domain
parity, but requires a pseudorange *solution* Kshana does not yet compute.)

So `raim.rs` is a real protection-level and integrity-risk core, reachable from the
`integrity` scenario kind and validated on a real reference-orbit geometry, but
multi-fault ARAIM, receiver-domain gLAB parity, and clock-FoM integration remain roadmap
items, and none of this is certification evidence.

## See also

- [`GLOSSARY.md`](GLOSSARY.md) — one-line definitions of every FoM.
- [`VALIDATION.md`](VALIDATION.md) — which quantities are reference-validated vs.
  self-consistency checks.
- `src/security.rs` — the spoof-detectability bound derivation.
