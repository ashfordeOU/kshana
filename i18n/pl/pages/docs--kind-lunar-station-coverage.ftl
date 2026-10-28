# docs--kind-lunar-station-coverage: translations (pl)

seg-9feefecdcf67 = rafs

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-6f4246bd8f6f = <b>MODELLED</b> Różnicowa stacja referencyjna klasy NovaMoon: znoszenie błędów wspólnych + reszta rosnąca z bazą + poziomy ochrony DGNSS. Wyrocznia (InternalConsistency): tożsamość znoszenia błędów różnicowych + ponowne użycie mechanizmu PL SBAS z DO-229E; rozwiązanie z różnicą pojedynczą + WLS sprawdzono dodatkowo względem lsq()/matinv() z RTKLIB (Takasu, BSD-2-Clause, skompilowany kod C) — niezależny kod solwera, ale ta sama algebra pierwszego rzędu różnicy LOS, więc nadal InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> Trzy składniki, które poprawka różnicowa zbiera między epoką, w której ją obliczono, a epoką, w której ją użyto, każdy dotąd pozostawiony jako niezamodelowany zapas:. Wyrocznia (InternalConsistency): tożsamości w postaci zamkniętej i samospójność: wariancja kwantyzatora jednostajnego step²/12, dokładna propagacja kowariancji (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ sprowadzająca się do σ·PDOP dla równych σ, przeniesienie składnika pomiaru { "1" }:{ "1" } jako konsekwencja û_user ≈ û_ref oraz domknięcie kwadraturowe przy wyłączaniu. Sprawdzenie PDOP względem orbit::dop dzieli macierz normalną [−û, { "1" }], więc jest sprawdzeniem spójności i tak je oznaczono, a nie jako niezależne

seg-7171b2e3f29d = Księżycowy różnicowy PNT ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Księżycowy różnicowy PNT — budżet reszt łącza poprawek ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Strona tematu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-f3231c08fa26 = Źródło: <c1/>

seg-1a28838279fe = <c1/> (rodzaj scenariusza)

seg-f7ea776e70c9 = Modelowane pokrycie księżycowej stacji referencyjnej: przegląd Monte Carlo modelu księżycowego różnicowego PNT po siatce użytkowników na biegunie południowym i dobie epok. Różnicowa stacja referencyjna w znanym miejscu przy biegunie południowym koryguje wskazaną konstelację (ilustracyjną keplerowską lub tabelaryczne efemerydy) ze wskazanym błędem sygnału w przestrzeni, błędem pomiaru położenia, opóźnieniem poprawek i kwantyzacją łącza; dla każdego punktu i dla regionu podaje percentylowy błąd pozycji skorygowanej i nieskorygowanej (3-D, poziomy, pionowy), dostępność, pokrycie względem wskazanego progu, poziomy ochrony DO-229E, promień pokrycia na azymut oraz bilans łącza poprawek przy stacji i w najgorszym punkcie. Nie jest to stwierdzenie o parametrach żadnego rzeczywistego systemu; bez powiązań z żadną agencją ani jej poparcia. MODELLED.

seg-d18c93c2e136 = Jeden przebieg <c1/> podsumowuje się tak: lunar-station-coverage | { "346" } punktów x { "144" } epok x { "200" } prób | dostępność { "92.2" } % | pokrycie { "76.5" } % (p95 <= { "20" } m) | skorygowany p95 3-D { "15.592" } m (nieskorygowany { "1056.892" } m) | HPL max { "480.385" } m | MODELLED; to nie jest stwierdzenie o żadnym rzeczywistym systemie

seg-cb73ac0d57de = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>

seg-0c3460704315 = Przykład <c1/> ustawia między innymi:

seg-2d84b341a41f = Etykieta wyniku (silnika): MODELLED

seg-922b8656fcae = Wykres, który silnik zapisuje dla scenarios/lunar-station-coverage.toml, rodzaj lunar-station-coverage

seg-4f5941f12127 = <b>MODELLED</b> Przegląd Monte Carlo modelu księżycowego różnicowego PNT po siatce użytkowników na biegunie południowym i dobie epok (rodzaj <c1/>): dla różnicowej stacji referencyjnej w znanym miejscu przy biegunie południowym, dla każdego punktu i dla regionu, Testy: <a1>lunar_station_coverage_reference.rs</a1>.

seg-d547d600ee2d = <b>MODELLED</b> Przegląd Monte Carlo modelu księżycowego różnicowego PNT po siatce użytkowników na biegunie południowym i dobie epok (rodzaj <c1/>): dla różnicowej stacji r. Wyrocznia (InternalConsistency): arytmetykę obliczono ponownie niezależnym skryptem numpy na wyeksportowanych przypadkach (scripts/gen_lunar_station_ref.py, numpy { "2.5.4" }; wstępnie zarejestrowane w tests/fixtures/lunar_station/PREREGISTRATION.md, zatwierdzone samodzielnie w 9caedf97 przed pierwszym przebiegiem): w { "20" } przypadkach ze wszystkimi składnikami błędu włączonymi zbiory widocznych satelitów i status są identyczne, surowe błędy odległości zgadzają się do { "1.4e-14" } m, wektory i wielkości błędu pozycji do { "1.4e-9" } m wzgl

seg-626ab55f0424 = MODELLED (wynik <c1/>)

seg-6f09def22469 = RZETELNOŚĆ: MODELLED. Przy podanych poniżej założeniach model daje te wartości. Nie jest to stwierdzenie o parametrach żadnego rzeczywistego systemu; bez powiązań z żadną agencją ani jej poparcia; bez deklaracji TRL ani dorobku. Pominięto: zasłanianie terenem i horyzontem na biegunie (pierwsze ograniczenie), wielodrogowość, sprzęt odbiornika. (komentarz w pliku scenariusza, wiersze { "15" } do { "18" })

seg-db27cc015952 = Mapa pokrycia i dokładności księżycowej stacji referencyjnej ma poziom MODELLED, nie jest niezależnie sprawdzona względem wzorca zewnętrznego: sprawdzono ją względem jej własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Poprzedni</s1>lunar-llr-datum

seg-625c1973128e = <s1>Następny</s1>lunar-time-budget

seg-bf7d64a925dd = <s1>Poprzedni</s1>lunar-orbit-rendezvous

seg-0525bddd21ee = <s1>Następny</s1>lunar-surface
