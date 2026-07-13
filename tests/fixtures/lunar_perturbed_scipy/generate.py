#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference for tests/lunar_perturbed_scipy_reference.rs (paper P2, gap G8).

WHAT IS ORACLED (independent, authoritative integration):
  scipy.integrate.solve_ivp with the DOP853 explicit Runge-Kutta(8,5,3) integrator
  (BSD-3-Clause, an Ernst Hairer reference method) propagates the perturbed lunar-orbit
  state under the two-body + lunar-J2 + lunar-C22 force model and dumps r(t) samples.

WHY THIS IS AN INDEPENDENT CROSS-CHECK (not a re-run of kshana):
  kshana::lunar_perturbed::propagate integrates the SAME force model with its OWN adaptive
  step-doubling driver (crate::integrator, RK-style, rtol=1e-12/atol=1e-6). This oracle
  integrates with a COMPLETELY DIFFERENT integrator -- scipy's DOP853, a high-order embedded
  Dormand-Prince(8) with its own adaptive step controller (rtol=atol=1e-12). The force model
  (accelerations) is re-implemented here from the SAME published constants, so agreement
  isolates and validates the INTEGRATION: that kshana's driver solves the stated ODE
  correctly, an external-integrator check exactly as the P6 cr3bp-STM oracle pins kshana's RK4
  variational STM to scipy DOP853.

  Scope (honest): the THIRD-BODY (Earth/Sun) terms are NOT oracled here -- they depend on
  kshana's analytic low-precision ephemeris (crate::ephem), which stays a Modelled input; they
  are covered by kshana's own analytic third-body unit tests. This oracle validates the lunar
  gravity-field (J2 + time-varying C22) propagation, which drives the constellation-geometry
  drift the paper's perturbed-vs-idealized DOP comparison rests on.

Constants mirror the crate EXACTLY:
  MOON_MU  = 4.902800118e12 m^3/s^2   (crate::lunar::MOON_GM_M3_S2)
  MOON_J2  = 2.0321e-4                 (crate::body::MOON_ZONALS_J2_J3[0])
  MOON_C22 = 2.2382e-5                 (crate::lunar_perturbed::MOON_C22)
  MOON_R   = 1_737_400 m               (crate::lunar::R_MOON_M)
  sidereal = 27.321661 * 86400 s       (crate::lunar::LUNAR_SIDEREAL_DAY_S)
  rot3(r, th) = [c*x + s*y, -s*x + c*y, z]  (crate::lunar::rot3), th = TAU/sidereal * t

Run:  python3 generate.py            (prints the fixture; deterministic, no randomness)
Reproduce the committed fixture:
      python3 generate.py > lunar_perturbed_scipy_reference.txt
  (numpy + scipy only; no network. The Rust test reads the committed .txt.)

