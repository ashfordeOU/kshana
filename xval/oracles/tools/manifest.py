"""Write data/MANIFEST.tsv (one row per file) and data/MANIFEST.md (grouped summary).

Usage: manifest.py <oracles-root>. Reads sources.tsv and sources.generated.tsv, hashes every
file present under data/, and records failed or absent sources honestly.
"""
import datetime as dt
import hashlib
import os
import sys
from collections import OrderedDict

root = sys.argv[1]
data = os.path.join(root, "data")
meta = os.path.join(data, ".meta")


def sources(path):
    if not os.path.exists(path):
        return []
    out = []
    for line in open(path, encoding="utf-8"):
        if not line.strip() or line.startswith("#"):
            continue
        f = line.rstrip("\n").split("\t")
        f += [""] * (6 - len(f))
        out.append(dict(id=f[0], dest=f[1], url=f[2], licence=f[3], rows=f[4], mutable=f[5]))
    return out


def sha256(p):
    h = hashlib.sha256()
    with open(p, "rb") as fh:
        for chunk in iter(lambda: fh.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def human(n):
    for u in ("B", "KB", "MB", "GB"):
        if n < 1024 or u == "GB":
            return f"{n:.1f} {u}" if u != "B" else f"{n} B"
        n /= 1024


rows = []
for s in sources(os.path.join(root, "sources.tsv")) + sources(os.path.join(root, "sources.generated.tsv")):
    p = os.path.join(data, s["dest"])
    date_file = os.path.join(meta, s["id"] + ".date")
    if os.path.isfile(p) and os.path.getsize(p) > 0:
        date = open(date_file).read().strip() if os.path.exists(date_file) else \
            dt.datetime.fromtimestamp(os.path.getmtime(p), dt.timezone.utc).strftime("%Y-%m-%d")
        rows.append(dict(s, status="ok", size=os.path.getsize(p), sha256=sha256(p), date=date))
    else:
        failed = os.path.join(meta, s["id"] + ".failed")
        note = open(failed).read().strip() if os.path.exists(failed) else "not fetched"
        rows.append(dict(s, status="MISSING (" + note + ")", size=0, sha256="", date=""))

with open(os.path.join(data, "MANIFEST.tsv"), "w", encoding="utf-8") as out:
    out.write("id\tpath\tstatus\tsize_bytes\tsha256\tretrieved_utc\tmutable_upstream\tlicence\trows\turl\n")
    for r in rows:
        out.write("\t".join(str(r[k]) for k in
                            ("id", "dest", "status", "size", "sha256", "date", "mutable", "licence", "rows", "url")) + "\n")

# Grouped Markdown: a series (Bulletin A weeks, Circular T issues, UTC(k) files) is one line.
groups = OrderedDict()
for r in rows:
    key = r["id"]
    for prefix in ("iers-bulla-", "bipm-cirt-", "bipm-utclab-"):
        if key.startswith(prefix):
            key = prefix.rstrip("-") + " (series)"
    groups.setdefault(key, []).append(r)

total = sum(r["size"] for r in rows)
with open(os.path.join(data, "MANIFEST.md"), "w", encoding="utf-8") as out:
    out.write("# Oracle dataset manifest\n\n")
    out.write(f"Generated {dt.datetime.now(dt.timezone.utc):%Y-%m-%d %H:%M} UTC by tools/manifest.py. "
              f"{sum(1 for r in rows if r['status'] == 'ok')} files present, "
              f"{sum(1 for r in rows if r['status'] != 'ok')} missing, {human(total)} in all. "
              "Per-file SHA-256 values are in MANIFEST.tsv. Nothing here is vendored into a repository; "
              "a per-row agent that commits a slice records its own SHA-256 and licence in the fixture NOTICE.\n\n")
    out.write("| Source | Files | Size | Licence | Rows | Retrieved | SHA-256 (first file) | URL |\n")
    out.write("|---|---|---|---|---|---|---|---|\n")
    for key, rs in groups.items():
        ok = [r for r in rs if r["status"] == "ok"]
        size = sum(r["size"] for r in rs)
        dates = sorted({r["date"] for r in ok})
        status = f"{len(ok)}/{len(rs)}" if len(rs) > 1 else ("1" if ok else rs[0]["status"])
        sha = (ok[0]["sha256"][:16] + "...") if ok else "-"
        url = rs[0]["url"] if len(rs) == 1 else rs[0]["url"].rsplit("/", 1)[0] + "/..."
        out.write(f"| {key} | {status} | {human(size)} | {rs[0]['licence']} | {rs[0]['rows']} | "
                  f"{', '.join(dates) or '-'} | {sha} | {url} |\n")
print(f"manifest: {len(rows)} entries, {human(total)}")
