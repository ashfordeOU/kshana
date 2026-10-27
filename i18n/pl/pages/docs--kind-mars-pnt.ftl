# docs--kind-mars-pnt: translations (pl)

seg-debc2f07db78 = true

seg-11e8c29ecb45 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Konstelacje, pokrycie i geometria</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-45259ad33a01 = <b>MODELLED</b> Rodzaj <c1/>: orbiter lub lądownik powierzchniowy wokół ciała wybranego po nazwie nawiguje na podstawie jednokierunkowych pseudoodległości z konstelacji nawigacyjnej Walkera wokół ciała (orbity dwóch ciał z sekularnym dryfem J2 ciała, nieznany zegar użytkownika

seg-a4f1e7d2041e = Strona rodziny: <a1>Konstelacje, pokrycie i geometria</a1>

seg-670191cf797f = Strona tematu: <a1>SOLAR-SYSTEM.md</a1>

seg-3ea0aa9b3907 = <b>MODELLED</b> Zegar Kalmana van Loana o 3 stanach (faza/częstotliwość/dryf), stabilizowany metodą Josepha. Wyrocznia (ReferenceImpl): filterpy { "1.4.5" } KalmanFilter (R. Labbe, MIT), z F przez scipy.linalg.expm i Q przez macierz blokową Van Loana { "1978" } — niezależna implementacja referencyjna odtwarzająca pełną trajektorię filtra kshana. Spójność między implementacjami: fizyka zegara / kalibracja Allana nie są sprawdzone zewnętrznie, więc pozostaje to MODELLED. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): na zegarach IGS final { "30" } s z { "11" } GPS Blo

seg-8de95b3a9229 = Estymacja stanu zegara pokładowego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-4be479b81f39 = <s1>Poprzednia</s1>lunar-vlbi

seg-2854e6a75833 = <s1>Następna</s1>moonlight-service-volume

seg-c68502b9d675 = Źródło: <c1/>

seg-46072326d616 = <c1/> (rodzaj scenariusza)

seg-3f749aef8d89 = Głębokokosmiczny Mars PNT: symulowana konstelacja przekaźników MARCONI (przekaźniki areostacjonarne + nachylone nadające jednokierunkowo + przekazujące dwukierunkowo do stacji w głębokim kosmosie) nawiguje użytkownika referencyjnego (transfer | lmo | surface) przez wspólny estymator fuzji radiometrycznej jedno- i dwukierunkowej. Podaje geometrię/widoczność na epokę, osiągnięty RMS względem prawdy i formalną kowariancję (pozycja 1σ / 3σ) — uczciwy symulowany wskaźnik jakości, NIE certyfikowany poziom ochrony.

seg-0254f9bd0ee6 = Jeden przebieg <c1/> podsumowuje się tak: mars-pnt 5aad87fcc94a | użytkownik lmo, zegar uso | { "5" } przekaźników (średnio { "3.1" } w widoku) | zbieżny RMS pozycji { "0.25" } m, formalne 1σ { "0.31" } m (3σ { "0.93" } m — wskaźnik jakości kowariancji, nie certyfikowany PL) | σ częstotliwości zegara { "3.71e-13" } | cov-PD true

seg-8eb513e7aeea = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5a9640a3f9b4 = Przykład <c1/> ustawia między innymi:

seg-8e0fecea19fc = uso

seg-a16f2332397c = lmo

seg-c564dca90854 = Wykres, który silnik zapisuje dla scenarios/mars-pnt-lmo.toml, rodzaj mars-pnt

seg-83c3a84f6b98 = <b>VALIDATED</b> Odzyskanie stanu epoki [r,v] z odległości od stacji naziemnych za pomocą wsadowego korektora różnicowego Gaussa–Newtona i filtra sekwencyjnego, w modelu sił dwóch ciał+J2. Wyrocznia (ExternalDataset): Orekit { "12.2" } (CS GROUP, Apache-2.0) BatchLSEstimator (Levenberg–Marquardt) + KalmanEstimator (EKF) — niezależna zewnętrzna biblioteka estymacji na dopasowanym modelu sił; odzyskany stan epoki i RMS reszt po dopasowaniu zgadzają się do <{ "1e-3" } m bez szumu i <{ "3" } m przy poziomie szumu { "5" } m
