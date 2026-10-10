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
| `receiver_trust` | `(toml: str) -> RunOutput` | assess a real receiver log described by a `receiver-trust` scenario: result document, per-epoch trust CSV, chart and summary; a `[platform] kind = "vessel"` table adds the maritime monitors and the 0-100 trust score with reasons (advisory) |
| `receiver_trust_replay` | `(session_toml, nmea) -> dict` | a bounded NMEA excerpt scored the way live mode scores it: per-epoch state, 0-100 score and reasons, a summary (no socket, no gate; advisory) |
| `assess_vessel_log` | `(session_toml, log) -> dict` | a vessel's NMEA log as a batch run: the score model and every epoch's score with its deductions (advisory) |
| `evidence_create` | `(session_toml, log, from_s, to_s, title=None, created_utc=None, seed_hex=None) -> dict` | a signed evidence pack for a window of the log, in memory: `files`, `public_key`, `seed_hex` (keep it private); a technical record, not a legal opinion |
| `evidence_verify` | `(files, public_key=None, full_log=None, require_timestamp=False) -> dict` | verify a pack: hashes, chain, signature, optionally the trusted signer, the full log and a timestamp; `verdict` is `verified`, `intact-signer-not-pinned` (no public key given: intact, signer not established) or `failed` |
| `bench_export` | `(toml, epoch=None) -> dict` | a scenario's vehicle motion and events for a laboratory GNSS simulator, in memory: `{files: {suffix: text}, notes, notice}`; kinds `gnss-ins`, `jamming`, `gnss-sim`; no signal is written, keep `notice` with the files |
| `compliance_report` | `(runs) -> dict` | the public-framework mapping filled from result texts: `runs` is a list of `{label, result, scenario?}` dicts (text, at most 64); returns `{report, markdown}`; each row's `status` says the runs support evidence for its capabilities, not that a framework is met; carry `report["statement"]` with any display |
| `compliance_mapping` | `(sources=False) -> str` | the static mapping tables (or the source documents) as Markdown, led by the statement |
| `interference_map` | `(source, csv, dataset, cell_deg=None, licence=None, licence_url=None, attribution=None, land_geojson=None) -> list[dict]` | a GNSS interference map from ADS-B or AIS CSV text: one dict per UTC day with `kshana-interference-map/v1` GeoJSON (aggregate only; a degraded cell does not name interference as the cause) |
| `route_exposure` | `(route, maps, date_from=None, date_to=None) -> str` | share of a route through degraded cells of those maps, as JSON text (not a forecast; unobserved cells are not evidence of a clear route) |
| `nmea_training` | `(toml, seed=None) -> dict` | synthetic bridge NMEA for crew training plus the instructor log (`nmea`, `log_json`, `log_text`); text only, never for a vessel's live navigation systems |
| `iq_signals` | `() -> list[str]` | the GNSS IQ signal names `iq_scene`, `iq_acquire` and `iq_track` accept (`gps-l1ca`, `galileo-e1b`, `glonass-l1of`, ...) |
| `iq_scene` | `(fs_hz, duration_s, signal, prns, **options) -> dict` | a multi-satellite GNSS IQ scene in memory: `samples_i` / `samples_q` and per-epoch `truth` |
| `iq_scene_broadcast` | `(fs_hz, window_s, nav_text, rx_lat, rx_lon, rx_alt, **options) -> dict` | the same, with each GPS satellite at its broadcast-ephemeris geometry from a RINEX (Receiver Independent Exchange Format) navigation message |
| `iq_acquire` | `(i, q, fs_hz, signal, prns, **options) -> list[dict]` | FFT (fast Fourier transform) acquisition of each PRN (pseudorandom noise code): Doppler, code phase, statistic, threshold |
| `iq_acq_surface` | `(i, q, fs_hz, signal, prn, **options) -> dict` | the whole acquisition surface of one PRN (`kshana.acq-surface/1`): `rows[doppler][lag]` correlation power, the peak and two fine-Doppler refinements (`parabolic`, `fine_search`) |
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

def receiver_trust_replay(session_toml: str, nmea: str | bytes) -> dict: ...
def assess_vessel_log(session_toml: str, log: str | bytes) -> dict: ...
def evidence_create(session_toml: str, log: str | bytes, from_s: float, to_s: float,
                    title: str | None = None, created_utc: str | None = None,
                    seed_hex: str | None = None) -> dict: ...
def evidence_verify(files: dict[str, str | bytes], public_key: str | None = None,
                    full_log: str | bytes | None = None,
                    require_timestamp: bool = False) -> dict: ...
def interference_map(source: str, csv: str, dataset: str, cell_deg: float | None = None,
                     licence: str | None = None, licence_url: str | None = None,
                     attribution: str | None = None, land_geojson: str | None = None) -> list[dict]: ...
def route_exposure(route: str, maps: list[str], date_from: str | None = None,
                   date_to: str | None = None) -> str: ...
def bench_export(toml: str, epoch: str | None = None) -> dict: ...
def compliance_report(runs: list[dict[str, str]]) -> dict: ...
def compliance_mapping(sources: bool = False) -> str: ...
def nmea_training(toml: str, seed: int | None = None) -> dict[str, str]: ...

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

def iq_acq_surface(
    i: list[float],
    q: list[float],
    fs_hz: float,
    signal: str,
    prn: int,
    if_hz: float = ...,
    center_hz: Optional[float] = ...,
    coherent: int = ...,
    noncoherent: int = ...,
    doppler_max: float = ...,
    doppler_step: Optional[float] = ...,
    pfa: float = ...,
) -> dict[str, Any]: ...

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
    acq_coherent: Optional[int] = ...,
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

## Not in Python: long-running processes

`kshana receiver-trust live` (a stream process with a gate and an optional `--listen` TCP
server) and the telemetry exporters (Prometheus, OTLP, syslog; `docs/TRUST-TELEMETRY.md`) and `kshana nmea-scenario --tcp/--udp` streaming are command-line only: a binding
returns when the call returns and does not hold a socket open. Python covers the batch
form of each: `receiver_trust` for a log, `receiver_trust_replay` for a stream excerpt (scores and states; the gate is not applied), `nmea_training` for the generated text.
