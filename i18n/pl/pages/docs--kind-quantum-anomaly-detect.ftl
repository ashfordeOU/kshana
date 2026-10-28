# docs--kind-quantum-anomaly-detect: translations (pl)

seg-29e58493fdd4 = Obliczone z modelu

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-496b17a8d3b9 = Strona tematu: <a1>QUANTUM-MODELS.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Nie jest zapewniane — tylko modele wydajności; sprzęt na zimnych atomach/zegary należy do partnera. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-836d5102f0d1 = Źródło: <c1/>

seg-ad4ce0110e8d = <c1/> (rodzaj scenariusza)

seg-04310cd6cbec = Detekcja usterek i anomalii MODELLED dla kwantowych systemów PNT: oznaczony katalog usterek (skok częstotliwości, dryf i utrata zaczepienia zegara; skok biasu i zanik czujnika), AUC krzywej ROC statystyki detekcji (z przedziałem ufności bootstrap z eval_stats sprawdzonego zewnętrznie) oraz minimalna wykrywalna usterka przy stałym wskaźniku fałszywych alarmów, przy czym monitor wspomagany zegarem kwantowym (niższy szum) wykrywa mniejsze usterki — jako rzetelne TradeEvidence + reprezentatywność. Gaussowski model statystyki detekcji (AUC = Phi(mu/(sigma*sqrt2))); modeluje klasę, ilustracyjne parametry ze źródeł publicznych, bez TRL, lotu i certyfikacji.

seg-442310afbb13 = Jeden przebieg <c1/> podsumowuje się tak: quantum-anomaly-detect | AUC kwantowy { "0.9908" } wobec klasycznego { "0.7603" } | minimalna wykrywalna usterka kwantowy { "1.312" } wobec klasycznego { "4.372" } | { "5" } klas usterek | bilans: kwantowy wygrywa 2/2 | MODELLED

seg-335b8d87e27d = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-c2b10c0bdaf8 = Przykład <c1/> ustawia między innymi:

seg-f44afe581836 = { $version }

seg-2f1d14239d1a = Wykres zapisany przez silnik dla scenarios/quantum-anomaly-detect.toml, rodzaj quantum-anomaly-detect

seg-af9aaf95d4f8 = <b>VALIDATED</b> Analityczne dwunormalne AUC krzywej ROC = Φ(μ/(σ√{ "2" })) i minimalna wykrywalna usterka σ·(Φ⁻¹({ "1" }−P_fa)+Φ⁻¹(P_d)), na których opierają się kwantowe detektory usterek i anomalii. Wyrocznia (ExternalDataset): scipy { "1.17" } (Cephes ndtr/ndtri) + scikit-learn roc_auc_score (Pedregosa i in., JMLR { "2011" }), obie na licencji BSD-3-Clause — niezależne biblioteki obliczające te same jednoznacznie zdefiniowane wielkości ogona rozkładu gaussowskiego i AUC, zgodne do podłogi erf z A&S (~{ "7e-8" }). Przewaga kwantowego nad klasycznym zbudowana na tej podstawie pozostaje MODELLED

seg-c37642bb24fe = <b>MODELLED</b> Jeden odtwarzalny obiekt TradeEvidence (stała rama: scenariusz+ziarno+silnik; wspólne wartości kwantowe i klasyczne dla każdego wskaźnika jakości z korzyścią o właściwej polaryzacji, opcjonalny { "95" }%. Wyrocznia (InternalConsistency): tożsamości w postaci zamkniętej dla korzyści i zwycięzcy + wierne opakowanie istniejącego quantum_trade::TradeResult; rzetelność powiązana z rejestrem reprezentatywności i etykietami weryfikacji

seg-b854cedc8a51 = <b>MODELLED</b> Oznaczony kwantowy katalog usterek (skok częstotliwości, dryf i utrata zaczepienia zegara; skok biasu i zanik czujnika), AUC krzywej ROC statystyki detekcji z przedziałem ufności bootstrap oraz minimal. Wyrocznia (InternalConsistency): gaussowskie AUC w postaci zamkniętej = Phi(mu/(sigma*sqrt2)) skontrolowane krzyżowo względem sprawdzonego zewnętrznie eval_stats::bootstrap_auc_ci (wobec scikit-learn) + analityczne progi detekcji

seg-7b465c2bb7cf = Detekcja usterek i anomalii MODELLED dla kwantowych systemów PNT: oznaczony katalog usterek (skok częstotliwości, dryf i utrata zaczepienia zegara; skok biasu i zanik czujnika), AUC krzywej ROC statystyki detekcji (z przedziałem ufności bootstrap z eval_stats sprawdzonego zewnętrznie) oraz minimalna wykrywalna usterka przy stałym wskaźniku fałszywych alarmów, przy czym monitor wspomagany zegarem kwantowym (niższy szum) wykrywa mniejsze usterki — jako rzetelne TradeEvidence + reprezentatyw (katalog rodzajów (<c1/>))

seg-7f43972b246d = Detekcja usterek i anomalii dla kwantowych systemów PNT — oznaczony katalog usterek + AUC krzywej ROC + minimalna wykrywalna usterka, monitor wspomagany zegarem kwantowym a klasyczny. MODELLED; ilustracyjne parametry ze źródeł publicznych; modeluje klasę, bez deklaracji TRL ani lotu. (komentarz w pliku scenariusza, wiersze { "1" } do { "3" })

seg-eb75c6a4dcec = Bilans kwantowy a klasyczny (wspólny kształt) jest MODELLED, nie sprawdzony względem niezależnego wzorca zewnętrznego: sprawdzony względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-3f92aec2b92a = Detekcja usterek i anomalii dla kwantowych systemów PNT jest MODELLED, nie sprawdzona względem niezależnego wzorca zewnętrznego: sprawdzona względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-6524a69e4835 = <s1>Poprzednia</s1>pvt

seg-aa689568cf84 = <s1>Następna</s1>quantum-gnss-free-nav
