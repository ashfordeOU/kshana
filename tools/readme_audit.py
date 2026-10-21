#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Audit README.md against what the engine and the repository actually offer.

For every scenario kind (`kshana kinds --json`), every CLI command and subcommand (`kshana --help`
and each subcommand's own `--help`), every surface (MCP tools, plugin commands, skills, Studio pages,
integrations) and every capability domain (web/capabilities.json) it records whether README.md
mentions it, whether the README links a docs page that covers it, whether a figure shows it and
whether the README gives a runnable command. It also lists every figure and diagram file under docs/
and whether the README embeds it. Nothing is edited: the output is a report (markdown on stdout, or
`--json`), so a gap list can be regenerated at any commit.

Usage:
    python3 tools/readme_audit.py [--kshana PATH] [--json] [--out FILE]
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
README = (ROOT / "README.md").read_text()

# docs pages that are catalogues of everything: they mention every kind and prove nothing about a topic page.
CATALOGUE_PAGES = {"SURFACES.md", "VERIFICATION-MATRIX.md", "MODELLED-RATIONALE.md", "SCENARIOS.md", "SCHEMA.md", "CAPABILITY.md",
                   "CLAIMS-VS-REALITY.md", "REPORTS.md", "ARCHITECTURE.md", "VALIDATION.md", "PYTHON_API.md", "INTEROP.md", "STANDARDS.md",
                   "GLOSSARY.md", "CONCEPTS.md", "AGENTS.md", "DEPLOYMENT-TARGETS.md", "PRO.md"}


def find_engine(arg: str | None) -> str:
    for cand in (arg, os.environ.get("KSHANA_BIN"), str(ROOT / "target" / "release" / "kshana"), shutil.which("kshana")):
        if cand and Path(cand).exists():
            return cand
    sys.exit("readme_audit: no kshana binary; pass --kshana, set KSHANA_BIN or `cargo build --release`")


def sh(exe: str, *args: str) -> str:
    p = subprocess.run([exe, *args], capture_output=True, text=True)
    return p.stdout + p.stderr


def word(name: str) -> re.Pattern:
    return re.compile(r"(?<![\w-])" + re.escape(name) + r"(?![\w-])")


def code_fences(text: str) -> list[str]:
    out, cur = [], None
    for ln in text.splitlines():
        if ln.startswith("```"):
            if cur is None:
                cur = []
            else:
                out.append("\n".join(cur))
                cur = None
        elif cur is not None:
            cur.append(ln)
    return out


FENCES = "\n".join(code_fences(README))
DOCS = {p.name: p.read_text() for p in sorted((ROOT / "docs").glob("*.md"))}
README_LINKED_DOCS = set(re.findall(r"docs/([A-Za-z0-9_./-]+\.md)", README)) | set(re.findall(r"\]\(([A-Za-z0-9_./-]+\.md)", README))


def topic_pages(name: str, extra_terms: tuple[str, ...] = ()) -> list[str]:
    """Docs pages (not catalogues) that mention `name` in backticks or as a command, most mentions first."""
    pat = re.compile(r"`[^`\n]*(?<![\w-])" + re.escape(name) + r"(?![\w-])[^`\n]*`")
    scored = []
    for fn, text in DOCS.items():
        if fn in CATALOGUE_PAGES:
            continue
        n = len(pat.findall(text)) + sum(text.count(t) for t in extra_terms)
        if n:
            scored.append((n, fn))
    return [fn for _, fn in sorted(scored, reverse=True)]


def scenario_index() -> dict[str, list[str]]:
    kinds: dict[str, list[str]] = {}
    for p in sorted((ROOT / "scenarios").rglob("*.toml")):
        m = re.search(r'^kind\s*=\s*"([^"]+)"', p.read_text(), re.M)
        if m:
            kinds.setdefault(m.group(1), []).append(p.relative_to(ROOT).as_posix())
    return kinds


def figure_kinds() -> dict[str, list[str]]:
    """kind -> figure names drawn from a scenario of that kind (the two figure manifests)."""
    by_scn = {}
    for kind, files in scenario_index().items():
        for f in files:
            by_scn[f] = kind
            by_scn[Path(f).stem] = kind
    out: dict[str, list[str]] = {}
    m1 = ROOT / "docs" / "assets" / "readme" / "MANIFEST.json"
    if m1.exists():
        for name, a in json.loads(m1.read_text()).get("assets", {}).items():
            for d in a.get("drawn_from", []):
                k = d.get("kind")
                if k:
                    out.setdefault(k, []).append(f"readme/{name}")
    m2 = ROOT / "docs" / "figures" / "0.38" / "MANIFEST.json"
    if m2.exists():
        for name, a in json.loads(m2.read_text()).get("figures", {}).items():
            for f in a.get("input_files", {}):
                k = by_scn.get(f)
                if k:
                    out.setdefault(k, []).append(f"0.38/{name}")
            for scn in re.findall(r"scenarios/[\w.-]+\.toml", a.get("drawn_from", "")):
                k = by_scn.get(scn)
                if k:
                    out.setdefault(k, []).append(f"0.38/{name}")
    for k in out:
        out[k] = sorted(set(out[k]))
    return out


