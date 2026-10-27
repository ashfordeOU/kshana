# docs--kind-leo-pass: translations (pl)

seg-ad20a7bebf23 = STL

seg-37d16b499bc5 = dB

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-fad0b45fd9c2 = Źródło: <c1/>

seg-f0433f09f033 = <c1/> (rodzaj scenariusza)

seg-c3861f7d717c = Przelot LEO i bilans łącza, pasmo po paśmie, dla LEO-PNT (pozycjonowanie, nawigacja i czas z niskiej orbity okołoziemskiej), niezależnie od systemu: użytkownik (naziemny, morski, powietrzny lub wewnątrz budynku, nieruchomy lub w ruchu) i jeden lub więcej satelitów LEO z ZAPROJEKTOWANEGO PASS (orbita kołowa ustawiona tak, by użytkownik widział jeden przelot o wybranej maksymalnej elewacji w wybranym czasie, heliosynchroniczna na życzenie), jawnych ELEMENTÓW, TLE (dwuwierszowy zestaw elementów) przez SGP4 silnika albo konstelacji WALKER zbudowanej kodem projektowania konstelacji (raportowane są najwyższe przeloty). Pasma pochodzą z nazwanego ustawienia wstępnego (ogólne wielopasmowe UHF/L/S/C, ogólne pasmo C, Xona Pulsar X1/X5, Iridium STL, Starlink jako sygnał okazji wyłącznie Dopplera, CentiSpace oraz opcjonalne ustawienie Celeste IOD oznaczone WORKSHOP) albo są wpisane w scenariuszu; każde ustawienie wstępne podaje, czy jego liczby są PUBLIC (z URL), REPRESENTATIVE czy WORKSHOP. Dla każdego satelity, pasma i epoki: elewacja, azymut, odległość, prędkość zmiany odległości i przyspieszenie odległości; tłumienie w wolnej przestrzeni; EIRP i zysk wzorca satelity (izofluks, wiązka gaussowska lub płaski); zysk anteny użytkownika w funkcji elewacji (patch, półkulisty lub izotropowy); tłumienie gazowe (ITU-R P.676-10 Annex { "2" }), tłumienie deszczowe (współczynniki ITU-R P.838-3 i procedura P.618-14, z natężenia deszczu i wysokości deszczu), scyntylacja troposferyczna (ITU-R P.618-14 sekcja { "2.4.1" }), tłumienie wnikania do budynku dla użytkownika wewnątrz (ITU-R P.2109-2), niedopasowanie polaryzacji, temperatura szumowa systemu i C/N0 (gęstość nośnej do szumu); Doppler i tempo Dopplera w postaci zamkniętej z prędkości zmiany odległości i przyspieszenia odległości, każde sprawdzone różnicami centralnymi; opóźnienie jonosferyczne pierwszego rzędu { "40.3" } STEC/f^{ "2" } z ukośnego TEC Klobuchara lub pionowego TEC, przeskalowanego do części jonosfery poniżej satelity. Pary pasm dostają współczynniki wolne od jonosfery, wzmocnienie szumu i szum kodu w szczycie przelotu. Satelity MEO GNSS (ustawienia Galileo lub GPS) są oceniane tym samym modelem anteny i szumu z mocy odbieranych podanych w dokumentach interfejsu, więc dzwonowy przelot LEO i płaskie nośne GNSS dzielą jeden wykres. Opcjonalna sekcja [iot] podaje czas do pierwszego rozwiązania, energię na rozwiązanie i czas pracy baterii w funkcji cyklu pracy dla podanego budżetu mocy odbiornika (MODELLED). Każda para pasm podaje też ukośny TEC, który odtwarza jej kombinacja bez geometrii w szczycie, oraz sigma szumu kodu tego oszacowania (sondowanie jonosfery). Opcjonalna sekcja [spoofer] podrabia sygnały deklarowanego położenia, które skacze lub jest odpychane od prawdziwego po początku ataku, i uruchamia dwa monitory z podanymi prawdopodobieństwami fałszywego alarmu i niewykrytego zdarzenia: spójność Dopplera i geometrii przelotu (zmierzone prędkości zmiany odległości względem przewidywanych z orbit i niezależnego wcześniejszego położenia i prędkości, uogólniony test chi-kwadrat metodą najmniejszych kwadratów w oknie, na kanałach GNSS, LEO i wszystkich) oraz spójność między pasmami (krok między epokami skorygowanej modelem kombinacji bez geometrii każdej pary pasm LEO), raportując statystyki na epokę i moment, w którym każdy monitor wykrywa (MODELLED). Komponenty VALIDATED: tłumienie w wolnej przestrzeni, współczynniki P.838-3 względem jego tabeli { "5" }, procedury deszczu i scyntylacji P.618-14 oraz tłumienie wnikania do budynku P.2109 względem przykładów walidacyjnych ITU-R Study Group { "3" }, stosunek opóźnienia grupowego L1/L2 z IS-GPS-200 oraz maksymalny Doppler nieruchomego użytkownika na orbicie kołowej względem arXiv { "2509.19551" } tabela { "1" }. MODELLED: EIRP, wzorce, część Chapmana TEC poniżej satelity i cały przelot.

