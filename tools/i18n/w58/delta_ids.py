#!/usr/bin/env python3
"""delta_ids.py FIRST_NN ID_LIST.txt -> $WORK/chunks/en-NN.ftl (chunks of about 26 KB) holding exactly the English messages whose ids
(with or without the `engine-` prefix) are listed, one per line, in English-catalogue order, with their `## section` lines.
For a delta that mixes new ids and ids to retranslate (the 0.40 delta: tools/i18n/w58/delta_040.py builds the list). Run from the
repo root (or set I18N_REPO). Prints the chunk numbers written."""
import re, sys, os
REPO = os.environ.get('I18N_REPO', os.getcwd()); WORK = os.environ.get('I18N_WORK', '/tmp/i18n-work')
first, listfile = int(sys.argv[1]), sys.argv[2]
want = set(('engine-' + x.strip()) if not x.strip().startswith('engine-') else x.strip() for x in open(listfile) if x.strip() and not x.startswith('#'))
text = open(f'{REPO}/i18n/en/engine.ftl').read()
section = ''; last = None; blocks = []; found = set()
for p in re.split(r'\n(?=engine-[a-z0-9-]+ =|## )', text)[1:]:
    if p.startswith('## '):
        section = p.strip().split('\n')[0]; continue
    if not p.startswith('engine-'):
        continue
    i = p.split(' =')[0]
    if i not in want:
        continue
    found.add(i)
    if section != last:
        blocks.append(section + '\n'); last = section
    blocks.append(p.rstrip('\n') + '\n')
missing = want - found
if missing:
    print('ids not in the English catalogue:', sorted(missing)[:10]); sys.exit(1)
os.makedirs(f'{WORK}/chunks', exist_ok=True)
chunks, cur, size = [], [], 0
for b in blocks:
    if size > 26000 and not b.startswith('## '):
        chunks.append(cur); cur = []; size = 0
    cur.append(b); size += len(b)
chunks.append(cur)
for k, c in enumerate(chunks):
    open(f'{WORK}/chunks/en-{first + k}.ftl', 'w').write('\n'.join(c))
print(len(found), 'messages in chunks', ' '.join(str(first + k) for k in range(len(chunks))))
