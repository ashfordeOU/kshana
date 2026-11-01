# Guide for French (fr)

## Terms (English -> rendering)
- scenario -> scénario
- evidence pack -> paquet de preuves
- ledger -> registre
- verification matrix -> matrice de vérification
- spoofing -> leurrage
- jamming -> brouillage
- interference -> interférence
- integrity -> intégrité
- trust score -> score de confiance
- receiver -> récepteur
- clock -> horloge
- timing -> synchronisation temporelle
- orbit determination -> détermination d'orbite
- ephemeris -> éphéméride
- carrier phase -> phase de la porteuse
- integer ambiguity -> ambiguïté entière
- Love number -> nombre de Love
- libration -> libration
- reference frame -> référentiel
- pre-registration -> préenregistrement
- oracle (independent reference) -> référence indépendante
- bar (pre-registered threshold) -> seuil (fixé à l'avance)
- baseline -> référence de base
- holdout (sealed set) -> jeu réservé
- advisory -> indicatif (à titre consultatif)
- type-approved -> homologué
- machine translation -> traduction automatique
- native speaker -> locuteur natif
- reviewed -> relue

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, meaconing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: certifié, certification; conformant: conforme, conformité; compliant: conforme, en conformité avec, satisfait aux exigences, compliant; approved: approuvé, homologué, agréé, autorisé, homologation
- fixed phrase for 'supports evidence for': {"supports evidence for": "apporte des éléments de preuve en faveur de"}

## Linguistic notes
- locale: fr (France)
- plural_categories: one, many, other
- plural_note: 'one' covers 0 and 1 ('0 résultat'); 'many' applies to exact multiples of a million ('1 000 000 de ...'): add a 'many' variant where a noun takes 'de'; otherwise 'other'.
- grammatical_case_and_gender: No case, but noun gender and number agreement with adjectives and participles, and elision (le/la/l', de/d'): a placeable at the start of a word or after 'de' needs a selector or a rewording. Typographic spacing: non-breaking space before ':', ';', '?', '!' and inside guillemets.
- address_register: Formal: 'vous'.
- decimal_separator: ,
- thousands_separator: U+202F narrow no-break space
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  fr: Logiciel à titre consultatif, et non un équipement de navigation homologué (IEC 61108, IEC 61162) : l'opérateur reste responsable de la navigation du navire.
- EN: Advisory software, not type-approved equipment.
  fr: Logiciel à titre consultatif, et non un équipement homologué.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  fr: Logiciel à titre consultatif pour la recherche, la simulation et l'essai. Ce n'est pas un équipement homologué et il n'évalue ni n'approuve un récepteur, une horloge ou un laboratoire.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  fr: À titre consultatif seulement : pas un équipement de navigation homologué ; l'opérateur reste responsable. Niveau de preuve : MODELLED.
- Machine translation notice: Traduction automatique, non relue par un locuteur natif. L'anglais fait foi.
