#!/usr/bin/env python3
"""Cut the committed fixture from a LANS-AFS-SIM run made by xval/lunar-afs/run_lans.sh.

Copies the AFS-Q records of the harness's code dump (W1), the print-only trace (W2, W3 state), the one-node
almanac, and 24 windows of the simulator's own 16-bit IQ samples: the first 2 ms (24 000
complex samples) of every tenth 0.1 s block (blocks 0, 10, ..., 230), written as int16
little-endian I, Q pairs in `windows.bin`. Each window spans exactly one AFS-I symbol edge.

Usage: make_fixture.py RUN_DIR   (default ~/Code/kshana-oracles/lunar-afs/run-lans)
"""
import hashlib
import shutil
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
run = Path(sys.argv[1] if len(sys.argv) > 1 else Path.home() / "Code/kshana-oracles/lunar-afs/run-lans")
BLOCK = 1_200_000  # complex samples per 0.1 s at 12 MHz
WIN = 24_000
for name in ("trace.txt", "one_node_almanac.txt"):
    shutil.copy(run / name, HERE / name)
# Only the AFS-Q primary records (IS-GPS-800 L1C pilot codes); the AFS-I and tertiary records
# carry LSIS-only content, which is not redistributed.
with open(run / "lans_codes.txt") as src, open(HERE / "lans_codes.txt", "w") as dst:
    dst.writelines(l for l in src if l.startswith("Q "))
with open(run / "iq16.bin", "rb") as f, open(HERE / "windows.bin", "wb") as out:
    for b in range(0, 240, 10):
        f.seek(b * BLOCK * 4)
        chunk = f.read(WIN * 4)
        assert len(chunk) == WIN * 4, b
        out.write(chunk)
h = hashlib.sha256()
with open(run / "iq16.bin", "rb") as f:
    for c in iter(lambda: f.read(1 << 24), b""):
        h.update(c)
(HERE / "iq16.sha256").write_text(f"{h.hexdigest()}  iq16.bin\n")
for name in ("lans_codes.txt", "trace.txt", "one_node_almanac.txt", "windows.bin", "iq16.sha256"):
    print(hashlib.sha256((HERE / name).read_bytes()).hexdigest(), name)