Generated with: scipy DOP853 + numpy.
"""

import sys
import math

import numpy as np
from scipy.integrate import solve_ivp

MOON_MU = 4.902800118e12
MOON_J2 = 2.0321e-4
MOON_C22 = 2.2382e-5
MOON_R = 1_737_400.0
TAU = 2.0 * math.pi
LUNAR_SIDEREAL_DAY_S = 27.321661 * 86400.0


def two_body(r):
    rn = np.linalg.norm(r)
    return -MOON_MU * r / rn**3


def j2_accel(r):
    x, y, z = r
    rn = np.linalg.norm(r)
    r2 = rn * rn
    zr2 = 5.0 * z * z / r2
    c = -1.5 * MOON_J2 * MOON_MU * MOON_R * MOON_R / rn**5
    return np.array([c * x * (1.0 - zr2), c * y * (1.0 - zr2), c * z * (3.0 - zr2)])


def rot3(r, theta):
    s, c = math.sin(theta), math.cos(theta)
    return np.array([c * r[0] + s * r[1], -s * r[0] + c * r[1], r[2]])


def c22_bodyfixed(r_bf):
    x, y, z = r_bf
    rn = np.linalg.norm(r_bf)
    r2 = rn * rn
    k = 3.0 * MOON_MU * MOON_R * MOON_R * MOON_C22 / rn**5
    dxy = x * x - y * y
    return np.array([
        k * (2.0 * x - 5.0 * x * dxy / r2),
        k * (-2.0 * y - 5.0 * y * dxy / r2),
        k * (-5.0 * z * dxy / r2),
    ])


def c22_mci(r, t):
    theta = (TAU / LUNAR_SIDEREAL_DAY_S * t) % TAU
    r_bf = rot3(r, theta)
    a_bf = c22_bodyfixed(r_bf)
    return rot3(a_bf, -theta)  # mcmf_to_mci is rot3 by -theta


def accel(t, r):
    return two_body(r) + j2_accel(r) + c22_mci(r, t)


def rhs(t, y):
    r = y[:3]
    a = accel(t, r)
    return [y[3], y[4], y[5], a[0], a[1], a[2]]


def elements_to_state(a, e, i, raan, argp, nu):
    """Standard Keplerian element -> Cartesian (perifocal then 3-1-3 rotation), mu=MOON_MU.
    Used ONLY to seed a sensible elliptical, inclined ELFO-like initial state; the test
    validates PROPAGATION from this fixed state, not the element conversion."""
    p = a * (1.0 - e * e)
    r_pf = np.array([
        p * math.cos(nu) / (1.0 + e * math.cos(nu)),
        p * math.sin(nu) / (1.0 + e * math.cos(nu)),
        0.0,
    ])
    v_pf = math.sqrt(MOON_MU / p) * np.array([-math.sin(nu), e + math.cos(nu), 0.0])

    def rz(t):
        c, s = math.cos(t), math.sin(t)
        return np.array([[c, -s, 0], [s, c, 0], [0, 0, 1.0]])

    def rx(t):
        c, s = math.cos(t), math.sin(t)
        return np.array([[1.0, 0, 0], [0, c, -s], [0, s, c]])

    q = rz(raan) @ rx(i) @ rz(argp)
    return q @ r_pf, q @ v_pf


def main():
    # Fixed ELFO-like initial elements (elliptical, inclined -> J2 + C22 both act).
    a0 = 6541.0e3
    e0 = 0.6
    i0 = math.radians(56.2)
    raan0 = math.radians(30.0)
    argp0 = math.radians(90.0)
    nu0 = math.radians(10.0)
    r0, v0 = elements_to_state(a0, e0, i0, raan0, argp0, nu0)
    y0 = np.concatenate([r0, v0])

    span_s = 86400.0  # ~1.8 orbital periods
    n_samples = 9
    t_eval = np.linspace(0.0, span_s, n_samples)

    sol = solve_ivp(
        rhs, (0.0, span_s), y0, method="DOP853",
        t_eval=t_eval, rtol=1e-12, atol=1e-12, dense_output=False,
    )
    assert sol.success, sol.message

    print("# EXTERNAL ORACLE for kshana::lunar_perturbed (paper P2, gap G8).")
    print("# scipy.integrate.solve_ivp DOP853 (rtol=atol=1e-12) of two-body + lunar J2 + C22.")
    print(f"# scipy DOP853 / numpy {np.__version__}")
    print("# Force model: two-body + J2 + C22 (time-varying via lunar rotation); NO third body.")
    print("# Consumed by tests/lunar_perturbed_scipy_reference.rs.")
    print(f"# MOON_MU {MOON_MU:.15e}")
    print(f"# MOON_J2 {MOON_J2:.15e}")
    print(f"# MOON_C22 {MOON_C22:.15e}")
    print(f"# MOON_R {MOON_R:.15e}")
    print(f"# LUNAR_SIDEREAL_DAY_S {LUNAR_SIDEREAL_DAY_S:.15e}")
    print("# INITIAL STATE (m, m/s), MCI:")
    print("R0 " + " ".join(f"{x:.15e}" for x in r0))
    print("V0 " + " ".join(f"{x:.15e}" for x in v0))
    print(f"# SPAN_S {span_s:.15e}  N_SAMPLES {n_samples}")
    print("# SAMPLE t_s x y z (position, MCI, m)")
    for k in range(n_samples):
        t = float(sol.t[k])
        x, y, z = sol.y[0, k], sol.y[1, k], sol.y[2, k]
        print(f"SAMPLE {t:.15e} {x:.15e} {y:.15e} {z:.15e}")

    print(
        f"# final |r| = {np.linalg.norm(sol.y[:3, -1]):.3f} m over {span_s/3600:.1f} h",
        file=sys.stderr,
    )


if __name__ == "__main__":
    main()
