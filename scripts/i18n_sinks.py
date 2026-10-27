#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Human-facing string literals found by where they go, not by how they look.

A literal counts when it is outside tests and sits directly in one of the places a person's eyes meet text:
  print     an argument of println!/print!/eprintln!/eprint!
  write     an argument of write!/writeln! (stdout, stderr, files, Display impls)
  display   a literal inside `impl ... Display for ... { fn fmt }`
  error     the text of an error: Err(..), .ok_or(..), .ok_or_else(..), .map_err(..) with a literal or format!
  markup    a literal that carries an HTML/SVG tag together with words (a text writer)
and it has at least one word of three or more letters once markup tags and `{placeholders}` are removed.
Literals that are already messages (t!/terr!/tx! arguments) never count.

    scripts/i18n_sinks.py              per-kind and per-file counts
    scripts/i18n_sinks.py FILE ...     the literals of those files, with kind and line
    scripts/i18n_sinks.py --json       {file: {kind: count}} on stdout
"""
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from i18n_codemod import ROOT, in_regions, match_close, significant, test_regions, tokenize, unescape  # noqa: E402

PRINT = {"println", "print", "eprintln", "eprint"}
WRITE = {"write", "writeln"}
ERR_CALLS = {"Err", "ok_or", "ok_or_else", "map_err"}
MESSAGE_MACROS = {"t", "terr", "tx", "t_en", "include_str", "concat", "env", "assert", "assert_eq", "assert_ne",
                  "debug_assert", "panic", "unreachable", "unimplemented", "todo", "stringify", "matches", "cfg",
                  "json", "vec"}
WORD = re.compile(r"[A-Za-zÀ-ɏ]{3,}")
TAG = re.compile(r"<[^>]*>")
HAS_TAG = re.compile(r"</?[a-zA-Z][^>]*>")


def wordy(v):
    w = re.sub(r"\{[^{}]*\}", " ", TAG.sub(" ", v))
    return len(WORD.findall(w)) >= 1


def scan(path):
    src = open(path, encoding="utf-8").read()
    sig = significant(tokenize(src))
    regions = test_regions(sig)
    out = []
    stack = []  # (close_index, kind_or_None, is_message)
    fmt_spans = []
    # spans of `impl .. Display for .. { .. }`
    for i, t in enumerate(sig):
        if t.text == "Display" and i + 1 < len(sig) and sig[i + 1].text == "for":
            j = i
            while j < len(sig) and sig[j].text != "{":
                j += 1
            if j < len(sig):
                fmt_spans.append((j, match_close(sig, j)))
    n = len(sig)
    for i, t in enumerate(sig):
        while stack and stack[-1][0] < i:
            stack.pop()
        if t.kind == "punct" and t.text in "([{":
            close = match_close(sig, i)
            kind = None
            msg = False
            if t.text == "(":
                p = sig[i - 1] if i >= 1 else None
                if p is not None and p.text == "!" and i >= 2 and sig[i - 2].kind == "ident":
                    name = sig[i - 2].text
                    msg = name in MESSAGE_MACROS
                    kind = "print" if name in PRINT else "write" if name in WRITE else None
                elif p is not None and p.kind == "ident" and p.text in ERR_CALLS:
                    kind = "error"
            stack.append((close, kind, msg))
        if t.kind != "str" or t.text.startswith("b"):
            continue
        if in_regions(t.start, regions) or any(m for _, _, m in stack):
            continue
        nxt = sig[i + 1].text if i + 1 < n else ""
        nxt2 = sig[i + 2].text if i + 2 < n else ""
        if (nxt == "=" and nxt2 == ">") or nxt == "|":
            continue
        try:
            v = unescape(t.text)
        except ValueError:
            continue
        if not wordy(v):
            continue
        kinds = [k for _, k, _ in stack if k]
        kind = kinds[-1] if kinds else None
        if kind is None and any(a <= i <= b for a, b in fmt_spans):
            kind = "display"
        if kind is None and HAS_TAG.search(v) and len(WORD.findall(TAG.sub(" ", v))) >= 1:
            kind = "markup"
        if kind is None:
            continue
        # an error carrying only an identifier-looking token is not text
        if kind == "error" and not re.search(r"[A-Za-z]{3,}[ ,.:;'`-]+[A-Za-z]{2,}", v):
            continue
        out.append((src.count("\n", 0, t.start) + 1, kind, v))
    return out


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    if args:
        for f in args:
            for ln, k, v in scan(os.path.abspath(f)):
                print(f"{f}:{ln}: [{k}] {v[:110]!r}")
        return
    per = {}
    # the library and binaries, and the MCP server crate (a separate crate that uses the catalogue through `kshana::terr!`)
    for top in ("src", "mcp/kshana-mcp/src"):
        for d, _, files in os.walk(os.path.join(ROOT, top)):
            for f in files:
                if f.endswith(".rs") and "/src/i18n" not in d.replace(os.sep, "/") and not f.startswith("celeste_"):
                    p = os.path.join(d, f)
                    rel = os.path.relpath(p, ROOT).replace(os.sep, "/")
                    for _, k, _ in scan(p):
                        per.setdefault(rel, {}).setdefault(k, 0)
                        per[rel][k] += 1
    if "--json" in sys.argv:
        print(json.dumps(dict(sorted(per.items())), indent=1))
        return
    tot = {}
    for r in per.values():
        for k, c in r.items():
            tot[k] = tot.get(k, 0) + c
    print(sum(tot.values()), "literals in", len(per), "files;", ", ".join(f"{k} {c}" for k, c in sorted(tot.items())))
    for f, r in sorted(per.items(), key=lambda kv: -sum(kv[1].values()))[:50]:
        print(f"{sum(r.values()):5d}  {f}  {dict(sorted(r.items()))}")


if __name__ == "__main__":
    main()