seg-04509d8245b7 = Jeden przebieg <c1/> podsumowuje się tak: LEO pass link budget, air user at { "50.00" }, -30.00; { "1" } LEO satellite(s), { "900" } s window Iridium-pass [iridium-stl PUBLIC]: { "781" } km, max elevation { "65.0" } deg at { "444" } s, { "750" } s above the mask STL { "1621.000" } MHz: C/N0 peak { "80.5" } dB-Hz median { "71.3" } dB-Hz; |Doppler| max { "35.4" } kHz; iono { "7.53" } m GNSS gps-baseline L1: { "8" } in view, C/N0 { "38.2" } dB-Hz to { "51.1" } dB-Hz (median { "46.2" } dB-Hz) LEO STL peak { "80.5" } dB-Hz is { "34.3" } dB above the GNSS median; above the strongest GNSS carrier for { "750" } s

seg-e6f4e5c502d7 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-e12426a79a2f = Przykład <c1/> ustawia między innymi:

seg-274c7555b9d6 = 2026-09-28T14:{ "00" }:{ "00" }

seg-7cd17bf1ac74 = Iridium STL z samolotu

seg-f4d857403ae0 = descending

seg-08bc462d676c = Ten rodzaj stosuje { "8" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-ee6d9e6d9556 = Etykieta wyniku (silnika): MODELLED: geometria przelotu LEO i bilans łącza dla każdego pasma z podanych EIRP i wyidealizowanych wzorców anten z członami propagacyjnymi ITU-R; modele składowe mają własne etykiety w macierzy weryfikacji. To nie jest pomiar żadnego satelity.

seg-02ae51cfada6 = Wykres zapisany przez silnik dla scenarios/leo-pass-iridium.toml, rodzaj leo-pass

seg-65c8e3e5b1bc = MODELLED { "7" } · VALIDATED { "5" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-69ed19957592 = <b>VALIDATED</b> Równania ITU-R (International Telecommunication Union, Radiocommunication Sector) P.838-3 ({ "1" }) do ({ "5" }): k_H, alpha_H, k_V, alpha_V z dopasowań krzywych z tabel { "1" } do { "4" }, zależne od drogi i polaryzacji (k, alpha) oraz tłumienie właściwe Testy: <a1>leo_link_reference.rs</a1>.

seg-56948e163406 = <b>VALIDATED</b> ITU-R P.618-14 sekcja { "2.2.1.1" } kroki od { "2" } do { "10" } (ścieżka ukośna i pozioma poniżej wysokości deszczu, współczynniki redukcji poziomej i korekty pionowej, A0.01 i jego skalowanie do { "0.001" } % do { "5" } % przeciętnego roku), z wysokością deszczu (P.839) a Testy: <a1>leo_link_reference.rs</a1>.

seg-c4720302b980 = <b>VALIDATED</b> ITU-R P.618-14 sekcja { "2.4.1" } kroki od { "3" } do { "9" } (sigma odniesienia z N_wet, efektywna długość drogi, współczynnik uśredniania anteny, głębokość zaniku dla { "0.01" } % do { "50" } % czasu), z N_wet jako daną wejściową lub obliczaną z temperatury, wilgotności i ciśnienia przez t Testy: <a1>leo_link_reference.rs</a1>.

seg-7e52290d354c = <b>VALIDATED</b> ITU-R P.2109-2 Annex { "1" } równania ({ "1" }) do ({ "10" }) z tabelą { "1" }: strata nieprzekraczana z prawdopodobieństwem P dla budynków tradycyjnych i energooszczędnych cieplnie przy elewacji ścieżki na fasadzie, { "80" } MHz do { "100" } GHz; stosowana dla każdego pasma i epoki Testy: <a1>leo_link_reference.rs</a1>.

seg-ac1927b760d5 = oraz { "8" } kolejnych w macierzy.

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 sekcja { "2.4.1" } kroki od { "3" } do { "9" } (sigma odniesienia z N_wet, efektywna długość drogi, współczynnik uśredniania anteny, głębokość zaniku dla { "0.01" } % do { "50" } % czasu. Wyrocznia (ExternalDataset): przykłady walidacyjne ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) dla scyntylacji P.618-14, z N_wet P.453-14 dla każdego miejsca z tych samych przykładów; zatwierdzone w tests/fixtures/leo_link/p618_14_scintillation.csv z adresami URL i datą pobrania. Wyrażenie na refrakcyjność wilgotną z temperatury i wilgotności nie jest objęte tym wierszem

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Opóźnienie grupowe { "40.3" } STEC/f^{ "2" } dla każdego pasma; współczynniki wolne od jonosfery f1^2/(f1^{ "2" } - f2^{ "2" }) i -f2^2/(f1^{ "2" } - f2^{ "2" }) oraz wzmocnienie szumu sqrt(a1^{ "2" } s1^{ "2" } + a2^. Wyrocznia (ExternalDataset): IS-GPS-200 sekcja { "20.3.3.3.3.2" }, która podaje stosunek opóźnień grupowych L1/L2 gamma = (77/60)^{ "2" } wynikający ze skalowania pierwszego rzędu 1/f^{ "2" }, oraz wzór Friisa na transmisję (Proc. IRE, { "1946" }). Waliduje prawa skalowania, nie ukośny TEC

seg-67fdbce3503c = <b>VALIDATED</b> leo_link::geometry::max_static_user_range_rate: przeszukanie każdego położenia na orbicie i każdego użytkownika na horyzoncie satelity na orbicie kołowej, z Ziemią. Wyrocznia (ExternalDataset): Leclere, Marathe i Reid, Insights into Xona Pulsar LEO PNT: Constellation, Signals, and Receiver Design, ION GNSS+ { "2025" }, arXiv { "2509.19551" }, tabela { "1" } (odbiornik nieruchomy na sferze { "6371" } km, obrót Ziemi jedynym innym efektem): { "37751.7" } / { "33628.5" } / { "31813.4" } / { "4018.4" } Hz na L1. Obejmuje kołowe orbity dwuciałowe

seg-b952b2928bbe = <b>MODELLED</b> Rodzaj <c1/>: satelity z zaprojektowanego przelotu, elementów, TLE przez SGP4 lub konstelacji Walkera z constellation-design; dla każdego pasma i epoki. Wyrocznia (InternalConsistency): wzory zamknięte i samospójność: tożsamości prędkości zmiany i przyspieszenia odległości względem pochodnych numerycznych, zysk izofluksowy znoszący narastanie odległości, podręcznikowe granice straty polaryzacji, jakościowa obserwacja LEO w porównaniu z GNSS (dzwonowy przelot trwający minuty, ze szczytem o kilka dB ponad płaskimi nośnymi GNSS 44-51 dB-Hz). EIRP i wzorce to opublikowane moce odbierane przeliczone na EIRP lub reprezentatywn

seg-65a0444ca451 = MODELLED: geometria przelotu LEO i bilans łącza dla każdego pasma z podanych EIRP i wyidealizowanych wzorców anten z członami propagacyjnymi ITU-R; modele składowe mają własne etykiety w macierzy weryfikacji. To nie jest pomiar żadnego satelity. (wynik <c1/>)

seg-8b3ffb30c23c = Opcjonalna sekcja [iot] podaje czas do pierwszego rozwiązania, energię na rozwiązanie i czas pracy baterii w funkcji cyklu pracy dla podanego budżetu mocy odbiornika (MODELLED). (katalog rodzajów (<c1/>))

seg-597be3a6eb96 = Opcjonalna sekcja [spoofer] podrabia sygnały deklarowanego położenia, które skacze lub jest odpychane od prawdziwego po początku ataku, i uruchamia dwa monitory z podanymi prawdopodobieństwami fałszywego alarmu i niewykrytego zdarzenia: spójność Dopplera i geometrii przelotu (zmierzone prędkości zmiany odległości względem przewidywanych z orbit i niezależnego wcześniejszego położenia i prędkości, uogólniony test chi-kwadrat metodą najmniejszych kwadratów w oknie (katalog rodzajów (<c1/>))

seg-dbcc7b9c9b9b = MODELLED: EIRP, wzorce, część Chapmana TEC poniżej satelity i cały przelot. (katalog rodzajów (<c1/>))

seg-e675c999f303 = MODELLED. Wiązki punktowe, harmonogram impulsów i przebieg STL nie są modelowane. (komentarz w pliku scenariusza, wiersz { "14" })

seg-c3665ac09bf6 = Przelot LEO-PNT i jego bilans łącza dla każdego pasma względem widocznych satelitów MEO GNSS jest MODELLED, nie jest sprawdzony względem niezależnego wzorca: sprawdzony względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-ab0fc0d88556 = Nazwane ustawienia wstępne systemów LEO-PNT z podanymi źródłami oraz niezależny od systemu silnik są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-ae15d15bf151 = Strona tematu: <a1>LEO-PASS.md</a1>

seg-3ddcc0ea097f = <s1>Poprzedni</s1>leo-navmsg

seg-7c0d4c0f536d = <s1>Następny</s1>leo-pnt-chain
