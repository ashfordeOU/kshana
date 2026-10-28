# docs--mcp: translations (pl)

seg-261c059bec54 = Wyłącznie doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu: za nawigację odpowiada nadal operator. Serwer działa na Twoim komputerze; nic nie jest wysyłane do Ashforde OÜ.

seg-13641146503d = Cursor (jedno kliknięcie)

seg-3bd13fe295f4 = VS Code (jedno kliknięcie)

seg-fea7b394cdde = npx

seg-76fcc8024f2f = uvx / pipx

seg-deb5187472d1 = Homebrew

seg-491167f2310c = Scoop

seg-5c425ea185ee = Gotowy plik binarny

seg-d107bc8e1950 = Rejestr MCP

seg-842b77a21c5f = Kanał

seg-d6476863f862 = Możliwość

seg-fdbb9db68f1d = brak

seg-1759a8cce7d6 = Rodzaje

seg-564133d6a0c4 = Konstelacje wokół dowolnego ciała

seg-b88a2a9497c2 = Narzędzie

seg-a683980168f7 = Docker

seg-f3a2279d6df7 = Polecenie lub przycisk

seg-20c5ae650eb7 = Wymaga

seg-af4d3ce85e11 = Postać przypięta

seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

seg-b02bdf7c7661 = Node lub Docker

seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

seg-abf8b5fe685a = Node { "18" }+

seg-06299cefbf9e = Python { "3.9" }+ z uv lub pipx

seg-26795c302f8a = brew

seg-ded975fa67fa = formuła dla v{ $version }

seg-667d6dde705b = <c1/>, następnie <c2/>

seg-f6e9fc5f46fe = Scoop (Windows)

seg-bc4762d20004 = manifest dla v{ $version }

seg-f7c0a2fbb0b5 = winget

seg-9e599ab3c0a3 = winget (Windows)

seg-091d1404bb8a = cargo

seg-145ddf98e77f = Rust { "1.88" }+

seg-b308519d4c8d = <a1>strona wydania</a1>: <c1/> (Linux x86-64), <c2/>, sprawdzane przez <c3/> i <c4/>

seg-c39cac69f700 = v{ $version }

seg-e8f5e2b6580b = <c1/> (znajdowany przez klientów obsługujących rejestr)

seg-b1a6e807f06f = klient obsługujący rejestr

seg-d5a3818ac3b6 = Zdalnie (streamable HTTP)

seg-5f1397b1ea30 = własny host

seg-e7acd0ff4c84 = Źródło: <c1/>

seg-81a87d14efda = Kshana: znak, celownik kompasu wyznaczający precyzyjny moment, obok logotypu słownego kshana

seg-3d5232472e42 = kshana-mcp: zapytaj swojego asystenta AI, a silnik odpowie

seg-ef90bf1e0b51 = <c1/> to serwer <a1>Model Context Protocol</a1> (MCP) dla <b>Kshana</b>, otwartoźródłowego symulatora odporności PNT (pozycjonowanie, nawigacja i czas). Pozwala asystentowi AI (sztucznej inteligencji) uruchomić prawdziwy silnik i odczytać jego JSON (JavaScript Object Notation) zamiast zgadywać obliczenia. Komunikuje się przez stdio (standardowe wejście i wyjście) z dowolnym klientem zgodnym z MCP, w tym z Cursorem i JetBrains AI Assistant / Junie.

seg-1fddef4e9a49 = Obliczenia, dla których Kshana jest sprawdzona względem niezależnego wzorca, to dokładnie te, w których model językowy zgaduje najgorzej: propagacja orbit SGP4 (Simplified General Perturbations { "4" }), układy odniesienia IAU (Międzynarodowa Unia Astronomiczna), odchylenia Allana, dostępność GNSS (globalny system nawigacji satelitarnej) i współczynnik DOP (rozmycie dokładności), poziomy ochrony ARAIM (zaawansowane autonomiczne monitorowanie integralności w odbiorniku), fuzja GNSS i INS (inercyjny system nawigacji) oraz modele czujników kwantowych. Zadaj pytanie; asystent uruchamia prawdziwy scenariusz i otrzymuje wskaźniki jakości wraz z ich pochodzeniem i etykietą VALIDATED lub MODELLED.

seg-d51681f30e8f = Jeden otwarty silnik pośrodku, a serwer MCP jako jedna z jego powierzchni obok wiersza poleceń, biblioteki Rust, Pythona, WebAssembly i Kshana Studio, obrazu Docker i wtyczki JetBrains; każda powierzchnia uruchamia ten sam silnik, a Kshana Pro opiera się na nim bez rozwidlania

seg-2a56e1f52830 = Narzędzia

