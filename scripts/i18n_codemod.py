#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Move the human-facing format strings of Rust source files into the Fluent catalogue.

    scripts/i18n_codemod.py --scan  src/clock_log.rs ...      count what would be converted, change nothing
    scripts/i18n_codemod.py --apply src/clock_log.rs ...      rewrite the files and extend the catalogue

What it converts (outside `#[cfg(test)]` and `#[test]` code), every time the text is a human sentence:

  * `format!("text {x} {}", a, b = c)`      -> `t!("id", x = x, a = a, b = c)`
  * `Err(format!(..))`, `KshanaError::X(format!(..))`, `.map_err(|e| format!(..))`,
    `.ok_or_else(|| format!(..))`           -> the same with `terr!` (the message registers its error code)
  * `Err("text".into())`, `Err("text".to_string())`, `.ok_or("text")` -> `terr!`
  * `println!("text", a)` and `eprintln!`   -> `println!("{}", t!("id", ..))`

A placeholder with a format spec keeps its spec in Rust: `{x:.2}` becomes `x = format!("{x:.2}")`,
wrapped in `i18n::localise_decimal(..)` when the spec is a float spec, so the locale's decimal mark
applies. The English catalogue text is exactly the Rust text (escapes resolved, `{{` `}}` resolved),
and `tests/fixtures/i18n/corpus.json` records, for every message, the original template as parts
(text and variables). `tests/i18n_catalogue.rs` renders every message with sentinel arguments and
compares it with that template: English cannot drift from the source it replaced.

