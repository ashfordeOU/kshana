#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""P2 oracle fixture for the undetectable common-mode ceiling min(alpha_ss, alpha_cm).

numpy (LAPACK, the Linear Algebra PACKage) computes every Omega^-1 x with `numpy.linalg.solve`
(LAPACK gesv: LU with partial pivoting, no Cholesky):
    c   = 1^T Omega^-1 1,   a = 1^T Omega^-1 d,   mu = a / c,   v = d - mu 1
    alpha_ss = T_ss / sqrt(v^T Omega^-1 v)
    alpha_cm = sqrt(T_cm c) / |a|
Positive-definiteness is decided by `numpy.linalg.cholesky` raising LinAlgError, confirmed by
`numpy.linalg.eigvalsh`. The thresholds are inputs: T_ss uniform in [1, 8] and
T_cm = scipy.stats.chi2.isf(p, 1) with p log-uniform in [1e-9, 1e-2].

Tiers (see tests/gls_outside_omega_bound_numpy_oracle.rs for the pre-registered rules):
  A  200 well-conditioned SPD cases (cond <= 100), |cos_w| in [0.1, 0.9]
  B  40 ill-conditioned SPD cases (30 Q diag Q^T, cond in [1e3, 1e8]; 10 shared-reference
     Omega_ij = s_i s_j (rho + (1 - rho) delta_ij), rho in [0.999, 0.9999999]), same rule
  P  5 pure common-mode directions d = k 1
  O  5 directions outside the modelled common axis, d = w - mu_w 1 (1^T Omega^-1 d = 0 exactly
     in exact arithmetic)
  Z  6 cases with no finite ceiling: d = 0 (N = 1, 3, 5) and three indefinite Omega

