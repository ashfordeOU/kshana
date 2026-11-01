# docs--kind-telecom-timing: translations (pl)

seg-f42465f7d066 = ns

seg-98151954f217 = false

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-e1b9b2d674eb = <b>MODELLED</b> clock_log::read_input: jedna warstwa parsera, która zamienia plik zegara RINEX (rekordy AS/AR jednego nazwanego zegara, wersje { "2" } i { "3.00" } do { "3.04" }), dziennik fazy lub częstotliwości ASCII w stylu TimeLab albo dziennik znaczników czasu lub interwałów TAPR TICC w jednolity pha Testy: <a1>clock_log_allantools.rs</a1>.

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-e7273fd2a640 = <b>VALIDATED</b> Maksymalny błąd przedziału czasu i odchylenie czasu, które raportuje rodzaj scenariusza <c1/>, na zapisie holdover w skali telekomunikacyjnej: O(n) przesuwna kolejka monotoniczna. Wyrocznia (ExternalDataset): allantools { "2024.06" } — niezależna biblioteka stabilności częstotliwości innej firmy — mtie() i tdev() na tests/fixtures/telecom_timing/holdover_te_series.csv, szereg sparsowany z tego samego tekstu o 17 cyfrach znaczących po obu stronach; wzorzec zapisuje SHA-256 szeregu i można go odtworzyć offline przez tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Waliduje ESTYMATORY na tym zapisie, nie syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Przepisane limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC zablokowanego i holdover ePRTC-A (w tym obwiednia błędu czasu z tabeli { "3" }. Wyrocznia (InternalConsistency): transkrypcja wymienionych Rekomendacji (do swobodnego pobrania z itu.int), każdy limit z podaniem tabeli lub punktu, wraz z wykazem każdej niepotwierdzonej lub niezaimplementowanej pozycji w docs/TELECOM-TIMING.md; tożsamości ciągłości w punktach załamania, które wynikają z tabel, są sprawdzane w testach. Transkrypcja norm z kontrolami spójności wewnętrznej, nie jest testem spełnienia wymagań normy ani zewnętrzną walidacją. { "0.30" } runda { "2" } (zarejestrowane z góry

seg-8aee75a55007 = ocxo

seg-9b72d3b3a0ab = Źródło: <c1/>

seg-f4dc88ffe6b5 = <c1/> (rodzaj scenariusza)

seg-a448b24ded2b = Synchronizacja telekomunikacyjna: błąd czasu, maksymalny błąd interwału czasu (MTIE) i odchylenie czasu (TDEV) holdover GNSS, sprawdzone względem masek ITU-T z wynikiem PASS lub FAIL i zapasem dla każdej maski. Dane wejściowe to albo SYNTETYCZNY HOLDOVER (predefiniowany oscylator -- ocxo, rubid, cez lub csac, każdy z wartościami stabilności, starzenia i temperatury z nazwanej publicznej karty katalogowej Microchip -- plus czas utraty GNSS, długość zapisu i interwał próbkowania; swobodnie biegnący zegar ma szum częstotliwości biały, migotania i, gdzie dopasowanie do karty katalogowej tego wymaga, błądzenia przypadkowego, liniowe starzenie i sinusoidalny składnik temperaturowy), albo WCZYTANA SERIA par [time_s, time_error_ns] podanych w treści (a tylko w kompilacjach natywnych także plik CSV). Maski: ITU-T G.8272 (07/2025) PRTC-A i PRTC-B (max|TE| { "100" } / { "40" } ns, MTIE Tabele 1-2, TDEV Tabele 3-4); G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC w stanie zaczepienia ({ "30" } ns, Tabele 1-2) i holdover ePRTC-A (obwiednia błędu czasu z Tabeli { "3" } rosnąca od { "30" } ns do { "100" } ns w okresie holdover H wyznaczonym przez czas zaczepienia, MTIE Tabela { "4" }, TDEV Tabela { "5" }); G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) klasy T-BC/T-TSC A-C (max|TE|, stały błąd czasu, MTIE i TDEV filtrowane dolnoprzepustowo) oraz klasa D (max|TE_L| { "5" } ns, jedyna wartość klasy D, która nie została pozostawiona do dalszych badań); G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) punkt odniesienia C (max|TE_L| { "1100" } / { "600" } / { "100" } ns z MTIE Tabele 7-1 do 7-3). Każda pozycja, którą Zalecenie oznacza jako przeznaczoną do dalszych badań, jest pominięta, a nie wypełniona, a każdy raport wymienia, czego nie zaimplementowano. Podaje też czas przekroczenia każdego budżetu maksymalnego błędu czasu (domyślnie: { "100" } ns max|TE_HO| ePRTC, { "400" } ns alokacja holdover sieci, { "1100" } ns punkt C, { "1.5" } us klasa { "4" }), krzywe MTIE/TDEV jako tabelę CSV z każdym limitem maski oraz wpis jednostek i pochodzenia dla każdego pola liczbowego. VALIDATED: estymatory MTIE i TDEV względem pakietu allantools na zatwierdzonym szeregu holdover. MODELLED: tabele masek są transkrypcjami, a syntetyczny holdover jest modelem zbudowanym z maksimów z kart katalogowych, a nie pomiarem żadnego egzemplarza. To nie jest test zgodności.

seg-07f81cfd606a = Jeden przebieg <c1/> podsumowuje się tak: telecom-timing: max|TE| { "488.2" } ns w { "12000" } s; g8262-eec-option-1 FAIL, g8262-eec-option-2 FAIL, g8262-1-eeec FAIL (MODELLED)

seg-17f291bfc65d = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-d192feecd4b3 = Przykład <c1/> ustawia między innymi:

