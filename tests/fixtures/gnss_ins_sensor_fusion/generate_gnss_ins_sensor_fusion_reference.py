#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the kshana GNSS/INS sensor-fusion stack.

The oracle is **filterpy 1.4.5** (Roger R. Labbe Jr., MIT) — an independent,
widely-used third-party Kalman-filter library — driven by **numpy 2.x / scipy
1.x** (BSD) for the dense linear algebra. filterpy's estimators are a separate
codebase with their own sigma-point construction and Kalman update; fed
byte-identical inputs they are a genuine external authority for the posterior
state mean `x` and covariance `P` of each filter in `src/fusion/`. This is the
same library-vs-library validation the Lambert solver gets against lamberthub and
DOP gets against gnss_lib_py.

Four filters are validated, each on a fixed grid of inputs:

  UKF  — `filterpy.kalman.UnscentedKalmanFilter` + `MerweScaledSigmaPoints`
         (alpha=1, beta=2, kappa=0, the exact spread `TightlyCoupled::new`
         uses) on the **nonlinear** tightly-coupled measurement model
         `rho = |p - s_i| + b`, `rhodot = (p - s_i)·(v - sdot_i)/|p - s_i| + d`
         over a multi-epoch 5-satellite and 3-satellite geometry. Validates
         `fusion::ukf::Ukf` + `fusion::tightly_coupled::TightlyCoupled`.

  EKFLOOSE — `filterpy.kalman.KalmanFilter` on the 15-state error-state
         loosely-coupled position+velocity update (H selects dp, dv; z = INS-GNSS).
         Validates `fusion::gnss_ins_ekf::update_loosely_coupled`.

  EKFTIGHT — `filterpy.kalman.KalmanFilter` on the 15-state error-state
         tightly-coupled pseudorange update (range-domain innovation,
         H_i = [e_i, 0...]). Validates
         `fusion::gnss_ins_ekf::update_tightly_coupled`.

  COUPLED — `filterpy.kalman.KalmanFilter` on the 4-state [pos, vel, phase, freq]
         coupled PNT filter with its van-Loan block-diagonal Q and the
         pseudorange row H = [g, 0, c, 0] over a predict+update sequence.
         Validates `fusion::coupled::CoupledPntFilter`.

Conventions matched exactly to the kshana source:
  * MerweScaledSigmaPoints default sqrt = scipy.linalg.cholesky (upper U with
    P = U^T U). kshana factors P = L L^T (lower) and spreads along the columns
    of L; since Cholesky is unique, U = L^T, so the two libraries use the SAME
    sigma-point set. Weights match: Wm0 = lambda/(n+lambda),
    Wc0 = Wm0 + (1 - alpha^2 + beta), rest 1/(2(n+lambda)).
  * The EKF loosely/tightly-coupled and the coupled PNT filter are LINEAR
    Kalman updates: filterpy's standard `P = (I-KH)P` and kshana's Joseph
    `P = (I-KH)P(I-KH)^T + KRK^T` reach the identical posterior in exact
    arithmetic, so the agreement is machine precision.

HONEST SCOPE and a documented modelling note on the UKF:
  filterpy's UKF *reuses* the propagated process sigma points (`sigmas_f`) for
  the measurement update, whereas kshana RE-DRAWS sigma points from the
  predicted covariance P-minus before the update (van der Merwe's additive-noise
  UKF: both the "reuse" and "regenerate" variants are published and valid). The
  two coincide exactly only when the predict adds no process noise into the
  spread, so this fixture runs the UKF cases with **Q = 0** (a noiseless
  multi-epoch run). With Q = 0 the residual between the two libraries is the
  cross-codebase floating-point arithmetic plus the re-Cholesky basis rotation
  acting through the nonlinear h — bounded at ~1e-7 in x and ~1e-5 in P over 20
  epochs. The general Q>0 UKF behaviour (process-noise inflation of the
  posterior covariance) is exercised by kshana's own unit tests and the
  outage-survival acceptance tests in `tightly_coupled.rs`; it is NOT what this
  fixture pins, because the two libraries implement different (both correct)
  additive-noise UKF variants there.

  This fixture validates the *estimator mathematics* (sigma-point UT, Kalman
  gain, innovation, posterior mean and covariance) of each filter against an
  independent library. It does NOT validate the navigation scenario realism
  (constellation visibility, broadcast iono/tropo, IMU error growth) — those are
  covered by the agency real-data tests and the in-module acceptance scenarios.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/kshana-oracles/.venv
    /tmp/kshana-oracles/.venv/bin/pip install filterpy numpy scipy
    /tmp/kshana-oracles/.venv/bin/python \
        generate_gnss_ins_sensor_fusion_reference.py > gnss_ins_sensor_fusion_reference.txt

