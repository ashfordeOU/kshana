#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate reference vectors for the Allen-Eggers ballistic re-entry corridor.

The oracle is **scipy 1.18.0** (BSD-3-Clause; SciPy developers), specifically
`scipy.integrate.solve_ivp` with the adaptive Runge-Kutta DOP853 integrator and a
ground-impact terminal event, plus `scipy.optimize.minimize_scalar` (Brent) to
locate the deceleration peak on the dense interpolant. scipy numerically
integrates the planar, drag-only entry ODE for a non-lifting body through an
exponential isothermal atmosphere at a constant flight-path angle:

    dV/dt = -rho(h) * V^2 / (2 * B)        (drag deceleration)
    dh/dt = -V * sin(gamma)                (descent along constant gamma)
    rho(h) = rho0 * exp(-h / H)            (exponential atmosphere)

This is the SAME governing ODE that the Allen-Eggers (1958) closed form solves
analytically. kshana's `reentry::peak_deceleration`,
`velocity_at_peak_deceleration` and `altitude_at_peak_deceleration` are the
textbook Allen-Eggers closed-form expressions:

    a_max = V_e^2 * sin|gamma| / (2 * e * H)        (B-independent)
    V@peak-g = V_e * e^(-1/2)
    h@peak-g = H * ln(rho0 * H / (B * sin|gamma|))

so scipy's numerically-integrated peak deceleration, the velocity at that peak and
the altitude at that peak are an INDEPENDENT-NUMERICAL-METHOD check that the
closed form correctly solves the ODE it claims to solve. The generator imports
ONLY scipy/numpy; it never touches kshana code.

HONEST SCOPE / what this does and does NOT validate
---------------------------------------------------
scipy here integrates the *same* constant-gamma drag-only model that Allen-Eggers
approximates in closed form: same exponential atmosphere, same neglect of the
gravity component along the path, same constant flight-path angle. So this is an
INTERNAL-CONSISTENCY (numeric-integral-vs-own-analytic-form) check of the model's
mathematics, NOT an external dataset and NOT an independent physical model of a
real re-entry. It does NOT validate the underlying Allen-Eggers *assumptions*
(constant gamma, gravity-negligible, isothermal exponential atmosphere) against
real flight data or a higher-fidelity 3-/6-DoF aerothermal trajectory. It
confirms the kshana formulae reproduce the exact solution of their own ODE to
numerical-integration precision.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/aevenv
    /tmp/aevenv/bin/pip install "scipy>=1.18" numpy
    /tmp/aevenv/bin/python generate_ballistic_re_entry_corridor_reference.py \
        > ballistic_re_entry_corridor_reference.txt

Generated with scipy 1.18.0 + numpy 2.4.6.
"""

import numpy as np
from scipy.integrate import solve_ivp
from scipy.optimize import minimize_scalar

# Earth exponential-atmosphere reference, matching kshana src/reentry.rs exactly.
RHO0 = 1.225            # kg/m^3  (RHO0_EARTH)
H = 7200.0             # m       (SCALE_HEIGHT_EARTH_M)
H0_INTEGRATION = 200_000.0  # m, integration start well above the entry interface

# Envelope grid: V_e {6000,7800,11000} m/s, gamma {3,6,9,30} deg, B {50,100,400} kg/m^2.
VES = [6000.0, 7800.0, 11000.0]
GAMMAS_DEG = [3.0, 6.0, 9.0, 30.0]
BS = [50.0, 100.0, 400.0]


def integrate_peak(v_entry, gamma_deg, ballistic_coeff, rho0=RHO0, h_scale=H):
    """Numerically integrate the planar drag-only constant-gamma entry ODE and
    return (a_max [m/s^2], V_at_peak [m/s], h_at_peak [m]) at the deceleration
    peak, located by Brent refinement on the dense DOP853 interpolant."""
    gamma = np.radians(gamma_deg)
    s = np.sin(gamma)

    def rhs(t, y):
        v, h = y
        rho = rho0 * np.exp(-h / h_scale)
        return [-rho * v * v / (2.0 * ballistic_coeff), -v * s]

    def ground(t, y):
        return y[1]
    ground.terminal = True
    ground.direction = -1

    sol = solve_ivp(
        rhs, [0.0, 3000.0], [v_entry, H0_INTEGRATION],
        method="DOP853", rtol=1e-12, atol=1e-10,
        dense_output=True, events=ground, max_step=0.1,
    )

    def neg_decel(t):
        v, h = sol.sol(t)
        rho = rho0 * np.exp(-h / h_scale)
        return -(rho * v * v / (2.0 * ballistic_coeff))

    ts = np.linspace(sol.t[0], sol.t[-1], 200_000)
    vals = np.array([neg_decel(t) for t in ts])
    i = int(np.argmin(vals))
    lo = ts[max(0, i - 2)]
    mid = ts[i]
    hi = ts[min(len(ts) - 1, i + 2)]
    res = minimize_scalar(neg_decel, bracket=(lo, mid, hi),
                          method="brent", options={"xtol": 1e-12})
    t_star = res.x
    v_star, h_star = sol.sol(t_star)
    rho_star = rho0 * np.exp(-h_star / h_scale)
    a_max = rho_star * v_star * v_star / (2.0 * ballistic_coeff)
    return float(a_max), float(v_star), float(h_star)


print("# scipy solve_ivp reference for the Allen-Eggers ballistic re-entry corridor.")
print("# Oracle: scipy 1.18.0 integrate.solve_ivp (DOP853) + optimize.minimize_scalar")
print("#         (Brent), BSD-3-Clause, SciPy developers, + numpy 2.4.6.")
print("# Model: planar drag-only constant-gamma entry through an exponential")
print("#        isothermal atmosphere (rho0=1.225 kg/m^3, H=7200 m) -- the SAME ODE")
print("#        the Allen-Eggers closed form solves analytically (INTERNAL-CONSISTENCY,")
print("#        numeric-integral vs own-analytic-form; NOT an external dataset).")
print("# Consumed by tests/ballistic_re_entry_corridor_reference.rs.")
print("# REENTRY V_e[m/s] | gamma[deg] | B[kg/m^2] | rho0[kg/m^3] | H[m] | "
      "a_max[m/s^2] | V_at_peak[m/s] | h_at_peak[m]")
for v_entry in VES:
    for gamma_deg in GAMMAS_DEG:
        for b in BS:
            a_max, v_pk, h_pk = integrate_peak(v_entry, gamma_deg, b)
            print(
                f"REENTRY {v_entry!r} | {gamma_deg!r} | {b!r} | {RHO0!r} | {H!r} | "
                f"{a_max!r} | {v_pk!r} | {h_pk!r}"
            )
