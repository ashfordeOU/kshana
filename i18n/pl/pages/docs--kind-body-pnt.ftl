# docs--kind-body-pnt: translations (pl)

seg-5b561b4fd201 = Mars

seg-debc2f07db78 = true

seg-37d29d8303fe = km

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-02b8d1f1b7df = Źródło: <c1/>

seg-e28ba749a2a1 = <c1/> (rodzaj scenariusza)

seg-11e8c29ecb45 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Konstelacje, pokrycie i geometria</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-e7dad1a1ecba = Pozycjonowanie wokół dowolnego ciała Układu Słonecznego: orbiter lub lądownik powierzchniowy wokół ciała centralnego wybranego po nazwie (Mars, Księżyc, Europa, Ganimedes, Tytan i reszta katalogu Układu Słonecznego), nawigujący na podstawie jednokierunkowych pseudoodległości z małej konstelacji nawigacyjnej Walkera wokół ciała (orbity dwóch ciał z sekularnym dryfem J2 własnym dla ciała, nieznany zegar użytkownika) i opcjonalnie bezzegarowego dwukierunkowego pomiaru odległości w głębokim kosmosie z Ziemi, której kierunek i odległość pochodzą z analitycznych efemeryd Układu Słonecznego w każdej epoce. Linie widzenia są blokowane przez średnią sferę ciała, a użytkownik na powierzchni potrzebuje też maski elewacji. W każdej epoce: widoczne przekaźniki, czy Ziemia jest ponad limbem, GDOP i PDOP samej konstelacji (współczynniki rozmycia dokładności: geometryczny i pozycji), formalna niepewność pozycji jednosigmowa z wierszem Ziemi i bez niego oraz błąd rozwiązania metodą najmniejszych kwadratów Gaussa-Newtona z ziarnem w każdym z tych wariantów; w całym przebiegu: dostępność, widoczność Ziemi, mediana PDOP, błąd RMS i mediana formalnej sigmy, a także czas świetlny Ziemia–ciało, czas pełnej drogi, opóźnienie Shapiro i odległość kątowa od Słońca w danej epoce. MODELLED: orbity przekaźników, poziomy szumu i chwilowy model pomiaru są wyborami modelowymi, niesprawdzonymi względem danych nawigacyjnych żadnej misji; stałe ciała to opublikowane wartości przywołane w body.rs, a geometria Ziemi dziedziczy etykiety efemeryd Układu Słonecznego.

seg-c90c1a79f88b = Jeden przebieg <c1/> podsumowuje się tak: Pozycjonowanie wokół Marsa — użytkownik na orbiterze, { "12" } przekaźników na { "10000" } km, { "296" } epok Czas świetlny Ziemi { "338.3" } s w jedną stronę, { "676.6" } s pełna droga; kąt Słońce–Ziemia–ciało { "175.4" } deg dostępność: { "1.000" } sama konstelacja, { "1.000" } z pomiarem odległości do Ziemi (Ziemia w zasięgu widzenia { "0.811" }) mediana PDOP { "1.375" } ; błąd RMS { "1.883" } m sama konstelacja, { "1.629" } m z pomiarem odległości do Ziemi mediana formalnej sigmy { "1.375" } m sama konstelacja, { "1.304" } m z pomiarem odległości do Ziemi

seg-31bacf177d9c = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-3f1989254167 = Przykład <c1/> ustawia m.in.:

seg-2edab0747386 = 2027-02-19T00:{ "00" }:{ "00" }

seg-753b1683fb7b = m^3/s^{ "2" }

seg-81d4cd54bd62 = Etykieta wyniku (silnika): MODELLED: orbity przekaźników dwóch ciał z sekularnym dryfem J2, widoczność geometryczna, gaussowski szum odległości i chwilowy model pomiaru wokół ciała z opublikowanych stałych; niesprawdzone względem danych nawigacyjnych żadnej misji. Geometria Ziemia–ciało dziedziczy etykietę efemeryd Układu Słonecznego

seg-6f341acbe994 = Wykres zapisywany przez silnik dla scenarios/mars-orbit-pnt.toml, rodzaj body-pnt

seg-dae4184bb004 = <b>VALIDATED</b> Newtonowski jednokierunkowy czas świetlny z dowolnego ciała do dowolnego innego, odbierany w danej epoce, rozwiązywany radiometrycznym solwerem czasu świetlnego z punktem stałym (radiometric::light_time_solution, nadajnik w swoim położeniu opóźnionym) przez solar_system::link_o Testy: <a1>solar_system_light_time_preregistered.rs</a1>.

seg-45259ad33a01 = <b>MODELLED</b> Rodzaj <c1/>: orbiter lub lądownik powierzchniowy wokół ciała wybranego po nazwie nawiguje na podstawie jednokierunkowych pseudoodległości z konstelacji nawigacyjnej Walkera wokół ciała (orbity dwóch ciał z sekularnym dryfem J2 ciała, nieznany zegar użytkownika

seg-5c3f8ac041d3 = <b>MODELLED</b> Rodzaj <c1/>: orbiter lub lądownik powierzchniowy wokół ciała wybranego po nazwie nawiguje na podstawie jednokierunkowych pseudoodległości z konstelacji nawigacyjnej Walkera wokół. Wyrocznia (InternalConsistency): Postacie zamknięte i samospójność: trzecie prawo Keplera dla okresu przekaźnika, promień orbity i promień powierzchni utrzymane w całym przebiegu, dodanie pomiaru nigdy nie zwiększające formalnej niepewności oraz błędy z ziarnem zgodne z kowariancją. Orbity przekaźników pomijają trzecie ciała (przyciąganie Jowisza na przekaźniki wokół Europy nie jest modelowane), szum jest gaussowski na podanych poziomach, a model pomiaru jest chwilow

seg-64920deda9cd = MODELLED: orbity przekaźników dwóch ciał z sekularnym dryfem J2, widoczność geometryczna, gaussowski szum odległości i chwilowy model pomiaru wokół ciała z opublikowanych stałych; niesprawdzone względem danych nawigacyjnych żadnej misji. Geometria Ziemia–ciało dziedziczy etykiety efemeryd Układu Słonecznego. (wynik <c1/>)

seg-bcb5cbf9cbe3 = MODELLED: orbity przekaźników, poziomy szumu i chwilowy model pomiaru są wyborami modelowymi, niesprawdzonymi względem danych nawigacyjnych żadnej misji; stałe ciała to opublikowane wartości przywołane w body.rs, a geometria Ziemi dziedziczy etykiety efemeryd Układu Słonecznego. (katalog rodzajów (<c1/>))

seg-04cd882741e2 = MODELLED. Orbity przekaźników, szum odległości { "1" } m i chwilowy model pomiaru są wyborami modelowymi; nic tutaj nie jest sprawdzone względem danych nawigacyjnych żadnej misji. Stałe Marsa to opublikowane wartości przywołane w src/body.rs. (komentarz w pliku scenariusza, wiersze { "20" } do { "22" })

seg-df6bae4c422e = Pozycjonowanie wokół dowolnego ciała Układu Słonecznego z lokalną konstelacją i łączem w głębokim kosmosie z Ziemi jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a4f1e7d2041e = Strona rodziny: <a1>Konstelacje, pokrycie i geometria</a1>

seg-670191cf797f = Strona tematu: <a1>SOLAR-SYSTEM.md</a1>

seg-cef32ee7d521 = Strona tematu: <a1>CONSTELLATION-DESIGN.md</a1>

seg-a4c650a0eb7a = <s1>Poprzedni</s1>attitude-budget

seg-96170e5c8e3f = <s1>Następny</s1>campaign
