# PNT-resilience framework cross-walk

**Aligned to, not certified.** This maps Kshana's simulated capabilities to the
published PNT-resilience (PNT: positioning, navigation and timing) frameworks. It is a *simulation-derived self-assessment
aligned to* the DHS/CISA (DHS: Department of Homeland Security; CISA: Cybersecurity and Infrastructure Security Agency) Resilient PNT Conformance Framework (RPCF) v2.0, the
RethinkPNT/Firesmith Resist-Detect-Respond-Recover (RDRR) model, and Yang
Yuanxi's resilient-PNT criteria. It is **not** a certification, accreditation, or
compliance statement, and it carries no endorsement from DHS, IEEE (Institute of Electrical and Electronics Engineers), or any
authority. Every row is labelled with its honest verification status
(`VALIDATED` against an external oracle, or `MODELLED` from first principles with
tests); the resilience-scoring layer itself is **MODELLED**. Two of its kernels carry
their own VALIDATED rows in the verification matrix, the inverse-Simpson diversity
kernel (`resilience::diversity`) and the rank-order statistics kernel
(`resilience::stats`); that validates the arithmetic, not the scores built on it.

The scoring engine (`src/resilience/`) consumes these capabilities and emits
per-dimension sub-scores, never a single phantom number. See
`src/verification.rs` for the machine-checked status invariants.

## DHS RPCF v2.0 technique categories (the seven; "OLVIDMR", from their initials, is our mnemonic)

| Category | Kshana capability used as the sub-score driver | Module | Status |
|---|---|---|---|
| Obfuscate | Declared technique × source quality (no direct behavioural driver) | `resilience::score` | MODELLED |
| Limit | Declared technique × source quality | `resilience::score` | MODELLED |
| Verify | Impairment-detector AUC (area under the curve) under the scenario (spoof/jam/meacon monitors) | `impairment_eval`, `resilience::score` | MODELLED |
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
| Recover | Holdover × bounded gate; resilience-timeline key performance indicators (KPIs: detect/react/recover/loss) | `resilience::timeline` | MODELLED |

## Yang Yuanxi criteria (the subset the timing/detection figures of merit speak to)

| Criterion | Driver | Module | Status |
|---|---|---|---|
| Availability | Availability under denial | `resilience::score` | MODELLED |
| Reliability | Filter integrity fraction | `fom`, `resilience::score` | MODELLED |
| Continuity | Holdover × bounded gate | `resilience::timeline` | MODELLED |
| Accuracy | Timing/quality proxy — **position-domain accuracy is not part of the score**. `fom::positioning_performance` turns a supplied position covariance and HPL (horizontal protection level) into CEP/SEP/2DRMS (circular error probable, spherical error probable, twice the distance root mean square), but no scenario feeds it into the resilience score | `resilience::score` | MODELLED (timing-domain only) |

## What this cross-walk does not claim

- No certified RPCF Level. The assigned Level is a *tentative, simulation-derived*
  reading with an explicit bounded-degradation gate, not a conferred maturity.
- No position-domain accuracy in the score. The resilience sub-scores are built from
  timing-domain and detection metrics. The engine does compute positions elsewhere (the
  `pvt`, `gnss-ins` and `leo-pvt` kinds) and protection levels (the `integrity` kind),
  but the scoring layer does not consume them.
- No field validation. The reference panel and threat ensemble are synthetic,
  parameter-grounded reductions (`resilience::panel`), stated as a first-class
  limitation.

The companion study (`resilience::study`) exists precisely to show that collapsing
these dimensions into one composite score or one Level produces a rating whose
architecture ranking is unstable under defensible weighting and threat choices —
so this cross-walk is a measurement layer to be read per-dimension, not a single
grade to certify against.

## Resilience and vertical scenarios that exercise these layers

The bundled scenarios below run the threat and recovery machinery the cross-walk rows
point at. Each is a real run of the named kind; every one is **MODELLED** (no field data).

| Scenario (`scenarios/`) | Kind | What it shows |
|---|---|---|
| `conflict-resilience.toml` | `conflict-resilience` | Layered PNT under a shared jamming/spoofing threat: a seeded Monte Carlo of layer denial, inverse-variance fusion of the survivors, the single-layer vs layered total-loss ratio, and how correlated denial collapses that ratio. Its Monte-Carlo-to-closed-form and fusion identities are checked by in-crate tests; the kind has no verification-matrix row, so it is graded MODELLED here. |
| `leo-resilience-gnss-jammed-leo-carries.toml` | `campaign` | GNSS jammed, a low Earth orbit (LEO) PNT layer carries the user, integrity kept (three phases on one timeline). |
| `leo-resilience-multiband-diversity.toml`, `leo-resilience-spoof-monitors.toml` | `campaign` | One jammer against a four-band receiver; which spoofing monitor sees which spoofer. |
| `leo-resilience-js-margin.toml` | `spectrum` | The jammer-to-signal (J/S) margin from received power. |
| `leo-resilience-spoof-doppler.toml` | `leo-pass` | Spoofing detection by Doppler and pass-geometry consistency. |
| `leo-vertical-5g-network-timing.toml`, `leo-vertical-critical-infrastructure-timing.toml` | `campaign` | Base-station and critical-infrastructure timing in holdover, with LEO time. |
| `leo-vertical-autonomous-vehicle.toml`, `leo-vertical-rail-maritime.toml`, `leo-vertical-polar-arctic.toml`, `leo-vertical-asset-tracking-iot.toml` | `campaign` | Road, rail, maritime, polar and Internet of Things (IoT) users with a LEO layer. |
| `automotive-urban-canyon.toml`, `small-uas-jammed-nav.toml` | `gnss-ins` | GNSS/INS (inertial navigation system) dead reckoning through an urban canyon and through jamming on a small uncrewed aircraft. |
| `maritime-port-approach-coast.toml`, `rail-tunnel-coast.toml` | `ins-trn-coast` | How long an INS keeps a ship or a train inside its limit with GNSS denied. |
| `maritime-strait-jamming.toml`, `maritime-spoof-position-push.toml` | `jamming`, `spoof-detect` | A maritime jammer; detecting a spoofer that drags a ship's reported position. |
