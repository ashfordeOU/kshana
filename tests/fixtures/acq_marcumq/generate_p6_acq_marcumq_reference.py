#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External reference vectors for kshana's GNSS square-law acquisition kernel.

Oracle: **scipy.stats.ncx2 / scipy.stats.chi2** (Virtanen et al., *Nature
Methods* 17, 2020). scipy's non-central / central chi-square routines are
implemented on top of Cephes/Boost — a wholly independent algorithm from
kshana's own machinery, which evaluates the non-central chi-square as a
Poisson(lambda/2)-weighted sum of *regularized-incomplete-gamma* central
chi-square CDFs (`src/raim.rs::noncentral_chi2_cdf`). Reproducing scipy's
values therefore validates the detection-statistics KERNEL against a
genuinely different codebase, not against a re-run of kshana.

This is the same independence basis already accepted for the Validated
RAIM/ARAIM chi2 kernel row (`tests/raim_reference.rs`).

The generalized Marcum Q-function is the survival function of a non-central
chi-square with 2M degrees of freedom and non-centrality a^2, evaluated at
b^2:

    Q_M(a, b) = P(X > b^2),   X ~ ncx2(dof=2M, nc=a^2)
              = scipy.stats.ncx2.sf(b**2, 2*M, a**2)

kshana's public acquisition API (`src/acquisition.rs`) is checked cell-by-cell:

    marcum_q(M, a, b)            <->  ncx2.sf(b**2, 2*M, a**2)
    pfa_square_law(gamma, N)     <->  chi2.sf(gamma, 2*N)
    threshold_for_pfa(pfa, N)    <->  chi2.ppf(1 - pfa, 2*N)
    pd_square_law(gamma, N, snr) <->  ncx2.sf(gamma, 2*N, 2*N*snr)

HONEST SCOPE: this validates only the per-cell detection-statistics kernel
(generalized Marcum-Q / P_fa / P_d / threshold). The CFAR cell-averaging,
squaring/combining-loss tables, and code/Doppler-bin straddling loss of a real
acquisition search STAY MODELLED — see src/verification.rs.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/acqvenv
    /tmp/acqvenv/bin/pip install scipy numpy
    /tmp/acqvenv/bin/python generate_p6_acq_marcumq_reference.py \
        > acq_marcumq_reference.txt

Regenerable offline. Generated with scipy 1.13.1 + numpy 1.26.4.
"""

import scipy
from scipy.stats import chi2, ncx2

# ---------------------------------------------------------------------------
# Grids. M / N are the (integer) non-coherent-integration counts; a is the
# signal parameter sqrt(2*M*snr); b is sqrt(gamma). We sweep the full operating
# range an acquisition detector uses: small counts (M=1, coherent-only) through
# deep non-coherent integration (M=20), and thresholds from the noise floor out
# into the P_fa ~ 1e-7 tail.
# ---------------------------------------------------------------------------

MARCUM_M = [1, 2, 3, 5, 8, 20]
MARCUM_A = [0.0, 0.5, 1.0, 2.0, 3.5, 5.0]
MARCUM_B = [0.5, 1.0, 2.0, 3.5, 5.0, 8.0]

PFA_N = [1, 2, 5, 10, 20]
PFA_GAMMA = [1.0, 2.0, 5.0, 10.0, 20.0, 40.0, 80.0]

# Target false-alarm probabilities the threshold inverter must reproduce.
THR_N = [1, 2, 5, 10, 20]
THR_PFA = [1e-1, 1e-2, 1e-3, 1e-5, 1e-7]

# Detection probability over (threshold, count, per-cell SNR).
PD_N = [1, 2, 5, 10]
PD_GAMMA = [5.0, 10.0, 20.0, 40.0]
PD_SNR = [0.0, 0.25, 0.5, 1.0, 2.0]


def emit_marcum():
    for m in MARCUM_M:
        for a in MARCUM_A:
            for b in MARCUM_B:
                # Q_M(a, b) = P(ncx2(2M, a^2) > b^2)
                q = float(ncx2.sf(b * b, 2 * m, a * a))
                print(f"MARCUM {float(m)!r} {float(a)!r} {float(b)!r} {q!r}")


def emit_pfa():
    for n in PFA_N:
        for g in PFA_GAMMA:
            pfa = float(chi2.sf(g, 2 * n))
            print(f"PFA {float(n)!r} {float(g)!r} {pfa!r}")


def emit_threshold():
    for n in THR_N:
        for pfa in THR_PFA:
            gamma = float(chi2.ppf(1.0 - pfa, 2 * n))
            print(f"THR {float(n)!r} {pfa!r} {gamma!r}")


def emit_pd():
    for n in PD_N:
        for g in PD_GAMMA:
            for snr in PD_SNR:
                lam = 2.0 * n * snr
                pd = float(ncx2.sf(g, 2 * n, lam))
                print(f"PD {float(n)!r} {float(g)!r} {float(snr)!r} {pd!r}")


def main():
    print("# GNSS square-law acquisition kernel reference — oracle: scipy "
          f"{scipy.__version__} (scipy.stats.ncx2 / .chi2, Cephes/Boost).")
    print("# Independent of kshana's Poisson-weighted incomplete-gamma "
          "noncentral chi-square. Regenerable offline; see header.")
    print("# Consumed by tests/acquisition_reference.rs.")
    print("# MARCUM M a b        Q_M(a,b) = ncx2.sf(b^2, 2M, a^2)")
    print("# PFA    N gamma      P_fa      = chi2.sf(gamma, 2N)")
    print("# THR    N pfa        gamma     = chi2.ppf(1-pfa, 2N)")
    print("# PD     N gamma snr  P_d       = ncx2.sf(gamma, 2N, 2N*snr)")
    emit_marcum()
    emit_pfa()
    emit_threshold()
    emit_pd()


if __name__ == "__main__":
    main()
