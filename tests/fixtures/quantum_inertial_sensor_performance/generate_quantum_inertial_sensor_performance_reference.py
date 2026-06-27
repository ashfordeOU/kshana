#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""External-oracle reference vectors for the cold-atom-interferometer (CAI)
accelerometer physics in src/inertial/quantum_imu.rs.

Three independent quantities are pinned, each against a DIFFERENT kind of oracle:

  HW  (accel->phase transfer function |H(w)|, units s^2)
      ----------------------------------------------------------------------
      ORACLE: a NUMERIC TIME-DOMAIN INTEGRAL of the interferometer SENSITIVITY
      FUNCTION g(t) as defined by Cheinet et al., "Measurement of the Sensitivity
      Function in a Time-Domain Atomic Interferometer", IEEE Trans. Instrum. Meas.
      57(6), 1141-1148 (2008). For an ideal three-pulse (pi/2 - pi - pi/2)
      Mach-Zehnder interferometer with the central pi pulse at the time origin and
      pulse separation T, the sensitivity function is the ANTISYMMETRIC STEP

          g(t) = -1   for -T < t < 0
          g(t) = +1   for  0 < t < T

      (Cheinet Fig. 2 / Eq. for the ideal pulse limit). The acceleration->phase
      response is  Phi = k_eff * INT g(t) v(t) dt  with v(t) = INT a(t').  For a
      unit-amplitude probe acceleration a(t) = cos(w t) (so v(t) = sin(w t)/w) the
      transfer-function magnitude is

          |H(w)| = | INT_{-T}^{+T} g(t) * sin(w t)/w dt |.

      This integral is evaluated NUMERICALLY here (scipy.integrate.quad). kshana
      instead evaluates the ANALYTIC closed form |H(w)| = (4/w^2) sin^2(wT/2) that
      Cheinet derives as the Fourier transform of g(t). The two are computed by
      genuinely different paths (numeric integral of g(t) vs analytic FT result),
      so their agreement is an independent check that kshana's closed form is the
      correct evaluation of Cheinet's interferometer response -- NOT a numeric
      integral of kshana's own analytic form. (As a sanity probe the generator
      also prints the off-centre / wrong-convention integrals it does NOT use; an
      author who got the sensitivity-function convention wrong would mismatch.)

  KEFF (effective two-photon Raman wavevector k_eff = 4 pi / lambda, rad/m)
      ----------------------------------------------------------------------
      ORACLE: published spectroscopic line wavelengths (definitional / textbook
      constant). Rb-87 D2 = 780.241209 nm (Steck, "Rubidium 87 D Line Data",
      v2.3.2, 2024); Cs D2 = 852.34727582 nm (Steck, "Cesium D Line Data").
      k_eff = 4 pi / lambda computed independently here in float64.

  COR  (Coriolis equivalent acceleration bias 2 v Omega, m/s^2)
      ----------------------------------------------------------------------
      ORACLE: the classical Coriolis acceleration |2 Omega x v| = 2 v_perp Omega
      (textbook; e.g. Lan et al., PRL 108, 090402 (2012); Groves, Principles of
      GNSS/INS, 2nd ed., 2013). Earth sidereal rotation Omega_E = 7.292115e-5
      rad/s (IERS). Computed independently here.

  SHOT (per-shot acceleration sensitivity sigma_a + ASD n_a, m/s^2[/sqrt(Hz)])
      ----------------------------------------------------------------------
      ORACLE: PUBLISHED ACHIEVED DEVICE PERFORMANCE, used as a ONE-SIDED bound.
      A real CAI carries technical/vibration noise ABOVE the quantum-projection
      (shot-noise) floor kshana models, so the honest assertion is
          kshana_ideal_floor  <=  published_achieved   (one-sided)
      AND both are the SAME ORDER of magnitude. Transcribed published values:
        * Peters, Chung & Chu, "High-precision gravity measurements using atom
          interferometry", Metrologia 38, 25-61 (2001): Cs gravimeter, achieved
          dg/g ~ 3e-9 per ~1.3 s drop -> ~3e-8 m/s^2 single-shot; sensitivity
          ~2e-8 g/sqrt(Hz) ~ 2e-7 m/s^2/sqrt(Hz).
        * Freier et al., "Mobile quantum gravity sensor with unprecedented
          stability", J. Phys. Conf. Ser. 723, 012050 (2016) (arXiv:1512.05660):
          short-term noise 96 nm/s^2/sqrt(Hz) = 9.6e-8 m/s^2/sqrt(Hz).
      For each device the generator emits the kshana-side CONFIG (lambda, T, N, C,
      cycle time) that brackets the device, and the published achieved number; the
      Rust test asserts the kshana ideal floor is <= published and same order.

The .txt this prints is COMMITTED and read by tests/quantum_inertial_sensor_reference.rs;
the Rust test has no Python/runtime-oracle dependency.

