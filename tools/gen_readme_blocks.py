#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Keep the README's generated blocks in step with the engine and the repository.

Two blocks in README.md sit between marker comments and are rewritten here, never by hand:

    README.md   <!-- generated:kind-families -->   the families the scenario kinds are filed under, with a page
                                                    (docs/kinds/<family>.md) and one command each;
    docs/CAPABILITY-DOMAINS.md  <!-- generated:domains -->   every capability domain of web/capabilities.json
                                                    with its capabilities and their ledger labels.

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

sys.path.insert(0, str(Path(__file__).resolve().parent))
from kind_families import BLURB, FAMILIES, slug  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
README = ROOT / "README.md"
DOMAINS_DOC = ROOT / "docs" / "CAPABILITY-DOMAINS.md"

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
    L = ["| Family | What it answers | Kinds | Run one |", "|---|---|---|---|"]
    for fam, pages, cmd, ks in FAMILIES:
        L.append(f"| **[{fam}](docs/kinds/{slug(fam)}.md)** | {BLURB[fam]} | {len(ks)} | `{cmd}` |")
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
    old_readme, old_domains = README.read_text(), DOMAINS_DOC.read_text()
    new_readme = apply(old_readme, "kind-families", kind_families_block(exe))
    new_domains = apply(old_domains, "domains", domains_block())
    if a.check:
        if new_readme != old_readme or new_domains != old_domains:
            print("gen_readme_blocks: a generated block is out of date")
            return 1
        print("gen_readme_blocks: generated blocks up to date")
        return 0
    README.write_text(new_readme)
    DOMAINS_DOC.write_text(new_domains)
    print("gen_readme_blocks: generated blocks written")
    return 0


if __name__ == "__main__":
    sys.exit(main())
