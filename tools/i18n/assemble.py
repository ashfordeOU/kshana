import re,sys,glob,os
sys.path.insert(0,'/tmp/claude-0/i18n')
import tools
LEGAL=re.compile(r"(not (a |an )?(certif|approv|legal|conform|type-approved|accredit)|advisory|disclaim|conformance|accreditation|certification)",re.I)
def assemble(lang, repo='/workspace/kshana'):
    outs=sorted(glob.glob(f'/tmp/claude-0/i18n/out/{lang}_*.ftl'))
    hdr=open(f'{repo}/i18n/{lang}/engine.ftl',encoding='utf-8').read().split('\n')
    head=[]
    for ln in hdr:
        if ln.startswith('#') or ln.strip()=='' : head.append(ln)
        else: break
    text=[]; last=None
    for f in outs:
        for e in tools.parse(f):
            if e['sect']!=last: text.append(e['sect'] or ''); text.append(''); last=e['sect']
            b=tools.body(e)
            if LEGAL.search(b) or e["id"].startswith("engine-legal-"): text.append('# legal: native review')
            text.append(b); text.append('')
    open(f'{repo}/i18n/{lang}/engine.ftl','w',encoding='utf-8').write('\n'.join(head).rstrip('\n')+'\n\n'+'\n'.join(text))
    print(lang,len(outs),'batches assembled')
if __name__=='__main__': assemble(sys.argv[1])
