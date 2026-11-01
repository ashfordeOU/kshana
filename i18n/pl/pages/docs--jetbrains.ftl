# docs--jetbrains: translations (pl)

seg-f8a0fe9968c4 = Źródło: <c1/>

seg-c55e49fd2a72 = { -brand } dla IDE JetBrains

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> w JetBrains Marketplace</a1> lub, w dowolnym IDE JetBrains, <em>Settings → Plugins → Marketplace → search "Kshana"</em>.

seg-959ab829762c = Natywna wtyczka uruchamiająca symulator odporności PNT <b>{ -brand }</b> z wnętrza dowolnego IDE JetBrains (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Kliknij prawym przyciskiem scenariusz <c1/> → <b>Run Kshana Scenario</b>; wskaźniki jakości i wynikowy JSON są strumieniowane do okna narzędzi <b>{ -brand }</b>.

seg-594199d2ce06 = Uzupełnia <a1>serwer MCP</a1> (który daje <em>AI Assistant</em> JetBrains dostęp do { -brand }): ta wtyczka to ścieżka <em>dla człowieka</em>, metodą wskaż i kliknij.

seg-a356f2c30afb = Akcja <b>Run Kshana Scenario</b> na dowolnym <c1/> (menu kontekstowe edytora i widoku projektu): uruchamia <c2/> i pokazuje wynik w oknie narzędzi { -brand }.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> na scenariuszu <c1/> <c2/> (<c3/>): oś czasu zaufania, z wynikiem 0-100 i powodami dla statku. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> na <c1/> <c2/> (<c3/>): syntetyczne NMEA mostka i dziennik instruktora, zapisane obok scenariusza. Tylko tekst; do szkolenia, nigdy do działających systemów nawigacyjnych statku.

seg-99510426a384 = <b>Build Interference Map</b> na ADS-B lub AIS <c1/> (widok projektu; pyta, który to zatwierdzony zbiór danych) oraz <b>Route Exposure</b> na pliku trasy (pyta o folder map). Komórka z pogorszeniem nie wskazuje zakłóceń jako przyczyny; to nie jest prognoza.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> na scenariuszu <c1/> (<c2/>): ruch pojazdu, NMEA i opisane zdarzenia dla laboratoryjnego symulatora GNSS, zapisane obok scenariusza. Nie zapisuje żadnego sygnału; symulator uruchamiaj tylko tam, gdzie jest to dozwolone.

seg-79c553c303c5 = <b>Build Compliance Report</b> na wyniku przebiegu <c1/> (<c2/>) oraz <b>Tools → Show Compliance Mapping</b> (<c3/>): odwzorowanie na publiczne ramy, pokazane ze stwierdzeniem silnika słowo w słowo.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> na folderze pakietu dowodowego (widok projektu; <c1/>): pyta o klucz publiczny podpisującego ({ "64" } cyfr szesnastkowych lub plik <c2/>; zawsze przypięty, wtyczka nigdy nie przyjmuje nieprzypiętego podpisującego) i opcjonalnie o pełny dziennik sesji. Tylko wynik zweryfikowany jest przedstawiany jako zweryfikowany; nienaruszony pakiet z nieprzypiętym podpisującym jest przedstawiany jako „NOT VERIFIED”.

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> na wyniku <c1/> <c2/> (<c3/>): tekst Prometheus, zdarzenia syslog CEF/LEEF lub linie MQTT Home Assistant drukowane w oknie { -brand }. Nic nie jest wysyłane ani udostępniane; działające eksportery pozostają w wierszu poleceń.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> na nieruchomym IMU <c1/> (<c2/>): parametry akcelerometru i żyroskopu scenariuszy <c3/> i <c4/> dopasowane odchyleniem Allana, drukowane w oknie { -brand } jako tabela <c5/>. Nic nie jest zapisywane; dopasowanie ma status MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menu Tools; <c2/>) i <b>Assess Receiver Stream</b> (sesja statku <c3/> plus wybrany zapisany log NMEA; <c4/>, oceniane jednorazowo, bez gniazda i bez bramki).

seg-38037d36639c = <b>Insert Example Scenario</b> (folder widoku projektu lub menu Tools; <c1/>): wybierz dołączony scenariusz, a zostanie zapisany jako nowy <c2/> (nigdy nad istniejącym plikiem). <b>Export Scenario</b> na <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; tylko wynik symulowany), <b>Animate Scenario</b> (HTML lub SVG, otwierane w przeglądarce) i <b>Import Route</b> na trasie <c4/> (pyta, który scenariusz).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> na sesji zaufania do odbiornika <c1/> (<c2/>): pyta o okno, plik klucza podpisu, który już masz, i folder wyjściowy. Wtyczka nigdy nie tworzy, nie czyta ani nie przechowuje klucza (<c3/> pozostaje w wierszu poleceń). <b>Attach Timestamp</b> na folderze pakietu (<c4/>): { -brand } nie sprawdza podpisu urzędu znacznika czasu; uruchom <c5/> samodzielnie.

seg-f4f6605d3db9 = Nadal tylko w wierszu poleceń: polecenia IQ, <c1/> i <c2/>.

seg-63efd04104f1 = Dolne okno narzędzi <b>{ -brand }</b> z konsolą przebiegów.

seg-decda07aa7eb = Nie ma ich we wtyczce: <c1/> (długo działający proces strumieniowy z bramką i opcjonalnym nasłuchiwaczem TCP) i <c2/> pozostają w wierszu poleceń, ponieważ akcja IDE uruchamia polecenie do końca i pokazuje jego wynik; zob. <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b>, aby wskazać plik binarny <c1/> (puste: rozwiązywany z <c2/>; instalacja przez <c3/>).

seg-44dfdd65bd0a = Wtyczka jest czysto platformowa (bez zależności od konkretnych języków), więc ładuje się w każdym IDE JetBrains w wersji kompilacji { "243" } ({ "2024.3" }) i nowszej.

seg-453bd42c23fa = Budowanie i uruchamianie

seg-b5328f8c7a8a = Wymaga JDK { "17" }+ (kompilacja przypina JDK { "21" }) oraz dołączonego wrappera Gradle.

seg-758124ceb1c7 = <c1/> domyślnie sprawdza since-build, { "2024.3" }. Aby sprawdzić inne linie, podaj je jako <c2/> (każde IDE to pobranie około { "1" } GB):

seg-15d175aaeb59 = Wtyczka nie używa na żadnym z nich przestarzałego ani przeznaczonego do usunięcia API platformy; tak ma pozostać (okno wyboru przechodzi przez <c1/>, a nie przez <c2/>).

seg-39cfd740d9b3 = Zainstaluj zbudowany plik zip przez <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Układ

seg-73b3f55b7208 = Izolacja

seg-a14db8de576a = Podobnie jak <c1/> i <c2/>, jest to samodzielny projekt Gradle, wyłączony z opublikowanego crate <c3/> (<c4/> w pakiecie <c5/>); jego wynik budowania jest ignorowany przez git.

seg-b38914a430b9 = Licencja: AGPL-3.0-only (lub licencja komercyjna od Ashforde OÜ; zob. <c1/> w repozytorium).

seg-bb286e3ce9c9 = <s1>Poprzednia</s1>Gdzie dostępna jest każda możliwość

seg-e62586b5f58c = <s1>Następna</s1>Gdzie działa { -brand }
