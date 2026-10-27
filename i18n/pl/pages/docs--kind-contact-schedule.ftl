# docs--kind-contact-schedule: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-debc2f07db78 = true

seg-8784979d6569 = dBW

seg-dfe78b9d0811 = GHz

seg-37d16b499bc5 = dB

seg-0f4c2ab525ac = <b>MODELLED</b> Es/N0 łącza w dół wzdłuż każdego przejścia jednego satelity nad jedną stacją (EIRP, strata w wolnej przestrzeni, strata atmosferyczna według prawa cosecansa, inne straty, G/T, stała Boltzmanna, szybkość symboli), najefektywniejszy MODCOD DVB-S2, który spełnia swój próg ETSI EN { "302" } 307-

seg-c246881f6fd4 = <b>VALIDATED</b> Przejścia widoczności (AOS, TCA, LOS, maksymalna widoczna elewacja, czas trwania) zestawu elementów SGP4 nad stacją w WGS-84 na ścieżce sprawdzonej względem niezależnego wzorca orbity okołoziemskiej (IAU { "2006" }. Wyrocznia (ExternalDataset): Orekit { "13.1.8" } (CS GROUP, Apache-2.0) z Hipparchus { "4.0.3" }: TLEPropagator na tych samych zestawach elementów w TEME budowanym przez Orekit według podanej definicji (jego IERS { "2010" } TOD obrócony o GAST - GMST), ElevationDetector i ElevationExtremumDetector z ITURP834AtmosphericRefraction i bez niej oraz AngularAzEl z AngularRadioRefractionModifier dla przypadku z opóźnieniem świetlnym, przecięcia i maksimum rozwiązywane przez Hipparchus; { "60" } przypadków (f

seg-35588ca8e9bb = <b>MODELLED</b> Es/N0 łącza w dół wzdłuż każdego przejścia jednego satelity nad jedną stacją (EIRP, tłumienie w wolnej przestrzeni, tłumienie atmosferyczne według prawa cosecansa, pozostałe straty, G/T, stała Boltzmanna,. Wyrocznia (InternalConsistency): Spójność wewnętrzna: sprawność widmowa obliczona w postaci zamkniętej z K_bch z tabeli 5a i długości ramek zgadza się ze sprawnościami podanymi w tabeli { "13" } (kontrola poprawności przepisania tabeli progów); składniki bilansu łącza zgadzają się ze swoimi postaciami zamkniętymi; wybór jest monotoniczny względem Es/N0 i uwzględnia margines; ACM przenosi co najmniej tyle danych, ile kodowanie stałe. Geometria przejścia pochodzi z osobno VALIDATED a

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-7f8667e8d8fe = Adaptacyjne kodowanie i modulacja DVB-S2 wzdłuż przejścia łącza w dół z LEO jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-72fd0321e4af = Strona tematu: <a1>CONTACT-SCHEDULING.md</a1>

seg-b79fcddea1d6 = Źródło: <c1/>

seg-040d160b3fdd = <c1/> (rodzaj scenariusza)

seg-be4e928a5865 = Planowanie kontaktów z naziemnymi stacjami dla kilku satelitów i kilku stacji: widoczne okna dostępu (SGP4, układ związany z Ziemią IAU 2006/2000A, refrakcja ITU-R P.834, czas świetlny), objętość danych ACM DVB-S2 każdego przejścia (progi z tabeli { "13" } ETSI EN { "302" } 307-1) oraz harmonogram bez konfliktów (jeden satelita na antenę z czasem przezbrojenia, jedna stacja na satelitę, dostawa ważona priorytetem z limitem na każdy zaległy zasób) metodą zachłanną o wartości krańcowej, punktem odniesienia „kto pierwszy” i dokładną metodą podziału i ograniczeń na małych zbiorach, z luką optymalności metody zachłannej. MODELLED.

seg-7a3fad06a9fc = Jeden przebieg <c1/> podsumowuje się tak: contact-schedule: { "3" } satelity x { "3" } stacje w ciągu { "12" } h -> { "31" } kontaktów kandydujących, { "22" } zaplanowanych; dostarczono { "797266" } z { "860000" } Mbit (MODELLED)

seg-a03d83f5866a = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-5ba0968796ac = Przykład <c1/> ustawia m.in.:

seg-cade59b5a371 = Etykieta wyniku (silnika): MODELLED — plan kontaktów wielosatelitarny, wielostacyjny: widoczne okna dostępu (SGP4, IAU 2006/2000A, refrakcja ITU-R P.834, czas świetlny), objętość danych ACM DVB-S2 na przejście z bilansu łącza przy czystym niebie (progi z tabeli { "13" } ETSI EN { "302" } 307-1) oraz rozstrzyganie konfliktów (jeden satelita na antenę z cz

seg-e26b549579e2 = Wykres zapisywany przez silnik dla scenarios/contact-schedule.toml, rodzaj contact-schedule

seg-036b708ed2b9 = <b>MODELLED</b> Kontakty kandydujące z każdego przejścia satelita–stacja wraz z jego objętością danych ACM; konflikty, w których jedna antena obsłużyłaby dwa satelity w czasie przezbrojenia albo jeden satelita nadawałby w dół do dwóch stacji naraz; ważona priorytetem dostawa

seg-60431931082a = <b>MODELLED</b> Kontakty kandydujące z każdego przejścia satelita–stacja wraz z jego objętością danych ACM; konflikty, w których jedna antena obsłużyłaby dwa satelity w czasie przezbrojenia albo je. Wyrocznia (InternalConsistency): Spójność wewnętrzna: dokładna metoda podziału i ograniczeń zgadza się z wyliczeniem wyczerpującym na małych zbiorach losowych, każdy plan jest sprawdzany pod kątem wykonalności względem reguł konfliktów, a metoda zachłanna nigdy nie przekracza dokładnego optimum. CZEGO NIE OBEJMUJE: nie porównano z żadnym zewnętrznym planistą ani planem operacyjnym; kontakty są brane w całości (bez dzielenia), zaległy zasób jest ustalony na początku okna, czas przestawiania poza stałym czasem przezbrojenia i pokład

seg-9941b9f6d4a8 = MODELLED — plan kontaktów wielosatelitarny, wielostacyjny: widoczne okna dostępu (SGP4, IAU 2006/2000A, refrakcja ITU-R P.834, czas świetlny), objętość danych ACM DVB-S2 na przejście z bilansu łącza przy czystym niebie (progi z tabeli { "13" } ETSI EN { "302" } 307-1) oraz rozstrzyganie konfliktów (jeden satelita na antenę z czasem przezbrojenia, jedna stacja na satelitę) metodą zachłanną o wartości krańcowej, sprawdzoną względem dokładnej metody podziału i ograniczeń; bez zaniku deszczowego, (wynik <c1/>)

seg-f8ef88bc82b5 = Każda liczba poniżej jest ILLUSTRATIVE: nie są to orbity, stacje ani bilans łącza żadnego operatora. MODELLED: planista jest sprawdzany względem własnego dokładnego solwera, a nie zewnętrznego narzędzia. (komentarz w pliku scenariusza, wiersze { "11" } do { "12" })

seg-fe2b4799b397 = Wielosatelitarne, wielostacyjne planowanie kontaktów z naziemnymi stacjami z rozstrzyganiem konfliktów jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-be14d99cb86d = <s1>Poprzedni</s1>constellation-design

seg-3784be57d6df = <s1>Następny</s1>earth-gnss-lunar
