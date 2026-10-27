# Interface and glossary translations (0.40, workstream J)

`i18n/<lang>/ui.ftl` and `i18n/<lang>/glossary.ftl` for the 17 locales nl pl pt-BR pt-PT fi sv da nb cs uk ru de fr es et ja
zh-Hans. They are machine drafts by an AI model, **not reviewed by a native speaker**; the notice every translated surface
shows says so (`-mt-notice`). Conventions: `i18n/HANDOVER-W58.md` and `tools/i18n/w58/README.md` on branch `i18n/engine-0.40`.

`python3 tools/i18n/ui/ui_check.py <lang>...` (needs `pip install fluent.syntax`, run from the repository root) fails if a file has
Fluent syntax errors, lacks or adds an id or attribute, changes a placeable (variable, term or message reference, string
literal, function call) or a numbered tag compared with English, uses the wrong CLDR plural categories for the language, changes
a tier, verdict, status, acronym, command or brand term, or departs from the guide's fixed renderings
(`tools/i18n/ui/glossary-fixed.json`, extracted from the per-language guides by `extract_guides.py`: the glossary terms, the
advisory sentences and the machine-translation notice).

Where the guide of a language fixes an advisory sentence, the catalogue copies it exactly (checked). The other advisory
variants and the glossary terms the guide does not list were translated from English with the guide's vocabulary and the
engine catalogue's wording; they are the first things for a native reviewer to read, with the `-advisory` and `-mt-notice`
entries of every language.

## Native review, in this order

The `-advisory` entry (the main value and `.maritime`, `.research-test`, `.short`) is the line every Kshana surface carries.
For these eight languages the guide fixes only the `.maritime` sentence and the notice, so the other three advisory variants
and 14 glossary terms were translated from English: **pl, cs, uk, ru, fi, et, ja, zh-Hans**. They go to a native reviewer
first. Then the same entries in the nine languages whose advisory sentences the guide fixes (de, fr, es, pt-BR, pt-PT, nl, da,
sv, nb), then the Studio view labels (`studio-view-*`, `studio-telecom-masks`, `studio-ground-track`, `studio-parameter-sweep`,
`studio-figures-of-merit`), which the engine catalogue has no wording for.
