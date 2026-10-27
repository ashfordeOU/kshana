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

seg-d291f20074f0 = <b>VALIDATED</b> Obrót Ziemi z dwuczęściowej daty juliańskiej UT1 na ścieżce orbity, tak aby położenie w układzie związanym z Ziemią zachowało mikrosekundę, którą traci pojedyncza data f64 (około { "3e-9" } rad w pobliżu { "2020" }): jd2::gmst82 (IAU { "1982" } GMST, konwencja TEME, na obu częściach), cio:

seg-5c031aaa3a33 = MODELLED { "4" } · VALIDATED { "4" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-277205e56d73 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrii linii widzenia przez Q=(HᵀH)⁻¹ z lokalnym podziałem ENU. Wyrocznia (ExternalDataset): gnss_lib_py { "1.0.4" } (Stanford NAV Lab) DOP — niezależna biblioteka, dopasowana do { "1e-6" } względnie

seg-53a78e98af12 = Strona tematu: <a1>SKYLINE.md</a1>

seg-ae15d15bf151 = Strona tematu: <a1>LEO-PASS.md</a1>

seg-99a3c57c7926 = Ten rodzaj stosuje { "7" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-0e3518dc3ddb = Źródło: <c1/>

seg-1428025a91e1 = <c1/> (rodzaj scenariusza)

seg-cb4262b66b8f = Dostępność GNSS i DOP z konstelacji orbitalnej (Walker / TLE / RINEX).

seg-97680b4587c8 = Jeden przebieg <c1/> podsumowuje się tak: scenario bffc887db977 | 77/361 próbek GNSS-nominal | best PDOP { "2.53" } pos 2.53m | quantum holdover 0s p95 6.49e-5ns integrity { "1.000" } security n/a (no attack) | classical holdover 0s p95 25.0ns integrity { "1.000" } security n/a (no attack)

seg-b3a080b98bd9 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-c818cc4f87da = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-364139ff447d = Przykład <c1/> ustawia między innymi:

seg-d5063dda3971 = Zegar atomowy w skali układu scalonego Microchip SA.45s / SA65, sigma_y(1s)

seg-799fe1216562 = { "3.04" } N: GNSS NAV DATA G: GPS

seg-3b652c0da6de = Wykres zapisany przez silnik dla scenarios/orbit-rinex.toml, rodzaj orbit

seg-a150aaacf072 = <b>VALIDATED</b> GDOP/PDOP/HDOP/VDOP/TDOP z geometrii linii widzenia przez Q=(HᵀH)⁻¹ z lokalnym podziałem ENU Testy: <a1>dop_reference.rs</a1>.

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry i check: Monte Carlo z ziarnem (N = { "20,000" } epok na geometrię, sigma = { "1.5" } m, ziarno ChaCha8 { "36" } + i) iterowanego rozwiązania metodą najmniejszych kwadratów własnego silnika (pvt::solve_spp, wagi jednostkowe, rozwiązywane od pozycji prawdziwej) na Testy: <a1>uere_dop_monte_carlo.rs</a1>.

seg-a3d71dd306b3 = <b>VALIDATED</b> skyline + frames::look_angles + geometry::sky_geometry: geodezyjny (WGS-84) azymut i elewacja satelity z miejsca naziemnego, tabela maski azymut/elewacja interpolowana liniowo po azymucie z zawinięciem przy { "360" } deg, zbiór widocznych el Testy: <a1>skyline_orekit_oracle.rs</a1>.

seg-d86884be3f98 = <s1>Poprzednia</s1>optical-atmosphere

seg-da202333ae8d = <s1>Następna</s1>passes
