# developers: translations (pl)

seg-d5807f566761 = Statyczne mapowanie publicznych ram (<c1/> / <c2/>) w formacie Markdown: jedna tabela na ramy, z parafrazą wymagania w każdym wierszu, wynikami Kshana, które dostarczają na nie dowodów (supports evidence for), oraz luką, której te wyniki nie zamykają; albo, przy <c3/> ustawionym na true, dokumenty źródłowe, na które powołują się tabele, z wersjami i adresami URL. Na początku stoi zdanie, które towarzyszy każdemu raportowi i pozostaje przy każdym jego fragmencie: wiersz oznaczony jako poparty dowodami oznacza, że przebieg dostarcza dowodów na możliwości wymienione w tym wierszu; nie jest to wniosek, że ramy zostały spełnione, i nie oznacza, że ktokolwiek ocenił lub zatwierdził jakikolwiek produkt. Nie wymaga żadnych przebiegów.

seg-01fd088cd243 = Dopasowuje parametry czujników scenariuszy <c1/> i <c2/> na podstawie dziennika IMU z postoju (<c3/>, docs/MACHINE-INPUTS.md). Te scenariusze przyjmują parametry szumu, a nie szereg czasowy: polecenie odczytuje je z dziennika zarejestrowanego przy nieruchomym czujniku, za pomocą nakładającego się odchylenia Allana scałkowanego sygnału. Zwraca JSON: <c4/> (odchylenie zera akcelerometru, PSD błądzenia losowego prędkości <c5/>, odchylenie zera żyroskopu, PSD błądzenia losowego kąta <c6/>, dolną granicę niestabilności odchylenia zera, gdy dziennik jest dość długi, by ją pokazać, częstotliwość i czas trwania dziennika, wczesne nachylenia odchylenia Allana oraz <c7/> o tym, czego nie udało się dopasować lub czemu nie można zaufać), <c8/> (tabela <c9/>, której pochodzenie wskazuje SHA-256 dziennika, gotowa do wklejenia do scenariusza) oraz <c10/>. Dziennik, który nie był zarejestrowany w postoju albo jest zbyt krótki lub próbkowany nierównomiernie, daje błędne parametry lub zostaje odrzucony; pokazują to nachylenia (około -0.5, gdy dominuje szum biały). Nic nie jest zapisywane na dysku. Poziom dowodowy: MODELLED (estymator zastosowany do dziennika, bez zewnętrznej wyroczni).

seg-5b15806ef8af = Wyświetla listę pakietów norm (<c1/>): ocenianych zestawów scenariuszy dla profili testowych ram DHS Resilient PNT, IMO MSC.1/Circ.1575 oraz ICAO Doc { "9849" } Appendix F, każdy z progami podanymi przed przebiegiem i wierszami compliance, na które dostarcza dowodów (supports evidence for). Nie wymaga danych wejściowych. Pakiet mierzy scenariusze modelowane względem podanych progów; nie ocenia żadnego produktu. Poziom dowodowy: MODELLED.

seg-b0ad081ceea6 = Uruchamia jeden pakiet norm (<c1/>): każdy zawarty w nim scenariusz, oceniony względem progów podanych przed przebiegiem. Zwraca raport (każdy test <c2/>, <c3/> albo <c4/>, gdy wymaga dziennika odbiornika i nie jest oceniany; każdy próg z wartością zmierzoną i oczekiwaną) oraz to samo jako <c5/>. Przekaż JSON raportu do <c6/>, aby zobaczyć wiersze, na które pakiet dostarcza dowodów (supports evidence for). Należy powiedzieć wprost, że próg MET oznacza, iż modelowany scenariusz osiągnął podany próg, a NOT MET jest wynikiem zapisanym w rejestrze; nigdy nie opisuj wyniku jako dowodu, że produkt lub ramy zostały spełnione. Wyłącznie doradczo: wynik analizy, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu. Poziom dowodowy: MODELLED.

seg-fbdd90ad8ddf = Sprawdza LunaNet Augmented Forward Signal (AFS) względem opublikowanej specyfikacji, przypiętej do LNIS Version { "5" } Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } January { "2025" }) (<c1/>, docs/LUNANET-AFS.md). Tryb <c2/> sprawdza tę implementację względem drukowanych w dokumencie tablic kodów (pierwsze i ostatnie { "24" } chipy każdego kodu AFS-I Gold, AFS-Q Weil i kodu trzeciorzędnego dla PRN { "1" } do { "210" } oraz obu ciągów Legendre'a) i przykładów obliczeniowych (SB1 BCH, CRC-24Q), a także progi B1 do B10 wstępnej rejestracji (pre-rejestracji); B4 zgłasza jedno niespełnienie (dokument drukuje te same ostatnie { "24" } chipy dla kodu trzeciorzędnego PRN { "147" } i { "151" }). Tryb <c3/> sprawdza strumień symboli o twardych decyzjach (tekst złożony z { "0" } i { "1" }) pod kątem wzorca synchronizacji, dekodowania SB1, FID, ciągłości TOI i odstępów ramek. Podramki { "2" } do { "4" } (LDPC o sprawności 1/2, CRC-24Q) NIE są zweryfikowane: macierze LDPC znajdują się w osobnym załączniku, który nie jest zaimplementowany. Tryb <c4/> zwraca strumień testowy z podramkami zastępczymi: symbole, a nie przebieg sygnału; Kshana nie zapisuje żadnego sygnału. VALIDATED wyłącznie względem drukowanych tablic tej edycji, które sam dokument oznacza jako TBC; należy to powiedzieć i nie opisywać wyniku jako dowodu, że jakikolwiek węzeł lub usługa LunaNet jest poprawna. Wyłącznie doradczo.

seg-b38b9289f0ce = Ocenia zgłoszenie kshana-bench (<c1/>, bench/SPEC.md, docs/BENCH.md): plik predykcji (<c2/>) względem pliku prawdy odniesienia (<c3/>), oba jako tekst JSON, po najwyżej { "4" } MiB każdy, i zwraca plik wyniku (<c4/>) z wersją specyfikacji, zadaniem (a detekcja na dziennikach odbiornika, b detekcja na IQ, c predykcja holdover czasu, d luka optymizmu poza rozkładem), podziałem, SHA-256 obu wejść i metrykami zadania (AUC, prawdopodobieństwo detekcji przy limicie fałszywych alarmów, RMSE na horyzont lub luka optymizmu). <c5/> to zadeklarowany próg alarmu zadań a i b. Nic nie jest czytane z dysku ani na nim zapisywane. Każdy wynik to MODELLED i opisuje dziennik lub korpus, nigdy produkt; nie jest to certyfikacja, a żaden wynik nie oznacza poparcia dla żadnej organizacji. Poziom dowodowy: MODELLED.

seg-96aa4ec83eec = Renderuje pliki wyników kshana-bench (<c1/>) jako statyczną stronę rankingu, tekst HTML w odpowiedzi: <c2/> to lista tekstów JSON <c3/> (najwyżej { "256" }, po { "4" } MiB każdy), z których każdy jest najpierw walidowany; plik oceniony według innej głównej wersji specyfikacji zostaje odrzucony, ponieważ wyniki różnych głównych wersji nigdy nie trafiają do jednej tabeli. Wiersz mówi, że ten plik uzyskał tę wartość na tym podziale; nie oznacza, że ktokolwiek ocenił lub zatwierdził jakikolwiek produkt. Nic nie jest zapisywane. Poziom dowodowy: MODELLED.

seg-4d9c09d4b58d = Renderuje strumień zaufania GNSS lub wynik <c1/> jako tekst telemetrii bezpieczeństwa (<c2/>, docs/TRUST-TELEMETRY.md), tymi samymi koderami, których używa wiersz poleceń: <c3/> (ekspozycja stanu końcowego), <c4/> lub <c5/> (jeden wiersz syslog zgodnie z RFC { "5424" } na zmianę pasma albo na epokę przy <c6/>; bez znacznika czasu, bo żaden zegar nie jest odczytywany) lub <c7/> (ładunek metryk JSON OTLP/HTTP). <c8/> to <c9/> (domyślnie) lub <c10/>; wiersz strumienia, który nie daje się sparsować, jest pomijany i liczony w <c11/>. Nic nie jest wysyłane, udostępniane ani zapisywane: wynikiem jest tekst w odpowiedzi (działające eksportery, które są procesem, pozostają w wierszu poleceń). Pozycja zgłaszana przez odbiornik jest pomijana, chyba że <c12/> ma wartość true. Dane wejściowe niosące geometrię satelitów (schemat na żywo { "1.3" }, wyniki od { "0.36" }) dodają etykietę geometrii (good, fair, poor; nigdy nie oceniana, z wyjątkiem poor) i status, HDOP, PDOP, VDOP oraz liczbę użytych satelitów, a także etykietę <c13/> (geometria, środowisko, niespójność) przy każdej przyczynie; starsze dane wejściowe są renderowane dokładnie jak dotąd. Wyłącznie doradczo: Kshana nie jest sprzętem nawigacyjnym z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }), a operator nadal ponosi odpowiedzialność. Poziom dowodowy: MODELLED.

seg-6b2ac6e6c327 = Eksportuje ruch pojazdu i zdarzenia scenariusza dla laboratoryjnego symulatora GNSS (<c1/>, docs/TEST-BENCH.md): plik CSV z ruchem i jego opis JSON (pozycja w układzie związanym z Ziemią i geodezyjna, prędkość, orientacja, UTC), zdania NMEA { "0183" } GGA/RMC, tekst punktów trasy, gdy siatka próbek jest regularna co milisekundę, oraz zdarzenia scenariusza jako CSV i jako TOML <c2/> dla scenariusza <c3/>. Dotyczy <c4/> (zdarzeniami są jego przerwy w stanie nawigacyjnym), <c5/> i <c6/>; inny rodzaj zostaje odrzucony z podaniem powodu. <c7/> to chwila UTC zerowego czasu ruchu, <c8/> (domyślnie 2024-01-01T00:{ "00" }:00Z). Nic nie jest zapisywane na dysku: pierwszym elementem treści jest indeks JSON (<c9/> z <c10/>, <c11/>, <c12/>; <c13/> przy każdym pominiętym pliku; <c14/>), po którym następuje tekst każdego pliku w kolejności indeksu. Ten sam scenariusz i ta sama epoka dają pliki identyczne co do bajta. BRAK SYGNAŁU: nic z eksportowanego nie jest sygnałem radiowym ani pasma podstawowego, nie jest jego modelem ani go nie steruje, a zdarzenie jest oznaczonym przedziałem, a nie przepisem na wytworzenie zakłóceń; symulator i jego operator dostarczają sygnały i odpowiadają za uruchamianie ich wyłącznie tam, gdzie jest to dozwolone. Zachowaj uwagę wraz z plikami. Kshana nie publikuje wyników z takich przebiegów. Poziom dowodowy: MODELLED.

seg-03947a440c87 = Wiąże token znacznika czasu RFC { "3161" } z pakietem dowodowym (<c1/>), w pamięci: <c2/> to pakiet w postaci zwracanej przez <c3/>, <c4/> to bajty pliku <c5/> z urzędu znakowania czasem. Token jest zapisywany jako <c6/> obok podpisanego manifestu, a nie wewnątrz niego, a pakiet z tokenem musi nadal przechodzić weryfikację, inaczej nic nie zostaje dołączone; istniejący token jest zachowywany, chyba że <c7/> ma wartość true. Zwraca zaktualizowane <c8/> (przekaż je do <c9/> z <c10/> ustawionym na true, aby wymusić obecność tokenu) oraz uwagi z weryfikacji. NIE sprawdza podpisu urzędu znakowania czasem na tokenie ani certyfikatu urzędu (sprawdza strukturę tokenu i to, że jego odcisk komunikatu jest skrótem manifest.json tego pakietu): należy to powiedzieć i skierować użytkownika do <c11/>. Dane wejściowe i odpowiedź są ograniczone do { "4" } MiB. Znacznik czasu pokazuje, że skrót istniał w chwili wskazanej przez urząd; nie jest opinią prawną. Poziom dowodowy: MODELLED.

seg-fb49aecfe138 = Wszystkie kanały instalacji

seg-8d1e26cab542 = Wszystkie kanały

seg-669075196148 = Wszystkie sposoby instalacji.

seg-53f99a4bf0b6 = Jedna tabela, wygenerowana z pliku <c1/> repozytorium i sprawdzona krzyżowo z jego plikami README, więc każde polecenie jest takie, jakie pokazuje README, przypięte do v{ $version }. Gotowe pliki binarne dla każdego systemu operacyjnego, rozszerzenie asystenta na komputer, przyciski jednego kliknięcia dla Cursor i VS Code, programy uruchamiające <c2/> i <c3/>, Homebrew, Scoop i winget, rejestry oraz własnoręcznie hostowany tryb HTTP. Kanały oznaczone <b>po publikacji</b> zaczynają działać wraz z wydaniem.

seg-a784b0c22ad5 = Silnik i powiązania

seg-702aa931172f = Sam silnik, w języku lub miejscu, w którym pracujesz.

seg-04af86981ef7 = Dla każdego, nic do zainstalowania. Wymaga: nic.

