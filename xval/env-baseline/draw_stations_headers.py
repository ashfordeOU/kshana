import json,glob,subprocess,time,zlib,sys
c=json.load(open('cands.json')); need=c['need']
lists=sorted(glob.glob('list_*.txt'))
fn={}
for f in lists:
    y,d=f[5:-4].split('_')
    for x in open(f).read().split(): fn.setdefault(x[:9],[]).append((y,d,x))
def ok_header(url):
    # A failed fetch is retried until a header is read; only a header decides (never the network).
    for i in range(30):
        r=subprocess.run(['curl','-sS','--max-time','60','-r','0-40000',url],capture_output=True)
        if r.returncode==0 and len(r.stdout)>1000:
            try:
                txt=zlib.decompressobj(16+zlib.MAX_WBITS).decompress(r.stdout).decode('latin1')
                if 'END OF HEADER' in txt: break
            except Exception: pass
        time.sleep(min(60, 4*(i+1)))
    else:
        raise SystemExit('no header after 30 tries: '+url)
    hdr=txt.split('END OF HEADER')[0].splitlines()
    codes=[]; on=False
    for l in hdr:
        lab=l[60:].strip()
        if lab=='SYS / # / OBS TYPES':
            if l[0]=='G': on=True; codes+=l[7:60].split()
            elif l[0]==' ' and on: codes+=l[7:60].split()
            else: on=False
    return any(x.startswith('L1') for x in codes) and any(x.startswith('L2') for x in codes) and 'S1C' in codes
res={}
for band,sts in c['bands'].items():
    chosen=[]
    for s in sts:
        good=0; bad=0; total=len(fn[s])
        for (y,d,x) in fn[s]:
            v=ok_header(f"https://igs.bkg.bund.de/root_ftp/IGS/obs/{y}/{d}/{x}")
            if v: good+=1
            else: bad+=1
            if total-bad<need: break
        print(band,s,'good',good,'of',total,flush=True)
        if good>=need: chosen.append(s)
        if len(chosen)==4: break
    res[band]=chosen
json.dump(res,open('stations.json','w'),indent=1); print(res)
