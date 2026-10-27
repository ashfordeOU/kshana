# docs--lunar-infrastructure: translations (pl)

seg-cae10fb9bff8 = Scenariusz

seg-61817375c8ea = Orbita i powierzchnia Księżyca jako infrastruktura nawigacyjna i geodezyjna

seg-9872e31ebd72 = Źródła

seg-922905241a6b = Źródło: <c1/>

seg-bfb9c5efbe57 = Rodzaj scenariusza <c1/>, pięć badań wybieranych przez <c2/>. <b>MODELLED</b>: ograniczony model trzech ciał z podanymi uproszczeniami i danymi wejściowymi ILLUSTRATIVE. Obliczenia numeryczne są sprawdzone niezależnymi programami numpy/scipy; nic nie jest porównywane z pomiarem żadnej wielkości księżycowej i nic tu nie jest stwierdzeniem o jakiejkolwiek misji ani systemie. Brak powiązań z jakąkolwiek agencją i brak jej poparcia. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt z zatwierdzeniem typu. Kshana niczego nie nadaje i nie steruje żadnym sprzętem.

seg-7908583855a2 = Projekty, dane wejściowe i progi zostały ustalone w <c1/> (zatwierdzonym przed oceną jakiegokolwiek badania) oraz w dwóch ujawnionych poprawkach (<c2/>). Wynik każdego progu znajduje się w <c3/>.

seg-d9d9d0864ae0 = Badanie

seg-3b01a756c305 = Co oblicza

seg-a4ef7c81b35f = Pokładowe wyznaczanie orbity z użyciem Earth-GNSS na orbicie NRHO (lub <c1/>) względem niezależnego naziemnego wyznaczania orbity z pomiarów odległości i prędkości zmiany odległości z trzech stacji DSN; formalna kowariancja każdej estymaty; ziarnowy Monte Carlo sprawdzający, czy obie kowariancje wyjaśniają swoją różnicę (q, chi-kwadrat z { "6" } stopniami swobody); wstrzyknięte niemodelowane przyspieszenie

seg-849c67471e69 = <c1/> (szybki), <c2/> (oceniany, około ośmiu minut)

seg-b9c6eb8d778c = Wspólna faza nośnej z podwójnymi różnicami dla stacji powierzchniowej i orbitera; kowariancja niejednoznaczności float; LAMBDA; powodzenie metodą bootstrap i Monte Carlo; sigma położenia float i fixed

seg-74c347e0bc69 = Informacja Fishera 7-parametrowego układu księżycowego z pomiarów odległości ze stacji ziemskich, z pomiarami odległości orbiter–stacja powierzchniowa i bez nich; ziarnowe losowe zbiory stacji

seg-4ed875c39781 = GNSS, VLBI i pomiary laserowe odległości na jednym statku kosmicznym: precyzja Cramera–Rao przesunięć między technikami względem błędu lokalnego powiązania

seg-de25104c09a2 = Informacja o h2, k2, l2 i libracji fizycznej z pomiarów laserowych odległości, śledzenia orbitera, grawimetru i zegara powierzchniowego (stałe wspólne z modułami czasu księżycowego)

