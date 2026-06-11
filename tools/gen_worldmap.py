#!/usr/bin/env python3
"""Generate src/worldmap.rs from tools/ne_110m_land.geojson (reproducible, bit-for-bit).

The ground-track SVG (`kshana::ephemeris::to_svg`) draws the satellite track over the
actual continents. This script turns the Natural Earth 1:110m land polygons (public
domain) into a compact, embeddable Rust constant: each landmass exterior ring is
Douglas-Peucker-simplified to ~0.55 deg and reduced to (lon, lat) f32 pairs, dropping
islands whose bounding box is smaller than ~2.3 deg (below one chart pixel). Inland
lakes/holes are dropped — only the land fill matters for the map background.

Source: Natural Earth 1:110m physical land
  https://github.com/nvkelso/natural-earth-vector  (geojson/ne_110m_land.geojson)
Natural Earth is in the public domain (no permission needed; attribution appreciated).

Usage: python3 tools/gen_worldmap.py tools/ne_110m_land.geojson src/worldmap.rs
"""
import json
import math
import sys

EPS = 0.55  # Douglas-Peucker tolerance (degrees) ~ just over one 0.5 deg/px chart pixel
MIN_SPAN = 2.3  # drop islands whose bbox is smaller than this (deg) in BOTH dimensions


def perp_dist(p, a, b):
    (px, py), (ax, ay), (bx, by) = p, a, b
    dx, dy = bx - ax, by - ay
    if dx == 0 and dy == 0:
        return math.hypot(px - ax, py - ay)
    t = ((px - ax) * dx + (py - ay) * dy) / (dx * dx + dy * dy)
    t = max(0.0, min(1.0, t))
    cx, cy = ax + t * dx, ay + t * dy
    return math.hypot(px - cx, py - cy)


def rdp(pts, eps):
    """Iterative-free recursive Douglas-Peucker line simplification."""
    if len(pts) < 3:
        return pts
    dmax, idx = 0.0, 0
    for i in range(1, len(pts) - 1):
        d = perp_dist(pts[i], pts[0], pts[-1])
        if d > dmax:
            dmax, idx = d, i
    if dmax > eps:
        return rdp(pts[: idx + 1], eps)[:-1] + rdp(pts[idx:], eps)
    return [pts[0], pts[-1]]


def main():
    src = sys.argv[1] if len(sys.argv) > 1 else "tools/ne_110m_land.geojson"
    dst = sys.argv[2] if len(sys.argv) > 2 else "src/worldmap.rs"
    data = json.load(open(src))

    rings = []
    for feat in data["features"]:
        ext = feat["geometry"]["coordinates"][0]  # exterior ring only (land fill)
        xs = [p[0] for p in ext]
        ys = [p[1] for p in ext]
        if (max(xs) - min(xs)) < MIN_SPAN and (max(ys) - min(ys)) < MIN_SPAN:
            continue
        simp = rdp(ext, EPS)
        if len(simp) < 4:
            continue
        rings.append([(round(float(x), 1), round(float(y), 1)) for x, y in simp])

    out = [
        "// SPDX-License-Identifier: Apache-2.0",
        "//! Coarse world landmass outline for the ground-track map background.",
        "//!",
        "//! AUTO-GENERATED from `tools/ne_110m_land.geojson` (Natural Earth 1:110m land,",
        "//! public domain) by `tools/gen_worldmap.py`; do not edit by hand. Each entry is",
        "//! the Douglas-Peucker-simplified exterior ring of a major landmass as (lon, lat)",
        "//! degrees — render with the same equirectangular projection as the track.",
        "",
        "/// Exterior rings of the world's major landmasses, (lon°, lat°).",
        "#[rustfmt::skip]",
        "pub static LAND: &[&[(f32, f32)]] = &[",
    ]
    for r in rings:
        inner = ", ".join(f"({x:.1f},{y:.1f})" for x, y in r)
        out.append(f"    &[{inner}],")
    out.append("];")
    open(dst, "w").write("\n".join(out) + "\n")

    pts = sum(len(r) for r in rings)
    print(f"wrote {dst}: {len(rings)} rings, {pts} points")


if __name__ == "__main__":
    main()
