# SPDX-License-Identifier: AGPL-3.0-only
"""B5 v2, T4: select the fortnight and the stations by rule (readings W7 and W8, with reading 10).
Committed before it was run and before any observation file of the v2 fortnight was fetched.
Python standard library only.

    python3 -I xval/area-trust/select_v2.py OUT_DIR > xval/area-trust/selection_v2.json

- Days (W7): the GFZ Kp file is fetched; the first 14 consecutive UTC days starting on or after
  2025-01-20 whose eight 3-hour Kp values are all at most 4.000. Day 1 calibrates; days 2 to 14 are
  scored.
- Stations (reading 10, applied anew): every 9-character name with a daily 30 s observation file
  (`*_01D_30S_MO.crx.gz`) at BKG on day 1 is placed by its 4-character code in the SITE/ID block of the
  IGS station SINEX (reading 9). Only stations with at least 3 others within 100 km can join a cluster
  of 4, so only they are checked further. A station is eligible when its file is listed on all 14 days
  and every one of those headers lists S1C among the GPS observation types (only the header is read).
  Clusters are formed in SHA-256 order of the name, as reading 10 states; at most 3 are kept.
- Any fetch that fails stops the script with the URL (W8: nothing is substituted).
"""
import datetime as dt
import gzip
import hashlib
import io
import json
import math
import re
import sys
import urllib.request
import zlib

KP_URL = "https://kp.gfz.de/app/files/Kp_ap_Ap_SN_F107_since_1932.txt"
SNX_URL = "https://files.igs.org/pub/station/general/igs.snx.gz"
BKG = "https://igs.bkg.bund.de/root_ftp/IGS"
START = dt.date(2025, 1, 20)
R_KM = 6371.0088
UA = {"User-Agent": "kshana-area-trust-selection"}


def get(url, limit=None):
    req = urllib.request.Request(url, headers=UA)
    for attempt in range(6):
        try:
            with urllib.request.urlopen(req, timeout=300) as r:
                return r.read(limit) if limit else r.read()
        except Exception as e:  # noqa: BLE001 (any failure: retry, then stop)
            last = e
    sys.exit(f"fetch failed, stopping (W8): {url}: {last}")


def fortnight(text):
    head = [l for l in text.splitlines() if l.startswith("#") and "Kp1" in l]
    if not head:
        sys.exit("the Kp file has no '#... Kp1 ...' column header: format changed, stopping")
    cols = head[-1].lstrip("#").split()
    i_kp = cols.index("Kp1")
    days = {}
    for l in text.splitlines():
        if l.startswith("#") or not l.strip():
            continue
        f = l.split()
        d = dt.date(int(f[0]), int(f[1]), int(f[2]))
        days[d] = [float(x) for x in f[i_kp:i_kp + 8]]
    run = []
    d = START
    while d in days:
        if max(days[d]) <= 4.000 and min(days[d]) >= 0:
            run.append(d)
            if len(run) == 14:
                return run, {x.isoformat(): days[x] for x in run}
        else:
            run = []
        d += dt.timedelta(days=1)
    sys.exit("no 14-day run in the Kp file")


def dms(s):
    d, m, sec = s.split()
    v = abs(float(d)) + float(m) / 60 + float(sec) / 3600
    return -v if s.strip().startswith("-") else v


def sinex_positions(data):
    text = gzip.decompress(data).decode("latin-1")
    block = text.split("+SITE/ID", 1)[1].split("-SITE/ID", 1)[0]
    pos = {}
    for l in block.splitlines():
        if l.startswith("*") or len(l) < 75:
            continue
        code = l[1:5].strip().upper()
        lon, lat = dms(l[44:56]), dms(l[56:68])
        if lon > 180:
            lon -= 360
        pos.setdefault(code, (lat, lon))
    return pos


def dist_km(a, b):
    p1, p2 = math.radians(a[0]), math.radians(b[0])
    dl = math.radians(b[1] - a[1])
    c = math.sin(p1) * math.sin(p2) + math.cos(p1) * math.cos(p2) * math.cos(dl)
    return R_KM * math.acos(max(-1.0, min(1.0, c)))


def listing(day):
    doy = day.timetuple().tm_yday
    html = get(f"{BKG}/obs/{day.year}/{doy:03d}/").decode("latin-1")
    names = set(re.findall(r"([A-Z0-9]{9})_R_%d%03d0000_01D_30S_MO\.crx\.gz" % (day.year, doy), html))
    return names


def has_s1c(day, name):
    doy = day.timetuple().tm_yday
    url = f"{BKG}/obs/{day.year}/{doy:03d}/{name}_R_{day.year}{doy:03d}0000_01D_30S_MO.crx.gz"
    raw = get(url, limit=262144)  # the header is in the first few kB of the stream
    text = zlib.decompressobj(31).decompress(raw).decode("latin-1")
    if "END OF HEADER" not in text:
        sys.exit(f"no end of header in the first part of {url}")
    gps, cont = [], False
    for l in text.split("END OF HEADER")[0].splitlines():
        if l[60:].strip() != "SYS / # / OBS TYPES":
            cont = False
            continue
        if l[0] == "G":
            gps, cont = l[7:58].split(), True
        elif l[0] == " " and cont:
            gps += l[7:58].split()
        else:
            cont = False
    return "S1C" in gps


def main():
    kp = get(KP_URL)
    days, kp_days = fortnight(kp.decode("latin-1"))
    snx = get(SNX_URL)
    pos = sinex_positions(snx)
    day1 = listing(days[0])
    placed = {n: pos[n[:4]] for n in day1 if n[:4] in pos}
    cand = sorted(n for n in placed if sum(1 for m in placed if m != n and dist_km(placed[n], placed[m]) <= 100.0) >= 3)
    lists = {d: listing(d) for d in days[1:]}
    listed = [n for n in cand if all(n in lists[d] for d in days[1:])]
    s1c = {n: all(has_s1c(d, n) for d in days) for n in listed}
    eligible = [n for n in listed if s1c[n]]
    order = sorted(eligible, key=lambda n: hashlib.sha256(n.encode()).hexdigest())
    used, clusters = set(), []
    for seed in order:
        if seed in used or len(clusters) == 3:
            continue
        c = [seed]
        for n in order:
            if n in used or n in c or len(c) == 4:
                continue
            if all(dist_km(placed[n], placed[m]) <= 100.0 for m in c):
                c.append(n)
        if len(c) == 4:
            clusters.append(c)
            used.update(c)
    print(json.dumps({
        "rule": "PREREGISTRATION-v2.md, readings W7, W8 and 10",
        "kp_file": {"url": KP_URL, "sha256": hashlib.sha256(kp).hexdigest()},
        "station_sinex": {"url": SNX_URL, "sha256": hashlib.sha256(snx).hexdigest()},
        "days": [d.isoformat() for d in days],
        "calibration_day": days[0].isoformat(),
        "scored_days": [d.isoformat() for d in days[1:]],
        "kp": kp_days,
        "candidates_within_100km_of_3": cand,
        "listed_all_days": listed,
        "s1c_every_day": s1c,
        "clusters": clusters,
    }, indent=1, sort_keys=False))


if __name__ == "__main__":
    main()
