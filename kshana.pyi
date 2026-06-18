# SPDX-License-Identifier: AGPL-3.0-only
"""Type stubs for the Kshana Python bindings (PyO3 / maturin).

Kshana is an open hybrid quantum/classical PNT performance simulator. The Python
surface runs a TOML scenario string and returns the result document; see
docs/PYTHON_API.md for a quickstart.
"""
from typing import Any, Optional

__version__: str

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
    def data(self) -> dict[str, Any]:
        """The result document parsed into a dict (figures of merit, time series,
        provenance, ...). Wrap numeric lists with ``numpy.asarray(...)`` for arrays."""
    def __repr__(self) -> str: ...

def run(toml: str) -> str:
    """Run a scenario (TOML string); return the result document as JSON. Raises
    ``ValueError`` if the scenario is invalid."""

def run_full(toml: str) -> tuple[str, str, str]:
    """Run a scenario; return ``(json, svg, summary)``."""

def run_typed(toml: str) -> RunOutput:
    """Run a scenario; return a typed :class:`RunOutput` with ``.json``/``.svg``/
    ``.summary``/``.data()``. Raises ``ValueError`` if invalid."""

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
