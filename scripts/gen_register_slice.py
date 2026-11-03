#!/usr/bin/env python3
"""Generate Kshana's slice of the Ashforde model register (D-K12).

Reads scripts/register_models.json (which matrix rows make up each model, and the
third-party models or data it uses) and docs/VERIFICATION-MATRIX.md (the generated
evidence ledger), and writes JSON in the shape of the register's models[] entries.

Status per model is the weakest of its rows: all VALIDATED gives VALIDATED, any
MODELLED gives MODELLED, any PARTNER gives PARTNER. Core models carry an id and a
SHA-256 only.

  python3 scripts/gen_register_slice.py [--out FILE] [--check]
"""
import argparse, json, pathlib, subprocess, sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
STATUS_TEXT = {
    "VALIDATED": "VALIDATED: native model, scorecard passed (independent external oracle)",
    "MODELLED": "MODELLED: native model, not yet scored against an external oracle",
    "PARTNER": "PARTNER: native model, waiting for partner data",
    "NOT MET": "NOT MET: native model, scorecard failed, iterating",
}
RANK = {"VALIDATED": 0, "MODELLED": 1, "PARTNER": 2, "NOT MET": 3}


def matrix_rows():
    rows = {}
    for line in (ROOT / "docs/VERIFICATION-MATRIX.md").read_text().splitlines():
        if not line.startswith("| VM-"):
            continue
        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        rows[cells[0]] = {"requirement": cells[1], "status": cells[-1]}
    return rows


def head_sha():
    try:
        return subprocess.check_output(["git", "-C", str(ROOT), "rev-parse", "--short=8", "HEAD"], text=True).strip()
    except Exception:
        return "unknown"


def build():
    cfg = json.loads((ROOT / "scripts/register_models.json").read_text())
    rows = matrix_rows()
    sha = head_sha()
    out, errors = [], []
    for m in cfg["models"]:
        missing = [r for r in m["rows"] if r not in rows]
        if missing:
            errors.append(f"{m['id']}: rows not in the matrix: {', '.join(missing)}")
            continue
        sts = [rows[r]["status"] for r in m["rows"]]
        unknown = [s for s in sts if s not in RANK]
        if unknown:
            errors.append(f"{m['id']}: unknown status {unknown}")
            continue
        worst = max(sts, key=RANK.get)
        status = STATUS_TEXT[worst]
        if m.get("kind") == "port":
            status = status.replace("native model", "port of a third-party model")
        out.append({
            "id": m["id"],
            "domain": m["domain"],
            "status": status,
            "owner": "Kshana",
            "branch": f"kshana@{sha}",
            "default": None,
            "replaces": m["replaces"],
            "comparisons": [],
            "validation": [{"row": r, "status": rows[r]["status"], "requirement": rows[r]["requirement"]} for r in m["rows"]],
        })
    for c in cfg.get("core", []):
        out.append({"id": c["id"], "owner": "Kshana", "layer": "core", "sha256": c["sha256"]})
    ids = [e["id"] for e in out]
    if len(ids) != len(set(ids)):
        errors.append("duplicate model ids")
    return {
        "schema": "kshana.register_slice/1",
        "source": f"kshana@{sha} docs/VERIFICATION-MATRIX.md + scripts/register_models.json",
        "note": "default is null until each model's default flag is recorded; comparisons stay empty until a pre-registered head-to-head is scored (facts only).",
        "models": out,
    }, errors


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out")
    ap.add_argument("--check", action="store_true", help="fail if any configured row is missing from the matrix")
    a = ap.parse_args()
    data, errors = build()
    for e in errors:
        print("register:", e, file=sys.stderr)
    text = json.dumps(data, indent=1, ensure_ascii=False) + "\n"
    if a.out:
        pathlib.Path(a.out).write_text(text)
        print(f"register: {len(data['models'])} entries -> {a.out}")
    elif not a.check:
        sys.stdout.write(text)
    sys.exit(1 if errors else 0)


if __name__ == "__main__":
    main()
