#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Render the inertial quantum-vs-classical crossover figure from the engine's
JSON. Reproducible companion to `crossover_study`:

    cargo run --release --bin crossover_study -- paper/crossover/inertial.json
    python3 paper/crossover/render_inertial.py paper/crossover/inertial.json

Produces a two-panel figure: (left) the advantage heatmap over outage x platform
vibration with the break-even (advantage = 1) contour; (right) the dead-reckoning
p95 error vs vibration for both sensors at a representative outage, with 95 %
bootstrap CI bands, showing the crossover point. No engine numbers are computed
here — this only draws what the JSON already contains.

One invocation writes two correctly-themed files from the same data:
  * <name>.png — DARK, matching the other README figures
    (docs/assets/figures/{domain-coverage-map,scenario-fom,sgp4-regime-bars}.png).
  * <name>.pdf — LIGHT (white canvas, black text), for the arXiv paper, which
    embeds inertial.pdf. Format decides the theme; the numbers are identical.
"""
import json
import sys

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
import matplotlib.patheffects as pe
from matplotlib.colors import LogNorm

G0 = 9.806_65

# --- Themes ---------------------------------------------------------------------
# The heatmap colormap (RdYlBu) is shared; everything drawn ON TOP of it — contour,
# break-even markers, region labels, the companion line panel — swaps between a dark
# README palette and the light palette the paper has always used.
DARK = {
    "rc": {
        "figure.facecolor": "#0c0b08",
        "savefig.facecolor": "#0c0b08",
        "axes.facecolor": "#0c0b08",
        "axes.edgecolor": "#5a5040",
        "axes.labelcolor": "#f1ece2",
        "axes.titlecolor": "#e0bd84",
        "text.color": "#f1ece2",
        "xtick.color": "#c9c2b4",
        "ytick.color": "#c9c2b4",
        "grid.color": "#342c21",
        "legend.facecolor": "#141109",
        "legend.edgecolor": "#3a352b",
    },
    "cold": "#4aa3c4",
    "nav": "#dd6a48",
    "line": "#f1ece2",  # contour, break-even rule
    "pt_face": "#f1ece2",
    "pt_edge": "#0c0b08",
    "cb_text": "#f1ece2",
    "cb_tick": "#c9c2b4",
    "cb_edge": "#5a5040",
    "ann_cold": "#f1ece2",
    "ann_nav": "#f1ece2",
    "ann_stroke": "#0c0b08",  # dark halo so labels read on any heatmap cell
    "accent": "#e0bd84",
    "label": "#f1ece2",
}
LIGHT = {
    "rc": {
        "figure.facecolor": "white",
        "savefig.facecolor": "white",
        "axes.facecolor": "white",
        "axes.edgecolor": "black",
        "axes.labelcolor": "black",
        "axes.titlecolor": "black",
        "text.color": "black",
        "xtick.color": "black",
        "ytick.color": "black",
        "grid.color": "#b0b0b0",
    },
    "cold": "#1f6f8b",
    "nav": "#d2674a",
    "line": "k",
    "pt_face": "k",
    "pt_edge": "k",
    "cb_text": "black",
    "cb_tick": "black",
    "cb_edge": "black",
    "ann_cold": "#1a5276",
    "ann_nav": "#7b241c",
    "ann_stroke": None,
    "accent": "#9a7a33",
    "label": None,
}


def ug(psd):
    """PSD ((m/s^2)^2/Hz) -> ASD in ug/rtHz."""
    return np.sqrt(psd) / (G0 * 1e-6)


def render(d, out, theme, dpi=None):
    """Draw the two-panel crossover in one theme and save to `out`."""
    outages = np.array(d["outages_s"])
    psds = np.array(d["vibration_psds"])
    vib = ug(psds)
    no, nv = len(outages), len(psds)
    adv = np.array([n["advantage"] for n in d["nodes"]]).reshape(no, nv)
    be = np.array([b["psd_at_breakeven"] for b in d["breakeven"]])
    be_ug = np.where(np.isfinite(be) & (be > 0), ug(np.where(be > 0, be, np.nan)), np.nan)
    ann_pe = ([pe.withStroke(linewidth=2.4, foreground=theme["ann_stroke"])]
              if theme["ann_stroke"] else None)

    with plt.rc_context(theme["rc"]):
        fig, (axL, axR) = plt.subplots(1, 2, figsize=(11.5, 4.6))

        # --- Left: advantage heatmap + break-even contour ------------------
        X, Y = np.meshgrid(vib, outages)
        pcm = axL.pcolormesh(
            X, Y, adv, norm=LogNorm(vmin=max(adv.min(), 0.05), vmax=adv.max()),
            cmap="RdYlBu", shading="gouraud",
        )
        cs = axL.contour(X, Y, adv, levels=[1.0], colors=theme["line"], linewidths=1.8, linestyles="--")
        axL.clabel(cs, fmt={1.0: "break-even"}, fontsize=8, colors=theme["line"])
        # break-even points per outage (from the engine's own interpolation)
        ok = np.isfinite(be_ug)
        axL.plot(be_ug[ok], outages[ok], "o", mfc=theme["pt_face"], mec=theme["pt_edge"],
                 mew=0.8, ms=4, zorder=5)
        axL.set_xscale("log")
        axL.set_yscale("log")
        axL.set_xlabel(r"platform vibration ASD ($\mu g/\sqrt{\mathrm{Hz}}$)")
        axL.set_ylabel("GNSS outage duration (s)")
        axL.set_title("Cold-atom advantage over navigation-grade\n(p95 dead-reckoning error ratio)")
        cb = fig.colorbar(pcm, ax=axL)
        cb.set_label("advantage  (nav-grade / cold-atom)", color=theme["cb_text"])
        cb.ax.yaxis.set_tick_params(color=theme["cb_tick"])
        plt.setp(cb.ax.get_yticklabels(), color=theme["cb_text"])
        cb.outline.set_edgecolor(theme["cb_edge"])
        axL.text(0.04, 0.10, "cold-atom\nwins", transform=axL.transAxes, fontsize=9,
                 color=theme["ann_cold"], ha="left", va="center", weight="bold", path_effects=ann_pe)
        axL.text(0.78, 0.90, "nav-grade\nwins", transform=axL.transAxes, fontsize=9,
                 color=theme["ann_nav"], ha="left", va="center", weight="bold", path_effects=ann_pe)

        # --- Right: p95 error vs vibration at a representative outage, CI ---
        target = 300.0
        i = int(np.argmin(np.abs(outages - target)))
        o = outages[i]
        qm = np.array([d["nodes"][i * nv + j]["quantum_p95_m"]["mean"] for j in range(nv)])
        qlo = np.array([d["nodes"][i * nv + j]["quantum_p95_m"]["ci95_low"] for j in range(nv)])
        qhi = np.array([d["nodes"][i * nv + j]["quantum_p95_m"]["ci95_high"] for j in range(nv)])
        cm = np.array([d["nodes"][i * nv + j]["classical_p95_m"]["mean"] for j in range(nv)])
        clo = np.array([d["nodes"][i * nv + j]["classical_p95_m"]["ci95_low"] for j in range(nv)])
        chi = np.array([d["nodes"][i * nv + j]["classical_p95_m"]["ci95_high"] for j in range(nv)])
        axR.fill_between(vib, qlo, qhi, color=theme["cold"], alpha=0.25)
        axR.plot(vib, qm, color=theme["cold"], lw=2, marker="o", ms=3, label="cold-atom (CAI), 95% CI")
        axR.fill_between(vib, clo, chi, color=theme["nav"], alpha=0.25)
        axR.plot(vib, cm, color=theme["nav"], lw=2, marker="s", ms=3, label="navigation-grade, 95% CI")
        if np.isfinite(be_ug[i]):
            axR.axvline(be_ug[i], color=theme["line"], ls="--", lw=1.2)
            axR.text(be_ug[i], axR.get_ylim()[1], f"  break-even\n  {be_ug[i]:.0f} " + r"$\mu g/\sqrt{Hz}$",
                     fontsize=8, va="top")
        axR.set_xscale("log")
        axR.set_yscale("log")
        axR.set_xlabel(r"platform vibration ASD ($\mu g/\sqrt{\mathrm{Hz}}$)")
        axR.set_ylabel("p95 position error after outage (m)")
        axR.set_title(f"Dead-reckoning error at a {o:.0f} s outage")
        axR.legend(fontsize=8, loc="upper left", labelcolor=theme["label"])
        axR.grid(True, which="both", alpha=0.25)

        eng = d.get("engine_version", "?")
        fig.suptitle(
            "Quantum-vs-classical PNT-resilience crossover (Kshana v%s, seed 42, %d MC runs/node)"
            % (eng, 64), fontsize=10, color=theme["accent"],
        )
        fig.tight_layout(rect=[0, 0, 1, 0.95])
        fig.savefig(out, dpi=dpi, facecolor=fig.get_facecolor())
        plt.close(fig)


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else "paper/crossover/inertial.json"
    d = json.load(open(path))
    base = path.rsplit(".", 1)[0]
    render(d, base + ".png", DARK, dpi=150)  # README (dark)
    render(d, base + ".pdf", LIGHT)  # arXiv paper (light)
    print("wrote", base + ".png", "(dark) and", base + ".pdf", "(light)")


if __name__ == "__main__":
    main()
