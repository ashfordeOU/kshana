# docs--leo-pnt-fusion: translations (pl)

seg-cae10fb9bff8 = Scenariusz

seg-f63dd3d7aad4 = Źródło

seg-587beeccaa11 = Ustawienie predefiniowane

seg-a6c63abeb7e6 = Dołączone scenariusze

seg-354b42e3a5d0 = RNTF

seg-c5ce76c91ff7 = Etykieta

seg-9673ca8c2705 = Źródło: <c1/>

seg-989faf40651b = Fuzja pozycjonowania, nawigacji i czasu z MEO i LEO

seg-c14c586a29e7 = Trzy rodzaje scenariuszy dają pozycjonowanie, nawigację i czas (PNT) z satelitami na niskiej orbicie okołoziemskiej (LEO) samymi lub połączonymi z globalnymi systemami nawigacji satelitarnej (GNSS) na średniej orbicie okołoziemskiej (MEO): <c1/> (pozycja, prędkość i czas), <c2/> (precyzyjne pozycjonowanie punktowe) oraz <c3/> (sieć nieziemska 5G). Źródło: <c4/>.

seg-351652fa0e42 = Silnik jest <b>niezależny od systemu</b>. Każda konstelacja to powłoki Walkera, jawne elementy orbitalne albo gotowe ustawienie GNSS rodzaju <c1/>; każdy sygnał to nośna, tempo chipów i obwiednia stosunku nośnej do gęstości szumu (C/N0); każdy budżet błędów to jawne jedno sigma. Nazwane systemy to opcjonalne <b>gotowe ustawienia</b>, po jednym pliku, a każda możliwość, test i dołączony scenariusz działają bez któregokolwiek z nich.

seg-3e7c6608d5c4 = Systemy i gotowe ustawienia

seg-1031746214ab = Scenariusz wymienia swoje systemy jako tabele <c1/>. Ten kompletny scenariusz łączy bazową konstelację GPS z ogólną warstwą LEO i działa tak, jak jest zapisany (<c2/>; silnik { $version } daje medianę rozmycia dokładności pozycji { "2.43" } dla samego GPS i { "1.17" } po fuzji oraz błąd 3D średniokwadratowy { "2.06" } m i { "0.47" } m):

seg-6168fdca9b54 = <c1/> (Global Positioning System, GPS; lub <c2/>, <c3/>, <c4/>) przyjmuje opublikowaną konstelację GNSS; <c5/> uzupełnia z gotowego ustawienia LEO wszystko, czego tabela nie określa. C/N0 rośnie liniowo z sinusem elewacji od maski do zenitu (wybór modelowania: rzeczywista obwiednia przejścia zależy od charakterystyki anteny nadawczej). Jedno-sigma pseudoodległości to szum termiczny pętli synchronizacji opóźnienia (DLL) silnika (<c6/>) przy tym C/N0, połączony z błędem odległości w sygnale w przestrzeni (SISRE), chyba że <c7/> je ustala; jedno-sigma prędkości zmiany odległości to długość fali razy <c8/>. Ponieważ sigma jest wejściem, osobny model sygnału może je dostarczać, a kod pozycjonowania nie musi wiedzieć, skąd pochodzi.

seg-a3f63252bd1b = Co niesie

seg-9872e31ebd72 = Źródła

seg-e20c823f36f3 = X1 przy { "1593.3225" } MHz, { "1.023" } Mchip/s, moc odbierana od −{ "148.2" } do −{ "139.1" } dBW; X5 przy { "1190.51625" } MHz, { "10.23" } Mchip/s, od −{ "144.9" } do −{ "136.2" } dBW; { "258" } satelitów w { "18" } płaszczyznach na { "1080" } km, { "53" } i { "97" } stopni

seg-57b56c874c9b = PUBLIC: <a1>arXiv:{ "2509.19551" }</a1>. Reprezentatywne: podział między dwa nachylenia, fazowanie, błąd odległości

seg-b0c5e502c21b = Iridium Satellite Time and Location (STL): { "66" } satelitów, sześć prawie biegunowych płaszczyzn na { "780" } km i { "86.4" } stopnia; impulsy przy { "1616" } do { "1626" } MHz, kluczowanie fazy czterostanowe (QPSK) przy { "25 000" } symboli/s; moc odbierana od { "300" } do { "2400" } razy minimum GPS

