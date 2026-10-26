# Handover: W61 page translations (branch i18n/pages-w61-0.40)

Languages in order: de, fr, es, pt-BR, pt-PT, nl. Base: origin/feat/i18n-site-0.40 merged at ae4e0208 (ids migrated).
All catalogues are machine drafts, not reviewed by a native speaker.

## State
- de: done (100%, `check` 0 errors). Kind term unified ("Szenarioart").
- fr: done (100%, `check` 0 errors). "conformance" is "respect de la norme"; "filtre de Kalman sans parfum".
- Source labels ILLUSTRATIVE, PUBLIC, REPRESENTATIVE, WORKSHOP, MIXED, GREEN, APPROVED, INCOMPLETE, REFUSED stay English in caps (check enforces it).
- es: done (100%). pt-BR: done (100%). pt-PT: in progress (see git log). nl: reassigned to W63 (not mine).

## Recipe (per language, 3-4 sub-agents at a time; the usage limit is shared with other sessions)
1. `node tools/i18n.mjs todo <lang> --out WORK` (about 168 chunks of 26 KB).
2. One sub-agent per 6 chunks. Each reads the language guide + glossary (kshana i18n/engine-0.40 tools/i18n/w58/guides/<lang>.md and i18n/ui-0.40 i18n/<lang>/glossary.ftl), writes translated chunks to an output dir, and validates each with `node tools/i18n.mjs merge <lang> <file> --root <private root>` (a private root holds a symlink `en` -> i18n/en), so parallel agents never write the real tree.
3. Merge all outputs into the real tree: `node tools/i18n.mjs merge <lang> out/*.ftl`, then `check`, `status`, commit (as Ashforde OÜ, no trailers), `scripts/check-no-attribution.sh`, push.
4. Caps tier/verdict tokens (VALIDATED, MODELLED, PARTNER, EXPLORATORY, MET, NOT MET, PASS, FAIL) must appear exactly as often as in English; lowercase "validated/modelled/met" in prose use the language's ordinary word. `check` enforces it.

## Fixed terms across languages
"scenario kind": de Szenarioart, fr type de scénario, es tipo de escenario, pt tipo de cenário, nl scenariotype (as in the engine catalogue).
"oracle": referencia/référence indépendante. "conformance" avoids the forbidden "conformité/conformidad" words. "compliance", "bench" stay English.

## Things a native reviewer should look at first
de: Validiert/Modelliert prose; Szenarioart compounds. fr: marche libre/roue libre for coast; negated "certification" disclaimers; "supports evidence for" rewordings.
