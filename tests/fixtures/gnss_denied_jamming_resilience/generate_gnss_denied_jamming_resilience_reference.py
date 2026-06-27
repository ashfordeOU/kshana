#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for GNSS-denied jamming resilience.

Validates kshana's anti-jam / link-budget chain in `kshana::jamming` and the
PSD-derived spectral-separation coefficient `Q` in `kshana::navsignal`, and pins a
real-data characterisation of the JammerTest 2024 measured C/N0 fall under jamming.

Three independent oracle parts, all produced WITHOUT importing any kshana code:

PART (a) -- link-budget re-derivation (numpy/math), pinned to Kaplan & Hegarty
  *Understanding GPS/GNSS* (3rd ed., 2017), Sec. 9.4, the standard anti-jam chain:
    * free-space path loss  L_fs = 20log10(d) + 20log10(f) + 20log10(4*pi/c)  [dB]
    * jammer-to-signal ratio at the antenna output
        J/S = (Pj + Gj + Grj - L_fs) - (Ps + Grs)                            [dB]
    * effective carrier-to-noise density under interference (Kaplan & Hegarty
      Eq. 9.x, the despreading anti-jam equation)
        (C/N0)_eff = [ 1/(C/N0) + (J/S)/(Q*Rc) ]^-1                          [dB-Hz]
  These are the SAME closed-form equations kshana implements, so this part is an
  INDEPENDENT RE-DERIVATION in a different language/stack (math/numpy vs Rust),
  NOT a measurement-independent oracle: it confirms kshana's link-equation
  assembly is arithmetically correct and matches the textbook worked numbers
  (the 1 km / 100 km Kaplan & Hegarty anchors: J/S = 72.105 dB and 32.105 dB,
  effective C/N0 = -12.0 and 27.9 dB-Hz). Honestly InternalConsistency.

