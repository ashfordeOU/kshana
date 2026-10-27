# docs--kind-constellation-design: translations (pl)

seg-e27476e37522 = Ziemia

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Konstelacje, pokrycie i geometria</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a4f1e7d2041e = Strona rodziny: <a1>Konstelacje, pokrycie i geometria</a1>

seg-670191cf797f = Strona tematu: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Źródło: <c1/>

seg-f708c26a5139 = <c1/> (rodzaj scenariusza)

seg-de173c9f4034 = Projektowanie konstelacji na dużą skalę: wzorce Walker DELTA i Walker STAR w konwencji i: T/P/F (węzły rozłożone na { "360" } lub { "180" } deg, odstęp w płaszczyźnie { "360" }<em>P/T, przesunięcie fazowe między płaszczyznami { "360" }</em>F/T), jawne listy elementów i projekty wielopowłokowe, kilka konstelacji w jednym przebiegu, wokół Ziemi, Księżyca, Marsa lub dowolnej innej planety, Plutona lub dużego księżyca, z użyciem stałych w module body (tych samych, których używają rodzaje solar-system i body-pnt). USTAWIENIA WSTĘPNE z opublikowanych nominalnych elementów: gps-baseline i gps-expandable ({ "24" } slotów i sześć rozszerzalnych par przód/tył z GPS Standard Positioning Service Performance Standard, wydanie 5, { "2020" }, tabele 3.2-1 do 3.2-3), galileo (Walker 24/3/1 na { "29 599.801" } km i { "56" } deg, Galileo Open Service Service Definition Document wydanie { "1.1" } tabele { "1" } i { "23" }), beidou i beidou-meo (Walker 24/3/1 na { "21 528" } km i { "55" } deg plus trzy satelity geostacjonarne na { "80" }, { "110.5" } i { "140" } deg E oraz trzy nachylone satelity geosynchroniczne na { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } sekcja { "4.1" }; faza MEO i przecięcie nachylonej orbity geosynchronicznej na { "118" } deg E są modelowane, ponieważ norma ich nie podaje) oraz glonass (24/3/1 na { "19 100" } km i { "64.8" } deg ze wzoru na sloty z GLONASS Interface Control Document wydanie { "5.1" } sekcja { "5.2" }). POKRYCIE I WSPÓŁCZYNNIK ROZMYCIA DOKŁADNOŚCI: na siatce szerokość/długość geograficzna i próbkowanym oknie z maską elewacji liczba widocznych satelitów, GDOP, PDOP, HDOP i VDOP w każdej komórce, dostępność (rozwiązanie z PDOP nie większym niż próg, domyślnie { "6" }) w każdej komórce, globalnie (ważona powierzchnią) i w najgorszym miejscu, z jednym zegarem odbiornika na konstelację, chyba że clock = "common". Skaluje się do tysięcy satelitów: widoczność jest iloczynem skalarnym względem połowy kąta pokrycia każdego satelity, a satelity są grupowane w pasy według szerokości podsatelitarnej w każdej epoce, więc wiersz siatki testuje tylko te, które mogą być widoczne; raport zlicza zaoszczędzone testy par. JSON zawiera mapy siatki i zredukowane śladowe trasy naziemne każdego satelity. VALIDATED: generator Walker względem tabeli { "23" } Galileo OS SDD i wzoru na sloty z GLONASS ICD, ustawienie GPS względem opublikowanej kolumny przecięć równika z tabeli 3.2-1 SPS PS, a globalny rozkład HDOP bazowego GPS względem dodatku B SPS PS (mediana { "0.94" }, { "95" }% { "1.25" }, średnia { "0.96" }, tolerancja { "0.03" }). MODELLED: orbity dwóch ciał z opcjonalnym sekularnym J2, sferyczne ciało, wyłącznie widoczność geometryczna (bez mocy sygnału, stanu technicznego ani terenu) oraz względna faza między różnymi systemami, która nie jest migawką żadnej rzeczywistej daty.

seg-21fbd84bfba1 = Jeden przebieg <c1/> podsumowuje się tak: constellation-design: { "5000" } satelitów (LEO-PNT) wokół Ziemi; dostępność { "99.22" }% (PDOP <= { "3" } przy masce { "20" } deg), najgorsze miejsce { "0.00" }%, mediana PDOP { "1.11" }, średnio { "39.4" } w zasięgu widzenia; { "648" } punktów siatki x { "12" } epok (MODELLED)

seg-af572ce1fd89 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Przykład <c1/> ustawia m.in.:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Etykieta wyniku (silnika): MODELLED - orbity keplerowskie dwóch ciał (opcjonalny sekularny J2) wokół sferycznego ciała, widoczność geometryczna powyżej maski elewacji, rozmycie dokładności dla wszystkich widocznych z jednym zegarem odbiornika na konstelację, chyba że clock = "common"; bez mocy sygnału, stanu technicznego ani terenu. Geometria Walkera i opubliko

