# Methodology changelog

The scoring methods a register entry (`kshana.register/1`, [PRODUCT-REGISTER.md](PRODUCT-REGISTER.md))
can name, each with its version. A method's version changes whenever its scoring changes (tasks,
metrics, thresholds, data, pre-registered bars); an older version stays readable and an entry keeps
the version it was scored under. Entries here are append-only: a correction is a new line, never an
edit. Every method below is MODELLED unless its own page says otherwise; a score under it states
how a product did on that method and nothing more.

| method | version | date | what changed | where |
|---|---|---|---|---|
| `kshana-bench` | 2.0.0 | before 0.41 | tasks (a) detection on receiver logs, (b) detection on IQ, (c) timing holdover prediction, (d) out-of-distribution optimism gap; their metrics and splits | [BENCH.md](BENCH.md), `src/bench/mod.rs` `SPEC_VERSION` |
| `kshana-bench` | 2.1.0 | before 0.41 | task (e) added; tasks (a) to (d) keep 2.0.0 | `src/bench/task_e.rs` `SPEC_VERSION_E` |
| standards packs (`imo-circ-1575`, `icao-doc9849-appf`, `dhs-rpcf`) | the pack's `PREREGISTRATION.md` | per pack | rows, scenarios and bars stated before any scored run | `standards/<pack>/` |

## How a method version is cited

A register entry names `method` and `method_version` exactly as in the table, and optionally the
`scenario_set` and `scenario_set_version` it ran on. `kshana register-products verify` checks the
entry's evidence pack; the pack's own manifest records the engine version that produced it.

## Adding a version

Add a row with the date, what changed and where the change is; never change an existing row. A
method retired from use stays in the table with a row that says so.
