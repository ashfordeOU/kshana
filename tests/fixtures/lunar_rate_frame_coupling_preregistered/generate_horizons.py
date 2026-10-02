#!/usr/bin/env python3
"""Fetch the pre-registered DE441 geocentric lunar velocities from JPL Horizons.

Writes horizons_moon_velocity.csv: COMMAND='301', CENTER='500@399', VECTORS, VEC_TABLE=2,
VEC_CORR=NONE, REF_PLANE=FRAME, REF_SYSTEM=ICRF, OUT_UNITS=KM-S, TDB, at the discrete epochs
JD 2451545.25 + 7.31 k, k = 0..1999 (TLIST, 25 per request). Values as Horizons prints them.
Pre-registered in tests/lunar_rate_frame_coupling_preregistered.rs. Standard library only.
"""
import datetime
import hashlib
import os
import sys
import urllib.parse
import urllib.request

API = "https://ssd.jpl.nasa.gov/api/horizons.api"
HERE = os.path.dirname(os.path.abspath(__file__))
EPOCHS = [f"{2451545.25 + 7.31 * k:.2f}" for k in range(2000)]


def fetch(tlist):
    q = {"format": "text", "COMMAND": "'301'", "CENTER": "'500@399'", "MAKE_EPHEM": "YES",
         "EPHEM_TYPE": "VECTORS", "VEC_TABLE": "2", "VEC_CORR": "NONE", "REF_PLANE": "FRAME",
         "REF_SYSTEM": "ICRF", "OUT_UNITS": "KM-S", "CSV_FORMAT": "YES", "OBJ_DATA": "NO",
         "TIME_TYPE": "TDB", "TLIST_TYPE": "JD", "TLIST": " ".join(f"'{t}'" for t in tlist)}
    url = API + "?" + urllib.parse.urlencode(q)
    for _ in range(5):
        try:
            with urllib.request.urlopen(url, timeout=300) as r:
                text = r.read().decode()
            break
        except Exception as e:  # network retry
            print("retry", e, file=sys.stderr)
    else:
        raise SystemExit("fetch failed")
    if "$$SOE" not in text or not ("DE441" in text or "DE-0441" in text):
        raise SystemExit(text[:3000])
    api = text.split("API VERSION:")[1].split("\n")[0].strip()
    rows = [[s.strip() for s in l.split(",")] for l in
            text.split("$$SOE")[1].split("$$EOE")[0].strip().splitlines()]
    return rows, api


lines, api = [], None
for i in range(0, len(EPOCHS), 25):
    part = EPOCHS[i:i + 25]
    rows, api = fetch(part)
    assert len(rows) == len(part), (i, len(rows))
    for t, r in zip(part, rows):
        assert abs(float(r[0]) - float(t)) < 1e-7, (t, r[0])
        lines.append(f"{r[0]},{r[5]},{r[6]},{r[7]}")
head = ["# JPL Horizons geometric geocentric velocity of the Moon (km/s), DE441.",
        f"# Source: {API}, API version {api}, retrieved {datetime.date.today().isoformat()}; every response names DE441.",
        "# Query: COMMAND='301' CENTER='500@399' EPHEM_TYPE=VECTORS VEC_TABLE=2 VEC_CORR=NONE REF_PLANE=FRAME",
        "#   REF_SYSTEM=ICRF OUT_UNITS=KM-S TIME_TYPE=TDB TLIST_TYPE=JD, epochs JD 2451545.25 + 7.31 k, k = 0..1999.",
        "# Columns: jd_tdb,vx_km_s,vy_km_s,vz_km_s"]
path = os.path.join(HERE, "horizons_moon_velocity.csv")
with open(path, "w") as f:
    f.write("\n".join(head + lines) + "\n")
print(len(lines), hashlib.sha256(open(path, "rb").read()).hexdigest(), file=sys.stderr)
