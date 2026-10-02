#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Fetch the Wroclaw u-blox ZED-F9P daily RINEX for tests/clock_library_f9p_cards_oracle.rs.

Source: Zenodo record 6488497 (doi:10.5281/zenodo.6488497), "RINEX files from low-cost GNSS
receivers in Wroclaw, Poland; January - March, 2021", CC BY 4.0: daily 30 s multi-GNSS RINEX of
static u-blox ZED-F9P receivers. Broadcast navigation: IGS merged GPS file BRDC00WRD_R_2021<DOY>0000_01D_GN (the pre-registration
named BRDC00IGS_R, which does not exist for 2021)
from the BKG mirror. Committed with the pre-registration, before it was first run. It computes no
statistic.

Selection (fixed in the pre-registration): every station of the record with at least 14
consecutive daily files; per station its EARLIEST run of 14 consecutive days. Files are written
(uncompressed) to $KSHANA_ORACLES/data/wroclaw_f9p/<STATION>/<DOY>.rnx and brdc/<DOY>.rnx, with
stations.tsv (station, comma-separated DOYs) and sources.sha256 (every downloaded file).

Usage: generate.py
"""
import gzip
import hashlib
import json
import os
import re
import urllib.request
from pathlib import Path

ORACLES = Path(os.environ.get("KSHANA_ORACLES", Path.home() / "Code/kshana-oracles"))
DEST = ORACLES / "data" / "wroclaw_f9p"
REC = "https://zenodo.org/api/records/6488497"


def get(url):
    req = urllib.request.Request(url, headers={"User-Agent": "kshana-oracles/1"})
    with urllib.request.urlopen(req, timeout=600) as r:
        return r.read()


def main():
    DEST.mkdir(parents=True, exist_ok=True)
    rec = json.loads(get(REC))
    files = {}
    for f in rec["files"]:
        m = re.match(r"(BX\d\d)00POL_S_2021(\d{3})0000_01D_30S_MO\.rnx\.gz$", f["key"])
        if m:
            files.setdefault(m.group(1), {})[int(m.group(2))] = f
    shas, rows, doys_all = [], ["station\tdoys"], set()
    for st in sorted(files):
        days = sorted(files[st])
        run = None
        for d in days:
            if all(d + i in files[st] for i in range(14)):
                run = list(range(d, d + 14))
                break
        if run is None:
            print(st, "no 14 consecutive days; excluded")
            continue
        (DEST / st).mkdir(exist_ok=True)
        for d in run:
            f = files[st][d]
            out = DEST / st / f"{d:03d}.rnx"
            if not out.exists():
                raw = get(f["links"]["self"])
                assert f["checksum"].endswith(hashlib.md5(raw).hexdigest()), f["key"]
                shas.append(f"{hashlib.sha256(raw).hexdigest()}  {f['key']}")
                out.write_bytes(gzip.decompress(raw))
        doys_all.update(run)
        rows.append(f"{st}\t" + ",".join(f"{d:03d}" for d in run))
        print(st, run[0], "-", run[-1])
    (DEST / "brdc").mkdir(exist_ok=True)
    for d in sorted(doys_all):
        out = DEST / "brdc" / f"{d:03d}.rnx"
        if not out.exists():
            # The IGS merged file of 2021 is BRDC00WRD (GPS-only GN); BRDC00IGS starts later.
            name = f"BRDC00WRD_R_2021{d:03d}0000_01D_GN.rnx.gz"
            raw = get(f"https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2021/{d:03d}/{name}")
            shas.append(f"{hashlib.sha256(raw).hexdigest()}  {name}")
            out.write_bytes(gzip.decompress(raw))
    (DEST / "stations.tsv").write_text("\n".join(rows) + "\n")
    with open(DEST / "sources.sha256", "a") as fh:
        fh.write("".join(s + "\n" for s in shas))


if __name__ == "__main__":
    main()
