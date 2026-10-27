# docs--positioning: translations (pl)

seg-6555ff9a6d8e = Wynik

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Dane wejściowe

seg-09721fbcf7fc = Źródło: <c1/>

seg-5b362d7b0903 = Kshana jest otwartym, odtwarzalnym <b>silnikiem dowodów odporności PNT (pozycjonowania, nawigacji i czasu)</b>. Opisujesz scenariusz: czujniki lub zegary, przerwę w GNSS (globalnym systemie nawigacji satelitarnej), atak zagłuszający lub spoofing, budżet. Silnik mówi, jak dobrze wytrzymują czas i pozycja, ocenione względem operacyjnych wskaźników jakości (FoM). Każda możliwość stojąca za tymi wartościami jest oznaczona w sprawdzanej maszynowo macierzy jako <b>VALIDATED</b> (sprawdzona względem niezależnej zewnętrznej wyroczni), <b>MODELLED</b> (wewnętrznie spójna, niesprawdzona zewnętrznie) lub <b>PARTNER</b> (za którą odpowiada partner sprzętowy). Ta strona mówi, gdzie silnik jest najmocniejszy, do czego służy i czym nie jest.

seg-48d576a345e3 = Gdzie jest najmocniejszy: synchronizacja czasu i holdover dla infrastruktury krytycznej

seg-f41d8a48ff13 = Najlepiej sprawdzoną częścią silnika jest synchronizacja czasu. Sieci telekomunikacyjne, sieci energetyczne i rynki finansowe biorą czas z GNSS i każde musi dobrać <b>holdover</b>: jak długo lokalny zegar może pracować swobodnie po utracie GNSS, zanim jego błąd czasu przekroczy budżet.

seg-70d00c5fe203 = <b>Co jest VALIDATED.</b> Estymatory stabilności częstotliwości, z których zbudowana jest odpowiedź o holdover: odchylenie Allana (ADEV), zmodyfikowane odchylenie Allana (MDEV), odchylenie czasu (TDEV), maksymalny błąd przedziału czasu (MTIE) i estymator Theo1 o rozszerzonym zakresie, są sprawdzone względem odchyleń referencyjnych Stable32, niezależnej biblioteki <c1/> i rzeczywistego zmierzonego zegara cezowego. Obliczenie wariancji wybiegu holdover i jego odwrócenie do czasu holdover są sprawdzone względem SciPy. Zob. <a1><c2/></a1>, gdzie jest każdy wiersz, jego test i wyrocznia.

seg-9fbedc930565 = <b>Co pozostaje MODELLED.</b> Poziomy szumu dla poszczególnych klas zegarów (na przykład długoterminowy poziom danej klasy oscylatorów) decydują o odpowiedzi dla stabilnego zegara i są to wartości reprezentatywne, a nie pomiary Twojego urządzenia. Podaj zmierzone poziomy dla liczby, której zamierzasz bronić.

seg-700df4898ede = <b>Jednostki telekomunikacyjne.</b> Rodzaj scenariusza <c1/> raportuje MTIE i TDEV, sprawdza je względem masek Sektora Normalizacji Telekomunikacji Międzynarodowej Unii Telekomunikacyjnej (ITU-T): G.8272 dla głównego zegara odniesienia czasu (PRTC), G.8272.1 dla rozszerzonego PRTC (ePRTC), G.8273.2 dla telekomunikacyjnego zegara granicznego (T-BC) i G.8271.1 dla granic sieci w punkcie odniesienia C, oraz raportuje, jak długo holdover mieści się w każdym budżecie błędu czasu. Zob. <a1><c2/></a1>.

seg-50421d8247ab = Co go wyróżnia

seg-7ec913b140ed = Różnicą nie są fizyka ani standardy: propagacja Simplified General Perturbations { "4" } (SGP4), odchylenie Allana, układy odniesienia i rozmycie dokładności są dostępne, bezpłatne i poprawne w innych bibliotekach, a Kshana sprawdza się względem kilku z nich. Różnicą jest dyscyplina dowodowa:

seg-f7d466d5215b = <b>Otwarty.</b> Silnik jest na licencji GNU Affero General Public License (AGPL), więc każdy może go przeczytać i uruchomić ponownie. Licencja komercyjna istnieje dla zamkniętej integracji.

seg-76ff24c1939b = <b>Odtwarzalny.</b> Wynik jest określony przez <c1/>, bit po bicie, a przebieg można udostępnić jako odnośnik do placu zabaw w przeglądarce.

