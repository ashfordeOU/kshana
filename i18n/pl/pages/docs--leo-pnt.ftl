# docs--leo-pnt: translations (pl)

seg-46c7e6f003dd = System

seg-cae10fb9bff8 = Scenariusz

seg-f1f903f1b9ff = Odporność

seg-1759a8cce7d6 = Rodzaje

seg-71aee5eb55c5 = UHF

seg-f63dd3d7aad4 = Źródło

seg-587beeccaa11 = Ustawienie predefiniowane

seg-e305279d5b11 = Zawartość

seg-b03d56f501c3 = Rodzaj

seg-6752521002b2 = Część

seg-cf6ae60eea4f = Pomocnicze

seg-0bdbdd2c923b = Synchronizacja

seg-b09dc4b322d3 = Efemerydy

seg-3a835a49b43f = Inne usługi

seg-a17f4b4f7fb5 = { "1191.795" } MHz

seg-c5ce76c91ff7 = Etykieta

seg-c1020ac47091 = Co oblicza jeden przebieg

seg-f708914fed48 = Pasma

seg-486f17197d4d = REPRESENTATIVE, dla systemów pasma C, których parametry nie są publiczne (na przykład TrustPoint)

seg-03d5ae448705 = <c1/> (opcjonalnie)

seg-fde146239f5d = Wynik jednego przebiegu

seg-a3f63252bd1b = Co niesie

seg-7d2c6fbf95b7 = Źródło: <c1/>

seg-6f1f29597f4b = LEO-PNT w Kshana

seg-2a3a1f19005a = LEO-PNT to pozycjonowanie, nawigacja i czas (PNT) z satelitów na niskiej orbicie okołoziemskiej (LEO), obok globalnych systemów nawigacji satelitarnej (GNSS) na średniej orbicie okołoziemskiej (MEO), takich jak Global Positioning System (GPS) i Galileo, lub zamiast nich. Ta strona łączy każdy rodzaj i scenariusz LEO-PNT silnika: co każdy oblicza, pasma i gotowe ustawienia sygnałów oraz skąd pochodzą ich liczby, co niesie komunikat nawigacyjny, co jest VALIDATED, a co MODELLED, i jak uruchomić każdy scenariusz. Strony poszczególnych rodzajów idą głębiej:

seg-8e3556046e63 = Strona

seg-cdb06a47be0a = <c1/> (projekty sygnałów) i wielopasmowe panele <c2/>

seg-09894e033033 = <c1/> (geometria przejścia i budżet łącza dla każdego pasma, rozwiązania o niskim zużyciu energii, sondowanie jonosfery, monitory spoofingu)

seg-f19c0bfe2996 = <c1/> (komunikat rozgłaszany: dopasowanie, algorytm użytkownika, formaty binarne i tekstowe)

seg-0fe4979f8309 = <c1/>, <c2/>, <c3/> (pozycjonowanie połączone, precyzyjne pozycjonowanie punktowe, pozycjonowanie w sieci nieziemskiej (NTN) 5G, synchronizacja czasu, pokrycie polarne)

seg-29013ad5656c = <c1/> (wodospady zakłóceń typu jamming i stosunek zakłócenia do sygnału (J/S) dla każdego pasma)

seg-d291250b5d01 = <c1/> (łańcuchy, przeglądy, Monte Carlo i kompozycje dowolnych rodzajów)

seg-8d2de8f77619 = Najpierw niezależność od systemu

seg-f3750a8f2863 = Silnik jest ogólnym symulatorem LEO-PNT. Dowolna konstelacja (wzorzec Walkera, jawne elementy orbitalne, dwuwierszowy zestaw elementów (TLE) przez propagator Simplified General Perturbations { "4" } (SGP4) albo zaprojektowane pojedyncze przejście), dowolny projekt sygnału (dowolne pasmo, dowolna mieszanka składników z kluczowaniem fazy dwustanowym (BPSK), z nośną offsetową binarną (BOC) i z wielodostępem z podziałem częstotliwości (FDMA)), dowolny model komunikatu nawigacyjnego. Nazwane systemy to opcjonalne gotowe ustawienia: pliki danych, każdy ze swoim źródłem, które uzupełniają tylko to, czego scenariusz nie określa. Każda możliwość, test, wyrocznia i dołączony scenariusz działają bez żadnych danych Celeste.

seg-4d3bd0301e59 = Gotowe ustawienie Celeste IOD (demonstracja na orbicie) jest jednym z opcjonalnych gotowych ustawień. Jego parametry sygnału przedstawiono na warsztatach LEO-PNT programu ESA NAVISP (European Space Agency Navigation Innovation and Support Programme), { "2026" }, i nie mają jeszcze publicznego źródła. Każda liczba silnika pochodząca z warsztatów mieści się w jednym pliku, <a1><c1/></a1>, który <c2/> kompiluje tylko wtedy, gdy istnieje, oraz w scenariuszach dostępnych tylko w repozytorium <c3/>. Usunięcie tego pliku i tych scenariuszy wyłącza gotowe ustawienie bez zmian w kodzie źródłowym; każdy inny test, każda wyrocznia i każdy scenariusz działają bez niego (<c4/> pilnuje, które pliki mogą je wymieniać). Ta strona nie podaje żadnych jego liczb.

