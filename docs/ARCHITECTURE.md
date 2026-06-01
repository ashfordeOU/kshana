# Kshana — Architecture

Kshana is **one engine with four sensor packs**. The engine knows nothing about
"quantum" vs "classical": it drives sensor *error models* through a GNSS-outage
scenario, runs an estimator, and scores the outcome. A quantum and a classical
device are therefore compared on the same scenario, differing only in their
(published, cited) error parameters and their independent noise seeds.

This document collects the structural and behavioural diagrams. For usage see the
[README](../README.md); for what is and isn't validated see [VALIDATION](VALIDATION.md).

---

## 1. Module structure

```mermaid
flowchart TD
    main["main.rs<br/>CLI · dispatch by scenario kind"]

    subgraph shared["Shared core"]
      types["types.rs<br/>Seconds · TimeGrid · ModelSpec"]
      scenario["scenario.rs<br/>GnssState · GnssTimeline · ClockCfg · Scenario"]
      allan["allan.rs<br/>overlapping Allan deviation"]
    end

    subgraph pack1["Pack 1 · Clock holdover"]
      models["models.rs<br/>ErrorModel · ClockModel"]
      estimator["estimator.rs<br/>HoldoverEstimator"]
      fom["fom.rs<br/>Sample · FoMScores · score"]
      report["report.rs<br/>RunResult · hash · to_svg"]
      run["run.rs<br/>run / run_clock"]
    end

    inertial["inertial.rs<br/>Pack 2 · AccelModel · score_position · run_inertial"]
    timetransfer["timetransfer.rs<br/>Pack 3 · TimeTransferLink · score_link · run_timetransfer"]
    hybrid["hybrid.rs<br/>Pack 4 · run_suite · score_hybrid · run_hybrid"]

    main --> run
    main --> inertial
    main --> timetransfer
    main --> hybrid

    run --> models
    run --> estimator
    run --> fom
    run --> report
    models --> types
    scenario --> types
    inertial --> scenario
    timetransfer --> types
    hybrid -. composes .-> models
    hybrid -. composes .-> estimator
    hybrid -. composes .-> inertial
    hybrid -. composes .-> timetransfer
    pack1 --> shared
    inertial --> allan
```

The packs reuse the shared core (`types`, `scenario`, `allan`). Pack 4 (`hybrid`)
literally composes the models and estimators of Packs 1–3 rather than reimplementing
them.

## 2. Engine pipeline (per run)

Each run steps a single sensor model through the time grid, disciplining it whenever
GNSS is nominal and letting it free-run (holdover / dead-reckoning) during the outage.

```mermaid
flowchart TD
    A["for each time step t"] --> B{"i &gt; 0 ?"}
    B -- yes --> C["model.step(dt, rng)<br/>evolve noise state"]
    B -- no --> D
    C --> D{"GNSS state at t ?"}
    D -- "Nominal" --> E["discipline to truth<br/>(estimator sync / dead-reckoning reset)<br/>error = 0"]
    D -- "Denied/Degraded" --> F["estimator predicts;<br/>error = truth − prediction"]
    E --> G["record Sample(t, error, gnss)"]
    F --> G
    G --> A
    A -. after loop .-> H["score(series, spec)<br/>→ figures of merit"]
    H --> I["assemble Result<br/>(specs · series · FoM · scenario hash)"]
```

A scenario runs this pipeline twice — once for the quantum sensor, once for the
classical sensor — with **independent seeds** (`classical_seed = seed +
0x9e3779b97f4a7c15`) so the two noise realizations are uncorrelated.

## 3. The error-model interface (the extension point)

Every sensor implements the same idea: a stateful object whose `step()` advances its
internal stochastic error and whose accumulated state is read out each tick. Clocks
expose accumulated phase; accelerometers expose doubly-integrated position; links
expose per-measurement jitter.

```mermaid
classDiagram
    class ErrorModel {
      <<trait>>
      +step(dt, rng)
      +spec() ModelSpec
    }
    class ClockModel {
      +y0, q_wf, q_rw, drift
      +phase() s
      +det_freq()  +drift_rate()
    }
    class AccelModel {
      +bias, q_va
      +pos() m
      +reset()
    }
    class TimeTransferLink {
      +sigma_j
      +sample(rng) s
    }
    ErrorModel <|.. ClockModel
    ClockModel : white FM + random-walk FM + aging
    AccelModel : residual bias + velocity random walk
    TimeTransferLink : white timing jitter
```

`ModelSpec { id, kind, provenance, params }` travels into the result so every figure
in the output is traceable to the published source named in `provenance`.

## 4. CLI dispatch

```mermaid
flowchart TD
    F["read scenario .toml"] --> K{"peek top-level<br/>kind field"}
    K -- "inertial" --> RI["run_inertial → position FoMs"]
    K -- "timetransfer" --> RT["run_timetransfer → sync + ranging FoMs"]
    K -- "hybrid" --> RH["run_hybrid → combined PNT FoMs"]
    K -- "clock / absent" --> RC["run → timing FoMs"]
    RI --> W["write &lt;name&gt;.result.json + &lt;name&gt;.chart.svg"]
    RT --> W
    RH --> W
    RC --> W
```

`serde` ignores the unknown `kind` field on each scenario struct, so existing
single-kind scenarios deserialize unchanged.

## 5. The hybrid capstone

The hybrid pack runs a *suite* (one clock + one accelerometer) and requires **both**
timing and position to stay in spec; `pnt_holdover` is the time until either breaches.
Optionally an optical inter-satellite link re-syncs the **clock** during the outage —
time aiding only; position is not re-synced, because time transfer gives time, not
position. This is what isolates the inertial sensor as the limiting factor.

```mermaid
flowchart LR
    subgraph suite["PNT suite (per technology)"]
      clk["clock → timing error"]
      acc["accelerometer → position error"]
      isl["optical ISL<br/>re-sync clock at interval"] -. aids .-> clk
    end
    clk --> J["both within spec ?"]
    acc --> J
    J --> P["pnt_holdover = first breach<br/>(timing OR position)"]
```

## 6. Determinism & reproducibility

- All randomness flows through a single seeded `ChaCha8Rng` per run; the step order is
  fixed, so `(scenario, seed, engine version) → identical bits`.
- The result carries a SHA-256 `scenario_hash`; `scripts/check-reproducible.sh` runs a
  reference scenario twice and asserts byte-identical output.
- The same engine compiles to native (CLI today) and is intended to compile to
  WebAssembly for in-browser runs producing the same numbers.

## 7. Deferred / future structure

Tracked in [CHANGELOG](../CHANGELOG.md) `[Unreleased]`: flicker-FM floor, full
Kalman/factor-graph fusion (replacing the analytic holdover predictor), multi-window
holdover scoring, gyroscope/angular-random-walk, orbit-based scenarios (precise time
and propagation libraries), and Python + WebAssembly bindings. A private overlay repo
holds export-sensitive resilience depth; it plugs in via the same `ErrorModel`
interface without changing the public engine.
