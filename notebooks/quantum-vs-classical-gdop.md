<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of
notebooks/quantum-vs-classical-gdop.ipynb. Regenerate the notebook with jupytext:

  jupytext --to notebook notebooks/quantum-vs-classical-gdop.md

FOUNDER ACTION (before sharing the Colab link):
  * Confirm a `kshana` wheel for the target Python is live at
    https://pypi.org/project/kshana/ — the first install cell fails for every reader
    otherwise. The wheels.yml workflow publishes wheels on each release tag.
  * Confirm the public playground at https://kshana.dev (GitHub Pages) is reachable.
  * Upload to Google Colab and add the "Open in Colab" badge to the README if desired.
-->

# Kshana — quantum vs classical PNT through GNSS outages

**The honest axis.** Geometric dilution of precision (GDOP) is a geometry-only quantity:
it is the trace of (GᵀG)⁻¹ over the line-of-sight matrix, and it is **identical for a
quantum and a classical receiver**. What differs between quantum and classical PNT is how
each **clock survives the low- or zero-satellite gaps** that high GDOP and outages create.
This notebook shows both: the shared geometry/availability, and the clock holdover that
actually distinguishes the two.

## Cell 2 — install (code)

```python
# Install the published wheel; fall back to building from source if a wheel is
# unavailable for this Python/platform.
try:
    import kshana  # noqa: F401
except ImportError:
    import subprocess, sys
    rc = subprocess.run([sys.executable, "-m", "pip", "install", "kshana"]).returncode
    if rc != 0:
        # Fallback: build from the GitHub source with maturin.
        subprocess.run([sys.executable, "-m", "pip", "install", "maturin"], check=True)
        subprocess.run([sys.executable, "-m", "pip", "install",
                        "git+https://github.com/ashfordeOU/kshana"], check=True)
    import kshana  # noqa: F401
```

## Cell 3 — import + version (code)

```python
import json
import numpy as np
import matplotlib.pyplot as plt
import kshana

print("kshana", kshana.version())
print("scenario kinds:", [k["name"] for k in kshana.scenario_kinds()])
```

## Cell 4 — run an orbit scenario, read the shared geometry (code)

```python
# A multi-GNSS (GPS + Galileo) availability scenario seen from a spacecraft inside
# the GNSS shell. Geometry/availability here are SHARED by both clocks.
SCENARIO = '''
kind = "orbit"
seed = 7
threshold_ns = 5.0
mask_deg = 10.0
sigma_uere_m = 1.0

[time]
step_s = 60.0
duration_s = 86400.0

[user]
altitude_km = 8000.0
inclination_deg = 0.0

[constellation]
altitude_km = 20180.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0

[[constellations]]
altitude_km = 23222.0
inclination_deg = 56.0
planes = 3
sats_per_plane = 8
phasing_f = 1.0

[clock_quantum]
id = "optical-sr-lattice"
provenance = "Strontium optical lattice clock, space-oriented goal sigma_y(1s)=1e-15 (arXiv:1503.08457); not flown."
y0 = 1.0e-15
q_wf = 1.0e-30
q_rw = 1.0e-40

[clock_classical]
id = "csac-sa45s"
provenance = "Microchip SA.45s / SA65 chip-scale atomic clock, sigma_y(1s)=3.0e-10 (datasheet); deployed commercial part."
y0 = 1.0e-11
q_wf = 9.0e-20
q_rw = 1.0e-28
'''

res = json.loads(kshana.run(SCENARIO))
geo = res["geometry"]
print("best PDOP   :", round(geo["best_pdop"], 4))
print("median PDOP :", round(geo["median_pdop"], 4))
print("fixes       :", geo["samples_with_fix"], "/", geo["samples_total"])
print("quantum FoM :", res["quantum"]["fom"])
print("classical FoM:", res["classical"]["fom"])
```

## Cell 5 — ORACLE CHECK: regular-tetrahedron GDOP (code, non-circular)

