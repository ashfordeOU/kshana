#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate ``de430_retroreflectors_pa.csv`` from its published source.

This is the **principal-axis** companion to ``generate_de430_retroreflectors.py``.
Both read the *same* hash-verified document; that script takes Table 7, this one
takes Table 6.

Why a second catalogue exists
-----------------------------
A lunar surface point has two standard Cartesian realisations and they are not
the same numbers:

* **MER** -- mean Earth / mean rotation axes (Table 7).  This is what
  ``kshana::lunar_frame::icrf_to_iau_moon`` realises, and it is what the
  ``lunar-llr-datum`` scenario reads.
* **PA** -- principal axes (Table 6).  This is what a PA-frame rotation such as
  ``kshana::lunar_frame::icrf_to_moon_pa`` expects to be handed, and the frame
  the GRAIL gravity fields are defined in.

They differ by about 800 m at the lunar surface while the geocentric radii agree
to a millimetre, so every "is this a plausible lunar radius" check passes on
either file.  Handing one to the other's rotation is therefore a silent
sub-kilometre systematic.  Keeping the two frames in two separate, separately
named files is what makes that mistake visible.

Which table is primary
----------------------
The source is explicit that the PA coordinates are the solved product and the
MER coordinates are derived from them (p. 13):

    "leading to DE430.  These PA coordinates are given in Table 6.  Equation (4)
     was used to rotate the LLR principal axis array coordinates of Table 6 to
     the mean Earth/mean rotation axis frame.  These MER coordinates are given
     in Table 7."

So Table 6 is not a convenience transform of Table 7; it is the other way round.

Discipline
----------
Identical to the MER generator, and deliberately sharing its code so there is
exactly one copy of the URL, the SHA-256 pin, the retrieval date, the array list,
the row regex and the fetch/extract helpers.  This script

1. imports those from ``generate_de430_retroreflectors``,
2. locates the *Table 6* caption and requires its full published wording, so a
   future edition that renumbers the tables aborts rather than silently emitting
   Table 7 (the mean-Earth frame) in its place -- the exact mirror of the guard
   the MER generator carries,
3. parses the five rows with the shared strict regex and requires all five array
   names,
4. re-derives longitude/latitude/radius from the published X/Y/Z and refuses to
   write if the round trip disagrees with the published columns -- the document
   checked against itself,
5. additionally refuses to write if the rows it extracted are the MER rows, by
   comparing against the committed MER catalogue: the two tables have identical
   R columns and near-identical X/Y/Z, so a caption match alone is not proof the
   right block was read.