What it leaves alone, and lists with `--scan`: strings with `$`-width or `*` format specs, markup
(`<` `>`), JSON or CSV fragments, single words outside errors, and anything it cannot parse. Those
are converted by hand.
"""
import argparse
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FTL = os.path.join(ROOT, "locales/en/engine.ftl")
CORPUS = os.path.join(ROOT, "tests/fixtures/i18n/corpus.json")

IDENT_START = re.compile(r"[A-Za-z_]")
IDENT = re.compile(r"[A-Za-z_][A-Za-z0-9_]*")
RAW_STR = re.compile(r'b?r(#*)"')


# ── a Rust tokenizer, enough to find string literals and macro calls ────────────────────────


class Tok:
    __slots__ = ("kind", "text", "start", "end")

    def __init__(self, kind, text, start, end):
        self.kind, self.text, self.start, self.end = kind, text, start, end

    def __repr__(self):
        return f"{self.kind}:{self.text!r}"


def tokenize(s):
    toks = []
    i, n = 0, len(s)
    while i < n:
        c = s[i]
        if c.isspace():
            j = i
            while j < n and s[j].isspace():
                j += 1
            toks.append(Tok("ws", s[i:j], i, j))
            i = j
        elif s.startswith("//", i):
            j = s.find("\n", i)
            j = n if j < 0 else j
            toks.append(Tok("comment", s[i:j], i, j))
            i = j
        elif s.startswith("/*", i):
            depth, j = 1, i + 2
            while j < n and depth:
                if s.startswith("/*", j):
                    depth += 1
                    j += 2
                elif s.startswith("*/", j):
                    depth -= 1
                    j += 2
                else:
                    j += 1
            toks.append(Tok("comment", s[i:j], i, j))
            i = j
        else:
            m = RAW_STR.match(s, i) if c in "rb" and (i == 0 or not (s[i - 1].isalnum() or s[i - 1] == "_")) else None
            if m:
                hashes = m.group(1)
                close = '"' + hashes
                j = s.find(close, m.end())
                j = n if j < 0 else j + len(close)
                toks.append(Tok("str", s[i:j], i, j))
                i = j
            elif c == "b" and i + 1 < n and s[i + 1] == '"' and (i == 0 or not (s[i - 1].isalnum() or s[i - 1] == "_")):
                j = i + 2
                while j < n and s[j] != '"':
                    j += 2 if s[j] == "\\" else 1
                j += 1
                toks.append(Tok("bstr", s[i:j], i, j))
                i = j
            elif c == '"':
                j = i + 1
                while j < n and s[j] != '"':
                    j += 2 if s[j] == "\\" else 1
                j += 1
                toks.append(Tok("str", s[i:j], i, j))
                i = j
            elif c == "'":
                if i + 1 < n and s[i + 1] == "\\":
                    j = s.find("'", i + 2)
                    j = n if j < 0 else j + 1
                    toks.append(Tok("char", s[i:j], i, j))
                    i = j
                elif i + 2 < n and s[i + 2] == "'":
                    toks.append(Tok("char", s[i : i + 3], i, i + 3))
                    i += 3
                else:
                    j = i + 1
                    while j < n and (s[j].isalnum() or s[j] == "_"):
                        j += 1
                    toks.append(Tok("lifetime", s[i:j], i, j))
                    i = j
            elif IDENT_START.match(c):
                m = IDENT.match(s, i)
                toks.append(Tok("ident", m.group(0), i, m.end()))
                i = m.end()
            elif c.isdigit():
                j = i
                while j < n and (s[j].isalnum() or s[j] in "._"):
                    if s[j] == "." and j + 1 < n and not s[j + 1].isdigit():
                        break
                    j += 1
                toks.append(Tok("num", s[i:j], i, j))
                i = j
            else:
                toks.append(Tok("punct", c, i, i + 1))
                i += 1
    return toks


def significant(toks):
    return [t for t in toks if t.kind not in ("ws", "comment")]


OPEN, CLOSE = "([{", ")]}"


def match_close(sig, i):
    """Index of the token closing the delimiter at sig[i]."""
    depth = 0
    for j in range(i, len(sig)):
        t = sig[j]
        if t.kind == "punct" and t.text in OPEN:
            depth += 1
        elif t.kind == "punct" and t.text in CLOSE:
            depth -= 1
            if depth == 0:
                return j
    return -1


def split_args(sig, lo, hi):
    """Top-level comma-separated slices (lo, hi) of sig between two indices."""
    out, depth, start = [], 0, lo
    for j in range(lo, hi):
        t = sig[j]
        if t.kind == "punct" and t.text in OPEN:
            depth += 1
        elif t.kind == "punct" and t.text in CLOSE:
            depth -= 1
        elif t.kind == "punct" and t.text == "," and depth == 0:
            out.append((start, j))
            start = j + 1
    if start < hi:
        out.append((start, hi))
    return out


def test_regions(sig):
    """Character ranges of #[cfg(test)] items and #[test] functions."""
    regions = []
    n = len(sig)
    i = 0
    while i < n:
        if sig[i].text == "#" and i + 1 < n and sig[i + 1].text == "[":
            close = match_close(sig, i + 1)
            if close < 0:
                break
            inner = [t.text for t in sig[i + 2 : close]]
            is_test = inner == ["test"] or (
                inner[:1] == ["cfg"] and "test" in inner and "not" not in inner
            )
            if is_test:
                j = close + 1
                # skip further attributes
                while j < n and sig[j].text == "#" and j + 1 < n and sig[j + 1].text == "[":
                    j = match_close(sig, j + 1) + 1
                # the item: up to its first '{' (body) or ';'
                k = j
                while k < n and sig[k].text not in ("{", ";"):
                    k += 1
                if k < n and sig[k].text == "{":
                    e = match_close(sig, k)
                    regions.append((sig[i].start, sig[e].end if e >= 0 else sig[-1].end))
                    i = e + 1 if e >= 0 else n
                    continue
                if k < n:
                    regions.append((sig[i].start, sig[k].end))
                    i = k + 1
                    continue
            i = close + 1
        else:
            i += 1
    return regions


def in_regions(pos, regions):
    return any(a <= pos < b for a, b in regions)


# ── Rust string literals and format strings ──────────────────────────────────────────────


def unescape(lit):
    """The value of a Rust string literal token (plain or raw)."""
    if lit.startswith(("r", "br")):
        m = RAW_STR.match(lit)
        hashes = m.group(1)
        return lit[m.end() : len(lit) - 1 - len(hashes)]
    body = lit[1:-1]
    out, i, n = [], 0, len(body)
    while i < n:
        c = body[i]
        if c != "\\":
            out.append(c)
            i += 1
            continue
        d = body[i + 1]
        if d == "\n" or (d == "\r" and body[i + 2 : i + 3] == "\n"):
            i += 2
            while i < n and body[i] in " \t\r\n":
                i += 1
            continue
        simple = {"n": "\n", "r": "\r", "t": "\t", "\\": "\\", '"': '"', "'": "'", "0": "\0"}
        if d in simple:
            out.append(simple[d])
            i += 2
        elif d == "x":
            out.append(chr(int(body[i + 2 : i + 4], 16)))
            i += 4
        elif d == "u":
            j = body.index("}", i)
            out.append(chr(int(body[i + 3 : j].replace("_", ""), 16)))
            i = j + 1
        else:
            raise ValueError(f"unknown escape \\{d}")
    return "".join(out)


