# docs--kind-holdover-test: translations (pl)

seg-f42465f7d066 = ns

seg-51362910dcb7 = Tego rodzaju używa { "2" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-73929aeded02 = Źródło: <c1/>

seg-218f00012d0e = <c1/> (rodzaj scenariusza)

seg-c0924aa36e64 = MODELLED test holdover systemu synchronizacji czasu, oceniany na podstawie zapisu błędu czasu dostarczonego przez OPERATORA (log linuxptp ptp4l, phc2sys lub ts2phc, log chrony tracking lub statistics, log zegara TICC, TimeLab lub RINEX albo pary time_s,time_error_ns). Test ma cztery kroki i Kshana nie wykonuje żadnego z nich: zablokowany punkt odniesienia (BASELINE), GNSS ODŁĄCZONY przez operatora (kabel antenowy lub wyjście symulatora; Kshana niczego nie nadaje i niczym nie steruje) w podanym czasie, HOLDOVER na własnym oscylatorze systemu oraz ODZYSKANIE po przywróceniu przez operatora GNSS w drugim podanym czasie. Zapis jest dzielony w tych dwóch momentach. Punkt odniesienia: statystyki błędu czasu i maski ITU-T napisane dla zegara zablokowanego. Holdover: statystyki, ułamkowe przesunięcie częstotliwości, które system utrzymał (prosta metodą najmniejszych kwadratów), maski napisane dla holdover lub zegara autonomicznego, obwiednia holdover ePRTC-A z podanego czasu zablokowania oraz czas przekroczenia każdego budżetu błędu czasu. Odzyskanie: czy i kiedy |TE| zmieścił się w podanym paśmie i w nim pozostał, wartość szczytowa i największy skok. Każdy limit jest przepisany z publicznej tabeli ITU-T (maski synchronizacji telekomunikacyjnej); sformułowanie brzmi „zmierzone względem maski”, a oba momenty są oświadczeniem operatora, nie są weryfikowane. Zapis zbyt krótki dla maski to INCOMPLETE, nigdy nie jest ekstrapolowany. Zob. docs/TIMING-HIL.md.

seg-cd6d840a1382 = Jeden przebieg <c1/> podsumowuje się tak: holdover-test: holdover { "1795" } s, max|TE| { "59.0" } ns; prtc-a PASS, eprtc-a-holdover FAIL; recovered { "0" } s after GNSS returned (MODELLED, measured against the mask)

seg-6a3dc8804be5 = Wymagane pola: <c1/>, <c2/>

seg-4792040e4773 = Pola opcjonalne: <c1/>, <c2/>

seg-ad4f9c40e317 = Przykład <c1/> ustawia między innymi:

seg-f0517ab67e28 = [prtc-a, eprtc-a-holdover]

seg-fe13d0e59509 = ptp4l[{ "1000.000" }]: master offset -4 s2 freq + { "1200" } pa

seg-a0f9749e9ca1 = master

seg-cd857523297f = phase

seg-29a012ae4735 = refuse

seg-d578fc8e6052 = Etykieta wyniku (silnika): MODELLED — test holdover oceniany na podstawie zapisu błędu czasu dostarczonego przez operatora. Każdy limit jest przepisany z wymienionej publicznej Rekomendacji ITU-T, a wynik jest zmierzony względem maski; nie mówi nic o tym, czy jakikolwiek zegar lub system spełnia Rekomendację, i nikt nie ocenił ani nie zatwierdził

seg-8ce93392747b = Wykres zapisany przez silnik dla scenarios/holdover-test-ptp4l.toml, rodzaj holdover-test

seg-3361819ae321 = <b>MODELLED</b> Rodzaj <c1/>: zapis błędu czasu (log linuxptp, chrony, TICC, TimeLab lub RINEX albo pary time_s,time_error_ns) jest dzielony w dwóch momentach podanych przez operatora dla odłączenia i przywrócenia GNSS na punkt odniesienia, holdover a

seg-e7273fd2a640 = <b>VALIDATED</b> Maksymalny błąd przedziału czasu i odchylenie czasu, które raportuje rodzaj scenariusza <c1/>, na zapisie holdover w skali telekomunikacyjnej: O(n) przesuwna kolejka monotoniczna. Wyrocznia (ExternalDataset): allantools { "2024.06" } — niezależna biblioteka stabilności częstotliwości innej firmy — mtie() i tdev() na tests/fixtures/telecom_timing/holdover_te_series.csv, szereg sparsowany z tego samego tekstu o 17 cyfrach znaczących po obu stronach; wzorzec zapisuje SHA-256 szeregu i można go odtworzyć offline przez tests/fixtures/telecom_timing/generate_telecom_timing_reference.py. Waliduje ESTYMATORY na tym zapisie, nie syn

seg-4cf0f94f96c9 = <b>MODELLED</b> Przepisane limity ITU-T G.8272 (07/2025) PRTC-A/B, G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) ePRTC zablokowanego i holdover ePRTC-A (w tym obwiednia błędu czasu z tabeli { "3" }. Wyrocznia (InternalConsistency): transkrypcja wymienionych Rekomendacji (do swobodnego pobrania z itu.int), każdy limit z podaniem tabeli lub punktu, wraz z wykazem każdej niepotwierdzonej lub niezaimplementowanej pozycji w docs/TELECOM-TIMING.md; tożsamości ciągłości w punktach załamania, które wynikają z tabel, są sprawdzane w testach. Transkrypcja norm z kontrolami spójności wewnętrznej, nie jest testem spełnienia wymagań normy ani zewnętrzną walidacją. { "0.30" } runda { "2" } (zarejestrowane z góry

seg-142528f34e66 = <b>MODELLED</b> Rodzaj <c1/>: zapis błędu czasu (log linuxptp, chrony, TICC, TimeLab lub RINEX albo pary time_s,time_error_ns) jest dzielony w dwóch momentach. Wyrocznia (InternalConsistency): obliczenia ręczne na zapisach zbudowanych ze wzorów, których nachylenie, skok, ekstremum i czas odzyskania są znane przed przebiegiem (podają je testy), oraz maski, obwiednia i budżety z wierszy synchronizacji telekomunikacyjnej powyżej. Nie oceniono żadnego laboratoryjnego pomiaru rzeczywistego holdover i nie porównano z żadną zewnętrzną wyrocznią, więc rodzaj nie formułuje żadnego twierdzenia o żadnym zegarze ani systemie; potrzebny jest partner z laboratorium czasu, zanim powstanie jakikolwiek wynik dla klasy zegara

seg-59ff0b0e3d2d = MODELLED — test holdover oceniany na podstawie zapisu błędu czasu dostarczonego przez operatora. Każdy limit jest przepisany z wymienionej publicznej Rekomendacji ITU-T, a wynik jest zmierzony względem maski; nie mówi nic o tym, czy jakikolwiek zegar lub system spełnia Rekomendację, i nikt go nie ocenił ani nie zatwierdził. Momenty usunięcia i przywrócenia GNSS są oświadczeniem operatora i nie są weryfikowane. Oprogramowanie wyłącznie dor (wynik <c1/>)

seg-daeb4ad7aa35 = MODELLED test holdover systemu synchronizacji czasu, oceniany na podstawie zapisu błędu czasu dostarczonego przez OPERATORA (log linuxptp ptp4l, phc2sys lub ts2phc, log chrony tracking lub statistics, log zegara TICC, TimeLab lub RINEX albo pary time_s,time_error_ns). (katalog rodzajów (<c1/>))

seg-ff3008c250cc = Maski synchronizacji telekomunikacyjnej ITU-T z PASS/FAIL i marginesem są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8ccd0f911626 = Test holdover oceniany na podstawie zapisu błędu czasu dostarczonego przez operatora jest MODELLED, nie jest sprawdzony względem niezależnego wzorca: sprawdzony względem własnej tożsamości w postaci zamkniętej / analitycznej, wychwytuje błędy transkrypcji i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-72bad5444282 = Strona tematu: <a1>TIMING-HIL.md</a1>

seg-3b3a24664dae = Strona tematu: <a1>HARDWARE-SAFETY.md</a1>

seg-b754be35fb52 = <s1>Poprzedni</s1>gravity-map

seg-e7665ee5e30e = <s1>Następny</s1>hybrid-optical-rf
