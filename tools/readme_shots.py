#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Turn captured screenshots into the README's copies, and record how they were taken.

    python3 tools/readme_shots.py --studio <dir of capture_studio_shots.mjs output> \\
                                  --site <dir of capture_site_shots.mjs output> --captured YYYY-MM-DD

Nothing is drawn: the pictures are what the Studio and kshana.dev show. This tool only
scales, crops to a common height and compresses them:

  docs/assets/readme/studio/studio-<name>-<theme>.jpg   each Studio shot, at most 1600 px wide
  docs/assets/readme/studio/SHOTS.json                  the capture record of each
  docs/assets/readme/site/site-strip-<theme>.jpg        the three site shots side by side
  docs/assets/readme/site/SHOTS.json                    the capture record of each

JPEG quality 82, no metadata, Pillow's encoder: the same PNG files give the same bytes, and
tools/gen_readme_assets.py records every file's SHA-256 in MANIFEST.json, so a changed or
missing screenshot fails its --check.
"""
import argparse
import json
import sys
from pathlib import Path

from PIL import Image

REPO = Path(__file__).resolve().parent.parent
OUT = REPO / "docs" / "assets" / "readme"
MAX_W = 1600
QUALITY = 82
OUTPUT = f"scaled to at most {MAX_W} px wide, JPEG quality {QUALITY}, no metadata"

STUDIO_VIEWS = {
    "start": "Start screen: the five steps, search across scenarios, domains and fields, good first runs and domain tiles",
    "dashboard": "Dashboard after a run of l-band-waterfall-jamming: breadcrumb, the five numbered steps, key figures with PASS and FAIL chips, the panel row",
    "phone-steps": "Phone width (390 px) after a run of l-band-waterfall-jamming: the key figures, with the five steps as the step bar at the bottom of the screen",
    "lband": "Spectrum panel: the L-band waterfall under jamming",
    "coverage": "Coverage panel: the mean PDOP map of four GNSS constellations",
    "leo-chain": "End-to-end chain panel: the low-Earth-orbit chain from signal design to precise point positioning",
}
SITE_ORDER = ["home", "research", "editions"]
SITE_VIEWS = {
    "home": "Home hero: the mission console and the name line, Kshana · क्षण · the precise instant",
    "research": "Evidence, Published research: the arXiv papers built on the open engine",
    "editions": "Editions, Same engine, amplified: what Kshana Pro adds to the open engine",
}
STRIP_W = MAX_W
GAP = 24
PAD = 24


def save_jpeg(img, path):
    path.parent.mkdir(parents=True, exist_ok=True)
    img.convert("RGB").save(path, "JPEG", quality=QUALITY, optimize=True, progressive=False)


def scaled(img, width):
    if img.width <= width:
        return img
    return img.resize((width, round(img.height * width / img.width)), Image.LANCZOS)


def studio(src, captured):
    rec = json.loads((src / "shots.json").read_text())
    shots = []
    for r in rec:
        stem = Path(r["file"]).stem
        name = stem[len("studio-"):stem.rindex("-")]
        if name not in STUDIO_VIEWS:
            sys.exit(f"{r['file']}: no view description for {name!r} in STUDIO_VIEWS")
        out = OUT / "studio" / f"{stem}.jpg"
        save_jpeg(scaled(Image.open(src / r["file"]), MAX_W), out)
        shots.append({"file": out.name, "studio_url": r["url"], "scenario": r["scenario"], "view": STUDIO_VIEWS[name],
                      "tab": r["tab"], "replay_frame": r["replay_frame"], "theme": r["theme"],
                      "viewport_css_px": r["viewport"], "device_scale_factor": r["device_scale_factor"],
                      "crop_css_px": r["crop_css_px"], "output": OUTPUT, "captured": captured})
        print(out.relative_to(REPO))
    doc = {"tool": "tools/capture_studio_shots.mjs, then tools/readme_shots.py",
           "note": "Real screenshots of Kshana Studio running in the browser engine (WebAssembly): two flow shots (the start screen, and the dashboard after a run), one phone-width shot with the bottom step bar, and three panel shots (the panel row plus the first visual card of the named panel). Nothing is drawn or edited.",
           "shots": shots}
    (OUT / "studio" / "SHOTS.json").write_text(json.dumps(doc, indent=2, ensure_ascii=False) + "\n")


def site(src, captured):
    rec = {Path(r["file"]).stem: r for r in json.loads((src / "shots.json").read_text())}
    shots = []
    for theme in ("light", "dark"):
        imgs = [Image.open(src / rec[f"site-{n}-{theme}"]["file"]).convert("RGB") for n in SITE_ORDER]
        cell_w = (STRIP_W - 2 * PAD - GAP * (len(imgs) - 1)) // len(imgs)
        cells = [scaled(i, cell_w) for i in imgs]
        cell_h = min(c.height for c in cells)
        cells = [c.crop((0, 0, cell_w, cell_h)) for c in cells]
        # The strip's ground is the page ground of the first shot (its top-left pixel).
        ground = imgs[0].getpixel((2, 2))
        strip = Image.new("RGB", (STRIP_W, cell_h + 2 * PAD), ground)
        for k, c in enumerate(cells):
            strip.paste(c, (PAD + k * (cell_w + GAP), PAD))
        out = OUT / "site" / f"site-strip-{theme}.jpg"
        save_jpeg(strip, out)
        print(out.relative_to(REPO))
        for n in SITE_ORDER:
            r = rec[f"site-{n}-{theme}"]
            shots.append({"strip": out.name, "position": SITE_ORDER.index(n) + 1, "site_url": r["url"], "section": r["section"],
                          "view": SITE_VIEWS[n], "theme": theme, "viewport_css_px": r["viewport"],
                          "device_scale_factor": r["device_scale_factor"], "crop_css_px": r["crop_css_px"],
                          "output": f"three shots side by side, each scaled to {cell_w} px wide and cut to a common {cell_h} px height, on a {STRIP_W} px strip; JPEG quality {QUALITY}, no metadata",
                          "captured": captured})
    doc = {"tool": "tools/capture_site_shots.mjs, then tools/readme_shots.py",
           "note": "Real screenshots of kshana.dev as built from web/ for this release: the Home hero, Evidence's Published research and Editions' Same engine, amplified. Nothing is drawn or edited.",
           "shots": shots}
    (OUT / "site" / "SHOTS.json").write_text(json.dumps(doc, indent=2, ensure_ascii=False) + "\n")


def main():
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--studio", type=Path, help="output folder of tools/capture_studio_shots.mjs")
    ap.add_argument("--site", type=Path, help="output folder of tools/capture_site_shots.mjs")
    ap.add_argument("--captured", required=True, help="the capture date, YYYY-MM-DD")
    a = ap.parse_args()
    if not (a.studio or a.site):
        sys.exit("give --studio, --site or both")
    if a.studio:
        studio(a.studio, a.captured)
    if a.site:
        site(a.site, a.captured)


if __name__ == "__main__":
    main()
