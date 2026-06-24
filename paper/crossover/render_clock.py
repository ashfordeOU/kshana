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
"""
import json
import sys

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

ACCENT = "#9a7a33"
# colour + marker per technology-readiness rung
STYLE = {
    "ground-lab": ("#1f6f8b", "o", "ground-lab"),
    "flight-qualified": ("#4a7a3a", "s", "flight-qualified"),
    "deployed": ("#d2674a", "^", "deployed"),
}


def fhr(t):
    if t is None or not np.isfinite(t):
        return "> swept range"
    return f"{t/3600:.1f} h" if t >= 3600 else f"{t:.0f} s"


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else "paper/crossover/clock.json"
    d = json.load(open(path))
    hold = np.array(d["holdovers_s"])
    thr = d["threshold_ns"]

    fig, ax = plt.subplots(figsize=(7.6, 5.0))
    for c in d["curves"]:
        col, mk, _ = STYLE.get(c["trl"], ("#666", "o", c["trl"]))
        mean = np.array([p["timing_p95_ns"]["mean"] for p in c["points"]])
        lo = np.array([p["timing_p95_ns"]["ci95_low"] for p in c["points"]])
        hi = np.array([p["timing_p95_ns"]["ci95_high"] for p in c["points"]])
        ax.fill_between(hold, lo, hi, color=col, alpha=0.20)
        label = f"{c['id']}  [{c['trl']}] — 1 µs at {fhr(c['time_to_threshold_s'])}"
        ax.plot(hold, mean, color=col, lw=2, marker=mk, ms=4, label=label)

    ax.axhline(thr, color="k", ls="--", lw=1.2)
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
    ax.legend(fontsize=8, loc="upper left", framealpha=0.9)
    eng = d.get("engine_version", "?")
    fig.text(0.99, 0.01, f"Kshana v{eng} · seed 42 · 32 MC runs/node",
             ha="right", va="bottom", fontsize=7, color=ACCENT)
    fig.tight_layout()
    out_png = path.rsplit(".", 1)[0] + ".png"
    out_pdf = path.rsplit(".", 1)[0] + ".pdf"
    fig.savefig(out_png, dpi=150)
    fig.savefig(out_pdf)
    print("wrote", out_png, "and", out_pdf)


if __name__ == "__main__":
    main()
