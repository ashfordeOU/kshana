# SPDX-License-Identifier: AGPL-3.0-only
"""B2 referee location metrics: the independent oracle.

Writes the truth set into tests/fixtures/referee_location/ and computes every metric with
GeographicLib's Python package (geodesics) and numpy only. It shares no code with the engine.
Run from the repository root:  python3 -I xval/referee-location/oracle.py
The definitions are the pre-registration's (docs/design/evidence/b2-referee-metrics/) and the
readings in this directory's README.md.
"""
import gzip
import json
import math
import os
import sys

import numpy as np
from geographiclib.geodesic import Geodesic

G = Geodesic.WGS84
A = 6378137.0
F = 1 / 298.257223563
E2 = F * (2 - F)
E = math.sqrt(E2)
T0 = 1_780_000_000.0
GUARD = 60.0
HOLD = 30.0
RADII = [100.0, 500.0, 1000.0, 5000.0]
LEVELS = [0.5, 0.9, 0.95]
OUT = "tests/fixtures/referee_location"


def chi2(p):
    return -2.0 * math.log(1.0 - p)


# ---------------------------------------------------------------- frames
def geodetic_to_ecef(lat, lon, h):
    la, lo = math.radians(lat), math.radians(lon)
    n = A / math.sqrt(1 - E2 * math.sin(la) ** 2)
    return np.array([(n + h) * math.cos(la) * math.cos(lo),
                     (n + h) * math.cos(la) * math.sin(lo),
                     (n * (1 - E2) + h) * math.sin(la)])


def ecef_to_geodetic(x):
    p = math.hypot(x[0], x[1])
    lon = math.degrees(math.atan2(x[1], x[0]))
    lat = math.atan2(x[2], p * (1 - E2))
    for _ in range(50):
        n = A / math.sqrt(1 - E2 * math.sin(lat) ** 2)
        h = p / math.cos(lat) - n
        new = math.atan2(x[2], p * (1 - E2 * n / (n + h)))
        if abs(new - lat) < 1e-15:
            lat = new
            break
        lat = new
    n = A / math.sqrt(1 - E2 * math.sin(lat) ** 2)
    h = p / math.cos(lat) - n
    return math.degrees(lat), lon, h


def enu(origin, point):
    """East, north, up of `point` in the local frame at `origin` ((lat, lon, h) tuples)."""
    la, lo = math.radians(origin[0]), math.radians(origin[1])
    d = geodetic_to_ecef(*point) - geodetic_to_ecef(*origin)
    r = np.array([[-math.sin(lo), math.cos(lo), 0.0],
                  [-math.sin(la) * math.cos(lo), -math.sin(la) * math.sin(lo), math.cos(la)],
                  [math.cos(la) * math.cos(lo), math.cos(la) * math.sin(lo), math.sin(la)]])
    return r @ d


def offset(origin, east, north):
    """The point at height `origin[2]`... whose (east, north) in the frame at `origin` are given,
    found by Newton iteration on latitude and longitude."""
    lat, lon = origin[0], origin[1]
    for _ in range(30):
        e, n, _ = enu(origin, (lat, lon, origin[2]))
        de, dn = east - e, north - n
        if abs(de) < 1e-12 and abs(dn) < 1e-12:
            break
        m_per_deg_lat = math.pi / 180 * A * (1 - E2) / (1 - E2 * math.sin(math.radians(lat)) ** 2) ** 1.5
        m_per_deg_lon = math.pi / 180 * A * math.cos(math.radians(lat)) / math.sqrt(1 - E2 * math.sin(math.radians(lat)) ** 2)
        lat += dn / m_per_deg_lat
        lon += de / m_per_deg_lon
    return lat, lon


def dist(a, b):
    return G.Inverse(a[0], a[1], b[0], b[1])["s12"]


