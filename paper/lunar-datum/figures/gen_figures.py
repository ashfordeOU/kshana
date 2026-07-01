# SPDX-License-Identifier: CC-BY-4.0
"""Generate the three figures for the P1 lunar-datum-identifiability manuscript.

All numeric inputs below are the engine outputs of
    cargo run --example p1_datum_identifiability
(committed engine, branch worktree-lunar-llr-datum-anchor). They are MODELLED
magnitudes — representative beacon/schedule/noise/cost (see
tests/fixtures/llr_geometry/NOTICE.md). The figures illustrate STRUCTURE
(ordering, sign, the radial-vs-transverse contrast), not mission values.

Run: python3 gen_figures.py     (writes *.pdf and *.png beside this script)
"""

import os
import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import FancyArrowPatch, Circle

HERE = os.path.dirname(os.path.abspath(__file__))

plt.rcParams.update(
    {
        "font.family": "serif",
        "font.size": 10,
        "axes.titlesize": 11,
        "axes.labelsize": 10,
        "mathtext.fontset": "cm",
        "axes.spines.top": False,
        "axes.spines.right": False,
        "figure.dpi": 150,
    }
)

# Colourblind-safe (Wong 2011).
C_RADIAL = "#D55E00"   # vermillion  — radial / depth-diverse (orbiter far-side)
C_TRANS = "#0072B2"    # blue        — transverse (VLBI limb)
C_LLR = "#555555"      # grey        — LLR baseline
C_ACCENT = "#009E73"   # green

# --- Engine outputs (MODELLED magnitudes) -----------------------------------
BASE_METRIC = 3.540443e5        # LLR-only degeneracy metric lambda_min(S)
GAIN_VLBI = 1.160619e3          # marginal metric gain, +VLBI-limb (transverse)
GAIN_ORB = 9.333975e3           # marginal metric gain, +Orbiter-farside (radial)
COST_VLBI, COST_ORB = 3.0, 5.0
FRAC_TX = 1.656e-3              # fractional CRLB improvement, radial t_x, under VLBI
FRAC_TY = 4.759e-3             # fractional CRLB improvement, transverse t_y, under VLBI

# Pareto frontier: (budget, total_cost, metric, design-set label). Each point is
# the budget-OPTIMAL design at that cost, not a cumulative acquisition path (at
# budget 8 the optimiser drops VLBI in favour of the far-side orbiter).
FRONTIER = [
    (1.0, 1.0, 3.540443e5, "LLR"),
    (4.0, 4.0, 3.552050e5, "LLR + VLBI"),
    (8.0, 6.0, 3.633783e5, "LLR + Orb-far"),
    (13.0, 13.0, 3.647173e5, "all four"),
]


def _save(fig, stem):
    fig.savefig(os.path.join(HERE, stem + ".pdf"), bbox_inches="tight")
    fig.savefig(os.path.join(HERE, stem + ".png"), bbox_inches="tight", dpi=200)
    plt.close(fig)
    print("wrote", stem + ".pdf/.png")


# ============================================================================
# Figure 1 — the radial ambiguity, geometrically
# ============================================================================
def fig_schematic():
    fig, axes = plt.subplots(1, 2, figsize=(7.4, 3.9))
    R = 1.0
    dx = 0.55  # display-exaggerated perturbation size
    for ax, (title, kind) in zip(
        axes,
        [("(a) near-side beacon (Earth ranging)", "near"),
         ("(b) far-side beacon (orbiter ranging)", "far")],
    ):
        ax.set_aspect("equal")
        ax.set_xlim(-2.0, 2.0)
        ax.set_ylim(-1.6, 2.2)
        ax.axis("off")
        ax.set_title(title, fontsize=9.5)

        # Moon
        ax.add_patch(Circle((0, 0), R, fill=False, ec="black", lw=1.3))
        ax.plot(0, 0, "k+", ms=9, mew=1.5)
        ax.text(0.08, -0.24, "lunocentre", fontsize=7.5)

        # Earth direction (far to the left).
        ax.annotate("to Earth", xy=(-1.98, -0.05), xytext=(-1.25, -0.05),
                    fontsize=7.5, va="center", ha="right",
                    arrowprops=dict(arrowstyle="-|>", color=C_LLR, lw=1.1))

        if kind == "near":
            b = np.array([R * 0.95, R * 0.30])       # near-side, Earth-facing limb
            # Earth sightline: from far left to the beacon.
            ax.plot([-1.9, b[0]], [-0.05, b[1]], color=C_LLR, lw=0.8, ls="--", zorder=1)
        else:
            b = np.array([-R * 0.95, R * 0.30])      # far-side, anti-Earth limb
            orb = np.array([-1.55, 1.35])            # lunar orbiter / relay
            ax.plot(*orb, marker="s", color=C_LLR, ms=6, zorder=5)
            ax.text(orb[0] - 0.05, orb[1] + 0.12, "orbiter / relay",
                    fontsize=7.5, ha="center")
            ax.plot([orb[0], b[0]], [orb[1], b[1]], color=C_LLR, lw=0.8, ls="--", zorder=1)

        ax.plot(*b, "o", color="black", ms=6, zorder=6)

        # Perturbations (both drawn as the beacon's APPARENT displacement):
        #  - a datum origin shift +delta t_x moves every body point by +x-hat;
        #  - a scale increase +epsilon moves the beacon radially OUTWARD (along b-hat).
        p_shift = b + np.array([dx, 0.0])
        p_scale = b + dx * b / np.linalg.norm(b)

        ax.add_patch(FancyArrowPatch(tuple(b), tuple(p_shift), arrowstyle="-|>",
                                     color=C_RADIAL, lw=2.0, mutation_scale=13, zorder=7))
        ax.add_patch(FancyArrowPatch(tuple(b), tuple(p_scale), arrowstyle="-|>",
                                     color=C_TRANS, lw=2.0, mutation_scale=13, zorder=7))

        # The observable senses the x-component (radial, along the Earth-Moon line).
        same = np.sign((p_shift - b)[0]) == np.sign((p_scale - b)[0])
        verdict = ("same range change\n→ indistinguishable" if same
                   else "opposite range change\n→ separable")
        ax.text(0.0, 1.75, verdict, fontsize=8.5, ha="center", va="center",
                color=(C_RADIAL if same else C_ACCENT), fontweight="bold")

    handles = [
        plt.Line2D([0], [0], color=C_RADIAL, lw=2.2, label=r"origin shift $+\delta t_x$"),
        plt.Line2D([0], [0], color=C_TRANS, lw=2.2, label=r"scale stretch $+\varepsilon$"),
    ]
    fig.legend(handles=handles, loc="lower center", ncol=2, frameon=False,
               bbox_to_anchor=(0.5, -0.02))
    fig.suptitle(
        r"Origin-$t_x$ vs. scale: a radial ambiguity broken only by depth diversity",
        y=1.0, fontsize=10.5,
    )
    fig.subplots_adjust(bottom=0.1)
    _save(fig, "degeneracy-schematic")