seg-5b348102cb63 = Rodzaje i ich powiązania

seg-120b9be05fc3 = pasmowo ograniczona widmowa gęstość mocy (PSD) projektu sygnału, moc w paśmie, średniokwadratowa (Gabora) szerokość pasma, drgania śledzenia kodu w zależności od stosunku nośnej do gęstości szumu (C/N0), przeszukiwanie przy akwizycji oraz współczynniki separacji widmowej (SSC) względem sygnałów GNSS; kompromis pasm (ultra high frequency (UHF), L, S, C)

seg-d9febf3c74c8 = postacie zamknięte VALIDATED, projekty i kompromis MODELLED

seg-d0d8d1edd9ee = <c1/> (panele wielopasmowe)

seg-dc3ceb315e9a = wodospady dla poszczególnych pasm z zakłócaczami dla poszczególnych pasm (fala ciągła (CW), chirp, wąskopasmowy, szerokopasmowy, dopasowany), J/S każdego sygnału i efektywne C/N0 na osi czasu

seg-126a14392994 = widma VALIDATED, zakłócacze MODELLED

seg-e63f73ab5bca = geometria przejścia, Doppler i tempo zmiany Dopplera, tłumienie w wolnej przestrzeni, anteny satelity i użytkownika, tłumienie gazowe, deszczowe, scyntylacja i tłumienie przy wejściu do budynku wg ITU-R (International Telecommunication Union, Radiocommunication Sector), C/N0 dla każdego pasma i epoki obok nośnych GNSS na MEO; jonosfera dla każdego pasma i pary wolne od jonosfery; rozwiązania o niskim zużyciu energii; sondowanie jonosfery; monitory spoofingu

seg-a9fd4162604f = składniki VALIDATED, przejście MODELLED

seg-91304e663174 = rozgłaszany komunikat efemeryd i zegara: dopasowanie, błąd odległości w sygnale w przestrzeni (SISRE) w zależności od przedziału dopasowania i okresu aktualizacji, ciągłość aktualizacji w środku przejścia, algorytm użytkownika, ramka binarna z 24-bitową cykliczną kontrolą nadmiarowości (CRC-24Q), eksporty w stylu RINEX { "4" } (Receiver Independent Exchange Format) i jako wartości rozdzielane przecinkami (CSV)

seg-cf93a9ba065c = algorytm użytkownika, wagi i CRC VALIDATED, dopasowania MODELLED

seg-3084696ad387 = pozycjonowanie z Dopplera, łączne rozwiązania z pseudoodległości GNSS + LEO z błędami międzysystemowymi, geometria polarna i arktyczna, transfer czasu do czasu koordynowanego (UTC), z opcjonalnym przebiegiem błędu czasu dla każdej epoki

seg-79117194e50b = maksymalny Doppler VALIDATED, reszta MODELLED

seg-1de31fd3cf86 = zbieżność precyzyjnego pozycjonowania punktowego (PPP) tylko z GNSS i z warstwami LEO

seg-525733c10d9b = dokładność pozycjonowania 5G NTN z szerokości pasma łącza w dół (granica Cramér-Rao)

seg-cb8eee06e664 = jeden system od początku do końca: projekt sygnału, przejście, komunikat, rozwiązanie połączone i PPP, z wypisaniem każdego przekazania

seg-d28e18170f82 = dowolny z powyższych połączony łańcuchem na jednej osi czasu, przeglądany, uruchamiany jako zespół Monte Carlo lub składany przy wspólnych warunkach

seg-5479654fabfd = Łańcuch przekazuje wartości w kodzie (zob. <a1>Łańcuch LEO-PNT od początku do końca</a1> poniżej): projekt sygnału ustala podział EIRP (równoważnej mocy promieniowanej izotropowo) pasma przejścia i tempo śledzonych chipów; przejście daje śledzone C/N0 i drgania kodu; SISRE komunikatu nawigacyjnego i C/N0 przejścia ważą pomiary LEO w rozwiązaniu połączonym.

seg-a0331a21413c = Ogólne projekty używają publicznych środków pasm; każdy jest REPRESENTATIVE, nie jest sygnałem żadnego systemu (<c1/>, <c2/>).

seg-a86ce24d81de = Pasmo

seg-daf61ebdca17 = Przydział

seg-ba6fbebc2a98 = Projekt ogólny

seg-3332ae549a90 = Środek

seg-c7be6f6797a8 = Szerokość pasma nadawania

seg-74f4e80c65cb = Składniki

seg-e95de3591152 = Opóźnienie jonosferyczne pierwszego rzędu względem L

seg-e769f0411e64 = Wycofane przez wydawcę; brak zarchiwizowanej kopii

