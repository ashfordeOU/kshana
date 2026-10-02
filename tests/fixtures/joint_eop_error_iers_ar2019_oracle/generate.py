#!/usr/bin/env python3
"""As-issued IERS Bulletin A vintages of 2019 and the later Bulletin B finals, for the
joint-EOP row's comparison with the IERS Annual Report 2019 realised statistics.

Round-2 copy of tests/fixtures/eop_bulletin_a_vintages_oracle/generate.py. Differences:
the issues are Vol. XXXI No. 050..052 and Vol. XXXII (2019), fetched by this script from
https://datacenter.iers.org/data/6/ into $KSHANA_ORACLES/data/iers/bulletinA-2019/; only
issues whose MJD0 lies in 2019 are written; the leads are every horizon of
ar2019_table.csv (the transcribed IERS table).

Inputs (IERS, free use; see NOTICE.md):
  * every weekly IERS Bulletin A issue under $KSHANA_ORACLES/data/iers/bulletinA/
    (Vol. XXXVI No. 001 to Vol. XXXIX No. 039, 2023-01-05 to 2026-09-24);
  * the frozen 2026-09-30 copy of finals2000A.all ($KSHANA_ORACLES/data/iers/finals2000A.all),
    from which ONLY the Bulletin B (final) block is used, as the later truth.

Outputs, beside this script:
  * `vintages.csv`: one block per issue. `R` rows are the as-issued rapid values for
    MJD0-20..MJD0, each date taking its value from the latest issue at or before this one
    that tabulates it in "COMBINED EARTH ORIENTATION PARAMETERS" (nothing published after
    the issue is used). `P` rows are the issue's own prediction table at leads 1..10, 20, 30
    and 40 days. Each issue also carries the accuracy-formula MJD0 it prints
    ("S x,y = 0.00068 (MJD-MJD0)**0.80   S t = 0.00025 (MJD-MJD0)**0.75") and both
    coefficients and exponents as printed.
  * `finals_b.csv`: the Bulletin B x_p, y_p (arcsec) and UT1-UTC (s) of finals2000A.all for
    every target date any `P` row needs.

Only issues whose 40-day target has a Bulletin B final, and which have two earlier issues
(so the rapid window spans at least 16 days), are written.

    source ~/Code/kshana-oracles/env.sh
    "$ORACLE_PY" tests/fixtures/joint_eop_error_iers_ar2019_oracle/generate.py
"""

import glob
import hashlib
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
ORACLES = os.environ.get("KSHANA_ORACLES", os.path.expanduser("~/Code/kshana-oracles"))
BULL_DIR = os.path.join(ORACLES, "data", "iers", "bulletinA-2019")
FINALS = os.path.join(ORACLES, "data", "iers", "finals2000A.all")
ROMAN = {"xxxi": 31, "xxxii": 32}
MJD_2019 = (58484, 58848)  # 2019-01-01 .. 2019-12-31


def table_leads():
    rows = [l for l in open(os.path.join(HERE, "ar2019_table.csv")) if l.strip() and not l.startswith("#")]
    # Day 0 is the issue's own cutoff (a rapid value, not a prediction row); the pipeline
    # under test scores predictions past the cutoff, so no prediction row is written for it.
    return sorted({int(l.split(",")[2]) for l in rows[1:]} - {0})


def fetch():
    import subprocess

    os.makedirs(BULL_DIR, exist_ok=True)
    names = [f"bulletina-xxxi-{n:03d}.txt" for n in range(50, 53)]
    names += [f"bulletina-xxxii-{n:03d}.txt" for n in range(1, 54)]
    for n in names:
        p = os.path.join(BULL_DIR, n)
        if os.path.exists(p):
            continue
        r = subprocess.run(["curl", "-fsSL", "--retry", "3", "-o", p + ".part",
                            "https://datacenter.iers.org/data/6/" + n])
        if r.returncode == 0:
            os.replace(p + ".part", p)
        elif os.path.exists(p + ".part"):
            os.remove(p + ".part")

ACC_RE = re.compile(
    r"S x,y =\s*([0-9.]+) \(MJD-(\d+)\)\*\*([0-9.]+)\s+S t =\s*([0-9.]+) \(MJD-(\d+)\)\*\*([0-9.]+)"
)
ROW_RE = re.compile(r"^\s*(\d{2,4})\s+(\d{1,2})\s+(\d{1,2})\s+(\d{5})\s+(.*)$")


