#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""P2 oracle fixture for the scalar MHSS timing protection level (H = 1_N).

numpy 2.3.5 and scipy 1.18.1 recompute, by their own algorithms, the quantities
`kshana::integrity::tpl_scalar::scalar_tpl` builds its protection level from:

* every estimator is a weighted least-squares solve by `numpy.linalg.lstsq`
  on the whitened system (W^1/2 G) x = W^1/2 y with G = 1_N, never the
  inverse-variance closed form the module uses;
* the separation standard deviation is the general sqrt(Delta Sigma Delta^T)
  with Delta = S_sub - S_ff, never the nested-estimator identity
  sigma_sub^2 - sigma_ff^2 the module uses;
* the multiplier K_fa comes from `scipy.stats.norm.isf`, the risk from
  `scipy.stats.norm.sf`, and the protection level from `scipy.optimize.brentq`.

The multipliers, priors and bias overbounds are inputs; the claim checked is
the linear algebra and the protection level built from it.

Tolerance, fixed before the first comparison: PL relative error <= 1e-9;
driving subset identical.

Run (writes reference.json beside this file):
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/tpl_scalar_numpy_oracle/gen_reference.py
"""
import json
import pathlib

import numpy as np
import scipy
from scipy import optimize, stats

SEED = 20260930
CASES = 300


def estimator(sigmas, keep):
    """Row vector S (length N) of the weighted LS estimator over the rows in keep."""
    n = len(sigmas)
    idx = np.flatnonzero(keep)
    wh = np.diag(1.0 / sigmas[idx])
    g = np.ones((len(idx), 1))
    s_sub, *_ = np.linalg.lstsq(wh @ g, wh, rcond=None)  # 1 x len(idx)
    s = np.zeros(n)
    s[idx] = s_sub[0]
    return s


def case_reference(sigmas, biases, p_fault, ir_budget, p_fa):
    n = len(sigmas)
    cov = np.diag(sigmas**2)
    babs = np.abs(biases)
    s_ff = estimator(sigmas, np.ones(n, dtype=bool))
    sigma_ff = float(np.sqrt(s_ff @ cov @ s_ff))
    bias_ff = float(np.abs(s_ff) @ babs)
    modes = [(1.0 - float(np.sum(p_fault)), 0.0, bias_ff, sigma_ff)]
    k_fa = float(stats.norm.isf(p_fa / (2.0 * n))) if n >= 2 else float(stats.norm.isf(p_fa / 2.0))
    subsets = []
    driving = None
    if n >= 2:
        metrics = []
        for j in range(n):
            keep = np.ones(n, dtype=bool)
            keep[j] = False
            s_j = estimator(sigmas, keep)
            sigma_j = float(np.sqrt(s_j @ cov @ s_j))
            delta = s_j - s_ff
            sigma_ss = float(np.sqrt(delta @ cov @ delta))
            bias_j = float(np.abs(s_j) @ babs)
            thr = k_fa * sigma_ss
            modes.append((float(p_fault[j]), thr, bias_j, sigma_j))
            metrics.append(bias_j + thr + sigma_j)
            subsets.append(
                {"sigma_sub_s": sigma_j, "sigma_ss_s": sigma_ss, "bias_sub_s": bias_j, "threshold_s": thr}
            )
        driving = int(np.argmax(metrics))

    target = ir_budget / 2.0

    def risk(pl):
        return sum(p * stats.norm.sf((pl - b - t) / s) for (p, t, b, s) in modes)

    hi = max(b + t for (_, t, b, _) in modes) + 40.0 * max(s for (*_, s) in modes)
    pl = optimize.brentq(lambda x: risk(x) - target, 0.0, hi, xtol=1e-300, rtol=4 * np.finfo(float).eps, maxiter=500)
    return {
        "sigma_ff_s": sigma_ff,
        "bias_ff_s": bias_ff,
        "k_fa": k_fa,
        "subsets": subsets,
        "driving_subset": driving,
        "pl_s": float(pl),
    }


def main():
    rng = np.random.default_rng(SEED)
    cases = []
    for _ in range(CASES):
        n = int(rng.integers(1, 9))
        sigmas = 10.0 ** rng.uniform(np.log10(0.5e-9), np.log10(100e-9), n)
        biases = rng.uniform(0.0, 20e-9, n)
        p_fault = 10.0 ** rng.uniform(-6.0, -3.0, n)
        ir_budget = float(10.0 ** rng.uniform(-7.0, -4.0))
        p_fa = float(10.0 ** rng.uniform(-6.0, -2.0))
        ref = case_reference(sigmas, biases, p_fault, ir_budget, p_fa)
        cases.append(
            {
                "sigma_s": sigmas.tolist(),
                "bias_s": biases.tolist(),
                "p_fault": p_fault.tolist(),
                "ir_budget": ir_budget,
                "p_fa": p_fa,
                **ref,
            }
        )
    out = {
        "generator": "tests/fixtures/tpl_scalar_numpy_oracle/gen_reference.py",
        "numpy": np.__version__,
        "scipy": scipy.__version__,
        "seed": SEED,
        "tolerance": {"pl_relative": 1e-9, "driving_subset": "exact"},
        "cases": cases,
    }
    path = pathlib.Path(__file__).resolve().parent / "reference.json"
    path.write_text(json.dumps(out, indent=1) + "\n")
    print(f"wrote {path}: {len(cases)} cases")


if __name__ == "__main__":
    main()
