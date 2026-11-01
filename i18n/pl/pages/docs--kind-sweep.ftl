# docs--kind-sweep: translations (pl)

seg-4636d450ef60 = <b>MODELLED</b> Jeden przebieg przyjmuje plan kontaktów (listę okien aos_s/los_s, każde żądające od apertury nawigacji lub łączności — to samo słownictwo okien, które emituje <c1/>, przekształcone przez <c2/>), liczbę apert

seg-fa3ad6babe54 = <b>MODELLED</b> Przegląd rodzaju <c1/> (jeden do trzech kluczy z kropkami dowolnego rodzaju, na wartościach osi przeglądu ogólnego, opcjonalnie zespół w każdym węźle) i sekcja monte_carlo. Wyrocznia (InternalConsistency): Postać zamknięta błądzenia fazy przy szumie częstotliwości białym, wariancja q_wf tau (NIST Technical Note { "1337" }), dla mechanizmu statystyk, oraz równość bajtowa z przebiegami samodzielnymi dla ziarnowania. Sprawdza arytmetykę zespołu na własnym modelu zegara silnika, a nie na zewnętrznym zbiorze danych

seg-d1c11e493795 = Przeglądy parametrów i zespoły Monte Carlo z ziarnem dla dowolnego rodzaju scenariusza są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-a8d92406e428 = Optyczny zegar na sieci strontowej, cel dla zastosowań kosmicznych sigma_y

seg-5278ccdaf16f = <b>MODELLED</b> Wzrost błędu dryfu w postaci zamkniętej + holdover do progu; klasy zegarów kwantowych. Wyrocznia (ReferenceImpl): Wielokrokowa rekurencja kowariancji clock_state (kontrola krzyżowa w tej samej bazie kodu); leżące u podstaw jądro wariancji dryfu i odwrócenia holdover jest sprawdzone zewnętrznie względem scipy (zob. 'Clock-holdover coast-variance & threshold inversion'). Wartości holdover dla poszczególnych klas z dolnym poziomem szumu czerwonego pozostają MODELLED

seg-e12f672ae71d = Utrzymanie zegara w holdover przy braku GNSS jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-ee7dd15019d0 = Strona tematu: <a1>CAMPAIGNS.md</a1>

seg-0aae0574c5e6 = <b>MODELLED</b> Przeglądy dostępności rodzaju <c1/>: dla każdej konstelacji (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) i łącznie, odsetek par (użytkownik, epoka) z co najmniej jednym i z co najmniej czterema sygnałami oraz najdłuższa przerwa, dla użytkownika na sferze

seg-de72ae48731d = Źródło: <c1/>

seg-81c2da4650c9 = <c1/> (rodzaj scenariusza)

seg-e7ab7b55c969 = Przegląd 1-wymiarowy badania kompromisów po parametrze pakietu zegara.

seg-0412c0dbfb75 = Jeden przebieg <c1/> podsumowuje się tak: przegląd holdover_s po classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } punktów, skala logarytmiczna) | kwantowy 6600.000->{ "6600.000" } | klasyczny 2610.000->{ "250.000" }

seg-d2a441254bcd = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-2b8d8159bdaf = Pola opcjonalne: <c1/>

seg-73c2e732b0c1 = Przykład <c1/> ustawia między innymi:

seg-f8a627a78bdb = Karta katalogowa CSAC Microchip SA.45s sigma_y(1s)={ "3e-10" }; q_wf to s

seg-c784b8f22f12 = Wykres zapisany przez silnik dla scenarios/sweep-clock-stability.toml, rodzaj sweep

seg-cb00aca0268d = <b>MODELLED</b> Sekcje sweep rodzaju <c1/> (od jednego do trzech kluczy z kropkami dowolnego rodzaju, na wartościach osi ogólnego przeglądu, opcjonalnie zespół w każdym węźle) i monte_carlo: realizacja k działa przy base_seed + k; każda metryka podaje średnią, odchylenie standardowe Testy: <a1>campaign_composition_reference.rs</a1>.

seg-1750fbfc4a99 = <s1>Poprzednia</s1>sweep-nd

seg-de5468ac32fc = <s1>Następna</s1>telecom-timing

seg-8b701f465117 = logarytmiczna

seg-795e0409fa5a = <b>MODELLED</b> Faza <c1/>: stan średni z propagatora Cowella silnika (masa punktowa Ziemi i J2, Słońce i Księżyc jako ciała trzecie, Księżyc z jądra DE440 wątku tam, gdzie obejmuje on segment, a Słońce z serii analitycznej
