#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the committed LANS interoperability-demonstration element fixture.

The source is the joint ESA / NASA / JAXA reference paper for the Lunar Augmented
Navigation Service (LANS) interoperability demonstration:

    F. T. Melman, R. D. Swinden, J. S. Oduber, Y. Audet, C. Stallo, C. J. Gramling,
    J. M. Crenshaw, M. Murata, S. Okamoto, J. Ventura-Traveset and S. Molli,
    "Lunar Augmented Navigation Service Interoperability Demonstration - Reference
    Products and Expected PVT Accuracy", ION GNSS+ 2025, Baltimore MD,
    8-12 September 2025. NASA NTRS record 20250009447.

Its Table 3 gives the five demonstration satellites - one ESA Moonlight/LCNS
navigation satellite, one JAXA LNSS demonstration satellite and three NASA LCRNS
satellites - as classical elements in the ICRF frame at a stated epoch. That table is
the ONLY place any number in the generated fixture comes from. The paper's own caption
is carried into the fixture header verbatim: the orbits are notional and stated to be
applicable only to that publication's preliminary performance analysis.

This script downloads the PDF, verifies its SHA-256 against the pin below, extracts the
text layer with `pdftotext -layout`, parses the six element rows of Table 3 with a strict
regex, checks that all five satellite labels really appear in the table region, and
writes the CSV. Nothing is transcribed by hand; a parse failure aborts rather than
emitting a number. The true anomaly is carried through AS PUBLISHED - the reader converts
it - so every field of the fixture can be checked against the page.

    python3 generate_lans_demo_ntrs.py [--out-dir .] [--pdf local.pdf]
"""

from __future__ import annotations

import argparse
import datetime
import hashlib
import pathlib
import re
import shutil
import subprocess
import sys
import tempfile
import urllib.request

SOURCE_URL = (
    "https://ntrs.nasa.gov/api/citations/20250009447/downloads/LANS_Demo_ION_Paper_v1_3.pdf"
)
SOURCE_SHA256 = "d1b916be31afad8ff6fc535cff2df1a0c3233c2123830f792e5e1cf439c6ce05"
NTRS_ID = "20250009447"
RETRIEVED = "2026-09-20"

# Satellite labels, in Table 3 column order. These are asserted to appear in the table
# region rather than assumed: if the paper's column order or naming changed, the script
# stops instead of silently mislabelling a row.
LABELS = [
    "ESA Moonlight",
    "LCNS Nav #1",
    "Japan LNSS Demo",
    "NASA LCRNS #1",
    "NASA LCRNS #2",
    "NASA LCRNS #3",
]
COLUMN_NAMES = [
    "ESA Moonlight LCNS Nav #1",
    "Japan LNSS Demo",
    "NASA LCRNS #1",
    "NASA LCRNS #2",
    "NASA LCRNS #3",
]

# Row label -> output field. The value pattern accepts a leading minus (RAAN and true
# anomaly are given negative in the table).
ROWS = [
    (r"Semi-major axis \[km\]", "sma_km"),
    (r"Eccentricity \[-\]", "ecc"),
    (r"Inclination \[deg\]", "inc_deg"),
    (r"Arg\. of perilune \[deg\]", "argp_deg"),
    (r"RAAN \[deg\]", "raan_deg"),
    (r"True anomaly \[deg\]", "true_anom_deg"),
]
NUM = r"-?\d+(?:\.\d+)?"

# The epoch Table 3 states for every satellite. Checked against the PDF text below, and
# converted to a Julian date arithmetically rather than quoted.
EPOCH_UTC_TEXT = "2027-01-01"
EPOCH_SCALE = "TDB"


def julian_day(date: datetime.date) -> float:
    """Julian date of 00:00:00 on `date`, from the Unix epoch's JD (2440587.5)."""
    days = (date - datetime.date(1970, 1, 1)).days
    return 2440587.5 + days


