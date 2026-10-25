#!/usr/bin/env python3
"""Read the per-language guides of the engine catalogue (W58: tools/i18n/w58/guides/<lang>.md) and write
tools/i18n/ui/glossary-fixed.json: for each language the fixed renderings the interface glossary must use (terms, the four
advisory sentences, the machine-translation notice). usage: extract_guides.py <guides dir> <out.json>"""
import json, re, sys, os

LANGS = "nl pl pt-BR pt-PT fi sv da nb cs uk ru de fr es et ja zh-Hans".split()
ADV_EN = [
    "Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.",
    "Advisory software, not type-approved equipment.",
    "Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.",
    "Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.",
]


def parse(path, lang):
    text = open(path, encoding="utf-8").read()
    terms = {}
    sect = None
    for line in text.splitlines():
        if line.startswith("## "):
            sect = line
        m = re.match(r"- (.+?) -> (.+)$", line)
        if m and sect and sect.startswith("## Terms"):
            terms[m.group(1).strip()] = m.group(2).strip()
    adv = {}
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if line.startswith("- EN: "):
            en = line[6:].strip()
            nxt = lines[i + 1].strip()
            assert nxt.startswith(lang + ": "), (lang, nxt[:40])
            adv[en] = nxt[len(lang) + 2 :].strip()
    gloss = {}
    for line in lines:
        if line.startswith("## Tier and verdict words"):
            tail = line.split("Glosses (for reference only):", 1)[-1]
            for part in re.split(r";\s+(?=[A-Z][A-Z ]+:)", tail):
                m = re.match(r"\s*([A-Z][A-Z ]+): (.+)$", part)
                if m:
                    gloss[m.group(1)] = m.group(2).strip()
    mt = None
    for line in lines:
        if line.startswith("- Machine translation notice:"):
            mt = line.split(":", 1)[1].strip()
    assert mt, lang
    # Every sentence the guide gives (its own English text, whichever variants it lists); the four of the interface
    # glossary are looked up by their English text, and a variant the guide does not have is null (translated by hand).
    return {
        "terms": terms,
        "advisory_all": adv,
        "advisory": [adv.get(e) for e in ADV_EN],
        "mt_notice": mt,
        "tier_glosses": gloss,
    }


if __name__ == "__main__":
    gdir, out = sys.argv[1], sys.argv[2]
    data = {"advisory_en": ADV_EN}
    for lang in LANGS:
        data[lang] = parse(os.path.join(gdir, lang + ".md"), lang)
    json.dump(data, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1, sort_keys=True)
    print("wrote", out, len(LANGS), "languages")
