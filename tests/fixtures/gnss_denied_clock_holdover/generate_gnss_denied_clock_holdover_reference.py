#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the GNSS-denied clock-holdover kernel.

Oracle
------
**scipy** (Virtanen et al., *Nature Methods* 17, 261-272, 2020; BSD-3-Clause),
version 1.18.0:
  * scipy.linalg.expm  — the matrix exponential, used to form the EXACT discrete
    process-noise covariance Q of a continuous LTI clock model by the
    **Van Loan (1978)** algorithm
    ("Computing integrals involving the matrix exponential", IEEE TAC 23(3),
    395-404). This is a numerically distinct route from kshana's hand-derived
    closed-form polynomial in `src/holdover.rs` / `src/clock_state.rs`.
  * scipy.optimize.brentq — Brent's method root finder, used here to invert the
    coast-variance growth curve for the holdover duration. This is a different
    inversion algorithm from kshana's bisection in `holdover_seconds`.

What is validated
-----------------
The clock free-runs (coasts) from a perfectly known state (P=0, no measurements)
for t seconds. The phase-error variance it accumulates is exactly the [0][0]
element of the Van Loan discrete Q at dt = t:

    coast_phase_variance(q_wf, q_rw, q_drift, t)  ==  VanLoanQ(q_wf,q_rw,q_drift,t)[0,0]

and the holdover (coast time until phase 1-sigma first reaches `threshold`) is the
root of  VanLoanQ[0,0](t) - threshold**2 = 0 :

    holdover_seconds(q_wf, q_rw, q_drift, threshold) == brentq(... expm Q00 ...)

The deterministic time-interval error  x(t)=y0*t + 0.5*D*t**2  and the
timing-to-range map  c*dt  are checked against their closed forms (no oracle
library needed — transcribed CODATA c and exact arithmetic).

HONEST SCOPE
------------
This validates the holdover/coast KERNEL: the polynomial coast-variance growth and
its monotone inversion, against an independent Van-Loan-via-expm computation and an
independent Brent root find. It does NOT validate the per-CLASS holdover figures
(ClockClass / QuantumClockClass): those rest on a *synthesised* long-tau red-noise
floor (q_rw, q_drift two/four decades below the cited white-FM ADEV) that is a
representative modelling assumption, not a measured value, and they stay MODELLED.
The kernel is exact mathematics; the floor that feeds it for a class is not.

Reproduce (offline, NO kshana code involved):

    python3 -m venv /tmp/holdovervenv
    /tmp/holdovervenv/bin/pip install "scipy>=1.17" numpy
    /tmp/holdovervenv/bin/python generate_gnss_denied_clock_holdover_reference.py \
        > gnss_denied_clock_holdover_reference.txt

