# Handover: W58's translation work (engine catalogue, 17 languages)

Branch `i18n/engine-0.40` (kshana). It is W58's `i18n/w58-0.40` plus the merge of W57's `i18n/w57-0.40` @ adc1f956; push only here.
All catalogues are machine drafts by an AI model, NOT reviewed by a native speaker; every language has `i18n/<lang>/REVIEW.md`
(ranked list for native reviewers: the 17 legal ids first). Read `tools/i18n/w58/README.md` first: it describes the validator, the chunk,
delta, count and assemble scripts, the sub-agent prompts and the recipe for new messages. Also read `i18n/HANDOVER-W57.md` for the
earlier history of the nine W57 languages (its pipeline in `tools/i18n/` is superseded by `tools/i18n/w58/`, which handles all 17).

## State per language, against the English catalogue at 0f6fb1fa (3,636 messages)
| Languages | Messages in `engine.ftl` | Notes |
|---|---|---|
| pl cs uk ru fi et ja zh-Hans (W58 base) | 3,439 / 3,415 / 3,404 / 3,410 / 3,387 / 3,405 / 3,402 / 3,421 | the rest are code, CSS, TOML, CSV, path and key scaffolding and acronyms that stay English (listed in `tools/i18n/w58/done-ids-0f6fb1fa.txt` as handled); plural selectors done for the 186 count messages (ja and zh-Hans need none) |
| de fr es (W57 base) | 3,635 | complete (one id is the SIEM event name, intentionally English) |
| pt-BR pt-PT nl da sv nb | 3,636 | complete |

Done everywhere: base catalogue, the 17 `engine-legal-*` messages (`# legal: native review`), the plural selectors for `engine-counts.txt`
(the messages with several counts keep a number-independent form), REVIEW.md. Tests: `cargo test --test i18n_catalogue --test i18n_legal
--test i18n_api` pass.

## Open items (waiting on W55; the coordinator says when they settle)
1. Two commits of `feat/i18n-engine-0.40` after 35a400e4 are not merged yet. Merge, then run the delta recipe in the README for both
   groups (new ids) and a one-chunk sub-agent run per language (one agent at a time; three small languages per agent works).
2. `i18n/en/engine-numbers.txt` (W55): messages whose literal decimals become number placeables. Retranslate those ids in all 17
   languages (the validator forces numbers to stay as written, so the decimal-mark languages need the placeable first).
3. `i18n/en/engine-fragments.txt`: fragment messages W55 merges into whole sentences: retranslate only the new ids.
4. SVG chart text part 2 (W55): new ids, same recipe.
5. `i18n/<lang>/glossary.ftl`, `ui.ftl` and page catalogues for the site and Studio wait for W60 (`i18n/en/glossary.ftl`, `en/ui.ftl`, `extract`).
   The glossary content is in kshana-pro `site/i18n-0.40/i18n/glossary/<lang>.json` (branches `i18n-glossary-w58` for pl cs uk ru fi et ja
   zh-Hans and `i18n/glossary-w57` for the nine others), including the advisory variants, the machine-translation notice and the style notes
   (plural categories, case, register, separators, ja and zh-Hans punctuation).

## Decisions to keep
- Tier and verdict words stay English capitals (VALIDATED, MODELLED, PARTNER, MET, NOT MET, EXPLORATORY) and so do the status words
  PREDICTION, CORROBORATED, NOT CORROBORATED, REFUSED, DEGRADED, DEFICIENT, OBSERVED, LOST, MISMATCH, VERIFIED, CONSISTENT, INCONSISTENT and
  the all-caps phrases SPOOF DETECTED and INTACT, BUT THE SIGNER IS NOT PINNED. Lowercase or capitalised "validated"/"modelled" in prose use
  the language's plain word.
- "certified", "conformant", "compliant" (and their renderings) are never claims about Kshana; use only negated, and "supports evidence for"
  has one fixed phrase per language (in the guides). X.509 certificates are ordinary "certificate".
- Machine output stays English (the CEF event name `engine-telemetry-syslog-cef-gnss-trust`; JSON keys; CSV headers).
- zh-Hans: "campaign" is 测评活动 (never 战役). ja and zh-Hans have no plural selector; no automatic space between CJK and Latin text.
- Plural selectors only where a noun, verb or adjective agrees with a numeric count variable; where the "count" is a name or value, no selector
  (or identical variants).
- The merge commits on this branch trigger the stop hook's "Unverified" warning (Ashforde OÜ identity); the coordinator ruled to refuse the
  re-authoring suggestion (never amend, never rewrite history).

## Working conventions
Commit as `git -c user.name="Ashforde OÜ" -c user.email="ashfordegithub@cbaweja.org" commit` (author and committer), no AI trailers; run
`scripts/check-no-attribution.sh`; push only `i18n/engine-0.40`; no PRs and no GitHub comments; one sub-agent at a time; commit and push after each language so a usage limit
never loses work.
