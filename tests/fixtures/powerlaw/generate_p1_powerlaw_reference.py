#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the power-law ADEV reference values asserted in
``tests/powerlaw_oadev_reference.rs``.

Independent oracle: **allantools** (https://pypi.org/project/AllanTools/, A. Wallin,
GPL) ``allantools.Noise`` -- a self-contained third-party implementation of the
Kasdin & Walter discrete colored-noise theory ([Kasdin1992]_) whose closed-form
Allan-deviation prefactors come from Dawkins (2007) and Vernotte (2015, Table I).
This is a genuinely different codebase and citation lineage from Kshana's
``src/powerlaw.rs`` (which cites IEEE Std 1139-2008 and Riley, NIST SP 1065 §3):
neither re-implements the other, yet both must compute the *same* uniquely-defined
quantity -- the PSD->Allan conversion for each of the five IEEE-1139 power-law noise
types, ``S_y(f) = h_a f^a  ->  sigma_y(tau)``.

How the reference is built
--------------------------
For each noise slope ``a`` in {+2, +1, 0, -1, -2} (allantools' ``b = a - 2``):

  1. Instantiate ``allantools.Noise(qd, b)`` and read the *frequency* PSD level it
     corresponds to, ``h_a = Noise.frequency_psd_from_qd(tau0)`` (Kasdin1992 eqn 39).
     This ``h_a`` is exactly the coefficient Kshana's ``PowerLaw`` struct stores for
     the same slope (``S_y(f) = h_a f^a``), so the level fed to Kshana equals the
     level allantools assumes -- the PSD<->ADEV coefficient convention is pinned.

  2. Evaluate allantools' *closed-form* Allan deviation ``Noise.adev(tau0, tau)``
     over a tau ladder. Internally this is ``sqrt(coeff * h_a) * tau^(c/2)`` with
     ``coeff`` and ``c`` the analytic per-noise-type constants (allantools'
     ``adev_from_qd`` / ``c_avar``). No random numbers -- deterministic, regenerable
     offline, and the tightest possible cross-check of the two independent
     derivations of the conversion.

  3. Additionally, one *synth-then-estimate* corroboration point for white FM: draw a
     long record from allantools' Kasdin generator (``Noise.generateNoise``) and run
     allantools' ``oadev`` estimator on it, averaging the Allan *variance* over
     several seeded realisations. This proves allantools' generator actually emits
     noise at the ``h_a`` level its own closed form predicts (a few-% finite-sample
     agreement), so the closed-form fixture is not a paper identity.

Kshana then reproduces every closed-form point via ``powerlaw::allan_deviation``
(see ``tests/powerlaw_oadev_reference.rs``). The white/flicker-FM, RW-FM and white-PM
rows match to floating-point round-off; the flicker-PM row matches to ~1e-4 because
Kshana rounds the flicker-PM constant ``3*gamma - ln2 = 1.03846...`` to ``1.038``
(the NIST SP 1065 tabulated value) while allantools keeps the full ``3*gamma - ln2``.

Run:  python3 generate_p1_powerlaw_reference.py
Pinned: allantools 2024.06, numpy 2.x, Python 3.x. Emits committed constants for the
Rust known-answer test; regenerable fully offline (no network, no vendored data).
"""
import numpy as np
import allantools as at

TAU0 = 1.0
# Nyquist bandwidth allantools assumes for the two phase-modulation terms:
# f_h = 0.5 / tau0 (see allantools Noise.adev_from_qd).
F_H = 0.5 / TAU0

# tau ladder spanning the regimes where each power law has a clean slope.
TAUS = [1.0, 2.0, 4.0, 10.0, 30.0, 100.0, 300.0, 1000.0]

# Kshana's frequency-PSD coefficient names, keyed by the slope a (a = b + 2).
#   a=+2 (b= 0) white   PM  -> h_2
#   a=+1 (b=-1) flicker PM  -> h_1
#   a= 0 (b=-2) white   FM  -> h_0
#   a=-1 (b=-3) flicker FM  -> h_m1   (the FLOOR)
#   a=-2 (b=-4) rand-walk FM-> h_m2
NOISE_TYPES = [
    # (b, a, kshana_coeff_name, human label, qd chosen for a "nice" level)
    (0, 2, "h_2", "white_pm", 1.0e-20),
    (-1, 1, "h_1", "flicker_pm", 1.0e-20),
    (-2, 0, "h_0", "white_fm", 1.0e-20),
    (-3, -1, "h_m1", "flicker_fm", 1.0e-20),
    (-4, -2, "h_m2", "rw_fm", 1.0e-20),
]


def closed_form_table():
    """allantools closed-form ADEV per noise type over the tau ladder."""
    rows = []
    for b, a, name, label, qd in NOISE_TYPES:
        n = at.Noise(nr=2, qd=qd, b=b)
        h_a = n.frequency_psd_from_qd(tau0=TAU0)
        pts = [(tau, n.adev(TAU0, tau)) for tau in TAUS]
        rows.append((b, a, name, label, h_a, pts))
    return rows


def white_fm_synth_oadev():
    """One synth-then-estimate corroboration point for white FM (a=0).

    Averages the Allan *variance* over several seeded realisations of allantools'
    Kasdin generator, then roots -- an independent generator+estimator path that must
    reproduce the closed form to a few percent.
    """
    b, qd = -2, 1.0e-20
    n = at.Noise(nr=2 ** 16, qd=qd, b=b)
    h_a = n.frequency_psd_from_qd(tau0=TAU0)
    taus = [4.0, 16.0, 64.0]
    nreal = 40
    acc = np.zeros(len(taus))
    for seed in range(nreal):
        np.random.seed(0x51DE + seed)
        n.generateNoise()
        _t, ad, _e, _n = at.oadev(
            n.time_series, rate=1.0 / TAU0, data_type="phase", taus=taus
        )
        acc += np.asarray(ad) ** 2
    est = np.sqrt(acc / nreal)
    closed = [n.adev(TAU0, t) for t in taus]
    return h_a, list(zip(taus, est, closed))


def main():
    print(f"# allantools {at.__version__}, numpy {np.__version__}")
    print("# Independent oracle: allantools.Noise (Kasdin1992 / Vernotte2015 Table I)")
    print("# Closed-form sigma_y(tau) for S_y(f) = h_a * f^a, tau0 = 1, f_h = 0.5/tau0")
    print("# columns:  clabel  a  h_a  tau  adev")
    for b, a, name, label, h_a, pts in closed_form_table():
        print(f"# --- {label} (a={a:+d}, kshana {name}), h_a = {h_a:.12e} ---")
        for tau, adev in pts:
            print(f"cf {label} {a} {h_a:.15e} {tau:.6f} {adev:.15e}")
    print("# white-FM synth(Kasdin gen)->oadev corroboration (few-% finite-sample):")
    h_a, rows = white_fm_synth_oadev()
    print(f"# h_a = {h_a:.12e}")
    for tau, est, closed in rows:
        rel = abs(est - closed) / closed
        print(
            f"synth white_fm {h_a:.15e} {tau:.6f} {est:.15e} "
            f"# closed={closed:.6e} rel={rel:.3e}"
        )


if __name__ == "__main__":
    main()
