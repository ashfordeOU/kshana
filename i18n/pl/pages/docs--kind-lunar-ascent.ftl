# docs--kind-lunar-ascent: translations (pl)

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-98151954f217 = false

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Księżyc i przestrzeń cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Księżyc i przestrzeń cislunarna</a1>

seg-6a26b9ab59fe = Strona tematu: <a1>MISSION-THREAD.md</a1>

seg-f4b0bdb93d10 = Źródło: <c1/>

seg-b8ef47331221 = <c1/> (rodzaj scenariusza)

seg-ae3053a1f6c8 = MODELLED: wznoszenie z napędem z miejsca na powierzchni przy biegunie południowym na orbitę spotkania oraz kowariancja pozycji i prędkości, którą przenosi z powrotem na orbitę (klasa Artemis). Pięciostanowy model błędu inercjalnego na oś z lunar-descent (pozycja, prędkość, bias akcelerometru, przechył położenia, bias żyroskopu, sterowany siłą właściwą) działa na wszystkich trzech osiach miejsca ze stanu powierzchniowego, z którym faza się zaczyna; pozycja AFS z widocznych przekaźników konstelacji klasy LCNS ILLUSTRATIVE (samodzielna albo różnicowa z użyciem reszty łącza korekcji z lunar-differential-pnt, ze wspomaganiem zegara, gdy widoczne są tylko trzy przekaźniki) jest brana w podanym odstępie, przy czym czas księżycowy wchodzi przez zegar pojazdu i błąd znacznika czasu wzdłuż toru. Podaje zamknięte źródła inercjalne, wkład wspomagania, ablację, 1-sigmy nawigacji podczas wznoszenia, rozrzut przy wyłączeniu silnika obok wiedzy nawigacyjnej oraz pełną kowariancję 6x6 MCI przy wprowadzeniu z zachowaną korelacją pozycji i prędkości. MODELLED: ilustracyjna klasa IMU, siła właściwa, zestaw przekaźników i rozrzut przy wyłączeniu; błędy utrzymywane w osiach miejsca startu; nominalny stan wyjściowy jest zastępczy. Bez poparcia agencji; oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny.

seg-fc4d2ba3f99e = Jeden przebieg <c1/> daje podsumowanie: lunar-ascent | -89.50 deg | tylko inercja { "785" } m / { "3.49" } m/s | z AFS { "11.4" } m / { "0.071" } m/s | rozrzut wprowadzenia { "1.73" } m/s (MODELLED)

seg-9fcdb15c21eb = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>

seg-a1c3e374f512 = Przykład <c1/> ustawia między innymi:

seg-ebc18c9bcbac = differential

seg-3843825d0733 = us

seg-2d84b341a41f = Etykieta wyniku (silnika): MODELLED

seg-463a919e84d5 = Wykres zapisywany przez silnik dla scenarios/lunar-ascent.toml, rodzaj lunar-ascent

seg-52ee53bc1cd6 = <b>MODELLED</b> Rodzaj i faza <c1/>: pięciostanowy model błędu inercjalnego na oś uruchomiony dla wznoszenia z napędem z siłą właściwą wzdłuż toru, wspomagany pozycjami AFS i czasem księżycowym, podający kowariancję pozycji i prędkości wprowadzenia przenoszoną

seg-4e0c4b02eac0 = <b>MODELLED</b> Rodzaj i faza <c1/>: pięciostanowy model błędu inercjalnego na oś uruchomiony dla wznoszenia z napędem z siłą właściwą wzdłuż toru, wspomagany pozycjami AFS. Wyrocznia (InternalConsistency): Zamknięty dryf inercjalny i kontrole monotoniczności w testach. Nie porównuje się żadnego odbytego wznoszenia

seg-8732ad9f7e07 = <b>MODELLED</b> Propagator wspólny dla rodzajów księżycowych (GRAIL GL0660B stopnia i rzędu { "150" }, Ziemia i Słońce jako ciała trzecie, relatywistyka, orientacja Księżyca z DE440) porównany z publ. Wyrocznia (ExternalDataset): Efemerydy statków kosmicznych JPL Horizons dla LRO i CAPSTONE, względem progów zarejestrowanych wstępnie w xval/mission-thread-lunar/PREREGISTRATION.md (poprawki { "1" } do { "6" }). LRO: MET, największa różnica 3-D { "33" } m i { "2.4" } m RMS promieniowo wobec { "500" } m i { "60" } m. CAPSTONE: NOT MET, różnica pozycji końcowej { "136.8" } km wobec { "25" } km i różnica perycentrum { "28.4" } km wobec { "10" } km, przyczyny nie zostały wyizolowane. Wiersz jest obliczony z modelu, ponieważ próg CAPSTONE nie został osiągnięty, a

seg-626ab55f0424 = MODELLED (wynik <c1/>)

seg-745dfc03a929 = MODELLED: wznoszenie z napędem z miejsca na powierzchni przy biegunie południowym na orbitę spotkania oraz kowariancja pozycji i prędkości, którą przenosi z powrotem na orbitę (klasa Artemis). (katalog rodzajów (<c1/>))

seg-3fd0cca78937 = MODELLED: ilustracyjna klasa IMU, siła właściwa, zestaw przekaźników i rozrzut przy wyłączeniu; błędy utrzymywane w osiach miejsca startu; nominalny stan wyjściowy jest zastępczy. (katalog rodzajów (<c1/>))

seg-2cfb37d39847 = UCZCIWOŚĆ: MODELLED. Klasa IMU, wyrównanie, siła właściwa i rozrzut przy wyłączeniu są wejściami ILLUSTRATIVE, a nie pomiarami. Błędy są utrzymywane w osiach wschód-północ-góra miejsca startu, bez krzywizny toru wzdłuż trasy, a nominalny stan wyjściowy jest zastępczy na lokalnej pionowej miejsca: wynikiem jest tylko kowariancja. Nie twierdzi się, że wynik pokrywa się z jakimkolwiek rzeczywistym pojazdem. Oprogramowanie wyłącznie doradcze, nie c (komentarz pliku scenariusza, wiersze { "11" } do { "15" })

seg-6faf49cac41a = Wznoszenie z napędem z miejsca przy biegunie Księżyca na orbitę wprowadzenia (<c1/>) jest MODELLED, a nie sprawdzone: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e482c9896140 = Propagacja księżycowego modelu sił względem publicznych odtworzonych trajektorii orbiterów księżycowych i cislunarnych jest MODELLED, a nie sprawdzona: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych z modelu, więc możliwość pozostaje obliczona z modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-1a1799e01ac4 = <s1>Poprzedni</s1>link-budget

seg-59d4cb995cb9 = <s1>Następny</s1>lunar-attack-surface