seg-8b04e51a023e = to nie jest przydział nawigacji radiowej (reprezentatywne); nośna z publicznego <s1>przeglądu openRECEIVER</s1> (strona od tego czasu wycofana; zob. <a1>LEO-SIGNAL.md</a1>)

seg-ea152d84aabc = { "465" } MHz

seg-8a3026904912 = { "10" } MHz

seg-e1500e8695b9 = BPSK({ "5" }) pilot i dane

seg-ac33d89291ca = służba nawigacji radiowej przez satelity (RNSS), środek Galileo E5

seg-278d0b375f6f = { "20.46" } MHz

seg-54e10c07ace3 = BPSK({ "10" }) pilot i dane

seg-5e28b8377751 = służba radiolokacji satelitarnej (RDSS), nośna S systemu NavIC (Navigation with Indian Constellation)

seg-39e207bee75b = { "2492.028" } MHz

seg-a573432714b8 = { "16.5" } MHz

seg-6fe14d537f33 = RNSS, środek przydziału { "5010" }–{ "5030" } MHz

seg-48fabff33863 = { "5020" } MHz

seg-0b50907d3165 = { "20" } MHz

seg-c43105d1c770 = C rozszerzone

seg-c05714081a0e = poza przydziałem RNSS (reprezentatywne)

seg-638ab0837b29 = { "5100" } MHz

seg-4d3857271629 = { "120" } MHz

seg-18bc5451fc46 = BPSK({ "50" }) pilot i dane

seg-3714e1c00ab8 = S (służba satelitarna ruchoma, MSS)

seg-cc26934bac14 = łącze w dół MSS, pasmo n256 3GPP (Third Generation Partnership Project)

seg-12ca7304ece7 = używane przez <c1/>

seg-896b6ee57728 = { "2172.5" } MHz

seg-e6e1d955489a = od { "0.18" } do { "20" } MHz

seg-50e44c7042c9 = sygnały pozycjonowania 5G New Radio

seg-e75e48eeeca1 = BPSK(n) to kluczowanie fazy dwustanowe przy n × { "1.023" } Mchip/s. Stosunek opóźnień wynosi <c1/> przy <c2/> = { "1191.795" } MHz. Tłumienie w wolnej przestrzeni rośnie o <c3/> przy tej samej odległości (−{ "8.2" } dB dla UHF, +{ "6.4" } dB dla S, +{ "12.5" } dB dla C).

seg-02f71b44edf5 = Gotowe ustawienia sygnałów i systemów

seg-c60ce9c32b57 = REPRESENTATIVE, środki pasm z Regulaminu Radiokomunikacyjnego ITU

seg-58fae66f7c12 = <c1/> (projekty sygnałów): tabela pasm powyżej; <c2/> (domyślne dla <c3/>): UHF przy { "450" } MHz, L, S i C w środkach podanych powyżej, EIRP { "0" } dBW na pasmo, heliosynchroniczna warstwa Walker 240/12/1 na { "550" } km

seg-5d918965c00c = BPSK({ "10" }) przy { "5020" } MHz, wiązka izoflux

seg-dddb031a7e2e = PUBLIC: Leclère, Marathe i Reid, Institute of Navigation (ION) GNSS+ { "2025" }, <a1>arXiv { "2509.19551" }</a1>

seg-67fc4039084d = X1 przy { "1593.3225" } MHz ({ "1.023" } Mchip/s) i X5 przy { "1190.51625" } MHz ({ "10.23" } Mchip/s), opublikowane minimalne i maksymalne moce odbierane, { "258" } satelitów na około { "1080" } km (powłoki { "53" } i { "97" } stopni)

seg-f17f98d1ae0b = PUBLIC: <a1>prezentacja Resilient Navigation and Timing Foundation (RNTF)</a1>

seg-c6694cdbb02b = impulsy w { "1616" }–{ "1626" } MHz, Doppler do ±{ "36" } kHz, { "66" } satelitów na { "780" } km ({ "781" } km w gotowym ustawieniu <c1/>), moc odbierana „{ "300" } do { "2400" } razy GPS”

seg-704ec002a889 = <c1/> / <c2/> / <c3/> (rodzaje sygnału, przejścia i pozycjonowania)

seg-a4a3a7c7bc22 = wartości sygnału PUBLIC: Kozhaya, Saroufim i Kassas, <a1>NAVIGATION { "72" }({ "1" })</a1>; orbita REPRESENTATIVE

seg-49985bf11216 = radiolatarnia pasma Ku { "240" } MHz używana tylko do Dopplera, C/N0 około { "57" } dB-Hz

seg-84cb50b019e0 = struktura sygnału PUBLIC: <a1>PMC10301026</a1>; orbita i moc REPRESENTATIVE

seg-1c50faed9f1e = BPSK przy { "2.046" } Mchip/s w pobliżu L1 i L5

seg-c72e9b87f116 = <c1/> (<c2/> w rodzaju komunikatu)

seg-3dd4136094c0 = PUBLIC: <a1>InsideGNSS, ładunek ATOMIC (Autonomous Time and Orbit Determination for Microsatellite Constellations)</a1>