seg-b847694d91b5 = Uruchamia scenariusz z definicji TOML (Tom's Obvious, Minimal Language); zwraca podsumowanie + pełny wynik JSON (JavaScript Object Notation: wskaźniki jakości, krzywe). Opcjonalny <c1/> zwraca wykres jako SVG (Scalable Vector Graphics).

seg-3c00da00ec30 = Kontrola wstępna: analizuje TOML i wykrywa jego rodzaj, bez uruchamiania.

seg-4516fd1e665c = Dołączone scenariusze wzorcowe jako JSON: każdy z <c1/>, swoim <c2/> i jednym zdaniem o tym, co pokazuje. Opcjonalny filtr <c3/>. Każdy przykład działa w takiej postaci, jaka jest, więc to najszybsza droga do poprawnego TOML dla danego rodzaju.

seg-61db4a94ad72 = Tekst TOML jednego dołączonego scenariusza wzorcowego, bajt w bajt taki jak plik w <c1/>.

seg-306f7a835bb9 = Uruchamia scenariusz i zwraca jego raport: podsumowanie wykonawcze, dane wejściowe, każdą wartość z jednostką i etykietą VALIDATED lub MODELLED, zdarzenia, wykorzystane możliwości i zapis odtwarzalności. <c1/> to <c2/> (domyślnie) lub <c3/> (drukowalna strona w jednym pliku).

seg-bdacef6d5133 = Uruchamia scenariusz i zwraca jego szereg czasowy jako animację: <c1/> (domyślnie), <c2/> (samodzielny odtwarzacz) lub <c3/> (najwyżej { "120" } w odpowiedzi). Pierwszy element treści to podsumowanie JSON tego, co narysowano; pliki następują potem. Rodzaj bez próbkowanej osi czasu jest odrzucany z podaniem powodu.

seg-313f7594bd81 = Które formaty interoperacyjne mają zastosowanie do scenariusza (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), powód, gdy któryś nie ma, oraz specyfikacja, którą stosuje każdy zapis. Nie uruchamia scenariusza.

seg-e63b7853bb96 = Eksportuje scenariusz jako CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemerydy STK (Systems Tool Kit) <c1/> albo SigMF (Signal Metadata Format, dla scenariusza <c2/> z blokiem <c3/>). Pierwszy element treści to indeks JSON plików (przyrostek, rozmiar, kodowanie oraz skrót SHA-256, 256-bitowy Secure Hash Algorithm); pliki następują potem, binarny plik próbek SigMF jako base64.

seg-074e914789c5 = Zapisuje trasę GeoJSON <c1/> w scenariuszu, który prowadzi po śladzie z punktów trasy (<c2/>, <c3/>, <c4/>, <c5/>), i zwraca nowy TOML.

seg-ae58a8577aa7 = Eksportuje konstelację scenariusza <c1/> jako precyzyjne efemerydy SP3-c (Standard Product { "3" }, wersja c).

seg-6a59aacf26bb = Eksportuje elementy scenariusza <c1/> jako katalog CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM (Orbit Mean-elements Message).

seg-5562b319968b = Eksportuje szereg stanów scenariusza <c1/> jako efemerydy CCSDS OEM (Orbit Ephemeris Message) { "2.0" } — szereg położenia <em>i</em> prędkości w TEME (prawdziwy równik, średnie równonoc), który odczytują narzędzia dynamiki lotu (GMAT, General Mission Analysis Tool; Orekit; STK, Systems Tool Kit); uzupełnienie niosące prędkość dla zawierającego tylko położenie <c2/>.

seg-b0cf13e530b7 = Uruchamia scenariusz i zwraca jego tabelę odtwarzalności jako CSV (wartości rozdzielone przecinkami) — stabilną bajtowo tabelę, którą CLI (interfejs wiersza poleceń) zapisuje jako <c1/>. Tylko <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (jego analiza <c7/> na modelu komunikatu <c8/> lub <c9/>) oraz <c10/> z ustawionymi <c11/> + <c12/> ją emitują; każdy inny rodzaj zwraca błąd wskazujący te rodzaje.

seg-ab242cd0259c = Geometria nieba pod horyzontem zależnym od azymutu: z miejsca, czasu i ustawień wstępnych konstelacji, dwuwierszowych zestawów elementów orbity (<c1/>, propagowanych przez SGP4 do <c2/> w UTC) albo satelitów podanych jako azymut/elewacja lub ECEF, widoczne satelity i te zasłonięte przez horyzont, GDOP/PDOP/HDOP/VDOP/TDOP z jądra DOP sprawdzonego względem gnss_lib_py, kofaktor i kowariancja we współrzędnych wschód-północ-góra (jeden zegar na system lub jeden wspólny) oraz elipsa błędu poziomego; z <c3/> zamiast <c4/> ustawienie wstępne REPRESENTATIVE z jego pochodzeniem i wycięciem co stopień. MODELLED; niesie informację doradczą; bez Monte Carlo przez MCP. Zob. <a1><c5/></a1>.

seg-d6ed4e8d56e5 = Ocenia zaufanie do rzeczywistego dziennika odbiornika GNSS (globalnego systemu nawigacji satelitarnej). TOML wskazuje <c1/> dziennika (<c2/>, <c3/>, <c4/>, <c5/> lub <c6/>) i podaje jego bajty w treści jako <c7/> lub <c8/>; narzędzie uruchamia monitory zaufania (spadek stosunku nośnej do szumu, utrata synchronizacji, AGC (automatyczna regulacja wzmocnienia), wskaźnik zagłuszania, skok pozycji oraz, przy RINEX z nawigacyjnymi danymi rozgłaszanymi, RAIM (autonomiczne monitorowanie integralności w odbiorniku) i monitor wspomagany zegarem) i zwraca, kiedy i dlaczego rozwiązanie pozycji przestało być wiarygodne. Opcjonalne sekcje <c9/> i <c10/> oceniają wskazane zdarzenia i przewidywane spadki C/N0 względem wskazanych tolerancji. Tabela <c11/> wybiera monitory morskie i dodaje wskaźnik zaufania 0-100 na epokę wraz z monitorami, które go obniżyły (doradczo; MODELLED). Dziennik trafia w treści jako <c12/> lub <c13/> (najwyżej { "4" } MiB). Wykres i CSV dla każdej epoki na żądanie. Zob. <a1><c14/></a1>.

seg-d1a967a443ea = Ocenia ograniczony fragment NMEA { "0183" } (najwyżej { "2" } MiB i { "20,000" } epok; musi zawierać okno kalibracji) tak, jak robi to <c1/>: stan zaufania dla każdej epoki i wynik 0-100 wraz z monitorami, które go obniżyły, podsumowanie i ostatnie <c2/>. Ograniczona postać polecenia live: nie otwiera się gniazdo i nic nie jest zapisywane na port; bramka, <c3/> i eksportery telemetrii (Prometheus, OTLP, syslog) są dostępne tylko z wiersza poleceń. Wyłącznie doradczo; MODELLED. Zob. <a1><c4/></a1>.

seg-89e894d4b416 = Dziennik NMEA { "0183" } statku (najwyżej { "4" } MiB) jako przebieg wsadowy, z TOML sesji określającym limity statku: model wyniku oraz wynik 0-100 każdej epoki wraz z odjęciami (odpowiedź zachowuje liczby według stanów i pierwszych { "200" } epok zdegradowanych lub niegodnych zaufania). Wyłącznie doradczo; MODELLED.

seg-27698c80b7f1 = Odczytuje opublikowany katalog testów Jammertest i plan nadawania (NPRA/jammertest-plan, MIT) jako zaplanowaną prawdę odniesienia (<c1/>): przedziały jednego obszaru testowego stają się zdarzeniami zaufania do odbiornika z identyfikatorem katalogowym i rokiem w każdej etykiecie. Przedziały planowane, a nie zarejestrowane czasy emisji; żadne pole kontaktowe planu nie jest odczytywane. MODELLED. Zob. <a1><c2/></a1>.

seg-23daf6121ca0 = Ocenia dziennik odbiornika względem tego harmonogramu (<c1/>): dla każdego testu opóźnienie detekcji, pominięte alarmy i czas powrotu do normy oraz fałszywe alarmy poza każdym przedziałem. Dzienniki tekstowe jako <c2/>, binarne (<c3/>, <c4/>) jako <c5/>. Podpisany pakiet wymaga klucza: wiersz poleceń. Wyłącznie doradczo; MODELLED.

seg-0ca5b319e850 = Podpisany pakiet dowodowy dla okna dziennika statku (<c1/>): surowe bajty dziennika dla okna, konfiguracja, wyniki i przyczyny dla każdej epoki, strona podsumowania oraz manifest z każdym SHA-256 i łańcuchem skrótów, podpisany Ed25519. Ziarno podpisu nigdy nie jest zwracane ani zapisywane w dzienniku; bez niego używany jest klucz jednorazowy, więc pakiet dowodzi integralności, a nie tożsamości. Zapis techniczny, a nie opinia prawna. Zob. <a1><c2/></a1>.

seg-8df4c6fb851d = Wiąże token znacznika czasu RFC { "3161" } (base64 bajtów <c1/>) z pakietem, w pamięci (<c2/>); pakiet z tokenem musi nadal się weryfikować. Podpis urzędu znakowania czasem nie jest sprawdzany: użyj <c3/>.

seg-1f7a6f7f005a = Weryfikuje pakiet (<c1/>): każdy skrót, łańcuch, podpis oraz, z kluczem publicznym podpisującego i pełnym dziennikiem, kto go podpisał i że fragment pochodzi z tego dziennika. Wskazuje każdy błąd i plik. <c2/> to <c3/> (podpisujący przypięty), <c4/> (wszystko się zgadza, ale nie podano klucza publicznego, więc podpisujący nie jest ustalony) lub <c5/>; <c6/> odrzuca pakiet bez tokenu znacznika czasu.

seg-c43761e01f63 = Syntetyczne NMEA { "0183" } mostka do szkolenia załogi z TOML <c1/> (zagłuszanie, odciąganie pozycji, fałszowanie czasu, opóźnienie powtórki) z dziennikiem instruktora (<c2/>); deterministyczne dla danego ziarna. Tylko tekst: nic nie jest syntezowane na poziomie RF ani IQ i nic nie jest nadawane; nigdy dla żywych systemów nawigacyjnych statku. Odpowiedź zawiera pierwsze { "2000" } wierszy.

seg-8aec8f61dab2 = Mapa zakłóceń GNSS z raportów pozycji ADS-B lub AIS jako tekst CSV (najwyżej { "4" } MiB): jeden <c1/> GeoJSON na dobę UTC, tylko zbiorczo (bez identyfikatorów, komórki z mniej niż { "5" } różnymi statkami powietrznymi lub statkami są wstrzymywane), z osadzoną licencją zbioru danych. Zdegradowana komórka nie wskazuje zakłóceń jako przyczyny; to nie jest prognoza. MODELLED. Zob. <a1><c2/></a1>.

seg-d5959e4f1c96 = Ruch pojazdu i zdarzenia scenariusza dla laboratoryjnego symulatora GNSS (<c1/>): ruch jako CSV i JSON, NMEA, punkty trasy i zdarzenia jako tekst, nic nie jest zapisywane na dysk. Rodzaje <c2/>, <c3/>, <c4/>. Bez sygnału: nic z eksportowanego nie jest sygnałem radiowym ani pasma podstawowego, nie jest jego modelem ani go nie steruje; sygnały dostarczają symulator i jego operator. Zob. <a1><c5/></a1>.

seg-1076916237f0 = Podpisany laboratoryjny pakiet round-trip (<c1/>): scenariusz, dokument laboratorium <a1><c2/></a1>, dziennik odbiornika i jego ocena względem wskazanych zdarzeń, powiązane skrótem. Odrzuca warunki i zdarzenia oceny, które się różnią. Bez sygnału; zapis techniczny, a nie certyfikacja.

seg-9e1df2016cd7 = Odtwarza jedno nagranie IQ z katalogu roboczego na kilku konstrukcjach pętli śledzących (<c1/>): dla każdej konstrukcji i PRN drgania fazy i kodu w stanie ustalonym, ułamki synchronizacji i średnie C/N0. Najwyżej { "256" } kanałów (konstrukcja, PRN) na wywołanie; przedział musi mieścić się w budżecie próbek.

seg-a5af1743f993 = Uruchamia monitory detekcji zakłóceń i spoofingu na nagraniu IQ w katalogu roboczym (<c1/>): monitory mocy szerokopasmowej i widmowe oraz monitory C/N0 i jakości sygnału dla każdego satelity względem wyuczonego punktu odniesienia. Nazwy i długości szeregów oraz do { "200" } zdarzeń w odpowiedzi; cały raport na żądanie jako pliki. Zdarzenie mówi, że zmierzona wielkość opuściła swój punkt odniesienia, a nie dlaczego. MODELLED.

seg-c9c9c909c621 = Dopasowuje model utraty synchronizacji pętli śledzącej do przebiegów laboratoryjnych (<c1/>) ze scenariusza <c2/>, którego dzienniki są w treści (<c3/> lub <c4/>; <c5/> jest odrzucane). Nie odczytuje ani nie zapisuje żadnego pliku. MODELLED.

seg-4f231cd18d37 = Waliduje plik <c1/> podany jako tekst i zwraca rozstrzygnięte warunki wraz z ich skrótem. Tylko w treści żądania.

seg-2851f2858910 = Mapowanie publicznych ram odniesienia wypełnione z dokumentów wyników podanych jako tekst (<c1/>): które wiersze sześciu ram i norm dotyczących odporności (ramy US DHS Resilient PNT v2.0, IMO dla statków, EASA dla lotnictwa, NIS2 art. { "21" }, EN { "16803" }, NIST IR 8323r1) przebiegi dostarczają dowodów na (supports evidence for), których nie, oraz lukę w każdym wierszu. Przyjmuje <c2/> typu <c3/> (najwyżej { "64" }, łącznie { "4" } MiB). Status mówi, że przebiegi dostarczają dowodów na (supports evidence for) możliwości danego wiersza; nie jest to stwierdzenie, że ramy zostały spełnione, ani ocena czy zatwierdzenie jakiegokolwiek produktu. <c4/> jest zwracane z każdym raportem; pokaż je dosłownie. MODELLED. Zob. <a1><c5/></a1>.

seg-0a5161ddea94 = Statyczne tabele mapowania (albo, z <c1/>, dokumenty źródłowe, które cytują, z wersjami i adresami URL) jako Markdown, poprzedzone tym samym oświadczeniem. Nie wymaga przebiegów.

seg-ffcc6c72dc1e = Strumień zaufania (linie JSON) lub wynik <c1/> zapisany jako tekst Prometheus, linie syslog CEF lub LEEF, ładunek OTLP JSON albo linie wykrywania i stanu Home Assistant MQTT, z koderami <c2/>. Tekst w odpowiedzi: nic nie jest wysyłane ani udostępniane i nie jest odczytywany żaden zegar. Wyłącznie doradczo.

seg-2b82a8a22298 = Parametry akcelerometru i żyroskopu scenariuszy <c1/> i <c2/> dopasowane z nieruchomego dziennika IMU (CSV lub EuRoC) za pomocą odchylenia Allana, z gotową do wklejenia tabelą <c3/> i SHA-256 dziennika (<c4/>). Tekst na wejściu, JSON na wyjściu; MODELLED.

seg-30d5bb6b34cb = Pakiety norm (<c1/>): ocenione zestawy scenariuszy dla profili testowych ram DHS Resilient PNT (poziomy od { "1" } do { "4" }), IMO MSC.1/Circ.1575 i ICAO Doc { "9849" } Appendix F.

seg-767a05e5df9f = Jeden pakiet uruchomiony względem progów podanych przed przebiegiem (<c1/>): każdy test <c2/>, <c3/> lub <c4/>, ze zmierzonymi i oczekiwanymi wartościami; przekaż raport do <c5/>, aby zobaczyć wiersze. MODELLED; nie ocenia żadnego produktu.

seg-74110e6b530f = LunaNet Augmented Forward Signal sprawdzony względem LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } stycznia { "2025" }): <c1/> (implementacja względem wydrukowanych w dokumencie tabel kodów i przykładów obliczeń), <c2/> (strumień symboli: wzorzec synchronizacji, SB1, FID, ciągłość TOI) lub <c3/> (strumień testowy). LDPC i CRC-24Q podramek od { "2" } do { "4" } nie są weryfikowane; żaden sygnał nie jest zapisywany.

