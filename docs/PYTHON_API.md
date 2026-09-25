<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Python API

Kshana ships first-class Python bindings (built with [PyO3](https://pyo3.rs) and
[maturin](https://www.maturin.rs)), with `abi3` wheels that work across CPython
≥ 3.9. A bundled type stub (`kshana.pyi` + `py.typed`) gives editors and
`mypy`/`pyright` full type information.

```bash
pip install kshana            # from PyPI (release wheels)
# or, from a checkout:
pip install maturin && maturin develop --features python
```

## Quickstart

```python
import kshana

toml = open("scenarios/clock-holdover.toml").read()

# Typed result with a parsed-dict accessor:
out = kshana.run_typed(toml)
print(out.summary)
data = out.data()                         # a Python dict — no JSON re-parsing
fom = data["quantum"]["fom"]              # figures of merit, quantum side
classical_fom = data["classical"]["fom"]  # … and the classical baseline
print(out.json[:80], "...")               # raw JSON also available
open("chart.svg", "w").write(out.svg)     # the chart SVG

# NumPy interop — wrap any numeric list from the result:
import numpy as np
adev = np.asarray([p["adev"] for p in data["quantum"]["adev_curve"]])
```

## Surface

| Symbol | Signature | Returns |
|--------|-----------|---------|
| `run_typed` | `(toml: str) -> RunOutput` | typed result (`.json`, `.svg`, `.summary`, `.csv`, `.data()`, `.write_csv()`) |
| `run` | `(toml: str) -> str` | result document as a JSON (JavaScript Object Notation) string |
| `run_full` | `(toml: str) -> tuple[str, str, str]` | `(json, svg, summary)` |
| `scenario_kinds` | `() -> list[dict]` | available scenario kinds + metadata (parsed) |
| `list_kinds` | `() -> str` | the same metadata as a JSON-array string |
| `validate_toml` | `(toml: str) -> list[str]` | error messages (empty if valid) |
| `error_kind` | `(toml: str) -> str \| None` | failure-category tag, or `None` on success |
| `version` / `__version__` | `() -> str` / `str` | engine version |

### `RunOutput`

| Member | Type | Notes |
|--------|------|-------|
| `.json` | `str` | full result document (JSON) |
| `.svg` | `str` | standalone chart SVG (Scalable Vector Graphics) |
| `.summary` | `str` | one-line human summary |
| `.csv` | `str \| None` | the reproducibility table, for the kinds that emit one (see below) |
| `.data()` | `dict` | the result parsed into a Python dict (see the shape note below) |
| `.write_csv(path)` | `int` | write that table to `path`; returns the bytes written, or 0 (and writes nothing) when the kind emits no table |

### The reproducibility table

`realtime-frame-eop`, `lunar-time-budget` and `lunar-jamming` always publish a table;
`moonlight-service-volume` publishes one when an export site (`export_site_lat_deg` +
`export_site_lon_deg`) is configured. Every other kind returns `csv = None`. The text is
the same bytes the CLI (command-line interface) writes as `<scenario>.table.csv`, so a reviewer reproducing a
published table from the wheel never has to drop to the command line:

```python
out = kshana.run_typed(open("scenarios/realtime-frame-eop.toml").read())
if out.csv is not None:
    print(out.write_csv("table.csv"), "bytes written")
```

## Result shape

The figures of merit and the time series live **per run side**, not at the top level.
For a clock run the document is:

```text
schema_version  engine_version  scenario_hash  seed  threshold_ns  units
quantum   → fom · series · adev_curve · filter_health · spec
classical → fom · series · adev_curve · filter_health · spec
```

so the figures of merit are `data["quantum"]["fom"]`, never `data["figures_of_merit"]`.
Other kinds emit their own packs; the complete per-field reference, with units and a
source pointer, is [`field-units-schema.json`](field-units-schema.json) and the reader's
guide is [`SCHEMA.md`](SCHEMA.md).

## Notes

- `validate_toml` and `error_kind` **execute** the scenario, so they surface
  parse, configuration, *and* runtime errors. They never raise.
- `run` / `run_typed` raise `ValueError` on an invalid scenario.
- Results are reproducible: a scenario carries its `seed` and the engine records a
  `scenario_hash`, so the same input yields byte-identical output (see
  [`VALIDATION.md`](VALIDATION.md)).
- A first-class NumPy return type (`RunOutput` exposing `np.ndarray` time series
  directly, rather than via `np.asarray(out.data()[...])`) and a published Colab
  notebook are planned follow-ons.
