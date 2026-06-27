#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the quantum-inertial dead-reckoning
error budget (kshana `inertial::quantum_imu::QuantumNavBudget`).

This validates the GNSS-denied inertial holdover position-error budget against two
INDEPENDENT authorities, each a different code path from the analytic forms
kshana evaluates:

  ORACLE 1 -- Velocity-random-walk (VRW) term:
      Independent numpy Monte-Carlo SDE integration of double-integrated white
      acceleration noise. For a white specific-force-error process with
      (one-sided) PSD q_va, the dead-reckoning position error after a t-second
      coast is the second time-integral of that noise. We DO NOT use the
      kshana closed form sqrt(q_va*t^3/3): instead we draw M independent
      discrete white-acceleration paths (per-step std sqrt(q_va/dt)), double-
      integrate each by two cumulative sums (* dt), and take the empirical 1-sigma
      of the final position over the M realisations. The empirical std landing on
      sqrt(q_va*t^3/3) is the non-trivial external confirmation that the analytic
      VRW variance kshana carries is correct. The continuous-limit identity
      Var[x(t)] = integral_0^t (t-u)^2 q_va du = q_va*t^3/3 is the standard
      INS accelerometer-noise propagation result (Groves 2013, ch. 14).

  ORACLE 2 -- Deterministic bias / scale-factor terms:
      Closed-form INS error propagation from Groves, "Principles of GNSS,
      Inertial, and Multisensor Integrated Navigation Systems", 2nd ed.,
      Artech House, 2013 (ISBN 978-1-60807-005-3). A *constant* accelerometer
      bias b (residual specific-force error) propagates into position error by
      double time-integration: dr = 1/2 * b * t^2 (Groves sec. 5.7.2 / eq. 14.9,
      the short-term INS error-propagation result). A fractional scale-factor
      error eps acting on a sustained specific force a_ref is an equivalent
      specific-force error eps*a_ref, giving dr = 1/2 * eps * a_ref * t^2. These
      published closed forms are also cross-checked here by an INDEPENDENT numpy
      discrete double-integration (cumsum-twice) of the constant error, so the
      reference is both a published-value anchor and an independent-code check.

  Holdover round-trip:
      The reference also pins holdover threshold cases so the Rust test can verify
      that drift(holdover_seconds(thr)) == thr (a monotone-inversion round-trip).

Conventions matched to kshana exactly (see src/inertial/quantum_imu.rs):
  k_eff       = 4*pi/wavelength_m                         (effective_wavevector)
  sigma_phi   = 1/(contrast*sqrt(atom_number))            (projection_noise_rad)
  sigma_a     = sigma_phi/(k_eff*T^2)                     (accel_sensitivity_per_shot)
  n_a         = sigma_a*sqrt(cycle_time_s)                (accel_asd)
  q_va        = n_a^2                                     (CaiAccelerometer::q_va)
  vrw_drift_m(t)            = sqrt(q_va*t^3/3)            (tau_stability_s <= 0)
  bias_drift_m(t)          = 0.5*bias*t^2
  scale_factor_drift_m(t)  = 0.5*(ppm*1e-6)*a_ref*t^2
The emitted CAI config lets the Rust test rebuild the IDENTICAL QuantumNavBudget;
the Rust side derives q_va from that config and is asserted to match the q_va
emitted here (so the Monte-Carlo band applies to the same physics).

HONEST SCOPE -- what this DOES validate:
  * VRW: the analytic double-integrated-white-noise variance q_va*t^3/3 against an
    independent Monte-Carlo SDE integration (>=6 coast times, >=3 q_va decades).
  * bias/scale-factor: the 0.5*b*t^2 and 0.5*eps*a_ref*t^2 closed forms against
    the Groves published INS error-propagation identity AND an independent numpy
    double-integration of the constant error.
  * holdover: that the bisection inversion round-trips drift(holdover)=threshold.
What this does NOT validate:
  * The cold-atom-interferometer device physics that PRODUCES q_va (atom number,
    contrast, shot-noise floor) -- that is the separate inertial::quantum_imu /
    inertial::cai_params capability, checked elsewhere (Freier-2016 bracket).
  * The root-sum-square composition assumption (independence of error sources) --
    a modelling convention, not validated here.
  * Long-term stability-decay (tau_stability_s>0); this fixture exercises the
    constant-q_va branch, which is the VRW term being externally checked.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/oracle && /tmp/oracle/bin/pip install numpy
    /tmp/oracle/bin/python generate_quantum_inertial_dead_reckoning_reference.py \
        > quantum_inertial_dead_reckoning_reference.txt

