#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Fixture generator for tests/iq_formats_sigmf_oracle.rs (multi-channel SigMF and the
unsigned 8-bit SigMF data type read by kshana::iq::io).

Independent oracle, run here as a tool and never linked into the crate:
  * sigmf-python 1.13.0 (LGPL-3.0) with numpy

It writes, with sigmf-python's own SigMFFile writer:
  * third_party/mc3_ci16 - 3-channel ci16_le, 40 time instants, two captures (the second at
    instant 16) and one annotation (instants 20..30);
  * third_party/cu8 - single-channel cu8, 64 samples covering every byte value 0..255
    across I and Q;
and reference.json: for each recording, per channel, the SHA-256 of sigmf-python's
read_samples() (opened with fromfile(..., autoscale=False)) as the little-endian f64 stream I0, Q0, I1, Q1, ..., the
sample count per channel, the captures and annotations as sigmf-python reports them, and
the first four decoded samples in clear (for reading the fixture by eye).

Run: python3 gen_iq_formats_sigmf_oracle.py (any Python with sigmf==1.13.0 and numpy).
"""

import hashlib
import json
from pathlib import Path

import numpy as np
import sigmf
from sigmf import SigMFFile
from sigmf import keys as K
from sigmf.sigmffile import fromfile

HERE = Path(__file__).resolve().parent
OUT = HERE / "third_party"
assert sigmf.__version__ == "1.13.0", sigmf.__version__


def f64_sha(samples):
    """SHA-256 of complex samples as little-endian f64 I, Q pairs."""
    a = np.empty(2 * len(samples), dtype="<f8")
    a[0::2] = np.real(samples)
    a[1::2] = np.imag(samples)
    return hashlib.sha256(a.tobytes()).hexdigest()


def write(base, data_bytes, global_info, captures, annotations):
    data_path = OUT / f"{base}.sigmf-data"
    data_path.write_bytes(data_bytes)
    f = SigMFFile(data_file=str(data_path), global_info=global_info)
    for start, meta in captures:
        f.add_capture(start, metadata=meta)
    for start, length, meta in annotations:
        f.add_annotation(start, length, metadata=meta)
    f.tofile(str(OUT / f"{base}.sigmf-meta"), overwrite=True)


def describe(base):
    f = fromfile(str(OUT / f"{base}.sigmf-meta"), autoscale=False)
    x = f.read_samples()
    ch = f.get_global_field(K.NUM_CHANNELS_KEY) or 1
    x = np.asarray(x)
    if ch == 1:
        per = [x.reshape(-1)]
    else:
        # sigmf-python returns shape (instants, channels) for multi-channel data.
        assert x.shape[1] == ch, x.shape
        per = [x[:, c] for c in range(ch)]
    return {
        "datatype": f.get_global_field(K.DATATYPE_KEY),
        "num_channels": ch,
        "shape": list(x.shape),
        "samples_per_channel": int(len(per[0])),
        "channels": [
            {
                "sha256_f64_iq": f64_sha(p),
                "first4": [[float(np.real(v)), float(np.imag(v))] for v in p[:4]],
            }
            for p in per
        ],
        "captures": [
            {"sample_start": c[K.SAMPLE_START_KEY], "frequency": c.get(K.FREQUENCY_KEY)}
            for c in f.get_captures()
        ],
        "annotations": [
            {"sample_start": a[K.SAMPLE_START_KEY], "sample_count": a[K.SAMPLE_COUNT_KEY]}
            for a in f.get_annotations()
        ],
    }


def main():
    OUT.mkdir(exist_ok=True)
    # 3-channel ci16_le: channel c, instant k carries I = 1000*c + k, Q = -(1000*c + 3*k).
    n, ch = 40, 3
    arr = np.empty((n, ch, 2), dtype="<i2")
    for k in range(n):
        for c in range(ch):
            arr[k, c, 0] = 1000 * c + k
            arr[k, c, 1] = -(1000 * c + 3 * k)
    write(
        "mc3_ci16",
        arr.tobytes(),
        {
            K.DATATYPE_KEY: "ci16_le",
            K.SAMPLE_RATE_KEY: 4.0e6,
            K.NUM_CHANNELS_KEY: ch,
            K.VERSION_KEY: sigmf.__specification__,
        },
        [(0, {K.FREQUENCY_KEY: 1575.42e6}), (16, {K.FREQUENCY_KEY: 1176.45e6})],
        [(20, 10, {K.COMMENT_KEY: "marked span"})],
    )
    # cu8: bytes 0..127 as I, 255..128 as Q (64 samples, every value once... twice over I/Q).
    b = np.empty(128, dtype="u1")
    b[0::2] = np.arange(0, 64, dtype="u1") * 4
    b[1::2] = 255 - np.arange(0, 64, dtype="u1") * 4
    write(
        "cu8",
        b.tobytes(),
        {
            K.DATATYPE_KEY: "cu8",
            K.SAMPLE_RATE_KEY: 2.048e6,
            K.VERSION_KEY: sigmf.__specification__,
        },
        [(0, {K.FREQUENCY_KEY: 1575.42e6})],
        [],
    )
    ref = {
        "generator": "gen_iq_formats_sigmf_oracle.py",
        "oracle": {"sigmf": sigmf.__version__, "numpy": np.__version__},
        "recordings": {base: describe(base) for base in ["mc3_ci16", "cu8"]},
    }
    (HERE / "reference.json").write_text(json.dumps(ref, indent=1) + "\n")


if __name__ == "__main__":
    main()
