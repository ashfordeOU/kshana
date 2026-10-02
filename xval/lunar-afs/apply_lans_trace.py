#!/usr/bin/env python3
"""Make the two LANS-AFS-SIM build trees from a pristine checkout.

1. ``sband``: the only change is removing ``#define DEMO_L1`` (S-band 2492.028 MHz carrier).
2. ``trace``: the S-band tree plus PRINT-ONLY statements writing, to the file named by the
   environment variable ``AFS_TRACE``: every frame's data bits and 6000 symbols (initially and
   whenever subframe 1 is rewritten), and each channel's state after every 0.1 s update.
   Nothing the simulator computes is changed; ``run_lans.sh`` checks that the two builds write
   byte-identical IQ files (guard W0 of the pre-registration).

Usage: apply_lans_trace.py PRISTINE_DIR SBAND_DIR TRACE_DIR
"""
import shutil
import sys
from pathlib import Path


def edit(text, old, new, count=1):
    assert text.count(old) == count, (old, text.count(old))
    return text.replace(old, new)


def main():
    src, sband, trace = map(Path, sys.argv[1:4])
    for d in (sband, trace):
        if d.exists():
            shutil.rmtree(d)
        shutil.copytree(src, d, ignore=shutil.ignore_patterns(".git"))
    for d in (sband, trace):
        p = d / "afs_sim.c"
        p.write_text(edit(p.read_text(), "#define DEMO_L1\n", "// #define DEMO_L1 (removed: S-band)\n"))
    p = trace / "afs_sim.c"
    t = p.read_text()
    # A trace file opened at start.
    t = edit(t, "    int inv_q = 0; // Inverse Q sign flag\n",
             "    int inv_q = 0; // Inverse Q sign flag\n"
             "    FILE *ftr = getenv(\"AFS_TRACE\") ? fopen(getenv(\"AFS_TRACE\"), \"w\") : NULL; // TRACE\n")
    # Subframe 3/4 data (the 846-bit test pattern) once encoded.
    t = edit(t, "    encode_LDPC_AFS_SF3(syms, AFS_SB234 + 2400); // Subframe 3\n",
             "    if (ftr) { fprintf(ftr, \"SB34 \"); for (int k = 0; k < 846; k++) fputc('0' + syms[k], ftr); fputc('\\n', ftr); } // TRACE\n"
             "    encode_LDPC_AFS_SF3(syms, AFS_SB234 + 2400); // Subframe 3\n")
    # Subframe 2 data per channel, before the CRC is appended.
    t = edit(t, "        append_CRC24(syms, 1200);\n",
             "        if (ftr) { fprintf(ftr, \"SB2 %d \", chan[i].prn); for (int k = 0; k < 1176; k++) fputc('0' + syms[k], ftr); fputc('\\n', ftr); } // TRACE\n"
             "        append_CRC24(syms, 1200);\n")
    # Initial frame symbols.
    t = edit(t, "    // Generate baseband signals\n",
             "    if (ftr) for (i = 0; i < nsat; i++) { fprintf(ftr, \"FRAME %d %d %d \", -1, chan[i].prn, afst.toi + 1); for (int k = 0; k < 6000; k++) fputc('0' + chan[i].I.data[0][k], ftr); fputc('\\n', ftr); } // TRACE\n"
             "    // Generate baseband signals\n")
    # Channel state after each update (before the block's samples).
    t = edit(t, "            // Save current pseudorange\n",
             "            if (ftr) fprintf(ftr, \"STATE %d %d %.17g %d %d %.17g %.17g %d %d %.17g %.17g %.17g %d %d\\n\", isim, chan[i].prn, "
             "chan[i].I.code_phase, chan[i].I.ibit, chan[i].I.iframe, chan[i].I.f_code, chan[i].Q.code_phase, chan[i].Q.ibit, chan[i].Q.ichip, "
             "chan[i].Q.f_code, chan[i].f_carr, chan[i].carr_phase, (int)(5200000.0 / rho.range * (double)GAIN_SCALE), iq_buff_size); // TRACE\n"
             "            // Save current pseudorange\n")
    # Frame symbols whenever subframe 1 is rewritten (takes effect from block isim + 1).
    t = edit(t, "            //printf(\"\\nUpdate Data Frames: TOI = %d\\n\", afst.toi);\n",
             "            //printf(\"\\nUpdate Data Frames: TOI = %d\\n\", afst.toi);\n"
             "            if (ftr) for (i = 0; i < nsat; i++) { fprintf(ftr, \"FRAME %d %d %d \", isim, chan[i].prn, afst.toi + 1); for (int k = 0; k < 6000; k++) fputc('0' + chan[i].I.data[0][k], ftr); fputc('\\n', ftr); } // TRACE\n")
    t = edit(t, "    // Close output file\n", "    if (ftr) fclose(ftr); // TRACE\n    // Close output file\n")
    p.write_text(t)


if __name__ == "__main__":
    main()
