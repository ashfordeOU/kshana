#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Extract the L1/E1 gain curves of Montenbruck et al. (2023), J. Geod. 97:96 (CC BY 4.0),
Fig. 3 (transmit, azimuth-averaged, six blocks) and Fig. 4 (GENESIS receive antenna) from the
PDF's vector drawing, as pre-registered in tests/earth_gnss_measured_montenbruck_oracle.rs.

Each curve is a filled outline of a stroked line (matplotlib colour tab:blue). Its centre line
is the mid-point between the upper and lower outline edges at each abscissa (outline flattened,
cubic segments subdivided 32 times). Axes: x from the panel frame (Fig. 3 -30 and +30 deg,
Fig. 4 -90 and +90 deg; the interior vertical grid lines are checked against it); y from the
bottom frame (-10 dB) and the grid line at +10 dB (Fig. 3) or the frame top +10 dB (Fig. 4), the
remaining frame or grid line checked. The halves are averaged where both exist. Where a curve
leaves the panel the PDF still holds its path (hidden by the clip) and that path is used; angles
with no path at all would be written as -100 dB, which no link can track (not counted).

Requires PyMuPDF. Usage: extract_patterns.py /path/to/Montenbruck2023-GENESIS-visibility.pdf
"""
import hashlib
import json
import sys
from pathlib import Path

import pymupdf

SHA256 = "54190fa8ea923966f86c1cb53a8444d989d930435d6c0720337f0b95f76d50ba"
BLUE = (0.1216, 0.4667, 0.7059)
FIG3_NAMES = ["GPS IIR-A", "GPS IIR-B/M", "GPS IIF", "GPS III", "Galileo IOV", "Galileo FOC"]


def is_colour(c, ref, tol=0.01):
    return c is not None and all(abs(a - b) < tol for a, b in zip(c, ref))


def outline_segments(d):
    segs = []
    for it in d["items"]:
        if it[0] == "l":
            segs.append((it[1], it[2]))
        elif it[0] == "c":
            p0, p1, p2, p3 = it[1:5]
            prev = p0
            for k in range(1, 33):
                t = k / 32
                x = ((1 - t) ** 3 * p0.x + 3 * (1 - t) ** 2 * t * p1.x + 3 * (1 - t) * t * t * p2.x
                     + t ** 3 * p3.x)
                y = ((1 - t) ** 3 * p0.y + 3 * (1 - t) ** 2 * t * p1.y + 3 * (1 - t) * t * t * p2.y
                     + t ** 3 * p3.y)
                segs.append((prev, pymupdf.Point(x, y)))
                prev = pymupdf.Point(x, y)
        elif it[0] == "re":
            r = it[1]
            pts = [r.tl, r.tr, r.br, r.bl, r.tl]
            segs += list(zip(pts[:-1], pts[1:]))
    return segs


def centre_y(segs, x):
    ys = []
    for a, b in segs:
        if (a.x - x) * (b.x - x) < 0 or (a.x == x and b.x != x):
            ys.append(a.y + (b.y - a.y) * (x - a.x) / (b.x - a.x))
    if len(ys) < 2:
        return None
    ys.sort()
    mids = [(ys[i] + ys[i + 1]) / 2 for i in range(0, len(ys) - 1, 2)]
    return sum(mids) / len(mids)


def curve(segs, x_of, y_of, lo, hi, step):
    """Gain at |angle| from 0 to hi, averaging the mirrored halves."""
    out = []
    n = int(round(hi / step))
    for k in range(n + 1):
        a = k * step
        vals = []
        for sgn in (-1, 1):
            if a == 0 and sgn == 1:
                continue
            yy = centre_y(segs, x_of(sgn * a))
            if yy is not None:
                vals.append(y_of(yy))
        out.append([a, round(sum(vals) / len(vals), 4) if vals else -100.0])
    return out


def frames(page, x_max):
    """Black stroked frame rectangles (left, top, right, bottom) of the panels left of x_max."""
    lines = [d["rect"] for d in page.get_drawings()
             if d["type"] == "s" and d.get("color") is not None and max(d["color"]) < 0.01]
    verts = sorted({(round(r.x0, 2), round(r.y0, 2), round(r.y1, 2)) for r in lines
                    if abs(r.x1 - r.x0) < 0.01 and r.x1 < x_max})
    panels = {}
    for x, y0, y1 in verts:
        panels.setdefault((y0, y1), []).append(x)
    return [(min(xs), y0, max(xs), y1) for (y0, y1), xs in sorted(panels.items()) if len(xs) >= 2]


def main():
    pdf = Path(sys.argv[1])
    digest = hashlib.sha256(pdf.read_bytes()).hexdigest()
    if digest != SHA256:
        raise SystemExit(f"unexpected copy {digest}")
    doc = pymupdf.open(pdf)
    result = {"source_sha256": digest, "transmit_l1_e1": {}, "checks": {}}
    # Fig. 3, page 5, left column.
    p = doc[4]
    blues = sorted((d for d in p.get_drawings() if d["type"] == "f"
                    and is_colour(d.get("fill"), BLUE) and len(d["items"]) > 50
                    and d["rect"].x1 < 320), key=lambda d: d["rect"].y0)
    panels = [f for f in frames(p, 310) if f[2] - f[0] > 200]
    if len(blues) != 6 or len(panels) != 6:
        raise SystemExit(f"found {len(blues)} curves and {len(panels)} panels")
    grey = [d["rect"] for d in p.get_drawings() if d["type"] == "s"
            and is_colour(d.get("color"), (0.69, 0.69, 0.69))]
    for name, d, (x0, y0, x1, y1) in zip(FIG3_NAMES, blues, panels):
        x_of = lambda a, x0=x0, x1=x1: x0 + (a + 30.0) / 60.0 * (x1 - x0)
        hgrid = [r.y0 for r in grey if abs(r.y1 - r.y0) < 0.01 and y0 + 1 < r.y0 < y1 - 1
                 and r.x0 > x0 - 1 and r.x1 < x1 + 1]
        if len(hgrid) != 1:
            raise SystemExit(f"{name}: {len(hgrid)} interior horizontal grid lines")
        g10 = hgrid[0]
        y_of = lambda yy, y1=y1, g10=g10: -10.0 + (y1 - yy) / (y1 - g10) * 20.0
        vgrid = sorted(r.x0 for r in grey if abs(r.x1 - r.x0) < 0.01 and x0 + 1 < r.x0 < x1 - 1)
        result["checks"][name] = {
            "top_frame_db": y_of(y0),
            "vertical_grid_deg": [round((v - x0) / (x1 - x0) * 60 - 30, 4) for v in vgrid],
        }
        result["transmit_l1_e1"][name] = curve(outline_segments(d), x_of, y_of, -30, 30, 0.25)
    # Fig. 4, page 7.
    p = doc[6]
    blues = [d for d in p.get_drawings() if d["type"] == "f" and is_colour(d.get("fill"), BLUE)
             and len(d["items"]) > 30]
    panels = [f for f in frames(p, 300) if f[2] - f[0] > 150]
    if len(blues) != 1 or len(panels) != 1:
        raise SystemExit(f"Fig. 4: {len(blues)} curves, {len(panels)} panels")
    x0, y0, x1, y1 = panels[0]
    x_of = lambda a: x0 + (a + 90.0) / 180.0 * (x1 - x0)
    y_of = lambda yy: -10.0 + (y1 - yy) / (y1 - y0) * 20.0
    grey = [d["rect"] for d in p.get_drawings() if d["type"] in ("s", "f")
            and is_colour(d.get("color") or d.get("fill"), (0.69, 0.69, 0.69))]
    result["checks"]["Fig. 4"] = {
        "vertical_grid_deg": sorted(round((r.x0 + r.x1) / 2 - x0, 3) / (x1 - x0) * 180 - 90
                                    for r in grey if r.width < 1 and r.height > 50),
    }
    result["receive_l1_e1"] = curve(outline_segments(blues[0]), x_of, y_of, -90, 90, 0.25)
    out = Path(__file__).with_name("patterns.json")
    out.write_text(json.dumps(result, indent=1) + "\n")
    print(json.dumps(result["checks"], indent=1))


if __name__ == "__main__":
    main()