Generated with filterpy 1.4.5 + numpy 2.x + scipy 1.x.
"""

import numpy as np
from filterpy.kalman import (
    UnscentedKalmanFilter,
    MerweScaledSigmaPoints,
    KalmanFilter,
)


def fmt(xs):
    """Round-trippable comma-separated float list."""
    return ",".join(repr(float(x)) for x in np.ravel(xs))


# ---------------------------------------------------------------------------
# Fixed 5-satellite MEO geometry, identical to tightly_coupled.rs::constellation.
# (pos[m], vel[m/s])
# ---------------------------------------------------------------------------
SATS = [
    ([2.00e7, 1.00e7, 1.50e7], [-1500.0, 2200.0, 600.0]),
    ([1.50e7, -1.20e7, 1.80e7], [1800.0, 1500.0, -700.0]),
    ([2.20e7, 0.50e7, -1.00e7], [-900.0, -2000.0, 1200.0]),
    ([1.00e7, 1.80e7, -1.50e7], [2100.0, -800.0, -1000.0]),
    ([2.50e7, -0.80e7, 0.60e7], [-1200.0, 1700.0, 1400.0]),
]


def make_hx(sats):
    """Nonlinear tightly-coupled measurement model: pseudorange then range-rate,
    exactly matching fusion::tightly_coupled::pseudorange / range_rate."""

    def hx(s):
        z = []
        for sp, _sv in sats:
            d = np.array(s[:3]) - np.array(sp)
            z.append(np.linalg.norm(d) + s[6])  # rho = |p - s_i| + b
        for sp, sv in sats:
            d = np.array(s[:3]) - np.array(sp)
            r = np.linalg.norm(d)
            vrel = np.array(s[3:6]) - np.array(sv)
            z.append(d.dot(vrel) / r + s[7])  # rhodot = LOS.vrel/|.| + d
        return np.array(z)

    return hx


DT = 1.0


def fx_cv(s, dt):
    """Constant-velocity position + random-walk-clock process, matching
    TightlyCoupled::propagate."""
    return np.array(
        [
            s[0] + s[3] * dt,
            s[1] + s[4] * dt,
            s[2] + s[5] * dt,
            s[3],
            s[4],
            s[5],
            s[6] + s[7] * dt,
            s[7],
        ]
    )


def truth_state(t):
    """Truth at integer second t, matching tightly_coupled.rs::truth_state."""
    return np.array([7.0e6, 7.5e3 * t, 0.0, 0.0, 7.5e3, 0.0, 30.0 + 0.1 * t, 0.1])


# Initial filter state, covariance and per-measurement sigmas — identical to
# tightly_coupled.rs::init_navigator (but with Q = 0; see the docstring note).
X0_TC = [7.0e6 + 150.0, -120.0, 90.0, 2.0, 7.5e3 - 1.5, 1.0, 38.0, 0.15]
P0_TC = [1.0e4, 1.0e4, 1.0e4, 1.0e2, 1.0e2, 1.0e2, 1.0e4, 1.0e0]
SIGMA_PR = 1.0  # m
SIGMA_RR = 0.05  # m/s


def emit_ukf_run(name, sats, n_epochs):
    """Run a noiseless (Q=0) tightly-coupled UKF for n_epochs of
    propagate(dt=1)+update(noiseless truth measurement) and emit, per epoch,
    the posterior x (8) and the full posterior P (8x8, row-major)."""
    k = len(sats)
    hx = make_hx(sats)
    R = np.diag([SIGMA_PR**2] * k + [SIGMA_RR**2] * k)
    pts = MerweScaledSigmaPoints(n=8, alpha=1.0, beta=2.0, kappa=0.0)
    ukf = UnscentedKalmanFilter(
        dim_x=8, dim_z=2 * k, dt=DT, fx=fx_cv, hx=hx, points=pts
    )
    ukf.x = np.array(X0_TC, dtype=float)
    ukf.P = np.diag(P0_TC).astype(float)
    ukf.Q = np.zeros((8, 8))
    ukf.R = R.copy()
    for step in range(1, n_epochs + 1):
        z = hx(truth_state(float(step)))
        ukf.predict()
        ukf.update(z)
        # UKF name | epoch | k | x(8) | P(64 row-major)
        print(f"UKF {name} | {step} | {k} | {fmt(ukf.x)} | {fmt(ukf.P)}")


# ---------------------------------------------------------------------------
# 15-state error-state EKF (loosely-coupled position+velocity).
# ---------------------------------------------------------------------------
N15 = 15
# Initial diagonal sigmas, matching gnss_ins_ekf.rs::default_ekf:
#   sigma_pos=10, sigma_vel=1, sigma_att=0.01, sigma_ba=0.1, sigma_bg=0.01
EKF_P0_DIAG = (
    [10.0**2] * 3 + [1.0**2] * 3 + [0.01**2] * 3 + [0.1**2] * 3 + [0.01**2] * 3
)


def emit_ekf_loose(name, innov_pos, innov_vel, sigma_pos, sigma_vel):
    """One loosely-coupled update from the zero error-state prior. The kshana
    innovation is z = (INS - GNSS); fed an INS reading of `innov_*` and a GNSS
    reading of 0 the innovation IS `innov_*`. Emit posterior dx (15) and the
    full posterior P (15x15)."""
    H = np.zeros((6, N15))
    for kk in range(3):
        H[kk, kk] = 1.0
        H[3 + kk, 3 + kk] = 1.0
    z = np.array(list(innov_pos) + list(innov_vel))
    R = np.diag([sigma_pos**2] * 3 + [sigma_vel**2] * 3)
    kf = KalmanFilter(dim_x=N15, dim_z=6)
    kf.x = np.zeros((N15, 1))
    kf.P = np.diag(EKF_P0_DIAG).astype(float)
    kf.H = H
    kf.R = R
    kf.update(z.reshape(6, 1))
    # EKFLOOSE name | dx(15) | P(225 row-major) | ins_pos(3) | ins_vel(3) | sp | sv
    print(
        f"EKFLOOSE {name} | {fmt(kf.x.flatten())} | {fmt(kf.P)} | "
        f"{fmt(innov_pos)} | {fmt(innov_vel)} | {sigma_pos!r} | {sigma_vel!r}"
    )


def emit_ekf_tight(name, ins_pos, sat_positions, true_offsets, sigma_range):
    """One tightly-coupled pseudorange update from the zero error-state prior.
    The measured range for satellite i is set so the range residual
    z_i = predicted_range - rho_meas_i = true_offsets[i] (a clean injected
    innovation). Emit posterior dx (15) and the full posterior P (15x15)."""
    m = len(sat_positions)
    H = np.zeros((m, N15))
    z = np.zeros(m)
    rho_meas = []
    for i in range(m):
        d = np.array(ins_pos) - np.array(sat_positions[i])
        rng = np.linalg.norm(d)
        e = d / rng
        H[i, :3] = e
        # rho_meas chosen so range - rho_meas = true_offsets[i]
        rho_meas.append(rng - true_offsets[i])
        z[i] = rng - rho_meas[i]  # = true_offsets[i]
    R = np.eye(m) * sigma_range**2
    kf = KalmanFilter(dim_x=N15, dim_z=m)
    kf.x = np.zeros((N15, 1))
    kf.P = np.diag(EKF_P0_DIAG).astype(float)
    kf.H = H
    kf.R = R
    kf.update(z.reshape(m, 1))
    sat_flat = ";".join(fmt(sp) for sp in sat_positions)
    # EKFTIGHT name | dx(15) | P(225) | ins_pos(3) | sat_positions(3 each;-sep) | rho_meas(m) | sigma_range
    print(
        f"EKFTIGHT {name} | {fmt(kf.x.flatten())} | {fmt(kf.P)} | "
        f"{fmt(ins_pos)} | {sat_flat} | {fmt(rho_meas)} | {sigma_range!r}"
    )


# ---------------------------------------------------------------------------
# 4-state coupled PNT filter [pos, vel, phase, freq].
# ---------------------------------------------------------------------------
C_M_PER_S = 299_792_458.0


def coupled_Q(q_va, q_wf, q_rw, dt):
    dt2, dt3 = dt * dt, dt * dt * dt
    Q = np.zeros((4, 4))
    # position block (van Loan, velocity random walk)
    Q[0, 0] = q_va * dt3 / 3.0
    Q[0, 1] = q_va * dt2 / 2.0
    Q[1, 0] = q_va * dt2 / 2.0
    Q[1, 1] = q_va * dt
    # clock block (white FM + random-walk FM)
    Q[2, 2] = q_wf * dt + q_rw * dt3 / 3.0
    Q[2, 3] = q_rw * dt2 / 2.0
    Q[3, 2] = q_rw * dt2 / 2.0
    Q[3, 3] = q_rw * dt
    return Q


def coupled_F(dt):
    F = np.eye(4)
    F[0, 1] = dt
    F[2, 3] = dt
    return F


def emit_coupled(name, q_va, q_wf, q_rw, p0diag, seq, dt):
    """Run a predict+pseudorange-update sequence and emit the final x (4) and
    full P (4x4). `seq` is a list of (rho, g, c, r)."""
    kf = KalmanFilter(dim_x=4, dim_z=1)
    kf.x = np.zeros((4, 1))
    kf.P = np.diag(p0diag).astype(float)
    kf.F = coupled_F(dt)
    kf.Q = coupled_Q(q_va, q_wf, q_rw, dt)
    for (rho, g, c, r) in seq:
        kf.predict()
        kf.H = np.array([[g, 0.0, c, 0.0]])
        kf.R = np.array([[r]])
        kf.update(np.array([[rho]]))
    seq_flat = ";".join(f"{rho!r},{g!r},{c!r},{r!r}" for (rho, g, c, r) in seq)
    # COUPLED name | qva | qwf | qrw | dt | p0diag(4) | x(4) | P(16) | seq
    print(
        f"COUPLED {name} | {q_va!r} | {q_wf!r} | {q_rw!r} | {dt!r} | "
        f"{fmt(p0diag)} | {fmt(kf.x.flatten())} | {fmt(kf.P)} | {seq_flat}"
    )


def main():
    print("# filterpy reference for the kshana GNSS/INS sensor-fusion stack.")
    print(
        "# Oracle: filterpy 1.4.5 (R. Labbe, MIT) UnscentedKalmanFilter + "
        "MerweScaledSigmaPoints / KalmanFilter, on numpy+scipy."
    )
    print(
        "# Consumed by tests/gnss_ins_sensor_fusion_reference.rs. "
        "See generate_gnss_ins_sensor_fusion_reference.py for provenance + scope."
    )
    print("# UKF cases use Q=0 (see docstring): regenerate-vs-reuse UKF variants coincide there.")

    # --- UKF / tightly-coupled: 5-sat (20 epochs) and 3-sat (20 epochs). ---
    emit_ukf_run("5sat", SATS, 20)
    emit_ukf_run("3sat", SATS[:3], 20)

    # --- EKF loosely-coupled. ---
    emit_ekf_loose("known_err", [3.0, -4.0, 1.5], [0.2, -0.1, 0.05], 1.0, 0.1)
    emit_ekf_loose("strong_fix", [5.0, 0.0, 0.0], [0.0, 0.0, 0.0], 0.5, 0.1)
    emit_ekf_loose("weak_fix", [5.0, 0.0, 0.0], [0.0, 0.0, 0.0], 50.0, 0.1)
    emit_ekf_loose("full3d", [-2.5, 7.0, -3.3], [-0.4, 0.6, 0.9], 2.0, 0.2)

    # --- EKF tightly-coupled (range domain). ---
    sat_pos = [
        [2.0e7, 1.0e7, 1.5e7],
        [1.5e7, -1.2e7, 1.8e7],
        [2.2e7, 5.0e6, -1.0e7],
    ]
    ins_pos = [1000.0, 2000.0, -500.0]
    emit_ekf_tight("three_sat", ins_pos, sat_pos, [2.0, -1.5, 0.8], 1.0)
    # Single overhead satellite (the one-sat selectivity case).
    emit_ekf_tight(
        "overhead_one", [0.0, 0.0, 0.0], [[0.0, 0.0, -2.0e7]], [10.0], 1.0
    )
    # Five satellites, weak measurement noise.
    sat5 = [list(sp) for sp, _ in SATS]
    emit_ekf_tight(
        "five_sat", [5000.0, -3000.0, 1500.0], sat5, [3.0, -2.0, 1.0, -0.5, 4.0], 2.0
    )

    # --- Coupled PNT filter. ---
    C = C_M_PER_S
    p0 = [1.0e4, 1.0, 1.0e-12, 1.0e-18]
    emit_coupled(
        "two_geom",
        1e-4,
        9e-20,
        1e-28,
        p0,
        [
            (0.0, 1.0, C, 4.0),
            (0.0, -1.0, C, 4.0),
            (12.0, 1.0, C, 25.0),
            (-4.0, 0.7, C, 25.0),
            (3.0, 0.0, C, 9.0),
        ],
        1.0,
    )
    emit_coupled(
        "resolve",
        1e-4,
        9e-20,
        1e-28,
        p0,
        [
            (120.0 + C * 3e-7, 1.0, C, 1e-2),
            (-120.0 + C * 3e-7, -1.0, C, 1e-2),
            (120.0 + C * 3e-7, 1.0, C, 1e-2),
            (-120.0 + C * 3e-7, -1.0, C, 1e-2),
        ],
        1.0,
    )
    emit_coupled(
        "clock_aid",
        1e-4,
        9e-20,
        1e-28,
        p0,
        [
            (0.0, 1.0, C, 4.0),
            (0.0, 0.9, C, 4.0),
            (0.0, 0.0, C, 1e-6),
        ],
        1.0,
    )


if __name__ == "__main__":
    main()