seg-899e728ad9bd = Wykres zapisywany przez silnik dla scenarios/leo-pnt-mega-shell.toml, rodzaj constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-602493ac6987 = <b>VALIDATED</b> Generatory rodzaju <c1/>: wzorce Walker delta i star w konwencji T/P/F (odstęp węzłów 360/P lub 180/P, odstęp w płaszczyźnie { "360" }·P/T, przesunięcie fazowe między płaszczyznami { "360" }·F/T) oraz bazowe i rozszerzalne 24-slotowe ustawienia GPS, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> Silnik pokrycia rodzaju <c1/> na bazowym 24-slotowym ustawieniu GPS w warunkach dodatku B GPS Standard Positioning Service Performance Standard (SPS PS) (jedna doba gwiazdowa, { "287" } pięciominutowych kroków, globalna siatka { "4" } x { "4" } deg z

seg-1272200ad4f2 = <b>MODELLED</b> Rodzaj <c1/> poza dwoma przypiętymi przypadkami: jawne i wielopowłokowe projekty, kilka konstelacji na przebieg z jednym zegarem odbiornika na konstelację, Ziemia, Księżyc i Mars ze stałych ciał, ustawienie BeiDou Testy: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> Generatory rodzaju <c1/>: wzorce Walker delta i star w konwencji T/P/F (odstęp węzłów 360/P lub 180/P, odstęp w płaszczyźnie { "360" }·P/T, int. Wyrocznia (ExternalDataset): Opublikowane dokumenty agencji: Galileo Open Service Service Definition Document wydanie { "1.1" } (European GNSS Service Centre) tabele { "1" } i { "23" }, konstelacja referencyjna na 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document wydanie { "5.1" } ({ "2008" }) sekcja { "5.2" }, wzór na sloty dla długości węzła i argumentu szerokości; GPS Standard Positioning Service Performance Standard wydanie 5 (April { "2020" }) tabele 3.2-1, 3.2-2 i

seg-87c4e19dc780 = <b>VALIDATED</b> Silnik pokrycia rodzaju <c1/> na bazowym 24-slotowym ustawieniu GPS w warunkach dodatku B GPS Standard Positioning Service Performance Standard (SPS PS) . Wyrocznia (ExternalDataset): GPS SPS PS wydanie 5 (April { "2020" }) dodatek B sekcje B.3.2.2 i B.3.2.3, opublikowany globalnie uśredniony rozkład HDOP w pełni obsadzonej bazowej konstelacji 24-slotowej (mediana { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, średnia { "0.96" }), tabela 3.8-1 (dostępność PDOP) i tabela B.3-1 (zespołowy PDOP zdegradowanej konstelacji, używany tylko jako górna granica), plus ręcznie wyprowadzona postać zamknięta dla jednej epoki. VDOP i PD

seg-04289f7252cd = <b>MODELLED</b> Rodzaj <c1/> poza dwoma przypiętymi przypadkami: jawne i wielopowłokowe projekty, kilka konstelacji na przebieg z jednym zegarem odbiornika na konste. Wyrocznia (InternalConsistency): Spójność wewnętrzna: brutalny skan elewacji, redukcje obliczone ręcznie i przez orbit::dop oraz zamknięta geometria Walkera i geosynchroniczna. Orbity dwóch ciał z opcjonalnym sekularnym J2, sferyczne ciało z lokalną pionową wzdłuż promienia, wyłącznie widoczność geometryczna (bez mocy sygnału, stanu technicznego satelitów, terenu ani zaburzeń od trzeciego ciała) oraz względna faza między systemami wzięta z różnych re

seg-00fa65d44cbd = MODELLED - orbity keplerowskie dwóch ciał (opcjonalny sekularny J2) wokół sferycznego ciała, widoczność geometryczna powyżej maski elewacji, rozmycie dokładności dla wszystkich widocznych z jednym zegarem odbiornika na konstelację, chyba że clock = "common"; bez mocy sygnału, stanu technicznego ani terenu. Geometria Walkera i opublikowane ustawienia wstępne są sprawdzone względem Galileo OS SDD, GLONASS ICD i tabel slotów GPS SPS Performance Standard, a (wynik <c1/>)

seg-62f0fc16a247 = MODELLED: orbity dwóch ciał z opcjonalnym sekularnym J2, sferyczne ciało, wyłącznie widoczność geometryczna (bez mocy sygnału, stanu technicznego ani terenu) oraz względna faza między różnymi systemami, która nie jest migawką żadnej rzeczywistej daty. (katalog rodzajów (<c1/>))

seg-3ef4276dd40b = Na co przebieg odpowiada: satelity w zasięgu widzenia, PDOP/HDOP/VDOP/GDOP na komórkę { "10" } deg oraz odsetek czasu z PDOP nie większym niż { "3" } powyżej maski { "20" } deg w ciągu dwóch godzin. Słabym punktem, który pokazuje mapa, są czapy polarne: żadna powłoka nie sięga powyżej około { "82" } deg szerokości, więc użytkownik w pobliżu bieguna widzi wszystkie satelity po jednej stronie nieba, a geometria pionowa się pogarsza. MODELLED: projekt ilustracyjny, orbity dwóch ciał z J2, sfe (komentarz w pliku scenariusza, wiersze { "17" } do { "21" })

seg-c333d3fe22cd = Mapy pokrycia i rozmycia dokładności dla dowolnych wielokonstelacyjnych projektów na dużą skalę, wokół dowolnego ciała centralnego, są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-436504a8b26f = <s1>Poprzedni</s1>conflict-resilience

seg-cba188459c80 = <s1>Następny</s1>contact-schedule