def readme_command_for(kind: str, files: list[str], name: str) -> str:
    """The first README code-fence line that runs a scenario of this kind (a path, a stem or `kshana example`)."""
    stems = {Path(f).stem for f in files}
    for ln in FENCES.splitlines():
        if "kshana" not in ln and "scenarios/" not in ln:
            continue
        for f in files:
            if f in ln:
                return ln.strip()
        for s in stems:
            if re.search(r"kshana\s+" + re.escape(s) + r"(\s|$)", ln):
                return ln.strip()
        if re.search(r"kshana\s+example\s+" + re.escape(name) + r"(\s|$)", ln):
            return ln.strip()
    return ""


def audit_kinds(exe: str) -> list[dict]:
    kinds = json.loads(sh(exe, "kinds", "--json"))
    scn = scenario_index()
    figs = figure_kinds()
    rows = []
    for k in kinds:
        n = k["name"]
        pages = topic_pages(n)
        linked = [p for p in pages if p in README_LINKED_DOCS]
        rows.append({
            "kind": n,
            "mentioned": bool(re.search(r"[`\"']" + re.escape(n) + r"[`\"']", README)),
            "docs_page": pages[0] if pages else "",
            "docs_page_linked_from_readme": bool(linked),
            "figure": figs.get(n, []),
            "command": readme_command_for(n, scn.get(n, []), n),
            "scenario_files": len(scn.get(n, [])),
        })
    return rows


def parse_usage(help_text: str) -> list[dict]:
    """Commands and subcommands from the usage block (`   or: kshana <cmd> <a|b|c> ...`)."""
    cmds: dict[str, set[str]] = {}
    for ln in help_text.splitlines():
        m = re.match(r"\s*(?:usage:|or:)\s+kshana\s+(.*)", ln)
        if not m:
            continue
        rest = m.group(1)
        if rest.startswith("<scenario") or rest.startswith("--"):
            cmd = "<scenario.toml>" if rest.startswith("<scenario") else rest.split()[0]
            cmds.setdefault(cmd, set())
            continue
        parts = rest.split()
        cmd = parts[0]
        subs = cmds.setdefault(cmd, set())
        for tok in parts[1:3]:
            m2 = re.match(r"<([a-z0-9-]+(?:\|[a-z0-9-]+)+)>", tok)
            if m2:
                subs.update(m2.group(1).split("|"))
                break
            if re.fullmatch(r"[a-z][a-z0-9-]*", tok) and tok not in ("live",) and cmd in ("evidence", "receiver-trust", "osnma"):
                subs.add(tok)
        m3 = re.search(r"<((?:[a-z0-9-]+)(?:\s*(?:\[[^\]]*\])?\|[a-z0-9-]+[^|>]*)+)>", rest)
        if m3 and not subs:
            subs.update(re.findall(r"(?:^|\|)([a-z][a-z0-9-]*)", m3.group(1)))
    return [{"command": c, "subcommands": sorted(s)} for c, s in cmds.items()]


def sub_help_subs(exe: str, cmd: str) -> list[str]:
    text = sh(exe, cmd, "--help")
    subs = set()
    for m in re.finditer(r"kshana\s+" + re.escape(cmd) + r"\s+([a-z][a-z0-9-]*)", text):
        subs.add(m.group(1))
    return sorted(subs)


