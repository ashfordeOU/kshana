# docs--kind-realtime-frame-eop: translations (pl)

seg-8e845ce908ee = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f6b7ca020692 = Strona rodziny: <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-1ad013ffb9d1 = Źródło: <c1/>

seg-54620502f0dd = <c1/> (rodzaj scenariusza)

seg-edfcb546d9de = Budżet prognozy lunarnego układu odniesienia i orientacji Ziemi w czasie rzeczywistym: Tabela { "1" } z P4 (kontrola spójności błędu układu odniesienia — po przetworzeniu ~{ "0.27" } m ↔ ~{ "0.010" } ms oraz w czasie rzeczywistym ~{ "15" } m ↔ ~{ "0.5" } ms, każda pozycja układu wyrażona jako równoważny błąd UT1 przez ramię dźwigni L19 Δr = D_EM·ω⊕·ΔUT1) i Tabela { "2" } (zmierzony błąd prognozy UT1 w funkcji horyzontu — krzywa L18 odczytana wprost z rzeczywistego szeregu IERS finals2000A: końcowa podłoga Bulletin A − Bulletin B i błąd wieloniowego predyktora persystencji, każdy odwzorowany na pozycję w układzie Księżyca przez L19), plus budżet błędu układu odniesienia w czasie rzeczywistym L21 jako pierwiastek sumy kwadratów (EOP + efemerydy + podłoga realizacji). Postać zamknięta VALIDATED (ramię dźwigni L19, ω⊕ skontrolowane krzyżowo względem kąta obrotu Ziemi CIO) oraz rzeczywiste dane VALIDATED (krzywa L18 z rzeczywistych wierszy finals2000A); MODELLED są wielkości kowariancji OD przekaźnika lunarnego i podłoga realizacji układu (alokacje reprezentatywne) oraz predyktor persystencji (nie jest to operacyjny algorytm Bulletin A organizacji IERS). Nie jest to produkt układu odniesienia czasu rzeczywistego objęty certyfikacją.

seg-488039e4240f = Jeden przebieg <c1/> podsumowuje się tak: realtime-frame-eop | Tabela { "1" }: po przetworzeniu { "0.27" } m ({ "0.0096" } ms UT1) ↔ w czasie rzeczywistym { "14.4" } m ({ "0.514" } ms UT1) | Tabela { "2" }: podłoga końcowa { "0.0171" } ms → 3 dni { "1.6644" } ms | budżet łączny { "20.1" } m ({ "67.0" } ns) | ramię dźwigni L19 + rzeczywiste dane L18 (sprawdzone względem niezależnego wzorca zewnętrznego), kowariancja OD (obliczona na podstawie modelu)

seg-66264ec78a4c = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-45a4ed476311 = Przykład <c1/> ustawia między innymi:

seg-c39a26aa1f1e = dołączony zestaw testowy finals2000A_20260930

seg-9ef8a2b4c144 = Etykieta wyniku (silnika): budżet prognozy lunarnego układu odniesienia i orientacji Ziemi w czasie rzeczywistym. Postać zamknięta VALIDATED: ramię dźwigni L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ skontrolowane krzyżowo względem kąta obrotu Ziemi CIO. Rzeczywiste dane VALIDATED: krzywe błędu prognozy UT1 i ruchu bieguna L18 odczytane wprost z rzeczywistego IERS finals200

seg-2721ed7727bb = Wykres zapisany przez silnik dla scenarios/realtime-frame-eop.toml, rodzaj realtime-frame-eop

seg-72a1fc2f5c90 = <b>VALIDATED</b> Jedna tabela podaje błąd prognozy UT1, błąd bieguna ruchu bieguna i ich złożenie kwadraturowe na Księżycu dla IDENTYCZNEGO zbioru epok na każdy horyzont, emitując epoki, w których zmierzono każdy składnik. Testy: <a1>embedded_eop_vintage_astropy_preregistered.rs</a1>.

seg-b1d90bf98ac3 = <b>VALIDATED</b> Domyślna wartość wykonawcza <c1/> to własna osadzona w bibliotece kopia dosłownego wyciągu IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } kolejnych wierszy dziennych, MJD 61224-61397, wycięte z finals2000A.all z 2026-09-30) niosą Testy: <a1>operational_eop_predictor_reference.rs</a1>.

seg-0298bd40d72f = <b>MODELLED</b> Dopasowanie najmniejszych kwadratów biasu i tempa w oknie wstecznym plus główne składniki okresowe — roczny, półroczny i dwa główne pływy zonalne dla UT1; Chandlera, roczny i półroczny dla bieguna — ekstrapolowane z ostatnią wartością w oknie Testy: <a1>operational_eop_predictor_reference.rs</a1>.

