#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Render the 0.38 README figures from real engine runs into docs/figures/0.38/.

Every figure is drawn from the output of a `kshana` command run by this script in a temporary
directory; nothing is hand drawn and nothing is read from a previous run. The inputs are either
committed files (scenarios/, standards/, examples/) or small synthetic logs this script writes
itself (stated in each figure's own description), because the real third-party logs are never
vendored. Each figure comes as a light and a dark SVG in the visual system of the other README
figures: it imports the drawing layer of tools/gen_readme_assets.py (outlined text, the site's
colour tokens), so GitHub shows it the same way.

Figures, one per 0.38 capability (the README section that embeds each is in FIGURE_PAGES):

    jammertest     `kshana jammertest score`            scheduled tests against a receiver log
    receiver-flags `kshana receiver-trust` on a UBX log the receiver's own flag against Kshana's alarm
    machine-inputs `kshana imu-fit`                     an IMU log's Allan deviation and the table it gives
    timing         `kshana holdover-test-example.toml`  a time-error record against the ITU-T masks
    standards      `kshana standards-pack run`          every pack test: measured against its bar
    lunanet-afs    `kshana lunanet-afs-check spec`      code-generator checks against the printed columns
    bench          `kshana bench baseline`              built-in baselines on a held-out split
    exporters      `kshana trust-telemetry`             one trust result as Prometheus, CEF and LEEF lines
    optical        `kshana optical-atmosphere-network`  one seeded realisation of a site's link margin

Usage:
    python3 tools/gen_figures_038.py [--kshana PATH] [--out docs/figures/0.38]
    python3 tools/gen_figures_038.py --check    # regenerate in memory, fail if a file differs

`--kshana` defaults to $KSHANA_BIN, then `target/release/kshana`, then `kshana` on PATH. The
engine must be built from this tree (the version is checked against Cargo.toml).
"""
from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import random
import re
import shutil
import subprocess
import sys
import tempfile
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import gen_readme_assets as g  # noqa: E402  (the shared drawing layer)

ROOT = g.ROOT
DEFAULT_OUT = ROOT / "docs" / "figures" / "0.38"
W = 1280

# --------------------------------------------------------------------------------------
# Running the engine
# --------------------------------------------------------------------------------------


class Run:
    """One temporary working directory and the engine binary."""

    def __init__(self, exe: str, work: Path):
        self.exe, self.work = exe, work

    def sh(self, *args: str, cwd: Path | None = None, ok=(0,)) -> str:
        p = subprocess.run([self.exe, *args], cwd=cwd or self.work, capture_output=True, text=True)
        if p.returncode not in ok:
            sys.exit(f"gen_figures_038: `kshana {' '.join(args)}` exited {p.returncode}: {p.stderr.strip()[:400]}")
        return p.stdout

    def json(self, *args: str, **kw) -> dict:
        return json.loads(self.sh(*args, **kw))

    def scenario(self, rel: str) -> dict:
        src = ROOT / rel
        dst = self.work / src.name
        shutil.copyfile(src, dst)
        self.sh(dst.name)
        return json.loads((self.work / (src.stem + ".result.json")).read_text())


# --------------------------------------------------------------------------------------
# Synthetic inputs (written here, deterministic, labelled as made up in the figure)
# --------------------------------------------------------------------------------------


def _nmea(body: str) -> str:
    cs = 0
    for ch in body:
        cs ^= ord(ch)
    return f"${body}*{cs:02X}\r\n"


def nmea_log(secs: int, jam: list[tuple[int, int]], drop: float) -> str:
    """One second per cycle from 12:00:00, 8 GPS satellites, C/N0 `drop` dB lower inside `jam`."""
    out = []
    for t in range(secs):
        h, m, s = 12 + t // 3600, t // 60 % 60, t % 60
        tod = f"{h:02d}{m:02d}{s:02d}.00"
        out.append(_nmea(f"GPRMC,{tod},A,6900.0000,N,01600.0000,E,0.0,0.0,150925,,,A"))
        out.append(_nmea(f"GPGGA,{tod},6900.0000,N,01600.0000,E,1,08,1.0,10.0,M,0.0,M,,"))
        hit = any(a <= t <= b for a, b in jam)
        for part in range(2):
            body = f"GPGSV,2,{part + 1},08"
            for k in range(4):
                sv = part * 4 + k + 1
                snr = 45.0 - (sv % 3) - (drop if hit else 0.0)
                body += f",{sv:02d},{30 + sv * 5:02d},{sv * 40:03d},{snr:02.0f}"
            out.append(_nmea(body))
    return "".join(out)


def ubx_frame(cls: int, mid: int, payload: bytes) -> bytes:
    f = bytes([0xB5, 0x62, cls, mid]) + len(payload).to_bytes(2, "little") + payload
    a = b = 0
    for x in f[2:]:
        a = (a + x) & 255
        b = (b + a) & 255
    return f + bytes([a, b])


def ubx_log(secs: int, drop: list[tuple[int, int]], flag: list[tuple[int, int]]) -> bytes:
    """NAV-PVT, NAV-SAT and NAV-STATUS per second; C/N0 down 20 dB inside `drop`, spoofDetState 2 inside `flag`."""
    out = bytearray()
    for t in range(secs):
        itow = 1000 * t
        pvt = bytearray(92)
        pvt[0:4] = itow.to_bytes(4, "little")
        pvt[4:6] = (2024).to_bytes(2, "little")
        pvt[6], pvt[7], pvt[8] = 9, 10, 12
        pvt[9], pvt[10] = (itow // 60000) % 60, (itow // 1000) % 60
        pvt[11] = 3
        pvt[20], pvt[23] = 3, 8
        pvt[24:28] = (160_000_000).to_bytes(4, "little")
        pvt[28:32] = (690_000_000).to_bytes(4, "little")
        out += ubx_frame(0x01, 0x07, bytes(pvt))
        cno = 25 if any(a <= t <= b for a, b in drop) else 45
        sat = bytearray(8 + 12 * 8)
        sat[0:4] = itow.to_bytes(4, "little")
        sat[5] = 8
        for sv in range(8):
            o = 8 + sv * 12
            sat[o + 1], sat[o + 2], sat[o + 3] = sv + 1, cno - sv % 3, 40
        out += ubx_frame(0x01, 0x35, bytes(sat))
        st = bytearray(16)
        st[0:4] = itow.to_bytes(4, "little")
        st[4] = 3
        st[7] = (2 if any(a <= t <= b for a, b in flag) else 1) << 3
        out += ubx_frame(0x01, 0x03, bytes(st))
    return bytes(out)


# --------------------------------------------------------------------------------------
# Loaders: each runs one engine command and returns what the figure needs
# --------------------------------------------------------------------------------------

JT_CATALOG = {"test_types": [{"type": "Jamming", "type_id": 1, "test_groups": [
    {"group_id": 2, "group_name": "CW", "tests": [{"test_id": 5, "name": "CW jammer"}]}]}]}
JT_SLOTS = [("12:05:00", "12:08:00"), ("12:12:00", "12:15:00"), ("12:20:00", "12:22:00")]
JT_JAM = [(300, 480), (1200, 1320)]  # the middle slot (12:12 to 12:15) has no jammer: a missed alarm


def load_jammertest(run: Run) -> dict:
    d = run.work / "jt"
    d.mkdir()
    (d / "catalog.json").write_text(json.dumps(JT_CATALOG))
    tests = [{"start_time": f"2025-09-15T{a}", "end_time": f"2025-09-15T{b}", "test_id": "1.2.5",
              "power_w": 0, "status": ""} for a, b in JT_SLOTS]
    (d / "plan.json").write_text(json.dumps({"locations": [{"location_id": 1, "location_name": "Test Area 1", "tests": tests}]}))
    (d / "log.nmea").write_text(nmea_log(1800, JT_JAM, 20.0))
    (d / "session.toml").write_text('[log]\nformat = "nmea"\npath = "log.nmea"\n')
    res = run.json("jammertest", "score", "session.toml", "--catalog", "catalog.json", "--plan", "plan.json",
                   "--location", "1", "--local-offset-h", "0", "--json", cwd=d)
    return {"result": res, "secs": 1800, "jam": JT_JAM, "slots": JT_SLOTS}


def load_flags(run: Run) -> dict:
    d = run.work / "flags"
    d.mkdir()
    drop, flag = [(80, 90), (120, 130)], [(120, 130), (160, 165)]
    (d / "log.ubx").write_bytes(ubx_log(200, drop, flag))
    (d / "session.toml").write_text('[log]\nformat = "ubx"\npath = "log.ubx"\n')
    run.sh("receiver-trust", "session.toml", cwd=d)
    res = json.loads((d / "session.result.json").read_text())
    return {"result": res, "drop": drop, "flag": flag}


def load_imu(run: Run) -> dict:
    d = run.work / "imu"
    d.mkdir()
    rnd = random.Random(38)
    n, hz = 20000, 100.0
    walk, rows = 0.0, ["t_s,gx,gy,gz,ax,ay,az"]
    for i in range(n):
        walk += rnd.gauss(0, 0.0004)
        gz = rnd.gauss(0, 0.003)
        rows.append(f"{i / hz:.2f},{rnd.gauss(0, 0.003):.6f},{rnd.gauss(0, 0.003):.6f},{gz:.6f},"
                    f"{rnd.gauss(0, 0.02) + walk:.6f},{rnd.gauss(0, 0.02):.6f},{9.80665 + rnd.gauss(0, 0.02):.6f}")
    (d / "still.csv").write_text("\n".join(rows) + "\n")
    res = run.json("imu-fit", "still.csv", "--format", "csv", "--axis", "x", "--expected-mean", "0",
                   "--id", "bench-imu", "--json", cwd=d)
    table = run.sh("imu-fit", "still.csv", "--format", "csv", "--axis", "x", "--expected-mean", "0",
                   "--id", "bench-imu", cwd=d)
    return {"result": res, "table": table}


def load_timing(run: Run) -> dict:
    return run.scenario("scenarios/holdover-test-example.toml")


def load_standards(run: Run) -> list[dict]:
    return [run.json("standards-pack", "run", pid, "--json") for pid in ("dhs-rpcf", "imo-circ-1575", "icao-doc9849-appf")]


def load_afs(run: Run) -> dict:
    return run.json("lunanet-afs-check", "spec", "--json", ok=(0, 1))


def load_bench(run: Run) -> dict:
    out = run.work / "bench"
    run.sh("bench", "baseline", "--task", "d", "--split", "test", "--out", str(out))
    return {p.name: json.loads(p.read_text()) for p in sorted(out.glob("*.result.json"))}


def load_exporters(run: Run) -> dict:
    d = run.work / "exp"
    d.mkdir()
    src = ROOT / "examples" / "maritime-trust"
    for fn in ("session.toml", "tallinn-helsinki.nmea"):
        shutil.copyfile(src / fn, d / fn)
    run.sh("receiver-trust", "session.toml", cwd=d)
    r = "session.result.json"
    return {
        "prom": run.sh("trust-telemetry", "--result", r, "--print-metrics", cwd=d),
        "cef": run.sh("trust-telemetry", "--result", r, "--print-syslog", "--format", "cef", cwd=d),
        "leef": run.sh("trust-telemetry", "--result", r, "--print-syslog", "--format", "leef", cwd=d),
        "result": json.loads((d / "session.result.json").read_text()),
    }


def load_optical(run: Run) -> dict:
    return run.scenario("scenarios/optical-atmosphere-network.toml")


# --------------------------------------------------------------------------------------
# Drawing: shared frame and small pieces
# --------------------------------------------------------------------------------------

Svg, Face = g.Svg, g.Face
STATUS_KEY = {"MET": "lime", "NOT MET": "coral", "NEEDS INPUT": "amber", "PASS": "lime", "FAIL": "coral"}


class Fig:
    """The page ground, header, one instrument window and the caption; content goes in between."""

    def __init__(self, t, d, kicker, headline, meta, title_bits, wh, desc, title, caption, prov):
        self.t, self.wh = t, wh
        self.wx, self.wy, self.ww = 40, 120, W - 80
        cap_lines = []
        for kind, text in caption:
            cap_lines += g.wrap(text, W - 80, 12.5, "sans", 500 if kind == "adv" else 400) + [""]
        self.H = self.wy + wh + 36 + int(len(cap_lines) * 12.5 * 1.5) + 44
        self.s = s = Svg(W, self.H, title, desc)
        g.card(s, t)
        g.eyebrow(s, t, 40, 50, kicker)
        s.text(headline, 40, 92, 32, t["ink"], "sans", 600, ls=-0.03)
        s.text(meta, W - 40, 50, 12.5, t["ink3"], "mono", anchor="end")
        self.top = g.window(s, t, self.wx, self.wy, self.ww, wh, title_bits)
        g.advisory_block(s, t, 40, self.wy + wh + 30, W - 80, caption)
        g.provenance(s, t, 40, self.H - 16, prov)

    def label(self, x, y, title, sub):
        self.s.text(title, x, y + 22, 14, self.t["ink"], "sans", 500)
        self.s.text(sub, x, y + 40, 11, self.t["ink3"], "mono")


def advisory_of(res: dict | None) -> str:
    return (res or {}).get("advisory") or (
        "Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment "
        "and not a safety-of-life service.")


def spans(flags: list[bool], times: list[float]) -> list[tuple[float, float]]:
    out, cur = [], None
    for tt, on in zip(times, flags):
        if on and cur is None:
            cur = [tt, tt]
        elif on:
            cur[1] = tt
        elif cur is not None:
            out.append((cur[0], cur[1]))
            cur = None
    if cur:
        out.append((cur[0], cur[1]))
    return out


def fmt_g(v) -> str:
    if isinstance(v, bool):
        return "yes" if v else "no"
    if isinstance(v, (int, float)):
        return f"{v:.4g}"
    return str(v)


# --------------------------------------------------------------------------------------
# 1. Jammertest scoring
# --------------------------------------------------------------------------------------


def jammertest_fig(t, d, v):
    res, sm = d["result"], d["result"]["summary"]
    T1 = d["secs"]
    tests = res["tests"]
    desc = (f"Scoring of one synthetic receiver log against a three-test schedule, from a real run of engine v{v} "
            f"(`kshana jammertest score`). The log is made up: 1800 s of NMEA with a 20 dB C/N0 drop over two intervals. "
            f"The schedule lists three slots; the middle slot has no jammer in the log. The score marks "
            f"{sm['detected']} of {sm['tests']} tests detected (median latency {sm['median_latency_s']:g} s) and {sm['missed']} missed, "
            f"with {sm['false_alarm_runs']} false-alarm runs over {sm['clean_hours']:.2f} h of clean time. "
            f"Nothing here says anything about a real receiver. {advisory_of(res)}")
    F = Fig(t, d, "Jammertest scoring · one synthetic log", "Scheduled tests, scored.",
            f"{T1} s · 1 Hz · made-up log", [("kshana", "b"), ("jammertest score", "n"), ("·", "n"), ("catalog + plan + log", "n")],
            330, desc, "Jammertest scoring on a synthetic log",
            [("adv", advisory_of(res)),
             ("note", "The log, the catalogue and the plan are made up to show the scorecard; they are not the NPRA files and not a measurement. "
                      "The middle slot has no jammer in the log, so it is scored missed by construction.")],
            f"Engine v{v} · jammertest score on a synthetic NMEA log · scenario hash {res['scenario_hash'][:12]} · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 40

    def X(tt):
        return lx + tt / T1 * lw

    y0 = F.top + 24
    F.label(F.wx + 20, y0, "Scheduled tests", "slot start to end")
    for tt in tests:
        a, b = tt["onset_s"], tt["end_s"]
        key = {"detected": "lime", "late": "amber", "missed": "coral"}.get(tt["outcome"], "ink4")
        s.rect(X(a), y0 + 8, X(b) - X(a), 34, fill=g.soft(t, key, t["panel"], 0.55), stroke=t[key], sw=1, r=5)
        lab = tt["outcome"]
        s.text(lab.upper(), (X(a) + X(b)) / 2, y0 + 30, 10.5, t["ink"], "mono", 500, anchor="middle", ls=0.06)
    y1 = y0 + 90
    F.label(F.wx + 20, y1, "What the log did", "a 20 dB C/N0 drop")
    for a, b in d["jam"]:
        s.rect(X(a), y1 + 8, X(b) - X(a), 34, fill=g.soft(t, "magenta", t["panel"], 0.55), stroke=t["magenta"], sw=1, r=5)
        s.text("-20 DB", (X(a) + X(b)) / 2, y1 + 30, 10.5, t["ink"], "mono", 500, anchor="middle", ls=0.06)
    ay = y1 + 70
    g.time_axis(s, t, X, ay, T1, 300)
    for tt in tests:
        for xx in (tt["onset_s"], tt["end_s"]):
            s.line(X(xx), y0 + 4, X(xx), y1 + 50, g.line(t, 1, t["panel"]), 1, dash="2 4")
    cx, cy = lx, ay + 36
    for lab, val, key in (("Tests scored", f"{sm['evaluable']} of {sm['tests']}", "cyan"),
                          ("Detected", f"{sm['detected']}", "lime"), ("Missed", f"{sm['missed']}", "coral"),
                          ("Median latency", f"{sm['median_latency_s']:g} s", "cyan"),
                          ("Median recovery", f"{sm['median_time_to_recover_s']:g} s", "cyan"),
                          ("False-alarm runs", f"{sm['false_alarm_runs']}", "lime")):
        cx += g.chip(s, t, cx, cy, f"{lab} {val}", t[key]) + 12
        if cx > F.wx + F.ww - 200:
            cx, cy = lx, cy + 36
    return s


# --------------------------------------------------------------------------------------
# 2. The receiver's own flags
# --------------------------------------------------------------------------------------

AGREE_KEY = {"both": "lime", "receiver-only": "magenta", "kshana-only": "amber", "neither": "ink4"}


def flags_fig(t, d, v):
    res = d["result"]
    sr = res["receiver_self_report"]
    eps = res["epochs"]
    T1 = eps[-1]["t_s"]
    cal = res["baseline"]["calibration_epochs"]
    desc = (f"The receiver's own spoofing flag set against Kshana's alarms, from a real run of engine v{v} on a made-up UBX log "
            f"({len(eps)} epochs at 1 Hz). C/N0 falls 20 dB at 80 to 90 s and 120 to 130 s; the receiver flags 120 to 130 s and 160 to 165 s. "
            f"Of {sr['epochs_reported']} epochs compared after calibration, {sr['both']} had both flagging, {sr['receiver_only']} the receiver only, "
            f"{sr['kshana_only']} Kshana only and {sr['neither']} neither. Neither side is ground truth and agreement is not validation. {advisory_of(res)}")
    F = Fig(t, d, "Receiver trust · the receiver's own flags", "Two detectors, compared.",
            f"{len(eps)} epochs · 1 Hz · made-up UBX log", [("kshana", "b"), ("receiver-trust", "n"), ("·", "n"), ("UBX-NAV-STATUS", "n")],
            330, desc, "The receiver's own flag against Kshana's alarm",
            [("adv", advisory_of(res)),
             ("note", "The UBX log is made up to show the comparison. Neither the receiver's flag nor Kshana's alarm is ground truth, "
                      "and agreement between them is not validation.")],
            f"Engine v{v} · receiver-trust on a synthetic UBX log · scenario hash {res['scenario_hash'][:12]} · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 40

    def X(tt):
        return lx + tt / T1 * lw

    rows = [("Kshana alarm", "any monitor", [bool((e.get("self_report") or {}).get("kshana_alarm")) for e in eps], "amber"),
            ("Receiver flag", "spoofDetState", [bool((e.get("self_report") or {}).get("receiver_flag")) for e in eps], "magenta")]
    times = [e["t_s"] for e in eps]
    y = F.top + 20
    for name, sub, flags, key in rows:
        F.label(F.wx + 20, y, name, sub)
        s.rect(lx, y + 8, lw, 30, fill=g.soft(t, "ink4", t["panel"], 0.10), r=4)
        for a, b in spans(flags, times):
            s.rect(X(a), y + 8, max(X(b + 1) - X(a), 2), 30, fill=t[key], r=3)
        y += 62
    F.label(F.wx + 20, y, "Agreement", "per epoch, after calibration")
    s.rect(X(0), y + 8, X(cal) - X(0), 30, fill=g.soft(t, "ink4", t["panel"], 0.30), r=4)
    s.text("CALIBRATION", (X(0) + X(cal)) / 2, y + 28, 10.5, t["ink2"], "mono", 500, anchor="middle", ls=0.06)
    runs, cur = [], None
    for e in eps:
        a = (e.get("self_report") or {}).get("agreement")
        if a is None or a == "calibrating":
            cur = None
            continue
        if cur and cur[0] == a and e["t_s"] - cur[2] <= 1.01:
            cur[2] = e["t_s"]
        else:
            cur = [a, e["t_s"], e["t_s"]]
            runs.append(cur)
    for a, t0, t1 in runs:
        s.rect(X(t0), y + 8, max(X(t1 + 1) - X(t0), 2), 30, fill=g.soft(t, AGREE_KEY[a], t["panel"], 0.30 if a == "neither" else 0.9), r=2)
    g.time_axis(s, t, X, y + 62, T1, 20, unit_div=1.0, unit="s")
    gx, gy = lx, y + 96
    for lab, key in (("both", "lime"), ("receiver only", "magenta"), ("Kshana only", "amber"), ("neither", "ink4")):
        n = sr[{"both": "both", "receiver only": "receiver_only", "Kshana only": "kshana_only", "neither": "neither"}[lab]]
        gx += g.chip(s, t, gx, gy, f"{lab} {n}", t[key]) + 12
    return s


# --------------------------------------------------------------------------------------
# 3. More receivers and sensors (imu-fit)
# --------------------------------------------------------------------------------------


def machine_fig(t, d, v):
    fit = d["result"]["fit"]
    desc = (f"What `kshana imu-fit` reads off a stationary IMU log, from a real run of engine v{v} on a made-up log "
            f"({fit['samples']:,} samples at {1 / fit['dt_s']:g} Hz, {fit['span_s']:.0f} s): the accelerometer velocity random walk q_va = {fit['q_va']:.3g}, "
            f"the gyro angle random walk q_arw = {fit['q_arw']:.3g}, the bias instability {fit['bias_instability']:.3g} and the early Allan slopes "
            f"({fit['accel_white_slope']:.2f} and {fit['gyro_white_slope']:.2f}; about -0.5 where white noise dominates). "
            f"The table beside it is the TOML the command prints. The estimator is checked on synthetic logs only. {advisory_of(None)}")
    toml_lines = d["table"].rstrip().splitlines()[:16]
    F = Fig(t, d, "More receivers and sensors · imu-fit", "A sensor log, fitted.",
            f"{fit['samples']:,} samples · {1 / fit['dt_s']:g} Hz · made-up log", [("kshana", "b"), ("imu-fit", "n"), ("·", "n"), ("still.csv", "n")],
            110 + 26 * max(len(toml_lines), 8), desc, "imu-fit on a synthetic stationary log",
            [("adv", advisory_of(None)),
             ("note", "The IMU log is made up (white noise plus a slow walk) to show what the fit reads. The estimator is checked on synthetic "
                      "logs with known coefficients, not against an external oracle: MODELLED.")],
            f"Engine v{v} · imu-fit --json and its TOML table on a synthetic CSV (sha256 {d['result']['sha256'][:12]}) · MODELLED, advisory")
    s = F.s
    x0, y = F.wx + 24, F.top + 30
    s.text("Fitted parameters", x0, y, 14, t["ink"], "sans", 500)
    y += 30
    rows = [("q_va", fit["q_va"], "velocity random walk (m/s per root s)^2"), ("q_arw", fit["q_arw"], "angle random walk (rad per root s)^2"),
            ("bias", fit["bias"], "accel mean, m/s^2"), ("gyro_bias", fit["gyro_bias"], "gyro mean, rad/s"),
            ("bias_instability", fit["bias_instability"], "curve minimum"),
            ("accel white slope", fit["accel_white_slope"], "about -0.5 is white"), ("gyro white slope", fit["gyro_white_slope"], "about -0.5 is white")]
    for name, val, note in rows:
        s.text(name, x0, y, 12.5, t["cyan"], "mono", 500)
        s.text(f"{val:.4g}", x0 + 200, y, 12.5, t["ink"], "mono", 500)
        s.text(note, x0 + 300, y, 11, t["ink3"], "mono")
        y += 26
    # right: the table the command prints, line by line
    px = F.wx + 640
    g.glass(s, t, px, F.top + 16, F.ww - 640 - 24, F.wh - (F.top - F.wy) - 32, r=10, fill=t["panel2"])
    yy = F.top + 42
    for ln in toml_lines:
        s.text(g.fit_text(ln, F.ww - 640 - 56, 11.5, "mono"), px + 16, yy, 11.5, t["ink2"], "mono")
        yy += 22
    return s


# --------------------------------------------------------------------------------------
# 4. Timing and holdover
# --------------------------------------------------------------------------------------


def timing_fig(t, d, v):
    ser = d["record"]["series"]
    ts, te = ser["time_s"], ser["time_error_ns"]
    T1 = ts[-1]
    tst = d["test"]
    ho, rec, env = d["holdover"], d["recovery"], d["holdover_envelope"]
    ver = d["verdicts"]
    limit = d["budgets"][0]["max_abs_te_ns"]
    desc = (f"A holdover test scored from a time-error record, from a real run of engine v{v} on scenarios/holdover-test-example.toml "
            f"({d['record']['n_samples']} samples every {d['record']['sample_interval_s']:g} s). GNSS is removed by the operator at {tst['gnss_removed_s']:g} s "
            f"and restored at {tst['gnss_restored_s']:g} s; the time error drifts to {ho['te_at_max_abs_ns']:.0f} ns at the end of holdover, past the "
            f"{limit:g} ns budget after {d['budgets'][0]['time_to_exceed_s']:g} s, and returns inside the {rec['band_ns']:g} ns band {rec['time_to_recover_s']:g} s after "
            f"restoration. Verdicts: baseline masks {ver['baseline_masks']}, holdover masks {ver['holdover_masks']}, holdover envelope {ver['holdover_envelope']}, "
            f"recovery {ver['recovery']}. Measured against the mask, not an approval. The times are the operator's statement, not verified by Kshana. {advisory_of(None)}")
    F = Fig(t, d, "Timing and holdover · measured against the mask", "Holdover, scored.",
            f"{T1 / 60:.0f} min · {d['record']['n_samples']} samples", [("kshana", "b"), ("holdover-test", "n"), ("·", "n"), ("scenarios/holdover-test-example.toml", "n")],
            400, desc, "A holdover test against the ITU-T masks",
            [("adv", advisory_of(None)),
             ("note", "The record in the bundled example is made up. The words are 'measured against the mask': no verdict here is an "
                      "approval. The times GNSS was removed and restored are the operator's statement, not verified by Kshana.")],
            f"Engine v{v} · scenarios/holdover-test-example.toml · scenario hash {d['scenario_hash'][:12]} · record sha256 {d['record']['series_sha256'][:12]} · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 40
    y0, h = F.top + 22, 230
    ymax = max(max(te), limit) * 1.1
    ymin = min(min(te), -10)

    def X(tt):
        return lx + tt / T1 * lw

    def Y(val):
        return y0 + h - (val - ymin) / (ymax - ymin) * h

    F.label(F.wx + 20, y0, "Time error", "ns · from the record")
    for a, b, key, name in ((0, tst["gnss_removed_s"], "lime", "BASELINE"), (tst["gnss_removed_s"], tst["gnss_restored_s"], "amber", "HOLDOVER"),
                            (tst["gnss_restored_s"], T1, "cyan", "RECOVERY")):
        s.rect(X(a), y0, X(b) - X(a), h, fill=g.soft(t, key, t["panel"], 0.10))
        s.text(name, (X(a) + X(b)) / 2, y0 + 16, 10.5, t[key], "mono", 500, anchor="middle", ls=0.08)
    for val in g.nice_ticks(ymin, ymax, 5):
        s.line(lx, Y(val), lx + lw, Y(val), g.line(t, 0, t["panel"]), 1)
        s.text(f"{val:g}", lx - 10, Y(val) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.line(lx, Y(limit), lx + lw, Y(limit), t["coral"], 1.2, dash="5 4")
    s.line(lx, Y(-limit), lx + lw, Y(-limit), t["coral"], 1.2, dash="5 4") if -limit > ymin else None
    s.text(f"budget {limit:g} ns", lx + lw - 8, Y(limit) - 6, 10.5, t["coral"], "mono", 500, anchor="end")
    s.poly([(X(a), Y(b)) for a, b in zip(ts, te)], stroke=t["ink"], sw=1.6)
    g.time_axis(s, t, X, y0 + h + 24, T1, 300)
    cx, cy = lx, y0 + h + 50
    for lab, val in (("baseline masks", ver["baseline_masks"]), ("holdover masks", ver["holdover_masks"]),
                     ("holdover envelope", ver["holdover_envelope"]), ("recovery", ver["recovery"])):
        key = "lime" if val in ("PASS", "RECOVERED") else "coral"
        cx += g.chip(s, t, cx, cy, f"{lab} {val}", t[key]) + 12
    return s


# --------------------------------------------------------------------------------------
# 5. Standards packs
# --------------------------------------------------------------------------------------


def standards_fig(t, packs, v):
    n_rows = [len(p["tests"]) for p in packs]
    rows_max = max(n_rows)
    sm = {k: sum(p["summary"][k] for p in packs) for k in ("met", "not_met", "needs_input")}
    desc = (f"Every test of the three scored standards packs, from real runs of engine v{v} (`kshana standards-pack run`): "
            + "; ".join(f"{p['pack']}: {p['summary']['met']} met, {p['summary']['not_met']} not met, {p['summary']['needs_input']} need an input" for p in packs)
            + f". In all, {sm['met']} met, {sm['not_met']} not met and {sm['needs_input']} need an input the engine does not have (a receiver log or equipment documentation). "
              "Each bar was stated before the run; a miss is kept as a miss. A met bar says a modelled scenario met a stated bar, nothing about a product. "
              "The packs support evidence for the rows they cite; they are not an assessment. " + advisory_of(packs[0]))
    F = Fig(t, packs, "Standards packs · supports evidence for", "Bars stated first, results kept.",
            f"{sum(n_rows)} tests · 3 packs · MODELLED", [("kshana", "b"), ("standards-pack run", "n"), ("·", "n"), ("dhs-rpcf  imo-circ-1575  icao-doc9849-appf", "n")],
            96 + 40 * rows_max, desc, "The standards packs, test by test",
            [("adv", advisory_of(packs[0])),
             ("note", "A MET bar says a modelled scenario met a bar stated before the run; a NOT MET is kept and pinned by a test. NEEDS INPUT means the test "
                      "needs a receiver log or equipment documentation, which a scenario does not have. The packs support evidence for the rows they cite; "
                      "none is an assessment or an approval.")],
            f"Engine v{v} · kshana standards-pack run <id> --json · {sm['met']} met, {sm['not_met']} not met, {sm['needs_input']} need input · MODELLED, advisory")
    s = F.s
    colw = (F.ww - 48 - 2 * 16) / 3
    for i, p in enumerate(packs):
        x0 = F.wx + 24 + i * (colw + 16)
        y = F.top + 28
        s.text(p["pack"], x0, y, 13, t["cyan"], "mono", 500)
        pm = p["summary"]
        s.text(f"{pm['met']} met · {pm['not_met']} not met · {pm['needs_input']} input", x0 + colw, y, 11, t["ink3"], "mono", anchor="end")
        y += 14
        for tst in p["tests"]:
            key = STATUS_KEY[tst["status"]]
            s.rect(x0, y, colw, 34, fill=g.soft(t, key, t["panel"], 0.10), stroke=g.line(t, 0, t["panel"]), r=6)
            s.rect(x0, y, 4, 34, fill=t[key], r=2)
            s.text(tst["id"], x0 + 14, y + 14, 11, t["ink"], "mono", 500)
            s.text(tst["status"], x0 + colw - 10, y + 14, 10.5, t[key], "mono", 500, anchor="end", ls=0.06)
            bars = tst.get("bars") or []
            if bars and isinstance(bars[0]["measured"], (int, float)) and not isinstance(bars[0]["measured"], bool):
                b = bars[0]
                s.text(f"measured {fmt_g(b['measured'])} {b['op']} {fmt_g(b['expected'])}", x0 + 14, y + 28, 10.5, t["ink3"], "mono")
            else:
                s.text(g.fit_text(tst["title"], colw - 28, 10.5, "sans"), x0 + 14, y + 28, 10.5, t["ink3"], "sans")
            y += 40
    return s


# --------------------------------------------------------------------------------------
# 6. LunaNet AFS
# --------------------------------------------------------------------------------------


def afs_fig(t, d, v):
    bars = d["bars"]
    n_met = sum(1 for b in bars if b["status"] == "MET")
    desc = (f"The LunaNet AFS code generator checked against the printed columns of the specification, from a real run of engine v{v} "
            f"(`kshana lunanet-afs-check spec`, pinned to {d['pin']}). {n_met} of {len(bars)} checks are met; "
            + "; ".join(f"{b['bar']} is NOT MET ({b['matched']} of {b['total']} matched)" for b in bars if b["status"] != "MET")
            + f". It checks a symbol stream against one edition of a published specification and says nothing about any LunaNet node or service. {d['advisory']}")
    rows = len(bars)
    F = Fig(t, d, "LunaNet AFS · code and message checks", "Checked against the printed columns.",
            f"{n_met} of {rows} met · pinned", [("kshana", "b"), ("lunanet-afs-check spec", "n"), ("·", "n"), (g.fit_text(str(d["pin"]), 420, 13, "mono"), "n")],
            96 + 38 * rows, desc, "LunaNet AFS checks",
            [("adv", d["advisory"]),
             ("note", "A NOT MET is kept and pinned by a test: the specification's own table prints one value that disagrees with its own construction "
                      "(see docs/LUNANET-AFS.md). The check supports evidence for the generator against that edition; it says nothing about a LunaNet node.")],
            f"Engine v{v} · kshana lunanet-afs-check spec --json · {n_met} of {rows} met")
    s = F.s
    x0, bw = F.wx + 24, F.ww - 48
    y = F.top + 20
    for b in bars:
        key = STATUS_KEY[b["status"]]
        s.rect(x0, y, bw, 32, fill=g.soft(t, key, t["panel"], 0.10), stroke=g.line(t, 0, t["panel"]), r=6)
        s.rect(x0, y, 4, 32, fill=t[key], r=2)
        s.text(b["bar"], x0 + 16, y + 21, 12, t["ink"], "mono", 500)
        s.text(g.fit_text(b["claim"], bw - 330, 12, "sans"), x0 + 70, y + 21, 12, t["ink2"], "sans")
        frac = b["matched"] / b["total"] if b["total"] else 0
        bx = x0 + bw - 250
        s.rect(bx, y + 11, 110, 10, fill=g.soft(t, "ink4", t["panel"], 0.25), r=5)
        s.rect(bx, y + 11, 110 * frac, 10, fill=t[key], r=5)
        s.text(f"{b['matched']}/{b['total']}", bx + 120, y + 21, 11, t["ink3"], "mono")
        s.text(b["status"], x0 + bw - 14, y + 21, 10.5, t[key], "mono", 500, anchor="end", ls=0.06)
        y += 38
    return s


# --------------------------------------------------------------------------------------
# 7. kshana-bench
# --------------------------------------------------------------------------------------


def bench_fig(t, res, v):
    items = sorted(((k.replace(".result.json", "").replace("d-test-", ""), r["metrics"]) for k, r in res.items()), key=lambda kv: -kv[1]["auc_in"])
    tol = items[0][1]["optimism_tol"]
    any_opt = any(m["optimistic"] for _, m in items)
    first = next(iter(res.values()))
    desc = (f"The built-in baselines of kshana-bench task D (the optimism gap) on the test split, from a real run of engine v{v} (`kshana bench baseline`). "
            "Each bar pair is the area under the ROC curve on the in-distribution cases and on the shifted cases; the gap between them is the optimism gap, "
            f"against a tolerance of {tol:g}. " + "; ".join(f"{n}: {m['auc_in']:.3f} and {m['auc_out']:.3f} (gap {m['optimism_gap']:.3f})" for n, m in items)
            + ". The labels are generative-model labels of a synthetic corpus, never field data: MODELLED. " + first["notice"])
    F = Fig(t, res, "kshana-bench · task D, optimism gap", "Baselines, shifted.",
            f"test split · {len(items)} baselines · synthetic corpus", [("kshana", "b"), ("bench baseline", "n"), ("·", "n"), ("--task d --split test", "n")],
            110 + 54 * len(items), desc, "kshana-bench baselines on task D",
            [("adv", first["notice"]),
             ("note", "The corpus is a parameter-grounded generative model, never field or IQ data, so an AUC here is an AUC over model-derived labels: MODELLED. "
                      "It scores submissions; it is not a ranking of receivers.")],
            f"Engine v{v} · kshana bench baseline --task d --split test · spec {first['spec_version']} · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 200

    def X(a):
        return lx + (a - 0.5) / 0.5 * lw

    y = F.top + 20
    for val in (0.5, 0.6, 0.7, 0.8, 0.9, 1.0):
        s.line(X(val), y, X(val), y + 54 * len(items) - 8, g.line(t, 0, t["panel"]), 1)
        s.text(f"{val:g}", X(val), y + 54 * len(items) + 10, 10.5, t["ink3"], "mono", anchor="middle")
    s.text("area under the ROC curve", F.wx + 24, y + 54 * len(items) + 10, 10.5, t["ink3"], "mono")
    for name, m in items:
        s.text(name, F.wx + 24, y + 20, 13, t["ink"], "mono", 500)
        s.text("in distribution", lx - 10, y + 14, 10, t["ink3"], "mono", anchor="end")
        s.text("shifted", lx - 10, y + 32, 10, t["ink3"], "mono", anchor="end")
        s.rect(lx, y + 4, X(m["auc_in"]) - lx, 14, fill=g.soft(t, "cyan", t["panel"], 0.85), r=3)
        s.rect(lx, y + 22, X(m["auc_out"]) - lx, 14, fill=g.soft(t, "magenta", t["panel"], 0.85), r=3)
        key = "coral" if m["optimistic"] else "lime"
        g.chip(s, t, F.wx + F.ww - 190, y + 6, f"gap {m['optimism_gap']:.3f}" + (" optimistic" if m["optimistic"] else ""), t[key])
        y += 54
    return s


# --------------------------------------------------------------------------------------
# 8. Exporters
# --------------------------------------------------------------------------------------


def export_fig(t, d, v):
    res = d["result"]
    prom = [ln for ln in d["prom"].splitlines() if ln and not ln.startswith("# HELP")]
    prom = [ln for ln in prom if not ln.startswith("# TYPE")]
    cef = d["cef"].strip().splitlines()[-1]
    leef = d["leef"].strip().splitlines()[-1]
    # the syslog header carries the wall-clock time of the run; the figure shows the message from the vendor field on
    strip = lambda ln: ln[ln.index("CEF:") if "CEF:" in ln else ln.index("LEEF:"):]
    cef, leef = strip(cef), strip(leef)
    score = next((ln.split()[-1] for ln in prom if ln.startswith("kshana_trust_score ")), "?")
    desc = (f"One trust result in three export formats, from real runs of engine v{v} (`kshana trust-telemetry`) on examples/maritime-trust: "
            f"Prometheus text exposition (the latest trust score is {score} and the untrusted band is the one set), and the last CEF and LEEF messages. "
            "The command publishes nothing unless given a destination, holds no credentials, and transmits no radio signal. " + advisory_of(res))
    lines_p = prom[:14]
    F = Fig(t, d, "Exporters · trust telemetry", "One result, three dialects.",
            "maritime-trust · last epoch", [("kshana", "b"), ("trust-telemetry", "n"), ("·", "n"), ("--print-metrics  --print-syslog", "n")],
            130 + 22 * (len(lines_p) + 1), desc, "Trust telemetry as Prometheus, CEF and LEEF",
            [("adv", advisory_of(res)),
             ("note", "The result is from the made-up maritime log in examples/maritime-trust. The syslog header (it carries the time of the run) is cut; "
                      "the message from the vendor field on is shown as printed. The command publishes only to a destination you give it, and holds no credentials.")],
            f"Engine v{v} · trust-telemetry on examples/maritime-trust · scenario hash {res['scenario_hash'][:12]} · MODELLED, advisory")
    s = F.s
    pw = (F.ww - 48 - 16) / 2
    x0 = F.wx + 24
    g.glass(s, t, x0, F.top + 16, pw, F.wh - (F.top - F.wy) - 32, r=10, fill=t["panel2"])
    s.text("PROMETHEUS", x0 + 16, F.top + 40, 11, t["cyan"], "mono", 500, ls=0.1)
    y = F.top + 64
    for ln in lines_p:
        s.text(g.fit_text(ln, pw - 32, 11.5, "mono"), x0 + 16, y, 11.5, t["ink2"], "mono")
        y += 22
    x1 = x0 + pw + 16
    for label, text, top_off in (("CEF", cef, 0), ("LEEF 2.0", leef, 1)):
        hh = (F.wh - (F.top - F.wy) - 32 - 16) / 2
        yy = F.top + 16 + top_off * (hh + 16)
        g.glass(s, t, x1, yy, pw, hh, r=10, fill=t["panel2"])
        s.text(label, x1 + 16, yy + 24, 11, t["cyan"], "mono", 500, ls=0.1)
        ln_y = yy + 48
        for part in g.wrap(text.replace("|", "| ").replace("^", "^ "), pw - 32, 11.5, "mono"):
            if ln_y > yy + hh - 12:
                break
            s.text(part, x1 + 16, ln_y, 11.5, t["ink2"], "mono")
            ln_y += 20
    return s


# --------------------------------------------------------------------------------------
# 9. Optical link margin against time
# --------------------------------------------------------------------------------------


def optical_fig(t, d, v):
    site = d["sites"][0]
    ts = site["timeseries"]
    n, step = ts["steps"], ts["step_s"]
    T1 = (n - 1) * step
    re_ = ts["realised"]
    desc = (f"One seeded realisation of the link margin of the site '{site['name']}' over {ts['duration_h']:g} h, from a real run of engine v{v} on "
            f"scenarios/optical-atmosphere-network.toml (seed {ts['seed']}, a step of {step:g} s). The margin falls below zero during cloud episodes; "
            f"in this draw the link is up {re_['availability_pct']:.1f} % of the time, with {re_['outages']} outages and a longest outage of {re_['longest_outage_h']:.1f} h. "
            f"The inputs are illustrative, the series is one draw from the model and not the climate, and it differs from the statistical availability "
            f"({site['availability_pct']:.1f} %) by the sampling error of the draw. {d['advisory']}")
    F = Fig(t, d, "Optical link margin against time", "One draw of the weather.",
            f"{ts['duration_h']:g} h · {step:g} s steps · seed {ts['seed']}", [("kshana", "b"), ("optical-atmosphere", "n"), ("·", "n"), ("scenarios/optical-atmosphere-network.toml", "n")],
            370, desc, "Optical link margin against time for one site",
            [("adv", d["advisory"]),
             ("note", "ILLUSTRATIVE cloud climate: one seeded draw from the model, not the climate and not a measurement. "
                      "Its availability differs from the statistical one by the sampling error of the draw.")],
            f"Engine v{v} · scenarios/optical-atmosphere-network.toml, site {site['name']} · scenario sha256 {sha256_file('scenarios/optical-atmosphere-network.toml')[:12]} · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 40
    y0, h = F.top + 22, 200
    m = ts["margin_db"]
    lo, hi = -40.0, max(m) * 1.05  # deep cloud episodes fall far below; the axis is clipped at -40 dB

    def X(i):
        return lx + i / (n - 1) * lw

    def Y(val):
        return y0 + h - (max(min(val, hi), lo) - lo) / (hi - lo) * h

    F.label(F.wx + 20, y0, "Link margin", f"dB · {site['name']}")
    for val in g.nice_ticks(lo, hi, 4):
        s.line(lx, Y(val), lx + lw, Y(val), g.line(t, 0, t["panel"]), 1)
        s.text(f"{val:g}", lx - 10, Y(val) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.line(lx, Y(0), lx + lw, Y(0), t["coral"], 1.2, dash="5 4")
    s.text("below 0 dB the link is down; axis clipped at -40 dB", lx + lw, y0 + h + 24 + 24, 10.5, t["ink3"], "mono", anchor="end")
    for a, b in spans([not u for u in ts["up"]], list(range(n))):
        s.rect(X(a), y0, max(X(b + 1) - X(a), 1.5), h, fill=g.soft(t, "coral", t["panel"], 0.14))
    s.poly([(X(i), Y(val)) for i, val in enumerate(m)], stroke=t["cyan"], sw=1.2)
    g.time_axis(s, t, lambda sec: lx + sec / T1 * lw, y0 + h + 24, T1, 86400 * 2, unit_div=86400.0, unit="days")
    cx, cy = lx, y0 + h + 50
    for lab, val, key in (("up", f"{re_['availability_pct']:.1f} %", "lime"), ("cloud", f"{re_['cloud_fraction_pct']:.1f} %", "cyan"),
                          ("outages", f"{re_['outages']}", "amber"), ("longest", f"{re_['longest_outage_h']:.1f} h", "amber")):
        cx += g.chip(s, t, cx, cy, f"{lab} {val}", t[key]) + 12
    return s


# --------------------------------------------------------------------------------------
# 10. Space-user navigation (gnss-ssv)
# --------------------------------------------------------------------------------------

SSV_DOC_NOTE = ("MODELLED: a modelled study from stated inputs, not a measurement and not a service-volume claim for any system.")


def load_ssv_shell(run: Run) -> dict:
    return run.scenario("scenarios/gnss-ssv-shell.toml")


def load_ssv_heo(run: Run) -> dict:
    return run.scenario("scenarios/gnss-ssv-heo.toml")


def load_ssv_nav(run: Run) -> dict:
    return run.scenario("scenarios/gnss-ssv-nav-lunar.toml")


def load_ssv_formation(run: Run) -> dict:
    return run.scenario("scenarios/gnss-ssv-formation-heo.toml")


def load_ssv_booklet(run: Run) -> dict:
    d = ROOT / "xval" / "gnss-ssv"
    out = {}
    for key, fn in (("run1", "results-run1.json"), ("variant", "results-variant-glonass-table-4-2.json"), ("s7", "results-s7.json")):
        out[key] = json.loads((d / fn).read_text())
    return out


def ssv_shell_fig(t, d, v):
    sh = d["shell"]
    bands = d["bands"]
    n_rows = sum(len(b["groups"]) for b in bands)
    all_g = [g_ for b in bands for g_ in b["groups"]]
    comb = [(b["band"], next(x for x in b["groups"] if x["name"] == "combined")) for b in bands]
    desc = (f"Signal availability for a user on a sphere at {sh['altitude_km']:g} km altitude with a {sh['antenna']} antenna, from a real run of engine v{v} on "
            f"scenarios/gnss-ssv-shell.toml (a reduced run: {sh['grid_points']} users, {sh['duration_min'] / 1440:g} days, {sh['step_min']:g} min steps), at a "
            f"{d['cn0_min_dbhz']:g} dB-Hz threshold. For each constellation and band, two bars: the share of (user, epoch) pairs with at least one signal and with at least four. "
            + " ".join(f"Combined, {b.upper()}: {g_['at_least_1_pct']:.1f} % at least one, {g_['at_least_4_pct']:.1f} % at least four, longest outage below four signals {g_['max_outage_4_min']:g} min." for b, g_ in comb)
            + f" {SSV_DOC_NOTE} The reduced size is not the booklet comparison. {advisory_of(None)}")
    F = Fig(t, d, "Space-user navigation · shell mode", "Few signals, many constellations.",
            f"{sh['altitude_km']:g} km · {sh['antenna']} · {d['cn0_min_dbhz']:g} dB-Hz", [("kshana", "b"), ("gnss-ssv", "n"), ("·", "n"), ("scenarios/gnss-ssv-shell.toml", "n")],
            110 + 30 * n_rows + 30 * len(bands), desc, "GNSS signal availability on a shell above the constellations",
            [("adv", advisory_of(None)),
             ("note", f"A reduced run (a coarse grid and {sh['duration_min'] / 1440:g} days) that runs in seconds; the full-size comparison with the published booklet is a separate run and mostly NOT MET (see the booklet figure). {SSV_DOC_NOTE}")],
            f"Engine v{v} · scenarios/gnss-ssv-shell.toml · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 60

    def X(p):
        return lx + p / 100 * lw

    y = F.top + 18
    for val in (0, 25, 50, 75, 100):
        s.line(X(val), y, X(val), y + 30 * n_rows + 24 * len(bands), g.line(t, 0, t["panel"]), 1)
        s.text(f"{val}", X(val), y + 30 * n_rows + 24 * len(bands) + 12, 10.5, t["ink3"], "mono", anchor="middle")
    s.text("share of (user, epoch) pairs, %", F.wx + 24, y + 30 * n_rows + 24 * len(bands) + 12, 10.5, t["ink3"], "mono")
    for b in bands:
        s.text(b["band"].upper(), F.wx + 24, y + 14, 12, t["cyan"], "mono", 500)
        y += 24
        for g_ in b["groups"]:
            s.text(g_["name"], F.wx + 24, y + 17, 12.5, t["ink"], "mono", 500)
            s.rect(lx, y + 4, X(g_["at_least_1_pct"]) - lx, 10, fill=g.soft(t, "cyan", t["panel"], 0.85), r=3)
            s.rect(lx, y + 16, max(X(g_["at_least_4_pct"]) - lx, 1.5), 10, fill=g.soft(t, "magenta", t["panel"], 0.85), r=3)
            s.text(f"{g_['at_least_1_pct']:.1f} / {g_['at_least_4_pct']:.1f}", X(100) + 8, y + 20, 10.5, t["ink3"], "mono")
            y += 30
    gx, gy = lx, F.wy + F.wh - 22
    for lab, key in (("at least one signal", "cyan"), ("at least four signals", "magenta")):
        gx += g.legend_item(s, t, gx, gy, lab, lambda x, yy, k=key: s.rect(x, yy, 12, 12, fill=g.soft(t, k, t["panel"], 0.85), r=3)) + 22
    return s


def ssv_heo_fig(t, d, v):
    r = d["result"]
    b = r["bands"][0]
    ser = b["series"]
    T1 = ser[-1]["t_min"]
    thr = d["cn0_min_dbhz"]
    comb = next(x for x in b["groups"] if x["name"] == "combined") if any(x["name"] == "combined" for x in b["groups"]) else None
    ml = sum(x["main_lobe_links"] for x in b["groups"] if "main_lobe_links" in x)
    sl = sum(x["sidelobe_links"] for x in b["groups"] if "sidelobe_links" in x)
    desc = (f"Signals along one high Earth orbit (perigee {r['perigee_alt_km']:.0f} km, apogee {r['apogee_alt_km']:.0f} km, period {r['period_min'] / 60:.1f} h), from a real run of engine v{v} on "
            f"scenarios/gnss-ssv-heo.toml, band {b['band'].upper()}. Top: the best carrier-to-noise density among the signals in view, against the {thr:g} dB-Hz threshold. "
            f"Middle: the number of signals in view from all constellations, from {min(x['combined'] for x in ser)} to {max(x['combined'] for x in ser)} along the sampled points. "
            f"Of the links received, {ml} came through a main lobe and {sl} through sidelobes, using a labelled parametric stand-in pattern, not any system's measured pattern. "
            f"Median PDOP {b['pdop_median']:.0f}, 95th percentile {b['pdop_p95']:.0f}. {SSV_DOC_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Space-user navigation · trajectory mode", "Along a high orbit.",
            f"{r['epochs']} epochs · {T1 / 60:.0f} h sampled · {b['band'].upper()}", [("kshana", "b"), ("gnss-ssv", "n"), ("·", "n"), ("scenarios/gnss-ssv-heo.toml", "n")],
            400, desc, "Signals and C/N0 along a high Earth orbit",
            [("adv", advisory_of(None)),
             ("note", f"The sidelobe pattern is a labelled parametric stand-in, not any system's measured pattern, and it does not match the measured GPS panel patterns (booklet bar S7 NOT MET). The orbit is a two-body ellipse. {SSV_DOC_NOTE}")],
            f"Engine v{v} · scenarios/gnss-ssv-heo.toml · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 40

    def X(tt):
        return lx + tt / T1 * lw

    y0, h = F.top + 18, 100
    cn = [x["best_cn0_dbhz"] for x in ser]
    lo, hi = min(min(cn), thr) - 3, max(cn) + 3
    F.label(F.wx + 20, y0, "Best C/N0", f"dB-Hz · {b['band'].upper()}")

    def Y(val):
        return y0 + h - (val - lo) / (hi - lo) * h
    for val in g.nice_ticks(lo, hi, 3):
        s.line(lx, Y(val), lx + lw, Y(val), g.line(t, 0, t["panel"]), 1)
        s.text(f"{val:g}", lx - 10, Y(val) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.line(lx, Y(thr), lx + lw, Y(thr), t["coral"], 1.2, dash="5 4")
    s.text(f"threshold {thr:g}", lx + lw - 8, Y(thr) - 6, 10.5, t["coral"], "mono", 500, anchor="end")
    s.poly([(X(x["t_min"]), Y(x["best_cn0_dbhz"])) for x in ser], stroke=t["cyan"], sw=1.8)
    y1, h1 = y0 + h + 50, 100
    F.label(F.wx + 20, y1, "Signals in view", "all constellations")
    mx = max(x["combined"] for x in ser) * 1.1

    def Y1(val):
        return y1 + h1 - val / mx * h1
    for val in g.nice_ticks(0, mx, 3):
        s.line(lx, Y1(val), lx + lw, Y1(val), g.line(t, 0, t["panel"]), 1)
        s.text(f"{val:g}", lx - 10, Y1(val) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.line(lx, Y1(4), lx + lw, Y1(4), t["amber"], 1.1, dash="4 4")
    s.text("four signals", lx + lw - 8, Y1(4) - 6, 10.5, t["amber"], "mono", 500, anchor="end")
    s.poly([(X(x["t_min"]), Y1(x["combined"])) for x in ser], stroke=t["magenta"], sw=1.8)
    for x in ser:
        s.circle(X(x["t_min"]), Y1(x["combined"]), 2.6, fill=t["magenta"])
    g.time_axis(s, t, X, y1 + h1 + 24, T1, 240, unit_div=60.0, unit="h")
    return s


def ssv_nav_fig(t, d, v):
    r = d["result"]
    ser = r["series"]
    T1 = ser[-1]["t_min"]
    ph = {p["phase"]: p for p in r["phases"]}
    inside = next(p for k, p in ph.items() if k.startswith("inside"))
    above = next(p for k, p in ph.items() if k.startswith("above"))
    whole = ph["whole run"]
    desc = (f"An onboard nine-state filter on a transfer from low orbit toward the Moon, from a real run of engine v{v} on scenarios/gnss-ssv-nav-lunar.toml "
            f"({r['epochs']} epochs, {len(ser)} points drawn). On a log axis, the true position error and the filter's own one-sigma bound against time since the start. "
            f"Inside the GNSS orbits the position RMS is {inside['pos_rms_m']:.1f} m; above them it is {above['pos_rms_m']:.0f} m, with the final error {r['final_pos_err_m']:.0f} m "
            f"at {ser[-1]['altitude_km']:,.0f} km altitude with {ser[-1]['n_meas']} measurement. Mean normalised estimation error squared over the whole run is {whole['pos_nees_mean']:.1f} "
            f"(about 3 for a consistent position block). Truth and filter share their Sun and Moon stand-ins. {SSV_DOC_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Space-user navigation · navigation mode", "An onboard filter, to the Moon.",
            f"{T1 / 60:.0f} h · {r['epochs']} epochs", [("kshana", "b"), ("gnss-ssv", "n"), ("·", "n"), ("scenarios/gnss-ssv-nav-lunar.toml", "n")],
            420, desc, "Position error and filter bound on a transfer toward the Moon",
            [("adv", advisory_of(None)),
             ("note", f"A design study: no manoeuvres, no attitude, no multipath, and the truth shares its Sun and Moon stand-ins with the filter. {SSV_DOC_NOTE}")],
            f"Engine v{v} · scenarios/gnss-ssv-nav-lunar.toml · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 40
    y0, h = F.top + 18, 230
    vals = [x["pos_err_m"] for x in ser] + [x["pos_sigma_m"] for x in ser]
    lo_e, hi_e = math.floor(math.log10(max(min(vals), 0.1))), math.ceil(math.log10(max(vals)))

    def X(tt):
        return lx + tt / T1 * lw

    def Y(val):
        return y0 + h - (math.log10(max(val, 10 ** lo_e)) - lo_e) / (hi_e - lo_e) * h
    F.label(F.wx + 20, y0, "Position error", "m, log axis")
    for e in range(lo_e, hi_e + 1):
        s.line(lx, Y(10 ** e), lx + lw, Y(10 ** e), g.line(t, 0, t["panel"]), 1)
        s.text(f"{10 ** e:g}", lx - 10, Y(10 ** e) + 4, 10.5, t["ink3"], "mono", anchor="end")
    s.poly([(X(x["t_min"]), Y(x["pos_sigma_m"])) for x in ser], stroke=t["cyan"], sw=1.8, dash="6 4")
    s.poly([(X(x["t_min"]), Y(x["pos_err_m"])) for x in ser], stroke=t["magenta"], sw=2)
    for x in ser:
        s.circle(X(x["t_min"]), Y(x["pos_err_m"]), 2.6, fill=t["magenta"])
    g.time_axis(s, t, X, y0 + h + 24, T1, 240, unit_div=60.0, unit="h")
    gx, gy = lx, y0 + h + 52
    gx += g.legend_item(s, t, gx, gy, "true error", lambda x, yy: s.line(x, yy + 6, x + 14, yy + 6, t["magenta"], 2)) + 18
    gx += g.legend_item(s, t, gx, gy, "filter one-sigma bound", lambda x, yy: s.line(x, yy + 6, x + 14, yy + 6, t["cyan"], 2)) + 22
    for lab, val, key in (("below 20,000 km RMS", f"{inside['pos_rms_m']:.1f} m", "lime"), ("above RMS", f"{above['pos_rms_m']:.0f} m", "amber"),
                          ("NEES", f"{whole['pos_nees_mean']:.1f} (3 is consistent)", "cyan")):
        gx += g.chip(s, t, gx, gy - 17, f"{lab} {val}", t[key]) + 10
    return s


def ssv_formation_fig(t, d, v):
    fo = d["formation"]
    r = d["result"]
    whole = next(p for p in r["phases"] if p["phase"] == "whole run")
    deps = fo["deputies"]
    worst = max(max(x["rel_rms_from_absolute_m"], x["rel_rms_filter_m"]) for x in deps) * 1.2
    desc = (f"Relative navigation of {len(deps)} deputies around a chief on a high orbit, from a real run of engine v{v} on scenarios/gnss-ssv-formation-heo.toml "
            f"({fo['epochs']} epochs). For each deputy, two bars: the relative position RMS from subtracting the two independent absolute estimates, and from the relative filter on "
            f"single-differenced pseudoranges. " + " ".join(f"Baseline {x['baseline_km']:.1f} km: {x['rel_rms_from_absolute_m']:.1f} m and {x['rel_rms_filter_m']:.1f} m." for x in deps)
            + f" The absolute filter is not consistent here: mean normalised estimation error squared {whole['pos_nees_mean']:.0f} against about 3 for a consistent filter, so its stated "
              f"uncertainty is far too small. {SSV_DOC_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Space-user navigation · formation mode", "Relative, not just absolute.",
            f"{len(deps)} deputies · {fo['epochs']} epochs", [("kshana", "b"), ("gnss-ssv", "n"), ("·", "n"), ("scenarios/gnss-ssv-formation-heo.toml", "n")],
            330, desc, "Formation relative navigation, two estimators",
            [("adv", advisory_of(None)),
             ("note", f"The absolute filter is overconfident in this run (mean NEES {whole['pos_nees_mean']:.0f}, about 3 expected): its stated uncertainty cannot be relied on, whatever the RMS. {SSV_DOC_NOTE}")],
            f"Engine v{v} · scenarios/gnss-ssv-formation-heo.toml · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 120

    def X(val):
        return lx + val / worst * lw
    y = F.top + 22
    for val in g.nice_ticks(0, worst, 4):
        s.line(X(val), y, X(val), y + 70 * len(deps), g.line(t, 0, t["panel"]), 1)
        s.text(f"{val:g}", X(val), y + 70 * len(deps) + 12, 10.5, t["ink3"], "mono", anchor="middle")
    s.text("relative position RMS, m", F.wx + 24, y + 70 * len(deps) + 12, 10.5, t["ink3"], "mono")
    for x in deps:
        s.text(f"baseline {x['baseline_km']:.1f} km", F.wx + 24, y + 30, 13, t["ink"], "mono", 500)
        s.text(f"{x['common_signals_mean']:.0f} signals in common", F.wx + 24, y + 48, 11, t["ink3"], "mono")
        s.rect(lx, y + 8, X(x["rel_rms_from_absolute_m"]) - lx, 18, fill=g.soft(t, "amber", t["panel"], 0.85), r=3)
        s.text(f"{x['rel_rms_from_absolute_m']:.1f} m", X(x["rel_rms_from_absolute_m"]) + 8, y + 22, 11, t["ink2"], "mono")
        s.rect(lx, y + 32, X(x["rel_rms_filter_m"]) - lx, 18, fill=g.soft(t, "cyan", t["panel"], 0.85), r=3)
        s.text(f"{x['rel_rms_filter_m']:.1f} m", X(x["rel_rms_filter_m"]) + 8, y + 46, 11, t["ink2"], "mono")
        y += 70
    g.chip(s, t, lx, y + 30, f"chief absolute NEES {whole['pos_nees_mean']:.0f}: overconfident (about 3 is consistent)", t["coral"])
    gx, gy = lx, F.wy + F.wh - 22
    for lab, key in (("from the two absolute estimates", "amber"), ("relative filter, single differences", "cyan")):
        gx += g.legend_item(s, t, gx, gy, lab, lambda x, yy, k=key: s.rect(x, yy, 12, 12, fill=g.soft(t, k, t["panel"], 0.85), r=3)) + 22
    return s


def ssv_booklet_fig(t, d, v):
    r1, var, s7 = d["run1"]["bars"], d["variant"]["bars"], d["s7"]["bars"]["S7"]

    def cells(b):
        sc = [c for c in b["cells"] if c.get("scored", True)]
        return sum(1 for c in sc if c["pass"]), len(sc)
    vword = lambda b: "MET" if b["verdict"]["met"] else "NOT MET"
    rows = [(k, r1[k]["statement"], *cells(r1[k]), vword(r1[k]), *cells(var[k])) for k in r1]
    n7 = s7["patterns"] if isinstance(s7.get("patterns"), int) else len(s7["patterns"])
    desc = ("The recorded comparison of the space-user availability model with the public Space Service Volume booklet, from the committed results of the pre-registered run "
            "(xval/gnss-ssv/results-run1.json, written by the ssv_booklet_check example of engine " f"v{v}). Bar by bar, the cells within tolerance: "
            + "; ".join(f"{k} {a} of {n} ({vd})" for k, _, a, n, vd, _, _ in rows) + f"; S7 0 of {n7} panel patterns (NOT MET). "
            "Only S0 and S6 are met under the pre-registered reading. A diagnostic variant that uses the booklet's other GLONASS angles brings S1, S2 and S4 to every cell, "
            "but does not replace the run of record. No ledger row is VALIDATED. " + advisory_of(None))
    F = Fig(t, d, "Space-user navigation · against the booklet", "Mostly NOT MET, and said so.",
            "pre-registered run 1 · committed results", [("kshana", "b"), ("ssv_booklet_check", "n"), ("·", "n"), ("xval/gnss-ssv/results-run1.json", "n")],
            130 + 44 * (len(rows) + 1), desc, "gnss-ssv against the Space Service Volume booklet",
            [("adv", advisory_of(None)),
             ("note", "The booklet is itself a simulation. The bars were fixed before the run and are not loosened; the diagnostic variant (the booklet's other GLONASS angles) is shown "
                      "as a thin outline bar and does not replace run 1. No row is VALIDATED.")],
            "Drawn from the committed results of the pre-registered run (xval/gnss-ssv/results-*.json) · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 150, F.ww - 150 - 260
    y = F.top + 18
    for k, stmt, a, n, vd, va, vn in rows + [("S7", s7["statement"], n7 - s7["verdict"]["failed_cells"], n7, vword(s7), None, None)]:
        key = "lime" if vd == "MET" else "coral"
        s.text(k, F.wx + 24, y + 22, 14, t["ink"], "mono", 500)
        s.rect(lx, y + 6, lw, 14, fill=g.soft(t, "ink4", t["panel"], 0.2), r=4)
        s.rect(lx, y + 6, max(lw * a / n, 0), 14, fill=t[key], r=4)
        if va is not None:
            s.rect(lx, y + 24, lw * va / vn, 6, fill="none", stroke=t["cyan"], sw=1.2, r=3)
        s.text(f"{a} of {n}", lx + lw + 12, y + 18, 11.5, t["ink2"], "mono")
        s.text(vd, F.wx + F.ww - 24, y + 18, 11, t[key], "mono", 500, anchor="end", ls=0.06)
        s.text(g.fit_text(stmt, F.ww - 150 - 260 + 120, 10.5, "sans"), lx, y + 42, 10.5, t["ink3"], "sans")
        y += 44
    g.chip(s, t, lx, y + 6, "outline bar: diagnostic variant with the booklet's other GLONASS angles; not the run of record", t["cyan"])
    return s


# --------------------------------------------------------------------------------------
# 11. Lunar infrastructure (lunar-infrastructure)
# --------------------------------------------------------------------------------------

LUNAR_NOTE = "MODELLED: a restricted three-body model with stated simplifications and illustrative inputs, not a measurement of any lunar quantity."


def load_lunar_od(run: Run) -> dict:
    return {"nominal": run.scenario("scenarios/lunar-infrastructure-od-consistency.toml"),
            "error": run.scenario("scenarios/lunar-infrastructure-od-consistency-model-error.toml")}


def load_lunar_carrier(run: Run) -> dict:
    # The scored configuration (three arcs, 400 draws) takes about eight minutes; its result is committed.
    full = json.loads((ROOT / "tests" / "fixtures" / "lunar_infra" / "phase_full_run.json").read_text())
    return {"full": full, "quick": run.scenario("scenarios/lunar-infrastructure-carrier-phase.toml")}


def load_lunar_frame(run: Run) -> dict:
    return run.scenario("scenarios/lunar-infrastructure-frame-coestimation.toml")


def load_lunar_tie(run: Run) -> dict:
    return run.scenario("scenarios/lunar-infrastructure-space-tie.toml")


def load_lunar_geodesy(run: Run) -> dict:
    return run.scenario("scenarios/lunar-infrastructure-geodesy-sensitivity.toml")


def lunar_od_fig(t, d, v):
    a, b = d["nominal"], d["error"]
    ca, cb = a["consistency"], b["consistency"]
    desc = (f"Consistency of an onboard Earth-GNSS orbit determination in a near-rectilinear halo orbit with an independent ground orbit determination, from real runs of "
            f"engine v{v} on scenarios/lunar-infrastructure-od-consistency.toml and the model-error variant ({ca['trials']} trials each). Mean normalised difference q is "
            f"{ca['mean_q']:.2f} with no model error and {cb['mean_q']:.2f} with an injected acceleration error of {cb['model_error_accel_m_s2']:g} m/s2, against {ca['expected_mean_q']:g} expected: the two "
            f"orbit solutions are consistent (bar C1 MET). The share of trials above the 95 % point is {ca['fraction_exceeding_95']:.3f} and {cb['fraction_exceeding_95']:.3f}; the bar for detecting the injected error "
            f"was at least 0.5, so it is NOT MET (C3): the onboard solution is known to about {a['gnss_estimate']['position_sigma_m']:.0f} m against {a['ground_estimate']['position_sigma_m']:.0f} m for the ground one, "
            f"so a ten-metre displacement hides inside its covariance. {LUNAR_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Lunar infrastructure · orbit-determination consistency", "Consistent, and blind to a small error.",
            f"{ca['trials']} trials · 3-day arc · NRHO", [("kshana", "b"), ("lunar-infrastructure", "n"), ("·", "n"), ("study od-consistency", "n")],
            290, desc, "Orbit-determination consistency with and without an injected model error",
            [("adv", advisory_of(None)),
             ("note", f"C1 is MET and C3 is NOT MET (pinned by a test): the injected error is not detected at this size. {LUNAR_NOTE}")],
            f"Engine v{v} · scenarios/lunar-infrastructure-od-consistency*.toml · MODELLED, advisory")
    s = F.s
    panels = [("mean q", [(("no model error", ca["mean_q"]), "cyan"), (("3e-10 m/s2 injected", cb["mean_q"]), "magenta")], 8.0, ca["expected_mean_q"], "expected 6", "{:.2f}"),
              ("share above the 95 % point", [(("no model error", ca["fraction_exceeding_95"]), "cyan"), (("3e-10 m/s2 injected", cb["fraction_exceeding_95"]), "magenta")], 1.0, 0.5, "bar 0.5", "{:.3f}"),
              ("position sigma, m", [(("onboard GNSS", a["gnss_estimate"]["position_sigma_m"]), "amber"), (("ground range and Doppler", a["ground_estimate"]["position_sigma_m"]), "lime")], 400.0, None, "", "{:.0f}")]
    pw = (F.ww - 48 - 2 * 24) / 3
    for i, (title, bars, mx, ref, reflab, fmt) in enumerate(panels):
        x0 = F.wx + 24 + i * (pw + 24)
        y = F.top + 28
        s.text(title, x0, y, 13, t["ink"], "sans", 500)
        for j, ((lab, val), key) in enumerate(bars):
            yy = y + 28 + j * 66
            s.text(lab, x0, yy, 11, t["ink3"], "mono")
            s.rect(x0, yy + 8, pw, 18, fill=g.soft(t, "ink4", t["panel"], 0.2), r=4)
            s.rect(x0, yy + 8, max(pw * min(val / mx, 1), 2), 18, fill=g.soft(t, key, t["panel"], 0.85), r=4)
            s.text(fmt.format(val), x0 + pw * min(val / mx, 1) + 8 if val / mx < 0.8 else x0 + pw - 8, yy + 22, 11.5, t["ink"], "mono", 500, anchor="start" if val / mx < 0.8 else "end")
        if ref is not None:
            rx = x0 + pw * ref / mx
            s.line(rx, y + 30, rx, y + 28 + 2 * 66 - 20, t["coral"] if reflab.startswith("bar") else t["lime"], 1.4, dash="4 3")
            s.text(reflab, rx, y + 28 + 2 * 66 - 6, 10.5, t["coral"] if reflab.startswith("bar") else t["lime"], "mono", 500, anchor="middle")
    return s


def lunar_carrier_fig(t, d, v):
    arcs = d["full"]["arcs"]
    q = d["quick"]
    desc = (f"Carrier-phase integer ambiguity fixing between lunar surface stations and an orbiter, from the committed result of the scored run of engine v{v} "
            f"(tests/fixtures/lunar_infra/phase_full_run.json: {len(arcs)} arc lengths, a Monte Carlo of 400 draws each, written by scenarios/carrier-phase-scored.toml). "
            + "; ".join(f"{a['arc_days']:g} day: success {100 * a['monte_carlo_success_rate']:.1f} % (standard error {100 * a['monte_carlo_standard_error']:.1f} %), {a['double_difference_ambiguities']} ambiguities, orbiter position sigma "
                         f"{a['orbiter_position_sigma_float_m']:.1f} m float and {a['orbiter_position_sigma_fixed_m']:.1f} m fixed" for a in arcs)
            + ". Integer fixing is not achieved: success stays between 1 % and 3 % at 25 dBi, and at the registered 12 dBi the problem cannot be formed. "
              f"{LUNAR_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Lunar infrastructure · carrier phase", "Integers not fixed.",
            f"{len(arcs)} arc lengths · 400 draws each", [("kshana", "b"), ("lunar-infrastructure", "n"), ("·", "n"), ("study carrier-phase", "n")],
            340, desc, "Integer fixing success rate against arc length",
            [("adv", advisory_of(None)),
             ("note", "Drawn from the committed result of the scored run (about eight minutes to reproduce); the bundled quick scenario runs two short arcs with ten draws. "
                      f"Integer fixing is not achieved at the registered inputs. {LUNAR_NOTE}")],
            f"Engine v{v} · tests/fixtures/lunar_infra/phase_full_run.json (scored run) · MODELLED, advisory")
    s = F.s
    half = (F.ww - 48 - 40) / 2
    x0 = F.wx + 24
    # left: success rate against arc length
    y0, h = F.top + 52, 170
    s.text("Integer fixing success, %", x0, F.top + 28, 13, t["ink"], "sans", 500)
    lx, lw = x0 + 40, half - 60
    amax = max(a["arc_days"] for a in arcs) * 1.15
    ymax = 10.0

    def X(dd):
        return lx + dd / amax * lw

    def Y(p):
        return y0 + h - p / ymax * h
    for p in (0, 2, 4, 6, 8, 10):
        s.line(lx, Y(p), lx + lw, Y(p), g.line(t, 0, t["panel"]), 1)
        s.text(f"{p}", lx - 8, Y(p) + 4, 10.5, t["ink3"], "mono", anchor="end")
    for a in arcs:
        p, se = 100 * a["monte_carlo_success_rate"], 100 * a["monte_carlo_standard_error"]
        s.line(X(a["arc_days"]), Y(max(p - se, 0)), X(a["arc_days"]), Y(p + se), t["ink3"], 1.4)
        s.circle(X(a["arc_days"]), Y(p), 5, fill=t["coral"])
        s.text(f"{a['arc_days']:g} d", X(a["arc_days"]), y0 + h + 18, 10.5, t["ink3"], "mono", anchor="middle")
    s.poly([(X(a["arc_days"]), Y(100 * a["monte_carlo_success_rate"])) for a in arcs], stroke=t["coral"], sw=1.6)
    s.text("arc length", lx + lw, y0 + h + 34, 10.5, t["ink3"], "mono", anchor="end")
    # right: orbiter position sigma float and fixed
    rx = x0 + half + 40
    s.text("Orbiter position sigma, m", rx, F.top + 28, 13, t["ink"], "sans", 500)
    mx = max(a["orbiter_position_sigma_float_m"] for a in arcs) * 1.1
    for i, a in enumerate(arcs):
        yy = F.top + 62 + i * 70
        s.text(f"{a['arc_days']:g} day", rx, yy + 10, 11.5, t["ink"], "mono", 500)
        for j, (key, lab, val) in enumerate((("amber", "float", a["orbiter_position_sigma_float_m"]), ("cyan", "if the integers were fixed", a["orbiter_position_sigma_fixed_m"]))):
            bx = rx + 70
            s.rect(bx, yy + j * 24 - 4, (half - 90) * val / mx, 16, fill=g.soft(t, key, t["panel"], 0.85), r=3)
            s.text(f"{val:.1f}  {lab}", bx + (half - 90) * val / mx + 8, yy + j * 24 + 9, 10.5, t["ink2"], "mono")
    return s


def lunar_frame_fig(t, d, v):
    names = ["t_x", "t_y", "t_z", "scale", "theta_x", "theta_y", "theta_z"]
    w, wo = d["with_orbiter_links"], d["without_orbiter_links"]
    desc = (f"Precision of the seven-parameter lunar datum (three translations, a scale and three rotations) from Earth-station ranging, with and without orbiter-to-surface-station ranges, "
            f"from a real run of engine v{v} on scenarios/lunar-infrastructure-frame-coestimation.toml. The Cramer-Rao sigma of the translations and rotations falls with the orbiter links "
            f"(for example t_z from {wo['crlb_sigma'][2]:.2f} m to {w['crlb_sigma'][2]:.3f} m); the smallest information eigenvalue rises {d['lambda_min_ratio']:.0f}-fold and the "
            f"CRLB trace falls to {100 * d['crlb_trace_ratio']:.1f} % (bar F3 MET). This assumes the orbit is known in the lunar axes, with its error carried by the orbiter range sigma of 1 m. "
            f"{LUNAR_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Lunar infrastructure · frame co-estimation", "Orbiter links pin the datum.",
            f"{len(names)} datum parameters · {w['observations']} observations", [("kshana", "b"), ("lunar-infrastructure", "n"), ("·", "n"), ("study frame-coestimation", "n")],
            130 + 44 * len(names), desc, "Lunar datum precision with and without orbiter links",
            [("adv", advisory_of(None)),
             ("note", f"The orbit is held known in the lunar axes; its error is carried by the orbiter range sigma. Cramer-Rao sigma is a lower bound, not an achieved accuracy. {LUNAR_NOTE}")],
            f"Engine v{v} · scenarios/lunar-infrastructure-frame-coestimation.toml · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 190, F.ww - 190 - 330
    lo, hi = -3, 0
    vals = w["crlb_sigma"] + wo["crlb_sigma"]
    lo, hi = math.floor(math.log10(min(vals))), math.ceil(math.log10(max(vals)))
    if hi == lo:
        hi += 1

    def X(val):
        return lx + (math.log10(val) - lo) / (hi - lo) * lw
    y = F.top + 18
    for e in range(lo, hi + 1):
        s.line(X(10 ** e), y, X(10 ** e), y + 44 * len(names), g.line(t, 0, t["panel"]), 1)
        s.text(f"{10 ** e:g}", X(10 ** e), y + 44 * len(names) + 14, 10.5, t["ink3"], "mono", anchor="middle")
    s.text("CRLB sigma, metres at the surface (log axis)", F.wx + 24, y + 44 * len(names) + 34, 10.5, t["ink3"], "mono")
    for i, nme in enumerate(names):
        yy = y + i * 44
        s.text(nme, F.wx + 24, yy + 24, 12.5, t["ink"], "mono", 500)
        s.rect(lx, yy + 4, X(wo["crlb_sigma"][i]) - lx, 14, fill=g.soft(t, "amber", t["panel"], 0.85), r=3)
        s.rect(lx, yy + 21, X(w["crlb_sigma"][i]) - lx, 14, fill=g.soft(t, "cyan", t["panel"], 0.85), r=3)
        s.text(f"{wo['crlb_sigma'][i]:.3g}", X(wo["crlb_sigma"][i]) + 8, yy + 16, 10.5, t["ink3"], "mono")
        s.text(f"{w['crlb_sigma'][i]:.3g}", X(w["crlb_sigma"][i]) + 8, yy + 33, 10.5, t["ink3"], "mono")
    cx = F.wx + F.ww - 250
    for k, (lab, key) in enumerate((("Earth stations only", "amber"), ("with orbiter links", "cyan"))):
        g.legend_item(s, t, cx, y + 14 + k * 24, lab, lambda x, yy, kk=key: s.rect(x, yy, 12, 12, fill=g.soft(t, kk, t["panel"], 0.85), r=3))
    g.chip(s, t, cx, y + 80, f"smallest eigenvalue x{d['lambda_min_ratio']:.0f}", t["lime"])
    g.chip(s, t, cx, y + 114, f"CRLB trace {100 * d['crlb_trace_ratio']:.1f} %", t["lime"])
    return s


def lunar_tie_fig(t, d, v):
    sw = d["arcs"][0]["sweep"]
    tech = d["technique_sigma_m"]
    ties = [x["local_tie_sigma_m"] for x in sw]
    ser = {k: [x["offsets"][k]["translation_sigma_m"][0] for x in sw] for k in ("slr_minus_gnss", "vlbi_minus_gnss", "slr_minus_vlbi")}
    floor = [x["floor_translation_sigma_m"] for x in sw]
    desc = (f"Precision of the offsets between laser ranging, VLBI and GNSS positions of one spacecraft, against the error of the ground local tie, from a real run of engine v{v} "
            f"on scenarios/lunar-infrastructure-space-tie.toml (one {d['arcs'][0]['arc_days']:g}-day arc, technique sigmas GNSS {tech['gnss']:g} m, VLBI {tech['vlbi']:g} m, laser {tech['slr']:g} m). "
            f"With a local tie from {ties[0] * 1000:g} mm to {ties[-1]:g} m, the laser-minus-GNSS translation sigma stays near {ser['slr_minus_gnss'][0]:.2f} m until the tie reaches 1 m: it is "
            f"limited by the measurement noise of the techniques, not by the local tie. The floor set by the tie alone is the square root of two times its sigma. {LUNAR_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Lunar infrastructure · space tie", "The local tie is not the limit.",
            f"1 arc · {d['arcs'][0]['epochs']} epochs", [("kshana", "b"), ("lunar-infrastructure", "n"), ("·", "n"), ("study space-tie", "n")],
            400, desc, "Inter-technique offset precision against the local tie",
            [("adv", advisory_of(None)),
             ("note", f"With the registered technique sigmas the offsets are limited by measurement noise; the local tie sets the floor only for near-perfect techniques. {LUNAR_NOTE}")],
            f"Engine v{v} · scenarios/lunar-infrastructure-space-tie.toml · MODELLED, advisory")
    s = F.s
    lx, lw = F.wx + 250, F.ww - 250 - 60
    y0, h = F.top + 18, 230
    lo_x, hi_x = math.log10(ties[0]), math.log10(ties[-1])
    allv = [x for k in ser for x in ser[k]] + floor
    lo_y, hi_y = math.floor(math.log10(min(allv))), math.ceil(math.log10(max(allv)))

    def X(val):
        return lx + (math.log10(val) - lo_x) / (hi_x - lo_x) * lw

    def Y(val):
        return y0 + h - (math.log10(val) - lo_y) / (hi_y - lo_y) * h
    F.label(F.wx + 20, y0, "Translation sigma", "m, x component, log axes")
    for e in range(lo_y, hi_y + 1):
        s.line(lx, Y(10 ** e), lx + lw, Y(10 ** e), g.line(t, 0, t["panel"]), 1)
        s.text(f"{10 ** e:g}", lx - 10, Y(10 ** e) + 4, 10.5, t["ink3"], "mono", anchor="end")
    for tv in ties:
        s.text(f"{tv:g}", X(tv), y0 + h + 18, 10.5, t["ink3"], "mono", anchor="middle")
    s.text("local tie sigma, m", lx + lw, y0 + h + 34, 10.5, t["ink3"], "mono", anchor="end")
    s.poly([(X(a), Y(b)) for a, b in zip(ties, floor)], stroke=t["ink3"], sw=1.4, dash="5 4")
    s.text("floor: sqrt(2) x local tie", X(ties[2]) + 10, Y(floor[2]) + 22, 10.5, t["ink3"], "mono")
    s.text("laser minus GNSS and VLBI minus GNSS nearly coincide", lx + 10, Y(2.5), 10.5, t["ink3"], "mono")
    for key, col, lab in (("slr_minus_gnss", "amber", "laser minus GNSS"), ("vlbi_minus_gnss", "magenta", "VLBI minus GNSS"), ("slr_minus_vlbi", "cyan", "laser minus VLBI")):
        pts = [(X(a), Y(b)) for a, b in zip(ties, ser[key])]
        s.poly(pts, stroke=t[col], sw=2)
        for px, py in pts:
            s.circle(px, py, 3.2, fill=t[col])
    gx, gy = lx, y0 + h + 62
    for key, lab in (("amber", "laser minus GNSS"), ("magenta", "VLBI minus GNSS"), ("cyan", "laser minus VLBI")):
        gx += g.legend_item(s, t, gx, gy, lab, lambda x, yy, kk=key: s.line(x, yy + 6, x + 14, yy + 6, t[kk], 2)) + 22
    return s


def lunar_geodesy_fig(t, d, v):
    fams = d["families"]
    order = ["llr", "orbiter", "gravimeter", "clock"]
    names = {"llr": "laser ranging", "orbiter": "orbiter tracking", "gravimeter": "surface gravimeter", "clock": "surface clock"}
    par = ["h2", "k2", "l2"]
    rel = d["crlb_sigma_over_nominal_h2_k2_l2"]
    ad = d["adding_a_family"]
    desc = (f"Which observable family is sensitive to the lunar Love numbers h2, k2 and l2, from a real run of engine v{v} on scenarios/lunar-infrastructure-geodesy-sensitivity.toml. "
            "Each cell is the RMS partial derivative of a family's observations with respect to a parameter, in that family's own units (so cells are compared across a row, not down a column); a dash means the family has no sensitivity. "
            + " ".join(f"{names[f]}: " + ", ".join(f"{p} {'none' if fams[f]['rms_partial'][i] == 0 else format(fams[f]['rms_partial'][i], '.2g')}" for i, p in enumerate(par)) + "." for f in order)
            + f" With all four families, the Cramer-Rao sigma is {100 * rel[0]:.2f} % of nominal h2, {100 * rel[1]:.2f} % of k2 and {100 * rel[2]:.2f} % of l2. Adding a family never lowered the smallest eigenvalue "
              f"({ad['lambda_min_not_smaller']} of {ad['pairs_checked']} additions), but the trace of the pseudo-inverse was no larger in only {ad['trace_not_larger']} of {ad['pairs_checked']}: that half of bar G3 is NOT MET. "
              f"The orbiter family sees the line-of-sight integral of the k2 acceleration, an upper-end figure. {LUNAR_NOTE} {advisory_of(None)}")
    F = Fig(t, d, "Lunar infrastructure · geodesy sensitivity", "Who sees h2, k2 and l2.",
            f"{sum(f['rows'] for f in fams.values()):,} observations · 4 families", [("kshana", "b"), ("lunar-infrastructure", "n"), ("·", "n"), ("study geodesy-sensitivity", "n")],
            190 + 56 * len(order), desc, "Lunar Love-number sensitivity by observable family",
            [("adv", advisory_of(None)),
             ("note", f"G3 is NOT MET in its trace half: adding a family never lowered the smallest information eigenvalue, but the pseudo-inverse trace rose in {ad['pairs_checked'] - ad['trace_not_larger']} of "
                      f"{ad['pairs_checked']} additions, each time because the added family raised the rank. h2 and l2 are linearisation points, not verified values. {LUNAR_NOTE}")],
            f"Engine v{v} · scenarios/lunar-infrastructure-geodesy-sensitivity.toml · MODELLED, advisory")
    s = F.s
    x0 = F.wx + 24
    cw = (F.ww - 48 - 230) / 3
    y = F.top + 18
    for i, p in enumerate(par):
        s.text(p, x0 + 230 + i * cw + cw / 2, y + 14, 13, t["cyan"], "mono", 500, anchor="middle")
    y += 26
    allv = [x for f in order for x in fams[f]["rms_partial"][:3] if x > 0]
    lo, hi = math.log10(min(allv)), math.log10(max(allv))
    for f in order:
        s.text(names[f], x0, y + 30, 13, t["ink"], "sans", 500)
        s.text(f"{fams[f]['rows']:,} rows", x0, y + 46, 11, t["ink3"], "mono")
        for i in range(3):
            val = fams[f]["rms_partial"][i]
            cx = x0 + 230 + i * cw
            if val > 0:
                k = (math.log10(val) - lo) / (hi - lo) if hi > lo else 1
                s.rect(cx + 8, y + 6, cw - 16, 46, fill=g.soft(t, "cyan", t["panel"], 0.18 + 0.7 * k), stroke=g.line(t, 1, t["panel"]), r=6)
                s.text(f"{val:.2g}", cx + cw / 2, y + 35, 13, t["ink"], "mono", 500, anchor="middle")
            else:
                s.rect(cx + 8, y + 6, cw - 16, 46, fill="none", stroke=g.line(t, 0, t["panel"]), r=6)
                s.text("none", cx + cw / 2, y + 35, 12, t["ink4"], "mono", anchor="middle")
        y += 56
    gx = x0 + 230
    for lab, val, key in (("all four, sigma / nominal h2", f"{100 * rel[0]:.2f} %", "lime"), ("k2", f"{100 * rel[1]:.2f} %", "lime"), ("l2", f"{100 * rel[2]:.2f} %", "lime")):
        gx += g.chip(s, t, gx, y + 14, f"{lab} {val}", t[key]) + 10
    s.text("Cells are RMS partial derivatives in each family's own units: compare along a row, not down a column.", x0 + 230, y + 14 + 70, 11, t["ink3"], "mono")
    g.chip(s, t, x0 + 230, y + 50, f"G3 trace half NOT MET: trace no larger in {ad['trace_not_larger']} of {ad['pairs_checked']} additions", t["coral"])
    return s


# --------------------------------------------------------------------------------------
# Build, manifest and CLI
# --------------------------------------------------------------------------------------

# Each figure: (loader, drawer, what it is drawn from, committed input files)
FIGURES = {
    "jammertest": (load_jammertest, jammertest_fig, "kshana jammertest score (synthetic NMEA log, catalogue and plan written by this script)", ()),
    "receiver-flags": (load_flags, flags_fig, "kshana receiver-trust (synthetic UBX log written by this script)", ()),
    "machine-inputs": (load_imu, machine_fig, "kshana imu-fit (synthetic stationary IMU CSV written by this script)", ()),
    "timing": (load_timing, timing_fig, "kshana scenarios/holdover-test-example.toml", ("scenarios/holdover-test-example.toml",)),
    "standards": (load_standards, standards_fig, "kshana standards-pack run dhs-rpcf | imo-circ-1575 | icao-doc9849-appf",
                  tuple(f"standards/{p}/pack.toml" for p in ("dhs-rpcf", "imo-circ-1575", "icao-doc9849-appf"))),
    "lunanet-afs": (load_afs, afs_fig, "kshana lunanet-afs-check spec --json", ()),
    "bench": (load_bench, bench_fig, "kshana bench baseline --task d --split test", ()),
    "exporters": (load_exporters, export_fig, "kshana trust-telemetry on examples/maritime-trust",
                  ("examples/maritime-trust/session.toml", "examples/maritime-trust/tallinn-helsinki.nmea")),
    "optical": (load_optical, optical_fig, "kshana scenarios/optical-atmosphere-network.toml", ("scenarios/optical-atmosphere-network.toml",)),
    "ssv-shell": (load_ssv_shell, ssv_shell_fig, "kshana scenarios/gnss-ssv-shell.toml", ("scenarios/gnss-ssv-shell.toml",)),
    "ssv-heo": (load_ssv_heo, ssv_heo_fig, "kshana scenarios/gnss-ssv-heo.toml", ("scenarios/gnss-ssv-heo.toml",)),
    "ssv-nav": (load_ssv_nav, ssv_nav_fig, "kshana scenarios/gnss-ssv-nav-lunar.toml", ("scenarios/gnss-ssv-nav-lunar.toml",)),
    "ssv-formation": (load_ssv_formation, ssv_formation_fig, "kshana scenarios/gnss-ssv-formation-heo.toml", ("scenarios/gnss-ssv-formation-heo.toml",)),
    "lunar-od": (load_lunar_od, lunar_od_fig, "kshana scenarios/lunar-infrastructure-od-consistency.toml and -model-error.toml",
                 ("scenarios/lunar-infrastructure-od-consistency.toml", "scenarios/lunar-infrastructure-od-consistency-model-error.toml")),
    "lunar-carrier": (load_lunar_carrier, lunar_carrier_fig, "committed result of the scored carrier-phase run (tests/fixtures/lunar_infra/phase_full_run.json)",
                      ("tests/fixtures/lunar_infra/phase_full_run.json",)),
    "lunar-frame": (load_lunar_frame, lunar_frame_fig, "kshana scenarios/lunar-infrastructure-frame-coestimation.toml", ("scenarios/lunar-infrastructure-frame-coestimation.toml",)),
    "lunar-tie": (load_lunar_tie, lunar_tie_fig, "kshana scenarios/lunar-infrastructure-space-tie.toml", ("scenarios/lunar-infrastructure-space-tie.toml",)),
    "lunar-geodesy": (load_lunar_geodesy, lunar_geodesy_fig, "kshana scenarios/lunar-infrastructure-geodesy-sensitivity.toml", ("scenarios/lunar-infrastructure-geodesy-sensitivity.toml",)),
    "ssv-booklet": (load_ssv_booklet, ssv_booklet_fig, "committed results of the pre-registered run (xval/gnss-ssv/results-run1.json, results-variant-glonass-table-4-2.json, results-s7.json)",
                    ("xval/gnss-ssv/results-run1.json", "xval/gnss-ssv/results-variant-glonass-table-4-2.json", "xval/gnss-ssv/results-s7.json")),
}


def sha256_file(rel: str) -> str:
    return hashlib.sha256((ROOT / rel).read_bytes()).hexdigest()


def build(exe: str) -> dict[str, bytes]:
    out: dict[str, bytes] = {}
    with tempfile.TemporaryDirectory(prefix="kshana-fig038-") as work:
        run = Run(exe, Path(work))
        version = run.sh("--version").strip().split()[-1]
        if version != g.repo_version():
            sys.exit(f"gen_figures_038: engine is {version} but Cargo.toml says {g.repo_version()}; build the engine from this tree")
        manifest = {"generator": "tools/gen_figures_038.py", "engine_version": version, "figures": {}}
        for name, (load, draw, source, files) in FIGURES.items():
            data = load(run)
            names = []
            for t in g.THEMES:
                fn = f"{name}-{t['name']}.svg"
                out[fn] = draw(t, data, version).render().encode()
                names.append(fn)
            manifest["figures"][name] = {"files": names, "drawn_from": source,
                                         "input_files": {f: sha256_file(f) for f in files},
                                         "svg_sha256": {fn: hashlib.sha256(out[fn]).hexdigest() for fn in names}}
        out["MANIFEST.json"] = (json.dumps(manifest, indent=2, ensure_ascii=False) + "\n").encode()
    return out


# Where each figure is embedded. The alt text there must be the SVG's own <desc>, so what a reader who
# cannot see the figure is told is what the figure shows, number for number.
DOC_PAGES = {
    "jammertest": "docs/JAMMERTEST.md", "receiver-flags": "docs/RECEIVER-TRUST.md", "machine-inputs": "docs/MACHINE-INPUTS.md",
    "timing": "docs/TIMING-HIL.md", "standards": "docs/compliance/README.md", "lunanet-afs": "docs/LUNANET-AFS.md",
    "bench": "docs/BENCH.md", "exporters": "docs/TRUST-TELEMETRY.md", "optical": "docs/OPTICAL-ATMOSPHERE.md",
}
DOC_PAGES.update({"ssv-shell": "docs/SSV.md", "ssv-heo": "docs/SSV.md", "ssv-nav": "docs/SSV.md", "ssv-formation": "docs/SSV.md", "ssv-booklet": "docs/SSV.md"})
DOC_PAGES.update({n: "docs/LUNAR-INFRASTRUCTURE.md" for n in ("lunar-od", "lunar-carrier", "lunar-frame", "lunar-tie", "lunar-geodesy")})
FIGURE_PAGES = {name: ("README.md", DOC_PAGES[name]) for name in FIGURES}


def check_alt_text(assets: dict[str, bytes], out_dir: Path = DEFAULT_OUT) -> list[tuple[str, str]]:
    bad = []
    for name, pages in FIGURE_PAGES.items():
        want = f'alt="{svg_desc(assets[f"{name}-light.svg"])}"'
        for page in pages:
            text = (ROOT / page).read_text()
            rel = os.path.relpath(out_dir / f"{name}-light.svg", (ROOT / page).parent)
            if f'src="{rel}"' not in text:
                bad.append((page, f"{name} is not embedded with the path {rel}"))
            elif want not in text:
                bad.append((page, f"{name} alt text differs from the figure's description"))
    return bad


def svg_desc(svg: bytes) -> str:
    m = re.search(r'<desc id="d">(.*?)</desc>', svg.decode(), re.S)
    return m.group(1) if m else ""


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--kshana", help="the kshana binary (default: $KSHANA_BIN, target/release/kshana, PATH)")
    ap.add_argument("--out", default=str(DEFAULT_OUT), help="output directory (default: docs/figures/0.38)")
    ap.add_argument("--check", action="store_true", help="regenerate in memory and fail if any committed file differs")
    args = ap.parse_args()
    assets = build(g.find_engine(args.kshana))
    out = Path(args.out)
    if args.check:
        bad = [fn for fn, b in assets.items() if not (out / fn).exists() or (out / fn).read_bytes() != b]
        stale = sorted(p.name for p in out.glob("*") if p.name not in assets) if out.exists() else []
        alt = check_alt_text(assets, out)
        if bad or stale or alt:
            print("gen_figures_038: out of date:", ", ".join(bad + [f"{n} (stale)" for n in stale] + [f"{p}: {m}" for p, m in alt]))
            return 1
        print(f"gen_figures_038: {len(assets)} files up to date")
        return 0
    out.mkdir(parents=True, exist_ok=True)
    for fn, b in assets.items():
        (out / fn).write_bytes(b)
    print(f"gen_figures_038: wrote {len(assets)} files to {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
