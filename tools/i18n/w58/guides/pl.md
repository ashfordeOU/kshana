# Guide for Polski (pl)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT (pozycjonowanie, nawigacja i czas)
- GNSS -> GNSS (globalny system nawigacji satelitarnej)
- spoofing -> spoofing *
- jamming -> zagłuszanie (jamming)
- interference -> zakłócenia
- integrity -> integralność
- availability -> dostępność
- continuity -> ciągłość
- accuracy -> dokładność
- precision -> precyzja
- holdover -> holdover *
- ledger -> rejestr (ledger)
- evidence pack -> pakiet dowodowy
- pre-registration -> wstępna rejestracja (pre-rejestracja)
- bar (pass criterion) -> próg (kryterium zaliczenia)
- oracle (independent reference) -> wyrocznia (niezależny wzorzec)
- advisory -> doradczy
- supports evidence for -> dostarcza dowodów na (supports evidence for)
- scenario -> scenariusz
- receiver -> odbiornik
- clock -> zegar
- oscillator -> oscylator
- time error -> błąd czasu
- ionosphere -> jonosfera
- multipath -> wielodrogowość
- carrier phase -> faza nośnej
- pseudorange -> pseudoodległość
- Doppler -> Doppler *
- ephemeris -> efemerydy
- constellation -> konstelacja
- protection level -> poziom ochrony
- dilution of precision (DOP) -> współczynnik DOP (rozmycie dokładności)
- ambiguity resolution -> rozwiązywanie niejednoznaczności
- detection -> detekcja
- false alarm -> fałszywy alarm
- missed detection -> niewykryte zdarzenie
- Monte Carlo -> Monte Carlo *
- Allan deviation -> odchylenie Allana
- time transfer -> transfer czasu
- resilience -> odporność
- orbit determination -> wyznaczanie orbity
- cislunar -> cislunarny (przestrzeń Ziemia–Księżyc)
- synthetic data -> dane syntetyczne
- reproducible -> odtwarzalny
- cross-validation -> walidacja krzyżowa
- tolerance -> tolerancja
- seed -> ziarno (seed) *

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: niezależna zewnętrzna wyrocznia zgadza się; MODELLED: wewnętrznie spójne i powiedziane wprost; PARTNER: odpowiada za to partner sprzętowy; MET: próg spełniony; NOT MET: próg niespełniony; EXPLORATORY: eksploracyjne: nie może zamknąć pierwotnego progu

## Forbidden as claims about Kshana: zgodny, certyfikowany, zgodność (jako twierdzenie o Kshana)

## Style
- plural_categories: one, few, many, other
- plural_note: one: 1; few: 2-4 except 12-14; many: 0, 5-21 and the rest of the integers ending 0,1,5-9; other: fractions. Every counted noun needs all four.
- cases: 7 cases (nominative, genitive, dative, accusative, instrumental, locative, vocative). Nouns after numerals and quantifiers take the genitive plural (5 odbiorników). Define each case-sensitive glossary noun as a Fluent term with attributes (.gen, .acc, .inst, .loc) rather than concatenating endings. Kept-English words and abbreviations (GNSS, PNT, holdover) take no ending: use a carrier noun (sygnał GNSS, tryb holdover).
- register: Neutral technical, impersonal. Prose uses impersonal constructions (Wyświetla się, Można ...); buttons and commands use the bare imperative singular (Uruchom, Zapisz) or a noun (Zapis). No Pan/Pani and no 'ty' in prose.
- separators: Decimal comma; thousands separator a non-breaking space; Intl formats these. Quotation marks „ ”. Space before units as in the source. Colon and semicolon with no space before.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  pl: Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  pl: Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia; nie może być jedyną podstawą żadnej decyzji nawigacyjnej ani dotyczącej bezpieczeństwa.
- EN: Advisory: not type-approved navigation equipment.
  pl: Wyłącznie doradczo: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu.
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  pl: Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC 61108, IEC 61162): za nawigację statku odpowiada nadal operator.
- Machine translation notice: Tłumaczenie maszynowe, niezweryfikowane przez osobę, dla której polski jest językiem ojczystym. Wzorcem jest wersja angielska.
