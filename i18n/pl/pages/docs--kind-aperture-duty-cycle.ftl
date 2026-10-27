# docs--kind-aperture-duty-cycle: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-4b695c0dfc9f = Źródło: <c1/>

seg-632c0a545845 = <c1/> (rodzaj scenariusza)

seg-0cef33b41040 = Cykl pracy apertur: podział czasu między nawigację a łączność, jaki wynika z planu kontaktów dla puli sterowalnych apertur. Przyjmuje plan kontaktów (listę okien <c1/> aos_s/los_s, każde żądające nawigacji lub łączności — to samo słownictwo aos_s/los_s, które emituje predyktor <c2/>), liczbę apertur oraz POLITYKĘ ARBITRAŻU (domyślnie z priorytetem nawigacji, albo z priorytetem łączności, albo bez wywłaszczania: kto pierwszy, ten pierwszy) i podaje cykl pracy nawigacji, cykl pracy łączności, cykl bezczynności oraz przerwę w obsłudze sesji — czas kontaktu, o który sesja prosiła, a który nie został obsłużony przez żadną aperturę. Dokładne przemiatanie przedziałów po granicach okien, więc stykające się okna nigdy nie konkurują i żadna sekunda apertury nie jest liczona dwa razy; sekundy apertur nawigacyjne, łącznościowe i bezczynne są sumowane niezależnie i domykają się względem apertures*horizon_s. Raport podaje rozstrzygniętą politykę, jej pełną definicję oraz definicje cyklu pracy i przerwy, ponieważ wartość cyklu pracy podana bez polityki arbitrażu nie jest odtwarzalna. Arytmetyka planowania MODELLED: nie nalicza się czasu przeskoku / przestrojenia / zmiany przy zmianie usługi lub sesji przez aperturę, w decyzji nie występuje ilość danych, stan bufora, budżet energii ani domknięcie łącza, a okna kontaktów są danymi wejściowymi — ich geometria jest taka, jaką wytworzyło to, co je wygenerowało. To nie jest produkt do planowania segmentu naziemnego.

seg-a8d79b8a96bc = Jeden przebieg <c1/> podsumowuje się tak: aperture-duty-cycle: { "6" } sesji na { "2" } aperturach przy priorytecie nawigacji -> cykl pracy nawigacji { "0.1167" }, cykl pracy łączności { "0.2667" }, bezczynność { "0.6167" }; { "0" } s z żądanych { "6900" } s utracone wskutek rywalizacji (MODELLED)

seg-67c665d5c8c0 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-60f25ccdab6e = Przykład <c1/> ustawia m.in.:

seg-bf51947657c0 = nawigacja

seg-b4ff1d640bdf = łączność

seg-2e78730d0737 = aperture*s

seg-330cbcd04718 = ułamek (bezwymiarowy)

seg-0ef5875db338 = Etykieta wyniku (silnika): MODELLED — arytmetyka planowania apertur na dostarczonym planie kontaktów: dokładne przemiatanie przedziałów podziału czasu między nawigację a łączność oraz strat z rywalizacji w sesjach według nazwanej polityki arbitrażu. Nie nalicza się czasu przeskoku / przestrojenia / zmiany przy zmianie usługi lub sesji przez aperturę,

seg-a8b38ed8e029 = Wykres zapisywany przez silnik dla scenarios/aperture-duty-cycle.toml, rodzaj aperture-duty-cycle

seg-4636d450ef60 = <b>MODELLED</b> Jeden przebieg przyjmuje plan kontaktów (listę okien aos_s/los_s, każde żądające od apertury nawigacji lub łączności — to samo słownictwo okien, które emituje <c1/>, przekształcone przez <c2/>), liczbę apert

seg-7a5aa78533d3 = <b>MODELLED</b> Jeden przebieg przyjmuje plan kontaktów (listę okien aos_s/los_s, każde żądające od apertury nawigacji lub łączności — to samo słownictwo okien, które `passes::pre. Wyrocznia (InternalConsistency): Spójność wewnętrzna, z trzech wielkości liczonych różnymi wyrażeniami w tym samym przemiataniu, a następnie wymaganych do domknięcia. Sekundy apertur nawigacyjne, łącznościowe i bezczynne są sumowane osobno — bezczynne z (apertures − |served|) na elementarny przedział, nigdy jako reszta — a ich suma jest sprawdzana względem apertures × horizon_s, czego błędnie wyznaczona granica, podwójne l

seg-a388c24fec99 = MODELLED — arytmetyka planowania apertur na dostarczonym planie kontaktów: dokładne przemiatanie przedziałów podziału czasu między nawigację a łączność oraz strat z rywalizacji w sesjach według nazwanej polityki arbitrażu. Nie nalicza się czasu przeskoku / przestrojenia / zmiany przy zmianie usługi lub sesji przez aperturę, w decyzji nie występuje ilość danych, stan bufora, budżet energii ani domknięcie łącza, a okna kontaktów są danymi wejściowymi — th (wynik <c1/>)

seg-e689f30b268a = Arytmetyka planowania MODELLED: nie nalicza się czasu przeskoku / przestrojenia / zmiany przy zmianie usługi lub sesji przez aperturę, w decyzji nie występuje ilość danych, stan bufora, budżet energii ani domknięcie łącza, a okna kontaktów są danymi wejściowymi — ich geometria jest taka, jaką wytworzyło to, co je wygenerowało. (katalog rodzajów (<c1/>))

seg-4aa40af30bd2 = UCZCIWY ZAKRES: arytmetyka planowania MODELLED na dostarczonych oknach. Nie nalicza się czasu przeskoku / przestrojenia / zmiany przy zmianie usługi lub sesji przez aperturę; w decyzji nie występuje ilość danych, stan bufora, budżet energii ani domknięcie łącza; a okna kontaktów są danymi wejściowymi -- ich geometria jest taka, jaką wytworzyło to, co je wygenerowało (scenariusz <c1/> emituje to samo słownictwo aos_s / los_s). To nie jest produkt do planowania segmentu naziemnego (komentarz w pliku scenariusza, wiersze { "18" } do { "24" })

seg-0b7f8d86e5d5 = Cykl pracy apertury między nawigacją a łącznością jest MODELLED, nie jest sprawdzony względem niezależnego wzorca: sprawdzony względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-dbbefaba93dc = <s1>Poprzedni</s1>aocs

seg-5b4fd889fdff = <s1>Następny</s1>araim-reference-check
