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

def scenario_kinds() -> list[dict[str, Any]]:
    """The available scenario kinds and their metadata (name, description, required
    and optional fields)."""

def validate_toml(toml: str) -> list[str]:
    """Validate a scenario TOML string without raising: a list of error messages,
    empty if valid. Executes the scenario, so it surfaces parse, config, and
    runtime errors."""

def list_kinds() -> str:
    """The scenario kinds and metadata as a JSON-array string (see
    :func:`scenario_kinds` for the parsed form)."""

def error_kind(toml: str) -> Optional[str]:
    """Run a scenario; on failure return the structured error *kind* tag
    (``invalid_input``/``non_convergence``/``unsupported``/``io_error``) instead of
    raising. Returns ``None`` on success."""

def version() -> str:
    """The engine version (the crate version)."""