seg-6df34e089b53 = <b>Z oznaczonym pochodzeniem.</b> Każdy parametr czujnika jest powiązany z opublikowanym źródłem (<a1><c1/></a1>), a każda możliwość nosi swój poziom VALIDATED / MODELLED / PARTNER. Strażnik ciągłej integracji (CI) odrzuca wiersz VALIDATED bez niezależnej zewnętrznej wyroczni, więc wewnętrzna autokontrola nie może być przedstawiona jako walidacja.

seg-8bccfe110f4c = Nie znaleźliśmy innego otwartego narzędzia, które łączy to wszystko w holdover, integralności, wybiegu inercyjnym i czujnikach kwantowych, ale wyszukiwanie, które niczego nie znajduje, nie dowodzi, że nic nie istnieje; nie twierdzimy, że jesteśmy jedyni.

seg-e942b2474960 = Kwantowy: neutralna metoda kompromisu, wyniki oznaczone MODELLED

seg-655769464447 = Kshana porównuje zegary i czujniki inercyjne kwantowe i klasyczne w tym samym scenariuszu tym samym kodem: każde urządzenie jest modelem błędu, a silnik nie wie, które jest „kwantowe”. Traktuj ją jako <b>neutralną metodę kompromisu między rozwiązaniami kwantowymi a klasycznymi, której wyniki są oznaczone MODELLED</b>. Większość wejść to opublikowane współczynniki Allana i budżetu szumu; akcelerometr z interferometrem z zimnymi atomami ma warstwę z pierwszych zasad, która wyprowadza jego współczynnik szumu. Zmierzone dane odchylenia Allana od partnera można wprowadzić przez rodzaj <c1/>, co jest drogą do awansowania wartości konkretnego urządzenia. Zob. <a1><c2/></a1> i <a2><c3/></a2>.

seg-eb5d247b42aa = Księżyc, cislunar i daleki kosmos: utrzymywane, nie jako główny kierunek

seg-4b9bd68b7fb1 = Zestaw księżycowy i cislunarny (monitorowanie integralności księżycowej, rdzeń trzech ciał Ziemia–Księżyc, księżycowe skale czasu, analiza objętości usługi) i silnik radiometrycznej nawigacji w dalekim kosmosie są możliwościami utrzymywanymi. Większość ich wierszy to MODELLED, a nawigację księżycową obsługują już wyspecjalizowane narzędzia, więc są oferowane jako możliwości tego samego silnika, każda z własnym poziomem, a nie jako główny kierunek.

seg-26f242f1bef8 = Reszta silnika

seg-b9b2e29e51d9 = Ten sam silnik, z tymi samymi poziomami, obejmuje także:

seg-89d1923b3ed9 = <b>PNT na niskiej orbicie okołoziemskiej (LEO), od końca do końca.</b> Projekt sygnału (<c1/>), przejście i budżet łącza dla każdego pasma (<c2/>), rozgłaszany komunikat nawigacyjny (<c3/>), połączone pozycjonowanie z orbit średnich i niskich (<c4/>), zbieżność precyzyjnego pozycjonowania punktowego (PPP) z uzupełnieniem LEO (<c5/>), pozycjonowanie z sieci pozaziemskiej 5G (<c6/>) oraz <c7/>, który przekazuje wyjście każdego etapu do następnego dla jednego systemu.

seg-2e5b57ccd454 = <b>Widmo.</b> Wodospad widmowej gęstości mocy w paśmie L (oraz UHF (ultra wysokiej częstotliwości), S i C) pod skryptową osią czasu zagłuszarki, ze stosunkiem zagłuszarki do sygnału i efektywną gęstością nośnej do szumu w każdym paśmie (<c1/>) oraz wejście i wyjście nagrań Signal Metadata Format (SigMF).

seg-0e7fd993a838 = <b>Układ słoneczny i dowolne ciało centralne.</b> Położenia i stałe fizyczne planet i dużych księżyców (<c1/>), pozycjonowanie wokół dowolnego z tych ciał (<c2/>) oraz projekt konstelacji Walkera i konstelacji o opublikowanych slotach z mapami pokrycia i rozmycia dokładności wokół dowolnego z nich (<c3/>).

seg-9d993a356eb0 = <b>Kampanie.</b> Istniejące rodzaje połączone łańcuchowo na jednej wspólnej osi czasu, przeglądane po parametrze, uruchamiane jako zasiane zespoły Monte Carlo lub uruchamiane obok siebie we wspólnych warunkach (<c1/>).