seg-4f0cff24b4fd = wielomian efemeryd 6. rzędu bez składników zegara (zegar jest sterowany do czasu GNSS)

seg-9d1e7aebcd84 = WORKSHOP: przedstawione na warsztatach LEO-PNT ESA NAVISP, { "2026" }

seg-28c2e7ae6065 = konfiguracja sygnału nr 1 demonstracji na orbicie i układ komunikatu, w jednym pliku, który można wyłączyć

seg-9f0d16f43993 = Każde gotowe ustawienie oznacza swoje liczby jako PUBLIC (z adresem URL), REPRESENTATIVE (udokumentowany wybór projektowy, nigdy twierdzenie o rzeczywistym systemie) lub WORKSHOP, a wynik każdego przebiegu, który z niego korzysta, mówi które.

seg-556fe9c6c3b1 = Komunikat nawigacyjny

seg-a220662ed8de = Komunikat nawigacyjny LEO (<a1>LEO-NAVMSG.md</a1>) niesie cztery części, czyli strukturę wspólną dla Galileo Open Service Signal-in-Space Interface Control Document (OS SIS ICD) i opublikowanych propozycji LEO:

seg-5bda276f6e82 = 16-parametrowy zestaw keplerowski z Galileo ICD (pierwiastek wielkiej półosi, mimośród, nachylenie i jego tempo, rektascensja węzła i jej tempo, argument perygeum, anomalia średnia, poprawka ruchu średniego, sześć poprawek harmonicznych, czas odniesienia) plus wielomiany poprawek wzdłuż toru, poprzecznych i promieniowych; albo 22-parametrowy model Liu et al. { "2025" } (<a1>doi 10.3390/rs17162894</a1>); albo wielomian zerowego zegara ATOMIC

seg-8a7dabfece01 = numer tygodnia i czas tygodnia (TOW) oraz wielomian zegara drugiego rzędu (af0, af1, af2 względem toc)

seg-24eaf4ae7eb3 = identyfikator pojazdu kosmicznego (SVID), wydanie danych (IOD), stan zdrowia sygnału

seg-e7d819b7a724 = poprawki jonosferyczne dla użytkowników jednoczęstotliwościowych (zestaw w stylu Klobuchar i NeQuick-G ai0–ai2) oraz przesunięcie czasu systemowego względem UTC (A0, A1, sekundy przestępne i ich harmonogram)

seg-200e59d9279c = Ramka binarna to własne, udokumentowane kodowanie Kshana zbudowane na wzór tych składników, a nie układ bitów żadnego systemu. RINEX { "4.02" } nie definiuje rekordów nawigacyjnych LEO, więc eksport w stylu RINEX jest udokumentowanym rozszerzeniem Kshana (wcześniejsze prace: <a1>arXiv { "2401.17767" }</a1>).

seg-aa18ab84599b = przegląd <c1/> dla <c2/>

seg-70dc120ea19e = zagłuszanie szerokopasmowe { "50" } MHz przy { "1185" } MHz przeglądane od −{ "140" } do −{ "80" } dBW: GPS L5 jest tracony przy −{ "105" } dBW, Galileo E5a i sygnał LEO w paśmie L przy −{ "100" } dBW; sygnały LEO w pasmach UHF, S i C zachowują { "49.4" }, { "49.2" } i { "47.4" } dB-Hz przy każdej mocy

seg-61f05d7e3a18 = zagłuszanie szerokopasmowe { "40" } MHz przy { "1185" } MHz, zwiększane o { "5" } dB co { "10" } s od −{ "125" } dBW: GPS L5 tracony przy −{ "105" } dBW, Galileo E5a przy −{ "100" } dBW, Xona X5 (przy opublikowanym minimum, −{ "144.9" } dBW) przy −{ "95" } dBW; ogólny sygnał LEO przy −{ "135" } dBW nadal jest śledzony przy −{ "90" } dBW ({ "28.9" } dB-Hz). Odbierana moc kupuje zapas J/S decybel za decybel

seg-6a3a46be60a5 = skok pozycji o { "30" } m w zinwentaryzowanym miejscu: test Dopplera tylko dla GNSS nigdy go nie wykrywa; test na wszystkich kanałach wykrywa go { "105" } s po rozpoczęciu (zob. <a1>LEO-PASS.md</a1>)

seg-d0c4683d7c93 = kompozycja <c1/> z <c2/>

seg-bf0ec52f63ea = czterech spooferów, oba monitory: spoofer tylko w paśmie L i spoofer wszystkich pasm bez jonosfery są wychwytywane przez monitor międzypasmowy w chwili rozpoczęcia ({ "300" } s) i przez monitor Dopplera po { "420" } s i { "395" } s; spoofer wszystkich pasm uwzględniający jonosferę tylko przez monitor Dopplera ({ "395" } s); przesunięcie o { "30" } m tylko dla GNSS przez żaden

seg-17bcc4ead2ee = łańcuch <c1/> (<c2/>, <c3/>)

