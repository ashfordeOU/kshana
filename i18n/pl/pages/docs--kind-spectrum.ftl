# docs--kind-spectrum: translations (pl)

seg-37d16b499bc5 = dB

seg-59afd80736c5 = <b>PARTNER</b> Nie zapewnia się — Kshana modeluje osiągi sygnału, a nie sprzęt ładunku użytecznego / anten. Wyrocznia (NoneKind): brak: dyscyplina należąca do partnera, z założenia bez modułu i bez testu

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-304496607bd7 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zagłuszanie (jamming), spoofing i widmo</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-5d23d7f8f872 = Strona rodziny: <a1>Zagłuszanie (jamming), spoofing i widmo</a1>

seg-f85a85f0c7e4 = MHz

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-3319b18ac61f = oraz { "1" } kolejny w macierzy.

seg-ab8fe1c3cb79 = Źródło: <c1/>

seg-10a4479141b5 = <c1/> (rodzaj scenariusza)

seg-fef00c827c6a = Model widma pasma L i wodospad: całe pasmo L GNSS jako jedna gęstość widmowa mocy (PSD), częstotliwość w poziomie, czas w dół, dla skryptowanej osi czasu zagłuszacza. SYGNAŁY: GPS L1 C/A i L2C (BPSK({ "1" })), usługa otwarta Galileo E1 (MBOC(6,1,1/11) lub BOC({ "1,1" })), GPS L5 i Galileo E5a (BPSK({ "10" })), każdy na swojej nośnej z minimalną mocą odbieraną z specyfikacji interfejsu (IS-GPS-200, IS-GPS-705, Galileo OS SIS ICD), chyba że ją nadpisano; GLONASS, BeiDou i Galileo E6 nie są modelowane. ZAGŁUSZACZE: ton fali ciągłej, płaski szum wąskopasmowy, liniowy chirp piłokształtny i szum szerokopasmowy dopasowany do modulacji własnego pasma, każdy z częstotliwością środkową, szerokością pasma, mocą odbieraną (bezpośrednio albo EIRP i odległość przez tłumienie w wolnej przestrzeni rodzaju jamming) oraz czasami włączenia i wyłączenia. Każdy zagłuszacz jest oceniany względem każdego pasma przez jego współczynnik rozdziału widmowego kappa w paśmie odbiornika oraz (C/N0)_eff = [1/(C/N0) + sum (J/S) kappa]^-1; dla jednego zagłuszacza jest to równe równaniu przeciwzagłuszeniowemu rodzaju jamming z Q = 1/(R_c kappa), a raport zawiera tę kontrolę krzyżową (oraz obok niej reprezentatywną wartość Q rodzaju jamming). Podłoga szumu to k T_sys z T_sys = T_ant + { "290" } K (F - { "1" }). Wodospad uśrednia każdą komórkę po jej przedziale i wierszu (chirpy dokładnie, całe przemiatania plus częściowe; zagłuszacze przełączające się w środku wiersza według swojego współczynnika wypełnienia), więc oś czasu C/N0 i obraz pochodzą z tych samych liczb; result.json zawiera siatkę uśrednioną blokowo w mocy, C/N0 i J/S dla każdego pasma w każdym wierszu oraz dla każdego zagłuszacza i pasma SSC, Q, J/S, J/S w paśmie i ustalone C/N0. Opcjonalnie [iq]: model narysowany jako zespolone IQ w jednej chwili, zapisany do nagrania SigMF i odczytany z niego (cf32_le lub ci16_le) oraz porównany z estymatą Welcha. Opcjonalnie [recording] (kompilacje natywne): PSD Welcha rzeczywistego nagrania SigMF obok modelu. VALIDATED: PSD sygnałów względem podręcznikowych szerokości głównego listka (BPSK(n) 2n x { "1.023" } MHz od zera do zera; listki BOC({ "1,1" }) wyśrodkowane na +/-1.023 MHz) oraz współczynniki rozdziału widmowego względem ich postaci zamkniętych z Parsevala i Q Kaplana i Hegarty'ego = { "1" } (CW) i { "1.5" } (dopasowany). MODELLED: moce zagłuszaczy, oś czasu, szerokości pasma toru wejściowego, traktowanie widma ciągłego (bez linii kodu) oraz brak AGC, wygaszania i charakterystyki anteny.

