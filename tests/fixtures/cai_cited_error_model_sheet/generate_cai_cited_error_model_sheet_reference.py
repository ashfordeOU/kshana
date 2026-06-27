#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external reference sheet for the CAI cited error-model parameter
capability (kshana `inertial::cai_params` / `inertial::quantum_imu`).

ORACLE TYPE: published single-instrument vectors (transcribed primary-source
numbers) + an INDEPENDENT closed-form geometry check. There is no third-party
software library that "computes a cold-atom accelerometer"; the external authority
here is the *published per-instrument sensitivity* of three named, real
instruments, plus the textbook interferometer geometry. Two distinct claims are
externally anchored:

  (A) EXACT GEOMETRY  -- the phase->acceleration scale factor k_eff*T^2 and the
      single-fringe (2*pi) ambiguity-limited acceleration 2*pi/(k_eff*T^2). These
      are pure Mach-Zehnder geometry with k_eff = 4*pi/lambda (Kasevich & Chu,
      PRL 67, 181 (1991); Peters, Chung & Chu, Metrologia 38, 25 (2001)). The
      oracle value emitted here is computed from the INDEPENDENT algebraic
      identity
          2*pi / (k_eff * T^2) = 2*pi / ((4*pi/lambda) * T^2) = lambda / (2*T^2),
      a different reduction than kshana's two-step path (kshana forms 4*pi/lambda,
      then 2*pi/scale). The Rust test asserts kshana reproduces this to <1e-9 rel.

  (B) ONE-SIDED SHOT-NOISE FLOOR  -- the shot-noise- (standard-quantum-) limited
      acceleration ASD
          n_a = sigma_phi/(k_eff*T^2) * sqrt(T_c),   sigma_phi = 1/(C*sqrt(N)),
      evaluated for each instrument's published config (lambda, T, N, C, T_c),
      compared one-sided against that instrument's PUBLISHED achieved short-term
      sensitivity. A real device is technical-/vibration-noise-limited and so sits
      ABOVE its quantum-projection-noise floor: the honest, physically-correct
      relation is  kshana_SQL_floor  <=  published_achieved, and within ~2 orders
      (same physical sensor, not at the SQL). This is a BRACKET/one-sided check,
      not a parity match -- it is why the capability stays MODELLED.

NAMED INSTRUMENTS (primary sources, transcribed verbatim below):

  1. Freier 2016 "GAIN" mobile quantum gravity sensor.
     C. Freier, M. Hauth, V. Schkolnik, B. Leykauf, M. Schilling, H. Wziontek,
     H.-G. Scherneck, J. Mueller, A. Peters, "Mobile quantum gravity sensor with
     unprecedented stability", J. Phys.: Conf. Ser. 723, 012050 (2016);
     arXiv:1512.05660. Rb-87. Short-term noise 96 nm/s^2/sqrt(Hz). Representative
     interrogation 2T ~ 0.52 s (T ~ 0.26 s), N ~ 1e6, C ~ 0.6, cycle ~ 1 s.

  2. Exail (formerly Muquans) AQG-B Absolute Quantum Gravimeter.
     V. Menoret, P. Vermeulen, N. Le Moigne, S. Bonvalot, P. Bouyer, A. Landragin,
     B. Desruelle, "Gravity measurements below 1e-9 g with a transportable
     absolute quantum gravimeter", Sci. Rep. 8, 12300 (2018); arXiv:1809.04908.
     Rb-87, pi/2-pi-pi/2 with tau=10 us, T = 60 ms, contrast C = 40%, 2 Hz
     repetition rate (cycle 0.5 s), sensitivity 500 nm/s^2/sqrt(Hz) at a quiet
     site (= 5e-7 m/s^2/sqrt(Hz)). (AQG-B10 datasheet class; the B-series is the
     bench/base instrument behind the field AQG.)

  3. CARIOQA-PMP space cold-atom accelerometer (state-of-the-art space scenario).
     A.-S. HosseiniArani, M. Schilling, Q. Beaufils, A. Knabe, B. Tennstedt,
     A. Kupriyanov, S. Schoen, F. Pereira dos Santos, J. Mueller, "Advances in
     Atom Interferometry and their Impacts on the Performance of Quantum
     Accelerometers On-board Future Satellite Gravity Missions", arXiv:2404.10471
     (2024), Table 1 "state-of-the-art technology in space": Rb-87, atomic flight
     time 2T = 5 s (T = 2.5 s), N = 5e5, sensitivity close to 5e-10 m/s^2/sqrt(Hz)
     with current technology; the CARIOQA-PMP target quantum-projection-noise
     floor is 1e-10 m/s^2/sqrt(Hz).

CONVENTIONS matched to kshana exactly (src/inertial/quantum_imu.rs):
  k_eff     = 4*pi/lambda                               (effective_wavevector)
  scale     = k_eff*T^2                                 (CaiAccelerometer::scale_factor)
  fringe    = 2*pi/(k_eff*T^2)                          (raw_fringe_ambiguity_accel)
  sigma_phi = 1/(C*sqrt(N))                             (projection_noise_rad)
  sigma_a   = sigma_phi/(k_eff*T^2)                     (accel_sensitivity_per_shot)
  n_a       = sigma_a*sqrt(T_c)                         (accel_asd)