PART (b) -- PSD-derived spectral-separation coefficient Q (scipy.integrate vs a
  published closed form). The rigorous interference term is (J/S)*kappa with
  kappa = integral G_s(f) G_i(f) df (Betz 2001; Kaplan & Hegarty Sec. 8/9). For a
  BPSK-R(1) signal against a MATCHED BPSK interferer (the broadband-noise
  reference whose spectrum equals the signal's), the self-SSC has the published
  closed form  kappa = integral G^2 df = 2/(3*Rc)  (Betz; Spilker), giving the
  equivalent  Q = 1/(Rc*kappa) = 3/2 = 1.5  exactly. This part computes kappa by
  numerical quadrature (scipy.integrate.quad) of the analytic BPSK PSD
  Tc*sinc^2(pi f Tc) and reports both kappa and Q for the Rust test to confront
  kshana's `spectral_separation_coeff` + `q_from_ssc` against, plus the published
  2/(3*Rc) / Q=1.5 closed form.

PART (c) -- JammerTest 2024 measured per-SV C/N0 (REAL field data). JammerTest
  2024 (Andreas Krovik et al., NMA/Norwegian campaign; Zenodo
  10.5281/zenodo.15910563, GPL-3.0). Scenario 1.6.4 is a STATIONARY rover with a
  power-RAMPING broadband jammer ("Jammer F8.1 Porcus Major", 0.2 uW -> 50 W in
  2 dB increments on L1/G1/L2/L5). The scenario's attack_log marks the jamming
  window (16:25:00-16:39:00 "Z", which the campaign tags local CEST = UTC+2, so it
  is 14:25:00-14:39:00 in the rinex receiver time-of-day, validated against the
  C/N0 onset). This part bins the measured GPS-L1 C/N0 (rinex `snr_L1`, GPS
  satellites, valid 10..64 dB-Hz) into 30 s windows and emits the per-bin median
  C/N0 and the count of distinct GPS SVs tracked, so the Rust test can assert the
  ORDINAL real-data facts: a healthy clean baseline (~43 dB-Hz), a strictly
  monotone fall as the jammer ramps up, a trough that crosses the C/A tracking
  threshold (25 dB-Hz) while the SV count collapses, and a symmetric recovery as
  the ramp comes back down. This is a genuine measurement, not a re-derivation.

Reproduce (offline, no kshana code involved):

    /tmp/kshana-oracles/.venv/bin/python \
        generate_gnss_denied_jamming_resilience_reference.py \
        > gnss_denied_jamming_resilience_reference.txt

Generated with python math + numpy + scipy.integrate, and the JammerTest 2024
rinex.csv from the kshana realdata-cache (Zenodo 10.5281/zenodo.15910563).
"""

import csv
import math
import os
import statistics
from collections import defaultdict

from scipy import integrate

# ---- physical constants (SI / IS-GPS-200), identical to kshana::jamming ----
C_M_PER_S = 299_792_458.0
L1_HZ = 1_575_420_000.0
CA_CHIP_RATE_HZ = 1_023_000.0
BOLTZMANN_J_PER_K = 1.380_649e-23
DEFAULT_SIGNAL_POWER_DBW = -158.5  # IS-GPS-200 min received L1 C/A power
DEFAULT_TEMP_K = 290.0

# ---------------------------------------------------------------------------
# PART (a): independent link-budget re-derivation (math/numpy)
# ---------------------------------------------------------------------------


def fspl_db(d_m, f_hz):
    d = max(d_m, 1e-3)
    return 20.0 * math.log10(d) + 20.0 * math.log10(f_hz) + 20.0 * math.log10(
        4.0 * math.pi / C_M_PER_S
    )


def noise_density_dbw_per_hz(temp_k):
    return 10.0 * math.log10(BOLTZMANN_J_PER_K * temp_k)


def nominal_cn0_dbhz(sig_dbw, ant_gain_db, temp_k):
    return sig_dbw + ant_gain_db - noise_density_dbw_per_hz(temp_k)


def j_over_s_db(pj_dbw, gj_dbi, grj_db, d_m, f_hz, sig_dbw, grs_db):
    jammer_rx = pj_dbw + gj_dbi + grj_db - fspl_db(d_m, f_hz)
    signal_rx = sig_dbw + grs_db
    return jammer_rx - signal_rx


def effective_cn0_dbhz(cn0_nom_dbhz, js_db, q, chip_rate_hz):
    cn0_lin = 10.0 ** (cn0_nom_dbhz / 10.0)
    js_lin = 10.0 ** (js_db / 10.0)
    denom = 1.0 / cn0_lin + js_lin / (max(q, 1e-9) * chip_rate_hz)
    return -10.0 * math.log10(denom)


# (name, Pj_dbw, Gj_dbi, Grj_db, d_m, f_hz, Ps_dbw, Grs_db, Q, Rc, temp_k)
# A sweep over jammer power, range, antenna gains, Q (broadband vs CW), chip rate
# (C/A vs P(Y)), and temperature. The first two rows are the Kaplan & Hegarty Sec.
# 9.4 worked anchors (1 km / 100 km, 10 W, broadband).
LINK_CASES = [
    ("kh_1km_10W_broadband", 10.0, 0.0, 0.0, 1_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("kh_100km_10W_broadband", 10.0, 0.0, 0.0, 100_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("near_1W_500m", 0.0, 0.0, 0.0, 500.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("mid_10W_5km", 10.0, 0.0, 0.0, 5_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("far_100W_50km", 20.0, 0.0, 0.0, 50_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("directional_jammer_10dBi_2km", 10.0, 10.0, 0.0, 2_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("low_el_sat_-4dB_1km", 10.0, 0.0, -4.0, 1_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, -4.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("cw_jammer_Q1p5_2km", 10.0, 0.0, 0.0, 2_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.5, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("py_code_10x_chiprate_1km", 10.0, 0.0, 0.0, 1_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, 10.0 * CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("cold_rx_200K_10W_5km", 10.0, 0.0, 0.0, 5_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, 200.0),
    ("warm_rx_400K_10W_5km", 10.0, 0.0, 0.0, 5_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, 400.0),
    ("strong_jammer_30dBW_10km", 30.0, 0.0, 0.0, 10_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("weak_jammer_-10dBW_1km", -10.0, 0.0, 0.0, 1_000.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
    ("very_near_50m_10W", 10.0, 0.0, 0.0, 50.0, L1_HZ, DEFAULT_SIGNAL_POWER_DBW, 0.0, 1.0, CA_CHIP_RATE_HZ, DEFAULT_TEMP_K),
]


def emit_link_cases():
    print("# PART (a): independent link-budget re-derivation (python math/numpy).")
    print("# Pinned to Kaplan & Hegarty, Understanding GPS/GNSS 3rd ed. Sec. 9.4.")
    print("# Consumed by tests/gnss_denied_jamming_resilience_reference.rs.")
    print(
        "# LINK name | Pj_dbw | Gj_dbi | Grj_db | d_m | f_hz | Ps_dbw | Grs_db | "
        "Q | Rc_hz | temp_k | fspl_db | js_db | cn0_nom_dbhz | cn0_eff_dbhz"
    )
    for (name, pj, gj, grj, d, f, ps, grs, q, rc, tk) in LINK_CASES:
        fspl = fspl_db(d, f)
        js = j_over_s_db(pj, gj, grj, d, f, ps, grs)
        cn0_nom = nominal_cn0_dbhz(ps, grs, tk)
        cn0_eff = effective_cn0_dbhz(cn0_nom, js, q, rc)
        print(
            f"LINK {name} | {pj!r} | {gj!r} | {grj!r} | {d!r} | {f!r} | {ps!r} | "
            f"{grs!r} | {q!r} | {rc!r} | {tk!r} | {fspl!r} | {js!r} | "
            f"{cn0_nom!r} | {cn0_eff!r}"
        )


# ---------------------------------------------------------------------------
# PART (b): PSD-derived Q vs the published closed form kappa = 2/(3 Rc)
# ---------------------------------------------------------------------------


def bpsk_psd(f_hz, n=1.0):
    """Unit-area baseband BPSK-R(n) PSD: Tc*sinc^2(pi f Tc) (Betz 2001)."""
    tc = 1.0 / (n * CA_CHIP_RATE_HZ)
    x = math.pi * f_hz * tc
    s = 1.0 if abs(x) < 1e-12 else math.sin(x) / x
    return tc * s * s


def emit_q_anchor():
    rc = CA_CHIP_RATE_HZ
    band = 24.0 * rc  # wide integration band, matches kshana's spectral_separation_coeff usage
    half = band / 2.0
    # kappa = integral G^2 df, by scipy.integrate.quad over the wide band.
    kappa, _ = integrate.quad(lambda f: bpsk_psd(f) ** 2, -half, half, limit=2000)
    closed = 2.0 / (3.0 * rc)
    q = 1.0 / (rc * kappa)
    q_closed = 1.0 / (rc * closed)  # == 1.5 exactly
    print("#")
    print("# PART (b): PSD-derived spectral-separation coefficient Q.")
    print("# kappa = integral G_BPSK(f)^2 df by scipy.integrate.quad of the analytic")
    print("# BPSK-R(1) PSD, vs the published closed form 2/(3*Rc) (Betz 2001).")
    print("# Q = 1/(Rc*kappa); the matched-BPSK reference gives Q = 3/2 = 1.5 exactly.")
    print("# QANCHOR rc_hz | band_hz | kappa_quad | kappa_closed_2_over_3Rc | q_quad | q_closed")
    print(
        f"QANCHOR {rc!r} | {band!r} | {kappa!r} | {closed!r} | {q!r} | {q_closed!r}"
    )


# ---------------------------------------------------------------------------
# PART (c): JammerTest 2024 measured C/N0 (real field data)
# ---------------------------------------------------------------------------

JAMMERTEST_RINEX = (
    "realdata-cache/jammertest2024/Jamming/stationary/Very High Power (≥10W)/"
    "Bands_L1_L2_L5/1.6.4/rinex.csv"
)
# attack_log 16:25:00-16:39:00 "Z" minus the campaign's CEST(+2h) tag -> receiver
# time-of-day window 14:25:00-14:39:00 (validated against the C/N0 onset).
ATTACK_START_SOD = 14 * 3600 + 25 * 60  # 51900
ATTACK_END_SOD = 14 * 3600 + 39 * 60  # 52740
MIN_CN0, MAX_CN0 = 10.0, 64.0  # valid dB-Hz band; rejects column-shift artefacts
BIN_S = 30


def sod(ts):
    t = ts.split(" ")[1]
    h, m, s = t.split(":")
    return int(h) * 3600 + int(m) * 60 + int(float(s))


def emit_jammertest():
    here = os.path.dirname(os.path.abspath(__file__))
    # walk up to the kshana crate root to find realdata-cache.
    root = here
    for _ in range(8):
        cand = os.path.join(root, JAMMERTEST_RINEX)
        if os.path.exists(cand):
            break
        root = os.path.dirname(root)
    path = os.path.join(root, JAMMERTEST_RINEX)

    bins_cn0 = defaultdict(list)
    bins_sats = defaultdict(set)
    with open(path, newline="") as fh:
        for row in csv.DictReader(fh):
            try:
                v = float(row["snr_L1"])
            except (ValueError, KeyError, TypeError):
                continue
            if not (MIN_CN0 <= v <= MAX_CN0):
                continue
            satid = row["satellite"].strip()
            if not satid.startswith("G"):  # GPS L1 C/A only
                continue
            b = (sod(row["time"]) // BIN_S) * BIN_S
            bins_cn0[b].append(v)
            bins_sats[b].add(satid)

    print("#")
    print("# PART (c): JammerTest 2024 measured GPS-L1 C/N0 (REAL field data).")
    print("# Dataset: JammerTest 2024, Zenodo 10.5281/zenodo.15910563 (GPL-3.0).")
    print("# Scenario 1.6.4: stationary rover, power-ramping broadband jammer")
    print("#   (Jammer F8.1 'Porcus Major', 0.2 uW -> 50 W, 2 dB increments).")
    print(f"# Attack window (receiver time-of-day, s): {ATTACK_START_SOD}..{ATTACK_END_SOD}.")
    print(f"# Per-{BIN_S}s-bin median C/N0 (dB-Hz) and distinct-GPS-SV count.")
    print("# JTBIN sod | median_cn0_dbhz | n_obs | n_sv | attack(0/1)")
    for b in sorted(bins_cn0):
        med = statistics.median(bins_cn0[b])
        n = len(bins_cn0[b])
        nsv = len(bins_sats[b])
        atk = 1 if (ATTACK_START_SOD <= b <= ATTACK_END_SOD) else 0
        print(f"JTBIN {b} | {med!r} | {n} | {nsv} | {atk}")


# ---------------------------------------------------------------------------

if __name__ == "__main__":
    print("# GNSS-denied jamming resilience external-oracle reference.")
    print("# Oracles: python math/numpy (link budget) + scipy.integrate (Q) +")
    print("#          JammerTest 2024 (Zenodo 10.5281/zenodo.15910563) measured C/N0.")
    print("# See generate_gnss_denied_jamming_resilience_reference.py for provenance.")
    emit_link_cases()
    emit_q_anchor()
    emit_jammertest()
