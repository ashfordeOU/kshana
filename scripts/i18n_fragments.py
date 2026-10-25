#!/usr/bin/env python3
"""List the catalogue messages that are sentence fragments: pieces of a sentence that the code
joins at runtime (push_str, `+`, a Vec of pieces, a message passed as an argument of another one),
or that start or end mid-sentence. A translator cannot translate a fragment correctly, because
word order and agreement change across the pieces. Writes i18n/en/engine-fragments.txt."""
import glob, os, re, sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
TOK = r'(?:crate::|kshana::)?t!\(\s*"([a-z0-9-]+)"'


def messages():
    text = open(os.path.join(ROOT, "i18n/en/engine.ftl"), encoding="utf-8").read()
    out = {}
    for m in re.finditer(r'(?m)^engine-([a-z0-9-]+) =[ \t]*(.*(?:\n[ \t]+.*)*)', text):
        out[m.group(1)] = m.group(2)
    return out


def text_fragment(raw):
    s = raw.strip()
    starts = raw[:1] in " \t" or re.match(r'[,;]', raw) is not None
    ends = re.search(r'(\b(and|or|the|a|an|of|to|in|with|for|by|as|is|are|from|than|at|on|then|that|which)|[,:(;])\s*$', s) is not None
    return starts or ends


def joined_sites():
    ids = {}
    for f in glob.glob(os.path.join(ROOT, "src/**/*.rs"), recursive=True) + glob.glob(os.path.join(ROOT, "src/*.rs")):
        s = open(f, encoding="utf-8").read()
        for m in re.finditer(TOK, s):
            pre = s[max(0, m.start() - 60):m.start()]
            why = None
            if re.search(r'push_str\(\s*&?\s*(?:crate::|kshana::)?$', pre) or re.search(r'\+=\s*&?\s*$', pre):
                why = "pushed onto a string"
            elif re.search(r'\.push\(\s*$', pre) or re.search(r'vec!\[[^\]]*$', pre):
                why = "collected as a piece"
            else:
                # `let x = t!(..)` whose name is passed later as `k = x` to another message
                lm = re.search(r'let\s+(?:mut\s+)?(\w+)\s*(?::[^=]+)?=\s*(?:\w+\s*\.\s*)?$', pre)
                if lm:
                    var = lm.group(1)
                    tail = s[m.end(): m.end() + 1500]
                    if re.search(r'\b\w+\s*=\s*&?' + re.escape(var) + r'\b\s*[,)]', tail) or re.search(r'\b' + re.escape(var) + r'\s*[,)]', tail.split("t!(")[-1] if False else tail):
                        why = "passed to another message"
            if why:
                ids.setdefault(m.group(1), why)
    return ids


def main():
    msgs = messages()
    found = {}
    for i, raw in msgs.items():
        if i.startswith(("advanced-report-bg", "animation-", "palette-", "interop-", "python-", "iq-cli-sweep", "jammertest-dataset", "receiver-trust-machines")):
            continue  # file formats, not prose
        if text_fragment(raw):
            found[i] = "starts or ends mid-sentence"
    # A message pushed onto a string or collected as a piece is usually a whole line of a report, which
    # translates fine; it is a fragment only when its text is (above) or when another message is built
    # from it.
    for i, why in joined_sites().items():
        if i in msgs and why == "passed to another message":
            found.setdefault(i, why)
    path = os.path.join(ROOT, "i18n/en/engine-fragments.txt")
    lines = ["# Messages that are pieces of a sentence assembled at run time. Do not translate them word for word:",
             "# the order of the pieces changes across languages. Each is to be merged into one whole-sentence",
             "# message with placeables; the list may only shrink (tests/i18n_catalogue.rs). id: reason", ""]
    lines += [f"{i}: {w}" for i, w in sorted(found.items())]
    if "--check" in sys.argv:
        return len(found)
    open(path, "w", encoding="utf-8").write("\n".join(lines) + "\n")
    print(len(found), "fragments ->", os.path.relpath(path, ROOT))


main()
