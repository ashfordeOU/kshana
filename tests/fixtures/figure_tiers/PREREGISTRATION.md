<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration: per-figure verification tiers for every scenario kind (RM-04)

Committed alone, before the table or the append step exists. RM-04 involves no external
oracle. This page fixes the invariants the change must keep, so that they are not chosen
after the outputs are seen.

## The change

Today four kinds (clock, orbit, hybrid, fusion) end their result document with a
`figure_tiers` block. It names each headline figure, the verification-matrix row that owns
it, and the tier read from that row. RM-04 gives every other built-in kind the same block,
appended in one post-dispatch step in `api::run_toml_inner`. The step is driven by a
per-kind table `fom_label::kind_figures(kind) -> [(path, requirement)]`, and the tier is
read from `src/verification.rs`. The append is byte-compatible with the FUT-27 seam's
`append_figure_tiers`.

## Invariants (fixed now)

1. **Strip identity.** For every kind, `api::without_figure_tiers` of the new document
   equals the old document byte for byte. The registry, cross-platform and output-manifest
   goldens change only by growing their lists of tiered scenarios.
2. **Frozen predictions untouched.** A kind with a frozen prediction gets no block. Today
   that is `lunar-station-coverage`, held in an explicit named list in the code.
   `tests/prediction_frozen.rs` and its reproduce check are not edited. A test fails if a
   listed kind gains the block.
3. **Coverage.** Every built-in kind other than the four that already embed the block, the
   frozen ones and any listed with a stated reason has a table entry. A test fails on a
   kind with no entry or no stated exclusion.
4. **Rows exist.** Every requirement the table names is a row of the matrix, and the tier
   is read from that row, never written in the table.
5. **Paths resolve.** Every path the table names resolves to a value in the output of the
   kind's reference scenario. A figure that is absent or null in a run is skipped, as
   `figure_tiers` already does.
6. **No new halo.** A figure no row owns is listed as `untiered` with the existing reason.
   The table is never filled with a row that does not describe the figure. The `hybrid`
   and `fusion` position figures stay untiered unless a matrix row already owns them.

## Outcome rule

Every invariant must hold before the change merges. One that cannot hold is reported with
the kind and the reason, and is not worked around by widening a test.
