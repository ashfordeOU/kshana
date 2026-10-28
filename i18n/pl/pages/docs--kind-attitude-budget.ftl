# docs--kind-attitude-budget: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-40ca4197150b = Źródło: <c1/>

seg-a271f371a3cf = <c1/> (rodzaj scenariusza)

seg-62c0dda9fc56 = Budżet błędu orientacji i wskazywania 3-DOF: najgorszy przypadek momentu zakłócającego od gradientu grawitacji ((3/2)(μ/R³)ΔI) oraz budżet błędu wskazywania metodą pierwiastka z sumy kwadratów dla nazwanych składników 1σ (szum czujników, drgania kół reakcyjnych, termiczne, osiowanie) z wiodącym składnikiem, dla wysokości orbity i rozrzutu bezwładności korpusu. Skalarny budżet AOCS MODELLED — uzupełnienie przed powstaniem sprzętu dla Basilisk/42, a nie symulacja pętli sterowania / 6-DoF / drgań giętnych.

seg-9fdc45a8aaa3 = Jeden przebieg <c1/> podsumowuje się tak: attitude-budget: { "600" } km, ΔI { "40" } kg·m² -> moment GG { "7.04e-5" } N·m; wskazywanie { "10.7" }" RSS (dominuje: reaction_wheel_jitter) (skalarny budżet MODELLED)

seg-7cf112b1bcc3 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-91ebbc89f9bb = Przykład <c1/> ustawia m.in.:

seg-c33e3cbba749 = arcsec

seg-36df1bc710ab = osiowanie

seg-d45f0ee66587 = kg*m^{ "2" }

seg-3e3ce4fa89aa = N*m

seg-0a78a7d6f93f = Etykieta wyniku (silnika): MODELLED — skalarny budżet błędu AOCS 3-DOF: najgorszy przypadek momentu zakłócającego od gradientu grawitacji + budżet wskazywania RSS; to NIE jest symulacja pętli sterowania / 6-DoF / drgań giętnych (uzupełnienie przed powstaniem sprzętu dla Basilisk/42, a nie jego zamiennik)

seg-ad0e72e3b688 = Wykres zapisywany przez silnik dla scenarios/attitude-budget.toml, rodzaj attitude-budget

seg-95b159fb5e68 = <b>VALIDATED</b> Najgorszy przypadek momentu zakłócającego od gradientu grawitacji ((3/2)(μ/R³)ΔI) jako szczyt po orientacji (twierdzenie sprawdzone względem niezależnego wzorca), plus budżet błędu wskazywania RSS dla nazwanych składników 1σ z wiodącym składnikiem (suma kwadratowa liczb podanych przez wywołującego Testy: <a1>attitude_gg_torque_reference.rs</a1>.

seg-f7c8d8994896 = <b>VALIDATED</b> Najgorszy przypadek momentu zakłócającego od gradientu grawitacji ((3/2)(μ/R³)ΔI) jako szczyt po orientacji (twierdzenie sprawdzone względem niezależnego wzorca), plus budżet błędu wskazywania RSS dla nazwanych składników 1σ . Wyrocznia (ExternalDataset): Basilisk { "2.9.1" } GravityGradientEffector (AVSLab, ISC), niezależna implementacja w C++ momentu od gradientu grawitacji z pełnym tensorem: szczyt Kshana (3/2)(μ/R³)ΔI równa się momentowi Basilisk przy orientacji { "45" } deg z dokładnością { "1e-12" } względnie (najgorszy { "2.1e-15" }) dla { "5" } wysokości i { "8" } tensorów bezwładności oraz ogranicza moment Basilisk dla { "2000" } losowych orientacji w każdym przypadku; tolerancja ustalona przed porównaniem. Twierdzenie sprawdzone względem niezależnego wzorca: gradient grawitacji-

seg-d2a6cf813e95 = <b>PARTNER</b> Nie zapewnia się — Kshana jest symulatorem osiągów nawigacyjnych, a nie producentem platform satelitarnych. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-3895121a5466 = MODELLED — skalarny budżet błędu AOCS 3-DOF: najgorszy przypadek momentu zakłócającego od gradientu grawitacji + budżet wskazywania RSS; to NIE jest symulacja pętli sterowania / 6-DoF / drgań giętnych (uzupełnienie przed powstaniem sprzętu dla Basilisk/42, a nie jego zamiennik) (wynik <c1/>)

seg-f62458cae23b = Skalarny budżet AOCS MODELLED — uzupełnienie przed powstaniem sprzętu dla Basilisk/42, a nie symulacja pętli sterowania / 6-DoF / drgań giętnych. (katalog rodzajów (<c1/>))

seg-333fca11ac0c = UCZCIWY ZAKRES: skalarny budżet błędu MODELLED -- uzupełnienie przed powstaniem sprzętu dla Basilisk/42, a NIE symulacja pętli sterowania / 6-DoF / drgań giętnych. Składnik gradientu grawitacji jest podawany jako moment (przełożenie go na wskazywanie wymaga sztywności sterowania, którą zapewnia wywołujący); budżet jest sumą kwadratową dostarczonych składników 1-sigma. Uruchomienie: kshana scenarios/attitude-budget.toml (komentarz w pliku scenariusza, wiersze { "8" } do { "13" })

seg-0e27fcef1499 = <s1>Poprzedni</s1>ascent-losses

seg-946c453cbf0f = <s1>Następny</s1>body-pnt

seg-a349aa76b0ed = PARTNER