seg-92f1d6d2c0f2 = Jeden przebieg <c1/> podsumowuje się tak: scenario spectrum | { "5" } pasm | { "3" } zagłuszacze | podłoga szumu -202.0 dBW/Hz | najgorsze pasmo gps-l1ca min. C/N0 { "3.2" } dB-Hz (J/S { "60.2" } dB)

seg-ed3a383d6f1e = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>

seg-fb332c77fd0e = Przykład <c1/> ustawia między innymi:

seg-df78607f9cdb = Etykieta wyniku (silnika): MODELLED: gęstość widmowa mocy pasma L zbudowana z widm sygnałów w postaci zamkniętej (VALIDATED względem podręcznikowych szerokości głównego listka i współczynników rozdziału widmowego), widm zagłuszaczy i podłogi szumu kT, sprowadzona do J/S i efektywnego C/N0 przez współczynnik rozdziału widmowego. Moce zagłuszaczy, t

seg-ea1678eb9e84 = Wykres zapisany przez silnik dla scenarios/l-band-waterfall-jamming.toml, rodzaj spectrum

seg-ce0afea7b030 = <b>VALIDATED</b> Gęstości widmowe mocy o jednostkowym polu GPS L1 C/A i L2C (BPSK({ "1" })), GPS L5 i Galileo E5a (BPSK({ "10" })), sinusoidalne BOC({ "1,1" }) i Galileo E1 MBOC(6,1,1/11) (navsignal::Modulation::psd, z dodanym wariantem MBOC), ich numerycznie wyznaczone zera i

