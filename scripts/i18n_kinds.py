#!/usr/bin/env python3
"""Put the description of every built-in scenario kind into the catalogue.

Reads the English descriptions out of the binary (`kshana kinds --json`, so the text is exact) and writes,
deterministically and idempotently:

* `i18n/en/engine.ftl`, section `## kind descriptions`: one message `engine-kind-<kind>-description` per
  kind, byte-identical to the English description, except that a literal decimal quantity is a placeable
  `{ $lit_0_06 }` (each language formats it with its own decimal mark);
* `tests/fixtures/i18n/manual.json`: the original template of each message (the catalogue test proves
  English equals it);
* `i18n/en/engine-numbers.txt`: the messages that carry placeables;
* `src/api/kind_descriptions.rs`: the table of literal ids (and the numbers each message takes) that
  `api::kind_description` looks up.

Identifiers, document and section references, versions, and numbers written with a grouping space stay
literal; PLACEABLES lists the quantities, per kind, in the order they occur.

    python3 scripts/i18n_kinds.py [path/to/kshana]
"""
import json, os, re, subprocess, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BIN = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "target/release/kshana")

# kind -> decimal literals that are quantities (every occurrence in the description becomes a placeable).
PLACEABLES = {
    "lunar-vlbi": ["0.06"],
    "space-weather": ["1.7"],
    "lunar-attack-surface": ["15.6", "128.5", "158.5", "14.4"],
    "realtime-frame-eop": ["0.27", "0.010", "0.5"],
    "tracking-loop": ["0.6", "3.7", "0.17"],
    "araim-reference-check": ["18.2926", "18.3", "13.4063", "13.45", "7.2997", "7.2998", "1.3694"],
    "earth-gnss-lunar": ["13.9"],
    "cislunar-arc-recovery": ["0.782609", "2.086957", "0.375", "5.739130", "0.98"],
    "telecom-timing": ["1.5"],
    "spectrum": ["1.023", "1.5"],
    "solar-system": ["1.87", "1.71", "2.0", "5.2"],
    "constellation-design": ["110.5", "64.8", "0.94", "1.25", "0.96", "0.03"],
    "leo-signal": ["40.3", "90.3"],
    "leo-pass": ["40.3"],
    "leo-ppp": ["9.6", "7.0", "3.2", "2.1", "1.3"],
    "ntn-positioning": ["2172.5", "4.5"],
}


def var_of(lit):
    return "lit_" + lit.replace(".", "_")


def pattern(lit):
    return re.compile(r"(?<![\w.])" + re.escape(lit) + r"(?![\d]|\.\d|e-)")


def ftl_text(s):
    s = re.sub(r"[{}]", lambda m: '{ "' + m.group(0) + '" }', s)
    return s


def main():
    kinds = json.loads(subprocess.check_output([BIN, "kinds", "--json"]).decode("utf-8"))
    names = [k["name"] for k in kinds]
    assert len(set(names)) == len(names)
    assert set(PLACEABLES) <= set(names), set(PLACEABLES) - set(names)

    ftl_lines, records, numbers, table = [], [], [], []
    for k in kinds:
        name, desc = k["name"], k["description"]
        assert "\n" not in desc and desc == desc.strip(), name
        mid = f"kind-{name}-description"
        lits = PLACEABLES.get(name, [])
        # split the description into text and variable parts, left to right
        spans = []
        for l in lits:
            found = list(pattern(l).finditer(desc))
            assert found, (name, l)
            spans += [(m.start(), m.end(), l) for m in found]
        spans.sort()
        for a, b in zip(spans, spans[1:]):
            assert a[1] <= b[0], (name, a, b)
        parts, pos = [], 0
        for s, e, l in spans:
            if desc[pos:s]:
                parts.append(desc[pos:s])
            parts.append({"var": var_of(l)})
            pos = e
        if desc[pos:]:
            parts.append(desc[pos:])
        assert "".join(p if isinstance(p, str) else "\0" for p in parts).count("\0") == len(spans)
        body = "".join(ftl_text(p) if isinstance(p, str) else "{ $" + p["var"] + " }" for p in parts)
        ftl_lines.append(f"engine-{mid} = {body}")
        records.append({"id": mid, "error": False, "parts": parts})
        if lits:
            numbers.append(f"{mid}: " + " ".join(var_of(l) for l in lits))
        table.append((name, mid, lits))

    # catalogue
    path = os.path.join(ROOT, "i18n/en/engine.ftl")
    ftl = open(path, encoding="utf-8").read()
    head = "## kind descriptions"
    section = head + "\n\n" + "\n\n".join(ftl_lines) + "\n"
    if head in ftl:
        # Replace this section only: it ends where the next `## ` heading begins (other sections follow it).
        start = ftl.index(head)
        nxt = re.search(r"(?m)^## ", ftl[start + len(head):])
        tail = ftl[start + len(head) + nxt.start():] if nxt else ""
        ftl = ftl[:start].rstrip("\n") + "\n\n" + section + ("\n" + tail if tail else "")
    else:
        ftl = ftl.rstrip("\n") + "\n\n" + section
    open(path, "w", encoding="utf-8").write(ftl)

    # recorded originals
    path = os.path.join(ROOT, "tests/fixtures/i18n/manual.json")
    data = json.load(open(path, encoding="utf-8"))
    data = [e for e in data if not re.fullmatch(r"kind-.*-description", e["id"])] + records
    with open(path, "w", encoding="utf-8") as f:
        json.dump(data, f, ensure_ascii=False, indent=1)
        f.write("\n")

    # numbers
    path = os.path.join(ROOT, "i18n/en/engine-numbers.txt")
    old = open(path, encoding="utf-8").read()
    lines = [l for l in old.splitlines() if l and not l.startswith("#")]
    lines = [l for l in lines if not re.match(r"kind-.*-description:", l)] + numbers
    open(path, "w", encoding="utf-8").write(
        "# Messages whose numbers are passed as placeables, so each language formats them (decimal mark).\n"
        "# Translators keep the placeables; format of a line: id: variables.\n" + "\n".join(sorted(lines)) + "\n")

    # the table of literal ids
    out = [
        "// SPDX-License-Identifier: AGPL-3.0-only",
        "//! The catalogue message of each built-in scenario kind's description. Written by",
        "//! `scripts/i18n_kinds.py` (do not edit by hand): a table of literal ids, so the catalogue test sees",
        "//! every id, and for a description that states a quantity the number(s) its message formats",
        "//! (`variable`, value, decimals).",
        "",
        "/// One number a description's message formats: `(variable, value, decimals)`.",
        "pub type KindNumber = (&'static str, f64, usize);",
        "",
        "/// `(kind, message id, numbers)` for every kind of `api::list_scenario_kinds`, in its order.",
        "#[rustfmt::skip]",
        "pub const KIND_DESCRIPTION_IDS: &[(&str, &str, &[KindNumber])] = &[",
    ]
    for name, mid, lits in table:
        nums = ", ".join(f'("{var_of(l)}", {l}_f64, {len(l.split(".")[1])})' for l in lits)
        out.append(f'    ("{name}", "{mid}", &[{nums}]),')
    out.append("];")
    open(os.path.join(ROOT, "src/api/kind_descriptions.rs"), "w", encoding="utf-8").write("\n".join(out) + "\n")
    print(len(table), "messages,", len(numbers), "with numbers")


main()
