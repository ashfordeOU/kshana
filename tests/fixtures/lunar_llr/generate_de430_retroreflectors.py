#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate ``de430_retroreflectors_mer.csv`` from its published source.

Source
------
J. G. Williams, D. H. Boggs and W. M. Folkner, *DE430 Lunar Orbit, Physical
Librations, and Surface Coordinates*, JPL IOM 335-JW,DB,WF-20130722-016,
22 July 2013, published by NASA/JPL NAIF at

    https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430_moon_coord.pdf

Table 7 of that memorandum gives the five lunar laser retroreflector array
coordinates in a frame based on the **mean Earth / mean rotation axes** and the
centre of mass -- the MER (a.k.a. ME) frame, which is the frame the IAU/WGCCRE
lunar rotation model this repository implements
(``kshana::lunar_frame::icrf_to_iau_moon``) realises.  Those five arrays are
exactly the five targets the ILRS lunar normal-point archive carries.

Discipline
----------
This script never emits a number it did not read out of the hash-verified
document.  It

1. downloads the PDF,
2. refuses to continue unless its SHA-256 equals ``SOURCE_SHA256`` below,
3. extracts the text layer with ``pdftotext -layout`` (poppler),
4. locates the *Table 7* caption and requires its full published wording, so a
   future edition that renumbers the tables aborts rather than silently
   emitting Table 6 (the principal-axis frame) in its place,
5. parses the five rows with a strict regex and requires all five array names,
6. re-derives longitude/latitude/radius from the published X/Y/Z and refuses to
   write if the round trip disagrees with the published columns by more than
   the last printed digit -- a transcription check that uses the document
   against itself.

Run ``python3 generate_de430_retroreflectors.py`` from this directory.
"""

from __future__ import annotations

import hashlib
import math
import re
import subprocess
import sys
import tempfile
import urllib.request
from pathlib import Path

SOURCE_URL = (
    "https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430_moon_coord.pdf"
)
SOURCE_SHA256 = "98fb33fb0a13da9087ce180c8f3868464d03e357ee07309ed407e62ec3d04d0f"
RETRIEVED = "2026-09-20"

OUT = Path(__file__).resolve().parent / "de430_retroreflectors_mer.csv"

# The caption must match in full: Table 6 carries the *principal axis* frame and
# would otherwise parse identically.
TABLE7_CAPTION = (
    "Table 7. Lunar laser retroreflector array coordinates using a frame based on "
    "mean Earth/mean"
)

# The five arrays, with the ILRS archive directory name each corresponds to.
# The mapping is a naming fact about the ILRS archive, not a measurement:
# https://edc.dgfi.tum.de/pub/slr/data/npt_crd/ carries apollo11, apollo14,
# apollo15, luna17 (the Lunokhod 1 rover) and luna21 (the Lunokhod 2 rover).
ARRAYS = [
    ("Apollo 11", "apollo11"),
    ("Apollo 14", "apollo14"),
    ("Apollo 15", "apollo15"),
    ("Lunokhod 1", "luna17"),
    ("Lunokhod 2", "luna21"),
]

ROW = re.compile(
    r"^(?P<name>Apollo 11|Apollo 14|Apollo 15|Lunokhod 1|Lunokhod 2)\s+"
    r"(?P<x>-?\d+\.\d+)\s+(?P<y>-?\d+\.\d+)\s+(?P<z>-?\d+\.\d+)\s+"
    r"(?P<r>-?\d+\.\d+)\s+(?P<lon>-?\d+\.\d+)\s+(?P<lat>-?\d+\.\d+)\s*$"
)


def die(msg: str) -> None:
    sys.exit(f"REFUSING to write {OUT.name}: {msg}")


def fetch(path: Path) -> None:
    with urllib.request.urlopen(SOURCE_URL, timeout=120) as r:
        path.write_bytes(r.read())
    got = hashlib.sha256(path.read_bytes()).hexdigest()
    if got != SOURCE_SHA256:
        die(
            f"the source document at {SOURCE_URL} has SHA-256 {got}, not the "
            f"recorded {SOURCE_SHA256}. The upstream document changed; re-read it "
            f"before trusting any number extracted from it."
        )


def text_of(pdf: Path) -> str:
    try:
        out = subprocess.run(
            ["pdftotext", "-layout", str(pdf), "-"],
            check=True,
            capture_output=True,
        )
    except FileNotFoundError:
        die("pdftotext (poppler) is not installed; cannot read the source document")
    except subprocess.CalledProcessError as e:  # pragma: no cover - tool failure
        die(f"pdftotext failed: {e.stderr.decode(errors='replace')[:400]}")
    return out.stdout.decode("utf-8", errors="replace")


def main() -> None:
    with tempfile.TemporaryDirectory() as td:
        pdf = Path(td) / "de430_moon_coord.pdf"
        fetch(pdf)
        text = text_of(pdf)

    if TABLE7_CAPTION not in text:
        die(
            "the Table 7 caption is not present verbatim; the document has been "
            "renumbered or reformatted and the rows below it can no longer be "
            "assumed to be the mean-Earth/mean-rotation frame"
        )
    tail = text.split(TABLE7_CAPTION, 1)[1]

    rows = {}
    for line in tail.splitlines():
        m = ROW.match(line.strip())
        if m:
            rows[m.group("name")] = m
        if len(rows) == len(ARRAYS):
            break

    missing = [n for n, _ in ARRAYS if n not in rows]
    if missing:
        die(f"Table 7 rows not found for {missing}")

    lines = [
        "# format: kshana-lunar-retroreflectors v1",
        f"# source: Williams, Boggs & Folkner, 'DE430 Lunar Orbit, Physical Librations,",
        "#   and Surface Coordinates', JPL IOM 335-JW,DB,WF-20130722-016, 22 July 2013,",
        "#   Table 7 (mean Earth / mean rotation axis frame, centre of mass)",
        f"# url: {SOURCE_URL}",
        f"# retrieved: {RETRIEVED}",
        f"# source_sha256: {SOURCE_SHA256}",
        "# frame: MER (mean Earth / mean rotation axes), Moon centre of mass",
        "# note: the constant tidal displacements of the source's Table 8 are NOT",
        "#   included in these coordinates, exactly as the source states.",
        "# note: the source states the MER rotation is uncertain by 0.2 arcsec (1.7 m on",
        "#   the equator) and the PA coordinates by 0.12-0.27 m.",
        "# generator: generate_de430_retroreflectors.py",
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
        # The published columns carry 3 decimals of metres and 7 of degrees, so a
        # correct transcription round-trips to within half of the last digit plus
        # the rounding of the inputs. 0.01 m / 1e-6 deg is generous but still
        # catches a swapped or mistyped column.
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