seg-12efcd20ca62 = <b>VALIDATED</b> Jedna tabela podaje błąd prognozy UT1, błąd bieguna ruchu bieguna i ich złożenie kwadraturowe na Księżycu dla IDENTYCZNEGO zbioru epok na każdy horyzont, em. Wyrocznia (ExternalDataset): astropy { "8.0.1" } utils.iers (BSD-3) odczytujące produkt IERS finals2000A własną regułą Bulletin-B-w-przeciwnym-razie-A oraz pyerfa { "2.0.1.5" } (SOFA) z pełnymi obrotami niebieski-do-ziemskiego (c2i06a, sp00, pom00, c2tcio; kąt obrotu Ziemi wg IERS { "2010" }, wzór { "5.15" } w arytmetyce dokładnej), uruchamiane jako oddzielne programy na dosłownych wierszach zamrożonego finals2000A.all z 2026-09-30; wstępnie zarejestrowane (455b8fb5) z poprawkami A1 i A2 ustalającymi tylko

seg-020e5919c8fd = <b>VALIDATED</b> Domyślna wartość wykonawcza <c1/> to własna osadzona w bibliotece kopia dosłownego wyciągu IERS finals2000A (tools/finals2000A_20260930.txt: { "174" } kolejnych. Wyrocznia (ExternalDataset): astropy { "8.0.1" } astropy.utils.iers.IERS_A (BSD-3-Clause), czytające te same bajty własnym czytnikiem, oraz tabela IERS Bulletin A Vol. XXXIX No. { "039" }, przepisana liczba po liczbie; wstępnie zarejestrowane (6fdae01b) z sześcioma dokładnymi kryteriami przed uruchomieniem astropy. Spełnione są wszystkie sześć: { "30" } wierszy końcowych, { "54" } szybkich i { "90" } prognozowanych o równych listach MJD, każdy wiersz prognozowany z flagą P, równy spis w przebiegu domyślnym oraz prognozy równe Bullet

seg-530c87bbff78 = <b>MODELLED</b> Dopasowanie najmniejszych kwadratów biasu i tempa w oknie wstecznym plus główne składniki okresowe — roczny, półroczny i dwa główne pływy zonalne dla UT1; Cha. Wyrocznia (ReferenceImpl): trzy niezależne drogi, żadna z nich nie jest opublikowaną wartością dokładności prognozy. ({ "1" }) Sygnał analityczny o znanych współczynnikach — jedyny sposób na przećwiczenie mechanizmu okresowego, ponieważ żaden zatwierdzony szereg nie jest dość długi, by dopuścić składnik roczny. ({ "2" }) Podręcznikowe rozwiązanie najmniejszych kwadratów w postaci zamkniętej, inna algebra niż rozwiązanie macierzowe pod testem, na rzeczywistych wierszach. ({ "3" }) Prawdziwe zarchiwizowane wiersze prognoz Bulletin A, które

seg-a233df86be95 = Budżet prognozy lunarnego układu odniesienia i orientacji Ziemi w czasie rzeczywistym. Postać zamknięta VALIDATED: ramię dźwigni L19 ({ "1" } ms ↔ { "28.03" } m ↔ { "93.5" } ns), ω⊕ skontrolowane krzyżowo względem kąta obrotu Ziemi CIO. Rzeczywiste dane VALIDATED: krzywe błędu prognozy UT1 i ruchu bieguna L18 odczytane wprost z rzeczywistego szeregu IERS finals2000A (Bulletin A szybki wobec Bulletin B końcowego oraz wieloniowa persystencja na rzeczywistych wierszach dziennych). WYPROWADZONE: układ odniesienia (wynik <c1/>)

seg-60e7ee7e6e3e = Postać zamknięta VALIDATED (ramię dźwigni L19, ω⊕ skontrolowane krzyżowo względem kąta obrotu Ziemi CIO) oraz rzeczywiste dane VALIDATED (krzywa L18 z rzeczywistych wierszy finals2000A); MODELLED są wielkości kowariancji OD przekaźnika lunarnego i podłoga realizacji układu (alokacje reprezentatywne) oraz predyktor persystencji (nie jest to operacyjny algorytm Bulletin A organizacji IERS). (katalog rodzajów (<c1/>))

seg-ddf4702f78e5 = Rzetelność: postać zamknięta VALIDATED (ramię dźwigni L19, omega_earth skontrolowane krzyżowo względem kąta obrotu Ziemi CIO) i rzeczywiste dane VALIDATED (krzywe UT1 i ruchu bieguna L18 z rzeczywistych wierszy finals2000A). WYPROWADZONA podłoga realizacji układu odniesienia (rezydua po dopasowaniu Helmerta). MODELLED są wielkości kowariancji OD przekaźnika lunarnego ({ "0.27" } m po przetworzeniu, ~{ "14.4" } m w czasie rzeczywistym przy opóźnieniu jednej godziny — wartość zaokrąglona, a nie wyliczona wstecznie, all (komentarz w pliku scenariusza, wiersze { "27" } do { "32" })

seg-bc51b666d070 = Błąd prognozy orientacji Ziemi w stylu operacyjnym, mierzony jako prognoza wobec wartości końcowej, jest MODELLED, nie sprawdzony względem niezależnego wzorca zewnętrznego: sprawdzony względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanej jednostki, ale bez autorytetu zewnętrznego. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-653fad5e0afe = <s1>Poprzednia</s1>quantum-trade

seg-5abe534d4ef1 = <s1>Następna</s1>reentry

seg-a2889fb2b42a = Strona tematu: <a1>integrations.md</a1>
