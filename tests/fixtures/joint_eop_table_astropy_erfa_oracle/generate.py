#!/usr/bin/env python3
"""Independent oracle for the joint Earth-orientation (EOP) table and the predicted-versus-
final tables of the `realtime-frame-eop` scenario (matrix row "Joint UT1 and polar-motion
error", M034, round 2 repair). Pre-registered in tests/joint_eop_table_astropy_erfa_oracle.rs;
read that header first.

Tools (all run as separate programs, nothing is copied into the crate):
  * astropy 8.0.1, `astropy.utils.iers.IERS_A.read` (BSD-3-Clause): reads every finals2000A
    file below with the IERS's own CDS ReadMe, and forms the "Bulletin B where published,
    else Bulletin A" series itself (`UT1_UTC`, `PM_x`, `PM_y`).
  * pyerfa 2.0.1.5 (BSD-3-Clause; the IAU SOFA algorithms): `c2t06a` builds the full
    celestial-to-terrestrial rotation for the true and for the persisted (or predicted)
    Earth orientation; the error rotation's angle times the Earth-Moon lever distance is the
    oracle's position error at the Moon.
  * NumPy: RMS, nearest-rank percentiles (`method="inverted_cdf"`) and maximum.

Inputs (IERS products, free use with citation):
  * the frozen 2026-09-30 finals2000A.all ($KSHANA_ORACLES/data/iers/finals2000A.all,
    SHA-256 cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18);
  * ../joint_eop_error_iers_ar2019_oracle/vintages.csv (the committed 2019 Bulletin A
    as-issued rapid and prediction values).

Outputs beside this script: joint_input.txt, later_2019.txt, as_issued_<issue>.txt and
oracle.json.

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/joint_eop_table_astropy_erfa_oracle/generate.py
"""

import hashlib
import json
import os

import erfa
import numpy as np
from astropy.utils import iers

HERE = os.path.dirname(os.path.abspath(__file__))
ORACLES = os.environ.get("KSHANA_ORACLES", os.path.expanduser("~/Code/kshana-oracles"))
FINALS = os.path.join(ORACLES, "data", "iers", "finals2000A.all")
FINALS_SHA = "cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18"
VINTAGES = os.path.join(HERE, "..", "joint_eop_error_iers_ar2019_oracle", "vintages.csv")

# Fixed in the pre-registration.
JOINT_FIRST_MJD = 60857  # 2025-07-01
JOINT_HORIZONS = [1, 2, 5, 10, 20, 30, 40, 90]
LATER_SPAN = (58450, 58960)  # 2018-11-27 .. 2020-03-19, Bulletin B truth for 2019 issues
ISSUES = ["32-001", "32-014", "32-027", "32-040"]
PVF_HORIZONS = [1, 5, 10, 20, 40, 90]
D_EM_M = 384_400_000.0  # the stated "at the Moon" lever distance
ARCSEC = np.pi / 180.0 / 3600.0


def sha256(path):
    with open(path, "rb") as f:
        return hashlib.sha256(f.read()).hexdigest()


def mjd_of(line):
    try:
        return float(line[7:15])
    except ValueError:
        return None


def write(name, lines):
    path = os.path.join(HERE, name)
    with open(path, "w") as f:
        for l in lines:
            f.write(l.rstrip("\n") + "\n")
    return path


def finals_line(mjd, x, y, ut1, flag, b):
    """One finals2000A data line in the IERS fixed-column format (readme.finals2000A):
    date fields, MJD, the I/P flags (columns 17 and 58), the Bulletin A pole and UT1-UTC,
    and, when `b` is given, the Bulletin B block (columns 135-165)."""
    y_, m_, d_, _ = erfa.jd2cal(2400000.5, mjd)
    line = [" "] * 185
    def put(a, text):
        line[a:a + len(text)] = list(text)
    put(0, f"{y_ % 100:2d}{m_:2d}{d_:2d}")
    put(7, f"{mjd:8.2f}")
    put(16, flag)
    put(18, f"{x:9.6f}")
    put(37, f"{y:9.6f}")
    put(57, flag)
    put(58, f"{ut1:10.7f}")
    if b is not None:
        put(134, f"{b[0]:10.6f}")
        put(144, f"{b[1]:10.6f}")
        put(154, f"{b[2]:11.7f}")
        return "".join(line[:165])
    return "".join(line[:68])


