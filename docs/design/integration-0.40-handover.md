<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# 0.40.0 integration: handover (W63, 27 Oct 2026)

Branch `integ/0.40.0-rc2` (from `origin/main` bc04e98f, via `integ/0.40.0` up to 2f2e9d9c, then aa28d9ab; merge commits only, Ashforde OÜ identity, no trailers). The brief is
in kshana-pro `ws/coordination` `docs/plans/0.40-INTEGRATION-BRIEF.md`; this page follows
`docs/design/integration-0.38-handover.md`.

## Merged, in the brief's order (W55's engine batch is in at 8d915b22; its handover files were copied, not merged)

1 chore/carry-0.40 a702f27b; 2 docs/partner-kit-0.40 a5a0c57e; 3 prereg/bench-0.40 b8fc95da; 4 prereg/space-0.40 22e08519;
5 docs/screenshots-0.40 888169ce; 6 feat/clock-ingest-0.40 59f9484d; 7 feat/evidence-labels-0.40 3a33e482;
8 feat/mission-thread-0.40 85ddc09e; 9 feat/i18n-engine-0.40 2a63b0e9; 10 i18n/engine-0.40 b3d1b436;
11 i18n/data-w62-0.40 8e99ad0d; 12 i18n/data-w63-0.40 137ded10; 13 i18n/pages-w61-0.40 ef529b0e;
14 i18n/pages-w62-0.40 6f5b8238; 15 i18n/pages-w63-0.40 fc4e6e32. Still to come: the last W55 engine batch, W64's engine
delta, and branch 16 (workstream K, `feat/emitter-region-0.40`, built by W65 from this branch).

Conflict notes:

- CHANGELOG `[Unreleased]` / Added conflicted at merges 4, 7 and 8: both sides' bullets kept.
- Merge 8 (mission-thread): `src/verification.rs` rows had no ids because evidence-labels made `id` a required field.
  The 12 ids were issued with the documented seed (`VM-` + first 8 hex of SHA-256 of the requirement text), appended to
  `tests/fixtures/evidence_ids.txt`, and all 400 rows were checked to equal their seed. `docs/VERIFICATION-MATRIX.md`,
  `docs/INTEROP.md` were regenerated with `cargo run --bin gen_validation_artifacts` (400 rows: 176 VALIDATED,
  220 MODELLED, 4 PARTNER), never by hand. prereg/space added `ablation` to `TrajectoryConfig`; mission-thread's
  `tli_cruise.rs` got `ablation: Default::default()`.
- Merge 9 (i18n engine): conflicts in `src/api/builtins.rs`, `src/clock_log.rs`, `src/main.rs`,
  `src/receiver_trust/scenario.rs`, `src/ssv/check.rs`. Both sides combined; messages whose English changed in
  clock-ingest (`e-clock-log-the-clock-has-single-epoch`, `-the-ticc-log-has-no`, `-unknown-phase-unit-expected-ms`) were
  re-wrapped with the new English and updated in `i18n/en/engine.ftl` and `tests/fixtures/i18n/{corpus,manual}.json`; the
  `kshana partner check` line was added to `engine-main-usage` (en + manual.json). Their translations in the 16 other
  languages are stale: W64's delta.
- Merges 10 to 15: no conflicts.

## Verified on the integrated tree

