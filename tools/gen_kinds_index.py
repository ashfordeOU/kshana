#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write docs/KINDS.md, docs/kinds/<family>.md and the figures under docs/figures/kinds/ from the engine.

For every scenario kind the engine dispatches (`kshana kinds --json`) it runs one bundled example scenario
and writes: the engine's own description and fields; the example command; the headline numbers of that run (read
from its result.json through the result's own `units` block, so every number is from a run); the ledger rows
that name the kind, with their status, counted and quoted from web/data/verification-matrix.json; the docs
pages that cover it; and the chart the engine writes for the example (`<name>.chart.svg`, copied verbatim).
Per family it also writes a contact sheet: one tile per kind, each a real engine chart, labelled with the kind
and its ledger status. A kind whose example gives no chart is listed as "no plot: <reason>"; none is invented.
Nothing is drawn by hand and no count is typed in.

Usage:
    python3 tools/gen_kinds_index.py [--kshana PATH] [--check]

`--check` fails if a committed file differs. tests/readme_completeness_doc_sync.rs also pins, in Rust, the text
every entry takes from the engine (description, required and optional fields) so that part cannot drift.
"""
from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
from kind_families import FAMILIES, slug  # noqa: E402

ROOT = Path(__file__).resolve().parent.parent
DOCS = ROOT / "docs"
CATALOGUE = {"SURFACES.md", "VERIFICATION-MATRIX.md", "MODELLED-RATIONALE.md", "SCENARIOS.md", "SCHEMA.md", "CAPABILITY.md", "CLAIMS-VS-REALITY.md",
             "REPORTS.md", "ARCHITECTURE.md", "VALIDATION.md", "PYTHON_API.md", "INTEROP.md", "STANDARDS.md", "GLOSSARY.md", "CONCEPTS.md",
             "AGENTS.md", "DEPLOYMENT-TARGETS.md", "PRO.md", "KINDS.md", "COMMANDS.md", "ALL-SURFACES.md", "CAPABILITY-DOMAINS.md"}
# Examples that read a data directory the published crate does not ship are run from a tree that has it.
LINKED = ("tests", "data", "scenarios", "examples", "standards", "xval")
ADVISORY = ("Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a "
            "safety-of-life service. Every label here is the engine's or the verification matrix's; a kind "
            "is MODELLED unless the matrix says otherwise (how a label is earned: the README's Evidence section).")


def find_engine(arg):
    for c in (arg, os.environ.get("KSHANA_BIN"), str(ROOT / "target" / "release" / "kshana"), shutil.which("kshana")):
        if c and Path(c).exists():
            return c
    sys.exit("gen_kinds_index: no kshana binary; pass --kshana, set KSHANA_BIN or `cargo build --release`")


def scenario_kind(p: Path) -> str:
    m = re.search(r'^kind\s*=\s*"([^"]+)"', p.read_text(), re.M)
    return m.group(1) if m else "clock"  # a scenario with no `kind` is a clock-holdover scenario


def pick_example(kind: str, files: list[Path]) -> Path:
    exact = [p for p in files if p.stem == kind]
    if exact:
        return exact[0]
    pre = [p for p in files if p.stem.startswith(kind)]
    return sorted(pre or files, key=lambda p: (len(p.stem), p.stem))[0]


def ledger(kind: str, rows: list[dict]) -> list[dict]:
    """Rows whose capability text names the kind in backticks, or whose module field names it (as `lunar-vlbi` or `lunar_vlbi`)."""
    toks = [kind, kind.replace("-", "_")]
    cap = re.compile("|".join(r"`[^`\n]*(?<![\w-])" + re.escape(t) + r"(?![\w-])[^`\n]*`" for t in toks))
    mod = re.compile("|".join(r"(?<![\w-])" + re.escape(t) + r"(?![\w-])" for t in toks))
    return [r for r in rows if cap.search(str(r.get("capability", ""))) or mod.search(str(r.get("module", "")))]


def status_of(r: dict) -> str:
    return r["status"].upper().replace("PARTNER-OWNED", "PARTNER")


def label_of(rows: list[dict], fallback: str) -> str:
    counts: dict[str, int] = {}
    for r in rows:
        counts[status_of(r)] = counts.get(status_of(r), 0) + 1
    if not counts:
        return fallback
    return " · ".join(f"{s} {n}" if len(counts) > 1 else s for s, n in sorted(counts.items(), key=lambda kv: kv[0]))


def docs_pages(kind: str) -> list[str]:
    pat = re.compile(r"`[^`\n]*(?<![\w-])" + re.escape(kind) + r"(?![\w-])[^`\n]*`")
    scored = []
    for p in sorted(DOCS.glob("*.md")):
        if p.name in CATALOGUE:
            continue
        n = len(pat.findall(p.read_text()))
        if n:
            scored.append((-n, p.name))
    return [name for _, name in sorted(scored)[:2]]


def lookup(obj, path: str):
    cur = obj
    for part in path.split("."):
        if isinstance(cur, dict) and part in cur:
            cur = cur[part]
        else:
            return None
    return cur


def headline(result: dict, n: int = 6) -> list[tuple[str, str, str, str]]:
    """(path, value, unit, note) for the first scalar numbers the result's own `units` block describes."""
    out = []
    for path, meta in (result.get("units") or {}).items():
        if "[]" in path or not isinstance(meta, dict):
            continue
        v = lookup(result, path)
        if isinstance(v, bool) or not isinstance(v, (int, float)):
            continue
        if meta.get("provenance") == "input":
            continue
        out.append((path, f"{v:.6g}", str(meta.get("unit", "")), str(meta.get("note", ""))))
        if len(out) >= n:
            break
    return out


