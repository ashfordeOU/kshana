# docs--kind-lunar-time-budget: translations (pl)

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-8f8871ac8a0f = Strona tematu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Strona tematu: <a1>integrations.md</a1>

seg-11f512367036 = Źródło: <c1/>

seg-f7cd4fcfc62d = <c1/> (rodzaj scenariusza)

seg-cac3a0bcbfc6 = MODELLED kompletny budżet błędu czasu Koordynowanego Czasu Księżycowego (LTC): siedem składników błędu LTC złożonych jako krzywe błędu czasu x_i(τ) po całej siatce czasów uśredniania, sumowanych pierwiastkowo do x_Σ(τ), oraz PUNKT PRZECIĘCIA zegar–układ odniesienia τ, w którym rosnący składnik zegara wyprzedza stały składnik realizacji układu odniesienia w czasie rzeczywistym (poniżej niego budżet jest ograniczony układem odniesienia, powyżej zegarem) — uczciwa odpowiedź na artefakt pojedynczego τ. Nachylenia względem τ są w postaci zamkniętej i można je sprawdzić analitycznie (zegar τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, poziomy τ^{ "0" }, pomiar τ^{ "{" }-1/2{ "}" }), a wiersze zegara odtwarzają opublikowane jednodobowe specyfikacje zegarów (crate::clock_specs); WIELKOŚCI poziomów łącza RF/optycznego, realizacji układu odniesienia, reszty relatywistycznej i efemeryd to modelowane przydziały budżetu (udokumentowane wartości domyślne, możliwe do nadpisania przez wywołującego), a nie pomiary. Wkładem jest odtwarzalny punkt przecięcia τ, a nie certyfikowana liczba dla poszczególnych składników; nie jest certyfikowane do operacyjnego pomiaru czasu.

seg-8a5c9e451d4e = Jeden przebieg <c1/> podsumowuje się tak: lunar-time-budget | zegar passive-h-maser | 7-składnikowe x_Σ(τ) po { "57" } punktach τ ({ "1" }–{ "1e7" } s) | punkt przecięcia τ { "8.689e4" } s (x { "1.001e-9" } s) | poziom układu odniesienia { "1.001e-9" } s | zegar x({ "1" } d) { "0.995" } ns (MODELLED)

seg-7cdc521303eb = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-c050033b32c3 = Przykład <c1/> ustawia między innymi:

seg-eebd3e40d0b9 = Etykieta wyniku (silnika): MODELLED kompletny budżet błędu czasu LTC. Nachylenia względem τ są w postaci zamkniętej i można je sprawdzić analitycznie (zegar τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, poziomy τ^{ "0" }, pomiar τ^{ "{" }-1/2{ "}" }), a wiersze zegara odtwarzają opublikowane jednodobowe specyfikacje zegarów; WIELKOŚCI poziomów łącza RF/optycznego, realizacji układu odniesienia, reszty relatywistycznej i efemeryd

seg-56fe184f2a12 = Wykres, który silnik zapisuje dla scenarios/lunar-time-budget.toml, rodzaj lunar-time-budget

seg-b03509dfcb1b = <b>MODELLED</b> Jeden przebieg lunar-time-budget emituje wiersz punktu przecięcia zegar–układ odniesienia dla każdej klasy zegara względem jednego wspólnego składnika układu odniesienia, więc zegar jest jedyną zmienną w porównaniu; każdy wiersz niesie punkt przecięcia uzyskany dwoma sposobami -- wyznaczony przez bisekcję z

seg-fd52e493b6c2 = <b>MODELLED</b> Opcjonalny blok [time_lab] scenariusza lunar-time-budget modeluje zegar księżycowej stacji referencyjnej (domyślnie klasa miniRAFS, dowolna nazwana klasa lub karta urządzenia dopasowana do podanych punktów stabilności) sterowany do Koordynowanego Czasu Księżycowego i Testy: <a1>lunar_station_time_lab.rs</a1>.

