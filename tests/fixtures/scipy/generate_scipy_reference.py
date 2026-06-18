#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the quantum-trade numerical kernels.

The oracle is **scipy** (Virtanen et al., *Nature Methods* 17, 2020) — the
canonical scientific-computing library. Three exactly-reproducible kernels in the
13503 quantum-vs-classical trade engine are checked against scipy's own routines,
the same way DOP is validated against gnss_lib_py and the ML metrics against
scikit-learn:

  NNLS      qparams_from_adev_curve  ->  scipy.optimize.nnls
  CHI2      detection::chi2_inv_cdf  ->  scipy.stats.chi2.ppf
  VANLOAN   clock_state van-Loan Q   ->  scipy.linalg.expm (Van Loan 1978)

These validate the trade engine's *computational spine* (the ADEV fit, the
filter-consistency χ² bands, the holdover/coast covariance). They do NOT validate
the device-performance numbers (clock/CAI parameters), which quantify a partner's
hardware and stay honestly MODELLED — see src/verification.rs.

Reproduce (offline, no Kshana code involved):

    python3.11 -m venv /tmp/dopvenv
    /tmp/dopvenv/bin/pip install scipy numpy
    /tmp/dopvenv/bin/python generate_scipy_reference.py > scipy_reference.txt

Generated with scipy 1.17.1 + numpy.
"""

import numpy as np
from scipy.optimize import nnls
from scipy.stats import chi2
from scipy.linalg import expm


def emit_nnls():
    # Basis matches qparams_from_adev_curve: columns [1/tau, tau, tau^3] fitting
    # sigma_y^2(tau); recovered coeffs map to [q_wf, q_rw/3, q_drift/20].
    cases = [
        ("white_only",   [1.0e-24, 0.0, 0.0],          [1, 2, 5, 10, 20, 50, 100]),
        ("white_rw",     [1.0e-24, 1.0e-28, 0.0],       [1, 2, 5, 10, 20, 50, 100]),
        ("white_drift",  [1.0e-24, 0.0, 1.0e-34],       [1, 3, 10, 30, 100]),
        ("all_three",    [1.0e-24, 1.0e-28, 1.0e-34],   [1, 3, 10, 30, 100, 300]),
        ("rw_dominant",  [1.0e-26, 1.0e-27, 0.0],        [1, 2, 5, 10, 20, 50]),
    ]
    for name, (qwf, qrw, qdr), taus in cases:
        taus = np.asarray(taus, float)
        # sigma_y^2(tau) = qwf/tau + (qrw/3)*tau + (qdrift/20)*tau^3
        sig2 = qwf / taus + (qrw / 3.0) * taus + (qdr / 20.0) * taus ** 3
        adevs = np.sqrt(sig2)
        a = np.column_stack([1.0 / taus, taus, taus ** 3])
        x, _ = nnls(a, sig2)                      # scipy NNLS on the same A, b
        q_wf, q_rw, q_drift = float(x[0]), float(3.0 * x[1]), float(20.0 * x[2])
        print(f"NNLS {name} | {','.join(repr(float(t)) for t in taus)} | "
              f"{','.join(repr(float(s)) for s in adevs)} | "
              f"{q_wf!r} {q_rw!r} {q_drift!r}")


def emit_chi2():
    # Operating range for the UKF NEES/NIS pooled bands (dof runs into the
    # hundreds-thousands, where Wilson-Hilferty is effectively exact).
    ps = [0.025, 0.05, 0.5, 0.95, 0.975, 0.99]
    # Operating pooled dof for the UKF NEES/NIS bands (NEES dof = nx*runs = 8*48 =
    # 384; NIS similar). Wilson-Hilferty is tight here (<3e-4 by dof 48); below
    # the operating regime (dof < 16) it degrades to ~1%, which is why this
    # validation is scoped to the dof the filter actually pools to.
    dofs = [48, 100, 200, 384, 1000, 3000]
    for d in dofs:
        for p in ps:
            print(f"CHI2 {p!r} {float(d)!r} {float(chi2.ppf(p, d))!r}")


def vanloan_q(qwf, qrw, qdr, dt):
    f = np.array([[0, 1, 0], [0, 0, 1], [0, 0, 0]], float)
    qc = np.diag([qwf, qrw, qdr]).astype(float)
    n = 3
    m = np.zeros((2 * n, 2 * n))
    m[:n, :n] = -f
    m[:n, n:] = qc
    m[n:, n:] = f.T
    em = expm(m * dt)
    phi = em[n:, n:].T
    return phi @ em[:n, n:]


def emit_vanloan():
    cases = [
        ("a", 1.0e-22, 1.0e-26, 1.0e-30, 100.0),
        ("white", 1.0e-24, 0.0, 0.0, 10.0),
        ("white_rw", 1.0e-22, 1.0e-28, 0.0, 1000.0),
        ("all", 1.0e-20, 1.0e-24, 1.0e-30, 50.0),
    ]
    for name, qwf, qrw, qdr, dt in cases:
        q = vanloan_q(qwf, qrw, qdr, dt)
        # six unique symmetric entries: 00 01 02 11 12 22
        vals = [q[0, 0], q[0, 1], q[0, 2], q[1, 1], q[1, 2], q[2, 2]]
        print(f"VANLOAN {name} {qwf!r} {qrw!r} {qdr!r} {dt!r} | "
              + " ".join(repr(float(v)) for v in vals))


def main():
    print("# scipy reference for quantum-trade kernels — oracle: scipy 1.17.1 (+ numpy).")
    print("# Consumed by tests/scipy_reference.rs. See NOTICE / generate_scipy_reference.py.")
    print("# NNLS name | taus(,) | adevs(,) | q_wf q_rw q_drift   (scipy.optimize.nnls)")
    print("# CHI2 p dof value                                      (scipy.stats.chi2.ppf)")
    print("# VANLOAN name q_wf q_rw q_drift dt | q00 q01 q02 q11 q12 q22  (scipy.linalg.expm)")
    emit_nnls()
    emit_chi2()
    emit_vanloan()


if __name__ == "__main__":
    main()
