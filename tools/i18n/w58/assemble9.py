#!/usr/bin/env python3
"""assemble9.py LANG: layer onto the existing i18n/LANG/engine.ftl (W57 base): replace blocks listed in counts/out-LANG.ftl in place,
append out/LANG-NN.ftl (delta chunks NN>=16) blocks not yet present."""
import sys,re,glob,os
lang=sys.argv[1]
S=os.environ.get('I18N_WORK','/tmp/i18n-work')
REPO=os.environ.get('I18N_REPO',os.getcwd())
path=f'{REPO}/i18n/{lang}/engine.ftl'
t=open(path).read()
split=lambda x: re.split(r'\n(?=engine-[a-z0-9-]+ =|## |# )',x)
def idof(b): return b.split(' =')[0] if b.startswith('engine-') else None
def load(p):
    d={}
    if os.path.exists(p):
        for b in split(open(p).read()):
            i=idof(b)
            if i: d[i]=b.rstrip('\n')+'\n'
    return d
OV=load(f'{S}/counts/out-{lang}.ftl')
parts=split(t); seen=set(); out=[]
for b in parts:
    i=idof(b)
    if i:
        seen.add(i)
        if i in OV: b=OV[i]+'\n'
    out.append(b)
new={}
for f in sorted(glob.glob(f'{S}/out/{lang}-[1-9][0-9].ftl')):
    for i,b in load(f).items():
        if i not in seen: new[i]=b
for i in OV:
    if i not in seen: new[i]=OV[i]
res='\n'.join(out).rstrip('\n')+'\n'
if new: res+='\n## added by the second pass\n\n'+'\n'.join(new.values())
open(path,'w').write(res)
print(lang,'replaced',len([i for i in OV if i in seen]),'added',len(new))
