#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""
Independent oracles for the test-bench export (`kshana bench-export`).

Oracles (dev-only; pinned versions, none of them shares authors or code with kshana):

    pyproj          3.8.0   (PROJ 9.8.1)  geodetic <-> Earth-fixed conversions and the
                                          topocentric (local east-north-up) rotation
    geographiclib   2.1     geodesic distance between the NMEA and CSV positions
    pynmea2         1.19.0  NMEA 0183 parsing: checksum validation and decoded values
    scipy           see TESTBENCH_SCIPY below
                                          scipy.spatial.transform.Rotation: quaternion to
                                          yaw-pitch-roll
    numpy           2.5.3

What it does, on SYNTHETIC scenarios only (the bundled `gnss-ins`, `automotive-urban-canyon`,
`jamming-demo` and `gnss-sim-raim` scenarios):

  1. runs `kshana bench-export` with the default epoch and reads the files it wrote;
  2. for EVERY row of the motion CSV and EVERY NMEA sentence, runs the oracles and records the
     worst disagreement (a "max" block per scenario), together with the SHA-256 of the exact
     CSV and NMEA bytes it checked;
  3. for every STRIDE-th row (the rows of tests/fixtures/testbench/truth.json, which also carry
     the true quaternion and north-east-down velocity) records the oracle's own values, so the
     Rust test can compare them with kshana's output without Python.

Writes tests/fixtures/testbench/reference.json. The comparison and its tolerances live in
tests/testbench_reference.rs and were fixed before this script was first run.

Usage (a venv holding the pinned oracles; kshana built with `cargo build --release`):

    python scripts/gen_testbench_ref.py [--kshana target/release/kshana]

