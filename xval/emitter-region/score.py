#!/usr/bin/env python3
"""Score `kshana interference-map locate` outputs against the Jammertest 2025 plan, exactly as sections 5 to 7 of
docs/emitter-region/PREREGISTRATION.md define. Nothing here is tuned; the bars are constants below.

  python3 -I score.py --plan-dir <dir with plan-*.json> --geojson <emitter-...geojson> --source adsb|ais [--json]

The summary and the GeoJSON of one run are read; the plan files are checked against the SHA-256 of
xval/jammertest-plan/MANIFEST.tsv before use.
"""
import argparse, datetime as dt, hashlib, json, math, os, sys
from math import comb

TRUTH = {1: (69.2788429, 16.0060623), 2: (69.2225166, 15.9334241)}  # SENDER, ORIG (Appendix A, Table 1)
DAYS = ["plan-monday-2025-09-15.json", "plan-tuesday-2025-09-16.json", "plan-wednesday-2025-09-17.json",
        "plan-thursday-2025-09-18.json", "plan-friday-2025-09-19.json"]
MIN_N = 4
MAX_UNCONSTRAINED = 0.5
D_KM = {"adsb": None, "ais": None}  # filled from the pre-registration constants below
D_KM.update(json.loads(os.environ.get("EMITTER_D_KM", "null") or "null") or {})
MANIFEST = {
    "plan-monday-2025-09-15.json": "9cb36dbd6d519c2c6f1f9b2b29ac43cb2d7415ab26e9171dc06e3ff0bad2b5fa",
    "plan-tuesday-2025-09-16.json": "105a3cb5f519d1e2a1a8d1e220dec7d1c44fc9060d7db6eadb7d3b91b894d173",
    "plan-wednesday-2025-09-17.json": "ffbfec5b5cbae0202e7f568f708effc1549028c0a531beaa8c04992e8bc16714",
    "plan-thursday-2025-09-18.json": "64d8608e8b68dca70fb8cf2350b0770ee54d173ed6af5f9e12a4496f6ce7b1b8",
    "plan-friday-2025-09-19.json": "bb10ae59b58674fc14fd1aa7b4ef2b1ff14626808a7c590a9bd10bd38c4880a5",
}


def k_of_n(n):
    """The largest k with P(Bin(n, 0.95) >= k) >= 0.95."""
    return max(k for k in range(n + 1) if sum(comb(n, i) * 0.95**i * 0.05 ** (n - i) for i in range(k, n + 1)) >= 0.95)


def utc(s):  # local wall-clock to UTC (CEST, minus 2 h)
    return (dt.datetime.fromisoformat(s) - dt.timedelta(hours=2)).replace(tzinfo=dt.timezone.utc).timestamp()


def parse_min(s):  # 2025-09-16T12:30Z
    return dt.datetime.strptime(s, "%Y-%m-%dT%H:%MZ").replace(tzinfo=dt.timezone.utc).timestamp()


def slots(plan_dir):
    out = []
    for f in DAYS:
        raw = open(os.path.join(plan_dir, f), "rb").read()
        if hashlib.sha256(raw).hexdigest() != MANIFEST[f]:
            sys.exit(f"{f}: SHA-256 differs from the pinned manifest")
        for L in json.loads(raw)["locations"]:
            if L["location_id"] not in TRUTH:
                continue
            for t in L["tests"]:
                if t["test_id"].split(".")[0] == "1":
                    out.append((utc(t["start_time"]), utc(t["end_time"]), L["location_id"]))
    return sorted(out)


def windows(sl):
    m = []
    for a, b, _ in sl:
        if m and a - m[-1][1] <= 1800:
            m[-1][1] = max(m[-1][1], b)
        else:
            m.append([a, b])
    return m


def pip(ring_sets, lat, lon):
    inside = False
    for ring in ring_sets:
        for i in range(len(ring) - 1):
            a, b = ring[i], ring[i + 1]
            if (a[1] > lat) != (b[1] > lat) and lon < (b[0] - a[0]) * (lat - a[1]) / (b[1] - a[1]) + a[0]:
                inside = not inside
    return inside


def contains(geo, session, level, lat, lon):
    for f in geo["features"]:
        p = f["properties"]
        if p["kind"] == "estimated_emitter_region" and p["session"] == session and p["confidence"] == level:
            for poly in f["geometry"]["coordinates"]:
                if pip(poly, lat, lon):
                    return True
    return False


