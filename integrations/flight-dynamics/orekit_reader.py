# SPDX-License-Identifier: AGPL-3.0-only
"""Orekit adapter for the flight-dynamics reference integration (roadmap C7).

Loads a Kshana OEM or OPM into Orekit (through orekit_jpype, the Orekit project's Python wrapper)
with Orekit's own CCSDS parsers, and returns the states and epochs as Orekit holds them: positions
in metres, velocities in metres per second, dates as Orekit `AbsoluteDate`s compared with the
written TDB labels. Orekit does not read SPK kernels; the SPK goes to the SPICE-based tools.

Orekit data (the frames, time scales and planetary ephemerides the parsers need for an ICRF frame
centred on the Moon) is the orekit-data repository at a pinned commit, fetched once into a cache
directory, or the directory or zip named by OREKIT_DATA.
"""
from __future__ import annotations

import os
import urllib.request
from pathlib import Path

#: orekit-data at a fixed commit ("Updated to November 2026"), so a run reads the same data.
OREKIT_DATA_COMMIT = "2d6edc9118983d95c51303df05db16ada90b7ee2"
OREKIT_DATA_URL = (
    "https://gitlab.orekit.org/orekit/orekit-data/-/archive/{c}/orekit-data-{c}.zip"
)

_vm = None


def orekit_data() -> Path:
    """The orekit-data zip or directory: OREKIT_DATA, or the pinned commit downloaded once into
    ~/.cache/kshana-fd (or KSHANA_FD_CACHE)."""
    given = os.environ.get("OREKIT_DATA")
    if given:
        return Path(given)
    cache = Path(os.environ.get("KSHANA_FD_CACHE", Path.home() / ".cache" / "kshana-fd"))
    cache.mkdir(parents=True, exist_ok=True)
    z = cache / f"orekit-data-{OREKIT_DATA_COMMIT}.zip"
    if not z.exists():
        tmp = z.with_suffix(".part")
        with urllib.request.urlopen(OREKIT_DATA_URL.format(c=OREKIT_DATA_COMMIT)) as r:
            tmp.write_bytes(r.read())
        tmp.rename(z)
    return z


def start() -> None:
    """Start the JVM and load the Orekit data (once)."""
    global _vm
    if _vm is not None:
        return
    import orekit_jpype

    _vm = orekit_jpype.initVM()
    from orekit_jpype.pyhelpers import setup_orekit_data

    data = orekit_data()
    if data.is_dir():
        setup_orekit_data(dirs=str(data), from_pip_library=False)
    else:
        setup_orekit_data(filenames=str(data), from_pip_library=False)


def version() -> str:
    """The orekit_jpype release, which names the Orekit release it wraps (13.1.9.0: Orekit 13.1.9)."""
    from importlib.metadata import version as v

    return v("orekit_jpype")


def _dates_equal(dates, labels) -> list[bool]:
    from org.orekit.time import AbsoluteDate, TimeScalesFactory

    tdb = TimeScalesFactory.getTDB()
    return [d.durationFrom(AbsoluteDate(lab, tdb)) == 0.0 for d, lab in zip(dates, labels)]


def read_oem(path: str | os.PathLike, labels: list[str]):
    """Parse an OEM with Orekit's `OemParser`. Returns (states in m and m/s, epoch checks against
    `labels`, metadata as Orekit read it)."""
    start()
    from org.orekit.data import DataSource
    from org.orekit.files.ccsds.ndm import ParserBuilder

    oem = ParserBuilder().buildOemParser().parseMessage(DataSource(str(path)))
    seg = oem.getSegments().get(0)
    md = seg.getMetadata()
    states, dates = [], []
    for line in seg.getData().getEphemeridesDataLines():
        p, v = line.getPosition(), line.getVelocity()
        states.append([p.getX(), p.getY(), p.getZ(), v.getX(), v.getY(), v.getZ()])
        dates.append(line.getDate())
    meta = {
        "object": str(md.getObjectName()),
        "center": str(md.getCenter().getName()),
        "frame": str(md.getReferenceFrame().getName()),
        "time_system": str(md.getTimeSystem()),
    }
    return states, _dates_equal(dates, labels), meta


def read_opm(path: str | os.PathLike, labels: list[str]):
    """Parse an OPM with Orekit's `OpmParser`. Returns (the state in m and m/s, the epoch check)."""
    start()
    from org.orekit.data import DataSource
    from org.orekit.files.ccsds.ndm import ParserBuilder

    opm = ParserBuilder().buildOpmParser().parseMessage(DataSource(str(path)))
    pv = opm.getData().getStateVectorBlock().toTimeStampedPVCoordinates()
    p, v = pv.getPosition(), pv.getVelocity()
    state = [p.getX(), p.getY(), p.getZ(), v.getX(), v.getY(), v.getZ()]
    return [state], _dates_equal([pv.getDate()], labels)