seg-d9b6e6fe6807 = GNSS zagłuszany przez { "15" } minut (kod zgrubny/akwizycyjny (C/A) GPS L1 do około { "10" } dB-Hz, E5a do { "17.4" } dB-Hz wobec progu { "25" } dB-Hz), podczas gdy sygnały LEO w pasmach S i C utrzymują { "49.2" } i { "47.4" } dB-Hz; autonomiczny monitoring integralności odbiornika (RAIM) na samej warstwie LEO tworzy poziom ochrony w każdej epoce, poniżej pionowego limitu alarmowego { "50" } m w { "28" } z { "30" } czasów siatki, a alarm jest podnoszony w pozostałych dwóch; fazy nominalna i odtwarzania od { "5.4" } do { "15.6" } m

seg-42efdd12fc54 = Monitory spoofingu, ich statystyki i ograniczenia są na <a1>LEO-PASS.md</a1>. Wielopasmowy wodospad z innym zakłócaczem na każde pasmo to <c1/> (<a2>LEO-SIGNAL.md</a2>).

seg-d9e58c4aa8d5 = Jeden scenariusz na obszar tematyczny eksperymentu

seg-1ab626f27e9d = Osiem obszarów tematycznych eksperymentów z zaproszenia Celeste IOD do eksperymentów podmiotów trzecich (ESA Open Space Innovation Platform, OSIP) to ogólne pytania o LEO-PNT; każdy ma scenariusz niezależny od systemu:

seg-afc60ca3c9da = Obszar tematyczny

seg-8a8f40ce3e40 = Pozycjonowanie o wysokiej dokładności (PPP)

seg-b5eb3448dbb1 = przegląd <c1/> dla <c2/>

seg-5692301bc7cf = warstwa 192 satelitów na { "500" }, { "1000" } i { "1500" } km skraca zbieżność zmiennoliczbowego PPP multi-GNSS w Monachium z { "13.0" } min do { "3.25" }, { "3.25" } i { "3.5" } min (sześć realizacji, epoki { "30" } s)

seg-3992215bc8c9 = Odporność PNT (L, S, C)

seg-a2cc270b415c = zob. Odporność

seg-8a6381ff15ac = Zgodność z 5G/6G NTN

seg-ae21ac79775f = przegląd <c1/> dla <c2/>

seg-cb52e7eb3c36 = szerokość pasma odniesienia pozycjonowania od { "180" } kHz do { "20" } MHz: sigma odległości w zenicie od { "6.5" } m do { "5.8" } cm, błąd 3D z czasu przybycia od { "30.1" } m do { "2.1" } m, ograniczony od dołu przez błąd synchronizacji sieci { "1" } m

seg-45985b521980 = Niskoenergetyczne PNT dla Internetu rzeczy (IoT) i urządzeń mobilnych

seg-9afaaed509ef = przegląd <c1/> dla <c2/> <c3/>

seg-3bb8cc776a28 = EIRP UHF od −{ "35" } do +{ "5" } dBW: poniżej mediany C/N0 około { "35" } dB-Hz energia na rozwiązanie przy szybkim starcie rośnie z { "18" } mJ do { "55" } J; powyżej niej czas pracy baterii przy jednym rozwiązaniu na godzinę wynosi { "8334" } dni, wyznaczony przez prąd uśpienia

seg-4b0890bd9215 = Nauka z LEO-PNT

seg-a1ddeda103fa = ukośna całkowita zawartość elektronów (TEC) z każdej pary pasm czteropasmowego przejścia nad Tromsø: { "18.85" } jednostek TEC odzyskane przez każdą parę, 1-sigma od { "0.017" } (UHF z L) do { "2.9" } jednostek TEC (S z C)

seg-fc31db33e6fe = Dodatkowe usługi danych PNT

seg-91db4e7b4d9c = kompozycja <c1/> z <c2/>

seg-aee8bb27a2fb = ramka komunikatu Kshana rośnie ze { "146" } bajtów (efemerydy i zegar, { "1045" } bitów) do { "154" } z zestawem Klobuchar, { "159" } z NeQuick-G i { "171" } z parametrami UTC

seg-bd6c76037986 = Nawigacja wewnątrz budynków (UHF)

seg-0a274a3aeb86 = szczytowe C/N0 wewnątrz budynku tradycyjnego: UHF { "34.1" }, L { "24.2" }, S { "16.5" }, C { "9.0" } dB-Hz; w budynku termicznie efektywnym UHF { "15.3" } dB-Hz, a każde inne pasmo niżej

seg-101de8218f35 = Połączone PNT z MEO + LEO

seg-b4daa58a2fe7 = przegląd <c1/> dla <c2/>

seg-903d8dcb96cc = Xona X5 połączony z GPS i Galileo nad Madrytem: błąd 3D tylko z GNSS { "1.06" } m średniokwadratowy (RMS); po fuzji { "0.08" } m przy SISRE LEO { "5" } cm, { "0.57" } m przy { "0.5" } m i { "1.01" } m przy { "5" } m

