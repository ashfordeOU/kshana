#!/usr/bin/env python3
"""Put the human-readable text of the compliance mapping (src/compliance/mapping.rs) into the catalogue.

Reads the English data tables out of `src/compliance/mapping.rs` (the framework titles, the source
documents, the capabilities and the mapping rows) and writes, deterministically and idempotently:

* `i18n/en/engine.ftl`, section `## compliance mapping`: one message per text field, byte-identical to the
  English constant (ids `compliance-fw-*`, `compliance-source-*`, `compliance-cap-*`, `compliance-req-*`
  for the requirement texts, which quote or paraphrase an external standard: translators decide), plus the
  column headers and the source-line sentence;
* `tests/fixtures/i18n/manual.json`: the original template of each message;
* `src/compliance/mapping/ids.rs`: the tables of literal ids that the Markdown renderers look up.

The data tables stay English constants: the machine mapping (the JSON of a compliance report, row ids,
framework keys) is read from them; only `framework_table_md`, `sources_md` and `Framework::title_localised`
read the catalogue. A unit test proves the English catalogue text equals every constant.

    python3 scripts/i18n_compliance.py
"""
import json, os, re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = open(os.path.join(ROOT, "src/compliance/mapping.rs"), encoding="utf-8").read()
S = r'"((?:[^"\\]|\\.)*)"'


def unesc(s):
    assert "\\" not in s, s
    return s


def slug(s):
    return re.sub(r"[^a-z0-9]+", "-", s.lower()).strip("-")


def ftl_text(s):
    assert "\n" not in s, s
    return re.sub(r"[{}]", lambda m: '{ "' + m.group(0) + '" }', s)


# ---- parse -------------------------------------------------------------------------------------
fw_ids = dict(re.findall(r"Framework::(\w+) => " + S + r",\n", SRC[SRC.index("pub fn id"):SRC.index("pub fn title")]))
titles = dict(re.findall(r"Framework::(\w+) => " + S + r",\n", SRC[SRC.index("pub fn title"):SRC.index("/// A source document")]))
order = re.findall(r"Framework::(\w+),", SRC[SRC.index("pub const ALL"):SRC.index("/// Stable machine name")])
assert set(order) == set(fw_ids) == set(titles) and len(order) == 6

src_block = SRC[SRC.index("pub const SOURCES"):SRC.index("/// A capability")]
sources = re.findall(
    r"Source \{\s*framework: Framework::(\w+),\s*title: " + S + r",\s*version: " + S + r",\s*url: " + S
    + r",\s*checked: " + S + r",\s*\},", src_block)
assert len(sources) == 10, len(sources)

cap_block = SRC[SRC.index("pub const CAPABILITIES"):SRC.index("pub const KIND_FIELDS")]
caps = re.findall(r"Capability \{\s*id: " + S + r",\s*name: " + S + r",\s*output: " + S + r",", cap_block)
assert len(caps) == 8, len(caps)

row_block = SRC[SRC.index("pub fn rows()"):SRC.index("pub fn framework_table_md")]
rows = re.findall(
    r"row\(\s*" + S + r",\s*(\w+),\s*" + S + r",\s*" + S + r",\s*&\[[^\]]*\],\s*" + S + r"\)", row_block)
assert len(rows) == row_block.count("        row("), (len(rows), row_block.count("        row("))

# ---- messages ----------------------------------------------------------------------------------
msgs = []  # (id, [parts]) ; parts: str or {"var": name}


def add(mid, text):
    assert mid not in [m[0] for m in msgs], mid
    msgs.append((mid, [unesc(text)]))


fw_table = []
for v in order:
    fid = unesc(fw_ids[v])
    mid = f"compliance-fw-{slug(fid)}-title"
    add(mid, titles[v])
    fw_table.append((fid, mid))

src_table = []
seen = {}
for fwv, title, version, url, checked in sources:
    fid = unesc(fw_ids[fwv])
    seen[fid] = seen.get(fid, 0) + 1
    base = f"compliance-source-{slug(fid)}-{seen[fid]}"
    add(base + "-title", title)
    add(base + "-version", version)
    add(base + "-checked", checked)
    src_table.append((base + "-title", base + "-version", base + "-checked"))

cap_table = []
for cid, name, output in caps:
    base = f"compliance-cap-{slug(cid)}"
    add(base + "-name", name)
    add(base + "-output", output)
    cap_table.append((cid, base + "-name", base + "-output"))