def run_example(exe: str, work: Path, scn: Path) -> dict:
    d = work / scn.stem
    d.mkdir()
    for name in LINKED:
        if (ROOT / name).exists():
            (d / name).symlink_to(ROOT / name)
    shutil.copyfile(scn, d / scn.name)
    p = subprocess.run([exe, scn.name], cwd=d, capture_output=True, text=True, timeout=300)
    chart = d / f"{scn.stem}.chart.svg"
    res = d / f"{scn.stem}.result.json"
    result = json.loads(res.read_text()) if res.exists() else {}
    rep = d / f"{scn.stem}.report.json"
    report = json.loads(rep.read_text()) if rep.exists() else {}
    return {"ok": p.returncode == 0, "report": report, "err": p.stderr.strip().splitlines()[-1][:200] if p.stderr.strip() else "", "result": result,
            "chart": (chart.read_bytes() or None) if chart.exists() else None}


def esc(s: str) -> str:
    return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace('"', "&quot;")


def tile_content(chart: bytes) -> tuple[float, float, str]:
    txt = chart.decode()
    m = re.search(r"<svg\b[^>]*>", txt, re.S)
    head = m.group(0)

    def attr(name: str):
        a = re.search(r"\s" + name + r"=[\"']([^\"']+)[\"']", head)
        return a.group(1) if a else None
    w, h = attr("width"), attr("height")
    if w and h and re.fullmatch(r"[\d.]+", w) and re.fullmatch(r"[\d.]+", h):
        wf, hf = float(w), float(h)
    else:
        vb = [float(x) for x in attr("viewBox").split()]
        wf, hf = vb[2], vb[3]
    return wf, hf, txt[m.end():txt.rindex("</svg>")]


