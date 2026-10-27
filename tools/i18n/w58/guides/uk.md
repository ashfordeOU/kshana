# Guide for Українська (uk)

## Terms (English -> rendering; * = keep the English word)
- PNT -> PNT (позиціонування, навігація та час) *
- GNSS -> ГНСС / GNSS (глобальна навігаційна супутникова система)
- spoofing -> спуфінг
- jamming -> глушіння (jamming)
- interference -> завади
- integrity -> цілісність
- availability -> доступність
- continuity -> безперервність
- accuracy -> точність
- precision -> прецизійність
- holdover -> holdover (утримання часу) *
- ledger -> реєстр (ledger)
- evidence pack -> пакет доказів
- pre-registration -> попередня реєстрація
- bar (pass criterion) -> поріг (критерій відповідності)
- oracle (independent reference) -> оракул (незалежний еталон)
- advisory -> консультативний
- supports evidence for -> підтримує докази для (supports evidence for)
- scenario -> сценарій
- receiver -> приймач
- clock -> годинник
- oscillator -> генератор (осцилятор)
- time error -> похибка часу
- ionosphere -> іоносфера
- multipath -> багатопроменевість
- carrier phase -> фаза несівної
- pseudorange -> псевдодальність
- Doppler -> Доплер
- ephemeris -> ефемериди
- constellation -> орбітальне угруповання
- protection level -> рівень захисту
- dilution of precision (DOP) -> геометричний чинник DOP (погіршення точності)
- ambiguity resolution -> розв'язання неоднозначностей
- detection -> виявлення
- false alarm -> хибна тривога
- missed detection -> пропущене виявлення
- Monte Carlo -> Монте-Карло
- Allan deviation -> девіація Аллана
- time transfer -> передавання часу
- resilience -> стійкість
- orbit determination -> визначення орбіти
- cislunar -> цисмісячний (простір Земля–Місяць)
- synthetic data -> синтетичні дані
- reproducible -> відтворюваний
- cross-validation -> перехресна перевірка
- tolerance -> допуск
- seed -> зерно (seed) *

## Tier and verdict words: stay English capitals. Glosses (for reference only): VALIDATED: незалежний зовнішній оракул погоджується; MODELLED: внутрішньо узгоджено, і про це сказано прямо; PARTNER: відповідає апаратний партнер; MET: поріг виконано; NOT MET: поріг не виконано; EXPLORATORY: пошукове: не може закрити початковий поріг

## Forbidden as claims about Kshana: сертифікований, відповідний вимогам (як твердження про Kshana)

## Style
- plural_categories: one, few, many, other
- plural_note: one: 1, 21, 31 and so on (not 11); few: 2-4, 22-24 and so on (not 12-14); many: 0, 5-20 and the rest; other: fractions. Every counted noun needs all four.
- cases: 7 cases (including the vocative). Numerals govern case (5 приймачів, 2 приймачі, 1 приймач). Use Fluent terms with case attributes. Abbreviations and kept-English words do not decline: use a carrier noun (сигнал ГНСС, режим holdover). Write Ukrainian words and abbreviations in Cyrillic, with GNSS in Latin beside ГНСС at first use.
- register: Formal-neutral technical: 'ви' in lower case when address is unavoidable, polite plural imperative (Запустіть); impersonal constructions in prose. Standard technical terminology only; no political or topical content.
- separators: Decimal comma; thousands separator a non-breaking space; Intl formats these. Quotation marks « » (nested „ “). Spaced en dash or em dash as in the source.

## Advisory sentences (use exactly when an English message embeds the English sentence)
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.
  uk: Лише консультативно: результат аналізу від дослідницького та інженерного інструмента; це не навігаційне обладнання із затвердженням типу і не послуга забезпечення безпеки життя.
- EN: Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service; it must not be the sole basis for any navigation or safety decision.
  uk: Лише консультативно: результат аналізу від дослідницького та інженерного інструмента; це не навігаційне обладнання із затвердженням типу і не послуга забезпечення безпеки життя; його не можна використовувати як єдину підставу для будь-якого навігаційного рішення або рішення щодо безпеки.
- EN: Advisory: not type-approved navigation equipment.
  uk: Лише консультативно: це не навігаційне обладнання із затвердженням типу.
- EN: Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel.
  uk: Консультативне програмне забезпечення, не навігаційне обладнання із затвердженням типу (IEC 61108, IEC 61162): відповідальність за навігацію судна залишається на операторі.
- Machine translation notice: Машинний переклад, не перевірений носієм мови. Еталоном є англійська версія.
