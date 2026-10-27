# Guide for Norwegian Bokmål (nb)

## Terms (English -> rendering)
- scenario -> scenario
- evidence pack -> bevispakke
- ledger -> register
- verification matrix -> verifikasjonsmatrise
- interference -> interferens
- integrity -> integritet
- trust score -> tillitsscore
- receiver -> mottaker
- clock -> klokke
- timing -> tidssynkronisering
- orbit determination -> banebestemmelse
- ephemeris -> efemeride
- carrier phase -> bærebølgefase
- integer ambiguity -> heltallsflertydighet
- Love number -> Love-tall
- libration -> librasjon
- reference frame -> referansesystem
- pre-registration -> forhåndsregistrering
- oracle (independent reference) -> uavhengig referanse
- bar (pre-registered threshold) -> terskel (fastsatt på forhånd)
- baseline -> grunnlinje
- holdout (sealed set) -> tilbakeholdt datasett
- advisory -> veiledende
- type-approved -> typegodkjent
- machine translation -> maskinoversettelse
- native speaker -> morsmålsbruker
- reviewed -> gjennomgått

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: sertifisert, sertifisering; conformant: i samsvar med, konform, samsvar; compliant: oppfyller kravene, overholder, compliant; approved: godkjent, typegodkjent, godkjenning
- fixed phrase for 'supports evidence for': {"supports evidence for": "gir belegg for"}

## Linguistic notes
- locale: nb (Norwegian Bokmål; not Nynorsk)
- plural_categories: one, other
- plural_note: 'one' is exactly 1; 0 and 2+ are 'other'.
- grammatical_case_and_gender: No case; three genders (masculine, feminine, neuter; the feminine may be written as masculine in Bokmål, choose masculine for consistency) and a definite article that is a suffix (-en/-a/-et/-ene): the definite form of a placeable noun needs its own message or term.
- address_register: Informal 'du', the normal register of Norwegian technical documentation.
- decimal_separator: ,
- thousands_separator: U+00A0 no-break space
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  nb: Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC 61108, IEC 61162): operatøren er fortsatt ansvarlig for fartøyets navigasjon.
- EN: Advisory software, not type-approved equipment.
  nb: Veiledende programvare, ikke typegodkjent utstyr.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  nb: Veiledende programvare for forskning, simulering og testing. Den er ikke typegodkjent utstyr og vurderer eller godkjenner verken en mottaker, en klokke eller et laboratorium.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  nb: Kun veiledende: ikke typegodkjent navigasjonsutstyr; operatøren er fortsatt ansvarlig. Evidensnivå: MODELLED.
- Machine translation notice: Maskinoversettelse, ikke gjennomgått av en morsmålsbruker. Engelsk er referansen.

## Extra per-language brief from the earlier translator (terms and conventions to keep)
# nb brief (read RULES.md first, including rule 8)
Translate batch NN into NORWEGIAN BOKMÅL (lang nb; informal 'du' per the glossary). Input /tmp/claude-0/i18n/batches/en_NN.ftl; output /tmp/claude-0/i18n/out/nb_NN.ftl; glossary /workspace/kshana-pro/site/i18n-0.40/i18n/glossary/nb.json; if /tmp/claude-0/i18n/out/nb_00.ftl exists it is a finished sample of this language (match its style and terms; otherwise see /tmp/claude-0/i18n/out/nl_00.ftl only for how a finished file looks, not its words). Terms: 'bytes' stays; conformance of a file = 'formatkontroll'; hold-out/holdout = 'tilbakeholdt datasett'; bar (threshold) = 'terskel'; design = 'utforming'; fix (position) = 'posisjonsbestemmelse'; preset = 'forhåndsinnstilling'; truth = 'referanse'; baseline = 'grunnlinje'; jamming, spoofing, holdover stay English; status labels that could be parsed (REFUSED, MISMATCH, VERIFIED) stay English; config section/table names and keys stay English. The definite article is a suffix in this language: never glue a suffix onto a placeable; reword so the placeable stays a separate word. Keep CORROBORATED / NOT CORROBORATED in English. No forbidden_translations words as claims; negations kept exactly.

