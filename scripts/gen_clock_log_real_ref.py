#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the real-data clock-log comparison pre-registered in
tests/fixtures/clock_log_real/PREREGISTRATION.md (and its Addendum 1).

    python3 -m venv /tmp/v && /tmp/v/bin/pip install allantools==2024.6 numpy
    scripts/fetch_phasedat.sh && scripts/fetch_cs5071a.sh        # D1 and D2, git-ignored
    /tmp/v/bin/python -I scripts/gen_clock_log_real_ref.py \
        --igs IGS0OPSFIN_20262140000_01D_30S_CLK.CLK.gz          # D3 and D4 (BKG mirror)

It writes, for the measured series D1 (Stable32 PHASE.DAT), D2 (the first 65 536 readings of the 5071A
caesium clock) and the two IGS clocks D3 (satellite G01) and D4 (station ABMF):

  tests/fixtures/clock_log_real/igs_clk_30s_2026214_G01_ABMF.clk   the vendored IGS cut (header verbatim)
  tests/fixtures/clock_log_real/reference.json                     the reference readers' series facts and
                                                                    allantools' numbers, every case
  realdata-cache/clock_log_real/*.txt, ref_phase/*.f64             the wrapped logs and the reference
                                                                    phase of D1 and D2 (git-ignored: D1 and
                                                                    D2 carry no redistribution grant)

Each wrapped log is read back with an independent reader written from docs/CLOCK-LOG-FORMATS.md and the
TAPR TICC Operation Manual (15 December 2025), not from the Rust code; TICC time stamps are read as exact
decimals (fractions.Fraction). allantools 2024.6 `oadev`, `tdev` and `mtie` then run on the reference phase
(or, for the frequency log, on the frequency values). No allantools code is copied.
"""
import argparse
import calendar
import gzip
import hashlib
import json
import os
import struct
import sys
from fractions import Fraction

import allantools
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.dirname(HERE)

SHA = {
    "phasedat": "ce9b432432850d9072ae106696528fa3377db7fe3686521171b429b6cb5afbaa",
    "cs5071a_txt": "4a6b4e8773ec7588642a3e37dd7eecbc2f4119b8df8a3e52fec858afd17daa33",
    "igs_gz": "4bbf2002719d136dfb710f429dee3c050e2c42cdb97370edd32ab7279970b48f",
    "igs_txt": "93490a669466efd505218e1d25e8e571633bab99eb49e9e45fc2a381a265b998",
}
N_D2 = 65536
SAT, STA = "G01", "ABMF"
TICC_OFFSET_S = 300000


def sha256(b):
    return hashlib.sha256(b).hexdigest()


def need(label, data, want):
    got = sha256(data)
    if got != want:
        sys.exit(f"{label}: SHA-256 {got} != registered {want}")


def read_series(path, n=None):
    out = []
    for line in open(path, encoding="utf-8"):
        s = line.strip()
        if not s or s.startswith("#"):
            continue
        out.append(float(s))
        if n and len(out) == n:
            break
    return out


# ── writers ──────────────────────────────────────────────────────────────────


def write_timelab_phase(x):
    head = ["# real-data wrapper: TimeLab ASCII phase, two columns `time value`", "# tau0 = 1", "# units = s"]
    return "\n".join(head + [f"{k} {v:.17g}" for k, v in enumerate(x)]) + "\n"


def freq_of(x):
    return [(b - a) / 1.0 for a, b in zip(x, x[1:])]


def write_timelab_freq(y):
    head = ["# real-data wrapper: TimeLab ASCII fractional frequency, one column", "# tau0 = 1", "# data = frequency"]
    return "\n".join(head + [f"{v:.17g}" for v in y]) + "\n"


def decimal_stamp(frac, places):
    """A non-negative Fraction as a decimal string with `places` decimals, rounded half to even."""
    q = round(frac * 10**places)
    return f"{q // 10**places}.{q % 10**places:0{places}d}"


def write_ticc(x, offset_s, places):
    """TICC timestamp mode: `t[k] = offset + k + x[k]`, chA; chB on a bare 1 s grid (to be ignored)."""
    lines = [
        "# TICC Time interval Counter  (re-encoded measured data; not a counter capture)",
        "# Firmware 20251101.1",
        "# Mode: Timestamp",
        "TAPR TICC Timestamping Counter",
        "Type any character for config menu",
        "# timestamp (seconds)",
    ]
    for k, v in enumerate(x):
        a = Fraction(offset_s + k) + Fraction(v)
        b = Fraction(offset_s + k) + Fraction(1, 2)
        lines.append(f"{decimal_stamp(a, places)} chA")
        lines.append(f"{decimal_stamp(b, places)} chB")
    return "\n".join(lines) + "\n"


# ── the independent readers ──────────────────────────────────────────────────


def round4(v):
    return float(f"{float(v):.4g}")


def median_spacing(t):
    d = sorted(float(b - a) for a, b in zip(t, t[1:]) if b - a > 0)
    n = len(d)
    return round4(d[n // 2] if n % 2 else (d[n // 2 - 1] + d[n // 2]) / 2)


def facts(phase, tau0, source, n_missing=0, n_gaps=0, n_interp=0):
    return dict(tau0_s=tau0, tau0_source=source, n_grid=len(phase), n_missing=n_missing, n_gaps=n_gaps,
                n_interpolated=n_interp, phase_s=phase)


def read_timelab_phase(text):
    tau0, scale = None, 1.0
    t, v = [], []
    for line in text.splitlines():
        s = line.strip()
        if not s:
            continue
        if s[0] in "#;%":
            body = s[1:].strip()
            if "=" in body:
                k, val = (p.strip() for p in body.split("=", 1))
                if k == "tau0":
                    tau0 = float(val)
            continue
        a, b = s.split()
        t.append(float(a))
        v.append(float(b) / scale)
    return facts(v, tau0 if tau0 else median_spacing(t), "header" if tau0 else "median-spacing")


def read_timelab_freq(text):
    tau0, y = None, []
    for line in text.splitlines():
        s = line.strip()
        if not s:
            continue
        if s[0] in "#;%":
            body = s[1:].strip()
            if "=" in body:
                k, val = (p.strip() for p in body.split("=", 1))
                if k == "tau0":
                    tau0 = float(val)
            continue
        y.append(float(s))
    x = [0.0]
    for v in y:
        x.append(x[-1] + v * tau0)
    r = facts(x, tau0, "header")
    r["freq"] = y
    return r


def read_ticc(text, channel="chA"):
    T = []
    for line in text.splitlines():
        f = line.split()
        if len(f) != 2 or line.startswith("#") or f[1] != channel:
            continue
        try:
            T.append(Fraction(f[0]))
        except ValueError:
            continue
    tau0 = median_spacing(T)
    tau0_exact = Fraction(f"{tau0:.4g}")
    n = [round((tk - T[0]) / tau0_exact) for tk in T]
    assert n == list(range(len(T))), "reference expects a gap-free log"
    x = [float(tk - T[0] - nk * tau0_exact) for tk, nk in zip(T, n)]
    return facts(x, tau0, "median-spacing")


def read_rinex(text, clock):
    lines = text.splitlines()
    start = next(i for i, l in enumerate(lines) if l[60:].rstrip() == "END OF HEADER") + 1
    gps0 = calendar.timegm((1980, 1, 6, 0, 0, 0))
    t, x = [], []
    for l in lines[start:]:
        f = l.split()
        if len(f) < 10 or f[0] not in ("AS", "AR") or f[1] != clock:
            continue
        y, mo, d, h, mi = (int(v) for v in f[2:7])
        t.append(Fraction(calendar.timegm((y, mo, d, h, mi, 0)) - gps0) + Fraction(f[7]))
        x.append(float(f[9]))
    return facts(x, median_spacing(t), "median-spacing")


# ── allantools ───────────────────────────────────────────────────────────────


def curves(x, tau0, freq=None):
    x = np.asarray(x)
    n = len(x)
    rate = 1.0 / tau0
    octaves = [2**i for i in range(0, 40) if 2**i < n]
    out = {}
    for name, fn, fits in (
        ("adev", allantools.oadev, lambda m: n >= 2 * m + 1),
        ("tdev", allantools.tdev, lambda m: n > 3 * m),
        ("mtie", allantools.mtie, lambda m: m < n),
    ):
        ms = [m for m in octaves if fits(m)]
        data, kind = (np.asarray(freq), "freq") if freq is not None else (x, "phase")
        taus, devs, _, _ = fn(data, rate=rate, data_type=kind, taus=[m * tau0 for m in ms])
        out[name] = [[float(a), float(b)] for a, b in zip(taus, devs)]
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--phasedat", default=os.path.join(ROOT, "realdata-cache/phasedat/PHASE.DAT"))
    ap.add_argument("--cs5071a", default=os.path.join(ROOT, "realdata-cache/cs5071a/5071A_phase.txt"))
    ap.add_argument("--igs", required=True, help="IGS0OPSFIN_20262140000_01D_30S_CLK.CLK.gz")
    ap.add_argument("--cache", default=os.path.join(ROOT, "realdata-cache/clock_log_real"))
    ap.add_argument("--fixtures", default=os.path.join(ROOT, "tests/fixtures/clock_log_real"))
    a = ap.parse_args()
    os.makedirs(a.cache, exist_ok=True)
    os.makedirs(os.path.join(a.cache, "ref_phase"), exist_ok=True)
    os.makedirs(a.fixtures, exist_ok=True)

    need("PHASE.DAT", open(a.phasedat, "rb").read(), SHA["phasedat"])
    need("5071A_phase.txt", open(a.cs5071a, "rb").read(), SHA["cs5071a_txt"])
    gz = open(a.igs, "rb").read()
    need("IGS clock (gz)", gz, SHA["igs_gz"])
    igs = gzip.decompress(gz)
    need("IGS clock (text)", igs, SHA["igs_txt"])

    d1 = read_series(a.phasedat)
    d2 = read_series(a.cs5071a, N_D2)
    assert len(d1) == 1001 and len(d2) == N_D2
    d1_ns = [v / 1e9 for v in d1]  # Addendum 1: D1 as nanoseconds, TICC logs only

    # the vendored IGS cut: header verbatim, then the G01 and ABMF records in file order
    lines = igs.decode("ascii").splitlines()
    end = next(i for i, l in enumerate(lines) if l[60:].rstrip() == "END OF HEADER")
    keep = lines[: end + 1]
    n_sat = n_sta = 0
    for l in lines[end + 1 :]:
        f = l.split()
        if len(f) > 1 and f[0] == "AS" and f[1] == SAT:
            keep.append(l)
            n_sat += 1
        elif len(f) > 1 and f[0] == "AR" and f[1] == STA:
            keep.append(l)
            n_sta += 1
    assert (n_sat, n_sta) == (2880, 288), (n_sat, n_sta)
    cut_name = "igs_clk_30s_2026214_G01_ABMF.clk"
    cut = "\n".join(keep) + "\n"
    open(os.path.join(a.fixtures, cut_name), "w", newline="\n").write(cut)

    cases = {}

    def add(name, text, reader, *args, series=None, keep_phase="cache", freq_for_curves=False):
        path = os.path.join(a.cache, name) if keep_phase == "cache" else os.path.join(a.fixtures, name)
        if keep_phase == "cache":
            open(path, "w", newline="\n").write(text)
        r = reader(text, *args)
        ph = r.pop("phase_s")
        fr = r.pop("freq", None)
        r["curves"] = curves(ph, r["tau0_s"], fr)
        if fr is not None:
            # Diagnostic recorded after run 1 (RESULTS.md): allantools 2024.6 subtracts the mean
            # frequency before it integrates a frequency log, so its MTIE of `fr` is the MTIE of a
            # different phase; its phase-mode MTIE of the plain integral is the like-for-like number.
            r["mtie_of_plain_integral"] = curves(ph, r["tau0_s"])["mtie"]
        r["phase_sha256"] = sha256(struct.pack(f"<{len(ph)}d", *ph))
        if keep_phase == "cache":
            open(os.path.join(a.cache, "ref_phase", name + ".f64"), "wb").write(struct.pack(f"<{len(ph)}d", *ph))
        else:
            r["phase_s"] = ph
        cases[name] = r

    for tag, x in (("d1", d1), ("d2", d2)):
        add(f"{tag}_TL-P.txt", write_timelab_phase(x), read_timelab_phase)
        add(f"{tag}_TL-F.txt", write_timelab_freq(freq_of(x)), read_timelab_freq)
    for tag, x in (("d1", d1_ns), ("d2", d2)):
        add(f"{tag}_TICC-0.txt", write_ticc(x, 0, 12), read_ticc, "chA")
        add(f"{tag}_TICC-3.txt", write_ticc(x, TICC_OFFSET_S, 12), read_ticc, "chA")
    add("d1_TICC-11.txt", write_ticc(d1_ns, 0, 11), read_ticc, "chA")
    # the vendored cut: the reference is committed with the numbers
    add(cut_name + ":" + SAT, cut, read_rinex, SAT, keep_phase="fixtures")
    add(cut_name + ":" + STA, cut, read_rinex, STA, keep_phase="fixtures")
    # the "cache" writer above wrote nothing for the two fixtures-keyed cases (the cut is already in place)

    ref = {
        "generator": "scripts/gen_clock_log_real_ref.py",
        "allantools": allantools.__version__,
        "numpy": np.__version__,
        "sources": SHA,
        "ticc_offset_s": TICC_OFFSET_S,
        "cases": cases,
    }
    with open(os.path.join(a.fixtures, "reference.json"), "w") as f:
        json.dump(ref, f, indent=1)
        f.write("\n")
    print(f"wrote {len(cases)} cases; cut {cut_name} ({len(cut)} bytes)")


if __name__ == "__main__":
    main()
