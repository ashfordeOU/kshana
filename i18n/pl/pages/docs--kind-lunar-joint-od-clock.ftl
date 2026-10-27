# docs--kind-lunar-joint-od-clock: translations (pl)

seg-37d29d8303fe = km

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-593938ee5995 = Źródło: <c1/>

seg-d54a85227f43 = <c1/> (rodzaj scenariusza)

seg-200e58e189c2 = Modelowany wspólny wielotechnikowy księżycowy estymator wsadowy OD + zegara na SYMULOWANEJ sieci: dopasowanie migawkowe metodą Gaussa–Newtona, które łączy geodezyjne opóźnienia VLBI na bazach ziemskich, księżycowo-lokalne odległości stacja↔satelita i odległości międzysatelitarne, aby odzyskać razem pozycję 3-D księżycowej stacji powierzchniowej, pozycje małej konstelacji i przesunięcie zegara każdego obiektu względem wprowadzonej prawdy. Główny uczciwy wynik — VLBI czyni pełną pozycję 3-D stacji obserwowalną tam, gdzie samo księżycowo-lokalne wyznaczanie odległości pozostawia słabo obserwowany kierunek — podano jako kontrast błędu stacji z VLBI i bez VLBI. MODELLED symulowane odzyskanie w pętli zamkniętej (prawda dzieli model obserwacji), deterministyczne (z ziarnem), NIE sprawdzone na danych rzeczywistych; bez propagacji modelu sił wewnątrz solwera; bez TRL, dorobku ani poparcia agencji.

seg-6419390eeae4 = Jeden przebieg <c1/> podsumowuje się tak: lunar-joint-od-clock | { "3" } sats, { "6" } stacji ziemskich | błąd 3-D stacji z VLBI { "3.54" } m wobec samych odległości { "2184.02" } m ({ "617.5" }× ostrzej) | sat pos RMS { "2.20" } m | błąd zegara stacji { "2.87e-10" } s | obs 40/16 params

seg-be3bcad756cc = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Przykład <c1/> ustawia między innymi:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = Wykres, który silnik zapisuje dla scenarios/lunar-joint-od-clock.toml, rodzaj lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> Wsadowa fuzja VLBI + księżycowo-lokalnej odległości + odległości międzysatelitarnej do odzyskania pozycji i zegarów stacji i konstelacji. Wyrocznia (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq z LAPACK gelsd, numpy.linalg.inv; BSD-3) oblicza ponownie każdy krok Gaussa–Newtona, zbieżne rozwiązanie ważonych najmniejszych kwadratów, formalne sigma i błąd stacji na zatwierdzonych jakobianach i obserwacjach sześciu symulowanych sieci, z wstępną rejestracją (5094bc31) przy względnym max({ "1e-8" }, { "100" } kappa eps). Pierwszy przebieg nie zaliczył sieci bez VLBI ({ "6.1e-7" } wobec { "1e-8" }, równanie normalne

seg-5b3f6008f5a7 = <b>VALIDATED</b> Informacja Fishera M=HᵀWH, dolna granica Craméra–Rao, rząd obserwowalności / przestrzeń zerowa defektu układu odniesienia (pseudoodwrotność Moore'a–Penrose'a) oraz optymalne wg D/A/E/T projektowanie eksperymentu. Wyrocznia (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, oparty na LAPACK) — niezależny zewnętrzny autorytet obliczający te same jednoznacznie określone wartości własne, kowariancję Craméra–Rao σ²(XᵀX)⁻¹ i współczynniki rozmycia dokładności GNSS innym algorytmem (dziel i zwyciężaj w LAPACK + LU) niż cykliczne przemiatanie Jacobiego i widmowa pseudoodwrotność w Kshana; zgodność do { "1e-9" }. Ta sama klasa zewnętrznej biblioteki już sprawdza D

seg-af12da412a10 = <b>MODELLED</b> Obserwowalność informacji Fishera wspólnego rozwiązania księżycowego: bez baz ziemskich układ odniesienia absolutny leży w przestrzeni zerowej HᵀWH (pozycja stacji nie. Wyrocznia (InternalConsistency): analityczna struktura defektu układu odniesienia — nieobserwowalny tryb układu absolutnego leży w przestrzeni zerowej informacji Fishera (postać zamknięta), próg rzędu zgadza się z opublikowanym uzasadnieniem projektu 3-stacyjnego, a estymator osiąga wynikającą stąd CRLB w Monte Carlo. Sama geometria księżycowa jest siecią reprezentatywną (nie lataną efemerydą), więc wiersz pozostaje MODELLED; leżący u podstaw silnik FIM/CRLB sprawdzono względem

seg-865ba2668582 = MODELLED symulowane odzyskanie w pętli zamkniętej (prawda dzieli model obserwacji), deterministyczne (z ziarnem), NIE sprawdzone na danych rzeczywistych; bez propagacji modelu sił wewnątrz solwera; bez TRL, dorobku ani poparcia agencji. (katalog rodzajów (<c1/>))

seg-a0d4350a1c66 = Rzetelność: MODELLED symulowane odzyskanie w pętli zamkniętej. Wprowadzona prawda jest odwzorowywana na syntetyczne obserwable przez TEN SAM model geometrii, który odwraca solwer, dodawany jest szum gaussowski z zadanym ziarnem, a estymator odzyskuje wprowadzoną prawdę w granicach szumu. Wyrocznią jest spójność wewnętrzna (odzyskanie prawdy + realizm kowariancji NEES), a NIE walidacja na danych rzeczywistych. Wewnątrz solwera nie ma propagacji modelu sił — satelita (komentarz w pliku scenariusza, wiersze { "24" } do { "29" })

seg-1465694e7e4f = Księżycowa obserwowalność stacji absolutnej (defekt układu odniesienia) ma poziom MODELLED, nie jest niezależnie sprawdzona względem wzorca zewnętrznego: sprawdzono ją względem jej własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Poprzedni</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Następny</s1>lunar-llr-datum
