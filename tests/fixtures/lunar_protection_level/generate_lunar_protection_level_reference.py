#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external-oracle reference fixture for kshana's lunar ARAIM protection
level (``lunar_service::lunar_protection_level`` /
``lunar_service::lunar_protection_level_with_sigma``).

The oracle is assembled from two established third-party implementations, neither of
which is kshana:

1. **RTKLIB** (T. Takasu), library version string "2.4.2", patch level "p13"
   (tag ``v2.4.2-p13``, commit ``71db0ff``), ``src/rtkcmn.c`` compiled from C source
   with ``-ULAPACK``. Its ``lsq()`` forms the normal matrix and inverts it with
   ``matinv() -> ludcmp()/lubksb()`` (Crout LU with partial pivoting), giving
   ``(GᵀG)⁻¹`` for the all-in-view geometry and for each single-satellite-excluded
   sub-geometry. kshana inverts the same normal matrix with a hand-written
   Gauss-Jordan ``invert4()``; the two algorithms are unrelated. The C driver beside
   this script (``oracle.c``) produces those matrices; this script consumes them.
2. **SciPy / NumPy**. ``scipy.stats.norm.isf`` supplies the Bonferroni detector
   multiplier ``K_fa = Φ⁻¹(1 − P_fa/2N)`` (kshana bisects its own erf-series CDF for
   it), ``scipy.stats.norm.sf`` supplies the upper-tail ``Q(z)`` of every integrity
   term (kshana forms ``1 − Φ(z)`` from a Numerical-Recipes incomplete-gamma series,
   a different algorithm *and* a different numerical route into the far tail), and
   ``scipy.optimize.brentq`` finds the protection level as the root of the MHSS
   integrity equation (kshana uses a 200-step bisection). ``numpy.linalg.inv``
   (LAPACK ``getrf``/``getri``) re-inverts every normal matrix as a THIRD independent
   inverse; the largest RTKLIB-vs-LAPACK disagreement is measured and printed into the
   fixture header rather than assumed.

HONEST SCOPE — what this oracle does and does not cover
-------------------------------------------------------
* **Covered (externally computed).** The geometry-to-covariance step ``(GᵀG)⁻¹`` and
  its projection onto the local vertical/horizontal, and the statistical kernel: the
  normal quantile, the normal upper tail, and the root solve that turns the
  integrity-risk budget into a protection level. Every number the fixture carries for
  those comes out of RTKLIB, LAPACK, Cephes (via SciPy) or Brent's method.
* **NOT covered.** (a) The σ_URE budget and the illustrative Moonlight/LCNS-class
  constellation are MODELLED inputs; they are handed to the oracle as given and are
  not validated by anything here. (b) The *form* of the MHSS integrity equation
  itself — ``P_HMI(PL) = Σ_k p_k · Q((PL − T_k)/σ_k)`` with ``T_k = K_fa·σ_ss,k`` —
  is transcribed into this script from the same published single-fault MHSS bound
  kshana's ``raim::araim_raim`` implements. A shared closed form is a shared
  assumption: if the equation were the wrong equation, both sides would be wrong
  together. This script therefore validates the NUMERICS and the ASSEMBLY, not the
  choice of algorithm.

Local vertical / horizontal convention (deliberately convention-free)
---------------------------------------------------------------------
``Up`` is the radial unit vector at the user, which for kshana's spherical Moon is the
local vertical by definition, not a convention. The horizontal variance is then taken
as ``trace(Q_pos) − Upᵀ Q_pos Up`` — the trace of the horizontal block — so NO East /
North azimuth convention is shared with kshana at all (kshana sums two explicit axis
variances; the sum is invariant to any rotation about Up, and this script never has to
pick the same East that kshana picks).

Reproduce
---------
    ./generate_lunar_protection_level_reference.sh

or, by hand:

    cargo test --test lunar_protection_level_reference -- --ignored --nocapture \\
        dump_lunar_protection_level_geometry | grep -E '^(CASE|USER|SAT) ' > geom.raw
    cc -O2 -ULAPACK -I$RTKLIB/src oracle.c $RTKLIB/src/rtkcmn.c -lm -o oracle
    ./oracle < geom.raw > q.out
    python3 generate_lunar_protection_level_reference.py geom.raw q.out \\
        > lunar_protection_level_reference.txt

