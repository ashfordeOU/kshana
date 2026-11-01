# docs--kind-acm-link: translations (pl)

seg-a686bcdc6cc9 = Źródło: <c1/>

seg-a53e57719a74 = <c1/> (rodzaj scenariusza)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-cb9447893c7f = Jeden satelita nad jedną stacją: dla każdego przejścia odległość ukośna, elewacja i Es/N0 wzdłuż przejścia, MODCOD DVB-S2 wybrany w każdym kroku (progi ETSI EN { "302" } 307-1 Table { "13" } plus margines implementacyjny) oraz wolumen danych, który ACM przenosi względem punktu odniesienia ze stałym kodowaniem, który zamyka się na masce. MODELLED.

seg-1ab30ff9616a = Jeden przebieg <c1/> daje podsumowanie: acm-link: { "3" } pass(es); ACM { "92866" } Mbit vs CCM 8PSK 3/4 { "58495" } Mbit -> gain x1.59 (MODELLED)

seg-54e2159e532d = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c7d1b4b1f247 = Przykład <c1/> ustawia między innymi:

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-b77b8420b4f5 = Mbit

seg-37d29d8303fe = km

seg-eeaa777e4301 = 8PSK 3/4

seg-d62795b9fdc0 = Etykieta wyniku (silnika): MODELLED: adaptacyjne kodowanie i modulacja DVB-S2 na przejściach jednego satelity nad jedną stacją: Es/N0 przy czystym niebie wzdłuż każdego widocznego przejścia, najefektywniejszy MODCOD spełniający swój próg ETSI EN { "302" } 307-1 Table { "13" } plus margines, wobec MODCOD o stałym kodowaniu, który zamyka się na masce; bez zaniku opad

seg-046f69293874 = Wykres, który silnik zapisuje dla scenarios/acm-link.toml, rodzaj acm-link

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 łącza w dół wzdłuż każdego przejścia jednego satelity nad jedną stacją (EIRP, strata w wolnej przestrzeni, strata atmosferyczna według prawa cosecansa, inne straty, G/T, stała Boltzmanna, szybkość symboli), najefektywniejszy MODCOD DVB-S2, który spełnia swój próg ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Przejścia widoczności (AOS, TCA, LOS, maksymalna widoczna elewacja, czas trwania) zestawu elementów SGP4 nad stacją w WGS-84 na ścieżce sprawdzonej względem niezależnego wzorca orbity okołoziemskiej (IAU { "2006" }. Wyrocznia (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) z Hipparchus { "4.0.3" }: TLEPropagator na tych samych zestawach elementów w TEME budowanym przez Orekit według podanej definicji (jego IERS { "2010" } TOD obrócony o GAST - GMST), ElevationDetector i ElevationExtremumDetector z ITURP834AtmosphericRefraction i bez niej oraz AngularAzEl z AngularRadioRefractionModifier dla przypadku z opóźnieniem świetlnym, przecięcia i maksimum rozwiązywane przez Hipparchus; { "60" } przypadków (f

seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 łącza w dół wzdłuż każdego przejścia jednego satelity nad jedną stacją (EIRP, tłumienie w wolnej przestrzeni, tłumienie atmosferyczne według prawa cosecansa, pozostałe straty, G/T, stała Boltzmanna,. Wyrocznia (InternalConsistency): Spójność wewnętrzna: sprawność widmowa obliczona w postaci zamkniętej z K_bch z tabeli 5a i długości ramek zgadza się ze sprawnościami podanymi w tabeli { "13" } (kontrola poprawności przepisania tabeli progów); składniki bilansu łącza zgadzają się ze swoimi postaciami zamkniętymi; wybór jest monotoniczny względem Es/N0 i uwzględnia margines; ACM przenosi co najmniej tyle danych, ile kodowanie stałe. Geometria przejścia pochodzi z osobno VALIDATED a

seg-02e9f2e87410 = MODELLED — adaptacyjne kodowanie i modulacja DVB-S2 na przejściach jednego satelity nad jedną stacją: Es/N0 przy czystym niebie wzdłuż każdego widocznego przejścia, najsprawniejszy MODCOD spełniający próg z tabeli { "13" } ETSI EN { "302" } 307-1 plus margines, w porównaniu z MODCOD o stałym kodowaniu, który domyka się na masce; bez zaniku deszczowego i straty na celowaniu wzdłuż przejścia (wynik <c1/>)

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-a2cdc7dff1e3 = Każda liczba poniżej jest ILLUSTRATIVE: nie jest to orbita, stacja ani bilans łącza żadnego operatora. MODELLED. (komentarz w pliku scenariusza, wiersz { "8" })

seg-7f8667e8d8fe = Adaptacyjne kodowanie i modulacja DVB-S2 wzdłuż przejścia łącza w dół z LEO jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-72fd0321e4af = Strona tematu: <a1>CONTACT-SCHEDULING.md</a1>

seg-1f67ae89028b = <s1>Następny</s1>aocs
