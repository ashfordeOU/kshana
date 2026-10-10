# SPDX-License-Identifier: AGPL-3.0-only
"""Type stubs for the Kshana Python bindings (PyO3 / maturin).

Kshana is an open hybrid quantum/classical PNT performance simulator. The Python
surface runs a TOML scenario string and returns the result document; see
docs/PYTHON_API.md for a quickstart.
"""
from typing import Any, Optional, final

# Mirrors the runtime `__all__` pyo3 generates for the module, so a checker's
# view of `from kshana import *` matches what the extension actually exports.
__all__ = [
    "RunOutput",
    "run",
    "run_full",
    "run_typed",
    "scenario_kinds",
    "validate_toml",
    "list_kinds",
    "error_kind",
    "version",
    "receiver_trust",
    "receiver_trust_replay",
    "assess_vessel_log",
    "evidence_create",
    "evidence_verify",
    "interference_map",
    "bench_export",
    "compliance_report",
    "compliance_mapping",
    "route_exposure",
    "nmea_training",
    "iq_scene",
    "iq_scene_broadcast",
    "iq_acquire",
    "iq_acq_surface",
    "iq_track",
    "iq_loop_designs",
    "iq_read_epochs",
    "iq_frontend",
    "iq_monitor",
    "iq_labfit",
    "iq_signals",
    "iq_test_conditions",
    "iq_campaign",
    "iq_campaign_report",
    "__version__",
]

__version__: str

# pyo3 emits a plain extension type: `type 'builtins.RunOutput' is not an acceptable
# base type`. Without @final, mypy and pyright green-light a subclass that dies at
# import time — the stub would be promising a contract the extension refuses.
@final
class RunOutput:
    """A scenario run result."""

    @property
    def json(self) -> str:
        """The result document as a JSON string."""
    @property
    def svg(self) -> str:
        """The chart as a standalone SVG string."""
    @property
    def summary(self) -> str:
        """A short human-readable summary line."""
    @property
    def csv(self) -> Optional[str]:
        """The reproducibility table as CSV text, for the kinds that emit one:
        ``realtime-frame-eop``, ``lunar-time-budget``, ``lunar-jamming``, and
        ``moonlight-service-volume`` when an export site is configured. ``None``
        for every other kind. Same bytes the CLI writes as ``<scenario>.table.csv``."""
    def data(self) -> dict[str, Any]:
        """The result document parsed into a dict (figures of merit, time series,
        provenance, ...). Wrap numeric lists with ``numpy.asarray(...)`` for arrays."""
    def write_csv(self, path: str) -> int:
        """Write :attr:`csv` to ``path``; returns the bytes written, or 0 when this
        scenario kind emits no table — in which case no file is created."""
    def __repr__(self) -> str: ...

def run(toml: str) -> str:
    """Run a scenario (TOML string); return the result document as JSON. Raises
    ``ValueError`` if the scenario is invalid."""

def run_full(toml: str) -> tuple[str, str, str]:
    """Run a scenario; return ``(json, svg, summary)``."""

def run_typed(toml: str) -> RunOutput:
    """Run a scenario; return a typed :class:`RunOutput` with ``.json``/``.svg``/
    ``.summary``/``.csv``/``.data()``/``.write_csv()``. Raises ``ValueError`` if
    invalid."""

def receiver_trust(toml: str) -> RunOutput:
    """Assess a real receiver log described by a ``receiver-trust`` scenario (TOML text).

    A ``[platform]`` table with ``kind = "vessel"`` selects the maritime monitors and the
    0-100 trust score with its reasons; the output is advisory (docs/MARITIME-TRUST.md).
    ``receiver-trust live`` (a long-running stream process) is command-line only.

    Returns the result document, the per-epoch trust CSV, the chart and a summary.
    Raises ``ValueError`` on an invalid scenario or an unreadable log."""
    ...

def receiver_trust_replay(session_toml: str, nmea: str | bytes) -> dict[str, Any]:
    """Score a bounded excerpt of a vessel's NMEA stream the way ``kshana receiver-trust live``
    does (at most 2 MiB and 20,000 epochs; it must hold the calibration window).

    ``session_toml`` declares a vessel (``[platform] kind = "vessel"``). Keys: ``schema``
    (``"1.2"``), ``epochs`` (one dict per epoch: ``state``, ``score``, ``deductions``,
    ``alarms``, ``position``, ``advisory``, ...), ``last_pksht`` and ``summary`` (counts by state,
    ``lowest_score``, ``final_score``, ``first_untrusted_t_s``). Opens no socket and does not
    apply the gate (both are command-line only); advisory only. Raises ``ValueError``."""