seg-d65ae64607c1 = PUBLIC: <a1>Resilient Navigation and Timing Foundation (RNTF)</a1>, <a2>National Institute of Standards and Technology (NIST)</a2>, <a3>konstelacja</a3>. WYLICZONE: moc w dBW. Reprezentatywne: nośna w środku pasma, błąd odległości

seg-36771f73c21f = Tylko Doppler: { "11.325" } GHz, radiolatarnia z multipleksowaniem z ortogonalnym podziałem częstotliwości (OFDM) { "240" } MHz, C/N0 do { "57.07" } dB-Hz, błąd Dopplera { "30" } Hz; pierwsza powłoka { "1584" } satelitów na { "550" } km i { "53" } stopniach

seg-44d4dd41848a = PUBLIC: <a1>Kozhaya, Saroufim i Kassas { "2025" }</a1>, <a2>Federal Communications Commission (FCC) 21-48</a2>. Reprezentatywne: fazowanie, C/N0 przy horyzoncie

seg-2e13de07f9e9 = Kluczowanie fazy dwustanowe (BPSK) przy { "2.046" } Mchip/s w pobliżu L1 i L5; wyznaczanie orbity z dokładnością centymetrową

seg-dd94a3839cb3 = PUBLIC: <a1>wstępna ocena</a1>, <a2>GPS Solutions</a2>. Reprezentatywne: nośne, moc, cała konstelacja operacyjna

seg-a34d6a186a36 = System pasma C w przydziale służby nawigacji radiowej przez satelity (RNSS) od { "5010" } do { "5030" } MHz, dla systemów, których parametry nie są publiczne

seg-7712896ff69a = PUBLIC: przydział z <a1>Regulaminu Radiokomunikacyjnego Międzynarodowego Związku Telekomunikacyjnego (ITU)</a1>. Wszystko inne <b>reprezentatywne</b>

seg-89ebc32469d9 = Model efemeryd i zegara: wielomian efemeryd szóstego rzędu, odświeżanie co { "30" } s, zegar sterowany do czasu GNSS; SISRE { "0.26" } m

seg-ddbefb8a6723 = PUBLIC: <a1>InsideGNSS</a1>. WYLICZONE: SISRE. Łączy się z dowolną konstelacją przez <c1/>

seg-6389c92e07d4 = Demonstracja na orbicie (IOD) Celeste Europejskiej Agencji Kosmicznej (ESA), jedna konfiguracja parametryzowanego projektu sygnału

seg-b8bd6e76aeb2 = orbita PUBLIC (<a1>ESA</a1>, <a2>streszczenie Institute of Navigation (ION) { "16907" }</a2>); parametry sygnału WORKSHOP, przedstawione na warsztatach LEO-PNT programu ESA Navigation Innovation and Support Programme (NAVISP), { "2026" }

seg-bd7fb6eb444a = Każda liczba pochodząca z warsztatów znajduje się w module <c1/> w <c2/>, używanym przez <c3/> (<c4/> wymusza, gdzie mogą się pojawiać). Jak to ustawienie jest wyłączane: każda liczba silnika pochodząca z warsztatów mieści się w jednym pliku, <c5/>, który <c6/> kompiluje tylko wtedy, gdy istnieje, oraz w scenariuszach dostępnych tylko w repozytorium <c7/>. Usunięcie tego pliku i tych scenariuszy wyłącza gotowe ustawienie bez zmian w kodzie źródłowym; każdy inny test, każda wyrocznia i każdy scenariusz działają bez niego, a liczba plików scenariuszy w README nadal liczy pliki wyłączone.

seg-12cdcc633ae0 = Jeden rodzaj, cztery tryby (<c1/>).