seg-5e0edd49cae9 = Dla inżynierów, którzy chcą polecenia kshana. Wymaga: Rust.

seg-2f047531071b = Przypięte do v{ $version }

seg-19baff281ca3 = Dla programistów Rusta osadzających silnik. Wymaga: Rust.

seg-5f6db7a6b4ca = Dla analityków i notatników. Wymaga: Python.

seg-88dc6ca4799b = Dla programistów webowych i Node.js. Wymaga: Node.

seg-6582d85cfa39 = Asystenci AI (serwer MCP)

seg-261c059bec54 = Wyłącznie doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu: za nawigację odpowiada nadal operator. Serwer działa na Twoim komputerze; nic nie jest wysyłane do Ashforde OÜ.

seg-bb28e2a66e35 = Dla każdego, kto używa asystenta obsługującego MCP. Wymaga: Rust { "1.88" }+.

seg-8172b2b48d13 = Dla osób bez zestawu narzędzi Rusta; serwer MCP w kontenerze. Wymaga: Docker.

seg-eda88c6d5b0c = Rozszerzenie asystenta na komputer (.mcpb)

seg-18587e2199b3 = Dla użytkowników asystenta na komputer, bez terminala. Wymaga: nic.

seg-5ab1f0ac7367 = macOS (Apple silicon)

seg-37287d0895cb = macOS (Intel)

seg-6b54b32f7d37 = Windows

seg-074d9a372011 = Linux (x86-64)

seg-b892cd4c216d = Linux (Arm)

seg-690ef01d50f4 = Kliknij dwukrotnie kshana-mcp-<target>.mcpb.

seg-9ba55737d291 = Wydanie na GitHubie

seg-f8c77f4d7864 = Wszystkie fragmenty instalacji MCP

seg-13641146503d = Cursor (jedno kliknięcie)

seg-35cf0ee94c60 = Dla użytkowników Cursor. Wymaga: Node lub Docker.

seg-a53041e2bd0c = Kopiuj: npx -y kshana-mcp@{ $version }

seg-ea721373864c = npx -y kshana-mcp@{ $version }

seg-06487ca9ea53 = Dodaj do Cursor (npx)

seg-f1cdd05a2c12 = Dodaj do Cursor (Docker)

seg-3bd13fe295f4 = VS Code (jedno kliknięcie)

seg-ee9f19a3799a = Dla użytkowników VS Code i Insiders. Wymaga: Node lub Docker.

seg-0ba9276b4e31 = Zainstaluj w VS Code (npx)

seg-9fd52c6bfeb3 = Zainstaluj w VS Code (Docker)

seg-2a3f55e82b20 = Zainstaluj w VS Code Insiders (npx)

seg-fea7b394cdde = npx

seg-23ec7a4d28e0 = Dla użytkowników Node, dowolny klient MCP. Wymaga: Node { "18" }+.

seg-5f3e5c50cb8c = Program uruchamiający: pobiera binarny plik wydania, weryfikuje SHA256SUMS i go uruchamia.

seg-d54b8eda8897 = npm: kshana-mcp

seg-76fcc8024f2f = uvx / pipx

seg-e66aec59caa7 = Dla użytkowników Pythona, dowolny klient MCP. Wymaga: Python { "3.9" }+ z uv lub pipx.

seg-52b1d8897ac2 = Kopiuj: uvx kshana-mcp=={ $version }

seg-cad43eaead60 = uvx kshana-mcp=={ $version }

seg-8d5edf392220 = PyPI: kshana-mcp

seg-deb5187472d1 = Homebrew

seg-aa9689f9b581 = Dla macOS i Linuksa. Wymaga: brew.

seg-0ceb25056c2c = Kopiuj: brew install ashfordeOU/tap/kshana-mcp

seg-a524b18c6f10 = brew install ashfordeOU/tap/kshana-mcp

seg-deb33ce3ef5d = Homebrew tap

seg-491167f2310c = Scoop

seg-3c941a0f9366 = Dla Windows. Wymaga: Scoop.

seg-3d27d05f7ab4 = Kopiuj: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp

seg-b78510c8fb5d = scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp

seg-fa59790f70ce = Scoop bucket

seg-a971f0c1ec28 = Zgłoszone; pojawi się, gdy strona trzecia je scali

seg-1c02f2eb0335 = winget <s1>w trakcie przeglądu</s1>

seg-99db55f8d2d4 = Dla Windows. Wymaga: winget.

seg-79d2068ac3fe = Kopiuj: winget install AshfordeOU.KshanaMcp

seg-e74f9c5a4eea = winget install AshfordeOU.KshanaMcp

seg-274348a3b12b = Pojawi się, gdy Microsoft scali zgłoszenie.

seg-5c425ea185ee = Gotowy plik binarny

seg-da6faee2d5a0 = Dla osób bez menedżera pakietów. Wymaga: nic.

seg-adcb69b72fa0 = Pobierz kshana-mcp-<target> z wydania i sprawdź go względem SHA256SUMS.

seg-ffc5c2ce76e1 = Oficjalny rejestr MCP

seg-48908d14699a = Dla klientów MCP obsługujących rejestr. Wymaga: klienta obsługującego rejestr.

seg-7661fe051203 = Wyszukaj io.github.ashfordeOU/kshana-mcp.

seg-d107bc8e1950 = Rejestr MCP

seg-1bf757c89ad0 = Zdalnie (streamable HTTP), hostowane samodzielnie

seg-bd777cb973c1 = Dla klientów, które przyjmują adres URL. Wymaga: własnego hosta.

seg-1feb00c423e9 = Kopiuj: kshana-mcp --http { "127.0.0.1" }:{ "8080" }

seg-7b7a63c8e3d1 = kshana-mcp --http { "127.0.0.1" }:{ "8080" }

seg-7cd1d5c3e738 = Domyślnie pętla zwrotna (loopback); powiązanie z adresem innym niż loopback wymaga --allow-remote i tokenu okaziciela (bearer). Kshana nie hostuje żadnego punktu końcowego.

seg-454740be09bd = Przewodnik po samodzielnym hostowaniu

seg-89572b9078e0 = Integracje

seg-3f69f6fd1e3d = Wtyczki i obrazy, które przenoszą Kshana do innych narzędzi.

seg-c78339331023 = Dla użytkowników IntelliJ, PyCharm i CLion. Wymaga: IDE JetBrains.

seg-2e34ace70d11 = Wtyczka Signal K

seg-54c550e25871 = Dla właścicieli łodzi z serwerem Signal K. Wymaga: Node, serwera Signal K.

seg-e1a28c4fbeb9 = Kopiuj: npm install signalk-kshana-trust

seg-53731a6f7b8f = npm install signalk-kshana-trust

seg-01981dcfeae4 = npm: signalk-kshana-trust

seg-a46f6205b2c6 = Przewodnik po wtyczce Signal K

seg-0dda70c85f4c = Wtyczka OpenCPN

seg-5892d7a53111 = Dla użytkowników plotera map OpenCPN. Wymaga: OpenCPN { "5.8" }+.

seg-cde85890d71d = Pobierz archiwum tar wtyczki z wydania. Wydanie zawiera archiwum tar i plik XML z metadanymi katalogu; umieszczenie w katalogu OpenCPN to pull request otwierany ręcznie.

seg-ecac46d67578 = Zgłoszenie do katalogu OpenCPN

seg-efe3c0bb1ae4 = Pulpit Grafana

seg-fbd9d01fdf66 = Dla operatorów używających Grafany. Wymaga: Grafana.

seg-faf86e219716 = Zaimportuj kshana-grafana-*.json z wydania.

seg-b9ec8dcfebfc = Źródło pulpitu

seg-29a25feb563a = Obraz kompilacji referencyjnej

seg-a8861a7224d8 = Dla wdrożeń bramek (gate) i stanowisk bench. Wymaga: Docker.

seg-f0f6aa0b6839 = Kopiuj: docker pull ghcr.io/ashfordeou/kshana-reference-build

seg-7211280de535 = docker pull ghcr.io/ashfordeou/kshana-reference-build

seg-ea81f7acf313 = Sposoby użycia

seg-bf1539d8d398 = Jedenaście sposobów na start.

seg-7717516e084e = Od karty przeglądarki po zestaw regresyjny ciągłej integracji (CI). Każde wejście uruchamia ten sam silnik i zapisuje ten sam wynik JSON, wykres SVG (Scalable Vector Graphics) i raport HTML (HyperText Markup Language). Wybierz jedno; każde polecenie jest prawdziwe i kopiuje się jednym kliknięciem.

seg-a0b0088f15c8 = Sposoby użycia Kshana

seg-518f5155d5d8 = Wypróbuj

seg-c9a2106b81d6 = Tryb osadzony

seg-31d58f23c0a2 = Uruchom

seg-9a552bb08cd6 = Regresja w CI

seg-d7aea3de7e2d = Zestaw badań (bezpłatny)

seg-cc651d9cef3b = Kod

seg-8349c40ee9f1 = npm · WebAssembly

seg-04f61285f6f5 = Asystenci i narzędzia

seg-e47be3bb3de3 = Dowolny dołączony scenariusz, uruchamiany na Twoim komputerze jako WebAssembly; nic nie jest instalowane ani przesyłane. Dostrój go, porównaj przebiegi, przeprowadź przegląd parametru i wyeksportuj odtwarzalny raport.

seg-b21664dae8a2 = Wyłącznie Kshana Studio, na stronę kursu lub do raportu, z wstępnie wybranym scenariuszem i widokiem

seg-d124f667aba2 = Otwórz osadzony widok

seg-a08d0d3e393c = kshana <scenario>.toml zapisuje result.json, chart.svg i report.html

seg-3a0042586da7 = Wynik jest deterministyczny przy danym scenariuszu, ziarnie (seed) i wersji silnika, więc zatwierdzony result.json jest testem regresyjnym (CI: ciągła integracja): uruchom ponownie i porównaj

seg-73291062f208 = Kopiuj: kshana --validate scenarios/integrity-raim.toml

seg-97b17630c261 = kshana --validate scenarios/integrity-raim.toml

seg-176e798df682 = kshana --study: zestaw scenariuszy w jeden opatrzony stemplem study.json i study.html, bezpłatnie. To nie jest płatne badanie na zamówienie.

seg-4ca771aed118 = Kopiuj: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml

seg-3bff1e181145 = kshana --study scenarios/quantum-pnt-demonstrator.suite.toml

seg-60b88364b7f3 = kshana::api::run_toml zwraca JSON, SVG, podsumowanie i CSV (wartości rozdzielane przecinkami)

seg-d85f16c14183 = kshana.run i run_full, a także validate_toml i list_kinds

seg-5a6803e3eb48 = run, summary i chart_svg w przeglądarce lub Node.js

seg-1c19f8c0ad84 = { "49" } narzędzi, które może wywołać asystent AI, każde jako cienka nakładka na publiczne API

seg-4ad1a7669b03 = Serwer MCP bez zestawu narzędzi Rusta, wieloarchitekturowy

seg-9e409a07b3c9 = Kliknij prawym przyciskiem plik .toml scenariusza, wybierz Run Kshana Scenario i odczytaj wartości w oknie narzędzia

seg-5c54a28b6aec = Otwórz stronę

seg-a942825ac543 = Wiersz poleceń · biblioteki · formaty

seg-e65ee2744a09 = Jedno wywołanie, trzy języki, ta sama odpowiedź.

seg-e139bbf52549 = Wiersz poleceń, wiązania Rusta, Pythona i JavaScriptu oraz formaty plików, które silnik czyta i zapisuje, obok siebie. Wszystko tutaj należy do bezpłatnego otwartego rdzenia.

seg-4468dde9e1c9 = Wiersz poleceń · <c1/>

seg-0d7c11d5e318 = Z pliku binarnego

seg-6ea4c3e5cb3a = Opis wiersza poleceń, z własnego tekstu użycia pliku binarnego

seg-542efc7a330f = Przebieg zapisuje <c1/>, <c2/>, <c3/>, <c4/>, <c5/> obok scenariusza; <c6/>, <c7/> i <c8/> zapisują pliki orbit; <c9/> zapisuje też przebieg jako coś, co się porusza (<c10/>, <c11/>, <c12/>: animowany SVG, samodzielny odtwarzacz HTML lub folder ponumerowanych klatek), z <c13/> i <c14/> dla szybkości i długości odtwarzania; <c15/> zapisuje geometrię scenariusza lub jego zsyntetyzowany sygnał dla innych narzędzi: CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON (geographic JSON), plik efemeryd STK (Systems Tool Kit), SigMF (Signal Metadata Format); <c16/> czyta trasę narysowaną jako linia GeoJSON; <c17/> wstrzykuje parametry orientacji Ziemi z pliku finals2000A; <c18/> uruchamia bezpłatny zestaw scenariuszy do <c19/> i <c20/>; <c21/> wylicza każdy rodzaj z jego polami; <c22/> wypisuje scenariusz do rozpoczęcia pracy. Wyniki mogą podróżować w kopercie Kshana Interchange Format (KIF). Serwer MCP udostępnia eksporty orbit jako narzędzia.

seg-20e41da100d1 = <c1/> to bezpłatny program uruchamiający zestawy. Jeśli zamiast tego chcesz, aby analizę wykonano za Ciebie, jest to płatne <a1>badanie na zamówienie</a1>.

