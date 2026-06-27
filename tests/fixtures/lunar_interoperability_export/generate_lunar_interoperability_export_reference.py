#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external-oracle reference vectors for kshana's lunar OEM export.

The oracle is **oem 0.4.5** (Brad Sease <bradsease@gmail.com>, MIT) — an
independent, third-party, astropy-backed implementation of the CCSDS 502.0-B
Orbit Ephemeris Message standard (https://pypi.org/project/oem/). It is a
*completely separate codebase* from kshana's `src/oem.rs`: it implements its own
KVN tokenizer, its own mandatory-keyword enforcement and its own astropy-based
epoch parsing. Feeding it kshana's emitted lunar OEM and reading back the tokens
and states is therefore a genuine external round-trip check of the wire format.

What this validates (the quantity compared):
  - the exact CCSDS header tokens kshana emits — REF_FRAME / TIME_SYSTEM /
    CENTER_NAME / OBJECT_NAME / OBJECT_ID — as the independent parser reads them;
  - every per-epoch state: position (km) and velocity (km/s), as the independent
    parser decodes them from the data lines, to format precision;
  - a NEGATIVE CONTROL: a corrupted export with TIME_SYSTEM dropped MUST be
    rejected by the independent parser (proving the parser is actually enforcing
    the mandatory CCSDS keyword, not rubber-stamping anything).

Two frame x time-system combinations are exercised, each with 9 epochs:
  - MOON_ME / LTC  (mean-Earth frame, Lunar Coordinate Time)
  - MOON_PA / TCL  (principal-axis frame, barycentric-style lunar time)
= 18 states + 1 negative control.

HONEST SCOPE: this is an OEM *interchange* round-trip — it proves that what
kshana writes, an independent CCSDS OEM parser reads back identically (tokens
exact; states to print precision), and that a malformed export is rejected. It
does NOT validate the lunar frame/time *semantics* themselves (whether MOON_ME is
realised to WGCCRE, whether LTC's rate is correct) — those are checked by the
dedicated lunar-frame / lunar-time references. The lunar tokens are non-standard
CCSDS extensions; the oem library carries them through verbatim, which is exactly
the interoperability property under test.

The inputs are kshana's own emitted OEM, frozen into the committed `.oem`
fixtures next to this script (kshana_lunar_moon_me_ltc.oem,
kshana_lunar_moon_pa_tcl.oem). This generator imports ONLY the oracle (oem +
numpy), never kshana. The Rust test re-generates those OEM strings from kshana at
runtime and asserts they are byte-identical to the committed fixtures, so the
pinned oracle output stays bound to kshana's current behaviour.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/oemvenv
    /tmp/oemvenv/bin/pip install oem numpy
    /tmp/oemvenv/bin/python generate_lunar_interoperability_export_reference.py \
        > lunar_interoperability_export_reference.txt

Generated with oem 0.4.5 (Brad Sease, MIT) + astropy + numpy.
"""

import os
import sys
import tempfile
import warnings

import numpy as np
from oem import OrbitEphemerisMessage

# astropy/erfa warns about epochs in the far future ("dubious year"); harmless here.
warnings.filterwarnings("ignore")

HERE = os.path.dirname(os.path.abspath(__file__))

# (combo label, fixture filename) — kshana's frozen emitted OEM for each combo.
COMBOS = [
    ("MOON_ME_LTC", "kshana_lunar_moon_me_ltc.oem"),
    ("MOON_PA_TCL", "kshana_lunar_moon_pa_tcl.oem"),
]


def parse_with_oracle(path):
    """Parse an OEM file with the independent oem library; return (segment0)."""
    ephem = OrbitEphemerisMessage.open(path)
    segs = list(ephem.segments)
    if len(segs) != 1:
        raise AssertionError(f"{path}: expected 1 segment, got {len(segs)}")
    return segs[0]


def main():
    print("# External-oracle reference for kshana's lunar CCSDS OEM export.")
    print("# Oracle: oem 0.4.5 (Brad Sease <bradsease@gmail.com>, MIT) + astropy + numpy.")
    print("# Independent CCSDS 502.0-B OEM parser; separate codebase from src/oem.rs.")
    print("# Consumed by tests/lunar_interoperability_export_reference.rs.")
    print("# See generate_lunar_interoperability_export_reference.py for provenance/scope.")
    print("#")
    print("# TOKENS <combo> | REF_FRAME | TIME_SYSTEM | CENTER_NAME | OBJECT_NAME | OBJECT_ID")
    print("# STATE  <combo> | <index> | px,py,pz [km] | vx,vy,vz [km/s]  (as the oracle decoded them)")
    print("# NEGCTRL <combo> | <REJECTED|ACCEPTED> | <reason>")

    total_states = 0
    for combo, fname in COMBOS:
        path = os.path.join(HERE, fname)
        seg = parse_with_oracle(path)
        md = seg.metadata
        print(
            f"TOKENS {combo} | {md['REF_FRAME']} | {md['TIME_SYSTEM']} | "
            f"{md['CENTER_NAME']} | {md['OBJECT_NAME']} | {md['OBJECT_ID']}"
        )
        states = list(seg.states)
        for i, st in enumerate(states):
            p = np.asarray(st.position, dtype=float)
            v = np.asarray(st.velocity, dtype=float)
            pos = ",".join(repr(float(x)) for x in p)
            vel = ",".join(repr(float(x)) for x in v)
            print(f"STATE {combo} | {i} | {pos} | {vel}")
        total_states += len(states)

        # Negative control: drop the TIME_SYSTEM line and confirm the oracle rejects it.
        with open(path, "r") as fh:
            text = fh.read()
        broken = "\n".join(
            l for l in text.splitlines() if not l.strip().startswith("TIME_SYSTEM")
        )
        with tempfile.NamedTemporaryFile("w", suffix=".oem", delete=False) as tf:
            tf.write(broken)
            broken_path = tf.name
        try:
            parse_with_oracle(broken_path)
            print(f"NEGCTRL {combo} | ACCEPTED | parser did NOT reject missing TIME_SYSTEM")
        except Exception as ex:  # noqa: BLE001 — any rejection is the desired outcome
            reason = f"{type(ex).__name__}: {ex}".replace("\n", " ").replace("|", "/")
            print(f"NEGCTRL {combo} | REJECTED | {reason}")
        finally:
            os.unlink(broken_path)

    print(f"# total_states = {total_states}")
    if total_states < 18:
        print(f"# WARNING: expected >=18 states, got {total_states}", file=sys.stderr)


if __name__ == "__main__":
    main()
