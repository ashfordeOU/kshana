#!/usr/bin/env python3
"""Make the print-only PocketSDR-AFS build used for the decodability comparison.

The pinned build logs at level 3, which records neither its channel status (`$CH`, level 4)
nor the TOI it decodes from subframe 1. This copy changes only what is printed:

1. `pocket_trk` raises the log level to 4 (`sdr_log_level(4)` at the start of `main`);
2. `decode_AFSD_frame` logs the TOI it found, `$LOG,<time>,<sig>,<prn>,AFSD TOI=<toi>`.

`run_pocketsdr.sh` checks that every level-3 record of the unpatched build is reproduced by
this build (guard G0). Usage: apply_psdr_trace.py SBAND_TREE TRACE_TREE
"""
import shutil
import sys
from pathlib import Path


def edit(text, old, new):
    assert text.count(old) == 1, old
    return text.replace(old, new)


src, dst = map(Path, sys.argv[1:3])
if dst.exists():
    shutil.rmtree(dst)
shutil.copytree(src, dst, symlinks=True, ignore=shutil.ignore_patterns(".git"))
p = dst / "app/pocket_trk/pocket_trk.c"
p.write_text(edit(p.read_text(), "    int inv_q = 0; // Inverse Q sign flag\n\n",
                  "    int inv_q = 0; // Inverse Q sign flag\n    sdr_log_level(4); // TRACE: print-only\n\n"))
p = dst / "src/sdr_nav.c"
p.write_text(edit(p.read_text(),
                  "        sdr_log(3, \"$LOG,%.3f,%s,%d,TOI NOT FOUND\", time, ch->sig, ch->prn);\n        return;\n    }\n",
                  "        sdr_log(3, \"$LOG,%.3f,%s,%d,TOI NOT FOUND\", time, ch->sig, ch->prn);\n        return;\n    }\n"
                  "    sdr_log(3, \"$LOG,%.3f,%s,%d,AFSD TOI=%d\", time, ch->sig, ch->prn, toi); // TRACE: print-only\n"))
