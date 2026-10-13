# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the gnss_wettzell_2025055 fixture: GPS observations of the IGS stations WTZR and WTZZ
(Wettzell) on 2025-02-24 with the IGS final products and published reference values.

Usage: python3 -I make_fixture.py <download dir> <out dir>
The download dir holds, unchanged:
  WTZR.rnx, WTZZ.rnx   the Hatanaka-decompressed (hatanaka 2.8.1, the repository's pinned
                       oracle toolchain) daily files WTZR00DEU_R_20250550000_01D_30S_MO.crx.gz and
                       WTZZ00DEU_R_20250550000_01D_30S_MO.crx.gz (IGS obs/2025/055)
  IGS0OPSFIN_20250550000_01D_05M_CLK.CLK.gz   (IGS products/2355)
  igs20.atx                                    (files.igs.org/pub/station/general)
  ITRF2020_GNSS.SSC.txt                        (itrf.ign.fr/ftp/pub/itrf/itrf2020)
The EUREF products (EPN weekly SINEX, EUREF troposphere) used by the data-gated checks are not
cut here: their licence could not be confirmed, so the tests read them from a local path.
"""
import gzip
import hashlib
import os
import sys

src, out = sys.argv[1], sys.argv[2]
TYPES = ["C1C", "L1C", "C2W", "L2W"]


def sha(path):
    with open(path, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()


def cut_obs(name, out_name, end_hour):
    lines = open(os.path.join(src, name)).read().splitlines()
    header, i, types = [], 0, {}
    cur = None
    while True:
        ln = lines[i]
        i += 1
        label = ln[60:].strip()
        if label == "SYS / # / OBS TYPES":
            if ln[0] != " ":
                cur = ln[0]
                types[cur] = ln[7:58].split()
            else:
                types[cur] += ln[7:58].split()
            if cur == "G" and ln[0] == "G":
                header.append("G%5d %s" % (len(TYPES), " ".join(TYPES)))
                header[-1] = header[-1].ljust(60) + "SYS / # / OBS TYPES"
            continue
        if label == "SYS / PHASE SHIFT":
            if ln[0] == "G" and ln[2:5] in TYPES:
                header.append(ln)
            continue
        if label.startswith("GLONASS") or label in ("SYS / DCBS APPLIED", "SYS / SCALE FACTOR"):
            continue
        header.append(ln)
        if label == "END OF HEADER":
            break
    idx = [types["G"].index(t) for t in TYPES]
    body = []
    while i < len(lines):
        ln = lines[i]
        i += 1
        assert ln.startswith(">"), ln
        n = int(ln[32:35])
        recs = lines[i:i + n]
        i += n
        hour = int(ln[13:15])
        if hour >= end_hour:
            continue
        kept = []
        for r in recs:
            if r[0] != "G":
                continue
            fields = []
            for k in idx:
                f = r[3 + 16 * k: 3 + 16 * (k + 1)]
                fields.append(f.ljust(16))
            rec = (r[:3] + "".join(fields)).rstrip()
            if len(rec) > 3:
                kept.append(rec)
        body.append(ln[:32] + "%3d" % len(kept) + ln[35:])
        body.extend(kept)
    with open(os.path.join(out, out_name), "w") as f:
        f.write("\n".join(header + body) + "\n")


cut_obs("WTZR.rnx", "wtzr_2025055_0006_G.rnx", 6)
cut_obs("WTZZ.rnx", "wtzz_2025055_0003_G.rnx", 3)

# Clocks: header and GPS satellite records 00:00 to 06:05.
with gzip.open(os.path.join(src, "IGS0OPSFIN_20250550000_01D_05M_CLK.CLK.gz"), "rt") as f:
    lines = f.read().splitlines()
keep, header = [], True
for ln in lines:
    if header:
        keep.append(ln)
        header = not ln[60:].startswith("END OF HEADER")
        continue
    if ln.startswith("AS G"):
        t = ln.split()
        if int(t[5]) < 6 or (int(t[5]) == 6 and int(t[6]) <= 5):
            keep.append(ln)
with open(os.path.join(out, "igs_2025055_G_05m_0006.clk"), "w") as f:
    f.write("\n".join(keep) + "\n")

# ANTEX: header, GPS satellite antennas valid on 2025-02-24, and the LEIAR25.R3 LEIT block.
lines = open(os.path.join(src, "igs20.atx")).read().splitlines()
keep, block, in_header = [], [], True
for ln in lines:
    if in_header:
        keep.append(ln)
        in_header = not ln[60:].startswith("END OF HEADER")
        continue
    block.append(ln)
    if ln[60:].startswith("END OF ANTENNA"):
        head = block[1]
        typ = head[0:20].strip()
        is_sat = head[20:23].startswith("G") and head[60:].startswith("TYPE / SERIAL NO")
        valid = True
        if is_sat:
            frm = [b for b in block if b[60:].startswith("VALID FROM")]
            until = [b for b in block if b[60:].startswith("VALID UNTIL")]
            def ymd(b):
                return tuple(int(float(x)) for x in b.split()[:3])
            if frm and ymd(frm[0]) > (2025, 2, 24):
                valid = False
            if until and ymd(until[0]) < (2025, 2, 24):
                valid = False
        if (is_sat and valid) or (typ == "LEIAR25.R3      LEIT".strip() and head[0:20] == "LEIAR25.R3      LEIT"):
            keep.extend(block)
        block = []
with open(os.path.join(out, "igs20_2025055_G_LEIAR25.atx"), "w") as f:
    f.write("\n".join(keep) + "\n")

# Reference values.
ssc = [ln for ln in open(os.path.join(src, "ITRF2020_GNSS.SSC.txt")).read().splitlines()]
ref = []
for k, ln in enumerate(ssc):
    if ln.startswith("14201M010") and " WTZR " in ln or ln.startswith("14201M014") and " WTZZ " in ln:
        ref.extend([ln, ssc[k + 1]])
with open(os.path.join(out, "itrf2020_wtzr_wtzz.ssc"), "w") as f:
    f.write("\n".join(ref) + "\n")
for n in sorted(os.listdir(src)):
    print("source", sha(os.path.join(src, n)), n)
for n in sorted(os.listdir(out)):
    if n not in ("make_fixture.py", "NOTICE.md", "PREREGISTRATION.md"):
        print("fixture", sha(os.path.join(out, n)), n)