seg-b6abad1f2c9d = Zgłoszenie kshana-bench ocenione względem pliku wzorca prawdy, oba jako tekst JSON (<c1/>, <c2/>): plik wyniku z wersją specyfikacji, podziałem, skrótami danych wejściowych i metrykami zadania. MODELLED; opisuje dziennik lub korpus, nigdy produkt.

seg-c7a0d7981bfd = Pliki wyników kshana-bench zapisane jako statyczna strona rankingu (tekst HTML), każdy wcześniej zwalidowany.

seg-1ec7117c7825 = Strumień zaufania (linie JSON) lub wynik <c1/> zapisany jako tekst Prometheus, linie syslog CEF lub LEEF albo ładunek OTLP JSON, z koderami <c2/>. Tekst w odpowiedzi: nic nie jest wysyłane ani udostępniane i nie jest odczytywany żaden zegar. Wyłącznie doradczo.

seg-0fc2e3928768 = Udział długości trasy przypadający na komórki zdegradowane, niezdegradowane, nieocenione i nieobserwowane w jednej lub kilku mapach zakłóceń, opcjonalnie w zakresie dat. Komórki nieobserwowane nie są dowodem, że trasa jest wolna od zakłóceń.

seg-62756ba18cf5 = Konfiguracja warstwy GNSS IQ: nazwy sygnałów przyjmowane przez narzędzia IQ, informacja, czy narzędzia do plików IQ są włączone, katalog roboczy i budżet próbek na wywołanie. Wywołaj je jako pierwsze.

