#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Read the Cramer-Rao lower bound (CRLB) lines of Ho and Xu (2004), Figs. 6 and 7.

Procedure fixed in the pre-registration of row M058 (tests/geolocation_crlb_published_oracle.rs)
before this script was first run:

1. Extract the embedded 600 dots-per-inch bilevel figure images with poppler's `pdfimages`:
   Fig. 6 is the page-8 image of 2030 x 1687 pixels, Fig. 7 the page-9 image of 2050 x 1694.
2. Panels and frames: rows whose dark fraction exceeds 0.6 are horizontal frame lines (two per
   panel, top and bottom); within a panel, columns holding a continuous dark run longer than
   90 % of the panel height are the vertical frame lines (left and right). [Amended after the
   first run: the first rule, a dark fraction above 0.25, also caught the steep dash-dot
   curves; no value had been read.] Each line's position is the mean of its run of
   pixels.
3. Axis calibration, one linear least-squares fit per axis: x (dB) against column on the left
   and right frame lines and the interior major tick marks (every 5 dB, drawn up from the bottom
   frame); log10(value) against row on the bottom and top frame lines and the interior decade
   tick marks (drawn right from the left frame). [Amended after the first run, before any value
   was read: the first rule (runs longer than 70 % of the longest run shorter than 3 % of the
   panel width) took a curve touching the left frame for a tick.] Major ticks are drawn on
   both opposite frame lines; they are the positions where the dark runs starting at BOTH
   lines are 10 to 25 pixels long (major ticks are about 16 pixels, minor ticks about 7). The number of interior ticks found must equal the
   number expected and every calibration residual must be at most 1.5 pixels, or the panel
   is void.
4. The solid CRLB line: in each column of the window (Fig. 6: -9 to -1 dB; Fig. 7: 10 to 19
   dB, where the dashed and dash-dot curves lie above it), the lowest dark run between 5 % of
   the panel height above the bottom frame and 5 % below the top frame; its centre row.
   [Amended after the third run: with the first margin, 3 %, the tip of the -5 dB major tick
   of Fig. 6 entered one column and the panel was voided by the residual test. That run
   printed the Fig. 6 medians, 819.8 m and 689.7 m/s at 0 dB, before this amendment; no
   Kshana value had been computed.] The
   line is straight in these coordinates with the exactly known slope 0.05 decade per dB
   (the bound scales as the noise standard deviation). The intercept is the median over
   columns of log10(value) - 0.05 x; the reading is the value at 0 dB, 10^intercept. A
   free-slope least-squares fit must give a slope within 2 % of 0.05 decade per dB and the
   residual standard deviation must be at most 1 pixel, or the panel is void.

Writes ho_xu_2004_readings.json next to this script. Usage:
    read_ho_xu_figures.py /path/to/HoXu2004-TDOA-FDOA.pdf
