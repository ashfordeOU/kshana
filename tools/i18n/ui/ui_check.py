#!/usr/bin/env python3
"""Check i18n/<lang>/ui.ftl and i18n/<lang>/glossary.ftl against the English source (0.40, workstream J).

usage: ui_check.py <lang>...   (run from the repository root; needs `pip install fluent.syntax`)

For each file the check requires:
  * the file parses with fluent.syntax with 0 junk entries;
  * the same message and term ids as English, and the same attribute names on each;
  * for every value and attribute: the same placeables as English (variables, term and message references, string
    literals, function calls, numbers) and the same numbered markup tags (<a1>...</a1>, <b>...</b>), taken over all
    plural variants;
  * a plural selector for a count message uses the CLDR categories of the language: every category present, exactly one
    default variant (*[other]); ja and zh-Hans need no selector;
  * in glossary.ftl: the tier, verdict, status, kept-acronym, command and brand terms are exactly the English text
    (VALIDATED, MODELLED, PARTNER, MET, NOT MET, ... stay English); -term-* values equal the rendering in the language's guide
    (tools/i18n/ui/glossary-fixed.json) where the guide has one; -advisory (all attributes) and -mt-notice equal the
    guide's sentences where it has them (so nothing is softened or reworded).
Prints each problem and a count; exit status 1 if any. Warnings (a message identical to English) do not fail the check."""
import json
import os
import re
import sys

from fluent.syntax import ast, parse
from fluent.syntax.visitor import Visitor

ROOT = os.getcwd()
PLURALS = {
    "nl": "one other", "pl": "one few many other", "pt-BR": "one many other", "pt-PT": "one many other",
    "fi": "one other", "sv": "one other", "da": "one other", "nb": "one other", "cs": "one few many other",
    "uk": "one few many other", "ru": "one few many other", "de": "one other", "fr": "one many other",
    "es": "one many other", "et": "one other", "ja": "other", "zh-Hans": "other",
}
KEEP_EXACT = ("-tier-", "-verdict-", "-status-", "-kept-", "-cmd-", "-brand")
TAG = re.compile(r"</?[a-z]+\d*/?>")


class Collect(Visitor):
    def __init__(self):
        super().__init__()
        self.vars, self.terms, self.msgs, self.lits, self.funcs, self.tags = set(), set(), set(), set(), set(), set()
        self.selects = []

    def visit_VariableReference(self, n):
        self.vars.add(n.id.name)

    def visit_TermReference(self, n):
        self.terms.add(n.id.name + ("." + n.attribute.name if n.attribute else ""))
        self.generic_visit(n)

    def visit_MessageReference(self, n):
        self.msgs.add(n.id.name)

    def visit_StringLiteral(self, n):
        self.lits.add(n.value)

    def visit_NumberLiteral(self, n):
        self.lits.add(n.value)

    def visit_FunctionReference(self, n):
        self.funcs.add(n.id.name)
        self.generic_visit(n)

    def visit_TextElement(self, n):
        self.tags |= set(TAG.findall(n.value))

    def visit_SelectExpression(self, n):
        self.selects.append(n)
        self.generic_visit(n)


def signature(pattern):
    c = Collect()
    c.visit(pattern)
    return c


def load(path):
    text = open(path, encoding="utf-8").read()
    res = parse(text)
    entries, junk = {}, []
    for e in res.body:
        if isinstance(e, ast.Junk):
            junk.append(e.content.strip().split("\n")[0][:90])
        elif isinstance(e, (ast.Message, ast.Term)):
            key = ("-" if isinstance(e, ast.Term) else "") + e.id.name
            key = key if key.startswith("-") or isinstance(e, ast.Message) else "-" + key
            entries[("-" + e.id.name) if isinstance(e, ast.Term) else e.id.name] = e
    return text, entries, junk


def raw_value(text, entry):
    """The value text of an entry (without attributes), for exact comparisons."""
    if entry.value is None:
        return None
    v = entry.value
    return text[v.span.start : v.span.end].strip()


def raw_attr(text, entry, name):
    for a in entry.attributes:
        if a.id.name == name:
            return text[a.value.span.start : a.value.span.end].strip()
    return None