Reproduce (no kshana code involved):
    /tmp/kshana-oracles/.venv/bin/python \
        generate_quantum_inertial_sensor_performance_reference.py \
        > quantum_inertial_sensor_performance_reference.txt

Generated with numpy + scipy (scipy.integrate.quad).
"""

import numpy as np
from scipy.integrate import quad

# ---- published spectroscopic line data (oracle constants) ------------------
RB87_D2_NM = 780.241209          # Steck, Rb-87 D Line Data
CS_D2_NM = 852.34727582          # Steck, Cs D Line Data
OMEGA_EARTH = 7.292115e-5        # rad/s, IERS sidereal rate


def k_eff(lambda_m):
    return 4.0 * np.pi / lambda_m


def H_sensitivity_integral(w, T):
    """|H(w)| from a NUMERIC integral of Cheinet's centred antisymmetric
    sensitivity function g(t) against the velocity response of a(t)=cos(wt).
    Independent of kshana's analytic closed form."""
    if w == 0.0:
        # a=1 => v(t)=t ; INT g(t) t dt over [-T,T], g=-1 on [-T,0], +1 on [0,T]
        i1, _ = quad(lambda t: -1.0 * t, -T, 0.0)
        i2, _ = quad(lambda t: +1.0 * t, 0.0, T)
        return abs(i1 + i2)

    def g(t):
        return -1.0 if t < 0.0 else 1.0

    integ, _ = quad(lambda t: g(t) * np.sin(w * t) / w, -T, T, limit=400)
    return abs(integ)


def main():
    print("# CAI accelerometer external-oracle reference for src/inertial/quantum_imu.rs")
    print("# Consumed by tests/quantum_inertial_sensor_reference.rs. See the generator header.")
    print("#")
    print("# HW   T(s) | w(rad/s) | |H(w)|(s^2)   "
          "-- numeric integral of Cheinet-2008 sensitivity fn g(t) vs kshana closed form")
    print("# KEFF species lambda(m) | k_eff(rad/m)   "
          "-- 4*pi/lambda from Steck line data")
    print("# COR  name v(m/s) Omega(rad/s) | 2vOmega(m/s^2)   "
          "-- classical Coriolis bias")
    print("# SHOT device | lambda(m) T(s) N C Tc(s) | published_per_shot(m/s^2) "
          "published_asd(m/s^2/sqrtHz)   -- one-sided floor<=published, same order")

    # ---- HW: transfer function on a frequency grid for three T values --------
    for T in (0.01, 0.05, 0.10, 0.26):
        ws = [1.0e-3, 5.0, 10.0, 37.0, 100.0, 250.0, 1000.0,
              np.pi / T, 2.0 * np.pi / T]
        for w in ws:
            h = H_sensitivity_integral(w, T)
            print(f"HW {T!r} | {w!r} | {h!r}")

    # ---- KEFF: definitional wavevectors -------------------------------------
    for species, nm in (("Rb87_D2", RB87_D2_NM), ("Cs_D2", CS_D2_NM)):
        lam = nm * 1.0e-9
        print(f"KEFF {species} {lam!r} | {k_eff(lam)!r}")

    # ---- COR: classical Coriolis bias ---------------------------------------
    cor_cases = [
        ("unit_test_vec", 3.0, 1.0e-3),
        ("double_v", 6.0, 1.0e-3),
        ("earth_slow", 0.1, OMEGA_EARTH),
        ("earth_fast", 100.0, OMEGA_EARTH),
        ("aircraft", 250.0, OMEGA_EARTH),
    ]
    for name, v, om in cor_cases:
        print(f"COR {name} {v!r} {om!r} | {2.0 * v * om!r}")

    # ---- SHOT: published device floors (one-sided) --------------------------
    # device | lambda T N C Tc | published_per_shot published_asd
    #   Peters2001: Cs gravimeter, T~0.16 s drop arm, N~1e6, C~0.4, cycle ~1.3 s.
    #   Freier2016: Rb87 GAIN, 2T~0.52 s so T~0.26 s, N~1e6, C~0.6, cycle ~1 s.
    shot_cases = [
        ("Peters2001_Cs_gravimeter",
         CS_D2_NM * 1e-9, 0.16, 1.0e6, 0.4, 1.3,
         3.0e-8,    # ~3e-9 dg/g * 9.8 m/s^2 per shot
         2.0e-7),   # ~2e-8 g/sqrtHz * 9.8
        ("Freier2016_Rb87_GAIN",
         RB87_D2_NM * 1e-9, 0.26, 1.0e6, 0.6, 1.0,
         np.nan,    # per-shot not separately transcribed; ASD is the headline
         9.6e-8),   # 96 nm/s^2/sqrtHz short-term noise
    ]
    for (name, lam, T, N, C, Tc, per_shot, asd) in shot_cases:
        print(f"SHOT {name} | {lam!r} {T!r} {N!r} {C!r} {Tc!r} | {per_shot!r} {asd!r}")


if __name__ == "__main__":
    main()
