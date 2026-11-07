# SPDX-License-Identifier: AGPL-3.0-only
"""B8 step 6: score the baseline against the committed ROTI labels (pre-registration section 4). Python standard
library only.

    python3 -I xval/env-baseline/score.py hours <kp file> <igs.snx.gz> > site_hours.json   (the baseline's input)
    kshana env-baseline site_hours.json > baseline.json
    python3 -I xval/env-baseline/score.py score site_hours.json baseline.json > result.json
"""
import datetime
import gzip
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))


def positions(snx):
    pos, inb = {}, False
    for l in gzip.open(snx, "rt", errors="replace"):
        if l.startswith("+SITE/ID"):
            inb = True
            continue
        if l.startswith("-SITE/ID"):
            break
        if not inb or l.startswith("*"):
            continue
        def dms(p):
            d, m, s = float(p[0]), float(p[1]), float(p[2])
            return (-1 if p[0].startswith("-") else 1) * (abs(d) + m / 60 + s / 3600)
        lo = dms(l[44:56].split())
        pos[l[1:5].upper()] = (dms(l[56:68].split()), lo - 360 if lo > 180 else lo)
    return pos


def hours(kp_file, snx):
    idx = {}
    for line in open(kp_file):
        if line.startswith("#"):
            continue
        f = line.split()
        idx["%s-%s-%s" % (f[0], f[1], f[2])] = ([float(x) for x in f[7:15]], float(f[25]))
    labels = json.load(open(os.path.join(HERE, "labels.json")))
    days = json.load(open(os.path.join(HERE, "days.json")))
    cats = {}
    for k, v in days.items():
        for x in v:
            cats.setdefault(x["date"], []).append(k)
    pos = positions(snx)
    out = []
    for key in sorted(labels):
        v = labels[key]
        if v.get("missing"):
            continue
        st, date = key.split("/")
        t = datetime.date.fromisoformat(date)
        kps, f107 = idx[date]
        lat, lon = pos[st[:4]]
        year = t.year + (t.timetuple().tm_yday - 0.5) / (366 if t.year % 4 == 0 else 365)
        for h in v["hours"]:
            if h["y"] is None:
                continue
            out.append({"station": st, "band": v["band"], "date": date, "cats": cats[date], "y": h["y"],
                        "site_hour": {"lat_deg": lat, "lon_deg": lon, "year": year, "doy": t.timetuple().tm_yday,
                                      "ut_hour": h["hour"] + 0.5, "kp": kps[h["hour"] // 3], "f107": f107}})
    return out


def auc(scores, ys):
    """Mann-Whitney AUC, ties counted half."""
    pos = [s for s, y in zip(scores, ys) if y == 1]
    neg = [s for s, y in zip(scores, ys) if y == 0]
    if not pos or not neg:
        return None
    wins = 0.0
    for p in pos:
        for n in neg:
            wins += 1.0 if p > n else 0.5 if p == n else 0.0
    return wins / (len(pos) * len(neg))


def score(meta_file, base_file):
    meta = json.load(open(meta_file))
    base = json.load(open(base_file))
    assert len(meta) == len(base)
    rows = [dict(m, b=b["b"], level=b["level"]) for m, b in zip(meta, base)]
    y1 = [r for r in rows if r["y"] == 1]
    bands_y1 = sorted({r["band"] for r in y1})
    n1 = len(y1) >= 200 and len(bands_y1) >= 2
    v1 = auc([r["b"] for r in rows], [r["y"] for r in rows])
    qm = [r for r in rows if "quiet" in r["cats"] and r["band"] == "mid"]
    v2 = sum(r["level"] == "quiet" for r in qm) / len(qm) if qm else None
    sh = [r for r in rows if "storm" in r["cats"] and r["band"] == "hi" and r["y"] == 1]
    v3 = sum(r["level"] != "quiet" for r in sh) / len(sh) if sh else None
    el = [r for r in rows if "equinox" in r["cats"] and r["band"] == "lo"]
    v4 = auc([r["b"] for r in el], [r["y"] for r in el])
    res = {
        "station_hours": len(rows), "y1": len(y1), "y1_by_band": {b: sum(r["band"] == b for r in y1) for b in ("hi", "mid", "lo")},
        "N1": {"value": len(y1), "bands": bands_y1, "met": n1},
        "V1": {"auc": v1, "met": v1 is not None and v1 >= 0.75},
        "V2": {"share_quiet": v2, "n": len(qm), "met": v2 is not None and v2 >= 0.95},
        "V3": {"share_elevated_or_disturbed": v3, "n": len(sh), "met": v3 is not None and v3 >= 0.80},
        "V4": {"auc": v4, "n": len(el), "n_y1": sum(r["y"] for r in el), "met": v4 is not None and v4 >= 0.70},
    }
    if not n1:
        res["verdict"] = "NOT ASSESSABLE"
    else:
        res["verdict"] = "MET (V5 aside)" if all(res[k]["met"] for k in ("V1", "V2", "V3", "V4")) else "NOT MET"
    return res


if __name__ == "__main__":
    if sys.argv[1] == "hours":
        rows = hours(sys.argv[2], sys.argv[3])
        json.dump([r["site_hour"] for r in rows], sys.stdout)
        json.dump(rows, open(os.path.join(os.path.dirname(sys.argv[2]), "site_hours_meta.json"), "w"))
    elif sys.argv[1] == "score":
        json.dump(score(sys.argv[2], sys.argv[3]), sys.stdout, indent=1)
        sys.stdout.write("\n")