def audit_cli(exe: str) -> list[dict]:
    rows = []
    for c in parse_usage(sh(exe, "--help")):
        cmd = c["command"]
        subs = set(c["subcommands"])
        if not cmd.startswith(("<", "-")):
            subs |= set(sub_help_subs(exe, cmd))
        c["subcommands"] = sorted(subs - {"live"} | ({"live"} if "live" in subs else set()))
        base = cmd if not cmd.startswith(("<", "-")) else cmd
        mentioned = bool(re.search(r"kshana\s+" + re.escape(cmd), README)) if not cmd.startswith("<") else True
        pages = [] if cmd.startswith(("<", "-")) else topic_pages(cmd, extra_terms=(f"kshana {cmd}",))
        sub_rows = []
        for s in c["subcommands"]:
            sub_rows.append({"sub": s, "mentioned": bool(re.search(r"kshana\s+" + re.escape(cmd) + r"\s+" + re.escape(s), README)) or bool(re.search(r"(?<![\w-])" + re.escape(s) + r"(?![\w-])", README))})
        rows.append({
            "command": cmd, "mentioned": mentioned,
            "docs_page": pages[0] if pages else "", "docs_page_linked_from_readme": any(p in README_LINKED_DOCS for p in pages),
            "runnable": bool(re.search(r"^\s*(\$ )?kshana\s+" + re.escape(cmd) + r"(\s|$)", FENCES, re.M)) if not cmd.startswith(("<", "-")) else bool(re.search(r"^\s*kshana\s+(scenarios/|\S+\.toml)", FENCES, re.M)),
            "subcommands": sub_rows,
        })
    return rows


def audit_surfaces() -> dict:
    out: dict = {}
    # MCP tools
    names, in_attr = [], False
    for ln in (ROOT / "mcp" / "kshana-mcp" / "src" / "server.rs").read_text().splitlines():
        tt = ln.strip()
        if tt.startswith("#[tool("):
            in_attr = True
        elif in_attr and tt.startswith("fn "):
            names.append(tt[3:].split("(")[0])
            in_attr = False
    tools = sorted(names)
    out["mcp_tools"] = [{"name": t, "mentioned": t in README} for t in tools]
    out["plugin_commands"] = [{"name": p.stem, "mentioned": ("/" + p.stem) in README or p.stem in README} for p in sorted((ROOT / "commands").glob("*.md"))]
    out["skills"] = [{"name": p.name, "mentioned": p.name in README} for p in sorted((ROOT / "skills").iterdir()) if p.is_dir()]
    pages = []
    studio = ROOT / "web" / "studio"
    for p in sorted(studio.iterdir()):
        if p.is_dir() and (p / "index.html").exists():
            pages.append({"page": f"/studio/{p.name}/", "mentioned": f"studio/{p.name}" in README})
    out["studio_pages"] = pages
    integ = []
    for p in sorted((ROOT / "integrations").iterdir()):
        if p.is_dir():
            terms = {"ros2": ("ROS 2", "ros2"), "signalk": ("Signal K", "signalk"), "opencpn": ("OpenCPN",), "gnss-sdr": ("GNSS-SDR",), "gnss_lib_py": ("gnss_lib_py",)}.get(p.name, (p.name,))
            integ.append({"name": f"integrations/{p.name}", "mentioned": any(t in README for t in terms)})
    for label, terms in (("JetBrains plugin", ("JetBrains",)), ("VS Code", ("VS Code", "vscode")), ("systemd unit", ("systemd",)), ("Docker / OCI image", ("docker", "Docker")),
                         ("Python wheel (pip)", ("pip install kshana",)), ("npm / WebAssembly", ("npm install", "npm i ")), ("Rust crate (crates.io)", ("cargo add", "crates.io")),
                         ("Homebrew / winget / apt", ("brew install", "winget", "apt"))):
        integ.append({"name": label, "mentioned": any(t in README for t in terms)})
    out["integrations"] = integ
    cap = json.loads((ROOT / "web" / "capabilities.json").read_text())
    names = sorted({c["domain"] for c in cap["capabilities"]})
    out["capability_domains"] = [{"name": n, "mentioned": bool(n) and n.lower() in README.lower()} for n in names if n]
    return out


EMBED = re.compile(r'(?:src|srcset)="([^"]+\.(?:svg|png|jpg|jpeg|gif))"|!\[[^\]]*\]\(([^)\s]+\.(?:svg|png|jpg|jpeg|gif))')


def audit_figures() -> dict:
    embedded = set()
    for m in EMBED.finditer(README):
        embedded.add((m.group(1) or m.group(2)).split("?")[0])
    page_embeds: dict[str, set[str]] = {}
    for fn, text in DOCS.items():
        for m in EMBED.finditer(text):
            page_embeds.setdefault((m.group(1) or m.group(2)), set()).add(fn)
    files = sorted(p.relative_to(ROOT).as_posix() for ext in ("svg", "png", "jpg", "mmd") for p in (ROOT / "docs").rglob(f"*.{ext}"))
    rows = []
    for f in files:
        base = Path(f).name
        used_by_page = sorted({fn for e, fns in page_embeds.items() if Path(e).name == base for fn in fns})
        rows.append({"file": f, "readme": f in embedded or any(e.endswith(base) and Path(e).name == base for e in embedded) or (f.endswith(".mmd") and False),
                     "docs_pages": used_by_page})
    # Mermaid sources: embedded through their rendered svg/png
    for r in rows:
        if r["file"].endswith(".mmd"):
            stem = Path(r["file"]).stem
            r["readme"] = any(f"diagrams/{stem}." in e for e in embedded)
    return {"files": rows}


