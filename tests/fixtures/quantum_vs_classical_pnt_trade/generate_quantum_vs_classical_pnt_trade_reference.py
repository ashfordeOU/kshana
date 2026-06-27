#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for the 13503 quantum-vs-classical PNT trade engine's
measured-ADEV ingestion kernel: ``quantum_trade::qparams_from_adev_curve``.

ORACLE
------
  scipy.optimize.nnls  (Lawson & Hanson active-set non-negative least squares),
  from scipy — Virtanen et al., "SciPy 1.0: fundamental algorithms for scientific
  computing in Python", *Nature Methods* 17, 261-272 (2020).
  License: BSD-3-Clause. Version pinned at generation time (printed in the header
  line of the emitted fixture; generated with scipy 1.18.0 + numpy 2.4.6).

WHAT IS VALIDATED
-----------------
``qparams_from_adev_curve(taus, adevs)`` fits a clock's MEASURED overlapping-Allan-
deviation curve to the holdover noise model

    sigma_y^2(tau) = q_wf/tau + (q_rw/3)*tau + (q_drift/20)*tau^3

by NON-NEGATIVE least squares over the basis columns A = [1/tau, tau, tau^3]
against the target b = sigma_y^2(tau) = adev(tau)^2. The recovered NNLS solution
x maps to (q_wf, q_rw, q_drift) = (x0, 3*x1, 20*x2).

kshana solves this NNLS problem by an exact 3-variable active-set search (it
enumerates all 7 non-empty sign-feasible basis subsets and keeps the minimum-
residual fully-non-negative solution, using column-equilibrated normal equations).
This generator feeds the IDENTICAL A and b to scipy.optimize.nnls, which solves
the same min ||Ax-b|| s.t. x>=0 problem by the Lawson-Hanson algorithm — a
DIFFERENT codebase and a DIFFERENT algorithm reaching the same global optimum.
That makes scipy a genuine independent oracle for this kernel.

Four quantities are pinned per case and re-checked by the Rust test:
  1. the recovered (q_wf, q_rw, q_drift);
  2. the fitted sigma_y^2(tau) = A @ x at every tau node (the fit is the
     well-conditioned invariant; on near-collinear designs the individual
     coefficients can split differently between solvers while the fit stays tight);
  3. scipy's residual norm ||A x - b||_2 and the target norm ||b||_2, so the
     Rust test can (a) set a principled per-case fit tolerance from scipy's own
     relative residual and (b) assert kshana's residual is no worse than scipy's
     — i.e. kshana is at least as good an NNLS solution. (kshana's exact subset
     enumeration finds the global optimum, so on ill-conditioned designs it can
     fit STRICTLY BETTER than scipy's Lawson-Hanson active-set path, which may
     leave a tiny dead variable; the check is one-sided in kshana's favour.)

HONEST SCOPE
------------
This validates the trade engine's measured-ADEV *computational kernel* (an NNLS
fit) against scipy. It does NOT validate the device-performance numbers
(clock / cold-atom parameters), which quantify a partner's hardware and stay
MODELLED — see src/verification.rs. The trade row therefore stays Modelled: this
fixture only strengthens the kernel evidence under it.

REPRODUCE (offline, NO kshana code involved)
--------------------------------------------
    /tmp/kshana-oracles/.venv/bin/python \
        generate_quantum_vs_classical_pnt_trade_reference.py \
        > quantum_vs_classical_pnt_trade_reference.txt

