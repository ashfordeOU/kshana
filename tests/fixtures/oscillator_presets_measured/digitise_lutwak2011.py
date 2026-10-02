#!/usr/bin/env python3
"""Digitise the SA.45s production figures of R. Lutwak, "The SA.45s Chip-Scale Atomic
Clock - Early Production Statistics", Proceedings of the 43rd Precise Time and Time
Interval (PTTI) Meeting (2011), pp. 207-219, into sa45s_lutwak2011.csv.

Usage: digitise_lutwak2011.py <Paper27.pdf from time.kinali.ch/ptti/2011papers/>
Needs poppler-utils (pdftoppm), numpy, scipy and Pillow.

Figure 8 (page 7, vector): production histograms of the Allan deviation at 1 s
(x axis 0 to 4e-10) and 10 s (x axis 0 to 12e-11). Bars are red outlines; a bin is
occupied where red is drawn in the 2-8 px band just above the x axis (600 dpi).
The scored value is the UPPER edge of the highest occupied bin; bin widths are read
from the bar edges (0.2e-10 and 1e-11).
Figure 4 (page 5, vector): the overlapping Allan deviation of a typical unit at
tau = 2^k s, k = 0..16 (the plotted octave grid); the tau = 1 s marker sits on the
frame edge and is clipped by the opening, so it is not scored (Fig. 8a covers 1 s). Dark-red markers are isolated by a
morphological opening that removes the thin connecting line and error bars; y is
calibrated on the frame (1e-12 bottom, 1e-10 top), x on the frame (1 s to 1e5 s).
"""
import subprocess, sys, tempfile, os
import numpy as np
from PIL import Image
from scipy import ndimage

pdf = sys.argv[1]
def page(n):
    with tempfile.TemporaryDirectory() as d:
        subprocess.run(["pdftoppm", "-f", str(n), "-l", str(n), "-r", "600", "-png", pdf, os.path.join(d, "p")], check=True)
        f = [x for x in os.listdir(d) if x.endswith(".png")][0]
        return np.asarray(Image.open(os.path.join(d, f)).convert("RGB")).astype(int)

def frame(blk, x0, x1, y0, y1):
    """Inner frame box (left, right, top, bottom) of the plot inside a search window."""
    sub = blk[y0:y1, x0:x1]
    cols = sub.sum(0); rows = sub.sum(1)
    cl = [j for j in range(x1 - x0) if cols[j] > 0.5 * (y1 - y0) * 0.6]
    rw = [i for i in range(y1 - y0) if rows[i] > 0.5 * (x1 - x0) * 0.6]
    return x0 + min(cl), x0 + max(cl), y0 + min(rw), y0 + max(rw)

out = []
a = page(7)
R, G, B = a[..., 0], a[..., 1], a[..., 2]
blk = (R < 90) & (G < 90) & (B < 90)
red = (R > 180) & (G < 120) & (B < 120)
for (x0, x1, xmax, tau, scale, binw, name) in [
        (120 * 6, 410 * 6, 4.0, 1.0, 1e-10, 0.2, "fig8a_worst_unit"),
        (455 * 6, 745 * 6, 12.0, 10.0, 1e-11, 1.0, "fig8b_worst_unit")]:
    L, Rt, T, Bt = frame(blk, x0, x1, 670 * 6, 885 * 6)
    band = red[Bt - 9:Bt - 2, L:Rt + 1].any(0)
    xs = [j for j in range(len(band)) if band[j]]
    v = max(xs) / (Rt - L) * xmax
    upper = np.ceil(v / binw - 1e-6) * binw  # upper edge of the bin holding the last red
    out.append((name, tau, upper * scale))
a = page(5)
R, G, B = a[..., 0], a[..., 1], a[..., 2]
blk = (R < 90) & (G < 90) & (B < 90)
L, Rt, T, Bt = frame(blk, 280 * 6, 572 * 6, 180 * 6, 370 * 6)
mark = (R > 100) & (R < 210) & (G < 50) & (B < 50)
mark = ndimage.binary_opening(mark, structure=np.ones((9, 9)))
lab, n = ndimage.label(mark)
cents = ndimage.center_of_mass(mark, lab, range(1, n + 1))
pts = []
for cy, cx in cents:
    tau = 10 ** (5 * (cx - L) / (Rt - L))
    adev = 10 ** (-10 - 2 * (cy - T) / (Bt - T))
    pts.append((tau, adev))
pts.sort()
for tau, adev in pts:
    k = round(float(np.log2(tau)))
    assert abs(np.log2(tau) - k) < 0.15, (k, tau)
    out.append(("fig4_typical_unit", float(2 ** k), adev))
print("# Lutwak, PTTI 2011, SA.45s production statistics: Fig. 8 worst delivered unit (upper bin edge) and Fig. 4 typical unit")
print("source,tau_s,adev")
for name, tau, v in out:
    print(f"{name},{tau:g},{v:.4e}")