seg-223fdfdf6a89 = Każdy przebieg

seg-05542b723b75 = Deterministyczny

seg-84e990e811f9 = Zapisuje

seg-955ed4e12157 = <c1/>, <c2/>, <c3/> i ten sam raport jako <c4/>, a także tabelę CSV (wartości rozdzielane przecinkami) dla rodzajów, które ją publikują. Na żądanie zapisuje też animację przebiegu (<c5/>) oraz scenariusz w formatach czytanych przez inne narzędzia (<c6/>).

seg-0c64bda61e6d = <b>Odtwarzalny</b> przy danym scenariuszu, ziarnie (seed) i wersji silnika, z CycloneDX SBOM (software bill of materials) i pochodzeniem kompilacji SLSA (Supply-chain Levels for Software Artifacts) przy każdym wydaniu.

seg-ccb6508f25b3 = <b>Udokumentowane:</b> pojęcia, schemat scenariusza, API Pythona, walidacja i każdy samouczek, wygenerowane z repozytorium. <a1>Dokumentacja</a1>

seg-297fe9331ba9 = Uruchomiono względem v{ $version }

seg-e3e9177d3f4a = Każdy program uruchamia dołączony scenariusz <c1/> (zapisz go poleceniem <c2/>) i wypisuje to samo jednowierszowe podsumowanie. Pełne wersje znajdują się w README pakietów.

seg-62192c7fb74a = Język biblioteki

seg-a4ba3c056ab8 = JavaScript · WebAssembly

seg-56f23b36ff24 = src/main.rs · po <c1/>

seg-379fc633497c = <c1/> zawiera także <c2/>, <c3/>, <c4/> oraz eksportery orbit. <a1>Dokumentacja Rusta</a1>

seg-6a13ed4517ad = run.py · po <c1/>

seg-84695d64a758 = Pakiet zawiera także <c1/> i <c2/>. <a1>Dokumentacja Pythona</a1>

seg-fb4a40bdf623 = run.mjs · Node.js, po <c1/>

seg-fcdffb554680 = Ten sam pakiet działa w przeglądarce; korzysta z niego Kshana Studio. <a1>Dokumentacja npm</a1>

seg-c313ec6ff2e9 = Otwórz w Kshana Studio: clock-holdover

seg-bca1c3e60fc6 = Interoperacyjność · odczyt i zapis

seg-7a49e058e17b = Każdy wiersz podaje swoją kontrolę

seg-6f81c59f4c4d = Formaty obsługiwane dziś przez silnik, ze strony norm w repozytorium (<a1>Dokumentacja: normy</a1>). Otwórz wiersz, aby zobaczyć, jak do niego dotrzeć i względem czego go sprawdzono.

seg-82e334c3735b = CCSDS OEM <s1>Consultative Committee for Space Data Systems, Orbit Ephemeris Message</s1>

seg-1ef51a222125 = odczyt · zapis

seg-9c1e7fd8f838 = Jak

seg-e44dd7c5f35e = <c1/>, MCP <c2/>

seg-57db34b43e33 = Sprawdzono względem

seg-2fb4c1ee3b74 = Przykład z Blue Book CCSDS, odtworzony co do znaku

seg-c1a375b4412e = CCSDS OMM <s1>Orbit Mean-Elements Message</s1>

seg-4a2ce9f33ab2 = zapis

seg-9446be51a73a = <c1/>, MCP <c2/>

seg-c239bdbcddd3 = Test w obie strony na rzeczywistych dwuwierszowych zestawach elementów orbity

seg-9fd467ce2279 = SP3-c / SP3-d <s1>Standard Product { "3" }, precyzyjne efemerydy</s1>

seg-067520bc1b09 = <c1/>, MCP <c2/>

seg-42b68a98ee82 = Test w obie strony na rzeczywistej migawce konstelacji GPS (Global Positioning System)

seg-e8a0dad7ead0 = CCSDS TDM <s1>Tracking Data Message</s1>

seg-696ed71898a5 = CCSDS Space Packet <s1>pakiety telemetrii i telekomend</s1>

seg-4148f53f1660 = Scenariusze <c1/>

seg-c8f2e02e925c = Opublikowane wektory testowe na poziomie bajtów z niezależnej biblioteki

seg-cee385651652 = RINEX <s1>Receiver Independent Exchange Format, nawigacja i obserwacje</s1>

seg-9120d3e96e5e = odczyt

seg-5dfeaaabd166 = Dane wejściowe scenariuszy, na przykład <c1/>

seg-4f6d921864a3 = Pliki obserwacji z rzeczywistej stacji International GNSS (Global Navigation Satellite System) Service

seg-7eae3ac5cd17 = TLE <s1>dwuwierszowy zestaw elementów orbity</s1>

seg-67503ad04a17 = Scenariusze <c1/>

seg-0a5ab63419ce = Oficjalne wektory referencyjne AIAA (American Institute of Aeronautics and Astronautics)

seg-20b591d58b28 = IONEX <s1>IONosphere map EXchange format</s1>

seg-146a79519d84 = Odczytuje produkt International GNSS Service; nie wymieniono jeszcze żadnej zewnętrznej kontroli

seg-678851c3516f = IERS Earth orientation <s1>International Earth Rotation and Reference Systems Service</s1>

seg-3da2181d7b7b = <c1/> z plikiem finals2000A

seg-09e0bb159a04 = Oficjalny produkt, łącznie z wierszami predykcji

seg-cba783dd4521 = KIF <s1>Kshana Interchange Format</s1>

seg-bec3ac6a5fc7 = Koperta wokół dowolnego wyniku

seg-8f2f203560f4 = Własna, wersjonowana koperta Kshana, a nie zewnętrzna norma; każdy odbiorca otrzymuje werdykt zgodności wersji

seg-e8a8782a7c4e = JSON, SVG, HTML, CSV <s1>wyniki przebiegu</s1>

seg-cc49e9b6404e = Każdy przebieg; MCP <c1/>

seg-7994e9983f27 = Deterministyczny przy danym scenariuszu, ziarnie (seed) i wersji silnika

seg-8844d0844559 = IntelliJ · PyCharm · CLion

seg-844c84c5252d = Wolisz klikać?

seg-6b24b242333a = Wtyczka „Kshana — PNT simulator”: kliknij prawym przyciskiem dowolny scenariusz <c1/>, wybierz Run Kshana Scenario i odczytaj wskaźniki jakości w oknie narzędzia.

seg-65bab13d3eb4 = Otwórz w JetBrains Marketplace

seg-8b49f6477e8f = Otwarty rdzeń

seg-3a199156b86e = Każda powierzchnia na tej stronie to bezpłatny otwarty rdzeń, na licencji AGPL-3.0 lub licencji komercyjnej do zamkniętej integracji. Potrzebujesz integracji ze swoim łańcuchem narzędzi albo badania wykonanego za Ciebie? <a1>Badanie na zamówienie</a1>. Pakiety dowodowe i skalibrowane modele: <a2>Kshana Pro</a2>.

seg-c9844e6afd41 = Uruchom benchmark

seg-bd7b70852d88 = Uruchom benchmark.

seg-193ee1ab991e = <c1/> zamienia plik zgłoszenia i prawdę odniesienia podziału w plik wyniku, a <c2/> renderuje pliki wyników na statyczną stronę. Nic nie jest uruchamiane w Twoim imieniu i nic nie jest przesyłane.

seg-0c50b3629e39 = Otwórz benchmark

seg-f79048f88b5c = Uruchom Kshana Studio

seg-b02b3eeec184 = rodzaje scenariuszy

seg-9a86ef058d27 = Otwórz w Kshana Studio

seg-34a0cf94d83d = Otwórz eksporty przebiegu w Kshana Studio: odtwarzalny raport HTML, JSON, CSV

seg-92ab4fe6f441 = Pobierz narysowane dane jako wartości rozdzielane przecinkami

seg-3a93f60a7714 = <s1><a1>Raport</a1></s1>

seg-c851aa23ea42 = wartości rozdzielane przecinkami

seg-366c59b03b4f = CSV

seg-7c6f4dc6bcba = Interoperacyjność

seg-1ae202ecd892 = Jeden silnik. <s1>Każde wejście.</s1>

seg-895535d4e6f1 = Jeden silnik w Rust dla odporności GNSS (globalny system nawigacji satelitarnej) i PNT (pozycjonowanie, nawigacja i czas): interfejs wiersza poleceń (CLI), pakiety Rust, Python i JavaScript, { -brand } Studio w przeglądarce, wtyczka do środowiska IDE (zintegrowane środowisko programistyczne) JetBrains oraz serwer MCP (Model Context Protocol), dzięki czemu asystent AI (sztuczna inteligencja) uruchamia sprawdzony względem wzorca silnik, zamiast zgadywać matematykę. Otwarte oprogramowanie na licencji AGPL-3.0 (GNU Affero General Public License, wersja { "3" }) lub licencja komercyjna.

seg-5e769032a8f2 = Terminal · <b>kshana</b> <s1>v{ $version }</s1>

seg-a33627692dbc = Wstrzymaj odtwarzanie

seg-02926579bdbf = Nagrany przebieg

seg-96eb5cc68188 = Odtworzenie w terminalu rzeczywistych poleceń kshana i ich wyniku

seg-da51d906ef9a = Rzeczywiste polecenia, rzeczywiste wyniki, odtworzone tak, jak zarejestrowano. W wyniku: SVs, pojazdy kosmiczne (satelity); J/S, stosunek zakłócacza do sygnału; thr, próg; RAIM, autonomiczne monitorowanie integralności odbiornika; SQM, monitorowanie jakości sygnału; p95, 95. percentyl.

seg-0e3f488d70d1 = Ten sam silnik, każdy kanał

seg-841247f53ae4 = <b>{ -brand } Studio</b><s1>w przeglądarce</s1>

seg-829150d172a6 = <b>Wiersz poleceń</b><s1>crates.io</s1>

seg-12b2c6109af2 = <b>Crate Rust</b><s1>crates.io</s1>

seg-d3a0d8c488e5 = <b>Python</b><s1>PyPI (Python Package Index)</s1>

seg-8551c2db41a2 = <b>JavaScript</b><s1>npm · WebAssembly</s1>

seg-08dae73ec16d = <b>Serwer MCP</b><s1>dla asystentów AI</s1>

seg-dd627f5fbd38 = <b>Kontener</b><s1>obraz Dockera</s1>

seg-ddf6febf53c1 = <b>JetBrains</b><s1>wtyczka IDE</s1>

seg-daa2ac123c80 = Wydanie

seg-75f38b14d6ac = Wydanie <b>v{ $version }</b>

seg-659201a5bbb1 = Narzędzia MCP

seg-2406b4cde89d = AGPL-3.0 lub licencja komercyjna

seg-bd4da5bc989d = Wygenerowane z repozytorium

seg-c7f14b9c4b7e = Asystenci AI

seg-a3c7607259f6 = Sposoby użycia

seg-fcd0ebea49bc = Wiersz poleceń

seg-85e423fab31a = Rust, Python, JavaScript

seg-76dc5d9ec114 = JetBrains

seg-ebf571f759af = Instalacja i asystenci AI

seg-84812cc9eb32 = Instalacja · asystenci AI

seg-485fee02bbcc = Instalacja w jednym wierszu. Albo bez niej.

