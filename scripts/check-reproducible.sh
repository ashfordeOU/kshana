#!/usr/bin/env bash
# Runs the reference scenario twice and asserts byte-identical results.
set -euo pipefail
cargo build --quiet
./target/debug/kshana scenarios/clock-holdover.toml >/dev/null
a=$(shasum -a 256 scenarios/clock-holdover.result.json | awk '{print $1}')
./target/debug/kshana scenarios/clock-holdover.toml >/dev/null
b=$(shasum -a 256 scenarios/clock-holdover.result.json | awk '{print $1}')
if [ "$a" != "$b" ]; then echo "FAIL: non-deterministic result"; exit 1; fi
echo "OK: reproducible ($a)"
