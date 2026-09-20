#!/usr/bin/env python3
"""Regenerate web/og-card.png — the social/link-preview card — from the evidence ledger.

WHY THIS EXISTS
    The card is the image every link preview renders: LinkedIn, Slack, iMessage, Twitter.
    It was committed once as a bare PNG with no source and never regenerated, and it spent
    months telling every reader "56 of 102 validated against external oracles" while the
    ledger held 59 of 134 — a total wrong by thirty-two rows, on the most-shared surface
    the project has. Nothing could have caught it: a count inside a rendered image is
    invisible to every doc-sync test, and there was no source to check it against.

    Now the count comes from web/data/verification-matrix.json (itself generated from
    src/verification.rs), the SVG that carries it is committed and text-searchable, and
    tests/web_validation_counts_doc_sync.rs pins that text to the ledger and binds the PNG
    to the SVG it was rendered from.

USAGE
    python3 tools/gen_og_card.py            # rewrite the count, re-render, update the record
    python3 tools/gen_og_card.py --check    # report drift, change nothing (exit 1 if stale)

Requires rsvg-convert (brew install librsvg).
"""

import argparse
import hashlib
import json
import pathlib
import re
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
MATRIX = ROOT / "web/data/verification-matrix.json"
SVG = ROOT / "web/og-card.svg"
PNG = ROOT / "web/og-card.png"
RECORD = ROOT / "web/og-card.rendered-from.json"

# The one sentence on the card that carries numbers. Kept as a pattern so the generator
# rewrites it rather than rebuilding the card, and so the test can assert the same shape.
COUNT_RE = re.compile(r"\d+ of \d+ validated against external oracles")


def counts():
    s = json.loads(MATRIX.read_text())["summary"]
    return s["validated"], s["total"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true", help="report drift without writing")
    args = ap.parse_args()

    validated, total = counts()
    want = f"{validated} of {total} validated against external oracles"
    svg = SVG.read_text()

    found = COUNT_RE.search(svg)
    if not found:
        sys.exit(f"{SVG}: no '<n> of <n> validated against external oracles' string to update")

    if args.check:
        stale = []
        if found.group(0) != want:
            stale.append(f"  {SVG.name}: says {found.group(0)!r}, ledger says {want!r}")
        if RECORD.exists():
            rec = json.loads(RECORD.read_text())
            actual = hashlib.sha256(SVG.read_bytes()).hexdigest()
            if rec.get("svg_sha256") != actual:
                stale.append(f"  {PNG.name}: rendered from an older {SVG.name}")
        else:
            stale.append(f"  {RECORD.name}: missing, so nothing binds the PNG to its SVG")
        if stale:
            print("og-card is stale:\n" + "\n".join(stale))
            return 1
        print(f"og-card is current: {want}")
        return 0

    if found.group(0) != want:
        svg = COUNT_RE.sub(want, svg, count=1)
        SVG.write_text(svg)
        print(f"  {SVG.name}: count -> {want}")
    else:
        print(f"  {SVG.name}: count already {want}")

    subprocess.run(["rsvg-convert", "-w", "1200", "-h", "630", str(SVG), "-o", str(PNG)],
                   check=True)
    print(f"  {PNG.name}: re-rendered at 1200x630")

    RECORD.write_text(json.dumps({
        "note": ("Binds web/og-card.png to the exact web/og-card.svg bytes it was rendered "
                 "from. The card states a count that no test can read out of a PNG, so the "
                 "SVG's text is pinned to the evidence ledger and this record catches a PNG "
                 "left behind by an SVG edit. Regenerate both with tools/gen_og_card.py."),
        "png": PNG.name,
        "svg": SVG.name,
        "svg_sha256": hashlib.sha256(SVG.read_bytes()).hexdigest(),
    }, indent=2) + "\n")
    print(f"  {RECORD.name}: updated")
    return 0


if __name__ == "__main__":
    sys.exit(main())