seg-fa7515f06aa2 = Wygenerowane z manifestów repozytorium i sprawdzone krzyżowo z jego plikami README, dzięki czemu każde polecenie odpowiada wersji v{ $version }. <b>kshana-mcp</b> daje Twojemu asystentowi AI ten sam silnik: na wejściu scenariusz TOML (Tom's Obvious, Minimal Language), na wyjściu JSON (JavaScript Object Notation) i CSV (wartości rozdzielane przecinkami).

seg-e07e65946b76 = Z manifestów

seg-8b738c82a006 = Wybierz sposób instalacji

seg-2469b76c5361 = Wypróbuj w przeglądarce

seg-4cd111ab2de6 = Wiersz poleceń (Rust)

seg-379f49bff6fb = Python

seg-ada3fcf67363 = JavaScript i WebAssembly

seg-86566e989fd1 = Asystent AI (serwer MCP, cargo)

seg-6b1e4eb0f596 = Obraz Dockera

seg-97ea215c09db = Biblioteka Rust

seg-8e6e6c943c15 = Wtyczka IDE JetBrains

seg-6816f4e1a0a0 = Wersja

seg-78240346be65 = Najnowsza

seg-1e466f300d6e = Przypnij v{ $version }

seg-d8008680650d = Dla każdego, bez niczego do instalowania.

seg-567be575c392 = Silnik działa lokalnie jako WebAssembly; nic nie jest przesyłane.

seg-3df5e87998a1 = Otwórz { -brand } Studio

seg-baa129bfde8b = Dla inżynierów, którzy chcą polecenia kshana.

seg-7635e731e2ed = Kopiuj: cargo install kshana

seg-a438a9c22d93 = cargo install kshana

seg-9b7ab12bdc24 = Następnie sprawdź

seg-ef5d93d86762 = crates.io: kshana

seg-0bee80bf3587 = Użycie wiersza poleceń

seg-7e7bd8b95987 = Dla analityków i notebooków.

seg-f0e7f4300315 = Kopiuj: pip install kshana

seg-f8b955a55c46 = pip install kshana

seg-965e1b5d2d99 = PyPI: kshana

seg-15b1e4c3e367 = Przewodnik po API Pythona

seg-b617f3e23c43 = Dla programistów web i Node.js.

seg-e041699adc44 = Kopiuj: npm install kshana

seg-24b13e851369 = npm install kshana

seg-37497aec27f8 = npm: kshana

seg-d74b8819d872 = Przewodnik po npm i WebAssembly

seg-56691d997ee6 = Dla każdego, kto używa asystenta obsługującego MCP.

seg-e28638b04b18 = Kopiuj: cargo install kshana-mcp

seg-e5b97a088d7c = cargo install kshana-mcp

seg-d3fbc25e22ae = Nazwa w rejestrze <c1/>. Zarejestruj ją w swoim kliencie, według README kshana-mcp:

seg-6f1410b393fb = Lokalny plik binarny

seg-fa37e351f6b4 = Kopiuj

seg-34908f7d11bb = crates.io: kshana-mcp

seg-61a4eb09767f = Przewodnik po serwerze MCP

seg-6d9b9517915c = Gdy nie ma toolchaina Rust; serwer MCP w kontenerze.

seg-49d67e60d43e = Kopiuj: docker run --rm -i ghcr.io/ashfordeou/kshana-mcp

seg-be7c746091ac = docker run --rm -i ghcr.io/ashfordeou/kshana-mcp

seg-105a50c566fd = Rejestr kontenerów GitHub

seg-6d6fb6ef5db5 = Przewodnik po serwerze MCP: Docker

seg-696be127ad12 = Dla programistów Rust osadzających silnik.

seg-5916a37aecdc = Kopiuj: cargo add kshana

seg-366139eafcb5 = cargo add kshana

seg-2a7a767138b9 = Dokumentacja API na docs.rs

seg-bd2592af9684 = Dla użytkowników IntelliJ, PyCharm i CLion.

seg-0aa89091ff42 = Settings → Plugins → Marketplace → wyszukaj „Kshana” (ID wtyczki dev.kshana.ide). Kliknij prawym przyciskiem scenariusz .toml i wybierz Run Kshana Scenario.

seg-f36464ef1b66 = JetBrains Marketplace

seg-9f6e5af01266 = Przewodnik po wtyczce

seg-f69d7fe65b66 = Silnik w <b>Rust</b>

seg-33b5c1f7b29e = <b>AGPL-3.0</b> lub licencja komercyjna

seg-8867b06059d3 = <b>Wykaz składników oprogramowania</b> i pochodzenie kompilacji przy każdym wydaniu

seg-4895b1130db4 = Asystent AI + kshana-mcp

seg-4d7cd0c679fc = Odtwórz

seg-2eef59dde3f2 = Nagrana sesja

seg-686139ab9806 = Komunikaty wymieniane przez asystenta z kshana-mcp, zarejestrowane z serwera.

seg-50605fd27580 = Poprzedni krok

seg-32c07578eab3 = Kroki nagranej sesji

seg-2cff891dc970 = Następny krok

seg-45da99dccd40 = Nagrana sesja z serwerem kshana-mcp (Model Context Protocol, silnik v{ $version }): asystent wyświetla { "49" } narzędzi, waliduje <c1/> (poprawny: wykryty rodzaj scenariusza `clock`) i uruchamia go: scenariusz 5ba83a232b94 | holdover kwantowy 6600s p95 1.20e-4ns integralność { "1.000" } bezpieczeństwo n/a (brak ataku) | holdover klasyczny 2610s p95 19.7ns integralność { "1.000" } bezpieczeństwo n/a (brak ataku).

seg-102015d6ebd2 = <c1/>: Uruchamia scenariusz Kshana i zwraca jego szereg czasowy jako animację.

seg-0247e08ba09d = <c1/>: Ocenia zaufanie do rzeczywistego dziennika odbiornika GNSS: odczytuje dziennik u-blox UBX, RINEX { "3" } (opcjonalnie z nawigacją nadawaną, która dodaje własną pozycję silnika, RAIM i monitor wspomagany zegarem), Android GnssLogger lub NMEA, uruchamia monitory zaufania (spadek gęstości stosunku nośnej do szumu, AGC, wskaźnik zagłuszania, utrata synchronizacji, skok pozycji, RAIM, zegar) względem bazowej kalibracji i zwraca, kiedy i dlaczego odbiornik przestał być godny zaufania.

seg-155a62e8bc94 = <c1/>: Ocenia dziennik NMEA { "0183" } statku w przebiegu wsadowym (`kshana receiver-trust` z `[platform] kind = "vessel"`): model wskaźnika, monitory, które zostały uruchomione, oraz wskaźnik 0-100 każdej epoki wraz z jego odjęciami, geometrię satelitów (dobra, pogorszona, nieznana) z `label` (good, fair, poor) przy każdej epoce, przy czym geometria odejmuje punkty tylko wtedy, gdy jest słaba, oraz klasę przy każdym odjęciu (geometria, otoczenie, niespójność), z `geometry_model` (progi, obowiązujący pułap i dolna granica oraz pochodzenie) i `geometry_summary`.

seg-8ff4e06de726 = <c1/>: Ocenia ograniczony fragment strumienia NMEA { "0183" } statku tak, jak robi to `kshana receiver-trust live`, i zwraca stan zaufania dla każdej epoki (calibrating, nominal, degraded, untrusted) oraz wskaźnik 0-100 z monitorami, które odjęły punkty (schemat live JSON-lines { "1.3" }: każda epoka niesie `position`, stwierdzenie `advisory`, że wynik ma charakter doradczy, oraz geometrię satelitów `geometry` (good, degraded z przyczynami takimi jak few-satellites lub high-pdop albo unknown, gdy fragment nie ma GSV ani GSA) z `label` (good, fair, poor; geometria odejmuje punkty tylko wtedy, gdy jest słaba); każde odjęcie niesie `class`: geometry (niebo, a nie ustalenie, że nie doszło do ataku), environment lub inconsistency (podobne do ataku)), podsumowanie (liczby według stanu, geometrii i klasy, najniższy i końcowy wskaźnik, kiedy pojawiła się pierwsza epoka untrusted) oraz ostatnie zdanie `$PKSHT`.

seg-7de08fd247e0 = <c1/>: Wiąże token znacznika czasu RFC { "3161" } z pakietem dowodowym (`kshana evidence attach-timestamp`), w pamięci: `files` to pakiet w postaci zwracanej przez `create_evidence_pack`, `token_base64` to bajty pliku `.tsr` od urzędu znacznika czasu.

seg-dc1953969ec4 = <c1/>: Buduje mapę zakłóceń GNSS z raportów pozycji statków powietrznych (ADS-B NIC/NACp) lub statków (AIS) na otwartych licencjach, podanych jako tekst CSV (`kshana interference-map adsb|ais`).

seg-7a7a1e7a3f0d = <c1/>: Statyczne odwzorowanie na publiczne ramy (`kshana compliance-report --mapping` / `--sources`) jako Markdown: jedna tabela na ramy z parafrazowanym wymaganiem każdego wiersza, wynikami { -brand }, które dostarczają dowodów na (supports evidence for) ten wiersz, oraz luką, której wyniki nie zamykają; albo, przy `sources` ustawionym na true, dokumenty źródłowe, na które powołują się tabele, z wersjami i adresami URL.

seg-21caa50ec277 = <c1/>: Wypełnia odwzorowanie na publiczne ramy z dokumentów wyników { -brand } (`kshana compliance-report`): dla których wierszy sześciu ram i norm odporności (amerykańskie ramy Resilient PNT DHS v2.0, wytyczne IMO dla statków, wytyczne EASA dla lotnictwa, NIS2 art. { "21" }, EN { "16803" }, NIST IR 8323r1) podane przebiegi dostarczają dowodów na (supports evidence for), dla których nie, oraz jaką lukę zachowuje każdy wiersz.

seg-e9202a8c1176 = <c1/>: Tworzy podpisany pakiet dowodowy dla okna dziennika NMEA { "0183" } statku (`kshana receiver-trust evidence`): surowe bajty dziennika dla okna, konfigurację z każdym progiem, wyniki i przyczyny dla każdej epoki, samodzielną stronę podsumowania oraz manifest wymieniający SHA-256 każdego pliku wraz ze skrótem całego dziennika i łańcuchem skrótów, podpisany Ed25519.

seg-f09af0fa8fcd = <c1/>: Tworzy podpisany laboratoryjny pakiet pełnej pętli (`kshana evidence round-trip`, docs/spec/TEST-CONDITIONS.md): wiąże skrótami scenariusz, który wytworzył ruch, dokument laboratorium `kshana.test-conditions/1`, dziennik odbiornika i jego ocenę względem podanych zdarzeń, w podpisanym pakiecie dowodowym, którego `config.json` niesie blok `round_trip`.

seg-404efdf9e8d2 = <c1/>: Eksportuje scenariusz Kshana w jednym formacie interoperacyjnym: `czml` (Cesium Language, dla CesiumJS), `kml` (Keyhole Markup Language, dla Google Earth i narzędzi geograficznych systemów informacyjnych), `geojson` (RFC { "7946" }), `stk` (efemerydy Systems Tool Kit `.e`, jeden plik na satelitę) lub `sigmf` (nagranie Signal Metadata Format z zsyntetyzowanych próbek scenariusza `spectrum`).

seg-91fc7df72b42 = <c1/>: Eksportuje propagowaną konstelację scenariusza `orbit` jako tekst efemeryd CCSDS OEM { "2.0" } — szereg czasowy stanu inercjalnego (TEME) niosący położenie ORAZ prędkość, który odczytują narzędzia dynamiki lotu (GMAT / Orekit / STK).

seg-e7086c7b5491 = <c1/>: Eksportuje elementy średnie scenariusza `orbit` jako katalog CCSDS 502.0-B-2 OMM (Orbit Mean-Elements Message) — jeden OMM na satelitę.

seg-5689ddc45bb8 = <c1/>: Eksportuje propagowaną konstelację scenariusza `orbit` jako tekst precyzyjnych efemeryd SP3-c (standardowy format przetwarzania końcowego GNSS).

seg-73b7eb38abe9 = <c1/>: Uruchamia scenariusz Kshana i zwraca jego tabelę odtwarzalności jako tekst CSV — tabelę stabilną co do bajtu, którą CLI zapisuje jako `<scenario>.table.csv` i na którą powołują się artykuły.

seg-afec41e44d7a = <c1/>: Eksportuje ruch pojazdu i zdarzenia ze scenariusza dla laboratoryjnego symulatora GNSS (`kshana bench-export`, docs/TEST-BENCH.md): CSV z ruchem i jego opis JSON (położenie w układzie związanym z Ziemią i geodezyjne, prędkość, orientacja, UTC), zdania NMEA { "0183" } GGA/RMC, tekst punktów trasy, gdy siatka próbek jest regularna co do milisekundy, oraz zdarzenia scenariusza jako CSV i jako `[[events]]` TOML dla scenariusza `receiver-trust`.

seg-cffb261ea30e = <c1/>: Dopasowuje parametry czujników scenariuszy `hybrid` i `fusion` z dziennika IMU w bezruchu (`kshana imu-fit`, docs/MACHINE-INPUTS.md).

seg-c31f25888d91 = <c1/>: Generuje syntetyczne mostkowe NMEA { "0183" } do szkolenia załóg z TOML `nmea-scenario` (`kshana nmea-scenario`): tor statku i oś czasu skryptowanych zdarzeń (zagłuszanie, odciąganie pozycji, spoofing czasu, opóźnienie powtórzenia, z odzyskaniem).

seg-b1ed1e518609 = <c1/>: Zwraca tekst TOML jednego dołączonego scenariusza referencyjnego, bajt w bajt taki plik, jaki repozytorium dostarcza w `scenarios/`.

seg-aafdb73abfac = <c1/>: Zapisuje trasę GeoJSON do scenariusza Kshana, który leci po torze z punktów trasy, i zwraca nowy TOML scenariusza (uruchom go przez run_scenario).

seg-21086f42f34d = <c1/>: Akwizycja FFT jednego lub więcej PRN w nagraniu IQ w katalogu roboczym (`kshana iq acquire`).

seg-4091e4073457 = <c1/>: Uruchamia kampanię odtwarzania laboratoryjnego przechowywaną w katalogu roboczym (`kshana iq campaign`): nagrania (każde opisane plikiem `kshana.test-conditions/1`, podającym znaną prawdę laboratorium) x łańcuchy front-endu x projekty pętli, każda komórka śledzona i oceniana względem podanych warunków (czas do utraty synchronizacji, czas ponownej akwizycji, degradacja C/N0 względem podanego J/S obok analitycznego odniesienia oznaczonego MODELLED, częstość fałszywych synchronizacji, jitter PLL/DLL, dostępność).

seg-df54bfe48786 = <c1/>: Raportuje postęp kampanii odtwarzania laboratoryjnego z jej folderu wyjściowego w katalogu roboczym, wyłącznie odczytując pliki: komórki gotowe i oczekujące, nagrania, front-endy i projekty w planie oraz `digest`, gdy tylko każda komórka jest gotowa.

seg-ddc737c9ba9a = <c1/>: Stosuje DSP front-endu odbiornika i łagodzenia zakłóceń do nagrania IQ w katalogu roboczym i zapisuje wynik jako nowe surowe nagranie z plikiem towarzyszącym `<out>.json` (`kshana iq frontend`).

seg-0f9fef6134e1 = <c1/>: Opisuje jedno nagranie IQ w katalogu roboczym bez jego przetwarzania: rodzaj (surowe z plikiem towarzyszącym, SigMF, kolekcja SigMF), format próbek, częstotliwość próbkowania, częstotliwość środkową, liczbę próbek, czas trwania, pliki danych i ich rozmiar, granice przechwytów i liczbę adnotacji, jako JSON (ten sam wiersz, który drukuje `kshana iq info`).

seg-d416e59af6b1 = <c1/>: Dopasowuje model utraty synchronizacji pętli śledzenia do przebiegów laboratoryjnych (`kshana iq labfit`): scenariusz TOML `iq-labfit` wskazuje jeden lub więcej przebiegów, każdy to dziennik odbiornika wraz z podanymi warunkami testu; silnik wczytuje każdy dziennik, dopasowuje modele pętli i empiryczne, wykonuje bootstrap niepewności i oblicza błąd na zbiorze holdout.

seg-a409849c2544 = <c1/>: Uruchamia monitory detekcji zakłóceń i spoofingu na nagraniu IQ w katalogu roboczym (`kshana iq monitor`): szerokopasmowe monitory `power` i `spectral` oraz, przy podanych `signal` + `prns`, monitory C/N0 i jakości sygnału dla każdego satelity, każdy względem poziomu bazowego poznanego z pierwszych `baseline_s` sekund (lub z pliku ustawień).

seg-442716c37495 = <c1/>: Generuje wielosatelitarną scenę IQ GNSS do pliku w katalogu roboczym (`kshana iq scene`).

seg-d965c4c42205 = <c1/>: Konfiguracja warstwy IQ GNSS, jako JSON: `signals` (nazwy sygnałów, które przyjmują iq_scene, iq_acquire i iq_track), `enabled` (czy narzędzia plikowe IQ są włączone), `work_dir` (jedyny folder, który odczytują i zapisują; każdy argument ścieżki jest względny do niego), `max_samples` (największa liczba próbek zespolonych, jaką jedno wywołanie może wygenerować lub przetworzyć) oraz, gdy są wyłączone, `reason`.

seg-0709a11ca4ed = <c1/>: Odtwarza jedno nagranie IQ w katalogu roboczym dla kilku projektów pętli śledzenia i raportuje wynik ustalony każdego projektu (`kshana iq sweep`): projekty to każdy projekt z pliku `kshana.loop-design/1` (`design`) albo iloczyn list `pll_bws_hz`, `dll_bws_hz`, `spacings_chips` i `coherents` we wbudowanym projekcie.

seg-155a371604fb = <c1/>: Waliduje laboratoryjny plik warunków testu (`kshana iq conditions`): plik `kshana.test-conditions/1`, tekst TOML lub JSON, podający znaną prawdę laboratorium dla nagrania (oczekiwane satelity, czas ustalania, podany harmonogram zagłuszania lub zakłóceń).

seg-e485776388d7 = <c1/>: Dokonuje akwizycji, a następnie śledzi jeden lub więcej PRN w nagraniu IQ w katalogu roboczym (`kshana iq track`): akwizycja inicjalizuje każdy kanał, po czym bank pętli DLL/PLL (opcjonalnie wspomaganych FLL) odtwarza nagranie jeden raz.

seg-604b653903df = <c1/>: Odczytuje opublikowany katalog testów i plan transmisji Jammertest (NPRA/jammertest-plan, MIT) jako zaplanowaną prawdę (`kshana jammertest import`): sloty jednego obszaru testowego stają się zdarzeniami receiver-trust z identyfikatorem katalogowym i rokiem w każdej etykiecie.

seg-32761d35a4f0 = <c1/>: Ocenia dziennik odbiornika względem harmonogramu Jammertest (`kshana jammertest score`): dla każdego zaplanowanego testu opóźnienie detekcji (pierwszy alarm minus planowany początek), czy został wykryty w ramach tolerancji, późno czy pominięty, oraz czas odzyskania (odcinek bez alarmu o długości `recover_hold_s`), a także fałszywe alarmy poza każdym slotem i jego marginesem ochronnym.

seg-c41dc865f6f0 = <c1/>: Wyświetla dołączone scenariusze referencyjne jako JSON: `count` oraz `scenarios`, tablicę `name`, `kind` i `about` (pierwsze zdanie własnego komentarza nagłówkowego pliku).

seg-8744e56b9d92 = <c1/>: Raportuje, które formaty eksportu interoperacyjnego mają zastosowanie do scenariusza Kshana, bez jego uruchamiania: tablica JSON z jednym wpisem na format (`czml`, `kml`, `geojson`, `stk`, `sigmf`) podająca `applies`, `reason`, gdy format nie ma zastosowania, oraz `spec_url`, opublikowaną specyfikację, której przestrzega zapisujący.

seg-a16109ccf9e7 = <c1/>: Wyświetla każdy wbudowany rodzaj scenariusza Kshana z jego opisem i wymaganymi/opcjonalnymi polami TOML, jako tablicę JSON.

seg-299e14da6de8 = <c1/>: Wyświetla pakiety norm (`kshana standards-pack list`): oceniane zestawy scenariuszy dla profili testowych ram Resilient PNT DHS, IMO MSC.1/Circ.1575 i ICAO Doc { "9849" } Appendix F, każdy z progami, które podaje przed przebiegiem, i wierszami compliance, dla których dostarcza dowodów na (supports evidence for).

seg-1097125b8282 = <c1/>: Sprawdza LunaNet Augmented Forward Signal (AFS) względem opublikowanej specyfikacji, przypiętej do LNIS Version { "5" } Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } stycznia { "2025" }) (`kshana lunanet-afs-check`, docs/LUNANET-AFS.md).

