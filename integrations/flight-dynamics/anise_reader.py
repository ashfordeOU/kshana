# SPDX-License-Identifier: AGPL-3.0-only
"""ANISE adapter for the flight-dynamics reference integration (roadmap C7; the fourth, file-based
tool, named in docs/design/evidence/c7-flight-dynamics-adapters/NAMING.md).

ANISE reads SPICE kernels with its own reader (not the SPICE Toolkit) and converts a CCSDS OEM to
an SPK of its own. Its Python API evaluates a kernel (`spk_ezr`); it does not hand back the stored
records. So this adapter evaluates the kernel at every node epoch:

- the SPK Kshana wrote, at the node epochs as SPICE ephemeris time (`Epoch.init_from_et_seconds`):
  SPK epochs are ET;
- the OEM Kshana wrote, which ANISE converts to an SPK (type 9 in ANISE 0.10.6), at the node
  epochs as TDB (`Epoch.init_from_tdb_seconds`): ANISE reads the OEM's `TIME_SYSTEM = TDB` labels
  with hifitime's TDB model, which differs from SPICE's ET by a few microseconds.

Evaluating the SPK at the TDB epochs instead of the ET ones moves every state by up to 3.5e-6 km on
the CAPSTONE trajectory. That is a time-scale mismatch, not a reading error.
"""
from __future__ import annotations

import os


def version() -> str:
    """The ANISE release."""
    from importlib.metadata import version as v

    return v("anise")


def _summary(alm, target: int) -> dict:
    s = alm.spk_summaries(target)[0]
    call = lambda x: x() if callable(x) else x  # noqa: E731
    return {
        "type": str(call(s.datatype)),
        "frame": str(call(s.center_frame)),
        "start": call(s.start_epoch),
        "end": call(s.end_epoch),
    }


def _evaluate(alm, target: int, centre: int, epochs) -> list[list[float]]:
    out = []
    for ep in epochs:
        o = alm.spk_ezr(target, ep, 1, centre)
        out.append([o.x_km, o.y_km, o.z_km, o.vx_km_s, o.vy_km_s, o.vz_km_s])
    return out


def read_spk(path: str | os.PathLike, ets: list[float], target: int = -1176, centre: int = 301):
    """Load an SPK into an ANISE `Almanac` and evaluate it at `ets` (TDB seconds past J2000, as
    SPICE ephemeris time). Returns (summary, states, the segment's first and last epochs as ET)."""
    from anise import Almanac
    from anise.time import Epoch

    alm = Almanac(str(path))
    summ = _summary(alm, target)
    states = _evaluate(alm, target, centre, [Epoch.init_from_et_seconds(e) for e in ets])
    return summ, states, (summ["start"].to_et_seconds(), summ["end"].to_et_seconds())


def read_oem(path: str | os.PathLike, tdbs: list[float], target: int = -1176, centre: int = 301):
    """Convert an OEM with ANISE (`Almanac.from_ccsds_oem_file`) and evaluate it at `tdbs` (TDB
    seconds past J2000 of the written labels, on hifitime's TDB). Returns (summary, states, the
    segment's first and last epochs as TDB seconds)."""
    from anise import Almanac
    from anise.time import Epoch

    alm = Almanac.from_ccsds_oem_file(str(path), target)
    summ = _summary(alm, target)
    states = _evaluate(alm, target, centre, [Epoch.init_from_tdb_seconds(t) for t in tdbs])
    return summ, states, (summ["start"].to_tdb_seconds(), summ["end"].to_tdb_seconds())
