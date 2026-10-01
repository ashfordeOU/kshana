#!/usr/bin/env python3
"""Fetch the pre-registered light-time sample from JPL Horizons (DE441).

Writes horizons_light_time.csv next to this script: the one-way light time LT of a VECTORS
request with VEC_CORR='LT', CENTER='500@399', VEC_TABLE=6, REF_SYSTEM=ICRF, OUT_UNITS=KM-S,
TIME_TYPE=TDB, targets 1, 2, 4, 5, 6 (system barycentres), on the Table 1 grid
JD 2378496.5 + 10.25 k (STEP_SIZE 14760 min), k = 0..8908, JD 2466154.5 dropped. Pre-registered in
tests/solar_system_light_time_preregistered.rs. Standard library only.
"""
import datetime
import hashlib
import os
import sys
import urllib.parse
import urllib.request

API = "https://ssd.jpl.nasa.gov/api/horizons.api"
HERE = os.path.dirname(os.path.abspath(__file__))
CHUNK = 4000


def fetch(target, jd0, jd1):
    q = {
        "format": "text", "COMMAND": f"'{target}'", "MAKE_EPHEM": "YES",
        "EPHEM_TYPE": "VECTORS", "CENTER": "'500@399'", "REF_PLANE": "FRAME",
        "REF_SYSTEM": "ICRF", "VEC_CORR": "'LT'", "VEC_TABLE": "6", "OUT_UNITS": "KM-S",
        "CSV_FORMAT": "YES", "OBJ_DATA": "NO", "TIME_TYPE": "TDB",
        "START_TIME": f"'JD {jd0:.2f}'", "STOP_TIME": f"'JD {jd1:.2f}'",
        "STEP_SIZE": "'14760 m'",
    }
    url = API + "?" + urllib.parse.urlencode(q)
    for _ in range(5):
        try:
            with urllib.request.urlopen(url, timeout=300) as r:
                text = r.read().decode()
            break
        except Exception as e:
            print("retry", target, jd0, e, file=sys.stderr)
    else:
        raise SystemExit("fetch failed")
    if "$$SOE" not in text or "DE441" not in text:
        raise SystemExit(text[:3000])
    api = text.split("API VERSION:")[1].split("\n")[0].strip()
    body = text.split("$$SOE")[1].split("$$EOE")[0]
    rows = []
    for line in body.strip().splitlines():
        c = [s.strip() for s in line.split(",")]
        rows.append((float(c[0]), c[2]))  # JD, LT as printed (seconds)
    return rows, api, text


if __name__ == "__main__":
    grid = [2378496.5 + 10.25 * k for k in range(8909)]
    lines = []
    api = None
    sample = None
    for tid in [1, 2, 4, 5, 6]:
        got = []
        for i in range(0, len(grid), CHUNK):
            part = grid[i:i + CHUNK]
            rows, api, text = fetch(tid, part[0], part[-1])
            sample = sample or text
            got.extend(rows)
        assert [r[0] for r in got] == grid, f"target {tid}: grid mismatch"
        for jd, lt in got:
            if jd == 2466154.5:
                continue
            lines.append(f"{tid},{jd:.2f},{lt}")
        print(tid, len(got), file=sys.stderr)
    hdr = sample.split("$$SOE")[0]
    cols = [l for l in hdr.splitlines() if "LT" in l and "RG" in l]
    head = [
        "# JPL Horizons one-way light time LT (seconds), observer the Earth's centre, DE441.",
        f"# Source: {API}, API version {api}, retrieved {datetime.date.today().isoformat()}.",
        "# Query: EPHEM_TYPE=VECTORS CENTER='500@399' REF_SYSTEM=ICRF VEC_CORR='LT' VEC_TABLE=6",
        "#   OUT_UNITS=KM-S TIME_TYPE=TDB STEP_SIZE='14760 m' COMMAND=<target id>",
        "# Grid: JD 2378496.5 + 10.25 k, k = 0..8908; JD 2466154.5 (old fixture) dropped. 8908 per target.",
        f"# Horizons column header: {cols[0].strip() if cols else 'n/a'}",
        "# Columns: target_id,jd_tdb_reception,lt_s",
    ]
    path = os.path.join(HERE, "horizons_light_time.csv")
    with open(path, "w") as f:
        f.write("\n".join(head + lines) + "\n")
    print(hashlib.sha256(open(path, "rb").read()).hexdigest(), file=sys.stderr)