seg-ebe7a27275cb = Jeden scenariusz na pionową dziedzinę użytkowników końcowych

seg-7c21d067769a = Każda dziedzina to łańcuch <c1/> na jednej osi czasu, więc jest animowana, i każda ma członka <c2/>, więc eksportuje geometrię (zob. <a1>Uruchamianie</a1>).

seg-1d1135625500 = Dziedzina

seg-f1a7e54ea7d0 = Pojazdy autonomiczne

seg-3610a5f7c352 = samochód w Monachium: otwarta droga, średni błąd po fuzji { "0.30" } m; w kanionie miejskim { "35" } stopni GPS i Galileo zachowują { "8" } satelitów i średni błąd { "5.8" } m, ogólna warstwa LEO dodaje od { "4" } do { "5" } i sprowadza go do { "2.1" } m, nadal powyżej progu poziomu pasa ruchu { "1.5" } m przy około połowie epok w kanionie

seg-6622d9c7366d = Kolej i żegluga

seg-73ba745cb492 = dołączony statek <c1/> traci każdego satelitę GNSS ({ "12.1" } dB-Hz), podczas gdy jego przejścia LEO w pasmach S i C osiągają { "44.2" } i { "38.1" } dB-Hz; dołączony pociąg <c2/> osiąga { "2" } m błędu inercjalnego po { "35.8" } s w tunelu; na otwartej przestrzeni jego przejście LEO daje od { "35" } do { "50" } dB-Hz w paśmie L

seg-c87973b9139a = Infrastruktura krytyczna

seg-c16a4c99e132 = oscylator klasy TCXO (kompensowany temperaturowo kwarcowy) serwera czasu stacji transformatorowej, pracujący swobodnie przez dobę bez GNSS, osiąga { "29" } µs, przekraczając próg { "1" } µs między { "75" } a { "80" } minutą po utracie (na siatce 5-minutowej); ta sama klasa zdyscyplinowana do Iridium pozostaje w granicach od −{ "40" } do +{ "11" } ns

seg-1be8e11b2530 = Użytkownicy polarni i arktyczni

seg-660e450cb4ab = średni współczynnik rozmycia dokładności pozycji (PDOP) GPS + Galileo { "1.38" }, { "1.57" } i { "1.62" } w Tromsø, na Svalbardzie i na biegunie północnym; z Iridium { "1.29" }, { "1.34" } i { "1.26" }, przy { "3.0" }, { "5.5" } i { "6.8" } satelitach Iridium w zasięgu

seg-22d99734acf1 = Sieci bezprzewodowe 5G/6G

seg-abcc6337206f = oscylator kwarcowy termostatowany (OCXO) stacji bazowej w holdover przekracza sieciowy limit { "1.1" } µs po { "8863" } s, a limit aplikacji końcowej { "1.5" } µs po { "10006" } s (analiza rodzaju <c1/>); zdyscyplinowany do Xona X5 jego błąd czasu pozostaje między −{ "0.7" } a +{ "0.3" } ns przez cały dzień, z przewidywanym 1-sigma { "5" } ns, czyli podaną niepewnością rozgłaszanego przesunięcia UTC

seg-532d6814ab2d = Śledzenie zasobów i IoT

seg-b4d6d822e1d0 = szybkie rozwiązanie UHF znacznika kontenera kosztuje { "18" } mJ na nabrzeżu i na morzu ({ "8334" } dni pracy baterii przy jednym rozwiązaniu na godzinę) i { "34" } mJ w magazynie ({ "5770" } dni), gdzie pasmo L spada do od { "20" } do { "24" } dB-Hz

seg-e54b0342fa79 = VALIDATED i MODELLED

seg-dd808d1741f3 = Wiersz jest VALIDATED tylko wtedy, gdy test odtwarza opublikowaną konfigurację i przypina opublikowaną wartość w podanej tolerancji; wszystko inne jest MODELLED z uzasadnieniem (<a1>VERIFICATION-MATRIX.md</a1>, <a2>MODELLED-RATIONALE.md</a2>).

seg-592a6cf625c5 = Wiersze LEO-PNT VALIDATED:

seg-344712930047 = zamknięta postać mocy sygnału ograniczonego pasmem i drgań śledzenia kodu wczesny-późny w opublikowanych punktach pracy (Betz i Kolodziejski { "2009" }), ze sprawdzeniem krzyżowym szerokości pasma Gabora i SSC;

seg-e93d5b5d3dda = maksymalny Doppler satelity nawigacyjnego LEO (Xona Pulsar X1 { "32" }–{ "34" } kHz, Iridium ±{ "36" } kHz) oraz obwiednia Dopplera dla użytkownika statycznego wobec arXiv { "2509.19551" } tabela { "1" };

seg-b02c1b42e509 = współczynniki deszczu ITU-R P.838-3, tłumienie deszczu P.618-14 i scyntylacja troposferyczna oraz tłumienie przy wejściu do budynku P.2109-2 wobec danych walidacyjnych ITU-R Study Group { "3" };

