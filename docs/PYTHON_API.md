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
fom = out.data()["figures_of_merit"]      # a Python dict — no JSON re-parsing
print(out.json[:80], "...")               # raw JSON also available
open("chart.svg", "w").write(out.svg)     # the chart SVG

# NumPy interop — wrap any numeric list from the result:
import numpy as np
adev = np.asarray([p["adev"] for p in out.data().get("adev_curve", [])])
```

## Surface

| Symbol | Signature | Returns |
|--------|-----------|---------|
| `run_typed` | `(toml: str) -> RunOutput` | typed result (`.json`, `.svg`, `.summary`, `.data()`) |
| `run` | `(toml: str) -> str` | result document as a JSON string |
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
| `.svg` | `str` | standalone chart SVG |
| `.summary` | `str` | one-line human summary |
| `.data()` | `dict` | the result parsed into a Python dict |

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
