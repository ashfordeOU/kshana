#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write src/iq/signals/lunanet_tables.rs (code PARAMETERS only) from the oracle CSV files that
scripts/extract_lunanet_afs_tables.py wrote. The printed chips are not compiled in.

Usage: python3 scripts/gen_lunanet_afs_params.py
"""
import os

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
ORACLE = os.path.join(ROOT, "xval", "lunanet-afs", "oracle")


def rd(name):
    rows = []
    for line in open(os.path.join(ORACLE, name)):
        if line.startswith("#") or line.startswith("prn,"):
            continue
        rows.append(line.strip().split(","))
    return rows


def arr(vals, per=12):
    return "".join("    " + ", ".join(vals[k : k + per]) + ",\n" for k in range(0, len(vals), per))


def main():
    i, q, t = rd("afs_i_gold.csv"), rd("afs_q_primary_weil.csv"), rd("afs_q_tertiary_weil.csv")
    assert len(i) == len(q) == len(t) == 210
    out = """// SPDX-License-Identifier: AGPL-3.0-only
//! Code parameters of the LunaNet Augmented Forward Signal, LSIS-AFS V1.0 (29 January 2025,
//! Applicable Document 1 Volume A of LNIS V5), PRN 1..=210.
//!
//! Generated from `xval/lunanet-afs/oracle/*.csv` by `scripts/gen_lunanet_afs_params.py` (see
//! `xval/lunanet-afs/oracle/PROVENANCE.md`). **Parameters only**: the G2 delay, the Weil index k
//! and insertion index p, and the tertiary Weil index k. The printed chips the generator is
//! checked against stay in the oracle files and are not compiled in. The document marks these
//! tables {LSIS-TBC}; they are this edition's, not a later one's.

/// AFS-I G2 delay in chips, PRN 1..=210 (Tables C-1 to C-5).
pub const AFS_I_G2_DELAY: [u16; 210] = [
"""
    out += arr([r[1] for r in i])
    out += """];

/// AFS-I G2 initial state as printed (hex, I11 the most significant bit), PRN 1..=210. Kept to
/// cross-check the delay (bar B1b of `xval/lunanet-afs/PREREGISTRATION.md`).
pub const AFS_I_G2_INIT: [u16; 210] = [
"""
    out += arr(["0x" + r[2] for r in i])
    out += """];

/// AFS-Q primary Weil index `k` and insertion index `p`, PRN 1..=210 (Tables D-2 to D-6).
pub const AFS_Q_PRIMARY: [(u16, u16); 210] = [
"""
    out += arr([f"({r[1]}, {r[2]})" for r in q], 6)
    out += """];

/// AFS-Q tertiary Weil index `k`, PRN 1..=210 (Tables E-2 to E-6).
pub const AFS_Q_TERTIARY_K: [u16; 210] = [
"""
    out += arr([r[1] for r in t])
    out += "];\n"
    open(os.path.join(ROOT, "src", "iq", "signals", "lunanet_tables.rs"), "w").write(out)

    # The printed check columns, compiled in only so `kshana lunanet-afs-check codes` can compare
    # the generator's chips with the document's on a registry install (`/xval` is not packaged).
    # The generator never reads these; only the checker does.
    def pairs(rows, first, last):
        return "".join(
            "    (0x%s, 0x%s),\n" % (r[first], r[last]) for r in rows
        )

    def hexline(name):
        for line in open(os.path.join(ORACLE, name)):
            if not line.startswith("#"):
                return line.strip()

    o = """// SPDX-License-Identifier: AGPL-3.0-only
//! The check columns LSIS-AFS V1.0 prints next to its code parameters: the first and last 24
//! chips of every code (first chip most significant) and the two Legendre sequences as hex.
//! Generated from `xval/lunanet-afs/oracle/*.csv` by `scripts/gen_lunanet_afs_params.py`. The
//! generator in `lunanet.rs` never reads this file; only `iq::lunanet_afs` compares with it.
//! The document marks the code tables {LSIS-TBC}; these are that edition's.

/// AFS-I `(first 24 chips, last 24 chips)`, PRN 1..=210 (Tables C-1 to C-5).
pub const AFS_I_PRINTED: [(u32, u32); 210] = [
"""
    o += pairs(i, 3, 4)
    o += """];

/// AFS-Q primary `(first 24, last 24)`, PRN 1..=210 (Tables D-2 to D-6).
pub const AFS_Q_PRINTED: [(u32, u32); 210] = [
"""
    o += pairs(q, 3, 4)
    o += """];

/// AFS-Q tertiary `(first 24, last 24)`, PRN 1..=210 (Tables E-2 to E-6).
pub const AFS_Q_TERTIARY_PRINTED: [(u32, u32); 210] = [
"""
    o += pairs(t, 2, 3)
    o += """];

/// Table D-1: the length-10223 Legendre sequence as printed (10224 bits, the first is L(0)'s
/// placeholder), hexadecimal.
pub const LEGENDRE_10223_HEX: &str = "%s";

/// Table E-1: the length-1499 Legendre sequence as printed (the first hex symbol is 3 bits),
/// hexadecimal.
pub const LEGENDRE_1499_HEX: &str = "%s";
""" % (hexline("legendre_10223.hex"), hexline("legendre_1499.hex"))
    open(os.path.join(ROOT, "src", "iq", "signals", "lunanet_oracle.rs"), "w").write(o)


main()
