# docs--kind-entry-heating: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-a44edb1eb84d = kg

seg-8e62cc4af6ea = Strona tematu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-d72b4c5393e0 = earth

seg-13b9e9187ab9 = Źródło: <c1/>

seg-3a3f732cc2dd = <c1/> (rodzaj scenariusza)

seg-b843e2e0a4ee = Wejście w atmosferę 3-DoF jako punkt materialny nad obracającą się sferyczną Ziemią lub Marsem (balistyczne lub z siłą nośną przy stałym przechyle), RK4, przez US76, atmosferę wykładniczą lub marsjańską, z konwekcyjnym nagrzewaniem w punkcie stagnacji Suttona-Gravesa (NASA TR R-376): szczytowe opóźnienie, strumień ciepła i ciśnienie dynamiczne, obciążenie cieplne, zasięg poziomy, kontrola energii w układzie wirującym i obok niej postać zamknięta Allena-Eggersa. Szczytowe opóźnienie jest sprawdzone względem opublikowanego nominalnego przebiegu Stardust; nagrzewanie jest MODELLED.

seg-05c8dac8d411 = Jeden przebieg <c1/> podsumowuje się tak: entry-heating (earth): V_rel { "12551" } m/s, γ { "8.43" }° -> szczyt { "35.4" } g na { "54.2" } km, szczytowe q { "746" } W/cm² na { "62.0" } km, obciążenie cieplne { "20970" } J/cm², szczytowe q_dyn { "20.8" } kPa; terminal-altitude po { "317" } s (postać zamknięta { "60.2" } g; MODELLED 3-DoF, bez promieniowania/TPS)

seg-96504cafb034 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-1b68d973fd30 = Przykład <c1/> ustawia m.in.:

seg-05ce408c2dbb = kg/m^{ "2" }

seg-1a89d87a48a5 = NACA Report { "1381" } ({ "1958" }) stałe balistyczne

seg-3159fc595ac9 = kg/m^{ "3" }

seg-2721e146b7be = Etykieta wyniku (silnika): MODELLED — wejście 3-DoF jako punkt materialny nad obracającą się sferyczną planetą (grawitacja centralna, bez J2), współobracająca się atmosfera bez wiatru, stałe C_D, L/D i przechył, RK4; konwekcyjne nagrzewanie w punkcie stagnacji według NASA TR R-376 ({ "1971" }), zimna ściana, BEZ nagrzewania radiacyjnego, BEZ odpowiedzi TPS/ablacji, NIE 6-DoF

seg-dbb618cd6357 = Wykres zapisywany przez silnik dla scenarios/entry-heating-stardust.toml, rodzaj entry-heating

seg-e73b339df97b = <b>VALIDATED</b> Wejście 3-DoF jako punkt materialny nad obracającą się sferyczną Ziemią przez US Standard Atmosphere { "1976" }, całkowane RK4 z inercjalnego stanu wejścia, z podaniem szczytowego opóźnienia i jego wysokości; stan wejścia względem planety z i Testy: <a1>entry_stardust_published.rs</a1>.

seg-10124432b79b = <b>MODELLED</b> Konwekcyjny strumień ciepła w punkcie stagnacji q = k sqrt(rho/R_n) V^{ "3" } ze stałymi Suttona-Gravesa dla powietrza ziemskiego i atmosfery Marsa (NASA TR R-376, { "1971" }), jego szczyt i scałkowane obciążenie cieplne wzdłuż wejścia 3-DoF, balistycznego lub z siłą nośną przy c Testy: <a1>entry_stardust_published.rs</a1>.

seg-54d133781215 = <b>VALIDATED</b> Wejście 3-DoF jako punkt materialny nad obracającą się sferyczną Ziemią przez US Standard Atmosphere { "1976" }, całkowane RK4 z inercjalnego stanu wejścia, z poda. Wyrocznia (ExternalDataset): Nominalny przebieg Stardust z Desai, Mitcheltree i Cheatwood ({ "1999" }, NASA NTRS { "20050042027" }): maksymalne opóźnienie { "33.4" } g przy { "12.6" } km/s względem planety z masą startową { "45.8" } kg, trajektoria 6-DoF POST z pełną bazą aerodynamiczną; interfejs wejścia z Desai, Lyons, Tooley i Kangas (NTRS { "20090004445" }): promień { "6503.14" } km, inercjalnie { "12.9" } km/s przy -8.2 deg. Progi zarejestrowane z góry w xval/entry-stardust/PREREGISTRATION.

seg-03878684f9a1 = <b>MODELLED</b> Konwekcyjny strumień ciepła w punkcie stagnacji q = k sqrt(rho/R_n) V^{ "3" } ze stałymi Suttona-Gravesa dla powietrza ziemskiego i atmosfery Marsa (NASA TR R-376, { "1971" }), jego . Wyrocznia (InternalConsistency): Spójność wewnętrzna: zależność i stałe tak, jak wydrukowano w NASA TR R-376, kontrola zbieżności półkroku oraz oczekiwana kolejność szczytów nagrzewania i opóźnienia. CZEGO NIE OBEJMUJE: nie porównano żadnej opublikowanej wartości nagrzewania (artykuły o Stardust podają limit projektowy i oszacowanie konwekcyjne plus radiacyjne około { "1200" } W/cm2, którego zależność wyłącznie konwekcyjna nie może dopasować); brak nagrzewania radiacyjnego, temperatury ściany lub

seg-a0f300b2ce78 = MODELLED — wejście 3-DoF jako punkt materialny nad obracającą się sferyczną planetą (grawitacja centralna, bez J2), współobracająca się atmosfera bez wiatru, stałe C_D, L/D i przechył, RK4; konwekcyjne nagrzewanie w punkcie stagnacji według NASA TR R-376 ({ "1971" }), zimna ściana, BEZ nagrzewania radiacyjnego, BEZ odpowiedzi TPS/ablacji, NIE 6-DoF (wynik <c1/>)

seg-47f81ab160cc = Szczytowe opóźnienie jest sprawdzone względem opublikowanego nominalnego przebiegu Stardust; nagrzewanie jest MODELLED. (katalog rodzajów (<c1/>))

seg-47cda83af127 = Interfejs wejścia na promieniu { "6503.14" } km, inercjalnie { "12.9" } km/s przy -8.2 deg, { "45.8" } kg, średnica { "0.811" } m, promień nosa { "0.2202" } m (Desai i in., NASA NTRS { "20050042027" } i { "20090004445" }). Szerokość geograficzna i kierunek są założonym przybliżonym wejściem nad Pacyfikiem; C_D jest domyślną wartością modułu dla stożka ze sferą { "60" } deg. Opublikowane nominalne szczytowe opóźnienie 6-DoF: { "33.4" } g. Nagrzewanie jest wyłącznie konwekcyjne Suttona-Gravesa, MODELLED. (komentarz w pliku scenariusza, wiersze { "4" } do { "8" })

seg-98af076be1ac = Konwekcyjne nagrzewanie w punkcie stagnacji przy wejściu (Sutton-Graves) w wejściu 3-DoF jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-77c073cd5d67 = <s1>Poprzedni</s1>earth-gnss-lunar

seg-20ce5d56783c = <s1>Następny</s1>eo-coverage
