# Line coverage — the measurement of record

The "~96 % line coverage" on the README badge, the README CI table, the crates.io and
PyPI front pages and the kshana.dev hero is **this** measurement, rounded to the nearest
whole percent. `tests/coverage_figure_doc_sync.rs` fails if any of those five surfaces
states a different figure from the one recorded below, so the next re-measurement moves
all of them together or none.

| | |
|---|---|
| Measured | **95.63 %** — 37,697 of 39,419 lines |
| Commit | `b1d350d` (engine 0.27.2 + unreleased) |
| Run | GitHub Actions, `ci.yml` job `coverage`, run 35934579709, 2026-09-24 |
| Tool | `cargo tarpaulin --engine llvm` (LLVM source-based instrumentation) |
| Scope | `src/`, excluding the generated data tables `src/*_data.rs` and the thin CLI entry point `src/main.rs`; `tests/` and `web/` are not measured |
| Artifact | `coverage-lcov` (`lcov.info`, 239 source files) attached to that run |
| Floor | the same job fails below **85 %** (`--fail-under 85`) — the floor is enforced on every push; the figure above is a record, not a gate |

The command, verbatim from `.github/workflows/ci.yml`:

```bash
cargo tarpaulin --engine llvm --out Lcov --output-dir coverage \
  --exclude-files 'src/*_data.rs' --exclude-files 'src/main.rs' \
  --exclude-files 'tests/*' --exclude-files 'web/*' \
  --timeout 3600 --fail-under 85
```

## Re-measuring

Every push to `main` re-runs the job and attaches a fresh `lcov.info`. To move the
published figure, download the artifact from a green run and sum it:

```bash
gh run download <run-id> -n coverage-lcov -D /tmp/cov
awk -F: '/^LF:/{f+=$2} /^LH:/{h+=$2} END{printf "%.2f%% (%d/%d)\n", 100*h/f, h, f}' /tmp/cov/lcov.info
```

then update the table above and the five surfaces in the same commit; the doc-sync test
names any you miss.

## History

The figure has been re-measured, not re-typed: 95.85 % at v0.17.0 (commit `1daa012`,
2026-06-14, published as ~96 %), and ~97 % in two earlier release notes
(`CHANGELOG.md`, left as history). `paper/kshana-technical-report.md` still says "near
97 %", the value at the time it was written.
