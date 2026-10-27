# docs--kind-ins-trn-coast: translations (pl)

seg-bf51947657c0 = nawigacja

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-c4ed27a559df = Strona tematu: <a1>RESILIENCE-CROSSWALK.md</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-195347c63a8a = m/s^{ "2" }

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-f7305f3a0b5a = Źródło: <c1/>

seg-92b90cb4a839 = <c1/> (rodzaj scenariusza)

seg-5b9a6efe6337 = Model błędu wybiegu INS/TRN: błąd położenia w funkcji czasu trwania wybiegu, zbudowany ze współczynników IMU, a nie przeglądany dla założonego tempa dryfu. Pięć składników narastania — bias akcelerometru, przechył od biasu żyroskopu przez grawitację, błądzenie losowe prędkości, błądzenie losowe kąta i współczynnik skali względem przebytej drogi — każdy propagowany przez dziewięciostanowy lokalnie poziomy model błędów inercyjnych ze sprzężeniem Schulera na podanej szerokości geograficznej i wysokości (obok podawane są prawa wiodącego rzędu dla krótkiego wybiegu t², t³, t^{ "1.5" }, t^{ "2.5" } oraz t¹/t²) i łączony według JAWNIE podanej reguły (domyślnie pierwiastek z sumy kwadratów, albo suma liniowa, albo suma deterministyczna ze stochastycznym rss; wszystkie trzy są liczone przy każdym przebiegu, więc wybór jest widoczny, a nie ukryty). Czasy wybiegu osiągające podane przez wywołującego progi położenia (domyślnie { "10" } m i { "50" } m) wyznacza istniejąca w silniku bisekcja, każdy z rozbiciem na składniki wskazującym źródło dominujące, a przekroczenie dla każdego pojedynczego składnika jest dodatkowo odwracane algebraicznie, tak aby oba wyniki się pokrywały. Tryb nawigacji względem terenu ogranicza wybieg okresowymi poprawkami położenia i podaje największy odstęp poprawek, który utrzymuje każdy próg; poprawka wyłącznie położenia pozostawia błąd prędkości i przechył żywe przez poprawkę, więc nie zawsze ogranicza wybieg przy żadnym tempie poprawek, a raport mówi to wprost, zamiast zwracać zero. MODELLED: współczynniki klas IMU są reprezentatywnymi wartościami pasm, nie kartą katalogową, a reszta poprawki terenowej jest daną wejściową. Nieosiągnięty próg jest podawany jako null ze statusem, nigdy jako zero. Nie jest to produkt z certyfikacją parametrów nawigacji inercyjnej.

seg-bbd497aa3ba6 = Jeden przebieg <c1/> podsumowuje się tak: ins-trn-coast | navigation IMU, { "250" } m/s, combination rss | { "10" } m at { "251.0" } s (accel_bias) | { "50" } m at { "608.8" } s (accel_bias) | TRN position-only peak { "44.7" } m over { "1200" } s

seg-e0555ca683b1 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-95887c4551c7 = Przykład <c1/> ustawia między innymi:

seg-4db5a594afc1 = rss

seg-5868f641c089 = ug

seg-1918189ac2bf = ppm

seg-7eba4c5ee1e4 = Etykieta wyniku (silnika): MODELLED budżet błędu wybiegu INS/TRN. Każdy składnik jest propagowany przez dziewięciostanowy lokalnie poziomy model błędów inercyjnych ze sprzężeniem Schulera (pozioma platforma skierowana na północ w podanym miejscu, swobodna inercyjnie łącznie z niestabilnym kanałem pionowym); jego prawa wiodącego rzędu dla krótkiego wybiegu (bias t^{ "2" }, gy

seg-134a4c91da3a = Wykres zapisany przez silnik dla scenarios/ins-trn-coast.toml, rodzaj ins-trn-coast

seg-7bb77ec86a0a = <b>VALIDATED</b> Budżet błędu położenia w funkcji czasu trwania wybiegu zbudowany ze współczynników IMU, każde źródło błędu (bias akcelerometru, bias żyroskopu, błądzenie losowe prędkości, błądzenie losowe kąta, współczynnik skali w ruchu i pod stałą siłą właściwą) propagowane przez n

seg-d69247df315f = <b>VALIDATED</b> Budżet błędu położenia w funkcji czasu trwania wybiegu zbudowany ze współczynników IMU, każde źródło błędu (bias akcelerometru, bias żyroskopu, błądzenie losowe prędkości, błądzenie losowe kąta,. Wyrocznia (ExternalDataset): NaveGo v1.4 (commit 24d9488, LGPL-3.0), uruchamiany jako osobny program w GNU Octave { "8.4.0" }: swobodne wybiegi inercyjne z tym samym profilem błędów IMU, z jedną poprawioną numeryczną strefą nieczułości w aktualizacji kwaternionu (qua_update.m: warunek ochronny dla prędkości kątowej poniżej { "1e-8" } rad/s zastąpiony przez wnorm == { "0" }, zastosowany do kopii z czasu wykonania i zweryfikowany jednokrotnie; przy zachowanym warunku wolno dryfująca orientacja platformy zamarzała i ucinała

seg-498cb2f96fa7 = MODELLED budżet błędu wybiegu INS/TRN. Każdy składnik jest propagowany przez dziewięciostanowy lokalnie poziomy model błędów inercyjnych ze sprzężeniem Schulera (pozioma platforma skierowana na północ w podanym miejscu, swobodna inercyjnie łącznie z niestabilnym kanałem pionowym); jego prawa wiodącego rzędu dla krótkiego wybiegu (bias t^{ "2" }, przechył od biasu żyroskopu t^{ "3" }, błądzenie losowe prędkości t^{ "1.5" }, błądzenie losowe kąta t^{ "2.5" }, współczynnik skali x przebyta droga) są sprawdzane krzyżowo (wynik <c1/>)

seg-63c221a546f7 = Model błędu wybiegu INS/TRN: błąd położenia w funkcji czasu trwania wybiegu, zbudowany ze współczynników IMU, a nie przeglądany dla założonego tempa dryfu. (katalog rodzajów (<c1/>))

seg-164504645f4a = MODELLED: współczynniki klas IMU są reprezentatywnymi wartościami pasm, nie kartą katalogową, a reszta poprawki terenowej jest daną wejściową. (katalog rodzajów (<c1/>))

seg-ee0281a1f401 = Pytanie, na które to odpowiada: gdy badanie GNSS (lub z cyklem pracy apertury) mówi „załóż dryf nawigacji zliczeniowej { "0.001" }–{ "0.050" } m/s”, skąd ta liczba się bierze? Pochodzi z IMU, a ten scenariusz ją oblicza zamiast przeglądać. Pięć składników narastania — bias akcelerometru (t^{ "2" }), przechył od biasu żyroskopu przez grawitację (t^{ "3" }), błądzenie losowe prędkości (t^{ "1.5" }), błądzenie losowe kąta (t^{ "2.5" }) oraz współczynnik skali razy przebyta odl (komentarz w pliku scenariusza, wiersze { "4" } do { "11" })

seg-32d4adcfe249 = <s1>Poprzedni</s1>inertial

seg-47366ab55be3 = <s1>Następny</s1>integrity