def assess_vessel_log(session_toml: str, log: str | bytes) -> dict[str, Any]:
    """Assess a vessel's NMEA log as a batch run: the ``result.json`` of
    ``kshana receiver-trust`` (score model, monitors run, every epoch's 0-100 score with its
    deductions). ``session_toml`` needs no ``[log]`` table. Advisory only. Raises
    ``ValueError``."""

def evidence_create(
    session_toml: str,
    log: str | bytes,
    from_s: float,
    to_s: float,
    title: Optional[str] = None,
    created_utc: Optional[str] = None,
    seed_hex: Optional[str] = None,
) -> dict[str, Any]:
    """Build a signed evidence pack for a window (seconds since the first epoch) of a vessel's
    NMEA log. ``seed_hex`` is the Ed25519 signing-key seed (64 hex digits); omitted, one is
    generated. ``created_utc``: ``None`` is now, ``"none"`` leaves it out. Keys: ``files``
    (name to ``bytes``), ``public_key``, ``seed_hex`` (keep it private), ``epochs_in_window``,
    ``slice`` (``[start, end]`` or ``None`` for the whole log). A technical record, not a legal
    opinion. Raises ``ValueError``."""

def evidence_verify(
    files: dict[str, str | bytes],
    public_key: Optional[str] = None,
    full_log: Optional[str | bytes] = None,
    require_timestamp: bool = False,
) -> dict[str, Any]:
    """Verify an evidence pack: hashes, chain and signature; with ``public_key`` (64 hex digits
    from the signer, by another route) that the signer is the one expected; with ``full_log``
    that it is the log recorded; with ``require_timestamp`` that a timestamp token is present.
    Keys: ``ok``, ``failures``, ``checks``, ``signer_fingerprint``, ``signer_pinned``, ``notes``,
    ``verdict`` and ``message``. ``verdict`` is ``"verified"`` (signer pinned),
    ``"intact-signer-not-pinned"`` (everything checks but no public key was given, so the
    signature proves only that the pack is intact against the key it names itself) or
    ``"failed"``. Raises ``ValueError`` on a malformed key."""

def bench_export(toml: str, epoch: Optional[str] = None) -> dict[str, Any]:
    """Export a scenario's vehicle motion and events for a laboratory GNSS simulator
    (``docs/TEST-BENCH.md``), in memory (nothing is written). Applies to ``gnss-ins``, ``jamming``
    and ``gnss-sim``; other kinds raise ``ValueError`` with the reason. ``epoch`` is the UTC
    instant of motion time zero (``YYYY-MM-DDTHH:MM:SS``, optional ``Z``; default
    2024-01-01T00:00:00Z). Returns ``{"files": {suffix: text}, "notes": [...], "notice": str}``
    (``.motion.csv``, ``.motion.json``, ``.nmea``, ``.events.csv``, ``.events.toml`` and, on a
    millisecond-regular grid, ``.waypoints.txt``); keep ``notice`` with the files. No
    radio-frequency or baseband signal is written."""

def compliance_report(runs: list[dict[str, str]]) -> dict[str, Any]:
    """Fill the public-framework mapping (five resilience frameworks and standards, see
    ``docs/compliance/``) from result documents given as text. ``runs`` is a list of dicts with
    ``label``, ``result`` (the result JSON text) and optionally ``scenario`` (the scenario TOML
    text, which names the kind a result does not); at most 64 runs, nothing read from disk.
    Returns ``{"report": dict, "markdown": str}``. The report has ``statement`` (carry it
    verbatim wherever the output is shown), ``runs``, ``unrecognised`` (inputs not used, with
    the reason), ``capabilities``, ``receiver_trust`` and ``rows``: each row has a ``status``
    of ``evidenced``, ``partly-evidenced``, ``not-evidenced`` or ``out-of-scope`` and keeps its
    ``gap``. A status says the runs support evidence for the row's capabilities; it is not a
    finding that a framework is met. Raises ``ValueError``."""

