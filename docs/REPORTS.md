<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Run reports

Every run of the command-line interface (CLI) writes a report beside its result: a
printable HyperText Markup Language (HTML) page, `<scenario>.report.html`, and a
machine-readable JavaScript Object Notation (JSON) document, `<scenario>.report.json`,
with the same content. The report works for any scenario kind and for campaigns.

```bash
kshana scenarios/clock-holdover.toml
# wrote scenarios/clock-holdover.result.json, scenarios/clock-holdover.chart.svg,
#   scenarios/clock-holdover.report.html, and scenarios/clock-holdover.report.json
```

The result document answers *what the engine computed*. The report adds what a reader
needs before acting on it: what went in, what the numbers rest on, what was left out, and
how to get the same bytes again. It invents none of that. Every section is read from a
source the engine already keeps, and names the source beside what it quotes.

The builder is `kshana::advanced_report` (`src/advanced_report.rs`). It is a pure
function of the run output, the scenario file's bytes and the command line: it reads no
clock, no file and no network, and it builds for WebAssembly.

## Sections

| # | Section | What it holds | Read from |
|---|---|---|---|
| 1 | Executive summary | what the kind does, the run's one-line summary, headline figures, the run-level honesty label, the count of VALIDATED / MODELLED / PARTNER capabilities used | the kind catalogue (`kshana kinds --json`), the result's `label`, its `figure_tiers` block or figure-of-merit block, a Monte Carlo campaign's percentiles |
| 2 | Inputs | every field the scenario file sets, flattened to its path, with its unit and where the unit came from | the scenario file; units from the result's `units` block (the field-units schema, `docs/field-units-schema.json`), else the field-name suffix (`_s`, `_ns`, `_m`, `_deg`, `_dbw`, …); a unit neither states is printed as **not stated** |
| 3 | Results | the run's chart, every scalar of the result document with its unit, and a count / minimum / maximum / first / last summary of every numeric column | the result document and its `units` block |
| 3a | Aggregation (campaigns and sweeps) | a sweep's node table; a Monte Carlo run's mean, standard deviation, 5th / 50th / 95th percentiles and the 95% confidence interval on the mean, with a histogram per metric; a chain's phase table; a composition's shared conditions, members and combined summary | the campaign result's `sweep`, `monte_carlo`, `timeline` or `compose` section; a `sweep` or `sweep-nd` result's grid |
| 3b | Animation and exports | the run's animated drawing (the `--animate svg` output) embedded as an inert image, or why there is none; links to the animation and interoperability files the same command wrote beside the report; every export format with whether it applies to the scenario, why not, and its specification | the animation exporter (`src/animation.rs`), `interop::plan` and the files the command line wrote (`--animate`, `--export`) |
| 4 | Events timeline | timed windows and point events, drawn and tabulated on the run's time axis | scenario tables with `t0`/`t1`, `on_s`/`off_s`, `start_s`/`end_s` or an onset time; the run span `time.duration_s`; any `events` array in the result; a campaign's phases and hand-offs |
| 5 | Verification labels | every verification-matrix row the run's kinds exercise, with its label, oracle and test evidence, and the per-figure tiers the result states | the verification matrix (`src/verification.rs`, `docs/VERIFICATION-MATRIX.md`), through the kind-to-row crosswalk `advanced_report::KIND_CAPABILITIES` |
| 6 | Not modelled, and assumptions | each limitation, quoted | the result's `not_modelled`, `not_implemented` and `honesty` blocks; MODELLED clauses of the kind catalogue; scenario comments and input text that say "not modelled"; the matrix's reason each MODELLED row stays modelled (`docs/MODELLED-RATIONALE.md`) |
| 7 | Reproducibility record | engine version, source commit, Secure Hash Algorithm 256-bit (SHA-256) digests of the scenario file and of the result document, seed, platform, the exact command, the working-directory rule, the digest of every further input file | the build, the files, the command line |

