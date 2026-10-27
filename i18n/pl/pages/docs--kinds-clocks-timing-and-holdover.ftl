# docs--kinds-clocks-timing-and-holdover: translations (pl)

seg-b03d56f501c3 = Rodzaj

seg-78cba87823f7 = Holdover zegara względem specyfikacji; opcjonalny zespół Monte Carlo (runs > { "1" }).

seg-cb0b7da83f5c = Wykres zapisywany przez silnik dla scenarios/clock-ensemble.toml, rodzaj clock

seg-c0924aa36e64 = MODELLED test holdover systemu synchronizacji czasu, oceniany na podstawie zapisu błędu czasu dostarczonego przez OPERATORA (log linuxptp ptp4l, phc2sys lub ts2phc, log chrony tracking lub statistics, log zegara TICC, TimeLab lub RINEX albo pary time_s,time_error_ns). Test ma cztery kroki i Kshana nie wykonuje żadnego z nich: zablokowany punkt odniesienia (BASELINE), GNSS ODŁĄCZONY przez operatora (kabel antenowy lub wyjście symulatora; Kshana niczego nie nadaje i niczym nie steruje) w podanym czasie, HOLDOVER na własnym oscylatorze systemu oraz ODZYSKANIE po przywróceniu przez operatora GNSS w drugim podanym czasie. Zapis jest dzielony w tych dwóch momentach. Punkt odniesienia: statystyki błędu czasu i maski ITU-T napisane dla zegara zablokowanego. Holdover: statystyki, ułamkowe przesunięcie częstotliwości, które system utrzymał (prosta metodą najmniejszych kwadratów), maski napisane dla holdover lub zegara autonomicznego, obwiednia holdover ePRTC-A z podanego czasu zablokowania oraz czas przekroczenia każdego budżetu błędu czasu. Odzyskanie: czy i kiedy |TE| zmieścił się w podanym paśmie i w nim pozostał, wartość szczytowa i największy skok. Każdy limit jest przepisany z publicznej tabeli ITU-T (maski synchronizacji telekomunikacyjnej); sformułowanie brzmi „zmierzone względem maski”, a oba momenty są oświadczeniem operatora, nie są weryfikowane. Zapis zbyt krótki dla maski to INCOMPLETE, nigdy nie jest ekstrapolowany. Zob. docs/TIMING-HIL.md.

seg-8ce93392747b = Wykres zapisany przez silnik dla scenarios/holdover-test-ptp4l.toml, rodzaj holdover-test

seg-9a2bb9809aed = Dwukierunkowy satelitarny transfer czasu i częstotliwości między dwiema stacjami przez przekaźnik geostacjonarny: równanie dwukierunkowe rozwiązane względem T_A - T_B z uwzględnieniem każdego składnika nieodwrotnego (opóźnienia aparatury stacji, jonosfera w paśmie Ku, transponder, efekt Sagnaca), kwadraturowy budżet niepewności, w którym składnik typu A jest TDEV symulowanego łącza przy danym czasie uśredniania, symulowane łącze z szumem fazy białym i migotania oraz dobową nieodwrotnością, a także stabilność (tempo zmian, resztkowe RMS, TDEV, ADEV) dowolnych dostarczonych szeregów BIPM Circular T Section { "1" }, plików CSV MJD,ns lub zapisów zegara stacji IGS RINEX. MODELLED.

seg-92d3c84024d7 = Wykres zapisywany przez silnik dla scenarios/time-transfer-budget.toml, rodzaj time-transfer-budget

seg-ccb244e60d60 = Optyczny i radiowy (RF) dwukierunkowy transfer czasu i częstotliwości: porównanie.

seg-bd76bd68eab3 = Wykres zapisywany przez silnik dla scenarios/timetransfer.toml, rodzaj timetransfer

seg-4e31c8daf798 = Rejestr (ledger)

seg-45a59bc9ac90 = Źródło: <c1/>