seg-905a9aa8c47c = <b>Wyjścia.</b> Każdy przebieg zapisuje dokument wyniku, wykres i raport w HTML (HyperText Markup Language) i JSON (JavaScript Object Notation); <c1/> zapisuje animację SVG (Scalable Vector Graphics), HTML lub sekwencję klatek; <c2/> zapisuje efemerydy CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON lub STK (Systems Tool Kit) dla rodzajów, które umieszczają obiekty na Ziemi, oraz SigMF dla <c3/>.

seg-75206591a52a = Większość tych wierszy to MODELLED; macierz weryfikacji wymienia nieliczne, które są VALIDATED (na przykład zalecenia Międzynarodowej Unii Telekomunikacyjnej dotyczące deszczu i scyntylacji, algorytm rozgłaszanych efemeryd Galileo, kontrola ramki CRC-24Q (24-bitowa cykliczna kontrola nadmiarowa) i solver planetarnego czasu światła).

seg-785218a0ea66 = Czym Kshana nie jest

seg-fae54ec38477 = <b>To nie jest symulator sygnału radiowego (RF) ani stanowisko hardware-in-the-loop (HIL).</b> Kshana nie steruje żadnym sprzętem radiowym i niczego nie nadaje. Większość jej działania odbywa się na poziomie modeli błędów i budżetów łączy, zanim kupi się sprzęt lub czas laboratorium. Na poziomie sygnału jest wyłącznie programowa: warstwa GNSS IQ (<c1/>) zapisuje pliki próbek IQ (synfazowych i kwadraturowych) w paśmie podstawowym z prawidłowymi sygnałami GNSS dla odbiorników programowych i uruchamia na nich własny odbiornik programowy; sekcja <c3/> rodzaju <c2/> (od { "0.29.0" }) zapisuje migawkę SigMF (Signal Metadata Format) swojego modelu analitycznego, która obejmuje skonfigurowane zagłuszarki (zagłuszarki szumopodobne przedział po przedziale, tony i chirpy jako przebiegi); a <c4/> sumuje w pamięci sygnał autentyczny i replikę spooferową, aby sprawdzić przechwycenie pętli, bez zapisywania go. Testowanie odbiornika sprzętowego względem rzeczywistego bodźca RF jest zadaniem symulatora RF.

seg-ca243f3f8e8d = <b>Nie zastępuje MATLAB/Simulink, STK ani Orekit.</b> Działa obok nich. Czyta i zapisuje formaty wymiany, których używają: komunikaty efemeryd orbitalnych CCSDS (Consultative Committee for Space Data Systems), precyzyjne orbity SP3 (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format); zapisuje CZML, KML, GeoJSON i efemerydy STK dla ich przeglądarek, a jej numeryczny model sił jest sprawdzany krzyżowo względem Orekit, a nie oferowany w jego miejsce.

seg-8fa4e93c3d0e = <b>Nie jest silnikiem przetwarzania fazy nośnej GNSS ani usługą pozycjonowania</b> (zob. niżej).

seg-8ba4b67bc813 = <b>Nie jest organem certyfikującym.</b> Etykieta VALIDATED oznacza, że możliwość zgadza się z zewnętrzną wyrocznią; nie jest certyfikacją żadnego produktu ani operatora.

seg-362b857140b9 = Czym Kshana jest, a czym nie jest, obok silnika przetwarzania GNSS

seg-f50951b2e9c8 = Kshana <b>nie</b> jest silnikiem <em>przetwarzania</em> fazy nośnej GNSS i żaden rodzaj scenariusza nie jest usługą pozycjonowania. Ma jednak jedną nogę w dziedzinie pomiarów, jako kod biblioteczny, na którym opiera się badanie wydajności i który jest sprawdzany względem niezależnych wzorców. Pozycjonowanie kinematyczne w czasie rzeczywistym (RTK) na krótkiej bazie z całkowitoliczbowym ustalaniem LAMBDA (least-squares ambiguity decorrelation adjustment) działa na rzeczywistych dwuczęstotliwościowych obserwacjach RINEX, tak samo jak statyczny filtr precyzyjnego pozycjonowania punktowego (PPP) z wartościami zmiennoprzecinkowymi, z końcowymi orbitami i zegarami IGS, a zegar odbiornika, który ten filtr estymuje, jest rozwiązaniem czasu względem końcowego zegara stacji IGS. Każdy z tych trzech jest wierszem VALIDATED <a1>macierzy weryfikacji</a1>, względem danych stacji IGS, które tam wskazano, i każdy działa na statycznych, krótkich oknach obserwacji, a nie jako usługa strumieniowa z rozwiązywaniem niejednoznaczności na długich bazach, wygładzaniem nośnej czy ruchomym łazikiem kinematycznym. Rodzaj <c1/> uruchamia filtr PPP z wartościami zmiennoprzecinkowymi na kodzie i fazie nośnej, ale na pomiarach, które sam symuluje, aby zbadać czas zbieżności z uzupełnieniem LEO i bez niego; nie przetwarza pliku obserwacji. Rodzaj <c2/> (położenie, prędkość i czas) rozwiązuje położenie odbiornika z rzeczywistych pseudoodległości kodowych RINEX oraz efemeryd rozgłaszanych, sprawdzone względem zmierzonej współrzędnej International GNSS Service (IGS) (stacja ABMF, 2018-05-13) do <b>{ "5.7" } m RMS 3-D (pierwiastek ze średniej kwadratowej) / { "1.1" } m w poziomie</b>. Ale produktem jest badanie wydajności, a nie usługa pozycjonowania, a poniższe ujęcie ma oszczędzić przyszłemu użytkownikowi rozczarowania złym narzędziem.