# ---------------------------------------------------------------- truth
def truth_at(ev, t):
    if "position" in ev:
        p = ev["position"]
        return (p["lat"], p["lon"], p.get("h", 0.0))
    tr = ev["track"]
    if t < tr[0]["t"] or t > tr[-1]["t"]:
        return None
    for a, b in zip(tr, tr[1:]):
        if a["t"] <= t <= b["t"]:
            w = 0.0 if b["t"] == a["t"] else (t - a["t"]) / (b["t"] - a["t"])
            xa = geodetic_to_ecef(a["lat"], a["lon"], a.get("h", 0.0))
            xb = geodetic_to_ecef(b["lat"], b["lon"], b.get("h", 0.0))
            return ecef_to_geodetic(xa + w * (xb - xa))
    return None


def truth_has_h(ev):
    if "position" in ev:
        return "h" in ev["position"]
    return all("h" in p for p in ev["track"])


def truth_for_choice(ev, t):
    p = truth_at(ev, t)
    if p is not None:
        return p
    tr = ev["track"]
    q = min(tr, key=lambda x: abs(x["t"] - t))
    return (q["lat"], q["lon"], q.get("h", 0.0))


# ---------------------------------------------------------------- regions
def ellipse_contains(reg, truth, level):
    c = reg["ellipse"]
    centre = (c["lat"], c["lon"], c.get("h", 0.0))
    s = np.array(c["cov_en"], dtype=float)
    d = enu(centre, truth)[:2]
    q = float(d @ np.linalg.solve(s, d))
    return q <= chi2(level), q


def ellipse_area(reg, level):
    s = np.array(reg["ellipse"]["cov_en"], dtype=float)
    return math.pi * math.sqrt(float(np.linalg.det(s))) * chi2(level)


def polygon_plane(reg):
    v = reg["polygon"]
    lat0 = v[0][0]
    lons = [v[0][1]]
    for la, lo in v[1:]:
        while lo - lons[0] > 180:
            lo -= 360
        while lo - lons[0] < -180:
            lo += 360
        lons.append(lo)
    origin = (sum(p[0] for p in v) / len(v), sum(lons) / len(lons), 0.0)
    pts = [enu(origin, (la, lo, 0.0))[:2] for la, lo in v]
    return origin, pts


def polygon_contains(reg, truth):
    origin, pts = polygon_plane(reg)
    x, y = enu(origin, truth)[:2]
    n = len(pts)
    for i in range(n):
        a, b = pts[i], pts[(i + 1) % n]
        ab = b - a
        t = max(0.0, min(1.0, float(np.dot([x - a[0], y - a[1]], ab) / np.dot(ab, ab))))
        if math.hypot(x - (a[0] + t * ab[0]), y - (a[1] + t * ab[1])) <= 1e-6:
            return True
    inside = False
    for i in range(n):
        a, b = pts[i], pts[(i + 1) % n]
        if (a[1] > y) != (b[1] > y):
            xc = a[0] + (y - a[1]) * (b[0] - a[0]) / (b[1] - a[1])
            if x < xc:
                inside = not inside
    return inside


def polygon_area(reg):
    _, pts = polygon_plane(reg)
    s = 0.0
    for i in range(len(pts)):
        a, b = pts[i], pts[(i + 1) % len(pts)]
        s += a[0] * b[1] - b[0] * a[1]
    return abs(s) / 2


def q_auth(phi):
    s = math.sin(phi)
    return s / (1 - E2 * s * s) + math.log((1 + E * s) / (1 - E * s)) / (2 * E)


def cell_area(i, j, c):
    p1, p2 = math.radians(i * c), math.radians((i + 1) * c)
    return A * A * (1 - E2) * math.radians(c) * (q_auth(p2) - q_auth(p1)) / 2


def norm_lon(lon):
    x = (lon + 180.0) % 360.0 - 180.0
    return x


def grid_contains(reg, truth):
    g = reg["grid"]
    c = g["cell_deg"]
    i = math.floor(truth[0] / c)
    j = math.floor(norm_lon(truth[1]) / c)
    return [i, j] in [list(x) for x in g["cells"]]


def grid_area(reg):
    g = reg["grid"]
    return sum(cell_area(i, j, g["cell_deg"]) for i, j in g["cells"])


def region_eval(reg, truth):
    lv = reg["level"]
    if "ellipse" in reg:
        inside, _ = ellipse_contains(reg, truth, lv)
        return "ellipse", inside, ellipse_area(reg, lv)
    if "polygon" in reg:
        return "polygon", polygon_contains(reg, truth), polygon_area(reg)
    return "grid", grid_contains(reg, truth), grid_area(reg)


