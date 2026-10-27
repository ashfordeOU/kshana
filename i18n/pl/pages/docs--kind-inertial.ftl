# docs--kind-inertial: translations (pl)

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-b054c73f22e5 = brak wartości

seg-98151954f217 = false

seg-be831b52a339 = oraz { "4" } kolejne w macierzy.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-195347c63a8a = m/s^{ "2" }

seg-3a1d8c59a4c9 = (m/s^{ "2" })^2/Hz

seg-cc7a61264c3f = (m/s^{ "2" })^2/s

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Złożony budżet położenia w holdover z biasu, współczynnika skali, VRW i zaniku stabilności. Wyrocznia (ReferenceImpl): niezależna całka SDE Monte Carlo w numpy z podwójnie scałkowanego białego szumu przyspieszenia (waliduje analityczną wariancję VRW zupełnie niezależnym algorytmem) + opublikowana wartość kotwicząca Groves { "2013" } dla składników biasu i współczynnika skali; liczby urządzeń CAI ilościowo opisują sprzęt partnera i pozostają MODELLED

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odporność kwantowej nawigacji zliczeniowej inercyjnej jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu, niezależnej od badanego elementu, ale nie będącej zewnętrznym wzorcem. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-ca448daf5ec7 = nominal

seg-496b17a8d3b9 = Strona tematu: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Strona tematu: <a1>QUANTUM.md</a1>

seg-7bebd09c614b = Kwarcowy akcelerometr klasy nawigacyjnej (Honeywell QA-2000 / G

seg-cead54058894 = Źródło: <c1/>

seg-783be547f01e = <c1/> (rodzaj scenariusza)

seg-bdedf28adc48 = Inercyjna nawigacja zliczeniowa 1-DOF podczas przerwy w GNSS.

seg-55b5599ef867 = Jeden przebieg <c1/> podsumowuje się tak: scenario fc9191cef784 | quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m

seg-b05c3cb45c0d = Wymagane pola: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-94fd9afe6f30 = Pola opcjonalne: <c1/>

seg-bd021b5dff80 = Przykład <c1/> ustawia między innymi:

seg-8a9e52e38b05 = Hybrydowa kwantowa trójka akcelerometrów Exail: stabilność biasu 6e-

seg-873c402bb724 = Wykres zapisany przez silnik dla scenarios/imu-deadreckoning.toml, rodzaj inertial

seg-801740520370 = MODELLED { "6" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-41f3a20fadfb = <b>VALIDATED</b> Mechanizacja inercyjna strapdown w kwaternionach, WGS-84 NED (z kompensacją coningu/scullingu), propagująca stan nawigacyjny z przyrostów (Δθ, Δv) Testy: <a1>classical_strapdown_ins_reference.rs</a1>.

seg-102d2e51460e = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN) Testy: <a1>quantum_inertial_sensor_reference.rs</a1>.

seg-83fa50d4859a = <b>MODELLED</b> Zakres dynamiczny niejednoznaczności prążków Macha–Zehndera: odczyt prążków o okresie 2π ustala maksymalną jednoznaczną siłę właściwą a_max=π/(k_eff·T²), a jednoznaczny zakres w komórkach rozdzielczości a_max/σ_a=π/σ_Φ nie zależy od optycznego współczynnika skali

seg-89ec2e65cf4f = <b>MODELLED</b> Złożony budżet położenia w holdover z biasu, współczynnika skali, VRW i zaniku stabilności Testy: <a1>quantum_inertial_dead_reckoning_reference.rs</a1>.

seg-bb07c8ee153f = <b>PARTNER</b> Nie jest zapewniane — tylko modele wydajności; sprzęt na zimnych atomach/zegary należy do partnera. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-fab4c926e628 = <s1>Poprzedni</s1>impairment-eval

seg-aa783749183d = <s1>Następny</s1>ins-trn-coast
