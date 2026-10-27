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
