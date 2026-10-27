# docs--kind-sweep-nd: translations (pl)

seg-fa3ad6babe54 = <b>MODELLED</b> Przegląd rodzaju <c1/> (jeden do trzech kluczy z kropkami dowolnego rodzaju, na wartościach osi przeglądu ogólnego, opcjonalnie zespół w każdym węźle) i sekcja monte_carlo. Wyrocznia (InternalConsistency): Postać zamknięta błądzenia fazy przy szumie częstotliwości białym, wariancja q_wf tau (NIST Technical Note { "1337" }), dla mechanizmu statystyk, oraz równość bajtowa z przebiegami samodzielnymi dla ziarnowania. Sprawdza arytmetykę zespołu na własnym modelu zegara silnika, a nie na zewnętrznym zbiorze danych

seg-d1c11e493795 = Przeglądy parametrów i zespoły Monte Carlo z ziarnem dla dowolnego rodzaju scenariusza są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-ee7dd15019d0 = Strona tematu: <a1>CAMPAIGNS.md</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-7e95210bcc48 = <b>MODELLED</b> Złożony budżet położenia w holdover z biasu, współczynnika skali, VRW i zaniku stabilności. Wyrocznia (ReferenceImpl): niezależna całka SDE Monte Carlo w numpy z podwójnie scałkowanego białego szumu przyspieszenia (waliduje analityczną wariancję VRW zupełnie niezależnym algorytmem) + opublikowana wartość kotwicząca Groves { "2013" } dla składników biasu i współczynnika skali; liczby urządzeń CAI ilościowo opisują sprzęt partnera i pozostają MODELLED

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5fef5e8cc64e = Odporność kwantowej nawigacji zliczeniowej inercyjnej jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem osobnej implementacji w tej samej bazie kodu, niezależnej od badanego elementu, ale nie będącej zewnętrznym wzorcem. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5a70fcb097dc = Pola opcjonalne: brak

seg-bb07c8ee153f = <b>PARTNER</b> Nie jest zapewniane — tylko modele wydajności; sprzęt na zimnych atomach/zegary należy do partnera. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-792218eac075 = Źródło: <c1/>

seg-c7e5582d0b24 = <c1/> (rodzaj scenariusza)

seg-4f19d4fb1341 = Ogólny przegląd N-wymiarowy dowolnego pakietu przez kluczowe TOML z kropkami / ścieżki metryk JSON.

seg-cd907c72698b = Jeden przebieg <c1/> podsumowuje się tak: ogólny przegląd <c2/> po [threshold_m, accel_classical.bias] | { "15" } węzłów (kształt [{ "5" }, { "3" }]) | metryki [classical.fom.holdover_s, classical.fom.pos_rms_m]

seg-502ba2c57a5f = Pola wymagane: <c1/>, <c2/>, <c3/>

seg-c372e390bb4f = Przykład <c1/> ustawia między innymi:

seg-621a18c07044 = Wykres zapisany przez silnik dla scenarios/sweep-nd-inertial.toml, rodzaj sweep-nd

seg-ce006a6715e9 = <s1>Poprzednia</s1>spoof

seg-b9f8771ffd3d = <s1>Następna</s1>sweep

seg-8b701f465117 = logarytmiczna
