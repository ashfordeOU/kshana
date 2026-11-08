# docs--kind-fusion: translations (pl)

seg-03442e4be82d = Karta katalogowa Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-f4cf8b629797 = Strona tematu: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-be831b52a339 = oraz { "4" } kolejne w macierzy.

seg-f70076ea4a77 = <b>VALIDATED</b> Odchylenie Allana / zmodyfikowane / Hadamarda + identyfikacja szumu potęgowego z przedziałami ufności χ². Wyrocznia (ExternalDataset): NIST SP { "1065" } (Riley) / odchylenia referencyjne Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Wzrost błędu dryfu w postaci zamkniętej + holdover do progu; klasy zegarów kwantowych. Wyrocznia (ReferenceImpl): Wielokrokowa rekurencja kowariancji clock_state (kontrola krzyżowa w tej samej bazie kodu); leżące u podstaw jądro wariancji dryfu i odwrócenia holdover jest sprawdzone zewnętrznie względem scipy (zob. 'Clock-holdover coast-variance & threshold inversion'). Wartości holdover dla poszczególnych klas z dolnym poziomem szumu czerwonego pozostają MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Zegar Kalmana van Loana o 3 stanach (faza/częstotliwość/dryf), stabilizowany metodą Josepha. Wyrocznia (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), z F przez scipy.linalg.expm i Q przez macierz blokową Van Loana { "1978" } — niezależna implementacja referencyjna odtwarzająca pełną trajektorię filtra kshana. Spójność między implementacjami: fizyka zegara / kalibracja Allana nie są sprawdzone zewnętrznie, więc pozostaje to MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): na zegarach IGS final { "30" } s z { "11" } GPS Blo

seg-e12f672ae71d = Utrzymanie zegara w holdover przy braku GNSS jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Estymacja stanu zegara pokładowego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekcja spoofingu jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: jedno twierdzenie składowe jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-4de09fe367df = Źródło: <c1/>

seg-53e498cffeba = <c1/> (rodzaj scenariusza)

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-ec26df467b88 = Łączna fuzja czujników PNT filtrem Kalmana na tych samych hybrydowych danych wejściowych.

seg-25708bf88728 = Jeden przebieg <c1/> podsumowuje się tak: scenario c8eac911bbe0 | fused | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "1.000" } security n/a (no attack) | classical PNT-holdover 1330s (t 1330s/p 6600s) integrity { "0.973" } security n/a (no attack)

seg-dba20bb12cda = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3d5cae65f093 = Pola opcjonalne: <c1/>

seg-56bca36cabba = Przykład <c1/> ustawia między innymi:

seg-195347c63a8a = m/s^{ "2" }

seg-5d3f15c0688a = Kwarcowy akcelerometr klasy nawigacyjnej; ilustracyjny szum-dr

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-6ddd8a067e26 = Akcelerometr na zimnych atomach, niski długoczasowy velocity-random-walk;

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e79eecc14bea = Kwarcowy akcelerometr klasy nawigacyjnej; i

seg-c8a1c797f4b1 = Wykres zapisany przez silnik dla scenarios/fusion-pnt.toml, rodzaj fusion

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-46c0903ff7b5 = <b>VALIDATED</b> Odtworzenie stanu epoki [r,v] z pomiarów odległości ze stacji naziemnych wsadowym korektorem różnicowym Gaussa–Newtona i filtrem sekwencyjnym, na modelu sił dwóch ciał z J2 Testy: <a1>batch_sequential_orbit_determination_reference.rs</a1>.

seg-44f77aaf9d7e = <b>MODELLED</b> EKF stanu błędu na { "15" } stanach INS, dwustanowy zegar odbiornika i jedna zmiennoprzecinkowa niejednoznaczność nośnej na każdego śledzonego satelitę; pseudoodległość, faza nośnej i opcjonalnie prędkość zmiany odległości z konstelacji Walkera SGP4 (czas przelotu światła i efekt Sagnaca), Klobuchar an Testy: <a1>fusion_carrier_tc.rs</a1>.

seg-509f93c7e9ce = <b>MODELLED</b> Trzy scenariusze gnss-ins na bibliotece trajektorii (statek wężykujący z prędkością { "8" } m/s z pięciominutową przerwą; pociąg przejeżdżający przez wykop z dwoma satelitami i tunel; samolot, którego przerwa obejmuje zakręt z przechyłem 25 stopni) oraz opcjonalny element pakietu Testy: <a1>gnss_ins_packs.rs</a1>.

seg-e0633b308e4e = <b>MODELLED</b> Jeden zbiorczy filtr Kalmana dla położenia, prędkości, fazy i częstotliwości zegara, zasilany pseudoodległościami sprzęgającymi położenie i zegar (aktualizacje w postaci Josepha uwzględniające kowariancję krzyżową); wariant 1-DOF rozszerzony o stały bias akcelerometru Testy: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Złożony budżet położenia w holdover z biasu, współczynnika skali, VRW i zaniku stabilności. Wyrocznia (ReferenceImpl): niezależna całka SDE Monte Carlo w numpy z podwójnie scałkowanego białego szumu przyspieszenia (waliduje analityczną wariancję VRW zupełnie niezależnym algorytmem) + opublikowana wartość kotwicząca Groves { "2013" } dla składników biasu i współczynnika skali; liczby urządzeń CAI ilościowo opisują sprzęt partnera i pozostają MODELLED

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odporność kwantowej nawigacji zliczeniowej inercyjnej jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu, niezależnej od badanego elementu, ale nie będącej zewnętrznym wzorcem. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-a849735fcc6e = Strona tematu: <a1>LEO-PNT-FUSION.md</a1>

seg-c894aa7d9585 = <s1>Poprzedni</s1>ephemeris

seg-d14a7850df1c = <s1>Następny</s1>gnss-ins