Run `cargo run --release --example gen_testbench_truth` first (truth.json is an input).
"""
import argparse
import datetime as dt
import hashlib
import json
import math
import os
import subprocess
import sys
import tempfile

import numpy as np
import pynmea2
import pyproj
import scipy
from geographiclib.geodesic import Geodesic
from pyproj import Transformer
from scipy.spatial.transform import Rotation

PINS = {
    "pyproj": "3.8.0",
    "geographiclib": "2.1",
    "pynmea2": "1.19.0",
}

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.abspath(os.path.join(HERE, ".."))
FIXTURES = os.path.join(ROOT, "tests", "fixtures", "testbench")

# (scenario file, kind). `gnss-ins` kinds have true attitude in truth.json.
SCENARIOS = [
    ("automotive-urban-canyon.toml", "gnss-ins"),
    ("gnss-ins.toml", "gnss-ins"),
    ("jamming-demo.toml", "jamming"),
    ("gnss-sim-raim.toml", "gnss-sim"),
]

STRIDE = 10  # must equal STRIDE in examples/gen_testbench_truth.rs

WGS84_TO_ECEF = Transformer.from_crs("EPSG:4979", "EPSG:4978", always_xy=True)
ECEF_TO_WGS84 = Transformer.from_crs("EPSG:4978", "EPSG:4979", always_xy=True)


def ecef_forward(lat, lon, h):
    return np.array(WGS84_TO_ECEF.transform(lon, lat, h))


def ecef_inverse(x, y, z):
    lon, lat, h = ECEF_TO_WGS84.transform(x, y, z)
    return np.array([lat, lon, h])


def ned_of_ecef_velocity(ecef, v):
    """North-east-down components of an Earth-fixed velocity at `ecef`, by PROJ's topocentric
    (east-north-up) operation: the difference of two points is the rotated velocity exactly."""
    pipe = (
        "+proj=pipeline +step +proj=topocentric +ellps=WGS84 "
        f"+X_0={ecef[0]!r} +Y_0={ecef[1]!r} +Z_0={ecef[2]!r}"
    )
    t = Transformer.from_pipeline(pipe)
    e, n, u = t.transform(ecef[0] + v[0], ecef[1] + v[1], ecef[2] + v[2])
    return np.array([n, e, -u])


def wrap180(a):
    return (a + 180.0) % 360.0 - 180.0


def read_csv(text):
    lines = text.strip().split("\n")
    cols = lines[0].split(",")
    rows = []
    for ln in lines[1:]:
        f = ln.split(",")
        row = {}
        for c, v in zip(cols, f):
            row[c] = v if c == "utc" else float(v)
        rows.append(row)
    return cols, rows


def parse_utc(s):
    # 2024-01-01T00:00:00.100000Z
    return dt.datetime.strptime(s, "%Y-%m-%dT%H:%M:%S.%fZ").replace(tzinfo=dt.timezone.utc)


def sha(b):
    return hashlib.sha256(b).hexdigest()


def run_export(kshana, scenario, workdir):
    stem = os.path.join(workdir, scenario[:-5])
    subprocess.run(
        [kshana, "bench-export", os.path.join(ROOT, "scenarios", scenario), "--out", stem],
        check=True,
        capture_output=True,
    )
    with open(stem + ".motion.csv", "rb") as f:
        csv_bytes = f.read()
    with open(stem + ".nmea", "rb") as f:
        nmea_bytes = f.read()
    return csv_bytes, nmea_bytes


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--kshana", default=os.path.join(ROOT, "target", "release", "kshana"))
    args = ap.parse_args()

    for mod, want in PINS.items():
        have = {"pyproj": pyproj.__version__, "pynmea2": pynmea2.__version__}.get(mod)
        if mod == "geographiclib":
            import geographiclib

            have = geographiclib.__version__
        if have != want:
            sys.exit(f"oracle {mod} is {have}, this script is pinned to {want}")

    with open(os.path.join(FIXTURES, "truth.json")) as f:
        truth = json.load(f)
    assert truth["stride"] == STRIDE

    out = {
        "generated_by": "scripts/gen_testbench_ref.py",
        "oracles": {
            **PINS,
            "scipy": scipy.__version__,
            "numpy": np.__version__,
            "proj": pyproj.proj_version_str,
        },
        "stride": STRIDE,
        "scenarios": {},
    }

    with tempfile.TemporaryDirectory() as tmp:
        for scenario, kind in SCENARIOS:
            csv_bytes, nmea_bytes = run_export(args.kshana, scenario, tmp)
            cols, rows = read_csv(csv_bytes.decode())
            nmea_lines = [ln for ln in nmea_bytes.decode().split("\r\n") if ln]
            assert len(nmea_lines) == 2 * len(rows), (scenario, len(nmea_lines), len(rows))

            epoch = parse_utc(rows[0]["utc"])
            t0 = rows[0]["time_s"]
            mx = {
                "ecef_vs_forward_m": 0.0,
                "latlon_vs_inverse_deg": 0.0,
                "h_vs_inverse_m": 0.0,
                "utc_s": 0.0,
                "nmea_checksum_failures": 0,
                "nmea_horizontal_m": 0.0,
                "nmea_height_m": 0.0,
                "nmea_time_s": 0.0,
                "nmea_speed_kn": 0.0,
                "nmea_stationary_courses_present": 0,
            }
            ref_rows = []
            truth_rows = {r["i"]: r for r in truth["scenarios"].get(scenario, {"rows": []})["rows"]}
            last = len(rows) - 1

            for i, r in enumerate(rows):
                ecef_csv = np.array([r["x_m"], r["y_m"], r["z_m"]])
                v_csv = np.array([r["vx_m_s"], r["vy_m_s"], r["vz_m_s"]])
                llh_csv = np.array([r["lat_deg"], r["lon_deg"], r["h_m"]])

                # (a) Earth-fixed <-> geodetic, both directions.
                fwd = ecef_forward(*llh_csv)
                inv = ecef_inverse(*ecef_csv)
                mx["ecef_vs_forward_m"] = max(mx["ecef_vs_forward_m"], float(np.linalg.norm(fwd - ecef_csv)))
                mx["latlon_vs_inverse_deg"] = max(
                    mx["latlon_vs_inverse_deg"], float(np.max(np.abs(inv[:2] - llh_csv[:2])))
                )
                mx["h_vs_inverse_m"] = max(mx["h_vs_inverse_m"], abs(float(inv[2] - llh_csv[2])))

                # Time column against independent datetime arithmetic.
                want_utc = epoch + dt.timedelta(seconds=r["time_s"] - t0)
                mx["utc_s"] = max(mx["utc_s"], abs((parse_utc(r["utc"]) - want_utc).total_seconds()))

                # (c) NMEA: pynmea2 with checksum validation, both sentences of this sample.
                try:
                    gga = pynmea2.parse(nmea_lines[2 * i], check=True)
                    rmc = pynmea2.parse(nmea_lines[2 * i + 1], check=True)
                except pynmea2.ChecksumError:
                    mx["nmea_checksum_failures"] += 1
                    continue
                g = Geodesic.WGS84.Inverse(llh_csv[0], llh_csv[1], gga.latitude, gga.longitude)
                mx["nmea_horizontal_m"] = max(mx["nmea_horizontal_m"], g["s12"])
                mx["nmea_height_m"] = max(
                    mx["nmea_height_m"], abs(float(gga.altitude) + float(gga.geo_sep) - llh_csv[2])
                )
                when = dt.datetime.combine(rmc.datestamp, rmc.timestamp, tzinfo=dt.timezone.utc)
                mx["nmea_time_s"] = max(mx["nmea_time_s"], abs((when - parse_utc(r["utc"])).total_seconds()))
                ned_csv = ned_of_ecef_velocity(ecef_csv, v_csv)
                speed_ms = float(np.hypot(ned_csv[0], ned_csv[1]))
                mx["nmea_speed_kn"] = max(
                    mx["nmea_speed_kn"], abs(float(rmc.spd_over_grnd) - speed_ms * 3600.0 / 1852.0)
                )
                if kind != "gnss-ins" and rmc.true_course not in (None, ""):
                    mx["nmea_stationary_courses_present"] += 1

                if i % STRIDE == 0 or i == last:
                    row = {
                        "i": i,
                        "ecef_forward_m": fwd.tolist(),
                        "geodetic_inverse_deg_deg_m": inv.tolist(),
                        "v_ned_from_csv_velocity_m_s": ned_csv.tolist(),
                        "nmea": {
                            "lat_deg": float(gga.latitude),
                            "lon_deg": float(gga.longitude),
                            "alt_m": float(gga.altitude),
                            "geo_sep_m": float(gga.geo_sep),
                            "speed_kn": float(rmc.spd_over_grnd),
                            "course_deg": None if rmc.true_course in (None, "") else float(rmc.true_course),
                        },
                    }
                    if i in truth_rows:
                        q = truth_rows[i]["q_wxyz"]
                        rot = Rotation.from_quat([q[1], q[2], q[3], q[0]])  # scipy is x,y,z,w
                        yaw, pitch, roll = rot.as_euler("ZYX", degrees=True)
                        row["euler_zyx_deg"] = [float(yaw % 360.0), float(pitch), float(roll)]
                        vn = truth_rows[i]["v_ned_m_s"]
                        row["course_from_truth_deg"] = float(
                            math.degrees(math.atan2(vn[1], vn[0])) % 360.0
                        )
                        row["speed_from_truth_kn"] = float(math.hypot(vn[0], vn[1]) * 3600.0 / 1852.0)
                    ref_rows.append(row)

            out["scenarios"][scenario] = {
                "kind": kind,
                "samples": len(rows),
                "csv_sha256": sha(csv_bytes),
                "nmea_sha256": sha(nmea_bytes),
                "nmea_sentences": len(nmea_lines),
                "max_over_every_row": mx,
                "rows": ref_rows,
            }
            print(scenario, json.dumps(mx))

    path = os.path.join(FIXTURES, "reference.json")
    with open(path, "w") as f:
        json.dump(out, f, indent=1)
        f.write("\n")
    print("wrote", path)


if __name__ == "__main__":
    main()