seg-9a7ca52ec440 = <c1/>: Renderuje pliki wyników kshana-bench (`kshana bench leaderboard`) jako statyczną stronę rankingu, tekst HTML w odpowiedzi: `results` to lista tekstów JSON `kshana-bench-result/1` (najwyżej { "256" }, po { "4" } MiB każdy), z których każdy jest najpierw walidowany; plik ocenionego według innej głównej wersji specyfikacji jest odrzucany, ponieważ wyniki różnych głównych wersji nigdy nie trafiają do jednej tabeli.

seg-4b61dd090d87 = <c1/>: Uruchamia scenariusz Kshana i zwraca jego raport: podsumowanie wykonawcze, dane wejściowe, każdą wartość wyniku z jednostką i etykietą VALIDATED lub MODELLED, zdarzenia, wiersze możliwości, które przebieg wykorzystał, oraz zapis odtwarzalności (wersja silnika, skróty SHA-256 scenariusza i wyniku, ziarno, polecenie, które go odtwarza).

seg-02b4cd768b39 = <c1/>: Podsumowuje, jaka część trasy przebiega przez pogorszone komórki jednej lub więcej map zakłóceń (`kshana route-exposure`): dla każdej mapy (jedna na źródło na dobę UTC, GeoJSON zwracany przez `build_interference_map`) długość trasy oraz udziały jej długości w komórkach pogorszonych, w komórkach niepogorszonych, w komórkach ze zbyt małą próbką do oceny oraz w komórkach nieobserwowanych.

seg-00f57717440f = <c1/>: Uruchamia scenariusz odporności PNT Kshana z definicji TOML i zwraca jego wskaźniki jakości.

seg-de0623ad4fa4 = <c1/>: Uruchamia jeden pakiet norm (`kshana standards-pack run <id>`): każdy scenariusz w nim, oceniony względem progów podanych przed przebiegiem.

seg-ac7502865a0b = <c1/>: Ocenia zgłoszenie kshana-bench (`kshana bench score`, bench/SPEC.md, docs/BENCH.md): plik predykcji (`kshana-bench-predictions/1`) względem pliku prawdy (`kshana-bench-truth/1`), oba jako tekst JSON, najwyżej { "4" } MiB każdy, i zwraca plik wyniku (`kshana-bench-result/1`) z wersją specyfikacji, zadaniem (a detekcja na dziennikach odbiornika, b detekcja na IQ, c predykcja holdover czasu, d luka optymizmu poza rozkładem), podziałem, SHA-256 obu wejść i metrykami zadania (AUC, prawdopodobieństwo detekcji przy limicie fałszywych alarmów, RMSE na horyzont lub luka optymizmu).

seg-961963f408a6 = <c1/>: Geometria nieba przy linii horyzontu zależnej od azymutu (kanion uliczny, port, fiord, terminal kontenerowy): dla miejsca, czasu i ustawień wstępnych konstelacji, zestawów elementów dwuliniowych (`tle`, z `epoch` w UTC) lub satelitów podanych jako azymut/elewacja albo ECEF — które satelity są widoczne, a które zasłonięte przez linię horyzontu, GDOP/PDOP/HDOP/VDOP/TDOP z jądra DOP sprawdzonego względem gnss_lib_py, kofaktor i kowariancja we współrzędnych wschód–północ–góra z jednym zegarem odbiornika na system (lub jednym wspólnym) oraz pozioma elipsa błędu przy jednym sigma i przy podanej ufności dla podanego UERE.

seg-76679b4d7efd = <c1/>: Renderuje strumień zaufania GNSS lub wynik `receiver-trust` jako tekst telemetrii bezpieczeństwa (`kshana trust-telemetry`, docs/TRUST-TELEMETRY.md), tymi samymi koderami, których używa wiersz poleceń: `prometheus` (ekspozycja stanu końcowego), `cef` lub `leef` (jedna linia syslog RFC { "5424" } na zmianę pasma lub na epokę przy `syslog_all`; bez znacznika czasu, ponieważ żaden zegar nie jest odczytywany) lub `otlp` (ładunek metryk OTLP/HTTP JSON).

seg-e20044725e3a = <c1/>: Kontrola wstępna TOML scenariusza Kshana: sprawdza, że daje się sparsować jako TOML, i wykrywa rodzaj scenariusza, bez jego uruchamiania.

seg-2598d06895ec = <c1/>: Weryfikuje podpisany pakiet dowodowy (`kshana evidence verify`): SHA-256 każdego pliku względem manifestu, łańcuch skrótów, podpis Ed25519, a przy `public_key` (kluczu sygnatariusza, uzyskanym od sygnatariusza inną drogą) — że sygnatariusz jest oczekiwanym, a przy `full_log` — że posiadany dziennik jest tym, który pakiet rejestruje, i że fragment pochodzi z niego.

seg-62b5564e8d90 = Nagrana sesja jest tu odtwarzana krok po kroku.

seg-2359edf78388 = <b>Ten sam przebieg w Studio:</b> silnik v{ $version } · <c1/> · ziarno { "42" }

seg-c24f65399c72 = <b>{ "49" } narzędzi</b> w publicznym API (interfejs programowania aplikacji) { -brand }, w oficjalnym rejestrze MCP jako <c1/>. Eksporty orbit: SP3 (Standard Product { "3" }) oraz CCSDS (Konsultacyjny Komitet ds. Systemów Danych Kosmicznych) OMM i OEM (komunikaty elementów średnich orbity i efemeryd, TEME: układ True Equator, Mean Equinox). Zarejestruj go w sekcji <b>Asystent AI (serwer MCP)</b> lub <b>Obraz Dockera</b>. <a1>Dokumentacja serwera MCP</a1>

seg-306a0232c581 = Uruchamia scenariusz odporności PNT Kshana z definicji TOML i zwraca jego wskaźniki jakości. Zwraca podsumowanie czytelne dla człowieka, a po nim pełny wynik w JSON (wskaźniki jakości, krzywe). { -brand } waliduje modele SGP4/SDP4, układy odniesienia IAU, odchylenia Allana, dostępność GNSS/DOP, poziomy ochrony ARAIM, fuzję GNSS/INS i modele czujników kwantowych względem opublikowanych wzorców. Każdy rodzaj działa przez to jedno narzędzie, w tym <c1/> (widmo częstotliwości radiowych i waterfall), <c2/>, <c3/> i <c4/> (konstelacje wokół dowolnego ciała), <c5/> (łańcuchowe fazy, przeglądy parametrów, zespoły Monte Carlo i scenariusze złożone) oraz rodzaje nawigacji z niskiej orbity okołoziemskiej <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/> i <c12/>. Treść jest podawana w linii: pole scenariusza, które wskazuje plik, jest odrzucane, a scenariusz ma najwyżej { "4" } MiB. Najpierw wywołaj list_scenario_kinds, aby poznać typy scenariuszy i ich pola, a list_example_scenarios / get_example_scenario, aby uzyskać kompletny, uruchamialny scenariusz danego rodzaju.

seg-5fe1f6a80612 = Wyświetla każdy wbudowany rodzaj scenariusza Kshana z jego opisem i wymaganymi/opcjonalnymi polami TOML, jako tablicę JSON. Użyj tego, aby poznać, jakie scenariusze można uruchomić i jak zbudować poprawny TOML scenariusza dla run_scenario.

