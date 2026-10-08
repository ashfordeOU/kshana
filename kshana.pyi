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
    "iq_scene",
    "iq_scene_broadcast",
    "iq_acquire",
    "iq_acq_surface",
    "iq_track",
    "iq_loop_designs",
    "iq_read_epochs",
    "iq_frontend",
    "iq_labfit",
    "iq_signals",
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

    Returns the result document, the per-epoch trust CSV, the chart and a summary.
    Raises ``ValueError`` on an invalid scenario or an unreadable log."""
    ...

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
) -> dict[str, Any]:
    """Generate a multi-satellite GNSS IQ scene in memory.

    Returns a dict with the sampling (``fs_hz``, ``center_hz``, ``if_hz``), the complex
    samples as two float lists (``samples_i``, ``samples_q``) and the per-epoch ``truth``
    records. ``prns`` is the PRN per satellite (the FDMA frequency channel for GLONASS);
    ``dopplers`` is one Doppler (Hz) per PRN, a single value applied to all, or omitted for
    zero. Wrap ``samples_i``/``samples_q`` with ``numpy.asarray(...)`` for arrays. Raises
    ``ValueError`` on an invalid scene."""

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
    ``coherent``, ``reacquire`` and the acquisition arguments overrides it. The
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

def iq_labfit(toml: str) -> dict[str, Any]:
    """Fit the tracking-loop loss-of-lock model to a receiver-trust timeline described by
    an ``iq-labfit`` TOML scenario.

    Returns a dict with the parsed ``report``, the ``residuals_csv`` and
    ``predictions_csv`` tables and the ``markdown``. Relative log paths resolve against the
    working directory. Raises ``ValueError`` on an invalid scenario or unreadable log."""
