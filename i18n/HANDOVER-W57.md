# Handover: W57's translation pipeline (engine catalogue, 9 languages)

Branch `i18n/w57-0.40` (kshana). Languages: de, fr, es, pt-BR, pt-PT, nl, da, sv, nb. All machine drafts by an AI model, NOT native-reviewed; every language has `i18n/<lang>/REVIEW.md` (ranked list for native reviewers).

## State per language (`i18n/<lang>/engine.ftl`)
- Base catalogue: 3,322 messages translated (batches 00 to 08), plus the delta batch 09: the 248 messages W55 added later (17 `engine-legal-*` carry `# legal: native review`; total 3,570 in the file). All pass `tools/i18n/tools.py check` against the English and W55's tests (`cargo test --test i18n_catalogue --test i18n_legal --test i18n_api`).
- Not done: (1) plural selectors for the 186 messages in `i18n/en/engine-counts.txt` (they reach Fluent as numbers; write `{ $n -> [one] ... *[other] ... }` with the categories of the language's `linguistic_notes.plural_categories`; my structural checker must be taught that selectors change the braces: compare the variable set and the presence of every required category instead); (2) the fragment messages of `engine-fragments.txt` once W55 lists the merged ids; (3) decimal numbers inside English text (0.5, 0.09 ...): W55 is turning them into placeables, redo those strings after; (4) messages W55 adds from now on (new ids = not in `i18n/<lang>/engine.ftl`): run the delta recipe below; (5) `i18n/<lang>/glossary.ftl`, `ui.ftl` and page catalogues, which wait for W60's `i18n/en/glossary.ftl`, `en/ui.ftl` and `extract`.
- The stop hook keeps asking to re-author the merge commits as "Claude"; the coordinator ruled to refuse it ("Unverified" accepted).

## Pipeline (scripts in `tools/i18n/`, briefs in `tools/i18n/briefs/`; paths default to `/tmp/claude-0/i18n`, change the literals or symlink)
1. `python3 tools/i18n/tools.py split 370` (run from the repo root) cuts `i18n/en/engine.ftl` into `batches/en_NN.ftl` (370 messages each). For a delta, write the messages whose ids are not yet in the language file into `batches/en_09.ftl` (see the snippet in the git history of this note's author, or: parse both files with `tools.parse` and keep the new ids).
2. One sub-agent per language and batch, run one at a time (a sub-agent costs about 100k tokens): its prompt is only "read RULES.md then RULES_<lang>.md (and RULES_delta.md for a delta) and do batch NN"; it writes `out/<lang>_NN.ftl`, runs `tools.py check` until OK and reports its unsure ids (delta: into `unsure/<lang>_NN.txt`).
3. `python3 tools/i18n/forb.py <lang>` lists uses of the glossary's forbidden translations (only negated uses and X.509 certificates are acceptable).
4. `python3 tools/i18n/assemble.py <lang>` concatenates `out/<lang>_*.ftl` into `i18n/<lang>/engine.ftl` (keeps the header, adds `# legal: native review` to `engine-legal-*` and to messages matching a legal-wording regex), then `cargo test --test i18n_catalogue ...`, commit per language, push.
5. `python3 tools/i18n/review.py <lang>` regenerates `i18n/<lang>/REVIEW.md`.
`tools.py check` compares, per message: ids and order, every `{ ... }` placeable (incl. literal ones such as `{ " " }`, `{ "\u000A" }`), E- codes, numbers outside placeables, backtick code spans, tier words (MODELLED, VALIDATED, PARTNER, NOT MET, EXPLORATORY), line counts. It forces numbers to stay as written (Dutch/Danish/Swedish decimal commas had to be reverted); that is why W55 is converting decimals to placeables.

## Glossary decisions (kshana-pro branch `i18n/glossary-w57`, `site/i18n-0.40/i18n/glossary/<lang>.json`)
- Tier and verdict words stay English everywhere (MODELLED, VALIDATED, PARTNER, NOT MET, MET, EXPLORATORY), and so do CORROBORATED / NOT CORROBORATED, REFUSED-type status labels that could be parsed, acronyms, kinds, commands, units. Lowercase or capitalised 'validated'/'modelled' in English prose use the language's gloss (never the capitalised tier word).
- 'ledger' = register/registre/registro; 'oracle' = independent reference; 'bar' = threshold word of the language (drempel, tærskel, tröskel, terskel, limiar (pt), umbral, seuil, Zielwert); 'supports evidence for' has one fixed phrase per language (glossary `forbidden_translations.use_instead`).
- Forbidden as claims: certified, conformant, compliant, approved (and per-language equivalents in the glossary); negated use and X.509 'certificate' are fine.
- Register: Sie, vous, usted/impersonal, pt formal/impersonal (pt-PT: no 'você'), u, du (da, sv, nb). pt-BR and pt-PT are separate files; pt-PT was adapted from pt-BR (batch 00 redone by hand; the others by a script plus fixes, so a native reviewer should expect leftover Brazilianisms).
- Plural categories to use in selectors: de, nl, da, sv, nb: one+other; fr, es, pt-BR, pt-PT: one+many+other ('many' = exact millions; pt-BR and fr 'one' includes 0).

## Known weak spots
Messages built from fragments (`it { $why }`, `{ $v1 }` comparison words), column headers of fixed-width tables, messages where the English is truncated (`engine-leo-navmsg-tests-is-the-host-library`), compass letters in chart text (E/W became L/O, Ø/V ...), and the `engine-legal-*` texts. See each REVIEW.md.