def check_cov(reg):
    if "ellipse" not in reg:
        return
    s = reg["ellipse"]["cov_en"]
    a, b, c, d = s[0][0], s[0][1], s[1][0], s[1][1]
    if abs(b - c) > 1e-9 * max(abs(b), abs(c), 1.0) or a <= 0 or d <= 0 or a * d - b * c <= 0:
        raise ValueError("covariance is not symmetric positive definite")


# ---------------------------------------------------------------- statistics
def pct(xs, q):
    return None if not xs else float(np.percentile(np.array(xs), q, method="linear"))


def binom_k(n, p):
    """Largest k with P(Bin(n, p) >= k) >= 0.95."""
    if n == 0:
        return 0
    logs = [math.lgamma(n + 1) - math.lgamma(i + 1) - math.lgamma(n - i + 1) + i * math.log(p) + (n - i) * math.log(1 - p)
            for i in range(n + 1)]
    m = max(logs)
    w = [math.exp(x - m) for x in logs]
    tot = sum(w)
    tail = 0.0
    best = 0
    for k in range(n, -1, -1):
        tail += w[k] / tot
        if tail >= 0.95:
            best = k
            break
    return best


# ---------------------------------------------------------------- scoring
def score(truth, reports):
    events = truth["events"]
    by_id = {e["id"]: e for e in events}
    for r in reports:
        for reg in r.get("regions", []):
            check_cov(reg)
    out_reports = []
    per_event = {e["id"]: [] for e in events}
    false_count = 0
    for k, r in enumerate(reports):
        t = r["t"]
        point = r.get("point")
        pt = None if point is None else (point["lat"], point["lon"], point.get("h"))
        ev_id = r.get("event")
        if ev_id is None:
            cands = [e for e in events if e["t_on"] - GUARD <= t <= e["t_off"] + GUARD]
            if cands:
                if pt is not None:
                    ev_id = min(cands, key=lambda e: (dist((pt[0], pt[1]), truth_for_choice(e, t)), e["id"]))["id"]
                else:
                    ev_id = min(cands, key=lambda e: (e["t_on"], e["id"]))["id"]
        rec = {"index": k, "event": ev_id, "scored": False}
        if ev_id is None:
            false_count += 1
            out_reports.append(rec)
            continue
        ev = by_id[ev_id]
        tr = truth_at(ev, t)
        if pt is not None and ev["t_on"] <= t <= ev["t_off"] and tr is not None:
            rec["scored"] = True
            rec["e_m"] = dist((pt[0], pt[1]), tr)
            rec["v_m"] = (pt[2] - tr[2]) if (pt[2] is not None and truth_has_h(ev)) else None
            regs = []
            for reg in r.get("regions", []):
                kind, inside, area = region_eval(reg, tr)
                regs.append({"level": reg["level"], "kind": kind, "contains": inside, "area_m2": area})
            rec["regions"] = regs
        out_reports.append(rec)
        per_event[ev_id].append((t, r, rec))

    def aggregate(items, ev):
        scored = [rec for _, _, rec in items if rec["scored"]]
        es = [rec["e_m"] for rec in scored]
        cov = {}
        med_area = {}
        for lv in LEVELS:
            regs = [g for rec in scored for g in rec["regions"] if g["level"] == lv]
            n = len(regs)
            h = sum(1 for g in regs if g["contains"])
            kmin = binom_k(n, lv)
            cov[str(lv)] = {"n": n, "h": h, "rate": (h / n if n else None), "k_min": kmin, "binomial_ok": (h >= kmin) if n else None}
            med_area[str(lv)] = pct([g["area_m2"] for g in regs], 50)
        res = {"n_reports": len(items), "n_scored": len(scored), "median_e_m": pct(es, 50), "p90_e_m": pct(es, 90),
               "coverage": cov, "median_area_m2": med_area}
        if ev is not None:
            ttfl = None
            for t, r, rec in sorted(items, key=lambda x: x[0]):
                if r.get("point") is not None and ev["t_on"] <= t <= ev["t_off"]:
                    ttfl = t - ev["t_on"]
                    break
            res["ttfl_s"] = ttfl
            ttl = {}
            seq = sorted([(t, rec) for t, _, rec in items if rec["scored"]], key=lambda x: x[0])
            for rad in RADII:
                ok = []
                for t, rec in seq:
                    c95 = [g for g in rec["regions"] if g["level"] == 0.95]
                    ok.append(rec["e_m"] <= rad and bool(c95) and all(g["contains"] for g in c95))
                found = None
                for i in range(len(seq)):
                    if not ok[i]:
                        continue
                    m = i
                    while m + 1 < len(seq) and ok[m + 1]:
                        m += 1
                    if seq[m][0] - seq[i][0] >= HOLD:
                        found = seq[i][0] - ev["t_on"]
                        break
                ttl[str(int(rad))] = found
            res["ttl_s"] = ttl
            res["located"] = ttfl is not None
        return res

    ev_out = []
    for e in events:
        a = aggregate(per_event[e["id"]], e)
        a["id"] = e["id"]
        ev_out.append(a)
    pooled = aggregate([x for e in events for x in per_event[e["id"]]], None)
    pooled["n_not_located"] = sum(1 for a in ev_out if not a["located"])
    pooled["ttfl_median_s"] = pct([a["ttfl_s"] for a in ev_out if a["ttfl_s"] is not None], 50)
    pooled["ttl_median_s"] = {str(int(r)): pct([a["ttl_s"][str(int(r))] for a in ev_out if a["ttl_s"][str(int(r))] is not None], 50) for r in RADII}
    span = truth["observation"]
    spans = sorted((max(span["start"], e["t_on"] - GUARD), min(span["end"], e["t_off"] + GUARD)) for e in events)
    busy = 0.0
    cur = None
    for a, b in spans:
        if b <= a:
            continue
        if cur is None or a > cur[1]:
            if cur:
                busy += cur[1] - cur[0]
            cur = [a, b]
        else:
            cur[1] = max(cur[1], b)
    if cur:
        busy += cur[1] - cur[0]
    clean = span["end"] - span["start"] - busy
    return {"schema": "kshana.referee-location-expected/1", "reports": out_reports, "events": ev_out, "pooled": pooled,
            "false_locations": {"count": false_count, "clean_s": clean, "per_hour": (false_count / (clean / 3600) if clean > 0 else None)}}


