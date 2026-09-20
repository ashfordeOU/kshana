#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the committed LNCSS published-constellation element fixtures.

The source is ONE open-access, peer-reviewed article:

    S. Bhamidipati, T. Mina, A. Sanchez and G. Gao,
    "Satellite Constellation Design for a Lunar Navigation and Communication
    System", NAVIGATION: Journal of the Institute of Navigation, 70(4),
    navi.613, 2023. DOI 10.33012/navi.613.
    Open access, Creative Commons Attribution (CC BY) licence.

Its Table 1 ("Orbital Parameters Represented in the OP Frame for the Three LNCSS
Constellation Case Studies") is the ONLY place any number in the generated
fixtures comes from. This script:

  1. downloads the publisher PDF,
  2. verifies its SHA-256 against the pin recorded below (and in NOTICE.md),
  3. extracts the text layer with `pdftotext -layout` (poppler),
  4. parses the three Table 1 rows with a strict regex,
  5. expands each row's `x:y:z` RAAN and mean-anomaly series into the explicit
     per-satellite element set the paper's caption defines, and
  6. writes one CSV per case study.

Nothing is transcribed by hand and nothing is defaulted: if the PDF hash moves,
or the table cannot be parsed, the script fails rather than emitting a number.

    python3 generate_lncss_navi613.py [--out-dir .] [--pdf local.pdf]
"""

from __future__ import annotations

import argparse
import hashlib
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.request

SOURCE_URL = "https://navi.ion.org/content/navi/70/4/navi.613.full.pdf"
SOURCE_SHA256 = "4e2946873f1b62f98615f500f894cfe05c128444f9770235095bd4606df35162"
SOURCE_DOI = "10.33012/navi.613"
RETRIEVED = "2026-09-20"

# Table 1 rows look like (after `pdftotext -layout`):
#     A          8         6143          0.6            51.7           90       0:180:180    0:90:270
TABLE1_ROW = re.compile(
    r"^\s*(?P<case>[ABC])\s+(?P<n>\d+)\s+(?P<a_km>\d+(?:\.\d+)?)\s+"
    r"(?P<ecc>\d+(?:\.\d+)?)\s+(?P<inc>\d+(?:\.\d+)?)\s+(?P<argp>\d+(?:\.\d+)?)\s+"
    r"(?P<raan>\d+:\d+:\d+)\s+(?P<anom>\d+:\d+:\d+)\s*$"
)


def series(spec: str) -> list:
    """Expand the paper's `x:y:z` short-hand: the closed interval [x, z] stepped by y."""
    lo, step, hi = (float(v) for v in spec.split(":"))
    if step <= 0.0:
        raise SystemExit("non-positive step in series %r" % spec)
    out, k = [], 0
    v = lo
    while v <= hi + 1e-9:
        out.append(v)
        k += 1
        v = lo + k * step
    return out


def fetch(dest):
    with urllib.request.urlopen(SOURCE_URL, timeout=120) as r:
        dest.write_bytes(r.read())
    got = hashlib.sha256(dest.read_bytes()).hexdigest()
    if got != SOURCE_SHA256:
        raise SystemExit(
            "source PDF SHA-256 mismatch\n  expected %s\n  got      %s\n"
            "The publisher's bytes changed; re-verify the table by hand before "
            "updating the pin." % (SOURCE_SHA256, got)
        )


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out-dir", default=".")
    ap.add_argument("--pdf", default=None, help="use a local PDF instead of downloading")
    args = ap.parse_args()

    if shutil.which("pdftotext") is None:
        raise SystemExit("pdftotext (poppler) is required")

    with tempfile.TemporaryDirectory() as td:
        pdf = pathlib.Path(args.pdf) if args.pdf else pathlib.Path(td) / "navi613.pdf"
        if args.pdf:
            got = hashlib.sha256(pdf.read_bytes()).hexdigest()
            if got != SOURCE_SHA256:
                raise SystemExit("local PDF SHA-256 mismatch: %s" % got)
        else:
            fetch(pdf)
        txt = pathlib.Path(td) / "navi613.txt"
        subprocess.run(["pdftotext", "-layout", str(pdf), str(txt)], check=True)
        rows = []
        for line in txt.read_text(errors="replace").splitlines():
            m = TABLE1_ROW.match(line)
            if m:
                rows.append(m.groupdict())

    if len(rows) != 3 or set(r["case"] for r in rows) != {"A", "B", "C"}:
        raise SystemExit(
            "expected the three Table 1 case-study rows, parsed %d: %r" % (len(rows), rows)
        )

    out_dir = pathlib.Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)
    for r in rows:
        raans, anoms = series(r["raan"]), series(r["anom"])
        sats = [(o, m) for o in raans for m in anoms]
        if len(sats) != int(r["n"]):
            raise SystemExit(
                "case %s: RAAN x anomaly grid is %d satellites, the table says %s"
                % (r["case"], len(sats), r["n"])
            )
        path = out_dir / ("lncss_case_%s_navi613.csv" % r["case"].lower())
        with path.open("w") as f:
            f.write(
                "# kshana-lunar-constellation 1\n"
                "# format: elements\n"
                "# provenance: published-elements\n"
                "# name: LNCSS case study %s (%s satellites)\n"
                "# source: Bhamidipati, Mina, Sanchez and Gao, \"Satellite Constellation "
                "Design for a Lunar Navigation and Communication System\", NAVIGATION: "
                "Journal of the Institute of Navigation 70(4), navi.613, 2023 (open "
                "access, CC BY), Table 1\n"
                "# doi: %s\n"
                "# url: %s\n"
                "# retrieved: %s\n"
                "# source_sha256: %s\n"
                "# published_frame: OP (Earth orbital plane frame of Ely 2005 / Ely and "
                "Lieb 2006), as stated by the source\n"
                "# generator: tests/fixtures/lunar_ephemeris/generate_lncss_navi613.py\n"
                "sat,sma_km,ecc,inc_deg,raan_deg,argp_deg,mean_anom_deg\n"
                % (r["case"], r["n"], SOURCE_DOI, SOURCE_URL, RETRIEVED, SOURCE_SHA256)
            )
            for i, (raan, anom) in enumerate(sats):
                f.write(
                    "%d,%s,%s,%s,%g,%s,%g\n"
                    % (i, r["a_km"], r["ecc"], r["inc"], raan, r["argp"], anom)
                )
        print("wrote %s (%d satellites)" % (path, len(sats)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
