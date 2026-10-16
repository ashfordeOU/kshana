# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the sp3_clock_igs_oracle fixture from the IGS final products of 2025-02-24.

Usage: python3 -I make_fixture.py <download dir> <out dir>
The download dir holds, unchanged from https://igs.bkg.bund.de/root_ftp/IGS/products/2355/:
  IGS0OPSFIN_20250550000_01D_15M_ORB.SP3.gz
  IGS0OPSFIN_20250550000_01D_30S_CLK.CLK.gz
Writes igs_2025055_G.sp3 (header lines kept, GPS records only, all epochs) and
igs_2025055_G_nodes_mid.clk (header kept, GPS AS records at offsets 0 s and 450 s of each
15 min interval). The cut is pre-registered in PREREGISTRATION.md.
"""
import gzip
import hashlib
import os
import sys

src, out = sys.argv[1], sys.argv[2]
SP3 = "IGS0OPSFIN_20250550000_01D_15M_ORB.SP3.gz"
CLK = "IGS0OPSFIN_20250550000_01D_30S_CLK.CLK.gz"
for name in (SP3, CLK):
    with open(os.path.join(src, name), "rb") as f:
        print(hashlib.sha256(f.read()).hexdigest(), name)

with gzip.open(os.path.join(src, SP3), "rt") as f:
    lines = f.read().splitlines()
keep = []
for ln in lines:
    if ln[:1] in ("P", "V") and not ln.startswith(("PG", "VG")):
        continue
    keep.append(ln)
with open(os.path.join(out, "igs_2025055_G.sp3"), "w") as f:
    f.write("\n".join(keep) + "\n")

with gzip.open(os.path.join(src, CLK), "rt") as f:
    lines = f.read().splitlines()
keep, header = [], True
for ln in lines:
    if header:
        keep.append(ln)
        if ln[60:].startswith("END OF HEADER"):
            header = False
        continue
    if not ln.startswith("AS G"):
        continue
    t = ln.split()
    minute, second = int(t[6]), float(t[7])
    off = (minute % 15) * 60 + second
    if off in (0.0, 450.0):
        keep.append(ln)
with open(os.path.join(out, "igs_2025055_G_nodes_mid.clk"), "w") as f:
    f.write("\n".join(keep) + "\n")
for name in ("igs_2025055_G.sp3", "igs_2025055_G_nodes_mid.clk"):
    with open(os.path.join(out, name), "rb") as f:
        print(hashlib.sha256(f.read()).hexdigest(), name)
