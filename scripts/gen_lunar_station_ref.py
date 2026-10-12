#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent numpy re-computation of the lunar-station-coverage arithmetic.

Pre-registered in tests/fixtures/lunar_station/PREREGISTRATION.md before its first run.

Reads tests/fixtures/lunar_station/cases.json (written by
examples/gen_lunar_station_ref_inputs.rs: the run's own draws for 20 fixed cases, and every
point's samples) and recomputes, from the draws alone and with numpy only, no Kshana code:

  * the satellites above the mask at the user and at the station
    (sin(elevation) = unit(sat - observer) . unit(observer) >= sin(mask));
  * the station's corrections for the satellites the user uses:
    -orbit . unit(sat - station) + clock + (|sat - station| - |sat - believed station|);
  * the user's raw range errors, -orbit . unit(sat - user) + clock, and corrected ones:
    raw - correction, then (+ a) - b for the two receiver-noise draws, then - link error;
  * the snapshot least-squares position error: rows [-unit(sat - user), 1], solved by
    numpy.linalg.solve on the normal equations; the corrected and uncorrected vectors, their
    3-D magnitudes, the vertical (along unit(user)) and the horizontal magnitudes;
  * each point's percentile of its corrected 3-D samples with numpy.percentile,
    method="linear" (numpy's default).

Writes tests/fixtures/lunar_station/reference.json. It checks the arithmetic, not the
model: the row stays MODELLED.

Usage:  python3 scripts/gen_lunar_station_ref.py
"""
import json
import os
import sys

import numpy as np

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FIX = os.path.join(ROOT, "tests", "fixtures", "lunar_station")


def unit(v):
    n = np.linalg.norm(v)
    return v / n if n != 0 else v * 0.0


def visible(observer, sats, mask_rad):
    up = unit(observer)
    s = np.sin(mask_rad)
    return [bool(np.dot(unit(x - observer), up) >= s) for x in sats]


def solve(user, sats, r):
    g = np.array([np.append(-unit(s - user), 1.0) for s in sats])
    a = g.T @ g
    b = g.T @ np.asarray(r)
    dx = np.linalg.solve(a, b)
    return dx[:3]


def case(c):
    user = np.array(c["user_mcmf"])
    station = np.array(c["station_mcmf"])
    believed = np.array(c["station_assumed_mcmf"])
    sats = np.array(c["sats_mcmf"])
    orbit = np.array(c["orbit_err_m"])
    clock = np.array(c["clock_err_m"])
    link = np.array(c["link_err_m"])
    mask = c["mask_rad"]
    user_sees = visible(user, sats, mask)
    station_sees = visible(station, sats, mask)
    used = [i for i, v in enumerate(user_sees) if v]
    if len(used) < 4:
        status = "user_lt4"
    elif any(not station_sees[i] for i in used):
        status = "station_missing_sat"
    else:
        status = "available"
    out = {"used": used, "status": status}
    if status != "available":
        return out
    ev = c["eval"]
    corr, raw, cre = [], [], []
    for n, i in enumerate(used):
        s = sats[i]
        corr_i = (-np.dot(orbit[i], unit(s - station)) + clock[i]
                  + (np.linalg.norm(s - station) - np.linalg.norm(s - believed)))
        raw_i = -np.dot(orbit[i], unit(s - user)) + clock[i]
        e = raw_i - corr_i
        if ev["noise_a_m"]:
            e = (e + ev["noise_a_m"][n]) - ev["noise_b_m"][n]
        if link[i] != 0.0:
            e = e - link[i]
        corr.append(corr_i)
        raw.append(raw_i)
        cre.append(e)
    us = sats[used]
    dc = solve(user, us, cre)
    du = solve(user, us, raw)
    e3 = float(np.linalg.norm(dc))
    v = float(np.dot(dc, unit(user)))
    out.update({
        "corrections_m": [float(x) for x in corr],
        "raw_range_m": [float(x) for x in raw],
        "corrected_range_m": [float(x) for x in cre],
        "corrected_vec_m": [float(x) for x in dc],
        "uncorrected_vec_m": [float(x) for x in du],
        "corrected_3d_m": e3,
        "corrected_h_m": float(np.sqrt(max(e3 * e3 - v * v, 0.0))),
        "corrected_v_m": abs(v),
        "uncorrected_3d_m": float(np.linalg.norm(du)),
    })
    return out


def main():
    doc = json.load(open(os.path.join(FIX, "cases.json"), encoding="utf-8"))
    p = doc["percentile"]
    cases = [case(c) for c in doc["cases"]]
    points = [{
        "point_index": pt["point_index"],
        "n_samples": len(pt["samples_corrected_3d_m"]),
        "numpy_percentile_m": (float(np.percentile(np.array(pt["samples_corrected_3d_m"]), p, method="linear"))
                               if pt["samples_corrected_3d_m"] else None),
    } for pt in doc["points"]]
    ref = {
        "oracle": f"numpy {np.__version__} (linalg.solve, percentile method='linear'); "
                  "scripts/gen_lunar_station_ref.py, pre-registered in PREREGISTRATION.md",
        "cases": cases,
        "points": points,
    }
    with open(os.path.join(FIX, "reference.json"), "w", encoding="utf-8") as f:
        json.dump(ref, f, indent=1, sort_keys=True)
        f.write("\n")
    print(f"wrote reference.json: {len(cases)} cases, {len(points)} points, numpy {np.__version__}")


if __name__ == "__main__":
    sys.exit(main())
