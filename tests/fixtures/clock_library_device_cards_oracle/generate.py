#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the IGS GPS Block IIF clock fixture for tests/clock_library_device_cards_oracle.rs.

A format converter: it copies the satellite (AS) records of the IGS final combined 30 s clock
files IGS0OPSFIN_2026060..073 (2026-03-01 to 2026-03-14) for every PRN whose SVN is a GPS-IIF
satellite for the whole window in the IGS satellite metadata SINEX, as delta-encoded integers
of 1e-14 s. It computes no statistic.

Selection (fixed in the pre-registration before this script was first run): PRN assignments
from SATELLITE/PRN, blocks from SATELLITE/IDENTIFIER; a PRN qualifies when one SVN of block
GPS-IIF holds it from before 2026-03-01 00:00 to after 2026-03-14 23:59:30.

Usage: generate.py <directory for the downloads>
Sources: https://igs.bkg.bund.de/root_ftp/IGS/products/2408/ and .../2409/ (IGS products, open
with attribution); https://files.igs.org/pub/station/general/igs_satellite_metadata.snx.
"""
import gzip
import hashlib
import sys
import urllib.request
from datetime import datetime, timedelta
from pathlib import Path

HERE = Path(__file__).resolve().parent
START = datetime(2026, 3, 1)
DAYS = 14
EPOCHS = DAYS * 2880
UNIT = 1e-14
META = "https://files.igs.org/pub/station/general/igs_satellite_metadata.snx"


def fetch(url, dest):
    if not dest.exists():
        req = urllib.request.Request(url, headers={"User-Agent": "kshana-oracles/1"})
        with urllib.request.urlopen(req, timeout=300) as r:
            dest.write_bytes(r.read())
    return dest


def sha(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def sinex_epoch(s):
    y, d, sec = s.split(":")
    if y == "0000":
        return datetime(2100, 1, 1)
    return datetime(int(y), 1, 1) + timedelta(days=int(d) - 1, seconds=int(sec))


def iif_prns(meta_text):
    block, prn = {}, []
    sect = None
    for ln in meta_text.splitlines():
        if ln.startswith("+"):
            sect = ln[1:].strip()
            continue
        if ln.startswith("-") or ln.startswith("*"):
            continue
        f = ln.split()
        if sect == "SATELLITE/IDENTIFIER" and len(f) >= 4:
            block[f[0]] = f[3]
        elif sect == "SATELLITE/PRN" and len(f) >= 4:
            prn.append((f[0], sinex_epoch(f[1]), sinex_epoch(f[2]), f[3]))
    end = START + timedelta(days=DAYS) - timedelta(seconds=30)
    out = {}
    for svn, a, b, p in prn:
        if p.startswith("G") and block.get(svn) == "GPS-IIF" and a <= START and b >= end:
            out[p] = svn
    return out


def main():
    dl = Path(sys.argv[1])
    dl.mkdir(parents=True, exist_ok=True)
    meta = fetch(META, dl / "igs_satellite_metadata.snx")
    prns = iif_prns(meta.read_text(errors="replace"))
    srcs = [f"{sha(meta)}  igs_satellite_metadata.snx"]
    series = {p: {} for p in prns}
    for k in range(DAYS):
        d = START + timedelta(days=k)
        doy = d.timetuple().tm_yday
        week = (d - datetime(1980, 1, 6)).days // 7
        name = f"IGS0OPSFIN_{d.year}{doy:03d}0000_01D_30S_CLK.CLK.gz"
        p = fetch(f"https://igs.bkg.bund.de/root_ftp/IGS/products/{week}/{name}", dl / name)
        srcs.append(f"{sha(p)}  {name}")
        for ln in gzip.decompress(p.read_bytes()).decode().splitlines():
            if not ln.startswith("AS "):
                continue
            f = ln.split()
            if f[1] not in series:
                continue
            t = datetime(int(f[2]), int(f[3]), int(f[4]), int(f[5]), int(f[6])) + timedelta(
                seconds=float(f[7]))
            idx = (t - START).total_seconds() / 30.0
            if abs(idx - round(idx)) > 1e-6 or not 0 <= round(idx) < EPOCHS:
                continue
            series[f[1]].setdefault(int(round(idx)), float(f[9].replace("D", "E")))
    with open(HERE / "igs_iif_30s.txt", "w") as fh:
        fh.write("# IGS final combined 30 s clocks 2026-03-01..14 (IGS0OPSFIN_2026060..073), GPS Block IIF\n")
        fh.write("# per PRN: @PRN svn=SVN first_bias_s=B; then 'k d': epoch index, bias increment in 1e-14 s\n")
        for p in sorted(series):
            s = series[p]
            if not s:
                continue
            ks = sorted(s)
            base = s[ks[0]]
            fh.write(f"@{p} svn={prns[p]} first_bias_s={base!r}\n")
            prev = 0
            for k in ks:
                q = round((s[k] - base) / UNIT)
                fh.write(f"{k} {q - prev}\n")
                prev = q
    (HERE / "sources.sha256").write_text("\n".join(srcs) + "\n")
    print("PRNs:", " ".join(f"{p}({prns[p]})" for p in sorted(prns)))


if __name__ == "__main__":
    main()