def read(path):
    """astropy's reading of a finals2000A file: MJD -> dict of A, B and combined values.

    astropy 8.0.1 `IERS_A.read` indexes the first prediction (P) row to set
    `meta["predictive_mjd"]` and raises IndexError on a file with no P row (the joint
    input and the 2019 later vintage have none). Reading-only workaround, added after the
    first run stopped there before writing any output: astropy reads a temporary copy with
    one sentinel P row appended one day after the last row, and that day is dropped."""
    import tempfile

    body = open(path).read().splitlines()
    sentinel = None
    if not any(len(l) > 57 and (l[16] == "P" or l[57] == "P") for l in body):
        last = body[-1]
        sentinel = mjd_of(last) + 1
        s = finals_line(sentinel, float(last[18:27]), float(last[37:46]), float(last[58:68]), "P", None)
        body.append(s)
    with tempfile.NamedTemporaryFile("w", suffix=".txt", delete=False) as tmp:
        tmp.write("\n".join(body) + "\n")
    try:
        t = iers.IERS_A.read(tmp.name)
    finally:
        os.unlink(tmp.name)
    out = {}
    for r in t:
        mjd = float(r["MJD"].value)
        if mjd == sentinel:
            continue
        def val(c, unit):
            v = r[c]
            v = getattr(v, "value", v)
            return None if np.ma.is_masked(v) or not np.isfinite(v) else float(v)
        out[mjd] = {
            "flag_pm": str(r["PolPMFlag_A"]),
            "flag_ut1": str(r["UT1Flag_A"]),
            "ut1_a": val("UT1_UTC_A", "s"),
            "x_a": val("PM_x_A", "arcsec"),
            "y_a": val("PM_y_A", "arcsec"),
            "ut1_b": val("UT1_UTC_B", "s"),
            "x_b": val("PM_X_B", "arcsec"),
            "y_b": val("PM_Y_B", "arcsec"),
            "ut1": float(getattr(r["UT1_UTC"], "value", r["UT1_UTC"])),
            "x": float(getattr(r["PM_x"], "value", r["PM_x"])),
            "y": float(getattr(r["PM_y"], "value", r["PM_y"])),
        }
    return out


def c2t(mjd, ut1_utc, xp_as, yp_as):
    """ERFA celestial-to-terrestrial matrix at 0h UTC of `mjd`.

    Amendment A1: the UTC date is passed as (2400000.5 + MJD, 0.0), so the UT1-UTC offset
    lands in an otherwise-zero second part and keeps about 1e-11 s of resolution. The first
    run passed (2400000.5, MJD), where one unit in the last place of MJD + dUT1/86400 is
    about 0.6 microseconds of time."""
    u1, u2 = 2400000.5 + mjd, 0.0
    a1, a2 = erfa.utctai(u1, u2)
    t1, t2 = erfa.taitt(a1, a2)
    ut1a, ut1b = erfa.utcut1(u1, u2, ut1_utc)
    return erfa.c2t06a(t1, t2, ut1a, ut1b, xp_as * ARCSEC, yp_as * ARCSEC)


def error_angle(r_true, r_other):
    """Rotation angle (rad) of r_true r_other^T, from its antisymmetric part (accurate for the
    sub-microradian angles here, where the trace form loses precision)."""
    m = r_true @ r_other.T
    v = np.array([m[2, 1] - m[1, 2], m[0, 2] - m[2, 0], m[1, 0] - m[0, 1]]) / 2.0
    return float(np.arcsin(np.linalg.norm(v)))


def stats(v):
    v = np.asarray(v, dtype=float)
    return {
        "n": int(v.size),
        "rms": float(np.sqrt(np.mean(v * v))),
        "p50": float(np.percentile(v, 50, method="inverted_cdf")),
        "p95": float(np.percentile(v, 95, method="inverted_cdf")),
        "max": float(v.max()),
    }


def joint(rows):
    """The oracle's joint table: per horizon the epoch set, the three components' statistics
    and the truth-fallback counts."""
    mjds = sorted(rows)
    has_b_ut1 = lambda m: rows[m]["ut1_b"] is not None
    has_b_pm = lambda m: rows[m]["x_b"] is not None and rows[m]["y_b"] is not None
    out = []
    for h in ["final"] + JOINT_HORIZONS:
        epochs, ut1, pole, comb = [], [], [], []
        fb_u = fb_p = fb_c = 0
        for m in mjds:
            r = rows[m]
            if h == "final":
                if not (has_b_ut1(m) and has_b_pm(m)):
                    continue
                du = r["ut1_a"] - r["ut1_b"]
                dx, dy = r["x_a"] - r["x_b"], r["y_a"] - r["y_b"]
                rt = c2t(m, r["ut1_b"], r["x_b"], r["y_b"])
                ro = c2t(m, r["ut1_a"], r["x_a"], r["y_a"])
            else:
                t = m + h
                if t not in rows:
                    continue
                q = rows[t]
                du = r["ut1"] - q["ut1"]
                dx, dy = r["x"] - q["x"], r["y"] - q["y"]
                # Persistence: the base day's orientation applied at the target day.
                rt = c2t(t, q["ut1"], q["x"], q["y"])
                ro = c2t(t, r["ut1"], r["x"], r["y"])
                fb_u += int(not has_b_ut1(m) or not has_b_ut1(t))
                fb_p += int(not has_b_pm(m) or not has_b_pm(t))
                fb_c += int(not (has_b_ut1(m) and has_b_pm(m)) or not (has_b_ut1(t) and has_b_pm(t)))
            epochs.append(m)
            ut1.append(abs(du))
            pole.append(float(np.hypot(dx, dy)))
            comb.append(D_EM_M * error_angle(rt, ro))
        if not epochs:
            continue
        out.append({
            "horizon_days": 0 if h == "final" else h,
            "is_final": h == "final",
            "epochs_mjd": epochs,
            "ut1_s": stats(ut1),
            "pole_arcsec": stats(pole),
            "combined_m": stats(comb),
            "fallback": {"ut1": fb_u, "polar_motion": fb_p, "combined": fb_c},
        })
    return out