seg-72b5d8cc82ea = <b>Doppler.</b> Odbiornik mierzący Doppler <c1/> przy długości fali <c2/> obserwuje prędkość zmiany odległości <c3/>, gdzie <c4/> to linia widzenia, a <c5/> to dryf zegara odbiornika. Wsadowe dopasowanie Gaussa-Newtona wyznacza pozycję, dryf i opcjonalnie stałą prędkość, z analitycznymi pochodnymi cząstkowymi <c6/>: informację o pozycji niesie tylko prędkość satelity w poprzek linii widzenia, więc o geometrii decyduje to, jak linie widzenia obracają się w oknie. Raport podaje błąd w zależności od długości okna, obwiednię Dopplera, tempa zmiany Dopplera i zrywu każdego systemu oraz tabelę dla pojedynczego przejścia. Jedno przejście lokalizuje użytkownika wzdłuż toru (chwila zerowego Dopplera) i w poprzek (stromość krzywej Dopplera); błąd poprzeczny rośnie bez ograniczeń, gdy przejście zbliża się do zenitu, a lustrzane odbicie względem śladu na powierzchni pasuje prawie równie dobrze (rozdziela je tylko obrót Ziemi). W tym trybie działa system tylko z Dopplerem (<c7/>, gotowe ustawienie <c8/>).

seg-007d143c7fb4 = <b>Łączny.</b> W każdej epoce ważona metoda najmniejszych kwadratów na pseudoodległościach samych systemów GNSS, samych systemów LEO i wszystkich razem, z jednym zegarem odbiornika na system (szacowany jest błąd międzysystemowy, ISB) lub ze znanym przesunięciem rozgłaszanym w odniesieniu do skali czasu. Podaje geometryczny, pozycyjny, poziomy, pionowy i czasowy współczynnik rozmycia dokładności (GDOP, PDOP, HDOP, VDOP, TDOP), błędy, oszacowane błędy systematyczne oraz DOP w zależności od liczby satelitów LEO dodanych do geometrii GNSS.

seg-22f136a0c96f = <b>Polarny.</b> Satelity w zasięgu, mediana DOP i dostępność w zależności od szerokości geograficznej dla GNSS na MEO, LEO i obu razem.

seg-1034557258d1 = <b>Czasowy.</b> W znanej pozycji każda pseudoodległość LEO jest pomiarem zegara. Odbiornik uruchamia dwustanowy (faza, częstotliwość) filtr Kalmana, którego szum procesu to biały szum częstotliwości i szum częstotliwości typu błądzenie losowe klasy oscylatora (modele <c1/> i zegara), utrzymuje czas między przejściami i przelicza czas systemowy na czas koordynowany (UTC) wyrażeniem z IS-GPS-200 <c2/>; niepewność rozgłaszanego przesunięcia jest błędem systematycznym dla przebiegu.

seg-0d76fcc05e7d = Rozszerzony filtr Kalmana (EKF) precyzyjnego pozycjonowania punktowego (PPP) z liczbami rzeczywistymi, na kodzie i fazie wolnych od jonosfery: współrzędne statyczne, biały zegar odbiornika, jeden błąd międzysystemowy na każdy dodatkowy system, zenitalne opóźnienie wilgotne typu błądzenie losowe oraz rzeczywistoliczbowa niejednoznaczność dla każdego łuku satelity. Błąd precyzyjnej orbity i zegara jest wspólny dla kodu i fazy satelity, więc każdy satelita to jedna skorelowana aktualizacja o dwóch wierszach, w postaci stabilizowanej metodą Josepha, która utrzymuje dodatnią określoność kowariancji przez tysiące milimetrowych aktualizacji fazy. Pomiary są symulowane z tego samego modelu, więc znormalizowany kwadrat błędu estymacji (NEES) pozycji musi podlegać rozkładowi chi-kwadrat z trzema stopniami swobody; test sprawdza to na ziarnach Monte Carlo. Zbieżność to pierwsza epoka, po której błędy poziomy i pionowy pozostają poniżej progów ({ "10" } cm) do końca przebiegu.

seg-630384148ec7 = Satelita LEO przecina niebo w około dziesięć minut, a satelita MEO przesuwa się o kilka stopni, więc łuki LEO oddzielają niejednoznaczności od pozycji znacznie szybciej.

