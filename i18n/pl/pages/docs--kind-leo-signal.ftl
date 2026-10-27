# docs--kind-leo-signal: translations (pl)

seg-37d16b499bc5 = dB

seg-37d29d8303fe = km

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-a3697ad561db = Hz

seg-1918189ac2bf = ppm

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-ae15d15bf151 = Strona tematu: <a1>LEO-PASS.md</a1>

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: całka sinusowa (sine_integral), ułamek mocy BPSK-R wewnątrz pasma dwustronnego w postaci zamkniętej (bpsk_power_in_band_closed_form), ograniczone pasmem. Wyrocznia (ExternalDataset): przypięte zewnętrznie: { "90.3" } procent mocy płata głównego, spójne drżenie early-late w podanym punkcie pracy, wartości tabeli całki sinusowej oraz współczynnik separacji widmowej własnej BPSK 2/({ "3" } R_c) przy zerowym przesunięciu. Tylko kontrole wewnętrzne, nie walidacja zewnętrzna: wzór zamknięty na szerokość pasma Gabora ograniczonego pasmem BPSK i jego asymptota oraz współczynnik separacji widmowej BPSK z przesunięciem przy niezerowych przesunięciach, oba

seg-faf2775f3003 = <b>MODELLED</b> Rodzaj <c1/>: parametryzowane projekty sygnałów (pasmo, szerokość pasma nadawania, przydział ITU; składowe akwizycyjne, danych i pilotowe z BPSK(n), BOC(m,n), MB. Wyrocznia (InternalConsistency): wzory zamknięte sprawdzone względem niezależnego wzorca z dwóch wierszy powyżej, tożsamość fałszywego alarmu detektora kwadratowego P_d(snr = { "0" }) = P_fa i średni czas akwizycji Holmesa oraz redukcja do własnego łańcucha SSC rodzaju widmowego (ten sam kod Jammer::ssc). Same projekty są danymi wejściowymi: ustawienia oznaczone REPRESENTATIVE lub WORKSHOP nie są opublikowanymi specyfikacjami, widma enhanced Feher QPSK, code shift keying i OFDM są przybliżane, a kształt

seg-051999733048 = Źródło: <c1/>

seg-16ae2a08d3c8 = <c1/> (rodzaj scenariusza)

seg-97b8d07150d4 = Projekty sygnałów LEO-PNT: parametryzowane sygnały pozycjonowania, nawigacji i czasu (PNT) na niskiej orbicie okołoziemskiej (LEO) dla dowolnego systemu, pasma i struktury. SYGNAŁ to pasmo (częstotliwość środkowa, szerokość pasma nadawania, przydział ITU RNSS/RDSS/MSS/EESS/non-RNSS/other) oraz składowe (akwizycyjna, danych, pilotowa; dowolny podzbiór), każda z modulacją (BPSK(n) z ułamkowym n, BOC(m,n), MBOC({ "6,1" },p) lub płaskie pasmo typu OFDM), udziałem mocy, opcjonalnymi przesunięciami podnośnych FDMA, długością kodu i szybkością danych. Sygnały pochodzą ze skompilowanych w program publicznych plików ustawień wstępnych (xona-pulsar, iridium-stl, starlink-soo, centispace, generic-c-band, generic-bands; każdy z adresem URL źródła, a każda niepublikowana wartość oznaczona jako REPRESENTATIVE) albo są zapisane bezpośrednio w scenariuszu. DLA KAŻDEGO SYGNAŁU: gęstość widmowa mocy ograniczona do pasma i ułamek mocy każdej składowej, który przepuszcza pasmo nadawania (postać zamknięta dla BPSK obok wartości numerycznej), szerokość pasma RMS (Gabora), jitter szumu termicznego śledzenia kodu w pętli śledzenia opóźnienia w funkcji C/N0 i odstępu early-late według wzoru early-late (koherentnego lub niekoherentnego) dla pasma ograniczonego, Betz i Kolodziejski { "2009" }, wraz z jego podręcznikową postacią dla pasma nieograniczonego i granicą Gabora dla zanikającego odstępu, dokładność wyznaczania odległości w metrach, przestrzeń poszukiwań akwizycji (przedziały Dopplera z maksymalnego Dopplera orbity plus składniki oscylatora i użytkownika, razy przedziały kodu), prawdopodobieństwo detekcji kwadratowej i średni czas akwizycji szeregowej i równoległej względem kodu, współczynnik separacji widmowej sygnału względem GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b i E5 AltBOC oraz każdego z nich względem sygnału wraz z degradacją C/N0, a także CW, szerokopasmowe i dopasowane J/S tolerowane przez śledzoną składową, z własnego mechanizmu SSC rodzaju spectrum. ZESTAWIENIE PASM: opóźnienie jonosferyczne pierwszego rzędu ({ "40.3" } TEC/f^{ "2" }), tłumienie w wolnej przestrzeni, dokładność wyznaczania odległości przy równym C/N0 i przy równym EIRP oraz tolerancja na zakłócacz. Opcjonalne SPRAWDZENIA KSZTAŁTU zestawiają widmo projektu z opisanym pomiarem (spójność na poziomie MODELLED). VALIDATED: zamknięte formy mocy BPSK w paśmie ({ "90.3" } % w głównym listku) i szerokości pasma Gabora, jitter ograniczony do pasma sprowadzający się do podręcznikowej postaci koherentnej early-late i do granicy Gabora, współczynnik separacji widmowej przesuniętego BPSK względem jego postaci zamkniętej z tożsamości Parsevala, jednostkowe pole widma AltBOC oraz maksymalny Doppler LEO względem opublikowanych wartości Xona Pulsar (32-34 kHz) i Iridium ({ "36" } kHz). MODELLED: każdy projekt, podział mocy, poziom C/N0 i zakłócacza; widma EFQPSK, CSK i OFDM są przybliżone.

seg-37e5fdff9d4d = Jeden przebieg <c1/> podsumowuje się tak: scenariusz leo-signal | { "5" } sygnałów | poziom szumu -202.0 dBW/Hz | najlepsza dokładność wyznaczania odległości generic-c-wide { "0.022" } m przy { "45.0" } dB-Hz

seg-b538d3ff9fdb = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-6aaf62f55e65 = Przykład <c1/> ustawia między innymi:

seg-9fd02351d844 = ms

seg-05e8854de548 = chip

seg-d12bc1d2b815 = koherentny

seg-0f29946fe4fb = Etykieta wyniku (silnika): MODELLED: parametryzowane projekty sygnałów pozycjonowania, nawigacji i czasu (PNT) na niskiej orbicie okołoziemskiej (LEO), ograniczone do ich szerokości pasma nadawania. Formy zamknięte pod spodem mają poziom VALIDATED (moc BPSK w paśmie i szerokość pasma Gabora, jitter śledzenia kodu early-late ograniczony do pasma sprowadzający się do podręcznikowego

seg-8bf45b6989d1 = Wykres, który silnik zapisuje dla scenarios/leo-band-trade.toml, rodzaj leo-signal

seg-58413589a025 = MODELLED { "2" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1> dotyczące tego rodzaju.

seg-0c30354c18f6 = <b>VALIDATED</b> navsignal: całka sinusowa (sine_integral), ułamek mocy BPSK-R wewnątrz pasma dwustronnego w postaci zamkniętej (bpsk_power_in_band_closed_form), szerokość pasma Gabora BPSK ograniczonego do pasma w postaci zamkniętej (bpsk_gabor_bandwidth_closed_form_hz

seg-09cb975b430d = <b>VALIDATED</b> leo_signal::max_doppler_hz: największy Doppler satelity podczas przelotu nad głową przy masce elewacji dla orbity kołowej, v R_E cos(el) / (R_E + h) razy f / c, z własnej nośnej i wysokości orbity każdego ustawienia wstępnego; rodzaj <c1/> dodaje o

seg-e0a4f53c5a96 = <b>MODELLED</b> Rodzaj <c1/>: parametryzowane projekty sygnałów (pasmo, szerokość pasma nadawania, przydział ITU; składowe akwizycyjna, danych i pilotowa z widmami BPSK(n), BOC(m,n), MBOC lub płaskimi, udziałami mocy, podnośnymi FDMA, długościami kodu i szybkościami danych Testy: <a1>leo_signal_reference.rs</a1>.

seg-9ca82c79430e = <b>MODELLED</b> Rodzaj <c1/> rozszerzony poza pasmo L: pasma podane jako predefiniowany projekt sygnału (rysowany ze wszystkimi składowymi, ograniczony do szerokości pasma nadawania, C/N0 i J/S odniesione do śledzonej składowej) albo jako własna nośna i modulacja Testy: <a1>leo_signal_reference.rs</a1>.

seg-eb0a671fe1da = <b>VALIDATED</b> leo_signal::max_doppler_hz: największy Doppler satelity podczas przelotu nad głową przy masce elewacji dla orbity kołowej, v R_E cos(el) / (R_E + h) razy f / c,. Wyrocznia (ExternalDataset): opublikowane wartości: maksymalny Doppler Xona Pulsar X1 od { "32" } do { "34" } kHz (Leclère, Marathe & Reid, ION GNSS+ { "2025" }, <a1>https://arxiv.org/abs/2509.19551</a1>); Doppler Iridium do +/-36 kHz (Resilient Navigation and Timing Foundation, Recent PNT Improvements and Test Results Based on Low Earth Orbit Satellites). Obrót Ziemi jest pominięty, co przesuwa wartość o około { "2.3" } kHz; obie opublikowane wartości są osiągnięte bez niego.

seg-1ab79cdbd269 = dokładne widma ulepszonego Feher QPSK, kluczowania przesunięciem kodu i OFDM: zastępuje je prostokątna obwiednia chipu BPSK lub płaskie pasmo, jak podaje każde ustawienie wstępne (wynik <c1/>)

seg-0561c3ed88fb = struktura prążkowa kodów rozpraszających i korelacja wzajemna kodów w wielodostępie (wynik <c1/>)

seg-8b4df054a7b3 = filtry nadawcze i odbiorcze poza idealną ścianą prostokątną przy szerokości pasma nadawania: bez emisji poza pasmem, bez opóźnienia grupowego filtra (wynik <c1/>)

seg-ad5f7cc4a439 = wielodrogowość, kwantyzacja w odbiorniku i automatyczna regulacja wzmocnienia (wynik <c1/>)

seg-e38fc1a121ab = obrót Ziemi w oszacowaniu Dopplera (do około { "0.46" } km/s prędkości zmiany odległości na równiku) (wynik <c1/>)

seg-32a132809a9b = opóźnienie jonosferyczne powyżej pierwszego rzędu oraz podział zawartości elektronowej nad satelitą LEO i pod nim: pochyłe TEC jest daną wejściową (wynik <c1/>)

seg-8189e06f4a56 = straty atmosferyczne, deszczowe i polaryzacyjne: porównuje się samo tłumienie w wolnej przestrzeni (deszcz ma znaczenie w paśmie C) (wynik <c1/>)

seg-445cecb7370c = akwizycja poza pojedynczym oknem z karą za fałszywy alarm: bez logiki weryfikacji wielookienkowej, z jednostajnym rozkładem a priori fazy kodu, w najgorszym przypadku rozkładu na granicy (wynik <c1/>)

seg-8eefe4197d7f = <s1>Poprzedni</s1>leo-pvt

seg-60423e1ed0ca = <s1>Następny</s1>link-budget