seg-98939638409f = Opisuje jedno nagranie IQ (składowe synfazowa i kwadraturowa) w katalogu roboczym bez jego przetwarzania: format, częstotliwość próbkowania, częstotliwość środkową, próbki, czas trwania, pliki danych i rozmiary (<c1/>).

seg-c529b1a7ee53 = Generuje wieloznaczną scenę GNSS IQ z wieloma satelitami w katalogu roboczym (<c1/>): podane profile Dopplera/C/N0 albo rzeczywistą geometrię z efemeryd rozgłaszanych z pliku nawigacyjnego RINEX, z opcjonalnym kanałem propagacji na poziomie sygnału. Odpowiada listą zapisanych plików z liczbą ich bajtów oraz pierwszą epoką prawdy odniesienia dla każdego satelity.

seg-0c6f5e26367f = Akwizycja FFT (szybka transformata Fouriera) jednego lub kilku PRN (kodów pseudolosowych) w nagraniu (<c1/>), opcjonalnie za stopniami toru wejściowego: dla każdego PRN informacja, czy został pozyskany, Doppler, faza kodu, statystyka piku i próg; <c2/> (jeden PRN) zachowuje całą powierzchnię korelacji Doppler × faza kodu z precyzyjnym doprecyzowaniem Dopplera.

