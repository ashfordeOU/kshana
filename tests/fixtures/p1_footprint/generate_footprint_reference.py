#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external reference vectors for the P1 orbital-transmitter
capture-footprint validation (``pattern_reference.csv``, ``sweep_reference.csv``,
``geometry_reference.csv``).

Three independent oracles, all computed here WITHOUT any Kshana code — the only
things shared with the Rust module are the physical constants and the *definition*
of the geometry/radiometry; every formula is re-implemented from first principles
in numpy/scipy.

1. Aperture pattern (``pattern_reference.csv``).
   Kshana's ``antenna::pattern_gain_dbi`` uses an Abramowitz & Stegun 9.4.4/9.4.6
   *rational approximation* of the Bessel function J1. The oracle here is
   ``scipy.special.j1`` — a genuinely independent J1 implementation (Cephes, from
   SciPy). The uniform circular-aperture pattern is the textbook Airy form
      G(theta) = G0 + 10*log10( [2*J1(x)/x]^2 ),   x = (pi*D/lambda)*sin(theta),
      G0 = 10*log10( eta * (pi*D/lambda)^2 )   (dBi).
   Because scipy's J1 differs in implementation from the A&S approximation, dB-for-
   dB agreement is a real cross-check of the pattern, not a self-comparison.

2. Per-point footprint sweep (``sweep_reference.csv``).
   IMPORTANT PHYSICS: because the aperture pattern has deep nulls and sidelobes,
   J/S(gamma) is strongly NON-monotone in gamma — the captured region is the main
   lobe PLUS a handful of near-in sidelobe rings that still clear the 3 dB
   threshold, not a single contiguous cap bounded by one crossing angle. A single
   "threshold-crossing angle" therefore does not describe this footprint. Instead
   we reconstruct the ENTIRE sweep on the exact grid Kshana uses
   (gamma_i = gamma_max * i/(n-1), i = 0..n-1) and emit, per point,
   (off_boresight theta, transmit gain, J/S, captured?). Kshana's
   ``capture_footprint`` must reproduce every point. The radiometry, matching
   Kshana's call into ``jamming::j_over_s_db`` (both receiver gains 0, AFS level as
   the authentic-signal power):
      J/S(gamma) = P_tx + G(theta(gamma)) - FSPL(slant(gamma), f) - AFS_dbw
   with, for a nadir-pointing Tx at (0,0,R+h) and a surface point at central
   angle gamma on a sphere of radius R:
      slant(gamma) = sqrt( (R sin gamma)^2 + (R+h - R cos gamma)^2 )
      cos theta    = (R+h - R cos gamma) / slant(gamma)
      FSPL(d,f)    = 20 log10 d + 20 log10 f + 20 log10(4 pi / c)   (dB)
      gamma_max    = acos(R/(R+h))   (the limb).

3. Scalar invariants (``geometry_reference.csv``).
   Boresight gain G0, horizon central angle gamma_max, nadir/limb J/S, and the
   area-weighted captured fraction. The captured fraction uses the SAME discrete
   weighting Kshana uses — sum(sin gamma_i) over captured grid points divided by
   sum over all grid points — so it is the identical defined quantity, computed by
   an independent implementation on the same grid. (For context we also print a
   fine-quadrature continuous captured fraction to stderr; it is NOT emitted,
   since Kshana defines the discrete one.)

Reproduce (offline, no Kshana code involved):

    python3 generate_footprint_reference.py

Generated with numpy 2.0.2 + scipy 1.13.1 under Python 3. The pattern nulls and
sidelobe structure (hence the non-monotonicity) were cross-checked against the
Airy first null asin(1.22 lambda/D); the captured set was cross-checked by an
independent dense scan.
"""

import sys

import numpy as np
from scipy.special import j1

# --- physical constants (SHARED inputs; identical to the Rust module) ---------
C = 299_792_458.0          # jamming::C_M_PER_S
R_MOON = 1_737_400.0       # lunar::R_MOON_M

# --- representative scenario (matches the P1 numeric target) -------------------
D = 1.0                    # aperture diameter (m)
F = 2.4e9                  # carrier (Hz)
ETA = 0.60                 # aperture efficiency
H = 100_000.0              # altitude (m)
P_TX = 10.0 * np.log10(40.0)   # 40 W -> 16.0206 dBW
AFS = -140.6               # AFS received-signal level (dBW)
THRESH = 3.0               # capture threshold (dB)
N_GRID = 400               # sweep grid points (matches the Rust test)

LAMBDA = C / F
KAPERTURE = np.pi * D / LAMBDA      # pi*D/lambda
GAMMA_MAX = np.arccos(R_MOON / (R_MOON + H))   # limb central angle


def g0_dbi():
    """Boresight gain G0 = 10 log10( eta (pi D / lambda)^2 )  (dBi)."""
    return 10.0 * np.log10(ETA * KAPERTURE**2)


def pattern_gain_dbi(theta):
    """Uniform circular-aperture pattern gain (dBi) using scipy's J1."""
    theta = np.asarray(theta, float)
    x = KAPERTURE * np.sin(theta)
    xs = np.where(x == 0.0, 1.0, x)
    factor = np.where(np.abs(x) < 1e-12, 1.0, 2.0 * j1(x) / xs)
    return g0_dbi() + 10.0 * np.log10(np.maximum(factor**2, 1e-30))


def slant_m(gamma):
    """Tx(0,0,R+h) to surface point at central angle gamma (m)."""
    sx = R_MOON * np.sin(gamma)
    dz = (R_MOON + H) - R_MOON * np.cos(gamma)
    return np.hypot(sx, dz)


