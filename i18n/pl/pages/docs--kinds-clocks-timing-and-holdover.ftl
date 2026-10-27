# docs--kinds-clocks-timing-and-holdover: translations (pl)

seg-b03d56f501c3 = Rodzaj

seg-78cba87823f7 = Holdover zegara względem specyfikacji; opcjonalny zespół Monte Carlo (runs > { "1" }).

seg-cb0b7da83f5c = Wykres zapisywany przez silnik dla scenarios/clock-ensemble.toml, rodzaj clock

seg-c0924aa36e64 = MODELLED test holdover systemu synchronizacji czasu, oceniany na podstawie zapisu błędu czasu dostarczonego przez OPERATORA (log linuxptp ptp4l, phc2sys lub ts2phc, log chrony tracking lub statistics, log zegara TICC, TimeLab lub RINEX albo pary time_s,time_error_ns). Test ma cztery kroki i Kshana nie wykonuje żadnego z nich: zablokowany punkt odniesienia (BASELINE), GNSS ODŁĄCZONY przez operatora (kabel antenowy lub wyjście symulatora; Kshana niczego nie nadaje i niczym nie steruje) w podanym czasie, HOLDOVER na własnym oscylatorze systemu oraz ODZYSKANIE po przywróceniu przez operatora GNSS w drugim podanym czasie. Zapis jest dzielony w tych dwóch momentach. Punkt odniesienia: statystyki błędu czasu i maski ITU-T napisane dla zegara zablokowanego. Holdover: statystyki, ułamkowe przesunięcie częstotliwości, które system utrzymał (prosta metodą najmniejszych kwadratów), maski napisane dla holdover lub zegara autonomicznego, obwiednia holdover ePRTC-A z podanego czasu zablokowania oraz czas przekroczenia każdego budżetu błędu czasu. Odzyskanie: czy i kiedy |TE| zmieścił się w podanym paśmie i w nim pozostał, wartość szczytowa i największy skok. Każdy limit jest przepisany z publicznej tabeli ITU-T (maski synchronizacji telekomunikacyjnej); sformułowanie brzmi „zmierzone względem maski”, a oba momenty są oświadczeniem operatora, nie są weryfikowane. Zapis zbyt krótki dla maski to INCOMPLETE, nigdy nie jest ekstrapolowany. Zob. docs/TIMING-HIL.md.

seg-8ce93392747b = Wykres zapisany przez silnik dla scenarios/holdover-test-ptp4l.toml, rodzaj holdover-test
