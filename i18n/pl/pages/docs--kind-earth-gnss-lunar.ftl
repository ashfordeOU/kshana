# docs--kind-earth-gnss-lunar: translations (pl)

seg-37d29d8303fe = km

seg-b054c73f22e5 = brak wartości

seg-59afd80736c5 = <b>PARTNER</b> Nie zapewnia się — Kshana modeluje osiągi sygnału, a nie sprzęt ładunku użytecznego / anten. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-9a399fed06c4 = Źródło: <c1/>

seg-886b3796afaa = <c1/> (rodzaj scenariusza)

seg-c8a8be4b8894 = Odbiór Earth-GNSS w odległości księżycowej, warstwa słabego sygnału, którą wymienia artykuł o odporności na konflikt i dla której silnik nie miał modelu. Satelita GNSS kieruje antenę ku Ziemi; odbiornik w pobliżu Księżyca znajduje się około piętnaście razy dalej niż promień orbity, więc działają jednocześnie trzy rzeczy. Ziemia ZASŁANIA OŚ GŁÓWNĄ: z { "26,560" } km rozpina półkąt { "13.9" } deg, więc każdy promień biegnący ku Księżycowi musi opuścić nadajnik co najmniej tyle poza nadirem, co usuwa szczyt wiązki, zanim zostanie obliczona jakakolwiek moc. To, co zostaje, to KRAWĘDŹ GŁÓWNEGO LISTKA I LISTKI BOCZNE, reżim, w którym ładunek LuGRE faktycznie pracował w { "2025" }. A strata w wolnej przestrzeni wynosi około { "208" } dB na L1, czyli mniej więcej { "25" } dB więcej niż płaci użytkownik naziemny. Raport podaje jeden wiersz na satelitę (kąt poza osią, zasłonięcie przez Ziemię, odległość, tłumienie na drodze, wzmocnienie nadawcze pod tym kątem, moc odebrana, stosunek nośnej do gęstości szumu) i agreguje tylko łącza przekraczające próg śledzenia. PODAJE TAKŻE UWARUNKOWANIE, ponieważ to właśnie określa tę warstwę: każdy widoczny satelita leży wewnątrz stożka o szerokości kilku stopni widzianego z Księżyca, więc linie widzenia są niemal równoległe, rozmycie dokładności jest ogromne, a rozwiązanie Earth-GNSS w odległości księżycowej jest obserwacją klasy SYNCHRONIZACJI CZASU znacznie bardziej niż klasy pozycji. MODELLED, a powodem jest wzorzec nadawczy: wzmocnienie pod danym kątem to jednorodna apertura kołowa (Airy), podczas gdy rzeczywista antena GPS L1 jest dwunastoelementową szyką helikalną z ukształtowanym listkiem głównym i listkami bocznymi innymi niż Airy. Zmierzone wzorce istnieją i nie są tutaj dołączone, więc kolejności i rzędy wielkości są znaczące, a dB pojedynczego satelity nie jest. Celowo NIEOBECNE, każde z nich czyni bilans optymistycznym: brak strat jonosferycznych i troposferycznych na promieniach ślizgających się po limbie, brak strat polaryzacji, celowania i implementacji oraz sferyczna Ziemia bez rozszerzenia refrakcyjnego. Położenie Księżyca jest DANĄ WEJŚCIOWĄ (odległość plus kierunek inercjalny), a nie wyszukaniem w efemerydach, ponieważ testowaną wielkością jest łącze i geometria wiązki. Podniesienie tego wiersza do poziomu sprawdzonego względem niezależnego wzorca wymaga zmierzonego wzorca nadawczego i punktów normalnych LuGRE; żadne z nich nie ma się w repozytorium i żadne nie jest tutaj zmyślone.

