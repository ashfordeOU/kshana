# docs--kind-leo-navmsg: translations (pl)

seg-debc2f07db78 = true

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-1d65b71c5de0 = Ten rodzaj stosuje { "5" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-648c27220789 = Źródło: <c1/>

seg-087287602b47 = <c1/> (rodzaj scenariusza)

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-867f3e41b5ab = Komunikat nawigacyjny LEO: rozgłaszane efemerydy i zegar satelity pozycjonowania, nawigacji i czasu na niskiej orbicie okołoziemskiej (LEO), dla dowolnej orbity, nośnej i modelu, z opcjonalnymi nazwanymi ustawieniami wstępnymi (Xona Pulsar, Iridium, Starlink, CentiSpace, reprezentatywny system pasma C, model zerowego zegara ATOMIC, Celeste IOD). ZAWARTOŚĆ: dane pomocnicze (SVID, numer wydania danych, pasmo, stan sygnału), synchronizacja (tydzień, czas tygodnia, wielomian zegara drugiego rzędu af0-af2 względem toc), efemerydy w jednym z czterech modeli -- 16-parametrowy zestaw keplerowski z Galileo OS SIS ICD; ten zestaw plus wielomiany poprawek wzdłuż toru, w poprzek toru i radialnych; 22-parametrowy model Liu et al. { "2025" }; wielomian ECEF bez składników zegara (zerowy zegar ATOMIC) -- oraz inne usługi (rozgłaszany zestaw Klobuchara, NeQuick-G ai0-ai2 z efektywnym poziomem jonizacji oraz parametry czasu systemowego do UTC z logiką sekund przestępnych z ICD). DOPASOWANIE: orbita prawdziwa całkowana z grawitacją zonalną J2-J6 lub EGM2008 do wybranego stopnia i oporem oraz zegar swobodny lub sterowany z ziarnem (seed); dopasowanie zestawu keplerowskiego metodą Levenberga–Marquardta na elementach niesingularnych, następnie liniowe wielomiany poprawek metodą najmniejszych kwadratów; zegar dopasowany po odjęciu składnika relatywistycznego, który dodaje użytkownik. ANALIZY: fit-interval-trade (błąd odległości sygnału w przestrzeni, SISRE, ze średnimi globalnymi wagami dla wysokości orbity, w funkcji przedziału dopasowania i okresu aktualizacji, tylko orbita i z zegarem), model-comparison (cztery modele, liczba parametrów, zakodowane bity oraz dopasowanie Kshana na wysokościach z Liu et al. obok opublikowanych wartości), midpass-update (najwyższy przelot nad użytkownikiem, skok położenia, zegara i odległości użytkownika przy każdej zmianie komunikatu, skok przy najgorszej geometrii, PASS/FAIL względem progu ciągłości), encode-decode (własna udokumentowana ramka binarna Kshana z CRC-24Q, budżet kwantyzacji pół kroku dla każdego pola, kontrola uszkodzonej ramki, eksport i import rekordu w stylu RINEX-4 oznaczony jako rozszerzenie Kshana oraz tabela CSV). VALIDATED: wagi SISRE względem opublikowanej tabeli MEO/GEO (Montenbruck et al. { "2018" }); algorytm użytkownika Galileo względem RTKLIB na rzeczywistych rozgłaszanych efemerydach Galileo; CRC-24Q względem jego katalogowej wartości kontrolnej i przykładowej ramki RTCM { "1005" }. MODELLED: każda wartość dopasowania i SISRE jest błędem reprezentacji względem prawdy całkowanej przez Kshana (bez błędu wyznaczania ani predykcji orbity); porównanie z Liu et al. używa innych orbit; formaty kodowania i tekstowe są własne Kshana.

seg-e5a4f0290e9e = Jeden przebieg <c1/> podsumowuje się tak: LEO navigation message — { "510" } km, { "97.4" } deg, gravity degree { "20" }, model kepler-rac SISRE weights: w_R { "0.459" }, w_AC^{ "2" } 1/2.53 (mask { "0" } deg) encode-decode: kepler-rac model, frame { "152" } bytes ({ "1156" } payload bits, { "891" } ephemeris+clock bits), CRC-24Q 0x58ADF2 quantisation: largest position change { "0.52" } mm, clock { "0.09" } mm; SISRE exact { "0.0013" } m, quantised { "0.0013" } m corrupted frame rejected: true; RINEX round trip { "4.43e-6" } m; CSV round trip { "0.00e0" } m fit-interval trade over { "1800" } s (usage period = fit interval): kepler16 { "60" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0006" } m kepler16 { "120" } s SISRE orbit RMS { "0.0003" } m max { "0.0015" } m with clock RMS { "0.0007" } m kepler16 { "300" } s SISRE orbit RMS { "0.0036" } m max { "0.0141" } m with clock RMS { "0.0037" } m kepler16 { "600" } s SISRE orbit RMS { "0.0293" } m max { "0.1023" } m with clock RMS { "0.0293" } m kepler16 { "900" } s SISRE orbit RMS { "0.1073" } m max { "0.3812" } m with clock RMS { "0.1075" } m kepler-rac { "60" } s SISRE orbit RMS { "0.0000" } m max { "0.0000" } m with clock RMS { "0.0005" } m kepler-rac { "120" } s SISRE orbit RMS { "0.0001" } m max { "0.0002" } m with clock RMS { "0.0007" } m kepler-rac { "300" } s SISRE orbit RMS { "0.0005" } m max { "0.0021" } m with clock RMS { "0.0012" } m kepler-rac { "600" } s SISRE orbit RMS { "0.0097" } m max { "0.0395" } m with clock RMS { "0.0096" } m kepler-rac { "900" } s SISRE orbit RMS { "0.0388" } m max { "0.1143" } m with clock RMS { "0.0390" } m 16-parametrowy zestaw keplerowski pogarsza się z { "0.0003" } m przy { "60" } s do { "0.1073" } m przy { "900" } s: jeden zestaw keplerowski z harmonicznymi dwa razy na obieg nie potrafi śledzić wyższoczęstotliwościowych składników grawitacji i oporu łuku LEO dłużej niż kilka minut, a jego reszta metody najmniejszych kwadratów oscyluje w oknie. Wielomiany wzdłuż/w poprzek/radialne, wyższego stopnia niż obejmuje zestaw keplerowski, pochłaniają to, co zostaje, dając { "0.0388" } m przy { "900" } s.

seg-3f299f6b20c8 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3adfcd7e275c = Przykład <c1/> ustawia między innymi:

seg-8243db187e2f = [encode-decode, fit-interval-trade]

seg-e866d042aab8 = Komunikat Celeste IOD (ustawienie wstępne warsztatowe)

seg-c42f5a1ed964 = [kepler16, kepler-rac]

seg-549a6103e711 = bit

seg-fb689f03361c = byte

seg-c60901596100 = Etykieta wyniku (silnika): MIXED — elementy składowe VALIDATED, wyniki MODELLED. Wagi SISRE odtwarzają opublikowaną tabelę MEO/GEO (Montenbruck et al. { "2018" }), algorytm użytkownika z ICD Galileo odtwarza RTKLIB na rzeczywistych rozgłaszanych efemerydach Galileo, a CRC-24Q odtwarza swoją katalogową wartość kontrolną i przykładową ramkę RTCM { "1005" }

seg-35e92abc6a23 = Wykres zapisany przez silnik dla scenarios/leo-navmsg-celeste-iod.toml, rodzaj leo-navmsg

seg-43c1d9c81ccf = MODELLED { "5" } · VALIDATED { "6" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-efbe11be7ca1 = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: waga radialna w_R i kwadrat wagi poprzecznej w_AC^{ "2" } jako średnie z cos^{ "2" } i połowy sin^{ "2" } kąta nadirowego linii widzenia po użytkownikach rozłożonych równomiernie na widocznej czaszy Ziemi powyżej elevati

seg-b27c5fe8e179 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: wyznaczanie keplerowskie z Galileo OS SIS ICD (równanie Keplera, poprawki drugiej harmonicznej, węzeł związany z Ziemią) napisane osobno od ewaluatora RINEX silnika, zwracające położenie z argumentem Testy: <a1>leo_navmsg_reference.rs</a1>.

seg-3a53131dc9a4 = <b>VALIDATED</b> leo_navmsg::codec::crc24q: wielomian generujący 0x1864CFB, wartość początkowa { "0" }, bez odbicia, bez końcowego XOR, kontrola, którą ramka LEO Kshana niesie nad każdym poprzedzającym bajtem

seg-2b24c2669c23 = <b>VALIDATED</b> Dopasowanie i przegląd rodzaju <c1/>: orbita prawdziwa całkowana z grawitacją zonalną J2-J6 lub EGM2008 do wybranego stopnia i oporem oraz zegar swobodny lub sterowany z ziarnem (seed); dopasowanie Levenberga–Marquardta zestawu keplerowskiego Galileo na niesingularnych

seg-ddb27b07b9af = oraz { "7" } kolejnych w macierzy.

seg-053dae66c1be = <b>VALIDATED</b> leo_navmsg::sisre::sisre_weights: waga radialna w_R i kwadrat wagi poprzecznej w_AC^{ "2" } jako średnie z cos^{ "2" } i połowy sin^{ "2" } kąta nadirowego linii widzenia. Wyrocznia (ExternalDataset): opublikowana tabela współczynników wagowych SISRE z Montenbruck, Steigenberger i Hauschild ({ "2018" }), Multi-GNSS signal-in-space range error assessment - Methodology and results, Advances in Space Research { "61" }({ "12" }):3020-3038, doi 10.1016/j.asr.2018.03.041: GPS { "0.98" } i 1/49, GLONASS { "0.98" } i 1/45, Galileo { "0.98" } i 1/61, BeiDou MEO { "0.98" } i 1/54, BeiDou IGSO/GEO { "0.99" } i 1/126. Ta sama średnia obliczona dla promieni LEO daje

seg-5b43ffde4634 = <b>VALIDATED</b> leo_navmsg::elements::kepler_point: wyznaczanie keplerowskie z Galileo OS SIS ICD (równanie Keplera, poprawki drugiej harmonicznej, węzeł związany z Ziemią) napisane osobno. Wyrocznia (ExternalDataset): pozycje ECEF z RTKLIB 2.4.2-p13 eph2pos (niezależna implementacja tego samego algorytmu z ICD) dla rzeczywistych rekordów rozgłaszanych BKG/IGS z 2024-09-10, oba zatwierdzone z pochodzeniem w tests/fixtures/rinex_sp3_interop (NOTICE, rinex_ecef_reference.txt, brdc_multignss_slice.rnx). To potwierdza algorytm użytkownika keplerowski; poprawki wzdłuż/w poprzek/radialne dodane na wierzchu mają własne wiersze, a składniki Liu b

seg-5b4f1e63795f = <b>VALIDATED</b> leo_navmsg::codec::crc24q: wielomian generujący 0x1864CFB, wartość początkowa { "0" }, bez odbicia, bez końcowego XOR, kontrola, którą ramka LEO Kshana niesie nad każdym poprzedz. Wyrocznia (ExternalDataset): katalogowa wartość kontrolna CRC dla tych parametrów (katalog CRC reveng.sourceforge.io, CRC-24/LTE-A: szerokość { "24" }, poly 0x864CFB, init { "0" }, check 0xCDE703), które są parametrami CRC-24Q z RTCM { "10403" } i Galileo OS SIS ICD, oraz przykładowa ramka typu komunikatu { "1005" } wydrukowana w RTCM { "10403" }

seg-6e2719a28884 = <b>VALIDATED</b> Dopasowanie i przegląd rodzaju <c1/>: orbita prawdziwa całkowana z grawitacją zonalną J2-J6 lub EGM2008 do wybranego stopnia i oporem oraz zegar swobodny lub ster. Wyrocznia (ExternalDataset): rzeczywiste precyzyjne orbity naukowe jako prawda (operacyjne orbity redukowanej dynamiki TU Graz IfG/ITSG, do dowolnego użytku z podaniem źródła; wartości SHA-256 w NOTICE fixtury) dopasowane zestawem 16-parametrowym na łukach { "20" } i { "30" } min, względem statystyk, które Liu et al. { "2025" } (Remote Sensing { "17" }({ "16" }):{ "2894" }, CC BY { "4.0" }) publikują dla tych samych satelitów i dni: RMS wzdłuż, w poprzek i radialnie, każdy w granicach 1.5x (zmierzone { "0.804" } do { "1.087" }), SISR

seg-0c26ec09bf16 = SISRE jest błędem reprezentacji komunikatu względem prawdy, do której go dopasowano; błąd wyznaczania orbity i błąd predykcji orbity nie są modelowane. (wynik <c1/>)

seg-3762de39de07 = Orbita prawdziwa jest numerycznym całkowaniem Kshana (grawitacja zonalna lub EGM2008, statyczny opór wykładniczy), a nie precyzyjną orbitą rzeczywistego satelity; bez ciała trzeciego, ciśnienia promieniowania słonecznego ani pływów. (wynik <c1/>)

seg-4486dd350b57 = Format binarny to własne udokumentowane kodowanie Kshana wzorowane na opublikowanych składnikach komunikatów; nie jest to układ bitów Celeste ani żadnego innego systemu (żaden nie jest publiczny). (wynik <c1/>)

seg-2a5c1bce8320 = Blok w stylu RINEX jest udokumentowanym rozszerzeniem Kshana; RINEX { "4.02" } nie definiuje rekordów nawigacyjnych LEO. (wynik <c1/>)

seg-642d8f4d60e7 = Współczynniki NeQuick-G są przenoszone, a efektywny poziom jonizacji jest obliczany, ale całkowanie gęstości elektronowej NeQuick, które zamienia go w opóźnienie, nie jest zaimplementowane; opóźnienie Klobuchara jest, skalowane do nośnej przez 1/f^{ "2" } bez korekty dla satelity lecącego wewnątrz jonosfery. (wynik <c1/>)

seg-8ba04a3147bd = Składniki 22-parametrowe Liu et al. { "2025" } podążają za algorytmem użytkownika z artykułu (równ. 1-7) i strategią dopasowania (sekcja { "2.3" }); jego wartości SISRE w funkcji wysokości używały rzeczywistych precyzyjnych orbit, więc to porównanie na orbicie całkowanej przez Kshana jest MODELLED, nie VALIDATED (porównanie na rzeczywistej orbicie to tests/leo_navmsg_fit_real_orbit_oracle.rs). (wynik <c1/>)

seg-b3585c7feb4e = MIXED — elementy składowe VALIDATED, wyniki MODELLED. Wagi SISRE odtwarzają opublikowaną tabelę MEO/GEO (Montenbruck et al. { "2018" }), algorytm użytkownika z ICD Galileo odtwarza RTKLIB na rzeczywistych rozgłaszanych efemerydach Galileo, a CRC-24Q odtwarza swoją katalogową wartość kontrolną i przykładową ramkę RTCM { "1005" }. Każda wartość dopasowania, SISRE, ciągłości i kwantyzacji jest MODELLED: błąd reprezentacji komunikatu względem (wynik <c1/>)

seg-d6e412aab1b4 = MODELLED: każda wartość dopasowania i SISRE jest błędem reprezentacji względem prawdy całkowanej przez Kshana (bez błędu wyznaczania ani predykcji orbity); Liu et al. (katalog rodzajów (<c1/>))

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-d9257241d523 = Strona tematu: <a1>LEO-NAVMSG.md</a1>

seg-b0dcad22aed6 = <s1>Poprzedni</s1>launch-window

seg-2984c4c69850 = <s1>Następny</s1>leo-pass
