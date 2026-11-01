# docs--kind-pvt: translations (pl)

seg-debc2f07db78 = true

seg-8e845ce908ee = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f6b7ca020692 = Strona rodziny: <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>

seg-f4cf8b629797 = Strona tematu: <a1>INTEGRITY.md</a1>

seg-af0bb84bda32 = <b>MODELLED</b> dop_error_mc::run_geometry i check: Monte Carlo z ziarnem (N = { "20,000" } epok na geometrię, sigma = { "1.5" } m, ziarno ChaCha8 { "36" } + i) iterowanego rozwiązania metodą najmniejszych kwadratów własnego silnika (pvt::solve_spp, wagi jednostkowe, rozwiązywane od pozycji prawdziwej) na Testy: <a1>uere_dop_monte_carlo.rs</a1>.

seg-aab2f85048b7 = Źródło: <c1/>

seg-56f864d32367 = <c1/> (rodzaj scenariusza)

seg-b7b67e03f125 = Pozycjonowanie jednopunktowe na rzeczywistych obserwacjach: wyznaczenie pozycji odbiornika z pliku obserwacji RINEX { "3" } i pliku nawigacyjnego z komunikatów rozgłoszeniowych (pseudoodległości kodowe, efemerydy rozgłoszeniowe, jonosfera Klobuchara, troposfera Saastamoinena/Niella), opcjonalnie sprawdzone względem współrzędnej pomierzonej geodezyjnie.

seg-79d2a463393d = Jeden przebieg <c1/> podsumowuje się tak: pvt 55bdd18628e1 | nawigacja { "11" } satelitów | rozwiązano 2/3 epok | średnio { "9.0" } satelitów, PDOP { "1.8" } | błąd 3D RMS { "5.74" } m (maks. { "7.12" } m)

seg-fd22bc5c2b67 = Pola wymagane: <c1/>, <c2/>

seg-4b39ee73d65d = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-4f02bdcbc7c7 = Przykład <c1/> ustawia między innymi:

seg-e94743033275 = { "3.03" } N: GNSS NAV DATA M: MIXED

seg-e0415c4dab88 = { "3.02" } OBSERVATION DATA M

seg-22ad318a2d61 = [{ "2.9198e6" }, -5.3837e6, { "1.7746e6" }]

seg-d76d59644d84 = Wykres zapisany przez silnik dla scenarios/pvt-abmf.toml, rodzaj pvt

seg-e6f678eeb384 = <b>MODELLED</b> Filtr Hatcha bez dywergencji (kod bez wpływu jonosfery niesiony przez nośną bez wpływu jonosfery, okno N epok, restart przy utracie śledzenia, skoku geometry-free lub luce) w zestawie precyzyjnego pozycjonowania jednopunktowego

seg-5a42823318a8 = <b>VALIDATED</b> Pozycja satelity ECEF z elementów keplerowskich efemeryd rozgłoszeniowych IS-GPS-200 / Galileo-OS / BeiDou-OS, z przetworzonego rekordu nawigacyjnego RINEX-3. Wyrocznia (ExternalDataset): RTKLIB v2.4.2-p13 eph2pos() skompilowane ze źródeł w C (T. Takasu, BSD-2-Clause) — niezależna implementacja IS-GPS-200/SIS-ICD, zasilana identycznymi rekordami nawigacyjnymi RINEX-3; pozycja satelity ECEF zgodna do ~{ "62" } nm. (Interpolacja precyzyjnych efemeryd SP3 jest sprawdzona osobno — zob. „Interpolacja precyzyjnych efemeryd SP3”)

seg-51cac2f918e0 = Strona tematyczna: <a1>POSITIONING.md</a1>

seg-8ea056f1d7e0 = <s1>Poprzednia</s1>passes

seg-d1dc82bbfb73 = <s1>Następna</s1>quantum-anomaly-detect