FLOAT_SPEC = re.compile(r"(\.\d+|e|E)$|\.\d+")


def parse_format(value):
    """Split a format string into parts: str for text, dict(arg=..., spec=...) for placeholders.
    Returns None for a string with specs this tool does not handle (`$`, `*`)."""
    parts, buf, i, n = [], [], 0, len(value)
    while i < n:
        c = value[i]
        if c == "{":
            if value[i + 1 : i + 2] == "{":
                buf.append("{")
                i += 2
                continue
            j = value.find("}", i)
            if j < 0:
                return None
            inner = value[i + 1 : j]
            arg, _, spec = inner.partition(":")
            if "$" in spec or "*" in spec or "$" in arg:
                return None
            if buf:
                parts.append("".join(buf))
                buf = []
            parts.append({"arg": arg.strip(), "spec": spec})
            i = j + 1
        elif c == "}":
            if value[i + 1 : i + 2] == "}":
                buf.append("}")
                i += 2
                continue
            return None
        else:
            buf.append(c)
            i += 1
    if buf:
        parts.append("".join(buf))
    return parts


def textlike(parts, error_ctx):
    text = "".join(p for p in parts if isinstance(p, str))
    if "<" in text and ">" in text:
        return False  # markup
    if re.search(r'"\s*:', text) or text.lstrip().startswith(("{", "[")) and "," in text and '"' in text:
        return False  # JSON
    words = re.findall(r"[A-Za-zÀ-ɏ]{3,}", text)
    if error_ctx:
        return len(words) >= 1
    return len(words) >= 2


# ── the catalogue ───────────────────────────────────────────────────────────────────────


def fl_literal(text):
    """A Fluent string-literal placeable that yields exactly `text`."""
    esc = []
    for ch in text:
        if ch == '"':
            esc.append('\\"')
        elif ch == "\\":
            esc.append("\\\\")
        elif ch == "\n":
            esc.append("\\u000A")
        elif ch == "\t":
            esc.append("\\u0009")
        elif ord(ch) < 0x20:
            esc.append("\\u%04X" % ord(ch))
        else:
            esc.append(ch)
    return '{ "' + "".join(esc) + '" }'


def ftl_text(piece, first, last):
    """Escape one text piece; `first`/`last`: it starts/ends a line of the message."""
    out = []
    n = len(piece)
    a = 0
    if first:
        while a < n and piece[a] in " \t":
            a += 1
        if a:
            out.append(fl_literal(piece[:a]))
    b = n
    if last:
        while b > a and piece[b - 1] in " \t":
            b -= 1
    core = piece[a:b]
    for k, ch in enumerate(core):
        if ch in "{}":
            out.append(fl_literal(ch))
        elif k == 0 and first and a == 0 and ch in ".*[":
            out.append(fl_literal(ch))
        else:
            out.append(ch)
    if b < n:
        out.append(fl_literal(piece[b:]))
    return "".join(out)


def ftl_message(mid, pieces):
    """`pieces`: list of str | ('var', name). Returns the .ftl text of the message."""
    lines = [[]]
    for p in pieces:
        if isinstance(p, tuple):
            lines[-1].append(p)
        else:
            segs = p.split("\n")
            for k, seg in enumerate(segs):
                if k > 0:
                    lines.append([])
                if seg != "":
                    lines[-1].append(seg)
    rendered = []
    for ln in lines:
        out = []
        for idx, piece in enumerate(ln):
            if isinstance(piece, tuple):
                out.append("{ $" + piece[1] + " }")
            else:
                out.append(ftl_text(piece, idx == 0, idx == len(ln) - 1))
        rendered.append("".join(out))
    # blank lines at the very start or end of the value would be trimmed by Fluent
    while len(rendered) > 1 and rendered[0] == "":
        rendered[0] = fl_literal("\n")
        break
    if len(rendered) > 1 and rendered[-1] == "":
        rendered[-1] = fl_literal("\n")
    if len(rendered) == 1:
        return f"{mid} = {rendered[0]}\n"
    body = "\n".join(("    " + l) if l != "" else "" for l in rendered)
    return f"{mid} =\n{body}\n"


