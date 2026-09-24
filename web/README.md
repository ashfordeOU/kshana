# Kshana browser playground

A static, single-page playground that runs the Kshana engine entirely in the
browser as WebAssembly (WASM) — no server-side computation, nothing uploaded. Pick a
reference scenario or edit its TOML (Tom's Obvious, Minimal Language — the plain-text
scenario format) and run it; the result panel shows the
one-line summary, the figures of merit, time series, stability, a 3-D orbit
view and the full JSON, plus an A/B compare, a parameter sweep, a downloadable
report, an embeddable mode and a guided tour. The same page carries the
capability explorer, the standards grid and the full validation ledger.

## Build and serve locally

```sh
./web/build.sh                     # compiles the WASM module + stages assets
python3 -m http.server -d web 8000 # serve over HTTP (required for WASM)
# open http://localhost:8000/
node --test web/*.test.mjs         # the front-end module tests
```

`build.sh` runs `wasm-pack` (target `web`) into `web/pkg/`, copies the reference
scenarios into `web/scenarios/`, the banner and the fonts into `web/assets/`,
and overwrites `web/pkg/README.md` with `README.npm.md`. Those three
directories are build outputs and are git-ignored (`.gitignore`); everything
else under `web/` is source and is tracked.

Two kinds of source file are worth calling out before editing the page:

- `capabilities.json` is the structured source for the capability cards and the
  standards grid — **edit that, not the HTML**.
- `data/verification-matrix.json` is generated (`cargo run --bin
  gen_validation_artifacts`) and pinned by
  `tests/verification_artifacts_doc_sync.rs`; do not edit it by hand. The other
  three files in `data/` are hand-maintained mappings that the same test checks
  against the generated matrix.

Each `*.mjs` module is pure logic with a matching `*.test.mjs`; the DOM (Document Object Model, the
page's element tree) drivers live in `app.js`, which has no test of its own.

## Deployment

The `pages` GitHub Actions workflow builds the site and publishes it to GitHub
Pages on every push to `main`. Enable Pages for the repository with the
"GitHub Actions" source for it to go live.
