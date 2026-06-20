# PNT-resilience framework cross-walk

**Aligned to, not certified.** This maps Kshana's simulated capabilities to the
published PNT-resilience frameworks. It is a *simulation-derived self-assessment
aligned to* the DHS/CISA Resilient PNT Conformance Framework (RPCF) v2.0, the
RethinkPNT/Firesmith Resist-Detect-Respond-Recover (RDRR) model, and Yang
Yuanxi's resilient-PNT criteria. It is **not** a certification, accreditation, or
compliance statement, and it carries no endorsement from DHS, IEEE, or any
authority. Every row is labelled with its honest verification status
(`VALIDATED` against an external oracle, or `MODELLED` from first principles with
tests); the resilience-scoring layer itself is **MODELLED**.

The scoring engine (`src/resilience/`) consumes these capabilities and emits
per-dimension sub-scores, never a single phantom number. See
`src/verification.rs` for the machine-checked status invariants.

## DHS RPCF v2.0 technique categories (the seven; "OLVIDMR" is our mnemonic)

| Category | Kshana capability used as the sub-score driver | Module | Status |
|---|---|---|---|
| Obfuscate | Declared technique × source quality (no direct behavioural driver) | `resilience::score` | MODELLED |
| Limit | Declared technique × source quality | `resilience::score` | MODELLED |
| Verify | Impairment-detector AUC under the scenario (spoof/jam/meacon monitors) | `impairment_eval`, `resilience::score` | MODELLED |
| Isolate | Declared technique × source quality | `resilience::score` | MODELLED |
| Diversify | Independent-group count → inverse-Simpson effective diversity | `resilience::diversity` | MODELLED |
| Mitigate | Availability under denial | `fom`, `resilience::score` | MODELLED |
| Recover | Holdover coast × bounded-degradation gate | `fom`, `holdover`, `resilience::timeline` | MODELLED |

## RethinkPNT / Firesmith RDRR functions

| Function | Driver | Module | Status |
|---|---|---|---|
| Resist | Mean of Obfuscate/Limit/Isolate/Diversify sub-scores | `resilience::score` | MODELLED |
| Detect | Verify sub-score (detector AUC) | `resilience::score` | MODELLED |
| Respond | Mitigate sub-score (availability) | `resilience::score` | MODELLED |
| Recover | Holdover × bounded gate; resilience-timeline KPIs (detect/react/recover/loss) | `resilience::timeline` | MODELLED |

## Yang Yuanxi criteria (the subset the timing/detection FoMs speak to)

| Criterion | Driver | Module | Status |
|---|---|---|---|
| Availability | Availability under denial | `resilience::score` | MODELLED |
| Reliability | Filter integrity fraction | `fom`, `resilience::score` | MODELLED |
| Continuity | Holdover × bounded gate | `resilience::timeline` | MODELLED |
| Accuracy | Timing/quality proxy — **position-domain accuracy is NOT modelled** (`fom::positioning_performance` returns an explicit gap) | `resilience::score` | MODELLED (timing-domain only) |

## What this cross-walk does not claim

- No certified RPCF Level. The assigned Level is a *tentative, simulation-derived*
  reading with an explicit bounded-degradation gate, not a conferred maturity.
- No position-domain accuracy. Kshana's figures of merit are timing-domain and
  detection metrics; position CEP/SEP/HPL require a multi-axis nav solution Kshana
  does not yet provide.
- No field validation. The reference panel and threat ensemble are synthetic,
  parameter-grounded reductions (`resilience::panel`), stated as a first-class
  limitation.

The companion study (`resilience::study`) exists precisely to show that collapsing
these dimensions into one composite score or one Level produces a rating whose
architecture ranking is unstable under defensible weighting and threat choices —
so this cross-walk is a measurement layer to be read per-dimension, not a single
grade to certify against.
