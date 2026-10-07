<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Python API

Kshana ships a first-class Python application programming interface (API), built with
[PyO3](https://pyo3.rs) and [maturin](https://www.maturin.rs). Its `abi3` wheels are
built against the stable Python application binary interface (ABI), so one wheel per
platform works across CPython ≥ 3.9; wheels cover Linux, macOS and Windows, each on
x86-64 and 64-bit ARM (see [WHEEL_TAGS.md](WHEEL_TAGS.md)). A bundled type stub
(`kshana.pyi` + `py.typed`) gives editors and `mypy`/`pyright` full type information.

```bash
pip install kshana            # from the Python Package Index, PyPI (release wheels)
# or, from a checkout:
pip install maturin && maturin develop --features python
```

## Quickstart

Run these snippets from the root of a repository checkout: they read scenario files
under `scenarios/`. The NumPy line needs `pip install numpy`.

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
| `list_kinds` | `() -> str` | the same metadata as ONE JSON-array string, not a list (kept for existing callers; use `scenario_kinds` for the parsed list) |
| `validate_toml` | `(toml: str) -> list[str]` | error messages (empty if valid) |
| `error_kind` | `(toml: str) -> str \| None` | failure-category tag (`invalid_input`, `non_convergence`, `unsupported` or `io_error`), or `None` on success |
| `version` / `__version__` | `() -> str` / `str` | engine version |
| `receiver_trust` | `(toml: str) -> RunOutput` | assess a real receiver log described by a `receiver-trust` scenario: result document, per-epoch trust CSV, chart and summary |
| `iq_signals` | `() -> list[str]` | the GNSS IQ signal names `iq_scene`, `iq_acquire` and `iq_track` accept (`gps-l1ca`, `galileo-e1b`, `glonass-l1of`, ...) |
| `iq_scene` | `(fs_hz, duration_s, signal, prns, **options) -> dict` | a multi-satellite GNSS IQ scene in memory: `samples_i` / `samples_q` and per-epoch `truth` |
| `iq_scene_broadcast` | `(fs_hz, window_s, nav_text, rx_lat, rx_lon, rx_alt, **options) -> dict` | the same, with each GPS satellite at its broadcast-ephemeris geometry from a RINEX (Receiver Independent Exchange Format) navigation message |
| `iq_acquire` | `(i, q, fs_hz, signal, prns, **options) -> list[dict]` | FFT (fast Fourier transform) acquisition of each PRN (pseudorandom noise code): Doppler, code phase, statistic, threshold |
| `iq_track` | `(i, q, fs_hz, signal, prns, **options) -> dict` | acquire, then track each PRN: per-epoch Doppler, code phase, lock indicators, C/N0, prompt correlator |
| `iq_frontend` | `(i, q, fs_hz, **options) -> dict` | the receiver front-end chain (band-pass, notch, blanking, excision, AGC (automatic gain control), quantiser) over complex samples |
| `iq_labfit` | `(toml: str) -> dict` | fit the tracking-loop loss-of-lock model to a receiver-trust timeline (an `iq-labfit` scenario) |

### GNSS IQ and receiver-trust signatures

The full signatures, as `kshana.pyi` states them (every keyword after the required
arguments has a default; the docstrings in the stub give each one's meaning). Wrap the
`samples_i` / `samples_q` lists, and the `i` / `q` inputs, with `numpy.asarray(...)` for
arrays.

```python
def receiver_trust(toml: str) -> RunOutput: ...

def iq_signals() -> list[str]: ...

def iq_scene(
    fs_hz: float,
    duration_s: float,
    signal: str,
    prns: list[int],
    dopplers: Optional[list[float]] = ...,
    cn0_dbhz: Optional[float] = ...,
    center_hz: Optional[float] = ...,
    if_hz: float = ...,
    noise: bool = ...,
    noise_figure_db: float = ...,
    seed: int = ...,
    data: bool = ...,
    threads: int = ...,
    iono_stec: Optional[float] = ...,
    iono_vtec: Optional[float] = ...,
    iono_klobuchar: bool = ...,
    tropo: bool = ...,
    tropo_doy: float = ...,
    s4: Optional[float] = ...,
    scint_tau0: float = ...,
    sigma_phi: float = ...,
    multipath_height: Optional[float] = ...,
    multipath_ground: str = ...,
    land_mobile: bool = ...,
    nlos: bool = ...,
) -> dict[str, Any]: ...

def iq_scene_broadcast(
    fs_hz: float,
    window_s: float,
    nav_text: str,
    rx_lat: float,
    rx_lon: float,
    rx_alt: float,
    prns: Optional[list[int]] = ...,
    start_tow: float = ...,
    cn0_dbhz: Optional[float] = ...,
    center_hz: Optional[float] = ...,
    if_hz: float = ...,
    noise: bool = ...,
    noise_figure_db: float = ...,
    seed: int = ...,
    mask_deg: float = ...,
    threads: int = ...,
) -> dict[str, Any]: ...

def iq_acquire(
    i: list[float],
    q: list[float],
    fs_hz: float,
    signal: str,
    prns: list[int],
    if_hz: float = ...,
    center_hz: Optional[float] = ...,
    coherent: int = ...,
    noncoherent: int = ...,
    doppler_max: float = ...,
    doppler_step: Optional[float] = ...,
    pfa: float = ...,
) -> list[dict[str, Any]]: ...

def iq_track(
    i: list[float],
    q: list[float],
    fs_hz: float,
    signal: str,
    prns: list[int],
    if_hz: float = ...,
    center_hz: Optional[float] = ...,
    pll_bw: Optional[float] = ...,
    fll_bw: Optional[float] = ...,
    dll_bw: Optional[float] = ...,
    spacing: Optional[float] = ...,
    coherent: Optional[int] = ...,
    periods_per_bit: Optional[int] = ...,
    acq_coherent: int = ...,
    acq_noncoherent: int = ...,
    doppler_max: float = ...,
    max_seconds: Optional[float] = ...,
) -> dict[str, Any]: ...

def iq_frontend(
    i: list[float],
    q: list[float],
    fs_hz: float,
    bandpass_lo: Optional[float] = ...,
    bandpass_hi: Optional[float] = ...,
    bandpass_transition: Optional[float] = ...,
    bandpass_atten: float = ...,
    notch: bool = ...,
    notch_r: float = ...,
    notch_mu: float = ...,
    blank: Optional[float] = ...,
    blank_hold: int = ...,
    excise: bool = ...,
    excise_fft: int = ...,
    excise_pfa: float = ...,
    agc: bool = ...,
    agc_tau: float = ...,
    bits: Optional[int] = ...,
    quant_step: Optional[float] = ...,
    no_agc: bool = ...,
) -> dict[str, Any]: ...

def iq_labfit(toml: str) -> dict[str, Any]: ...
```

`iq_track`'s `acq_coherent` sets how many code periods the hand-off acquisition
integrates coherently. From 0.33.0 it defaults to `None`, meaning auto: about 4 ms
(4 periods for a 1 ms code such as GPS L1 C/A, 1 for a code of 4 ms or longer), so the
channel starts close enough for the frequency loop to pull in; `acq_coherent=1` keeps
the 0.32 one-period search.

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

`realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, `telecom-timing` and
`leo-navmsg` always publish a table; `moonlight-service-volume` publishes one when an
export site (`export_site_lat_deg` + `export_site_lon_deg`) is configured. Every other kind returns `csv = None`. The text is
the same bytes the CLI (command-line interface) writes as `<scenario>.table.csv`, so a reviewer reproducing a
published table from the wheel never has to drop to the command line:

```python
import kshana

out = kshana.run_typed(open("scenarios/realtime-frame-eop.toml").read())
if out.csv is not None:
    print(out.write_csv("table.csv"), "bytes written")
```

## Result shape

The figures of merit and the time series live **per run side**, not at the top level.
For a clock run the document is:

```text
schema_version  engine_version  scenario_hash  seed  threshold_ns  units  figure_tiers
quantum   → spec · series · fom · adev_curve · filter_health
classical → spec · series · fom · adev_curve · filter_health
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
  `scenario_hash`, so the same input yields byte-identical output on the same platform
  (see [`REPRODUCIBILITY.md`](REPRODUCIBILITY.md)).
- A first-class NumPy return type (`RunOutput` exposing `np.ndarray` time series
  directly, rather than via `np.asarray(out.data()[...])`) and a published Colab
  notebook are planned follow-ons.