seg-1da73ad326de = Akwizycja, a następnie śledzenie bankiem DLL/PLL/FLL (pętle synchronizacji opóźnienia, fazy i częstotliwości) (<c1/>), z pętlami z pliku TOML <c2/> w katalogu roboczym (<c3/>) lub z wbudowanej konstrukcji, oraz opcjonalnym ponownym pozyskaniem (<c4/>): dla każdego kanału epoki, końcowy Doppler, końcowe i średnie C/N0, ułamki synchronizacji fazy i kodu, stan zsynchronizowania na końcu, końcowy stan synchronizacji, fałszywe synchronizacje i ponowne pozyskania, a także nazwa i skrót konstrukcji. Śledzenie strumieniuje dane w ograniczonej pamięci; wyniki dla każdej epoki trafiają wyłącznie do plików (<c5/>: E/P/L, dyskryminatory, stany pętli, C/N0, stan synchronizacji jako .csv/.jsonl/.bin; <c6/>).

seg-262bb9c592c0 = Stosuje tor wejściowy odbiornika i DSP (cyfrowe przetwarzanie sygnałów: filtr pasmowy, filtr wycinający, wygaszanie, wycinanie, AGC, kwantyzator) do łagodzenia zakłóceń na nagraniu i zapisuje nowe (<c1/>).

