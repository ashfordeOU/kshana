#!/usr/bin/env python3
"""Fetch EMAG2v3 once and crop a lat/lon box out of it for the magnetic-anomaly tests.

EMAG2v3 (Earth Magnetic Anomaly Grid, 2-arc-minute resolution, NOAA NCEI,
doi:10.7289/V5H70CVX) ships as one ~1.17 GB zip holding a single global CSV. Its
licence/redistribution terms are not stated explicitly enough for us to vendor it,
so nothing from it is committed: this helper downloads the zip at test time into
`tools/emag2/` (keep that directory out of git), stream-reads the CSV member line by
line (never extracting the whole file), and writes a small cropped CSV next to it.

    CSV columns (EMAG2_readme.txt): i, j, LON, LAT, SeaLevel nT, UpCont nT (4 km), Code, Error
    LON runs 0..360 deg east (cell centres at odd multiples of 1/60 deg); lines end in CRLF.
    Void cells: SeaLevel/UpCont 99999, Code 999, Error -999. Ambiguous edges: Code 888, Error -888.

The cropped file starts with a `#` comment block (source URL, zip SHA-256, member
name, box, row count); every data line after it is byte-identical to the source
line, with columns unchanged. The box may be given in -180..180 or 0..360 longitudes; the
rows keep EMAG2's 0..360 east longitudes, so a scenario reading the crop must give its
track in 0..360 east too (a box may not cross the 0/360 meridian).

Usage:
    python3 tools/fetch_emag2_tile.py <south> <north> <west> <east> [--zip PATH] [--out PATH]

Example (Death Valley / Owens Valley):
    python3 tools/fetch_emag2_tile.py 35.5 37.5 -118.0 -116.0
    # -> tools/emag2/EMAG2_V3_20170530_35.5_37.5_-118.0_-116.0.csv
"""
import argparse
import hashlib
import os
import shutil
import sys
import urllib.request
import zipfile

URL = "https://www.ngdc.noaa.gov/geomag/data/EMAG2/EMAG2_V3_20170530.zip"
ZIP_NAME = "EMAG2_V3_20170530.zip"
# SHA-256 of the zip as served by NCEI (Last-Modified 2017-06-27, 1167583749 bytes).
ZIP_SHA256 = "502958066dec31d1d24b9d1b95d58e5ff630af14b02ba180b0a27321c39208c5"
OUT_DIR = "tools/emag2"
CHUNK = 1 << 20


def sha256_file(path: str) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for block in iter(lambda: f.read(CHUNK), b""):
            h.update(block)
    return h.hexdigest()


def download(url: str, dest: str) -> None:
    tmp = dest + ".part"
    print(f"fetching {url} -> {dest}")
    with urllib.request.urlopen(url) as resp, open(tmp, "wb") as f:  # noqa: S310 (NOAA NCEI)
        shutil.copyfileobj(resp, f, CHUNK)
    os.replace(tmp, dest)


def main() -> int:
    ap = argparse.ArgumentParser(description="Crop a lat/lon box out of EMAG2v3.")
    ap.add_argument("south", type=float)
    ap.add_argument("north", type=float)
    ap.add_argument("west", type=float, help="longitude, -180..180")
    ap.add_argument("east", type=float, help="longitude, -180..180")
    ap.add_argument("--zip", dest="zip_path", default=os.path.join(OUT_DIR, ZIP_NAME))
    ap.add_argument("--out", dest="out_path", default=None)
    ap.add_argument("--no-verify", action="store_true", help="skip the zip SHA-256 check")
    a = ap.parse_args()
    if not (a.south <= a.north and a.west <= a.east):
        print("need south <= north and west <= east", file=sys.stderr)
        return 2
    # EMAG2 longitudes are 0..360 east: compare in that convention.
    west, east = a.west % 360.0, a.east % 360.0
    if a.east - a.west >= 360.0 or west > east:
        print("the box may not cross the 0/360 meridian", file=sys.stderr)
        return 2

    os.makedirs(os.path.dirname(a.zip_path) or ".", exist_ok=True)
    if not os.path.exists(a.zip_path):
        download(URL, a.zip_path)
    zip_sha = sha256_file(a.zip_path)
    if not a.no_verify and zip_sha != ZIP_SHA256:
        print(f"zip SHA-256 mismatch: got {zip_sha}, expected {ZIP_SHA256}", file=sys.stderr)
        return 1

    with zipfile.ZipFile(a.zip_path) as zf:
        members = [n for n in zf.namelist() if n.lower().endswith(".csv")]
        if len(members) != 1:
            print(f"expected one CSV member, found {members}", file=sys.stderr)
            return 1
        member = members[0]
        rows = []
        with zf.open(member) as f:
            for line in f:  # bytes, line terminator kept: rows are copied verbatim
                cols = line.split(b",")
                try:
                    lon = float(cols[2])
                    lat = float(cols[3])
                except (IndexError, ValueError):
                    continue  # header or malformed line
                if a.south <= lat <= a.north and west <= lon % 360.0 <= east:
                    rows.append(line)

    box = f"{a.south}_{a.north}_{a.west}_{a.east}"
    out = a.out_path or os.path.join(OUT_DIR, f"EMAG2_V3_20170530_{box}.csv")
    os.makedirs(os.path.dirname(out) or ".", exist_ok=True)
    header = [
        "# EMAG2v3 crop written by tools/fetch_emag2_tile.py",
        f"# source: {URL}",
        f"# zip sha256: {zip_sha}",
        f"# member: {member}",
        f"# box: lat {a.south}..{a.north}, lon {west}..{east} east (inclusive)",
        f"# rows: {len(rows)}",
        "# columns unchanged, rows verbatim: i,j,LON,LAT,SeaLevel(nT),UpCont(nT, 4 km),Code,Error",
        "# void: 99999 nT / Code 999 / Error -999; ambiguous: Code 888 / Error -888",
        "# cite: Meyer, Saltus, Chulliat (2017) EMAG2v3, NOAA NCEI, doi:10.7289/V5H70CVX",
    ]
    with open(out, "wb") as f:
        f.write(("\n".join(header) + "\n").encode("ascii"))
        f.writelines(rows)
    print(f"wrote {out}: {len(rows)} rows")
    print(f"sha256 {sha256_file(out)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
