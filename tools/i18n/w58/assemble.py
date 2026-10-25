#!/usr/bin/env python3
"""assemble.py LANG -> rewrite i18n/LANG/engine.ftl from header + out/LANG-NN.ftl chunks present."""
import sys,glob,re,os
lang=sys.argv[1]
S=os.environ.get('I18N_WORK','/tmp/i18n-work')
REPO=os.environ.get('I18N_REPO',os.getcwd())
path=f'{REPO}/i18n/{lang}/engine.ftl'
old=open(path).read()
header=[]
for line in old.split('\n'):
    if line.startswith('#') and not line.startswith('##') or not line.strip() and header:
        header.append(line)
    elif line.startswith('engine-') or line.startswith('## '): break
header='\n'.join(header).rstrip('\n')
OMIT={'engine-telemetry-syslog-cef-gnss-trust'}  # machine output (a SIEM event name): stays English
import re as _re
import os
ov_path=f'{S}/counts/out-{lang}.ftl'
OV={}
if os.path.exists(ov_path):
    for b in _re.split(r'\n(?=engine-[a-z0-9-]+ =|## |# )',open(ov_path).read()):
        if b.startswith('engine-'): OV[b.split(' =')[0]]=b.strip('\n')
OMIT=OMIT|set(OV)
body=[]
for f in sorted(glob.glob(f'{S}/out/{lang}-[0-9][0-9].ftl')):
    t=open(f).read()
    blocks=_re.split(r'\n(?=engine-[a-z0-9-]+ =|## )',t)
    t='\n'.join(b for b in blocks if not any(b.startswith(o+' =') for o in OMIT))
    body.append(t.strip('\n'))
import os
if OV: body.append('## plural forms\n\n'+'\n\n'.join(OV.values()))
lg=f'{S}/out/{lang}-legal.ftl'
if os.path.exists(lg): body.append(open(lg).read().strip('\n'))
open(path,'w').write(header+'\n\n'+'\n\n'.join(body)+'\n')
print(lang,len(body),'chunks')