seg-fc668542b66d = skalowanie opóźnienia jonosferycznego pierwszego rzędu i tłumienie w wolnej przestrzeni (stosunek opóźnień grupowych z IS-GPS-200, postać Friisa);

seg-59847c667c8b = globalnie uśrednione wagi SISRE (Montenbruck et al. { "2018" }), algorytm użytkownika Galileo ICD wobec RTKLIB na rzeczywistych efemerydach rozgłaszanych oraz CRC-24Q wobec jego katalogowej wartości kontrolnej.

seg-922761c46f8a = Wiersze LEO-PNT MODELLED: każdy projekt sygnału i kompromis pasm, wielopasmowy wodospad, każde przejście i budżet łącza jako całość, gotowe ustawienia, rozwiązania o niskim zużyciu energii, dopasowanie i formaty komunikatu, pozycjonowanie z Dopplera i łączne, zbieżność PPP, pozycjonowanie NTN, transfer czasu, pokrycie polarne, łańcuch od początku do końca, monitory spoofingu i sondowanie jonosfery oraz każda kampania (kampania składa rodzaje i nie dodaje żadnej fizyki; jej tożsamości kompozycji są testowane, <a1>CAMPAIGNS.md</a1>). Żadna wartość C/N0, błędu pomiaru odległości ani pozycjonowania dla LEO nie jest porównywana z pomiarem żadnego satelity.

seg-3cc1d3f1c0f8 = Uruchamianie scenariusza

seg-00d5b60c0ebb = Każdy scenariusz powyżej jest dołączony: <c1/> go wypisuje, a

seg-e01ebe977e65 = zapisuje obok pliku wynik (<c1/>), wykres (<c2/>), raport zaawansowany (<c3/> i <c4/>, z sekcją osadzającą animowany przebieg i wymieniającą eksporty), interaktywny odtwarzacz (<c5/>) oraz eksporty. To, co ma zastosowanie, zależy od rodzaju:

seg-8a96eda978b4 = przebieg z osią czasu jest animowany: epoki <c1/>, <c2/> przebiegu spoofingu, osie czasu <c3/>, łączne epoki i przebiegi czasu <c4/>, krzywe błędu <c5/> i każdy łańcuch kampanii. Przegląd lub kompozycja nie ma osi czasu: <c6/> je odrzuca ze stanem wyjścia { "1" }, a wtedy polecenie nie zapisuje nic, więc osiem przeglądów i kompozycji powyżej (<c7/>, <c8/> i każdy scenariusz <c9/> z wyjątkiem <c10/>) uruchamia się bez <c11/>;

seg-8d26148aeeff = <c1/> i <c2/> eksportują efemerydy CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON i STK (Systems Tool Kit) z geometrią przejścia; kampania eksportuje każdego członka z geometrią jako osobny zestaw plików, z etykietą członka w nazwie pliku (<c3/>), więc każda dziedzina eksportuje swoje przejścia LEO; pozostałe rodzaje LEO podają, dlaczego format nie ma zastosowania (<a1>INTEROP.md</a1>).

seg-6f3ad057f914 = Pozostałe scenariusze LEO, według rodzaju (szczegóły na stronie każdego rodzaju):

seg-73365a12bf64 = <c1/>, <c2/>, opcjonalny <c3/>

seg-f34e2d4b3374 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcjonalny <c6/>

seg-559eaf4bafa1 = <c1/>, <c2/>, <c3/>, <c4/>, opcjonalny <c5/>

seg-731d447261fc = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, opcjonalny <c6/>

seg-e3017b224dfc = <c1/>, <c2/>, opcjonalny <c3/>

seg-1ada84b384ee = Opcjonalne scenariusze są dostępne tylko w repozytorium i są wyłączane razem z plikiem gotowego ustawienia Celeste.

seg-6305e46ec778 = Dwa z nich należą do innych rodzajów. <c1/> (<c2/>) dobiera rozmiar konstelacji LEO-PNT z 5000 satelitów w czterech ilustracyjnych powłokach Walkera: dostępność { "99.22" } % przy PDOP { "3" } lub mniejszym powyżej maski { "20" }°, mediana PDOP { "1.11" } i średnio { "39.4" } satelitów w zasięgu na { "648" } punktach siatki i { "12" } epokach. <c3/> (<c4/>) pyta, jak długo oscylator OCXO z karty katalogowej małego satelity LEO pozostaje w obrębie szczeliny czasowej { "100" } ns przy k = { "3" } po ostatnim rozwiązaniu GNSS: szczelina jest przekraczana { "650.8" } s po rozwiązaniu, więc potrzebne jest rozwiązanie co najmniej co { "645.8" } s ({ "133.8" } na dobę), przy czym dominującym składnikiem jest szum częstotliwości typu błądzenie losowe.

seg-ee9f20a4485b = Łańcuch LEO-PNT od początku do końca

seg-a6167db680ba = Rodzaj <c1/> (<a1><c2/></a1>) śledzi jeden system LEO-PNT od projektu sygnału do pozycji użytkownika. Każdy etap to własny rodzaj silnika, uruchamiany na własnej tabeli scenariusza łańcucha, a łańcuch przekazuje wartości z jednego etapu do następnego w kodzie:

seg-38ce4c90dd78 = Z

seg-2cbf005ed5cc = Do

seg-5d84d64174b6 = Co jest przekazywane

seg-15372352ab42 = udział mocy śledzonego składnika, ułamek w paśmie i tempo śledzonych chipów (podział EIRP pasma i przesunięcie jego C/N0)

seg-0be525c6b695 = wysokość i nachylenie satelity łańcucha (orbita prawdziwa komunikatu), chyba że podaje je <c1/>

seg-d2306e118be7 = śledzone C/N0 przy masce pozycjonowania i w zenicie, z prostej metodą najmniejszych kwadratów w sin(elewacji) dopasowanej do przejścia

seg-ee40b8cd109b = błąd odległości w sygnale w przestrzeni (SISRE): błąd reprezentacji komunikatu (średniokwadratowy, orbita i zegar) z członem wyznaczania orbity <c1/> scenariusza w sumie kwadratowej

seg-b4b3dff58f3b = częstotliwość nośnej i tempo śledzonych chipów

seg-4def115dba1b = Wartość jest przekazywana tylko tam, gdzie tabela dalej w łańcuchu jej nie ustawia, a każde przekazanie jest wypisane w tablicy <c1/> wyniku z wartością, jednostką i celem. Pasmo <c2/> musi wskazywać projekt (<c3/>); w ten sposób pasmo <c4/> niesie też samodzielnie dowolny projekt <c5/>: przyjmuje częstotliwość środkową projektu, szerokość pasma nadawania i tempo śledzonych chipów, dzieli swoje EIRP między składniki oraz w każdej epoce podaje C/N0 śledzonego składnika i ograniczone pasmem koherentne drgania śledzenia kodu wczesny-późny (Betz i Kolodziejski { "2009" }; odstęp pół chipa, pętla { "1" } Hz, { "20" } ms).

seg-2a2b15256cf4 = generic: reprezentatywny projekt <c1/>, przelot na wysokości { "1080" } km pod kątem { "53" }° nad Madrytem, warstwa Walkera z 240 satelitami

seg-bb05e8e505e3 = szczyt śledzonego C/N0 { "58.2" } dB-Hz, mediana jittera kodu { "0.050" } m; przekazywane SISRE { "0.250" } m; błąd 3D średniokwadratowy (RMS) tylko z GNSS { "1.60" } m, GNSS + LEO { "0.43" } m; zbieżność precyzyjnego pozycjonowania punktowego (PPP) { "11.5" } min tylko z GNSS, { "7.5" } min z warstwą LEO

seg-4d1299ee4725 = Xona Pulsar X5 (arXiv { "2509.19551" }), powłoka nachylona do pozycjonowania i obie powłoki do PPP

seg-a8fe501bf419 = szczyt śledzonego C/N0 { "66.3" } dB-Hz, mediana jittera kodu { "0.018" } m; błąd 3D RMS tylko z GNSS { "1.49" } m, GNSS + LEO { "0.68" } m; zbieżność PPP { "20.6" } min tylko z GNSS, { "5.9" } min z Pulsarem

seg-002e4c918dda = <c1/> (opcjonalnie)

seg-a608af78a360 = Konfiguracja Celeste IOD E5 nr 1 z presetem komunikatu Celeste (wstrzymana razem z presetem)

seg-be428c21bd27 = przelot odtwarza szczytowe całkowite C/N0, do którego skalibrowano preset (wartość znajduje się w pliku presetu); dwa satelity ledwie zmieniają 95-minutowe rozwiązanie fuzyjne ({ "1.50" } m do { "1.48" } m RMS 3D)

seg-bf44ba47e48b = zapisuje wynik, wykres, raport zaawansowany (który osadza animowany przelot i odsyła do eksportów), interaktywny odtwarzacz oraz pliki efemeryd geometrii przelotu w formatach CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON i STK (Systems Tool Kit).

seg-a08e67a32d60 = Łańcuch jest MODELLED: nie dodaje żadnej fizyki, a każdy etap zachowuje własne oznaczenia. Model C/N0 etapu pozycjonowania jest prostą względem sin(elewacji), więc kształt właściwy dla przelotu sprowadza się do dwóch liczb; etap komunikatu nie modeluje wyznaczania orbity, dlatego <c1/> jest jawnie podaną daną wejściową ({ "0.25" } m w dołączonych scenariuszach, reprezentatywne dla decymetrowej dokładności pokładowego wyznaczania orbity i sterowanego zegara w skali układu scalonego, o której informuje ładunek ATOMIC: <a1>https://insidegnss.com/first-steps-toward-a-fully-operational-leo-pnt-payload/</a1>).

seg-ee3c5b58e6fa = <s1>Poprzednia</s1>Orbita i powierzchnia Księżyca jako infrastruktura

seg-6b951d6413c8 = <s1>Następna</s1>Projekty sygnałów LEO
