# docs--kind-aocs: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-5cd8b3d8c098 = Źródło: <c1/>

seg-7f2ade997df5 = <c1/> (rodzaj scenariusza)

seg-7eff466eb018 = Kontrola orientacji statku kosmicznego: obrót w inercjalnym kierunku wskazywania sztywnego korpusu z trzema lub więcej zrównoważonymi kołami reakcyjnymi ze sprzężeniem zwrotnym MRP (L = -K sigma - P omega), momenty kół o minimalnej normie obcięte do limitu każdego silnika, RK4 z ekstrapolatorem zerowego rzędu; opcjonalnie domknięte na multiplikatywnym EKF z symulowanego żyroskopu (błądzenie losowe kąta i prędkości) i czujnika gwiazd. Podaje czas ustalania, końcowy i szczytowy błąd wskazywania, szczytową prędkość i moment koła, nasyconą frakcję, dryf momentu pędu oraz, z estymatorem, jego błąd orientacji i NEES. Pętla stanu rzeczywistego jest VALIDATED względem Basilisk { "2.9.1" }; estymator jest MODELLED.

seg-a499721d08b1 = Jeden przebieg <c1/> podsumowuje się tak: aocs: { "4" } kół, obrót { "600" } s z { "82.06" } deg -> ustala się poniżej { "0.1" } deg po { "481.0" } s | końcowy { "2.37e-2" } deg | szczytowa prędkość koła { "1797" } rpm | pętla stanu rzeczywistego

seg-2ad4d3f07a6a = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-ed0c5c6266d9 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-a09eb69b36d7 = Przykład <c1/> ustawia m.in.:

seg-8b51cfcf5bd5 = N m

seg-6876b0214e4c = N m s

seg-8e4dea0df19e = kg m^{ "2" }

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-b054c73f22e5 = brak wartości

seg-6e22c97374b0 = Etykieta wyniku (silnika): prawo sterowania i dynamika kół VALIDATED (względem Basilisk { "2.9.1" } na pętli stanu rzeczywistego); dane wejściowe tego przebiegu są własnymi danymi scenariusza — kontrola orientacji kołami reakcyjnymi ze sprzężeniem zwrotnym MRP, wskazywanie inercjalne, bez szumu czujników, bez tarcia

seg-08c624d5324d = Wykres zapisywany przez silnik dla scenarios/aocs-slew.toml, rodzaj aocs

seg-67fb8ac75f36 = MODELLED { "1" } · VALIDATED { "1" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-d69a588facf1 = <b>VALIDATED</b> Kontrola orientacji sztywnego korpusu z trzema lub więcej zrównoważonymi kołami reakcyjnymi na kierunku inercjalnym: prawo sprzężenia zwrotnego MRP L_r = -K sigma_BR - P omega_BR (Schaub i Junkins), momenty silników kół o minimalnej normie G_s u = -L_r obcięte do l Testy: <a1>aocs_basilisk_oracle.rs</a1>.

seg-7bc495b05d9a = <b>MODELLED</b> Multiplikatywny EKF Lefferts-Markley-Shuster: stany błędu orientacji w układzie korpusu i biasu żyroskopu, propagacja z prędkością żyroskopu pomniejszoną o estymatę biasu i dyskretnym szumem procesu Farrenkopfa (błądzenie losowe kąta i prędkości), aktualizacja z czujnika gwiazd

seg-7e3e0dcc936f = <b>VALIDATED</b> Kontrola orientacji sztywnego korpusu z trzema lub więcej zrównoważonymi kołami reakcyjnymi na kierunku inercjalnym: prawo sprzężenia zwrotnego MRP L_r = -K sigma_BR - P omega_BR (Schaub i J. Wyrocznia (ExternalDataset): Basilisk { "2.9.1" } (AVSLab, ISC; przebieg bsk uruchamiany jako osobne narzędzie, nigdy nie linkowany ani nie włączany do kodu): korpus statku, reactionWheelStateEffector (BalancedWheels, limit momentu włączony), simpleNav, inertial3D, attTrackingError, mrpFeedback (bez członu całkującego) i rwMotorTorque przy dt = { "0.1" } s z własnym RK4, w porównaniu z implementacją samego Kshana na trzech przypadkach (trzy prostopadłe koła; piramida czterech kół; przypadek z nasyceniem czterech kół),

seg-d7889856073b = <b>MODELLED</b> Multiplikatywny EKF Lefferts-Markley-Shuster: stany błędu orientacji w układzie korpusu i biasu żyroskopu, propagacja z prędkością żyroskopu pomniejszoną o estymatę biasu i dyskretnym szumem procesu Farre. Wyrocznia (InternalConsistency): Spójność wewnętrzna: znormalizowany kwadrat błędu estymacji filtra względem stanu rzeczywistego symulowanego z tych samych modeli czujników po ziarnach Monte Carlo oraz zbieżność estymat orientacji i biasu. CZEGO NIE OBEJMUJE: nie porównano z żadnym zewnętrznym estymatorem ani danymi lotnymi (Basilisk { "2.9.1" } nie ma modułu MEKF); modele czujników są podręcznikowe, bez niewspółosiowości, współczynnika skali ani efektów pola widzenia czujnika gwiazd.

seg-3b71575e0c23 = Pętla stanu rzeczywistego jest VALIDATED względem Basilisk { "2.9.1" }; estymator jest MODELLED. (katalog rodzajów (<c1/>))

seg-c7ff0ddbd040 = Multiplikatywna estymacja orientacji EKF z żyroskopu i czujnika gwiazd jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-cc4e7274d409 = Strona tematu: <a1>AOCS.md</a1>

seg-b022bad77259 = <s1>Poprzedni</s1>acm-link

seg-1fb6e680fd4a = <s1>Następny</s1>aperture-duty-cycle
