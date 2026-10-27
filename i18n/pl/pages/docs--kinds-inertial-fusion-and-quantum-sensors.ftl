# docs--kinds-inertial-fusion-and-quantum-sensors: translations (pl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Rodzaj

seg-ec26df467b88 = Łączna fuzja czujników PNT filtrem Kalmana na tych samych hybrydowych danych wejściowych.

seg-c8a1c797f4b1 = Wykres zapisany przez silnik dla scenarios/fusion-pnt.toml, rodzaj fusion

seg-38df285a3f25 = Luźno i ściśle sprzężony EKF stanu błędu GNSS/INS.

seg-7d993b676006 = Wykres zapisany przez silnik dla scenarios/gnss-ins.toml, rodzaj gnss-ins

seg-c6edf89eb8d4 = 17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF GNSS/INS (MODELLED): { "15" } stanów błędu INS + korekcja biasu przyspieszenia wyprowadzona z CAI + 2-stanowy zegar (faza + częstotliwość) z silnika zegara o parametrach q, zasilany ujętym w przedziały modelem błędu CAI. Wskaźnikiem jakości jest samospójność filtra (NEES + białość innowacji względem granic χ²) — stwierdzenie samospójności, NIE gwarancja dokładności w rzeczywistych warunkach. Tylko symulacja; brak TRL>{ "3" }, brak dziedzictwa lotniczego, brak zewnętrznej walidacji.

seg-2968660fa880 = Wykres zapisany przez silnik dla scenarios/hybrid-ukf.toml, rodzaj hybrid-ukf

seg-22cd963c7042 = Hybrydowy kamień węgielny PNT: wspomaganie zegarem, IMU i transferem czasu.

seg-52378a7b074c = Wykres zapisany przez silnik dla scenarios/hybrid-pnt.toml, rodzaj hybrid

seg-bdedf28adc48 = Inercyjna nawigacja zliczeniowa 1-DOF podczas przerwy w GNSS.

seg-873c402bb724 = Wykres zapisany przez silnik dla scenarios/imu-deadreckoning.toml, rodzaj inertial

seg-5b9a6efe6337 = Model błędu wybiegu INS/TRN: błąd położenia w funkcji czasu trwania wybiegu, zbudowany ze współczynników IMU, a nie przeglądany dla założonego tempa dryfu. Pięć składników narastania — bias akcelerometru, przechył od biasu żyroskopu przez grawitację, błądzenie losowe prędkości, błądzenie losowe kąta i współczynnik skali względem przebytej drogi — każdy propagowany przez dziewięciostanowy lokalnie poziomy model błędów inercyjnych ze sprzężeniem Schulera na podanej szerokości geograficznej i wysokości (obok podawane są prawa wiodącego rzędu dla krótkiego wybiegu t², t³, t^{ "1.5" }, t^{ "2.5" } oraz t¹/t²) i łączony według JAWNIE podanej reguły (domyślnie pierwiastek z sumy kwadratów, albo suma liniowa, albo suma deterministyczna ze stochastycznym rss; wszystkie trzy są liczone przy każdym przebiegu, więc wybór jest widoczny, a nie ukryty). Czasy wybiegu osiągające podane przez wywołującego progi położenia (domyślnie { "10" } m i { "50" } m) wyznacza istniejąca w silniku bisekcja, każdy z rozbiciem na składniki wskazującym źródło dominujące, a przekroczenie dla każdego pojedynczego składnika jest dodatkowo odwracane algebraicznie, tak aby oba wyniki się pokrywały. Tryb nawigacji względem terenu ogranicza wybieg okresowymi poprawkami położenia i podaje największy odstęp poprawek, który utrzymuje każdy próg; poprawka wyłącznie położenia pozostawia błąd prędkości i przechył żywe przez poprawkę, więc nie zawsze ogranicza wybieg przy żadnym tempie poprawek, a raport mówi to wprost, zamiast zwracać zero. MODELLED: współczynniki klas IMU są reprezentatywnymi wartościami pasm, nie kartą katalogową, a reszta poprawki terenowej jest daną wejściową. Nieosiągnięty próg jest podawany jako null ze statusem, nigdy jako zero. Nie jest to produkt z certyfikacją parametrów nawigacji inercyjnej.

