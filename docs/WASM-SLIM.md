# The feature-limited WebAssembly module (`wasm-slim`)

A second WebAssembly build of the engine for an embedder with a download budget: the embedder, whose
WebAssembly budget is 2,800 kB gzip (founder ruling, 15 November 2026: the embedder's budget stays; Kshana
ships a module with only what the embedder calls). The full module (`--features wasm`, the npm package
`kshana`) is unchanged.

## What it carries

| | Full module (`--features wasm`) | Slim module (`--features wasm-slim`) |
|---|---|---|
| Exports | about 70 functions (`src/wasm.rs`) | `version`, `run`, `export_sp3` (`src/wasm_slim.rs`) |
| Scenario kinds | every built-in kind | `constellation-design`, `gnss-sim`, `orbit`, `pvt` |
| Bundled scenarios, OTLP | yes | no |
| Another kind | runs | refused: `unknown scenario id: <kind>` (the registry's error for an unregistered id) |

The three functions have the full module's names and signatures, so a caller that uses only these
three (the embedder: `src/engine/pnt/kshana.ts`, `node.ts`, `src/app/pnt/pnt.worker.ts`) changes only where
it loads the module from. A carried kind gives the same bytes: the run goes through the same code
(schema-version strip, `figure_tiers`, evidence label, provenance stamp); only the kind dispatch is
a shorter table (`api::run_slim_kind`, the same `run_builtin::<T>` call each kind's arm makes in
the full dispatch), so the linker drops every other kind. The one difference: `run(toml, lang)` with a
language other than English gives the same document (in both modules the document is the English
run's), but an error message is in English.

## Size

Measured on 15 November 2026 (rustc 1.93.0, wasm-pack 0.13.1, binaryen version_117; gzip level 9 in
kB of 1024 bytes, as the embedder's `bundle-report.mjs` measures):

| Build | Raw bytes | Gzip |
|---|---:|---:|
| Full, npm `kshana@0.41.0` (wasm-opt -O) | 18,694,193 | 6,073.6 kB (the embedder's build report: 6,115.1 kB) |
| Slim, before wasm-opt | 3,195,828 | 1,065.9 kB |
| Slim, wasm-opt -Oz (`scripts/build-wasm-slim.sh`) | 2,958,116 | 1,032.2 kB |

## Build

```sh
./scripts/build-wasm-slim.sh [out-dir]      # default target/wasm-slim/pkg
```

It needs the pinned toolchain with the `wasm32-unknown-unknown` target, wasm-pack 0.13.1 and
wasm-opt from binaryen version_117, and checks both versions. It builds with `--locked`, remaps
every embedded path to a fixed prefix (so the checkout's location does not reach the bytes), runs
`wasm-opt -Oz --strip-producers` (the `producers` section names how the local wasm-bindgen was
installed, nothing in the module), writes `SHA256SUMS`, prints the size, SHA-256, SHA-512 and the `sha512-…` integrity
string, and fails over `KSHANA_SLIM_GZIP_LIMIT_KB` (default 2800). It publishes nothing.

## Checks

- `.github/workflows/wasm-slim.yml`, on every push: builds the slim module and checks the size
  limit; builds it a second time in another directory and target directory and requires the same
  `SHA256SUMS`; builds the full module; runs `scripts/wasm-slim-parity.mjs`; keeps the module as a
  workflow artifact.
- `scripts/wasm-slim-parity.mjs <full-pkg> <slim-pkg>`: the slim module exports exactly
  `version`, `run`, `export_sp3`; `version()` agrees; every call in
  `tests/fixtures/wasm_slim/embedder_calls.jsonl` returns the same bytes from both; a `jamming`
  scenario is refused by the slim module. The calls file is every engine call the embedder's eight Kshana
  validation cases make (`pnt.kshana-{pdop,hdop,vdop,gdop}-galileo`, `pnt.kshana-klobuchar`,
  `pnt.kshana-rinex-nav-gps`, `pnt.kshana-spp-abmf`, `gnss.kshana-spp-kour`): 57 calls, 4
  `constellation-design`, 32 `gnss-sim`, 2 `pvt` through `run` and 19 `orbit` through `export_sp3`,
  recorded on 15 November 2026 from the embedder's validation run against `kshana@0.41.0`.
- `api::tests::slim_dispatch_matches_the_registry` (`cargo test`): the slim dispatch and the
  registry give the same JSON, SVG, summary and CSV for one bundled scenario of each carried kind.

Result on 15 November 2026: 57 of 57 calls byte-identical between the slim module built from
`main` and the full module built from the same commit, and also between the slim module and the
published `kshana@0.41.0` binary the embedder pins.

## How the embedder would consume it (to decide: the founder and the reviewer)

Nothing is released yet; a release needs the founder's go. Two routes:

1. **Vendored artifact from a tagged release.** The release workflow builds the slim module at the
   tag with `scripts/build-wasm-slim.sh` and attaches `kshana-wasm-slim-<version>.tar.gz` (the four
   files and `SHA256SUMS`) to the GitHub release, with a GitHub artifact attestation (SLSA build
   provenance naming the repository, workflow, tag and commit). the embedder vendors the two runtime files
   (`kshana.js`, `kshana_bg.wasm`) under a path of its own, pins `KSHANA.wasmSha256` and
   `KSHANA.wasmBytes` to the slim binary, and records the tarball's SHA-512 and the attestation in
   its migration note. Anyone can rebuild the tag with the script and compare the SHA-256. No new
   registry dependency; the pin is kept in the the embedder repository.
2. **An npm package `kshana-slim`.** The release workflow publishes the same files as `kshana-slim`
   with npm provenance (SLSA v1), as `kshana` is published today. the embedder depends on
   `kshana-slim@<exact version>`; the lockfile carries the tarball's SHA-512 integrity, the loader
   keeps its SHA-256 check of the binary. Same review path as `kshana@0.41.0` (the reviewer's supply-chain
   review: integrity, binary hash, provenance subject digest, no install scripts).

Either way the embedder changes: the import specifier in `src/app/pnt/pnt.worker.ts` and
`src/engine/pnt/node.ts` (and the `?url` import of the `.wasm`), `KSHANA.package`, `wasmSha256` and
`wasmBytes` in `src/engine/pnt/kshana.ts`, the licence allow-list entry, and its WebAssembly budget
stays at 2,800 kB. Its parity run is this repository's parity check, rerun on the embedder's side against
the pinned binary.
