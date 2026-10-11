# Final-pass re-record of the Studio (run with the final release-candidate head)

`RC` = the final rc commit (full 40-hex SHA), `K` = a checkout of it. All paths below are in this folder.

1. Package: build with `wasm-pack build --target web --out-dir web/pkg --release --no-opt -- --features wasm` (wasm-pack 0.13.1) in `K`; copy `kshana.js kshana_bg.wasm kshana.d.ts package.json LICENSE` into `pkg/` (the wasm is a Git LFS object: `git lfs track` already covers it). Run `node K/web/smoke.mjs`.
2. CLI: `cargo build --release --bin kshana` in `K`.
3. Native recordings: `node tools_native.mjs --repo K --bin K/target/release/kshana --work <scratch> --jobs 4` (stamps `engine_commit` from `git -C K rev-parse HEAD`; `--engine-commit <sha>` overrides).
4. Browser recordings: `node tools_record.mjs --engine-commit RC`.
5. Derived data: `node tools_areas.mjs`, `node tools_bundle.mjs`, `node tools_links.mjs`.
6. Studio data: copy `K/web/capabilities.json` and `K/web/data/{verification-matrix,card-matrix-map,oracle-references,standards-matrix-map}.json` into `data/` (after the ledger is regenerated; counts are never typed by hand); `K/packaging/channels.json` to `channels.json`.
7. Examples: `node tools_trust_demo.mjs --kshana K/target/release/kshana --repo K`, then `tools_training_demo.mjs`, `tools_interference_demo.mjs --repo K`, `tools_tools_examples.mjs --kshana ... --repo K`, `tools_osnma_examples.mjs --repo K`.
8. Gates: `node --test lib/*.test.mjs`; `node selfcheck.mjs --final` (fails unless both recordings carry the same full `engine_commit`, and the recordings, channels.json and package agree on the version); phone widths 360 and 390 on every page.