seg-169dd778c45f = Silnik przetwarzania GNSS (RTKLIB, otwartoźródłowa biblioteka pozycjonowania kinematycznego w czasie rzeczywistym; gLAB, zestaw narzędzi laboratoryjnych GNSS grupy gAGE z Politechniki Katalońskiej)

seg-4faa1de0ef70 = scenariusz: modele błędów czujników, okna przerw, geometria; albo, dla <c1/>, rzeczywisty plik obserwacji RINEX plus rozgłaszana nawigacja

seg-ae60d0def8af = rzeczywiste obserwacje GNSS (RINEX), efemerydy, poprawki

seg-5fce99bb803d = wskaźniki jakości wydajności: holdover, błąd czasu i pozycji, dostępność, granice integralności i bezpieczeństwa; plus pozycja z kodowego pozycjonowania jednopunktowego (SPP) z rodzaju <c1/>

seg-b752bb5c3f64 = <b>rozwiązanie</b> pozycji, prędkości i czasu (SPP, PPP, RTK)

seg-dd8a47d4f618 = Pytanie, na które odpowiada

seg-b52fd8e0c856 = „jak dobra <em>byłaby</em> ta architektura i gdzie się załamuje?”

seg-09672ca004ac = „gdzie jestem <em>teraz</em>, mając te pomiary?”

seg-00d5ebd56088 = Czujniki kwantowe / optyczne

seg-a55f2bd6c1bf = modelowane jako modele błędów (zegary optyczne, inercyjna jednostka pomiarowa (IMU) z zimnymi atomami, optyczny transfer czasu), wyniki oznaczone MODELLED

seg-7ccfb3395d84 = niemodelowane

seg-ec21dbf4b910 = Przetwarzanie rzeczywistych obserwacji

seg-324ef9a933d5 = kodowe SPP z rzeczywistych obserwacji RINEX (<c1/>, z dokładnością rzędu metra); RTK na krótkiej bazie z LAMBDA i statyczne PPP z wartościami zmiennoprzecinkowymi na rzeczywistej fazie nośnej, jako kod biblioteczny sprawdzany względem stacji IGS (VALIDATED, statyczne i krótkie okna, nie usługa strumieniowa); plus geometria / rozmycie dokładności (DOP) / dostępność

seg-e15db8a33a9a = główna kompetencja, aż po PPP/RTK z fazą nośną

seg-e6df7ccdba96 = zero: działa w karcie przeglądarki (WebAssembly)

seg-812c1c70ce63 = natywna kompilacja / toolchain

seg-58df67617e1a = Uzupełniające, a nie konkurencyjne: RTKLIB i gLAB

seg-29aeb97bd509 = <a1>RTKLIB</a1> i <a2>gLAB</a2> to dojrzałe, szeroko używane zestawy do przetwarzania GNSS. Biorą rzeczywiste pomiary i dają rozwiązanie pozycji (SPP/PPP/RTK; gLAB jest też znakomitym narzędziem dydaktycznym z silnym dorobkiem w Europejskiej Agencji Kosmicznej (ESA) i w Europejskim Systemie Wspomagania Satelitarnego (EGNOS)). Kshana <b>nie</b> zastępuje ich i nie próbuje tego robić. Jej ścieżka obserwacji jest wąska: kodowe pozycjonowanie jednopunktowe (<c1/>) oraz, jako sprawdzany kod biblioteczny, RTK na krótkiej bazie z całkowitoliczbowym ustalaniem LAMBDA i statyczny filtr PPP z wartościami zmiennoprzecinkowymi na rzeczywistych obserwacjach dwuczęstotliwościowych, każdy VALIDATED względem danych stacji IGS (filtr PPP także względem przebiegu RTKLIB na tych samych wejściach). Nie ma wygładzania nośnej, przetwarzania kinematycznego ani strumieniowego, ani rozwiązywania niejednoznaczności na długich bazach, a <c2/> nie estymuje troposfery ani jonosfery: stosuje modele troposfery Saastamoinena/Niella i kombinację bezjonosferyczną L1/L2, a nie rozwiązuje ich jako stanów.

