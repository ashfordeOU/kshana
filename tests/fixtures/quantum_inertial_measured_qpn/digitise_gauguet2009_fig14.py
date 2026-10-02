#!/usr/bin/env python3
"""Digitise Figure 14 of Gauguet et al., Phys. Rev. A 80, 063604 (2009),
arXiv:0907.2580v3, into gauguet2009_fig14.csv.

Usage: digitise_gauguet2009_fig14.py <arXiv 0907.2580v3 PDF>
Needs poppler-utils (pdfimages), numpy, scipy and Pillow.

The figure is the raster embedded on page 24. The measured rotation noise (blue open
squares, 70 px wide in the embedded raster) is located by its blue outline; each
square's centre is the middle of its outline's bounding box. Axes are calibrated on
the printed gridlines: x = 1e4 and 1e5 (vertical black lines), y = 1e-6 (horizontal
black line) and the frame bottom y = 1e-7. The blue circle around the operating point
merges with the square at its left edge; that square is recovered from its bottom stroke.
"""
import subprocess, sys, tempfile, os
import numpy as np
from PIL import Image
from scipy import ndimage

pdf = sys.argv[1]
with tempfile.TemporaryDirectory() as d:
    subprocess.run(["pdfimages", "-f", "24", "-l", "24", "-png", pdf, os.path.join(d, "f")], check=True)
    im = np.asarray(Image.open(os.path.join(d, "f-000.png")).convert("RGB")).astype(int)
R, G, B = im[..., 0], im[..., 1], im[..., 2]
black = (R < 60) & (G < 60) & (B < 60)
cols = black[100:2000].sum(0)
vx = [j for j in range(450, 3200) if cols[j] > 800]
x1e4 = np.mean([j for j in vx if j < 1800])
x1e5 = np.mean([j for j in vx if j >= 1800])
rows = black[:, 500:3100].sum(1)
hy = [i for i in range(100, 2050) if rows[i] > 2000]
y1e6 = np.mean(hy)
yb = [i for i in range(2050, im.shape[0]) if rows[i] > 2000]
y1e7 = np.mean(yb)
blue = (B > 150) & (R < 90) & (G < 90)
lab, _ = ndimage.label(ndimage.binary_dilation(blue, iterations=8))
pts = []
for sl in ndimage.find_objects(lab):
    w = sl[1].stop - sl[1].start - 16
    h = sl[0].stop - sl[0].start - 16
    if 60 <= w <= 80 and 55 <= h <= 80:
        cx = 0.5 * (sl[1].start + sl[1].stop)
        cy = 0.5 * (sl[0].start + sl[0].stop)
        n = 10 ** (4 + (cx - x1e4) / (x1e5 - x1e4))
        s = 10 ** (-6 - (cy - y1e6) / (y1e7 - y1e6))
        pts.append((n, s))
    elif w > 150:
        # The blue circle drawn round the operating point merges with the square at
        # its left edge. That square's bottom stroke is the only 60 px blue run that
        # starts at the component's left edge; its centre is 35 px left of the run end
        # region and 35 px above the stroke's lower edge (squares are 70 px).
        x0 = sl[1].start + 8
        rws = [r for r in range(sl[0].start, sl[0].stop) if blue[r, x0:x0 + 60].all()]
        cx = x0 + 35
        cy = max(rws) + 1 - 35
        n = 10 ** (4 + (cx - x1e4) / (x1e5 - x1e4))
        s = 10 ** (-6 - (cy - y1e6) / (y1e7 - y1e6))
        pts.append((n, s))
pts.sort()
print("# Gauguet et al. PRA 80 063604 (2009) Fig. 14, measured rotation noise at 1 s (blue squares)")
print(f"# axis calibration px: x1e4={x1e4:.1f} x1e5={x1e5:.1f} y1e-6={y1e6:.1f} y1e-7={y1e7:.1f}")
print("reduced_atom_number,rotation_noise_rad_s_per_rthz")
for n, s in pts:
    print(f"{n:.4e},{s:.4e}")
