# Guide for Eesti (et)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT (positsioneerimine, navigatsioon ja aeg)
- GNSS -> GNSS (ülemaailmne satelliitnavigatsioonisüsteem)
- spoofing -> spuufimine (spoofing)
- jamming -> segamine (jamming)
- interference -> häire
- integrity -> terviklikkus
- availability -> kättesaadavus
- continuity -> pidevus
- accuracy -> täpsus
- precision -> korduvtäpsus
- holdover -> holdover (aja hoidmine ilma välise etalonita) *
- ledger -> register (ledger)
- evidence pack -> tõendipakett
- pre-registration -> eelregistreerimine
- bar (pass criterion) -> lävi (läbimise kriteerium)
- oracle (independent reference) -> oraakel (sõltumatu etalon)
- advisory -> nõuandev
- supports evidence for -> toetab tõendeid (supports evidence for)
- scenario -> stsenaarium
- receiver -> vastuvõtja
- clock -> kell
- oscillator -> ostsillaator
- time error -> ajaviga
- ionosphere -> ionosfäär
- multipath -> mitmeteelevi
- carrier phase -> kandelaine faas
- pseudorange -> pseudovahemaa
- Doppler -> Doppler
- ephemeris -> efemeriid
- constellation -> satelliidikonstellatsioon
- protection level -> kaitsetase
- dilution of precision (DOP) -> DOP (täpsuse halvenemise tegur)
- ambiguity resolution -> täisarvuliste mitmetähenduslikkuste lahendamine
- detection -> tuvastamine
- false alarm -> valehäire
- missed detection -> tuvastamata jäänud sündmus
- Monte Carlo -> Monte Carlo
- Allan deviation -> Alani hälve
- time transfer -> aja edastamine
- resilience -> vastupidavus
- orbit determination -> orbiidi määramine
- cislunar -> tsislunaarne (Maa–Kuu ruum)
- synthetic data -> sünteetilised andmed
- reproducible -> reprodutseeritav
- cross-validation -> ristvalideerimine
- tolerance -> tolerants
- seed -> algväärtus (seed) *

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: sõltumatu väline oraakel nõustub; MODELLED: sisemiselt kooskõlas ja see on öeldud välja; PARTNER: vastutab riistvarapartner; MET: lävi täidetud; NOT MET: lävi täitmata; EXPLORATORY: uuriv: ei saa sulgeda algset läve

## Forbidden as claims about Kshana: sertifitseeritud, nõuetele vastav (väitena Kshana kohta)

## Style
- plural_categories: one, other
- plural_note: one: exactly 1; other: everything else. After a numeral the noun is in the singular partitive (5 vastuvõtjat); write it in the 'other' branch, never a plural ending after a number.
- cases: 14 cases, no articles, no grammatical gender. Use Fluent terms with case attributes (.gen, .part, .ine, .ela, .ill, .ad, .abl, .all, .tr). Abbreviations and kept-English words take case endings after a hyphen (GNSS-i, PNT-d, holdover-i); an apostrophe is used only where the word ends in an unpronounced letter. The suffix is part of the string, not a placeable.
- register: Neutral technical, impersonal; imperative second person singular on buttons (Käivita, Salvesta); 'sina' address avoided in prose.
- separators: Decimal comma; thousands separator a non-breaking space; Intl formats these. Quotation marks „ “. A (non-breaking) space between number and unit, as in the source.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  et: Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus.
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  et: Nõuandev: uurimis- ja inseneeriatööriista analüüsitulemus; mitte tüübikinnitust omav navigatsiooniseade ega inimelu ohutusega seotud teenus; seda ei tohi kasutada ainsa alusena ühegi navigatsiooni- ega ohutusotsuse tegemisel.
- EN: Advisory: not type-approved navigation equipment.
  et: Nõuandev: mitte tüübikinnitust omav navigatsiooniseade.
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  et: Nõuandev tarkvara, mitte tüübikinnitust omav navigatsiooniseade (IEC 61108, IEC 61162): laeva navigeerimise eest vastutab jätkuvalt operaator.
- Machine translation notice: Masintõlge, mida emakeelne kõneleja pole üle vaadanud. Võrdlusallikaks on ingliskeelne versioon.
