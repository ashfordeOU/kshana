#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for tests/cr3bp_variational_stm_reference.rs (paper P6, L31).

WHAT IS ORACLED (independent integrator, authoritative, BSD-licensed):
  A **scipy.integrate.solve_ivp (DOP853, rtol=atol=1e-13)** integration of the coupled CR3BP
  STATE + VARIATIONAL equations
        dx/dt   = f(x)                          (the CR3BP equations of motion)
        dPhi/dt = A(t, x) . Phi,  Phi(0) = I    (the variational / STM equation)
  where A(t, x) is the 6x6 Jacobian df/dx. This yields the state-transition matrix Phi(t) of the
  CR3BP flow from a DIFFERENT integrator than kshana's fixed-step RK4, and (unlike the existing
  finite-difference self-check in kshana::observability_gramian, which perturbs the STATE flow)
  from a DIFFERENT equation set (the variational ODE integrated in lock-step with the state).

  kshana::cr3bp::propagate_state_stm integrates the same coupled system with fixed-step RK4. The
  Rust test compares its 6x6 Phi element-by-element against this scipy Phi -- an independent-code,
  independent-equation cross-check of the STM propagation itself, the "additionally" oracle beyond
  the finite-difference self-check.

CONVENTION (must match kshana::cr3bp exactly):
  * mu = 0.012150585609624  (EARTH_MOON_MU); primaries at x=-mu (Earth, mass 1-mu) and
    x=1-mu (Moon, mass mu).
  * pseudo-potential Omega = 1/2 (x^2 + y^2) + (1-mu)/r1 + mu/r2, with
    r1 = |(x+mu, y, z)|, r2 = |(x-1+mu, y, z)|; rotating-frame EOM with +2*vy, -2*vx Coriolis.
  * Jacobian A = [[0, I], [Omega_rr, Omega_v]] with the 3x3 second-partials block Omega_rr
    (Oxx, Oyy, Ozz, Oxy, Oxz, Oyz) and the Coriolis block [[0,2,0],[-2,0,0],[0,0,0]].
  These are the SAME formulae as kshana::cr3bp::cr3bp_jacobian.

FIXED INPUTS (planar states embedded as z=vz=0, plus one fully 3-D state so the out-of-plane
  block is exercised too), each propagated to a fixed time t. Deterministic, no randomness.

