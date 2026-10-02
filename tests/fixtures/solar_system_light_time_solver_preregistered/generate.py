#!/usr/bin/env python3
"""Fetch the pre-registered light-time-solver sample from JPL Horizons (DE441).

Writes, next to this script:
  horizons_barycentric_nodes.csv     geometric barycentric ICRF positions (km) of 399, 10, 301,
                                     1, 2, 4, 5, 6 every 0.5 d, JD 2458849.5 to 2461041.5;
  horizons_barycentric_at_epochs.csv the same bodies at the reception epochs (interpolation check);
  horizons_light_time.csv            LT (s) of 1, 2, 4, 5, 6, 10, 301 seen from the Earth's centre
                                     at JD 2458860.3 + 1.375 k, k = 0..1575.
Numbers are kept exactly as Horizons prints them. Standard library only. Pre-registered in
tests/solar_system_light_time_solver_preregistered.rs.
"""
import datetime
import hashlib
import os
import sys
import urllib.parse
import urllib.request

API = "https://ssd.jpl.nasa.gov/api/horizons.api"
HERE = os.path.dirname(os.path.abspath(__file__))
BODIES = [399, 10, 301, 1, 2, 4, 5, 6]
TARGETS = [1, 2, 4, 5, 6, 10, 301]
NODE0, NNODES, NODE_MIN = 2458849.5, 4385, 720  # amendment 1: half-day nodes
EP0, EPSTEP, NEP = 2458860.3, 1.375, 1576


def fetch(params):
    q = {"format": "text", "MAKE_EPHEM": "YES", "EPHEM_TYPE": "VECTORS", "REF_PLANE": "FRAME",
         "REF_SYSTEM": "ICRF", "OUT_UNITS": "KM-S", "CSV_FORMAT": "YES", "OBJ_DATA": "NO",
         "TIME_TYPE": "TDB"}
    q.update(params)
    url = API + "?" + urllib.parse.urlencode(q)
    for _ in range(5):
        try:
            with urllib.request.urlopen(url, timeout=300) as r:
                text = r.read().decode()
            break
        except Exception as e:  # network retry
            print("retry", params, e, file=sys.stderr)
    else:
        raise SystemExit("fetch failed")
    if "$$SOE" not in text:
        raise SystemExit(text[:2000])
    if not [l for l in text.splitlines() if "DE441" in l or "DE-0441" in l]:
        raise SystemExit("response does not name DE441:\n" + text[:3000])
    api = text.split("API VERSION:")[1].split("\n")[0].strip()
    rows = [[s.strip() for s in l.split(",")] for l in
            text.split("$$SOE")[1].split("$$EOE")[0].strip().splitlines()]
    return rows, api, text


def series(cmd, center, corr, table, jd0, n, step_min):
    out, api, last = [], None, None
    for i in range(0, n, 2000):
        m = min(2000, n - i)
        a = jd0 + i * step_min / 1440.0
        b = jd0 + (i + m - 1) * step_min / 1440.0
        rows, api, last = fetch({"COMMAND": f"'{cmd}'", "CENTER": f"'{center}'",
                                 "VEC_CORR": corr, "VEC_TABLE": table,
                                 "START_TIME": f"'JD {a:.6f}'", "STOP_TIME": f"'JD {b:.6f}'",
                                 "STEP_SIZE": f"'{step_min} m'"})
        assert len(rows) == m, (cmd, len(rows), m)
        out.extend(rows)
    for k, r in enumerate(out):
        assert abs(float(r[0]) - (jd0 + k * step_min / 1440.0)) < 1e-7, (cmd, k, r[0])
    return out, api, last


def write(name, head, lines):
    path = os.path.join(HERE, name)
    with open(path, "w") as f:
        f.write("\n".join(head + lines) + "\n")
    print(name, len(lines), hashlib.sha256(open(path, "rb").read()).hexdigest(), file=sys.stderr)


def main():
    today = datetime.date.today().isoformat()
    nodes, at = [], []
    for b in BODIES:
        rows, api, _ = series(b, "500@0", "NONE", "1", NODE0, NNODES, NODE_MIN)
        nodes += [f"{b},{r[0]},{r[2]},{r[3]},{r[4]}" for r in rows]
        rows, api, _ = series(b, "500@0", "NONE", "1", EP0, NEP, 1980)
        at += [f"{b},{r[0]},{r[2]},{r[3]},{r[4]}" for r in rows]
        print("positions", b, file=sys.stderr)
    common = [f"# Source: {API}, API version {api}, retrieved {today}; every response names DE441.",
              "# Query: EPHEM_TYPE=VECTORS CENTER='500@0' REF_PLANE=FRAME REF_SYSTEM=ICRF VEC_CORR=NONE",
              "#   VEC_TABLE=1 OUT_UNITS=KM-S TIME_TYPE=TDB COMMAND=<body id>; values as printed.",
              "# Columns: body_id,jd_tdb,x_km,y_km,z_km"]
    write("horizons_barycentric_nodes.csv",
          ["# JPL Horizons geometric barycentric ICRF positions (DE441), nodes every 0.5 d (STEP_SIZE='720 m')",
           f"#   from JD {NODE0} to JD {NODE0 + (NNODES - 1) * NODE_MIN / 1440.0}, {NNODES} per body."] + common, nodes)
    write("horizons_barycentric_at_epochs.csv",
          ["# JPL Horizons geometric barycentric ICRF positions (DE441) at the reception epochs",
           f"#   JD {EP0} + {EPSTEP} k, k = 0..{NEP - 1} (STEP_SIZE='1980 m'); interpolation precondition only."]
          + common, at)
    lt, legend = [], None
    for t in TARGETS:
        rows, api, text = series(t, "500@399", "LT", "6", EP0, NEP, 1980)
        lt += [f"{t},{r[0]},{r[2]}" for r in rows]
        leg = [l.strip() for l in text.split("$$EOE")[1].splitlines() if l.strip().startswith("LT")]
        legend = leg[0] if leg else "(no LT legend line found)"
        print("lt", t, file=sys.stderr)
    write("horizons_light_time.csv",
          ["# JPL Horizons one-way light time LT (s), observer the Earth's centre, DE441.",
           f"# Source: {API}, API version {api}, retrieved {today}; every response names DE441.",
           "# Query: EPHEM_TYPE=VECTORS CENTER='500@399' REF_PLANE=FRAME REF_SYSTEM=ICRF VEC_CORR='LT'",
           "#   VEC_TABLE=6 OUT_UNITS=KM-S TIME_TYPE=TDB STEP_SIZE='1980 m' COMMAND=<target id>",
           f"# Reception epochs JD {EP0} + {EPSTEP} k, k = 0..{NEP - 1}.",
           f"# Horizons legend: {legend}",
           "# Columns: target_id,jd_tdb_reception,lt_s"], lt)


if __name__ == "__main__":
    main()
