# Guide for Čeština (cs)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT (určování polohy, navigace a času)
- GNSS -> GNSS (globální družicový navigační systém)
- spoofing -> spoofing (podvržení signálu) *
- jamming -> rušení (jamming)
- interference -> interference
- integrity -> integrita
- availability -> dostupnost
- continuity -> kontinuita
- accuracy -> přesnost
- precision -> preciznost
- holdover -> holdover (udržení času) *
- ledger -> registr (ledger)
- evidence pack -> balíček důkazů
- pre-registration -> předregistrace
- bar (pass criterion) -> práh (kritérium splnění)
- oracle (independent reference) -> orákulum (nezávislá reference)
- advisory -> poradní
- supports evidence for -> podporuje důkazy pro (supports evidence for)
- scenario -> scénář
- receiver -> přijímač
- clock -> hodiny
- oscillator -> oscilátor
- time error -> časová chyba
- ionosphere -> ionosféra
- multipath -> vícecestné šíření
- carrier phase -> fáze nosné
- pseudorange -> pseudovzdálenost
- Doppler -> Doppler *
- ephemeris -> efemeridy
- constellation -> konstelace
- protection level -> ochranná úroveň
- dilution of precision (DOP) -> faktor DOP (zhoršení přesnosti)
- ambiguity resolution -> řešení nejednoznačností
- detection -> detekce
- false alarm -> falešný poplach
- missed detection -> nezachycená událost
- Monte Carlo -> Monte Carlo *
- Allan deviation -> Allanova odchylka
- time transfer -> přenos času
- resilience -> odolnost
- orbit determination -> určování oběžné dráhy
- cislunar -> cislunární
- synthetic data -> syntetická data
- reproducible -> reprodukovatelný
- cross-validation -> křížová validace
- tolerance -> tolerance
- seed -> seed (počáteční hodnota generátoru) *

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: nezávislé vnější orákulum souhlasí; MODELLED: vnitřně konzistentní a řečeno otevřeně; PARTNER: odpovídá za to hardwarový partner; MET: práh splněn; NOT MET: práh nesplněn; EXPLORATORY: průzkumné: nemůže uzavřít původní práh

## Forbidden as claims about Kshana: vyhovující, certifikovaný

## Style
- plural_categories: one, few, many, other
- plural_note: one: 1; few: 2-4; many: fractions; other: 0 and 5 and up. Every counted noun needs all four.
- cases: 7 cases; nouns after 5 and up take the genitive plural, 2-4 the nominative plural. Use Fluent terms with case attributes for glossary nouns. Abbreviations and kept-English words take no ending: use a carrier noun (signál GNSS, režim holdover).
- register: Neutral technical, impersonal. Direct address, where unavoidable, with vykání in the polite plural imperative (Spusťte, Uložte); no tykání.
- separators: Decimal comma; thousands separator a non-breaking space; Intl formats these. Quotation marks „ “. Non-breaking space after one-letter prepositions (k, s, v, z, a, i, o, u) is a typesetting nicety, not required.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  cs: Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života.
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  cs: Pouze poradní charakter: výstup analýzy z výzkumného a inženýrského nástroje; nejde o typově schválené navigační zařízení ani o službu z oblasti bezpečnosti života; nesmí být jediným podkladem pro žádné rozhodnutí o navigaci ani bezpečnosti.
- EN: Advisory: not type-approved navigation equipment.
  cs: Pouze poradní charakter: nejde o typově schválené navigační zařízení.
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  cs: Software pouze poradního charakteru, nikoli typově schválené navigační zařízení (IEC 61108, IEC 61162): za navigaci plavidla zůstává odpovědný provozovatel.
- Machine translation notice: Strojový překlad, nekontrolovaný rodilým mluvčím. Referenční je anglická verze.
