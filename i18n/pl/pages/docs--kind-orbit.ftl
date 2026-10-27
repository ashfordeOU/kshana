# docs--kind-orbit: translations (pl)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Konstelacje, pokrycie i geometria</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a4f1e7d2041e = Strona rodziny: <a1>Konstelacje, pokrycie i geometria</a1>

seg-be831b52a339 = oraz { "4" } kolejne w macierzy.

seg-a8d92406e428 = Optyczny zegar na sieci strontowej, cel dla zastosowań kosmicznych sigma_y

seg-f70076ea4a77 = <b>VALIDATED</b> Odchylenie Allana / zmodyfikowane / Hadamarda + identyfikacja szumu potęgowego z przedziałami ufności χ². Wyrocznia (ExternalDataset): NIST SP { "1065" } (Riley) / odchylenia referencyjne Stable32 na NBS14

seg-5278ccdaf16f = <b>MODELLED</b> Wzrost błędu dryfu w postaci zamkniętej + holdover do progu; klasy zegarów kwantowych. Wyrocznia (ReferenceImpl): Wielokrokowa rekurencja kowariancji clock_state (kontrola krzyżowa w tej samej bazie kodu); leżące u podstaw jądro wariancji dryfu i odwrócenia holdover jest sprawdzone zewnętrznie względem scipy (zob. 'Clock-holdover coast-variance & threshold inversion'). Wartości holdover dla poszczególnych klas z dolnym poziomem szumu czerwonego pozostają MODELLED

seg-3ea0aa9b3907 = <b>MODELLED</b> Zegar Kalmana van Loana o 3 stanach (faza/częstotliwość/dryf), stabilizowany metodą Josepha. Wyrocznia (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), z F przez scipy.linalg.expm i Q przez macierz blokową Van Loana { "1978" } — niezależna implementacja referencyjna odtwarzająca pełną trajektorię filtra kshana. Spójność między implementacjami: fizyka zegara / kalibracja Allana nie są sprawdzone zewnętrznie, więc pozostaje to MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): na zegarach IGS final { "30" } s z { "11" } GPS Blo

seg-b9174c70772f = <b>MODELLED</b> Zintegrowana dla każdej epoki miara jakości bezpieczeństwa z χ² wspomaganego zegarem, RAIM, AGC, SQM. Wyrocznia (ExternalDataset): parametry scenariusza TEXBAT (Humphreys { "2012" }) — charakteryzacja, a nie przypięte wektory. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): w JammerTest { "2024" } (Bleik; dane GPL-3.0) monitory na poziomie obserwabli (chi-kwadrat wspomagane zegarem, RAIM, niepowodzenie rozwiązania) nie podniosły alarmu w ciągu { "10" } s od żadnego z { "8" } ocenialnych opublikowanych początków spoofingu (tam, gdzie okno przed początkiem było czyste, pierwszy alarm przyszedł { "10.2" } do { "39" } s po pu

seg-e12f672ae71d = Utrzymanie zegara w holdover przy braku GNSS jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8de95b3a9229 = Estymacja stanu zegara pokładowego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e4b64d7277da = Detekcja spoofingu jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: jedno twierdzenie składowe jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))
