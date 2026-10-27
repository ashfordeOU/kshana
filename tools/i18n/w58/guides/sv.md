# Guide for Swedish (sv)

## Terms (English -> rendering)
- scenario -> scenario
- evidence pack -> bevispaket
- ledger -> register
- verification matrix -> verifieringsmatris
- interference -> störning
- integrity -> integritet
- trust score -> förtroendepoäng
- receiver -> mottagare
- clock -> klocka
- timing -> tidssynkronisering
- orbit determination -> banbestämning
- ephemeris -> efemerid
- carrier phase -> bärvågsfas
- integer ambiguity -> heltalsosäkerhet
- Love number -> Love-tal
- libration -> libration
- reference frame -> referenssystem
- pre-registration -> förhandsregistrering
- oracle (independent reference) -> oberoende referens
- bar (pre-registered threshold) -> tröskel (fastställd i förväg)
- baseline -> baslinje
- holdout (sealed set) -> undanhållen datamängd
- advisory -> rådgivande
- type-approved -> typgodkänd
- machine translation -> maskinöversättning
- native speaker -> modersmålstalare
- reviewed -> granskad

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: certifierad, certifiering; conformant: överensstämmer med, konform, överensstämmelse; compliant: uppfyller kraven, efterlever, compliant; approved: godkänd, typgodkänd, godkännande
- fixed phrase for 'supports evidence for': {"supports evidence for": "ger belägg för"}

## Linguistic notes
- locale: sv (Sweden)
- plural_categories: one, other
- plural_note: 'one' is exactly 1; 0 and 2+ are 'other'.
- grammatical_case_and_gender: No case on nouns (only a genitive -s); two genders (en/ett) and a definite article that is a suffix (-en/-et/-na): the definite form of a placeable noun needs its own message or term.
- address_register: Informal 'du', the normal register of Swedish technical documentation.
- decimal_separator: ,
- thousands_separator: U+00A0 no-break space
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  sv: Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC 61108, IEC 61162): operatören är fortsatt ansvarig för fartygets navigering.
- EN: Advisory software, not type-approved equipment.
  sv: Rådgivande programvara, inte typgodkänd utrustning.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  sv: Rådgivande programvara för forskning, simulering och test. Den är inte typgodkänd utrustning och betygsätter eller godkänner varken en mottagare, en klocka eller ett laboratorium.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  sv: Endast rådgivande: inte typgodkänd navigationsutrustning; operatören är fortsatt ansvarig. Evidensnivå: MODELLED.
- Machine translation notice: Maskinöversättning, inte granskad av en modersmålstalare. Engelska är referensen.

## Extra per-language brief from the earlier translator (terms and conventions to keep)
# sv brief (read RULES.md first, including rule 8)
Translate batch NN into SWEDISH (lang sv; informal 'du' per the glossary). Input /tmp/claude-0/i18n/batches/en_NN.ftl; output /tmp/claude-0/i18n/out/sv_NN.ftl; glossary /workspace/kshana-pro/site/i18n-0.40/i18n/glossary/sv.json; if /tmp/claude-0/i18n/out/sv_00.ftl exists it is a finished sample of this language (match its style and terms; otherwise see /tmp/claude-0/i18n/out/nl_00.ftl only for how a finished file looks, not its words). Terms: 'bytes' stays; conformance of a file = 'formatkontroll'; hold-out/holdout = 'undanhållen datamängd'; bar (threshold) = 'tröskel'; design = 'utformning'; fix (position) = 'positionsbestämning'; preset = 'förinställning'; truth = 'referens'; baseline = 'baslinje'; jamming, spoofing, holdover stay English; status labels that could be parsed (REFUSED, MISMATCH, VERIFIED) stay English; config section/table names and keys stay English. The definite article is a suffix in this language: never glue a suffix onto a placeable; reword so the placeable stays a separate word. Keep CORROBORATED / NOT CORROBORATED in English. No forbidden_translations words as claims; negations kept exactly.

