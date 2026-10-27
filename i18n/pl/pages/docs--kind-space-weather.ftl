# docs--kind-space-weather: translations (pl)

seg-37d29d8303fe = km

seg-8e845ce908ee = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f6b7ca020692 = Strona rodziny: <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>

seg-95f8bd8e0078 = Źródło: <c1/>

seg-24c21b5b0cc3 = <c1/> (rodzaj scenariusza)

seg-5f25c5b71f0c = Model środowiska pogody kosmicznej: wskaźniki aktywności słonecznej (F10.7/F10.7a) i geomagnetycznej (Kp, z definicyjną tabelą Kp↔ap), temperatura egzosferyczna Jacchia-1971, którą one napędzają (sprawdzona względem niezależnego wzorca zewnętrznego dla opublikowanych wartości w minimum, średniej i maksimum słonecznym), oraz gęstość neutralna termosfery Jacchia-1971 przy średniodobowej temperaturze egzosferycznej wobec statycznego profilu niezależnego od aktywności na zbiorze wysokości — zależność gęstości od cyklu słonecznego, której atmosfera statyczna nie uwzględnia. MODELLED: gęstość zgadza się z gęstościami wyprowadzonymi z akcelerometrów (TOLEOS CHAMP i GRACE) w granicach czynnika { "2" } w maksimum słonecznym, lecz jest około 1.7x zbyt gęsta w minimum słonecznym z { "2008" }.

seg-f2c2860db799 = Jeden przebieg <c1/> podsumowuje się tak: space-weather: F10.7={ "180" } F10.7a={ "165" } Kp={ "4.0" } (ap={ "27" }) -> T_inf={ "1047" } K; gęstość x1.49 na { "300" } km (MODELLED)

seg-6bb05c41eba2 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-c367f1aacd0b = Przykład <c1/> ustawia między innymi:

seg-02dc0d42fb21 = sfu

seg-1dd966268e12 = { "2" } nT

seg-d245f215f331 = Etykieta wyniku (silnika): MODELLED — wskaźniki słoneczne i geomagnetyczne, temperatura egzosferyczna Jacchia-71 i gęstość statyczna Jacchia-71 przy średniodobowej temperaturze

seg-c1c6f2f73fb5 = Wykres zapisany przez silnik dla scenarios/space-weather.toml, rodzaj space-weather

seg-15587da59e8e = <b>MODELLED</b> Wskaźniki słoneczne i geomagnetyczne (definicyjna tabela Kp↔ap), temperatura egzosferyczna Jacchia-1971 oraz gęstość termosfery Jacchia { "1971" } (SAO Special Report { "332" }: statyczne profile dyfuzyjne odtwarzające jego Tabelę { "7" }, z dobowym, geomagne

seg-f8eef6eabfb2 = <b>MODELLED</b> Wskaźniki słoneczne i geomagnetyczne (definicyjna tabela Kp↔ap), temperatura egzosferyczna Jacchia-1971 oraz gęstość termosfery Jacchia { "1971" } (SAO Special Report { "33" }. Wyrocznia (ExternalDataset): definicyjna tabela Kp↔ap + postać zamknięta temperatury egzosferycznej Jacchia-1971 (zgodna do <{ "1" } K z opublikowanymi punktami odniesienia, tests/space_weather_reference.rs); gęstość jest scharakteryzowana względem pymsis NRLMSISE-00 (niezależny model NRL): zmiana w cyklu słonecznym na { "800" } km wynosi 10.4x wobec 13.6x w NRLMSISE-00. Rewizja { "0.30" }: skalibrowany czynnik aktywności pierwszego rzędu zastąpiono modelem Jacchia { "1971" } (gęstość scenariusza domyślnego na { "40" }

seg-72979b637644 = MODELLED — wskaźniki słoneczne i geomagnetyczne, temperatura egzosferyczna Jacchia-71 i gęstość statyczna Jacchia-71 przy średniodobowej temperaturze (wynik <c1/>)

seg-0306ee022298 = MODELLED: gęstość zgadza się z gęstościami wyprowadzonymi z akcelerometrów (TOLEOS CHAMP i GRACE) w granicach czynnika { "2" } w maksimum słonecznym, lecz jest około 1.7x zbyt gęsta w minimum słonecznym z { "2008" }. (katalog rodzajów (<c1/>))

seg-b86a312077b5 = RZETELNY ZAKRES: MODELLED. Konwersja Kp<->ap to definicyjna tabela IAGA, a temperatura egzosferyczna jest sprawdzona względem niezależnego wzorca zewnętrznego dla opublikowanych wielkości w minimum, średniej i maksimum słonecznym, ale poprawka gęstości to SKALIBROWANE sprzężenie PIERWSZEGO RZĘDU wysokości skali — oddaje właściwy znak, monotoniczność i rząd wielkości, NIE bezwzględną dokładność atmosfery sprawdzonej na danych (NRLMSISE-00). Uruchomienie: kshana scenarios/space-weath (komentarz w pliku scenariusza, wiersze { "10" } do { "15" })

seg-10cf16c12a2a = Środowisko pogody kosmicznej i gęstość termosfery zależna od aktywności jest MODELLED, nie sprawdzona względem niezależnego wzorca zewnętrznego: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc pozostaje obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-3dd29f8fba14 = <s1>Poprzednia</s1>space-packet

seg-ff9d9a41692b = <s1>Następna</s1>spectrum