Generated with scipy 1.18.0 + numpy.
"""

import numpy as np
from scipy.linalg import expm
from scipy.optimize import brentq

# CODATA exact speed of light (m/s) — matches kshana holdover::C_LIGHT_M_PER_S.
C_LIGHT = 299_792_458.0


def vanloan_q(qwf, qrw, qdr, dt):
    """Exact discrete process noise Q via Van Loan (1978) using scipy.linalg.expm.

    Continuous clock model: A = [[0,1,0],[0,0,1],[0,0,0]],
    Qc = diag(q_wf, q_rw, q_drift). The block matrix
        M = [[-A, Qc],[0, A^T]]
    gives  Q = Phi @ expm(M*dt)[:n, n:]  with Phi = expm(M*dt)[n:, n:].T .
    """
    a = np.array([[0, 1, 0], [0, 0, 1], [0, 0, 0]], float)
    qc = np.diag([qwf, qrw, qdr]).astype(float)
    n = 3
    m = np.zeros((2 * n, 2 * n))
    m[:n, :n] = -a
    m[:n, n:] = qc
    m[n:, n:] = a.T
    em = expm(m * dt)
    phi = em[n:, n:].T
    return phi @ em[:n, n:]


def coast_var_q00(qwf, qrw, qdr, t):
    """The coast phase-error variance == Van Loan Q[0,0] at dt = t."""
    return float(vanloan_q(qwf, qrw, qdr, t)[0, 0])


def holdover_brentq(qwf, qrw, qdr, threshold):
    """Holdover duration by independent Brent root find on the expm Van-Loan Q00."""
    target = threshold * threshold
    f = lambda t: coast_var_q00(qwf, qrw, qdr, t) - target
    # Bracket: grow hi until the variance exceeds the target (curve is monotone
    # increasing because every PSD term is non-negative).
    hi = 1.0
    while f(hi) < 0.0:
        hi *= 2.0
        if hi > 1e30:
            raise RuntimeError("threshold unreachable within horizon")
    return float(brentq(f, 0.0, hi, xtol=1e-12, rtol=1e-15, maxiter=500))


# (name, q_wf, q_rw, q_drift) PSD triples spanning the operating regimes:
#   - white-FM only (the exact closed-form regime)
#   - white + random-walk-FM
#   - all three including the long-tau drift/floor term
PSD_TRIPLES = [
    ("white_only", 1.0e-22, 0.0, 0.0),
    ("white_rw", 1.0e-22, 1.0e-28, 0.0),
    ("all_three_floor", 1.0e-20, 1.0e-24, 1.0e-30),
]
COAST_TIMES = [100.0, 3600.0, 1.0e4, 1.0e5]

# (name, q_wf, q_rw, q_drift, threshold_seconds) for the holdover inversion. Mix
# of white-only (closed form t = thr^2/q_wf) and floor-bearing triples, thresholds
# from 1 ns to 100 ns.
HOLDOVER_CASES = [
    ("white_1ns", 9.0e-21, 0.0, 0.0, 1.0e-9),
    ("white_10ns", 9.0e-21, 0.0, 0.0, 1.0e-8),
    ("white_rw_10ns", 1.0e-22, 1.0e-26, 0.0, 1.0e-8),
    ("all_three_10ns", 1.0e-22, 1.0e-26, 1.0e-32, 1.0e-8),
    ("all_three_100ns", 1.0e-20, 1.0e-24, 1.0e-30, 1.0e-7),
    ("rw_dominant_50ns", 1.0e-24, 1.0e-25, 0.0, 5.0e-8),
    ("drift_bearing_30ns", 1.0e-23, 1.0e-27, 1.0e-31, 3.0e-8),
]

# (name, freq_offset y0, drift D (1/s), t) for the deterministic TIE closed form.
TIE_CASES = [
    ("offset_only", 1.0e-13, 0.0, 1000.0),
    ("drift_only", 0.0, 1.0e-12, 1000.0),
    ("both", 5.0e-13, 2.0e-13, 3600.0),
    ("both_long", 1.0e-12, 1.0e-14, 1.0e4),
]

# timing-error (s) values for the phase->range map c*dt.
RANGE_CASES = [1.0e-9, 1.0e-8, 5.0e-9, 1.0e-6]


def main():
    print("# scipy reference for the GNSS-denied clock-holdover kernel.")
    print("# Oracle: scipy 1.18.0 — linalg.expm (Van Loan 1978) + optimize.brentq")
    print("#         (Virtanen et al., Nature Methods 2020; BSD-3-Clause) + numpy.")
    print("# Consumed by tests/gnss_denied_clock_holdover_reference.rs.")
    print("# See generate_gnss_denied_clock_holdover_reference.py for provenance + scope.")
    print("# COAST name q_wf q_rw q_drift t | var(=expm Van-Loan Q00)   [s^2]")
    print("# HOLDOVER name q_wf q_rw q_drift threshold | seconds(=brentq of expm Q00)")
    print("# TIE name freq_offset drift t | tie(=y0*t + 0.5*D*t^2)   [s]")
    print("# RANGE dt | range(=c*dt)   [m]")

    for tname, qwf, qrw, qdr in PSD_TRIPLES:
        for t in COAST_TIMES:
            var = coast_var_q00(qwf, qrw, qdr, t)
            print(f"COAST {tname} {qwf!r} {qrw!r} {qdr!r} {t!r} | {var!r}")

    for name, qwf, qrw, qdr, thr in HOLDOVER_CASES:
        sec = holdover_brentq(qwf, qrw, qdr, thr)
        print(f"HOLDOVER {name} {qwf!r} {qrw!r} {qdr!r} {thr!r} | {sec!r}")

    for name, y0, d, t in TIE_CASES:
        tie = float(y0 * t + 0.5 * d * t * t)
        print(f"TIE {name} {y0!r} {d!r} {t!r} | {tie!r}")

    for dt in RANGE_CASES:
        rng = float(C_LIGHT * dt)
        print(f"RANGE {dt!r} | {rng!r}")


if __name__ == "__main__":
    main()
