#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the numbers in docs/revisions/STUDIO15-portable-math-rebaseline.md.

Inputs (all produced by running the engine, none typed in):
  --old DIR    <scenario>.json for every bundled scenario, from the host-maths engine
               (the tip before STUDIO-15)
  --new DIR    the same files from the portable-maths engine
  --logs DIR   per-test-binary logs of the full suite on the portable-maths engine
  --repo DIR   the repository (to read the frozen files and the Studio recorded set)
Outputs: the moved-values CSV (gzip) and the markdown fragments the record embeds.
Usage: studio15_rebaseline_table.py --old O --new N --logs L --repo R --csv-gz OUT.csv.gz > fragments.md
"""
import argparse, csv, gzip, io, json, os, re, sys


def leaves(a, b, p, out, cnt):
    if isinstance(a, dict) and isinstance(b, dict):
        for k in a:
            if k in b:
                leaves(a[k], b[k], f"{p}.{k}", out, cnt)
            else:
                out.append((p + "." + k, "key-removed", None, None, None))
        for k in b:
            if k not in a:
                out.append((p + "." + k, "key-added", None, None, None))
    elif isinstance(a, list) and isinstance(b, list):
        if len(a) != len(b):
            out.append((p, "length", len(a), len(b), None))
        for i, (x, y) in enumerate(zip(a, b)):
            leaves(x, y, f"{p}[{i}]", out, cnt)
    elif isinstance(a, (int, float)) and isinstance(b, (int, float)) and not isinstance(a, bool):
        cnt[0] += 1
        if a != b:
            out.append((p, "num", a, b, abs(a - b) / max(abs(a), abs(b), 1e-300)))
    elif a != b:
        out.append((p, "other", str(a)[:70], str(b)[:70], None))


def scenario_rows(old, new, repo, csvw):
    rows = []
    for f in sorted(os.listdir(old)):
        n = f[:-5]
        a, b = open(f"{old}/{f}").read(), open(f"{new}/{f}").read()
        if a == b:
            rows.append(dict(n=n, moved=0, total=0, other=0))
            continue
        x, y = json.loads(a), json.loads(b)
        out, cnt = [], [0]
        leaves(x, y, "$", out, cnt)
        nums = [o for o in out if o[1] == "num"]
        oth = [o for o in out if o[1] != "num"]
        for o in nums:
            csvw.writerow([n, o[0], repr(o[2]), repr(o[3]), "%.3e" % o[4]])
        for o in oth:
            csvw.writerow([n, o[0], o[2], o[3], o[1]])
        mx = max(nums, key=lambda o: o[4]) if nums else None
        digests = sum(1 for o in oth if re.search(r"sha256|digest|hash", o[0]))
        rec = os.path.join(repo, "web/studio/recorded", f)
        rec_state = "absent"
        if os.path.exists(rec):
            try:
                r = json.loads(json.load(open(rec))["json"])
                rec_state = "new" if r == y else "old" if r == x else "neither"
            except Exception:
                rec_state = "unreadable"
        rows.append(dict(n=n, moved=len(nums), total=cnt[0], other=len(oth), digests=digests,
                         mx=mx, rec=rec_state,
                         discrete=[o for o in oth if not re.search(r"sha256|digest|hash", o[0])]
                         + [o for o in nums if re.fullmatch(r"-?\d+", repr(o[2])) and re.fullmatch(r"-?\d+", repr(o[3]))]))
    return rows


def fmt(v):
    return repr(v) if not isinstance(v, str) else v


def md_scenarios(rows):
    moved = [r for r in rows if r["moved"] or r["other"]]
    L = ["| scenario | numbers moved / numeric leaves | largest relative change | field | old | new | digest strings | Studio recorded file |",
         "|---|---|---|---|---|---|---|---|"]
    for r in sorted(moved, key=lambda r: -(r["mx"][4] if r["mx"] else 0)):
        mx = r["mx"]
        if mx:
            L.append(f"| `{r['n']}` | {r['moved']} / {r['total']} | {mx[4]:.2e} | `{mx[0]}` | {mx[2]!r} | {mx[3]!r} | {r['digests']} | {r['rec']} |")
        else:
            L.append(f"| `{r['n']}` | 0 / {r['total']} | n/a | digests only | | | {r['digests']} | {r['rec']} |")
    same = [r["n"] for r in rows if not (r["moved"] or r["other"])]
    return "\n".join(L), same, moved


def first_panic(log):
    t = open(log, errors="replace").read()
    m = re.search(r"panicked at ([^\n]+):\n(.*?)(?:\nnote:|\n\nfailures)", t, re.S)
    return t, m


def pinned(logs):
    """The two sides of the first failed assertion of each pinned-value test."""
    spec = [
        ("kshana (lib)", "cislunar_observability::tests::default_document_is_bit_for_bit_the_released_one", "src/cislunar_observability.rs"),
        ("registry_golden", "golden_cislunar_observability", "tests/registry_golden.rs"),
        ("cislunar_arc_recovery_reference", "the_released_observability_document_is_unchanged", "tests/cislunar_arc_recovery_reference.rs"),
        ("iq_track_cn0", "m2_m3_l1ca_45_dbhz_m2m4_is_nominal_and_nwpr_is_unchanged", "tests/iq_track_cn0.rs"),
        ("iq_campaign", "the_reference_digests_are_pinned", "tests/iq_campaign.rs"),
        ("prediction_frozen", "the_frozen_predictions_reproduce", "tests/prediction_frozen.rs"),
    ]
    L = ["| binary | test | pinned in | pinned (old) | now (new) |", "|---|---|---|---|---|"]
    for binary, test, where in spec:
        f = os.path.join(logs, ("kshana" if binary.startswith("kshana") else binary) + ".log")
        t = open(f, errors="replace").read()
        m = re.search(r"left: (.*)\n right: (.*)\n", t)
        L.append(f"| {binary} | `{test}` | `{where}` | `{m.group(2) if m else '?'}` | `{m.group(1) if m else '?'}` |")
    return "\n".join(L)


def iq_short(logs, repo):
    t = open(os.path.join(logs, "iq_short.log"), errors="replace").read()
    m = re.search(r'  left: (".*")\n right: (".*")\n', t)
    new, old = json.loads(m.group(1)), json.loads(m.group(2))
    out, cnt = [], [0]
    leaves(json.loads(old), json.loads(new), "$", out, cnt)
    L = ["| field | old (golden) | new | relative |", "|---|---|---|---|"]
    for o in out:
        L.append(f"| `{o[0]}` | {o[2]!r} | {o[3]!r} | {o[4]:.2e} |" if o[4] is not None else f"| `{o[0]}` | {o[2]} | {o[3]} | |")
    return "\n".join(L), len(out), cnt[0]


def published_figures(logs):
    t = open(os.path.join(logs, "published_figures_still_reproduce.log"), errors="replace").read()
    rows = re.findall(r"^  (\S+): ([0-9.e+-]+) -> ([0-9.e+-]+)$", t, re.M)
    L = ["| path in `paper/crossover/inertial.json` | old | new | relative |", "|---|---|---|---|"]
    for p, a, b in rows:
        a_, b_ = float(a), float(b)
        L.append(f"| `{p}` | {a} | {b} | {abs(a_-b_)/max(abs(a_),abs(b_)):.2e} |")
    return "\n".join(L), len(rows)


def numpy_oracles(logs):
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    def conv(s):
        s = re.sub(r"Number\(([^)]*)\)", r"\1", s)
        s = s.replace("Object {", "{").replace("Array [", "[")
        s = re.sub(r'String\(("(?:[^"\\]|\\.)*")\)', r"\1", s)
        return s.replace("Bool(true)", "true").replace("Bool(false)", "false").replace("Null", "null")
    L = ["| test binary | what the first failed assertion compares | values differing | largest relative change | at |", "|---|---|---|---|---|"]
    for b, what in [("lunar_joint_od_numpy_oracle", "engine inputs vs committed inputs.json (1e-12 relative)"),
                    ("lunar_station_numpy_oracle", "engine export vs committed export (exact)"),
                    ("lunar_observability_numpy_oracle", "engine Jacobian vs committed fixture (exact)")]:
        t = open(os.path.join(logs, b + ".log"), errors="replace").read()
        m = re.search(r"left: (.*)\n right: (.*)\n", t)
        try:
            x, y = json.loads(conv(m.group(1))), json.loads(conv(m.group(2)))
            out, cnt = [], [0]
            leaves(y, x, "", out, cnt)
            nums = [o for o in out if o[1] == "num"]
            mx = max(nums, key=lambda o: o[4])
            L.append(f"| {b} | {what} | {len(out)} | {mx[4]:.2e} | `{mx[0]}`: {mx[2]!r} -> {mx[3]!r} |")
        except Exception as e:
            L.append(f"| {b} | {what} | ? | ? | {e} |")
    return "\n".join(L)


def skyline(logs):
    t = open(os.path.join(logs, "skyline_scenarios.log"), errors="replace").read()
    return sorted(set(re.findall(r"^(\S+\.toml): (?:json|svg|summary) changed$", t, re.M)))


def frozen(repo, newdir):
    L = ["| frozen result | leaves moved | largest relative change | at | old | new |", "|---|---|---|---|---|---|"]
    for k in ("region", "points"):
        a = json.load(open(f"{repo}/docs/predictions/lunar-reference-station.{k}.result.json"))
        b = json.load(open(f"{newdir}/{k}.new.json"))
        out, cnt = [], [0]
        leaves(a, b, "$", out, cnt)
        nums = [o for o in out if o[1] == "num"]
        mx = max(nums, key=lambda o: o[4])
        L.append(f"| {k} | {len(out)} of {cnt[0]} | {mx[4]:.2e} | `{mx[0]}` | {mx[2]!r} | {mx[3]!r} |")
    return "\n".join(L)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--old", required=True); ap.add_argument("--new", required=True)
    ap.add_argument("--logs", required=True); ap.add_argument("--repo", required=True)
    ap.add_argument("--pred", required=True, help="dir with region.new.json and points.new.json")
    ap.add_argument("--csv-gz", required=True)
    a = ap.parse_args()
    buf = io.StringIO(); w = csv.writer(buf)
    w.writerow(["scenario", "path", "old", "new", "relative_change_or_kind"])
    rows = scenario_rows(a.old, a.new, a.repo, w)
    with gzip.open(a.csv_gz, "wt", newline="") as g:
        g.write(buf.getvalue())
    table, same, moved = md_scenarios(rows)
    big = lambda t: sum(1 for r in moved if r["mx"] and r["mx"][4] > t)
    disc = [(r["n"], d) for r in moved for d in r["discrete"]]
    iqt, iqn, iqtot = iq_short(a.logs, a.repo)
    pf, pfn = published_figures(a.logs)
    sky = skyline(a.logs)
    print("<!--SUMMARY-->")
    print(f"scenarios {len(rows)}; byte-identical {len(same)}; moved {len(moved)}; "
          f"moved numbers {sum(r['moved'] for r in moved)}; largest-change above 1e-12/1e-9/1e-6/1e-3: "
          f"{big(1e-12)}/{big(1e-9)}/{big(1e-6)}/{big(1e-3)}; "
          f"Studio recorded file equals new output for {sum(1 for r in moved if r['rec']=='new')} of the moved, "
          f"old for {sum(1 for r in moved if r['rec']=='old')}, neither for {sum(1 for r in moved if r['rec']=='neither')}, absent for {sum(1 for r in moved if r['rec']=='absent')}")
    print("<!--SCENARIOS-->"); print(table)
    print("<!--UNCHANGED-->"); print(", ".join(f"`{n}`" for n in same))
    print("<!--DISCRETE-->")
    for n, d in disc:
        print(f"- `{n}` `{d[0]}`: {d[2]!r} -> {d[3]!r}")
    print("<!--PINNED-->"); print(pinned(a.logs))
    print("<!--IQSHORT-->"); print(iqt); print(f"({iqn} of {iqtot} numbers moved)")
    print("<!--PUBLISHED-->"); print(pf)
    print("<!--NUMPY-->"); print(numpy_oracles(a.logs))
    print("<!--SKYLINE-->"); print(", ".join(f"`{s}`" for s in sky)); print(f"({len(sky)} files)")
    print("<!--FROZEN-->"); print(frozen(a.repo, a.pred))
