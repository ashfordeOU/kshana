#!/usr/bin/env python3
"""Build thu2_8040c_esa_mgex.csv: the receiver clock of IGS station THU2 (Thule),
driven by a Symmetricom 8040C rubidium standard from 2013-03-19 to 2019-05-04 (site
log thu200grl, section 6.3), from the ESA Navigation Office MGEX final 30 s clock
products.

Usage: fetch_thu2_8040c.py [cache-dir] > thu2_8040c_esa_mgex.csv

Day list (pre-registered in tests/oscillator_presets_measured.rs): the 15th of
January, April, July and October from 2014-01-15 to 2019-04-15. A day whose file is
missing or has no THU2 record is listed in a comment line, not replaced. Values are
written relative to the day's first THU2 epoch (an offset removes nothing the Allan
deviation or the time-error statistic sees) with nine significant digits.
"""
import datetime as dt, gzip, os, sys, urllib.request, hashlib

cache = sys.argv[1] if len(sys.argv) > 1 else "thu2-cache"
os.makedirs(cache, exist_ok=True)
GPS0 = dt.date(1980, 1, 6)
days = [dt.date(y, m, 15) for y in range(2014, 2020) for m in (1, 4, 7, 10)]
days = [d for d in days if d <= dt.date(2019, 4, 15)]
print("# THU2 receiver clock (Symmetricom 8040C), ESA MGEX final 30 s clocks")
print("# source: http://navigation-office.esa.int/products/gnss-products/<GPS week>/ESA0MGNFIN_YYYYDDD0000_01D_30S_CLK.CLK.gz")
print("# columns: date, seconds of day (GPS time), clock bias (s) relative to the day's first epoch")
rows = []
for d in days:
    week = (d - GPS0).days // 7
    name = f"ESA0MGNFIN_{d.year}{d.timetuple().tm_yday:03d}0000_01D_30S_CLK.CLK.gz"
    path = os.path.join(cache, name)
    if not os.path.exists(path):
        url = f"http://navigation-office.esa.int/products/gnss-products/{week}/{name}"
        try:
            urllib.request.urlretrieve(url, path)
        except Exception as e:  # missing day: listed, not replaced
            print(f"# missing {d} ({name}): {e}")
            continue
    sha = hashlib.sha256(open(path, "rb").read()).hexdigest()
    first = None
    n = 0
    out = []
    with gzip.open(path, "rt", errors="replace") as f:
        for line in f:
            if line.startswith("AR THU2 "):
                p = line.split()
                hh, mm, ss = int(p[5]), int(p[6]), float(p[7])
                b = float(p[9])
                if first is None:
                    first = b
                out.append(f"{d.isoformat()},{hh * 3600 + mm * 60 + ss:.0f},{b - first:.9e}")
                n += 1
    if n == 0:
        print(f"# missing {d} ({name}): no THU2 record")
        continue
    print(f"# {d} {name} sha256 {sha} epochs {n}")
    rows += out
print("date,seconds_of_day,clock_bias_s")
print("\n".join(rows))
