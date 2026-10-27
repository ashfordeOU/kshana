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
