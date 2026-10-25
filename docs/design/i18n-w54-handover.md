# Handover: W54's translation work (engine delta, interface catalogues)

Written by W54 for the next worker or for W54 after a restart. Branches (kshana): `i18n/engine-0.40` (engine delta, W58's branch plus
the merge of `feat/i18n-engine-0.40` a4411a02 and `i18n/ui-0.40`) and `i18n/ui-0.40` (ui.ftl and glossary.ftl of 17 languages, on
`feat/i18n-site-0.40`). Commit as Ashforde OÜ (author and committer), no trailers, run `scripts/check-no-attribution.sh`, push only
these branches, no PRs, no comments. All translations are machine drafts by an AI model, not reviewed by a native speaker.

## Done
- `i18n/<lang>/ui.ftl` and `glossary.ftl`, 17 languages, 0 problems with `tools/i18n/ui/ui_check.py <lang>` (f5ec2325, README 92763351).
  `tools/i18n/ui/glossary-fixed.json` holds the guide's fixed renderings (terms, advisory sentences, machine-translation notice);
  `extract_guides.py` rebuilds it from `tools/i18n/w58/guides/`. Native review order: `tools/i18n/ui/README.md`.
- Engine delta (`engine.ftl`, 252 ids: 223 new, 44 retranslated of which some overlap, 12 removed ids dropped) for de nl sv da nb fr es
  pt-BR pt-PT fi et cs pl. Tools: `tools/i18n/w58/delta_040.py` (id list), `delta_ids.py` (English chunks 40 to 44),
  `assemble_040.py LANG` (replace, append under `## added in the 0.40 delta`, drop ids not in English). Prompt used for the
  sub-agents: see below. Per-language whole-file check: `validate.py i18n/en/engine.ftl i18n/<lang>/engine.ftl` gives 0 problems in the delta
  ids; the remaining 17 to 31 are older messages (16 are the `# legal:` comment line counted as a second line).

## Open
1. Engine delta for uk ru ja zh-Hans (one sub-agent at a time; per-language prompt in this file's recipe).
2. Coordinator's queue on `i18n/ui-0.40` (merge `feat/i18n-site-0.40`, latest SHA from the coordinator, with a merge commit): the new studio-* ids in
   ui.ftl, 5 observatory ids whose English changed, `studio-pages.ftl`, `site-js.ftl`, `studio-js.ftl`, `data.ftl`; W60's
   `node tools/i18n.mjs check <lang>` and `merge/todo --file` commands apply. Push after each file per language group.
3. Native review: `engine-lunar-interop-chart-*`, kind descriptions, the 8 languages whose advisory the guide does not fix.

## Recipe (engine delta, per language L)
```
export I18N_REPO=/workspace/kshana I18N_WORK=/workspace/scratch/i18n-work/w
python3 tools/i18n/w58/delta_040.py $I18N_WORK/delta-ids.txt && python3 tools/i18n/w58/delta_ids.py 40 $I18N_WORK/delta-ids.txt
# sub-agent per language: translate chunks 40..44 to out/L-NN.ftl, validate.py until 0 problems
python3 tools/i18n/w58/assemble_040.py L
```
Sub-agent prompt: the five chunks, `tools/i18n/w58/guides/L.md`, the language's glossary.ftl, ui.ftl and engine.ftl for wording; keep placeables, numbers,
backtick spans, tier and verdict words; selectors for the ids in `i18n/en/engine-counts.txt`; omit messages with no human words (pl cs uk ru fi et ja
zh-Hans only); never write certified/conformant/compliant as a claim (negated only); `# legal:` messages unchanged.