# ---------------------------------------------------------------- the truth set
def ell(lat, lon, see, snn, sen=0.0, level=0.95, h=None):
    c = {"lat": lat, "lon": lon, "cov_en": [[see, sen], [sen, snn]]}
    if h is not None:
        c["h"] = h
    return {"level": level, "ellipse": c}


def build():
    ev = []
    rep = []

    def P(lat, lon, h=None):
        p = {"lat": lat, "lon": lon}
        if h is not None:
            p["h"] = h
        return p

    # E1: the equator anchor (1113.194908 m).
    ev.append({"id": "E1", "t_on": T0 + 1000, "t_off": T0 + 2000, "position": P(0.0, 0.0)})
    rep.append({"t": T0 + 1010, "event": "E1", "point": P(0.0, 0.01)})
    # E2: ellipse anchors at the equator: Sigma = diag(100^2, 50^2), truth at (east 100, north 50) from the centre.
    ev.append({"id": "E2", "t_on": T0 + 3000, "t_off": T0 + 4000, "position": P(0.0, 1.0)})
    truth2 = (0.0, 1.0, 0.0)
    # The centre is the point from which the truth sits 100 m east and 50 m north.
    clat, clon = offset(truth2, -100.0, -50.0)
    # Check and refine: the truth's (e, n) at the centre must be (100, 50).
    for _ in range(5):
        e, n, _ = enu((clat, clon, 0.0), truth2)
        clat, clon = offset((clat, clon, 0.0), -(e - 100.0), -(n - 50.0)) if abs(e - 100) > 1e-12 or abs(n - 50) > 1e-12 else (clat, clon)
    for lv in (0.95, 0.5):
        rep.append({"t": T0 + 3010 + (0 if lv == 0.95 else 10), "event": "E2", "point": P(clat, clon),
                    "regions": [ell(clat, clon, 100.0 ** 2, 50.0 ** 2, level=lv)]})
    # Boundary pair on the east axis: q = chi2(0.95) * (1 -/+ 1e-6).
    for k, f in enumerate((1 - 1e-6, 1 + 1e-6)):
        east = 100.0 * math.sqrt(chi2(0.95) * f)
        bl, bo = offset(truth2, -east, 0.0)
        rep.append({"t": T0 + 3030 + 10 * k, "event": "E2", "point": P(bl, bo), "regions": [ell(bl, bo, 100.0 ** 2, 50.0 ** 2)]})
    # E3: across the antimeridian.
    ev.append({"id": "E3", "t_on": T0 + 5000, "t_off": T0 + 6000, "position": P(10.0, 179.999)})
    rep.append({"t": T0 + 5010, "event": "E3", "point": P(10.0, -179.999), "regions": [ell(10.0, -179.999, 300.0 ** 2, 200.0 ** 2)]})
    rep.append({"t": T0 + 5020, "event": "E3", "point": P(10.001, -179.9995),
                "regions": [{"level": 0.95, "grid": {"cell_deg": 0.5, "cells": [[20, 359], [20, -360]]}},
                            {"level": 0.9, "polygon": [[9.99, 179.99], [10.01, 179.99], [10.01, -179.99], [9.99, -179.99]]}]})
    # E4: near the pole, with a height.
    ev.append({"id": "E4", "t_on": T0 + 7000, "t_off": T0 + 8000, "position": P(89.9, 45.0, 120.0)})
    rep.append({"t": T0 + 7010, "event": "E4", "point": P(89.9, 90.0, 150.0), "regions": [ell(89.9, 90.0, 5000.0 ** 2, 5000.0 ** 2)]})
    rep.append({"t": T0 + 7020, "event": "E4", "point": P(89.95, 45.0, 100.0)})
    # E5: polygons (truth on a vertex, inside, outside) and grids (containing, not, empty, on the lower-left edge).
    ev.append({"id": "E5", "t_on": T0 + 9000, "t_off": T0 + 10000, "position": P(60.0, 25.0, 10.0)})
    sq = [[60.0, 25.0], [60.0, 25.1], [60.05, 25.1], [60.05, 25.0]]
    rep.append({"t": T0 + 9010, "event": "E5", "point": P(60.01, 25.02), "regions": [{"level": 0.95, "polygon": sq}]})
    rep.append({"t": T0 + 9020, "event": "E5", "point": P(60.01, 25.02),
                "regions": [{"level": 0.95, "polygon": [[59.9, 24.9], [59.9, 25.1], [60.1, 25.1], [60.1, 24.9]]}]})
    rep.append({"t": T0 + 9030, "event": "E5", "point": P(60.01, 25.02),
                "regions": [{"level": 0.95, "polygon": [[60.02, 25.02], [60.02, 25.05], [60.04, 25.05], [60.04, 25.02]]}]})
    rep.append({"t": T0 + 9040, "event": "E5", "point": P(60.2, 25.2),
                "regions": [{"level": 0.95, "grid": {"cell_deg": 0.5, "cells": [[120, 50], [120, 51]]}}]})
    rep.append({"t": T0 + 9050, "event": "E5", "point": P(60.2, 25.2),
                "regions": [{"level": 0.95, "grid": {"cell_deg": 0.5, "cells": [[119, 50]]}}]})
    rep.append({"t": T0 + 9060, "event": "E5", "point": P(60.2, 25.2), "regions": [{"level": 0.95, "grid": {"cell_deg": 0.5, "cells": []}}]})
    rep.append({"t": T0 + 9070, "event": "E5", "point": P(60.0, 25.0, 10.0),
                "regions": [{"level": 0.5, "grid": {"cell_deg": 0.25, "cells": [[240, 100]]}}]})
    # E6: no reports at all.
    ev.append({"id": "E6", "t_on": T0 + 11000, "t_off": T0 + 11500, "position": P(45.0, 7.0)})
    # E7: reports before onset (with an id: attributed, not scored), then a converging sequence for TTFL and TTL.
    ev.append({"id": "E7", "t_on": T0 + 12000, "t_off": T0 + 13000, "position": P(52.0, 4.5)})
    truth7 = (52.0, 4.5, 0.0)
    rep.append({"t": T0 + 11950, "event": "E7", "point": P(52.01, 4.5)})
    errs = [3000, 1500, 800, 400, 300, 90, 80, 70, 60, 50, 40, 600, 30, 20, 20, 20, 10]
    for k, er in enumerate(errs):
        la, lo = offset(truth7, 0.0, float(er))
        regs = [ell(la, lo, (er * 0.6) ** 2, (er * 0.6) ** 2)]
        if k == 7:
            regs = [ell(la, lo, 10.0, 10.0)]  # a 95 % region that misses: breaks the 100 m run
        rep.append({"t": T0 + 12020 + 10 * k, "event": "E7", "point": P(la, lo), "regions": regs})
    # E8, E9: overlapping events; unattributed reports go to the nearest truth.
    ev.append({"id": "E8", "t_on": T0 + 14000, "t_off": T0 + 15000, "position": P(40.0, -3.0)})
    ev.append({"id": "E9", "t_on": T0 + 14500, "t_off": T0 + 15500, "position": P(40.5, -3.5)})
    rep.append({"t": T0 + 14700, "point": P(40.45, -3.45)})
    rep.append({"t": T0 + 14710, "point": P(40.02, -3.01)})
    rep.append({"t": T0 + 14960, "point": P(40.0, -3.0)})  # inside both windows: nearest truth (E8)
    rep.append({"t": T0 + 15540, "point": P(40.0, -3.0)})  # only E9's guard band contains it: attributed, not scored
    rep.append({"t": T0 + 14720})  # no point: the earliest onset (E8)
    # E10: a moving source; reports inside and outside the track's time span.
    ev.append({"id": "E10", "t_on": T0 + 16000, "t_off": T0 + 17000,
               "track": [{"t": T0 + 16100, "lat": 51.0, "lon": 0.0}, {"t": T0 + 16400, "lat": 51.0, "lon": 0.3},
                         {"t": T0 + 16700, "lat": 51.2, "lon": 0.3, "h": 50.0}]})
    rep.append({"t": T0 + 16050, "event": "E10", "point": P(51.0, 0.0)})  # before the track: not scored
    rep.append({"t": T0 + 16250, "event": "E10", "point": P(51.001, 0.15), "regions": [ell(51.001, 0.15, 200.0 ** 2, 200.0 ** 2)]})
    rep.append({"t": T0 + 16550, "point": P(51.1, 0.3)})
    rep.append({"t": T0 + 16800, "event": "E10", "point": P(51.2, 0.3)})  # after the track: not scored
    # False locations: reports far from every event window.
    for k in range(4):
        rep.append({"t": T0 + 20000 + 100 * k, "point": P(30.0, 30.0)})
    # More scored cases at varied latitudes, distances and heights (to reach and exceed 40 cases).
    ev.append({"id": "E11", "t_on": T0 + 22000, "t_off": T0 + 23000, "position": P(-33.9, 151.2, 40.0)})
    for k, (dla, dlo, h) in enumerate([(0.0, 0.0, 40.0), (0.001, 0.0, 35.0), (0.0, 0.002, None), (-0.05, 0.07, 0.0),
                                       (0.3, -0.4, 500.0), (1.0, 1.0, None), (-0.0001, -0.0001, 41.0)]):
        p = P(-33.9 + dla, 151.2 + dlo, h)
        rep.append({"t": T0 + 22010 + 10 * k, "event": "E11", "point": p,
                    "regions": [ell(-33.9 + dla, 151.2 + dlo, 150.0 ** 2, 80.0 ** 2, 40.0 ** 2, level=0.9),
                                ell(-33.9 + dla, 151.2 + dlo, 150.0 ** 2, 80.0 ** 2, 40.0 ** 2, level=0.95)]})
    # Calibrated-ellipse population (R3): 10 000 reports around two fixed truths.
    rng = np.random.default_rng(20261103)
    sig = np.array([[400.0 ** 2, 120.0 * 300.0 * 0.3], [120.0 * 300.0 * 0.3, 300.0 ** 2]])
    ch = np.linalg.cholesky(sig)
    ev.append({"id": "CAL1", "t_on": T0 + 30000, "t_off": T0 + 35000, "position": P(59.4375, 24.7536, 30.0)})
    ev.append({"id": "CAL2", "t_on": T0 + 40000, "t_off": T0 + 45000, "position": P(-12.0, -77.0, 150.0)})
    for k in range(10000):
        evid, tr, t = (("CAL1", (59.4375, 24.7536, 30.0), T0 + 30000 + k) if k < 5000
                       else ("CAL2", (-12.0, -77.0, 150.0), T0 + 40000 + (k - 5000)))
        d = ch @ rng.standard_normal(2)
        la, lo = offset(tr, float(d[0]), float(d[1]))
        s = [[float(sig[0, 0]), float(sig[0, 1])], [float(sig[1, 0]), float(sig[1, 1])]]
        rep.append({"t": t, "event": evid, "point": P(la, lo, tr[2]),
                    "regions": [{"level": lv, "ellipse": {"lat": la, "lon": lo, "h": tr[2], "cov_en": s}} for lv in LEVELS]})
    truth = {"schema": "kshana.referee-location-truth/1", "guard_s": GUARD, "hold_s": HOLD, "radii_m": RADII, "levels": LEVELS,
             "observation": {"start": T0, "end": T0 + 50000}, "events": ev}
    return truth, {"schema": "kshana.referee-location-reports/1", "reports": rep}