seg-e7cab30ef039 = [] (brak elementów)

seg-864d84810a5c = [g8262-eec-option-1, g8262-eec-option-2, g8262-1-eeec]

seg-01b1287f233b = Etykieta wyniku (silnika): MODELLED — błąd czasu, MTIE i TDEV sprawdzone względem przepisanych masek ITU-T. Estymatory są sprawdzone względem allantools; tabele masek są transkrypcjami nazwanych Zaleceń; syntetyczny holdover jest modelem zbudowanym z publicznych wartości z kart katalogowych, a nie pomiarem żadnego egzemplarza. To nie jest

seg-ec7745a09d08 = Wykres zapisany przez silnik dla scenarios/telecom-synce-eec.toml, rodzaj telecom-timing

seg-219651a7958b = MODELLED { "5" } · VALIDATED { "1" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-c21ebd79f497 = <b>VALIDATED</b> Maksymalny błąd interwału czasu i odchylenie czasu, które raportuje rodzaj scenariusza <c1/>, na zapisie holdover w skali telekomunikacyjnej: MTIE O(n) w oknie przesuwnym z monotoniczną kolejką (telecom_timing::mtie_sliding, potrzebne, by doba próbek jednosekundowych Testy: <a1>telecom_timing_reference.rs</a1>.

seg-75aa6f7234ae = <b>MODELLED</b> Przepisane limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. Testy: <a1>telecom_timing_reference.rs</a1>.

seg-d0ab0ca72b80 = <b>MODELLED</b> Siedem masek generowania dryfu MTIE i TDEV przy stałej temperaturze dla rodzaju <c1/>: G.811 (09/1997) PRC (autonomiczny), G.812 (06/2004) Typy I, II i III, G.8262 (10/2024) EEC Opcje { "1" } i { "2" } oraz G.8262.1 (11/2025) eEEC (zaczepiony

seg-d4bd840708db = <b>MODELLED</b> Cztery predefiniowane ustawienia — OCXO (Microchip OX-208), rubid (Microchip 8040C), cez (Microchip 5071A, tuba wysokiej wydajności) i CSAC (Microchip SA.45s) — każde niosące . Wyrocznia (InternalConsistency): cztery nazwane karty katalogowe Microchip (numery dokumentów i adresy URL w każdym ustawieniu i w docs/TELECOM-TIMING.md) dla wartości wejściowych; zamknięta rampa starzenia i własność obwiedni dopasowania jako kontrole wewnętrzne. To, jak wartości stają się modelem szumu — dopasowanie, reguła podłogi, 30-dniowy miesiąc, liniowy odczyt temperatury — jest wyborem modelowania; żadne ustawienie nie jest pomiarem egzemplarza. { "0.30" } runda { "2" }, jednostronne progi wobec

seg-cbb39b4105ac = każde wymaganie, które Zalecenia oznaczają jako „do dalszych badań” (klasa D poza max|TE_L|, holdover ePRTC-B, holdover T-BC/T-TSC przy utracie obu wejść, limity sieciowe TDEV, MTIE i TDEV holdover ePRTC-A poza { "10 000" } s) (wynik <c1/>)

seg-a70f575aeb21 = dynamiczny błąd czasu filtrowany górnoprzepustowo (dTE_H, G.8273.2 Tabela 7-7 i G.8271.1 punkty 7.3.2-7.3.3) (wynik <c1/>)

seg-66446247fc49 = MTIE przy zmiennej temperaturze z G.8273.2 Tabela 7-6 oraz MTIE holdover wspomaganego warstwą fizyczną z G.8273.2 Tabela 7-10 (wynik <c1/>)

seg-c1d601b45182 = względny błąd czasu (cTE_R, dTE_R,L) między dwoma wyjściami (wynik <c1/>)

seg-6146f857c2df = filtr pakietowy ze średnią kroczącą, o którym mówią G.8272 i G.8272.1 dla interfejsów PTP: szereg jest traktowany jako błąd interwału czasu jednego impulsu na sekundę (wynik <c1/>)

seg-d5e956023b48 = MODELLED — błąd czasu, MTIE i TDEV sprawdzone względem przepisanych masek ITU-T. Estymatory są sprawdzone względem allantools; tabele masek są transkrypcjami nazwanych Zaleceń; syntetyczny holdover jest modelem zbudowanym z publicznych wartości z kart katalogowych, a nie pomiarem żadnego egzemplarza. To nie jest test zgodności. (wynik <c1/>)

seg-f163ae37b8c7 = MODELLED: tabele masek są transkrypcjami, a syntetyczny holdover jest modelem zbudowanym z maksimów z kart katalogowych, a nie pomiarem żadnego egzemplarza. (katalog rodzajów (<c1/>))

seg-a0ddb65b00af = Zegar: ustawienie OCXO (karta katalogowa Microchip OX-208, Rev 12-1-2021), swobodnie biegnące od pierwszej próbki z szumem częstotliwości białym, migotania i (gdzie dopasowanie tego wymaga) błądzenia przypadkowego, dopasowanym do maksimów odchylenia Allana z karty katalogowej, oraz jego liniowe starzenie. Temperatura jest stała (amplituda { "0" } K), jak zakładają maski. (komentarz w pliku scenariusza, wiersze { "12" } do { "15" })

seg-101dbde1c65b = Strona tematyczna: <a1>CLOCK-LOG-FORMATS.md</a1>

seg-c32dc02f981d = <s1>Poprzednia</s1>sweep

seg-8aef86c9aa68 = <s1>Następna</s1>terrain-nav

seg-5547f1f662d3 = oraz { "2" } więcej w macierzy.
