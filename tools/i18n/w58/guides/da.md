# Guide for Danish (da)

## Terms (English -> rendering)
- scenario -> scenarie
- evidence pack -> bevispakke
- ledger -> register
- verification matrix -> verifikationsmatrix
- interference -> interferens
- integrity -> integritet
- trust score -> tillidsscore
- receiver -> modtager
- clock -> ur
- timing -> tidssynkronisering
- orbit determination -> banebestemmelse
- ephemeris -> efemeride
- carrier phase -> bærebølgefase
- integer ambiguity -> heltalsmultiplicitet
- Love number -> Love-tal
- libration -> libration
- reference frame -> referencesystem
- pre-registration -> præregistrering
- oracle (independent reference) -> uafhængig reference
- bar (pre-registered threshold) -> tærskel (fastsat på forhånd)
- baseline -> baseline
- holdout (sealed set) -> tilbageholdt datasæt
- advisory -> vejledende
- type-approved -> typegodkendt
- machine translation -> maskinoversættelse
- native speaker -> modersmålstalende
- reviewed -> gennemgået

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: certificeret, certificering; conformant: i overensstemmelse med, konform, overensstemmelse; compliant: overholder, opfylder kravene, compliant; approved: godkendt, typegodkendt, godkendelse
- fixed phrase for 'supports evidence for': {"supports evidence for": "leverer belæg for"}

## Linguistic notes
- locale: da (Denmark)
- plural_categories: one, other
- plural_note: 'one' is exactly 1 for integers (and fractions between 0 and 2 such as 0,5); 0 and integers from 2 are 'other'.
- grammatical_case_and_gender: No case; two genders (common and neuter) and a definite article that is a suffix (-en/-et/-ne): the definite form of a placeable noun cannot be glued on; give it its own message or term.
- address_register: Informal 'du' (the normal register of Danish technical documentation; 'De' is archaic).
- decimal_separator: ,
- thousands_separator: . (period)
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  da: Vejledende software, ikke typegodkendt navigationsudstyr (IEC 61108, IEC 61162): operatøren er fortsat ansvarlig for fartøjets navigation.
- EN: Advisory software, not type-approved equipment.
  da: Vejledende software, ikke typegodkendt udstyr.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  da: Vejledende software til forskning, simulering og test. Den er ikke typegodkendt udstyr og vurderer eller godkender hverken en modtager, et ur eller et laboratorium.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  da: Kun vejledende: ikke typegodkendt navigationsudstyr; operatøren er fortsat ansvarlig. Evidensniveau: MODELLED.
- Machine translation notice: Maskinoversættelse, ikke gennemgået af en modersmålstalende. Engelsk er referencen.

## Extra per-language brief from the earlier translator (terms and conventions to keep)
# da brief (read RULES.md first, including rule 8)
Translate batch NN into DANISH (lang da; informal 'du' per the glossary). Input /tmp/claude-0/i18n/batches/en_NN.ftl; output /tmp/claude-0/i18n/out/da_NN.ftl; glossary /workspace/kshana-pro/site/i18n-0.40/i18n/glossary/da.json; if /tmp/claude-0/i18n/out/da_00.ftl exists it is a finished sample of this language (match its style and terms; otherwise see /tmp/claude-0/i18n/out/nl_00.ftl only for how a finished file looks, not its words). Terms: 'bytes' stays; conformance of a file = 'formatkontrol'; hold-out/holdout = 'tilbageholdt datasæt'; bar (threshold) = 'tærskel'; design = 'udformning'; fix (position) = 'positionsbestemmelse'; preset = 'forudindstilling'; truth = 'reference'; baseline = 'baseline'; jamming, spoofing, holdover stay English; status labels that could be parsed (REFUSED, MISMATCH, VERIFIED) stay English; config section/table names and keys stay English. The definite article is a suffix in this language: never glue a suffix onto a placeable; reword so the placeable stays a separate word. Keep CORROBORATED / NOT CORROBORATED in English. No forbidden_translations words as claims; negations kept exactly.

