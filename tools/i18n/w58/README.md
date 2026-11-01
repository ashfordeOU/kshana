# Translation pipeline of the engine catalogue: 17 languages, one validator

All `i18n/<lang>/engine.ftl` are machine drafts by an AI model, not reviewed by a native speaker (see each `REVIEW.md`).
Paths: `I18N_REPO` (default: the current directory, run from the repo root) and `I18N_WORK` (default `/tmp/i18n-work`).
Needs `pip install fluent.syntax`.

## Pieces
- `validate.py EN CHUNK` checks a translated chunk against its English chunk: ids exist, the set of `$variables`, string-literal
  placeables, backtick spans, digits, tier and verdict words (VALIDATED, MODELLED, PARTNER, MET, NOT MET, EXPLORATORY, PREDICTION,
  CORROBORATED, NOT CORROBORATED, REFUSED, DEGRADED, DEFICIENT, OBSERVED, LOST, MISMATCH) and the line count. Messages listed in
  `i18n/en/engine-counts.txt` may use plural selectors, so for them it compares sets instead and ignores the layout. A message may be omitted
  (English is then shown by fallback).
- `split.py i18n/en/engine.ftl $I18N_WORK/chunks` cuts the English catalogue into chunks of about 26 KB (`en-NN.ftl`).
- `delta.py NN <lang|done-ids.txt>...` writes `chunks/en-NN.ftl` with the English messages not yet handled.
  `done-ids-0f6fb1fa.txt` lists every English id at 0f6fb1fa (all handled; use it for pl, cs, uk, ru, fi, et, ja, zh-Hans, whose files omit
  messages with no human words). For the nine languages translated first, the language's own `engine.ftl` is the done-list.
- A translated chunk is written to `$I18N_WORK/out/<lang>-NN.ftl` (guided by `guides/<lang>.md`) and checked with `validate.py` until it
  reports `0 problems`.
- `counts.py LANG...` lists the plural-selector pass (categories `one, few, many, other` as the language has them) for the messages in
  `engine-counts.txt` (`$I18N_WORK/counts/out-<lang>.ftl` holds the changed messages). For a message that has several counts keep the
  number-independent form (one selector on the main noun at most); nested selectors become unreadable.
- `assemble.py LANG` (pl cs uk ru fi et ja zh-Hans) rebuilds the whole file from `out/<lang>-NN.ftl` + `counts/out-<lang>.ftl` +
  `out/<lang>-legal.ftl`, drops `engine-telemetry-syslog-cef-gnss-trust` (machine output, stays English). `assemble9.py LANG` (de fr es pt-BR
  pt-PT nl da sv nb) layers the plural overrides and the delta chunks `out/<lang>-NN.ftl` (NN >= 16) onto the existing file.
- `guides/<lang>.md`: terms, register, plural categories, case notes, forbidden renderings and advisory sentences per language, generated
  from the glossaries (the `i18n/glossary/` folder of the site branch in kshana-pro).

## Recipe for messages added to the engine catalogue later
1. Merge the engine branch. `python3 tools/i18n/w58/delta.py 17 tools/i18n/w58/done-ids-0f6fb1fa.txt` (new ids for the first eight
   languages) and `... delta.py 18 de fr es pt-BR pt-PT nl da sv nb` (for the other nine), in new chunk numbers.
2. Translate one language at a time (or three languages for a small chunk), writing `out/<lang>-NN.ftl`.
3. `assemble.py` / `assemble9.py`, then `cargo test --test i18n_catalogue --test i18n_legal --test i18n_api`, commit, push.

## Decisions to keep
Tier and verdict words and all-caps status words stay English; "certified", "conformant", "compliant" are never used as claims about Kshana
(negated use only); "supports evidence for" has one fixed phrase per language; ja and zh-Hans have no plural selector; the 17
`engine-legal-*` messages carry `# legal: native review`.