Run for the committed fixture with Python 3.14.2, NumPy 2.4.1, SciPy 1.17.0 on
macOS/arm64, against RTKLIB rtkcmn.c SHA-256
c1d7e9af54518733dc874fc64523114b4a77a45e80895d0bb8ff4fcecfea65c7.
"""

import sys

import numpy as np
import scipy
from scipy.optimize import brentq
from scipy.stats import norm

# kshana::lunar::LUNAR_P_SAT — the per-satellite fault prior the lunar ARAIM call
# hard-wires (src/lunar.rs). A MODELLED input, shared with kshana on purpose.
LUNAR_P_SAT = 1.0e-4


def read_geometry(path):
    """Parse the kshana geometry dump into a list of case dicts."""
    cases = []
    for line in open(path):
        parts = line.split()
        if not parts:
            continue
        if parts[0] == "CASE":
            cases.append(
                {
                    "label": parts[1],
                    "m": int(parts[2]),
                    "sigma": float(parts[3]),
                    "p_hmi_vert": float(parts[4]),
                    "p_hmi_horz": float(parts[5]),
                    "p_fa": float(parts[6]),
                    "sats": [],
                }
            )
        elif parts[0] == "USER":
            cases[-1]["user"] = np.array([float(v) for v in parts[1:4]])
        elif parts[0] == "SAT":
            cases[-1]["sats"].append([float(v) for v in parts[1:4]])
    for c in cases:
        c["sats"] = np.array(c["sats"])
        assert c["sats"].shape == (c["m"], 3), c["label"]
    return cases


def read_rtklib_q(path):
    """Parse the RTKLIB driver output into {(label, k): 4x4 ndarray}."""
    out = {}
    for line in open(path):
        parts = line.split()
        if not parts or parts[0] != "Q":
            continue
        out[(parts[1], int(parts[2]))] = np.array(
            [float(v) for v in parts[3:19]]
        ).reshape(4, 4)
    return out


def design_matrix(user, sats):
    """Rows [-e_x, -e_y, -e_z, 1] for each satellite, e the unit line of sight."""
    d = sats - user
    e = d / np.linalg.norm(d, axis=1)[:, None]
    return np.hstack([-e, np.ones((len(sats), 1))])


def axis_split(q, up):
    """(vertical variance, horizontal variance) per unit measurement variance.

    Vertical is Upᵀ Q_pos Up; horizontal is the trace of the horizontal block,
    trace(Q_pos) − vertical, which needs no East/North azimuth convention.
    """
    qpos = q[:3, :3]
    var_v = float(up @ qpos @ up)
    var_h = float(np.trace(qpos)) - var_v
    return var_v, var_h


def mhss_protection_level(modes, budget_one_sided):
    """Smallest PL with Σ_k p_k·Q((PL − T_k)/σ_k) ≤ budget, by Brent's method.

    `modes` is a list of (p_fault, threshold_m, sigma_m). The zero-nominal-bias
    single-fault MHSS bound; the bias term is identically zero here because the lunar
    ARAIM call declares b_nom = 0.
    """

    def risk(pl):
        return sum(
            p * norm.sf((pl - t) / s) for (p, t, s) in modes if s > 0.0
        ) - budget_one_sided

    hi = max(t for (_, t, _) in modes) + 40.0 * max(s for (_, _, s) in modes)
    assert risk(0.0) > 0.0, "budget already met at PL = 0"
    assert risk(hi) < 0.0, "bracket too small"
    return brentq(risk, 0.0, hi, xtol=1e-12, rtol=8.9e-16, maxiter=300)


def main():
    geom_path, q_path = sys.argv[1], sys.argv[2]
    cases = read_geometry(geom_path)
    qs = read_rtklib_q(q_path)

    worst_inv = 0.0  # largest RTKLIB-vs-LAPACK relative disagreement seen
    body = []

    for c in cases:
        label, m, sigma = c["label"], c["m"], c["sigma"]
        user, sats = c["user"], c["sats"]
        up = user / np.linalg.norm(user)
        g = design_matrix(user, sats)

        def q_of(k):
            """RTKLIB's (GᵀG)⁻¹ for hypothesis k, cross-checked against LAPACK."""
            nonlocal worst_inv
            q_rtklib = qs[(label, k)]
            rows = g if k < 0 else np.delete(g, k, axis=0)
            q_numpy = np.linalg.inv(rows.T @ rows)
            scale = np.abs(q_numpy).max()
            worst_inv = max(worst_inv, float(np.abs(q_rtklib - q_numpy).max() / scale))
            return q_rtklib

        var0_v, var0_h = axis_split(q_of(-1), up)
        k_fa = float(norm.isf(c["p_fa"] / (2.0 * m)))
        p_ff = max(1.0 - m * LUNAR_P_SAT, 0.0)

        modes_v = [(p_ff, 0.0, sigma * np.sqrt(var0_v))]
        modes_h = [(p_ff, 0.0, sigma * np.sqrt(var0_h))]
        for k in range(m):
            vk_v, vk_h = axis_split(q_of(k), up)
            modes_v.append(
                (
                    LUNAR_P_SAT,
                    k_fa * sigma * np.sqrt(max(vk_v - var0_v, 0.0)),
                    sigma * np.sqrt(vk_v),
                )
            )
            modes_h.append(
                (
                    LUNAR_P_SAT,
                    k_fa * sigma * np.sqrt(max(vk_h - var0_h, 0.0)),
                    sigma * np.sqrt(vk_h),
                )
            )

        vpl = mhss_protection_level(modes_v, c["p_hmi_vert"] / 2.0)
        hpl = mhss_protection_level(modes_h, c["p_hmi_horz"] / 2.0)

        q_all = qs[(label, -1)]
        gdop = float(np.sqrt(np.trace(q_all)))
        pdop = float(np.sqrt(np.trace(q_all[:3, :3])))
        tdop = float(np.sqrt(q_all[3, 3]))

        body.append(
            "CASE %s %d %.17e %.17e %.17e %.17e"
            % (label, m, sigma, c["p_hmi_vert"], c["p_hmi_horz"], c["p_fa"])
        )
        body.append("USER %.17e %.17e %.17e" % tuple(user))
        for s in sats:
            body.append("SAT %.17e %.17e %.17e" % tuple(s))
        body.append(
            "ORACLE %.17e %.17e %.17e %.17e %.17e %.17e %.17e"
            % (
                hpl,
                vpl,
                np.sqrt(var0_h),
                np.sqrt(var0_v),
                pdop,
                gdop,
                tdop,
            )
        )
        body.append("KFA %.17e" % k_fa)

    print(HEADER % (scipy.__version__, np.__version__, worst_inv))
    print("\n".join(body))


