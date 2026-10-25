#!/usr/bin/env python3
"""assemble_040.py LANG: apply the 0.40 delta to i18n/LANG/engine.ftl. Layers the translated chunks $WORK/out/LANG-NN.ftl (NN >= 40, from
delta_040.py + delta_ids.py) onto the file: a block whose id is already there is replaced in place (a retranslated message), the others are
appended under `## added in the 0.40 delta`; every message whose id is not in the current English catalogue (the ids removed from the
English text) is dropped; the machine-output message engine-telemetry-syslog-cef-gnss-trust stays out. Run from the repo root."""
import sys, re, glob, os
lang = sys.argv[1]
S = os.environ.get('I18N_WORK', '/tmp/i18n-work'); REPO = os.environ.get('I18N_REPO', os.getcwd())
path = f'{REPO}/i18n/{lang}/engine.ftl'
split = lambda x: re.split(r'\n(?=engine-[a-z0-9-]+ =|## |# )', x)
idof = lambda b: b.split(' =')[0] if b.startswith('engine-') else None
cur = set(re.findall(r'^(engine-[a-z0-9-]+) =', open(f'{REPO}/i18n/en/engine.ftl').read(), re.M))
OMIT = {'engine-telemetry-syslog-cef-gnss-trust'}
new = {}
for f in sorted(glob.glob(f'{S}/out/{lang}-[4-9][0-9].ftl')):
    for b in split(open(f).read()):
        i = idof(b)
        if i and i in cur and i not in OMIT:
            new[i] = b.rstrip('\n') + '\n'
out, seen, dropped, replaced = [], set(), 0, 0
for b in split(open(path).read()):
    i = idof(b)
    if i:
        if i not in cur or i in OMIT:
            dropped += 1
            continue
        seen.add(i)
        if i in new:
            b = new[i]; replaced += 1
    out.append(b)
added = {i: b for i, b in new.items() if i not in seen}
res = '\n'.join(out).rstrip('\n') + '\n'
if added:
    res += '\n## added in the 0.40 delta\n\n' + '\n'.join(added.values())
open(path, 'w').write(res)
print(lang, 'dropped', dropped, 'replaced', replaced, 'added', len(added))