A section with nothing to list says why in one sentence (for example, "No timed event:
the scenario scripts no window or onset time and the result reports no event"). No
section is ever empty and silent.

## What a label in the report means

A verification label grades the **capability** named in a matrix row, as the matrix
records it. It does not grade the scenario's configuration, and a VALIDATED row does not
make a run's inputs measured. A PARTNER row is a discipline the run relies on and that
Kshana does not provide (antenna hardware for the radio-frequency kinds, the quantum
payload for the quantum kinds, the spacecraft bus for the attitude budget); the report
shows it as *relied on, not provided*.

The crosswalk from kind to rows is a table of matrix `requirement` strings. The label,
oracle and evidence are read back from the matrix when the report is built, so moving a
row between VALIDATED and MODELLED moves every report with it. A campaign carries the row
for its mode (chain, sweep or Monte Carlo, compose) plus every row of every member kind it
ran; `sweep-nd` carries the rows of the kind it swept. Every run also carries the
"Reproducibility & software assurance" row, which is what the reproducibility record
rests on.

A row that grades only one input path of a kind is listed only when the run took that
path (`advanced_report::PATH_GATED_CAPABILITIES`): `orbit` and `ephemeris` carry the
"Orbit propagation & determination" row only with a `tle` (the Simplified General
Perturbations 4 (SGP4) path; an analytic orbit is a two-body propagation), and
`slot-timing` carries the measured-record row only with an `oscillator.record`. The same
table gates the `spectrum` multi-band row on the run drawing `[[panels]]`, and the rows
of the low Earth orbit (LEO) kinds on the path each run took: a `leo-pass` or
`leo-pnt-chain` rain, building-entry, low-energy or spoofer row only when the scenario sets
that term, the scintillation row unless the scenario switches it off, a `leo-navmsg`,
`leo-pvt` or chain precise-point-positioning row only for the analysis or mode the result
carries, and the LEO system-preset row only when a named preset is used. The
Shuttle Radar Topography Mission (SRTM) reader row is carried by no kind: `terrain-nav`
and `terrain-slam` run on a synthetic digital elevation model (DEM), and no scenario field
reads an SRTM tile. A VALIDATED row the run never touched would otherwise claim evidence
the run does not have.

## Reproducing a run from its report

`report.json` → `reproducibility` holds everything needed:

```json
"command": "kshana clock-holdover.toml",
"argv": ["kshana", "clock-holdover.toml"],
"scenario_sha256": "430c364d…",
"result_sha256": "ee5ebb0a…",
"seed": 42,
```

1. Check the scenario file against `scenario_sha256`, and any file in `input_files` (an
   `--eop` Earth-orientation file) against its digest.
2. Run `command` from the directory the original run was started in. The scenario path,
   and any relative data path inside the scenario, resolve against it.
3. The new `result.json` has the SHA-256 in `result_sha256`, and the new `report.json` and
   `report.html` are byte-identical to the old ones.

`tests/advanced_report_cli.rs` does exactly this for a clock scenario, a chained campaign,
a sweep campaign and an orbit run with an `--eop` file: it reads the command out of the
report, runs it in a fresh directory holding only the recorded inputs, and compares bytes.

`scenario_sha256` is the digest of the file's exact bytes. The result's own
`scenario_hash` is a different thing, the kind's fingerprint of the scenario (often of a
canonical form), and the report prints both, labelled.

**Seed.** The seed is the scenario's `seed`, else the one the result states. For a kind
that takes no seed the report says so, and that the scenario file and engine build alone
fix the result.

**Source commit.** The engine records the commit only if it was built with the
`KSHANA_GIT_COMMIT` environment variable set, read at compile time:

```bash
KSHANA_GIT_COMMIT=$(git rev-parse HEAD) cargo build --release
```

A build without it reports the commit as not recorded, and the engine version identifies
the release. Nothing is guessed.

**Platform.** Operating system, architecture and family of the build. Results are
byte-identical on one platform; across platforms floating-point results may differ in the
last digits (see [REPRODUCIBILITY.md](REPRODUCIBILITY.md)).

## Determinism and the one timestamp

Same scenario bytes, seed and engine build give a byte-identical `report.json` and
`report.html`. The report carries no timestamp. The only clock reading in the whole
crate is the one `--study-name` makes, which stamps `meta.generated_utc` into the result
document; the report then shows that stamp and says it is the one field a reproduction
will not match. To avoid it, run without `--study-name`. `tests/advanced_report.rs`
builds the report of every scenario file under `scenarios/` (the suite manifest aside)
twice, and re-runs six scenarios (among them
one campaign of each of the chain, sweep and compose modes) to check this end to end.

## Printing to PDF

The engine does not write Portable Document Format (PDF) files. A PDF writer that renders
the charts would mean a new, heavy dependency, so there is no `--report pdf` option.
Instead, `report.html` carries a print stylesheet: open it in a browser, print, and choose
"Save as PDF".

The stylesheet is written for both A4 and US Letter. It sets no paper size (the print
dialog's choice applies), keeps 15 mm / 14 mm margins that fit either sheet, switches to
black on white, repeats table headers on every page, keeps table rows, figures and cards
from splitting across pages, keeps headings with the text that follows, and starts the
inputs, results, verification-labels and reproducibility sections on a new page. The
navigation bar is hidden in print.

## The JSON document

`report.json` has `report_schema = "kshana-report"` and `report_schema_version = "1.0"`,
then `kind` and `title` and one key per section: `executive_summary`, `inputs`,
`results`, `aggregation` (campaigns and sweeps only), `events`, `capabilities`,
`not_modelled`, `companions` (section 3b: `animation`, `exports` and `export_command`)
and `reproducibility`. A list section has `items`, `omitted` (the rows the page cap left out;
the result document carries every value) and, when `items` is empty, a `statement` saying
why. A value keeps its raw JSON form in `value` and the text the page shows in `display`;
a missing value is `null` in `value` and "no value" in `display`.

## Limits, stated plainly

- **Units.** Where neither the field-units schema nor the field name gives a unit, the
  report says "not stated" rather than guessing. Inputs nested inside a campaign's member
  scenarios are resolved against the campaign's own units block and the field-name
  suffix only, so more of them read "not stated" than in a stand-alone run.
- **Crosswalk judgement.** Which matrix rows a kind exercises is a curated table, checked
  by a test to name exactly one existing row per entry and to cover every built-in kind.
  Whether each mapping is the right one is a human judgement, like the matrix's own
  choice of oracle.
- **Caps.** The page lists at most 400 inputs, 150 scalar results, 60 numeric columns and
  200 events; `omitted` counts the rest. A table of more than 24 rows inside a scenario
  (an ingested series) is summarised per column.
- **Suites.** `kshana --study <suite.toml>` keeps its own `<suite>.study.json` and
  `<suite>.study.html`; it does not write this report.
- **Bindings.** The Python and WebAssembly bindings keep `RunOutput::html_report()`, the
  one-page scorecard; the playground's downloadable report is its own page
  (`web/report.mjs`). This report is written by the CLI, and Rust callers can build it
  with `kshana::advanced_report::build`.