def off_boresight(gamma):
    """Off-nadir angle theta from the Tx to the surface point (rad)."""
    d = slant_m(gamma)
    cos_theta = np.clip(((R_MOON + H) - R_MOON * np.cos(gamma)) / d, -1.0, 1.0)
    return np.arccos(cos_theta)


def fspl_db(d_m, f_hz):
    """Free-space path loss (dB): 20log10 d + 20log10 f + 20log10(4 pi / c)."""
    d = np.maximum(d_m, 1e-3)
    return 20.0 * np.log10(d) + 20.0 * np.log10(f_hz) + 20.0 * np.log10(4.0 * np.pi / C)


def js_db(gamma):
    """J/S (dB) at the surface victim at central angle gamma."""
    theta = off_boresight(gamma)
    return P_TX + pattern_gain_dbi(theta) - fspl_db(slant_m(gamma), F) - AFS


def rust_grid():
    """The exact sweep grid Kshana uses: gamma_i = gamma_max * i/(n-1)."""
    return GAMMA_MAX * np.arange(N_GRID) / (N_GRID - 1)


def main():
    g0 = g0_dbi()
    g = rust_grid()
    theta = off_boresight(g)
    gain = pattern_gain_dbi(theta)
    slant = slant_m(g)
    js = js_db(g)
    cap = js >= THRESH

    w = np.sin(g)
    cfrac_discrete = float((w * cap).sum() / w.sum())

    nadir_js = float(js[0])
    limb_js = float(js[-1])

    # ---- pattern_reference.csv: independent scipy-J1 pattern over 0..gamma_max ----
    thetas = np.linspace(0.0, GAMMA_MAX, 241)
    gains = pattern_gain_dbi(thetas)
    with open("pattern_reference.csv", "w") as fh:
        fh.write("# P1 aperture-pattern reference. Oracle: scipy.special.j1 (Cephes),\n")
        fh.write("# independent of Kshana's A&S 9.4.4/9.4.6 J1. Uniform circular aperture:\n")
        fh.write("#   G(theta) = G0 + 10 log10([2 J1(x)/x]^2), x = (pi D/lambda) sin theta.\n")
        fh.write(f"# D={D} m  f={F} Hz  eta={ETA}  lambda={LAMBDA:.9f} m  G0={g0:.9f} dBi\n")
        fh.write("# columns: theta_rad ; pattern_gain_dbi\n")
        for t, gg in zip(thetas, gains):
            fh.write(f"{t:.12e};{gg:.12e}\n")

    # ---- sweep_reference.csv: per-point reconstruction on the exact Rust grid ----
    with open("sweep_reference.csv", "w") as fh:
        fh.write("# P1 capture-footprint per-point reference. Independent numpy/scipy\n")
        fh.write("# reconstruction on Kshana's exact grid gamma_i = gamma_max*i/(n-1).\n")
        fh.write("# J/S is NON-monotone (pattern nulls+sidelobes): captured = main lobe\n")
        fh.write("# plus near-in sidelobe rings clearing 3 dB, NOT a single cap.\n")
        fh.write(f"# n={N_GRID}  D={D} f={F} eta={ETA} h={H} P_tx={P_TX:.9f}dBW\n")
        fh.write(f"# AFS={AFS} thresh={THRESH} R_MOON={R_MOON} c={C}\n")
        fh.write("# columns: i ; central_angle_rad ; off_boresight_rad ; slant_m ; gain_dbi ; js_db ; captured(0/1)\n")
        for i in range(N_GRID):
            fh.write(
                f"{i};{g[i]:.12e};{theta[i]:.12e};{slant[i]:.12e};"
                f"{gain[i]:.12e};{js[i]:.12e};{1 if cap[i] else 0}\n"
            )

    # ---- geometry_reference.csv: scalar invariants ----
    with open("geometry_reference.csv", "w") as fh:
        fh.write("# P1 capture-footprint scalar invariants. Independent numpy/scipy.\n")
        fh.write(f"# n={N_GRID}  D={D} f={F} eta={ETA} h={H} P_tx={P_TX:.9f}dBW\n")
        fh.write(f"# AFS={AFS} thresh={THRESH} R_MOON={R_MOON} c={C}\n")
        fh.write("# captured_fraction is the DISCRETE sum(sin gamma_i | captured)/sum(sin gamma_i),\n")
        fh.write("# identical to Kshana's definition on the identical grid.\n")
        fh.write("# key ; value\n")
        fh.write(f"boresight_gain_dbi;{g0:.12e}\n")
        fh.write(f"horizon_central_angle_rad;{GAMMA_MAX:.12e}\n")
        fh.write(f"captured_fraction;{cfrac_discrete:.12e}\n")
        fh.write(f"nadir_js_db;{nadir_js:.12e}\n")
        fh.write(f"limb_js_db;{limb_js:.12e}\n")
        fh.write(f"num_captured_points;{int(cap.sum())}\n")

    # context (not emitted): continuous captured fraction
    gg = np.linspace(0.0, GAMMA_MAX, 200_001)
    capc = js_db(gg) >= THRESH
    wc = np.sin(gg)
    cfrac_cont = float(np.trapezoid(wc * capc, gg) / np.trapezoid(wc, gg))

    print("wrote pattern_reference.csv, sweep_reference.csv, geometry_reference.csv", file=sys.stderr)
    print(f"G0={g0:.6f} dBi  gamma_max={GAMMA_MAX:.9f} rad", file=sys.stderr)
    print(f"captured_fraction(discrete N={N_GRID})={cfrac_discrete:.9f} "
          f"(continuous~{cfrac_cont:.9f})  num_captured={int(cap.sum())}", file=sys.stderr)
    print(f"nadir_js={nadir_js:.3f} dB  limb_js={limb_js:.3f} dB", file=sys.stderr)


if __name__ == "__main__":
    main()
