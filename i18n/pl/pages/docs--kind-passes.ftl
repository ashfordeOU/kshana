# docs--kind-passes: translations (pl)

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 łącza w dół wzdłuż każdego przejścia jednego satelity nad jedną stacją (EIRP, strata w wolnej przestrzeni, strata atmosferyczna według prawa cosecansa, inne straty, G/T, stała Boltzmanna, szybkość symboli), najefektywniejszy MODCOD DVB-S2, który spełnia swój próg ETSI EN { "302" } 307-

seg-72fd0321e4af = Strona tematu: <a1>CONTACT-SCHEDULING.md</a1>

seg-4636d450ef60 = <b>MODELLED</b> Jeden przebieg przyjmuje plan kontaktów (listę okien aos_s/los_s, każde żądające od apertury nawigacji lub łączności — to samo słownictwo okien, które emituje <c1/>, przekształcone przez <c2/>), liczbę apert

seg-11e8c29ecb45 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Konstelacje, pokrycie i geometria</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a4f1e7d2041e = Strona rodziny: <a1>Konstelacje, pokrycie i geometria</a1>

seg-2544da673115 = Źródło: <c1/>

seg-0db3f4e2402e = <c1/> (rodzaj scenariusza)

seg-a4bdfc291fce = Prognozowanie przelotów nad stacją naziemną: przeloty widoczności w dziedzinie czasu (AOS/TCA/LOS, maksymalna elewacja pozorna, czas trwania) orbity kołowej, jako średnie elementy SGP4 na początku okna, nad stacją powyżej maski elewacji w oknie czasowym, z łącznym czasem dostępu. Propagacja SGP4/SDP4 w ziemskim układzie związanym z Ziemią IAU 2006/2000A (opcjonalnie UT1 - UTC i ruch bieguna), refrakcja troposferyczna wg ITU-R P.834-9 i czas propagacji światła na łączu w dół (obie domyślnie włączone), przecięcia rozwiązywane z dokładnością { "1e-7" } s, a kulminacja wyszukiwaniem metodą złotego podziału. Geometria przelotu jest VALIDATED względem Orekit { "13.1.8" } dla stacji na poziomie morza; orbita i stacja w scenariuszu są wejściami ilustracyjnymi.

seg-3050cc7fdc79 = Jeden przebieg <c1/> podsumowuje się tak: passes: { "5" } przelotów orbity { "550" } km / { "97.6" }° nad ({ "52.2" }°, { "4.4" }°) > { "10" }° w ciągu { "24" } h; { "1659" } s łącznego dostępu (MODELLED)

seg-699b650604d4 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-9d2941ba37e2 = Przykład <c1/> ustawia między innymi:

seg-6f849331e33c = Etykieta wyniku (silnika): MODELLED — prognozowanie przelotów nad stacją naziemną w dziedzinie czasu; propagacja SGP4/SDP4, ziemski układ związany z Ziemią IAU 2006/2000A (UT1 = UTC, bez ruchu bieguna, chyba że podano parametry orientacji Ziemi), elewacja pozorna z refrakcją ITU-R P.834-9 i czasem propagacji światła po włączeniu, przecięcia i kulminacja dopracowane

seg-a09be8c586e3 = Wykres zapisany przez silnik dla scenarios/passes.toml, rodzaj passes

seg-db35e4ebd275 = <b>VALIDATED</b> Przeloty widoczności w dziedzinie czasu (AOS/TCA/LOS, maks. elewacja, czas trwania) propagatora silnika nad stacją powyżej maski elewacji, z interpolowanymi przecięciami wschodu i zachodu oraz łącznym dostępem: passes::predict_passes, geometryczny harmonogram (bez Testy: <a1>ground_station_pass_prediction_reference.rs</a1>.

seg-6799a54acee6 = <b>VALIDATED</b> Przeloty widoczności (AOS, TCA, LOS, maksymalna elewacja pozorna, czas trwania) zestawu elementów SGP4 nad stacją WGS-84 na sprawdzonej ścieżce orbity okołoziemskiej (IAU 2006/2000A, opcjonalnie parametry orientacji Ziemi), z troposferyczną wg ITU-R P.834-9 Testy: <a1>pass_predictor_on_path_orekit_oracle.rs</a1>.

seg-42d4290ed718 = <b>VALIDATED</b> Przeloty widoczności w dziedzinie czasu (AOS/TCA/LOS, maks. elewacja, czas trwania) propagatora silnika nad stacją powyżej maski elewacji, z interpolowanymi wschodami i zachodami . Wyrocznia (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) + Hipparchus { "3.1" } — niezależna biblioteka dynamiki lotu: ElevationDetector (szukanie pierwiastków metodą Brenta) + EventsLogger na efemerydach ITRF, stacja jako TopocentricFrame WGS-84. AOS/LOS/maks. elewacja/liczba przelotów/łączny dostęp zgodne dla identycznej orbity, stacji, maski i okna (zatwierdzony zestaw testowy; sterownik xval/orekit-passes)

seg-eb79c117f1df = MODELLED — prognozowanie przelotów nad stacją naziemną w dziedzinie czasu; propagacja SGP4/SDP4, ziemski układ związany z Ziemią IAU 2006/2000A (UT1 = UTC, bez ruchu bieguna, chyba że podano parametry orientacji Ziemi), elewacja pozorna z refrakcją ITU-R P.834-9 i czasem propagacji światła po włączeniu, przecięcia i kulminacja dopracowane poniżej kroku (wynik <c1/>)

seg-a7ddc8eeaf1e = <s1>Poprzednia</s1>orbit

seg-3079cfb8decc = <s1>Następna</s1>pvt

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1> dotyczące tego rodzaju.

seg-df90e5910fb4 = godz.
