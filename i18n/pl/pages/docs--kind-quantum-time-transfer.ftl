# docs--kind-quantum-time-transfer: translations (pl)

seg-f42465f7d066 = ns

seg-37d16b499bc5 = dB

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-a3697ad561db = Hz

seg-496b17a8d3b9 = Strona tematu: <a1>QUANTUM-MODELS.md</a1>

seg-a1810bbca337 = <b>MODELLED</b> Dwukierunkowy/TWSTFT (Sagnac), GNSS common-view, PPP; link-jitter→odległość. Wyrocznia (ExternalDataset): wielkość efektu Sagnaca sprawdzona względem autorytatywnej OPUBLIKOWANEJ WARTOŚCI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), równ. { "1.29" }: okrążenie równika ku wschodowi kumuluje { "207.4" } ns (2ωA_E/c²); kshana odtwarza { "207.386" } ns. Niezależnie potwierdzone przez RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), który zawiera tę samą geometrię 2Aω/c². Złożony BIPM TWSTFT transponder/common-view/

seg-a8beb8dfc757 = Budżetowanie błędu transferu czasu jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-bb07c8ee153f = <b>PARTNER</b> Nie jest zapewniane — tylko modele wydajności; sprzęt na zimnych atomach/zegary należy do partnera. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Jeden odtwarzalny obiekt TradeEvidence (stała rama: scenariusz+ziarno+silnik; wspólne wartości kwantowe i klasyczne dla każdego wskaźnika jakości z korzyścią o właściwej polaryzacji, opcjonalny { "95" }%. Wyrocznia (InternalConsistency): tożsamości w postaci zamkniętej dla korzyści i zwycięzcy + wierne opakowanie istniejącego quantum_trade::TradeResult; rzetelność powiązana z rejestrem reprezentatywności i etykietami weryfikacji

seg-eb75c6a4dcec = Bilans kwantowy a klasyczny (wspólny kształt) jest MODELLED, nie sprawdzony względem niezależnego wzorca zewnętrznego: sprawdzony względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-eee91dc5741d = Źródło: <c1/>

seg-05060df7f0b7 = <c1/> (rodzaj scenariusza)

seg-540545e6f846 = Łańcuch zaufanej synchronizacji kwantowej MODELLED: kompletny bilans transferu czasu kwantowego (zegar na sieci optycznej + łącze splątania/pojedynczych fotonów) wobec klasycznego (CSAC + dwukierunkowy RF), ponownie użyty poziom ochrony czasu + miara bezpieczeństwa ataku opóźnienia/odtworzenia (1-P_md), prawdopodobieństwo detekcji anomalii zegara + opóźnienie CUSUM oraz bilans kwantowy a klasyczny jako rzetelne TradeEvidence z zapisem reprezentatywności i luk do lotu. Ilustracyjne parametry urządzeń i łączy ze źródeł publicznych; modeluje klasę, bez deklaracji TRL, lotu ani certyfikacji.

seg-ed79bfe80fe7 = Jeden przebieg <c1/> podsumowuje się tak: quantum-time-transfer | łańcuch kwantowy 1.233e-12s wobec klasycznego 5.292e-9s | PL { "555.24" } ns | bezpieczeństwo Pd { "1.000" } (Pfa { "1e-3" }) | anomalia Pd { "0.761" } | bilans: kwantowy wygrywa 2/2 | MODELLED

seg-80e94491c3df = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-6b03fa15a60d = Przykład <c1/> ustawia między innymi:

seg-09760f892c7b = Wykres zapisany przez silnik dla scenarios/quantum-time-transfer.toml, rodzaj quantum-time-transfer

seg-873de4d05663 = <b>VALIDATED</b> Najgorszy przypadek opóźnienia detekcji detektora tabelarycznego CUSUM (⌊h/(z−k)⌋+{ "1" }) i średnia długość przebiegu poza kontrolą, używane przez monitory poziomu ochrony czasu i spoofingu. Wyrocznia (ExternalDataset): opublikowane ARL tabelarycznego CUSUM: przybliżenie ruchem Browna wg Siegmunda ({ "1985" }) (Hawkins i Olwell { "1998" }, wzór { "3.7" }) skotwiczone krzyżowo do tablic ARL z Montgomery, Introduction to Statistical Quality Control (Wiley) dla k=½, h∈{ "{" }{ "4,5" }{ "}" }; deterministyczne opóźnienie zgodne dokładnie z wyrocznią pierwszego przejścia. Złożone ograniczenie TPL pozostaje MODELLED

seg-b51e62b8dc63 = Łańcuch zaufanej synchronizacji kwantowej MODELLED: kompletny bilans transferu czasu kwantowego (zegar na sieci optycznej + łącze splątania/pojedynczych fotonów) wobec klasycznego (CSAC + dwukierunkowy RF), ponownie użyty poziom ochrony czasu + miara bezpieczeństwa ataku opóźnienia/odtworzenia (1-P_md), prawdopodobieństwo detekcji anomalii zegara + opóźnienie CUSUM oraz bilans kwantowy a klasyczny jako rzetelne TradeEvidence z zapisem reprezentatywności i luk do lotu. (katalog rodzajów (<c1/>))

seg-dee0faf63e7f = Zaufana synchronizacja kwantowa — kompletny łańcuch transferu czasu, bezpieczne rozpowszechnianie, detekcja anomalii i bilans kwantowy a klasyczny. MODELLED; ilustracyjne parametry urządzeń i łączy ze źródeł publicznych; modeluje klasę, bez deklaracji TRL ani lotu. (komentarz w pliku scenariusza, wiersze { "1" } do { "3" })

seg-6e9f5dfca6b0 = Zaufana synchronizacja kwantowa (transfer czasu + bezpieczne rozpowszechnianie + anomalia) jest MODELLED, nie sprawdzona względem niezależnego wzorca zewnętrznego: sprawdzona względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-d3665be74ff1 = <s1>Poprzednia</s1>quantum-gnss-free-nav

seg-0d4b1f97541f = <s1>Następna</s1>quantum-trade