seg-8117177c2251 = Kontrola wstępna TOML scenariusza Kshana: sprawdza, że daje się sparsować jako TOML, i wykrywa rodzaj scenariusza, bez jego uruchamiania. Zwraca wykryty rodzaj lub opisowy błąd dla nieprawidłowego TOML. (run_scenario wykonuje pełną walidację przez uruchomienie scenariusza.)

seg-a2825327dc19 = Ocenia zaufanie do rzeczywistego dziennika odbiornika GNSS: odczytuje dziennik u-blox UBX, RINEX { "3" } (opcjonalnie z nawigacją nadawaną, która dodaje własną pozycję silnika, RAIM i monitor wspomagany zegarem), Android GnssLogger lub NMEA, uruchamia monitory zaufania (spadek gęstości stosunku nośnej do szumu, AGC, wskaźnik zagłuszania, utrata synchronizacji, skok pozycji, RAIM, zegar) względem bazowej kalibracji i zwraca, kiedy i dlaczego odbiornik przestał być godny zaufania. Opcjonalne <c1/> z momentami początku i przewidywanymi spadkami C/N0 są oceniane względem tolerancji podanych w scenariuszu: wykryte, późne lub pominięte oraz zgodne lub niezgodne. Zwraca podsumowanie i pełny wynik w JSON (wykres i CSV na żądanie; CSV przebiegu statku zaczyna się wierszem komentarza <c2/> niosącym stwierdzenie doradcze, który czytniki CSV pomijają swoją opcją komentarza). Bajty dziennika trafiają w linii do TOML jako <c3/> lub <c4/> (tylko w linii, najwyżej { "4" } MiB). Tabela <c5/> wybiera monitory morskie (spójność kinematyczna, kurs względem drogi, log prędkości, wysokość anteny, rozrzut C/N0, spójność czasu) i dodaje wskaźnik zaufania 0-100 dla każdej epoki z monitorami, które odjęły punkty. Każda epoka niesie też swoje satelitarne <c6/> (good; degraded przy małej liczbie satelitów lub wysokim PDOP albo HDOP; lub unknown, gdy dziennik nie ma elewacji satelitów ani DOP); każda epoka ma <c7/> (good, fair, poor); dla statku monitor <c8/> dołącza do wskaźnika, odejmując punkty tylko wtedy, gdy geometria jest słaba (najwyżej { "15" } punktów: degraded, nigdy untrusted), a każde odjęcie niesie klasę: geometry (niebo), environment lub inconsistency (podobne do ataku). Dla fragmentu strumienia z bramką użyj <c9/>. Wyłącznie doradczo; poziom dowodowy MODELLED.

seg-16bf5c78c5e2 = Wyświetla dołączone scenariusze referencyjne jako JSON: <c1/> oraz <c2/>, tablicę <c3/>, <c4/> i <c5/> (pierwsze zdanie własnego komentarza nagłówkowego pliku). Każdy z nich jest kompletnym scenariuszem, który działa w obecnej postaci, więc jest to najszybsza droga do poprawnego TOML dla danego rodzaju: wybierz nazwę, pobierz ją przez get_example_scenario, edytuj, uruchom. Podaj <c6/>, aby wyświetlić tylko przykłady jednego rodzaju (na przykład <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>).

seg-ced10df38705 = Zwraca tekst TOML jednego dołączonego scenariusza referencyjnego, bajt w bajt taki plik, jaki repozytorium dostarcza w <c1/>. Przekaż tekst (edytowany lub nie) do run_scenario, report_scenario, animate_scenario lub narzędzia eksportu. Nazwy pochodzą z list_example_scenarios. Scenariusz, który istnieje w repozytorium, ale nie jest dołączony, jest odrzucany z podaniem przyczyny.

seg-2d2aa3ea533c = Uruchamia scenariusz Kshana i zwraca jego raport: podsumowanie wykonawcze, dane wejściowe, każdą wartość wyniku z jednostką i etykietą VALIDATED lub MODELLED, zdarzenia, wiersze możliwości, które przebieg wykorzystał, oraz zapis odtwarzalności (wersja silnika, skróty SHA-256 scenariusza i wyniku, ziarno, polecenie, które go odtwarza). <c1/> to <c2/> (domyślnie; czytelny maszynowo <c3/>) lub <c4/> (drukowalny, samodzielny <c5/> z osadzonym wykresem). Raport kampanii niesie też swoją tabelę przeglądu lub rozkład Monte Carlo. Raport jest czystą funkcją scenariusza: żaden zegar nie jest odczytywany.

seg-9bb33a881133 = Uruchamia scenariusz Kshana i zwraca jego szereg czasowy jako animację. <c1/> to <c2/> (domyślnie: jedna animowana grafika SVG, bez skryptu), <c3/> (jedna samodzielna strona odtwarzacza) lub <c4/> (ponumerowane statyczne klatki SVG plus <c5/>, najwyżej { "120" } klatek w odpowiedzi). Opcjonalne <c6/> (od { "1" } do { "60" }, domyślnie { "12" }), <c7/> (od { "0.5" } do { "600" }, domyślnie { "8" }) i <c8/> (od { "480" } do { "3840" } pikseli, domyślnie { "960" }). Pierwszym elementem treści jest podsumowanie JSON tego, co narysowano: zakres czasu i jednostka, tytuły wykresów, liczba faz i zdarzeń, czy obecny jest spektrogram waterfall, ścieżki wyniku, z których odczytano ślady, pominięte serie oraz nazwy plików. Pliki następują po nim, po jednym elemencie treści, w kolejności, w jakiej wymienia je <c9/> podsumowania. Rodzaj, którego wynik nie ma próbkowanej osi czasu, jest odrzucany z komunikatem, który to mówi. Animacja to prezentacja MODELLED własnych liczb przebiegu; ten sam scenariusz i te same opcje dają pliki identyczne co do bajtu.

seg-21e22c397c8c = Raportuje, które formaty eksportu interoperacyjnego mają zastosowanie do scenariusza Kshana, bez jego uruchamiania: tablica JSON z jednym wpisem na format (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) podająca <c6/>, <c7/>, gdy format nie ma zastosowania, oraz <c8/>, opublikowaną specyfikację, której przestrzega zapisujący. CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON i efemerydy STK (Systems Tool Kit) <c9/> opisują geometrię scenariusza; SigMF (Signal Metadata Format) rejestruje próbki, które syntetyzuje scenariusz <c10/> z blokiem <c11/>. Wywołaj to przed export_interop.

seg-d3e67d0d2ea2 = Eksportuje scenariusz Kshana w jednym formacie interoperacyjnym: <c1/> (Cesium Language, dla CesiumJS), <c2/> (Keyhole Markup Language, dla Google Earth i narzędzi geograficznych systemów informacyjnych), <c3/> (RFC { "7946" }), <c4/> (efemerydy Systems Tool Kit <c5/>, jeden plik na satelitę) lub <c6/> (nagranie Signal Metadata Format z zsyntetyzowanych próbek scenariusza <c7/>). Pierwszym elementem treści jest indeks JSON: <c8/>, <c9/> i <c10/>, każdy z własnym <c11/> (to, co wiersz poleceń dopisuje do nazwy wyjściowej, na przykład <c12/> lub <c13/>), <c14/>, <c15/> i <c16/>. Pliki następują po nim, po jednym elemencie treści, w kolejności indeksu: pliki <c17/> jako ich tekst, binarny plik próbek SigMF jako <c18/>. Kampania eksportuje każdy scenariusz składowy, do którego format ma zastosowanie. Format, który nie ma zastosowania, jest odrzucany z podaniem przyczyny; list_export_formats raportuje wszystkie pięć naraz. Czasy są podane w uniwersalnym czasie koordynowanym (UTC); ten sam scenariusz daje pliki identyczne co do bajtu.

seg-adaa83fc94c7 = Zapisuje trasę GeoJSON do scenariusza Kshana, który leci po torze z punktów trasy, i zwraca nowy TOML scenariusza (uruchom go przez run_scenario). Trasa to <c1/> (lub <c2/> / <c3/> zawierające jedną) pozycji długość–szerokość geograficzna; zastępuje ona <c4/>, <c5/>, <c6/>, <c7/> i <c8/> scenariusza. Rodzaje, które przyjmują trasę, to <c9/>, <c10/>, <c11/> i <c12/>; każdy inny rodzaj jest odrzucany z podaniem przyczyny. Podaj dwa końce toru lub równomiernie rozmieszczone pozycje wzdłuż linii prostej: rodzaje torów lecą po start + i*step, więc każdy inny kształt jest odrzucany.

seg-11062cbf180a = Eksportuje propagowaną konstelację scenariusza <c1/> jako tekst precyzyjnych efemeryd SP3-c (standardowy format przetwarzania końcowego GNSS). Zwraca błąd, jeśli scenariusz nie jest rodzaju orbit.

seg-97461f85b298 = Eksportuje elementy średnie scenariusza <c1/> jako katalog CCSDS 502.0-B-2 OMM (Orbit Mean-Elements Message) — jeden OMM na satelitę. Zwraca błąd, jeśli scenariusz nie jest rodzaju orbit.

seg-9e12e635d64d = Eksportuje propagowaną konstelację scenariusza <c1/> jako tekst efemeryd CCSDS OEM { "2.0" } — szereg czasowy stanu inercjalnego (TEME) niosący położenie ORAZ prędkość, który odczytują narzędzia dynamiki lotu (GMAT / Orekit / STK). Jest to uzupełnienie niosące prędkość dla <c2/>, które zawiera wyłącznie położenie. Zwraca błąd, jeśli scenariusz nie jest rodzaju orbit.

seg-521b51ec756b = Uruchamia scenariusz Kshana i zwraca jego tabelę odtwarzalności jako tekst CSV — tabelę stabilną co do bajtu, którą CLI zapisuje jako <c1/> i na którą powołują się artykuły. Tylko te rodzaje ją emitują: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, gdy jego analiza <c7/> działa na modelu komunikatu <c8/> lub <c9/> (tabela efemeryd nadawanych), oraz <c10/>, gdy ustawione są jednocześnie <c11/> i <c12/>. Zwraca błąd dla każdego innego rodzaju (lub nieprawidłowego scenariusza); dla wskaźników jakości użyj run_scenario.

seg-7937ed00cbc0 = Geometria nieba przy linii horyzontu zależnej od azymutu (kanion uliczny, port, fiord, terminal kontenerowy): dla miejsca, czasu i ustawień wstępnych konstelacji, zestawów elementów dwuliniowych (<c1/>, z <c2/> w UTC) lub satelitów podanych jako azymut/elewacja albo ECEF — które satelity są widoczne, a które zasłonięte przez linię horyzontu, GDOP/PDOP/HDOP/VDOP/TDOP z jądra DOP sprawdzonego względem gnss_lib_py, kofaktor i kowariancja we współrzędnych wschód–północ–góra z jednym zegarem odbiornika na system (lub jednym wspólnym) oraz pozioma elipsa błędu przy jednym sigma i przy podanej ufności dla podanego UERE. Bez <c3/> opisuje ustawienie wstępne linii horyzontu REPRESENTATIVE wraz z jego pochodzeniem i przekrojem co stopień (puste <c4/> je wymienia). Scenariusze rodzajów orbit i integrity (z <c5/>), gnss-sim, jamming, leo-pvt i leo-pass przyjmują tę samą sekcję <c6/> przez run_scenario. Poziom dowodowy MODELLED: geometria przy podanym modelu błędu, wyłącznie linia widzenia; nie jest to predykcja rzeczywistego błędu odbiornika ani granica integralności; konstelacje ustawień wstępnych są reprezentatywnym niebem, a nie niebem z danej daty; tekst <c7/> z <c8/> (UTC) daje niebo, jakie te zestawy elementów dają w tej epoce (SGP4), a nie pomiar, i <c9/> mówi, który z nich. Niesie zastrzeżenie doradcze: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu. Bez Monte Carlo przez MCP (próbki masowe; użyj CLI, Pythona lub WASM). Wyłącznie w linii, najwyżej { "4" } MiB.

seg-f6856d69fa14 = Konfiguracja warstwy IQ GNSS, jako JSON: <c1/> (nazwy sygnałów, które przyjmują iq_scene, iq_acquire i iq_track), <c2/> (czy narzędzia plikowe IQ są włączone), <c3/> (jedyny folder, który odczytują i zapisują; każdy argument ścieżki jest względny do niego), <c4/> (największa liczba próbek zespolonych, jaką jedno wywołanie może wygenerować lub przetworzyć) oraz, gdy są wyłączone, <c5/>. Próbki IQ nigdy nie przechodzą przez protokół: narzędzia przyjmują ścieżki plików w katalogu roboczym i odpowiadają zwartymi podsumowaniami JSON. Warstwa IQ nie dodaje syntezy zakłóceń ani spoofera; nic nie jest nigdy nadawane. Wywołaj to jako pierwsze.

