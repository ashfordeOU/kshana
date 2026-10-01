#!/usr/bin/env python3
"""Fetch the pre-registered Standish sample from JPL Horizons (DE441).

Writes horizons_table1.csv and horizons_table2.csv next to this script. Query per target and
chunk: VECTORS, CENTER='500@10', REF_PLANE=ECLIPTIC, REF_SYSTEM=ICRF, VEC_CORR=NONE,
VEC_TABLE=1, OUT_UNITS=KM-S, TIME_TYPE=TDB, START/STOP as JD, STEP_SIZE in whole minutes
(10.25 d = 14760 min; 100.25 d = 144360 min). Positions are rounded to 1 km, as pre-registered
in tests/solar_system_standish_preregistered.rs. Standard library only.
"""
import datetime
import hashlib
import os
import sys
import urllib.parse
import urllib.request

API = "https://ssd.jpl.nasa.gov/api/horizons.api"
HERE = os.path.dirname(os.path.abspath(__file__))
OLD_EPOCHS = {2378647.5, 2396758.5, 2415020.5, 2424332.5, 2433282.5, 2442413.5, 2451545.0,
              2455378.5, 2458849.5, 2461311.5, 2466154.5, 2469776.5, 2086308.5, 2634166.5,
              1356173.5}
CHUNK = 4000  # epochs per request


def fetch(target, jd0, jd1, step_min):
    q = {
        "format": "text", "COMMAND": f"'{target}'", "MAKE_EPHEM": "YES",
        "EPHEM_TYPE": "VECTORS", "CENTER": "'500@10'", "REF_PLANE": "ECLIPTIC",
        "REF_SYSTEM": "ICRF", "VEC_CORR": "NONE", "VEC_TABLE": "1", "OUT_UNITS": "KM-S",
        "CSV_FORMAT": "YES", "OBJ_DATA": "NO", "TIME_TYPE": "TDB",
        "START_TIME": f"'JD {jd0:.2f}'", "STOP_TIME": f"'JD {jd1:.2f}'",
        "STEP_SIZE": f"'{step_min} m'",
    }
    url = API + "?" + urllib.parse.urlencode(q)
    for attempt in range(5):
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
    eph = [l for l in text.splitlines() if "DE441" in l or "DE-0441" in l]
    if not eph:
        raise SystemExit("response does not name DE441:\n" + text[:3000])
    body = text.split("$$SOE")[1].split("$$EOE")[0]
    out = []
    for line in body.strip().splitlines():
        c = [s.strip() for s in line.split(",")]
        out.append((float(c[0]), float(c[2]), float(c[3]), float(c[4])))
    return out, api_version, eph[0].strip()


def build(name, ids, jd_start, n_epochs, step_days, step_min, comment):
    grid = [jd_start + step_days * k for k in range(n_epochs)]
    keep = [jd for jd in grid if jd not in OLD_EPOCHS]
    lines = []
    meta = None
    for tid in ids:
        got = []
        for i in range(0, len(grid), CHUNK):
            part = grid[i:i + CHUNK]
            rows, api, eph = fetch(tid, part[0], part[-1], step_min)
            meta = (api, eph)
            got.extend(rows)
        jds = [r[0] for r in got]
        assert jds == grid, f"target {tid}: epoch grid mismatch ({len(jds)} vs {len(grid)})"
        for jd, x, y, z in got:
            if jd in OLD_EPOCHS:
                continue
            lines.append(f"{tid},{jd:.2f},{round(x)},{round(y)},{round(z)}")
        print(name, tid, len(got), file=sys.stderr)
    head = [
        "# JPL Horizons geometric heliocentric positions, mean ecliptic and equinox of J2000 (DE441).",
        f"# Source: {API}, API version {meta[0]}, retrieved {datetime.date.today().isoformat()};",
        "#   every response names DE441 as the target source.",
        "# Query: EPHEM_TYPE=VECTORS CENTER='500@10' REF_PLANE=ECLIPTIC REF_SYSTEM=ICRF VEC_CORR=NONE",
        f"#   VEC_TABLE=1 OUT_UNITS=KM-S TIME_TYPE=TDB STEP_SIZE='{step_min} m' COMMAND=<target id>",
        f"# {comment}",
        f"# Epochs kept per target: {len(keep)}. Positions rounded to 1 km (pre-registered).",
        "# Columns: target_id,jd_tdb,x_km,y_km,z_km",
    ]
    path = os.path.join(HERE, name)
    with open(path, "w") as f:
        f.write("\n".join(head + lines) + "\n")
    print(name, hashlib.sha256(open(path, "rb").read()).hexdigest(), file=sys.stderr)


if __name__ == "__main__":
    build("horizons_table1.csv", [1, 2, 3, 4, 5, 6], 2378496.5, 8909, 10.25, 14760,
          "Table 1 grid: JD 2378496.5 + 10.25 k, k = 0..8908; JD 2466154.5 (old fixture) dropped.")
    build("horizons_table2.csv", [1, 2, 3, 4, 5, 6, 7, 8], 625673.5, 21857, 100.25, 144360,
          "Table 2 grid: JD 625673.5 + 100.25 k, k = 0..21856.")
