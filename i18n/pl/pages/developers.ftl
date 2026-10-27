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