"""
import hashlib
import json
import subprocess
import sys
import tempfile
from pathlib import Path

import numpy as np
from PIL import Image

EXPECTED_SHA256 = "5f657bc1b60fd1770e0f2239b9ac132933d9de02afddda6d8db376b89e910bd8"
SLOPE = 0.05  # decade per dB

FIGS = {
    # name: (page, (w, h), x_min, x_max, [(panel, y_lo_decade, y_hi_decade)], window dB)
    "fig6_far_field": (8, (2030, 1687), -30.0, 0.0,
                       [("position_m", 1, 3), ("velocity_m_per_s", 1, 3)], (-9.0, -1.0)),
    "fig7_near_field": (9, (2050, 1694), -20.0, 20.0,
                        [("position_m", 0, 3), ("velocity_m_per_s", 0, 3)], (10.0, 19.0)),
}


def runs(mask_1d):
    """(start, end_exclusive) of each run of True."""
    out, start = [], None
    for i, v in enumerate(mask_1d):
        if v and start is None:
            start = i
        elif not v and start is not None:
            out.append((start, i))
            start = None
    if start is not None:
        out.append((start, len(mask_1d)))
    return out


def clusters(idx):
    """Group sorted integer indices into consecutive clusters -> (mean, first, last)."""
    out = []
    for i in idx:
        if out and i == out[-1][-1] + 1:
            out[-1].append(i)
        else:
            out.append([i])
    return [(float(np.mean(c)), c[0], c[-1]) for c in out]


def major_ticks(side_a, side_b):
    """Centres of the major tick marks: positions where the dark runs from BOTH opposite frame
    lines are 10 to 25 pixels long (major ticks are about 16 pixels at 600 dots per inch,
    minor ticks about 7), so that a curve touching one frame line is never taken for a tick."""
    keep = [k for k in side_a if 10 <= side_a[k] <= 25 and 10 <= side_b.get(k, 0) <= 25]
    return [c for c, _, _ in clusters(keep)]


def extract(pdf, page, size, tmp):
    subprocess.run(["pdfimages", "-png", "-f", str(page), "-l", str(page), str(pdf),
                    str(Path(tmp) / f"p{page}")], check=True)
    for f in sorted(Path(tmp).glob(f"p{page}-*.png")):
        im = Image.open(f)
        if im.size == size:
            return np.array(im.convert("L")) < 128
    raise SystemExit(f"no {size} image on page {page}")


def read_panel(img, top, bot, x_min, x_max, lo, hi, window):
    h = bot[0] - top[0]
    sub = img[int(top[1]):int(bot[2]) + 1, :]
    longest_run = np.array([max([e - s for s, e in runs(sub[:, c])] or [0])
                            for c in range(sub.shape[1])])
    vlines = clusters(list(np.where(longest_run > 0.9 * sub.shape[0])[0]))
    if len(vlines) != 2:
        return {"void": f"{len(vlines)} vertical frame lines"}
    left, right = vlines
    width = right[0] - left[0]
    # Interior x ticks: vertical runs going up from the bottom frame and down from the top.
    def run_from(seq):
        n = 0
        while n < len(seq) and seq[n]:
            n += 1
        return n

    cols = range(left[2] + 3, right[1] - 2)
    up = {c: run_from(img[:bot[1], c][::-1]) for c in cols}
    down = {c: run_from(img[top[2] + 1:, c]) for c in cols}
    xt = major_ticks(up, down)
    n_xt = int(round((x_max - x_min) / 5.0)) - 1
    if len(xt) != n_xt:
        return {"void": f"{len(xt)} x ticks, expected {n_xt}"}
    xs_px = [left[0]] + xt + [right[0]]
    xs_db = [x_min + 5.0 * k for k in range(n_xt + 2)]
    ax, bx = np.polyfit(xs_px, xs_db, 1)
    xres = np.array(xs_db) - (ax * np.array(xs_px) + bx)
    # Interior y ticks: horizontal runs going right from the left frame and left from the right.
    rows = range(top[2] + 3, bot[1] - 2)
    rgt = {r: run_from(img[r, left[2] + 1:]) for r in rows}
    lft = {r: run_from(img[r, :right[1]][::-1]) for r in rows}
    yt = major_ticks(rgt, lft)
    n_yt = hi - lo - 1
    if len(yt) != n_yt:
        return {"void": f"{len(yt)} y ticks, expected {n_yt}"}
    ys_px = [bot[0]] + sorted(yt, reverse=True) + [top[0]]
    ys_dec = list(range(lo, hi + 1))
    ay, by = np.polyfit(ys_px, ys_dec, 1)
    yres = np.array(ys_dec) - (ay * np.array(ys_px) + by)
    cal_res_px = max(np.max(np.abs(xres)) / abs(ax), np.max(np.abs(yres)) / abs(ay))
    if cal_res_px > 1.5:
        return {"void": f"calibration residual {cal_res_px:.2f} px"}
    # The solid line: lowest dark run in each window column.
    c0 = int(np.ceil((window[0] - bx) / ax))
    c1 = int(np.floor((window[1] - bx) / ax))
    r_hi = int(top[0] + 0.05 * h)
    r_lo = int(bot[0] - 0.05 * h)
    xs, ys = [], []
    for c in range(c0, c1 + 1):
        rr = runs(img[r_hi:r_lo + 1, c])
        if not rr:
            continue
        s, e = rr[-1]  # lowest run (largest row index)
        if e - s > 12:
            continue
        centre = r_hi + 0.5 * (s + e - 1)
        xs.append(ax * c + bx)
        ys.append(ay * centre + by)
    xs, ys = np.array(xs), np.array(ys)
    icpt = float(np.median(ys - SLOPE * xs))
    free_slope, free_icpt = np.polyfit(xs, ys, 1)
    resid_px = float(np.std(ys - (SLOPE * xs + icpt)) / abs(ay))
    out = {
        "value_at_0_db": 10 ** icpt,
        "columns_used": int(len(xs)),
        "free_slope_decade_per_db": float(free_slope),
        "line_residual_px": resid_px,
        "calibration_max_residual_px": float(cal_res_px),
        "px_per_decade": float(1.0 / abs(ay)),
        "px_per_db": float(1.0 / abs(ax)),
    }
    if abs(free_slope / SLOPE - 1.0) > 0.02:
        out["void"] = f"free slope {free_slope:.5f}"
    elif resid_px > 1.0:
        out["void"] = f"line residual {resid_px:.2f} px"
    return out


def main():
    pdf = Path(sys.argv[1])
    digest = hashlib.sha256(pdf.read_bytes()).hexdigest()
    if digest != EXPECTED_SHA256:
        raise SystemExit(f"unexpected copy: {digest}")
    result = {"source_sha256": digest, "figures": {}}
    with tempfile.TemporaryDirectory() as tmp:
        for name, (page, size, x_min, x_max, panels, window) in FIGS.items():
            img = extract(pdf, page, size, tmp)
            rowfrac = img.mean(axis=1)
            hl = clusters(list(np.where(rowfrac > 0.6)[0]))
            if len(hl) != 4:
                result["figures"][name] = {"void": f"{len(hl)} horizontal frame lines"}
                continue
            fig = {}
            for k, (pname, lo, hi) in enumerate(panels):
                fig[pname] = read_panel(img, hl[2 * k], hl[2 * k + 1], x_min, x_max, lo, hi,
                                        window)
            result["figures"][name] = fig
    out = Path(__file__).with_name("ho_xu_2004_readings.json")
    out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
