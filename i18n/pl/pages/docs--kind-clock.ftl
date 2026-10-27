# docs--kind-clock: translations (pl)

seg-debc2f07db78 = true

seg-33555d61ddc6 = Źródło: <c1/>

seg-618393657d01 = <c1/> (rodzaj scenariusza)

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-78cba87823f7 = Holdover zegara względem specyfikacji; opcjonalny zespół Monte Carlo (runs > { "1" }).

seg-dd2ad570a6c9 = Jeden przebieg <c1/> podsumowuje się tak: scenariusz 91d2b6d10d14 | { "200" } przebiegów | holdover kwantowy 6600s [6600-6600] p95 8.78e-4ns bezpieczeństwo n/a (brak ataku) | holdover klasyczny 844s [220-2130] p95 167.0ns bezpieczeństwo n/a (brak ataku)

seg-51820163de28 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-80fe14eb5e79 = Pola opcjonalne: <c1/>, <c2/>

seg-807e7c5a2565 = Przykład <c1/> ustawia m.in.:

seg-b0a5473bec67 = Arkusz danych Microchip SA65 / SA.45s CSAC sigma_y(1s)={ "3e-10" }; q_

seg-a8d92406e428 = Optyczny zegar na sieci strontowej, cel dla zastosowań kosmicznych sigma_y

seg-0cd8dc81045c = Tego rodzaju używają { "4" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-cb0b7da83f5c = Wykres zapisywany przez silnik dla scenarios/clock-ensemble.toml, rodzaj clock

seg-5b3dbe0aed82 = <b>MODELLED</b> Opcjonalna sekcja [integrity] rodzaju clock (clock_integrity::run): ze wskazanego miejsca i ustawień wstępnych konstelacji (geometry::sky_geometry), w każdej epoce integralności, dopóki GNSS nie jest w stanie odmowy dostępu na osi czasu, migawka RAIM (raim::snapshot_ Testy: <a1>clock_integrity.rs</a1>.

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: jedna warstwa parsera, która zamienia plik zegara RINEX (rekordy AS/AR jednego nazwanego zegara, wersje { "2" } i { "3.00" } do { "3.04" }), dziennik fazy lub częstotliwości ASCII w stylu TimeLab albo dziennik znaczników czasu lub interwałów TAPR TICC w jednolity pha Testy: <a1>clock_log_allantools.rs</a1>.

seg-eddb613a2a2f = <b>MODELLED</b> clock_log::read_input z formatami ptp4l, phc2sys, ts2phc, chrony-tracking i chrony-statistics: zapisany offset wiersza serwa linuxptp (ns, własny znacznik czasu w nawiasach w wierszu, odczyty zanim serwo po raz pierwszy zgłosi s2 pominięte a

seg-f70076ea4a77 = <b>VALIDATED</b> Odchylenie Allana / zmodyfikowane / Hadamarda + identyfikacja szumu potęgowego z przedziałami ufności χ². Wyrocznia (ExternalDataset): NIST SP { "1065" } (Riley) / odchylenia referencyjne Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Wzrost błędu dryfu w postaci zamkniętej + holdover do progu; klasy zegarów kwantowych. Wyrocznia (ReferenceImpl): Wielokrokowa rekurencja kowariancji clock_state (kontrola krzyżowa w tej samej bazie kodu); leżące u podstaw jądro wariancji dryfu i odwrócenia holdover jest sprawdzone zewnętrznie względem scipy (zob. 'Clock-holdover coast-variance & threshold inversion'). Wartości holdover dla poszczególnych klas z dolnym poziomem szumu czerwonego pozostają MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Zegar Kalmana van Loana o 3 stanach (faza/częstotliwość/dryf), stabilizowany metodą Josepha. Wyrocznia (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), z F przez scipy.linalg.expm i Q przez macierz blokową Van Loana { "1978" } — niezależna implementacja referencyjna odtwarzająca pełną trajektorię filtra kshana. Spójność między implementacjami: fizyka zegara / kalibracja Allana nie są sprawdzone zewnętrznie, więc pozostaje to MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): na zegarach IGS final { "30" } s z { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Zintegrowana dla każdej epoki miara jakości bezpieczeństwa z χ² wspomaganego zegarem, RAIM, AGC, SQM. Wyrocznia (ExternalDataset): parametry scenariusza TEXBAT (Humphreys { "2012" }) — charakteryzacja, a nie przypięte wektory. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): w JammerTest { "2024" } (Bleik; dane GPL-3.0) monitory na poziomie obserwabli (chi-kwadrat wspomagane zegarem, RAIM, niepowodzenie rozwiązania) nie podniosły alarmu w ciągu { "10" } s od żadnego z { "8" } ocenialnych opublikowanych początków spoofingu (tam, gdzie okno przed początkiem było czyste, pierwszy alarm przyszedł { "10.2" } do { "39" } s po pu

seg-e12f672ae71d = Utrzymanie zegara w holdover przy braku GNSS jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Estymacja stanu zegara pokładowego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekcja spoofingu jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: jedno twierdzenie składowe jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-ee7dd15019d0 = Strona tematu: <a1>CAMPAIGNS.md</a1>

seg-46ed0b786244 = Strona tematu: <a1>RECEIVER-TRUST.md</a1>

seg-e06f9a5a0291 = <s1>Poprzedni</s1>cislunar-observability

seg-aba9395185fa = <s1>Następny</s1>combined-altpnt
