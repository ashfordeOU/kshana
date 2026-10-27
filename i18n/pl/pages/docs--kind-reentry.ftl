# docs--kind-reentry: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-3a3ee499961e = <b>MODELLED</b> Planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez atmosferę US Standard Atmosphere { "1976" } (gęstość i ciśnienie), z kopnięciem pochylenia, ciągiem zmniejszonym o przeciwciśnienie dyszy, wypaleniami stopni przy dokładnych s

seg-8e62cc4af6ea = Strona tematu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-05ce408c2dbb = kg/m^{ "2" }

seg-195347c63a8a = m/s^{ "2" }

seg-c95aec0d2943 = Źródło: <c1/>

seg-91424dc65b3e = <c1/> (rodzaj scenariusza)

seg-039f77066d97 = Balistyczny korytarz wejścia w atmosferę Allena-Eggersa: szczytowe opóźnienie (niezależne od współczynnika balistycznego, V_e^{ "2" } sin|γ|/(2eH)), prędkość i wysokość w punkcie szczytowego przeciążenia oraz prędkość szczytowego nagrzewania, dla prędkości wejścia, kąta toru lotu i współczynnika balistycznego w atmosferze wykładniczej, plus planarne całkowanie punktu materialnego tego samego wejścia balistycznego z grawitacją, krzywizną Ziemi i Atmosferą Standardową USA { "1976" } (szczytowe opóźnienie, prędkość, wysokość i czas w punkcie szczytu). Wejście balistyczne (bez siły nośnej) MODELLED; wynik nagrzewania to PRĘDKOŚĆ szczytowego nagrzewania, a nie strumień ciepła (bez modelu aerotermicznego ani TPS).

seg-9908d06c50eb = Jeden przebieg <c1/> podsumowuje się tak: reentry (Allen–Eggers): V_e { "7800" } m/s, γ { "6.0" }° -> szczyt { "16.6" } g na { "49" } km, { "4731" } m/s; nagrzewanie osiąga szczyt przy { "6603" } m/s; punkt materialny (grawitacja, krzywizna, US76) szczyt { "16.4" } g (balistyczne MODELLED, bez aerotermiki)

seg-f057c2a160e7 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-576245fd5b70 = Przykład <c1/> ustawia między innymi:

seg-0b7769c97ff3 = Etykieta wyniku (silnika): MODELLED — wejście balistyczne (bez siły nośnej) Allena-Eggersa, wykładnicza atmosfera izotermiczna, stały kąt toru lotu; szczytowe przeciążenie nie zależy od współczynnika balistycznego; nagrzewanie to PRĘDKOŚĆ szczytowego nagrzewania, NIE strumień ciepła (bez modelu aerotermicznego ani TPS)

seg-b0109481e8ff = Wykres zapisany przez silnik dla scenarios/reentry.toml, rodzaj reentry

seg-c860b8679b47 = <b>MODELLED</b> Szczytowe opóźnienie (niezależne od współczynnika balistycznego), prędkość i wysokość w punkcie szczytowego przeciążenia oraz prędkość szczytowego nagrzewania dla wejścia balistycznego w atmosferze wykładniczej. Testy: <a1>reentry_point_mass_accelerometer_oracle.rs</a1>.

seg-84abc0b9f859 = <b>MODELLED</b> Szczytowe opóźnienie (niezależne od współczynnika balistycznego), prędkość i wysokość w punkcie szczytowego przeciążenia oraz prędkość szczytowego nagrzewania dla wejścia balistycznego w atmosferze wykładniczej. Uruchamialne. Wyrocznia (InternalConsistency): analityczne wejście Allena-Eggersa w postaci zamkniętej, dodatkowo skontrolowane krzyżowo względem numerycznego całkowania scipy { "1.18" } solve_ivp (DOP853) TEGO SAMEGO równania różniczkowego wejścia z samym oporem (tests/ballistic_re_entry_corridor_reference.rs, { "36" } przypadków, najgorsze względne a_max { "2.9e-9" }) — kontrola całki numerycznej względem własnej postaci analitycznej, więc nadal InternalConsistency, NIE walidacja zewnętrzna. Balistyczne (bez siły nośnej) MODELLED, bez aerotermiki ani TPS — wynik nagrzewania to prędkość

seg-8b9d3db5d563 = MODELLED — wejście balistyczne (bez siły nośnej) Allena-Eggersa, wykładnicza atmosfera izotermiczna, stały kąt toru lotu; szczytowe przeciążenie nie zależy od współczynnika balistycznego; nagrzewanie to PRĘDKOŚĆ szczytowego nagrzewania, NIE strumień ciepła (bez modelu aerotermicznego ani TPS) (wynik <c1/>)

seg-82de2275c919 = Wejście balistyczne (bez siły nośnej) MODELLED; wynik nagrzewania to PRĘDKOŚĆ szczytowego nagrzewania, a nie strumień ciepła (bez modelu aerotermicznego ani TPS). (katalog rodzajów (<c1/>))

seg-080b28422342 = RZETELNY ZAKRES: balistyczne (bez siły nośnej) MODELLED, wykładnicza atmosfera izotermiczna, stały kąt toru lotu. Bez modelu aerotermicznego ani TPS -- wynik nagrzewania to PRĘDKOŚĆ szczytowego nagrzewania, a nie strumień ciepła. To nie jest trajektoria 3-/6-DoF. Uruchomienie: kshana scenarios/reentry.toml (komentarz w pliku scenariusza, wiersze { "8" } do { "11" })

seg-cfc345f0dc0d = Balistyczny korytarz wejścia w atmosferę (Allen–Eggers) jest MODELLED, nie sprawdzony względem niezależnego wzorca zewnętrznego: sprawdzony względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a4b7c16e3fea = <s1>Poprzednia</s1>realtime-frame-eop

seg-6166a1c21525 = <s1>Następna</s1>slot-timing