def contact_sheet(family: str, tiles: list[tuple[str, str, bytes | None]], reason: dict[str, str]) -> bytes:
    cols, tw, pad, cap = 3, 440, 14, 44
    rows = (len(tiles) + cols - 1) // cols
    th = 235
    W = cols * (tw + pad) + pad
    H = 56 + rows * (th + cap + pad) + pad
    out = [f'<svg xmlns="http://www.w3.org/2000/svg" width="{W}" height="{H}" viewBox="0 0 {W} {H}" role="img" aria-labelledby="t d" '
           'font-family="Geist, ui-sans-serif, system-ui, sans-serif">',
           f'<title id="t">Contact sheet: {esc(family)}</title>',
           f'<desc id="d">One tile per scenario kind of the family {esc(family)}, each the chart the engine writes for a bundled example of that kind, '
           f'labelled with the kind and its ledger status: {esc("; ".join(f"{n} {lab}" for n, lab, _ in tiles))}. Modelled results from stated inputs, not measurements. '
           'Advisory: not type-approved navigation equipment.</desc>',
           f'<rect width="{W}" height="{H}" fill="#060A14"/>',
           f'<text x="{pad}" y="34" font-size="20" font-weight="600" fill="#EAF0FF">{esc(family)}</text>']
    for i, (name, lab, chart) in enumerate(tiles):
        x = pad + (i % cols) * (tw + pad)
        y = 56 + (i // cols) * (th + cap + pad)
        out.append(f'<rect x="{x}" y="{y}" width="{tw}" height="{th + cap}" rx="8" fill="#0D1528" stroke="#232B3E"/>')
        if chart is not None:
            w, h, inner = tile_content(chart)
            s = min((tw - 16) / w, (th - 8) / h)
            out.append(f'<svg x="{x + 8 + ((tw - 16) - w * s) / 2:.1f}" y="{y + 6}" width="{w * s:.1f}" height="{h * s:.1f}" viewBox="0 0 {w:g} {h:g}">{inner}</svg>')
        else:
            out.append(f'<text x="{x + 16}" y="{y + th / 2}" font-size="13" fill="#8190B0">no plot: {esc(reason.get(name, "no chart"))}</text>')
        out.append(f'<text x="{x + 12}" y="{y + th + 18}" font-size="13" font-weight="600" fill="#EAF0FF">{esc(name)}</text>')
        out.append(f'<text x="{x + 12}" y="{y + th + 35}" font-size="11" fill="#8190B0">{esc(lab)}</text>')
    out.append("</svg>")
    return ("\n".join(out) + "\n").encode()


def first_sentence(text: str, cap: int = 200) -> str:
    return re.split(r"(?<=\.)\s", text, maxsplit=1)[0][:cap]


def kind_section(k: dict, info: dict, rows: list[dict], files: list[Path], ex: Path | None, pages: list[str]) -> str:
    n = k["name"]
    L = [f"### `{n}`", "", k["description"], ""]
    req, opt = k.get("required_fields", []), k.get("optional_fields", [])
    L.append("Required fields: " + (", ".join(f"`{f}`" for f in req) or "none") + (". Optional: " + ", ".join(f"`{f}`" for f in opt) if opt else "") + ".")
    L.append("")
    L.append(f"**Ledger:** {label_of(rows, 'no matrix row names this kind; the engine labels its own result')}. Full page, with the inputs, results, evidence and limitations: [{n}](by-kind/{n}.md).")
    L.append("")
    if ex is None:
        L.append("No bundled scenario file; `kshana example` and the schema list the fields above. no plot: nothing to run.")
        L.append("")
    else:
        L.append(f"```sh\nkshana scenarios/{ex.name}\n```")
        L.append("")
        if info["chart"] is not None and info["ok"]:
            L.append(f'<img src="../figures/kinds/{n}.svg" alt="The chart the engine writes for scenarios/{ex.name}, kind {n}" width="640">')
        else:
            L.append(f"no plot: {info['err'] or 'the example writes no chart'}")
        L.append("")
    return "\n".join(L)


def fmt_value(v) -> str:
    return f"{v:.6g}" if isinstance(v, (int, float)) and not isinstance(v, bool) else str(v)


def kind_page(k: dict, info: dict, rows: list[dict], files: list[Path], ex: Path | None, pages: list[str], fam: str, fam_slug: str, version: str) -> str:
    n = k["name"]
    rep = info.get("report") or {}
    L = ["<!-- SPDX-License-Identifier: AGPL-3.0-only -->",
         "<!-- Generated by tools/gen_kinds_index.py from the engine, the schema, the verification matrix and one run of the example. Do not edit by hand. -->",
         f"# `{n}`", "",
         f"Scenario kind of the engine v{version}, family [{fam}](../{fam_slug}.md). " + ADVISORY, "",
         "## What it does", "", k["description"], ""]
    summ = (rep.get("executive_summary") or {}).get("summary")
    if summ and ex is not None:
        L += [f"One run of `scenarios/{ex.name}` summarises as: {summ}", ""]
    L += ["## Inputs", "", "From the schema (`kshana kinds --json`):", "",
          "- Required fields: " + (", ".join(f"`{f}`" for f in k.get("required_fields", [])) or "none"),
          "- Optional fields: " + (", ".join(f"`{f}`" for f in k.get("optional_fields", [])) or "none"), ""]
    items = (rep.get("inputs") or {}).get("items") or []
    if items and ex is not None:
        L += [f"The example `scenarios/{ex.name}` sets, among others:", "", "| Field | Value | Unit |", "|---|---|---|"]
        for it in items[:12]:
            L.append(f"| `{it['path']}` | {str(it.get('display', fmt_value(it.get('value'))))[:60].replace('|', '/')} | {it.get('unit') or ''} |")
        L.append("")
    L += ["## Run it", ""]
    if ex is None:
        L += ["No bundled scenario file. `kshana example` prints the bundled starting points, and the fields above are the schema.", ""]
    else:
        L += [f"```sh\nkshana scenarios/{ex.name}\n```", ""]
        if len(files) > 1:
            L += [f"{len(files)} bundled scenarios use this kind; the others are in [`scenarios/`](../../../scenarios/).", ""]
    L += ["## What it gives", ""]
    scal = ((rep.get("results") or {}).get("scalars") or {}).get("items") or []
    if scal:
        L += ["The scalar results of that run, with the units the engine states:", "", "| Result | Value | Unit |", "|---|---|---|"]
        for it in scal[:10]:
            L.append(f"| `{it['path']}` | {str(it.get('display', fmt_value(it.get('value'))))[:40]} | {it.get('unit') or ''} |")
        L.append("")
    label = (info["result"].get("label") or "").strip().splitlines()
    if label:
        L += [f"Result label (the engine's): {label[0][:300]}", ""]
    if info["chart"] is not None and info["ok"]:
        L += [f'<img src="../../figures/kinds/{n}.svg" alt="The chart the engine writes for scenarios/{ex.name}, kind {n}" width="640">', ""]
    else:
        L += [f"no plot: {info['err'] or 'the example writes no chart'}", ""]
    L += ["## Evidence", ""]
    if rows:
        L += [f"{label_of(rows, '')}: the [verification matrix](../../VERIFICATION-MATRIX.md) rows that name this kind.", ""]
        for r in rows[:4]:
            tl = r.get("test_links") or []
            link = f" Tests: [{Path(tl[0]['path']).name}](../../../{tl[0]['path']})." if tl and isinstance(tl[0], dict) else ""
            L.append(f"- **{status_of(r)}** {first_sentence(str(r['capability']), 240)}{link}")
        if len(rows) > 4:
            L.append(f"- and {len(rows) - 4} more in the matrix.")
        L.append("")
    else:
        L += ["No matrix row names this kind by name; the label on its result is the engine's own, above.", ""]
    caprows = (rep.get("capabilities") or {}).get("rows") or []
    if caprows:
        L += ["The rows the run itself exercised, with the oracle the matrix gives each (the public sources are named there):", ""]
        for r in caprows[:5]:
            L.append(f"- **{r.get('label')}** {r.get('capability', '')[:160]}. Oracle ({r.get('oracle_kind')}): {str(r.get('oracle', ''))[:420]}")
        L.append("")
    L += ["## Limitations", ""]
    nm = (rep.get("not_modelled") or {}).get("items") or []
    if nm:
        L += ["What the run's own report says is not modelled or not validated:", ""]
        for it in nm[:8]:
            L.append(f"- {it['text'][:420]} ({it.get('source', 'report')})")
        L.append("")
    else:
        L += ["The run's report lists no further limitation; the label above is the claim.", ""]
    L += ["## See also", "", f"- Family page: [{fam}](../{fam_slug}.md#{n})", "- All kinds: [KINDS.md](../../KINDS.md)"]
    for p in pages:
        L.append(f"- Topic page: [{p}](../../{p})")
    L.append("")
    return "\n".join(L)


def build(exe: str) -> dict[str, bytes]:
    version = subprocess.run([exe, "--version"], capture_output=True, text=True).stdout.split()[-1]
    kinds = {k["name"]: k for k in json.loads(subprocess.run([exe, "kinds", "--json"], capture_output=True, text=True, check=True).stdout)}
    filed = [k for _, _, _, ks in FAMILIES for k in ks]
    if sorted(filed) != sorted(kinds):
        sys.exit(f"gen_kinds_index: kinds not filed under a family: {sorted(set(kinds) - set(filed))}; filed but not dispatched: {sorted(set(filed) - set(kinds))}")
    by_kind: dict[str, list[Path]] = {}
    for p in sorted((ROOT / "scenarios").glob("*.toml")):
        by_kind.setdefault(scenario_kind(p), []).append(p)
    matrix = json.loads((ROOT / "web" / "data" / "verification-matrix.json").read_text())["rows"]
    out: dict[str, bytes] = {}
    infos: dict[str, dict] = {}
    exs: dict[str, Path | None] = {}
    with tempfile.TemporaryDirectory(prefix="kshana-kinds-") as work:
        for n in sorted(kinds):
            files = by_kind.get(n, [])
            exs[n] = pick_example(n, files) if files else None
            infos[n] = run_example(exe, Path(work), exs[n]) if exs[n] else {"ok": False, "err": "", "result": {}, "chart": None}
            if infos[n]["chart"] is not None and infos[n]["ok"]:
                out[f"figures/kinds/{n}.svg"] = infos[n]["chart"]
    rows_of = {n: ledger(n, matrix) for n in kinds}

    def fallback(n: str) -> str:
        w = ((infos[n]["result"].get("label") or "").split() or ["MODELLED"])[0].strip(":—-,").upper()
        return f"{w} (result label)"
    labels = {n: label_of(rows_of[n], fallback(n)) for n in kinds}
    index = ["<!-- SPDX-License-Identifier: AGPL-3.0-only -->",
             "<!-- Generated by tools/gen_kinds_index.py from the engine (`kshana kinds --json`), the bundled scenarios, web/data/verification-matrix.json and the "
             "charts the engine writes. Do not edit by hand. -->",
             "# Scenario kinds", "",
             f"Every scenario kind the engine v{version} dispatches ({len(kinds)}), filed under {len(FAMILIES)} families. Each family has a page with one entry per "
             "kind (the engine's description and fields, the example command, headline numbers from a run, the matrix rows that name it, and the chart the engine "
             "writes) and a contact sheet of those charts. " + ADVISORY,
             "", "## Families", ""]
    for fam, pages, cmd, ks in FAMILIES:
        sl = slug(fam)
        tiles = [(n, labels[n], infos[n]["chart"] if infos[n]["ok"] else None) for n in ks]
        reason = {n: (infos[n]["err"] or "the example writes no chart") for n in ks}
        out[f"figures/kinds/sheet-{sl}.svg"] = contact_sheet(fam, tiles, reason)
        fl = ["<!-- SPDX-License-Identifier: AGPL-3.0-only -->",
              "<!-- Generated by tools/gen_kinds_index.py. Do not edit by hand. -->",
              f"# {fam}", "",
              f"{len(ks)} scenario kind{'s' if len(ks) != 1 else ''} of the engine v{version}. " + ADVISORY, "",
              "Topic pages: " + ", ".join(f"[{Path(p).stem}](../{Path(p).name})" for p in pages) + f". Run one: `{cmd}`. All families: [KINDS.md](../KINDS.md).", "",
              f'<img src="../figures/kinds/sheet-{sl}.svg" alt="Contact sheet of the charts the engine writes for the kinds of the family {esc(fam)}" width="900">', "",
              "| Kind | What it does | Ledger |", "|---|---|---|"]
        for n in ks:
            fl.append(f"| [`{n}`](by-kind/{n}.md) | {first_sentence(kinds[n]['description'], 200).replace('|', '/')} | {labels[n]} |")
        fl.append("")
        for n in ks:
            fl.append(kind_section(kinds[n], infos[n], rows_of[n], by_kind.get(n, []), exs[n], docs_pages(n)))
            out[f"kinds/by-kind/{n}.md"] = (kind_page(kinds[n], infos[n], rows_of[n], by_kind.get(n, []), exs[n], docs_pages(n), fam, sl, version).rstrip() + "\n").encode()
        out[f"kinds/{sl}.md"] = ("\n".join(fl).rstrip() + "\n").encode()
        index += [f"### [{fam}](kinds/{sl}.md)", "",
                  f'<a href="kinds/{sl}.md"><img src="figures/kinds/sheet-{sl}.svg" alt="Contact sheet of the charts the engine writes for the kinds of the family {esc(fam)}" width="760"></a>', ""]
    index += ["## Every kind", "", "| Kind | Family | Ledger | Example |", "|---|---|---|---|"]
    fam_of = {k: (fam, slug(fam)) for fam, _, _, ks in FAMILIES for k in ks}
    for n in sorted(kinds):
        fam, sl = fam_of[n]
        ex = f"`kshana scenarios/{exs[n].name}`" if exs[n] else "no bundled scenario"
        index.append(f"| [`{n}`](kinds/by-kind/{n}.md) | [{fam}](kinds/{sl}.md#{n}) | {labels[n]} | {ex} |")
    out["KINDS.md"] = ("\n".join(index).rstrip() + "\n").encode()
    return out


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--kshana")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    assets = build(find_engine(a.kshana))
    if a.check:
        bad = [n for n, b in assets.items() if not (DOCS / n).exists() or (DOCS / n).read_bytes() != b]
        stale = []
        for sub, pat in (("figures/kinds", "*.svg"), ("kinds", "*.md"), ("kinds/by-kind", "*.md")):
            if (DOCS / sub).exists():
                stale += sorted(f"{sub}/{p.name}" for p in (DOCS / sub).glob(pat) if f"{sub}/{p.name}" not in assets)
        if bad or stale:
            print("gen_kinds_index: out of date:", ", ".join(bad + [f"{s} (stale)" for s in stale]))
            return 1
        print(f"gen_kinds_index: {len(assets)} files up to date")
        return 0
    for sub in ("figures/kinds", "kinds", "kinds/by-kind"):
        (DOCS / sub).mkdir(parents=True, exist_ok=True)
        for old in list((DOCS / sub).iterdir()):
            if old.is_file() and f"{sub}/{old.name}" not in assets:
                old.unlink()
    for n, b in assets.items():
        (DOCS / n).write_bytes(b)
    print(f"gen_kinds_index: wrote {len(assets)} files")
    return 0


if __name__ == "__main__":
    sys.exit(main())
