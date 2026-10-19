<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# 0.38.0 integration: handover (W56, 19 Oct 2026)

Branch `integ/0.38.0` (from `origin/main` c0c77700; merge commits only). Brief and definition of done are in
kshana-pro `ws/coordination`: `docs/briefs/W56-integration-0.38.md`, `docs/plans/0.38-DEFINITION-OF-DONE.md`.

## Done

- All six branches merged: timing-standards a63c1b03, referee 91c4427b, machines 808dca4e, studio-replay d6c29829,
  lab-lunar-standards dd213700, bench-observatory 868fba8e. Conflict notes were reported to the coordinator
  (the evidence pack builders now share `build_receiver_trust_pack_full`; `run_receiver_trust_on_imu`).
- The release commit (`release 0.38.0: ...`): version 0.38.0 on every surface `scripts/check-version-sync.sh` lists
  outside `web/`, JetBrains change-notes, CHANGELOG `[0.38.0] - 2026-10-19`, README "What's new in 0.38", CITATION date,
  `gen_validation_artifacts` (379 rows: 176 VALIDATED, 199 MODELLED, 4 PARTNER; 85 kinds; 171 scenario files),
  README/crates/npm/pypi counts, the three diagram SVGs (text edited) and PNGs (re-rendered with Chromium, because
  `rsvg-convert` is not on Linux; `/workspace/render_svg.mjs` style: inline SVG, `max-width:none`, screenshot),
  `tools/gen_validation_figures.py`, `tools/gen_readme_assets.py`, `tools/gen_og_card.py` (with a cairosvg stand-in for
  `rsvg-convert`), `scripts/gen_mcp_install.py`, `scripts/gen_channels.py`. Python tools need a venv with cairosvg, pillow,
  numpy, fonttools, matplotlib.

## Left (in order)

1. `docs/field-units-schema.json`: emit with `cargo test --release --test field_units_global zzz_emit_field_units_schema -- --ignored`, commit.
2. Pin-bearing tests right after the bump (the full `cargo test --release --all --no-fail-fast`): re-bless what moved with a
   revisions record under `docs/revisions/` (see `STUDIO15-pins-0.37.0-version.md`).
3. wasm package at 0.38.0: install `wasm-pack` (not present), `./web/build.sh`.
4. Studio re-record at one engine commit and site port from kshana-pro `site/studio-0.38` @ 8905bcb with
   `web/tools/port_site.py` (site build per `site-next/ASSEMBLY-RUNBOOK.md` and `PORT-RUNBOOK.md`; add `observatory` to
   `STUDIO_PAGES` in `port_site.py` and to `VIEWS` in `web/site.test.mjs`); `check_features`; screenshots of home,
   capabilities, evidence, developers, /benchmark, replay, optical, holdover, /studio/observatory/ at 1440 and 390 px,
   light and dark. The CHANGELOG has no Studio line yet: add it once the views are ported and checked.
5. The remaining red tests that wait for the port: `web_validation_counts_doc_sync`, `scenario_count_doc_sync`
   (site pages, `web/capabilities.json`), `matrix_total_no_stale_count_doc_sync` (web pages),
   `readme_validation_counts_doc_sync` should already be green.
6. Full suite once; Python binding tests for bench were never run (maturin build, pytest `tests/python`); fix if red.
   Also `cargo deny`, `scripts/check-doc-coverage.sh` (ceiling 964 at 0.38 merge; check), `scripts/check-version-sync.sh`.
7. Push, report SHA and the definition-of-done table with evidence.

## Gotchas

- Disk is limited (about 19 GB free with targets): delete `target`, `/workspace/mcptarget` between steps.
- 4 cores: a release build of the whole crate takes about 10 minutes, the release test build much longer.
- `docs/assets/diagrams/rendered-from.json` binds each PNG to its SVG hash; `tools/render-diagram.sh` writes it, my Chromium
  PNGs replaced the ones it made (the SVG hash in the record is still correct).

## Status at 9626fde9

Local suite green after the part B fixes (palette_sync, required_fields_are_true, SBOM oracle reference at 110 components, bench site CSS in css files). Doc tests, doc-coverage (964/964), no-attribution and version-sync pass. cargo deny is not installed in the container; the CI deny job covers it.
