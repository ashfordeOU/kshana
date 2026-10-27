import re, sys, json, collections, os
def parse(path):
    """Return header lines (before first entry/section) and list of (section, id, text_lines)."""
    L=open(path,encoding='utf-8').read().split('\n')
    ents=[];sect=None;cur=None
    for ln in L:
        if ln.startswith('## '): sect=ln; cur=None; continue
        m=re.match(r'^(engine-[a-z0-9-]+) =(.*)$',ln)
        if m:
            cur={'sect':sect,'id':m.group(1),'lines':[ln]}; ents.append(cur); continue
        if cur is not None: cur['lines'].append(ln)
        # comments / blanks before first entry ignored
    for e in ents:
        while e['lines'] and e['lines'][-1].strip()=='' : e['lines'].pop()
        # drop trailing comment lines accidentally attached
    return ents
def body(e): return '\n'.join(e['lines'])
def toks(text):
    br=collections.Counter(re.findall(r'\{[^{}]*\}',text))
    outside=re.sub(r'\{[^{}]*\}','',text)
    ex={
     'braces':br,
     'ecode':collections.Counter(re.findall(r'\bE-[A-Z0-9]+(?:-[A-Z0-9]+)*\b',text)),
     'digits':collections.Counter(re.findall(r'\d+(?:\.\d+)?',outside)),
     'code':collections.Counter(re.findall(r'`[^`]*`',outside)),
     'tier':collections.Counter(re.findall(r'\b(?:MODELLED|VALIDATED|PARTNER|NOT MET|EXPLORATORY)\b',outside)),
    }
    return ex
def check(en_path,out_path):
    en=parse(en_path); out=parse(out_path)
    errs=[]
    if [e['id'] for e in en]!=[e['id'] for e in out]:
        a={e['id'] for e in en}; b=[e['id'] for e in out]
        errs.append(f"id mismatch: missing {sorted(a-set(b))[:5]} extra {sorted(set(b)-a)[:5]} dup {[k for k,v in collections.Counter(b).items() if v>1][:5]}")
        return errs
    for a,b in zip(en,out):
        ta,tb=toks(body(a).split('=',1)[1]),toks(body(b).split('=',1)[1])
        for k in ta:
            if ta[k]!=tb[k]:
                errs.append(f"{a['id']}: {k} differs: en {dict(ta[k])} out {dict(tb[k])}")
        # indentation/continuation structure: same number of lines
        if len(a['lines'])!=len(b['lines']):
            errs.append(f"{a['id']}: line count {len(a['lines'])} vs {len(b['lines'])}")
    return errs
if __name__=='__main__':
    cmd=sys.argv[1]
    if cmd=='split':
        en=parse('i18n/en/engine.ftl'); n=int(sys.argv[2]); os.makedirs('/tmp/claude-0/i18n/batches',exist_ok=True)
        for i in range(0,len(en),n):
            chunk=en[i:i+n]; out=[]; last=None
            for e in chunk:
                if e['sect']!=last: out.append(e['sect'] or ''); out.append(''); last=e['sect']
                out.append(body(e)); out.append('')
            open(f'/tmp/claude-0/i18n/batches/en_{i//n:02d}.ftl','w',encoding='utf-8').write('\n'.join(out))
        print(len(en),'messages',(len(en)+n-1)//n,'batches')
    elif cmd=='check':
        e=check(sys.argv[2],sys.argv[3]); print('\n'.join(e[:40])); print('OK' if not e else f'{len(e)} problems'); sys.exit(1 if e else 0)