def slug(text):
    words = re.findall(r"[A-Za-z0-9]+", text.lower())
    words = [w for w in words if len(w) > 1][:5]
    return "-".join(words) or "msg"


def area_of(path):
    rel = os.path.relpath(path, os.path.join(ROOT, "src")).replace(os.sep, "/")
    rel = re.sub(r"\.rs$", "", rel)
    rel = re.sub(r"/mod$", "", rel)
    return re.sub(r"[^a-z0-9]+", "-", rel.lower()).strip("-")


class Catalogue:
    def __init__(self):
        self.text = open(FTL, encoding="utf-8").read() if os.path.exists(FTL) else ""
        self.ids = set(re.findall(r"^([a-z][a-z0-9-]*)\s*=", self.text, re.M))
        self.corpus = json.load(open(CORPUS)) if os.path.exists(CORPUS) else []
        self.by_template = {}
        for e in self.corpus:
            self.by_template[(e["error"], json.dumps(e["parts"], ensure_ascii=False))] = e["id"]
        self.new_blocks = {}  # section -> [ftl text]

    def add(self, section, base, error, parts):
        key = (error, json.dumps(parts, ensure_ascii=False))
        if key in self.by_template:
            return self.by_template[key]
        mid = base
        k = 2
        while mid in self.ids:
            mid = f"{base}-{k}"
            k += 1
        self.ids.add(mid)
        pieces = [p if isinstance(p, str) else ("var", p["var"]) for p in parts]
        self.new_blocks.setdefault(section, []).append(ftl_message(mid, pieces))
        self.corpus.append({"id": mid, "error": error, "parts": parts})
        self.by_template[key] = mid
        return mid

    def save(self):
        if not self.new_blocks:
            return
        add = ""
        for section, blocks in self.new_blocks.items():
            add += f"\n## {section}\n\n" + "\n".join(blocks)
        with open(FTL, "a", encoding="utf-8") as f:
            f.write(add)
        os.makedirs(os.path.dirname(CORPUS), exist_ok=True)
        with open(CORPUS, "w", encoding="utf-8") as f:
            json.dump(self.corpus, f, ensure_ascii=False, indent=1)
            f.write("\n")


# ── finding and converting call sites ─────────────────────────────────────────────────────

CUR_CRATE = "crate"
PRINTS = {"println", "eprintln", "print", "eprint"}


def prev_sig(sig, i, k):
    return [t.text for t in sig[max(0, i - k) : i]]


def error_context(sig, i):
    """Whether the call whose first token is sig[i] sits where an error value goes."""
    t = lambda k: sig[k].text if 0 <= k < len(sig) else ""  # noqa: E731
    if t(i - 1) == "(" and t(i - 2) == "Err":
        return True
    # SomeError::Variant( .. )
    if t(i - 1) == "(" and sig[i - 2].kind == "ident" and t(i - 3) == ":" and t(i - 4) == ":" and t(i - 5).endswith("Error"):
        return True
    # .map_err(|e| ..) and .ok_or_else(|| ..): a closure whose params just ended at sig[i-1]
    if t(i - 1) == "{" and t(i - 2) == "|":
        i -= 1
    if t(i - 1) == "|":
        k = i - 2
        if t(k) == "|":  # `||`
            k -= 0
            open_k = k
        else:
            while k >= 0 and t(k) != "|":
                k -= 1
            open_k = k
        if t(open_k - 1) == "(" and t(open_k - 2) in ("map_err", "ok_or_else"):
            return True
    return False


BIN_FILES = {"main.rs", "live_io.rs", "bundled_scenarios.rs"}


def crate_name(path):
    rel = os.path.relpath(path, os.path.join(ROOT, "src")).replace(os.sep, "/")
    return "kshana" if rel in BIN_FILES or rel.startswith("bin/") else "crate"


