# Handover: W64's catalogue translations (0.40: fixes, ui, studio-pages, site-js, studio-js, data, engine)

Branch `i18n/engine-0.40` (kshana). All catalogues are machine drafts by an AI model, NOT reviewed by a native speaker. Commits are
authored as Ashforde OÜ, no trailers; `scripts/check-no-attribution.sh` before every push; no PRs, no comments.
Read `i18n/HANDOVER-W54.md`, `i18n/HANDOVER-W58.md`, `tools/i18n/w58/README.md` and `i18n/README.md` first.

## State (translated / total, `node tools/i18n.mjs status <lang>`; `check <lang>` is 0 errors for all 17)
| file | languages complete |
|---|---|
| ui.ftl 515 (423 studio-* ids + 5 observatory ids), studio-pages.ftl 333, site-js.ftl 650, studio-js.ftl 4,347, engine.ftl 4,165 | all 17 |
| data.ftl 3,099 | nl pl pt-BR pt-PT fi sv da nb de fr es (11). cs 2,464 and et 785 were handed to W63; uk, ru, ja, zh-Hans to W62 (their own branches) |

`validate.py` (tools/i18n/w58) says `4165 translated, 0 omitted; 0 problems` for engine.ftl in all 17 languages. `cargo test --test i18n_catalogue
--test i18n_legal --test i18n_api --test i18n_machine_files` pass. Merged in: `feat/i18n-site-0.40` @ 0a3e7cc0 (token check: ILLUSTRATIVE, PUBLIC,
REPRESENTATIVE, WORKSHOP, MIXED, MEASURED, NEEDS INPUT, GREEN) and `feat/i18n-engine-0.40` @ cab5336a (217 engine-compliance-* messages).

## Done in this workstream
1. Fixes: PASS/FAIL/LOCKED English everywhere; fi "certified" negations use sertifioitu/sertifiointi; `tools/i18n/w58/validate.py` skips the
   leading `# legal:` comment (it was the line-count false positive), sees caps tokens next to CJK, allows numerals like 6月/4つ in ja and zh-Hans;
   real findings fixed (status words REFUSED, MISMATCH, RANK-DEFICIENT, DEGRADED, NOT OBSERVED, PREDICTION back to English in nine languages).
2. `tools/i18n-lang.mjs`: string literals are compared as distinct values when a plural selector repeats them (own commit 915f94d1,
   test `tools/i18n-lits-test.mjs`).
3. Catalogues as in the table; every language has plural selectors with its full CLDR set; where English has a count variable and no selector,
   most languages added one where the bare form reads wrongly for 1 (check shows no issue either way).

## Rules applied (from the owner and the coordinator)
- Kept English: VALIDATED MODELLED PARTNER EXPLORATORY MET "NOT MET" PASS FAIL LOCKED; status words PREDICTION CORROBORATED REFUSED DEGRADED DEFICIENT OBSERVED
  LOST MISMATCH VERIFIED CONSISTENT INCONSISTENT INCOMPLETE PARTIAL GREEN "NEEDS INPUT"; source labels ILLUSTRATIVE PUBLIC REPRESENTATIVE WORKSHOP MIXED
  MEASURED; "compliance", "bench", `-brand`. A caps token appears as often as in English; lowercase "validated"/"modelled"/"met" are ordinary words.
- Titles of published documents (DHS, NIST, IMO, EASA, NIS2, EN 16803: `engine-compliance-fw-*-title`, `engine-compliance-source-*-title`) stay English.
  The CEF event line `engine-telemetry-syslog-cef-gnss-trust` stays English. "oracle" = the glossary's "independent reference" (de, da fixed).
- Never write that Kshana is certified, conformant or compliant (negated use only); the advisory and machine-translation notice are in full.

## Recipe used (sub-agents, at most four at a time)
`node tools/i18n.mjs todo <lang> --file <FILE> --out DIR`, translate each chunk to `DIR/NNN.out.ftl`, `merge <lang> DIR/NNN.out.ftl --file <FILE>`
(rejected messages are reported and fixed), `todo` again until 0, then `check <lang>` and, for engine.ftl,
`I18N_REPO=$PWD python3 tools/i18n/w58/validate.py i18n/en/engine.ftl i18n/<lang>/engine.ftl`. `merge` does not overwrite an id that is already
written: edit the catalogue file directly to fix wording. Audit helpers I used (scratchpad, not committed): compare per id the count of the label tokens above and
of "bench"/"compliance" between English and translation; list English messages that are only a caps phrase and differ in a translation.

## Native review: read first
1. Advisory / MT-notice lines (`-advisory`, `-mt-notice`) in the eight languages whose guide does not fix them (pl cs uk ru fi et ja zh-Hans).
2. `engine-legal-*` (17 ids, `# legal: native review`), then engine `engine-compliance-req-*-asks/-gap` and `engine-compliance-mapping-*`.
3. The "supports evidence for" phrase: inflected differently in titles and gap texts in many languages (data: dat-252abe5c1b08, dat-de5611fcd4b7,
   dat-ff5b73c0368c, dat-c79c9837d30a, dat-5bea30c2f8ec; engine compliance gap texts).
4. Names containing "conformance" (dat-28757f0de384, -00ec4aa50d47, -cea9b5d71933, -06ca29579f23, dat-82ead35c51f5, dat-c16e0fa0d5e4, dat-7f0ab2f59f77; "ARAIM
   certification reference vectors" dat-d8ae5bfb5fc8): several languages kept a form of conformidade/Konformität/överensstämmelse as a test name; decide per language.
5. studio-js / site-js fragments the page scripts concatenate (`js-meaning-*`, `js-meankind-*`, `js-app-coverage-*`, `js-app-legend-*`): articles and case endings were dropped
   or guessed in many languages. ru/uk/pl/cs rewrote some count messages as "label: N". Engine kind descriptions where a source label (MEASURED, ILLUSTRATIVE) sits
   inside translated grammar (cs uk ru pl fi ja zh-Hans: case endings missing, e.g. "ZÁZNAM MEASURED FÁZE").
6. `js-site-evidence-hold-control` ("The bar has teeth"), `js-site-pro-front-design*` (Pareto front), `js-site-evidence-hero-oracle*`, "lost lock" labels, `js-trust-first-untrusted`,
   `js-trust-first-deduction`, `studio-mission-thread-*`, `studio-replay-bridge-replay`.
7. ja and zh-Hans: `studio-replay-the-coast-is-natural-earth` ("1:10 百万": the digit check forbids a native numeral), digits kept where English spells a number as a word.
8. Mixed caps emphasis words in data prose (FINDING, WHAT IS NOT CHECKED, REAL, SIMULATED ...) were translated in most languages; DERIVED and PROVEN are prose, translated
   inconsistently (some kept English).
