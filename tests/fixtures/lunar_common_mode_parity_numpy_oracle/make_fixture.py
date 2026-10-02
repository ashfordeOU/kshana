#!/usr/bin/env python3
"""Fixture generator for tests/lunar_common_mode_parity_numpy_oracle.rs.

Inputs (inputs.json): the user and 8 satellite positions of tests/fixtures/common_mode/
reference.json (unchanged), two geometries (all 8 satellites; satellites 1 to 6), and for each
of the 366 epochs of the two real inter-ephemeris pairs (DE440 - INPOP21a, DE440 - EPM2021,
tests/fixtures/inter_ephemeris/moon_geo.csv) a measurement error
    delta_y_i = e_i . Delta_s + w_i,
w_i independent per satellite, normal with standard deviation 1 m, drawn once from
numpy.random.default_rng(20261001).

Oracle (numpy_reference.json): numpy.linalg.lstsq (LAPACK gelsd, SVD) on each case.

Usage: $ORACLE_PY tests/fixtures/lunar_common_mode_parity_numpy_oracle/make_fixture.py
"""
import csv
import json
import os

import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
FIX = os.path.join(HERE, "..")
SIGMA_W = 1.0
SEED = 20261001
GEOMETRIES = [list(range(8)), list(range(6))]
PAIRS = [("DE440", "INPOP21a"), ("DE440", "EPM2021")]


def main():
    ref = json.load(open(os.path.join(FIX, "common_mode", "reference.json")))
    user = np.array(ref["constellation"]["user"])
    sats = np.array(ref["constellation"]["sats"])
    series, days = {}, []
    with open(os.path.join(FIX, "inter_ephemeris", "moon_geo.csv"), newline="") as f:
        for row in csv.DictReader(f):
            d = float(row["day"])
            series.setdefault(row["provider"], {})[d] = np.round(
                np.array([float(row["x_m"]), float(row["y_m"]), float(row["z_m"])]), 6)
            if row["provider"] == "DE440":
                days.append(d)
    rng = np.random.default_rng(SEED)
    cases, out = [], []
    for gi, idx in enumerate(GEOMETRIES):
        e = np.array([(sats[i] - user) / np.linalg.norm(sats[i] - user) for i in idx])
        g = np.hstack([-e, np.ones((len(idx), 1))])
        for a, b in PAIRS:
            for d in days:
                ds = np.round(series[a][d] - series[b][d], 6)
                dy = e @ ds + rng.normal(0.0, SIGMA_W, len(idx))
                dy = [float(repr_round(x)) for x in dy]
                cases.append({"geometry": gi, "pair": f"{a}-{b}", "day": d, "delta_y": dy})
                y = np.array(dy)
                x, *_ = np.linalg.lstsq(g, y, rcond=None)
                pred = g @ x
                r = y - pred
                bn, dn = float(np.linalg.norm(pred)), float(np.linalg.norm(r))
                out.append({"blind_dx": [float(v) for v in x], "residual": [float(v) for v in r],
                            "blind_norm": bn, "detectable_norm": dn,
                            "blind_fraction": bn / float(np.linalg.norm(y))})
    json.dump({"description": "Inputs for tests/lunar_common_mode_parity_numpy_oracle.rs; see make_fixture.py",
               "user": [float(v) for v in user], "sats": [[float(v) for v in s] for s in sats],
               "geometries": GEOMETRIES, "sigma_w_m": SIGMA_W, "seed": SEED, "cases": cases},
              open(os.path.join(HERE, "inputs.json"), "w"), indent=0)
    json.dump({"oracle": "numpy %s linalg.lstsq (LAPACK gelsd)" % np.__version__, "cases": out},
              open(os.path.join(HERE, "numpy_reference.json"), "w"), indent=0)


def repr_round(x):
    # 17 significant digits: what the JSON file stores and the test reads back.
    return "%.17g" % x


if __name__ == "__main__":
    main()
