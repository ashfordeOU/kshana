#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external-oracle reference vectors for kshana's general (Earth/EME2000)
CCSDS OEM export — and an import-direction cross-check on a vendored external OEM.

The oracle is **oem** (Brad Sease <bradsease@gmail.com>, MIT) — an independent,
third-party, astropy-backed implementation of the CCSDS 502.0-B Orbit Ephemeris
Message standard (https://pypi.org/project/oem/). It is a *completely separate
codebase* from kshana's `src/oem.rs`: its own KVN tokenizer, its own
mandatory-keyword + frame/time enforcement, its own astropy epoch parsing.
Feeding it kshana's emitted EME2000 OEM and reading back the tokens and Cartesian
states is therefore a genuine external interpretation of the wire format — the
same library-vs-library pattern as tests/lunar_interoperability_export_reference.rs.

What this validates (the quantity compared):
  - the exact CCSDS header tokens kshana emits — REF_FRAME / TIME_SYSTEM /
    CENTER_NAME / OBJECT_NAME / OBJECT_ID — as the independent parser reads them;
  - every per-epoch Cartesian state: position (km) and velocity (km/s), as the
    independent parser decodes the data lines, to OEM print precision.

Two committed kshana fixtures are exercised:
  - kshana_leo_eme2000.oem            — single segment, 12 epochs (one LEO object);
  - kshana_meo_eme2000_multiseg.oem   — two contiguous arcs (segments) of ONE MEO
    object, 6 + 6 epochs.
= 24 states across 2 fixtures.

INTEROP FINDING (carried as a comment in the reference output): the oem library
enforces CCSDS 502.0 segment semantics — every segment in a single OEM file must
share the same OBJECT_NAME (segments are time-contiguous arcs of ONE object, not
different objects). kshana's `OemFile::from_propagators` writes one segment per
*satellite* (a distinct OBJECT_NAME per segment), which the oem library REJECTS
with "OBJECT_NAME not fixed in OEM". The multi-segment fixture here therefore uses
two arcs of one object — the CCSDS-conformant multi-segment shape. The
per-satellite-segment convention kshana uses for a constellation is a real
interoperability gap with strict CCSDS 502.0 readers.

Also performed (import direction, printed as XLEO lines): the vendored
tests/fixtures/interop/external_leo.oem is parsed with the oem library so the Rust
test can cross-check kshana's own parse_oem against the independent parser on the
SAME external file.

SECOND INTEROP FINDING (covariance format): the oem library REJECTS the vendored
external_leo.oem AS-IS with "Invalid covariance header" — its COVARIANCE block
uses the CCSDS lower-triangular form with several matrix entries per physical line
(e.g. `CY_X = 4.6e-04 6.7e-04`), which the oem library's parser does not accept
(it wants one `KEY = value` matrix entry per line). kshana's parse_oem is more
tolerant: it skips the entire COVARIANCE_START..COVARIANCE_STOP block wholesale,
so it ingests the file unchanged. To still cross-check the two parsers on the SAME
states, the oracle decode below is taken from the covariance-STRIPPED file (header
+ metadata + the 4 data lines are byte-identical to the vendored file); both
parsers then decode the same 4 states. The covariance-line format is a real
import-direction difference between kshana and a strict CCSDS-502 reader.

This generator imports ONLY the oracle (oem + numpy), never kshana. The Rust test
re-generates the kshana OEM strings (committed as .oem fixtures) and asserts the
committed bytes round-trip through kshana's own parse_oem to these oracle values.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/oemvenv
    /tmp/oemvenv/bin/pip install oem numpy
    /tmp/oemvenv/bin/python generate_ccsds_oem_interop_reference.py \
        > ccsds_oem_interop_reference.txt

Generated with the oem library (Brad Sease, MIT) + astropy + numpy.
"""

import os
import sys
import tempfile
import warnings

import numpy as np
from oem import OrbitEphemerisMessage

# astropy/erfa may warn on far-future epochs; harmless here.
warnings.filterwarnings("ignore")

HERE = os.path.dirname(os.path.abspath(__file__))
INTEROP = os.path.normpath(os.path.join(HERE, "..", "interop"))

# (combo label, fixture filename) — kshana's frozen emitted EME2000 OEM.
COMBOS = [
    ("LEO_SINGLE", "kshana_leo_eme2000.oem"),
    ("MEO_MULTISEG", "kshana_meo_eme2000_multiseg.oem"),
]


def main():
    print("# External-oracle reference for kshana's general (EME2000) CCSDS OEM export.")
    print("# Oracle: the oem library (Brad Sease <bradsease@gmail.com>, MIT) + astropy + numpy.")
    print("# Independent CCSDS 502.0-B OEM parser; separate codebase from src/oem.rs.")
    print("# Consumed by tests/ccsds_oem_interop_reference.rs.")
    print("# See generate_ccsds_oem_interop_reference.py for provenance/scope/findings.")
    print("#")
    print("# FINDING: the oem library enforces a single OBJECT_NAME across all segments")
    print("#   (CCSDS 502.0 segments = contiguous arcs of ONE object). kshana's")
    print("#   from_propagators writes one segment per satellite (distinct OBJECT_NAMEs),")
    print("#   which the oem library REJECTS ('OBJECT_NAME not fixed in OEM'). The")
    print("#   multi-segment fixture below is two arcs of one object accordingly.")
    print("#")
    print("# TOKENS <combo> <seg> | REF_FRAME | TIME_SYSTEM | CENTER_NAME | OBJECT_NAME | OBJECT_ID")
    print("# STATE  <combo> <seg> | <index> | px,py,pz [km] | vx,vy,vz [km/s]  (oracle-decoded)")
    print("# XLEO   <index> | px,py,pz [km] | vx,vy,vz [km/s]  (oracle decode of external_leo.oem,")
    print("#         covariance block stripped — the oem library rejects its multi-entry COV lines)")

    total_states = 0
    for combo, fname in COMBOS:
        path = os.path.join(HERE, fname)
        ephem = OrbitEphemerisMessage.open(path)
        segs = list(ephem.segments)
        for sidx, seg in enumerate(segs):
            md = seg.metadata
            print(
                f"TOKENS {combo} {sidx} | {md['REF_FRAME']} | {md['TIME_SYSTEM']} | "
                f"{md['CENTER_NAME']} | {md['OBJECT_NAME']} | {md['OBJECT_ID']}"
            )
            states = list(seg.states)
            for i, st in enumerate(states):
                p = np.asarray(st.position, dtype=float)
                v = np.asarray(st.velocity, dtype=float)
                pos = ",".join(repr(float(x)) for x in p)
                vel = ",".join(repr(float(x)) for x in v)
                print(f"STATE {combo} {sidx} | {i} | {pos} | {vel}")
            total_states += len(states)

    # Import-direction cross-check: oracle decode of the vendored external OEM.
    # The oem library rejects the file AS-IS (its COVARIANCE block uses multi-entry
    # lower-triangular lines the library won't parse); record that, then strip the
    # COVARIANCE block (header+metadata+data lines stay byte-identical) and decode.
    xpath = os.path.join(INTEROP, "external_leo.oem")
    with open(xpath) as fh:
        xtxt = fh.read()
    try:
        OrbitEphemerisMessage.open(xpath)
        print("XCOV ACCEPTED | oem library parsed external_leo.oem with covariance")
    except Exception as ex:  # noqa: BLE001
        reason = f"{type(ex).__name__}: {ex}".replace("\n", " ").replace("|", "/")
        print(f"XCOV REJECTED | {reason}")

    out = []
    in_cov = False
    for line in xtxt.splitlines():
        s = line.strip()
        if s == "COVARIANCE_START":
            in_cov = True
            continue
        if s == "COVARIANCE_STOP":
            in_cov = False
            continue
        if in_cov:
            continue
        out.append(line)
    stripped = "\n".join(out) + "\n"
    with tempfile.NamedTemporaryFile("w", suffix=".oem", delete=False) as tf:
        tf.write(stripped)
        spath = tf.name
    try:
        xeph = OrbitEphemerisMessage.open(spath)
        xsegs = list(xeph.segments)
        if len(xsegs) != 1:
            raise AssertionError(f"external_leo.oem: expected 1 segment, got {len(xsegs)}")
        xmd = xsegs[0].metadata
        print(
            f"XTOKENS | {xmd['REF_FRAME']} | {xmd['TIME_SYSTEM']} | "
            f"{xmd['CENTER_NAME']} | {xmd['OBJECT_NAME']} | {xmd['OBJECT_ID']}"
        )
        for i, st in enumerate(xsegs[0].states):
            p = np.asarray(st.position, dtype=float)
            v = np.asarray(st.velocity, dtype=float)
            pos = ",".join(repr(float(x)) for x in p)
            vel = ",".join(repr(float(x)) for x in v)
            print(f"XLEO {i} | {pos} | {vel}")
    finally:
        os.unlink(spath)

    print(f"# total_states = {total_states}")
    if total_states < 20:
        print(f"# WARNING: expected >=20 states, got {total_states}", file=sys.stderr)


if __name__ == "__main__":
    main()
