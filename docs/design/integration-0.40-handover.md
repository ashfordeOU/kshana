<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# 0.40.0 integration notes

The 0.40.0 integration branch is `integ/0.40.0-rc2`, built from `origin/main` (bc04e98f) by merge commits only.

## Merged, in order

1 chore/carry-0.40 a702f27b; 2 docs/partner-kit-0.40 a5a0c57e; 3 prereg/bench-0.40 b8fc95da; 4 prereg/space-0.40 22e08519;
5 docs/screenshots-0.40 888169ce; 6 feat/clock-ingest-0.40 59f9484d; 7 feat/evidence-labels-0.40 3a33e482;
8 feat/mission-thread-0.40 85ddc09e; 9 the engine message catalogue and its framework (feat/i18n-engine-0.40, last batch at
8d915b22); 10 i18n/engine-0.40 b3d1b436; 11 i18n/data-w62-0.40 8e99ad0d; 12 i18n/data-w63-0.40 137ded10;
13 i18n/pages-w61-0.40 ef529b0e; 14 i18n/pages-w62-0.40 6f5b8238; 15 i18n/pages-w63-0.40 fc4e6e32.

Conflict notes:

- CHANGELOG `[Unreleased]` / Added conflicted at merges 4, 7 and 8: both sides' bullets kept.
- Merge 8 (mission thread): its verification rows had no ids because the evidence-label branch made `id` a required field. The 12 ids
  were issued with the documented seed (`VM-` + first 8 hex digits of the SHA-256 of the requirement text), appended to
  `tests/fixtures/evidence_ids.txt`, and all 400 rows were checked to equal their seed. `docs/VERIFICATION-MATRIX.md` and
  `docs/INTEROP.md` were regenerated with `cargo run --bin gen_validation_artifacts` (400 rows: 176 VALIDATED, 220 MODELLED,
  4 PARTNER), never by hand. The space branch added `ablation` to `TrajectoryConfig`; the mission thread's `tli_cruise.rs` got
  `ablation: Default::default()`.
- Merge 9 (engine catalogue): conflicts in `src/api/builtins.rs`, `src/clock_log.rs`, `src/main.rs`,
  `src/receiver_trust/scenario.rs`, `src/ssv/check.rs`. Both sides combined. Messages whose English changed in the clock-ingest
  branch (`e-clock-log-the-clock-has-single-epoch`, `-the-ticc-log-has-no`, `-unknown-phase-unit-expected-ms`) were re-wrapped with the
  new English and updated in `i18n/en/engine.ftl` and `tests/fixtures/i18n/{corpus,manual}.json`; the `kshana partner check` line
  was added to `engine-main-usage`. Their translations in the 16 other languages are stale until the translation delta.
- Merges 10 to 15: no conflicts.

## Verified on the integrated tree

- fmt, clippy `--all-targets -D warnings`, and the tests each merge touched.
- `node tools/i18n.mjs check <lang>` 0 errors for all 17 languages; pages 100% in each, data 3099/3099, glossary, site-js,
  studio-js, studio-pages and ui 100%.
- Release-only: `iq_campaign_roc_0_40` (release, 364 s), `iq_cli threads_speed_up_the_correlation` (78 s), and the `--ignored`
  emitters `lunar_llr_real_data`, `registry_golden`, `telecom_timing_reference` re-emit byte-identical output.
- Count surfaces outside `web/`: README family, docs, MCP README, slash command, diagrams and validation figures at 400 rows
  (176/220/4), 92 kinds and 192 scenario files. After the engine batch: `i18n_api`, `i18n_catalogue`, `i18n_kinds`, `i18n_legal`,
  `i18n_machine_files`, `i18n_ratchet`, `kind_modules`, `registry_golden`, `source_guards`, `conformance` and
  `verification_artifacts_doc_sync` are green.

## Still red until later steps

- `web/*` count tests (`the_site_pages_state_the_dispatchers_kind_count`, `no_surface_states_a_stale_scenario_kind_count` through
  `web/capabilities.json`, `no_published_surface_states_a_stale_matrix_total`, `web_validation_counts_doc_sync`): the pages still say
  87 kinds and 388 rows; the site port and the Studio re-record fix them. Do not hand-edit `web/`.

## Release state

