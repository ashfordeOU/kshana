# Guide for Suomi (fi)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT (paikannus, navigointi ja ajanmääritys)
- GNSS -> GNSS (maailmanlaajuinen satelliittinavigointijärjestelmä)
- spoofing -> harhautus (spoofing)
- jamming -> häirintä (jamming)
- interference -> häiriö
- integrity -> eheys
- availability -> saatavuus
- continuity -> jatkuvuus
- accuracy -> tarkkuus
- precision -> toistotarkkuus
- holdover -> holdover (ajanpito ilman ulkoista viitettä) *
- ledger -> kirjanpito (ledger)
- evidence pack -> todistepaketti
- pre-registration -> ennakkorekisteröinti
- bar (pass criterion) -> kynnys (hyväksymiskriteeri)
- oracle (independent reference) -> oraakkeli (riippumaton vertailu)
- advisory -> ohjeellinen
- supports evidence for -> tukee todisteita (supports evidence for)
- scenario -> skenaario
- receiver -> vastaanotin
- clock -> kello
- oscillator -> oskillaattori
- time error -> aikavirhe
- ionosphere -> ionosfääri
- multipath -> monitie-eteneminen
- carrier phase -> kantoaallon vaihe
- pseudorange -> pseudoetäisyys
- Doppler -> Doppler
- ephemeris -> efemeridi
- constellation -> satelliittitähdistö
- protection level -> suojaustaso
- dilution of precision (DOP) -> DOP (tarkkuuden heikkenemiskerroin)
- ambiguity resolution -> kokonaislukuepävarmuuden ratkaisu
- detection -> havaitseminen
- false alarm -> väärä hälytys
- missed detection -> havaitsematta jäänyt tapahtuma
- Monte Carlo -> Monte Carlo
- Allan deviation -> Allanin poikkeama
- time transfer -> ajansiirto
- resilience -> kestävyys
- orbit determination -> radanmääritys
- cislunar -> kuunläheinen (Maa–Kuu-avaruus)
- synthetic data -> synteettinen data
- reproducible -> toistettava
- cross-validation -> ristiinvalidointi
- tolerance -> toleranssi
- seed -> siemenluku (seed) *

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: riippumaton ulkoinen oraakkeli on samaa mieltä; MODELLED: sisäisesti johdonmukainen, ja se sanotaan ääneen; PARTNER: laitteistokumppani vastaa; MET: kynnys täyttyi; NOT MET: kynnys ei täyttynyt; EXPLORATORY: tutkiva: ei voi sulkea alkuperäistä kynnystä

## Forbidden as claims about Kshana: sertifioitu, vaatimustenmukainen (väitteenä Kshanasta)

## Style
- plural_categories: one, other
- plural_note: one: exactly 1; other: everything else, including 0 and fractions. After a numeral the noun stays in the singular partitive (5 vastaanotinta): write the partitive in both branches of the selector where it differs, and never rely on a plural ending after a number.
- cases: 15 cases, no articles, no grammatical gender. Use Fluent terms with case attributes (.gen, .part, .ine, .ela, .ill, .ade, .abl, .all, .ess, .tra). Abbreviations and kept-English words take the case ending after a colon (GNSS:n, PNT:n, holdover-tilassa); avoid the problem with a carrier noun where it reads better (GNSS-signaali). The suffix colon is part of the string, not a placeable.
- register: Neutral technical, impersonal; passive or imperative second person singular on buttons (Käynnistä, Tallenna); no 'te' address. Compound words closed; no hyphen except at a boundary of identical vowels or with abbreviations.
- separators: Decimal comma; thousands separator a non-breaking space; Intl formats these. Quotation marks ” ” (the same mark both sides). A (non-breaking) space between number and unit, as in the source.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  fi: Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu.
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  fi: Ohjeellinen: tutkimus- ja suunnittelutyökalun analyysitulos; ei tyyppihyväksytty navigointilaite eikä ihmishengen turvaamiseen tarkoitettu palvelu; sitä ei saa käyttää ainoana perusteena navigointia tai turvallisuutta koskevalle päätökselle.
- EN: Advisory: not type-approved navigation equipment.
  fi: Ohjeellinen: ei tyyppihyväksytty navigointilaite.
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  fi: Ohjeellinen ohjelmisto, ei tyyppihyväksytty navigointilaite (IEC 61108, IEC 61162): käyttäjä vastaa edelleen aluksen navigoinnista.
- Machine translation notice: Konekäännös, jota äidinkielinen puhuja ei ole tarkistanut. Viitteenä on englanninkielinen versio.
