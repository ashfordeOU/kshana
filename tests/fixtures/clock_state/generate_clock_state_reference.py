#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate an external reference trajectory for the 3-state onboard clock filter.

The oracle is **filterpy 1.4.5** (Roger R. Labbe Jr., MIT) — the reference
implementation accompanying *Kalman and Bayesian Filters in Python* — driven with
its `KalmanFilter` class, the same independent-library cross-check DOP gets against
gnss_lib_py and the Lambert solver gets against lamberthub. The state-transition
matrix F is built independently with **scipy.linalg.expm** (Van Loan 1978;
Virtanen et al., *Nature Methods* 17, 2020) and the discrete process-noise Q with
the Van-Loan block-matrix method — NOT with kshana's hard-coded polynomial forms —
so the predict step's F and Q are derived by a different route from kshana's
`clock_state::ClockState3`.

WHAT IS VALIDATED
-----------------
The FULL filter trajectory of kshana's three-state phase/freq/drift Kalman clock:
the 3-vector state x = [phase, freq, drift] and the full 3x3 covariance P after
*every* predict and *every* update_phase, over a multi-epoch coast-then-track run,
across four parameter sets (white-only / white+random-walk / full 3-state /
harsh Q-R). filterpy is configured to the IDENTICAL model:

    F = expm(A*dt), A = [[0,1,0],[0,0,1],[0,0,0]]   (== [[1,dt,dt^2/2],[0,1,dt],[0,0,1]])
    Q = Van-Loan(A, diag(q_wf,q_rw,q_drift), dt)
    H = [[1,0,0]],  R = r,  Joseph update: P = (I-KH)P(I-KH)' + KRK'

fed the SAME deterministic synthetic phase-measurement sequence. kshana's
`predict(dt)` / `update_phase(z, r)` are then driven through the identical call
order and every element of x and P is compared.