def fetch(dest):
    with urllib.request.urlopen(SOURCE_URL, timeout=180) as r:
        dest.write_bytes(r.read())
    got = hashlib.sha256(dest.read_bytes()).hexdigest()
    if got != SOURCE_SHA256:
        raise SystemExit(
            "source PDF SHA-256 mismatch\n  expected %s\n  got      %s\n"
            "The publisher's bytes changed; re-verify Table 3 by hand before updating "
            "the pin." % (SOURCE_SHA256, got)
        )


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out-dir", default=".")
    ap.add_argument("--pdf", default=None, help="use a local PDF instead of downloading")
    args = ap.parse_args()

    if shutil.which("pdftotext") is None:
        raise SystemExit("pdftotext (poppler) is required")

    with tempfile.TemporaryDirectory() as td:
        pdf = pathlib.Path(args.pdf) if args.pdf else pathlib.Path(td) / "lans.pdf"
        if args.pdf:
            got = hashlib.sha256(pdf.read_bytes()).hexdigest()
            if got != SOURCE_SHA256:
                raise SystemExit("local PDF SHA-256 mismatch: %s" % got)
        else:
            fetch(pdf)
        txt = pathlib.Path(td) / "lans.txt"
        subprocess.run(["pdftotext", "-layout", str(pdf), str(txt)], check=True)
        text = txt.read_text(errors="replace")

    values = {}
    for pattern, field in ROWS:
        m = re.search(
            r"^\s*" + pattern + r"\s+" + r"\s+".join([r"(" + NUM + r")"] * 5) + r"\s*$",
            text,
            re.MULTILINE,
        )
        if not m:
            raise SystemExit("could not parse the Table 3 row %r" % pattern)
        # Keep the matched TEXT, not a re-formatted float: the fixture must carry the
        # source's own digits (11999.2626, not 11999.3) so every field can be checked
        # against the page. `float()` is called only to prove each token is a number.
        for v in m.groups():
            float(v)
        values[field] = list(m.groups())

    for label in LABELS:
        if label not in text:
            raise SystemExit("Table 3 column label %r is not in the document" % label)
    if EPOCH_UTC_TEXT not in text or EPOCH_SCALE not in text:
        raise SystemExit("the stated epoch is not in the document")

    y, mo, d = (int(v) for v in EPOCH_UTC_TEXT.split("-"))
    epoch_jd_tdb = julian_day(datetime.date(y, mo, d))

    out = pathlib.Path(args.out_dir) / "lans_demo_ntrs20250009447.csv"
    with out.open("w") as f:
        f.write(
            "# kshana-lunar-constellation 1\n"
            "# format: elements\n"
            "# provenance: published-elements\n"
            "# name: LANS interoperability demonstration reference constellation (5 satellites)\n"
            "# elements_frame: icrf\n"
            "# epoch_jd_tdb: %.9f\n"
            "# epoch: %s 00:00:00.000 %s, as stated by the source\n"
            "# source: Melman, Swinden, Oduber, Audet, Stallo, Gramling, Crenshaw, Murata, "
            "Okamoto, Ventura-Traveset and Molli, \"Lunar Augmented Navigation Service "
            "Interoperability Demonstration - Reference Products and Expected PVT Accuracy\", "
            "ION GNSS+ 2025, Baltimore MD, 8-12 September 2025; NASA NTRS %s, Table 3\n"
            "# url: %s\n"
            "# retrieved: %s\n"
            "# source_sha256: %s\n"
            "# published_frame: ICRF, as stated by the source; used as such, no frame "
            "approximation\n"
            "# source_caveat: the source states that these orbits are NOTIONAL and are only "
            "applicable for a preliminary performance analysis within the context of that "
            "publication\n"
            "# generator: tests/fixtures/lunar_ephemeris/generate_lans_demo_ntrs.py\n"
            "sat,name,sma_km,ecc,inc_deg,raan_deg,argp_deg,true_anom_deg\n"
            % (
                epoch_jd_tdb,
                EPOCH_UTC_TEXT,
                EPOCH_SCALE,
                NTRS_ID,
                SOURCE_URL,
                RETRIEVED,
                SOURCE_SHA256,
            )
        )
        for i, name in enumerate(COLUMN_NAMES):
            f.write(
                "%d,%s,%s,%s,%s,%s,%s,%s\n"
                % (
                    i,
                    name.replace(",", " "),
                    values["sma_km"][i],
                    values["ecc"][i],
                    values["inc_deg"][i],
                    values["raan_deg"][i],
                    values["argp_deg"][i],
                    values["true_anom_deg"][i],
                )
            )
    print("wrote %s (%d satellites)" % (out, len(COLUMN_NAMES)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
