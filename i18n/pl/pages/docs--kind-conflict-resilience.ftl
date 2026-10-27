# docs--kind-conflict-resilience: translations (pl)

seg-c4ed27a559df = Strona tematu: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-216efc4e6fba = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Alternatywne PNT bez GPS</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-98133e74f88a = Strona rodziny: <a1>Alternatywne PNT bez GPS</a1>

seg-34f14aa2ee0b = Źródło: <c1/>

seg-a80556cfe1a9 = <c1/> (rodzaj scenariusza)

seg-c8f93431680a = Odporność warstwowego PNT w konflikcie MODELLED (P7): użytkownik w środowisku spornym dysponuje kilkoma warstwami PNT (GNSS usługi otwartej, szerokopasmowy GNSS, uwierzytelniona konstelacja, przekaźnik augmentacji), każda z bazową dostępnością, dokładnością 1σ i podatnością na odmowę dla każdego wektora wspólnego zagrożenia zagłuszaniem/spoofingiem. Przeglądany po intensywności Monte Carlo Z ZIARNEM odmawia każdej warstwie z prawdopodobieństwem clamp(podatność·intensywność·waga_wektora,{ "0,1" }), łączy ocalałe zamkniętą regułą odwrotnej wariancji σ_fused=(Σ 1/σ_i²)^(−1/2) i podaje prawdopodobieństwo całkowitej utraty (wszystkie warstwy odmówione), medianę błędu po połączeniu oraz statystyki użyteczności/odmowy dla każdej warstwy względem intensywności. Główny współczynnik odporności (prawdopodobieństwo całkowitej utraty dla pojedynczej warstwy wobec warstwowego) wynosi ~7x przy założeniu NIEZALEŻNOŚCI; jednoczynnikowy przegląd skorelowanej odmowy z kopułą Gaussa pokazuje następnie, że to ~7x zapada się ku { "1" } w miarę wzrostu korelacji odmowy (korelacja pokonuje warstwowanie). Blok wrażliwości na założenia a priori rozpina wynik główny po ŹRÓDŁOWO UDOKUMENTOWANYCH założeniach podatności przez tornado mcda + realokację wysiłku zagrożenia Dirichleta + przedziały ufności z percentyli. Rdzeń VALIDATED: całkowita utrata Monte Carlo zbiega do zamkniętego iloczynu niezależnego Π_i p_deny_i (w granicach błędu standardowego MC przy stałym ziarnie i dużym N); połączenie odwrotnej wariancji jest tożsamością w postaci zamkniętej; przy ρ={ "0" } kopuła redukuje się do modelu niezależnego, a każde ρ zachowuje brzegowy wskaźnik odmowy każdej warstwy. MODELLED: wielkości podatności/dostępności/dokładności dla każdej warstwy są danymi wejściowymi ze źródeł, ale obliczonymi na podstawie modelu (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zob. conflict_threat_params), a konkretna wielkość ~7x i kształt krzywej współczynnik-względem-korelacji wynikają z tej parametryzacji. Podział przeżywalności dla każdego wektora w § { "4.2" } rozdziela następnie wspólne zagrożenie RF na cztery nazwane wektory (zagłuszanie/spoofing/kinetyczny/cybernetyczny) i podaje dla każdego wektora krzywą łagodnej degradacji użytecznego PNT S_v(x)=1-Prod_i(1-a_i(1-clamp(susceptibility_i,v·x,{ "0,1" }))) — VALIDATED: Monte Carlo z ziarnem dla każdej warstwy zbiega do tej postaci zamkniętej; zagłuszanie jest najostrzejszym wektorem dla skorelowanego punktu odniesienia RF, a warstwa inercjalna odporna na RF jest decydującym ocalałym. To nie jest certyfikowany produkt do oceny dostępności nawigacji.

seg-dd10a00edc2f = Jeden przebieg <c1/> podsumowuje się tak: conflict-resilience | { "4" } warstw ({ "0" } punkt odniesienia) | intensywność odniesienia { "1.00" } | współczynnik odporności w postaci zamkniętej 6.73x MC 6.19x (warstwowy wobec pojedynczej warstwy) | korelacja pokonuje warstwowanie: współczynnik 7.50x @ rho { "0.00" } -> 1.21x @ rho { "0.95" } | przedział a priori [5.51-8.48]x | przeżywalność dla każdego wektora @ ref zagłuszanie { "26" }% spoofing { "80" }% kinetyczny { "100" }% cybernetyczny { "99" }% (najostrzejsze zagłuszanie) | ~7x wynik główny MODELLED, VALIDATED MC->postać zamknięta / tożsamość połączenia / brzegi kopuły / przeżywalność dla każdego wektora

seg-674bafccbaf7 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-71fcff68edaf = Przykład <c1/> ustawia m.in.:

seg-4e3b5bb5a5e7 = GNSS L1 C/A (usługa otwarta)