# ============================================================================
# Figure 2 — cost / degeneracy Pareto frontier
# ============================================================================
def fig_frontier():
    fig, ax = plt.subplots(figsize=(5.2, 3.6))
    costs = [p[1] for p in FRONTIER]
    metrics = [p[2] for p in FRONTIER]

    ax.plot(costs, metrics, "-", color=C_LLR, lw=1.0, zorder=1)
    # Colour each budget-optimal design by the geometry that dominates it.
    pt_colors = [C_LLR, C_TRANS, C_RADIAL, C_ACCENT]
    offsets = {"LLR": (10, -4), "LLR + VLBI": (8, -16),
               "LLR + Orb-far": (-4, 12), "all four": (6, 6)}
    for (b, c, m, lbl), col in zip(FRONTIER, pt_colors):
        ax.plot(c, m, "o", color=col, ms=8, zorder=3)
        ax.annotate(lbl, (c, m), textcoords="offset points",
                    xytext=offsets[lbl], fontsize=8.5, color=col)

    ax.set_xlabel("relative campaign cost")
    ax.set_ylabel(r"degeneracy metric $\lambda_{\min}(S)$  (relative units)")
    ax.set_title("Cost/degeneracy frontier: depth diversity is the priority buy")
    ax.set_xlim(0, 15)
    ax.ticklabel_format(axis="y", style="sci", scilimits=(0, 0))
    ax.grid(True, axis="y", ls=":", lw=0.5, alpha=0.6)
    ax.text(
        0.98, 0.05,
        "MODELLED magnitudes\n(representative costs/noise)",
        transform=ax.transAxes, ha="right", va="bottom", fontsize=7, color="#888888",
    )
    _save(fig, "frontier")


# ============================================================================
# Figure 3 — radial vs transverse: the mechanism
# ============================================================================
def fig_radial_vs_transverse():
    fig, axes = plt.subplots(1, 2, figsize=(7.4, 3.5))

    # Panel (a): marginal degeneracy-metric gain, VLBI vs orbiter-far.
    ax = axes[0]
    bars = ax.bar([0, 1], [GAIN_VLBI, GAIN_ORB],
                  color=[C_TRANS, C_RADIAL], width=0.6)
    ax.set_xticks([0, 1])
    ax.set_xticklabels(["+VLBI-limb\n(transverse)", "+Orbiter-far\n(radial)"])
    ax.set_ylabel(r"marginal gain in $\lambda_{\min}(S)$")
    ax.set_title("(a) degeneracy broken per buy", fontsize=10)
    for b, v in zip(bars, [GAIN_VLBI, GAIN_ORB]):
        ax.text(b.get_x() + b.get_width() / 2, v, f"{v:,.0f}",
                ha="center", va="bottom", fontsize=8.5)
    ax.text(0.5, GAIN_ORB * 0.52, r"$8.0\times$", fontsize=13, color=C_RADIAL,
            ha="center", va="center", fontweight="bold")
    ax.set_ylim(0, GAIN_ORB * 1.15)

    # Panel (b): where VLBI's information lands — fractional CRLB improvement.
    ax = axes[1]
    bars = ax.bar([0, 1], [FRAC_TX * 1e3, FRAC_TY * 1e3],
                  color=[C_RADIAL, C_TRANS], width=0.6)
    ax.set_xticks([0, 1])
    ax.set_xticklabels([r"$t_x$ (radial)", r"$t_y$ (transverse)"])
    ax.set_ylabel(r"fractional CRLB gain, VLBI ($\times10^{-3}$)")
    ax.set_title("(b) VLBI helps transverse, not radial", fontsize=10)
    for b, v in zip(bars, [FRAC_TX * 1e3, FRAC_TY * 1e3]):
        ax.text(b.get_x() + b.get_width() / 2, v, f"{v:.2f}",
                ha="center", va="bottom", fontsize=8.5)
    ax.text(0.5, FRAC_TY * 1e3 * 0.52, r"$2.9\times$", fontsize=13, color=C_TRANS,
            ha="center", va="center", fontweight="bold")
    ax.set_ylim(0, FRAC_TY * 1e3 * 1.18)

    fig.suptitle(
        "Transverse VLBI lifts origin–scale only indirectly; radial ranging breaks it",
        y=1.02, fontsize=10.5,
    )
    fig.subplots_adjust(wspace=0.32)
    _save(fig, "radial-vs-transverse")


if __name__ == "__main__":
    fig_schematic()
    fig_frontier()
    fig_radial_vs_transverse()
    print("done")