def hav(a, b):
    p = math.pi / 180
    x = math.sin((b[0] - a[0]) * p / 2) ** 2 + math.cos(a[0] * p) * math.cos(b[0] * p) * math.sin((b[1] - a[1]) * p / 2) ** 2
    return 2 * 6371.0088 * math.asin(math.sqrt(x))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--plan-dir", required=True)
    ap.add_argument("--geojson", required=True)
    ap.add_argument("--source", required=True, choices=["adsb", "ais"])
    ap.add_argument("--d-km", type=float, required=True)
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args()
    geo = json.load(open(a.geojson))
    member = geo["kshana_emitter_region"]
    sl = slots(a.plan_dir)
    wins = windows(sl)
    rows = []
    unscheduled = 0
    for s in member["sessions"]:
        t0, t1 = parse_min(s["start_utc"]), parse_min(s["end_utc"])
        dur = max(t1 - t0, 60.0)
        inside = sum(max(0.0, min(t1, b) - max(t0, a_)) for a_, b in wins)
        if t1 - t0 < 60.0:
            inside = 60.0 if any(a_ <= t0 <= b for a_, b in wins) else 0.0
        if inside / dur < 0.5:
            unscheduled += 1
            continue
        areas = sorted({ar for (sa, sb, ar) in sl if sb > t0 and sa < t1})
        pts = [TRUTH[ar] for ar in areas]
        row = {"session": s["session"], "start_utc": s["start_utc"], "end_utc": s["end_utc"], "areas": areas,
               "status": s["status"], "affected_distinct": s["affected_distinct"]}
        for lvl in (0.5, 0.9, 0.95):
            row[f"hit_{int(lvl * 100)}"] = all(contains(geo, s["session"], lvl, la, lo) for la, lo in pts)
        mean = (sum(p[0] for p in pts) / len(pts), sum(p[1] for p in pts) / len(pts))
        if s["centroid"]:
            c = (s["centroid"]["lat"], s["centroid"]["lon"])
            row["centroid_error_km"] = round(hav(c, mean), 1)
            row["centroid_to_area_km"] = {str(ar): round(hav(c, TRUTH[ar]), 1) for ar in areas}
        am = s.get("affected_mean_position")
        if am:
            row["naive_mean_error_km"] = round(hav((am["lat"], am["lon"]), mean), 1)
        row["area95_km2"] = next(r["area_km2"] for r in s["regions"] if r["confidence"] == 0.95)
        rows.append(row)
    n = len(rows)
    h = sum(r["hit_95"] for r in rows)
    unc = sum(r["status"] == "unconstrained" for r in rows)
    errs = sorted(r["centroid_error_km"] for r in rows if "centroid_error_km" in r)
    med = errs[len(errs) // 2] if len(errs) % 2 else (errs[len(errs) // 2 - 1] + errs[len(errs) // 2]) / 2 if errs else None
    res = {"source": a.source, "windows": [(dt.datetime.fromtimestamp(x, dt.timezone.utc).strftime("%Y-%m-%dT%H:%MZ"),
                                           dt.datetime.fromtimestamp(y, dt.timezone.utc).strftime("%Y-%m-%dT%H:%MZ")) for x, y in wins],
           "published_sessions": len(member["sessions"]), "scheduled_sessions_n": n, "unscheduled_sessions": unscheduled,
           "sessions": rows}
    if n < MIN_N:
        res["outcome"] = "NOT ASSESSABLE"
        res["why"] = f"n = {n} scheduled sessions, fewer than {MIN_N}"
    else:
        k = k_of_n(n)
        m1, m2, m3 = h >= k, unc / n <= MAX_UNCONSTRAINED, (med is not None and med <= a.d_km)
        res.update({"hits_95": h, "k_required": k, "M1": m1, "unconstrained_share": round(unc / n, 3), "M2": m2,
                    "median_centroid_error_km": med, "D_km": a.d_km, "M3": m3,
                    "outcome": "MET" if (m1 and m2 and m3) else "NOT MET"})
    print(json.dumps(res, indent=1) if a.json else json.dumps({k: v for k, v in res.items() if k != "sessions"}, indent=1))
    if not a.json:
        for r in rows:
            print(r)


main()
