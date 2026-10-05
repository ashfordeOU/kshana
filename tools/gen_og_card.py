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
    src/verification.rs), the SVG that carries it is committed and text-searchable (the
    sentence is in its <desc>), and tests/web_validation_counts_doc_sync.rs pins that text
    to the ledger and binds the PNG to the SVG it was rendered from.

HOW IT IS DRAWN
    In the site's Observatory dark theme, with the README images' own machinery
    (tools/gen_readme_assets.py): the same colour tokens, the founder's mark recoloured the
    way the site recolours it, and every Latin word converted to outlines from the OFL fonts
    in tools/readme-fonts/ (Unbounded for the wordmark, Geist for text, Geist Mono for
    labels), so the render does not depend on the fonts a machine has installed. The one
    exception is the Devanagari क्षण, which needs conjunct shaping: it stays live text, set
    in Noto Sans Devanagari (the site's face) or the system's Devanagari font.

USAGE
    python3 tools/gen_og_card.py            # rewrite the SVG, re-render the PNG, update the record
    python3 tools/gen_og_card.py --check    # report drift, change nothing (exit 1 if stale)

Requires rsvg-convert (brew install librsvg) and what tools/gen_readme_assets.py requires
(fontTools, numpy, Pillow).
"""

import argparse
import hashlib
import json
import pathlib
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))
import gen_readme_assets as ra  # noqa: E402  (the README images' theme, fonts and SVG builder)

MATRIX = ROOT / "web/data/verification-matrix.json"
SVG = ROOT / "web/og-card.svg"
PNG = ROOT / "web/og-card.png"
RECORD = ROOT / "web/og-card.rendered-from.json"

W, H = 1200, 630
EYEBROW = "PNT-resilience simulator"
HEADLINE = ("Open, reproducible simulation of", "positioning, navigation & timing")
SUBLINE = "when GNSS is denied."
FOOT_L = "kshana.dev"
FOOT_R = "quantum · inertial · optical · AGPL-3.0"


def counts():
    s = json.loads(MATRIX.read_text())["summary"]
    return s["validated"], s["total"]


def card_svg() -> str:
    t = ra.DARK
    validated, total = counts()
    tally = f"{validated} of {total} validated against external oracles"
    desc = (f"Kshana, {EYEBROW.lower()}. {' '.join(HEADLINE)} {SUBLINE} {tally}. "
            f"{FOOT_L} · {FOOT_R}.")
    s = ra.Svg(W, H, "Kshana", desc)

    s.defs.append('<radialGradient id="glow" cx="0.82" cy="0.18" r="0.6">'
                  f'<stop offset="0" stop-color="{t["cyan"]}" stop-opacity="0.10"/>'
                  f'<stop offset="1" stop-color="{t["cyan"]}" stop-opacity="0"/></radialGradient>')
    s.rect(0, 0, W, H, fill=t["bg"])
    s.rect(0, 0, W, H, fill="url(#glow)")

    # the motto, quiet, top right (live text: Devanagari needs conjunct shaping)
    s.add(f'<text x="1128" y="196" text-anchor="end" font-family="Noto Sans Devanagari, Kohinoor Devanagari, '
          f'Devanagari MT, sans-serif" font-size="132" font-weight="500" fill="{t["bg3"]}">&#2325;&#2381;&#2359;&#2339;</text>')

    # the nav lockup: the mark, and kshana in Unbounded 500
    mark = 104
    s.add(f'<image href="{ra.png_data_uri(ra.mark_image(t))}" x="58" y="58" width="{mark}" height="{mark}"/>')
    s.text("kshana", 58 + mark - 2, 58 + mark * 0.495 + 44 * 0.36, 44, t["ink"], "display", 500, ls=-0.01)

    s.text(EYEBROW, 72, 226, 21, t["cyan"], "mono", 500, ls=0.16, upper=True)
    s.text(HEADLINE[0], 72, 306, 58, t["ink"], "sans", 600, ls=-0.028)
    s.text(HEADLINE[1], 72, 374, 58, t["ink"], "sans", 600, ls=-0.028)
    s.text(SUBLINE, 72, 430, 34, t["ink2"], "sans", 400, ls=-0.012)

    green = "#3DDC84"  # --s-itg, the site's validated colour on dark ground
    tw = ra.Face.get("sans", 600).width(tally, 26)
    s.rect(73, 470, tw + 100, 58, fill=ra.blend(green, t["bg"], 0.08), stroke=ra.blend(green, t["bg"], 0.55), sw=1.5, r=29)
    s.circle(108, 499, 8, fill=green)
    s.text(tally, 134, 508, 26, t["ink"], "sans", 600)

    s.text(FOOT_L, 72, 584, 20, t["ink3"], "mono", 400)
    s.text(FOOT_R, 1128, 584, 20, t["ink3"], "mono", 400, anchor="end")
    return s.render()


def record_for(svg_bytes: bytes) -> str:
    return json.dumps({
        "note": ("Binds web/og-card.png to the exact web/og-card.svg bytes it was rendered "
                 "from. The card states a count that no test can read out of a PNG, so the "
                 "SVG's text is pinned to the evidence ledger and this record catches a PNG "
                 "left behind by an SVG edit. Regenerate both with tools/gen_og_card.py."),
        "png": PNG.name,
        "svg": SVG.name,
        "svg_sha256": hashlib.sha256(svg_bytes).hexdigest(),
    }, indent=2) + "\n"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true", help="report drift without writing")
    args = ap.parse_args()

    want = card_svg()
    if args.check:
        stale = []
        if not SVG.exists() or SVG.read_text() != want:
            stale.append(f"  {SVG.name}: differs from what the generator draws from the ledger")
        if not RECORD.exists() or RECORD.read_text() != record_for(SVG.read_bytes() if SVG.exists() else b""):
            stale.append(f"  {PNG.name}: rendered from an older {SVG.name} (or {RECORD.name} missing)")
        if stale:
            print("og-card is stale:\n" + "\n".join(stale))
            return 1
        validated, total = counts()
        print(f"og-card is current: {validated} of {total} validated against external oracles")
        return 0

    SVG.write_text(want)
    print(f"  {SVG.name}: written ({len(want):,} bytes)")
    subprocess.run(["rsvg-convert", "-w", str(W), "-h", str(H), str(SVG), "-o", str(PNG)], check=True)
    print(f"  {PNG.name}: re-rendered at {W}x{H}")
    RECORD.write_text(record_for(SVG.read_bytes()))
    print(f"  {RECORD.name}: updated")
    return 0


if __name__ == "__main__":
    sys.exit(main())