The committed .txt is the pinned oracle output; the Rust test reads it via
include_str!, so CI needs no Python.
"""

import numpy as np
import scipy
from scipy.optimize import nnls


# Cases span 3-5 tau decades and include ill-conditioned mixes (where two basis
# columns nearly explain the curve over the sampled span). Each entry is
#   (name, [a_wfm, b_rwfm, c_drift] adev LEVELS, taus)
# where the synthesised ADEV is
#   sigma_y(tau) = sqrt(a^2/tau + b^2*tau + c^2*tau^3)
# i.e. the canonical white-FM (slope -1/2), random-walk-FM (slope +1/2) and
# random-run-FM/drift (slope +3/2) power laws.  q_wf=a^2, q_rw=3 b^2, q_drift=20 c^2.
CASES = [
    # --- single-noise-type recoveries (well conditioned) ---
    ("white_only_3dec",   [1.0e-12, 0.0,      0.0],      [1, 3, 10, 30, 100, 300, 1000]),
    ("white_only_5dec",   [1.0e-12, 0.0,      0.0],      [1, 10, 100, 1000, 10000, 100000]),
    ("rw_only_4dec",      [0.0,     1.0e-14,  0.0],      [1, 10, 100, 1000, 10000]),
    ("drift_only_4dec",   [0.0,     0.0,      1.0e-17],  [1, 10, 100, 1000, 10000]),
    # --- two-type mixes ---
    ("white_rw_4dec",     [1.0e-12, 1.0e-14,  0.0],      [1, 3, 10, 30, 100, 300, 1000, 3000]),
    ("white_drift_4dec",  [1.0e-12, 0.0,      1.0e-17],  [1, 3, 10, 30, 100, 300, 1000, 3000]),
    ("rw_drift_4dec",     [0.0,     1.0e-13,  1.0e-16],  [1, 10, 100, 1000, 10000]),
    # --- all three, multiple decade spans ---
    ("all_three_4dec",    [1.0e-12, 1.0e-14,  1.0e-17],  [1, 3, 10, 30, 100, 300, 1000, 3000]),
    ("all_three_5dec",    [1.0e-12, 1.0e-14,  1.0e-17],  [1, 10, 100, 1000, 10000, 100000]),
    ("optical_lattice",   [1.0e-15, 1.0e-17,  1.0e-20],  [1, 10, 100, 1000, 10000, 100000]),
    ("csac_like",         [3.0e-10, 3.0e-12,  1.0e-14],  [1, 4, 16, 64, 256, 1024, 4096]),
    ("uso_like",          [1.0e-12, 5.0e-15,  3.0e-18],  [1, 10, 100, 1000, 10000, 50000]),
    # --- deliberately ill-conditioned: white tiny vs strong drift over a wide
    #     span; the 1/tau column is dwarfed, so coefficient recovery is hard but
    #     the fitted sigma_y^2(tau) must still agree across solvers ---
    ("illcond_white_drift", [1.0e-16, 0.0,    1.0e-15],  [1, 10, 100, 1000, 10000, 100000]),
    # --- near-collinear rw vs drift over a short span (both rising), the classic
    #     coefficient-split case ---
    ("illcond_rw_drift_short", [0.0, 1.0e-13, 5.0e-14],  [1, 2, 4, 8, 16, 32]),
    # --- dense log grid, all three, 5 decades (many tau nodes) ---
    ("dense_all_5dec",    [2.0e-13, 4.0e-15,  6.0e-18],
        [1, 2, 5, 10, 20, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 50000, 100000]),
]


def emit():
    for name, (a, b, c), taus in CASES:
        taus = np.asarray(taus, dtype=float)
        sig2 = a * a / taus + b * b * taus + c * c * taus ** 3
        adevs = np.sqrt(sig2)
        # Basis matches qparams_from_adev_curve exactly: columns [1/tau, tau, tau^3].
        A = np.column_stack([1.0 / taus, taus, taus ** 3])
        x, _resid = nnls(A, sig2)
        q_wf, q_rw, q_drift = float(x[0]), float(3.0 * x[1]), float(20.0 * x[2])
        # Fitted sigma_y^2 at every node from scipy's own solution (A @ x).
        fit = A @ x
        resid_norm = float(np.linalg.norm(A @ x - sig2))
        target_norm = float(np.linalg.norm(sig2))
        print(
            f"NNLS {name} | "
            f"{','.join(repr(float(t)) for t in taus)} | "
            f"{','.join(repr(float(s)) for s in adevs)} | "
            f"{q_wf!r} {q_rw!r} {q_drift!r} | "
            f"{','.join(repr(float(v)) for v in fit)} | "
            f"{resid_norm!r} {target_norm!r}"
        )


def main():
    print(
        f"# quantum_vs_classical_pnt_trade NNLS reference — oracle: "
        f"scipy {scipy.__version__} scipy.optimize.nnls (BSD-3-Clause), numpy {np.__version__}."
    )
    print("# Consumed by tests/quantum_vs_classical_pnt_trade_reference.rs.")
    print("# Validates quantum_trade::qparams_from_adev_curve (measured-ADEV NNLS fit).")
    print(
        "# Columns: NNLS name | taus(,) | adevs(,) | q_wf q_rw q_drift | "
        "fitted_sigma_y2(,) per tau | scipy_resid_norm scipy_target_norm"
    )
    emit()


if __name__ == "__main__":
    main()
