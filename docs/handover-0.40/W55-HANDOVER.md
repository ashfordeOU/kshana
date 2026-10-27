<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# W55 handover: localisation of the engine

The full handover is `i18n/HANDOVER-W55.md` (beside the other workers' i18n handovers). The user-level description is
`docs/i18n.md`; the rule for moving a string is `docs/design/i18n-migration.md`.

In one paragraph: the engine's human-facing text (CLI messages and errors, summaries, SVG chart text, report and other
HTML pages, kind descriptions, the compliance tables, the legal texts) is in `i18n/<lang>/engine.ftl` (4,877 English
messages, 5,000 call sites) and chosen by `--lang` / `KSHANA_LANG` / the locale variables, or a `lang` option in Python,
WebAssembly and MCP. Machine files (JSON, CSV, signed and hashed artifacts) are English in every language, proved by
`tests/i18n_machine_files.rs` and by whole-run byte comparison (`scripts/i18n_compare.py`: 177 scenarios, 0 differences).
Two ratchets (`tests/i18n_ratchet.rs`) stop new English from bypassing the catalogue. Open items for 0.41 are in the
handover: re-run the full suite on the merged tree and CI's labfit follow-up tests, one-run rendering instead of
run-twice, a few Rust-built English words, and the SBOM verdict re-run against the final lock.