seg-17f9cf9cc24d = Łącze w dół sieci nieziemskiej (NTN) 5G w paśmie S służby satelitarnej ruchomej (MSS), pasmo n256 organizacji 3rd Generation Partnership Project (3GPP) ({ "2170" } do { "2200" } MHz). Granica Cramér-Rao (CRB) dla czasu przybycia wynosi <c1/>, gdzie <c2/> to średniokwadratowa (Gabora) szerokość pasma (<c3/> dla płaskiego widma OFDM), a dla częstotliwości tonu <c4/>. Rodzaj porównuje kanały (domyślnie kanał New Radio { "5" } MHz i kanał wąskopasmowy { "200" } kHz) przez rozwiązania z czasu przybycia w łączu w dół z nieznanym zegarem odbiornika oraz rozwiązanie z jednym satelitą z Dopplera podczas przejścia.

seg-516afd013d38 = Rodzaj, tryb

seg-529a5aeea10a = Co pokazuje (z ziarnem, deterministycznie)

seg-6cd0b721006a = <c1/>, doppler

seg-c3c51264f12a = warstwa Xona Pulsar X1 ({ "258" } satelitów), szum Dopplera { "1" } Hz: błąd 3D { "7.5" } m po dziesięciu minutach ({ "26" } satelitów); na pojedynczym przejściu jedno-sigma poprzeczne do toru wynosi { "303" } m, gdy przejście jest prawie nad głową ({ "25" } km od toru), wobec { "43" } m przy { "250" } km od toru

seg-da85037a6691 = sygnały okazji tylko z Dopplerem, błąd Dopplera { "30" } Hz przy { "10" } Hz: formalne poziome jedno-sigma około { "10" } m po { "20" } s z { "12" } satelitami i { "6" } m po { "60" } s

seg-4dbb00da5310 = <c1/>, joint

seg-553e8f4df276 = mediana PDOP dla GPS i Galileo { "1.47" } i średniokwadratowy (RMS) błąd 3D { "1.06" } m; sam Xona X5 { "1.73" } i { "0.49" } m; po fuzji { "1.06" } i { "0.41" } m; błąd systematyczny LEO { "40" } ns ({ "11.99" } m) oszacowany jako { "12.06" } m

seg-83378a120e0d = Zbieżność { "7.4" } min (tylko GNSS na MEO), { "4.8" }, { "3.2" }, { "2.7" } i { "2.3" } min przy { "60" }, { "96" }, { "192" } i { "288" } satelitach LEO

seg-4aadc3b41822 = Granica odległości od { "0.26" } do { "1.03" } m dla { "4.5" } MHz i od { "6.5" } do { "26" } m dla { "180" } kHz; rozwiązania w pobliżu { "2" } m wobec { "26" } m

seg-5b1019210ca7 = <c1/>, polar

seg-108488f6cc6c = VDOP dla GPS i Galileo { "1.20" } na równiku, { "1.51" } przy { "89.9" } stopnia; z Iridium { "1.14" } na biegunie

seg-bcdbe0796127 = <c1/>, timing

seg-94ab83c05f50 = Transfer czasu Iridium przez { "6" } godzin w Boulder: od { "9.9" } do { "11.4" } ns RMS przy nominalnym C/N0 dla czterech klas oscylatorów, od { "15.1" } do { "25.0" } ns przy stosunku niższym o { "30" } dB

seg-3007f5930dfd = <c1/> (opcjonalnie)

seg-f6ff187a00aa = GNSS uzupełniony o dwa satelity IOD w odniesieniu do skali czasu (tylko w repozytorium, wyłączone razem z gotowym ustawieniem)

seg-98710204278b = Te rodzaje działają też wewnątrz innych scenariuszy: <c1/> jest członkiem przeglądu <c2/> oraz kampanii <c3/>, <c4/>, <c5/> i <c6/>; <c7/> przeglądu <c8/>; <c9/> przeglądu <c10/>; a <c11/> i <c12/> to etapy rozwiązania połączonego i PPP rodzaju <c13/>. Ich wyniki są na <a1>LEO-PNT.md</a1>.

seg-2f3086178d0b = Opublikowane wartości i etykiety

seg-8980b5ae869b = Wartość

seg-0be9b5747c00 = Kshana

seg-3d2d01038419 = Doppler Iridium do ±{ "36" } kHz

seg-a88258961299 = { "35.9" } kHz, maksimum z doby przejść, w granicach { "5" }%