def main():
    truth, reports = build()
    n_hand = sum(1 for r in reports["reports"] if not str(r.get("event", "")).startswith("CAL"))
    assert n_hand >= 40, n_hand
    exp = score(truth, reports["reports"])
    # The hand-worked anchors, to the digits printed in the pre-registration.
    a = exp["reports"][0]
    assert abs(a["e_m"] - 1113.194908) < 5e-7, a
    assert exp["reports"][1]["regions"][0]["contains"] is True
    assert exp["reports"][2]["regions"][0]["contains"] is False
    assert abs(exp["reports"][1]["regions"][0]["area_m2"] - 94113.705) < 5e-4
    assert exp["reports"][3]["regions"][0]["contains"] is True and exp["reports"][4]["regions"][0]["contains"] is False
    degenerate = {"schema": "kshana.referee-location-reports/1",
                  "reports": [{"t": T0 + 1010, "event": "E1", "point": {"lat": 0.0, "lon": 0.0},
                               "regions": [ell(0.0, 0.0, 100.0, 100.0, 100.0)]}]}
    try:
        score(truth, degenerate["reports"])
        raise SystemExit("the degenerate covariance was not refused")
    except ValueError:
        pass
    os.makedirs(OUT, exist_ok=True)
    for name, doc in [("truth_v1.json", truth), ("reports_v1.json.gz", reports), ("reports_degenerate_v1.json", degenerate),
                      ("expected_v1.json.gz", exp)]:
        text = json.dumps(doc, separators=(",", ":"), allow_nan=False) + "\n"
        path = os.path.join(OUT, name)
        if name.endswith(".gz"):
            # mtime 0 and no file name in the header: the same input gives the same bytes.
            with open(path, "wb") as raw, gzip.GzipFile(filename="", mode="wb", fileobj=raw, mtime=0, compresslevel=9) as f:
                f.write(text.encode())
        else:
            with open(path, "w") as f:
                f.write(text)
    cal = [e for e in exp["events"] if e["id"].startswith("CAL")]
    print(f"hand-placed reports: {n_hand}; calibrated: {len(reports['reports']) - n_hand}")
    for lv in LEVELS:
        h = sum(e["coverage"][str(lv)]["h"] for e in cal)
        n = sum(e["coverage"][str(lv)]["n"] for e in cal)
        print(f"calibrated coverage at {lv}: {h}/{n} = {h / n:.4f}")
    print("false locations:", exp["false_locations"])


if __name__ == "__main__":
    sys.exit(main())