seg-e15b65f4df6d = Opisuje jedno nagranie IQ w katalogu roboczym bez jego przetwarzania: rodzaj (surowe z plikiem towarzyszącym, SigMF, kolekcja SigMF), format próbek, częstotliwość próbkowania, częstotliwość środkową, liczbę próbek, czas trwania, pliki danych i ich rozmiar, granice przechwytów i liczbę adnotacji, jako JSON (ten sam wiersz, który drukuje <c1/>). Opcjonalne <c2/> opisuje plik surowy bez pliku towarzyszącego; opcjonalne <c3/> dodaje SHA-256 każdego pliku danych (odczytuje cały plik).

seg-b8cad9d1eb3a = Generuje wielosatelitarną scenę IQ GNSS do pliku w katalogu roboczym (<c1/>). Tryb podanego profilu: <c2/> + <c3/> (+ opcjonalnie <c4/>, <c5/>, <c6/>). Tryb nadawany: <c7/> (plik nawigacyjny RINEX w katalogu roboczym) + <c8/> [lat, lon, alt] umieszcza każdy sprawny satelita GPS w jego rzeczywistej geometrii nadawanej. Opcjonalne <c9/> stosuje na poziomie sygnału jonosferę, troposferę, scyntylację, wielodrogowość, cień lądowo-ruchomy lub NLOS. <c10/> musi mieścić się w budżecie próbek (zob. iq_signals). Zapisuje nagranie (surowe + plik towarzyszący <c11/> lub para SigMF) oraz plik towarzyszący z prawdą; odpowiada zapisanymi plikami i ich liczbą bajtów, liczbą próbek i próbkowaniem oraz pierwszą epoką prawdy dla każdego satelity (faza kodu, Doppler, C/N0), względem której ocenia się iq_acquire. Warstwa IQ nie dodaje syntezy zakłóceń ani spoofera; nic nie jest nigdy nadawane.

seg-876517d21d1a = Akwizycja FFT jednego lub więcej PRN w nagraniu IQ w katalogu roboczym (<c1/>). Odczytuje tylko próbki potrzebne jednemu poszukiwaniu (okresy kodu koherentne × niekoherentne), które muszą mieścić się w budżecie próbek. Opcjonalne etapy <c2/> (pasmowo-przepustowy, notch, blanking, wycinanie, AGC, kwantyzator) działają jako pierwsze. Odpowiada jedną detekcją na PRN: <c3/>, <c4/>, <c5/>, znormalizowanym szczytem <c6/>, jego <c7/> detekcji i <c8/>; <c9/> / <c10/> zachowują też pełny wynik jako pliki, a <c11/> (jeden PRN; .csv, .json lub .bin) zachowuje całą powierzchnię mocy korelacji Doppler × faza kodu ze szczytem i jego paraboliczną oraz dokładną korektą Dopplera.

seg-fa1361237fc2 = Dokonuje akwizycji, a następnie śledzi jeden lub więcej PRN w nagraniu IQ w katalogu roboczym (<c1/>): akwizycja inicjalizuje każdy kanał, po czym bank pętli DLL/PLL (opcjonalnie wspomaganych FLL) odtwarza nagranie jeden raz. Śledzone próbki (całe nagranie lub jego pierwsze <c2/>) muszą mieścić się w budżecie próbek. Pętle pochodzą z <c3/> (plik TOML <c4/> w katalogu roboczym, <c5/> do wyboru jednego) lub z projektu wbudowanego, przy czym argumenty pętli go nadpisują; <c6/> ponownie dokonuje akwizycji kanału, który traci synchronizację lub fałszywie się synchronizuje. Śledzenie jest strumieniowe, więc pamięć nie rośnie wraz z nagraniem. Odpowiada nazwą i skrótem projektu, wszelkimi <c7/> (<c8/>: częstotliwość próbkowania będąca wielokrotnością połowy częstotliwości chipów czyni jitter i obciążenie pętli kodu niereprezentatywnymi) oraz, dla każdego kanału, liczbą epok, śledzonymi sekundami, końcowym Dopplerem i fazą kodu, końcowym i średnim C/N0 (dB-Hz), odsetkami epok w synchronizacji fazy i kodu, <c9/>, końcowym stanem synchronizacji, wykrytymi fałszywymi synchronizacjami i ponownymi akwizycjami. Wyjście dla każdej epoki trafia wyłącznie do plików: <c10/> (E/P/L, dyskryminatory, stany pętli, C/N0, stan synchronizacji; .csv/.jsonl/.bin), <c11/>, <c12/> / <c13/>. PRN, który nie został zdobyty, jest odrzucany wraz ze swoją statystyką i progiem.

seg-020ed04404e3 = Stosuje DSP front-endu odbiornika i łagodzenia zakłóceń do nagrania IQ w katalogu roboczym i zapisuje wynik jako nowe surowe nagranie z plikiem towarzyszącym <c1/> (<c2/>). <c3/> wybiera dowolne z: <c4/> [lo, hi] FIR, adaptacyjny <c5/>, impulsowe <c6/>, <c7/> w dziedzinie częstotliwości, <c8/> oraz kwantyzator <c9/>-bitowy (poprzedzony automatycznym AGC, chyba że <c10/>), zawsze w tej kolejności. Całe wejście musi mieścić się w budżecie próbek. Odpowiada liczbą przetworzonych próbek i zapisanymi plikami z ich liczbą bajtów. Przetwarza nagranie; niczego nie syntetyzuje.

seg-dda3a2db08a2 = Uruchamia kampanię odtwarzania laboratoryjnego przechowywaną w katalogu roboczym (<c1/>): nagrania (każde opisane plikiem <c2/>, podającym znaną prawdę laboratorium) x łańcuchy front-endu x projekty pętli, każda komórka śledzona i oceniana względem podanych warunków (czas do utraty synchronizacji, czas ponownej akwizycji, degradacja C/N0 względem podanego J/S obok analitycznego odniesienia oznaczonego MODELLED, częstość fałszywych synchronizacji, jitter PLL/DLL, dostępność). Przyrostowo: jedno wywołanie uruchamia oczekujące komórki mieszczące się w budżecie próbek (lub <c3/>), każda ukończona komórka jest zachowywana, a następne wywołanie wznawia. Odpowiada liczbami komórek, niepowodzeniami, zapisanymi plikami oraz <c4/>, gdy tylko każda komórka jest gotowa. Ocenia wyłącznie zapisane dane; nie syntetyzuje żadnych zakłóceń.

seg-56574d125f36 = Raportuje postęp kampanii odtwarzania laboratoryjnego z jej folderu wyjściowego w katalogu roboczym, wyłącznie odczytując pliki: komórki gotowe i oczekujące, nagrania, front-endy i projekty w planie oraz <c1/>, gdy tylko każda komórka jest gotowa.

seg-fd13bae9c868 = Odtwarza jedno nagranie IQ w katalogu roboczym dla kilku projektów pętli śledzenia i raportuje wynik ustalony każdego projektu (<c1/>): projekty to każdy projekt z pliku <c2/> (<c3/>) albo iloczyn list <c4/>, <c5/>, <c6/> i <c7/> we wbudowanym projekcie. Każdy PRN jest zdobywany raz, a każdy kanał (projekt, PRN) śledzi te same próbki, więc każdy wynik jest dokładnie taki, jak przy uruchomieniu samego projektu. Odpowiada, dla każdego projektu i PRN, wartościami <c8/>, <c9/> i <c10/> (z drugiej połowy przebiegu), <c11/>, <c12/>, <c13/> oraz skrótem projektu; <c14/> / <c15/> zachowują tabelę jako pliki. Śledzony przedział musi mieścić się w budżecie próbek (<c16/> go zawęża), a w jednym wywołaniu działa najwyżej { "256" } kanałów (projekt, PRN). Przetwarza nagranie; niczego nie syntetyzuje.

seg-99cf77fb08fe = Uruchamia monitory detekcji zakłóceń i spoofingu na nagraniu IQ w katalogu roboczym (<c1/>): szerokopasmowe monitory <c2/> i <c3/> oraz, przy podanych <c4/> + <c5/>, monitory C/N0 i jakości sygnału dla każdego satelity, każdy względem poziomu bazowego poznanego z pierwszych <c6/> sekund (lub z pliku ustawień). Odpowiada seriami (nazwa i długość), każdym zdarzeniem zgłoszonym przez monitory (początek, koniec, monitor, co się zmieniło; najwyżej { "200" } w odpowiedzi) oraz ustawieniami i poziomami bazowymi, których monitory się nauczyły; <c7/> zachowuje cały raport (każdą serię, zdarzenie i widmo), a <c8/> zapisuje <c9/> i <c10/>. Przedział musi mieścić się w budżecie próbek (<c11/> go zawęża). Zdarzenie monitora mówi, że zmierzona wielkość opuściła swój poznany poziom bazowy; nie wskazuje przyczyny ani źródła. Ocenia wyłącznie zapisane dane; niczego nie syntetyzuje. Poziom dowodowy: MODELLED.

seg-e8b21d821c6a = Waliduje laboratoryjny plik warunków testu (<c1/>): plik <c2/>, tekst TOML lub JSON, podający znaną prawdę laboratorium dla nagrania (oczekiwane satelity, czas ustalania, podany harmonogram zagłuszania lub zakłóceń). Odpowiada rozstrzygniętymi warunkami i ich <c3/> albo przyczyną, dla której plik jest nieprawidłowy. Wyłącznie w linii: nic nie jest odczytywane z dysku, a ścieżka nagrania, którą plik wskazuje, nie jest otwierana (kampania rozstrzyga je wewnątrz katalogu roboczego). Wejście jest ograniczone do { "4" } MiB.

seg-90cbfeaf9e14 = Dopasowuje model utraty synchronizacji pętli śledzenia do przebiegów laboratoryjnych (<c1/>): scenariusz TOML <c2/> wskazuje jeden lub więcej przebiegów, każdy to dziennik odbiornika wraz z podanymi warunkami testu; silnik wczytuje każdy dziennik, dopasowuje modele pętli i empiryczne, wykonuje bootstrap niepewności i oblicza błąd na zbiorze holdout. Wszystko jest w linii: <c3/> każdego przebiegu podaje <c4/> lub <c5/> (<c6/> jest odrzucane), a narzędzie nie odczytuje ani nie zapisuje żadnego pliku, więc nie potrzebuje katalogu roboczego IQ. Alternatywnie <c7/> scenariusza wskazuje <c8/>, gotowy folder wyjściowy <c9/>: narzędzie dopasowuje wtedy modele C/N0 i synchronizacji do jego ocenionych komórek (raport <c10/>; Q jest podane, nigdy dopasowywane, a identyfikowalne przesunięcie J/S jest dopasowywane; przy <c11/> wymagana jest tabela <c12/>). Ten folder jest rozstrzygany względem katalogu roboczego IQ i musi leżeć wewnątrz niego (wszystko na zewnątrz jest odrzucane); jest odczytywany, nic nie jest zapisywane. Odpowiada sparsowanym <c13/>, residuami i predykcjami jako tekstem CSV oraz podsumowaniem w Markdown. Wejście jest ograniczone do { "4" } MiB. Dopasowanie opisuje podane przebiegi laboratoryjne; nie jest predykcją dla innych odbiorników ani warunków poza tym, co podaje raport. Poziom dowodowy: MODELLED.

seg-4b20b03eb0df = Ocenia ograniczony fragment strumienia NMEA { "0183" } statku tak, jak robi to <c1/>, i zwraca stan zaufania dla każdej epoki (calibrating, nominal, degraded, untrusted) oraz wskaźnik 0-100 z monitorami, które odjęły punkty (schemat live JSON-lines { "1.3" }: każda epoka niesie <c2/>, stwierdzenie <c3/>, że wynik ma charakter doradczy, oraz geometrię satelitów <c4/> (good, degraded z przyczynami takimi jak few-satellites lub high-pdop albo unknown, gdy fragment nie ma GSV ani GSA) z <c5/> (good, fair, poor; geometria odejmuje punkty tylko wtedy, gdy jest słaba); każde odjęcie niesie <c6/>: geometry (niebo, a nie ustalenie, że nie doszło do ataku), environment lub inconsistency (podobne do ataku)), podsumowanie (liczby według stanu, geometrii i klasy, najniższy i końcowy wskaźnik, kiedy pojawiła się pierwsza epoka untrusted) oraz ostatnie zdanie <c7/>. <c8/> deklaruje statek (<c9/>, jego limity prędkości, przyspieszenia i prędkości zwrotu, wysokość anteny, czy na magistrali jest czujnik kursu). Fragment musi obejmować okno kalibracji; wejście jest ograniczone do { "2" } MiB i { "20,000" } epok, a odpowiedź niesie najwyżej { "200" } wierszy epok degraded lub untrusted. Jest to ograniczona postać polecenia live: nie jest otwierane żadne gniazdo i nic nie jest zapisywane do portu, a bramka i eksportery telemetrii (długo działający proces i jego serwer <c10/>) są dostępne wyłącznie z wiersza poleceń. Kontrole nie widzą spoofera, którego pozycja jest spójna ze wszystkim na magistrali. Wyłącznie doradczo: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu; odpowiedzialność ponosi nadal operator. Poziom dowodowy: MODELLED.

