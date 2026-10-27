# docs--kind-quantum-gnss-free-nav: translations (pl)

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-7b2721b7588d = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-195347c63a8a = m/s^{ "2" }

seg-451a304052c4 = <b>MODELLED</b> Akcelerometr z interferometrem zimnych atomów z pierwszych zasad (k_eff·T², QPN). Wyrocznia (ExternalDataset): opublikowane wektory liczbowe z podstawowych prac o CAI (funkcja przenoszenia Cheinet { "2008" }; czułość Peters/Freier): k_eff·T² dopasowane dokładnie, ASD szumu śrutowego jako jednostronny próg w granicach ~{ "2" }× od każdego opublikowanego przyrządu (rzeczywiste urządzenia mają szum techniczny powyżej progu kwantowego). Przedział, nie równość. { "0.30" } runda { "2" } (zarejestrowane z góry fcb9ac64), ustalenie (pozostaje MODELLED): szum rotacji tylko od QPN względem zmierzonego Gauguet et al.

seg-9955b1b1c018 = Wydajność kwantowego czujnika inercyjnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-f7f12029e0ec = Strona rodziny: <a1>Czujniki inercyjne, fuzyjne i kwantowe</a1>

seg-496b17a8d3b9 = Strona tematu: <a1>QUANTUM-MODELS.md</a1>

seg-753f0302eeef = Strona tematu: <a1>QUANTUM.md</a1>

seg-bb07c8ee153f = <b>PARTNER</b> Nie jest zapewniane — tylko modele wydajności; sprzęt na zimnych atomach/zegary należy do partnera. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-f44afe581836 = { $version }

seg-c37642bb24fe = <b>MODELLED</b> Jeden odtwarzalny obiekt TradeEvidence (stała rama: scenariusz+ziarno+silnik; wspólne wartości kwantowe i klasyczne dla każdego wskaźnika jakości z korzyścią o właściwej polaryzacji, opcjonalny { "95" }%. Wyrocznia (InternalConsistency): tożsamości w postaci zamkniętej dla korzyści i zwycięzcy + wierne opakowanie istniejącego quantum_trade::TradeResult; rzetelność powiązana z rejestrem reprezentatywności i etykietami weryfikacji

seg-eb75c6a4dcec = Bilans kwantowy a klasyczny (wspólny kształt) jest MODELLED, nie sprawdzony względem niezależnego wzorca zewnętrznego: sprawdzony względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-bfbcc7e8f620 = Źródło: <c1/>

seg-cfa59601df4a = <c1/> (rodzaj scenariusza)

seg-790fbfdd80f0 = Kwantowa nawigacja bez GNSS, MODELLED: podczas utraty sygnału GNSS bilans inercyjny kwantowy (interferometr zimnych atomów) wobec klasycznego INS klasy nawigacyjnej — narastanie błędu pozycji w czasie wybiegu, holdover do progu pozycji oraz bilans kwantowy a klasyczny jako rzetelne TradeEvidence z reprezentatywnością. Rzetelna uwaga o obserwowalności: bez zewnętrznego rozwiązania pozycji bias akcelerometru jest nieobserwowalny, więc błąd rośnie; czujnik kwantowy spowalnia, lecz nie zamyka tej luki. Ilustracyjne parametry urządzeń ze źródeł publicznych; modeluje klasę, bez TRL, lotu i certyfikacji.

seg-dd74f248373d = Jeden przebieg <c1/> podsumowuje się tak: quantum-gnss-free-nav | utrata sygnału 300s | błąd pozycji kwantowy { "0.00" } m wobec klasycznego { "37.31" } m (8289.5x) | holdover kwantowy 44721s wobec klasycznego 534s (próg { "100" } m) | bilans: kwantowy wygrywa 2/2 | MODELLED

seg-960491d74173 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-88d9dfe0353a = Przykład <c1/> ustawia między innymi:

seg-1bdbf1a737b2 = Wykres zapisany przez silnik dla scenarios/quantum-gnss-free-nav.toml, rodzaj quantum-gnss-free-nav

seg-d196391dcf4f = <b>MODELLED</b> Nawigacja zliczeniowa kwantowa (interferometr zimnych atomów) wobec klasycznego INS klasy nawigacyjnej podczas utraty sygnału GNSS: narastanie błędu pozycji, holdover do progu pozycji,. Wyrocznia (InternalConsistency): ponownie użyte bilanse inercyjne skontrolowane krzyżowo względem niezależnego całkowania podwójnego tego samego równania różniczkowego nawigacji zliczeniowej w Octave (inne środowisko uruchomieniowe, wspólny model → ReferenceImpl) oraz opublikowanego krótkoterminowego szumu Freier-2016 jako jednostronnej kotwicy; złożenie kwantowe a klasyczne pozostaje MODELLED

seg-af35cccc4e2c = Kwantowa nawigacja bez GNSS, MODELLED: podczas utraty sygnału GNSS bilans inercyjny kwantowy (interferometr zimnych atomów) wobec klasycznego INS klasy nawigacyjnej — narastanie błędu pozycji w czasie wybiegu, holdover do progu pozycji oraz bilans kwantowy a klasyczny jako rzetelne TradeEvidence z reprezentatywnością. (katalog rodzajów (<c1/>))

seg-9b9ce7600ffc = Kwantowa nawigacja bez GNSS — nawigacja zliczeniowa kwantowa (interferometr zimnych atomów) wobec klasycznego INS klasy nawigacyjnej podczas utraty sygnału GNSS. MODELLED; ilustracyjne parametry urządzeń ze źródeł publicznych; modeluje klasę, bez deklaracji TRL ani lotu. (komentarz w pliku scenariusza, wiersze { "1" } do { "3" })

seg-9d67411151e3 = Kwantowa nawigacja bez GNSS jest MODELLED, nie sprawdzona względem niezależnego wzorca zewnętrznego: sprawdzona względem własnej tożsamości w postaci zamkniętej lub analitycznej — wychwytuje błędy przepisania i współczynników, ale nie jest wyrocznią zewnętrzną. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-e1d502e1ed6d = <s1>Poprzednia</s1>quantum-anomaly-detect

seg-1f3705925b3c = <s1>Następna</s1>quantum-time-transfer