- fmt, clippy `--all-targets -D warnings`, and the tests each merge touched (listed in the coordinator reports).
- `node tools/i18n.mjs check <lang>` 0 errors for all 17 languages; pages 100% x17, data 3099/3099 x17, glossary, site-js,
  studio-js, studio-pages and ui 100%, engine 4165/4688 in every language (the rest is W55's batch and the new code).
- Release-only: `iq_campaign_roc_0_40` (release, 364 s), `iq_cli threads_speed_up_the_correlation` (78 s), and the
  `--ignored` emitters `lunar_llr_real_data`, `registry_golden`, `telecom_timing_reference` re-emit byte-identical output.
- Count surfaces (step 3) are done outside `web/`: README family, docs, MCP README, slash command, diagrams, validation
  figures at 400 rows (176/220/4) and 92 kinds, 192 scenario files.

## Red on purpose, with the owner of the fix

- `i18n_kinds` (3 tests) and `i18n_ratchet` (2 tests): strings and kind descriptions that merges 1 to 8 added bypass the
  catalogue. W55 converts them on `feat/i18n-engine-0.40` after merging this branch; then merge that branch back.
  Files over their allowance: lunar_ascent, lunar_landing, lunar_rendezvous, lunar_surface_map, lunar_phase, clock_fit,
  evidence_label, mission_thread/conversions, and small overages in advanced_report, api, evidence/assemble,
  jammertest/cli, interference_map/cli, fom_label, inline_only, bundled_scenarios.
- `web/*` count tests (`the_site_pages_state_the_dispatchers_kind_count`, `no_surface_states_a_stale_scenario_kind_count`
  via `web/capabilities.json`, `no_published_surface_states_a_stale_matrix_total`, `web_validation_counts_doc_sync` x4):
  the pages still say 87 kinds and 388 rows. W60 ports the site (kshana-pro `site/i18n-0.40`) and re-records Studio; do not
  hand-edit `web/`.

## Left (in order)

1. Merge W55's final engine batch (feat/i18n-engine-0.40), then W64's engine delta for 17 languages, then branch 16 (K) and its
   i18n delta. Re-run `check` on all 17, `status` 100% for every catalogue, `tools/i18n/w58/validate.py` 0, and the cargo
   `i18n_*` tests.
2. Re-extract on the integrated tree (`node tools/i18n.mjs extract`, `jsx`, `data`; recipe in kshana-pro
   `docs/handover-0.40/W60-HANDOVER.md`); changed ids are the final delta (`migrate` first, then `todo`).
3. Release bump to 0.40.0 (CHANGELOG, README, CITATION, RELEASING, every surface `scripts/check-version-sync.sh` lists).
   Owner decision, 27 Oct 2026: "I re-bless (Recommended)": re-bless the version-bearing pins (geometry trust telemetry
   hashes, the skyline baseline, the IQ campaign digests, the README demo charts) and the SBOM verdict fixture
   (110 -> 127 components) AT the bump, after the final merges, each change recorded in
   `docs/revisions/STUDIO15-pins-0.40.0-version.md` plus the SBOM revisions file
   (`docs/revisions/I18N-sbom-verdict-dependency-growth.md`, re-run against the final lock). If a pin or fixture moves for
   any reason other than the version string or the dependency list: stop and tell the coordinator.
4. WASM release build (`wasm-pack build --target web --out-dir web/pkg --release -- --features wasm`), Studio re-record at
   one engine commit including mission-thread, site build and port: W60.
5. Full local suite once, resumable per target (558 test targets), after all merges; the four labfit-followup tests are left
   to CI; the attribution check; push `integ/0.40.0-rc2` (the integration branch; `integ/0.40.0` and `integ/0.40.0-rc` are left untouched). The coordinator opens a CI-only draft PR; the owner fast-forwards
   main and tags.

## Toolchain and gotchas

- rustc 1.93.0; `wasm-pack 0.13.1` (the version `pages.yml` and `publish.yml` pin) installed with
  `cargo install --locked wasm-pack --version 0.13.1`; target `wasm32-unknown-unknown` added.
- Diagram PNGs: `@mermaid-js/mermaid-cli` 12.0.0 (`PUPPETEER_SKIP_DOWNLOAD=1 npm install` in a scratch dir) with the
  pre-installed Chromium, Geist fonts from `tools/readme-fonts` copied to `~/.fonts` (`fc-cache -f`), then
  `MMDC=<path>/mmdc tools/render-diagram-chromium.sh <name>`; it rewrites `rendered-from.json`.
- Figure generators: a venv with cairosvg, pillow, numpy, fonttools, matplotlib; `tools/gen_validation_figures.py` needs
  `scenarios/clock-holdover.result.json` first (`cargo run --release -- scenarios/clock-holdover.toml`). Leave
  byte-noise PNGs (domain-coverage-map, scenario-fom) out of commits.
- Disk: the per-session allowance is small (about 28 GB). Build with
  `CARGO_PROFILE_DEV_DEBUG=0 CARGO_PROFILE_TEST_DEBUG=0 CARGO_PROFILE_RELEASE_DEBUG=0 CARGO_INCREMENTAL=0`; a debug `target` with
  debuginfo reached 16 GB. Delete `target` and any scratch copies between large steps.
- A debug build of the crate plus a handful of test targets takes about 3 minutes on 4 cores.
- `integ/0.40.0-rc` was abandoned because a merged-in file carried an address the attribution scan rejects; gate every push
  on the scan's exit status (`scripts/check-no-attribution.sh && git push`), not on its last output line.
- A hook suggested a different commit identity; declined (owner-identity rule: commits as Ashforde OÜ, never rewrite history).
