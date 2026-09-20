#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate ``horizons_moon_geocentric_2015.csv`` — an independent Moon ephemeris.

Why this file exists
--------------------
The lunar laser ranging chain in ``kshana::lunar_llr`` reports an
observed-minus-computed one-way range residual of order 10^5 m, and attributes it
to the engine's Moon-centre position (``kshana::ephem::moon_position``, the
Montenbruck & Gill low-precision analytic series).  That attribution must be
checkable without believing it: this fixture is NASA/JPL's own evaluation of its
planetary ephemeris over the same span, so the same claim can be tested a second
way, against a source that knows nothing about laser ranging normal points.

Source
------
JPL Horizons (NASA/JPL Solar System Dynamics), ``https://ssd.jpl.nasa.gov/api/horizons.api``
with ``COMMAND='301'`` (Moon), ``CENTER='500@399'`` (Earth centre),
``EPHEM_TYPE='VECTORS'``, ``VEC_TABLE='1'``, ``REF_PLANE='FRAME'``,
``REF_SYSTEM='ICRF'``, ``OUT_UNITS='KM-S'``, epochs given as a TT Julian-date list.
Geometric states: no light time, no aberration.  The same service, frame and
convention ``tests/fixtures/lunar_ephemeris/`` already uses.

Discipline
----------
Horizons has no stable document hash to pin -- it is a service, not a file -- so
the check is structural instead: the script requires the ``$$SOE``/``$$EOE``
block, requires exactly one state per requested epoch, requires each returned
epoch to equal the requested one, and requires every geocentric distance to fall
inside the real lunar perigee/apogee envelope.  It writes nothing if any of that
fails.  The committed file records the query and the retrieval date, and carries
its own SHA-256 in ``NOTICE.md``.

Run ``python3 fetch_horizons_moon.py`` from this directory.
"""

from __future__ import annotations

import hashlib
import math
import re
import sys
import urllib.parse
import urllib.request
from pathlib import Path

API = "https://ssd.jpl.nasa.gov/api/horizons.api"
RETRIEVED = "2026-09-20"
OUT = Path(__file__).resolve().parent / "horizons_moon_geocentric_2015.csv"

# One epoch a week across the committed normal-point slice (2015-04-08 .. 2015-06-27).
EPOCHS = [2457120.5 + 7.0 * k for k in range(12)]

PERIGEE_KM, APOGEE_KM = 356_000.0, 407_000.0

STATE = re.compile(
    r"^\s*X\s*=\s*(?P<x>[-+.\dEe]+)\s+Y\s*=\s*(?P<y>[-+.\dEe]+)\s+Z\s*=\s*(?P<z>[-+.\dEe]+)"
)
EPOCH = re.compile(r"^\s*(?P<jd>\d+\.\d+)\s*=\s*A\.D\.")


def die(msg: str) -> None:
    sys.exit(f"REFUSING to write {OUT.name}: {msg}")


def main() -> None:
    q = {
        "format": "text",
        "COMMAND": "'301'",
        "CENTER": "'500@399'",
        "EPHEM_TYPE": "'VECTORS'",
        "VEC_TABLE": "'1'",
        "REF_PLANE": "'FRAME'",
        "REF_SYSTEM": "'ICRF'",
        "OUT_UNITS": "'KM-S'",
        "TLIST_TYPE": "'JD'",
        "TIME_TYPE": "'TT'",
        "TLIST": "'" + ",".join(f"{e:.1f}" for e in EPOCHS) + "'",
    }
    url = API + "?" + urllib.parse.urlencode(q)
    with urllib.request.urlopen(url, timeout=120) as r:
        text = r.read().decode("utf-8", errors="replace")

    if "$$SOE" not in text or "$$EOE" not in text:
        die("the Horizons reply carries no $$SOE/$$EOE ephemeris block")
    body = text.split("$$SOE", 1)[1].split("$$EOE", 1)[0]

    rows = []
    pending_jd = None
    for line in body.splitlines():
        m = EPOCH.match(line)
        if m:
            pending_jd = float(m.group("jd"))
            continue
        m = STATE.match(line)
        if m and pending_jd is not None:
            rows.append((pending_jd, float(m.group("x")), float(m.group("y")), float(m.group("z"))))
            pending_jd = None

    if len(rows) != len(EPOCHS):
        die(f"expected {len(EPOCHS)} states, parsed {len(rows)}")
    for (jd, x, y, z), want in zip(rows, EPOCHS):
        if abs(jd - want) > 1e-6:
            die(f"Horizons returned epoch {jd} where {want} was requested")
        d = math.sqrt(x * x + y * y + z * z)
        if not (PERIGEE_KM <= d <= APOGEE_KM):
            die(f"geocentric distance {d:.1f} km at JD {jd} is outside the lunar envelope")

    out = [
        "# format: kshana-horizons-moon v1",
        "# source: JPL Horizons (NASA/JPL Solar System Dynamics), geometric geocentric",
        "#   Moon state vectors",
        f"# url: {API}",
        "# query: COMMAND='301' CENTER='500@399' EPHEM_TYPE='VECTORS' VEC_TABLE='1'",
        "#   REF_PLANE='FRAME' REF_SYSTEM='ICRF' OUT_UNITS='KM-S' TIME_TYPE='TT'",
        f"# retrieved: {RETRIEVED}",
        "# frame: ICRF, Earth centre, geometric (no light time, no aberration)",
        "# generator: fetch_horizons_moon.py",
        "jd_tt,x_km,y_km,z_km",
    ]
    for jd, x, y, z in rows:
        out.append(f"{jd:.1f},{x!r},{y!r},{z!r}")

    OUT.write_text("\n".join(out) + "\n", encoding="utf-8")
    print(
        f"wrote {OUT} ({OUT.stat().st_size} bytes)\n"
        f"sha256: {hashlib.sha256(OUT.read_bytes()).hexdigest()}"
    )


if __name__ == "__main__":
    main()
