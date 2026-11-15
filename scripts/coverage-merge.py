#!/usr/bin/env python3
"""Merge the coverage shards' lcov files and enforce the line-coverage floor.

    scripts/coverage-merge.py --fail-under 85 --out coverage/lcov.info shard1.info shard2.info ...

A line counts as covered when any shard executed it (hit counts are summed); the percentage is
covered lines over instrumented lines across all source files, the measure `cargo tarpaulin
--fail-under` applies to a single run.
"""
import argparse
import collections
import sys


def read(path, lines):
    current = None
    with open(path, encoding="utf-8") as f:
        for raw in f:
            line = raw.strip()
            if line.startswith("SF:"):
                current = line[3:]
            elif line.startswith("DA:") and current is not None:
                no, hits = line[3:].split(",")[:2]
                lines[current][int(no)] += int(hits)
            elif line == "end_of_record":
                current = None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--fail-under", type=float, required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("inputs", nargs="+")
    a = ap.parse_args()
    lines = collections.defaultdict(lambda: collections.defaultdict(int))
    for p in a.inputs:
        read(p, lines)
    total = covered = 0
    with open(a.out, "w", encoding="utf-8") as out:
        for sf in sorted(lines):
            out.write(f"SF:{sf}\n")
            for no in sorted(lines[sf]):
                hits = lines[sf][no]
                out.write(f"DA:{no},{hits}\n")
                total += 1
                covered += hits > 0
            out.write("end_of_record\n")
    pct = 100.0 * covered / total if total else 0.0
    print(f"coverage: {covered}/{total} lines, {pct:.2f}% (floor {a.fail_under}%) from {len(a.inputs)} shard(s)")
    if pct < a.fail_under:
        print(f"FAIL: line coverage {pct:.2f}% is under the {a.fail_under}% floor", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
