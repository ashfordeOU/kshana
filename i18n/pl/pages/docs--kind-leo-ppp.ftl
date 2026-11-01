# docs--kind-leo-ppp: translations (pl)

seg-37d29d8303fe = km

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Strona tematu: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-8f0aab32310b = Źródło: <c1/>

seg-c9852d3b79c8 = <c1/> (rodzaj scenariusza)

seg-32a570f1a4fa = Zbieżność precyzyjnego pozycjonowania punktowego (PPP) tylko z GNSS i ze wspomaganiem LEO: zmiennoprzecinkowy rozszerzony filtr Kalmana na kodzie i fazie nośnej wolnych od jonosfery, ze statycznymi współrzędnymi stacji, białym zegarem odbiornika, jednym biasem międzysystemowym na każdy dodatkowy system, zenitalnym opóźnieniem wilgotnym o błądzeniu losowym odwzorowanym przez 1/sin(elewacja) i zmiennoprzecinkową niejednoznaczością na łuk satelity; błąd precyzyjnej orbity i zegara jest biały i wspólny dla kodu i fazy satelity, więc każdy satelita jest jedną skorelowaną dwuwierszową aktualizacją w postaci stabilizowanej Josepha. Pomiary są symulowane z tego samego modelu z szumem z ziarnem (seed) dla kilku miejsc i ziaren, a każdy przypadek (najpierw tylko GNSS, potem każdy [[case]] systemów LEO, dowolna konstelacja lub ustawienie wstępne) podaje medianę czasu zbieżności (pierwsza epoka, po której błędy poziome i pionowe pozostają poniżej progów, domyślnie { "10" } cm), odsetek zbieżnych, mediany krzywych błędu oraz spójność filtra (uśredniony po przebiegach NEES położenia względem dwustronnego pasma chi-kwadrat { "95" }%). Opcjonalnie obok opublikowanych wartości Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2) dla średnich szerokości: { "9.6" } min dla multi-GNSS skraca się do { "7.0" }, { "3.2" }, { "2.1" } i { "1.3" } min z { "60" }, { "96" }, { "192" } i { "288" } satelitami LEO. MODELLED: porównanie spójności trendu, a nie odtworzenie konstelacji, szumu ani stacji z tamtego badania; bez rozwiązywania niejednoznaczności, poślizgów cyklu, wind-up fazy, pływów ani skorelowanych w czasie błędów produktów.

seg-8126f4edf6b6 = Jeden przebieg <c1/> podsumowuje się tak: PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Przykład <c1/> ustawia między innymi:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Etykieta wyniku (silnika): MODELLED zmiennoprzecinkowe PPP (kod i faza wolne od jonosfery, biały zegar, opóźnienie wilgotne o błądzeniu losowym, zmiennoprzecinkowe niejednoznaczności na łuk) na symulowanych pomiarach z tego samego modelu; wartości Li et al. ({ "2019" }) to porównanie trendu, a nie odtworzenie

seg-225ef04c64af = Wykres zapisany przez silnik dla scenarios/leo-ppp-convergence.toml, rodzaj leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Zmiennoprzecinkowy rozszerzony filtr Kalmana PPP na kodzie i fazie wolnych od jonosfery: współrzędne statyczne, biały zegar odbiornika, jeden bias międzysystemowy na każdy dodatkowy system, zenitalne opóźnienie wilgotne o błądzeniu losowym odwzorowane przez 1/sin(elewacja), zmiennoprzecinkowa niejednoznaczność na satel Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Zmiennoprzecinkowy rozszerzony filtr Kalmana PPP na kodzie i fazie wolnych od jonosfery: współrzędne statyczne, biały zegar odbiornika, jeden bias międzysystemowy na każdy dodatkowy system, błądz. Wyrocznia (ExternalDataset): test chi-kwadrat NEES jest kontrolą spójności wewnętrznej (prawda i filtr dzielą model). Trend porównano z Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min skraca się do { "7.0" }, { "3.2" }, { "2.1" } i { "1.3" } min z { "60" }, { "96" }, { "192" } i { "288" } satelitami LEO. Dołączony scenariusz daje { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } i { "2.3" } min z i

seg-302365809dbf = MODELLED zmiennoprzecinkowe PPP (kod i faza wolne od jonosfery, biały zegar, opóźnienie wilgotne o błądzeniu losowym, zmiennoprzecinkowe niejednoznaczności na łuk) na symulowanych pomiarach z tego samego modelu; wartości Li et al. ({ "2019" }) to porównanie trendu, a nie odtworzenie (wynik <c1/>)

seg-6ce77bce8946 = MODELLED: porównanie spójności trendu, a nie odtworzenie konstelacji, szumu ani stacji z tamtego badania; bez rozwiązywania niejednoznaczności, poślizgów cyklu, wind-up fazy, pływów ani skorelowanych w czasie błędów produktów. (katalog rodzajów (<c1/>))

seg-ba2fd25fdcff = Cztery tutejsze konstelacje LEO to reprezentatywne powłoki Walkera typu delta na { "1000" } km i { "60" } deg z { "60" }, { "96" }, { "192" } i { "288" } satelitami; NIE są to projekty z artykułu, a szum, stacje i definicja zbieżności (błędy poziome i pionowe poniżej { "10" } cm do końca przebiegu) pochodzą z tego modelu. Porównanie jest więc MODELLED kontrolą spójności trendu: zbieżność musi się skracać monotonicznie wraz z t (komentarz w pliku scenariusza, wiersze { "10" } do { "14" })

seg-b641b835570c = Zbieżność precyzyjnego pozycjonowania punktowego tylko z GNSS i ze wspomaganiem LEO jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Poprzedni</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Następny</s1>leo-pvt
