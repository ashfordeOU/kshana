<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Handover: the engine side of localisation (W55)

State: `feat/i18n-engine-0.40` @ the commit that adds this file, containing `integ/0.40.0-rc` (aa28d9ab).
Read `docs/i18n.md` first (what is localised, how a language is chosen, the run-twice rule, wasm). This page is
what is left, how the pieces fit, and what bit us.

## What exists

- `src/i18n/`: the framework (Fluent, per-run language, pseudo-locale en-XA, error-code registry, number
  formatting, `register_catalogue`, `in_english`). `src/legal.rs`: the 17 advisory/disclaimer/notice messages.
- `i18n/<lang>/engine.ftl`: 18 catalogues, ids prefixed `engine-`. English: 4,877 messages (2,878 are `e-*`
  errors). About 5,000 call sites use `t!`/`terr!`/`tx!`. Companion lists in `i18n/en/`: `engine-counts.txt`
  (count variables, for plural forms), `engine-numbers.txt` (numbers passed as placeables),
  `engine-fragments.txt` (empty by design), `engine-changes-since-*.txt` (what translators must pick up).
- Entry points: CLI `--lang`/`--verbose`, `api::run_toml_lang`/`run_toml_bilingual`/`run_toml_human`/
  `run_scenario_lang`/`list_scenario_kinds_json_lang`/`error_info_json`, Python/WASM `lang` options and `run_human`,
  `error_info`, MCP `lang`, wasm `register_catalogue`.
- Rules enforced by tests: `i18n_catalogue` (English reproduces a recorded original template for every message),
  `i18n_ratchet` (two ratchets: two-word literals per file, and human-facing sink literals per file; counts may
  fall and never rise), `i18n_machine_files` (JSON/CSV/etc. byte-identical in English, de and en-XA across the
  subcommands), `i18n_legal`, `i18n_kinds`, `i18n_api`.

## How to add or change a message

`docs/design/i18n-migration.md`. In short: write the English message in `i18n/en/engine.ftl`, record its original
template in `tests/fixtures/i18n/manual.json` before deleting the Rust literal, call `t!("id-without-engine-prefix",
name = value)` or `terr!` for errors, put numbers through `i18n::num*`, never leave a literal decimal in message text,
build machine documents under `i18n::in_english`. Scripts: `i18n_codemod.py` (regenerable bulk conversion, do not
edit), `i18n_scan.py` / `i18n_sinks.py` (what is left, two ways), `i18n_compare.py` (whole-run English identity,
baseline binary against current), `i18n_numbers.py`, `i18n_kinds.py`, `i18n_compliance.py`, `i18n_fragments.py`.

## Measured coverage (method and caveats)

- Sinks (print/write/Display/error/markup literals with a word of 3+ letters, outside tests): 558 literals in 149
  files at the start of the pass, 113 in 27 files now, every one with a reason in `sinks-allow.json` (signed
  evidence HTML, machine-format writers, identifiers, public `&'static str` errors, developer binaries).
- Two-word literals outside the catalogue: 19,310 in 353 files, every file with an allowance and a reason in
  `allow.json`. A random sample of 120 (earlier in the work) was about 4% human-facing, the rest field names, units,
  provenance and scenario names. Treat "about 85% of human-facing text" as an estimate (sample reading, +-4 points),
  not a measurement. The sink figure is the precise one.

## Open items

1. **Full suite on the merged tree has not been re-run** (last full run: c7bef170 plus fixes, all green except the
   four multi-hour tests of `tests/iq_labfit_followup.rs`, which CI's `labfit-iq-followup` job runs).
2. **0.41: one-run rendering** (docs/i18n.md): a non-English run costs exactly twice the English one (measured:
   the slowest scenario 9.2 s -> 17.9 s). The Studio hides it with `run_human` after the English result.
3. **Rust-built English words** that stay English in every language: PASS/FAIL/closes/TC/TM words in lunar_interop,
   linkbudget, space_packet; `v7`-type pieces in aocs_kind, contact_schedule, quantum_trade, leo_signal,
   impairment_eval; the drag-off direction phrase in nmea-synth. (PASS/FAIL stay English like the verdict words by
   decision; the rest are small.)
4. **Not seen by the scanners**: `err("...")` helper calls in `bench/tasks.rs`, bare `fail("...")` in `main.rs`.
5. **Not exercised end to end**: the iq-labfit hold-out events clause; receiver-trust and iq-labfit optional
   clauses are standalone sentences joined with "; " by Rust (three or more clauses would need 8-16 variants).
6. **New subcommands and new text**: any subcommand that writes JSON/CSV must build it under `in_english`; the
   ratchets and `i18n_machine_files` are the net, not a proof. New modules arrive with English literals; the ratchets
   will say which and the allowance needs a specific reason after reading a sample.
7. **Pins**: the SBOM verdict moved with the new dependencies (`docs/revisions/I18N-sbom-verdict-dependency-growth.md`);
   re-run its procedure against the final lock. `cargo deny` runs in CI (permissive licences, listed in docs/i18n.md).

## What bit us (so it does not again)

- WebAssembly: modules not built for wasm (`iq::campaign`, `iq::labfit::iqfit`, `evidence::roundtrip`) broke
  `legal.rs`; CI's wasm job now builds `--features wasm` too. Always build `wasm32-unknown-unknown --features wasm`.
- Source-scanning tests (`leo_navmsg` host-mathematics scan, `source_guards` temp paths, `workshop_preset_isolation`
  names, the SBOM oracle) react to new code and files. Scratch directories in tests: an `AtomicU64` counter bound to
  a name of 2+ letters. The withheld workshop preset file is neither scanned nor named in allowances.
- Generated files rewritten in place (`manual.json`, `engine.ftl`) race between agents and scripts: one agent per
  tree, scripts replace their own section only (`i18n_kinds.py` once truncated the catalogue after its section).
- Long cargo runs die with session restarts: use the resumable per-target runner pattern (one `cargo test --test X`
  per target, results appended to a file).
- Commits on this branch are authored as Ashforde OÜ (the project's identity for these branches); a hook suggested a
  different identity and was declined. History was not rewritten.
