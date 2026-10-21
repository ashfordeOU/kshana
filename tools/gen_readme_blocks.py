#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Keep the README's generated blocks in step with the engine and the repository.

Two blocks in README.md sit between marker comments and are rewritten here, never by hand:

    <!-- generated:kind-families -->   every scenario kind the engine dispatches, filed under one family,
                                       with a docs page and one command per family;
    <!-- generated:domains -->         every capability domain of web/capabilities.json with its capabilities
                                       and their ledger labels.

A kind the engine adds and that no family below names makes this script fail, so a new kind cannot be
left out of the README. `--check` fails if the README differs from what would be written.

Usage:
    python3 tools/gen_readme_blocks.py [--kshana PATH] [--check]
"""
from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
README = ROOT / "README.md"

# family -> (docs pages, one command that runs a kind of the family, kinds)
FAMILIES = [
    ("Clocks, timing and holdover", ("docs/TELECOM-TIMING.md", "docs/SLOT-TIMING.md", "docs/TIMING-HIL.md", "docs/CLOCK-LOG-FORMATS.md"), "kshana scenarios/clock-holdover.toml",
     ["clock", "sweep", "sweep-nd", "telecom-timing", "slot-timing", "timetransfer", "time-transfer-budget", "holdover-test", "quantum-time-transfer"]),
    ("Inertial, fusion and quantum sensors", ("docs/QUANTUM-MODELS.md", "docs/QUANTUM.md", "docs/LEO-PNT-FUSION.md"), "kshana scenarios/gnss-ins.toml",
     ["inertial", "hybrid", "fusion", "hybrid-ukf", "gnss-ins", "ins-trn-coast", "quantum-gnss-free-nav", "quantum-anomaly-detect", "quantum-trade"]),
    ("GPS-denied alternative PNT", ("docs/CAPABILITY.md", "docs/RESILIENCE-CROSSWALK.md"), "kshana scenarios/combined-altpnt.toml",
     ["gravity-map", "terrain-nav", "terrain-slam", "combined-altpnt", "conflict-resilience"]),
    ("Constellations, coverage and geometry", ("docs/CONSTELLATION-DESIGN.md", "docs/COVERAGE.md", "docs/SOLAR-SYSTEM.md", "docs/SKYLINE.md"), "kshana scenarios/orbit-gnss-challenged.toml",
     ["orbit", "ephemeris", "constellation-design", "solar-system", "body-pnt", "mars-pnt", "passes"]),
    ("GNSS measurements, positioning and integrity", ("docs/INTEGRITY.md", "docs/POSITIONING.md", "docs/ARAIM_REFERENCE.md", "docs/OSNMA.md"), "kshana scenarios/integrity-raim.toml",
     ["integrity", "gnss-sim", "pvt", "araim-reference-check", "space-weather", "realtime-frame-eop"]),
    ("Jamming, spoofing and the spectrum", ("docs/SPECTRUM.md", "docs/DECEIVED-TIME.md", "docs/IQ-FOLLOW.md"), "kshana scenarios/jamming-demo.toml",
     ["jamming", "spoof", "spoof-detect", "tracking-loop", "spectrum", "impairment-eval"]),
    ("Low-Earth-orbit navigation", ("docs/LEO-PNT.md", "docs/LEO-SIGNAL.md", "docs/LEO-PASS.md", "docs/LEO-NAVMSG.md"), "kshana scenarios/leo-pnt-end-to-end.toml",
     ["leo-signal", "leo-pass", "leo-navmsg", "leo-pvt", "leo-ppp", "ntn-positioning", "leo-pnt-chain"]),
    ("Lunar and cislunar", ("docs/LUNAR-REFERENCE-STATION.md", "docs/LUNAR-INFRASTRUCTURE.md", "docs/LUNANET-AFS.md"), "kshana scenarios/lunar-infrastructure-od-consistency.toml",
     ["lunar-integrity", "lunar-time-offset", "lunar-time-budget", "lunar-vlbi", "lunar-vlbi-fim", "lunar-joint-od-clock", "lunar-frame-realisation",
      "lunar-frame-campaign", "lunar-llr-datum", "moonlight-service-volume", "lunar-differential-pnt", "lunar-station-coverage", "lunar-beacon",
      "lunar-interop-export", "cislunar-observability", "cislunar-arc-recovery", "lunar-attack-surface", "lunar-jamming", "earth-gnss-lunar",
      "lunar-infrastructure"]),
    ("Space-user navigation", ("docs/SSV.md",), "kshana scenarios/gnss-ssv-shell.toml", ["gnss-ssv"]),
    ("Optical PNT", ("docs/OPTICAL-ATMOSPHERE.md",), "kshana scenarios/optical-atmosphere-network.toml", ["optical-atmosphere", "hybrid-optical-rf"]),
    ("Mission analysis, links and space operations", ("docs/ENTRY-EO-ASCENT.md", "docs/CONTACT-SCHEDULING.md", "docs/AOCS.md"), "kshana scenarios/launch-window.toml",
     ["launch-window", "ascent-losses", "reentry", "entry-heating", "eo-coverage", "eo-radiometry", "attitude-budget", "aocs", "link-budget",
      "acm-link", "contact-schedule", "aperture-duty-cycle", "space-packet", "oem-interop"]),
    ("Campaigns", ("docs/CAMPAIGNS.md",), "kshana scenarios/campaign-jam-spoof-holdover-integrity.toml", ["campaign"]),
]


def find_engine(arg):
    for c in (arg, os.environ.get("KSHANA_BIN"), str(ROOT / "target" / "release" / "kshana"), shutil.which("kshana")):
        if c and Path(c).exists():
            return c
    sys.exit("gen_readme_blocks: no kshana binary; pass --kshana, set KSHANA_BIN or `cargo build --release`")


def kind_families_block(exe: str) -> str:
    kinds = [k["name"] for k in json.loads(subprocess.run([exe, "kinds", "--json"], capture_output=True, text=True, check=True).stdout)]
    filed = [k for _, _, _, ks in FAMILIES for k in ks]
    missing = sorted(set(kinds) - set(filed))
    extra = sorted(set(filed) - set(kinds))
    dup = sorted({k for k in filed if filed.count(k) > 1})
    if missing or extra or dup:
        sys.exit(f"gen_readme_blocks: kinds not filed under a family: {missing}; named but not dispatched: {extra}; filed twice: {dup}")
    for _, pages, cmd, _ in FAMILIES:
        for page in pages:
            if not (ROOT / page).exists():
                sys.exit(f"gen_readme_blocks: {page} does not exist")
        scn = re.search(r"scenarios/\S+", cmd)
        if scn and not (ROOT / scn.group(0)).exists():
            sys.exit(f"gen_readme_blocks: {scn.group(0)} does not exist")
    L = ["| Family | Kinds | Docs | Run one |", "|---|---|---|---|"]
    for fam, pages, cmd, ks in FAMILIES:
        links = ", ".join(f"[`{k}`](docs/KINDS.md#{k})" for k in ks)
        docs = ", ".join(f"[{Path(p).stem}]({p})" for p in pages)
        L.append(f"| **{fam}** | {links} | {docs} | `{cmd}` |")
    return "\n".join(L)


def domains_block() -> str:
    cap = json.loads((ROOT / "web" / "capabilities.json").read_text())["capabilities"]
    by: dict[str, list[dict]] = {}
    for c in cap:
        by.setdefault(c["domain"], []).append(c)
    L = ["| Domain | Capabilities | Labels |", "|---|---|---|"]
    for d in sorted(by):
        items = by[d]
        names = "; ".join(c["name"] for c in items)
        labs: dict[str, int] = {}
        for c in items:
            labs[c["status"]] = labs.get(c["status"], 0) + 1
        lab = ", ".join(f"{n} {s}" for s, n in sorted(labs.items()))
        L.append(f"| **{d}** | {names} | {lab} |")
    return "\n".join(L)


def apply(text: str, name: str, body: str) -> str:
    pat = re.compile(r"(<!-- generated:" + re.escape(name) + r" -->\n).*?(<!-- /generated:" + re.escape(name) + r" -->)", re.S)
    if not pat.search(text):
        sys.exit(f"gen_readme_blocks: README.md has no <!-- generated:{name} --> block")
    return pat.sub(lambda m: m.group(1) + body + "\n" + m.group(2), text)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--kshana")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe = find_engine(a.kshana)
    old = README.read_text()
    new = apply(old, "kind-families", kind_families_block(exe))
    new = apply(new, "domains", domains_block())
    if a.check:
        if new != old:
            print("gen_readme_blocks: README.md generated blocks are out of date")
            return 1
        print("gen_readme_blocks: README.md generated blocks up to date")
        return 0
    README.write_text(new)
    print("gen_readme_blocks: README.md generated blocks written")
    return 0


if __name__ == "__main__":
    sys.exit(main())
