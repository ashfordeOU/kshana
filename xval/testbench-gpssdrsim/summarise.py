# SPDX-License-Identifier: AGPL-3.0-only
"""Compares gps-sdr-sim's reader output (driver.c) with the motion CSV row by row. Standard
library only. Usage: summarise.py <work dir> <commit> <scenario>..."""
import hashlib, json, math, sys

work, commit, scenarios = sys.argv[1], sys.argv[2], sys.argv[3:]
CAP = 3000


def read_out(path):
    with open(path) as f:
        lines = f.read().split("\n")
    n = int(lines[0].split(",")[1])
    return n, [tuple(map(float, l.split(","))) for l in lines[1 : 1 + n]]


def max_diff(got, ref):
    return max((math.dist(g, r) for g, r in zip(got, ref)), default=0.0)


out = {"generated_by": "xval/testbench-gpssdrsim/run.sh", "oracle": "gps-sdr-sim",
       "oracle_commit": commit, "user_motion_size": CAP, "scenarios": {}}
for s in scenarios:
    csv_path, nmea_path = f"{work}/{s}.motion.csv", f"{work}/{s}.nmea"
    with open(csv_path) as f:
        rows = [l.split(",") for l in f.read().strip().split("\n")[1:]]
    ref = [(float(r[1]), float(r[2]), float(r[3])) for r in rows]
    times = [float(r[0]) for r in rows]
    n_expected = min(len(ref), CAP)
    rec = {"samples_in_export": len(ref), "n_expected": n_expected,
           "csv_sha256": hashlib.sha256(open(csv_path, "rb").read()).hexdigest(),
           "nmea_sha256": hashlib.sha256(open(nmea_path, "rb").read()).hexdigest()}
    for key in ("nmea", "ecef", "llh"):
        n, got = read_out(f"{work}/{s}.out.{key}")
        rec[f"{key}_count"] = n
        rec[f"{key}_max_diff_m"] = max_diff(got, ref)
    steps = [b - a for a, b in zip(times, times[1:])]
    rec["row_spacing_s"] = [min(steps), max(steps)] if steps else [0.0, 0.0]
    rec["max_time_vs_grid_0p1_s"] = max(abs(t - 0.1 * i) for i, t in enumerate(times))
    # Informational: the CSV as written, header line included.
    n, got = read_out(f"{work}/{s}.out.asis")
    rec["as_written_count"] = n
    rec["as_written_first_sample"] = list(got[0]) if got else None
    rec["as_written_rest_max_diff_m"] = max_diff(got[1:], ref)
    with open(f"{work}/{s}.stderr") as f:
        rec["export_stderr"] = f.read().strip()
    out["scenarios"][s] = rec
json.dump(out, sys.stdout, indent=1)
sys.stdout.write("\n")