seg-134a4c91da3a = Wykres zapisany przez silnik dla scenarios/ins-trn-coast.toml, rodzaj ins-trn-coast

seg-4e31c8daf798 = Rejestr (ledger)

seg-9095869ec445 = { "9" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-efd15cff3d32 = MODELLED (etykieta wyniku)

seg-be0cfeeb1680 = MODELLED { "4" } · VALIDATED { "4" }

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-e6f2ab1647e2 = Źródło: <c1/>

seg-23762f3a250b = Czujniki inercyjne, fuzja i czujniki kwantowe (rodzina rodzajów scenariuszy)

seg-6ec3ad751007 = Strony tematyczne: <a1>QUANTUM-MODELS</a1>, <a2>QUANTUM</a2>, <a3>LEO-PNT-FUSION</a3>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a4>KINDS.md</a4>.

seg-0e73a37b716b = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Czujniki inercyjne, fuzja i czujniki kwantowe

seg-c2245de16d5f = MODELLED { "6" } · VALIDATED { "2" }

seg-084cf4eeccb5 = 17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF GNSS/INS (MODELLED): { "15" } stanów błędu INS + korekta biasu przyspieszeniomierza wyprowadzona z CAI + 2-stanowy zegar (faza + częstotliwość) z silnika zegara q-parametrów

seg-a7d3c32b29b3 = Model błędu wybiegu INS/TRN: błąd położenia w funkcji czasu wybiegu, zbudowany ze współczynników IMU, a nie przemiatany jako założone tempo dryfu.

seg-beb568dec44f = Nawigacja kwantowa bez GNSS MODELLED: podczas przerwy w GNSS budżet inercyjny kwantowy (interferometr zimnych atomów) w porównaniu z klasycznym INS klasy nawigacyjnej — narastanie błędu położenia w czasie wybiegu, holdover

seg-d948ea4d1f33 = Detekcja usterek/anomalii MODELLED dla kwantowych systemów PNT: oznaczony katalog usterek (skok częstotliwości/dryf/utrata zaczepu zegara; skok biasu/zanik czujnika), statystyka detekcji ROC AUC (z przedziałem ufności metodą bootstrap

seg-48e72d451a50 = Porównanie PNT kwantowego i klasycznego ({ "13503" }): korzyść z holdoveru czasu i holdoveru inercyjnego dla zegara kandydującego (krzywa zmierzonego ADEV — punkt zawiasowy obronności — lub klasa zegara kwantowego) w porównaniu z klasycznym punktem odniesienia

seg-5330b47bc0b6 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcjonalne: <c7/>.

seg-75867e8b4b4f = <b>Rejestr (ledger):</b> MODELLED { "6" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>inertial</a1>.

seg-fdf140d4ce68 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-44c6371da5f9 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>hybrid</a1>.

seg-3246c9e1e0cb = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>. Opcjonalne: <c11/>.

seg-e2bd8fd0d9e5 = <b>Rejestr (ledger):</b> MODELLED { "4" } · VALIDATED { "4" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>fusion</a1>.

seg-d0790a2643ae = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>. Opcjonalne: <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>.

seg-85ab600e3050 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>hybrid-ukf</a1>.

seg-3bbd5ce09bee = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcjonalne: <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-08ad3969f65b = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>gnss-ins</a1>.

seg-1703619ca20e = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-ab3453d1ee51 = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>ins-trn-coast</a1>.

seg-a77cdf6e8e31 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>.

seg-b05e96ce392d = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>quantum-gnss-free-nav</a1>.

seg-3f3e48045d31 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-cbefb1538dec = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>quantum-anomaly-detect</a1>.

seg-6eee03151521 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>. Opcjonalne: <c5/>, <c6/>, <c7/>, <c8/>.

seg-6cb57dc94549 = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>quantum-trade</a1>.

seg-b6c31bdda166 = <s1>Poprzedni</s1>Alternatywne PNT w warunkach braku GPS

seg-0585e4ae329e = <s1>Następny</s1>Zagłuszanie (jamming), spoofing i widmo
