# docs--kind-hybrid-optical-rf: translations (pl)

seg-debc2f07db78 = true

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-0482fec5b0f6 = Źródło: <c1/>

seg-830c574e871b = <c1/> (rodzaj scenariusza)

seg-72ad48275ebe = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Optyczne PNT</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-e6839b50b560 = MODELLED heterogeniczny wspólny wskaźnik jakości optycznego i radiowego PNT (P5): składa dwukierunkowy optyczny bilans łącza { "1550" } nm (ograniczone fotonami dwukierunkowe CRLB pomiaru odległości σ_τ/√N i ślad dyfrakcyjny λ/D·odległość), międzymodalny poziom ochrony RAIM z separacją rozwiązań (położenie ORAZ czas), który łączy luźne rozwiązanie radiowe i ścisłe optyczne o różnych kowariancjach, dostępność optyczną przy czystym niebie dla N stacji (suma niezależna { "1" }−Π({ "1" }−a_i) i wariant skorelowany przestrzennie), przekazanie stanu/kowariancji optyczne↔radiowe z UDOWODNIONĄ średnią ciągłą co do bitu (bez skoku) i bramką spójności NEES χ², oraz wspólną ocenę P(dostępne ORAZ klasy precyzyjnej ORAZ z zapewnioną integralnością) z uwzględnieniem korelacji. VALIDATED wzór zamknięty: CRLB pomiaru odległości, ślad dyfrakcyjny, kwantyl poziomu ochrony χ², kombinatoryka sumy, ciągłość średniej przekazania + bramka NEES oraz wspólny iloczyn niezależny. MODELLED: przydziały strat optycznych, wielkości σ radiowe/optyczne, dane wejściowe klimatologii zachmurzenia, korelacje i budżet P_HMI. Nie jest to produkt z certyfikacją dostępności ani integralności.

seg-30904e2367fc = Jeden przebieg <c1/> podsumowuje się tak: hybrid-optical-rf | optical footprint { "700" } m, { "1489" } photons -> ranging σ { "0.194" } mm, timing σ { "1.30" } ps | cross-RAIM HPL { "6.2" } m / VPL { "6.6" } m / TPL { "13.3" } ns (protected) | availability { "99.5" }% ({ "5" } sites) | handoff no-jump OK NEES { "3.34" }∈[0.48,{ "11.14" }] in-gate | joint FoM { "0.993" } (A { "0.995" } · P { "0.995" } · I { "1.000" }) | Validated CRLB/χ²-PL/union/handoff, Modelled σ/climatology

seg-73e5cf56c92c = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>

seg-27338c8b2e5f = Przykład <c1/> ustawia między innymi:

