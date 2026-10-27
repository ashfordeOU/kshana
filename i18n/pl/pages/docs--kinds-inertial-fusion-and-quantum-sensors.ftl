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
