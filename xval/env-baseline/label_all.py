# SPDX-License-Identifier: AGPL-3.0-only
"""B8 step 5: fetch the observation and navigation files of every station and event day (stations.json,
days.json, the 2015 days left out by reading 4), label every station-hour with roti.py, record each file's
SHA-256, and delete the files after use. Writes labels.json and MANIFEST_OBS.tsv into <work dir>.

    python3 -I xval/env-baseline/label_all.py <work dir>     (needs `hatanaka`, MIT; pip install hatanaka)
"""
import datetime
import gzip
import hashlib
import json
import os
import subprocess
import sys
import time

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import roti  # noqa: E402

BASE = "https://igs.bkg.bund.de/root_ftp/IGS"


def get(url, path):
    for i in range(12):
        r = subprocess.run(["curl", "-sS", "--fail", "--max-time", "300", "-o", path, url], capture_output=True)
        if r.returncode == 0 and os.path.getsize(path) > 1000:
            return
        time.sleep(min(60, 4 * (i + 1)))
    raise SystemExit("failed: " + url)


def gps_records(text):
    """GPS broadcast records in a RINEX 3 navigation text (record header lines starting with G)."""
    return sum(1 for l in text.splitlines() if len(l) > 8 and l[0] == "G" and l[1:3].strip().isdigit() and l[4:8].isdigit())


def best_nav(work, y, doy):
    """Reading 8: of BKG's two merged daily navigation files, the one with more GPS records (decided on the
    navigation files' own content, before any label)."""
    best = None
    for name in (f"BRDC00IGS_R_{y}{doy:03d}0000_01D_MN.rnx.gz", f"BRDC00WRD_R_{y}{doy:03d}0000_01D_MN.rnx.gz"):
        path = os.path.join(work, name)
        try:
            get(f"{BASE}/BRDC/{y}/{doy:03d}/{name}", path)
        except SystemExit:
            continue
        raw = open(path, "rb").read()
        os.remove(path)
        n = gps_records(gzip.decompress(raw).decode("latin1"))
        if best is None or n > best[2]:
            best = (name, raw, n)
    if best is None:
        raise SystemExit(f"no navigation file for {y}/{doy:03d}")
    print(f"nav {y}/{doy:03d}: {best[0]} ({best[2]} GPS records)", flush=True)
    return best[0], best[1]


def site_positions():
    import math
    pos = {}
    inb = False
    for l in gzip.open(os.path.join(sys.argv[1], "igs.snx.gz"), "rt", errors="replace"):
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
        pos[l[1:5].upper()] = (dms(l[56:68].split()), lo - 360 if lo > 180 else lo, float(l[68:76]))
    return pos


def main():
    work = sys.argv[1]
    import hatanaka
    stations = json.load(open(os.path.join(HERE, "stations.json")))
    days = json.load(open(os.path.join(HERE, "days.json")))
    dates = sorted({x["date"] for v in days.values() for x in v if not x["date"].startswith("2015")})
    pos = site_positions()
    out_path = os.path.join(work, "labels.json")
    labels = json.load(open(out_path)) if os.path.exists(out_path) else {}
    man = open(os.path.join(work, "MANIFEST_OBS.tsv"), "a")
    for date in dates:
        t = datetime.date.fromisoformat(date)
        y, doy = t.year, t.timetuple().tm_yday
        tow0 = ((t - datetime.date(1980, 1, 6)).days % 7) * 86400.0
        nav_text = None
        listing = os.path.join(work, f"list_{y}_{doy:03d}.txt")
        avail = open(listing).read().split() if os.path.exists(listing) else []
        for band, sts in stations.items():
            for s in sts:
                key = f"{s}/{date}"
                if key in labels:
                    continue
                files = [f for f in avail if f.startswith(s)]
                if not files:
                    labels[key] = {"band": band, "missing": True}
                    continue
                if nav_text is None:
                    nav_name, raw = best_nav(work, y, doy)
                    man.write(f"{nav_name}\t{hashlib.sha256(raw).hexdigest()}\n")
                    nav_text = gzip.decompress(raw).decode("latin1")
                obs_path = os.path.join(work, files[0])
                get(f"{BASE}/obs/{y}/{doy:03d}/{files[0]}", obs_path)
                raw = open(obs_path, "rb").read()
                man.write(f"{files[0]}\t{hashlib.sha256(raw).hexdigest()}\n")
                text = hatanaka.decompress(raw).decode("latin1")
                os.remove(obs_path)
                la, lo, h = pos[s[:4]]
                labels[key] = {"band": band, "hours": roti.label_day(text, nav_text, la, lo, h, tow0)}
                json.dump(labels, open(out_path, "w"))
                man.flush()
                print(key, sum(1 for x in labels[key]["hours"] if x["y"] == 1), flush=True)
    print("DONE", len(labels))


if __name__ == "__main__":
    main()