def parse_issue(path):
    text = open(path, encoding="latin-1").read()
    m = ACC_RE.search(text)
    if not m:
        raise ValueError(f"no accuracy formula in {path}")
    sxy_c, mjd0, sxy_e, st_c, mjd0b, st_e = m.groups()
    assert mjd0 == mjd0b, path
    mjd0 = int(mjd0)
    lines = text.splitlines()
    combined, preds = {}, {}
    section = None
    for ln in lines:
        if "COMBINED EARTH ORIENTATION PARAMETERS" in ln:
            section = "C"
            continue
        if "PREDICTIONS:" in ln:
            section = "P0"
            continue
        if section == "P0" and "UT1-UTC(sec)" in ln:
            section = "P"
            continue
        if section in ("C", "P"):
            r = ROW_RE.match(ln)
            if not r:
                # Each table is one contiguous block of rows: the first non-row line after
                # it ends the section (later monthly tables in the issue are not read).
                if (section == "C" and combined) or (section == "P" and preds):
                    section = None
                continue
            mjd = int(r.group(4))
            f = r.group(5).split()
            if section == "C":
                # MJD x err y err UT1 err
                combined[mjd] = (float(f[0]), float(f[2]), float(f[4]))
            else:
                preds[mjd] = (float(f[0]), float(f[1]), float(f[2]))
    if not combined or not preds:
        raise ValueError(f"tables not found in {path}")
    base = os.path.basename(path)
    vol, no = base[len("bulletina-"):-4].split("-")
    return {
        "id": f"{ROMAN[vol]}-{int(no):03d}",
        "file": base,
        "sha256": hashlib.sha256(open(path, "rb").read()).hexdigest(),
        "mjd0": mjd0,
        "sxy": (float(sxy_c), float(sxy_e)),
        "st": (float(st_c), float(st_e)),
        "combined": combined,
        "preds": preds,
    }


def parse_finals_b(path):
    out = {}
    for ln in open(path, encoding="latin-1"):
        if len(ln) < 165:
            continue
        try:
            mjd = int(float(ln[7:15]))
            xb = float(ln[134:144])
            yb = float(ln[144:154])
            ub = float(ln[154:165])
        except ValueError:
            continue
        out[mjd] = (xb, yb, ub)
    return out


def main():
    fetch()
    LEADS = table_leads()
    issues = [parse_issue(p) for p in glob.glob(os.path.join(BULL_DIR, "bulletina-*.txt"))]
    issues.sort(key=lambda d: d["mjd0"])
    finals = parse_finals_b(FINALS)
    finals_sha = hashlib.sha256(open(FINALS, "rb").read()).hexdigest()

    rows, need = [], set()
    kept = 0
    for i, iss in enumerate(issues):
        if i < 2:
            continue
        mjd0 = iss["mjd0"]
        if not (MJD_2019[0] <= mjd0 <= MJD_2019[1]):
            continue
        if mjd0 + max(LEADS) not in finals:
            continue
        # As-issued rapid values: latest issue at or before this one wins, per date.
        rapid = {}
        for prev in issues[: i + 1]:
            for mjd, v in prev["combined"].items():
                if mjd <= mjd0:
                    rapid[mjd] = v
        window = [m for m in range(mjd0 - 20, mjd0 + 1)]
        if any(m not in rapid for m in window):
            continue
        if any(mjd0 + h not in iss["preds"] for h in LEADS):
            continue
        kept += 1
        hdr = (iss["id"], mjd0, iss["sxy"][0], iss["sxy"][1], iss["st"][0], iss["st"][1])
        for m in window:
            x, y, u = rapid[m]
            rows.append((*hdr, "R", m, x, y, u))
        for h in LEADS:
            m = mjd0 + h
            x, y, u = iss["preds"][m]
            rows.append((*hdr, "P", m, x, y, u))
            need.add(m)

    with open(os.path.join(HERE, "vintages.csv"), "w") as f:
        f.write(
            "# As-issued IERS Bulletin A vintages; generated by generate.py from the weekly issues "
            "(see NOTICE.md). kind R = as-issued rapid value, P = the issue's prediction.\n"
        )
        f.write("issue,mjd0,sxy_coef,sxy_exp,st_coef,st_exp,kind,mjd,x_arcsec,y_arcsec,ut1_utc_s\n")
        for r in rows:
            f.write(",".join(str(v) for v in r) + "\n")
    with open(os.path.join(HERE, "finals_b.csv"), "w") as f:
        f.write(
            "# Bulletin B block of finals2000A.all (frozen copy fetched 2026-09-30, "
            f"sha256 {finals_sha}) at every target date of vintages.csv.\n"
        )
        f.write("mjd,xb_arcsec,yb_arcsec,ut1b_s\n")
        for m in sorted(need):
            xb, yb, ub = finals[m]
            f.write(f"{m},{xb},{yb},{ub}\n")
    with open(os.path.join(HERE, "issues.sha256"), "w") as f:
        for iss in issues:
            f.write(f"{iss['sha256']}  {iss['file']}\n")
        f.write(f"{finals_sha}  finals2000A.all\n")
    first = next(r for r in rows)[1]
    last = rows[-1][1]
    print(f"issues kept {kept} of {len(issues)}; MJD0 {first}..{last}; rows {len(rows)}; targets {len(need)}")


if __name__ == "__main__":
    main()