seg-7e315c5675d0 = <b>MODELLED</b> Rodzaj <c1/>: siatka częstotliwość-czas gęstości widmowej mocy pasma L (podłoga termiczna k T_sys z T_sys = T_ant + { "290" } K (F - { "1" }), sygnały przy minimalnych mocach odbieranych z specyfikacji interfejsu oraz fala ciągła, wąskopasm

seg-7871f9f54ef4 = <b>VALIDATED</b> sigmf: odczyt i zapis nagrań Signal Metadata Format (JSON .sigmf-meta z podstawowymi polami global, captures i annotations; surowe .sigmf-data jako cf32_le, ci16_le lub ci8, dekodery całkowitoliczbowe wspólne z realdata::iqif::load_iq), wszystko na s

seg-4e35cc861b15 = <b>VALIDATED</b> Gęstości widmowe mocy o jednostkowym polu GPS L1 C/A i L2C (BPSK({ "1" })), GPS L5 i Galileo E5a (BPSK({ "10" })), sinusoidalne BOC({ "1,1" }) i Galileo E1 MBOC(6,1,1/11) (navsignal::M. Wyrocznia (ExternalDataset): opublikowane wartości podręcznikowe: główny listek BPSK(n) 2n x { "1.023" } MHz od zera do zera oraz współczynniki przeciwzagłuszeniowe Q = { "1" } dla zagłuszacza wąskopasmowego (CW) i Q = { "1.5" } dla zagłuszacza rozproszonego widmowo dopasowanego do C/A (Kaplan i Hegarty, Understanding GPS/GNSS, wyd. 3, rozdział { "9.4" }); główne listki BOC(m,n) wyśrodkowane na plus lub minus m x { "1.023" } MHz (Betz, Binary Offset Carrier Modulations for Radionavigation, NAVIGATION { "48" }({ "4" }), { "2001" });

seg-287de49e90a8 = <b>MODELLED</b> Rodzaj <c1/>: siatka częstotliwość-czas gęstości widmowej mocy pasma L (podłoga termiczna k T_sys z T_sys = T_ant + { "290" } K (F - { "1" }), sygnały przy. Wyrocznia (InternalConsistency): redukcja do równania przeciwzagłuszeniowego i bilansu łącza istniejącego rodzaju <c2/> (ten sam kod, wywołany na tych samych wejściach) oraz postać zamknięta podłogi szumu k T0 F. Widma sygnałów leżące pod spodem to sprawdzony wiersz powyżej; moce zagłuszaczy, oś czasu i szerokości pasma toru wejściowego są wejściami scenariusza, widma są ciągłe (bez linii kodu rozpraszającego), a na zagłuszacz nie działa żadne automatyczne sterowanie wzmocnieniem, wygaszanie ani charakterystyka anteny

seg-4eca77cc59c4 = <b>VALIDATED</b> sigmf: odczyt i zapis nagrań Signal Metadata Format (JSON .sigmf-meta z podstawowymi polami global, captures i annotations; surowe .sigmf-data jako cf32_le, ci1. Wyrocznia (ExternalDataset): scipy { "1.18.1" } scipy.signal.welch (BSD-3-Clause) z tym samym okresowym oknem Hanna, nakładaniem, skalowaniem gęstości, bez usuwania trendu i dwustronnym uśrednianiem: każdy przedział w granicach { "1e-12" } względnie (zaobserwowano { "6.0e-14" }) w { "27" } przypadkach, z liczbami segmentów wziętymi z własnego spektrogramu scipy. sigmf-python { "1.13.0" } (LGPL-3.0, uruchamiany jako narzędzie) zapisuje pięć nagrań od zewnętrznych autorów (cf32_le, ci16_le, ci8, dwa przechwycenia z adnotacjami, niezerowy fir

seg-0cbbe567f1c8 = struktura linii kodu rozpraszającego (na przykład linie { "1" } kHz C/A): tony są oceniane względem gładkiej obwiedni (wynik <c1/>)

seg-2efdae3f5764 = automatyczne sterowanie wzmocnieniem, kwantyzacja, wygaszanie impulsów i filtrowanie notch (wynik <c1/>)

seg-f3e58705c9a2 = charakterystyka anteny odbiorczej w kierunku zagłuszacza poza jedną wartością wzmocnienia (wynik <c1/>)

seg-c0d379cb1ab3 = zakłócenia wielodostępu wewnątrz systemu między satelitami jednego pasma (wynik <c1/>)

seg-83f414112e45 = GLONASS G1/G2, BeiDou B1/B2 i Galileo E6 (wynik <c1/>)

seg-249d8a46f95a = emisje zaprojektowanego sygnału poza jego pasmem nadawania: jego widmo jest tam obcięte, więc żadna emisja poza pasmem nie dociera do sąsiedniego pasma (wynik <c1/>)

seg-cc83c047f02a = wpływ chirpu na pętlę przy szybkościach przemiatania porównywalnych z szerokością pasma pętli: jego C/N0 korzysta z widma uśrednionego po wierszach (wynik <c1/>)

seg-7155706bc289 = MODELLED: gęstość widmowa mocy pasma L zbudowana z widm sygnałów w postaci zamkniętej (VALIDATED względem podręcznikowych szerokości głównego listka i współczynników rozdziału widmowego), widm zagłuszaczy i podłogi szumu kT, sprowadzona do J/S i efektywnego C/N0 przez współczynnik rozdziału widmowego. Moce zagłuszaczy, oś czasu i szerokości pasma toru wejściowego są wejściami scenariusza, a nie pomiarami. (wynik <c1/>)

seg-95879767c438 = Strona tematyczna: <a1>LEO-SIGNAL.md</a1>

seg-ce69d8d2d9d1 = <s1>Poprzednia</s1>space-weather

seg-ac2c9c25fbb6 = <s1>Następna</s1>spoof-detect

seg-9ca82c79430e = <b>MODELLED</b> Rodzaj <c1/> rozszerzony poza pasmo L: pasma podane jako predefiniowany projekt sygnału (rysowany ze wszystkimi składowymi, ograniczony do szerokości pasma nadawania, C/N0 i J/S odniesione do śledzonej składowej) albo jako własna nośna i modulacja Testy: <a1>leo_signal_reference.rs</a1>.
