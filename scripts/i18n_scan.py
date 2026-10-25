#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Inventory of the human-facing string literals in src/ that do not go through the catalogue.

    scripts/i18n_scan.py                  per-file counts, largest first
    scripts/i18n_scan.py FILE ...         the literals of those files, with line numbers
    scripts/i18n_scan.py --json           {file: count} on stdout

A literal counts when, outside `#[cfg(test)]` and `#[test]` code, it holds at least two words of three
or more letters once markup tags and `{placeholders}` are removed, and it is not: an argument of
`t!`/`tx!`/`terr!`, `include_str!`, `concat!`, `env!`, `assert*`, `debug_assert*`, `panic!`, `unreachable!`,
`unimplemented!`, `todo!`, `stringify!`, `matches!`, `cfg*`; an `.expect(..)` message; inside an
attribute; or a match-arm pattern. tests/i18n_ratchet.rs applies the same rule in Rust.
"""
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from i18n_codemod import ROOT, in_regions, match_close, significant, test_regions, tokenize, unescape  # noqa: E402

EXCLUDED_MACROS = {
    "t", "tx", "terr", "include_str", "include_bytes", "concat", "env", "option_env", "assert", "assert_eq",
    "assert_ne", "debug_assert", "debug_assert_eq", "debug_assert_ne", "panic", "unreachable",
    "unimplemented", "todo", "stringify", "matches", "cfg", "compile_error", "thread_local",
}
WORD = re.compile(r"[A-Za-zÀ-ɏ]{3,}")


def texty(value):
    v = re.sub(r"<[^>]*>", " ", value)
    v = re.sub(r"\{[^{}]*\}", " ", v)
    return len(WORD.findall(v)) >= 2


def scan(path):
    src = open(path, encoding="utf-8").read()
    sig = significant(tokenize(src))
    regions = test_regions(sig)
    # enclosing excluded call/macro for each token index
    out = []
    stack = []  # (close_index, excluded)
    n = len(sig)
    for i, t in enumerate(sig):
        while stack and stack[-1][0] < i:
            stack.pop()
        if t.kind == "punct" and t.text in "([{":
            close = match_close(sig, i)
            excluded = False
            if t.text == "(":
                p = sig[i - 1] if i >= 1 else None
                if p is not None and p.text == "!" and i >= 2 and sig[i - 2].kind == "ident":
                    excluded = sig[i - 2].text in EXCLUDED_MACROS
                elif p is not None and p.kind == "ident" and p.text == "expect" and i >= 2 and sig[i - 2].text == ".":
                    excluded = True
                elif p is not None and p.kind == "ident" and p.text in ("cfg", "cfg_attr", "doc", "serde", "derive", "allow", "deny", "warn", "path"):
                    excluded = True
            if t.text == "[" and i >= 1 and sig[i - 1].text == "#":
                excluded = True
            if t.text == "[" and i >= 2 and sig[i - 1].text == "!" and sig[i - 2].text == "#":
                excluded = True
            stack.append((close, excluded))
        if t.kind != "str" or t.text.startswith("b"):
            continue
        if in_regions(t.start, regions) or any(e for _, e in stack):
            continue
        nxt = sig[i + 1].text if i + 1 < n else ""
        nxt2 = sig[i + 2].text if i + 2 < n else ""
        if nxt == "=" and nxt2 == ">" or nxt == "|":
            continue  # a match-arm pattern
        try:
            v = unescape(t.text)
        except ValueError:
            continue
        if texty(v):
            out.append((src.count("\n", 0, t.start) + 1, v))
    return out


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    as_json = "--json" in sys.argv
    if args:
        for f in args:
            for ln, v in scan(os.path.abspath(f)):
                print(f"{f}:{ln}: {v[:110]!r}")
        return
    counts = {}
    for d, _, files in os.walk(os.path.join(ROOT, "src")):
        for f in files:
            if f.endswith(".rs") and "/src/i18n" not in d.replace(os.sep, "/"):
                p = os.path.join(d, f)
                c = len(scan(p))
                if c:
                    counts[os.path.relpath(p, ROOT).replace(os.sep, "/")] = c
    if as_json:
        print(json.dumps(dict(sorted(counts.items())), indent=1))
        return
    tot = sum(counts.values())
    print(f"{tot} literals in {len(counts)} files")
    for f, c in sorted(counts.items(), key=lambda kv: -kv[1])[:60]:
        print(f"{c:6d}  {f}")


if __name__ == "__main__":
    main()