seg-bd3832c8215d = Etykieta wyniku (silnika): odporność warstwowego PNT w konflikcie MODELLED (P7). Rdzeń VALIDATED: prawdopodobieństwo całkowitej utraty Monte Carlo zbiega do zamkniętego iloczynu niezależnego Pi_i p_deny_i (sprawdzone w granicach błędu standardowego Monte Carlo przy stałym ziarnie i dużym N); połączenie pozycji odwrotnej wariancji sigma_fused = (sum_i 1/sig

seg-4dd2bcc206db = Wykres zapisywany przez silnik dla scenarios/conflict-resilience.toml, rodzaj conflict-resilience

seg-c0e69524f05d = <b>MODELLED</b> Podwyniki dla poszczególnych wymiarów w siedmiu własnych kategoriach odporności Kshana (nie w terminach DHS), funkcje RDRR RethinkPNT i kryteria Yanga, każdy oznaczony jako obliczony na podstawie modelu z i. Wyrocznia (InternalConsistency): Wyprowadzone ręcznie wzory dla poszczególnych metryk: różnorodność odwrotna Simpsona, ważona średnia złożona, ograniczone/nieograniczone czasy trwania osi czasu, drabina poziomów najsłabszego ogniwa

seg-2ca37a78e899 = MODELLED odporność warstwowego PNT w konflikcie (P7). Rdzeń VALIDATED: prawdopodobieństwo całkowitej utraty Monte Carlo zbiega do zamkniętego iloczynu niezależnego Pi_i p_deny_i (sprawdzone w granicach błędu standardowego Monte Carlo przy stałym ziarnie i dużym N); połączenie pozycji odwrotnej wariancji sigma_fused = (sum_i 1/sigma_i^{ "2" })^(-1/2) jest tożsamością w postaci zamkniętej; przy korelacji rho={ "0" } kopuła Gaussa redukuje się dokładnie do niezależnego mo (wynik <c1/>)

seg-d0d834e377ee = Odporność warstwowego PNT w konflikcie MODELLED (P7): użytkownik w środowisku spornym dysponuje kilkoma warstwami PNT (GNSS usługi otwartej, szerokopasmowy GNSS, uwierzytelniona konstelacja, przekaźnik augmentacji), każda z bazową dostępnością, dokładnością 1σ i podatnością na odmowę dla każdego wektora wspólnego zagrożenia zagłuszaniem/spoofingiem. (katalog rodzajów (<c1/>))

seg-3ca12700b54c = Główny współczynnik odporności (prawdopodobieństwo całkowitej utraty dla pojedynczej warstwy wobec warstwowego) wynosi ~7x przy założeniu NIEZALEŻNOŚCI; jednoczynnikowy przegląd skorelowanej odmowy z kopułą Gaussa pokazuje następnie, że to ~7x zapada się ku { "1" } w miarę wzrostu korelacji odmowy (korelacja pokonuje warstwowanie). (katalog rodzajów (<c1/>))

seg-70e4fdff099f = MODELLED: wielkości podatności/dostępności/dokładności dla każdej warstwy są danymi wejściowymi ze źródeł, ale obliczonymi na podstawie modelu (JammerTest { "2024" }, TEXBAT, EASA SIB, RTCA DO-229, LunaNet/IOAG — zob. conflict_threat_params), a konkretna wielkość ~7x i kształt krzywej współczynnik-względem-korelacji wynikają z tej parametryzacji. (katalog rodzajów (<c1/>))

seg-33541cca61b6 = Użytkownik w środowisku spornym dysponuje czterema warstwami PNT w paśmie RF, które wszystkie korzystają z tego samego pasma, a więc dzielą wektor odmowy zagłuszaniem/spoofingiem — przypadek kruchy i skorelowany. Scenariusz podaje: * prawdopodobieństwo całkowitej utraty względem intensywności zagrożenia (Monte Carlo wobec zamkniętego iloczynu niezależnego, do którego zbiega), * współczynnik odporności warstwowego wobec pojedynczej warstwy ~7x przy założeniu niezależności, * jak to ~7x zapada się do (komentarz w pliku scenariusza, wiersze { "3" } do { "15" })

seg-83badfe4784d = Każda wielkość dla warstwy jest daną wejściową MODELLED z podanym pochodzeniem; zob. src/conflict_threat_params.rs dla źródłowych założeń a priori [min, nominalna, maks] i profili podatności dla każdego wektora (JammerTest { "2024" }, TEXBAT, EASA SIB 2022-02, RTCA DO-229, LunaNet/IOAG). Pominięcie <c1/> uruchamia ten sam źródłowy czterowarstwowy punkt odniesienia; jest tutaj wypisany — wraz z vector_profile każdej warstwy — dla przejrzystości. (komentarz w pliku scenariusza, wiersze { "17" } do { "22" })

seg-bb182ed41520 = Punktacja dostosowana do ram odporności PNT jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-6a42653a8a0f = <s1>Poprzedni</s1>combined-altpnt

seg-2bd3e9d1505c = <s1>Następny</s1>constellation-design
