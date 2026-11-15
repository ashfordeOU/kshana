#!/usr/bin/env python3
"""Print the cargo-tarpaulin target arguments for one coverage shard.

    scripts/coverage-shard.py lib          -> --lib --bins
    scripts/coverage-shard.py <k> <n>      -> --test <stem> ... for every tests/*.rs whose
                                              index in the sorted list is k modulo n

Every integration test lands in exactly one shard, so the shards together run the same tests as
one unsharded `cargo tarpaulin` (tests/coverage_shards.rs checks that); nothing is skipped.
"""
import pathlib
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent


def stems():
    return sorted(p.stem for p in (ROOT / "tests").glob("*.rs"))


def shard(k, n):
    return [s for i, s in enumerate(stems()) if i % n == k]


def main(argv):
    if argv == ["lib"]:
        print("--lib --bins")
        return 0
    if len(argv) != 2:
        print(__doc__, file=sys.stderr)
        return 2
    k, n = int(argv[0]), int(argv[1])
    if not 0 <= k < n:
        print(f"coverage-shard: shard {k} is not in 0..{n - 1}", file=sys.stderr)
        return 2
    print(" ".join(f"--test {s}" for s in shard(k, n)))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