seg-5bc3150b53f6 = VALIDATED (<c1/>)

seg-35a3ec8ee073 = maksymalny Doppler Xona Pulsar X1 od { "32" } do { "34" } kHz

seg-499acd31a8f8 = arXiv:{ "2509.19551" }

seg-e8c9c880a3eb = { "33.6" } kHz z jednego satelity każdej opublikowanej powłoki ({ "1080" } km, { "53" } i { "97" } stopni), wewnątrz przedziału bez poszerzenia; sama powłoka { "53" } stopni osiąga szczyt { "31.8" } kHz, ponieważ obrót Ziemi spowalnia orbitę postępową względem podłoża

seg-e12713d5019f = VALIDATED (ten sam test)

seg-370ca62e7fc7 = zryw Xona Pulsar X1 ±{ "1.26" } Hz/s²

seg-4de9b0895288 = około { "1.0" } Hz/s² na przejściu nad głową

seg-5019322f4669 = podane, niezwalidowane

seg-7fcb83027ff4 = zbieżność PPP { "9.6" } → { "7.0" }, { "3.2" }, { "2.1" }, { "1.3" } min przy 60/96/192/288 LEO

seg-856e73fb2fb5 = Li et al., <em>Journal of Geodesy</em> { "93" }:{ "749" } ({ "2019" }), <a1>doi 10.1007/s00190-018-1195-2</a1>

seg-a03bc7c3b8a6 = { "7.4" } → { "4.8" }, { "3.2" }, { "2.7" }, { "2.3" } min, monotonicznie

seg-0a1133c16dce = MODELLED spójność trendu (konstelacje, szum i stacje nie są odtwarzane)

seg-7c5292729f36 = Starlink około { "2" } m w { "20" } s z trzema satelitami

seg-6a54a7c58ade = Kozhaya, Saroufim i Kassas { "2025" }

seg-13fc5fc4f69f = formalne poziome jedno-sigma około { "10" } m po { "20" } s z { "12" } satelitami, z doskonałymi efemerydami i każdym błędem ujętym w sigma Dopplera { "30" } Hz przy { "10" } Hz

seg-4fc80a02ed6c = MODELLED porównanie (odbiornik i tempo pomiarów nie są odtwarzane)

seg-5d0ae24eb74c = synchronizacja czasu Iridium poniżej { "40" } ns od UTC(NIST)

seg-fa4467605bc4 = NIST

seg-b910bf5135dd = około { "10" } ns RMS, obliczone z modelu

seg-9025f3c376c5 = MODELLED porównanie

seg-4434b0ff1caa = Wszystko inne jest MODELLED, z uzasadnieniem w macierzy weryfikacji (<c1/>): DOP sprawdzono na ręcznie wyprowadzonym przypadku czterech satelitów, rozwiązania względem ich kowariancji, model Dopplera względem tożsamości przyspieszenia odległości, filtr PPP względem pasma chi-kwadrat NEES, a granice względem kwadratury.

seg-aa5482ac34ff = Ograniczenia, podane wprost

seg-0b4564367dcd = Orbity dwóch ciał z wiekowym dryfem od J2, drugiej harmonicznej zonalnej Ziemi; bez błędu dopasowania efemeryd rozgłaszanych poza jedno-sigma SISRE, bez charakterystyki anteny satelity.

seg-b51ccfee4ab8 = Brak opóźnienia jonosferycznego i troposferycznego w <c1/> (filtr PPP niesie stan opóźnienia wilgotnego; jego kombinacja wolna od jonosfery usuwa jonosferę pierwszego rzędu), brak scyntylacji, wielodrogowości, poślizgów cyklu i rozwiązywania niejednoznaczności całkowitoliczbowych.

seg-a719ccac19c0 = Dokładność NTN jest granicą, a nie osiągniętym wynikiem.

seg-19ba6cc0ca75 = Wartości gotowych ustawień oznaczone jako reprezentatywne są ilustracyjne i nie opisują projektu żadnego operatora.

seg-f9f335d67ff8 = <s1>Poprzednia</s1>Komunikat nawigacyjny LEO

seg-062138bbb73c = <s1>Następna</s1>Projekt konstelacji