seg-cf33e101b144 = Uruchamia kampanię odtworzeń laboratoryjnych (<c1/>): nagrania, każde z plikiem warunków testu podającym znaną prawdę odniesienia laboratorium, × łańcuchy toru wejściowego × konstrukcje pętli. Każda komórka jest oceniana pod kątem czasu do utraty synchronizacji, czasu ponownego pozyskania, pogorszenia C/N0 względem podanego J/S (obok analitycznego odniesienia z etykietą MODELLED), częstości fałszywych synchronizacji, drgań PLL/DLL i dostępności. Przyrostowo i z możliwością wznowienia: każde wywołanie uruchamia oczekujące komórki, które mieszczą się w budżecie próbek (lub <c2/>).

seg-8112428c6226 = Postęp folderu wyjściowego kampanii: komórki zrobione i oczekujące oraz skrót po zakończeniu. Tylko odczyt plików.

seg-8bd76f017ae4 = Każde narzędzie jest cienką, wierną nakładką na publiczną funkcję biblioteki <c1/>; nie ma tu żadnej nowej logiki symulacji, więc agent uruchamia dokładnie ten silnik, który został sprawdzony względem niezależnego wzorca.

seg-b37bbaf38900 = Narzędzia GNSS IQ: pliki na wejściu, zwięzły JSON na wyjściu

seg-ecf2ec0eb66d = Nagrania IQ sięgają gigabajtów, więc narzędzia <c1/> nigdy nie przekazują próbek przez protokół. Obowiązuje je jeden kontrakt:

seg-31a173dfe40d = <b>Katalog roboczy.</b> Serwer odczytuje i zapisuje pliki IQ wyłącznie w folderze wskazanym przez <c1/>. Każdy argument ścieżki jest względny wobec niego (ścieżka bezwzględna musi rozwiązywać się do jego wnętrza); dane wejściowe są przed sprawdzeniem rozwiązywane przez dowiązania symboliczne, folder danych wyjściowych musi już w nim istnieć, a istniejące dane wyjściowe są zastępowane tylko z <c2/>. Gdy nie jest ustawiony, narzędzia do plików IQ są wyłączone i podają, jak je włączyć; wszystkie inne narzędzia pozostają bez zmian.

seg-4f734b84a91a = <b>Budżet próbek.</b> Jedno wywołanie generuje lub przetwarza najwyżej <c1/> zespolonych próbek (domyślnie { "50 000 000" }). W bajtach to { "400" } MB jako <c2/> ({ "8" } bajtów na próbkę zespoloną), { "200" } MB jako <c3/> ({ "4" } bajty) i { "100" } MB jako <c4/> ({ "2" } bajty); scena jest zapisywana jako <c5/>, chyba że <c6/> mówi inaczej. Kontrola odbywa się przed jakąkolwiek pracą, a odmowa podaje czas trwania lub <c7/>, który się mieści.

