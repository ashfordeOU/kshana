# docs--npm: translations (pl)

seg-3d770dd786e4 = Sposób użycia

seg-d4a762001549 = Licencja

seg-81a87d14efda = Kshana: znak, celownik kompasu wyznaczający precyzyjny moment, obok logotypu słownego kshana

seg-0ddcab84868f = Źródło: <c1/>

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>precyzyjna chwila</em></b><br/> Otwartoźródłowy symulator odporności PNT (pozycjonowanie, nawigacja i czas).

seg-3b861b2f08b8 = Wydanie v{ $version }

seg-6a1906d8d4ad = Około { "95" }% pokrycia linii, z progiem { "85" }% w ciągłej integracji

seg-a9f4f2795fb5 = Licencja: AGPL-3.0-only lub licencja komercyjna

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Przećwicz minutę, w której GNSS gaśnie: konsola misji Kshana, narysowana na podstawie prawdziwego przebiegu silnika, połączona kampania zagłuszania, spoofingu, holdover i integralności nad { "102" } satelitami GPS, Galileo, BeiDou i GLONASS

seg-d1153c5e9112 = Przećwicz minutę, w której GNSS gaśnie

seg-d284448743af = Kshana odtwarza zagłuszanie, spoofing i holdover zegara, gdy zawodzą sygnały GNSS (globalnego systemu nawigacji satelitarnej), i mówi, jak długo system utrzymuje czas i pozycję w granicach budżetu oraz który zegar lub czujnik daje największy zapas. To jest pakiet WebAssembly: cały silnik w JavaScript, w przeglądarce lub w Node.js. Każdy przebieg jest odtwarzalny co do bitu na podstawie scenariusza, ziarna (seed) i wersji silnika.

seg-d1a3f78ad8e0 = Wypróbuj go najpierw bez niczego do instalowania: <a1>Kshana Studio</a1> uruchamia cały silnik w przeglądarce, skompilowany do WebAssembly, i niczego nie wysyła.

seg-d662055d817f = Pakiet jest modułem ES (ECMAScript, standardowy JavaScript) z ładunkiem WebAssembly, zbudowanym dla przeglądarki. Zainicjuj go raz, a potem wywołuj silnik synchronicznie. Jedyna różnica między przeglądarką a Node.js polega na sposobie wczytania binarnego pliku WebAssembly.

seg-0b750617ea08 = <b>W przeglądarce</b> (przez bundler lub stronę, która serwuje <c1/>) <c2/> pobiera <c3/> z miejsca obok modułu:

seg-70fc98eb8d2e = <b>W Node.js</b> <c1/> kończy się błędem <c2/> (<c3/> w Node nie potrafi czytać pliku lokalnego), więc wczytaj plik binarny z dysku i przekaż go do <c4/>:

seg-2c181d5e0942 = Zapisz wersję dla Node.js jako plik <c1/> (albo ustaw <c2/> w <c3/>), aby <c4/> działało. Dalej oba warianty są takie same:

seg-06eb982ef260 = TypeScript widzi typowane wyniki: <c1/> zwraca <c2/> (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> zwraca <c9/>, którego <c10/> jest unią <c11/> wszystkich rodzajów, a <c12/> zwraca <c13/> (albo <c14/> przy powodzeniu). Własne pola każdego dokumentu wyniku różnią się w zależności od rodzaju; <c15/> typuje wspólną kopertę (<c16/>, <c17/> oraz blok <c18/> z elementami <c19/>).

seg-31d983ae7036 = Cztery kolejne funkcje opisują silnik dla interfejsu użytkownika. <c1/> zwraca obiekt JSON od rodzaju do modułów wymienionych w jego wierszach macierzy weryfikacji, <c2/> zwraca obiekt od rodzaju do pól wyniku, które odpowiadają na jego pytanie (metadane do wyświetlania; silnik nigdy ich nie czyta), <c3/> zwraca nazwy sygnałów, które przyjmuje <c4/>, a <c5/> zwraca krótką syntetyczną scenę IQ, pozyskaną i śledzoną w pamięci (najwyżej { "0.25" } s, { "1,000,000" } próbek i { "8" } satelitów), z taką samą odpowiedzią jak w wersji natywnej.

seg-ceee5ddc0c36 = W wersji WebAssembly każdy punkt wejścia to osobne wywołanie: <c1/> (dokument wyniku jako ciąg JSON), <c2/>, <c3/>, <c4/> (tabela CSV (wartości rozdzielone przecinkami) scenariusza jako ciąg albo <c5/> dla rodzajów, które nie publikują tabeli; przy nieprawidłowym scenariuszu zgłasza wyjątek), <c6/> (jeden przebieg silnika zwracający <c7/> jako ciąg JSON — użyj go, gdy potrzebujesz więcej niż jednego wyniku, ponieważ każde inne wywołanie uruchamia scenariusz od nowa), <c8/> (te same wyniki jako jeden typowany obiekt, z dokumentem już sparsowanym jako <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspekcja; <c14/> zwraca sparsowaną listę), <c15/> / <c16/> — kodek linku do udostępniania (URL, jednolity lokalizator zasobów), którego <a1>Kshana Studio</a1> używa do przekazywania całego scenariusza we fragmencie paska adresu — oraz <c17/> / <c18/> / <c19/>, czyli artefakty efemeryd SP3-c (wersja c formatu Standard Product { "3" }) i CCSDS (Consultative Committee for Space Data Systems) — OMM, Orbit Mean-elements Message, i OEM, Orbit Ephemeris Message — które zapisuje CLI — oraz <c20/>, które ocenia prawdziwy dziennik odbiornika opisany scenariuszem <c21/> i zwraca <c22/> jako ciąg JSON (przeglądarka nie ma systemu plików, więc dziennik i ewentualny plik nawigacyjny muszą być w scenariuszu wbudowane jako <c23/> lub <c24/>; tabela <c25/> dodaje monitory morskie i wskaźnik zaufania 0-100, wyłącznie doradczo), <c26/> / <c27/> (jakie formaty interoperacyjności obsługuje scenariusz, bez jego uruchamiania, oraz jeden eksport w pamięci: <c28/>, <c29/>, <c30/>, <c31/> lub <c32/> jako JSON <c33/>, bajt w bajt identyczny dla tego samego scenariusza, nic nie jest wysyłane), <c34/> (trasa GeoJSON zapisana w scenariuszu toru po punktach trasy, odpowiednik <c35/> w wierszu poleceń), <c36/> (szereg czasowy przebiegu jako animowany SVG, pojedynczy odtwarzacz HTML lub klatki SVG), <c37/> / <c38/> (dołączone scenariusze referencyjne i ich TOML), <c39/> (powiązanie tokenu RFC { "3161" } z pakietem dowodowym w pamięci; pakiet nadal musi przejść weryfikację, a podpis urzędu znakowania czasem nie jest sprawdzany), <c40/> (które dane nawigacyjne Galileo satelitów uwierzytelnia plik stron I/NAV lub strumień UBX, z zaufanym korzeniem Merkle'a lub kluczami publicznymi i opcjonalnym niezależnym czasem odniesienia; uwierzytelnia dane i nie zawiera twierdzenia o skuteczności ochrony przed spoofingiem; nic nie jest wysyłane), <c41/> (ograniczony fragment NMEA oceniany tak, jak ocenia go tryb na żywo; bez bramki), <c42/> (dziennik NMEA statku jako przebieg wsadowy), <c43/> (strumień lub wynik zaufania jako tekst Prometheus, wiersze syslog CEF lub LEEF albo ładunek OTLP; nic nie jest wysyłane), <c44/> (sprawdzenie podpisanego pakietu dowodowego; nic nie jest wysyłane; pakiety tworzy się przez CLI, Python lub MCP), <c45/> (ruch i zdarzenia scenariusza jako tekst dla laboratoryjnego symulatora; nie jest zapisywany żaden sygnał), <c46/> i <c47/> (które wiersze wymagań publicznych ram dokumenty wyników wspierają dowodami (supports evidence for), z luką dla każdego wiersza; nie jest to stwierdzenie, że ramy zostały spełnione), <c48/> (tekst CSV ADS-B lub AIS na GeoJSON <c49/> na dobę UTC; tylko dane zagregowane), <c50/> (udział trasy w komórkach tych map o pogorszonej jakości; nie jest to prognoza), <c51/> (syntetyczny NMEA mostka i dziennik instruktora do szkolenia załóg; wyłącznie tekst, nigdy do żywych systemów nawigacyjnych statku) oraz funkcje geometrii nieba <c52/>, <c53/>, <c54/>, <c55/> i <c56/> (które satelity widzi stanowisko, gdy budynki, nabrzeża lub teren zasłaniają część nieba, z rozmyciem dokładności, poziomą elipsą błędu, chmurą Monte Carlo z ziarnem i skyplotem jako tekstem SVG; decyzja o widoczności i elipsa są sprawdzone względem niezależnych bibliotek, zestawy są geometriami reprezentatywnymi, a nie pomiarami terenowymi, a horyzont usuwa satelity w linii widzenia i nic więcej). Nie ma ich w wersji przeglądarkowej: <c57/> z bramką i nasłuchem TCP, strumieniowany szkoleniowy NMEA oraz eksportery telemetrii (Prometheus, OpenTelemetry, syslog) to długo działające procesy sieciowe i pozostają w narzędziu wiersza poleceń; utworzenie pakietu dowodowego wymaga klucza podpisu, który należy do CLI lub Pythona. Nie ma tu jednowywołaniowego <c58/>; to powiązanie istnieje tylko w pakiecie wheel dla Pythona.

seg-12a295fba8a5 = Każda możliwość w macierzy weryfikacji jest oznaczona jako <b>sprawdzona</b> (względem niezależnej wyroczni zewnętrznej), <b>obliczona na podstawie modelu</b> lub <b>należąca do partnera</b>; wartości zegarów optycznych to cele kosmiczne na sprzęcie naziemnym (żaden optyczny zegar strontowy nie poleciał w kosmos). Dojrzałość <em>nie</em> jest jednolita w różnych dziedzinach — PNT dla Ziemi jest sprawdzone względem prawdziwych danych; nawigacja w przestrzeni kosmicznej i na Marsie jest obliczona na podstawie modelu, a względem zewnętrznych wyroczni sprawdzone są tylko jej elementy składowe (czas przelotu światła, położenia planet); OD (wyznaczanie orbity) dla prawdziwych misji w przestrzeni kosmicznej jest w planach.

seg-68ed88ec0b32 = <b>Widmo</b>: jak zagłuszacz zajmuje pasmo L GNSS, pasmo po paśmie.

seg-f04a0aeeee33 = <b>Zegary i synchronizacja czasu</b>: holdover względem progu, transfer czasu oraz holdover telekomunikacyjny względem masek sektora normalizacji Międzynarodowego Związku Telekomunikacyjnego (ITU-T).

seg-7e38ac603ef2 = <b>Konstelacje wokół dowolnego ciała</b>: pokrycie, rozmycie dokładności i dostępność wokół Ziemi, Księżyca lub Marsa oraz Układ Słoneczny w jednej epoce.

seg-82708b06dcc6 = <b>Nawigacja z niskiej orbity okołoziemskiej</b>: sygnał, przelot i łącze, komunikat nawigacyjny oraz fuzja pozycji, etap po etapie.

seg-e21e9bb02d00 = <b>Kampanie</b>: połączona misja, przegląd parametru lub zespół Monte Carlo w jednym scenariuszu.

seg-ba5057da54e4 = <b>Raporty, animacja i eksporty</b>: każda wartość z jednostką i etykietą; animowany rysunek przebiegu; pliki SP3 (Standard Product { "3" }), komunikaty orbitalne CCSDS (Consultative Committee for Space Data Systems), CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit) i SigMF (Signal Metadata Format).

seg-6b43a8c3031e = Jeden otwarty silnik pośrodku, kshana { $version }, z typowanym rozdzielaniem wywołań dla { "75" } rodzajów; wokół niego wiersz poleceń, biblioteka Rust, Python, WebAssembly i Kshana Studio, serwer MCP, obraz Docker i wtyczka JetBrains; pod nim Kshana Pro, zastrzeżona nakładka, która zależy od otwartego silnika i nigdy go nie rozwidla

seg-ea6f46d62e7b = Ten sam plik scenariusza daje te same bajty na każdej powierzchni. MCP to Model Context Protocol: <a1><c1/></a1> pozwala asystentowi AI (sztucznej inteligencji) uruchamiać silnik.

seg-f51b0a8cd30e = Sześć prac na arXiv opiera się na otwartym silniku, każda z poleceniem, które za nią stoi: <a1>arXiv:{ "2606.22054" }</a1> (luka optymizmu detektorów zakłóceń), <a2>arXiv:{ "2606.24210" }</a2> (warunkowy poziom ochrony czasu), <a3>arXiv:{ "2607.05415" }</a3> (jak stabilny jest wskaźnik odporności PNT), <a4>arXiv:{ "2607.02566" }</a4> (obserwowalność stanowisk na powierzchni Księżyca w interferometrii o bardzo długiej bazie), <a5>arXiv:{ "2607.06212" }</a5> (geometria okołobiegunowa południowego bieguna Księżyca i latarnie na powierzchni) oraz <a6>arXiv:{ "2610.23871" }</a6> (nawigacja cislunarna jako problem obserwowalności: długość łuku, uwarunkowanie gramianu i dźwignia Dopplera). Zob. <a7>Badania</a7>.

seg-dad7832bf2d2 = Cały silnik jest darmowy na licencji AGPL-3.0. Kshana Pro, zastrzeżona nakładka, która zależy od otwartego silnika i nigdy go nie rozwidla, oraz studia na zamówienie są dostępne na podstawie umowy od Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Nie ma cen; zob. <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Dowiedz się więcej

seg-0e8320f8ea91 = <b>Pełny README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (silnik w przeglądarce, jako WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Możliwości</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Walidacja i pochodzenie</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Macierz weryfikacji</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Cytowanie</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Wolne i otwarte oprogramowanie na licencji <b>GNU AGPL-3.0-only</b> (GNU Affero General Public License, wyłącznie wersja { "3" }). <b>Licencja komercyjna</b> jest dostępna od <a1>Ashforde® OÜ</a1> (estońskiej spółki z ograniczoną odpowiedzialnością; OÜ = osaühing) dla zamkniętej integracji; zob. <a2>LICENSING.md</a2>. Profesjonalnie rozwijane i utrzymywane przez Ashforde® OÜ.

seg-4ae905aec2ab = <s1>Poprzednia</s1>API Pythona

seg-8af548581ae9 = <s1>Następna</s1>Crate Rust
