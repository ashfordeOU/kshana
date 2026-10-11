#!/bin/sh
# Rewrite the sample inputs and their expected `kshana osnma verify --json` output.
# Run from the repository root. The inputs come from the synthetic generator in
# tests/osnma_synthetic.rs (no random numbers), so the files are the same every time.
set -eu
KSHANA_WRITE_OSNMA_EXAMPLES=1 cargo test --test osnma_synthetic the_osnma_sample_files_are_current
