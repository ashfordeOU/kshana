#!/usr/bin/env python3
"""delta.py NN ARG...  -> $WORK/chunks/en-NN.ftl with the English messages not yet handled. Each ARG is either a language code
(its i18n/<lang>/engine.ftl ids count as handled) or a path to a .txt file of handled ids, one per line (done-ids-*.txt: the
ids already translated or deliberately left English, which is how the pl/cs/uk/ru/fi/et/ja/zh-Hans files work, since they omit
messages with no human words). Run from the repo root (or set I18N_REPO). Prints the number of messages."""
import re,sys,os
REPO=os.environ.get('I18N_REPO',os.getcwd()); WORK=os.environ.get('I18N_WORK','/tmp/i18n-work')
nn,langs=sys.argv[1],sys.argv[2:]
ids=lambda p:set(re.findall(r'^(engine-[a-z0-9-]+) =',open(p).read(),re.M))
have=set()
for l in langs:
    if l.endswith('.txt'): have|=set(x.strip() for x in open(l) if x.strip())
    else: have|=ids(f'{REPO}/i18n/{l}/engine.ftl')
t=open(f'{REPO}/i18n/en/engine.ftl').read()
section='';out=[];last=None;n=0
for p in re.split(r'\n(?=engine-[a-z0-9-]+ =|## )',t)[1:]:
    if p.startswith('## '): section=p.strip().split('\n')[0]; continue
    if not p.startswith('engine-'): continue
    if p.split(' =')[0] in have: continue
    if section!=last: out.append(section+'\n'); last=section
    out.append(p.rstrip('\n')+'\n'); n+=1
os.makedirs(f'{WORK}/chunks',exist_ok=True)
open(f'{WORK}/chunks/en-{nn}.ftl','w').write('\n'.join(out)); print(n,'messages')
