# docs--kind-lunar-orbit-rendezvous: translations (pl)

seg-34bdcfd66ded = W gałęzi repozytorium, z której pochodzi ta dokumentacja; jeszcze nie na GitHub

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-51362910dcb7 = { "2" } dołączone scenariusze używają tego rodzaju; pozostałe są w <a1><c1/></a1>.

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Księżyc i przestrzeń cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Księżyc i przestrzeń cislunarna</a1>

seg-6a26b9ab59fe = Strona tematu: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Etykieta wyniku (silnika): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> Propagator wspólny dla rodzajów księżycowych (GRAIL GL0660B stopnia i rzędu { "150" }, Ziemia i Słońce jako ciała trzecie, relatywistyka, orientacja Księżyca z DE440) porównany z publ. Wyrocznia (ExternalDataset): Efemerydy statków kosmicznych JPL Horizons dla LRO i CAPSTONE, względem progów zarejestrowanych wstępnie w xval/mission-thread-lunar/PREREGISTRATION.md (poprawki { "1" } do { "6" }). LRO: MET, największa różnica 3-D { "33" } m i { "2.4" } m RMS promieniowo wobec { "500" } m i { "60" } m. CAPSTONE: NOT MET, różnica pozycji końcowej { "136.8" } km wobec { "25" } km i różnica perycentrum { "28.4" } km wobec { "10" } km, przyczyny nie zostały wyizolowane. Wiersz jest obliczony z modelu, ponieważ próg CAPSTONE nie został osiągnięty, a

seg-626ab55f0424 = MODELLED (wynik <c1/>)

seg-e482c9896140 = Propagacja księżycowego modelu sił względem publicznych odtworzonych trajektorii orbiterów księżycowych i cislunarnych jest MODELLED, a nie sprawdzona: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych z modelu, więc możliwość pozostaje obliczona z modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Źródło: <c1/>

seg-8beb22a0eb0b = <c1/> (rodzaj scenariusza)

seg-2deefd8c547b = MODELLED: nawigacja względna do połączenia w stylu Orion–lądownik na niskiej orbicie księżycowej albo eliptycznej orbicie polarnej (klasa Artemis). Statek goniący i cel lecą po tej samej orbicie w modelu sił księżycowych biblioteki; wspólne wsadowe oszacowanie Gaussa-Newtona z 21 parametrami na łuku (dwa stany pojazdów i trwałe odchylenia sygnału w przestrzeni) łączy pozycję bezwzględną każdego pojazdu z zestawu przekaźników klasy LCNS ILLUSTRATIVE (przekaźniki za Księżycem odrzucone, potrzebne cztery, błąd sygnału w przestrzeni wspólny dla obu pojazdów znosi się między nimi) oraz odległość międzypojazdową, z precyzją pomiaru odległości wynikającą z granicy śledzenia kodu pilotowego LunaNet AFS. Podaje formalny i Monte Carlo błąd położenia i prędkości względnej w osiach LVLH celu, dostępność pozycji, średni znormalizowany kwadrat błędu oszacowania wobec jego wartości oczekiwanej oraz każdą próbę, której iteracja nie zbiegła, dryf wynikający z pominięcia harmonicznych grawitacji i pełną przekazywaną kowariancję 6x6. Dla przypadku kołowego obowiązuje kontrola w postaci zamkniętej Hilla/Clohessy'ego-Wiltshire'a. MODELLED: ilustracyjny zestaw przekaźników, budżet błędów i rozkłady a priori; prawda i estymator współdzielą jeden model sił, więc NEES sprawdza samozgodność, a nie błąd modelu. Bez poparcia agencji; oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny.

seg-a6d29fc5f19b = Jeden przebieg <c1/> daje podsumowanie: lunar-orbit-rendezvous | llo 100x100 km | odl. { "2000" } m | pozycje { "74" }% | poz. wzgl. 1-sigma R/A/C 0.03/0.06/0.04 m | średnie NEES { "6.51" } (oczekiwane { "6" }) | zbieżność po { "2000" } s (MODELLED)

seg-b7c86affeac1 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Przykład <c1/> ustawia między innymi:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzę

seg-4466fb6f4043 = wsadowa metoda Gaussa-Newtona na łuku

seg-d97b2505ac72 = Wykres zapisywany przez silnik dla scenarios/lunar-orbit-rendezvous.toml, rodzaj lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> Rodzaj i faza <c1/>: wspólne wsadowe oszacowanie Gaussa-Newtona dwóch pojazdów na łuku (dwadzieścia jeden parametrów: oba stany oraz trwałe odchylenia pozycji sygnału w przestrzeni, wspólne i niezależne), rozbudowywane na ćwierć, poło Testy: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> Rodzaj i faza <c1/>: wspólne wsadowe oszacowanie Gaussa-Newtona dwóch pojazdów na łuku (dwadzieścia jeden parametrów: oba stany oraz trwałe odchylenia sygnału. Wyrocznia (InternalConsistency): Samozgodność w ramach wstępnej rejestracji (xval/mission-thread-lunar/PREREGISTRATION.md, wyniki i historia estymatora w RESULTS.md): średnie NEES stanu względnego wynosi od { "5.85" } do { "5.93" } wobec pasma od { "5.2" } do { "6.8" } w czterech konfiguracjach, MET przy czwartym projekcie estymatora po tym, jak trzy projekty filtra sekwencyjnego nie osiągnęły progu; prawda i estymator współdzielą jeden model sił, więc nic to nie mówi o błędzie modelu. Propag

seg-b2f273ea732d = MODELLED: nawigacja względna do połączenia w stylu Orion–lądownik na niskiej orbicie księżycowej albo eliptycznej orbicie polarnej (klasa Artemis). (katalog rodzajów (<c1/>))

seg-9d4f99557cc5 = MODELLED: ilustracyjny zestaw przekaźników, budżet błędów i rozkłady a priori; prawda i estymator współdzielą jeden model sił, więc NEES sprawdza samozgodność, a nie błąd modelu. (katalog rodzajów (<c1/>))

seg-158e44d47c0b = UCZCIWOŚĆ: MODELLED. Zestaw przekaźników, błąd sygnału w przestrzeni, część wspólna i rozkłady a priori są wejściami ILLUSTRATIVE, a nie pomiarami; prawda i estymator współdzielą model sił (wbudowany człon centralny, J2 i C22). Kontrola spójności B1 zarejestrowana wstępnie (średnie NEES w [{ "5.2" }, { "6.8" }]) jest osiągnięta we wszystkich czterech konfiguracjach przy projekcie wsadowym: zob. xval/mission-thread-lunar/RESULTS.md. Nie twierdzi się, że wynik pokrywa się z jakimkolwiek rzecz (komentarz pliku scenariusza, wiersze { "10" } do { "14" })

seg-2a88a9650804 = Nawigacja względna do połączenia na orbicie księżycowej (<c1/>) jest MODELLED, a nie sprawdzona względem niezależnego wzorca: sprawdzana względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Poprzedni</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Następny</s1>lunar-station-coverage
