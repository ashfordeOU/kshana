# docs--kinds-gnss-measurements-positioning-and-integrity: translations (pl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Rodzaj

seg-06197409c717 = Opublikowane certyfikacyjne wektory referencyjne ARAIM: silnik liczy poziomy ochrony ARAIM w poziomie i w pionie na WŁASNYCH przykładach liczbowych Podgrupy Technicznej ARAIM grupy WG-C, przy tolerancji (TOL_PL = { "5e-2" } m), którą te dokumenty same podają. Dwa wektory są zapisane jako dane testowe, każdy z adresem URL pobrania, datą pobrania, SHA-256 pliku źródłowego i stroną: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Dodatek D — wewnętrznie spójny, i wektor akceptacyjny — oraz Milestone { "3" } Report ({ "2016" }) Aneks A sekcja A.IX, zestawienie cytowane w bibliografiach badawczych. Każde opublikowane wejście (macierz geometrii 10 satelitów w 2 konstelacjach, przekątne wariancji C_int i C_acc, b_nom, P_sat, P_const i zestaw stałych LPV-200) oraz każde opublikowane wyjście (VPL, HPL, EMT, sigma_v_acc, K_fa_3 oraz sigma_3, sigma_ss_3 i b_3 dwóch trybów uszkodzenia konstelacji) jest podane obok własnej liczby silnika i ich bezwzględnej różnicy. Równanie poziomu ochrony NIE jest tu rozwiązywane ponownie: lista trybów z wzorca jest przekazywana istniejącym funkcjom silnika raim::araim_protection_level / araim_integrity_risk, więc bisekcja i algebra ogona rozkładu Gaussa poddane testowi są własnymi elementami silnika; budowane są dla niego tylko geometria, podrozwiązania, progi detekcji i opublikowany podział budżetu. EXTERNALLY CHECKED względem wektora { "2019" }: VPL { "18.2926" } m wobec { "18.3" } m opublikowanych, HPL { "13.4063" } m wobec { "13.45" } m, EMT { "7.2997" } m wobec { "7.2998" } m, sigma_v_acc { "1.3694" } m wobec { "1.3694" } m oraz wszystkie sześć opublikowanych wartości pośrednich z dokładnością do połowy jednostki na ostatnim wypisanym miejscu dziesiętnym. Wektor { "2016" } zawiera dwie wewnętrzne wady, które raport podaje, a nie ukrywa — literówkę znaku w wierszu { "3" } macierzy G oraz K_fa_3 obliczone dla { "57" } trybów uszkodzenia, podczas gdy dokument podaje N_fault_max = { "1" } ({ "12" } trybów) — więc jego wartości pośrednie geometrii odtwarzają się dokładnie, a jego poziomy ochrony są podane jako zmierzone rozbieżności i wyłączone z wartości akceptacyjnej; tolerancja nigdy nie jest poszerzana, aby je wchłonąć. Każde emitowane pole liczbowe ma jednostkę i klasę pochodzenia, a liczba przepisana jest oznaczona <c1/>, żeby nigdy nie dało się jej pomylić z obliczoną. ZAKRES: zaimplementowano tylko N_fault_max = { "1" } (tryby uszkodzenia pojedynczego satelity i pojedynczej konstelacji), a przypadek, którego założenia wymagają jednoczesnych podzbiorów uszkodzeń wielu zdarzeń, jest REFUSED, a nie po cichu obcinany; detekcja uszkodzeń, wykluczanie, test spójności chi-kwadrat i krok ponownej alokacji z podwójnego liczenia z algorytmu referencyjnego są poza zakresem. To odtwarza przykład obliczeniowy opublikowanego algorytmu referencyjnego — nie jest to certyfikacja, artefakt zdatności do lotu ani zatwierdzenie.

seg-693c823c85d1 = Wykres zapisywany przez silnik dla scenarios/araim-reference-check.toml, rodzaj araim-reference-check

seg-2ffccc9c1eff = Symulacja pseudoodległości w dziedzinie pomiarów (jonosfera Klobuchara, troposfera Saastamoinena/Niella) + RAIM.

seg-47ee40d4eb73 = Wykres zapisany przez silnik dla scenarios/gnss-sim-raim.toml, rodzaj gnss-sim

seg-eb7e0c2feb2b = RAIM migawkowy / z separacją rozwiązań / ARAIM z HPL/VPL i diagramem Stanforda.

seg-ce7f6130ddee = Wykres zapisany przez silnik dla scenarios/integrity-raim.toml, rodzaj integrity

seg-4e31c8daf798 = Rejestr (ledger)

seg-d1c67e3dd12e = MODELLED { "1" } · VALIDATED { "2" }

seg-c9cf40c5e609 = Źródło: <c1/>

seg-569fac649b5d = Pomiary GNSS, pozycjonowanie i integralność (rodzina rodzajów scenariuszy)

