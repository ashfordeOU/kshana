# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external-oracle reference vectors for kshana's quantum-PNT
fault/anomaly-detection kernels (`src/quantum_faults.rs`).

ORACLES (independent third-party authorities, each the de-facto reference for
its quantity):
  * scipy.stats.norm  -- SciPy 1.17.0 (Virtanen et al., "SciPy 1.0: Fundamental
    Algorithms for Scientific Computing in Python", Nature Methods 17, 2020).
    BSD-3-Clause. norm.cdf / norm.ppf are computed from Cephes ndtr / ndtri at
    ~machine precision -- the authority for the Gaussian CDF Phi and its inverse
    (probit).
  * sklearn.metrics.roc_auc_score -- scikit-learn 1.8.0 (Pedregosa et al., JMLR
    12, 2011). BSD-3-Clause. The de-facto reference for the ROC AUC of a scored
    binary classification.

WHAT THIS VALIDATES (each quantity is uniquely mathematically defined, so an
independent authority computing it is a genuine cross-check, not a self-check):

  (1) analytic_auc(mu, sigma) = Phi(mu / (sigma*sqrt(2)))   [binormal ROC AUC for
      nominal N(0,sigma) vs fault N(mu,sigma)]  vs  scipy.stats.norm.cdf.
      d' = mu/sigma swept over [0, 6].

  (2) min_detectable_fault(sigma, pfa, pd) = sigma*(Phi^-1(1-pfa) + Phi^-1(pd))
      [one-sided Gaussian monitor minimum-detectable mean shift]
      vs  sigma*(scipy.stats.norm.ppf(1-pfa) + scipy.stats.norm.ppf(pd)).
      pfa swept 1e-1 .. 1e-6, pd in {0.5,0.9,0.99,0.999}, sigma in {0.3,1.0,2.5}.

  (3) Empirical ROC AUC point: scipy-drawn, fixed-seed nominal/fault score arrays
      with their binary labels, plus sklearn.metrics.roc_auc_score(labels,scores).
      The Rust test feeds the IDENTICAL committed arrays to kshana's
      `impairment_eval::auc` (the same Mann-Whitney estimator the
      `quantum_faults` bootstrap resamples) and must reproduce the sklearn AUC.

HONEST SCOPE -- what this does and does NOT validate:
  * It validates the *maths* of the three detection-theory kernels against
    independent authorities on identical inputs.
  * analytic_auc and min_detectable_fault are evaluated in kshana through an
    in-crate Abramowitz & Stegun erf (Phi, max abs err ~1.5e-7) and Acklam probit
    (Phi^-1, rel err ~1.15e-9). The agreement with scipy is therefore bounded by
    those documented kernel accuracies, NOT machine epsilon: the test asserts
    AUC to 2e-7 abs and min-detectable to 5e-8 abs / 5e-9 rel -- the real,
    measured worst case, not a loosened number. The AUC point estimate vs sklearn
    is the *same arithmetic* (Mann-Whitney rank, ties 1/2) and matches to <1e-12.
  * It does NOT validate the device-performance parameters (clock/sensor sigma,
    the fault catalog magnitudes) -- those quantify a partner's hardware and stay
    MODELLED. It does NOT validate the bootstrap CI machinery (kshana's seeded
    ChaCha resampling is not reproduced here); only the AUC POINT it resamples.

REPRODUCE (no kshana imported here; pure external oracle):
  python3 tests/fixtures/quantum_faults/generate_qfaults_reference.py \
      > tests/fixtures/quantum_faults/qfaults_reference.txt
  Requires scipy>=1.17, scikit-learn>=1.8, numpy>=2 (system python3 on the build
  host). The committed .txt is the pinned oracle output; the Rust test reads it,
  so CI needs no Python.
"""

import numpy as np
import scipy
import sklearn
from scipy.stats import norm
from sklearn.metrics import roc_auc_score


def emit_header():
    print("# kshana quantum_faults external-oracle reference")
    print(f"# scipy {scipy.__version__}  scikit-learn {sklearn.__version__}  numpy {np.__version__}")
    print("# Oracles: scipy.stats.norm.cdf/ppf (Cephes), sklearn.metrics.roc_auc_score")
    print("# Quantities: (1) binormal AUC Phi(mu/(sigma*sqrt2)); (2) min-detectable")
    print("#   fault sigma*(Phi^-1(1-pfa)+Phi^-1(pd)); (3) empirical ROC AUC point.")
    print("# Row formats:")
    print("#   AUC  mu sigma dprime  auc_scipy")
    print("#   MDF  sigma pfa pd  zsum_scipy  mdf_scipy")
    print("#   AUCPT <name> auc_sklearn")
    print("#   L <name> | 0/1 labels (comma)")
    print("#   S <name> | scores (comma, full f64 hex via %r)")


def emit_auc():
    # Binormal AUC over d' in [0,6]. Spread mu and sigma so the same d' is hit at
    # different (mu,sigma), exercising the scaling, not just the cdf argument.
    sigmas = [0.3, 1.0, 2.5]
    dprimes = [0.0, 0.25, 0.5, 1.0, 1.5, 2.0, 3.0, 4.0, 5.0, 6.0]
    for sigma in sigmas:
        for dp in dprimes:
            mu = dp * sigma
            arg = mu / (sigma * np.sqrt(2.0))
            auc = float(norm.cdf(arg))
            print(f"AUC {mu!r} {sigma!r} {dp!r} {auc!r}")


def emit_mdf():
    sigmas = [0.3, 1.0, 2.5]
    pfas = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5, 1e-6]
    pds = [0.5, 0.9, 0.99, 0.999]
    for sigma in sigmas:
        for pfa in pfas:
            for pd in pds:
                zsum = float(norm.ppf(1.0 - pfa) + norm.ppf(pd))
                mdf = float(sigma * zsum)
                print(f"MDF {sigma!r} {pfa!r} {pd!r} {zsum!r} {mdf!r}")


def emit_aucpt():
    # Fixed-seed scipy-drawn Gaussian score samples + sklearn AUC on identical
    # arrays. %r prints f64 round-trippably so the Rust side parses the exact
    # same bits. Cases span sub-chance -> perfect separation.
    cases = [
        # (name, mu_neg, mu_pos, sigma, n_neg, n_pos)  -- mu_pos<mu_neg => sub-chance
        ("chance",      0.0, 0.0,  1.0, 120, 130),
        ("subchance",   0.0, -1.0, 1.0, 110, 140),
        ("weak",        0.0, 0.6,  1.0, 200, 180),
        ("moderate",    0.0, 1.5,  1.0, 160, 170),
        ("strong",      0.0, 3.0,  1.0, 150, 150),
        ("quantum_lownoise", 0.0, 1.0, 0.3, 220, 200),  # low-sigma "quantum" monitor
        ("ties",        0.0, 1.0,  0.0001, 100, 100),    # near-degenerate, tie handling
    ]
    rng = np.random.default_rng(20260627)
    for name, mn, mp, sg, nn, npos in cases:
        sg = max(sg, 1e-12)
        neg = rng.normal(mn, sg, nn)
        pos = rng.normal(mp, sg, npos)
        labels = np.r_[np.zeros(nn, dtype=int), np.ones(npos, dtype=int)]
        scores = np.r_[neg, pos]
        auc = float(roc_auc_score(labels, scores))
        print(f"AUCPT {name} {auc!r}")
        print(f"L {name} | " + ",".join(str(int(x)) for x in labels))
        print(f"S {name} | " + ",".join(repr(float(x)) for x in scores))


def main():
    emit_header()
    emit_auc()
    emit_mdf()
    emit_aucpt()


if __name__ == "__main__":
    main()
