#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""NumPy/SciPy reference for tests/lunar_observability_numpy_oracle.rs (policy P2).

Reads the committed Jacobians and weights (inputs.json) and recomputes, with LAPACK-backed
NumPy/SciPy routines, the rank and defect of M = H^T W H at the relative threshold 1e-9, the
station position axes' overlap with the null space, and the station Cramer-Rao bound.

Run: source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py inputs.json > reference.json
"""
import json
import sys

import numpy as np
import scipy
import scipy.linalg as sla

REL = 1e-9  # Kshana's stated rank threshold, relative to the largest eigenvalue
GAP = 2.0  # precondition: no singular value within this factor of the threshold
OBS = 1e-6  # station observable when its null overlap is below this


def main():
    doc = json.load(open(sys.argv[1]))
    assert doc["rel_tol"] == REL
    out = []
    for c in doc["cases"]:
        h = np.array(c["jacobian"], dtype=float)
        w = np.array(c["weights"], dtype=float)
        m = h.T @ (w[:, None] * h)
        m = 0.5 * (m + m.T)
        s = np.linalg.svd(m, compute_uv=False)
        thr = REL * s[0]
        near = [x for x in s if thr / GAP <= x <= thr * GAP]
        assert not near, f"{c['name']}: singular values within a factor {GAP} of the threshold: {near}"
        rank = int(np.sum(s > thr))
        n = m.shape[0]
        null = sla.null_space(m, rcond=REL)
        assert null.shape[1] == n - rank
        overlap = float(np.sum(null[:3, :] ** 2))
        crlb = None
        if overlap < OBS:
            cov = np.linalg.inv(m) if rank == n else np.linalg.pinv(m, rcond=REL, hermitian=True)
            crlb = float(np.sqrt(np.trace(cov[:3, :3])) * c["param_scale_m"])
        out.append(
            {
                "name": c["name"],
                "n_params": n,
                "rank": rank,
                "defect": n - rank,
                "station_null_overlap": overlap,
                "station_crlb_m": crlb,
                "smallest_kept_over_largest": float(s[rank - 1] / s[0]),
                "largest_discarded_over_largest": float(s[rank] / s[0]) if rank < n else 0.0,
                "condition_kept": float(s[0] / s[rank - 1]),
            }
        )
    print(
        json.dumps(
            {
                "generator": "tests/fixtures/lunar_observability_numpy_oracle/gen_reference.py",
                "numpy": np.__version__,
                "scipy": scipy.__version__,
                "rel_tol": REL,
                "cases": out,
            },
            indent=1,
        )
    )


if __name__ == "__main__":
    main()
