# docs--kind-hybrid: translations (pl)

seg-03442e4be82d = Karta katalogowa Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }

seg-f4cf8b629797 = Strona tematu: <a1>INTEGRITY.md</a1>

seg-98151954f217 = false

seg-f70076ea4a77 = <b>VALIDATED</b> Odchylenie Allana / zmodyfikowane / Hadamarda + identyfikacja szumu potęgowego z przedziałami ufności χ². Wyrocznia (ExternalDataset): NIST SP { "1065" } (Riley) / odchylenia referencyjne Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Wzrost błędu dryfu w postaci zamkniętej + holdover do progu; klasy zegarów kwantowych. Wyrocznia (ReferenceImpl): Wielokrokowa rekurencja kowariancji clock_state (kontrola krzyżowa w tej samej bazie kodu); leżące u podstaw jądro wariancji dryfu i odwrócenia holdover jest sprawdzone zewnętrznie względem scipy (zob. 'Clock-holdover coast-variance & threshold inversion'). Wartości holdover dla poszczególnych klas z dolnym poziomem szumu czerwonego pozostają MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Zegar Kalmana van Loana o 3 stanach (faza/częstotliwość/dryf), stabilizowany metodą Josepha. Wyrocznia (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), z F przez scipy.linalg.expm i Q przez macierz blokową Van Loana { "1978" } — niezależna implementacja referencyjna odtwarzająca pełną trajektorię filtra kshana. Spójność między implementacjami: fizyka zegara / kalibracja Allana nie są sprawdzone zewnętrznie, więc pozostaje to MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): na zegarach IGS final { "30" } s z { "11" } GPS Blo

seg-e12f672ae71d = Utrzymanie zegara w holdover przy braku GNSS jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Estymacja stanu zegara pokładowego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekcja spoofingu jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: jedno twierdzenie składowe jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-dba20bb12cda = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-e0633b308e4e = <b>MODELLED</b> Jeden zbiorczy filtr Kalmana dla położenia, prędkości, fazy i częstotliwości zegara, zasilany pseudoodległościami sprzęgającymi położenie i zegar (aktualizacje w postaci Josepha uwzględniające kowariancję krzyżową); wariant 1-DOF rozszerzony o stały bias akcelerometru Testy: <a1>fusion_coupled_filters.rs</a1>.

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odporność kwantowej nawigacji zliczeniowej inercyjnej jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu, niezależnej od badanego elementu, ale nie będącej zewnętrznym wzorcem. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-d91dc5633e67 = Źródło: <c1/>

seg-3b43d9c5624d = <c1/> (rodzaj scenariusza)

seg-22cd963c7042 = Hybrydowy kamień węgielny PNT: wspomaganie zegarem, IMU i transferem czasu.

seg-166be08d5276 = Jeden przebieg <c1/> podsumowuje się tak: scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity { "0.998" } security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity { "1.000" } security n/a (no attack)

seg-5a70fcb097dc = Pola opcjonalne: brak

seg-f33278986879 = Przykład <c1/> ustawia między innymi:

seg-7bebd09c614b = Kwarcowy akcelerometr klasy nawigacyjnej (Honeywell QA-2000 / G

seg-4f5fd1bc8a4e = Hybrydowa kwantowa trójka akcelerometrów Exail, stabilność biasu { "5.8" }

seg-49bff8dc860e = Kwarcowy akcelerometr klasy nawigacyjnej (H

seg-52378a7b074c = Wykres zapisany przez silnik dla scenarios/hybrid-pnt.toml, rodzaj hybrid

seg-a1810bbca337 = <b>MODELLED</b> Dwukierunkowy/TWSTFT (Sagnac), GNSS common-view, PPP; link-jitter→odległość. Wyrocznia (ExternalDataset): wielkość efektu Sagnaca sprawdzona względem autorytatywnej OPUBLIKOWANEJ WARTOŚCI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), równ. { "1.29" }: okrążenie równika ku wschodowi kumuluje { "207.4" } ns (2ωA_E/c²); kshana odtwarza { "207.386" } ns. Niezależnie potwierdzone przez RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), który zawiera tę samą geometrię 2Aω/c². Złożony BIPM TWSTFT transponder/common-view/

seg-a8beb8dfc757 = Budżetowanie błędu transferu czasu jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a9c56fc9608a = Strona tematu: <a1>MACHINE-INPUTS.md</a1>

seg-cc86939900fe = <s1>Poprzedni</s1>hybrid-ukf

seg-53b95026bf54 = <s1>Następny</s1>impairment-eval