seg-d8807d5308d4 = <b>MODELLED</b> Jeden przebieg lunar-time-budget emituje wiersz punktu przecięcia zegar–układ odniesienia dla każdej klasy zegara względem jednego wspólnego składnika układu odniesienia, więc zegar jest jedyną zmienną w por. Wyrocznia (InternalConsistency): dwa różne obliczenia tej samej wielkości w tej samej bazie kodu, a nie jedno powtórzone: bisekcja na krzywej potęgowej IEEE-1139 nic nie wie o typie szumu, podczas gdy postać zamknięta odwraca dominujący typ algebraicznie, więc błędnie sklasyfikowany typ szumu lub zły przedział objawia się niemałą różnicą względną. Cztery wartości odtwarzają też opublikowaną tabelę z pracy z dokładnością do połowy ostatniej wydrukowanej cyfry -- ale ta tabela była jej własną

seg-4c0d7da4f7f6 = <b>MODELLED</b> Scenariusz lunar-time-budget publikuje swoje wyniki tablicowe jako tabelę w formie długiej (indeks siatki, czas uśredniania, składnik) obok raportu, więc siedem na. Wyrocznia (InternalConsistency): tylko samospójność: opublikowaną sumę sprawdzono względem pierwiastka z sumy kwadratów składników w tym samym pliku, a emitowana krzywa odtwarza opublikowany p3_time_budget_curve.csv we wszystkich { "57" } punktach. Obie kontrole dzielą własne definicje składników tego silnika, więc żadna nie jest niezależna. Składnik zegara opiera się na opublikowanych specyfikacjach zegarów, ale WIELKOŚCI poziomów łącza, układu odniesienia, relatywistycznego i efemeryd są udokumentowane

seg-8abdeb1a36e1 = MODELLED kompletny budżet błędu czasu LTC. Nachylenia względem τ są w postaci zamkniętej i można je sprawdzić analitycznie (zegar τ^{ "{" }+1/2{ "}" }/τ^{ "{" }+{ "1" }{ "}" }, poziomy τ^{ "0" }, pomiar τ^{ "{" }-1/2{ "}" }), a wiersze zegara odtwarzają opublikowane jednodobowe specyfikacje zegarów; WIELKOŚCI poziomów łącza RF/optycznego, realizacji układu odniesienia, reszty relatywistycznej i efemeryd są modelowanymi przydziałami budżetu (udokumentowane wartości domyślne, możliwe do nadpisania przez wywołującego), a nie pomiarami. Wkładem (wynik <c1/>)

seg-66a794432751 = MODELLED kompletny budżet błędu czasu Koordynowanego Czasu Księżycowego (LTC): siedem składników błędu LTC złożonych jako krzywe błędu czasu x_i(τ) po całej siatce czasów uśredniania, sumowanych pierwiastkowo do x_Σ(τ), oraz PUNKT PRZECIĘCIA zegar–układ odniesienia τ, w którym rosnący składnik zegara wyprzedza stały składnik realizacji układu odniesienia w czasie rzeczywistym (poniżej niego budżet jest ograniczony układem odniesienia, powyżej zegarem) — uczciwa odpowiedź na artefakt pojedynczego τ (katalog rodzajów (<c1/>))

seg-ca1763d4a416 = Rzetelność: MODELLED. Nachylenia względem tau są w postaci zamkniętej i można je sprawdzić analitycznie (zegar tau^{ "{" }+1/2{ "}" } lub tau^{ "{" }+{ "1" }{ "}" }, poziomy tau^{ "0" }, pomiar tau^{ "{" }-1/2{ "}" }), a wiersze zegara odtwarzają opublikowane jednodobowe specyfikacje zegarów; ale WIELKOŚCI poziomów łącza RF/optycznego, realizacji układu odniesienia, reszty relatywistycznej i efemeryd są modelowanymi przydziałami budżetu (udokumentowane wartości domyślne, możliwe do nadpisania przez wywołującego), a nie pomiarami. Wkładem jest (komentarz w pliku scenariusza, wiersze { "13" } do { "18" })

seg-8f884949bdf1 = Tabela księżycowych punktów przecięcia czasu dla poszczególnych klas zegarów ma poziom MODELLED, nie jest niezależnie sprawdzona względem wzorca zewnętrznego: sprawdzono ją względem jej własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5eaed32490ca = Odtwarzalność księżycowego budżetu błędu czasu ma poziom MODELLED, nie jest niezależnie sprawdzona względem wzorca zewnętrznego: sprawdzono ją względem jej własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Poprzedni</s1>lunar-station-coverage

seg-a0992d394960 = <s1>Następny</s1>lunar-time-offset