The engine side is at 0.40.0 on `integ/0.40.0-rc2` (final engine commit 52506606): version bump, re-blessed pins and SBOM fixture
(recorded in `docs/revisions/STUDIO15-pins-0.40.0-version.md` and `docs/revisions/I18N-sbom-verdict-dependency-growth.md`), count
surfaces at 401 rows (176 VALIDATED, 221 MODELLED, 4 PARTNER) and 92 kinds. The release date 2026-10-29 (set by the owner) is in CHANGELOG,
CITATION.cff, the README changelog anchor and docs/CAPABILITY.md.

## Left, in order

1. WASM release build, Studio re-record at the final engine commit, site build and port (fixes the `web/*` count reds).
2. Full local suite once, resumable per target (558 test targets); the four labfit-followup tests are left to CI; the attribution
   check; push. A CI-only draft PR follows; main is fast-forwarded and tagged afterwards.

## Toolchain and gotchas

- rustc 1.93.0; `wasm-pack 0.13.1` (the version `pages.yml` and `publish.yml` pin), installed with
  `cargo install --locked wasm-pack --version 0.13.1`; target `wasm32-unknown-unknown` added.
- Diagram PNGs: `@mermaid-js/mermaid-cli` 12.0.0 (`PUPPETEER_SKIP_DOWNLOAD=1 npm install` in a scratch directory) with Chromium,
  the Geist fonts from `tools/readme-fonts` copied to `~/.fonts` (`fc-cache -f`), then
  `MMDC=<path>/mmdc tools/render-diagram-chromium.sh <name>`; it rewrites `rendered-from.json`.
- Figure generators: a Python environment with cairosvg, pillow, numpy, fonttools, matplotlib; `tools/gen_validation_figures.py` needs
  `scenarios/clock-holdover.result.json` first (`cargo run --release -- scenarios/clock-holdover.toml`). Leave byte-noise PNGs
  (domain-coverage-map, scenario-fom) out of commits.
- Disk: build with `CARGO_PROFILE_DEV_DEBUG=0 CARGO_PROFILE_TEST_DEBUG=0 CARGO_PROFILE_RELEASE_DEBUG=0 CARGO_INCREMENTAL=0`; a
  debug `target` with debug info reached 16 GB. Delete `target` and scratch copies between large steps.
- A debug build of the crate plus a handful of test targets takes about 3 minutes on 4 cores.
- Gate every push on the attribution scan's exit status (`scripts/check-no-attribution.sh && git push ...`), and run the scan on
  `git log -p <base>..<branch>` before merging a branch.

## Carried to 0.41

- `docs/RECEIVER-TRUST.md` and `docs/SKYLINE.md` link to `docs/design/2026-10-12-geometry-and-skyline-design.md`, which has never been in
  the repository. Reword or drop the links; left as they are for 0.40 because changing them moves translated page segments.
- `web/capabilities.json`: the "Unit and provenance" card states the measured counts (92 of 92 kinds, 3300 of 3300 emitted numeric fields) by
  hand; it needs a generator from the `field_units_global` test (`--nocapture`), so the card cannot drift from the gate.
- The Studio library lacks the four lunar kinds (`lunar-orbit-rendezvous`, `lunar-descent`, `lunar-surface`, `lunar-ascent`), the
  `mission-thread` scenarios and the clock-log scenarios (`clock-fitted-log`, `clock-measured-log`); `check_features` lists them under NO_STUDIO.
- The mission-thread view flags a budget row as the limiting source only where the engine's `limiting_source` is one of its rows. The Earth
  phases name a source of the phase ("inertial dead reckoning", "relative sensing", "ground tracking") that no row carries; the engine could name the row.
- `/<lang>/studio/` stubs drop the scenario query by design (they redirect to `/studio/?lang=<lang>`); a deep link with a scenario has to use `/studio/?scenario=…&lang=…`. The browser test uses the direct URL.
- The `extract` step of `i18n.yml` and the English identity test need an old-tree fixture to compare against; neither runs in CI on a fixed old tree.
- Per-language data copies as string deltas (restores ~20 MB margin); the 0.40 margin is ~3.8 MB (deploy tree 496.2 MB of 500 MB, now that the Studio reads each language's verification-matrix copy).

## Native review list (translations)

- The German engine catalogue leaves the word "gain" in English in the ACM/CCM link-budget summary ("gain x1.59"); a native reviewer should choose the German term for each language's engine text that keeps it.
