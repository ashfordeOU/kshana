#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Render the clock-holdover TRL-ladder figure from the engine's JSON.

    cargo run --release --bin crossover_study -- paper/crossover
    python3 paper/crossover/render_clock.py paper/crossover/clock.json

Timing error vs holdover duration for each clock technology, with 95% bootstrap CI
bands, the timing-budget threshold, the per-clock holdover-to-threshold, and an
explicit technology-readiness label per curve (ground-lab / flight-qualified /
deployed). Draws only what the JSON contains. JSON `null` denotes +inf (no crossing
within the swept range), since JSON has no infinity.

One invocation writes two correctly-themed files from the same data:
  * <name>.png — DARK, matching the other README figures
    (docs/assets/figures/{domain-coverage-map,scenario-fom,sgp4-regime-bars}.png):
    a warm near-black canvas, gold title, cream labels, bright curves.
  * <name>.pdf — LIGHT (white canvas, black text), for the arXiv paper, which
    embeds clock.pdf. Format decides the theme, so the README and the paper each
    get the look they need with no divergence in the underlying numbers.
"""
import json
import sys

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

# --- Themes ---------------------------------------------------------------------
# Bright, distinct curves per technology-readiness rung; the light palette matches
# the figure the paper has always shipped, the dark palette lifts it onto the
# near-black README canvas. Marker per rung is shared across themes.
MARKERS = {"ground-lab": "o", "flight-qualified": "s", "deployed": "^"}

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
    "colours": {"ground-lab": "#4aa3c4", "flight-qualified": "#46b67e", "deployed": "#dd6a48"},
    "line": "#f1ece2",  # threshold rule
    "accent": "#e0bd84",  # footer / gold
    "label": "#f1ece2",  # legend text
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
    "colours": {"ground-lab": "#1f6f8b", "flight-qualified": "#4a7a3a", "deployed": "#d2674a"},
    "line": "k",
    "accent": "#9a7a33",
    "label": None,  # matplotlib default (black)
}


def fhr(t):
    if t is None or not np.isfinite(t):
        return "> swept range"
    return f"{t/3600:.1f} h" if t >= 3600 else f"{t:.0f} s"


def render(d, out, theme, dpi=None):
    """Draw the ladder in one theme and save to `out` (format inferred by suffix)."""
    hold = np.array(d["holdovers_s"])
    thr = d["threshold_ns"]
    with plt.rc_context(theme["rc"]):
        fig, ax = plt.subplots(figsize=(7.6, 5.0))
        for c in d["curves"]:
            col = theme["colours"].get(c["trl"], "#888")
            mk = MARKERS.get(c["trl"], "o")
            mean = np.array([p["timing_p95_ns"]["mean"] for p in c["points"]])
            lo = np.array([p["timing_p95_ns"]["ci95_low"] for p in c["points"]])
            hi = np.array([p["timing_p95_ns"]["ci95_high"] for p in c["points"]])
            ax.fill_between(hold, lo, hi, color=col, alpha=0.20)
            label = f"{c['id']}  [{c['trl']}] — 1 µs at {fhr(c['time_to_threshold_s'])}"
            ax.plot(hold, mean, color=col, lw=2, marker=mk, ms=4, label=label)

        ax.axhline(thr, color=theme["line"], ls="--", lw=1.2)
        ax.text(hold[0], thr * 1.3, f"{thr:.0f} ns ({thr/1000:.0f} µs) budget", fontsize=8, va="bottom")
        ax.set_xscale("log")
        ax.set_yscale("log")
        ax.set_xlabel("holdover duration (s)")
        ax.set_ylabel("p95 timing error (ns)")
        ax.set_title(
            "Clock-holdover technology-readiness ladder\n"
            "(GNSS-disciplined, then free-running; 95% bootstrap CI)"
        )
        ax.grid(True, which="both", alpha=0.25)
        ax.legend(fontsize=8, loc="upper left", framealpha=0.9, labelcolor=theme["label"])
        eng = d.get("engine_version", "?")
        fig.text(0.99, 0.01, f"Kshana v{eng} · seed 42 · 32 MC runs/node",
                 ha="right", va="bottom", fontsize=7, color=theme["accent"])
        fig.tight_layout()
        fig.savefig(out, dpi=dpi, facecolor=fig.get_facecolor())
        plt.close(fig)


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else "paper/crossover/clock.json"
    d = json.load(open(path))
    base = path.rsplit(".", 1)[0]
    render(d, base + ".png", DARK, dpi=150)  # README (dark)
    render(d, base + ".pdf", LIGHT)  # arXiv paper (light)
    print("wrote", base + ".png", "(dark) and", base + ".pdf", "(light)")


if __name__ == "__main__":
    main()
