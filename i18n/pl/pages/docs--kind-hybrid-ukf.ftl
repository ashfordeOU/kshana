# docs--kind-hybrid-ukf: translations (pl)

seg-debc2f07db78 = true

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-ea4498cc0324 = <b>VALIDATED</b> 15-stanowy EKF stanu błędu, luźno sprzężony (sprawdzony na rzeczywistym przejeździe z IMU/GNSS względem NaveGo); ściśle sprzężony UKF pseudoodległości/Dopplera i sprzężony zegar+poz. Wyrocznia (ExternalDataset): NaveGo v1.4 (R. Gonzalez, LGPL-3.0, uruchamiany jako narzędzie w GNU Octave, nigdy nie linkowany): jego luźno sprzężony ins_gnss na własnym rzeczywistym przejeździe pojazdu lądowego z IMU/GNSS Ekinox, oba rozwiązania ocenione względem trajektorii odniesienia Ekinox. Oba filtry czytają te same dane wejściowe float32 o częstotliwości { "20" } Hz, a konfiguracja Kshana jest odwzorowana mechanicznie z opublikowanych parametrów zbioru danych. Poziomy i pionowy RMS położenia Kshana oraz jego

seg-4b84d9846715 = Źródło: <c1/>

seg-d8da1a3f1798 = <c1/> (rodzaj scenariusza)

seg-c6edf89eb8d4 = 17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF GNSS/INS (MODELLED): { "15" } stanów błędu INS + korekcja biasu przyspieszenia wyprowadzona z CAI + 2-stanowy zegar (faza + częstotliwość) z silnika zegara o parametrach q, zasilany ujętym w przedziały modelem błędu CAI. Wskaźnikiem jakości jest samospójność filtra (NEES + białość innowacji względem granic χ²) — stwierdzenie samospójności, NIE gwarancja dokładności w rzeczywistych warunkach. Tylko symulacja; brak TRL>{ "3" }, brak dziedzictwa lotniczego, brak zewnętrznej walidacji.

seg-d43a562eb9c2 = Jeden przebieg <c1/> podsumowuje się tak: scenario e8be19a6199e | hybrid-ukf (17-state, MODELLED) | sensor quantum-CAI (q_va { "4.82e-14" }) | clock q_wf { "1.00e-26" } q_rw { "3.00e-30" } | NIS 11.85/12 in [10.12,{ "14.04" }] | NEES 7.11/8 in [6.48,{ "9.68" }] | CONSISTENT | aided 0.4m -> coast 7.7m over 120s | self-consistency, not accuracy

seg-be1b25b8551d = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-139800576fb7 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-40773fa1ab5f = Przykład <c1/> ustawia między innymi:

seg-5e9c8b22ed24 = Interferometryczny akcelerometr na zimnych atomach (Rb-87 D2); ujęty w przedziały

seg-4c8e2caeba5b = Klasa ultrastabilnego/optycznego oscylatora pokładowego, white-FM sigm

seg-2968660fa880 = Wykres zapisany przez silnik dla scenarios/hybrid-ukf.toml, rodzaj hybrid-ukf

seg-5719161d0b2a = <b>MODELLED</b> Ujęta w przedziały (najlepszy/nominalny/zachowawczy) wydajność interferometru zimnych atomów — niestabilność biasu, błądzenie losowe prędkości/kąta, stabilność współczynnika skali, interrogation. Wyrocznia (InternalConsistency): spójność wewnętrzna: przytoczony przedział VRW sprawdzony krzyżowo względem fizyki CaiAccelerometer::accel_asd oraz surowy zakres dynamiczny obliczony z granicy niejednoznaczności prążków; liczby to MODELLED przedziały z przeglądu literatury (needs_source_confirmation), żadne urządzenie nie jest sprawdzone względem niezależnego wzorca, brak aureoli walidacji

seg-8632967dc5f8 = MODELLED SYMULACJA. Samospójność filtra (NEES + białość innowacji) przy ujętych w przedziały wejściach szumu CAI i zegara — stwierdzenie samospójności, NIE gwarancja dokładności w rzeczywistych warunkach. To nie są wyniki terenowe ani lotnicze; brak TRL>{ "3" }, brak dziedzictwa lotniczego, brak zewnętrznej walidacji. Sprzęt CAI należy do partnera. (wynik <c1/>)

seg-e55c8e2bc619 = 17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF GNSS/INS (MODELLED): { "15" } stanów błędu INS + korekcja biasu przyspieszenia wyprowadzona z CAI + 2-stanowy zegar (faza + częstotliwość) z silnika zegara o parametrach q, zasilany ujętym w przedziały modelem błędu CAI. (katalog rodzajów (<c1/>))

seg-b06538ca3a8c = 17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF GNSS/INS (MODELLED). (komentarz w pliku scenariusza, wiersz { "1" })

seg-b5fc96916b4e = WSKAŹNIK JAKOŚCI — samospójność filtra (NEES + białość innowacji), jedyne, co symulacja może uczciwie stwierdzić o estymatorze. W zespole Monte Carlo, którego prawda jest generowana dokładnie z szumu zakładanego przez filtr, połączone średnie NIS (białość) i NEES muszą mieścić się w swoich { "95" }% pasmach chi-kwadrat. To jest stwierdzenie SAMOSPÓJNOŚCI, NIE gwarancja dokładności w rzeczywistych warunkach. (komentarz w pliku scenariusza, wiersze { "21" } do { "25" })

seg-91afdc2d3ee2 = UCZCIWOŚĆ: wszystko tutaj jest MODELLED / SYMULACJĄ. Dane wejściowe CAI i zegara są ujętymi w przedziały wartościami reprezentatywnymi dla literatury, a nie zmierzonym sprzętem; sprzęt CAI i jego Key-Person pozostają własnością partnera. Brak TRL>{ "3" }, brak dziedzictwa lotniczego, brak zewnętrznej walidacji. (komentarz w pliku scenariusza, wiersze { "27" } do { "29" })

seg-9b94bd3ce7df = Ziarna (seed) Monte Carlo, po których wyrocznia spójności się łączy, oraz mnożniki rozstrojenia filtra. { "24" } ziaren daje oparte na przebiegach pasma chi-kwadrat NEES ({ "8" }*{ "24" } DOF) wystarczająco wąskie, by odróżnić filtr dopasowany od rozstrojonego, a przebieg pozostaje tani. Ustaw q_factor / r_factor z dala od { "1.0" }, by rozstroić filtr i obserwować, jak bramka spójności go odrzuca (q_factor skaluje zakładany szum procesu, r_factor zakładany szum pomiaru (komentarz w pliku scenariusza, wiersze { "44" } do { "48" })

seg-496b17a8d3b9 = Strona tematu: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Strona tematu: <a1>QUANTUM.md</a1>

seg-963425965e64 = <s1>Poprzedni</s1>hybrid-optical-rf

seg-437eb2e463b3 = <s1>Następny</s1>hybrid