def convert(path, cat, apply):
    src = open(path, encoding="utf-8").read()
    toks = tokenize(src)
    sig = significant(toks)
    regions = test_regions(sig)
    section = f"src/{os.path.relpath(path, os.path.join(ROOT, 'src')).replace(os.sep, '/')}"
    area = area_of(path)
    global CUR_CRATE
    CUR_CRATE = crate_name(path)
    edits = []  # (start, end, replacement)
    skipped = []
    n = len(sig)
    i = 0
    stats = {"format": 0, "err": 0, "print": 0}
    while i < n:
        t = sig[i]
        if t.kind == "ident" and i + 2 < n and sig[i + 1].text == "!" and sig[i + 2].text == "(" and not in_regions(t.start, regions):
            name = t.text
            close = match_close(sig, i + 2)
            if close < 0:
                i += 1
                continue
            args = split_args(sig, i + 3, close)
            if name in PRINTS | {"format"} and args:
                a0 = sig[args[0][0] : args[0][1]]
                if len(a0) == 1 and a0[0].kind == "str" and not a0[0].text.startswith("b"):
                    try:
                        value = unescape(a0[0].text)
                    except ValueError:
                        skipped.append((t.start, "bad escape"))
                        i = close + 1
                        continue
                    parts = parse_format(value)
                    err = name == "format" and error_context(sig, i)
                    if parts is None:
                        skipped.append((t.start, "spec"))
                    elif not textlike(parts, err):
                        pass
                    else:
                        res = build(sig, args, parts, value, t, close, name, err, area, section, cat, src)
                        if res is None:
                            skipped.append((t.start, "args"))
                        else:
                            edits.append(res)
                            stats["err" if err else "print" if name in PRINTS else "format"] += 1
                    i = close + 1
                    continue
        # Err("text".into()) / Err("text".to_string()) / .ok_or("text")
        if t.kind == "ident" and t.text == "Err" and i + 1 < n and sig[i + 1].text == "(" and not in_regions(t.start, regions):
            close = match_close(sig, i + 1)
            inner = sig[i + 2 : close]
            if (
                close > 0
                and len(inner) >= 3
                and inner[0].kind == "str"
                and not inner[0].text.startswith("b")
                and inner[1].text == "."
                and inner[2].text in ("into", "to_string", "to_owned")
                and (len(inner) == 5 and inner[3].text == "(" and inner[4].text == ")")
            ):
                try:
                    value = unescape(inner[0].text)
                except ValueError:
                    value = None
                if value is not None and textlike([value], True):
                    mid = cat.add(section, f"e-{area}-{slug(value)}", True, [value])
                    edits.append((inner[0].start, inner[4].end, f'{CUR_CRATE}::terr!("{mid}")'))
                    stats["err"] += 1
            i += 1
            continue
        if (
            t.kind == "ident"
            and t.text == "ok_or"
            and i + 3 < n
            and sig[i + 1].text == "("
            and sig[i + 2].kind == "str"
            and sig[i + 3].text == ")"
            and not in_regions(t.start, regions)
            and sig[i - 1].text == "."
            and not sig[i + 2].text.startswith("b")
        ):
            try:
                value = unescape(sig[i + 2].text)
            except ValueError:
                value = None
            if value is not None and textlike([value], True):
                mid = cat.add(section, f"e-{area}-{slug(value)}", True, [value])
                edits.append((t.start, sig[i + 3].end, f'ok_or_else(|| {CUR_CRATE}::terr!("{mid}"))'))
                stats["err"] += 1
        i += 1
    if apply and edits:
        edits.sort()
        out, pos = [], 0
        for a, b, r in edits:
            assert a >= pos, (path, a, pos)
            out.append(src[pos:a])
            out.append(r)
            pos = b
        out.append(src[pos:])
        open(path, "w", encoding="utf-8").write("".join(out))
    return stats, skipped, src