Run (writes reference.json beside this file):
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/gls_outside_omega_bound_numpy_oracle/gen_reference.py
"""
import json
import pathlib

import numpy as np
import scipy
from scipy.stats import chi2

SEED = 20261002


def symmetric(m):
    return 0.5 * (m + m.T)  # exactly symmetric in f64


def ceilings(omega, d, t_ss, t_cm):
    ones = np.ones(len(d))
    x1 = np.linalg.solve(omega, ones)
    xd = np.linalg.solve(omega, d)
    c = float(ones @ x1)
    a = float(ones @ xd)
    q = float(d @ xd)
    mu = a / c
    v = d - mu
    contrast_sq = float(v @ np.linalg.solve(omega, v))
    alpha_ss = t_ss / np.sqrt(contrast_sq) if contrast_sq > 0.0 else float("inf")
    alpha_cm = np.sqrt(t_cm * c) / abs(a) if a != 0.0 else float("inf")
    return {
        "alpha_ss": float(alpha_ss),
        "alpha_cm": float(alpha_cm),
        "min": float(min(alpha_ss, alpha_cm)),
        "cos_w": a / np.sqrt(c * q),
    }


def thresholds(rng):
    return float(rng.uniform(1.0, 8.0)), float(chi2.isf(10.0 ** rng.uniform(-9.0, -2.0), 1))


def well_conditioned(rng):
    while True:
        n = int(rng.integers(2, 9))
        scale = float(10.0 ** rng.uniform(-2.0, 2.0))
        a = rng.standard_normal((n, n)) * scale
        omega = symmetric(a @ a.T / n + np.diag(rng.uniform(0.1, 1.0, n) * scale**2))
        if np.linalg.cond(omega) <= 100.0:
            return omega


def ill_conditioned(rng, k):
    n = int(rng.integers(2, 9))
    scale = float(10.0 ** rng.uniform(-2.0, 2.0))
    if k < 30:
        q, _ = np.linalg.qr(rng.standard_normal((n, n)))
        target = 10.0 ** rng.uniform(3.0, 8.0)
        lam = np.logspace(0.0, -np.log10(target), n) * scale**2
        rng.shuffle(lam)
        omega = symmetric(q @ np.diag(lam) @ q.T)
    else:
        s = rng.uniform(0.5, 2.0, n) * scale
        rho = 1.0 - 10.0 ** rng.uniform(-7.0, -3.0)
        omega = symmetric(np.diag(s**2) * (1.0 - rho) + rho * np.outer(s, s))
    np.linalg.cholesky(omega)  # must be SPD
    return omega


def direction(rng, omega):
    n = omega.shape[0]
    while True:
        d = rng.standard_normal(n)
        t_ss, t_cm = thresholds(rng)
        ref = ceilings(omega, d, t_ss, t_cm)
        if 0.1 <= abs(ref["cos_w"]) <= 0.9:
            return d, t_ss, t_cm, ref


def entry(tier, omega, d, t_ss, t_cm, ref):
    out = {
        "tier": tier,
        "omega": omega.tolist(),
        "direction": d.tolist(),
        "t_ss": t_ss,
        "t_cm": t_cm,
        "cond": float(np.linalg.cond(omega)),
    }
    out.update(ref)
    return out


def main():
    rng = np.random.default_rng(SEED)
    cases = []
    for _ in range(200):
        omega = well_conditioned(rng)
        d, t_ss, t_cm, ref = direction(rng, omega)
        cases.append(entry("A", omega, d, t_ss, t_cm, ref))
    for k in range(40):
        omega = ill_conditioned(rng, k)
        d, t_ss, t_cm, ref = direction(rng, omega)
        cases.append(entry("B", omega, d, t_ss, t_cm, ref))
    for k in [1.0, 2.0, -0.5, 3.0, 0.1]:
        omega = well_conditioned(rng)
        d = np.full(omega.shape[0], k)
        t_ss, t_cm = thresholds(rng)
        ref = ceilings(omega, d, t_ss, t_cm)
        ref["alpha_ss"] = float("inf")  # separation is blind to d proportional to 1
        ref["min"] = ref["alpha_cm"]
        cases.append(entry("P", omega, d, t_ss, t_cm, ref))
    for _ in range(5):
        omega = well_conditioned(rng)
        n = omega.shape[0]
        w = rng.standard_normal(n)
        ones = np.ones(n)
        mu_w = float(ones @ np.linalg.solve(omega, w)) / float(ones @ np.linalg.solve(omega, ones))
        d = w - mu_w
        t_ss, t_cm = thresholds(rng)
        ref = ceilings(omega, d, t_ss, t_cm)
        ref["alpha_cm"] = float("inf")  # the common-mode statistic is blind to this d
        ref["min"] = ref["alpha_ss"]
        cases.append(entry("O", omega, d, t_ss, t_cm, ref))
    for n in [1, 3, 5]:
        omega = well_conditioned(rng) if n > 1 else np.array([[float(rng.uniform(0.1, 4.0))]])
        omega = omega[:n, :n] if omega.shape[0] >= n else np.eye(n) * 2.0
        t_ss, t_cm = thresholds(rng)
        cases.append({"tier": "Z", "why": f"zero direction, N={n}", "omega": omega.tolist(),
                      "direction": [0.0] * n, "t_ss": t_ss, "t_cm": t_cm, "min": float("inf")})
    for n in [2, 3, 4]:
        q, _ = np.linalg.qr(rng.standard_normal((n, n)))
        lam = rng.uniform(0.5, 2.0, n)
        lam[0] = -float(rng.uniform(1e-3, 0.5)) * float(lam.max())
        omega = symmetric(q @ np.diag(lam) @ q.T)
        assert np.linalg.eigvalsh(omega).min() < 0.0
        try:
            np.linalg.cholesky(omega)
            raise AssertionError("indefinite Omega factored")
        except np.linalg.LinAlgError:
            pass
        d = rng.standard_normal(n)
        t_ss, t_cm = thresholds(rng)
        cases.append({"tier": "Z", "why": f"indefinite Omega, N={n}", "omega": omega.tolist(),
                      "direction": d.tolist(), "t_ss": t_ss, "t_cm": t_cm, "min": float("inf")})
    out = {
        "generator": "tests/fixtures/gls_outside_omega_bound_numpy_oracle/gen_reference.py",
        "numpy": np.__version__,
        "scipy": scipy.__version__,
        "seed": SEED,
        "oracle": "numpy.linalg.solve (LAPACK gesv); scipy.stats.chi2.isf for T_cm inputs only",
        "cases": cases,
    }
    path = pathlib.Path(__file__).resolve().parent / "reference.json"
    # Infinity is written as a string so the fixture stays strict JSON.
    text = json.dumps(out, indent=1, allow_nan=True).replace("Infinity", '"inf"')
    path.write_text(text + "\n")
    tiers = {}
    for c in cases:
        tiers[c["tier"]] = tiers.get(c["tier"], 0) + 1
    conds_b = [c["cond"] for c in cases if c["tier"] == "B"]
    print(f"wrote {path}: {len(cases)} cases {tiers}; tier B cond {min(conds_b):.3g}..{max(conds_b):.3g}")


if __name__ == "__main__":
    main()