seg-63c3a7483268 = { "6" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-33a602147cc2 = Strony tematyczne: <a1>INTEGRITY</a1>, <a2>POSITIONING</a2>, <a3>ARAIM_REFERENCE</a3>, <a4>OSNMA</a4>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a5>KINDS.md</a5>.

seg-9c60c8803b6b = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Pomiary GNSS, pozycjonowanie i integralność

seg-045ecd7c036f = MODELLED { "6" } · VALIDATED { "4" }

seg-6698e12e148b = Pozycjonowanie pojedynczego punktu na rzeczywistych obserwacjach: wyznaczenie położenia odbiornika z pliku obserwacji RINEX { "3" } i pliku nawigacyjnego transmitowanego (pseudoodległości kodowe, efemerydy transmitowane, jonosfera Klobuchara, Saastamo

seg-da89c260b1a3 = Opublikowane wektory referencyjne certyfikacji ARAIM: poziomy ochrony ARAIM w poziomie i w pionie z silnika uruchomione na WŁASNYCH opracowanych przykładach numerycznych Podgrupy Technicznej ARAIM WG-C, z tolerancją

seg-7a750a89c9c4 = Model środowiska pogody kosmicznej: wskaźniki aktywności słonecznej (F10.7/F10.7a) i geomagnetycznej (Kp, z definicyjną tabelą Kp↔ap), temperatura egzosferyczna Jacchia-1971, którą one napędzają (sprawdzona względem opublikowa

seg-d79d4d58275b = Budżet predykcji układu księżycowego i orientacji Ziemi w czasie rzeczywistym: P4 Table { "1" } (kontrola spójności błędu układu — po przetworzeniu ~{ "0.27" } m ↔ ~{ "0.010" } ms i w czasie rzeczywistym ~{ "15" } m ↔ ~{ "0.5" } ms, każde położenie układu wyrażone

seg-dc783268156c = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>. Opcjonalne: <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-7b110aacdb27 = <b>Rejestr (ledger):</b> MODELLED { "6" } · VALIDATED { "4" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>integrity</a1>.

seg-d444fb35cae9 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>. Opcjonalne: <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-b651ec58bcba = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>gnss-sim</a1>.

seg-b9a21187317d = Pola wymagane: <c1/>, <c2/>. Opcjonalne: <c3/>, <c4/>, <c5/>, <c6/>.

seg-143dc4fd1d44 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>pvt</a1>.

seg-9ca1f6783e8e = Pola wymagane: brak. Opcjonalne: <c1/>.

seg-415f1fa78518 = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>araim-reference-check</a1>.

seg-6c4655b35c65 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>.

seg-1e5052c0bce7 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>space-weather</a1>.

seg-64c512530ee6 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>.

seg-1c244958d3c4 = <b>Rejestr (ledger):</b> MODELLED { "1" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>realtime-frame-eop</a1>.

seg-d4adf4283480 = <s1>Poprzedni</s1>Konstelacje, pokrycie i geometria

seg-2cdfd7f8bfb3 = <s1>Następny</s1>Alternatywne PNT w warunkach braku GPS

seg-b7b67e03f125 = Pozycjonowanie jednopunktowe na rzeczywistych obserwacjach: wyznaczenie pozycji odbiornika z pliku obserwacji RINEX { "3" } i pliku nawigacyjnego z komunikatów rozgłoszeniowych (pseudoodległości kodowe, efemerydy rozgłoszeniowe, jonosfera Klobuchara, troposfera Saastamoinena/Niella), opcjonalnie sprawdzone względem współrzędnej pomierzonej geodezyjnie.

seg-d76d59644d84 = Wykres zapisany przez silnik dla scenarios/pvt-abmf.toml, rodzaj pvt

seg-edfcb546d9de = Budżet prognozy lunarnego układu odniesienia i orientacji Ziemi w czasie rzeczywistym: Tabela { "1" } z P4 (kontrola spójności błędu układu odniesienia — po przetworzeniu ~{ "0.27" } m ↔ ~{ "0.010" } ms oraz w czasie rzeczywistym ~{ "15" } m ↔ ~{ "0.5" } ms, każda pozycja układu wyrażona jako równoważny błąd UT1 przez ramię dźwigni L19 Δr = D_EM·ω⊕·ΔUT1) i Tabela { "2" } (zmierzony błąd prognozy UT1 w funkcji horyzontu — krzywa L18 odczytana wprost z rzeczywistego szeregu IERS finals2000A: końcowa podłoga Bulletin A − Bulletin B i błąd wieloniowego predyktora persystencji, każdy odwzorowany na pozycję w układzie Księżyca przez L19), plus budżet błędu układu odniesienia w czasie rzeczywistym L21 jako pierwiastek sumy kwadratów (EOP + efemerydy + podłoga realizacji). Postać zamknięta VALIDATED (ramię dźwigni L19, ω⊕ skontrolowane krzyżowo względem kąta obrotu Ziemi CIO) oraz rzeczywiste dane VALIDATED (krzywa L18 z rzeczywistych wierszy finals2000A); MODELLED są wielkości kowariancji OD przekaźnika lunarnego i podłoga realizacji układu (alokacje reprezentatywne) oraz predyktor persystencji (nie jest to operacyjny algorytm Bulletin A organizacji IERS). Nie jest to produkt układu odniesienia czasu rzeczywistego objęty certyfikacją.

seg-2721ed7727bb = Wykres zapisany przez silnik dla scenarios/realtime-frame-eop.toml, rodzaj realtime-frame-eop

seg-5f25c5b71f0c = Model środowiska pogody kosmicznej: wskaźniki aktywności słonecznej (F10.7/F10.7a) i geomagnetycznej (Kp, z definicyjną tabelą Kp↔ap), temperatura egzosferyczna Jacchia-1971, którą one napędzają (sprawdzona względem niezależnego wzorca zewnętrznego dla opublikowanych wartości w minimum, średniej i maksimum słonecznym), oraz gęstość neutralna termosfery Jacchia-1971 przy średniodobowej temperaturze egzosferycznej wobec statycznego profilu niezależnego od aktywności na zbiorze wysokości — zależność gęstości od cyklu słonecznego, której atmosfera statyczna nie uwzględnia. MODELLED: gęstość zgadza się z gęstościami wyprowadzonymi z akcelerometrów (TOLEOS CHAMP i GRACE) w granicach czynnika { "2" } w maksimum słonecznym, lecz jest około 1.7x zbyt gęsta w minimum słonecznym z { "2008" }.

seg-c1c6f2f73fb5 = Wykres zapisany przez silnik dla scenarios/space-weather.toml, rodzaj space-weather
