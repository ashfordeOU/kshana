#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Fixture generator for tests/sigmf_welch_oracle.rs (matrix row: SigMF recording input
and output, and Welch spectral estimates of complex IQ).

Independent oracles, run here as tools and never linked into the crate:
  * scipy 1.18.1 scipy.signal.welch (BSD-3-Clause)
  * sigmf-python 1.13.0 (LGPL-3.0)
  * the SigMF v1.2.6 metadata schema sigmf-schema.json (CC BY-SA 4.0) with jsonschema 4.26.0

Run order:
  1. KSHANA_REGEN_SIGMF_ORACLE=1 cargo test --test sigmf_welch_oracle
     (writes the crate's own recordings to kshana_written/)
  2. source ~/Code/kshana-oracles/env.sh
     SIGMF_SPEC_DIR=$KSHANA_ORACLES/data/sigmf/SigMF-1.2.6 $ORACLE_PY gen_sigmf_welch_oracle.py

It writes third_party/ (recordings written by sigmf-python) and reference.json.
"""

import hashlib
import json
import math
import os
import sys
from pathlib import Path

import jsonschema
import numpy as np
import scipy
import scipy.signal
import sigmf
from sigmf import SigMFFile
from sigmf.sigmffile import fromfile

EXPECTED = {"scipy": "1.18.1", "sigmf": "1.13.0", "numpy": "2.3.5"}
HERE = Path(__file__).resolve().parent
SPEC_DIR = Path(os.environ.get("SIGMF_SPEC_DIR", ""))

GLOBAL_KEYS = [
    "core:datatype", "core:sample_rate", "core:version", "core:num_channels",
    "core:description", "core:author", "core:recorder", "core:hw",
]
CAPTURE_KEYS = ["core:sample_start", "core:frequency", "core:datetime"]
ANNOTATION_KEYS = [
    "core:sample_start", "core:sample_count", "core:freq_lower_edge",
    "core:freq_upper_edge", "core:label", "core:comment",
]


def check_versions():
    found = {"scipy": scipy.__version__, "sigmf": sigmf.__version__, "numpy": np.__version__}
    if found != EXPECTED:
        sys.exit(f"oracle versions {found} differ from the pinned {EXPECTED}")


def sha256_file(p):
    return hashlib.sha256(Path(p).read_bytes()).hexdigest()


def samples_sha256(x):
    """SHA-256 of the samples as the little-endian f64 stream I0, Q0, I1, Q1, ..."""
    z = np.ascontiguousarray(np.asarray(x, dtype=np.complex128))
    return hashlib.sha256(z.view("<f8").tobytes()).hexdigest()


def pick(d, keys):
    return {k: d[k] for k in keys if k in d}


def fields_of(sf):
    return {
        "global": pick(sf.get_global_info(), GLOBAL_KEYS),
        "captures": [pick(c, CAPTURE_KEYS) for c in sf.get_captures()],
        "annotations": [pick(a, ANNOTATION_KEYS) for a in sf.get_annotations()],
    }


def rust_step(nfft, overlap):
    # spectrum::welch_psd: step = round(nfft * (1 - overlap)), half away from zero
    return max(1, int(math.floor(nfft * (1.0 - overlap) + 0.5)))


def scipy_welch(x, fs, nfft, overlap):
    step = rust_step(nfft, overlap)
    f, p = scipy.signal.welch(
        np.asarray(x, dtype=np.complex128), fs=fs, window="hann", nperseg=nfft,
        noverlap=nfft - step, nfft=nfft, detrend=False, return_onesided=False,
        scaling="density", average="mean",
    )
    segments = (len(x) - nfft) // step + 1
    return np.fft.fftshift(f), np.fft.fftshift(p), segments


def write_third_party(name, raw, datatype, fs, global_extra, captures, annotations):
    out = HERE / "third_party"
    out.mkdir(exist_ok=True)
    data_path = out / f"{name}.sigmf-data"
    raw.tofile(data_path)
    sf = SigMFFile(
        data_file=str(data_path),
        global_info={"core:datatype": datatype, "core:sample_rate": fs, **global_extra},
    )
    for start, md in captures:
        sf.add_capture(start, metadata=dict(md))
    for start, length, md in annotations:
        sf.add_annotation(start, length, metadata=dict(md))
    sf.tofile(str(out / f"{name}.sigmf-meta"))
    # what sigmf-python wrote, as it reports it, and as it put it on disk
    written = fields_of(sf)
    on_disk = json.loads((out / f"{name}.sigmf-meta").read_text())
    assert pick(on_disk["global"], GLOBAL_KEYS) == written["global"]
    return sf, written


def third_party_cases():
    rng = np.random.default_rng(20261001)
    cases = []
    common = {
        "core:description": "third-party oracle recording written by sigmf-python",
        "core:author": "sigmf-python 1.13.0",
        "core:recorder": "gen_sigmf_welch_oracle.py",
        "core:hw": "synthetic, no hardware",
    }

    def cap(freq):
        return [(0, {"core:frequency": freq, "core:datetime": "2026-10-01T00:00:00.000000Z"})]

    # cf32_le: complex white noise plus two tones
    n, fs = 4096, 2.0e6
    t = np.arange(n) / fs
    x = (rng.normal(0, 0.1, n) + 1j * rng.normal(0, 0.1, n)
         + 0.5 * np.exp(2j * np.pi * 0.13 * fs * t) + 0.05 * np.exp(-2j * np.pi * 0.31 * fs * t))
    x = x.astype(np.complex64)
    cases.append(("tp_cf32", x, "cf32_le", fs, 1.0, cap(1575.42e6), [], True, None))

    # ci16_le: integer codes
    n, fs = 4096, 4.0e6
    t = np.arange(n) / fs
    z = (rng.normal(0, 3000, n) + 1j * rng.normal(0, 3000, n)
         + 8000 * np.exp(2j * np.pi * 0.07 * fs * t))
    codes = np.empty(2 * n, dtype="<i2")
    codes[0::2] = np.clip(np.round(z.real), -32768, 32767)
    codes[1::2] = np.clip(np.round(z.imag), -32768, 32767)
    cases.append(("tp_ci16", codes, "ci16_le", fs, 32767.0, cap(1176.45e6), [], True, None))

    # ci8: integer codes
    n, fs = 2048, 1.0e6
    t = np.arange(n) / fs
    z = rng.normal(0, 20, n) + 1j * rng.normal(0, 20, n) + 50 * np.exp(2j * np.pi * -0.2 * fs * t)
    codes8 = np.empty(2 * n, dtype="i1")
    codes8[0::2] = np.clip(np.round(z.real), -128, 127)
    codes8[1::2] = np.clip(np.round(z.imag), -128, 127)
    cases.append(("tp_ci8", codes8, "ci8", fs, 127.0, cap(1227.6e6), [], True, None))

    # cf32_le with two capture segments and two annotations carrying every modelled field
    n, fs = 1024, 2.5e6
    y = (rng.normal(0, 0.3, n) + 1j * rng.normal(0, 0.3, n)).astype(np.complex64)
    caps = [
        (0, {"core:frequency": 1575.42e6, "core:datetime": "2026-10-01T00:00:00.000000Z"}),
        (512, {"core:frequency": 1561.098e6, "core:datetime": "2026-10-01T00:00:00.000205Z"}),
    ]
    anns = [
        (10, 100, {"core:freq_lower_edge": 1574.42e6, "core:freq_upper_edge": 1576.42e6,
                   "core:label": "GPS L1", "core:comment": "first annotation"}),
        (600, 50, {"core:freq_lower_edge": 1560.098e6, "core:freq_upper_edge": 1562.098e6,
                   "core:label": "B1I", "core:comment": "second annotation"}),
    ]
    cases.append(("tp_multi", y, "cf32_le", fs, 1.0, caps, anns, False, None))

    # ci16_le whose first capture starts past sample 0
    n, fs = 1024, 1.0e6
    c = np.empty(2 * n, dtype="<i2")
    c[:] = np.clip(np.round(rng.normal(0, 5000, 2 * n)), -32768, 32767)
    caps = [(100, {"core:frequency": 1602.0e6})]
    cases.append(("tp_offset", c, "ci16_le", fs, 32767.0, caps, [], False, "capture0"))

    out = []
    for name, raw, dt, fs, full_scale, caps, anns, do_welch, mode in cases:
        _, written = write_third_party(name, raw, dt, fs, common, caps, anns)
        rd = fromfile(str(HERE / "third_party" / f"{name}.sigmf-meta"), autoscale=False)
        samples = rd.read_samples_in_capture(0) if mode == "capture0" else rd.read_samples()
        samples = np.asarray(samples, dtype=np.complex128)
        rec = {
            "name": name,
            "meta": f"third_party/{name}.sigmf-meta",
            "data": f"third_party/{name}.sigmf-data",
            "data_sha256": sha256_file(HERE / "third_party" / f"{name}.sigmf-data"),
            "datatype": dt,
            "full_scale": full_scale,
            "read_mode": mode or "all",
            "n_samples": int(len(samples)),
            "decoded_sha256": samples_sha256(samples),
            "fields": written,
            "welch": [],
        }
        if do_welch:
            for nfft in (64, 256, 512):
                for overlap in (0.0, 0.5, 0.75):
                    f, p, segs = scipy_welch(samples, fs, nfft, overlap)
                    rec["welch"].append({
                        "nfft": nfft, "overlap": overlap, "noverlap": nfft - rust_step(nfft, overlap),
                        "segments": segs, "freq_hz": f.tolist(), "psd": p.tolist(),
                    })
        out.append(rec)
    return out


def kshana_written_cases():
    schema = json.loads((SPEC_DIR / "sigmf-schema.json").read_text())
    validator_cls = jsonschema.validators.validator_for(schema)
    validator_cls.check_schema(schema)
    validator = validator_cls(schema)
    out = []
    for name in ("ks_cf32", "ks_ci16", "ks_ci8"):
        meta_path = HERE / "kshana_written" / f"{name}.sigmf-meta"
        data_path = HERE / "kshana_written" / f"{name}.sigmf-data"
        raw_meta = json.loads(meta_path.read_text())
        errors = [f"{list(e.path)}: {e.message}" for e in validator.iter_errors(raw_meta)]
        sf = SigMFFile(metadata=meta_path.read_text(), data_file=str(data_path), autoscale=False)
        try:
            sf.validate()
            ok = True
        except Exception as e:  # noqa: BLE001 - record any validation failure
            ok = False
            errors.append(f"sigmf-python validate(): {e}")
        samples = np.asarray(sf.read_samples(), dtype=np.complex128)
        fields = fields_of(sf)
        fields["declared_version"] = sf._declared_version
        out.append({
            "name": name,
            "data_sha256": sha256_file(data_path),
            "meta_sha256": sha256_file(meta_path),
            "schema": "SigMF v1.2.6 sigmf-schema.json",
            "schema_validator": validator_cls.__name__,
            "schema_errors": len([e for e in errors if not e.startswith("sigmf-python")]),
            "error_messages": errors,
            "sigmf_python_validate": ok,
            "n_samples": int(len(samples)),
            "decoded_sha256": samples_sha256(samples),
            "fields": fields,
        })
    return out


def main():
    check_versions()
    if not (SPEC_DIR / "sigmf-schema.json").is_file():
        sys.exit("set SIGMF_SPEC_DIR to the unpacked SigMF v1.2.6 specification")
    ref = {
        "provenance": {
            "generator": "tests/fixtures/sigmf_welch_oracle/gen_sigmf_welch_oracle.py",
            "oracles": {
                "scipy": scipy.__version__,
                "sigmf-python": sigmf.__version__,
                "numpy": np.__version__,
                "jsonschema": "4.26.0",
                "sigmf_spec": "v1.2.6",
                "sigmf_schema_sha256": sha256_file(SPEC_DIR / "sigmf-schema.json"),
            },
            "tolerances_fixed_before_first_comparison": {
                "psd_per_bin_relative": 1e-12,
                "freq_fraction_of_fs": 1e-12,
                "decoded_samples": "bit-identical",
                "metadata_fields": "identical",
                "schema_errors": 0,
            },
        },
        "third_party": third_party_cases(),
        "kshana_written": kshana_written_cases(),
    }
    (HERE / "reference.json").write_text(json.dumps(ref, indent=1) + "\n")
    for k in ref["kshana_written"]:
        print(k["name"], "schema errors:", k["schema_errors"], "validate:", k["sigmf_python_validate"],
              k["error_messages"])


if __name__ == "__main__":
    main()