seg-34c1ecfea464 = Odczytuje opublikowany katalog testów i plan transmisji Jammertest (NPRA/jammertest-plan, MIT) jako zaplanowaną prawdę (<c1/>): sloty jednego obszaru testowego stają się zdarzeniami receiver-trust z identyfikatorem katalogowym i rokiem w każdej etykiecie. <c2/> zawiera jeden plik planu na dobę, <c3/> to pierwsza epoka dziennika, <c4/> to przesunięcie planu względem UTC (domyślnie { "2" }, CEST). Zwraca <c5/> (dołącz je do sesji receiver-trust), <c6/> (identyfikator testu, rodzaj, początek i koniec w sekundach od początku dziennika) oraz liczby pominiętych. Zdarzenia to ZAPLANOWANE sloty, a nie zarejestrowane czasy emisji: slot może zacząć się późno lub nigdy nie zostać wykonany, a pole <c7/> planu jest w większości puste. Żadne pole kontaktowe ani osobowe planu nie jest odczytywane. Wejście jest ograniczone do { "4" } MiB na tekst. Poziom dowodowy: MODELLED.

seg-b6c610d771dd = Ocenia dziennik odbiornika względem harmonogramu Jammertest (<c1/>): dla każdego zaplanowanego testu opóźnienie detekcji (pierwszy alarm minus planowany początek), czy został wykryty w ramach tolerancji, późno czy pominięty, oraz czas odzyskania (odcinek bez alarmu o długości <c2/>), a także fałszywe alarmy poza każdym slotem i jego marginesem ochronnym. <c3/> wymaga tylko <c4/> (lub rinex, android, nmea, sbf); podaj dziennik jako <c5/> (formaty tekstowe) lub <c6/> (binarny). Wymaga JSON katalogu i planów (<c7/>, <c8/>) oraz obszaru testowego (<c9/>). Zwraca kartę wyników: <c10/>, <c11/>, <c12/> i etykietę MODELLED. Harmonogram to zaplanowane sloty, a nie zarejestrowane czasy emisji, więc pominięcie może oznaczać test, który nigdy się nie odbył. Podpisany pakiet dowodowy wymaga klucza podpisującego: użyj wiersza poleceń (<c13/>). Wejście jest ograniczone do { "4" } MiB na tekst. Wyłącznie doradczo: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu; odpowiedzialność ponosi nadal operator. Poziom dowodowy: MODELLED.

seg-5cf645381e15 = Ocenia dziennik NMEA { "0183" } statku w przebiegu wsadowym (<c1/> z <c2/>): model wskaźnika, monitory, które zostały uruchomione, oraz wskaźnik 0-100 każdej epoki wraz z jego odjęciami, geometrię satelitów (dobra, pogorszona, nieznana) z <c3/> (good, fair, poor) przy każdej epoce, przy czym geometria odejmuje punkty tylko wtedy, gdy jest słaba, oraz klasę przy każdym odjęciu (geometria, otoczenie, niespójność), z <c4/> (progi, obowiązujący pułap i dolna granica oraz pochodzenie) i <c5/>. <c6/> podaje limity statku oraz wszelkie ustawienia monitorów lub wskaźnika (tabela <c7/> nie jest potrzebna), a <c8/> to tekst dziennika, co pozwala uniknąć wklejania go w ciąg znaków TOML. Wejście jest ograniczone do { "4" } MiB; odpowiedź niesie dokument z <c9/> skróconym do liczb według stanu i najwyżej { "200" } epok degraded lub untrusted. Dla dziennika w innym formacie lub z <c10/> do oceny użyj <c11/>. Wyłącznie doradczo: nie jest to sprzęt nawigacyjny z zatwierdzeniem typu; odpowiedzialność ponosi nadal operator. Poziom dowodowy: MODELLED.

seg-f65900d7e9e9 = Generuje syntetyczne mostkowe NMEA { "0183" } do szkolenia załóg z TOML <c1/> (<c2/>): tor statku i oś czasu skryptowanych zdarzeń (zagłuszanie, odciąganie pozycji, spoofing czasu, opóźnienie powtórzenia, z odzyskaniem). Zwraca zestaw zdań z poprawną sumą kontrolną (GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT, VBW; pierwsze { "2000" } wierszy) oraz dziennik instruktora (co i kiedy zostało wstrzyknięte, z prawdziwym torem i <c3/> najwyższego poziomu z prędkościami szczytowymi i przyspieszeniami; zdarzenia odciągania niosą swoją szczytową prędkość i przyspieszenie odciągania; schemat kshana-nmea-training/1) jako JSON i tekst. Pułap widocznych satelitów odbiornika to <c4/> (domyślnie { "12" }). Deterministyczne dla danego <c5/>. WYŁĄCZNIE TEKST: nic tu nie syntetyzuje RF, IQ ani żadnego przebiegu, nic nie jest nadawane, a wynik służy do szkolenia i testowania, nigdy do działających systemów nawigacyjnych statku (zdanie znacznikowe w strumieniu to mówi). Wyłącznie doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu. Strumieniowanie na adres TCP lub UDP jest dostępne wyłącznie z wiersza poleceń. Cztery przykładowe scenariusze znajdują się w scenarios/training/.

seg-73481bd215d3 = Tworzy podpisany pakiet dowodowy dla okna dziennika NMEA { "0183" } statku (<c1/>): surowe bajty dziennika dla okna, konfigurację z każdym progiem, wyniki i przyczyny dla każdej epoki, samodzielną stronę podsumowania oraz manifest wymieniający SHA-256 każdego pliku wraz ze skrótem całego dziennika i łańcuchem skrótów, podpisany Ed25519. <c2/>/<c3/> to sekundy od pierwszej epoki dziennika. Zwraca pliki jako JSON (przekaż je do <c4/>), klucz publiczny sygnatariusza i odcisk. Ziarno podpisu nigdy nie jest zwracane ani zapisywane w dzienniku; jeśli <c5/> zostanie pominięte, używany jest jednorazowy klucz i odrzucany, więc pakiet dowodzi integralności względem klucza, który sam wskazuje, a nie tego, kto go podpisał: dla klucza, na którym coś zależy, utwórz pakiet w wierszu poleceń (ziarno przekazane tutaj przechodzi przez rozmowę). Wejście jest ograniczone do { "4" } MiB, a odpowiedź do { "4" } MiB (zawęź okno). Pakiet jest technicznym zapisem tego, co silnik obliczył z dziennika przy podanych ustawieniach; nie jest opinią prawną, ustaleniem faktów o jakimkolwiek zdarzeniu ani certyfikacją. Poziom dowodowy: MODELLED.

seg-255de20bccce = Tworzy podpisany laboratoryjny pakiet pełnej pętli (<c1/>, docs/spec/TEST-CONDITIONS.md): wiąże skrótami scenariusz, który wytworzył ruch, dokument laboratorium <c2/>, dziennik odbiornika i jego ocenę względem podanych zdarzeń, w podpisanym pakiecie dowodowym, którego <c3/> niesie blok <c4/>. Odrzuca pakiet, którego warunki i zdarzenia oceniające się nie zgadzają albo którego podany skrót dziennika SHA-256 nie jest skrótem tego dziennika. BRAK SYGNAŁU: nic nie jest zapisywane, odtwarzane ani planowane; to, jak ruch scenariusza dotarł do odbiornika, jest odpowiedzialnością operatora i jest zapisane wyłącznie tak, jak podano. Ziarno podpisu nigdy nie jest zwracane ani zapisywane w dzienniku; po pominięciu używany jest jednorazowy klucz i odrzucany (integralność, a nie tożsamość). Wejście jest ograniczone do { "4" } MiB, a odpowiedź do { "4" } MiB. Zapis techniczny, a nie opinia prawna ani certyfikacja. Poziom dowodowy: MODELLED.

seg-c0105e635548 = Weryfikuje podpisany pakiet dowodowy (<c1/>): SHA-256 każdego pliku względem manifestu, łańcuch skrótów, podpis Ed25519, a przy <c2/> (kluczu sygnatariusza, uzyskanym od sygnatariusza inną drogą) — że sygnatariusz jest oczekiwanym, a przy <c3/> — że posiadany dziennik jest tym, który pakiet rejestruje, i że fragment pochodzi z niego. Zwraca raport: <c4/>, każde niepowodzenie z kodem i plikiem, każdą kontrolę, <c5/>, uwagi oraz <c6/>: <c7/> (sygnatariusz przypięty), <c8/> (wszystko się zgadza, ale nie podano zaufanego <c9/>, więc podpis dowodzi jedynie, że pakiet jest nienaruszony względem klucza, który sam wskazuje, a który każdy może wygenerować; powiedz to, nie nazywaj go zweryfikowanym) lub <c10/>, z <c11/> do pokazania użytkownikowi. <c12/> powoduje niepowodzenie dla pakietu, który nie niesie tokenu znacznika czasu. Wejścia są ograniczone do { "4" } MiB. Pomyślna weryfikacja mówi, że zapis jest niezmieniony i kto go podpisał (klucz, który podano); nie mówi, co spowodowało jakiekolwiek zdarzenie, kto za nie odpowiada ani że dziennik pokazuje to, co odbiornik naprawdę odebrał.

seg-b4ee0795e52c = Buduje mapę zakłóceń GNSS z raportów pozycji statków powietrznych (ADS-B NIC/NACp) lub statków (AIS) na otwartych licencjach, podanych jako tekst CSV (<c1/>). Zwraca jeden dokument GeoJSON na dobę UTC (schemat kshana-interference-map/v1) (nazwy plików <c2/>; wersja metody { "2" }), w którym każda opublikowana komórka siatki jest <c3/>, <c4/>, <c5/>, <c6/> lub <c7/> (ADS-B) albo <c8/>/<c9/> (AIS), z osadzoną metodą, jej wstępnie zarejestrowanymi progami, licencją zbioru danych i atrybucją. Każda liczba na komórkę poniżej minimum publikacji ({ "5" }) to <c10/> (wstrzymana, nigdy zero), a doba, której tła nie da się oszacować, wstrzymuje swoje rozstrzygnięcia. Wyłącznie agregaty: identyfikatory są haszowane w pamięci i nigdy nie są zwracane, a komórka z mniej niż { "5" } różnymi statkami powietrznymi lub statkami nie jest publikowana. <c11/> to zatwierdzone ustawienie wstępne lub <c12/> (z licence, licence_url, attribution). Wejście jest ograniczone do { "4" } MiB, a odpowiedź do { "4" } MiB (użyj grubszego <c13/> lub wiersza poleceń dla większych danych). Nic nie jest pobierane: wielokąty lądu, jeśli są potrzebne dla AIS, są przekazywane. Pogorszona komórka nie wskazuje zakłóceń jako przyczyny; niepublikowana komórka nie jest dowodem, że komórka jest czysta; nie jest to prognoza. Poziom dowodowy: MODELLED.

seg-d3175204c0ea = Podsumowuje, jaka część trasy przebiega przez pogorszone komórki jednej lub więcej map zakłóceń (<c1/>): dla każdej mapy (jedna na źródło na dobę UTC, GeoJSON zwracany przez <c2/>) długość trasy oraz udziały jej długości w komórkach pogorszonych, w komórkach niepogorszonych, w komórkach ze zbyt małą próbką do oceny oraz w komórkach nieobserwowanych. Trasa to GeoJSON LineString lub tekst CSV <c3/>; <c4/>/<c5/> (RRRR-MM-DD) zachowują mapy z zakresu dat. Wejście jest ograniczone do { "4" } MiB na element. Komórki nieobserwowane nie są dowodem, że trasa jest czysta; pogorszona komórka nie wskazuje zakłóceń jako przyczyny; opisuje to przeszłe zgłoszenia i nie jest prognozą. Poziom dowodowy: MODELLED.

seg-e11a6425c180 = Wypełnia odwzorowanie na publiczne ramy z dokumentów wyników Kshana (<c1/>): dla których wierszy sześciu ram i norm odporności (amerykańskie ramy Resilient PNT DHS v2.0, wytyczne IMO dla statków, wytyczne EASA dla lotnictwa, NIS2 art. { "21" }, EN { "16803" }, NIST IR 8323r1) podane przebiegi dostarczają dowodów na (supports evidence for), dla których nie, oraz jaką lukę zachowuje każdy wiersz. Podaj każdy przebieg jako <c2/>, <c3/> (tekst JSON wyniku) oraz, jeśli go masz, <c4/> (TOML scenariusza, który podaje rodzaj, jakiego wynik nie podaje; wynik receiver-trust go nie potrzebuje). Najwyżej { "64" } przebiegów i { "4" } MiB łącznie; nic nie jest odczytywane z dysku. <c5/> każdego wiersza to <c6/>, <c7/>, <c8/> lub <c9/>, a każdy wiersz zachowuje swoje <c10/> nawet gdy jest poparty dowodami; wejścia, których nie dało się użyć, są wymienione w <c11/> i nie liczą się wcale. Pokazuj <c12/> raportu z każdym wynikiem, dosłownie: status oznacza, że przebieg dostarcza dowodów na możliwości, które wiersz wymienia; nie jest to ustalenie, że jakiekolwiek ramy są spełnione, i nie oznacza, że jakikolwiek produkt został przez kogokolwiek oceniony lub zatwierdzony. Nie opisuj wyniku w mocniejszych słowach. Poziom dowodowy: MODELLED.
