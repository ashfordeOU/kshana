# Guide for Dutch (nl)

## Terms (English -> rendering)
- scenario -> scenario
- evidence pack -> bewijspakket
- ledger -> register
- verification matrix -> verificatiematrix
- interference -> interferentie
- integrity -> integriteit
- trust score -> vertrouwensscore
- receiver -> ontvanger
- clock -> klok
- timing -> tijdsynchronisatie
- orbit determination -> baanbepaling
- ephemeris -> efemeride
- carrier phase -> draaggolffase
- integer ambiguity -> geheeltallige ambiguïteit
- Love number -> Love-getal
- libration -> libratie
- reference frame -> referentiestelsel
- pre-registration -> preregistratie
- oracle (independent reference) -> onafhankelijke referentie
- bar (pre-registered threshold) -> drempel (vooraf vastgelegd)
- baseline -> basislijn
- holdout (sealed set) -> achtergehouden set
- advisory -> adviserend
- type-approved -> typegoedgekeurd
- machine translation -> machinevertaling
- native speaker -> moedertaalspreker
- reviewed -> beoordeeld

## Kept in English: VALIDATED, MODELLED, PARTNER, NOT MET, MET, EXPLORATORY; acronyms GNSS, PNT, RAIM, ARAIM, NMEA, CUSUM, AUC, ROC, LAMBDA, DOP; by field usage: holdover, jamming, meaconing, spoofing

## Forbidden as claims about Kshana (negated use is required where the English is negated; X.509 certificate objects are fine): certified: gecertificeerd, certificering; conformant: conform, in overeenstemming met, conformiteit; compliant: voldoet aan, compliant, naleving; approved: goedgekeurd, typegoedgekeurd, erkend, goedkeuring
- fixed phrase for 'supports evidence for': {"supports evidence for": "levert bewijs voor"}

## Linguistic notes
- locale: nl (Netherlands Dutch)
- plural_categories: one, other
- plural_note: 'one' is exactly 1; 0 and 2+ are 'other'.
- grammatical_case_and_gender: No case; two articles (de/het) chosen by noun gender, so a placeable noun that takes an article needs it fixed. Compounds are written as one word; a placeable inside a compound is avoided.
- address_register: Formal 'u', as usual in technical documentation.
- decimal_separator: ,
- thousands_separator: . (period)
- numbers: Numbers and units are formatted by Intl at runtime through Fluent placeables ({ NUMBER($n) }); never write a number into a translated string. Where a count changes the wording, use a Fluent selector over the plural categories above, not string concatenation.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  nl: Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC 61108, IEC 61162): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.
- EN: Advisory software, not type-approved equipment.
  nl: Adviserende software, geen typegoedgekeurde apparatuur.
- EN: Advisory software for research, simulation and test. It is not type-approved equipment and does not rate or approve a receiver, a clock or a laboratory.
  nl: Adviserende software voor onderzoek, simulatie en test. Het is geen typegoedgekeurde apparatuur en beoordeelt of keurt geen ontvanger, klok of laboratorium goed.
- EN: Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED.
  nl: Alleen adviserend: geen typegoedgekeurde navigatieapparatuur; de exploitant blijft verantwoordelijk. Bewijsniveau: MODELLED.
- Machine translation notice: Machinevertaling, niet beoordeeld door een moedertaalspreker. Engels is de referentie.

## Extra per-language brief from the earlier translator (terms and conventions to keep)
# nl brief (read RULES.md first, including rule 8)
Translate batch NN into DUTCH (lang nl; Netherlands Dutch, formal 'u' or impersonal). Input /tmp/claude-0/i18n/batches/en_NN.ftl; output /tmp/claude-0/i18n/out/nl_NN.ftl; glossary /workspace/kshana-pro/site/i18n-0.40/i18n/glossary/nl.json; finished sample /tmp/claude-0/i18n/out/nl_00.ftl (match its style and terms). Terms: 'bytes' stays; conformance of a file = 'formaatcontrole'; hold-out/holdout = 'achtergehouden set'; bar = 'drempel'; design = 'ontwerp'; fix (position) = 'positiebepaling'; preset = 'voorinstelling'; truth = 'referentie'; baseline = 'basislijn'; commitment = 'vastlegging'; trade = 'afweging'; REFUSED/MISMATCH-type status labels stay in English if they could be parsed, else translate; jamming, spoofing, holdover stay English; config section/table names and keys stay English. Compounds are one word; avoid a placeable inside a compound. Keep CORROBORATED / NOT CORROBORATED in English. No forbidden_translations words as claims; negations kept exactly.