row_table = []
for rid, fwv, ref, asks, gap in rows:
    base = f"compliance-req-{slug(rid)}"
    add(base + "-reference", ref)
    add(base + "-asks", asks)
    add(base + "-gap", gap)
    row_table.append((rid, base + "-reference", base + "-asks", base + "-gap"))
assert len({r[0] for r in row_table}) == len(rows)

add("compliance-mapping-header-reference", "Reference")
add("compliance-mapping-header-asks", "What it asks (paraphrased)")
add("compliance-mapping-header-capabilities", "Kshana outputs that support evidence for it")
add("compliance-mapping-header-gap", "Gap")
add("compliance-mapping-none", "none")
msgs.append((
    "compliance-source-line",
    ["**", {"var": "title"}, "**: ", {"var": "version"}, ". <", {"var": "url"}, ">. Read ",
     {"var": "accessed"}, ": ", {"var": "checked"}, "."]))

# ---- catalogue ---------------------------------------------------------------------------------
path = os.path.join(ROOT, "i18n/en/engine.ftl")
ftl = open(path, encoding="utf-8").read()
head = "## compliance mapping"
if head in ftl:
    ftl = ftl[: ftl.index(head)].rstrip("\n") + "\n"
lines = []
for mid, parts in msgs:
    body = "".join(ftl_text(p) if isinstance(p, str) else "{ $" + p["var"] + " }" for p in parts)
    assert body == body.strip(), mid
    lines.append(f"engine-{mid} = {body}")
ftl = ftl.rstrip("\n") + "\n\n" + head + " (requirement texts quote or paraphrase external standards; the data tables in code stay English)\n\n" + "\n\n".join(lines) + "\n"
open(path, "w", encoding="utf-8").write(ftl)

# ---- recorded originals ------------------------------------------------------------------------
path = os.path.join(ROOT, "tests/fixtures/i18n/manual.json")
data = json.load(open(path, encoding="utf-8"))
mine = {m[0] for m in msgs}
data = [e for e in data if e["id"] not in mine]
data += [{"id": mid, "error": False, "parts": parts} for mid, parts in msgs]
with open(path, "w", encoding="utf-8") as f:
    json.dump(data, f, ensure_ascii=False, indent=1)
    f.write("\n")

# ---- table of literal ids ----------------------------------------------------------------------
out = [
    "// SPDX-License-Identifier: AGPL-3.0-only",
    "//! The catalogue messages of the compliance mapping's human-readable text. Written by",
    "//! `scripts/i18n_compliance.py` (do not edit by hand): tables of literal ids, so the catalogue test sees",
    "//! every id. The data tables of `mapping.rs` stay English constants (the machine mapping); only the",
    "//! Markdown renderers look these ids up.",
    "",
    "/// `(framework id, message id of its title)`.",
    "#[rustfmt::skip]",
    "pub const FRAMEWORK_TITLE_IDS: &[(&str, &str)] = &[",
]
out += [f'    ("{a}", "{b}"),' for a, b in fw_table]
out += [
    "];",
    "",
    "/// `(title, version, checked)` message ids of each entry of `SOURCES`, in its order.",
    "#[rustfmt::skip]",
    "pub const SOURCE_IDS: &[(&str, &str, &str)] = &[",
]
out += [f'    ("{a}", "{b}", "{c}"),' for a, b, c in src_table]
out += [
    "];",
    "",
    "/// `(capability id, name message id, output message id)`.",
    "#[rustfmt::skip]",
    "pub const CAPABILITY_IDS: &[(&str, &str, &str)] = &[",
]
out += [f'    ("{a}", "{b}", "{c}"),' for a, b, c in cap_table]
out += [
    "];",
    "",
    "/// `(row id, reference, asks, gap)` message ids. The `asks` text paraphrases or quotes the framework's",
    "/// requirement: translators decide its wording.",
    "#[rustfmt::skip]",
    "pub const ROW_IDS: &[(&str, &str, &str, &str)] = &[",
]
out += [f'    ("{a}", "{b}", "{c}", "{d}"),' for a, b, c, d in row_table]
out += ["];", ""]
open(os.path.join(ROOT, "src/compliance/mapping/ids.rs"), "w", encoding="utf-8").write("\n".join(out))
print(len(msgs), "messages")