seg-7b9ce4689508 = Etykieta wyniku (silnika): heterogeniczny wspólny wskaźnik jakości dostępności / precyzji / integralności optycznego i radiowego PNT (P5). VALIDATED wzór zamknięty: ograniczone fotonami CRLB pomiaru odległości (σ_τ/√N) i ślad dyfrakcyjny (λ/D·odległość), kwantyl poziomu ochrony χ² międzymodalnego, dostępność z sumy niezależnej dla N stacji ({ "1" } − Π(

seg-5cea5229815e = Wykres zapisany przez silnik dla scenarios/hybrid-optical-rf.toml, rodzaj hybrid-optical-rf

seg-a8923a682728 = <b>MODELLED</b> Raport hybrid-optical-rf podaje konfigurację łącza, przy której faktycznie działał (długość fali nośnej, apertura nadawcza i odbiorcza, odległość, szerokość impulsu, integracja. Wyrocznia (InternalConsistency): brak zewnętrznej wyroczni i nie jest ona możliwa: to samoopis, nie pomiar. Jest zapisywany, ponieważ jego brak był wadą -- P5 musiał przytaczać długość fali nośnej i aperturę nadawczą z domyślnych wartości w kodzie źródłowym oraz wnioskować z kontroli spójności wewnętrznej, że goła wartość <c1/> jest w metrach kwadratowych. Wniosek był poprawny, i właśnie dlatego miał znaczenie: nic by nie wychwyciło, że jest błędny

seg-28abb5a84eaa = <b>MODELLED</b> Raport hybrid-optical-rf podaje dostępność łącza radiowego, złożoną z wielkości, które silnik już oblicza, a nie z importowanej klimatologii, oraz . Wyrocznia (InternalConsistency): brak zewnętrznej wyroczni, a ExternalDataset jest odrzucony. Dwa wejścia to margines Eb/N0 i przekroczenie progu C/N0, oba będące funkcjami MODELLED EIRP, wskaźnika jakości i zbiorczego przydziału strat; nie istnieje zmierzony zapis dostępności usługi hybrydowej optyczno-radiowej Ziemia–Księżyc, z którym można by porównać złożoną wartość. Istniejące kontrole są wewnętrzne i tak je opisano: złożenie jest przeliczane ponownie z

seg-888004543d37 = <b>MODELLED</b> Raport hybrid-optical-rf podaje stosunek dokładności pomiaru odległości optycznego do radiowego, z JEDNĄ konfiguracją, przy której oceniono oba tory, zawartą w tym samym obiekcie: ta sama. Wyrocznia (InternalConsistency): brak zewnętrznej wyroczni dla STOSUNKU, a ExternalDataset jest odrzucony świadomie. Podstawowy tor radiowy ma wyrocznię -- tests/validate_p5_rf_ranging_precision.rs sprawdza linkbudget::link_budget i navsignal::dll_code_jitter_chips względem niezależnego wzorca w Pythonie/NumPy oraz względem zapisanej na stałe wartości z przykładu Kaplana i Hegarty'ego ({ "2.814e-3" } chip / { "0.825" } m przy { "45" } dB-Hz) -- a optyczne CRLB ma własny wiersz wzoru zamkniętego

seg-db5ff373b50f = <b>MODELLED</b> Raport hybrid-optical-rf podaje, co międzymodalny monitor chi-kwadrat faktycznie potrafi WYKRYĆ, a nie tylko że przechodzi przypadek bez usterek: minimalny wykrywalny. Wyrocznia (InternalConsistency): dwie wyrocznie wewnętrzne, bez zewnętrznego zbioru danych. ({ "1" }) Obieg w postaci zamkniętej: minimalny wykrywalny bias powstaje przez odwrócenie ogona niecentralnego rozkładu chi-kwadrat względem parametru niecentralności (raim::pbias) i jest weryfikowany przez podanie otrzymanego parametru niecentralności z powrotem do raim::noncentral_chi2_cdf przy własnym progu monitora, co musi zwrócić P_md. ({ "2" }) Wstrzyknięcie a analiza: bias jest wpisywany w estymatę radiową jednej osi

seg-24f31f6b353f = Heterogeniczny wspólny wskaźnik jakości dostępności / precyzji / integralności optycznego i radiowego PNT (P5). VALIDATED wzór zamknięty: ograniczone fotonami CRLB pomiaru odległości (σ_τ/√N) i ślad dyfrakcyjny (λ/D·odległość), kwantyl poziomu ochrony χ² międzymodalnego, dostępność z sumy niezależnej dla N stacji ({ "1" } − Π({ "1" }−a_i)), niezmiennik ciągłości średniej przekazania optyczne↔radiowe (bez skoku co do bitu) i bramka NEES χ², oraz wspólny wskaźnik jakości niezal (wynik <c1/>)

seg-bec90783ad8b = MODELLED heterogeniczny wspólny wskaźnik jakości optycznego i radiowego PNT (P5): składa dwukierunkowy optyczny bilans łącza { "1550" } nm (ograniczone fotonami dwukierunkowe CRLB pomiaru odległości σ_τ/√N i ślad dyfrakcyjny λ/D·odległość), międzymodalny poziom ochrony RAIM z separacją rozwiązań (położenie ORAZ czas), który łączy luźne rozwiązanie radiowe i ścisłe optyczne o różnych kowariancjach, dostępność optyczną przy czystym niebie dla N stacji (suma niezal (katalog rodzajów (<c1/>))

seg-15abc895e477 = MODELLED: przydziały strat optycznych, wielkości σ radiowe/optyczne, dane wejściowe klimatologii zachmurzenia, korelacje i budżet P_HMI. (katalog rodzajów (<c1/>))

seg-9fafa5ffb521 = MODELLED. Zamknięte wzory sprawdzone względem niezależnego wzorca: CRLB pomiaru odległości (sigma_tau/sqrt(N)), ślad dyfrakcyjny (lambda/D * odległość), kwantyl poziomu ochrony chi-kwadrat, kombinatoryka sumy, ciągłość średniej przekazania + bramka NEES oraz wspólny iloczyn niezależny. Przydziały strat, wielkości sigma, dane wejściowe klimatologii zachmurzenia, korelacje i budżet P_HMI to reprezentatywne dane wejściowe obliczone na podstawie modelu. Każde pole poniżej jest opcjonalne i pokazane przy swojej (komentarz w pliku scenariusza, wiersze { "10" } do { "14" })

seg-e5f964e5d422 = --- G15: wstrzykiwanie usterki typu bias / narastanie wobec monitora międzymodalnego --- Minimalny wykrywalny bias i krzywa mocy detekcji są ANALITYCZNE (odwrócenie niecentralnego rozkładu chi-kwadrat), więc nie potrzebują własnych danych wejściowych. Te dwa ustawiają tylko tempo narastania, do którego przeliczany jest podany czas do wykrycia. Oba MODELLED. (komentarz w pliku scenariusza, wiersze { "56" } do { "59" })

seg-70f50a62aa12 = --- G17: wybieg po przekazaniu: szum procesu i przekroczenie limitu alarmowego --- Błądzenie losowe w istniejącym 4-stanowym filtrze przekazania (wschód, północ, góra, zegar). Limity alarmowe są te, które zadeklarowano wyżej; nowe są tylko szum procesu i współczynnik pokrycia. Obie PSD są MODELLED reprezentatywnymi danymi wejściowymi, a czasy przekroczenia skalują się wprost z nimi. (komentarz w pliku scenariusza, wiersze { "63" } do { "67" })

seg-9fb4240fb0ef = Samoopis raportu hybrydowego optyczno-radiowego jest MODELLED, nie jest sprawdzony względem niezależnego wzorca: sprawdzony względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-a97755cb13eb = Strona rodziny: <a1>Optyczne PNT</a1>

seg-1586d90cdf1b = <s1>Poprzedni</s1>holdover-test

seg-211275a00df0 = <s1>Następny</s1>hybrid-ukf
