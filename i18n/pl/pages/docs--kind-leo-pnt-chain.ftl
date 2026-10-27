# docs--kind-leo-pnt-chain: translations (pl)

seg-f42465f7d066 = ns

seg-7f5ad6ab8c23 = GPS

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-771484572fa7 = <b>VALIDATED</b> ITU-R P.618-14 sekcja { "2.4.1" } kroki od { "3" } do { "9" } (sigma odniesienia z N_wet, efektywna długość drogi, współczynnik uśredniania anteny, głębokość zaniku dla { "0.01" } % do { "50" } % czasu. Wyrocznia (ExternalDataset): przykłady walidacyjne ITU-R Study Group { "3" } (CG-3M3J-13-ValEx-Rev8.3.0) dla scyntylacji P.618-14, z N_wet P.453-14 dla każdego miejsca z tych samych przykładów; zatwierdzone w tests/fixtures/leo_link/p618_14_scintillation.csv z adresami URL i datą pobrania. Wyrażenie na refrakcyjność wilgotną z temperatury i wilgotności nie jest objęte tym wierszem

seg-ab58ab4e7dc6 = <b>VALIDATED</b> Opóźnienie grupowe { "40.3" } STEC/f^{ "2" } dla każdego pasma; współczynniki wolne od jonosfery f1^2/(f1^{ "2" } - f2^{ "2" }) i -f2^2/(f1^{ "2" } - f2^{ "2" }) oraz wzmocnienie szumu sqrt(a1^{ "2" } s1^{ "2" } + a2^. Wyrocznia (ExternalDataset): IS-GPS-200 sekcja { "20.3.3.3.3.2" }, która podaje stosunek opóźnień grupowych L1/L2 gamma = (77/60)^{ "2" } wynikający ze skalowania pierwszego rzędu 1/f^{ "2" }, oraz wzór Friisa na transmisję (Proc. IRE, { "1946" }). Waliduje prawa skalowania, nie ukośny TEC

seg-ae15d15bf151 = Strona tematu: <a1>LEO-PASS.md</a1>

seg-d24f2cccc926 = Źródło: <c1/>

seg-3a66efa79aa2 = <c1/> (rodzaj scenariusza)

seg-81d1604171a5 = Jeden system LEO-PNT (pozycjonowanie, nawigacja i czas z niskiej orbity okołoziemskiej) od początku do końca, dla dowolnej konstelacji i sygnału: projekt leo-signal nazwany w signal_design (publiczne ustawienie wstępne lub wbudowany projekt [signal]) ustala środek, szerokość pasma, tempo chipów i podział EIRP pasma [pass], bilans łącza leo-pass daje śledzone C/N0 i ograniczone pasmem drżenie kodu w trakcie przelotu, a linia C/N0 względem sin(elewacja) oraz rozgłaszany SISRE komunikatu [navmsg] (dopasowany na wysokości satelity przelotu) zasilają każdy system LEO w łącznym rozwiązaniu leo-pvt z [fusion] i opcjonalnie przypadki leo-ppp z [ppp]; każde przekazanie jest wymienione z wartością i jednostką. MODELLED.

seg-9dec9cd6fbfc = Jeden przebieg <c1/> podsumowuje się tak: LEO-PNT end to end, generic { "1080" } km constellation signal generic-l (<a1>https://www.itu.int/pub/R-REG-RR</a1>), tracked pilot at { "10.230" } Mchip/s, C/N0 offset -2.57 dB pass LEO-1 { "1080" } km: tracked C/N0 peak { "58.2" } dB-Hz, code jitter median { "0.050" } m; C/N0 line { "35.6" } + { "24.3" } sin(el) dB-Hz message kepler-rac { "300" } s fit / { "300" } s update: representation SISRE { "0.907" } mm RMS (orbit { "0.005" } mm), with { "0.250" } m orbit determination: { "0.250" } m handed on fused fix: GNSS only PDOP { "1.47" } RMS 3D { "1.60" } m -> GNSS + LEO PDOP { "1.06" } RMS 3D { "0.43" } m PPP convergence: GNSS only { "11.5" } min, { "240" } LEO { "7.5" } min { "11" } values handed between stages. MODELLED.

seg-21babf07292a = Wymagane pola: <c1/>, <c2/>, <c3/>

seg-f7bd59312f9b = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-585a1b0d5950 = Przykład <c1/> ustawia między innymi:

seg-be21370c2446 = joint

seg-f9c560b3c318 = Galileo

seg-28b34c8ae7c5 = galileo

seg-0093705edf63 = Etykieta wyniku (silnika): MODELLED — łańcuch przekazuje wynik każdego etapu następnemu; etapy zachowują własne etykiety (wiersze leo-signal, leo-pass, leo-navmsg, leo-pvt i leo-ppp macierzy weryfikacji).

seg-abe0599498c9 = Wykres zapisany przez silnik dla scenarios/leo-pnt-end-to-end.toml, rodzaj leo-pnt-chain

seg-d8b7c2c82566 = <b>MODELLED</b> Rodzaj <c1/>: projekt leo-signal (ustawienie publiczne lub wbudowane) ustala środek, szerokość pasma, tempo chipów i podział EIRP pasma leo-pass; przelot daje C/N0 składowej śledzonej i ograniczone pasmem drżenie kodu dla każdej epoki; metodą najmniejszych kwadratów C/ Testy: <a1>leo_pnt_chain.rs</a1>.

seg-59b976838ef1 = <b>VALIDATED</b> navsignal: całka sinusowa (sine_integral), ułamek mocy BPSK-R wewnątrz pasma dwustronnego w postaci zamkniętej (bpsk_power_in_band_closed_form), ograniczone pasmem. Wyrocznia (ExternalDataset): przypięte zewnętrznie: { "90.3" } procent mocy płata głównego, spójne drżenie early-late w podanym punkcie pracy, wartości tabeli całki sinusowej oraz współczynnik separacji widmowej własnej BPSK 2/({ "3" } R_c) przy zerowym przesunięciu. Tylko kontrole wewnętrzne, nie walidacja zewnętrzna: wzór zamknięty na szerokość pasma Gabora ograniczonego pasmem BPSK i jego asymptota oraz współczynnik separacji widmowej BPSK z przesunięciem przy niezerowych przesunięciach, oba

seg-faf2775f3003 = <b>MODELLED</b> Rodzaj <c1/>: parametryzowane projekty sygnałów (pasmo, szerokość pasma nadawania, przydział ITU; składowe akwizycyjne, danych i pilotowe z BPSK(n), BOC(m,n), MB. Wyrocznia (InternalConsistency): wzory zamknięte sprawdzone względem niezależnego wzorca z dwóch wierszy powyżej, tożsamość fałszywego alarmu detektora kwadratowego P_d(snr = { "0" }) = P_fa i średni czas akwizycji Holmesa oraz redukcja do własnego łańcucha SSC rodzaju widmowego (ten sam kod Jammer::ssc). Same projekty są danymi wejściowymi: ustawienia oznaczone REPRESENTATIVE lub WORKSHOP nie są opublikowanymi specyfikacjami, widma enhanced Feher QPSK, code shift keying i OFDM są przybliżane, a kształt

seg-752b6d88fc9c = Etap pozycjonowania modeluje C/N0 jako linię prostą względem sinusa elewacji między maską a zenitem; łańcuch dopasowuje tę linię do śledzonego C/N0 przelotu, więc kształt właściwy dla przelotu (plateau izofluksowe, brzeg wiązki) sprowadza się do dwóch liczb. (wynik <c1/>)

seg-f609a2991c7f = SISRE przekazywany do etapów pozycjonowania jest błędem reprezentacji komunikatu nawigacyjnego względem orbity prawdziwej całkowanej przez Kshana, plus podany w scenariuszu od_sisre_m jako pierwiastek z sumy kwadratów; sam etap komunikatu nie modeluje wyznaczania ani predykcji orbity. (wynik <c1/>)

seg-f75f874cdfaa = Etap pozycjonowania oblicza własne drżenie pętli synchronizacji opóźnienia z przekazanego C/N0 wzorem dla nieograniczonej szerokości pasma; przelot podaje obok ograniczone pasmem drżenie rzeczywistego projektu. (wynik <c1/>)

seg-174ce18ade58 = Etap precyzyjnego pozycjonowania punktowego przyjmuje SISRE komunikatu jako błąd orbity i zegara LEO; jego szum kodu i fazy pozostają własnymi danymi wejściowymi etapu. (wynik <c1/>)

seg-0aaff940eacb = Jeden satelita, pierwszy, którego pasmo niesie projekt, reprezentuje cały system LEO w etapach przelotu i komunikatu. (wynik <c1/>)

seg-65930be43134 = MODELLED — łańcuch przekazuje wynik każdego etapu następnemu; etapy zachowują własne etykiety (wiersze leo-signal, leo-pass, leo-navmsg, leo-pvt i leo-ppp macierzy weryfikacji). (wynik <c1/>)

seg-bf452e9ae07f = MODELLED: każdy etap zachowuje własną etykietę; łańcuch nie dodaje żadnej fizyki. (komentarz w pliku scenariusza, wiersz { "25" })

seg-0bff72185f12 = <s1>Poprzedni</s1>leo-pass

seg-851e55b87d01 = <s1>Następny</s1>leo-ppp
