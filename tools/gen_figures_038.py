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
FIGURE_PAGES = {name: ("README.md", DOC_PAGES[name]) for name in FIGURES}


def check_alt_text(assets: dict[str, bytes]) -> list[tuple[str, str]]:
    bad = []
    for name, pages in FIGURE_PAGES.items():
        want = f'alt="{svg_desc(assets[f"{name}-light.svg"])}"'
        for page in pages:
            text = (ROOT / page).read_text()
            if f"{name}-light.svg" not in text:
                bad.append((page, f"{name} is not embedded"))
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
        alt = check_alt_text(assets)
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
