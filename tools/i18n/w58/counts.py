#!/usr/bin/env python3
"""counts.py LANG...  -> $WORK/counts/en.ftl (the English count messages of i18n/en/engine-counts.txt) and
$WORK/counts/cur-<lang>.ftl (the language's current translation of them). Run from the repo root (or set I18N_REPO)."""
import re,sys,os
REPO=os.environ.get('I18N_REPO',os.getcwd()); WORK=os.environ.get('I18N_WORK','/tmp/i18n-work')
os.makedirs(f'{WORK}/counts',exist_ok=True)
cv={('engine-'+a):b for a,b in (l.strip().split(': ') for l in open(f'{REPO}/i18n/en/engine-counts.txt') if l.strip() and not l.startswith('#'))}
def blocks(p):
    return {b.split(' =')[0]:b.rstrip('\n') for b in re.split(r'\n(?=engine-[a-z0-9-]+ =|## |# )',open(p).read()) if b.startswith('engine-')}
en=blocks(f'{REPO}/i18n/en/engine.ftl')
open(f'{WORK}/counts/en.ftl','w').write('\n'.join(f'# count variables (numbers): {v}\n{en[i]}\n' for i,v in cv.items() if i in en))
for l in sys.argv[1:]:
    cur=blocks(f'{REPO}/i18n/{l}/engine.ftl')
    open(f'{WORK}/counts/cur-{l}.ftl','w').write('\n'.join(cur[i]+'\n' for i in cv if i in en and i in cur))
print(len(cv),'count messages')