def pvf(as_issued, later):
    """Predicted-versus-final per horizon from astropy's reading: the as-issued file's P-flag
    rows h days past its last I-flag row, against the later file's Bulletin B block."""
    measured = [m for m, r in as_issued.items() if r["flag_ut1"] == "I"]
    cutoff = max(measured)
    rows = []
    for h in PVF_HORIZONS:
        t = cutoff + h
        a = as_issued.get(t)
        b = later.get(t)
        if a is None or a["flag_ut1"] != "P" or b is None or b["ut1_b"] is None:
            continue
        du = abs(a["ut1_a"] - b["ut1_b"])
        dp = float(np.hypot(a["x_a"] - b["x_b"], a["y_a"] - b["y_b"]))
        rows.append({"horizon_days": h, "n": 1, "ut1_rms_s": du, "pole_rms_arcsec": dp})
    return cutoff, rows


def main():
    assert sha256(FINALS) == FINALS_SHA, "the frozen finals2000A.all changed"
    lines = open(FINALS).read().splitlines()

    # Joint-table input: verbatim rows from JOINT_FIRST_MJD through the last row whose two
    # flags are I (measured). No P (prediction) row is included.
    last_i = max(i for i, l in enumerate(lines) if len(l) > 57 and l[16] == "I" and l[57] == "I")
    first = next(i for i, l in enumerate(lines) if mjd_of(l) == JOINT_FIRST_MJD)
    joint_path = write("joint_input.txt", lines[first:last_i + 1])

    # Later vintage for the 2019 issues: verbatim rows over LATER_SPAN.
    later_path = write(
        "later_2019.txt",
        [l for l in lines if mjd_of(l) is not None and LATER_SPAN[0] <= mjd_of(l) <= LATER_SPAN[1]],
    )

    # As-issued bodies: the issue's rapid rows (flag I; Bulletin B block carrying the same
    # values, which marks the data cutoff as in the AR 2019 fixture) and its predictions
    # (flag P, no Bulletin B block).
    vint = [l.split(",") for l in open(VINTAGES) if l.strip() and not l.startswith("#")][1:]
    issue_paths = {}
    for iss in ISSUES:
        body = []
        for f in vint:
            if f[0] != iss:
                continue
            m, x, y, u = float(f[7]), float(f[8]), float(f[9]), float(f[10])
            if f[6] == "R":
                body.append(finals_line(m, x, y, u, "I", (x, y, u)))
            else:
                body.append(finals_line(m, x, y, u, "P", None))
        assert body, iss
        issue_paths[iss] = write(f"as_issued_{iss}.txt", body)

    joint_rows = read(joint_path)
    later = read(later_path)
    cases = []
    for iss, path in issue_paths.items():
        a = read(path)
        cutoff, rows = pvf(a, later)
        cases.append({"issue": iss, "file": os.path.basename(path), "cutoff_mjd": cutoff,
                      "status": "measured" if rows else "no-matched-pairs", "rows": rows})
        # The same as-issued file supplied as its own "later" vintage: its predictions have
        # no Bulletin B final anywhere, so astropy finds no matched pair.
        _, none = pvf(a, a)
        cases.append({"issue": iss, "file": os.path.basename(path), "later_is_self": True,
                      "status": "measured" if none else "no-matched-pairs", "rows": none})

    doc = {
        "tools": {"astropy": __import__("astropy").__version__, "pyerfa": erfa.__version__,
                  "numpy": np.__version__},
        "finals_sha256": FINALS_SHA,
        "inputs_sha256": {os.path.basename(p): sha256(p)
                          for p in [joint_path, later_path, *issue_paths.values()]},
        "d_em_m": D_EM_M,
        "joint_input_rows": len(joint_rows),
        "joint": joint(joint_rows),
        "pvf": cases,
    }
    with open(os.path.join(HERE, "oracle.json"), "w") as f:
        json.dump(doc, f, indent=1)
        f.write("\n")


if __name__ == "__main__":
    main()
