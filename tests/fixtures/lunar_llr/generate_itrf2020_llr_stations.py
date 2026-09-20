#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate ``itrf2020_llr_stations.csv`` from the published ITRF2020 SLR solution.

Source
------
IERS ITRF2020, SLR station positions and velocities, published by the ITRF
Product Centre (IGN, France):

    https://itrf.ign.fr/ftp/pub/itrf/itrf2020/ITRF2020_SLR.SSC.txt

Positions are given at epoch **2015.0** with linear velocities in m/y, in
ITRF2020.

What is sliced
--------------
Only the stations that actually appear in the committed lunar normal-point
files and that ITRF2020 SLR carries:

* ``7845`` Grasse (OCA) MeO, France -- DOMES 10002S002
* ``7941`` Matera (MLRO), Italy     -- DOMES 12734S008

Apache Point (ILRS code ``7045``, CRD station name ``APOL``) also appears in
those normal-point files and is deliberately **not** here: it is a lunar-only
station and ITRF2020 SLR does not carry it.  Rather than substitute a
lower-grade coordinate, the engine skips every normal point from a station it
has no ITRF position for and reports the count it skipped.

Discipline
----------
The script downloads the solution, refuses to continue unless its SHA-256
matches ``SOURCE_SHA256``, requires the header line that states the position
epoch (so a future release at a different epoch aborts instead of silently
shifting every coordinate by a decade of plate motion), and requires exactly
one position/velocity pair per requested station id.  It emits nothing at all
if any of that fails.

Run ``python3 generate_itrf2020_llr_stations.py`` from this directory.
"""

from __future__ import annotations

import hashlib
import re
import sys
import urllib.request
from pathlib import Path

SOURCE_URL = "https://itrf.ign.fr/ftp/pub/itrf/itrf2020/ITRF2020_SLR.SSC.txt"
SOURCE_SHA256 = "d0f7afc0111eec3ccb292c496884d98c8aeafade44abdc7a475735f546809b4d"
RETRIEVED = "2026-09-20"

OUT = Path(__file__).resolve().parent / "itrf2020_llr_stations.csv"

EPOCH_HEADER = "ITRF2020 STATION POSITIONS AT EPOCH 2015.0 AND VELOCITIES"
POSITION_EPOCH_YEAR = 2015.0

# ILRS four-character CRD station name -> (ILRS numeric id, DOMES number).
WANTED = [
    ("GRSM", "7845", "10002S002"),
    ("MATM", "7941", "12734S008"),
]

POS = re.compile(
    r"^(?P<domes>\w{9})\s+(?P<name>.+?)\s+SLR\s+(?P<id>\d{4})\s+"
    r"(?P<x>-?\d+\.\d+)\s+(?P<y>-?\d+\.\d+)\s+(?P<z>-?\d+\.\d+)\s+"
    r"(?P<sx>\d+\.\d+)\s+(?P<sy>\d+\.\d+)\s+(?P<sz>\d+\.\d+)\s*$"
)
VEL = re.compile(
    r"^(?P<domes>\w{9})\s+"
    r"(?P<vx>-?\.?\d*\.?\d+)\s+(?P<vy>-?\.?\d*\.?\d+)\s+(?P<vz>-?\.?\d*\.?\d+)\s+"
    r"(?P<sx>-?\.?\d*\.?\d+)\s+(?P<sy>-?\.?\d*\.?\d+)\s+(?P<sz>-?\.?\d*\.?\d+)\s*$"
)


def die(msg: str) -> None:
    sys.exit(f"REFUSING to write {OUT.name}: {msg}")


def main() -> None:
    with urllib.request.urlopen(SOURCE_URL, timeout=120) as r:
        raw = r.read()
    got = hashlib.sha256(raw).hexdigest()
    if got != SOURCE_SHA256:
        die(
            f"{SOURCE_URL} has SHA-256 {got}, not the recorded {SOURCE_SHA256}. "
            f"A new ITRF realisation (or a re-issue) changes every coordinate here; "
            f"re-read the solution before trusting any number extracted from it."
        )
    text = raw.decode("utf-8", errors="replace")
    if EPOCH_HEADER not in text:
        die(
            f"the header {EPOCH_HEADER!r} is not present; the position epoch is not "
            f"{POSITION_EPOCH_YEAR} and the velocities can no longer be applied "
            f"from it"
        )

    lines = text.splitlines()
    found: dict[str, dict[str, str]] = {}
    for i, line in enumerate(lines):
        m = POS.match(line)
        if not m:
            continue
        sid = m.group("id")
        entry = next((w for w in WANTED if w[1] == sid), None)
        if entry is None:
            continue
        if m.group("domes") != entry[2]:
            continue
        if sid in found:
            die(
                f"station {sid} has more than one ITRF2020 position entry; this slice "
                f"assumes a single solution per station and cannot pick one"
            )
        if i + 1 >= len(lines):
            die(f"station {sid} position row has no velocity row after it")
        v = VEL.match(lines[i + 1])
        if v is None or v.group("domes") != m.group("domes"):
            die(f"station {sid} is not followed by its own velocity row")
        found[sid] = {
            "domes": m.group("domes"),
            "name": m.group("name").strip(),
            "x": m.group("x"),
            "y": m.group("y"),
            "z": m.group("z"),
            "sx": m.group("sx"),
            "sy": m.group("sy"),
            "sz": m.group("sz"),
            "vx": v.group("vx"),
            "vy": v.group("vy"),
            "vz": v.group("vz"),
        }

    missing = [sid for _, sid, _ in WANTED if sid not in found]
    if missing:
        die(f"ITRF2020 SLR carries no position for station(s) {missing}")

    out = [
        "# format: kshana-llr-stations v1",
        "# source: IERS ITRF2020, SLR station positions and velocities (ITRF Product",
        "#   Centre, IGN France)",
        f"# url: {SOURCE_URL}",
        f"# retrieved: {RETRIEVED}",
        f"# source_sha256: {SOURCE_SHA256}",
        f"# frame: ITRF2020, positions at epoch {POSITION_EPOCH_YEAR:.1f}, velocities m/y",
        "# note: these are SLR reference-point coordinates. The station eccentricity",
        "#   (reference point to telescope intersection of axes) is not applied.",
        "# generator: generate_itrf2020_llr_stations.py",
        f"position_epoch_year,{POSITION_EPOCH_YEAR:.1f}",
        "crd_name,ilrs_id,domes,site,x_m,y_m,z_m,sigma_x_m,sigma_y_m,sigma_z_m,"
        "vx_m_per_year,vy_m_per_year,vz_m_per_year",
    ]
    for crd_name, sid, _domes in WANTED:
        f = found[sid]
        out.append(
            f"{crd_name},{sid},{f['domes']},{f['name']},{f['x']},{f['y']},{f['z']},"
            f"{f['sx']},{f['sy']},{f['sz']},{f['vx']},{f['vy']},{f['vz']}"
        )

    OUT.write_text("\n".join(out) + "\n", encoding="utf-8")
    digest = hashlib.sha256(OUT.read_bytes()).hexdigest()
    print(f"wrote {OUT} ({OUT.stat().st_size} bytes)\nsha256: {digest}")


if __name__ == "__main__":
    main()
