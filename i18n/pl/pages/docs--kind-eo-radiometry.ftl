# docs--kind-eo-radiometry: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-8e62cc4af6ea = Strona tematu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-841259b04897 = Źródło: <c1/>

seg-1b0ba13fcef1 = <c1/> (rodzaj scenariusza)

seg-816bd5a5808a = Radiometria i jakość obrazu kamery nadirowej: promieniowanie na aperturze sceny lambertowskiej, równanie kamery, sygnał oraz szum śrutowy/ciemny/odczytu/kwantyzacji i SNR; MTF systemu przy Nyquiście (dyfrakcja x detektor x rozmazanie x drgania), względna odpowiedź krawędziowa z niego wynikająca, Q = lambda F/p oraz NIIRS według GIQE w wersji { "4" } bez kompensacji MTF. MODELLED.

seg-7d786a7bfb86 = Jeden przebieg <c1/> podsumowuje się tak: eo-radiometry: GSD { "0.76" } m, Q { "1.06" }, SNR { "39" } (studnia { "6" } %), MTF@Nyquist { "0.212" }, RER { "0.573" }, GIQE4 NIIRS { "4.27" } (MODELLED)

seg-3378b7b0716f = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-d613181f3fe3 = Przykład <c1/> ustawia m.in.:

seg-ffb002276b21 = um

seg-1c15591babed = px

seg-e94f9ad9e6c4 = Etykieta wyniku (silnika): MODELLED — radiometria kamery nadirowej (scena lambertowska, równanie kamery, szum śrutowy/ciemny/odczytu/kwantyzacji), MTF systemu przy Nyquiście (dyfrakcja x detektor x rozmazanie x drgania), względna odpowiedź krawędziowa, Q = lambda F/p oraz NIIRS według GIQE { "4" } bez kompensacji MTF; NIIRS jest empiryczną regresją na modelow

seg-bf7b52f7a01e = Wykres zapisywany przez silnik dla scenarios/eo-radiometry.toml, rodzaj eo-radiometry

seg-562a7cf2859c = <b>MODELLED</b> Budżet sygnału do szumu kamery nadirowej (promieniowanie sceny lambertowskiej, równanie kamery, szum śrutowy, ciemny, odczytu i kwantyzacji), MTF systemu przy Nyquiście jako iloczyn dyfrakcji nieprzesłoniętej apertury, apertury detektora, liniowego rozmazania i Gaus

seg-dadea618d757 = <b>MODELLED</b> Budżet sygnału do szumu kamery nadirowej (promieniowanie sceny lambertowskiej, równanie kamery, szum śrutowy, ciemny, odczytu i kwantyzacji), MTF systemu przy Nyquiście jako iloczyn. Wyrocznia (InternalConsistency): Postacie zamknięte: MTF dyfrakcji przy połowie odcięcia, jednopikselowa krawędź rampy czystej apertury detektora (RER { "1" }), krawędź rozkładu normalnego rozmycia gaussowskiego (RER = erf(0.5/(sigma sqrt { "2" }))), skalowanie szumu śrutowego oraz współczynniki GIQE { "4" } tak, jak opublikowano (Leachtenauer i in., Applied Optics { "36" }({ "32" }), { "1997" }). CZEGO NIE OBEJMUJE: nie porównano z żadną zewnętrzną kamerą, zmierzonym MTF ani obrazu z oceną; GIQE jest empiryczną regresją z jej

seg-5182b4b0f8d6 = MODELLED — radiometria kamery nadirowej (scena lambertowska, równanie kamery, szum śrutowy/ciemny/odczytu/kwantyzacji), MTF systemu przy Nyquiście (dyfrakcja x detektor x rozmazanie x drgania), względna odpowiedź krawędziowa, Q = lambda F/p oraz NIIRS według GIQE { "4" } bez kompensacji MTF; NIIRS jest empiryczną regresją na modelowanych danych wejściowych, a nie ocenionym obrazem (wynik <c1/>)

seg-b2f1e6466c2c = Radiometria i jakość obrazu kamery nadirowej dla ILLUSTRATIVE małej kamery obserwacji Ziemi (nie jest to projekt żadnego operatora): apertura { "0.40" } m, ogniskowa { "3.6" } m (F/9), piksele { "5.5" } um, z { "500" } km. Przebieg podaje budżet sygnału do szumu dla sceny o odbiciu { "15" } %, MTF systemu przy Nyquiście, względną odpowiedź krawędziową i NIIRS według GIQE w wersji { "4" }. MODELLED: NIIRS jest empiryczną regresją obliczaną na modelowanych danych wejściowych, n (komentarz w pliku scenariusza, wiersze { "1" } do { "5" })

seg-aaf9ed3b0899 = Radiometria kamery elektrooptycznej, MTF, względna odpowiedź krawędziowa i NIIRS według GIQE { "4" } są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-d6c92dc655ab = <s1>Poprzedni</s1>eo-coverage

seg-a0daef9a496e = <s1>Następny</s1>ephemeris