def build(sig, args, parts, value, t, close, name, err, area, section, cat, src):
    """The replacement text for one format!/print call, or None when its arguments cannot be mapped."""
    pos_args = []  # expression texts, positional
    named = {}  # name -> expression text
    for lo, hi in args[1:]:
        sl = sig[lo:hi]
        if len(sl) >= 3 and sl[0].kind == "ident" and sl[1].text == "=" and sl[2].text != "=":
            named[sl[0].text] = src[sl[2].start : sl[-1].end]
        else:
            pos_args.append(src[sl[0].start : sl[-1].end])
    next_pos = 0
    used_vars = {}
    rparts, rust_args = [], []
    for p in parts:
        if isinstance(p, str):
            rparts.append(p)
            continue
        arg, spec = p["arg"], p["spec"]
        if arg == "":
            if next_pos >= len(pos_args):
                return None
            expr = pos_args[next_pos]
            vname = var_name(expr, next_pos)
            next_pos += 1
        elif arg.isdigit():
            k = int(arg)
            if k >= len(pos_args):
                return None
            expr = pos_args[k]
            vname = var_name(expr, k)
        else:
            vname = arg
            expr = named.get(arg, arg)
        # unique variable per distinct (expr, spec)
        key = (expr, spec)
        if key not in used_vars:
            base = vname
            cand, k = base, 2
            while cand in [v for (v, _, _) in used_vars.values()]:
                cand = f"{base}{k}"
                k += 1
            used_vars[key] = (cand, expr, spec)
            rust_args.append((cand, expr, spec))
        rparts.append({"var": used_vars[key][0]})
    mid = cat.add(
        section,
        (f"e-{area}-" if err else f"{area}-") + slug("".join(x for x in rparts if isinstance(x, str))),
        bool(err),
        rparts,
    )
    macro = f"{CUR_CRATE}::{'terr' if err else 't'}"
    if rust_args:
        argtxt = ", ".join(f"{v} = {rust_expr(e, s)}" for v, e, s in rust_args)
        call = f'{macro}!("{mid}", {argtxt})'
    else:
        call = f'{macro}!("{mid}")'
    if name in PRINTS:
        call = f'{name}!("{{}}", {call})'
    return (t.start, sig[close].end, call)


KEYWORDS = {"self", "crate", "super", "type", "mod", "fn", "let", "match", "move", "ref", "static", "struct", "enum", "impl", "trait", "use", "where", "in", "for", "as", "if", "else", "loop", "while", "return", "box", "dyn", "const", "unsafe", "pub", "mut", "true", "false"}
TRAILING_CALLS = re.compile(r"(?:\.(?:name|len|to_string|as_str|to_owned|clone|to_uppercase|to_lowercase|as_ref|unwrap|unwrap_or|join|display|trim|label|id|tag)\s*\((?:[^()]|\([^()]*\))*\))+$")


def var_name(expr, k):
    e = expr.strip().lstrip("&*")
    e = TRAILING_CALLS.sub("", e).strip() or e
    m = re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*(?:\.[A-Za-z_][A-Za-z0-9_]*)*", e)
    name = None
    if m:
        name = e.split(".")[-1]
    else:
        m = re.match(r"([A-Za-z_][A-Za-z0-9_]*)\s*(\(|\.|\[)", e)
        if m:
            name = m.group(1)
    if not name or name in KEYWORDS or name.isdigit():
        return f"v{k + 1}" if not name or name.isdigit() else "value"
    return name.lower()


def rust_expr(expr, spec):
    if not spec:
        return expr
    inner = f'format!("{{:{spec}}}", {expr})'
    if FLOAT_SPEC.search(spec) and not re.search(r"[xXobp?]$", spec):
        return f"crate::i18n::localise_decimal({inner})"
    return inner


def main():
    ap = argparse.ArgumentParser()
    g = ap.add_mutually_exclusive_group(required=True)
    g.add_argument("--scan", action="store_true")
    g.add_argument("--apply", action="store_true")
    ap.add_argument("files", nargs="+")
    a = ap.parse_args()
    cat = Catalogue()
    tot = {"format": 0, "err": 0, "print": 0}
    skipped_all = 0
    for f in a.files:
        path = os.path.abspath(f)
        stats, skipped, src = convert(path, cat, a.apply)
        for k in tot:
            tot[k] += stats[k]
        skipped_all += len(skipped)
        line = f"{f}: {stats['err']} errors, {stats['print']} prints, {stats['format']} format!, {len(skipped)} left"
        print(line)
        if a.scan:
            for pos, why in skipped[:5]:
                ln = src.count("\n", 0, pos) + 1
                print(f"    left: line {ln} ({why})")
    if a.apply:
        cat.save()
    print(f"total: {tot['err']} errors, {tot['print']} prints, {tot['format']} format!, {skipped_all} left")


if __name__ == "__main__":
    main()