seg-178284ddfee0 = <b>Zwięzłe odpowiedzi.</b> Każde narzędzie odpowiada jednym podsumowaniem JSON: piki akwizycji, C/N0, stan synchronizacji oraz każdy zapisany plik z jego ścieżką i liczbą bajtów. Tabele dla każdej epoki trafiają do wskazanych przez Ciebie plików <c1/> / <c2/>.

seg-f375643798e9 = <b>Nieznane argumenty są odrzucane</b>, a nie ignorowane, więc błędnie wpisana opcja jest błędem.

seg-41040247770d = Każde narzędzie uruchamia tę samą ścieżkę kodu co <c1/> w wierszu poleceń, w tym samym procesie. Warstwa jest wyłącznie programowa: zapisuje pliki dla odbiorników programowych i nie steruje żadnym sprzętem radiowym. Warstwa IQ nie dodaje syntezy zakłóceń ani spoofera i nic nie jest nigdy nadawane. (Osobny rodzaj scenariusza <c2/> może zapisać do pliku analityczne migawki IQ zagłuszarki.)

seg-f02d2f6bac7c = Z obrazem Docker zamontuj folder i wskaż go zmiennej: <c1/>.

seg-721079aa25e7 = Każdy rodzaj jest osiągalny

seg-116ada4f4498 = <c1/> rozdziela wywołania według <c2/> scenariusza, więc przechodzi przez niego każdy rodzaj, który wymienia <c3/>. Obejmuje to nowsze rodziny, każdą z dołączonymi przykładami, które agent może pobrać:

seg-c7047f5750a9 = Przykład na początek

seg-b45752760eca = Układ Słoneczny

seg-1ccf38ab6e24 = Kampanie: łańcuchowe fazy, przeglądy, Monte Carlo (losowe zespoły z ziarnem), kompozycja

seg-67fe14962e1c = Nawigacja z niskiej orbity okołoziemskiej (LEO): projekt sygnału

seg-c555e5b73203 = Nawigacja LEO: bilans łącza przelotu

seg-67de12cac6f0 = Nawigacja LEO: komunikat nawigacyjny

seg-b8badd962245 = Nawigacja LEO: połączone pozycjonowanie i czas

seg-0561cfd970d8 = <c1/> z <c2/> wymienia każdy dołączony przykład tego rodzaju. Animacje, raporty i eksporty interoperacyjne nie są rodzajami: są widokami przebiegu, a <c3/>, <c4/> i <c5/> zwracają je dla każdego scenariusza, do którego mają zastosowanie.

seg-62d106ca4a89 = Nieobsługiwane: zestawy badań (<c1/>), ponieważ zestaw wskazuje na dysku sąsiednie pliki scenariuszy, a narzędzia scenariuszy nie czytają żadnego pliku. Uruchom każdy element przez <c2/>. (Narzędzia IQ czytają i zapisują pliki, ale tylko w swoim katalogu roboczym.)

seg-57f592bb676b = Instalacja serwera MCP

seg-77fc92e21295 = Fragment wymieniający zewnętrznych klientów AI został tu pominięty; jest w <a1>mcp/kshana-mcp/README.md</a1> na GitHubie.

seg-9ec78559983f = <c1/>, własny hosting: zob. <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

seg-b32b9d4e0f8b = Z kopii roboczej lub z git (rozwój):

seg-73a73af88f08 = Tryb HTTP (własny hosting)

seg-4f248ed3e597 = <c1/> udostępnia te same narzędzia przez streamable HTTP pod <c2/>. Nasłuchuje tylko na pętli zwrotnej; adres inny niż pętla zwrotna wymaga <c3/> i tokenu bearer w <c4/>; narzędzia do plików IQ są wyłączone; rozmiar żądania, czas i współbieżność są ograniczone; nie jest wysyłany żaden nagłówek CORS. Kshana nie udostępnia punktu końcowego: hostuje się go samodzielnie. Zob. <a1>docs/deploy/mcp-http.md</a1>.

seg-60f55b197ac2 = <c1/> umieszcza <c2/> w Twoim <c3/> (zwykle <c4/>). Serwer komunikuje się przez JSON-RPC (zdalne wywołanie procedur JSON) po stdio; logi trafiają do stderr. Budowanie ze źródeł wymaga toolchainu Rust ≥ { "1.88" } (potrzebuje go załatany SDK <c5/> { "2" }.x; sama biblioteka <c6/> potrzebuje tylko { "1.85" }); obraz Docker nie wymaga żadnego.

seg-2f3216082425 = Zarejestruj go w kliencie

