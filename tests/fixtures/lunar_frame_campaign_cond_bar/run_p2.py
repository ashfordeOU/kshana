#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""P2 (NumPy) leg of docs/design/evidence/mr05-lunar-datum-cond/PREREGISTRATION.md.

Imports `campaign_summary` (and through it `analyse`) of
tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py unmodified and runs it on the
engine's committed Jacobians of all eight scenarios: the six of
../lunar_vlbi_campaign_spice_oracle/inputs.json and the two fresh ones of fresh_inputs.json.
It also computes, with numpy.linalg.eigvalsh, the condition ingredient of the pre-registered
bar:

    kappa(X) = largest eigenvalue / smallest eigenvalue above rel_tol * largest
    kappa    = max(kappa(F), kappa(T^T F T)),   t = max(1e-12, S * kappa * u),  S = 10, u = 2^-53

with F = J^T W J (stations and beacons; the beacon block alone when the stations are fixed,
which is all of F then) and T = diag(I_s, A), A the Helmert design. No SPICE call is made.
Calls no Kshana code. Writes reference.json beside this script.

    $ORACLE_PY tests/fixtures/lunar_frame_campaign_cond_bar/run_p2.py
"""
import json
import pathlib
import sys

import numpy as np
import scipy

HERE = pathlib.Path(__file__).resolve().parent
ORACLE = HERE.parent / "lunar_vlbi_campaign_spice_oracle"
sys.path.insert(0, str(ORACLE))
import gen_reference as g  # noqa: E402

U = 2.0 ** -53
S = 10.0
KEEP = ("rank", "defect", "eigenvalues", "condition", "sigma", "null_space_columns",
        "weakest_direction", "translation_norm_m", "offblock_fraction",
        "max_interbeacon_correlation", "independence_discarded_translation_norm_m")


def kappa(x, rel_tol):
    x = 0.5 * (x + x.T)
    lam = np.linalg.eigvalsh(x)
    lmax = lam.max()
    kept = lam[lam > rel_tol * lmax]
    return float(lmax / kept.min())


def one(inp):
    jac = np.array(inp["engine_jacobian"])
    w = np.array(inp["weights"])
    n_sc = inp["n_station_columns"]
    a = np.array(inp["helmert_design"])
    n_b = a.shape[0] // 3
    rel_tol = inp["rel_tol"]
    try:
        p2 = g.campaign_summary(jac, w, n_sc, n_b, a, rel_tol)
        p2 = {key: p2[key] for key in KEEP}
    except np.linalg.LinAlgError as e:
        # The unchanged oracle cannot evaluate this scenario; recorded, never substituted.
        p2 = {"error": "LinAlgError: %s" % e}
    f = jac.T @ (w[:, None] * jac)
    t_mat = np.zeros((n_sc + 3 * n_b, n_sc + 7))
    t_mat[:n_sc, :n_sc] = np.eye(n_sc)
    t_mat[n_sc:, n_sc:] = a
    k_f = kappa(f, rel_tol)
    k_tft = kappa(t_mat.T @ f @ t_mat, rel_tol)
    k = max(k_f, k_tft)
    return {
        "name": inp["name"],
        "n_station_columns": n_sc,
        "kappa_F": k_f,
        "kappa_TtFT": k_tft,
        "kappa": k,
        "t": max(1e-12, S * k * U),
        "p2": p2,
    }


def main():
    six = json.loads((ORACLE / "inputs.json").read_text())["lunar_frame_campaign"]
    fresh = json.loads((HERE / "fresh_inputs.json").read_text())["lunar_frame_campaign"]
    out = {
        "generator": "run_p2.py (campaign_summary of gen_reference.py, unmodified)",
        "numpy": np.__version__,
        "scipy": scipy.__version__,
        "u": U,
        "S": S,
        "scenarios": [one(inp) for inp in six + fresh],
    }
    (HERE / "reference.json").write_text(json.dumps(out, indent=1) + "\n")
    for s in out["scenarios"]:
        print("%-26s kappa_F %.3e kappa_TtFT %.3e t %.3e" % (s["name"], s["kappa_F"], s["kappa_TtFT"], s["t"]))


if __name__ == "__main__":
    main()
