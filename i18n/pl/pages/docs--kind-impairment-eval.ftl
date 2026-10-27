# docs--kind-impairment-eval: translations (pl)

seg-98151954f217 = false

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-2e6b437f3e99 = Źródło: <c1/>

seg-134407946837 = <c1/> (rodzaj scenariusza)

seg-304496607bd7 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zagłuszanie (jamming), spoofing i widmo</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-98e740d32860 = Stanowisko oceny detekcji zakłóceń RF metodami uczenia maszynowego ({ "13494" }): generuje oznaczony, oparty na parametrach korpus SYNTETYCZNY (nominalny/zagłuszanie/spoof-time/spoof-position/wielodrogowość), ocenia detektor (energy|agc|sqm|parity|fused) przy użyciu niezależnego od detektora zestawu testowego i podaje AUC/ROC/macierz pomyłek + Pd dla każdej klasy przy docelowym Pfa, a także lukę optymizmu między danymi z rozkładu a spoza rozkładu. Wyłącznie charakterystyki działania MODELLED — nigdy dane terenowe/IQ, żadnego werdyktu dobry/zły.

seg-41c3f9559282 = Jeden przebieg <c1/> podsumowuje się tak: impairment-eval | detector fused(max-z) | AUC { "0.998" } in / { "0.981" } out (gap { "0.017" }) | Pd { "0.99" } Pfa { "0.05" } @ target { "0.05" } | { "1000" } cases | MODELLED synthetic

seg-9b0d7ebaa1f0 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-283510d17885 = Przykład <c1/> ustawia między innymi:

seg-6a64be3b3f07 = fused

seg-3db71c5bdd0a = auc_out używa subtelniejszego out-of-tuning-reg

seg-667d26b3a2fe = Etykieta wyniku (silnika): MODELLED — syntetyczny korpus oparty na parametrach (nigdy dane terenowe/IQ); wyłącznie charakterystyki działania, żadnego werdyktu dobry/zły

seg-7e7b07bc5545 = Wykres zapisany przez silnik dla scenarios/impairment-eval.toml, rodzaj impairment-eval

seg-798a7e5526a0 = <b>VALIDATED</b> AUC (Mann-Whitney, remisy ½), macierz pomyłek przy progu, P_d/P_md/P_fa/precyzja/dokładność/F1 Testy: <a1>eval_metrics_reference.rs</a1>.

seg-ceedc14c623a = <b>VALIDATED</b> ROC AUC + przedział ufności bootstrap rozdzielający rzeczywiste oznaczone anomalie; przejrzysty detektor (odtwarza etykiety) Testy: <a1>opssat_ad_reference.rs</a1>.

seg-0ee5b31cfd09 = <b>MODELLED</b> Oznaczony syntetyczny korpus zakłóceń + niezależny od detektora zestaw ROC/AUC/macierz pomyłek/Pfa-Pmd; ochrona przed wyciekiem, podział warstwowy, raport optymizmu przy przesunięciu rozkładu (w reżimie a poza reżimem).

seg-392fa6495840 = <b>VALIDATED</b> AUC (Mann-Whitney, remisy ½), macierz pomyłek przy progu, P_d/P_md/P_fa/precyzja/dokładność/F1. Wyrocznia (ExternalDataset): scikit-learn { "1.9.0" } (Pedregosa et al., JMLR { "2011" }) — niezależna biblioteka, dokładne dopasowanie

seg-c719d4060e1a = <b>MODELLED</b> Oznaczony syntetyczny korpus zakłóceń + niezależny od detektora zestaw ROC/AUC/macierz pomyłek/Pfa-Pmd; ochrona przed wyciekiem, podział warstwowy, przesunięcie rozkładu (w reżimie a poza reżimem. Wyrocznia (InternalConsistency): zamknięte granice AUC (Mann–Whitney) + detektor będący doskonałą wyrocznią; korpus jest SYNTETYCZNY (oparty na parametrach, nie dane terenowe/IQ)

seg-5565108cc4d1 = MODELLED — syntetyczny korpus oparty na parametrach (nigdy dane terenowe/IQ); wyłącznie charakterystyki działania, żadnego werdyktu dobry/zły (wynik <c1/>)

seg-d2a9f35ea8cc = Wyłącznie charakterystyki działania MODELLED — nigdy dane terenowe/IQ, żadnego werdyktu dobry/zły. (katalog rodzajów (<c1/>))

seg-376f86fbdcb7 = UCZCIWY ZAKRES: wyłącznie charakterystyki działania MODELLED. Korpus jest syntetyczny i oparty na parametrach (złożony z modeli zagłuszania/AGC/SQM/parity Kshana) — nigdy zapisy terenowe ani surowe IQ. Zestaw testowy jest sędzią; podaje charakterystyki, nie wydaje werdyktu dobry/zły. Uruchom: kshana scenarios/impairment-eval.toml (komentarz w pliku scenariusza, wiersze { "9" } do { "12" })

seg-882d67b9474f = Ocena detekcji zakłóceń RF metodami uczenia maszynowego ({ "13494" }) jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-5d23d7f8f872 = Strona rodziny: <a1>Zagłuszanie (jamming), spoofing i widmo</a1>

seg-6cf4bb2d7f7a = Strona tematu: <a1>BENCH.md</a1>

seg-dde90de4270b = <s1>Poprzedni</s1>hybrid

seg-1e68310f2dc6 = <s1>Następny</s1>inertial
