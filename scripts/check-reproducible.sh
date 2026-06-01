#!/usr/bin/env bash
# Runs the reference scenario twice and asserts byte-identical results.
set -euo pipefail
if command -v sha256sum >/dev/null 2>&1; then HASH="sha256sum"; else HASH="shasum -a 256"; fi
cargo build --quiet
./target/debug/kshana scenarios/clock-holdover.toml >/dev/null
a=$($HASH scenarios/clock-holdover.result.json | awk '{print $1}')
./target/debug/kshana scenarios/clock-holdover.toml >/dev/null
b=$($HASH scenarios/clock-holdover.result.json | awk '{print $1}')
if [ "$a" != "$b" ]; then echo "FAIL: non-deterministic result"; exit 1; fi
echo "OK: reproducible ($a)"
