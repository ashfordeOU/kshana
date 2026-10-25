#!/usr/bin/env python3
"""Move literal decimal numbers out of catalogue message text into placeables, so each language
formats them with its own decimal mark (a Danish or German reader would otherwise see 0.5).
For each (message id, literal) the .ftl text gets `{ $lit_<digits> }`, every Rust call site of the
message gets `lit_<digits> = i18n::num(<literal>, <decimals>)`, and the recorded original template
(corpus.json / manual.json) gets a {"var": ...} part, so the catalogue test still proves English.
Idempotent: a literal already gone from the message is skipped. Lists the converted ids in
i18n/en/engine-numbers.txt."""
import glob, json, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# id -> literals to turn into placeables (identifiers such as `version 1.0`, `Table 3.2-2` and SVG
# attribute values stay: they are names and markup, not quantities).
TARGETS = {
    "e-animation-animation-duration-must-be-between": ["0.5"],
    "bench-tasks-kshana-receiver-trust-35-default": ["0.35"],
    "e-body-pnt-user-altitude-must-be-positive": ["0.9"],
    "e-constellation-eccentricity-must-lie-in": ["0.9"],
    "e-constellation-grid-step-deg-must-lie": ["0.25"],
    "fusion-hybrid-ukf-chart-subtitle": ["1.0"],
    "fusion-hybrid-ukf-chart-target": ["1.0"],
    "hybrid-chart-title": ["1.0"],
    "hybrid-chart-spec-line": ["1.0"],
    "iq-cli-track-hz-is-samples-per-chip": ["0.09"],
    "e-leo-navmsg-fit-sample-and-eval-step": ["0.5"],
    "e-leo-navmsg-truth-eccentricity-must-be-in-for": ["0.1"],
    "leo-signal-chart-psd-axis": ["0.6"],
    "sdr-sampling-rate-is-commensurate-with": ["4.8876", "24.4379"],
    "telecom-timing-the-mask-is-defined-through": ["0.1"],
    "e-tracking-loop-tracking-loop-correlator-spacing-chips": ["1.9"],
}


def var_of(lit):
    return "lit_" + lit.replace(".", "_")


def call_sites(id_):
    pat = re.compile(r'((?:crate::|kshana::)?(?:terr|t)!\(\s*"' + re.escape(id_) + r'")')
    for f in glob.glob(os.path.join(ROOT, "src/**/*.rs"), recursive=True):
        s = open(f, encoding="utf-8").read()
        for m in pat.finditer(s):
            yield f, s, m


def close_paren(s, i):
    d = 1
    while d:
        c = s[i]
        if c == '"':
            i += 1
            while s[i] != '"':
                i += 2 if s[i] == "\\" else 1
        elif c == "(":
            d += 1
        elif c == ")":
            d -= 1
        i += 1
    return i - 1


def main():
    ftl_path = os.path.join(ROOT, "i18n/en/engine.ftl")
    ftl = open(ftl_path, encoding="utf-8").read()
    done = []
    for id_, lits in TARGETS.items():
        m = re.search(r'(?m)^engine-' + re.escape(id_) + r' =[ \t]*(.*(?:\n[ \t]+.*)*)', ftl)
        if not m:
            sys.exit("no message " + id_)
        body = m.group(1)
        new = body
        todo = [l for l in lits if re.search(r'(?<![\w.$-])' + re.escape(l) + r'(?![\w.])', re.sub(r'\{[^{}]*\}', '', new))]
        if not todo:
            continue
        for l in todo:
            new = re.sub(r'(?<![\w.$-])' + re.escape(l) + r'(?![\w.{])', "{ $" + var_of(l) + " }", new, count=1)
        ftl = ftl[:m.start(1)] + new + ftl[m.end(1):]
        # Rust call sites, last to first within each file
        edits = {}
        for f, s, cm in call_sites(id_):
            edits.setdefault(f, []).append((s, cm))
        for f, lst in edits.items():
            s = open(f, encoding="utf-8").read()
            for _, cm in sorted(lst, key=lambda x: -x[1].start()):
                end = close_paren(s, cm.end())
                inner = s[cm.end():end].rstrip()
                args = "".join(
                    f', {var_of(l)} = {"crate" if not f.endswith("main.rs") else "kshana"}::i18n::num({l}_f64, {len(l.split(".")[1])})'
                    for l in todo)
                if inner.endswith(","):
                    args = args[1:] if args.startswith(",") else args
                    args = args.lstrip()
                    ins = " " + args
                else:
                    ins = args
                s = s[:cm.end() + len(inner)] + ins + s[cm.end() + len(inner):]
            open(f, "w", encoding="utf-8").write(s)
        # recorded originals
        for name in ("corpus.json", "manual.json"):
            p = os.path.join(ROOT, "tests/fixtures/i18n", name)
            if not os.path.exists(p):
                continue
            data = json.load(open(p, encoding="utf-8"))
            changed = False
            for e in data:
                if e["id"] != id_:
                    continue
                parts = []
                for part in e["parts"]:
                    if isinstance(part, str):
                        for l in todo:
                            pass
                        pieces = [part]
                        for l in todo:
                            nxt = []
                            for pc in pieces:
                                if isinstance(pc, str):
                                    mm = re.search(r'(?<![\w.$-])' + re.escape(l) + r'(?![\w.])', pc)
                                    if mm:
                                        nxt += [pc[:mm.start()], {"var": var_of(l)}, pc[mm.end():]]
                                        changed = True
                                        continue
                                nxt.append(pc)
                            pieces = nxt
                        parts += [pc for pc in pieces if pc != ""]
                    else:
                        parts.append(part)
                e["parts"] = parts
            if changed:
                json.dump(data, open(p, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
                open(p, "a").write("\n")
        done.append((id_, [var_of(l) for l in todo]))
    open(ftl_path, "w", encoding="utf-8").write(ftl)
    path = os.path.join(ROOT, "i18n/en/engine-numbers.txt")
    old = open(path).read() if os.path.exists(path) else ""
    lines = [l for l in old.splitlines() if l and not l.startswith("#")]
    for i, vs in done:
        line = f"{i}: {' '.join(vs)}"
        if line not in lines:
            lines.append(line)
    open(path, "w", encoding="utf-8").write(
        "# Messages whose numbers are passed as placeables, so each language formats them (decimal mark).\n"
        "# Translators keep the placeables; format of a line: id: variables.\n" + "\n".join(sorted(lines)) + "\n")
    print(len(done), "messages converted")


main()