HONEST SCOPE
------------
filterpy and kshana implement the SAME linear-Gaussian Kalman recursion (this is
a deterministic, closed-form recursion — given F, Q, H, R and the measurement
sequence there is exactly ONE correct answer for x and P). So this is a
library-vs-library agreement check on the recursion, with F/Q built by an
independent route (scipy.expm + Van-Loan block matrix) rather than an
analytic-truth check. It validates that kshana's hand-rolled fixed-size
predict/update arithmetic (its F P F^T expansion and its Joseph-form
update_phase) reproduces a trusted general-purpose KF byte-for-byte to ~1e-12.
It does NOT validate the clock physics / PSD calibration (those map a real
oscillator's Allan profile and stay MODELLED) — only the estimator recursion.
The complementary `scipy_reference.rs::clock_van_loan_q_matches_scipy_linalg_expm`
already pins the predict-step Q alone; this fixture extends the check to the
entire predict+update trajectory.

REPRODUCE (offline, no kshana code involved):

    python3 -m venv /tmp/clockvenv
    /tmp/clockvenv/bin/pip install filterpy scipy numpy
    /tmp/clockvenv/bin/python generate_clock_state_reference.py > clock_state_reference.txt

Generated with filterpy 1.4.5 + scipy + numpy.
"""

import numpy as np
from scipy.linalg import expm
from filterpy.kalman import KalmanFilter


# Continuous dynamics matrix A for x = [phase, freq, drift]:
#   d(phase)/dt = freq, d(freq)/dt = drift, d(drift)/dt = 0.
A = np.array([[0.0, 1.0, 0.0],
              [0.0, 0.0, 1.0],
              [0.0, 0.0, 0.0]])


def transition(dt):
    """F = exp(A*dt) via scipy matrix exponential (independent of kshana's polynomial)."""
    return expm(A * dt)


def vanloan_q(q_wf, q_rw, q_drift, dt):
    """Exact discrete process noise Q = int_0^dt F(t) Qc F(t)^T dt via Van-Loan 1978.

    Build the 6x6 block matrix M = [[-A, Qc], [0, A^T]] * dt, exponentiate, and
    recover Q = phi^T @ (em top-right block) where phi = (em bottom-right)^T.
    This is the canonical Van-Loan construction (Van Loan, IEEE TAC 1978) and is
    derived by a completely different route from kshana's closed-form polynomial.
    """
    qc = np.diag([q_wf, q_rw, q_drift]).astype(float)
    n = 3
    m = np.zeros((2 * n, 2 * n))
    m[:n, :n] = -A
    m[:n, n:] = qc
    m[n:, n:] = A.T
    em = expm(m * dt)
    phi = em[n:, n:].T
    return phi @ em[:n, n:]


def make_kf(q_wf, q_rw, q_drift, dt, r, p0):
    """Configure a filterpy KalmanFilter to the identical 3-state clock model."""
    kf = KalmanFilter(dim_x=3, dim_z=1)
    kf.x = np.zeros((3, 1))                 # start from a perfectly known zero state
    kf.P = np.diag([float(p0[0]), float(p0[1]), float(p0[2])]).astype(float)
    kf.F = transition(dt)
    kf.Q = vanloan_q(q_wf, q_rw, q_drift, dt)
    kf.H = np.array([[1.0, 0.0, 0.0]])
    kf.R = np.array([[float(r)]])
    return kf


def fmt_x(x):
    return ",".join(repr(float(v)) for v in np.asarray(x).ravel())


def fmt_p(p):
    # Six unique symmetric entries: 00 01 02 11 12 22.
    p = np.asarray(p)
    vals = [p[0, 0], p[0, 1], p[0, 2], p[1, 1], p[1, 2], p[2, 2]]
    return ",".join(repr(float(v)) for v in vals)


# Parameter sets. Each: name, (q_wf, q_rw, q_drift), dt, r, (p0_phase,p0_freq,p0_drift),
# n_epochs, coast_epochs. The run COASTS (predict only) for `coast` epochs, then
# TRACKS (predict + update_phase) for the rest. The measurement at each tracked
# epoch is a fixed deterministic function of the epoch index (no RNG) so the
# fixture is bit-reproducible and the Rust test feeds byte-identical z values.
CASES = [
    # white-only FM: classic 2-state-equivalent (drift PSD off), tight R.
    ("white_only", (1.0e-24, 0.0, 0.0), 1.0, 1.0e-22,
     (1.0e-18, 1.0e-22, 1.0e-28), 220, 20),
    # white + random-walk FM (USO-like red-noise floor).
    ("white_rw", (1.0e-24, 1.0e-30, 0.0), 1.0, 1.0e-24,
     (1.0e-18, 1.0e-22, 1.0e-28), 240, 30),
    # full 3-state with aging drift, moderate non-unit dt.
    ("full_3state", (1.0e-24, 1.0e-30, 1.0e-36), 0.5, 1.0e-23,
     (1.0e-18, 1.0e-22, 1.0e-28), 260, 40),
    # harsh Q/R: large process noise vs very small R, the Joseph-stress regime.
    ("harsh_qr", (1.0e-20, 1.0e-26, 1.0e-32), 2.0, 1.0e-26,
     (1.0e-16, 1.0e-20, 1.0e-26), 300, 25),
]


def measurement(case_name, i, dt):
    """Deterministic synthetic phase measurement (s) at tracked epoch index i.

    A smooth quadratic-plus-sinusoid in epoch time — exercises all three states
    (phase offset, frequency slope, drift curvature) without any randomness.
    Amplitudes are picked per-case to sit a few sigma off the propagated mean so
    the innovation is non-trivial at every step.
    """
    t = (i + 1) * dt
    base = {
        "white_only": 5.0e-12,
        "white_rw": 8.0e-12,
        "full_3state": 1.0e-11,
        "harsh_qr": 3.0e-12,
    }[case_name]
    return float(base * (1.0 + 0.5 * t + 0.001 * t * t + 0.3 * np.sin(0.05 * t)))


def emit_case(name, q, dt, r, p0, n, coast):
    q_wf, q_rw, q_drift = q
    kf = make_kf(q_wf, q_rw, q_drift, dt, r, p0)
    # Header line carrying the full configuration (read by the Rust test).
    print(f"CASE {name} | {q_wf!r} {q_rw!r} {q_drift!r} | {dt!r} | {r!r} | "
          f"{p0[0]!r},{p0[1]!r},{p0[2]!r} | {n} | {coast}")
    track_i = 0
    for epoch in range(n):
        # PREDICT step.
        kf.predict()
        print(f"STEP {name} {epoch} predict 0 | {fmt_x(kf.x)} | {fmt_p(kf.P)}")
        # UPDATE step (only after the coast phase).
        if epoch >= coast:
            z = measurement(name, track_i, dt)
            kf.update(np.array([[z]]))
            print(f"STEP {name} {epoch} update {z!r} | {fmt_x(kf.x)} | {fmt_p(kf.P)}")
            track_i += 1


def main():
    print("# filterpy 1.4.5 (R. Labbe, MIT) reference trajectory for the 3-state clock filter.")
    print("# F = scipy.linalg.expm(A*dt); Q = Van-Loan 1978 block-matrix; Joseph update.")
    print("# Oracle: filterpy KalmanFilter + scipy.linalg.expm + numpy. Consumed by")
    print("# tests/clock_state_reference.rs. See generate_clock_state_reference.py for scope.")
    print("# CASE name | q_wf q_rw q_drift | dt | r | p0_phase,p0_freq,p0_drift | n_epochs | coast_epochs")
    print("# STEP name epoch kind z | x0,x1,x2 | p00,p01,p02,p11,p12,p22   (kind: predict|update)")
    for name, q, dt, r, p0, n, coast in CASES:
        emit_case(name, q, dt, r, p0, n, coast)


if __name__ == "__main__":
    main()
