#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE-geometry and NumPy reference for tests/lunar_vlbi_surface_point_spice_oracle.rs.

SPICE leg: rebuild the observing schedule and every beacon Jacobian row of the
`lunar-vlbi-fim` all-stations-fixed scenario from SPICE geometry (DE440 Earth and Moon, ITRF93
Earth orientation, the beacon fixed in MOON_ME) by central differences of converged Newtonian
light-time differences, then do the linear algebra with NumPy. P2 leg: the same linear algebra
on the engine's committed Jacobian. The light-time, row and analysis functions are imported
from the M069 oracle generator beside this directory (SPICE and NumPy only); no Kshana code.

Run: source ~/Code/kshana-oracles/env.sh
     $ORACLE_PY gen_reference.py inputs.json > reference.json
"""
import json
import os
import pathlib
import sys

import numpy as np
import scipy
import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "lunar_vlbi_campaign_spice_oracle"))
import gen_reference as m069  # noqa: E402  (oracle code: SPICE light times, NumPy analysis)

C = m069.C


def summary(jac, w, inp, rho, baseline):
    info = jac.T @ (w[:, None] * jac)
    out = m069.analyse(info, inp["rel_tol"])
    p = info.shape[0]
    cov = np.array(out["covariance"])
    rms = float(np.sqrt(np.trace(cov) / p))
    n_obs = len(w)
    lever = rho / baseline
    eq = C * inp["delay_sigma_s"] * lever * np.sqrt(3.0 / n_obs)
    out.update(
        {
            "rms_beacon_sigma_m": rms,
            "lever_arm": lever,
            "beacon_range_m": rho,
            "longest_baseline_m": baseline,
            "equipartition_m": float(eq),
            "ratio_computed_over_equipartition": rms / float(eq),
        }
    )
    return out


def main():
    for k in m069.KERNELS:
        sp.furnsh(os.path.join(m069.NAIF, k))
    inp = json.load(open(sys.argv[1]))
    et0 = sp.str2et(inp["epoch_utc"])  # ISO calendar string, read as UTC
    stations = [m069.station_itrf(*s) for s in inp["stations"]]
    b_body = m069.body_point(*inp["beacon_selenographic_deg_deg_m"])
    n_st = len(stations)
    geos = [m069.Geometry(et0 + k * inp["step_min"] * 60.0, "MOON_ME") for k in range(inp["n_epochs"])]
    obs, rows = [], []
    for e, g in enumerate(geos):
        b_itrf = g.beacon_itrf(b_body)
        vis = [
            m069.earth_elevation_deg(lat, lon, stations[s], b_itrf) >= inp["elevation_mask_deg"]
            for s, (lat, lon, _) in enumerate(inp["stations"])
        ]
        for i in range(n_st):
            for j in range(i + 1, n_st):
                if vis[i] and vis[j]:
                    obs.append([e, i, j])
                    rows.append(m069.delay_row(g, stations, b_body, i, j, {}, 0, 3))
    jac = np.array(rows)
    w = np.full(len(rows), 1.0 / inp["delay_sigma_s"] ** 2)
    rho = float(np.linalg.norm(geos[0].beacon_geocentric_j2000(b_body)))
    baseline = max(
        float(np.linalg.norm(stations[i] - stations[j])) for i in range(n_st) for j in range(i + 1, n_st)
    )
    spice = summary(jac, w, inp, rho, baseline)
    spice.update({"observations": obs, "jacobian": jac.tolist()})
    p2 = summary(np.array(inp["engine_jacobian"]), np.array(inp["weights"]), inp, rho, baseline)
    out = {
        "generator": "tests/fixtures/lunar_vlbi_surface_point_spice_oracle/gen_reference.py",
        "spice_toolkit": sp.tkvrsn("TOOLKIT"),
        "spiceypy": sp.__version__,
        "numpy": np.__version__,
        "scipy": scipy.__version__,
        "kernels_sha256": {k: m069.sha256(os.path.join(m069.NAIF, k)) for k in m069.KERNELS},
        "name": inp["name"],
        "spice": spice,
        "p2": p2,
    }
    print(json.dumps(out, indent=1))


if __name__ == "__main__":
    main()