seg-9c4e70ce8a55 = Potok jest uzupełniający:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> odpowiadają na pytanie <em>„gdzie jestem, według tych sygnałów?”</em>

seg-f5370894cdd1 = <b>Kshana</b> odpowiada na pytanie <em>„jak długo utrzymuję dobrą odpowiedź, gdy te sygnały znikają, i ile daje mi lepszy zegar lub czujnik inercyjny, klasyczny albo kwantowy?”</em>

seg-2403d6b115de = Naturalny przebieg pracy używa silnika przetwarzania dla odcinka, w którym GNSS jest dostępny, a Kshana do zbadania zachowania <b>holdover</b> i przestrzeni kompromisów czujników wokół niego. Jeśli potrzebujesz usługi pozycjonowania z fazą nośną (kinematyczne PPP lub RTK, długie bazy, sieciowe rozwiązywanie niejednoznaczności), użyj RTKLIB lub gLAB; jeśli potrzebujesz odtwarzalnych, oznaczonych dowodów dotyczących odporności i holdover, do tego Kshana została zbudowana.

seg-21631e5c6be3 = Warstwa w przeglądarce bez instalacji

seg-9b01dd6721ed = Większość narzędzi symulacyjnych w tej dziedzinie (RTKLIB, gLAB, General Mission Analysis Tool (GMAT), Orekit, STK) wymaga natywnej instalacji lub licencji i nauki przed pierwszym wynikiem. Kshana kompiluje się do WebAssembly i działa <b>w całości w przeglądarce</b>: <a1>plac zabaw</a1> wczytuje gotowy scenariusz, uruchamia rzeczywisty silnik po stronie klienta (nic nie jest wysyłane) i pokazuje wynik w kilka sekund. Prowadzone suwaki i scenariusze jednym kliknięciem sprawiają, że pierwszy użyteczny wynik nie wymaga TOML (Tom's Obvious Minimal Language, format plików scenariuszy) ani toolchainu.

seg-b1cb4b8f0ef1 = Ta warstwa bez instalacji jest świadomą decyzją:

seg-33b361bde50d = <b>Zasięg</b>: recenzent, student lub specjalista ds. zamówień może wypróbować rzeczywisty silnik z odnośnika, na dowolnym urządzeniu, bez żadnej konfiguracji.

seg-a4a4ebf89cee = <b>Odtwarzalność</b>: ten sam silnik, który działa w przeglądarce, jest biblioteką publikowaną na crates.io, w Python Package Index (PyPI) i w npm; wynik jest odtwarzalny z <c1/>, a przebieg można udostępnić jako adres URL (adres internetowy).

seg-3d3d4bda606c = <b>Uczciwość</b>: samodzielne uruchomienie silnika, otwarcie, jest najmocniejszą odpowiedzią na „zaufaj tym liczbom”: warstwa w przeglądarce <em>jest</em> powierzchnią audytu.

seg-6095bcacb725 = Warstwa w przeglądarce nie czyni Kshana zamiennikiem komputerowego zestawu do przetwarzania; sprawia, że pytanie o badanie kompromisów wydajności staje się przystępne dla osób, które nigdy nie zainstalowałyby takiego zestawu.

seg-938ca8eab04c = <a1><c1/></a1>: mapa zakresu wiersz po wierszu (pełny zakres solvera <c2/> i jego residua są w wierszu <b>przetwarzanie GNSS / PNT</b>).

seg-9e94b1740386 = <a1><c1/></a1>: co jest sprawdzone, z dowodami.

seg-3a02f39bd90a = <a1><c1/></a1>: rodzaj synchronizacji telekomunikacyjnej i jego maski.

seg-c5aa08e4ca55 = <a1><c1/></a1>: definicje użytych tu pojęć prostym językiem.

seg-85aaaa34ea7c = <a1><c1/></a1>: plac zabaw w przeglądarce.

seg-54e2deeffc7d = <s1>Poprzednia</s1>Architektura

seg-b2f93c49d5c6 = <s1>Następna</s1>Changelog
