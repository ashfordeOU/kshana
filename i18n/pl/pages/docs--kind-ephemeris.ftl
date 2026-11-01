# docs--kind-ephemeris: translations (pl)

seg-37d29d8303fe = km

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-c33e3cbba749 = arcsec

seg-11e8c29ecb45 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Konstelacje, pokrycie i geometria</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a4f1e7d2041e = Strona rodziny: <a1>Konstelacje, pokrycie i geometria</a1>

seg-670191cf797f = Strona tematu: <a1>SOLAR-SYSTEM.md</a1>

seg-a3697ad561db = Hz

seg-e388fdc74ffa = Źródło: <c1/>

seg-9860cb88c021 = <c1/> (rodzaj scenariusza)

seg-24266bc264df = Efemerydy i ślad naziemny: propagacja jednego satelity (TLE→SGP4 lub orbita analityczna) i emisja jego stanu TEME/GCRS (położenie + prędkość), położenia ITRF/ECEF, szerokości/długości/wysokości podsatelitarnej w WGS-84 oraz, dla każdego kroku, azymutu/elewacji/odległości stacji i prędkości zmiany odległości (Doppler). Satelita pochodzi z <c1/> albo z analitycznej <c2/> z jej <c3/> (<c4/> ma pierwszeństwo, gdy podano oba); przy <c5/> <c6/> nadpisuje własną epokę TLE jako t = { "0" }.

seg-02f2745e0550 = Jeden przebieg <c1/> podsumowuje się tak: scenariusz 0d4dd01b3160 | sgp4 (TLE) | { "559" } próbek | wys. { "419" }–{ "434" } km | |szer.| ≤ { "51.8" }° | prędkość { "7653" }–{ "7661" } m/s | maks. elew. { "25.7" }° szczytowy Doppler { "34.3" } kHz

seg-2ce1ab71e2cc = Wymagane pola: <c1/>

seg-21dc45b3de59 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-cda81cdb3607 = Przykład <c1/> ustawia między innymi:

seg-c59482e7defe = { "1" } 25544U 98067A { "20045.18587073" } .00000950 00000-0 25302-

seg-4d208b6c0eb8 = doba

seg-0fd3c58fde09 = Wykres zapisany przez silnik dla scenarios/ephemeris.toml, rodzaj ephemeris

seg-d291f20074f0 = <b>VALIDATED</b> Obrót Ziemi z dwuczęściowej daty juliańskiej UT1 na ścieżce orbity, tak aby położenie w układzie związanym z Ziemią zachowało mikrosekundę, którą traci pojedyncza data f64 (około { "3e-9" } rad w pobliżu { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, konwencja TEME, na obu częściach), cio:

seg-976416e41291 = <b>VALIDATED</b> SGP4/SDP4, Cowell 6-DOF z perturbacjami, wsadowe i sekwencyjne OD. Wyrocznia (ExternalDataset): wektory weryfikacyjne SGP4 z AIAA 2006-6753

seg-7cf505668c3c = <b>VALIDATED</b> Precesja i nutacja IAU 2006/2000A, CIO GCRS↔ITRS, skale czasu z sekundami przestępnymi. Wyrocznia (ExternalDataset): wektory odniesienia IAU SOFA / ERFA; Vallado AIAA 2006-6753 ({ "0.1" }–{ "4" } mm)

seg-f19ce44dc0c0 = Strona tematu: <a1>AGENCY-ORBIT-VALIDATION.md</a1>

seg-a8ea4ba6e244 = <s1>Poprzedni</s1>eo-radiometry

seg-971864553611 = <s1>Następny</s1>fusion
