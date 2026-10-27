# docs--kind-araim-reference-check: translations (pl)

seg-debc2f07db78 = true

seg-c53da0bf140d = Źródło: <c1/>

seg-82884391dd77 = <c1/> (rodzaj scenariusza)

seg-8e845ce908ee = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-06197409c717 = Opublikowane certyfikacyjne wektory referencyjne ARAIM: silnik liczy poziomy ochrony ARAIM w poziomie i w pionie na WŁASNYCH przykładach liczbowych Podgrupy Technicznej ARAIM grupy WG-C, przy tolerancji (TOL_PL = { "5e-2" } m), którą te dokumenty same podają. Dwa wektory są zapisane jako dane testowe, każdy z adresem URL pobrania, datą pobrania, SHA-256 pliku źródłowego i stroną: Reference Airborne Algorithm Description Document v3.1 ({ "2019" }) Dodatek D — wewnętrznie spójny, i wektor akceptacyjny — oraz Milestone { "3" } Report ({ "2016" }) Aneks A sekcja A.IX, zestawienie cytowane w bibliografiach badawczych. Każde opublikowane wejście (macierz geometrii 10 satelitów w 2 konstelacjach, przekątne wariancji C_int i C_acc, b_nom, P_sat, P_const i zestaw stałych LPV-200) oraz każde opublikowane wyjście (VPL, HPL, EMT, sigma_v_acc, K_fa_3 oraz sigma_3, sigma_ss_3 i b_3 dwóch trybów uszkodzenia konstelacji) jest podane obok własnej liczby silnika i ich bezwzględnej różnicy. Równanie poziomu ochrony NIE jest tu rozwiązywane ponownie: lista trybów z wzorca jest przekazywana istniejącym funkcjom silnika raim::araim_protection_level / araim_integrity_risk, więc bisekcja i algebra ogona rozkładu Gaussa poddane testowi są własnymi elementami silnika; budowane są dla niego tylko geometria, podrozwiązania, progi detekcji i opublikowany podział budżetu. EXTERNALLY CHECKED względem wektora { "2019" }: VPL { "18.2926" } m wobec { "18.3" } m opublikowanych, HPL { "13.4063" } m wobec { "13.45" } m, EMT { "7.2997" } m wobec { "7.2998" } m, sigma_v_acc { "1.3694" } m wobec { "1.3694" } m oraz wszystkie sześć opublikowanych wartości pośrednich z dokładnością do połowy jednostki na ostatnim wypisanym miejscu dziesiętnym. Wektor { "2016" } zawiera dwie wewnętrzne wady, które raport podaje, a nie ukrywa — literówkę znaku w wierszu { "3" } macierzy G oraz K_fa_3 obliczone dla { "57" } trybów uszkodzenia, podczas gdy dokument podaje N_fault_max = { "1" } ({ "12" } trybów) — więc jego wartości pośrednie geometrii odtwarzają się dokładnie, a jego poziomy ochrony są podane jako zmierzone rozbieżności i wyłączone z wartości akceptacyjnej; tolerancja nigdy nie jest poszerzana, aby je wchłonąć. Każde emitowane pole liczbowe ma jednostkę i klasę pochodzenia, a liczba przepisana jest oznaczona <c1/>, żeby nigdy nie dało się jej pomylić z obliczoną. ZAKRES: zaimplementowano tylko N_fault_max = { "1" } (tryby uszkodzenia pojedynczego satelity i pojedynczej konstelacji), a przypadek, którego założenia wymagają jednoczesnych podzbiorów uszkodzeń wielu zdarzeń, jest REFUSED, a nie po cichu obcinany; detekcja uszkodzeń, wykluczanie, test spójności chi-kwadrat i krok ponownej alokacji z podwójnego liczenia z algorytmu referencyjnego są poza zakresem. To odtwarza przykład obliczeniowy opublikowanego algorytmu referencyjnego — nie jest to certyfikacja, artefakt zdatności do lotu ani zatwierdzenie.

seg-c16de81ec8da = Jeden przebieg <c1/> podsumowuje się tak: araim-reference-check: { "2" } opublikowanych wektorów referencyjnych WG-C; najgorsza zgodność VPL/HPL { "0.0437" } m wobec własnego TOL_PL = { "0.05" } m wzorca na { "1" } wektorze akceptacyjnym

seg-b1be6b5632c1 = Pola opcjonalne: <c1/>

seg-3f181d41edb5 = Przykład <c1/> ustawia m.in.:

seg-9de6e1b3352d = Etykieta wyniku (silnika): EXTERNALLY CHECKED — poziomy ochrony ARAIM silnika liczone na opublikowanych przykładach liczbowych referencyjnego algorytmu pokładowego Podgrupy Technicznej ARAIM grupy roboczej C UE–USA, przy tolerancji (TOL_PL), którą te dokumenty same podają. Każda opublikowana wartość ma swój adres UR

seg-693c823c85d1 = Wykres zapisywany przez silnik dla scenarios/araim-reference-check.toml, rodzaj araim-reference-check

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-c5c966ec3c6a = <b>VALIDATED</b> Samo równanie poziomu ochrony z separacją rozwiązań dla wielu hipotez: ważona metoda najmniejszych kwadratów dla wszystkich widocznych satelitów i dla każdego trybu uszkodzenia na geometrii East/North/Up z jednym stanem zegara na konstelację, sigmy podrozwiązań, separacja rozwiązań Testy: <a1>araim_reference_vectors.rs</a1>.

seg-a99b9cf4c6e8 = <b>VALIDATED</b> Samo równanie poziomu ochrony z separacją rozwiązań dla wielu hipotez: ważona metoda najmniejszych kwadratów dla wszystkich widocznych satelitów i dla każdego trybu uszkodzenia na geometrii East/North/Up. Wyrocznia (ExternalDataset): EU-U.S. Working Group C ARAIM Technical Subgroup, Reference Airborne Algorithm Description Document v3.1 ({ "20" } June { "2019" }), Dodatek D, przykład liczbowy — opublikowane DANE WEJŚCIOWE (macierz geometrii 10 satelitów w 2 konstelacjach, przekątne C_int/C_acc, b_nom, P_sat, P_const, stałe LPV-200) i opublikowane DANE WYJŚCIOWE (VPL { "18.3" } m, HPL { "13.45" } m, EMT { "7.2998" } m, σ_v_acc { "1.3694" } m, K_fa_3 { "5.1083" } oraz sześć wartości pośrednich uszkodzenia konstelacji

seg-f6b7ca020692 = Strona rodziny: <a1>Pomiary GNSS, pozycjonowanie i integralność</a1>

seg-f4cf8b629797 = Strona tematu: <a1>INTEGRITY.md</a1>

seg-e6b1f9a47b5d = Strona tematu: <a1>ARAIM_REFERENCE.md</a1>

seg-7cf434223fa5 = <s1>Poprzedni</s1>aperture-duty-cycle

seg-ed2003ecf41b = <s1>Następny</s1>ascent-losses