def compliance_mapping(sources: bool = False) -> str:
    """The static public-framework mapping as Markdown, led by the statement every report
    carries: one table per framework, or with ``sources=True`` the source documents they cite
    (versions and URLs)."""

def interference_map(
    source: str,
    csv: str,
    dataset: str,
    cell_deg: Optional[float] = None,
    licence: Optional[str] = None,
    licence_url: Optional[str] = None,
    attribution: Optional[str] = None,
    land_geojson: Optional[str] = None,
) -> list[dict[str, Any]]:
    """Build a GNSS interference map from ``"adsb"`` or ``"ais"`` CSV text.

    ``dataset`` is an approved preset or ``"custom"`` (which needs ``licence``,
    ``licence_url`` and ``attribution``). One dict per UTC day: ``file_name``, ``date``,
    ``cells_published``, ``cells_flagged`` and ``geojson`` (``kshana-interference-map/v1``
    text). Aggregate only; a degraded cell does not name interference as the cause.
    Raises ``ValueError`` on bad input."""

def route_exposure(
    route: str,
    maps: list[str],
    date_from: Optional[str] = None,
    date_to: Optional[str] = None,
) -> str:
    """Share of a route through degraded cells of the given maps, as JSON text. Cells not
    observed are not evidence of a clear route; not a forecast. Raises ``ValueError``."""

def nmea_training(toml: str, seed: Optional[int] = None) -> dict[str, str]:
    """Synthetic bridge NMEA for crew training from a ``nmea-scenario`` TOML. Keys:
    ``nmea``, ``log_json`` (instructor log, ``kshana-nmea-training/1``), ``log_text``.
    Text only; never for a vessel's live navigation systems. Raises ``ValueError``."""

def scenario_kinds() -> list[dict[str, Any]]:
    """The available scenario kinds and their metadata (name, description, required
    and optional fields). A required entry is usually one key; ``a|b`` means at
    least one of them and ``a+b`` means all of them together (e.g.
    ``tle|orbit+epoch``). Every kind except ``clock`` must also set ``kind``."""

def validate_toml(toml: str) -> list[str]:
    """Validate a scenario TOML string without raising: a list of error messages,
    empty if valid. Executes the scenario, so it surfaces parse, config, and
    runtime errors."""

def list_kinds() -> str:
    """The scenario kinds and metadata as ONE JSON-array string, not a list.

    It returns the same metadata as :func:`scenario_kinds`, serialised; iterating
    the result walks characters, not kinds. It stays a string so existing callers
    do not break. For a Python list of dictionaries call :func:`scenario_kinds`,
    or ``json.loads(list_kinds())``."""

def error_kind(toml: str) -> Optional[str]:
    """Run a scenario; on failure return the structured error *kind* tag
    (``invalid_input``/``non_convergence``/``unsupported``/``io_error``) instead of
    raising. Returns ``None`` on success."""

def version() -> str:
    """The engine version (the crate version)."""

