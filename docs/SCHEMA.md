<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Result schema — reading a Kshana `*.result.json`

Every run writes a versioned, self-describing JSON (JavaScript Object Notation) artifact next to the scenario.
This page is the hand-written reader's guide to the interchange envelope and to the
**clock and orbit** result shapes: each field's **unit**, where it is computed in the
source, and how to read it. The canonical type is `RunResult` in
[`src/report.rs`](../src/report.rs); the figures of merit are `FoMScores` in
[`src/fom.rs`](../src/fom.rs).

It is **not** the complete field reference. The engine dispatches over far more kinds
than these two, and each emits its own pack. The complete reference — unit, provenance
class and definition for every numeric field of every built-in kind — is generated, not
hand-written: see
[Units and provenance, per field, for every kind](#units-and-provenance-per-field-for-every-kind)
below.

## Interchange envelope (KIF) — recognising and version-checking an artifact

Kshana artifacts can be wrapped in a neutral, self-describing **interchange
envelope** so a third-party tool can recognise the file and decide whether it
can read it *before* it commits to a payload schema. The canonical type is
`Envelope` in [`src/interchange.rs`](../src/interchange.rs).

| Key | Type | Meaning |
|-----|------|---------|
| `format` | string | Always `"kshana-interchange"` (`FORMAT_TAG`) — how a foreign tool recognises a Kshana artifact. |
| `schema_version` | string | The `MAJOR.MINOR` schema version (`SCHEMA_VERSION`, the single source of truth for the whole crate). |
| `kind` | string | Artifact kind, e.g. `"scenario"`, `"run-result"`, `"trade-study"` — lets a consumer route without parsing the body. |
| `engine_version` | string | Crate version (`Cargo.toml`) that produced the payload. |
| `payload` | object | The wrapped artifact as canonical JSON (a `Scenario`, a `RunResult`, …). |

**Compatibility contract.** Versions are `MAJOR.MINOR`. New fields are added with
`#[serde(default)]` (the *additive discipline*), so a reader can parse any
artifact of the **same major and an equal-or-older minor** (`Compatible`). A
strictly **newer minor** (`ForwardIncompatible`) may carry fields this reader
cannot honour, and a **different major** (`MajorIncompatible`) is a structural
break — both are refused by `Envelope::parse`, which validates the format tag and
version on the boundary rather than silently mis-parsing foreign input.

**Determinism.** The envelope carries **no timestamp** — Kshana's reproducibility
promise (`scenario + seed + engine_version` reproduces a run) requires it.
Provenance lives in `engine_version` and the payload's own `scenario_hash`.

A typed read-back (`Envelope::payload_as::<T>()`) works for any payload that
implements `Deserialize` (e.g. `Scenario`). Result artifacts are serialize-only
by design and are read as the raw `payload` JSON value.



## Top level (clock and orbit packs)

| Key | Type / unit | Meaning | Source |
|-----|-------------|---------|--------|
| `schema_version` | string | Result schema version (independent of engine version). | `report.rs` |
| `engine_version` | string | Crate version (`Cargo.toml`) that produced the file. | `report.rs` |
| `scenario_hash` | hex string | SHA-256 (SHA: Secure Hash Algorithm) over the canonical scenario JSON — the run is reproducible from `scenario + seed + engine_version`. | `report.rs:hash_scenario` |
| `seed` | u64 | RNG (random-number generator) seed for the quantum run (classical uses `seed + 0x9e3779b97f4a7c15`). | `run.rs` |
| `threshold_ns` | nanoseconds | The timing spec: an error within ±`threshold_ns` is "in spec". | scenario |
| `quantum` | object (`ClockRun`) | The quantum sensor's run (see below). | `report.rs` |
| `classical` | object (`ClockRun`) | The classical sensor's run, for comparison. | `report.rs` |
| `units` | object | Per-field unit/provenance map for this document, keyed by field path. See §Units and provenance below. | `field_schema.rs:units_block` |
| `geometry` | object, optional | Orbit-pack geometry summary: `samples_total`, `samples_with_fix`, `sigma_uere_m` (m, the modelled per-satellite range-error budget), `best_pdop` / `median_pdop` (dimensionless) and `best_position_sigma_m` / `median_position_sigma_m` (m, PDOP (position dilution of precision) × `sigma_uere_m`). **Orbit pack only.** | `orbit.rs` |
| `eci_track` | array of `[x, y, z]` km, optional | Propagated Earth-centred-inertial track of the user spacecraft, one entry per sampled time. **Orbit pack only**; omitted otherwise. Output-only — not hashed. | `report.rs` |
| `meta` | object (`StudyMeta`), optional | Additive report metadata (study title, generation stamp, author, disclaimer). Omitted when absent, so a meta-less run is byte-identical to legacy output. Output-only — not hashed. | `report.rs` |

## `ClockRun` (each of `quantum` / `classical`)

| Key | Type / unit | Meaning |
|-----|-------------|---------|
| `spec.id` | string | Sensor identifier (e.g. `optical-sr-lattice`). |
| `spec.kind` | string | Model kind (e.g. `clock`). |
| `spec.provenance` | string | Citation/source for the sensor's parameters. |
| `spec.params` | object | The raw model parameters used. |
| `series` | array of `{t, error_ns, gnss}` | Per-step time series: `t` seconds, `error_ns` the timing error in **nanoseconds**, `gnss` one of `nominal`/`degraded`/`denied`. |
| `fom` | object (`FoMScores`) | The scored figures of merit (below). |
| `adev_curve` | array of `{tau_s, adev, n_samples, noise, edf, ci_lo, ci_hi}` | Overlapping Allan deviation: `tau_s` the averaging time (s), `adev` the dimensionless fractional-frequency stability σ_y(τ), `n_samples` the overlap count behind that point, `noise` the power-law type identified from the MDEV (modified Allan deviation) slope (e.g. `WhiteFm`), `edf` the noise-type-specific effective degrees of freedom, and `ci_lo`/`ci_hi` the χ²-based 95% confidence band on `adev` at that τ. Computed in `allan.rs:overlapping_adev_curve`. |
| `filter_health` | object, optional | Kalman filter-consistency assessment (NIS/NEES (NIS: normalised innovation squared; NEES: normalised estimation error squared) against their χ² bands). `None` for runs that do not assess it. | `filter_health.rs` |

## `FoMScores` (the `fom` object)

| Field | Unit | Meaning | Source | Caveat |
|-------|------|---------|--------|--------|
| `timing_rms_ns` | ns | RMS (root mean square) clock-phase (timing) error over the outage. | `fom.rs:score` | a **timing** metric, not position |
| `timing_p95_ns` | ns | 95th-percentile timing error over the outage. | `fom.rs:score` | |
| `holdover_s` | s | Worst-case (shortest) in-spec coast across outage segments. | `fom.rs:worst_case_holdover` | **grid-bounded** — a lower bound at the time-step resolution |
| `resilience_slope_ns_per_s` | ns/s | Least-squares growth rate of \|error\| during the outage. | `fom.rs:score` | |
| `availability` | fraction [0,1] | Fraction of the whole run with an in-spec solution. | `fom.rs:score` | |
| `integrity` | fraction [0,1] or null | **Filter self-consistency**: fraction of outage samples whose true error stays inside the Kalman k-σ bound. | `run.rs` | **NOT** HPL/VPL/RAIM (HPL: horizontal protection level; VPL: vertical protection level; RAIM: receiver autonomous integrity monitoring) integrity — see [`INTEGRITY.md`](INTEGRITY.md) |
| `security` | fraction [0,1] or null | **Analytic spoof-detectability bound** from clock stability. | `run.rs` + `security.rs` | meaningful only with a configured attack; **not** a multi-SV (SV: space vehicle, that is a satellite) RAIM detector |

## What "good" looks like

- A **quieter clock** (lower `adev_curve`) gives a longer `holdover_s` and a higher
  `security` detectability bound — that is the quantum-vs-classical contrast.
- `availability` near 1.0 means the system stayed in spec almost the whole run; during a
  long outage it drops for the noisier clock.
- `integrity` near 1.0 means the filter's own uncertainty bound was honest about its
  error — a *self-consistency* statement, not a safety-of-life guarantee.

## Other scenario kinds

The `inertial`, `hybrid`, `fusion`, and `spoof` scenario kinds emit related but
distinct artifacts:

- **inertial / hybrid**: position-domain FoMs in **metres** (`pos_rms_m`, `pos_p95_m`)
  — single-axis (1-DOF (DOF: degree of freedom)), single-seed (see [`CAPABILITY.md`](CAPABILITY.md)).
- **spoof**: per-step spoof offset vs the clock's detection bound, plus whether the
  spoof reached the spec before detection (`src/spoof.rs`).

For the precise field set of each, run the scenario and read the emitted JSON, or see
the corresponding `*Result` struct in `src/`.

## Units and provenance, per field, for every kind

This page is hand-written and covers the clock and orbit packs. The machine-readable
counterpart covers **every** built-in kind:

- **In the result itself.** Each scenario's result document carries a top-level `units`
  object mapping an emitted field's path to `{"unit", "provenance", "note"}`. The path
  grammar (an array contributes one `[]`-suffixed segment shared by its rows; `*` is a
  single-segment wildcard for data-keyed objects) and the closed provenance vocabulary
  are defined in [`src/field_schema.rs`](../src/field_schema.rs).
- **As one file.** [`field-units-schema.json`](field-units-schema.json) is the harvested
  union: for every kind, every numeric field it emits at a stated source, with its unit,
  provenance class, evidence tier and definition — and, named rather than omitted, every
  field that does not have one yet. Its `coverage` block carries the counts.

Both are enforced by `tests/field_units_global.rs`, which runs every registered kind and
fails if an emitted numeric field lacks a unit and a provenance class. Kinds not yet
covered are named individually in that file's `UNCOVERED_KINDS` with the reason each is
open, and the count is pinned so the list can only shrink.

Regenerate the JSON after any change to a report's shape or to a `units` block:

```
cargo test --test field_units_global zzz_emit_field_units_schema -- --ignored
```
