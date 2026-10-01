#!/usr/bin/env python3
"""Pin the BIPM per-laboratory [UTC-UTC(k)] files the heterogeneous UTC(k) overbound
oracle reads.

The full series (102 laboratories, 105 024 rows with published uncertainties, 2.5 MB) is
too large to vendor, so the test reads the files from the oracle data directory
($KSHANA_ORACLES/data/bipm/utclab/, default ~/Code/kshana-oracles/...) and skips, saying
so, when they are absent. This script writes `utclab.sha256`, the SHA-256 of every file
the test may read, and the test refuses any file whose bytes differ.

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/hetero_budget_utc_k_oracle/generate.py
"""

import glob
import hashlib
import os

HERE = os.path.dirname(os.path.abspath(__file__))
ORACLES = os.environ.get("KSHANA_ORACLES", os.path.expanduser("~/Code/kshana-oracles"))
SRC = os.path.join(ORACLES, "data", "bipm", "utclab")


def main():
    paths = sorted(glob.glob(os.path.join(SRC, "utc-*")))
    with open(os.path.join(HERE, "utclab.sha256"), "w") as out:
        for p in paths:
            out.write(f"{hashlib.sha256(open(p, 'rb').read()).hexdigest()}  {os.path.basename(p)}\n")
    print(f"pinned {len(paths)} files")


if __name__ == "__main__":
    main()
