<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Moving the engine's human-facing text into the catalogue

The tool is localised in sixteen languages beside English. `src/i18n/` is the framework,
`locales/en/engine.ftl` the source catalogue, `locales/<tag>/engine.ftl` the translations. This page is the
working rule for moving a string out of the Rust source, by hand, where `scripts/i18n_codemod.py` could not.

## What moves, and what stays

**Moves** (human-facing: a person reads it in a terminal, a report or a chart):

- messages the command line prints, and every error message;
- the text of `report.html` and `summary.html`: headings, paragraphs, table headers, notes, legends;
- the text of SVG charts: titles, axis labels, legends, captions, the evidence strip;
- verdict and evidence words (`MODELLED`, `VALIDATED`, `NOT MET`, pass and fail) where they are rendered
  into any of the above;
- the one-line summaries of the kinds, and the descriptions `kshana kinds` prints.

**Stays English** (a machine document, whatever language the user chose): JSON keys, field values that are
prose written into the JSON (a result's `summary`, `figure_tiers`, the `units` definitions, `provenance`
strings, the evidence labels inside JSON), the verification matrix and its ledger rows, CSV headers and file
names, error codes. A non-English run executes the scenario twice: once in English for the machine files,
once in the user's language for the human output (`api::run_toml_lang`), so a string that feeds both is
converted once and the machine copy is still English.

## How to convert one string

1. Write the English text, byte for byte, as a message in `locales/en/engine.ftl`, in the section of its
   file (`## src/path.rs`). Id: lower case, hyphens, `<area>-<what>` (`e-...` for an error message). Messages
   are one per string, not one per sentence of a table.
2. Variables are named (`{ $count }`) and are strings: format numbers in Rust with `i18n::num(x, 2)`
   (`{x:.2}`), `num_e` (`{x:.2e}`), `num_plain` (`{x}`), so the locale's decimal mark applies and English is
   `format!` exactly. A plural or a gender is a Fluent selector over a variable the Rust passes.
3. In Rust: `crate::t!("id", count = n)` (`kshana::t!` in the bin crate); an error: `crate::terr!(..)`. Any
   `String` the old `format!` made, `t!` makes.
4. Escapes in `.ftl`: a brace is `{ "{" }` / `{ "}" }`; leading and trailing whitespace of a line is
   `{ " " }`; a newline at the very start or end of a value is `{ "\u000A" }`; everything else is literal.
5. Record the original so the test can prove English did not move: add to
   `tests/fixtures/i18n/manual.json` `{"id": ..., "error": false, "parts": ["text ", {"var": "x"}, " text"]}`
   with the template exactly as the Rust printed it, written BEFORE you delete the Rust literal.
6. Markup stays in Rust. Convert the text nodes only: `format!("<text x=\"{x}\">{}</text>", t!("id"))`, never
   the tags. A text node that is a single placeholder needs no message.

## Checking

```
cargo fmt
cargo test --test i18n_catalogue        # English reproduces every recorded template; ids used; variables match
cargo test --lib i18n
cargo clippy --all-targets -- -D warnings
python3 scripts/i18n_scan.py <files>    # what is left in a file (literals with two or more words)
```

The determinism proof for a batch is the existing suite unchanged (`cargo test --release`, goldens,
hashes) plus the catalogue test: English output must not move, and no pinned hash may move.

## What the scan still finds

`scripts/i18n_scan.py` lists the literals with two or more words that are not messages. Most are machine
documents or data (a ledger row, a unit definition, a provenance string). Each file's remainder is either
converted or recorded in `tests/fixtures/i18n/allow.json` with a reason (`machine-document`, `data`,
`developer`, `identifier`); `tests/i18n_ratchet.rs` fails if a file has more than its allowance.