Run:  python3 generate.py > cr3bp_variational_stm_reference.txt   (numpy + scipy; no network)
Generated with: scipy DOP853 + numpy.
"""

import sys

import numpy as np
from scipy.integrate import solve_ivp

MU = 0.012150585609624  # EARTH_MOON_MU


def accel(x):
    """CR3BP rotating-frame acceleration (matches kshana::cr3bp::cr3bp_accel)."""
    px, py, pz, vx, vy, vz = x
    a = 1.0 - MU
    b = MU
    dx1 = px + MU
    dx2 = px - 1.0 + MU
    r1 = (dx1 * dx1 + py * py + pz * pz) ** 0.5
    r2 = (dx2 * dx2 + py * py + pz * pz) ** 0.5
    r1_3, r2_3 = r1 ** 3, r2 ** 3
    ax = px + 2.0 * vy - a * dx1 / r1_3 - b * dx2 / r2_3
    ay = py - 2.0 * vx - a * py / r1_3 - b * py / r2_3
    az = -a * pz / r1_3 - b * pz / r2_3
    return np.array([ax, ay, az])


def jacobian(x):
    """6x6 CR3BP Jacobian A = df/dx (matches kshana::cr3bp::cr3bp_jacobian)."""
    px, py, pz = x[0], x[1], x[2]
    a = 1.0 - MU
    b = MU
    dx1 = px + MU
    dx2 = px - 1.0 + MU
    r1 = (dx1 * dx1 + py * py + pz * pz) ** 0.5
    r2 = (dx2 * dx2 + py * py + pz * pz) ** 0.5
    r1_3, r2_3 = r1 ** 3, r2 ** 3
    r1_5, r2_5 = r1 ** 5, r2 ** 5
    oxx = 1.0 - a / r1_3 - b / r2_3 + 3.0 * a * dx1 * dx1 / r1_5 + 3.0 * b * dx2 * dx2 / r2_5
    oyy = 1.0 - a / r1_3 - b / r2_3 + 3.0 * a * py * py / r1_5 + 3.0 * b * py * py / r2_5
    ozz = -a / r1_3 - b / r2_3 + 3.0 * a * pz * pz / r1_5 + 3.0 * b * pz * pz / r2_5
    oxy = 3.0 * a * dx1 * py / r1_5 + 3.0 * b * dx2 * py / r2_5
    oxz = 3.0 * a * dx1 * pz / r1_5 + 3.0 * b * dx2 * pz / r2_5
    oyz = 3.0 * a * py * pz / r1_5 + 3.0 * b * py * pz / r2_5
    m = np.zeros((6, 6))
    m[0, 3] = 1.0
    m[1, 4] = 1.0
    m[2, 5] = 1.0
    m[3, 0], m[3, 1], m[3, 2], m[3, 4] = oxx, oxy, oxz, 2.0
    m[4, 0], m[4, 1], m[4, 2], m[4, 3] = oxy, oyy, oyz, -2.0
    m[5, 0], m[5, 1], m[5, 2] = oxz, oyz, ozz
    return m


def rhs(_t, s):
    """Coupled state (6) + STM (36) derivative: [vx,vy,vz, ax,ay,az] and A.Phi (flattened)."""
    x = s[:6]
    phi = s[6:].reshape(6, 6)
    dx = np.empty(6)
    dx[:3] = x[3:6]
    dx[3:6] = accel(x)
    dphi = jacobian(x) @ phi
    return np.concatenate([dx, dphi.ravel()])


def propagate_stm(x0, t):
    """scipy DOP853 propagation of state + variational STM to time t. Returns (state, Phi)."""
    s0 = np.concatenate([np.asarray(x0, float), np.eye(6).ravel()])
    sol = solve_ivp(rhs, [0.0, t], s0, method="DOP853", rtol=1e-13, atol=1e-13,
                    max_step=t / 20000.0)
    sf = sol.y[:, -1]
    return sf[:6], sf[6:].reshape(6, 6)


# FIXED test cases: (name, state6, t). Two planar (z=vz=0) and one fully 3-D so the out-of-plane
# STM block is exercised. Times kept short enough that fixed-step RK4 and DOP853 agree tightly.
CASES = [
    ("planar_short", [1.08, 0.03, 0.0, 0.10, -0.50, 0.0], 0.20),
    ("planar_dro_like", [1.10, 0.02, 0.0, 0.05, -0.50, 0.0], 0.30),
    ("spatial", [0.98, 0.05, 0.04, 0.10, -0.40, 0.08], 0.15),
]
# RK4 sub-steps kshana should use for each case (fine enough to match DOP853 to the tolerance).
STEPS = [8000, 8000, 8000]


def emit_matrix(name, m):
    m = np.asarray(m, float)
    print(f"# MATRIX {name} shape=6x6")
    for r in m:
        print("ROW " + " ".join(f"{x:.15e}" for x in r))


def main():
    print("# EXTERNAL ORACLE for kshana::cr3bp::propagate_state_stm (paper P6, L31).")
    print("# scipy.integrate.solve_ivp (DOP853, rtol=atol=1e-13) of the coupled CR3BP")
    print("#   state + VARIATIONAL equations dPhi/dt = A(t,x).Phi, Phi(0)=I. Independent")
    print("#   integrator AND independent equation set vs kshana's fixed-step RK4 coupled STM.")
    print(f"# numpy {np.__version__}  scipy {__import__('scipy').__version__}")
    print(f"# mu {MU!r}")
    print("# Consumed by tests/cr3bp_variational_stm_reference.rs.")
    print()
    for (name, x0, t), steps in zip(CASES, STEPS):
        st, phi = propagate_stm(x0, t)
        print(f"# CASE {name} t={t!r} steps={steps}")
        print(f"# STATE0 {' '.join(f'{v:.15e}' for v in x0)}")
        print(f"# STATEF {' '.join(f'{v:.15e}' for v in st)}")
        emit_matrix(f"PHI_{name}", phi)
        print()
    print(f"# {len(CASES)} variational-STM cases written.", file=sys.stderr)


if __name__ == "__main__":
    main()
