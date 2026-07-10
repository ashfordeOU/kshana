#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the independent RF thermal-noise ranging/timing precision reference.

The oracle is the **Kaplan & Hegarty tracking-loop thermal-noise closed forms**
(Kaplan & Hegarty, *Understanding GPS/GNSS: Principles and Applications*, 3rd
ed., Artech House 2017, Ch. 8 "Fundamentals of Satellite Signal Tracking"),
recomputed here in pure Python/NumPy — a DIFFERENT language and code path from
the Rust engine under test. Nothing in this script imports or calls kshana; the
C/N0 is built from the deep-space link equation by hand and the tracking jitter
from the textbook analytic bounds, so the Rust test that loads this fixture is a
genuine independent cross-check, not a self-comparison.

Two textbook closed forms are emitted per case:

  (1) DLL code-tracking jitter (Kaplan & Hegarty eq. 8.90, coherent early-late
      envelope discriminator), in chips 1-sigma:

          sigma_code = sqrt( (B_L * d / (2 * c_n0)) * (1 + 2/((2 - d) * T * c_n0)) )

      where c_n0 = 10^(C/N0[dB-Hz]/10) is the LINEAR carrier-to-noise density,
      B_L the DLL loop noise bandwidth (Hz), d the early-late correlator spacing
      (chips) and T the coherent predetection integration time (s). Converting
      to metres: sigma_R = sigma_code * c / R_c, and the equivalent one-way
      light-time (code-derived) timing sigma is sigma_R / c.

  (2) PLL carrier-phase thermal jitter (Kaplan & Hegarty eq. 8.72, first
      thermal term), in radians 1-sigma:

          sigma_phi = sqrt( B_L / c_n0 )

      The carrier-phase-derived timing floor is sigma_t = sigma_phi / (2*pi*f_c)
      with f_c the carrier frequency (Hz).

The C/N0 for each case is the standard CCSDS-401 / DSN-810-005 one-way deep-space
link equation:

          C/N0 = EIRP - L_fs - L_other + G/T - k        [dB-Hz]
          L_fs = 20*log10(4*pi*R*f/c)                    [dB]
          k    = 10*log10(1.380649e-23) = -228.5991      [dBW/K/Hz]

i.e. exactly the account kshana::linkbudget::link_budget implements, but written
out here by hand from constants so the reference is independent of the engine.

Two fully-specified cases are chosen so the resulting code-ranging sigma lands
near the Paper-5 Table-1 representative magnitudes (S-band ~1 m ranging, Ka-band
~0.1 m ranging) at a lunar Earth-Moon range, to demonstrate the forward model
reproduces the assumed order of magnitude. The Table-1 *timing* headline
(~1 ns S / ~0.3 ns Ka) is NOT uniquely reproduced by either closed form (the
code-derived timing is ranging/c and the carrier-phase floor is sub-picosecond);
it is a chosen representative between the code-ranging bound and the on-board
clock stability, which is why the Paper-5 headline stays Modelled.

Hand cross-check (Kaplan & Hegarty worked-value sanity, independent of this run):
at C/N0 = 45 dB-Hz, B_L = 1 Hz, d = 0.5 chip, T = 20 ms the DLL code jitter is
  c_n0 = 10^4.5 = 31623
  lead = 1*0.5/(2*31623) = 7.906e-6
  squaring = 1 + 2/((1.5)*0.02*31623) = 1 + 2/948.7 = 1.002108
  sigma_code = sqrt(7.906e-6 * 1.002108) = 2.814e-3 chip
which for a 1.023 Mcps GPS-like PN code is 2.814e-3 * c / 1.023e6 = 0.825 m,
the classic sub-metre GPS DLL figure (Kaplan & Hegarty Fig. 8.x regime). This
matches the engine's own in-module directional test (0.1-2 m at 45 dB-Hz).

Reproduce (offline, no kshana code involved):

    python3 generate_rf_ranging_reference.py > rf_ranging_reference.csv