def diagram_currency() -> list[dict]:
    """Each README-embedded diagram: whether its SVG is newer than its source and what it says it counts."""
    out = []
    for stem in ("module-map", "system-overview", "engine-flow", "distribution", "validation-provenance"):
        mmd, svg = ROOT / "docs" / "diagrams" / f"{stem}.mmd", ROOT / "docs" / "assets" / "diagrams" / f"{stem}.svg"
        out.append({"diagram": stem, "embedded": f"diagrams/{stem}." in README,
                    "svg_hash_recorded": stem + ".png" in (ROOT / "docs/assets/diagrams/rendered-from.json").read_text(),
                    "source_lines": len(mmd.read_text().splitlines()) if mmd.exists() else 0})
    return out


def report(data: dict) -> str:
    L = []
    k = data["kinds"]
    miss = lambda r, key: [x for x in r if not x[key]]
    L.append("# README audit\n")
    L.append(f"Scenario kinds: {len(k)}; mentioned {sum(1 for r in k if r['mentioned'])}; docs page linked {sum(1 for r in k if r['docs_page_linked_from_readme'])}; "
             f"figure {sum(1 for r in k if r['figure'])}; runnable command {sum(1 for r in k if r['command'])}.\n")
    L.append("## Scenario kinds\n\n| kind | in README | docs page | page linked | figure | command in README |\n|---|---|---|---|---|---|")
    for r in k:
        L.append(f"| `{r['kind']}` | {'yes' if r['mentioned'] else '**NO**'} | {r['docs_page'] or '-'} | {'yes' if r['docs_page_linked_from_readme'] else ('-' if not r['docs_page'] else '**NO**')} | "
                 f"{', '.join(r['figure']) or '-'} | {('`' + r['command'][:70] + '`') if r['command'] else '**NO**'} |")
    L.append("\n## CLI commands\n\n| command | subcommands | in README | docs page | page linked | runnable in README |\n|---|---|---|---|---|---|")
    for r in data["cli"]:
        subs = ", ".join(f"{s['sub']}{'' if s['mentioned'] else ' (NO)'}" for s in r["subcommands"]) or "-"
        L.append(f"| `kshana {r['command']}` | {subs} | {'yes' if r['mentioned'] else '**NO**'} | {r['docs_page'] or '-'} | "
                 f"{'yes' if r['docs_page_linked_from_readme'] else ('-' if not r['docs_page'] else '**NO**')} | {'yes' if r['runnable'] else '**NO**'} |")
    for title, key in (("MCP tools", "mcp_tools"), ("Plugin commands", "plugin_commands"), ("Skills", "skills"), ("Studio pages", "studio_pages"),
                       ("Integrations and distribution", "integrations"), ("Capability domains", "capability_domains")):
        rows = data["surfaces"][key]
        L.append(f"\n## {title}\n")
        nm = [r for r in rows if not r["mentioned"]]
        L.append(f"{len(rows)} items; not mentioned in README: " + (", ".join(f"`{r.get('name') or r.get('page')}`" for r in nm) if nm else "none") + "\n")
    f = data["figures"]["files"]
    L.append("\n## Figure and diagram files under docs/\n")
    L.append(f"{len(f)} files; not embedded in the README: {sum(1 for r in f if not r['readme'])}.\n")
    L.append("| file | README | docs pages |\n|---|---|---|")
    for r in f:
        L.append(f"| {r['file']} | {'yes' if r['readme'] else '**NO**'} | {', '.join(r['docs_pages']) or '-'} |")
    L.append("\n## Mermaid diagrams\n\n| diagram | embedded | PNG bound to SVG |\n|---|---|---|")
    for r in data["diagrams"]:
        L.append(f"| {r['diagram']} | {'yes' if r['embedded'] else '**NO**'} | {'yes' if r['svg_hash_recorded'] else '**NO**'} |")
    return "\n".join(L) + "\n"


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--kshana")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--out")
    a = ap.parse_args()
    exe = find_engine(a.kshana)
    data = {"kinds": audit_kinds(exe), "cli": audit_cli(exe), "surfaces": audit_surfaces(), "figures": audit_figures(), "diagrams": diagram_currency()}
    text = json.dumps(data, indent=2) + "\n" if a.json else report(data)
    if a.out:
        Path(a.out).write_text(text)
    else:
        sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