seg-18fc4ba766df = Spójność pokładowego wyznaczania orbity z użyciem Earth-GNSS na prawie prostoliniowej orbicie halo z niezależnym naziemnym wyznaczaniem orbity, z prawdziwych przebiegów silnika v{ $version } na scenarios/lunar-infrastructure-od-consistency.toml oraz wariancie z błędem modelu ({ "400" } prób każdy). Średnia znormalizowana różnica q wynosi { "5.81" } bez błędu modelu i { "5.95" } ze wstrzykniętym błędem przyspieszenia { "3e-10" } m/s2, przy oczekiwanej wartości { "6" }: oba rozwiązania orbity są spójne (próg C1 MET). Odsetek prób powyżej punktu { "95" } % wynosi { "0.040" } i { "0.052" }; próg wykrycia wstrzykniętego błędu wynosił co najmniej { "0.5" }, więc jest NOT MET (C3): rozwiązanie pokładowe jest znane z dokładnością około { "352" } m wobec { "23" } m dla naziemnego, więc dziesięciometrowe przesunięcie ukrywa się w jego kowariancji. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i poglądowymi danymi wejściowymi, nie pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-4c08262e2556 = Ustalanie całkowitoliczbowej niejednoznaczności fazy nośnej między księżycowymi stacjami powierzchniowymi a orbiterem, z zatwierdzonego wyniku ocenianego przebiegu silnika v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } długości łuków, po { "400" } losowań Monte Carlo każda, zapisane przez scenarios/carrier-phase-scored.toml). { "1" } doba: powodzenie { "1.0" } % (błąd standardowy { "0.5" } %), { "134" } niejednoznaczności, sigma położenia orbitera { "45.6" } m dla float i { "18.5" } m dla fixed; { "2" } doby: powodzenie { "0.5" } % (błąd standardowy { "0.4" } %), { "259" } niejednoznaczności, sigma położenia orbitera { "21.5" } m dla float i { "8.7" } m dla fixed; { "3" } doby: powodzenie { "2.8" } % (błąd standardowy { "0.8" } %), { "375" } niejednoznaczności, sigma położenia orbitera { "6.3" } m dla float i { "2.1" } m dla fixed. Ustalenie wartości całkowitych nie zostaje osiągnięte: powodzenie pozostaje między { "1" } % a { "3" } % przy { "25" } dBi, a przy zarejestrowanych { "12" } dBi zadania nie da się sformułować. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i poglądowymi danymi wejściowymi, nie pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-7e5b10641b20 = Precyzja siedmioparametrowego układu księżycowego (trzy przesunięcia, skala i trzy obroty) z pomiarów odległości ze stacji ziemskich, z pomiarami odległości orbiter–stacja powierzchniowa i bez nich, z prawdziwego przebiegu silnika v{ $version } na scenariuszu scenarios/lunar-infrastructure-frame-coestimation.toml. Sigma Cramera–Rao przesunięć i obrotów maleje dzięki łączom orbitera (na przykład t_z z { "0.98" } m do { "0.046" } m); najmniejsza wartość własna informacji rośnie 111-krotnie, a ślad CRLB spada do { "1.0" } % (próg F3 MET). Zakłada to, że orbita jest znana w osiach księżycowych, a jej błąd jest niesiony przez sigmę odległości orbitera równą { "1" } m. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i poglądowymi danymi wejściowymi, nie pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-377d29dcc6e8 = Precyzja przesunięć między położeniami z pomiarów laserowych, VLBI i GNSS jednego statku kosmicznego, względem błędu naziemnego lokalnego powiązania, z prawdziwego przebiegu silnika v{ $version } na scenariuszu scenarios/lunar-infrastructure-space-tie.toml (jeden łuk 6.56-dobowy, sigmy technik: GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Przy lokalnym powiązaniu od { "1" } mm do { "1" } m sigma przesunięcia laser minus GNSS pozostaje bliska { "1.04" } m, aż powiązanie osiągnie { "1" } m: jest ograniczona szumem pomiarowym technik, a nie lokalnym powiązaniem. Dolna granica wyznaczona samym powiązaniem to pierwiastek z dwóch razy jego sigma. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i poglądowymi danymi wejściowymi, nie pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-9d507a371319 = Która rodzina obserwabli jest wrażliwa na liczby Love'a Księżyca h2, k2 i l2, z prawdziwego przebiegu silnika v{ $version } na scenariuszu scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Każda komórka to średniokwadratowa pochodna cząstkowa obserwacji danej rodziny względem parametru, we własnych jednostkach tej rodziny (więc komórki porównuje się w obrębie wiersza, a nie kolumny); kreska oznacza, że rodzina nie wykazuje wrażliwości. pomiary laserowe odległości: h2 { "7.6" }, k2 brak, l2 { "9.8" }. śledzenie orbitera: h2 brak, k2 { "0.00086" }, l2 brak. grawimetr powierzchniowy: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 brak. zegar powierzchniowy: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 brak. Przy wszystkich czterech rodzinach sigma Cramera–Rao wynosi { "0.36" } % nominalnego h2, { "0.52" } % k2 i { "1.16" } % l2. Dodanie rodziny nigdy nie obniżyło najmniejszej wartości własnej ({ "28" } z { "28" } dodań), ale ślad pseudoodwrotności nie był większy tylko w { "16" } z { "28" }: ta połowa progu G3 jest NOT MET. Rodzina orbitera widzi całkę wzdłuż linii widzenia z przyspieszenia k2, wartość z górnego krańca. MODELLED: ograniczony model trzech ciał z podanymi uproszczeniami i poglądowymi danymi wejściowymi, nie pomiar żadnej wielkości księżycowej. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-570b9276834b = Podane uproszczenia

seg-ab053aadb65d = Ziemia i Księżyc jako masy punktowe na orbicie kołowej, bez Słońca, bez harmonicznych pola grawitacyjnego Księżyca; oś obrotu Ziemi jest normalną do orbity; układ inercjalny jest równy układowi obracającemu się w t = { "0" }; Księżyc kulisty; synchroniczny układ księżycowy (bez libracji) z wyjątkiem <c1/>; orbita jest przyjmowana jako znana w osiach księżycowych w <c2/> (jej błąd niesie sigma odległości orbitera); rodzina orbitera w <c3/> widzi całkę wzdłuż linii widzenia z przyspieszenia k2 po usunięciu stałej i trendu liniowego, wartość z górnego krańca.

seg-fd644b1f33ec = Kształt raportu

seg-03efc65cbb0e = Każdy raport zawiera <c1/>, <c2/>, <c3/>, <c4/>, pola badania oraz blok <c5/> (jednostkę i klasę pochodzenia dla każdego pola liczbowego). Nie są emitowane żadne szeregi czasowe. Listy pól: blok <c6/> każdego raportu oraz <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine i in., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), użyte jako wartość nominalna. h2 i l2 są punktami linearyzacji, a nie wartościami zweryfikowanymi. Współrzędne stacji DSN to wartości ITRF93 z komentarzy jądra NAIF <c1/>; pasma dokładności DSN odczytano wyłącznie z podsumowań wyszukiwania. Koncepcja space-tie opiera się na publicznych opisach GRASP i ESA Genesis. Pełna tabela, z opisem sposobu odczytu każdej wartości, znajduje się we wstępnej rejestracji.

seg-6cd670ae6eea = Wyniki w skrócie (zob. RESULTS.md)

seg-6334f82991d3 = Niespełnione i przypięte testami, które potwierdzają chybienie: C3 (miara wstrzykniętego błędu nie uruchamia się przy { "3e-10" } m/s2), połowa Q3 dotycząca szybkości bootstrap przy { "1e-9" } oraz połowa G3 dotycząca śladu CRLB. Ustalenie całkowitoliczbowej niejednoznaczności nie zostaje osiągnięte przy zarejestrowanych danych wejściowych. Nic nie jest VALIDATED.

seg-1d3bffc2fd02 = <s1>Poprzednia</s1>Nawigacja użytkowników kosmicznych (gnss-ssv)

seg-90932eed0074 = <s1>Następna</s1>Pozycjonowanie, nawigacja i czas na LEO
