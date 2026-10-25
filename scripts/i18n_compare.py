#!/usr/bin/env python3
"""English must not move: run the same scenarios with a baseline binary and the current one and compare
every output file (result.json, chart.svg, report.html, report.json, table.csv, the summary on stdout)
byte for byte.  Usage: i18n_compare.py <baseline-binary> <current-binary> [scenario-name ...]
With no names, a fixed spread of the bundled scenarios is used.  Exit status 1 on any difference."""
import filecmp, os, subprocess, sys, tempfile

DEFAULT = ["clock-holdover", "clock-measured-log", "gnss-ins", "araim-gps-galileo", "acm-link",
           "campaign-spectrum-holdover-integrity", "constellation-multi-gnss-coverage", "cislunar-observability",
           "europa-surface-pnt", "automotive-urban-canyon", "conflict-resilience", "eo-radiometry"]


def run(binary, name, work):
    os.makedirs(work, exist_ok=True)
    src = subprocess.run([binary, "example", name], capture_output=True, text=True)
    if src.returncode != 0:
        return None
    path = os.path.join(work, name + ".toml")
    open(path, "w").write(src.stdout)
    r = subprocess.run([binary, name + ".toml"], capture_output=True, text=True, cwd=work)
    open(os.path.join(work, name + ".stdout"), "w").write(r.stdout)
    open(os.path.join(work, name + ".stderr"), "w").write(r.stderr)
    return r.returncode


def main():
    base, cur = os.path.abspath(sys.argv[1]), os.path.abspath(sys.argv[2])
    names = sys.argv[3:] or DEFAULT
    tmp = tempfile.mkdtemp(prefix="i18n-compare-")
    bad = 0
    ran = 0
    for n in names:
        a, b = os.path.join(tmp, "base", n), os.path.join(tmp, "cur", n)
        ra, rb = run(base, n, a), run(cur, n, b)
        if ra is None and rb is None:
            print(f"skip {n} (not a bundled scenario)")
            continue
        ran += 1
        files = sorted(set(os.listdir(a)) | set(os.listdir(b)))
        for f in files:
            pa, pb = os.path.join(a, f), os.path.join(b, f)
            if not (os.path.exists(pa) and os.path.exists(pb)) or not filecmp.cmp(pa, pb, shallow=False):
                print(f"DIFFERENT {n}/{f}  (baseline {a}, current {b})")
                bad += 1
        if ra != rb:
            print(f"DIFFERENT exit status {n}: {ra} vs {rb}")
            bad += 1
    print(f"{ran} scenarios compared, {bad} differences")
    sys.exit(1 if bad else 0)


main()
