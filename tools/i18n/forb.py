import json,os,sys,re,glob
lang=sys.argv[1]
g=json.load(open(os.path.join(os.environ.get('I18N_GLOSSARY_DIR', 'glossary'), f'{lang}.json'),encoding='utf-8'))['forbidden_translations']
words=sorted({w for k in('certified','conformant','compliant','approved') for w in g[k] if w.lower()!='compliance'})
for f in sorted(glob.glob(f'out/{lang}_*.ftl')):
    for i,l in enumerate(open(f,encoding='utf-8'),1):
        for w in words:
            if re.search(r'(?<!\w)'+re.escape(w),l,re.I): print(f,i,w,'|',l.strip()[:200]); break
