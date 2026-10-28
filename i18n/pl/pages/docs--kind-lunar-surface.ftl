# docs--kind-lunar-surface: translations (pl)

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-51362910dcb7 = { "2" } dołączone scenariusze używają tego rodzaju; pozostałe są w <a1><c1/></a1>.

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Księżyc i przestrzeń cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Księżyc i przestrzeń cislunarna</a1>

seg-6a26b9ab59fe = Strona tematu: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Etykieta wyniku (silnika): MODELLED

seg-626ab55f0424 = MODELLED (wynik <c1/>)

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-bf92597fdba4 = Oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzę

seg-feea03a2c628 = Źródło: <c1/>

seg-6c0eff9f9211 = <c1/> (rodzaj scenariusza)

seg-6c7d25f672fb = MODELLED: dostępność pozycjonowania i czasu na powierzchni według miejsca i pory roku dla miejsc przy biegunie południowym klasy Artemis. Dla każdego miejsca i pory roku (epoka i okno po niej) podaje pozycjonowanie przekaźnikami (cztery lub więcej przekaźników konstelacji klasy LCNS ILLUSTRATIVE w zasięgu i PDOP poniżej progu, z tych samych funkcji co moonlight-service-volume oraz, z sekcją terenu, horyzont terenu lunar-station-coverage śledzony promieniem), czy Ziemia i Słońce są nad horyzontem miejsca (analityczne Słońce, Księżyc i orientacja księżycowa, z libracją, co zmienia się z porą roku) oraz dostępność czasu (przekaźnik lub Ziemia w zasięgu) z najdłuższym odcinkiem, na którym nie ma żadnego z nich, czyli holdover, który zegar powierzchniowy musi przetrwać. Wynik dla jednego miejsca równa się wynikowi moonlight-service-volume co do bitu. MODELLED: ilustracyjny keplerowski zestaw przekaźników na Księżycu o średniej rotacji; wartość dla przekaźników nie zmienia się z porą roku; teren to wycinek LOLA { "1200" } m. Bez poparcia agencji; oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny.

seg-3c13aefe4093 = Jeden przebieg <c1/> daje podsumowanie: lunar-surface | { "4" } miejsca x { "4" } pory roku | pozycjonowanie { "41" }% do { "41" }% | najgorsza dostępność czasu { "100.0" }% | najdłuższa przerwa czasu { "0.0" } h (MODELLED)

seg-02bc245c436e = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-4e5ed02a85e1 = Przykład <c1/> ustawia między innymi:

seg-0ceb87f45323 = okolice bieguna południowego { "89.9" }

seg-94a405fadf2d = mci

seg-8c3e0f75ab98 = przechodzi bez zmian

seg-94b84de6c958 = Wykres zapisywany przez silnik dla scenarios/lunar-surface.toml, rodzaj lunar-surface

seg-25040e105bf7 = <b>MODELLED</b> Rodzaj i faza <c1/>: dostępność przekaźników i PDOP, widoczność Ziemi i Słońca oraz zdyscyplinowany zegar powierzchniowy dla każdego miejsca i pory roku, z horyzontem terenu z <c2/>; przebieg dla jednego miejsca równa się temu rodzaju

seg-70f63c99a478 = <b>MODELLED</b> Rodzaj i faza <c1/>: dostępność przekaźników i PDOP, widoczność Ziemi i Słońca oraz zdyscyplinowany zegar powierzchniowy dla każdego miejsca i pory roku, z terenem. Wyrocznia (ReferenceImpl): Dokładna równość z istniejącym rodzajem dla jednego miejsca oraz kontrole monotoniczności w testach. Zestaw przekaźników jest ILLUSTRATIVE i nie porównuje się żadnego pomiaru z powierzchni

seg-ab29e0e308d0 = MODELLED: dostępność pozycjonowania i czasu na powierzchni według miejsca i pory roku dla miejsc przy biegunie południowym klasy Artemis. (katalog rodzajów (<c1/>))

seg-3f948092eba6 = MODELLED: ilustracyjny keplerowski zestaw przekaźników na Księżycu o średniej rotacji; wartość dla przekaźników nie zmienia się z porą roku; teren to wycinek LOLA { "1200" } m. (katalog rodzajów (<c1/>))

seg-5b217c0bb606 = UCZCIWOŚĆ: MODELLED. Zestaw przekaźników jest ilustracyjny i keplerowski, a Księżyc obraca się ze średnią prędkością dla przekaźników (bez libracji) jak w moonlight-service-volume; Ziemia i Słońce używają orientacji analitycznej, więc oba układy różnią się przez to pominięcie. Wartość pozycjonowania przekaźnikami nie zmienia się w tym modelu z porą roku; wartości dla Ziemi i Słońca się zmieniają. Nie twierdzi się, że wynik pokrywa się z jakąkolwiek rzeczywistą usługą ani miejscem. Wył (komentarz pliku scenariusza, wiersze { "11" } do { "15" })

seg-958f00c2d647 = Dostępność pozycjonowania i czasu na powierzchni według miejsca i pory roku na biegunach Księżyca (<c1/>) jest MODELLED, a nie sprawdzona względem niezależnego wzorca: sprawdzana względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale nie zewnętrznie miarodajnej. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-988e99fc26be = <s1>Poprzedni</s1>lunar-station-coverage

seg-625c1973128e = <s1>Następny</s1>lunar-time-budget