Generated with numpy (independent Monte-Carlo) + Groves 2013 closed forms.
"""

import numpy as np

PI = np.pi
RB87_D2_WAVELENGTH_M = 780.241209e-9  # matches kshana RB87_D2_WAVELENGTH_M

# Fixed RNG for a reproducible committed fixture.
SEED = 0xC0FFEE
M = 200_000          # Monte-Carlo realisations (>= 2e5)
N_STEPS = 1200       # discretisation steps per path (discrete-vs-continuum bias < 0.15%)

# Coast times (s): >= 6, spanning 30 s .. 20 min.
COAST_TIMES = [30.0, 60.0, 120.0, 300.0, 600.0, 1200.0]


def k_eff(wavelength_m):
    return 4.0 * PI / wavelength_m


def q_va_of(wavelength_m, pulse_sep_t, atom_number, contrast, cycle_time_s):
    """Replicates CaiAccelerometer::q_va exactly."""
    ke = k_eff(wavelength_m)
    sigma_phi = 1.0 / (contrast * np.sqrt(atom_number))
    sigma_a = sigma_phi / (ke * pulse_sep_t * pulse_sep_t)
    n_a = sigma_a * np.sqrt(cycle_time_s)
    return n_a * n_a


def mc_vrw_std(q_va, t, rng):
    """Independent Monte-Carlo: empirical 1-sigma of the double time-integral of a
    white-acceleration path with PSD q_va over [0, t]. Uses NO closed form."""
    dt = t / N_STEPS
    sigma_step = np.sqrt(q_va / dt)
    # M paths, N_STEPS white-acceleration increments each.
    a = rng.normal(0.0, sigma_step, size=(M, N_STEPS))
    v = np.cumsum(a, axis=1) * dt          # velocity = integral of accel
    x = np.cumsum(v, axis=1) * dt          # position = integral of velocity
    return float(x[:, -1].std(ddof=1))


def mc_double_integral_constant(value, t):
    """Independent discrete double-integration of a CONSTANT specific-force error
    `value` over [0, t] (forward-Euler cumsum-twice). Converges to 0.5*value*t^2;
    used to cross-check the Groves closed form with an independent code path."""
    dt = t / N_STEPS
    a = np.full(N_STEPS, value)
    v = np.cumsum(a) * dt
    x = np.cumsum(v) * dt
    return float(x[-1])


# ---- CAI configs chosen to span >= 3 decades of q_va (vary pulse separation T;
#      q_va ~ 1/T^4). atom_number stays well above the kshana clamp of 1.0. ----
# (name, wavelength_m, pulse_sep_t, atom_number, contrast, cycle_time_s)
CAI_CONFIGS = [
    ("Tshort",  RB87_D2_WAVELENGTH_M, 0.005, 1.0e6, 0.5, 0.5),
    ("Tmed",    RB87_D2_WAVELENGTH_M, 0.01,  1.0e6, 0.5, 0.5),
    ("Tlong",   RB87_D2_WAVELENGTH_M, 0.05,  1.0e6, 0.5, 0.5),
    ("Tvlong",  RB87_D2_WAVELENGTH_M, 0.10,  1.0e6, 0.5, 0.5),
]

# Deterministic bias / scale-factor cases (Groves closed form).
# (name, bias_m_s2, scale_factor_ppm, ref_accel_m_s2)
DET_CASES = [
    ("bias_micro_g",     1.0e-5, 0.0,   0.0),
    ("bias_10micro_g",   1.0e-4, 0.0,   0.0),
    ("sf_100ppm_1g",     0.0,    100.0, 9.80665),
    ("sf_50ppm_2ms2",    0.0,    50.0,  2.0),
    ("bias_and_sf",      1.0e-5, 100.0, 2.0),
]

# Holdover round-trip cases: (name, bias, ppm, a_ref, threshold_m) over a budget
# that also carries a representative q_va (Tlong config).
HOLDOVER_CASES = [
    ("hold_50m_bias",    1.0e-5, 0.0,   0.0, 50.0),
    ("hold_100m_bias",   1.0e-5, 0.0,   0.0, 100.0),
    ("hold_10m_sf",      0.0,    100.0, 1.0, 10.0),
    ("hold_500m_mixed",  1.0e-4, 50.0,  1.0, 500.0),
]


def f(x):
    return repr(float(x))


def main():
    rng = np.random.default_rng(SEED)

    print("# Quantum-inertial dead-reckoning reference (GNSS-denied holdover budget).")
    print("# Oracle 1 (VRW): independent numpy Monte-Carlo double-integration of white")
    print(f"#   acceleration noise (M={M} paths, {N_STEPS} steps/path, seed={SEED:#x}).")
    print("# Oracle 2 (bias/scale-factor): Groves 2013 INS error-propagation closed form")
    print("#   (Principles of GNSS, Inertial & Multisensor Integrated Navigation, 2nd ed.,")
    print("#   Artech House, ISBN 978-1-60807-005-3) + independent numpy double-integration.")
    print("# Consumed by tests/quantum_inertial_dead_reckoning_reference.rs.")
    print("# Units: m, s, m/s^2, (m/s^2)^2/Hz.")
    print("#")
    # CAI config rows: let the Rust test rebuild the identical CaiAccelerometer and
    # confirm its q_va() matches the q_va used for the Monte-Carlo here.
    print("# CAI name | wavelength_m | pulse_sep_t | atom_number | contrast | cycle_time_s | q_va")
    cfg_q = {}
    qs = []
    for (name, lam, T, N, C, Tc) in CAI_CONFIGS:
        q = q_va_of(lam, T, N, C, Tc)
        cfg_q[name] = q
        qs.append(q)
        print(f"CAI {name} | {f(lam)} | {f(T)} | {f(N)} | {f(C)} | {f(Tc)} | {f(q)}")
    decades = np.log10(max(qs)) - np.log10(min(qs))
    print(f"# (q_va spans {decades:.2f} decades across the CAI configs)")
    print("#")

    # VRW Monte-Carlo rows: empirical std + the analytic target, per (config, t).
    print("# VRW cfgname | t | q_va | mc_std_m | analytic_sqrt_qt3_3 | rel_mc_vs_analytic")
    for (name, lam, T, N, C, Tc) in CAI_CONFIGS:
        q = cfg_q[name]
        for t in COAST_TIMES:
            emp = mc_vrw_std(q, t, rng)
            analytic = np.sqrt(q * t**3 / 3.0)
            rel = (emp - analytic) / analytic
            print(f"VRW {name} | {f(t)} | {f(q)} | {f(emp)} | {f(analytic)} | {f(rel)}")
    print("#")

    # Deterministic bias/scale-factor rows: Groves closed form + independent
    # double-integration cross-check, at two coast times each.
    print("# DET name | bias_m_s2 | scale_factor_ppm | ref_accel_m_s2 | t | "
          "bias_drift_groves | sf_drift_groves | bias_drift_numint | sf_drift_numint")
    for (name, bias, ppm, a_ref) in DET_CASES:
        for t in (100.0, 300.0):
            bias_groves = 0.5 * bias * t * t
            sf_groves = 0.5 * (ppm * 1.0e-6) * a_ref * t * t
            bias_num = mc_double_integral_constant(bias, t)
            eps = ppm * 1.0e-6
            sf_num = mc_double_integral_constant(eps * a_ref, t)
            print(f"DET {name} | {f(bias)} | {f(ppm)} | {f(a_ref)} | {f(t)} | "
                  f"{f(bias_groves)} | {f(sf_groves)} | {f(bias_num)} | {f(sf_num)}")
    print("#")

    # Holdover round-trip rows: emit the budget params + threshold; Rust verifies
    # drift(holdover_seconds(thr)) == thr. The CAI is the Tlong config.
    print("# HOLD name | bias_m_s2 | scale_factor_ppm | ref_accel_m_s2 | threshold_m | cai=Tlong")
    for (name, bias, ppm, a_ref, thr) in HOLDOVER_CASES:
        print(f"HOLD {name} | {f(bias)} | {f(ppm)} | {f(a_ref)} | {f(thr)}")


if __name__ == "__main__":
    main()
