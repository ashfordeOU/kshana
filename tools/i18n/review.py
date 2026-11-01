#!/usr/bin/env python3
"""Write i18n/<lang>/REVIEW.md: what a native reviewer should look at first, ranked.
Sources: the legal messages of i18n/<lang>/engine.ftl, optional translator notes (a file of `id | note` lines named by $I18N_NOTES),
and automatic flags computed from the English and the translation.
  python3 tools/i18n/review.py <lang>      (run from the repository root)"""
import re, sys, os
sys.path.insert(0, os.path.dirname(__file__))
import tools
WORK = os.environ.get('I18N_WORK', '/tmp/claude-0/i18n')
lang = sys.argv[1]
en = {e['id']: tools.body(e) for e in tools.parse('i18n/en/engine.ftl')}
tr = {e['id']: tools.body(e) for e in tools.parse(f'i18n/{lang}/engine.ftl')}
def val(b): return b.split('=', 1)[1].strip()
legal = [i for i in tr if i.startswith('engine-legal-')]
notes = {}
p = os.environ.get('I18N_NOTES', '')
if p and os.path.exists(p):
    for ln in open(p, encoding='utf-8'):
        if '|' in ln:
            k, v = ln.split('|', 1); notes[k.strip()] = v.strip()
gloss = [i for i in tr if re.search(r'\b(validated|validation|modelled|Modelled|Validated)\b', val(en[i])) and not re.search(r'\b(MODELLED|VALIDATED)\b', val(en[i]))]
neg = [i for i in tr if re.search(r'\bnot (a |an )?(certif|type-approved|approv|legal|conform|accredit)', val(en[i]), re.I) and i not in legal]
unk = [i for i in tr if re.search(r'\{ \$v\d+ \}|\{ \$why \}|\{ \$opt\d* \}', val(en[i]))]
same = [i for i in tr if val(tr[i]) == val(en[i]) and re.search(r'[A-Za-z]{4}', re.sub(r'\{[^}]*\}', '', val(en[i])))]
out = [f'# Native review list: {lang}', '',
 'Machine draft by an AI model; NOT reviewed by a native speaker. English is the reference. Ranked, most important first.', '',
 '## 1. Legal texts (`# legal: native review`): negation and scope must be exact', '']
for i in legal: out.append(f'- `{i}`' + (f': {notes[i]}' if i in notes else ''))
out += ['', '## 2. Translator notes on other messages (delta batch)', '']
for i, v in notes.items():
    if i not in legal: out.append(f'- `{i}`: {v}')
out += ['', f'## 3. Messages where the English says lowercase or capitalised validated/modelled ({len(gloss)}): the glossary gloss was used instead of the tier word', '']
out += [f'- `{i}`' for i in gloss[:60]] + ([f'- ... and {len(gloss)-60} more'] if len(gloss) > 60 else [])
out += ['', f'## 4. Negations that keep a forbidden word on purpose ({len(neg)}): check scope', '']
out += [f'- `{i}`' for i in neg[:60]]
out += ['', f'## 5. Messages built from placeables whose content is unknown ({len(unk)}): word order may need a runtime look', '']
out += [f'- `{i}`' for i in unk[:80]] + ([f'- ... and {len(unk)-80} more'] if len(unk) > 80 else [])
out += ['', f'## 6. Messages identical to the English apart from placeables ({len(same)}): intended (code, CSS, machine lines) or missed', '']
out += [f'- `{i}`' for i in same[:80]] + ([f'- ... and {len(same)-80} more'] if len(same) > 80 else [])
out += ['', '## 7. Terms to confirm', '', 'See `i18n/<lang>/glossary.ftl` once it exists (or the glossary JSON in kshana-pro `site/i18n-0.40/i18n/glossary/<lang>.json`).', '']
open(f'i18n/{lang}/REVIEW.md', 'w', encoding='utf-8').write('\n'.join(out))
print(lang, len(legal), len(notes), len(gloss), len(neg), len(unk), len(same))