seg-3b549536beed = Zegary, synchronizacja czasu i holdover (rodzina rodzajów scenariuszy)

seg-9095869ec445 = { "9" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-59c2beac56b5 = Strony tematyczne: <a1>TELECOM-TIMING</a1>, <a2>SLOT-TIMING</a2>, <a3>TIMING-HIL</a3>, <a4>CLOCK-LOG-FORMATS</a4>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a5>KINDS.md</a5>.

seg-b333618375db = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Zegary, synchronizacja czasu i holdover

seg-efd15cff3d32 = MODELLED (etykieta wyniku)

seg-ff7dca09f0f2 = Synchronizacja telekomunikacyjna: błąd czasu, maksymalny błąd przedziału czasu (MTIE) i odchylenie czasu (TDEV) holdoveru GNSS, sprawdzone względem masek ITU-T z werdyktem PASS lub FAIL i marginesem dla każdej maski.

seg-651ef9489065 = MODELLED { "5" } · VALIDATED { "1" }

seg-413edbab9fa9 = Czas szczelinowy: sekundy, po których swobodnie biegnący zegar opuszcza margines szczeliny routingu lub zadań indeksowanej czasem (największy bezwzględny błąd czasu, jaki szczelina toleruje), udział każdego składnika w tym

seg-23dbca6bce68 = MODELLED { "2" } · VALIDATED { "1" }

seg-d425ce2b9f9c = Dwukierunkowy satelitarny transfer czasu i częstotliwości między dwiema stacjami przez przekaźnik geostacjonarny: równanie dwukierunkowe rozwiązane względem T_A - T_B z uwzględnieniem każdego składnika nieodwrotnego (opóźnienia aparatury stacji, Ku

seg-a2a710b3204f = Test holdoveru systemu synchronizacji czasu MODELLED, oceniany na podstawie zapisu błędu czasu dostarczonego przez OPERATORA (log linuxptp ptp4l, phc2sys lub ts2phc, log śledzenia lub statystyk chrony, TICC, TimeLab lub RINEX

seg-1da440dd525c = Łańcuch zaufanego czasu kwantowego MODELLED: kompleksowy budżet transferu czasu kwantowego (zegar optycznej sieci atomowej + łącze splątania/pojedynczych fotonów) w porównaniu z klasycznym (CSAC + dwukierunkowy RF), ponownie użyta ochrona synchronizacji

seg-50d75d48ed43 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcjonalne: <c7/>, <c8/>.

seg-3273244f755c = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>clock</a1>.

seg-ee8d6e20c844 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Opcjonalne: <c7/>.

seg-e359cc42506e = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>sweep</a1>.

seg-616716b33732 = Pola wymagane: <c1/>, <c2/>, <c3/>.

seg-6f282be980ca = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>sweep-nd</a1>.

seg-79c3d3cd6c7d = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-c23e498daa3d = <b>Rejestr (ledger):</b> MODELLED { "5" } · VALIDATED { "1" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>telecom-timing</a1>.

seg-248e1686fddc = Pola wymagane: <c1/>, <c2/>. Opcjonalne: <c3/>.

seg-cc04bc2d43c5 = <b>Rejestr (ledger):</b> MODELLED { "2" } · VALIDATED { "1" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>slot-timing</a1>.

seg-50273a29deec = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-adf570e18299 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>timetransfer</a1>.

seg-5134a01b60a0 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>. Opcjonalne: <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-09b554a74d49 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>time-transfer-budget</a1>.

seg-58952681ea9d = Pola wymagane: <c1/>, <c2/>. Opcjonalne: <c3/>, <c4/>.

seg-635ec95c2e86 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>holdover-test</a1>.

seg-76bb4110ea36 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>.

seg-bb6d7df61e2f = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>quantum-time-transfer</a1>.

seg-245adc6e6766 = <s1>Poprzedni</s1>Kampanie

seg-960d5c757310 = <s1>Następny</s1>Konstelacje, pokrycie i geometria
