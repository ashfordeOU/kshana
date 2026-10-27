# Handover: W54's translation work (engine delta, interface catalogues)

State at the end of W54's session. Work dir of the sub-agents: `/workspace/scratch/i18n-work/` (`PROMPT.md` for ui/glossary, `PROMPT_ENGINE.md` for the delta,
`post.sh LANG` = assemble + whole-file validate; they are session scratch, the prompts are reproduced in the recipe below).

Written by W54 for the next worker or for W54 after a restart. Branches (kshana): `i18n/engine-0.40` (engine delta, W58's branch plus
the merge of `feat/i18n-engine-0.40` a4411a02 and `i18n/ui-0.40`) and `i18n/ui-0.40` (ui.ftl and glossary.ftl of 17 languages, on
`feat/i18n-site-0.40`). Commit as Ashforde OÜ (author and committer), no trailers, run `scripts/check-no-attribution.sh`, push only
these branches, no PRs, no comments. All translations are machine drafts by an AI model, not reviewed by a native speaker.

## Done
- `i18n/<lang>/ui.ftl` and `glossary.ftl`, 17 languages, 0 problems with `tools/i18n/ui/ui_check.py <lang>` (f5ec2325, README 92763351).
  `tools/i18n/ui/glossary-fixed.json` holds the guide's fixed renderings (terms, advisory sentences, machine-translation notice);
  `extract_guides.py` rebuilds it from `tools/i18n/w58/guides/`. Native review order: `tools/i18n/ui/README.md`.
- Engine delta (`engine.ftl`, 252 ids: 223 new, 44 retranslated, 12 removed ids dropped) for ALL 17 languages (branch `i18n/engine-0.40`:
  de 8382da25, nl d01c37ee, sv, da 7b10bdfa, nb b5b0c162, fr e26614b5, es 4a797f38, pt-BR 400d700e, pt-PT 086c33ed, fi e8d01916, et d70a4af8,
  cs 05f0d38d, pl 3e2321ec, uk 34c6ba06, ru f7cc060d, ja 6bf5827f, zh-Hans last). `cargo test --test i18n_catalogue --test i18n_legal
  --test i18n_api` pass. Tools: `tools/i18n/w58/delta_040.py` (id list), `delta_ids.py` (English chunks 40 to 44),
  `assemble_040.py LANG` (replace, append under `## added in the 0.40 delta`, drop ids not in English). Prompt used for the
  sub-agents: see below. Per-language whole-file check: `validate.py i18n/en/engine.ftl i18n/<lang>/engine.ftl` gives 0 problems in the delta
  ids; the remaining 17 to 31 are older messages (16 are the `# legal:` comment line counted as a second line).

## Open
1. (none left in the engine delta; later W55 batches come as new deltas: `delta_040.py` lists "unhandled in any language plus the ids in
   `engine-changes-since-*.txt` and `engine-numbers.txt`"; adapt it to the new change list.)
2. Coordinator's queue on `i18n/ui-0.40` (merge `feat/i18n-site-0.40`, latest SHA from the coordinator, with a merge commit): the new studio-* ids in
   ui.ftl, 5 observatory ids whose English changed, `studio-pages.ftl`, `site-js.ftl`, `studio-js.ftl`, `data.ftl`; W60's
   `node tools/i18n.mjs check <lang>` and `merge/todo --file` commands apply. Push after each file per language group.
3. Native review: `engine-lunar-interop-chart-*`, kind descriptions, the 8 languages whose advisory the guide does not fix.

## Per-language state
| | ui.ftl, glossary.ftl (i18n/ui-0.40) | engine.ftl 0.40 delta (i18n/engine-0.40) |
|---|---|---|
| all 17 (nl pl pt-BR pt-PT fi sv da nb cs uk ru de fr es et ja zh-Hans) | done, `ui_check.py` 0 problems | done |

Not started (the coordinator's queue, for the next worker): the 423 new `studio-*` ids appended to `i18n/en/ui.ftl` and 5 observatory ids
whose English changed (733bc2f), `studio-pages.ftl` (333, inline markup), `site-js.ftl` (650), `studio-js.ftl` (4,271), `data.ftl` (3,099),
all on `feat/i18n-site-0.40` (latest SHA from the coordinator). Use W60's `node tools/i18n.mjs check|merge|todo <lang>` and `tools/i18n/ui/ui_check.py`
(extend it for the new files; it already checks placeables, tags, plural categories, glossary terms). Page catalogues are for W61 to W63.

## Review notes the sub-agents raised (for a native reviewer)
- "certified"/"conformance" appear only negated; for ARAIM the English names "certification reference vectors" (a source), and several languages say
  certification there descriptively; check `engine-kind-araim-reference-check-description`.
- `engine-lunar-interop-chart-*` (pass, fail, locked, conformance, footnote): some languages translated PASS/FAIL/LOCKED, some kept them.
- The fi negations use "virallisesti hyväksytty" (officially approved) instead of "sertifioitu": looser than English; review.
- da and the other languages reworded `engine-iq-labfit-iqreport-events-loss-time-rms-pi90` in different ways; the selector languages have one.
- `engine-kind-lunar-llr-datum-description` keeps MODELLED in capitals mid-sentence in every language (the validator requires it); it reads awkwardly.

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
