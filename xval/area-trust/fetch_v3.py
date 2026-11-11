# SPDX-License-Identifier: AGPL-3.0-only
"""B5 v3, T4: fetch the public IGS files of the v3 fortnight (reading X10, with W8 and B8 reading 8) into a
directory outside the repository. Nothing is vendored. Committed before any v3 observation file was fetched.
fetch_v2.py's procedure; only the file names of the manifest and the navigation choice change.

    python3 xval/area-trust/fetch_v3.py xval/area-trust/selection_v3.json OUT_DIR

- Observation files: each selected station's daily 30 s file on all 14 days, expanded from Hatanaka
  compression with the `hatanaka` package (MIT; `pip install hatanaka`) into gzipped RINEX.
- Navigation (B8 reading 8): both of BKG's merged daily files, BRDC00IGS_R and BRDC00WRD_R, are
  fetched; the one with more GPS records is used (a tie keeps BRDC00WRD_R, v1's file). Both counts are
  recorded.
- Every file's SHA-256 goes to OUT_DIR/MANIFEST_v3.tsv (file, sha256, url), and the navigation choice
  to OUT_DIR/nav_choice_v3.tsv. A file that cannot be fetched stops the script with its URL (W8).
"""
import gzip
import hashlib
import json
import os
import sys
import time
import urllib.request

BKG = "https://igs.bkg.bund.de/root_ftp/IGS"


def get(url, path):
    if os.path.exists(path) and os.path.getsize(path) > 0:
        return
    last = None
    for attempt in range(6):
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "kshana-area-trust-fetch"})
            with urllib.request.urlopen(req, timeout=300) as r:
                data = r.read()
            with open(path + ".part", "wb") as f:
                f.write(data)
            os.replace(path + ".part", path)
            return
        except Exception as e:  # noqa: BLE001
            last = e
            time.sleep(5 * (attempt + 1))
    sys.exit(f"fetch failed, stopping (W8): {url}: {last}")


def gps_records(path):
    n = 0
    with gzip.open(path, "rt", encoding="latin-1") as f:
        header = True
        for line in f:
            if header:
                header = "END OF HEADER" not in line
                continue
            if line[:1] == "G" and line[1:3].strip().isdigit() and line[3:4] == " ":
                n += 1
    return n


def sha(path):
    return hashlib.sha256(open(path, "rb").read()).hexdigest()


def main(sel_path, out):
    sel = json.load(open(sel_path))
    stations = [s for c in sel["clusters"] for s in c]
    if not stations:
        sys.exit("the selection has no cluster: nothing to fetch")
    os.makedirs(out, exist_ok=True)
    man, nav = [], []
    for day in sel["days"]:
        y, m, d = (int(x) for x in day.split("-"))
        import datetime as dt
        doy = dt.date(y, m, d).timetuple().tm_yday
        counts = {}
        for src in ("BRDC00IGS_R", "BRDC00WRD_R"):
            f = f"{src}_{y}{doy:03d}0000_01D_MN.rnx.gz"
            url = f"{BKG}/BRDC/{y}/{doy:03d}/{f}"
            get(url, os.path.join(out, f))
            man.append((f, sha(os.path.join(out, f)), url))
            counts[src] = gps_records(os.path.join(out, f))
        pick = "BRDC00IGS_R" if counts["BRDC00IGS_R"] > counts["BRDC00WRD_R"] else "BRDC00WRD_R"
        nav.append((day, counts["BRDC00IGS_R"], counts["BRDC00WRD_R"], pick))
        for s in stations:
            f = f"{s}_R_{y}{doy:03d}0000_01D_30S_MO.crx.gz"
            url = f"{BKG}/obs/{y}/{doy:03d}/{f}"
            p = os.path.join(out, f)
            get(url, p)
            man.append((f, sha(p), url))
            rnx = p[: -len(".crx.gz")] + ".rnx.gz"
            if not os.path.exists(rnx):
                import hatanaka
                open(rnx, "wb").write(gzip.compress(hatanaka.decompress(open(p, "rb").read()), mtime=0))
    with open(os.path.join(out, "MANIFEST_v3.tsv"), "w") as f:
        for row in man:
            f.write("\t".join(row) + "\n")
    with open(os.path.join(out, "nav_choice_v3.tsv"), "w") as f:
        f.write("day\tgps_records_BRDC00IGS_R\tgps_records_BRDC00WRD_R\tused\n")
        for row in nav:
            f.write("\t".join(str(x) for x in row) + "\n")
    print(f"{len(man)} files, every one pinned in {out}/MANIFEST_v3.tsv")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