def iq_signals() -> list[str]:
    """The GNSS IQ signal names accepted by :func:`iq_scene`, :func:`iq_acquire` and
    :func:`iq_track` (``gps-l1ca``, ``galileo-e1b``, ``glonass-l1of``, ...)."""

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
    cn0_profile: Optional[str] = ...,
) -> dict[str, Any]:
    """Generate a multi-satellite GNSS IQ scene in memory.

    Returns a dict with the sampling (``fs_hz``, ``center_hz``, ``if_hz``), the complex
    samples as two float lists (``samples_i``, ``samples_q``) and the per-epoch ``truth``
    records. ``prns`` is the PRN per satellite (the FDMA frequency channel for GLONASS);
    ``dopplers`` is one Doppler (Hz) per PRN, a single value applied to all, or omitted for
    zero. Wrap ``samples_i``/``samples_q`` with ``numpy.asarray(...)`` for arrays.
    ``cn0_profile`` is a C/N0 profile file's text (TOML ``[[segment]]`` tables: ``step``,
    ``ramp``, ``points`` or ``fade`` offsets in dB per satellite); it scales the signals
    over any channel and the truth's ``cn0_dbhz`` follows it. Raises ``ValueError`` on an
    invalid scene or profile."""

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
) -> dict[str, Any]:
    """Generate a GNSS IQ scene from broadcast ephemeris.

    Places each healthy GPS satellite at its true broadcast geometry over a window, from a
    RINEX navigation message (``nav_text``) and a receiver position (``rx_lat``/``rx_lon``
    in degrees, ``rx_alt`` in metres). ``prns`` selects satellites (default all visible
    above ``mask_deg``); ``start_tow`` is the GPS time of week (s) the window begins. Returns
    the same shape as :func:`iq_scene` (``samples_i``/``samples_q`` plus per-epoch ``truth``
    carrying the real range, Doppler and code phase). Raises ``ValueError`` on an invalid
    navigation message or scene."""

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
) -> list[dict[str, Any]]:
    """FFT acquisition of each PRN over complex samples (``i``/``q`` sampled at ``fs_hz``).

    Returns a list of detection dicts (``code``, ``acquired``, ``doppler_hz``,
    ``code_phase_chips``, ``statistic``, ``threshold``, ``peak_ratio``, ...). Raises
    ``ValueError`` on a bad search (e.g. an unknown signal)."""

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
) -> dict[str, Any]:
    """The whole acquisition surface of one PRN (``kshana.acq-surface/1``).

    Returns ``{"header": ..., "rows": ...}``: ``rows[doppler_index][lag]`` is the normalised
    correlation power of the search (the cells ``iq_acquire`` compares with its threshold), and
    ``header`` holds the search, ``doppler_bins_hz``, the ``peak`` and two fine-Doppler
    refinements next to the coarse bin: ``parabolic`` (may be ``None``) and ``fine_search``. Raises
    ``ValueError`` on a bad search."""

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
    acq_noncoherent: Optional[int] = ...,
    doppler_max: Optional[float] = ...,
    max_seconds: Optional[float] = ...,
    design: Optional[str] = ...,
    design_name: Optional[str] = ...,
    reacquire: Optional[bool] = ...,
    extra_taps: Optional[list[float]] = ...,
    threads: int = ...,
) -> dict[str, Any]:
    """Acquire then track each PRN over complex samples.

    Returns a dict with ``fs_hz``, the resolved loop ``design`` (every field, with its
    ``hash``), the lock-state ``events``, any ``warnings`` (``commensurate_sampling`` when
    ``fs_hz`` is a multiple of half the chip rate: code-loop jitter and bias are then not
    representative) and one entry per channel (``code`` and a list of
    per-epoch dicts: ``doppler_hz``, ``code_phase_chips``, ``pli``, ``phase_lock``,
    ``cn0_nwpr_dbhz``, the early/prompt/late correlators, the discriminators, ``state``,
    ...). The loop design is ``design`` (a path to a ``kshana.loop-design/1`` TOML file,
    or its text; ``design_name`` picks one, the first by default) or the GPS-L1-C/A-like
    built-in default; any of ``pll_bw``, ``fll_bw``, ``dll_bw``, ``spacing``,
    ``coherent``, ``reacquire`` and the acquisition arguments overrides it.
    ``extra_taps`` (offsets in chips from the prompt, positive early) adds correlator taps:
    each epoch dict then has an ``extra`` list of ``offset_chips``/``i``/``q``. ``threads`` (default 1)
    runs the channels on that many threads; the result does not depend on it. The
    initialising acquisition integrates ``acq_coherent`` code periods coherently; the
    default ``None`` is the design's (auto: ≈4 ms coherent, 4 periods of an untiered 1 ms
    code such as GPS L1 C/A, 1 period of a code whose full, overlay-included period is
    4 ms or longer), and ``acq_coherent=1`` restores the 0.32 one-period search. Raises
    ``ValueError`` if a PRN is not acquired or the design is invalid."""

def iq_loop_designs(toml: str) -> list[dict[str, Any]]:
    """Parse a ``kshana.loop-design/1`` TOML text (or a path to one) and return its
    designs, resolved: a list of dicts with every field set, the ``name`` and the
    ``hash``. Raises ``ValueError`` on an invalid file."""

def iq_read_epochs(path: str) -> dict[str, Any]:
    """Read a binary tracking-epoch file (``kshana.track-epoch/1``, as ``kshana iq track
    --epochs <path>.bin`` writes it). Returns a dict with the ``header`` (schema, fields,
    channels with their code, design and design hash, sample rate, engine version) and the
    ``records``, one dict per epoch. Raises ``ValueError`` on a file that is not one."""