seg-75b6814c0091 = Jeden przebieg <c1/> podsumowuje się tak: Earth-GNSS w odległości księżycowej — { "24" } satelity, odbiornik w odległości { "384400" } km limb Ziemi widziany z konstelacji: { "13.90" } deg poza nadirem — każdy promień biegnący ku Księżycowi musi to przekroczyć { "22" } z { "24" } niezasłoniętych; { "0" } przekracza próg śledzenia { "25.0" } dB-Hz żadne łącze nie osiąga progu mniej niż dwa śledzone łącza; brak rozrzutu kątowego do podania mniej niż cztery śledzone łącza albo osobliwa geometria: brak DOP PRZEGLĄD po { "64" } epokach / { "43082" } s: dostępność sygnału { "0.375" }, dostępność ROZWIĄZANIA { "0.000" } śledzone łącza średnio { "0.75" }, maks. { "2" }; najlepsze C/N0 { "30.93" } dB-Hz; najlepszy PDOP brak Jako wartość a priori tej warstwy przyjmij dostępność ROZWIĄZANIA, a nie dostępność sygnału: jedno łącze to obserwacja zegara, cztery to pozycja. MODELLED: wzmocnienie nadawcze jest zastępnikiem w postaci jednorodnej apertury (Airy), a nie zmierzoną wiązką GPS, i nie stosuje się żadnej straty atmosferycznej, polaryzacji ani implementacji — więc bilans jest tutaj optymistyczny. Rzędy wielkości i kolejności są znaczące; dB pojedynczego satelity nie jest.

seg-6c0897da2efa = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>

seg-8c6bb203352d = Przykład <c1/> ustawia m.in.:

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-cf1dce5fc824 = Wykres zapisywany przez silnik dla scenarios/earth-gnss-lunar.toml, rodzaj earth-gnss-lunar

seg-04f59a1e2ec2 = <b>MODELLED</b> Odbiór Earth-GNSS w odległości księżycowej: warstwa słabego sygnału, którą wymienia tabela { "1" } P7 i dla której silnik nie miał modelu.

seg-9531f6b14fc8 = <b>MODELLED</b> Odbiór Earth-GNSS w odległości księżycowej: warstwa słabego sygnału, którą wymienia tabela { "1" } P7 i dla której silnik nie miał modelu. Dla każdego satelity i każdej epoki oblicza kąt poza. Wyrocznia (InternalConsistency): Tożsamości w postaci zamkniętej i spójność wewnętrzna; NIE twierdzi się żadnej zewnętrznej wyroczni. Półkąt limbu jest sprawdzany względem asin(R_earth/r_orbit), a geometria względem niego; strata w wolnej przestrzeni, jądro DOP i propagacja SGP4, które to składa, są każde sprawdzone zewnętrznie we własnych wierszach, a ten wiersz nie pożycza ich statusu. DLACZEGO MODELLED, a jest to wzorzec nadawczy: wzmocnienie pod danym kątem to jednorodnie oświetlona

seg-6dfc5503f58f = MODELLED, a powodem jest wzorzec nadawczy: wzmocnienie pod danym kątem to jednorodna apertura kołowa (Airy), podczas gdy rzeczywista antena GPS L1 jest dwunastoelementową szyką helikalną z ukształtowanym listkiem głównym i listkami bocznymi innymi niż Airy. (katalog rodzajów (<c1/>))

seg-c40d3fd8c12e = CO JEST MODELLED, A DLACZEGO NIE JEST VALIDATED Wzmocnienie nadawcze pod danym kątem to jednorodnie oświetlona apertura kołowa — wzorzec Airy. Rzeczywista antena GPS L1 jest dwunastoelementową szyką helikalną, której zmierzony wzorzec ma ukształtowany listek główny, celowo wyniesiony poza oś, aby wyrównać moc na tarczy Ziemi, oraz listki boczne, które w ogóle nie są typu Airy. Zmierzone wzorce są opublikowane; nie są dołączone w tym (komentarz w pliku scenariusza, wiersze { "29" } do { "35" })

seg-01fa469abd95 = Earth-GNSS w odległości księżycowej jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-2fd936b76f4a = <s1>Poprzedni</s1>contact-schedule

seg-95a5aa0adeb3 = <s1>Następny</s1>entry-heating
