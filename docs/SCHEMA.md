<!-- SPDX-License-Identifier: Apache-2.0 -->
# Result schema — reading a Kshana `*.result.json`

Every run writes a versioned, self-describing JSON artifact next to the scenario.
This page documents every field, its **unit**, where it is computed in the source,
and how to read it. The canonical type is `RunResult` in
[`src/report.rs`](../src/report.rs); the figures of merit are `FoMScores` in
[`src/fom.rs`](../src/fom.rs).

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
| `scenario_hash` | hex string | SHA-256 over the canonical scenario JSON — the run is reproducible from `scenario + seed + engine_version`. | `report.rs:hash_scenario` |
| `seed` | u64 | RNG seed for the quantum run (classical uses `seed + 0x9e3779b97f4a7c15`). | `run.rs` |
| `threshold_ns` | nanoseconds | The timing spec: an error within ±`threshold_ns` is "in spec". | scenario |
| `quantum` | object (`ClockRun`) | The quantum sensor's run (see below). | `report.rs` |
| `classical` | object (`ClockRun`) | The classical sensor's run, for comparison. | `report.rs` |

## `ClockRun` (each of `quantum` / `classical`)

| Key | Type / unit | Meaning |
|-----|-------------|---------|
| `spec.id` | string | Sensor identifier (e.g. `optical-sr-lattice`). |
| `spec.kind` | string | Model kind (e.g. `clock`). |
| `spec.provenance` | string | Citation/source for the sensor's parameters. |
| `spec.params` | object | The raw model parameters used. |
| `series` | array of `{t, error_ns, gnss}` | Per-step time series: `t` seconds, `error_ns` the timing error in **nanoseconds**, `gnss` one of `nominal`/`degraded`/`denied`. |
| `fom` | object (`FoMScores`) | The scored figures of merit (below). |
| `adev_curve` | array of `{tau_s, adev, n_samples}` | Overlapping Allan deviation: `tau_s` the averaging time (s), `adev` the dimensionless fractional-frequency stability σ_y(τ), `n_samples` the overlap count behind that point. Computed in `allan.rs:overlapping_adev_curve`. |

## `FoMScores` (the `fom` object)

| Field | Unit | Meaning | Source | Caveat |
|-------|------|---------|--------|--------|
| `timing_rms_ns` | ns | RMS clock-phase (timing) error over the outage. | `fom.rs:score` | a **timing** metric, not position |
| `timing_p95_ns` | ns | 95th-percentile timing error over the outage. | `fom.rs:score` | |
| `holdover_s` | s | Worst-case (shortest) in-spec coast across outage segments. | `fom.rs:worst_case_holdover` | **grid-bounded** — a lower bound at the time-step resolution |
| `resilience_slope_ns_per_s` | ns/s | Least-squares growth rate of \|error\| during the outage. | `fom.rs:score` | |
| `availability` | fraction [0,1] | Fraction of the whole run with an in-spec solution. | `fom.rs:score` | |
| `integrity` | fraction [0,1] or null | **Filter self-consistency**: fraction of outage samples whose true error stays inside the Kalman k-σ bound. | `run.rs` | **NOT** HPL/VPL/RAIM integrity — see [`INTEGRITY.md`](INTEGRITY.md) |
| `security` | fraction [0,1] or null | **Analytic spoof-detectability bound** from clock stability. | `run.rs` + `security.rs` | meaningful only with a configured attack; **not** a multi-SV RAIM detector |

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
  — single-axis (1-DOF), single-seed (see [`CAPABILITY.md`](CAPABILITY.md)).
- **spoof**: per-step spoof offset vs the clock's detection bound, plus whether the
  spoof reached the spec before detection (`src/spoof.rs`).

For the precise field set of each, run the scenario and read the emitted JSON, or see
the corresponding `*Result` struct in `src/`.
