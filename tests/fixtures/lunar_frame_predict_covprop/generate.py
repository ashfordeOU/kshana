#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for tests/lunar_frame_predict_covprop_reference.rs (paper P3, G1).

WHAT IS ORACLED (independent, authoritative, BSD-licensed linear algebra):
  numpy general matrix multiply (@)  -- the covariance prediction
        P' = Phi . P . Phi^T
     for the constant-velocity state transition Phi = [[1, dt], [0, 1]] and the 2x2
     (position, velocity) along-track covariance
        P = [[sigma_r^2, rho sigma_r sigma_v], [rho sigma_r sigma_v, sigma_v^2]].
  math: the one-way light-time map t_ns = r / c * 1e9 with the CODATA defined
     c = 299_792_458 m/s, applied to the predicted and post-processed position 1sigma.

WHY THIS IS AN INDEPENDENT CROSS-CHECK (not a re-run of kshana):
  kshana::lunar_frame_predict::propagate_covariance computes P' NOT as a matrix product
  but through the hand-expanded closed-form SCALAR expressions
        P'00 = sigma_r^2 + 2 dt rho sigma_r sigma_v + dt^2 sigma_v^2
        P'01 = rho sigma_r sigma_v + dt sigma_v^2
        P'11 = sigma_v^2
  This oracle instead forms the full 2x2 matrices Phi and P as numpy arrays and evaluates
  the GENERAL matrix triple product Phi @ P @ Phi.T entry-by-entry as summed dot products.
  The two codepaths are algebraically equal but numerically independent: numpy never sees the
  expanded formula, and kshana never forms the matrices. Agreement therefore pins kshana's
  scalar propagation to an external general-linear-algebra evaluation, exactly as the P6
  observability oracle pins kshana's Jacobi eigensolver to LAPACK.

  Every input (sigma_r, sigma_v, rho, dt) is a fixed, explicit number listed below, so the
  Rust test feeds kshana the identical covariance and latency -- nothing kshana computes
  leaks into the oracle. The magnitudes themselves remain Modelled/representative (a lunar
  navigation-relay along-track OD); it is the propagation MECHANISM that this oracle Validates.

Run:  python3 generate.py            (prints the fixture; deterministic, no randomness)
Reproduce the committed fixture:
      python3 generate.py > covprop_reference.txt
  (numpy only; no network. The Rust test reads the committed .txt.)

Generated with: numpy (general matmul).
"""

import sys

import numpy as np

# CODATA defined speed of light (exact), matching crate::holdover::C_LIGHT_M_PER_S.
C_LIGHT_M_PER_S = 299_792_458.0

# FIXED test cases: (label, sigma_r [m], sigma_v [m/s], rho [-], dt [s]). Explicit, distinct.
#   - representative : the honest Modelled lunar-relay covariance + 1 h latency (~14.402 m).
#   - corr_pos       : strong positive position-velocity correlation (exercises the cross term).
#   - corr_neg       : negative correlation over a shorter latency.
#   - zero_latency   : Phi = I, so P' == P exactly (definitive / post-processed case).
#   - generic        : an unrelated covariance + latency, no round numbers.
CASES = [
    ("representative", 0.27, 4.0e-3, 0.0, 3600.0),
    ("corr_pos", 0.27, 4.0e-3, 0.5, 3600.0),
    ("corr_neg", 0.30, 5.0e-3, -0.3, 1800.0),
    ("zero_latency", 0.27, 4.0e-3, 0.2, 0.0),
    ("generic", 0.5137, 1.03e-2, 0.17, 1234.0),
]


def propagate_matmul(sigma_r, sigma_v, rho, dt):
    """P' = Phi . P . Phi^T via numpy general matrix multiply (no scalar expansion)."""
    phi = np.array([[1.0, dt], [0.0, 1.0]])
    p = np.array(
        [
            [sigma_r * sigma_r, rho * sigma_r * sigma_v],
            [rho * sigma_r * sigma_v, sigma_v * sigma_v],
        ]
    )
    return phi @ p @ phi.T


def main():
    print("# EXTERNAL ORACLE for kshana::lunar_frame_predict (paper P3, gap G1).")
    print("# numpy general matmul P' = Phi . P . Phi^T for Phi = [[1, dt], [0, 1]];")
    print("#   light-time map t_ns = r / c * 1e9 with c = 299792458 m/s (CODATA, exact).")
    print(f"# numpy {np.__version__}")
    print(f"# C_LIGHT_M_PER_S {C_LIGHT_M_PER_S:.15e}")
    print("# Consumed by tests/lunar_frame_predict_covprop_reference.rs.")
    print("#")
    print("# CASE label sigma_r sigma_v rho dt | p_rr p_rv p_vv pos_sigma pos_time_ns "
          "postproc_sigma postproc_time_ns")
    for label, sr, sv, rho, dt in CASES:
        pp = propagate_matmul(sr, sv, rho, dt)
        p_rr = float(pp[0, 0])
        p_rv = float(pp[0, 1])
        p_vv = float(pp[1, 1])
        pos_sigma = float(np.sqrt(max(p_rr, 0.0)))
        pos_time_ns = pos_sigma / C_LIGHT_M_PER_S * 1.0e9
        postproc_sigma = sr  # zero-latency position 1sigma is the input sigma_r
        postproc_time_ns = postproc_sigma / C_LIGHT_M_PER_S * 1.0e9
        # symmetry sanity: Phi P Phi^T must stay symmetric (p_01 == p_10).
        assert abs(pp[0, 1] - pp[1, 0]) < 1e-18, "oracle produced a non-symmetric P'"
        print(
            f"CASE {label} "
            f"{sr:.15e} {sv:.15e} {rho:.15e} {dt:.15e} "
            f"{p_rr:.15e} {p_rv:.15e} {p_vv:.15e} "
            f"{pos_sigma:.15e} {pos_time_ns:.15e} "
            f"{postproc_sigma:.15e} {postproc_time_ns:.15e}"
        )

    # human-readable footer to stderr (not part of the machine-read fixture)
    rep = propagate_matmul(0.27, 4.0e-3, 0.0, 3600.0)
    print(
        f"# representative predicted 1sigma = {np.sqrt(rep[0, 0]):.6f} m "
        f"({len(CASES)} cases emitted).",
        file=sys.stderr,
    )


if __name__ == "__main__":
    main()
