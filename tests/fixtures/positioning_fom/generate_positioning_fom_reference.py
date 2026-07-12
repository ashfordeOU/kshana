#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external-oracle reference fixture for the position-domain FoM
(CEP / SEP / 2DRMS) computed by ``kshana::fom::positioning_performance``.

Two genuinely independent oracles, mirroring the repo's other ``*_reference``
fixtures:

  * **Isotropic (circular/spherical) cases** — the exact median radial error is a
    closed-form quantile of a Gaussian error distribution: horizontal CEP =
    ``scipy.stats.rayleigh.ppf(0.5, scale=sigma)`` and 3-D SEP =
    ``scipy.stats.maxwell.ppf(0.5, scale=sigma)``. SciPy (Cephes) is an independent
    codebase from kshana's numerical-quadrature median solver.

  * **Anisotropic cases** — no elementary closed form, so the reference median is an
    independent **NumPy Monte-Carlo** draw from ``multivariate_normal(cov)`` (a
    different algorithm entirely from kshana's exact CDF + bisection). This also
    exercises kshana's eigendecomposition of the full (possibly correlated) 3x3.

2DRMS = ``2*sqrt(sigma_E^2 + sigma_N^2)`` is a closed-form check.

Regenerable offline:  python3 generate_positioning_fom_reference.py
Emits reference.json next to this script. NOTHING here reads kshana output — the
references come only from SciPy / NumPy, so the cross-check is non-circular.
"""
import json
import os
import numpy as np
from scipy.stats import rayleigh, maxwell

RNG = np.random.default_rng(20260712)
N_MC = 6_000_000  # median std-error ~1e-3 relative at this sample size


def mc_medians(cov, n=N_MC):
    """Independent Monte-Carlo median horizontal (CEP) and 3-D (SEP) radial error."""
    s = RNG.multivariate_normal(mean=np.zeros(3), cov=np.asarray(cov), size=n)
    cep = float(np.median(np.hypot(s[:, 0], s[:, 1])))
    sep = float(np.median(np.sqrt((s ** 2).sum(axis=1))))
    return cep, sep


def case(name, cov, hpl, isotropic_sigma=None):
    cE, cN = cov[0][0], cov[1][1]
    drms2 = 2.0 * np.sqrt(cE + cN)
    rec = {
        "name": name,
        "cov": cov,
        "hpl_m": hpl,
        "drms2_m": float(drms2),
    }
    if isotropic_sigma is not None:
        # Exact closed-form quantiles (tight tolerance in the Rust test).
        rec["cep_closed_m"] = float(rayleigh.ppf(0.5, scale=isotropic_sigma))
        rec["sep_closed_m"] = float(maxwell.ppf(0.5, scale=isotropic_sigma))
    cep_mc, sep_mc = mc_medians(cov)
    rec["cep_mc_m"] = cep_mc
    rec["sep_mc_m"] = sep_mc
    return rec


CASES = [
    # Isotropic: exact Rayleigh/Maxwell medians available.
    case("circular_2p5m", [[6.25, 0.0, 0.0], [0.0, 6.25, 0.0], [0.0, 0.0, 6.25]], 12.0, 2.5),
    case("circular_10m", [[100.0, 0.0, 0.0], [0.0, 100.0, 0.0], [0.0, 0.0, 100.0]], 40.0, 10.0),
    # Anisotropic diagonal (3:1 horizontal, distinct vertical) — MC only.
    case("ellipse_3to1", [[9.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 4.0]], 20.0),
    # Correlated horizontal (principal axes {9,1} rotated 45°) — MC exercises the eig.
    case("correlated_45deg", [[5.0, 4.0, 0.0], [4.0, 5.0, 0.0], [0.0, 0.0, 4.0]], 20.0),
    # Fully general small covariance with a vertical correlation.
    case("general", [[4.0, 1.2, 0.5], [1.2, 2.25, -0.3], [0.5, -0.3, 6.25]], 15.0),
]

out = {
    "_provenance": "SciPy 1.13.1 rayleigh/maxwell.ppf (isotropic exact) + NumPy 2.0.2 "
    "multivariate_normal Monte-Carlo median (anisotropic); regenerable offline via "
    "generate_positioning_fom_reference.py. Independent of kshana (non-circular).",
    "n_mc": N_MC,
    "cases": CASES,
}

path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "reference.json")
with open(path, "w") as f:
    json.dump(out, f, indent=2)
print(f"wrote {path} with {len(CASES)} cases (N_MC={N_MC})")
for c in CASES:
    line = f"  {c['name']:18s} 2DRMS={c['drms2_m']:.4f} CEP_mc={c['cep_mc_m']:.4f} SEP_mc={c['sep_mc_m']:.4f}"
    if "cep_closed_m" in c:
        line += f"  CEP_closed={c['cep_closed_m']:.4f} SEP_closed={c['sep_closed_m']:.4f}"
    print(line)
