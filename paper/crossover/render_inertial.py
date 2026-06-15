#!/usr/bin/env python3
# SPDX-License-Identifier: Apache-2.0
"""Render the inertial quantum-vs-classical crossover figure from the engine's
JSON. Reproducible companion to `crossover_study`:

    cargo run --release --bin crossover_study -- paper/crossover/inertial.json
    python3 paper/crossover/render_inertial.py paper/crossover/inertial.json

Produces a two-panel figure: (left) the advantage heatmap over outage x platform
vibration with the break-even (advantage = 1) contour; (right) the dead-reckoning
p95 error vs vibration for both sensors at a representative outage, with 95 %
bootstrap CI bands, showing the crossover point. No engine numbers are computed
here — this only draws what the JSON already contains.
"""
import json
import sys

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.colors import LogNorm

G0 = 9.806_65
COLD = "#1f6f8b"   # cold-atom (teal)
NAV = "#d2674a"    # nav-grade (warm)
ACCENT = "#9a7a33"


def ug(psd):
    """PSD ((m/s^2)^2/Hz) -> ASD in ug/rtHz."""
    return np.sqrt(psd) / (G0 * 1e-6)


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else "paper/crossover/inertial.json"
    d = json.load(open(path))
    outages = np.array(d["outages_s"])
    psds = np.array(d["vibration_psds"])
    vib = ug(psds)
    no, nv = len(outages), len(psds)
    adv = np.array([n["advantage"] for n in d["nodes"]]).reshape(no, nv)
    be = np.array([b["psd_at_breakeven"] for b in d["breakeven"]])
    be_ug = np.where(np.isfinite(be) & (be > 0), ug(np.where(be > 0, be, np.nan)), np.nan)

    fig, (axL, axR) = plt.subplots(1, 2, figsize=(11.5, 4.6))

    # --- Left: advantage heatmap + break-even contour ----------------------
    X, Y = np.meshgrid(vib, outages)
    pcm = axL.pcolormesh(
        X, Y, adv, norm=LogNorm(vmin=max(adv.min(), 0.05), vmax=adv.max()),
        cmap="RdYlBu", shading="gouraud",
    )
    cs = axL.contour(X, Y, adv, levels=[1.0], colors="k", linewidths=1.8, linestyles="--")
    axL.clabel(cs, fmt={1.0: "break-even"}, fontsize=8)
    # break-even points per outage (from the engine's own interpolation)
    ok = np.isfinite(be_ug)
    axL.plot(be_ug[ok], outages[ok], "ko", ms=4, zorder=5)
    axL.set_xscale("log")
    axL.set_yscale("log")
    axL.set_xlabel(r"platform vibration ASD ($\mu g/\sqrt{\mathrm{Hz}}$)")
    axL.set_ylabel("GNSS outage duration (s)")
    axL.set_title("Cold-atom advantage over navigation-grade\n(p95 dead-reckoning error ratio)")
    cb = fig.colorbar(pcm, ax=axL)
    cb.set_label("advantage  (nav-grade / cold-atom)")
    axL.text(0.04, 0.10, "cold-atom\nwins", transform=axL.transAxes, fontsize=9,
             color="#1a5276", ha="left", va="center", weight="bold")
    axL.text(0.78, 0.90, "nav-grade\nwins", transform=axL.transAxes, fontsize=9,
             color="#7b241c", ha="left", va="center", weight="bold")

    # --- Right: p95 error vs vibration at a representative outage, with CI --
    target = 300.0
    i = int(np.argmin(np.abs(outages - target)))
    o = outages[i]
    qm = np.array([d["nodes"][i * nv + j]["quantum_p95_m"]["mean"] for j in range(nv)])
    qlo = np.array([d["nodes"][i * nv + j]["quantum_p95_m"]["ci95_low"] for j in range(nv)])
    qhi = np.array([d["nodes"][i * nv + j]["quantum_p95_m"]["ci95_high"] for j in range(nv)])
    cm = np.array([d["nodes"][i * nv + j]["classical_p95_m"]["mean"] for j in range(nv)])
    clo = np.array([d["nodes"][i * nv + j]["classical_p95_m"]["ci95_low"] for j in range(nv)])
    chi = np.array([d["nodes"][i * nv + j]["classical_p95_m"]["ci95_high"] for j in range(nv)])
    axR.fill_between(vib, qlo, qhi, color=COLD, alpha=0.25)
    axR.plot(vib, qm, color=COLD, lw=2, marker="o", ms=3, label="cold-atom (CAI), 95% CI")
    axR.fill_between(vib, clo, chi, color=NAV, alpha=0.25)
    axR.plot(vib, cm, color=NAV, lw=2, marker="s", ms=3, label="navigation-grade, 95% CI")
    if np.isfinite(be_ug[i]):
        axR.axvline(be_ug[i], color="k", ls="--", lw=1.2)
        axR.text(be_ug[i], axR.get_ylim()[1], f"  break-even\n  {be_ug[i]:.0f} " + r"$\mu g/\sqrt{Hz}$",
                 fontsize=8, va="top")
    axR.set_xscale("log")
    axR.set_yscale("log")
    axR.set_xlabel(r"platform vibration ASD ($\mu g/\sqrt{\mathrm{Hz}}$)")
    axR.set_ylabel("p95 position error after outage (m)")
    axR.set_title(f"Dead-reckoning error at a {o:.0f} s outage")
    axR.legend(fontsize=8, loc="upper left")
    axR.grid(True, which="both", alpha=0.25)

    eng = d.get("engine_version", "?")
    fig.suptitle(
        "Quantum-vs-classical PNT-resilience crossover (Kshana v%s, seed 42, %d MC runs/node)"
        % (eng, 64), fontsize=10, color=ACCENT,
    )
    fig.tight_layout(rect=[0, 0, 1, 0.95])
    out_png = path.rsplit(".", 1)[0] + ".png"
    out_pdf = path.rsplit(".", 1)[0] + ".pdf"
    fig.savefig(out_png, dpi=150)
    fig.savefig(out_pdf)
    print("wrote", out_png, "and", out_pdf)


if __name__ == "__main__":
    main()
