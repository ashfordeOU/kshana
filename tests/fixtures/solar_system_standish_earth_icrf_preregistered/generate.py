#!/usr/bin/env python3
"""Fetch the pre-registered Earth and ICRF Standish samples from JPL Horizons (DE441).

Writes horizons_earth_ecliptic.csv (target 399, REF_PLANE=ECLIPTIC) and horizons_icrf.csv
(targets 1, 2, 3, 4, 5, 6, 399, REF_PLANE=FRAME) next to this script. Query per target and
chunk: VECTORS, CENTER='500@10', REF_SYSTEM=ICRF, VEC_CORR=NONE, VEC_TABLE=1, OUT_UNITS=KM-S,
TIME_TYPE=TDB, START/STOP as JD, STEP_SIZE 14760 min (10.25 d). Positions rounded to 1 km, as
pre-registered in tests/solar_system_standish_earth_icrf_preregistered.rs. Standard library only.
"""
import datetime
import hashlib
import os
import sys
import urllib.parse
import urllib.request

API = "https://ssd.jpl.nasa.gov/api/horizons.api"
HERE = os.path.dirname(os.path.abspath(__file__))
OLD_EPOCHS = {2466154.5}
CHUNK = 4000


def fetch(target, plane, jd0, jd1, step_min):
    q = {
        "format": "text", "COMMAND": f"'{target}'", "MAKE_EPHEM": "YES",
        "EPHEM_TYPE": "VECTORS", "CENTER": "'500@10'", "REF_PLANE": plane,
        "REF_SYSTEM": "ICRF", "VEC_CORR": "NONE", "VEC_TABLE": "1", "OUT_UNITS": "KM-S",
        "CSV_FORMAT": "YES", "OBJ_DATA": "NO", "TIME_TYPE": "TDB",
        "START_TIME": f"'JD {jd0:.2f}'", "STOP_TIME": f"'JD {jd1:.2f}'",
        "STEP_SIZE": f"'{step_min} m'",
    }
    url = API + "?" + urllib.parse.urlencode(q)
    for _ in range(5):
        try:
            with urllib.request.urlopen(url, timeout=300) as r:
                text = r.read().decode()
            break
        except Exception as e:  # network retry
            print("retry", target, jd0, e, file=sys.stderr)
    else:
        raise SystemExit("fetch failed")
    if "$$SOE" not in text:
        raise SystemExit(text[:2000])
    api_version = text.split("API VERSION:")[1].split("\n")[0].strip()
    if not [l for l in text.splitlines() if "DE441" in l or "DE-0441" in l]:
        raise SystemExit("response does not name DE441:\n" + text[:3000])
    frame = [l.strip() for l in text.splitlines() if l.startswith("Reference frame")]
    body = text.split("$$SOE")[1].split("$$EOE")[0]
    out = []
    for line in body.strip().splitlines():
        c = [s.strip() for s in line.split(",")]
        out.append((float(c[0]), float(c[2]), float(c[3]), float(c[4])))
    return out, api_version, frame[0] if frame else "?"


def build(name, ids, plane):
    grid = [2378496.5 + 10.25 * k for k in range(8909)]
    lines, meta = [], None
    for tid in ids:
        got = []
        for i in range(0, len(grid), CHUNK):
            part = grid[i:i + CHUNK]
            rows, api, frame = fetch(tid, plane, part[0], part[-1], 14760)
            meta = (api, frame)
            got.extend(rows)
        assert [r[0] for r in got] == grid, f"target {tid}: epoch grid mismatch"
        for jd, x, y, z in got:
            if jd in OLD_EPOCHS:
                continue
            lines.append(f"{tid},{jd:.2f},{round(x)},{round(y)},{round(z)}")
        print(name, tid, len(got), file=sys.stderr)
    head = [
        f"# JPL Horizons geometric heliocentric positions (DE441), REF_PLANE={plane}.",
        f"# Source: {API}, API version {meta[0]}, retrieved {datetime.date.today().isoformat()};",
        "#   every response names DE441 as the target source.",
        f"# Horizons states: {meta[1]}",
        f"# Query: EPHEM_TYPE=VECTORS CENTER='500@10' REF_PLANE={plane} REF_SYSTEM=ICRF VEC_CORR=NONE",
        "#   VEC_TABLE=1 OUT_UNITS=KM-S TIME_TYPE=TDB STEP_SIZE='14760 m' COMMAND=<target id>",
        "# Grid: JD 2378496.5 + 10.25 k, k = 0..8908; JD 2466154.5 (old fixture) dropped. 8908 per target.",
        "# Positions rounded to 1 km (pre-registered). Columns: target_id,jd_tdb,x_km,y_km,z_km",
    ]
    path = os.path.join(HERE, name)
    with open(path, "w") as f:
        f.write("\n".join(head + lines) + "\n")
    print(name, hashlib.sha256(open(path, "rb").read()).hexdigest(), file=sys.stderr)


if __name__ == "__main__":
    build("horizons_earth_ecliptic.csv", [399], "ECLIPTIC")
    build("horizons_icrf.csv", [1, 2, 3, 4, 5, 6, 399], "FRAME")
