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

## The gap (roadmap)

Real, position-domain integrity for GNSS users requires:

- multi-satellite **pseudorange residual** monitoring;
- **RAIM / ARAIM** fault detection and exclusion across the visible constellation;
- **HPL / VPL** protection levels and an **integrity risk (P_HMI)** budget against
  defined alert limits;
- the relevant ARAIM ISM / threat-model assumptions.

These are **not** implemented today. They are the substance of the P1 "real
integrity" milestone on the roadmap. Until then, treat the Integrity and Security
FoMs as the self-consistency and analytic-detectability quantities described above
— informative for comparing clocks and tuning filters, but not certification
evidence.

## See also

- [`GLOSSARY.md`](GLOSSARY.md) — one-line definitions of every FoM.
- [`VALIDATION.md`](VALIDATION.md) — which quantities are reference-validated vs.
  self-consistency checks.
- `src/security.rs` — the spoof-detectability bound derivation.
