#!/usr/bin/env bash
# Build the LunaNet AFS oracles as separate programs, outside the checkout:
#   LANS-AFS-SIM  (BSD-2-Clause) at 480c6bf353717bafc04b5ee5bafb38ed90e61aae
#   PocketSDR-AFS (BSD-2-Clause) at 5b23809f30d68518b7fad7a564fd0fac57cc497d
# Both with `#define DEMO_L1` removed (S-band 2492.028 MHz, LSIS-020). Nothing from either
# enters src/. Needs gcc, make, git, python3, libfftw3-dev, libusb-1.0-0-dev.
#
#   xval/lunar-afs/build_oracles.sh [ORACLE_ROOT]   (default ~/Code/kshana-oracles/lunar-afs)
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
O="${1:-$HOME/Code/kshana-oracles/lunar-afs}"
mkdir -p "$O"
cd "$O"
LANS_REV=480c6bf353717bafc04b5ee5bafb38ed90e61aae
PSDR_REV=5b23809f30d68518b7fad7a564fd0fac57cc497d
[ -d LANS-AFS-SIM/.git ] || git clone https://github.com/osqzss/LANS-AFS-SIM
[ -d PocketSDR-AFS/.git ] || git clone https://github.com/osqzss/PocketSDR-AFS
git -C LANS-AFS-SIM checkout -q "$LANS_REV"
git -C PocketSDR-AFS checkout -q "$PSDR_REV"
test "$(git -C LANS-AFS-SIM rev-parse HEAD)" = "$LANS_REV"
test "$(git -C PocketSDR-AFS rev-parse HEAD)" = "$PSDR_REV"

# LANS-AFS-SIM: an S-band build, a print-only trace build, and the code-dump harness.
python3 "$HERE/apply_lans_trace.py" LANS-AFS-SIM lans-sband lans-trace
diff -u LANS-AFS-SIM/afs_sim.c lans-trace/afs_sim.c > lans-trace.patch || true
for d in lans-sband lans-trace; do (cd "$d" && make -s clean >/dev/null && make -s); done
(cd lans-sband && gcc -Ofast -I./ldpc -I./rtklib -I./pocketsdr -Dmain=afs_sim_main \
    -c afs_sim.c -o afs_sim_lib.o && \
  gcc -O2 "$HERE/lans_codes_harness.c" afs_sim_lib.o afs_nav.o afs_rand.o ldpc/alloc.o \
    ldpc/mod2sparse.o rtklib/rtkcmn.o pocketsdr/pocketsdr.o -fopenmp -lm -o lans_codes)

# PocketSDR-AFS: S-band receiver (pocket_trk), libraries from its own clone_lib.sh.
P=PocketSDR-AFS
git -C "$P" checkout -q -- src/pocket_sdr.h
sed -i 's|^#define DEMO_L1|// #define DEMO_L1 (removed: S-band)|' "$P/src/pocket_sdr.h"
grep -q '^// #define DEMO_L1 (removed: S-band)' "$P/src/pocket_sdr.h"
if [ ! -d "$P/lib/libfec" ]; then (cd "$P/lib" && bash clone_lib.sh); fi
(cd "$P/lib/build" && make -s && make -s install)
(cd "$P/app/pocket_trk" && make -s)
ls -l "$P/app/pocket_trk/pocket_trk" lans-sband/afs_sim lans-trace/afs_sim lans-sband/lans_codes
