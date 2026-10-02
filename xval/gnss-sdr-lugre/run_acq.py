# SPDX-License-Identifier: AGPL-3.0-only
"""Run GNSS-SDR 0.0.19 acquisition on the LuGRE L1 snapshots; write the oracle records.

Oracle driver for tests/lugre_acquisition_gnss_sdr_oracle.rs. For every non-surface LuGRE L1
snapshot it (1) converts the samples to interleaved signed 8-bit IQ (``<sdrx>.ibyte`` beside
the snapshot) with a decoder written here from the ION SDR metadata standard and the receiver
interface control document, independent of Kshana's reader; (2) runs GNSS-SDR once per PRN 1-32
with the pinned configuration ``acq_L1.conf.template``; (3) reads the first acquisition dump of
each run (MAT 7.3, HDF5) and writes ``gnss_sdr_records.json``.

Usage: run_acq.py <LuGRE dir> <output json>     (needs numpy, h5py and gnss-sdr on PATH)
"""
import glob
import json
import os
import re
import struct
import subprocess
import sys
import tempfile
import xml.etree.ElementTree as ET

import h5py
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
# 2025-03-02T08:00:00Z in GPS seconds since 1980-01-06 (18 leap seconds).
SURFACE_CUT_GPS_S = 1424937618.0
# Excluded before any run: the .sdrx metadata contradicts the binary header (see NOTICE.md).
EXCLUDED = ("_OP5_0", "_OP12_0")


def local(tag):
    return tag.split("}")[-1]


def meta(path):
    """The few layout facts the LuGRE metadata states, read with ElementTree."""
    root = ET.parse(path).getroot()
    vals = {}
    for el in root.iter():
        name = local(el.tag)
        if name in ("sizeword", "countwords", "endian", "quantization", "packedbits", "format",
                    "encoding", "sizeheader", "sizefooter", "url", "freqbase", "translatedfreq"):
            vals.setdefault(name, (el.text or "").strip())
    return vals


def convert(sdrx):
    """Decode the snapshot to int8 I,Q pairs; refuse any layout but the LuGRE one."""
    m = meta(sdrx)
    want = {"sizeword": "1", "countwords": "1", "endian": "Little", "quantization": "4",
            "packedbits": "8", "format": "IQ", "encoding": "TC"}
    for k, v in want.items():
        if m.get(k) != v:
            raise SystemExit(f"{sdrx}: {k}={m.get(k)!r}, this converter reads only {v!r}")
    raw = open(os.path.join(os.path.dirname(sdrx), m["url"]), "rb").read()
    body = np.frombuffer(raw[int(m["sizeheader"]):len(raw) - int(m["sizefooter"])], dtype=np.uint8)
    # Little-endian byte: the first component (I) in the low nibble, Q in the high nibble;
    # 4-bit two's complement sign-extended to 8 bits.
    i = (body & 0x0F).astype(np.int16)
    q = (body >> 4).astype(np.int16)
    i[i > 7] -= 16
    q[q > 7] -= 16
    out = np.empty(2 * body.size, dtype=np.int8)
    out[0::2] = i
    out[1::2] = q
    dst = sdrx + ".ibyte"
    out.tofile(dst)
    fs = float(m["freqbase"]) * 1e6
    rx = struct.unpack("<d", raw[10:18])[0]
    return dst, fs, rx, body.size


def run_prn(ibyte, fs, prn, workdir):
    out = os.path.join(workdir, f"prn{prn}")
    os.makedirs(out, exist_ok=True)
    conf = open(os.path.join(HERE, "acq_L1.conf.template")).read()
    conf = (conf.replace("${FS}", str(int(fs))).replace("${FILE}", ibyte)
            .replace("${PRN}", str(prn)).replace("${OUT}", out))
    cpath = os.path.join(out, "acq.conf")
    open(cpath, "w").write(conf)
    subprocess.run(["gnss-sdr", f"--config_file={cpath}", f"--log_dir={out}"], cwd=out,
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=1800)
    dumps = glob.glob(os.path.join(out, f"acq_G_1C_ch_0_*_sat_{prn}.mat"))
    if not dumps:
        return None
    first = min(dumps, key=lambda p: int(re.search(r"_ch_0_(\d+)_sat_", p).group(1)))
    with h5py.File(first, "r") as f:
        g = lambda k: np.array(f[k]).ravel()[0]
        return {
            "dump": os.path.basename(first),
            "sample_counter": int(g("sample_counter")),
            "num_dwells": int(g("num_dwells")),
            "positive": bool(int(g("d_positive_acq")) == 1),
            "delay_samples": float(g("acq_delay_samples")),
            "doppler_hz": float(g("acq_doppler_hz")),
            "test_statistic": float(g("test_statistic")),
            "threshold": float(g("threshold")),
        }


def main():
    lugre, dst = sys.argv[1], sys.argv[2]
    version = subprocess.run(["gnss-sdr", "--version"], capture_output=True, text=True)
    records = []
    snaps = sorted(glob.glob(os.path.join(lugre, "L0", "IQS", "IQS_L1_*.sdrx")))
    for sdrx in snaps:
        name = os.path.basename(sdrx)
        if "_S_OP" in name or any(x in name for x in EXCLUDED):
            continue
        ibyte, fs, rx, n = convert(sdrx)
        if rx >= SURFACE_CUT_GPS_S:
            continue
        rel = os.path.relpath(sdrx, lugre)
        print(f"{rel}: {n} samples at {fs} Hz, start {rx}", flush=True)
        with tempfile.TemporaryDirectory() as work:
            for prn in range(1, 33):
                r = run_prn(ibyte, fs, prn, work)
                if r is None:
                    print(f"  PRN {prn}: no dump", flush=True)
                    continue
                r.update({"snapshot": rel, "start_gps_s": rx, "fs_hz": fs, "prn": prn})
                print(f"  PRN {prn}: {r}", flush=True)
                records.append(r)
    json.dump({"oracle": "GNSS-SDR " + (version.stdout + version.stderr).strip().splitlines()[-1],
               "config": "xval/gnss-sdr-lugre/acq_L1.conf.template",
               "records": records}, open(dst, "w"), indent=1)


if __name__ == "__main__":
    main()
