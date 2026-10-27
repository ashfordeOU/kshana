# docs--kind-launch-window: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-b054c73f22e5 = brak wartości

seg-8e62cc4af6ea = Strona tematu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Źródło: <c1/>

seg-e0990c5f14da = <c1/> (rodzaj scenariusza)

seg-7a4e6215a488 = Dwuciałowa geometria startu i wznoszenia: azymut(y) startu (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus od obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg, gdy inklinacja docelowa jest mniejsza niż szerokość geograficzna miejsca, oraz liczba dobowych okazji startu. MODELLED geometria kulistej Ziemi (bez korekty trójkąta prędkości dla obracającej się Ziemi, bez modelu strat na wznoszenie/opór).

seg-e24b0ae723c7 = Jeden przebieg <c1/> podsumowuje się tak: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Przykład <c1/> ustawia między innymi:

seg-58d26f083b8f = Etykieta wyniku (silnika): MODELLED — dwuciałowa geometria startu dla kulistej Ziemi; azymut to geometryczna zależność sin(Az)=cos(i)/cos(lat) (bez korekty trójkąta prędkości dla obracającej się Ziemi, bez modelu strat na wznoszenie/opór)

seg-9696283a95ae = Wykres zapisany przez silnik dla scenarios/launch-window.toml, rodzaj launch-window

seg-38175030f689 = <b>MODELLED</b> Dwuciałowy azymut(y) startu (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus od obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg i dobowe okazje oraz, przy podanej epoce i wierszach IERS finals2000A, miejsce

seg-53bc589c7ed6 = <b>MODELLED</b> Dwuciałowy azymut(y) startu (sin Az = cos i / cos lat), minimalna osiągalna inklinacja, prędkość kołowa, wschodni bonus od obrotu Ziemi, Δv zmiany płaszczyzny typu dogleg a. Wyrocznia (InternalConsistency): geometria startu w postaci zamkniętej z trygonometrii sferycznej względem opublikowanych kotwic z przykładów roboczych (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm { "37" } azymut startu + Ch.6 zmiana płaszczyzny; tests/launch_window_ascent_geometry_reference.rs). Wykorzystują one ten sam wzór zamknięty, który implementuje kshana (opublikowane dopasowanie do wartości / kontrola transkrypcji, InternalConsistency); MODELLED dwuciałowo, bez trójkąta prędkości dla obracającej się Ziemi / wznoszenia / opo

seg-12396619d3e5 = MODELLED — dwuciałowa geometria startu dla kulistej Ziemi; azymut to geometryczna zależność sin(Az)=cos(i)/cos(lat) (bez korekty trójkąta prędkości dla obracającej się Ziemi, bez modelu strat na wznoszenie/opór) (wynik <c1/>)

seg-715f1856bd37 = MODELLED geometria kulistej Ziemi (bez korekty trójkąta prędkości dla obracającej się Ziemi, bez modelu strat na wznoszenie/opór). (katalog rodzajów (<c1/>))

seg-4e9a215e3918 = UCZCIWY ZAKRES: MODELLED. Tylko azymut geometryczny -- bez korekty trójkąta prędkości dla obracającej się Ziemi (bonus jest podawany osobno, do uwzględnienia), bez trajektorii wznoszenia / strat na opór / modelu sterowania. Geometria przed fazą A. Uruchom: kshana scenarios/launch-window.toml (komentarz w pliku scenariusza, wiersze { "8" } do { "11" })

seg-12332d181de4 = Geometria okna startowego i wznoszenia (analiza misji) jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Poprzedni</s1>jamming

seg-78411b85f301 = <s1>Następny</s1>leo-navmsg