seg-1090ae3f689c = Praktycznie każdy klient MCP używa tego samego bloku konfiguracji <c1/>: zarejestruj plik binarny <c2/> przez ścieżkę bezwzględną:

seg-2da393482666 = Albo z obrazem Docker zamiast lokalnego pliku binarnego (<c1/> nie jest potrzebny):

seg-a4f1295bb27a = Miejsce tego bloku zależy od klienta:

seg-154c7e09063d = <b>Cursor</b> — <c1/> (globalnie) lub <c2/> (dla projektu).

seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, wklej blok, a następnie całkowicie uruchom ponownie IDE (zintegrowane środowisko programistyczne).

seg-daf0ea451b11 = <b>Asystenci na komputerze</b> — większość używa <c1/> o tym samym kształcie <c2/>; lokalizację pliku sprawdź w dokumentacji swojego klienta.

seg-fc80286aa9bf = <b>Agenci wiersza poleceń</b> — wielu przyjmuje ten sam JSON przez mechanizm <c1/> / <c2/>.

seg-9f3ef8d76e05 = Zawsze używaj ścieżki bezwzględnej do pliku binarnego. Ustaw <c1/> w <c2/>, aby diagnozować problemy (diagnostyka trafia do stderr; stdout jest zarezerwowane dla protokołu JSON-RPC).

seg-283d1eba838a = Wypróbuj

seg-61739e9b6515 = Po zarejestrowaniu zapytaj asystenta na przykład o:

seg-256276ac933d = <em>„Wymień rodzaje scenariuszy Kshana.”</em> → <c1/>

seg-2a8e3c76b939 = <em>„Pokaż mi przykład spectrum z Kshana i uruchom go.”</em> → <c1/>, <c2/>, <c3/>

seg-d2e1e4148589 = <em>„Uruchom scenariusz holdover zegara z Kshana z progiem { "20" } ns i 2-godzinną przerwą w GNSS; jaki jest holdover kwantowy w porównaniu z klasycznym?”</em> → <c1/>

seg-f4b83873e280 = <em>„Wyeksportuj tę konstelację GPS (Global Positioning System) jako SP3.”</em> → <c1/>

seg-54e01c1af45f = <em>„Daj mi tabelę realtime-frame-eop jako CSV.”</em> → <c1/>

seg-478e6fa0e8d8 = <em>„Pokaż ten przelot Iridium na globusie Cesium.”</em> → <c1/>, <c2/>

seg-90829388d5d9 = <em>„Zanimuj kampanię zagłuszania.”</em> → <c1/>

seg-9eb1b97ad2fd = <em>„Daj mi raport z tego przebiegu wraz z zapisem odtwarzalności.”</em> → <c1/>

seg-dc60d64a3bb8 = <em>„Zrób jednosekundową scenę GPS L1 z PRN { "3" } i { "17" }, a potem ją pozyskaj i śledź.”</em> → <c1/>, <c2/>, <c3/>, <c4/>

seg-942dc8abe0ec = Uwaga projektowa: dlaczego osobny crate

seg-ce6d0ecab448 = Serwer jest <b>samodzielnym crate'em wyłączonym z workspace</b> z własnym <c1/>, więc oficjalny SDK (zestaw narzędzi programistycznych) Rust MCP <c2/> i jego asynchroniczne środowisko uruchomieniowe nigdy nie trafiają do grafu zależności opublikowanego crate'a <c3/>: użytkownik biblioteki lub Pythona nie kompiluje serwera, którego nie uruchamia. (Wydzielono go początkowo dlatego, że <c4/> jest w <b>edycji { "2024" }</b>, co wymaga rustc ≥ { "1.85" }, podczas gdy główny crate obiecywał wtedy { "1.75" }. Biblioteka deklaruje teraz { "1.85" }; ten serwer deklaruje { "1.88" }, dolną granicę załatanego pod względem bezpieczeństwa <c5/> { "2" }.x.) Ciągła integracja (CI) bramkuje ten crate osobno: testy i <c6/> względem jego pliku blokady. Drzewo licencji rmcp jest czyste (Apache-2.0/MIT/BSD), więc w odróżnieniu od crate'a walidacji krzyżowej <c7/>, który poza tym odwzorowuje, podział nie wynika z licencjonowania.

seg-75bf2d74642d = Licencja: AGPL-3.0-only, GNU Affero General Public License wersja { "3" } wyłącznie (albo licencja komercyjna od Ashforde OÜ; zob. <a1>LICENSING.md</a1> w repozytorium).

seg-490ebbefb561 = <s1>Poprzednia</s1>Crate Rust

seg-350b6b914734 = <s1>Następna</s1>Serwer MCP: wszystkie kanały instalacji
