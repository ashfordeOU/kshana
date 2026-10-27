# docs--kind-lunar-jamming: translations (pl)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Nie zapewnia się — Kshana modeluje osiągi sygnału, a nie sprzęt ładunku użytecznego / anten. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-f85a85f0c7e4 = MHz

seg-7154243aabbe = broadband

seg-cec5c06d38af = <b>MODELLED</b> Księżycowy stosunek zagłuszania do sygnału, efektywne C/N₀ i utrata uchwycenia dla użytkownika na powierzchni selenograficznej pod księżycowym (lub podniesionym) zagłuszaczem, na ilustracyjnej konstelacji klasy Moonlight/LCNS opartej na źródłach publicznych.

seg-edcd55ccc993 = <b>MODELLED</b> Raport <c1/> nie opiera już swojego konturu odmowy na jednej wielkości skalarnej.

seg-bcb02ffed4d0 = Źródło: <c1/>

seg-612388918e36 = <c1/> (rodzaj scenariusza)

seg-a91a9ad5d8d1 = Natywne księżycowe zagłuszanie (jamming) RF: stosunek zakłócenia do sygnału na satelitę, efektywne C/N₀ i utrata synchronizacji dla użytkownika selenograficznego na powierzchni pod księżycowym zakłócaczem powierzchniowym (lub wzniesionym), dla ilustracyjnej, opartej na źródłach publicznych konstelacji klasy Moonlight/LCNS na orbicie księżycowej. Składa istniejącą otwartą fizykę zagłuszania (jamming::j_over_s_db, effective_cn0_dbhz, rx_antenna_gain_db, lock_status, q_factor) z istniejącą geometrią nieba księżycowego (lunar_service::LunarConstellation + topocentric, lunar::selenographic_to_mcmf); żadna geometria ani radiometria nie jest wyprowadzana na nowo. W odróżnieniu od ziemskiego rodzaju <c1/> odcinek sygnału NIE jest stałą mocą odbieraną: izotropowa moc odbierana każdego satelity to jego własny bilans łącza EIRP − FSPL(odległość skośna), więc J/S zmienia się z satelity na satelitę wraz z odległością i elewacją na Księżycu. Podaje JEDEN WIERSZ NA KAŻDE WIDOCZNE ŁĄCZE (epoka, satelita) — azymut, elewację, odległość skośną, obie moce odbierane, których różnicą jest J/S, J/S, nominalne i efektywne C/N₀ oraz stan synchronizacji — plus zagregowane wskaźniki jakości obok (nigdy zamiast) tej tabeli, a także tę samą tabelę jako artefakt CSV. Każde emitowane pole liczbowe ma jednostkę i klasę pochodzenia. Wyniki częściowe VALIDATED niosą wyrocznię swojego modułu źródłowego (równanie przeciwdziałania zagłuszaniu i łącze J/S według Kaplana i Hegarty'ego §{ "9.4" }, odniesione zewnętrznie w tests/gnss_denied_jamming_resilience_reference.rs; geometria księżycowa z lunar_service). Samo złożenie sprawdzono względem niezależnej ścieżki dwóch bilansów łącza (linkbudget::received_signal_power_dbw, inne wyrażenie tłumienia w wolnej przestrzeni) z dokładnością do { "1e-9" } dB. MODELLED: ilustracyjna konstelacja, reprezentatywne EIRP / moc zakłócacza / zyski anten / temperatura szumowa oraz brak zacienienia terenem, wielodrogowości, dynamiki AGC i adaptacyjnego zerowania. Nie jest to certyfikowany produkt do odmowy usługi. Gdy skonfigurowano zakłócacz, raport zawiera także KONTUR ODMOWY Z PASMEM NIEPEWNOŚCI zamiast konturu odczytanego z jednej wartości skalarnej: pełny zmierzony rozkład C/N₀ sygnału użytecznego po tabeli na satelitę (n, min, p05, p25, mediana, p75, p95, max, średnia, odchylenie standardowe próby oraz własna asymetria próby) oraz kontur obliczony przy każdej z tych statystyk pozycyjnych według OBU kryteriów odmowy, które rozpoznaje silnik — dotychczasowego, opartego na stosunku mocy (J/S = { "30" } dB, jak w attack-surface i tracking-loop) oraz kryterium utraty synchronizacji (efektywne C/N₀ spadające do tracking_threshold_dbhz, kryterium, którego używa kolumna stanu tego raportu) — na obu osiach płaszczyzny odmowy (wymagane EIRP zakłócacza przy odległości scenariusza, odległość odmowy przy EIRP scenariusza). Krawędzie pasma TO contour(p05) i contour(p95), to samo odwzorowanie w postaci zamkniętej zastosowane do własnych kwantyli próby: nie sigma dopasowana do próby i nie mediana ± k·odchylenie, z odchyleniem podawanym dla ciągłości i niewykorzystywanym przez nic. Kwantyl już na progu śledzenia lub poniżej nie ma skończonego J/S powodującego odmowę, a jego kolumny utraty synchronizacji są puste z policzonym powodem, nigdy ze ściśniętym promieniem.

seg-6693c3ebcb07 = Jeden przebieg <c1/> podsumowuje się tak: lunar-jamming | { "4" } sats, { "12" } epok, { "38" } łączy z (-89.67, { "129.78" }) | J/S { "33.651" }..36.668 dB (średnia { "35.622" }) | { "0" } LOST | dostępność { "0.167" } z { "0.167" } nominalnej

seg-6e01b6354e40 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-c61fb6515ed9 = Przykład <c1/> ustawia między innymi:

seg-6fe8b3c6c584 = Wykres, który silnik zapisuje dla scenarios/lunar-jamming.toml, rodzaj lunar-jamming

seg-d4ae2f589112 = <b>MODELLED</b> Natywny księżycowy stosunek zakłócenia do sygnału, efektywne C/N₀ i utrata synchronizacji dla użytkownika selenograficznego na powierzchni pod księżycowym zakłócaczem powierzchniowym (lub wzniesionym), dla ilustr. Wyrocznia (ReferenceImpl): kontrola krzyżowa złożenia względem niezależnej ścieżki kodu w repozytorium: każde J/S na łącze jest wyprowadzane na nowo jako różnica dwóch bilansów łącza obliczonych przez linkbudget::received_signal_power_dbw, którego tłumienie w wolnej przestrzeni to pojedyncze wyrażenie { "20" }·log10(4πRf/c), a nie suma trzech składników używana przez jamming::free_space_path_loss_db — oba zgadzają się z dokładnością < { "1e-9" } dB w każdym wierszu (zmierzony najgorszy przypadek { "7.11e-14" } dB, czyli zaokrąglenie zmiennoprzecinkowe)

seg-dbe54e7cc800 = <b>MODELLED</b> Raport <c1/> nie opiera już swojego konturu odmowy na jednej wartości skalarnej. Emituje pełny zmierzony rozkład C/N₀ sygnału użytecznego po tabeli na satelitę. Wyrocznia (InternalConsistency): spójność wewnętrzna względem własnych funkcji prostych silnika, co jest wszystkim, co ta możliwość może uczciwie deklarować. Każdy punkt konturu jest odwróceniem w postaci zamkniętej, a każde odwrócenie sprawdza się, przepuszczając jego odpowiedź z powrotem przez funkcję PROSTĄ, którą oceniano wiersze samego raportu: kolumnę J/S przez jamming::effective_cn0_dbhz (która musi zwrócić tracking_threshold_dbhz z dokładnością < { "1e-9" } dB-Hz), kolumnę odległości

seg-d48926e62856 = MODELLED: ilustracyjna konstelacja, reprezentatywne EIRP / moc zakłócacza / zyski anten / temperatura szumowa oraz brak zacienienia terenem, wielodrogowości, dynamiki AGC i adaptacyjnego zerowania. (katalog rodzajów (<c1/>))

seg-c455dbcb9f8c = MODELLED. Konstelacja to ilustracyjna, oparta na źródłach publicznych geometria klasy Moonlight/LCNS (nie rzeczywiste efemerydy; bez sugerowania powiązań ani poparcia), a model zakłóceń to bilans łącza: bez zacienienia zakłócacza terenem (efekt pierwszego rzędu w terenie okołobiegunowym południowym), bez wielodrogowości, bez dynamiki bliskie/dalekie AGC, bez adaptacyjnego zerowania, bez histerezy akwizycja–śledzenie. (komentarz w pliku scenariusza, wiersze { "26" } do { "30" })

seg-da57cc7f1aa4 = Księżycowe zagłuszanie (jamming) RF nawigacji powierzchniowej (J/S na satelitę) ma poziom MODELLED, nie jest niezależnie sprawdzone względem wzorca zewnętrznego: sprawdzono je względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-dba1589d3c1e = Księżycowy kontur odmowy z pasmem niepewności z zmierzonego rozrzutu C/N₀ ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a2889fb2b42a = Strona tematu: <a1>integrations.md</a1>

seg-03b50b21e5a8 = <s1>Poprzedni</s1>lunar-interop-export

seg-02568469f628 = <s1>Następny</s1>lunar-joint-od-clock