HEADER = """# SPDX-License-Identifier: AGPL-3.0-only
#
# Lunar ARAIM protection-level external-oracle reference fixture.
# Generated by generate_lunar_protection_level_reference.py + oracle.c; see the NOTICE
# beside them for full provenance and licences. DO NOT HAND-EDIT.
#
# ORACLE (two established third-party implementations, composed):
#   RTKLIB 2.4.2-p13 (T. Takasu), src/rtkcmn.c compiled from C source with -ULAPACK.
#     lsq() -> matinv() -> ludcmp()/lubksb(): Crout LU with partial pivoting gives
#     (GtG)^-1 for the all-in-view geometry and for each SV-excluded sub-geometry.
#     kshana inverts the same normal matrix with a hand-written Gauss-Jordan invert4().
#   SciPy %s / NumPy %s: scipy.stats.norm.isf for K_fa = Phi^-1(1 - P_fa/2N),
#     scipy.stats.norm.sf (Cephes ndtr) for every integrity-risk tail term, and
#     scipy.optimize.brentq for the protection-level root. kshana bisects its own
#     Numerical-Recipes incomplete-gamma erf series for the first two and runs a
#     200-step bisection for the third.
#   numpy.linalg.inv (LAPACK getrf/getri) re-inverts every normal matrix as a third,
#     independent inverse. Largest RTKLIB-vs-LAPACK disagreement over every hypothesis
#     geometry in this fixture, relative to the largest entry of each matrix:
#     %.3e  (measured, not assumed).
#
# WHAT THIS FIXTURE DOES AND DOES NOT VALIDATE
#   Validated externally: the geometry-to-covariance step and its vertical/horizontal
#     projection, and the statistical kernel (normal quantile, normal upper tail, and
#     the root solve that maps an integrity-risk budget to a protection level).
#   NOT validated: the sigma_URE budget and the illustrative Moonlight/LCNS-class
#     constellation, which are MODELLED inputs handed to the oracle as given; and the
#     FORM of the single-fault MHSS integrity equation, which this generator
#     transcribes from the same published bound kshana implements. A shared closed
#     form is a shared assumption.
#
# Vertical is Up^T Q_pos Up with Up the radial unit vector (the local vertical of a
# spherical Moon, not a convention). Horizontal is trace(Q_pos) - vertical, the trace
# of the horizontal block, so no East/North azimuth convention is shared with kshana.
#
# FORMAT (one block per case, all values %%.17e so the f64 round-trips):
#   CASE   <label> <m> <sigma_ure_m> <p_hmi_vert> <p_hmi_horz> <p_fa>
#   USER   <x> <y> <z>                       MCMF metres
#   SAT    <x> <y> <z>                       MCMF metres, m lines
#   ORACLE <hpl_m> <vpl_m> <hdop> <vdop> <pdop> <gdop> <tdop>
#   KFA    <k_fa>                            the Bonferroni detector multiplier
# The per-satellite fault prior is kshana::lunar::LUNAR_P_SAT = 1e-4 and the nominal
# range bias is zero, both fixed by the lunar ARAIM call; the fixture does not repeat
# them per case."""


if __name__ == "__main__":
    main()
