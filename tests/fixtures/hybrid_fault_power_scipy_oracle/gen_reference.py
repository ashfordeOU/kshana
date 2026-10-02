#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Library oracle fixture for the hybrid-optical-rf cross-modality monitor's detection power.

The monitor definition is taken from the specification, not from the engine's output: a
chi-square separation test over four monitored axes (east, north, up, clock), so 4 degrees of
freedom. SciPy computes, per configuration:

    T        = scipy.stats.chi2.isf(P_fa, 4)
    lambda*  : scipy.optimize.brentq on scipy.stats.ncx2.cdf(T, 4, lambda) - P_md
    P_d(0)   = scipy.stats.chi2.sf(T, 4)
    P_d(m)   = scipy.stats.ncx2.sf(T, 4, m^2 lambda*)  for each multiple m > 0 of the MDB
    crossing = sqrt(T / lambda*)

The sigma-dependent values (MDB, fault magnitudes, ramp times) are formed in the Rust test from
sqrt(lambda*) and the specification's sigma_rf^2 + sigma_opt^2 pairing.

Run (writes reference.json beside this file):
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/hybrid_fault_power_scipy_oracle/gen_reference.py
"""
import json
import math
import pathlib

import scipy
from scipy.optimize import brentq
from scipy.stats import chi2, ncx2

DOF = 4  # east, north, up, clock
MULTIPLES = [0.0, 0.1, 0.25, 0.5, 0.65, 0.75, 0.9, 1.0, 1.1, 1.25, 1.5, 2.0]
CONFIGURATIONS = [
    ("default", {}),
    ("strict_risk", {"p_fa": 1e-7, "p_md": 1e-5}),
    (
        "loose_risk_wide_rf",
        {
            "p_fa": 1e-3,
            "p_md": 1e-2,
            "rf_pos_sigma_m": 2.5,
            "rf_vertical_sigma_m": 4.0,
            "rf_clock_sigma_s": 1e-8,
            "fault_ramp_rate_pos_m_s": 0.2,
            "fault_ramp_rate_clock_s_s": 5e-11,
        },
    ),
    ("high_missed_detection", {"p_fa": 1e-6, "p_md": 0.1}),
]
DEFAULT_P_FA = 1e-5  # specification defaults of the scenario
DEFAULT_P_MD = 1e-3


def solve(p_fa, p_md):
    t = float(chi2.isf(p_fa, DOF))
    f = lambda lam: float(ncx2.cdf(t, DOF, lam)) - p_md  # noqa: E731
    hi = 1.0
    while f(hi) > 0.0:
        hi *= 2.0
    lam = brentq(f, 1e-12, hi, xtol=1e-14, rtol=4.0 * 2.0**-52, maxiter=500)
    curve = [
        float(chi2.sf(t, DOF)) if m == 0.0 else float(ncx2.sf(t, DOF, m * m * lam))
        for m in MULTIPLES
    ]
    return {
        "dof": DOF,
        "threshold": t,
        "lambda_star": lam,
        "root_lambda_star": math.sqrt(lam),
        "p_detect_zero": float(chi2.sf(t, DOF)),
        "p_detect_at_mdb": float(ncx2.sf(t, DOF, lam)),
        "crossing_multiple": math.sqrt(t / lam),
        "p_detect_curve": curve,
        "residual_at_lambda_star": f(lam),
    }


def main():
    configs = []
    for name, scenario in CONFIGURATIONS:
        p_fa = scenario.get("p_fa", DEFAULT_P_FA)
        p_md = scenario.get("p_md", DEFAULT_P_MD)
        entry = {"name": name, "scenario": scenario}
        entry.update(solve(p_fa, p_md))
        configs.append(entry)
    out = {
        "generator": "tests/fixtures/hybrid_fault_power_scipy_oracle/gen_reference.py",
        "scipy": scipy.__version__,
        "oracle": "scipy.stats.chi2.isf / chi2.sf, scipy.stats.ncx2.cdf / ncx2.sf, scipy.optimize.brentq",
        "multiples": MULTIPLES,
        "configurations": configs,
    }
    path = pathlib.Path(__file__).resolve().parent / "reference.json"
    path.write_text(json.dumps(out, indent=1) + "\n")
    for c in configs:
        print(f"{c['name']}: T={c['threshold']:.12g} lambda*={c['lambda_star']:.12g} "
              f"brentq residual {c['residual_at_lambda_star']:.2e}")


if __name__ == "__main__":
    main()