HONEST SCOPE -- what this DOES anchor:
  * (A) the EXACT interferometer geometry (scale factor + fringe ambiguity) for
    three real published instrument configs, to <1e-9 rel, against an independent
    algebraic identity.
  * (B) that kshana's modelled shot-noise floor lies BELOW, and within ~2 orders
    of, each instrument's PUBLISHED achieved sensitivity (one-sided bracket).
What this does NOT do:
  * It does NOT claim parity with any device's achieved sensitivity (published
    devices are technical-/vibration-limited well above the SQL; ratios here are
    ~8x-60x). The capability is therefore MODELLED, not Validated.
  * It does NOT model vibration/wavefront/fringe-ambiguity systematics of the real
    instruments, nor claim flight heritage. The published numbers are transcribed
    primary-source anchors, not a re-derivation of those instruments.

Reproduce (offline, no kshana code involved -- pure stdlib math):

    python3 generate_cai_cited_error_model_sheet_reference.py \
        > cai_cited_error_model_sheet_reference.txt

Generated with Python stdlib `math` (independent of kshana and of any oracle
library); the per-instrument achieved sensitivities are transcribed from the
primary sources cited above.
"""

import math

PI = math.pi
RB87_D2_WAVELENGTH_M = 780.241209e-9  # matches kshana RB87_D2_WAVELENGTH_M


def k_eff(lambda_m):
    return 4.0 * PI / lambda_m


def scale_factor(lambda_m, T):
    return k_eff(lambda_m) * T * T


def fringe_ambiguity_independent(lambda_m, T):
    """INDEPENDENT closed form for 2*pi/(k_eff*T^2): lambda/(2*T^2).
    Algebraically distinct from kshana's two-step (4*pi/lambda -> 2*pi/scale)."""
    return lambda_m / (2.0 * T * T)


def shot_noise_asd(lambda_m, T, N, C, Tc):
    sigma_phi = 1.0 / (C * math.sqrt(N))
    sigma_a = sigma_phi / (k_eff(lambda_m) * T * T)
    return sigma_a * math.sqrt(Tc)


# (name, lambda_m, T_s, atom_number N, contrast C, cycle_time_s Tc,
#  published_achieved_asd [m/s^2/sqrt(Hz)], source-tag)
INSTRUMENTS = [
    (
        "Freier2016_GAIN",
        RB87_D2_WAVELENGTH_M, 0.26, 1.0e6, 0.6, 1.0,
        96.0e-9,
        "Freier+2016_JPCS723_012050_arXiv1512.05660_96nm_s2_sqrtHz",
    ),
    (
        "Exail_AQG_B",
        RB87_D2_WAVELENGTH_M, 0.060, 1.0e6, 0.40, 0.5,
        5.0e-7,
        "Menoret+2018_SciRep8_12300_arXiv1809.04908_500nm_s2_sqrtHz_T60ms_2Hz_C40pct",
    ),
    (
        "CARIOQA_space",
        RB87_D2_WAVELENGTH_M, 2.5, 5.0e5, 0.5, 5.0,
        5.0e-10,
        "HosseiniArani+2024_arXiv2404.10471_Table1_SOA_space_2T5s_N5e5_5e-10_PMPtarget_1e-10",
    ),
]


def f(x):
    return repr(float(x))


def main():
    print("# CAI cited error-model parameter sheet -- external reference.")
    print("# Oracle: published per-instrument sensitivity (3 named real instruments,")
    print("#   primary sources cited in generate_cai_cited_error_model_sheet_reference.py)")
    print("#   + independent closed-form geometry 2*pi/(k_eff*T^2) = lambda/(2*T^2).")
    print("# Consumed by tests/cai_cited_error_model_sheet_reference.rs.")
    print("# Units: m (lambda), s (T, T_c), m/s^2/sqrt(Hz) (n_a), rad/(m/s^2) (scale),")
    print("#        m/s^2 (fringe-ambiguity-limited accel).")
    print("#")
    print("# Geometry/scale identity is EXACT (<1e-9 rel target); shot-noise ASD is a")
    print("# ONE-SIDED bracket: kshana SQL floor <= published achieved, within ~2 orders")
    print("# (real devices are technical-/vibration-limited above the quantum floor).")
    print("#")
    print("# CAI name | lambda_m | T_s | N | C | Tc | scale_keffT2 | fringe_ambig_accel | "
          "sql_n_a | published_achieved_asd | source")
    for (name, lam, T, N, C, Tc, pub, src) in INSTRUMENTS:
        s = scale_factor(lam, T)
        fa = fringe_ambiguity_independent(lam, T)
        na = shot_noise_asd(lam, T, N, C, Tc)
        print(
            f"CAI {name} | {f(lam)} | {f(T)} | {f(N)} | {f(C)} | {f(Tc)} | "
            f"{f(s)} | {f(fa)} | {f(na)} | {f(pub)} | {src}"
        )


if __name__ == "__main__":
    main()