Run ``python3 generate_de430_retroreflectors_pa.py`` from this directory.
"""

from __future__ import annotations

import hashlib
import math
import sys
import tempfile
from pathlib import Path

from generate_de430_retroreflectors import (
    ARRAYS,
    RETRIEVED,
    ROW,
    SOURCE_SHA256,
    SOURCE_URL,
    fetch,
    text_of,
)

HERE = Path(__file__).resolve().parent
OUT = HERE / "de430_retroreflectors_pa.csv"
MER = HERE / "de430_retroreflectors_mer.csv"

# The caption must match in full: Table 7 carries the *mean Earth* frame and
# would otherwise parse identically.  This is the mirror image of the guard in
# the MER generator.
TABLE6_CAPTION = (
    "Table 6. Lunar laser retroreflector array coordinates using a frame based on "
    "principal axes and"
)

# Smallest PA-MER separation across the five arrays is ~672 m (Lunokhod 2).  If
# every array we extracted sits closer than this to its MER twin we did not read
# Table 6, whatever the caption said.
MIN_PA_MER_SEPARATION_M = 300.0


def die(msg: str) -> None:
    sys.exit(f"REFUSING to write {OUT.name}: {msg}")


def committed_mer() -> dict[str, tuple[float, float, float]]:
    """The committed MER catalogue, as {array: (x, y, z)}; {} if absent."""
    if not MER.exists():
        return {}
    out: dict[str, tuple[float, float, float]] = {}
    for line in MER.read_text(encoding="utf-8").splitlines():
        if line.startswith("#") or not line.strip():
            continue
        f = line.split(",")
        if f[0] == "array":
            continue
        out[f[0]] = (float(f[2]), float(f[3]), float(f[4]))
    return out


def main() -> None:
    with tempfile.TemporaryDirectory() as td:
        pdf = Path(td) / "de430_moon_coord.pdf"
        fetch(pdf)
        text = text_of(pdf)

    if TABLE6_CAPTION not in text:
        die(
            "the Table 6 caption is not present verbatim; the document has been "
            "renumbered or reformatted and the rows below it can no longer be "
            "assumed to be the principal-axis frame"
        )
    tail = text.split(TABLE6_CAPTION, 1)[1]

    rows = {}
    for line in tail.splitlines():
        m = ROW.match(line.strip())
        if m:
            rows[m.group("name")] = m
        if len(rows) == len(ARRAYS):
            break

    missing = [n for n, _ in ARRAYS if n not in rows]
    if missing:
        die(f"Table 6 rows not found for {missing}")

    # Guard against having read Table 7 anyway.  The two tables are numerically
    # close and share an identical R column, so this compares against the
    # committed MER file rather than trusting the caption split alone.
    mer = committed_mer()
    if mer:
        seps = []
        for name, _ in ARRAYS:
            if name not in mer:
                die(f"the committed MER catalogue has no row for {name}")
            m = rows[name]
            x, y, z = (float(m.group(k)) for k in ("x", "y", "z"))
            mx, my, mz = mer[name]
            seps.append(math.dist((x, y, z), (mx, my, mz)))
        if max(seps) < MIN_PA_MER_SEPARATION_M:
            die(
                f"every extracted row sits within {max(seps):.1f} m of its "
                f"mean-Earth twin, but the principal-axis rows are 672-871 m away "
                f"from theirs. Table 7 was almost certainly read instead of Table 6."
            )

    lines = [
        "# format: kshana-lunar-retroreflectors v1",
        "# source: Williams, Boggs & Folkner, 'DE430 Lunar Orbit, Physical Librations,",
        "#   and Surface Coordinates', JPL IOM 335-JW,DB,WF-20130722-016, 22 July 2013,",
        "#   Table 6 (principal axis frame, centre of mass)",
        f"# url: {SOURCE_URL}",
        f"# retrieved: {RETRIEVED}",
        f"# source_sha256: {SOURCE_SHA256}",
        "# frame: PA (principal axes), Moon centre of mass",
        "# note: these are the SOLVED coordinates. The source states that the mean",
        "#   Earth / mean rotation coordinates of its Table 7 were obtained FROM these",
        "#   by its Equation (4), not the other way round.",
        "# note: PA and MER differ by 672-871 m at these five arrays while the",
        "#   geocentric radii agree to 1 mm. Never hand this file to a mean-Earth",
        "#   rotation, or the other file to a principal-axis one.",
        "# note: the constant tidal displacements of the source's Table 8 are NOT",
        "#   included in these coordinates, exactly as the source states.",
        "# note: the source states the principal-axis coordinates are uncertain by",
        "#   0.12-0.27 m.",
        "# note: this is the DE430 PA realisation. DE421 and DE440 realise the",
        "#   principal-axis frame differently at the ~1-2 m level (the DE421 ME-PA",
        "#   offset is 67.92 arcsec about z; this document states 67.731 arcsec for",
        "#   DE430). Pair these coordinates only with a rotation whose realisation is",
        "#   declared, and declare the residual offset.",
        "# generator: generate_de430_retroreflectors_pa.py",
        "array,ilrs_target,x_m,y_m,z_m,radius_m,east_lon_deg,lat_deg",
    ]

    for name, target in ARRAYS:
        m = rows[name]
        x, y, z = (float(m.group(k)) for k in ("x", "y", "z"))
        r_pub = float(m.group("r"))
        lon_pub = float(m.group("lon"))
        lat_pub = float(m.group("lat"))

        r = math.sqrt(x * x + y * y + z * z)
        lon = math.degrees(math.atan2(y, x))
        lat = math.degrees(math.asin(z / r))
        if abs(r - r_pub) > 0.01:
            die(f"{name}: |r| from XYZ is {r:.3f} m but the table prints {r_pub:.3f} m")
        if abs(lon - lon_pub) > 1e-6:
            die(f"{name}: longitude from XYZ is {lon:.7f} deg, table prints {lon_pub:.7f}")
        if abs(lat - lat_pub) > 1e-6:
            die(f"{name}: latitude from XYZ is {lat:.7f} deg, table prints {lat_pub:.7f}")

        lines.append(
            f"{name},{target},{m.group('x')},{m.group('y')},{m.group('z')},"
            f"{m.group('r')},{m.group('lon')},{m.group('lat')}"
        )

    OUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    digest = hashlib.sha256(OUT.read_bytes()).hexdigest()
    print(f"wrote {OUT} ({OUT.stat().st_size} bytes)\nsha256: {digest}")


if __name__ == "__main__":
    main()