def iq_monitor(
    path: str,
    signal: Optional[str] = ...,
    prns: Optional[list[int]] = ...,
    power: bool = ...,
    spectral: bool = ...,
    settings: Optional[str] = ...,
    baseline: Optional[float] = ...,
    max_seconds: Optional[float] = ...,
    spacing: Optional[float] = ...,
    pll_bw: Optional[float] = ...,
    fll_bw: Optional[float] = ...,
    dll_bw: Optional[float] = ...,
    coherent: Optional[int] = ...,
    cn0_windows: Optional[int] = ...,
    doppler_max: Optional[float] = ...,
    periods_per_bit: Optional[int] = ...,
    format: Optional[str] = ...,
    rate: Optional[float] = ...,
    center_hz: Optional[float] = ...,
    if_hz: Optional[float] = ...,
    header_bytes: Optional[int] = ...,
) -> dict[str, Any]:
    """Run the IQ detection monitors over a recording file in one streaming pass.

    Returns a dict with ``series`` (``name``, ``unit``, ``channel``, ``t_s``, ``value``),
    ``events`` (``kind``, ``channel``, ``t_start_s``, ``t_alarm_s``, ``t_end_s``,
    ``peak``, ``threshold``), ``spectra`` and ``notes``. Mirrors ``kshana iq monitor``:
    ``power`` / ``spectral`` pick the pre-correlation monitors (both when neither is set),
    ``settings`` is TOML or JSON monitor-settings text, and ``signal`` + ``prns`` add
    tracked channels with C/N0, SQM and lock monitors. Raw files without a sidecar take
    ``format`` and ``rate``. Raises ``ValueError`` on a bad argument or unreadable file."""

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
) -> dict[str, Any]:
    """Run the receiver front-end chain over complex samples (``i``/``q`` at ``fs_hz``).

    Applies, in order, a band-pass FIR (``bandpass_lo``/``bandpass_hi``), an adaptive notch
    (``notch``), pulse blanking (``blank``), frequency-domain excision (``excise``), AGC
    (``agc``) and a quantiser (``bits`` of 1/2/3/8/14, auto-AGC'd unless ``no_agc``). Returns
    a dict with the filtered ``samples_i``/``samples_q``. Raises ``ValueError`` on an invalid
    configuration (e.g. only one of the band-pass edges)."""

def iq_test_conditions(conditions: str) -> dict[str, Any]:
    """Validate a lab test-condition file (``kshana.test-conditions/1``, TOML or JSON)
    given as a path or as text.

    Returns the resolved conditions as a dict, with the condition hash under ``hash``.
    Raises ``ValueError`` on an invalid file."""

def iq_campaign(
    campaign: str,
    out_dir: str,
    workers: int = 0,
    resume: bool = True,
    max_cells: Optional[int] = None,
    dry_run: bool = False,
) -> dict[str, Any]:
    """Run a lab-replay campaign (``kshana.campaign/1``, a path or TOML text; relative
    paths in text resolve against the working directory) into ``out_dir``, as
    ``kshana iq campaign`` does.

    Cells already done are skipped unless ``resume`` is false; ``max_cells`` bounds how
    many pending cells run now; ``dry_run`` only plans. Returns the run summary (cell
    counts, failures, and the ``digest`` once every cell is done). Raises ``ValueError`` on
    an invalid campaign and ``RuntimeError`` when the run cannot proceed."""

def iq_campaign_report(out_dir: str) -> dict[str, Any]:
    """Rebuild a campaign's scorecards, HTML report and digest from the cells in
    ``out_dir``.

    Returns the cell and row counts, the rows failing a bar and the ``digest`` (None until
    every cell is done). Raises ``RuntimeError`` when ``out_dir`` holds no campaign."""

def iq_labfit(toml: str) -> dict[str, Any]:
    """Fit the tracking-loop loss-of-lock model to a receiver-trust timeline described by
    an ``iq-labfit`` TOML scenario.

    Returns a dict with the parsed ``report``, the ``residuals_csv`` and
    ``predictions_csv`` tables and the ``markdown``. Relative log paths resolve against the
    working directory. Raises ``ValueError`` on an invalid scenario or unreadable log."""
