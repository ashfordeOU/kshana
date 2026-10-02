#!/usr/bin/env python3
"""Digitise the quantum-projection-noise model line (black dashed, "1/sqrt(N_at)") of
Figure 2B of Janvier et al., Phys. Rev. A 105, 022801 (2022), arXiv:2201.03345v1,
into janvier2022_fig2b_qpn_line.csv.

Usage: digitise_janvier2022_fig2b.py <arXiv 2201.03345v1 PDF>
Needs poppler-utils (pdftoppm), numpy, scipy and Pillow.

Page 2 is rendered at 600 dpi (the figure is vector). Panel B is the right-hand frame.
Axes are calibrated on the major gridlines (grey dashed): x = 1e3, 1e4, 1e5 atoms and
y = 1e2, 1e3 E. The dashed model line is drawn as dashes about 23 x 20 px at 600 dpi;
the dotted 1/N line is made of dots about 8 x 9 px and the noise-floor line is
horizontal, so the dashes are selected by size (19-28 px wide, 17-22 px high,
140-200 dark pixels). Each dash's centroid is one sample of the line.
"""
import subprocess, sys, tempfile, os
import numpy as np
from PIL import Image
from scipy import ndimage

pdf = sys.argv[1]
with tempfile.TemporaryDirectory() as d:
    subprocess.run(["pdftoppm", "-f", "2", "-l", "2", "-r", "600", "-png", pdf, os.path.join(d, "p")], check=True)
    f = [x for x in os.listdir(d) if x.endswith(".png")][0]
    a = np.asarray(Image.open(os.path.join(d, f)).convert("RGB")).astype(int)
R, G, B = a[..., 0], a[..., 1], a[..., 2]
blk = (R < 70) & (G < 70) & (B < 70)
top = blk[:2400]
cols = top.sum(0)
frame_x = [j for j in range(a.shape[1]) if cols[j] > 1000]
# Panel B is the second frame: its left and right borders are the last two groups.
groups = []
for j in frame_x:
    if groups and j - groups[-1][-1] <= 1:
        groups[-1].append(j)
    else:
        groups.append([j])
xl, xr = max(groups[-2]) + 1, min(groups[-1]) - 1
rows = blk[:2400, xl:xr].sum(1)
frame_y = [i for i in range(2400) if rows[i] > 0.9 * (xr - xl)]
yt = max(i for i in frame_y if i < 1200) + 1
yb = min(i for i in frame_y if i > 1200) - 1
gray = (abs(R - G) < 8) & (abs(G - B) < 8) & (R > 120) & (R < 215)
gc = gray[yt:yb, xl:xr].sum(0)
gx = [j + xl for j in range(xr - xl) if gc[j] > 0.6 * (yb - yt)]
gr = gray[yt:yb, xl:xr].sum(1)
gy = [i + yt for i in range(yb - yt) if gr[i] > 0.6 * (xr - xl)]
def centres(v):
    out = []
    for j in v:
        if out and j - out[-1][-1] <= 2:
            out[-1].append(j)
        else:
            out.append([j])
    return [float(np.mean(o)) for o in out]
cx = centres(gx)   # 1e3, 1e4, 1e5
cy = centres(gy)   # 1e3 (upper), 1e2 (lower)
assert len(cx) == 3 and len(cy) == 2, (cx, cy)
px_dec_x = (cx[2] - cx[0]) / 2
px_dec_y = cy[1] - cy[0]
lab, n = ndimage.label(blk[yt + 10:yb - 10, xl + 10:xr - 10])
print("# Janvier et al. PRA 105 022801 (2022) Fig. 2B, QPN model line (black dashed), per dash centroid")
print(f"# calibration px: x 1e3/1e4/1e5 = {cx[0]:.1f}/{cx[1]:.1f}/{cx[2]:.1f}; y 1e3/1e2 = {cy[0]:.1f}/{cy[1]:.1f}")
print("atom_number,sigma_gamma_zz_eotvos")
out = []
for sl, i in zip(ndimage.find_objects(lab), range(1, n + 1)):
    w = sl[1].stop - sl[1].start
    h = sl[0].stop - sl[0].start
    m = lab[sl] == i
    c = m.sum()
    if 19 <= w <= 28 and 17 <= h <= 22 and 140 <= c <= 200:
        yy, xx = np.nonzero(m)
        px = xx.mean() + sl[1].start + xl + 10
        py = yy.mean() + sl[0].start + yt + 10
        N = 10 ** (3 + (px - cx[0]) / px_dec_x)
        E = 10 ** (3 - (py - cy[0]) / px_dec_y)
        out.append((N, E))
for N, E in sorted(out):
    print(f"{N:.4e},{E:.4e}")
