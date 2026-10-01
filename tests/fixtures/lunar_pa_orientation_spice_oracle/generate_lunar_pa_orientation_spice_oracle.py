#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Oracle fixture for the DE440 lunar principal-axis orientation provider.

The NAIF SPICE Toolkit (through spiceypy) evaluates the JPL DE440 binary PCK
moon_pa_de440_200625.bpc DIRECTLY at 2 000 random epochs inside the window of
the series Kshana embeds, using NAIF's own frame kernel moon_de440_250416.tf.
Kshana interpolates a committed daily series; this fixture is what the kernel
itself says between the nodes. Nothing here calls Kshana.

Pre-registered tolerance (fixed before the first comparison): the angle of
R_kshana^T R_spice at most 1.7e-5 rad (30 m at the mean lunar radius).

Run:
    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/lunar_pa_orientation_spice_oracle/generate_lunar_pa_orientation_spice_oracle.py

Writes spice_moon_pa_reference.csv beside this script. Columns:
    et_tdb_s, r00..r22   with v_J2000 = R . v_MOON_PA_DE440
"""

import hashlib
import os
import pathlib
import sys

import numpy as np
import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
ORACLES = pathlib.Path(os.environ.get("KSHANA_ORACLES", str(pathlib.Path.home() / "Code/kshana-oracles")))
NAIF = ORACLES / "data" / "naif"
KERNELS = ["naif0012.tls", "moon_de440_250416.tf", "moon_pa_de440_200625.bpc"]
N_EPOCHS = 2000
SEED = 20261001


def sha256(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    hashes = {}
    for name in KERNELS:
        p = NAIF / name
        if not p.is_file():
            sys.exit(f"missing kernel {p}")
        hashes[name] = sha256(p)
        sp.furnsh(str(p))
    et0 = sp.str2et("2024-01-01 00:00:00 TDB")
    et1 = sp.str2et("2025-12-31 00:00:00 TDB")
    rng = np.random.default_rng(SEED)
    ets = np.sort(rng.uniform(et0, et1, N_EPOCHS))
    out = HERE / "spice_moon_pa_reference.csv"
    with out.open("w") as f:
        f.write("# NAIF SPICE pxform('MOON_PA_DE440','J2000',et) evaluated directly from the binary PCK\n")
        f.write(f"# spiceypy {sp.__version__}, {sp.tkvrsn('TOOLKIT')}\n")
        for name, h in hashes.items():
            f.write(f"# kernel {name} sha256 {h}\n")
        f.write(f"# epochs: {N_EPOCHS} uniform in [2024-01-01, 2025-12-31] TDB, numpy default_rng({SEED})\n")
        f.write("# tolerance fixed before comparison: rotation angle <= 1.7e-5 rad\n")
        f.write("et_tdb_s,r00,r01,r02,r10,r11,r12,r20,r21,r22\n")
        for et in ets:
            m = sp.pxform("MOON_PA_DE440", "J2000", float(et))
            vals = [m[i][j] for i in range(3) for j in range(3)]
            f.write(f"{et:.6f}," + ",".join(f"{v:.14e}" for v in vals) + "\n")
    print(f"wrote {out} ({N_EPOCHS} epochs)")


if __name__ == "__main__":
    main()