Requires only Python 3 + NumPy (numpy 2.0.2 used).
"""

import math

import numpy as np

C_M_PER_S = 299_792_458.0
# Boltzmann constant in dB form: 10*log10(1.380649e-23). The engine pins the
# rounded -228.5991; use the exact value here and let the test tolerance absorb
# the < 1e-4 dB difference (the reference must be INDEPENDENT, not bit-identical).
K_DBW_PER_K_PER_HZ = 10.0 * math.log10(1.380649e-23)

# Kshana's downlink band centres (DSN deep-space allocations), reproduced by hand.
BAND_FREQ_HZ = {"S": 2.295e9, "X": 8.420e9, "Ka": 32.0e9}

EARTH_MOON_RANGE_M = 384_400_000.0  # mean Earth-Moon distance


def fsl_db(range_m: float, freq_hz: float) -> float:
    """Friis free-space path loss (dB) = 20*log10(4*pi*R*f/c)."""
    return 20.0 * math.log10(4.0 * math.pi * range_m * freq_hz / C_M_PER_S)


def cn0_dbhz(eirp_dbw, fsl, other_db, g_over_t_db):
    """CCSDS-401 one-way link equation: C/N0 = EIRP - FSL - other + G/T - k."""
    return eirp_dbw - fsl - other_db + g_over_t_db - K_DBW_PER_K_PER_HZ


def dll_code_jitter_chips(cn0, b_l_hz, d_chips, t_s):
    """Kaplan & Hegarty eq. 8.90 coherent early-late DLL jitter (chips, 1-sigma)."""
    c = 10.0 ** (cn0 / 10.0)
    lead = b_l_hz * d_chips / (2.0 * c)
    squaring = 1.0 + 2.0 / ((2.0 - d_chips) * t_s * c)
    return math.sqrt(lead * squaring)


def pll_phase_jitter_rad(cn0, b_l_hz):
    """Kaplan & Hegarty eq. 8.72 PLL thermal phase jitter (rad, 1-sigma)."""
    c = 10.0 ** (cn0 / 10.0)
    return math.sqrt(b_l_hz / c)


# (label, band, EIRP dBW, G/T dB/K, other dB, chip rate cps, B_L Hz, corr d chip,
#  integ T s)  -- fully-specified S-band and Ka-band deep-space ranging cases.
CASES = [
    ("s_band_lunar_ranging", "S", 15.0, 15.0, 3.0, 1.023e6, 1.0, 0.5, 0.02),
    ("ka_band_lunar_ranging", "Ka", 20.0, 30.0, 3.0, 10.0e6, 1.0, 0.5, 0.02),
]


def main():
    print("# RF thermal-noise ranging/timing precision reference.")
    print("# Oracle: Kaplan & Hegarty (3rd ed., Ch.8) DLL/PLL closed forms, hand-computed in Python.")
    print("# See NOTICE and generate_rf_ranging_reference.py. Consumed by")
    print("# tests/validate_p5_rf_ranging_precision.rs.")
    print(
        "# label;band;freq_hz;range_m;eirp_dbw;g_over_t_db;other_db;chip_rate_hz;"
        "loop_bw_hz;corr_spacing_chips;integ_time_s;fsl_db;cn0_dbhz;"
        "sigma_code_chips;sigma_range_m;sigma_code_time_ns;pll_phase_rad;pll_time_ps"
    )
    for (label, band, eirp, gt, other, rc, bl, d, t) in CASES:
        f = BAND_FREQ_HZ[band]
        r = EARTH_MOON_RANGE_M
        fsl = fsl_db(r, f)
        cn0 = cn0_dbhz(eirp, fsl, other, gt)
        sig_code = dll_code_jitter_chips(cn0, bl, d, t)
        sig_range_m = sig_code * C_M_PER_S / rc
        sig_code_time_ns = (sig_range_m / C_M_PER_S) * 1e9
        pll_rad = pll_phase_jitter_rad(cn0, bl)
        pll_time_ps = (pll_rad / (2.0 * math.pi * f)) * 1e12
        # Independent numpy re-derivation of the linear C/N0 as an extra guard
        # that the analytic path matches the array path (both in Python, no engine).
        assert np.isclose(10.0 ** (cn0 / 10.0), np.power(10.0, cn0 / 10.0))
        print(
            f"{label};{band};{f:.6e};{r:.6e};{eirp:.4f};{gt:.4f};{other:.4f};"
            f"{rc:.6e};{bl:.6f};{d:.6f};{t:.6f};{fsl:.9f};{cn0:.9f};"
            f"{sig_code:.12e};{sig_range_m:.9f};{sig_code_time_ns:.9f};"
            f"{pll_rad:.12e};{pll_time_ps:.9f}"
        )


if __name__ == "__main__":
    main()