def check_file(lang, kind, fixed):
    en_text, en, _ = load(f"i18n/en/{kind}.ftl")
    path = f"i18n/{lang}/{kind}.ftl"
    if not os.path.exists(path):
        return [f"{path}: missing"], []
    tr_text, tr, junk = load(path)
    bad, warn = [], []
    for j in junk:
        bad.append(f"{path}: syntax error near: {j}")
    for k in en:
        if k not in tr:
            bad.append(f"{path}: missing {k}")
    for k in tr:
        if k not in en:
            bad.append(f"{path}: {k} is not in the English file")
    cats = PLURALS[lang].split()
    for k, e in en.items():
        t = tr.get(k)
        if t is None:
            continue
        # attributes
        ea = [a.id.name for a in e.attributes]
        ta = [a.id.name for a in t.attributes]
        if ea != ta:
            bad.append(f"{path}: {k}: attributes {ta} != {ea}")
        parts = []
        if e.value is not None:
            if t.value is None:
                bad.append(f"{path}: {k}: no value")
                continue
            parts.append(("", e.value, t.value))
        for a in e.attributes:
            tb = [x for x in t.attributes if x.id.name == a.id.name]
            if tb:
                parts.append(("." + a.id.name, a.value, tb[0].value))
        for label, ep, tp in parts:
            es, ts = signature(ep), signature(tp)
            for what in ("vars", "terms", "msgs", "lits", "funcs", "tags"):
                if getattr(es, what) != getattr(ts, what):
                    bad.append(
                        f"{path}: {k}{label}: {what} differ (English {sorted(getattr(es, what))}, translation {sorted(getattr(ts, what))})"
                    )
            # plural selectors
            for sel in ts.selects:
                keys = [v.key.name if isinstance(v.key, ast.Identifier) else v.key.value for v in sel.variants]
                defaults = [v for v in sel.variants if v.default]
                if len(defaults) != 1:
                    bad.append(f"{path}: {k}{label}: a selector needs exactly one default variant")
                word_keys = [x for x in keys if not x.isdigit()]
                if set(word_keys) - set("zero one two few many other".split()):
                    bad.append(f"{path}: {k}{label}: unknown plural category in {keys}")
                missing = [c for c in cats if c not in keys]
                if missing:
                    bad.append(f"{path}: {k}{label}: plural categories missing for {lang}: {missing}")
                extra = [c for c in word_keys if c not in cats]
                if extra and len(cats) > 1:
                    bad.append(f"{path}: {k}{label}: categories {extra} do not exist in {lang}")
            if es.selects and len(cats) > 1 and not ts.selects:
                bad.append(f"{path}: {k}{label}: a count message needs a plural selector in {lang}")
        # identical to English
        if raw_value(en_text, e) is not None and raw_value(en_text, e) == raw_value(tr_text, t):
            if re.search(r"[A-Za-z]{4,}", re.sub(r"\{[^}]*\}", "", raw_value(en_text, e))):
                warn.append(f"{k}: identical to English")
    if kind == "glossary":
        g = fixed[lang]
        for k, e in en.items():
            t = tr.get(k)
            if t is None:
                continue
            if k.startswith(KEEP_EXACT):
                if raw_value(en_text, e) != raw_value(tr_text, t):
                    bad.append(f"{path}: {k} must stay exactly `{raw_value(en_text, e)}`")
            if k.startswith("-term-"):
                want = g["terms"].get(raw_value(en_text, e))
                if want is not None:
                    want = want.lstrip("*").strip() if want.startswith("*") else want
                    if raw_value(tr_text, t) != want:
                        bad.append(f"{path}: {k} is `{raw_value(tr_text, t)}`, the guide's rendering is `{want}`")
        # advisory
        adv_en = [
            ("", 1),  # general line: index 1 of the guide's four
            (".maritime", 0),
            (".research-test", 2),
            (".short", 3),
        ]
        t_adv = tr.get("-advisory")
        if t_adv is not None:
            for attr, idx in adv_en:
                want = g["advisory"][idx]
                if want is None:
                    continue
                if idx == 3:
                    want = re.sub(r"MODELLED\.$", "{ -tier-modelled }.", want)
                got = raw_value(tr_text, t_adv) if attr == "" else raw_attr(tr_text, t_adv, attr[1:])
                if got != want:
                    bad.append(f"{path}: -advisory{attr} differs from the guide's sentence:\n      got  {got}\n      want {want}")
        t_mt = tr.get("-mt-notice")
        if t_mt is not None and raw_value(tr_text, t_mt) != g["mt_notice"]:
            bad.append(f"{path}: -mt-notice differs from the guide's sentence: `{raw_value(tr_text, t_mt)}` != `{g['mt_notice']}`")
    return bad, warn


def main(langs):
    fixed = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), "glossary-fixed.json"), encoding="utf-8"))
    total = 0
    for lang in langs:
        for kind in ("ui", "glossary"):
            bad, warn = check_file(lang, kind, fixed)
            total += len(bad)
            for b in bad:
                print("  ", b)
            print(f"{lang}/{kind}.ftl: {len(bad)} problems, {len(warn)} messages identical to English")
            if "-v" in sys.argv:
                for w in warn:
                    print("     warning:", w)
    sys.exit(1 if total else 0)


if __name__ == "__main__":
    main([a for a in sys.argv[1:] if not a.startswith("-")])
