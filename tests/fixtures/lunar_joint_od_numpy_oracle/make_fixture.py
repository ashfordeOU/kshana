#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""numpy (P2) oracle for tests/lunar_joint_od_numpy_oracle.rs.

Reads inputs.json (exported by the engine) and writes numpy_oracle.json, per configuration:
step0 = lstsq(sqrt(W) H0, sqrt(W) r0) (LAPACK gelsd), kappa0 = cond(sqrt(W) H0); and, when the
engine converged, step_hat_norm = |lstsq(sqrt(W) H_hat, sqrt(W) r_hat)|, sigma = sqrt(diag(inv(
H_hat^T W H_hat))) (LAPACK getrf/getri), kappa_hat, station_err_m (station axes 0..3 of x_hat -
x_true times 1e6 m per stored unit) and nees.
Usage: make_fixture.py inputs.json > numpy_oracle.json
"""
import json
import sys

import numpy as np

SCALE = 1.0e6


def main():
    doc = json.load(open(sys.argv[1]))
    out = {}
    for name, c in doc.items():
        w = np.array(c["w"])
        sw = np.sqrt(w)[:, None]
        h0 = np.array(c["H0"])
        r0 = np.array(c["r0"])
        a0 = sw * h0
        step0 = np.linalg.lstsq(a0, sw[:, 0] * r0, rcond=None)[0]
        o = {"step0": step0.tolist(), "kappa0": float(np.linalg.cond(a0))}
        if c["x_hat"] is not None:
            hh = np.array(c["H_hat"])
            rh = np.array(c["r_hat"])
            ah = sw * hh
            sh = np.linalg.lstsq(ah, sw[:, 0] * rh, rcond=None)[0]
            cov = np.linalg.inv(hh.T @ (w[:, None] * hh))
            dx = np.array(c["x_hat"]) - np.array(c["x_true"])
            o.update({
                "step_hat_norm": float(np.linalg.norm(sh)),
                "kappa_hat": float(np.linalg.cond(ah)),
                "sigma": np.sqrt(np.diag(cov)).tolist(),
                "station_err_m": float(np.linalg.norm(dx[:3]) * SCALE),
                "nees": float(dx @ (hh.T @ (w[:, None] * hh)) @ dx),
            })
        out[name] = o
    json.dump(out, sys.stdout, indent=1)


if __name__ == "__main__":
    main()
