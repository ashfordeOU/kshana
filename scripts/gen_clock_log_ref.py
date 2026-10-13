#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Write the clock-log comparison fixture pre-registered in
tests/fixtures/clock_log/PREREGISTRATION.md.

    python3 -m venv /tmp/v && /tmp/v/bin/pip install allantools==2024.6 numpy
    /tmp/v/bin/python -I scripts/gen_clock_log_ref.py tests/fixtures/clock_log

It writes three logs (TimeLab ASCII, TAPR TICC, RINEX 3.04 clock) from one seeded phase
record, reads each back with an independent reader written from docs/CLOCK-LOG-FORMATS.md
(not from the Rust code), and runs allantools 2024.6 oadev, tdev and mtie on the phase the
reader produced. reference.json holds the reader's series and allantools' numbers.
"""
import calendar
import json
import os
import sys

import allantools
import numpy as np

N = 4097
SEED = 20261013
GAP = (1000, 1003)  # TICC readings k = 1000, 1001, 1002 removed


def phase_record():
    rng = np.random.default_rng(SEED)
    white_pm = 1e-9 * rng.standard_normal(N)
    rw_fm = np.cumsum(np.cumsum(1e-11 * rng.standard_normal(N)))
    return white_pm + rw_fm


# ── writers ──────────────────────────────────────────────────────────────────


def write_timelab(x):
    lines = ["# kshana clock-log fixture: TimeLab ASCII, two columns", "# units = ns"]
    lines += [f"{k} {v * 1e9:.9f}" for k, v in enumerate(x)]
    return "\n".join(lines) + "\n"


def write_ticc(x):
    t0 = 3.0
    lines = [
        "# TICC fixture (synthetic)",
        "TAPR TICC Timestamping Counter",
        "Type any character for config menu",
        "# timestamp (seconds)",
    ]
    for k, v in enumerate(x):
        if GAP[0] <= k < GAP[1]:
            continue
        lines.append(f"{t0 + k + v:.12f} chA")
        lines.append(f"{t0 + k + 0.5:.12f} chB")
    return "\n".join(lines) + "\n"


def rinex_epoch(sec):
    base = calendar.timegm((2026, 10, 13, 0, 0, 0))
    y, mo, d, h, mi, s = __import__("time").gmtime(base + sec)[:6]
    return f"{y:4d} {mo:02d} {d:02d} {h:02d} {mi:02d} {s:9.6f}"


def write_rinex(x):
    h = lambda c, label: f"{c:<60}{label}\n"  # noqa: E731
    head = (
        h("     3.04           C                   G", "RINEX VERSION / TYPE")
        + h("kshana fixture                          20261013 000000 UTC", "PGM / RUN BY / DATE")
        + h("GPS", "TIME SYSTEM ID")
        + h("     1    AS", "# / TYPES OF DATA")
        + h("", "END OF HEADER")
    )
    rows = []
    for k, v in enumerate(x):
        ep = rinex_epoch(30 * k)
        rows.append(f"AS G08       {ep}  1   {v:19.12E}")
        rows.append(f"AS G11       {ep}  1   {2e-4 + v:19.12E}")
    return head + "\n".join(rows) + "\n"


# ── the independent reader (from docs/CLOCK-LOG-FORMATS.md) ─────────────────


def round4(v):
    return float(f"{v:.4g}")


def median_spacing(t):
    d = [b - a for a, b in zip(t, t[1:]) if b - a > 0]
    return round4(float(np.median(d)))


def grid(times, values, tau0, linear):
    t0 = times[0]
    idx = [round((t - t0) / tau0) for t in times]
    n_grid = idx[-1] + 1
    out = [None] * n_grid
    for i, v in zip(idx, values):
        if out[i] is None:
            out[i] = v
    missing = [i for i, v in enumerate(out) if v is None]
    gaps = sum(1 for i in missing if i == 0 or out[i - 1] is not None)
    filled = 0
    if linear:
        for i in missing:
            lo = max(j for j in range(i) if out[j] is not None and j not in missing)
            hi = min(j for j in range(i + 1, n_grid) if j not in missing)
            out[i] = out[lo] + (out[hi] - out[lo]) * (i - lo) / (hi - lo)
            filled += 1
    return out, n_grid, len(missing), gaps, filled


def read_timelab(text):
    units = {"s": 1.0, "ms": 1e3, "us": 1e6, "ns": 1e9, "ps": 1e12}
    scale = 1.0
    times, vals = [], []
    for line in text.splitlines():
        s = line.strip()
        if not s:
            continue
        if s[0] in "#;%":
            body = s[1:].strip()
            for sep in ("=", ":"):
                if sep in body:
                    k, v = (p.strip() for p in body.split(sep, 1))
                    if k == "units":
                        scale = units[v]
                    break
            continue
        a, b = s.replace(",", " ").replace(";", " ").split()
        times.append(float(a))
        vals.append(float(b))
    tau0 = median_spacing(times)
    x = [v / scale for v in vals]
    out, n_grid, n_missing, n_gaps, filled = grid(times, x, tau0, False)
    return dict(tau0_s=tau0, n_grid=n_grid, n_missing=n_missing, n_gaps=n_gaps,
                n_interpolated=filled, phase_s=out)


def read_ticc(text, channel="chA"):
    t = []
    for line in text.splitlines():
        f = line.split()
        if len(f) != 2 or line.startswith("#"):
            continue
        try:
            v = float(f[0])
        except ValueError:
            continue
        if f[1] == channel:
            t.append(v)
    tau0 = median_spacing(t)
    n = [round((tk - t[0]) / tau0) for tk in t]
    x = [tk - t[0] - nk * tau0 for tk, nk in zip(t, n)]
    out, n_grid, n_missing, n_gaps, filled = grid(t, x, tau0, True)
    return dict(tau0_s=tau0, n_grid=n_grid, n_missing=n_missing, n_gaps=n_gaps,
                n_interpolated=filled, phase_s=out)


def read_rinex(text, clock="G08"):
    lines = text.splitlines()
    start = next(i for i, l in enumerate(lines) if l[60:].rstrip() == "END OF HEADER") + 1
    gps0 = calendar.timegm((1980, 1, 6, 0, 0, 0))
    t, x = [], []
    for l in lines[start:]:
        f = l.split()
        if len(f) < 10 or f[0] != "AS" or f[1] != clock:
            continue
        y, mo, d, h, mi = (int(v) for v in f[2:7])
        sec = float(f[7])
        t.append(calendar.timegm((y, mo, d, h, mi, 0)) - gps0 + sec)
        x.append(float(f[9]))
    tau0 = median_spacing(t)
    out, n_grid, n_missing, n_gaps, filled = grid(t, x, tau0, False)
    return dict(tau0_s=tau0, n_grid=n_grid, n_missing=n_missing, n_gaps=n_gaps,
                n_interpolated=filled, phase_s=out)


# ── allantools ──────────────────────────────────────────────────────────────


def curves(x, tau0):
    x = np.asarray(x)
    n = len(x)
    rate = 1.0 / tau0
    octaves = [2 ** i for i in range(0, 32) if 2 ** i < n]
    out = {}
    for name, fn, fits in (
        ("adev", allantools.oadev, lambda m: n >= 2 * m + 1),
        ("tdev", allantools.tdev, lambda m: n > 3 * m),
        ("mtie", allantools.mtie, lambda m: m < n),
    ):
        ms = [m for m in octaves if fits(m)]
        taus, devs, _, _ = fn(x, rate=rate, data_type="phase", taus=[m * tau0 for m in ms])
        out[name] = [[float(a), float(b)] for a, b in zip(taus, devs)]
    return out


def main(outdir):
    os.makedirs(outdir, exist_ok=True)
    x = phase_record()
    logs = {
        "timelab_phase_ns.txt": (write_timelab(x), read_timelab),
        "ticc_timestamp.txt": (write_ticc(x), read_ticc),
        "rinex_clk_304.clk": (write_rinex(x), read_rinex),
    }
    ref = {
        "generator": "scripts/gen_clock_log_ref.py",
        "allantools": allantools.__version__,
        "numpy": np.__version__,
        "seed": SEED,
        "logs": {},
    }
    for name, (text, reader) in logs.items():
        with open(os.path.join(outdir, name), "w", newline="\n") as f:
            f.write(text)
        r = reader(text)
        r["curves"] = curves(r["phase_s"], r["tau0_s"])
        ref["logs"][name] = r
    with open(os.path.join(outdir, "reference.json"), "w") as f:
        json.dump(ref, f, indent=1)
        f.write("\n")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "tests/fixtures/clock_log")
