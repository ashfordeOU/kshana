# docs--kind-mission-thread: translations (pl)

seg-f942b36a11c4 = Jeszcze nie na GitHub

seg-be831b52a339 = i { "4" } kolejne w macierzy.

seg-936e96edf423 = <b>MODELLED</b> Rodzaj <c1/>: dokument faz, z których każda jest jednym z ośmiu zarejestrowanych rodzajów, uruchamianych po kolei z kowariancją 6x6, zegarem i układem odniesienia przekazywanymi według podanej zasady (<c2/>; <c3/>, szum białego przyspieszenia na podanym odstępie Testy: <a1>field_units_global.rs</a1>.

seg-795e0409fa5a = <b>MODELLED</b> Faza <c1/>: stan średni z propagatora Cowella silnika (masa punktowa Ziemi i J2, Słońce i Księżyc jako ciała trzecie, Księżyc z jądra DE440 wątku tam, gdzie obejmuje on segment, a Słońce z serii analitycznej

seg-6a26b9ab59fe = Strona tematu: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Etykieta wyniku (silnika): MODELLED

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-6ba426630d7e = Źródło: <c1/>

seg-e2ba596c17c6 = <c1/> (rodzaj scenariusza)

seg-4816ff3c82ef = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Wątki misji</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1ec485468daa = MODELLED: budżet błędu nawigacji i czasu podanego łańcucha faz misji, od startu do wejścia w atmosferę: start i wznoszenie, spotkanie i połączenie na niskiej orbicie okołoziemskiej (powtarzalne), wtrysk translunarny i lot cislunarny, spotkanie na orbicie księżycowej, lądowanie, pobyt na powierzchni, wznoszenie oraz powrót i wejście w atmosferę, każda faza jednym z ośmiu zarejestrowanych rodzajów z własnymi czujnikami i filtrem. Kowariancja 6x6, zegar i układ odniesienia są przekazywane z fazy do fazy według podanej zasady (carry, inflate lub reacquire); konwersje układów odniesienia i skal czasu (GCRF, MCI, MCMF, UTC, TT, TDB, LTC) są osobnymi wierszami budżetu, ze stanem Księżyca z opcjonalnego wycinka jądra DE440 i z serii analitycznej jako podanym zapasowym wariantem. Opcjonalna nakładka sieci naziemnej ustala cykl śledzenia każdej fazy. Podaje budżet każdej fazy (1-sigmy na wejściu, w szczycie i na wyjściu, każdy wkład z jednostką), margines względem podanego wymagania, najsłabsze ogniwo, zdarzenia i wykres osi czasu. MODELLED: każda liczba jest podanym wejściem; łańcuch podąża za jednym stosem i żaden pojazd nie jest modelowany. Tylko źródła publiczne; bez powiązań z żadną agencją i bez jej poparcia; oprogramowanie wyłącznie doradcze, nie jest to certyfikowany sprzęt nawigacyjny.

seg-d6eb3dbb87c7 = Jeden przebieg <c1/> daje podsumowanie: mission-thread | { "11" } faz | wątek misji klasy Artemis (ILLUSTRATIVE) | najsłabsze ogniwo descent | MODELLED

seg-9bb19202a104 = Pola wymagane: <c1/>, <c2/>, <c3/>

seg-e1faea3151d6 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-094b47cf8ae2 = Przykład <c1/> ustawia między innymi:

seg-e5d2d8da2ec0 = gcrf

seg-2468a5014f25 = utc

seg-e92b7836bae3 = 2028-01-01T00:{ "00" }:00Z

seg-ffe559d3ff23 = cruise

seg-3be4934f4f4e = najmniejszy margines względem podanego wymag

seg-f32a7f31e191 = dryf inercjalny, bez wspomagania, wschód

seg-9fde3fc1cb5b = descent

seg-a07521d13bb4 = Wykres zapisywany przez silnik dla scenarios/mission-thread-artemis-class.toml, rodzaj mission-thread

seg-423ce11b54cd = <b>MODELLED</b> Faza <c1/>: kowariancja pozycji i prędkości o stałej prędkości z szumem białego przyspieszenia (klasa nawigacji zliczeniowej), pozycja GNSS o podanej dokładności stosowana po czasie akwizycji i poza podanymi zanikami, zegar z biasem i

seg-f393e01ac642 = <b>MODELLED</b> Faza <c1/>: stan względny w osiach LVLH celu z zamkniętą postacią przejścia Clohessy'ego-Wiltshire'a, kowariancja Kalmana 6x6 z szumem białego przyspieszenia i aktualizacje pozycji, których wariancja jest wariancją czujnika przy bi

seg-c9ff01a17f3f = <b>MODELLED</b> Rodzaj <c1/>: dokument faz, z których każda jest jednym z ośmiu zarejestrowanych rodzajów, uruchamianych po kolei z kowariancją 6x6, zegarem i układem odniesienia przekazywanymi. Wyrocznia (InternalConsistency): Obliczenia ręczne w testach (wzrost kowariancji po linii prostej, średnia rotacja gwiazdowa, wiekowe tempo zegara księżycowego) oraz, tylko dla stanu Księżyca, zatwierdzone wycinki jądra DE440 względem przypiętych wartości JPL Horizons (najgorzej { "2.6" } m i { "7e-6" } m/s). Z łańcuchem nie porównuje się żadnych danych misji; jego fazy są osobnymi wierszami. Dokument jest podanym łańcuchem z wejściami ILLUSTRATIVE, wyłącznie ze źródeł publicznych i bez popar

seg-529c9f8e8363 = <b>MODELLED</b> Faza <c1/>: kowariancja pozycji i prędkości o stałej prędkości z szumem białego przyspieszenia (klasa nawigacji zliczeniowej), pozycja GNSS o podanej dokł. Wyrocznia (InternalConsistency): Stan ustalony Riccatiego i ręczne obliczenie predykcji w testach. Nic tu nie modeluje rakiety nośnej ani odbiornika; każda liczba jest podanym wejściem

seg-01ef16f03f02 = <b>MODELLED</b> Faza <c1/>: stan względny w osiach LVLH celu z zamkniętą postacią przejścia Clohessy'ego-Wiltshire'a, kowariancja Kalmana 6x6 z białym . Wyrocznia (InternalConsistency): Jednoosiowe obliczenie ręczne predykcji i aktualizacji w teście; przejście Clohessy'ego-Wiltshire'a to to, które cw_dynamics sprawdza względem niezależnego całkowania numerycznego. Czujniki są ILLUSTRATIVE i nie porównuje się żadnego rzeczywistego spotkania

seg-1e77eae03d2c = <b>MODELLED</b> Faza <c1/>: stan średni z propagatora Cowella silnika (masa punktowa Ziemi i J2, Słońce i Księżyc jako ciała trzecie, Księżyc z jądra wątku. Wyrocznia (InternalConsistency): Twierdzenie Liouville'a (wyznacznik macierzy przejścia stanu części zachowawczej wynosi jeden) i drobniejsza różnica w testach; stan średni jest porównywany z publiczną trajektorią w wierszu poniżej, którego nie osiąga. Błąd impulsu, aktualizacje i kowariancja nie są z niczym porównywane

seg-d9a1ea509a3c = MODELLED: budżet błędu nawigacji i czasu podanego łańcucha faz misji, od startu do wejścia w atmosferę: start i wznoszenie, spotkanie i połączenie na niskiej orbicie okołoziemskiej (powtarzalne), wtrysk translunarny i lot cislunarny, spotkanie na orbicie księżycowej, lądowanie, pobyt na powierzchni, wznoszenie oraz powrót i wejście w atmosferę, każda faza jednym z ośmiu zarejestrowanych rodzajów z własnymi czujnikami i filtrem. (katalog rodzajów (<c1/>))

seg-80221e9351e4 = MODELLED: każda liczba jest podanym wejściem; łańcuch podąża za jednym stosem i żaden pojazd nie jest modelowany. (katalog rodzajów (<c1/>))

seg-637296d00802 = UCZCIWOŚĆ. Każda liczba tutaj jest ILLUSTRATIVE: okrągła wartość wybrana tak, by łańcuch działał, a nie osiągi jakiegokolwiek pojazdu, czujnika, stacji ani sieci. Łańcuch podąża za jednym stosem jako podanym uproszczeniem; zmiany pojazdów, transfery załogi i stacja na orbicie księżycowej nie są modelowane, orbity księżycowe to kołowe i polarne o wysokości { "100" } km, którymi latają rodzaje księżycowe (nie prawie prostoliniowa orbita halo), a impuls TLI jest (komentarz pliku scenariusza, wiersze { "11" } do { "17" })

seg-f6574a80a60a = Budżet błędu nawigacji i czasu łańcucha faz misji od startu do wejścia w atmosferę (<c1/>) jest MODELLED, a nie sprawdzony względem niezależnego wzorca: sprawdzany względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-9faba276f210 = Start i wznoszenie na orbitę parkingową z akwizycją GNSS i zanikiem (<c1/>) jest MODELLED, a nie sprawdzone względem niezależnego wzorca: sprawdzane względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-20bbe2135d61 = Nawigacja względna do obwiedni połączenia na niskiej orbicie okołoziemskiej na odcinkach czujników (<c1/>) jest MODELLED, a nie sprawdzona względem niezależnego wzorca: sprawdzana względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-c60fd7868746 = Wtrysk translunarny i lot cislunarny: propagowany stan średni i kowariancja z aktualizacjami śledzenia (<c1/>) jest MODELLED, a nie sprawdzony względem niezależnego wzorca: sprawdzany względem własnej tożsamości w postaci zamkniętej / analitycznej — wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-c10f77a86f4d = Strona rodziny: <a1>Wątki misji</a1>

seg-f3279128de3b = <s1>Poprzedni</s1>mars-pnt

seg-2854e6a75833 = <s1>Następny</s1>moonlight-service-volume
