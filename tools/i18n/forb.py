import json,sys,re,glob
lang=sys.argv[1]
g=json.load(open(f'/workspace/kshana-pro/site/i18n-0.40/i18n/glossary/{lang}.json',encoding='utf-8'))['forbidden_translations']
words=sorted({w for k in('certified','conformant','compliant','approved') for w in g[k] if w.lower()!='compliance'})
for f in sorted(glob.glob(f'out/{lang}_*.ftl')):
    for i,l in enumerate(open(f,encoding='utf-8'),1):
        for w in words:
            if re.search(r'(?<!\w)'+re.escape(w),l,re.I): print(f,i,w,'|',l.strip()[:200]); break
