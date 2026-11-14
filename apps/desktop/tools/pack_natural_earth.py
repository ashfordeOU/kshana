#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Pack Natural Earth land polygons into the Desktop map's compact base layers.

Natural Earth (https://www.naturalearthdata.com) is in the public domain. Download the
GeoJSON layers into a fresh, empty directory and pass their paths; this script reads
them as data and writes apps/desktop/shell/data/land-<scale>.json:

    python3 -I apps/desktop/tools/pack_natural_earth.py --scale 110m --quantum 0.01 \
        --tolerance 0 ne_110m_land.geojson apps/desktop/shell/data/land-110m.json

Format "kshana-land/1": {format, source, version, scale, quantum, rings} where each ring
is a flat list of integers [x0, y0, dx1, dy1, ...]: the first vertex in units of
`quantum` degrees (longitude, latitude), then the change from the previous vertex.
Rings are simplified with the Ramer-Douglas-Peucker rule at `tolerance` degrees (0
keeps every vertex), then rings smaller than two quanta across are dropped. The same
input and options give the same bytes.
"""
import argparse
import json


def rdp(pts, eps):
    """Ramer-Douglas-Peucker simplification of an open polyline, iterative."""
    if eps <= 0 or len(pts) < 3:
        return pts
    keep = [False] * len(pts)
    keep[0] = keep[-1] = True
    stack = [(0, len(pts) - 1)]
    while stack:
        a, b = stack.pop()
        ax, ay = pts[a]
        bx, by = pts[b]
        dx, dy = bx - ax, by - ay
        n2 = dx * dx + dy * dy
        best, idx = -1.0, -1
        for i in range(a + 1, b):
            px, py = pts[i]
            if n2 == 0:
                d = (px - ax) ** 2 + (py - ay) ** 2
            else:
                t = ((px - ax) * dx + (py - ay) * dy) / n2
                t = max(0.0, min(1.0, t))
                qx, qy = ax + t * dx, ay + t * dy
                d = (px - qx) ** 2 + (py - qy) ** 2
            if d > best:
                best, idx = d, i
        if idx >= 0 and best > eps * eps:
            keep[idx] = True
            stack.append((a, idx))
            stack.append((idx, b))
    return [p for p, k in zip(pts, keep) if k]


def rings_of(geom):
    t = geom["type"]
    if t == "Polygon":
        return geom["coordinates"]
    if t == "MultiPolygon":
        return [r for poly in geom["coordinates"] for r in poly]
    return []


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--scale", required=True)
    ap.add_argument("--quantum", type=float, required=True)
    ap.add_argument("--tolerance", type=float, default=0.0)
    ap.add_argument("--version", default="")
    ap.add_argument("src")
    ap.add_argument("out")
    a = ap.parse_args()
    with open(a.src, encoding="utf-8") as f:
        fc = json.load(f)
    q = a.quantum
    rings = []
    for feat in fc["features"]:
        for ring in rings_of(feat["geometry"]):
            pts = [(float(p[0]), float(p[1])) for p in ring]
            if len(pts) > 3 and pts[0] == pts[-1]:
                # Simplify the closed ring as two halves so the closing vertex stays.
                mid = len(pts) // 2
                pts = rdp(pts[: mid + 1], a.tolerance)[:-1] + rdp(pts[mid:], a.tolerance)
            ints = []
            for x, y in pts:
                ix, iy = round(x / q), round(y / q)
                if ints and ints[-1] == (ix, iy):
                    continue
                ints.append((ix, iy))
            if len(ints) < 4:
                continue
            xs = [p[0] for p in ints]
            ys = [p[1] for p in ints]
            if max(xs) - min(xs) < 2 and max(ys) - min(ys) < 2:
                continue
            flat = [ints[0][0], ints[0][1]]
            for (x0, y0), (x1, y1) in zip(ints, ints[1:]):
                flat += [x1 - x0, y1 - y0]
            rings.append(flat)
    out = {
        "format": "kshana-land/1",
        "source": f"Natural Earth {a.scale} land (public domain), naturalearthdata.com",
        "version": a.version,
        "scale": a.scale,
        "quantum": q,
        "tolerance": a.tolerance,
        "rings": rings,
    }
    with open(a.out, "w", encoding="utf-8") as f:
        json.dump(out, f, separators=(",", ":"))
        f.write("\n")
    print(a.out, len(rings), "rings", sum(len(r) // 2 for r in rings), "vertices")


if __name__ == "__main__":
    main()
