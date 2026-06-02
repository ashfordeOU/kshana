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

## Real snapshot RAIM (`src/raim.rs`)

A genuine, position-domain snapshot RAIM is now implemented in `src/raim.rs`,
separate from the self-consistency FoM above:

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

## The remaining gap (roadmap)

What `raim.rs` does **not** yet do:

- it is **not wired into the scenario pipeline FoM** — a scenario run still reports
  the filter self-consistency Integrity figure above, not an HPL/VPL;
- **fault exclusion (FDE)** beyond detection, and **alert-limit / P_HMI** budgeting;
- **ARAIM** multi-hypothesis integrity-risk allocation and the ISM / threat model.

So `raim.rs` is the real protection-level core, but the end-to-end scenario
Integrity FoM and ARAIM-grade integrity risk are still roadmap items, and none of
this is certification evidence.

## See also

- [`GLOSSARY.md`](GLOSSARY.md) — one-line definitions of every FoM.
- [`VALIDATION.md`](VALIDATION.md) — which quantities are reference-validated vs.
  self-consistency checks.
- `src/security.rs` — the spoof-detectability bound derivation.
