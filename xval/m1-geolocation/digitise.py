#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""M1-B2: digitise the CCRLB curves of Fig. 1 of Cao et al. 2015 (CJA, doi:10.1016/j.cja.2015.08.015).

The figure raster is the paper's embedded image of page 7 (extracted with `pdfimages -f 7 -l 7 -j`); the paper is not
in this repository. Frames are found as rows and columns more than half dark; the axes are calibrated from the frame
edges and the printed limits; at each marker the curve's row is the median, over columns 11 to 16 px either side, of the
dark cluster lowest on the page (the CCRLB curve lies below the initial-estimate triangles and the Ref. 20 curve). At a
frame edge only one side exists, so the inner-side samples at 11 to 30 px are fitted with a line and extrapolated.

    python3 -I digitise.py fig-000.jpg
"""
import sys
import numpy as np
from PIL import Image

PANELS = [("a", (0.1, 1.0), (20, 65), [0.1 * k for k in range(1, 11)]),
          ("b", (10, 40), (10, 70), [10, 15, 20, 25, 30, 35, 40]),
          ("c", (0.2, 2.0), (0, 140), [0.25 * k for k in range(1, 9)])]


def clusters(rows):
    out = [[rows[0]]]
    for r in rows[1:]:
        (out[-1].append(r) if r - out[-1][-1] <= 2 else out.append([r]))
    return out


def main(path):
    dark = np.array(Image.open(path).convert("L")).astype(int) < 110
    h, w = dark.shape
    for i, (name, (xa, xb), (ya, yb), xs) in enumerate(PANELS):
        x0, x1 = i * w // 3, (i + 1) * w // 3
        sub = dark[:, x0:x1]
        rws = [r for r in range(h) if sub[r].sum() > 0.5 * (x1 - x0)]
        cls = [c + x0 for c in range(x1 - x0) if sub[:, c].sum() > 0.5 * h]
        top, bot = (rws[0] + rws[1]) / 2, (rws[-2] + rws[-1]) / 2
        xl, xr = (cls[0] + cls[1]) / 2, (cls[-2] + cls[-1]) / 2
        to_s = lambda y: ya + (bot - y) / (bot - top) * (yb - ya)
        for k, x in enumerate(xs):
            px = xl + (x - xa) / (xb - xa) * (xr - xl)
            edge = k in (0, len(xs) - 1)
            offs = (range(11, 31) if k == 0 else range(-30, -10)) if edge else [o for o in range(-16, 17) if abs(o) >= 11]
            pts = []
            for o in offs:
                c = int(round(px + o))
                col = [r for r in range(int(top) + 4, int(bot) - 4) if dark[r, c]]
                if col:
                    pts.append((c, float(np.mean(max(clusters(col), key=np.mean)))))
            if edge:
                a, b = np.polyfit(*np.array(pts).T, 1)
                y = a * px + b
            else:
                y = float(np.median([p[1] for p in pts]))
            print(f"{name},{x:g},{to_s(y):.2f}")


if __name__ == "__main__":
    main(sys.argv[1])
