# docs--kind-lunar-descent: translations (pl)

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-51362910dcb7 = { "2" } dołączone scenariusze używają tego rodzaju; pozostałe są w <a1><c1/></a1>.

seg-98151954f217 = false

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Księżyc i przestrzeń cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Księżyc i przestrzeń cislunarna</a1>

seg-6a26b9ab59fe = Strona tematu: <a1>MISSION-THREAD.md</a1>

seg-ebc18c9bcbac = differential

seg-2d84b341a41f = Etykieta wyniku (silnika): MODELLED

seg-626ab55f0424 = MODELLED (wynik <c1/>)

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1eda001180f9 = Źródło: <c1/>

seg-d4df5aa9b7b0 = <c1/> (rodzaj scenariusza)

seg-2cd0d5385530 = MODELLED: budżet rozrzutu lądowania z napędem w miejscu przy biegunie południowym (klasa Artemis). Na każdą oś poziomą pięciostanowy model błędu inercjalnego (pozycja, prędkość, bias akcelerometru, przechył położenia, bias żyroskopu) jest sterowany siłą właściwą lądowania; filtr sekwencyjny przyjmuje pozycje z włączonych wspomagań: pozycję AFS z widocznych przekaźników konstelacji klasy LCNS ILLUSTRATIVE (samodzielną albo różnicową z użyciem reszty łącza korekcji z lunar-differential-pnt, ze wspomaganiem zegara, gdy widoczne są tylko trzy przekaźniki) oraz pozycję względem terenu (dopasowanie TERCOM/SITAN biblioteki na syntetycznej rzeźbie albo ograniczenie Craméra-Rao dopasowania okna wysokości rzeczywistego DEM LOLA okolic bieguna południowego). Czas księżycowy wchodzi przez zegar pojazdu w momentach pozycji (przesunięcie LTC-TT z lunar-time-offset albo niepewność jego opublikowanego pasma) oraz jako błąd znacznika czasu wzdłuż toru. Podaje elipsę lądowania 3-sigma, R95, zamknięte źródła inercjalne, wkład każdego wspomagania, ablację każdej kombinacji wspomagań, kalibrację elipsy metodą Monte Carlo oraz przekazywaną kowariancję. MODELLED: ilustracyjna klasa IMU, zestaw przekaźników, profil lądowania i człon prowadzenia; terrain-nav używa syntetycznej rzeźby w ziemskiej skali metra; dostępność AFS to jedna epoka na płaskiej masce. Bez poparcia agencji; oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny.

seg-c6c1a8f184ed = Jeden przebieg <c1/> daje podsumowanie: lunar-descent | -89.50 deg | tylko inercja 517/517 m (E/N) | ze wspomaganiami 7.6/4.8 m | rozrzut R95 { "51" } m | elipsa 3-sigma { "64" } x { "62" } m | { "99.1" }% wewnątrz (oczekiwane { "98.9" }%) (MODELLED)

seg-dfdb7de68515 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>

seg-bff1ab352267 = Przykład <c1/> ustawia między innymi:

seg-8073ece4c900 = Wykres zapisywany przez silnik dla scenarios/lunar-descent.toml, rodzaj lunar-descent

seg-d5da9ee3c152 = <b>MODELLED</b> Rodzaj i faza <c1/>: pięciostanowy model błędu inercjalnego na oś (pozycja, prędkość, bias akcelerometru, przechył, bias żyroskopu) w trakcie lądowania z napędem, wspomagany pozycjami AFS (samodzielnymi lub różnicowymi, z przypadkiem trzech przekaźników wspomaganych zegarem

seg-bfe4c0a04288 = <b>MODELLED</b> Rodzaj i faza <c1/>: pięciostanowy model błędu inercjalnego na oś (pozycja, prędkość, bias akcelerometru, przechył, bias żyroskopu) w trakcie lądowania z napędem,. Wyrocznia (InternalConsistency): Zamknięty dryf inercjalny, własne wyniki użytych ponownie rodzajów i kalibracja elipsy 3-sigma (część wewnątrz zgadza się z oczekiwaniem) w testach. Nie porównuje się żadnego odbytego ani przetestowanego lądowania

seg-ed286f215c96 = MODELLED: budżet rozrzutu lądowania z napędem w miejscu przy biegunie południowym (klasa Artemis). (katalog rodzajów (<c1/>))

seg-c1bd92ba429b = MODELLED: ilustracyjna klasa IMU, zestaw przekaźników, profil lądowania i człon prowadzenia; terrain-nav używa syntetycznej rzeźby w ziemskiej skali metra; dostępność AFS to jedna epoka na płaskiej masce. (katalog rodzajów (<c1/>))

seg-85714bc3cf2a = UCZCIWOŚĆ: MODELLED. Klasa IMU, profil lądowania, zestaw przekaźników, błąd sygnału w przestrzeni i człon prowadzenia są wejściami ILLUSTRATIVE, a nie pomiarami. Tryb terrain-nav używa samodzielnej syntetycznej rzeźby i ziemskiej skali metra, więc człon terenowy jest tu zachowaniem dopasowania na zastępniku, a nie stwierdzeniem o rzeźbie okolic bieguna południowego: wariant lola-crlb (lunar-descent-lola.toml) używa rzeczywistego (komentarz pliku scenariusza, wiersze { "14" } do { "20" })

seg-3eb1b3b03600 = Budżet rozrzutu lądowania w miejscu przy biegunie Księżyca (<c1/>) jest MODELLED, a nie sprawdzony względem niezależnego wzorca: sprawdzany względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-2b8455001710 = <s1>Poprzedni</s1>lunar-beacon

seg-ca9b68783354 = <s1>Następny</s1>lunar-differential-pnt
