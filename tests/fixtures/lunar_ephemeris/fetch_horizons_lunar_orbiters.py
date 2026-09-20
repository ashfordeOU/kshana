#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the committed REAL lunar-spacecraft ephemeris fixture.

Every state vector in the output comes from the NASA/JPL Horizons system (Solar
System Dynamics group) — the same open, no-login service the repository already
uses for the LRO force-model fixture (`tests/fixtures/agency/lro/`). Horizons
evaluates JPL's own reconstructed SPK kernels for each spacecraft, so these are
kernel-derived states, not a propagation of published elements.

The set is "every spacecraft that was actually in lunar orbit on the arc", which
is what an honest real-ephemeris geometry run has available. It is NOT a
navigation constellation and is not claimed to be one:

  -85    LRO            Lunar Reconnaissance Orbiter (NASA), low polar
  -155   Danuri / KPLO  Korea Pathfinder Lunar Orbiter (KARI), low polar
  -152   Chandrayaan-2  orbiter (ISRO), low polar
  -1176  CAPSTONE       NASA 9:2 lunar NRHO pathfinder for Gateway

Output columns are `sat,t_s,x_km,y_km,z_km` with `t_s` seconds past the header's
`epoch_jd_tdb`, in the Moon-centred ICRF frame exactly as Horizons returns it
(REF_PLANE=FRAME, REF_SYSTEM=ICRF, geometric states, no aberration/light-time).

    python3 fetch_horizons_lunar_orbiters.py [--out horizons_lunar_orbiters_2023001_12h.csv]
"""

from __future__ import annotations

import argparse
import pathlib
import re
import sys
import urllib.parse
import urllib.request

API = "https://ssd.jpl.nasa.gov/api/horizons.api"

# NAIF id -> (label, note). Order fixes the `sat` column.
TARGETS = [
    ("-85", "LRO", "Lunar Reconnaissance Orbiter (NASA/GSFC), low polar"),
    ("-155", "Danuri", "Korea Pathfinder Lunar Orbiter / KPLO (KARI), low polar"),
    ("-152", "Chandrayaan-2", "Chandrayaan-2 orbiter (ISRO), low polar"),
    ("-1176", "CAPSTONE", "NASA 9:2 lunar NRHO pathfinder for Gateway"),
]

START = "2023-01-01 00:00"
STOP = "2023-01-01 12:00"
STEP = "5 m"
EPOCH_JD_TDB = 2459945.5  # 2023-01-01 00:00:00.0000 TDB
RETRIEVED = "2026-09-20"

VEC = re.compile(
    r"^(?P<jd>\d+\.\d+) = A\.D\..*?\n"
    r"\s*X\s*=\s*(?P<x>[-+.\dE]+)\s+Y\s*=\s*(?P<y>[-+.\dE]+)\s+Z\s*=\s*(?P<z>[-+.\dE]+)",
    re.MULTILINE,
)


def query(command):
    params = {
        "format": "text",
        "COMMAND": "'%s'" % command,
        "OBJ_DATA": "'NO'",
        "MAKE_EPHEM": "'YES'",
        "EPHEM_TYPE": "'VECTORS'",
        "CENTER": "'@301'",
        "REF_PLANE": "'FRAME'",
        "REF_SYSTEM": "'ICRF'",
        "VEC_TABLE": "'1'",
        "OUT_UNITS": "'KM-S'",
        "START_TIME": "'%s'" % START,
        "STOP_TIME": "'%s'" % STOP,
        "STEP_SIZE": "'%s'" % STEP,
    }
    url = API + "?" + urllib.parse.urlencode(params)
    with urllib.request.urlopen(url, timeout=180) as r:
        body = r.read().decode("utf-8", "replace")
    if "$$SOE" not in body:
        raise SystemExit("Horizons returned no ephemeris for %s:\n%s" % (command, body))
    block = body.split("$$SOE", 1)[1].split("$$EOE", 1)[0]
    rows = [
        (float(m.group("jd")), float(m.group("x")), float(m.group("y")), float(m.group("z")))
        for m in VEC.finditer(block)
    ]
    if not rows:
        raise SystemExit("could not parse any state vector for %s" % command)
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default="horizons_lunar_orbiters_2023001_12h.csv")
    args = ap.parse_args()

    per_sat = []
    for naif, label, note in TARGETS:
        rows = query(naif)
        print("%s (%s): %d states" % (label, naif, len(rows)))
        per_sat.append((naif, label, note, rows))

    n = {len(r[3]) for r in per_sat}
    if len(n) != 1:
        raise SystemExit("targets returned different epoch counts: %r" % n)

    out = pathlib.Path(args.out)
    with out.open("w") as f:
        f.write(
            "# kshana-lunar-constellation 1\n"
            "# format: states\n"
            "# provenance: published-ephemeris\n"
            "# name: real lunar spacecraft in lunar orbit on 2023-01-01 (NOT a navigation constellation)\n"
            "# frame: icrf\n"
            "# epoch_jd_tdb: %.9f\n"
            "# source: NASA/JPL Horizons system (Solar System Dynamics), geometric "
            "Moon-centred state vectors evaluated from JPL's reconstructed SPK kernels\n"
            "# url: %s\n"
            "# query: CENTER='@301' REF_PLANE='FRAME' REF_SYSTEM='ICRF' EPHEM_TYPE='VECTORS' "
            "VEC_TABLE='1' OUT_UNITS='KM-S' START_TIME='%s' STOP_TIME='%s' STEP_SIZE='%s'\n"
            "# retrieved: %s\n"
            "# generator: tests/fixtures/lunar_ephemeris/fetch_horizons_lunar_orbiters.py\n"
            % (EPOCH_JD_TDB, API, START, STOP, STEP, RETRIEVED)
        )
        for i, (naif, label, note, _rows) in enumerate(per_sat):
            f.write("# sat %d: %s (NAIF %s) - %s\n" % (i, label, naif, note))
        f.write("sat,t_s,x_km,y_km,z_km\n")
        for i, (_naif, _label, _note, rows) in enumerate(per_sat):
            for jd, x, y, z in rows:
                t_s = round((jd - EPOCH_JD_TDB) * 86400.0, 6)
                f.write("%d,%.6f,%.9E,%.9E,%.9E\n" % (i, t_s, x, y, z))
    print("wrote %s" % out)
    return 0


if __name__ == "__main__":
    sys.exit(main())