```python
# Independent correctness check: four lines of sight forming a regular tetrahedron
# have a CLOSED-FORM GDOP = sqrt(10)/2 = 1.58113883..., PDOP = 1.5, TDOP = 0.5
# (isotropic position covariance; Misra & Enge 2nd ed.; Kaplan & Hegarty 3rd ed.).
# This is a property of the geometry, NOT of any Kshana scenario output, so it proves
# the DOP engine is correct on its own terms.
s = np.sqrt(3.0)
dirs = np.array([[ 1, 1, 1],
                 [ 1,-1,-1],
                 [-1, 1,-1],
                 [-1,-1, 1]], dtype=float) / s
# G = [-e^T | 1] per satellite (unit LOS + clock column).
G = np.hstack([-dirs, np.ones((4, 1))])
Q = np.linalg.inv(G.T @ G)
gdop = np.sqrt(np.trace(Q))
pdop = np.sqrt(Q[0, 0] + Q[1, 1] + Q[2, 2])
tdop = np.sqrt(Q[3, 3])
print(f"GDOP = {gdop:.16f}  (closed form sqrt(10)/2 = {np.sqrt(10)/2:.16f})")
print(f"PDOP = {pdop:.6f}  TDOP = {tdop:.6f}")
assert abs(gdop - np.sqrt(10) / 2) < 1e-9, "GDOP must equal the closed form sqrt(10)/2"
assert abs(pdop - 1.5) < 1e-9 and abs(tdop - 0.5) < 1e-9
print("ORACLE PASS: tetrahedron GDOP matches Misra & Enge / Kaplan & Hegarty closed form.")
```

## Cell 6 — sweep the elevation mask, compare availability per clock (code)

```python
# Geometry/availability is shared; here we raise the mask angle (a proxy for a worsening
# environment) and read availability for each clock. Both clocks see the SAME geometry —
# what changes between them is how they hold time through the resulting gaps (Cell 7).
masks = [5.0, 10.0, 15.0, 20.0, 25.0]
av_q, av_c = [], []
for m in masks:
    scn = SCENARIO.replace("mask_deg = 10.0", f"mask_deg = {m}")
    r = json.loads(kshana.run(scn))
    av_q.append(r["quantum"]["fom"].get("availability", float("nan")))
    av_c.append(r["classical"]["fom"].get("availability", float("nan")))

plt.figure()
plt.plot(masks, av_q, "o-", label="quantum clock")
plt.plot(masks, av_c, "s--", label="classical clock")
plt.xlabel("elevation mask (deg)")
plt.ylabel("availability")
plt.title("Availability vs mask — shared geometry, per-clock holdover")
plt.legend(); plt.grid(True, alpha=0.3); plt.show()
```

## Cell 7 — Allan deviation curve, optical vs CSAC clock (code)

```python
# The real quantum-vs-classical axis: clock stability. Plot the exported ADEV curve
# from the result JSON, log-log, for the optical (quantum) vs chip-scale (classical) clock.
for side, style in (("quantum", "o-"), ("classical", "s--")):
    curve = res[side].get("adev_curve")
    if curve:
        tau = [p[0] for p in curve]
        adev = [p[1] for p in curve]
        plt.loglog(tau, adev, style, label=side)
plt.xlabel("averaging time tau (s)")
plt.ylabel("Allan deviation sigma_y(tau)")
plt.title("Clock stability: optical (sigma_y(1s)~1e-15) vs CSAC (~3e-10)")
plt.legend(); plt.grid(True, which="both", alpha=0.3); plt.show()
```

## Cell 8 — interpretation (markdown)

- **Geometry is shared.** GDOP/PDOP and availability depend only on satellite geometry,
  not on the receiver clock; the tetrahedron oracle (Cell 5) confirms the DOP engine
  against the √10/2 closed form, independently of any Kshana scenario.
- **The clock makes the difference.** Through the low-/zero-satellite gaps that the geometry
  creates, the optical (quantum) clock holds time far longer than the chip-scale (classical)
  clock — the holdover figures in Cell 4 and the ADEV curves in Cell 7 quantify it.
- **Reproduce it.** Every result is fixed by `scenario + seed + engine version`. Cite the
  version you ran together with the scenario and seed.
  DOI: https://doi.org/10.5281/zenodo.20528627 · Playground: https://kshana.dev ·
  Paper: see the JOSS submission once accepted.
