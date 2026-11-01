#!/usr/bin/env python3
# Split i18n/en/engine.ftl into chunks of translatable messages (prose >= 1 word), keeping section comments.
import re,sys,json
import os
src,outdir=sys.argv[1],sys.argv[2]
os.makedirs(outdir,exist_ok=True)
LIMIT=26000
t=open(src).read()
parts=re.split(r'\n(?=engine-[a-z0-9-]+ =|## )',t)
section=''
msgs=[]
for p in parts[1:]:
    if p.startswith('## '):
        section=p.strip().split('\n')[0]; continue
    if not p.startswith('engine-'): continue
    # strip trailing section header lines that belong to the next block
    body=p.rstrip('\n')
    mid=body.split(' =')[0]
    text=re.sub(r'\{[^{}]*\}',' ',body.split('=',1)[1])
    if not re.search(r'[A-Za-z][a-z]{2,}',text) and not re.search(r'[A-Za-z]{3,}',text):
        continue
    msgs.append((section,mid,body))
chunks=[];cur=[];size=0
for s,i,b in msgs:
    if size+len(b)>LIMIT and cur:
        chunks.append(cur);cur=[];size=0
    cur.append((s,i,b));size+=len(b)+2
if cur: chunks.append(cur)
for n,ch in enumerate(chunks):
    out=[];last=None
    for s,i,b in ch:
        if s!=last: out.append(s+'\n'); last=s
        out.append(b+'\n')
    open(f'{outdir}/en-{n:02d}.ftl','w').write('\n'.join(out))
print(len(msgs),'messages in',len(chunks),'chunks')
json.dump({'ids':[i for _,i,_ in msgs],'chunks':[[i for _,i,_ in ch] for ch in chunks]},open(f'{outdir}/index.json','w'))
