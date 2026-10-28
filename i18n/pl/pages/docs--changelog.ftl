# docs--changelog: translations (pl)

seg-2247a2344710 = Znaczenie

seg-9a2a5f0a8a02 = Układ Słoneczny

seg-20db2c79b998 = Sprawdzone względem niezależnego wzorca

seg-a20b4a6e8f53 = zegar atomowy w skali chipa

seg-49a994d77d2f = kwarcowy oscylator z kompensacją temperaturową

seg-5770537524d3 = Obszar

seg-40d4fc0d3922 = Źródło: <c1/>

seg-7333b85d448f = Wszystkie istotne zmiany w Kshana są udokumentowane tutaj.

seg-bbc8f38627f1 = Format opiera się na <a1>Keep a Changelog</a1>, a ten projekt stosuje <a2>Semantic Versioning</a2>. Dopóki projekt jest przed wersją 1.0, publiczny schemat scenariuszy i wyników może się jeszcze zmieniać; zmiany niezgodne wstecz są wyraźnie wskazywane.

seg-985f7b4c001a = Niewydane

seg-a2f583aadd0b = Bez nowych funkcji: jedna poprawka wiersza poleceń, aktualizacje zależności w narzędziach walidacji krzyżowej i dokumentacja. Wyniki silnika są bez zmian względem { "0.38.0" }.

seg-c9a8a5898ced = Poprawiono

seg-3cc8ba4d1be6 = Wiersz poleceń kończy się po cichu ze statusem { "141" }, gdy jego standardowe wyjście zostaje zamknięte (<c1/>), zamiast zgłaszać panikę z komunikatem „failed printing to stdout: Broken pipe”. { "141" } to { "128" } plus SIGPIPE, status, który powłoka zgłasza dla <c2/>. Obsługiwany jest tylko zamknięty potok: pełny dysk lub każdy inny błąd zapisu nadal się zgłasza, a żywy strumień zapisujący do zamkniętego gniazda nadal otrzymuje swój błąd zapisu. <c3/> zamyka czytnik przed uruchomieniem programu, więc pierwszy zapis kończy się niepowodzeniem w każdym przebiegu.

seg-2a47e785cc1d = Aktualizacje zależności w narzędziach walidacji krzyżowej (<c1/>); bez zmian w dostarczanych crate, pakietach wheel ani innych pakietach.

seg-9df898fb24be = <c1/> { "0.9.10" } do { "0.9.11" } (RUSTSEC-2026-0186) w plikach lock kontroli krzyżowej ANISE (<c2/>, <c3/>); pliki lock synchronizują też ponownie zależność ścieżkową <c4/> w repozytorium.

seg-835e9d6058f8 = <c1/> { "12.3.0" } do { "13.0.0" } oraz <c2/> { "2026.7.22" } do { "2026.10.19" } w przypięciach środowiska wyroczni (<c3/>, <c4/>): wydania z poprawkami dla ośmiu zaleceń dotyczących pillow i jednego dotyczącego certifi.

seg-902fc421a851 = <c1/>, README i ten plik wymieniają każdy próg kshana-bench, który jest NOT MET, zgodnie z zapisem w <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } wobec co najmniej { "0.80" } na podziale testowym), <b>D1</b> (największa różnica { "0.0301" }) oraz <b>zadanie (b) R1</b> (przeniesione, nie uruchomione ponownie). Żaden próg nie został złagodzony.

seg-44d9c9622c24 = Przegląd kompletności README: spis treści; rodzaje scenariuszy uporządkowane w rodziny, każdy ze stroną w <c1/> (opis i pola silnika, wejścia i wyniki przykładowego przebiegu, wiersze rejestru i wyrocznie, ograniczenia podawane w raporcie przebiegu oraz wykres zapisywany przez silnik), arkusz poglądowy dla każdej rodziny, wszystko indeksowane przez <c2/>; każde polecenie w <c3/>; każda powierzchnia, polecenie wtyczki, umiejętność i strona Studio w <c4/>; każda dziedzina możliwości w <c5/>; osadzone diagramy Mermaid (przegląd systemu, powierzchnie, pętla wewnętrzna, zaufanie do odbiornika, obieg laboratoryjny, Studio, przepływ testów i wydań, mapa modułów, dystrybucja). Zapisywane przez <c6/>, <c7/> i <c8/>; audytowane przez <c9/>; strzeżone przez <c10/>, który przypina też opis i pola każdego wpisu do silnika.

seg-b953186d5726 = <c1/>: renderuje diagram Mermaid do SVG i PNG w systemie Linux i aktualizuje zapis renderowania.

seg-68e19f94faed = README: rysunki dotyczące użytkowników kosmicznych i Księżyca używały ścieżek względnych do <c1/>, więc nie wczytywały się z README; jedno łącze wskazywało na <c2/>.

seg-850e1574e2d6 = Usunięto dwa nieaktualne, ręcznie skopiowane pliki wykresów (<c1/>, <c2/>), których nie używała żadna strona i które nie zgadzały się już z silnikiem; <c3/> zawiera aktualne wykresy.

seg-033d52126d8a = Dodano

seg-090bf5ae96b6 = <b>GNSS poza konstelacją (<c1/>).</b> Nowy rodzaj scenariusza dla statków kosmicznych powyżej, wokół i poza orbitami GNSS (<a1><c2/></a1>): dostępność jednego i czterech sygnałów, czasy trwania przerw, C/N0, DOP oraz łącza listka głównego i listków bocznych dla GPS, GLONASS, Galileo, BDS, QZSS i NavIC na powłoce lub wzdłuż trajektorii LEO, MEO, GEO, HEO i transferu księżycowego; wzorce nadawcze z broszury, parametryczne lub dostarczone przez użytkownika; model jonosfery, plazmosfery i atmosfery z promieniem stycznym; projekt odbiornika słabych sygnałów; pokładowy rozszerzony filtr Kalmana GNSS dla HEO i transferu księżycowego; oraz nawigacja względna formacji. Porównane z broszurą ICG Space Service Volume według wstępnej rejestracji zatwierdzonej przed przebiegiem: stałe minimalnej mocy promieniowanej i próg księżycowy są zgodne, pozostałe progi nie są spełnione przy odczytaniu zarejestrowanym z góry (prawie wszystkie przez niespójny kąt wiązki GLONASS w broszurze), a parametryczny zastępnik listków bocznych nie odtwarza zmierzonych wzorców paneli GPS. Wszystko pozostaje MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Orbita i powierzchnia Księżyca jako infrastruktura nawigacyjna i geodezyjna (<c1/>).</b> Nowy rodzaj scenariusza z pięcioma badaniami wybieranymi przez <c2/> (<a1><c3/></a1>): spójność pokładowego wyznaczania orbity z Ziemi przez GNSS na prawie prostoliniowej orbicie halo względem niezależnego naziemnego wyznaczania odległości i prędkości zmiany odległości; wspólna podwójnie różnicowana faza nośnej stacji powierzchniowej i orbitera z całkowitoliczbowym ustalaniem LAMBDA; informacja Fishera siedmioparametrowego datum księżycowego z odległościami orbiter-powierzchnia i bez nich; różnice międzytechnikowe GNSS, VLBI i pomiaru laserowego względem lokalnego powiązania; oraz czułość na h2, k2, l2 i libracje fizyczne. MODELLED, z wejściami ILLUSTRATIVE: obliczenia sprawdzono względem niezależnych programów numpy i scipy i nic nie porównano z pomiarem wielkości księżycowej. Progi ustalono w <c4/> i dwóch ujawnionych poprawkach. Trzy są NOT MET i każdy jest przypięty testem, który stwierdza chybienie: C3 (wstrzyknięty błąd siły nie jest wykrywany z zarejestrowaną z góry częstością), Q3 (bootstrapowa częstość powodzenia różni się od wyroczni numpy o { "1.7e-6" } przy progu { "1e-9" }, z powodu przybliżenia dystrybuanty normalnej w LAMBDA) oraz połowa dotycząca śladu w G3 (dodanie rodziny odległości nie zawsze obniża ślad pseudoodwrotności). Pozostałe są spełnione (<a2><c5/></a2>).

seg-022859135e79 = <b>Szósta praca w tabeli Badania.</b> „Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever” (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) pokazuje, że rozmycie dokładności jest niezdefiniowane dla śledzenia cislunarnego wyłącznie przez odległość, i zamiast tego używa grammianu obserwowalności na czterech płaskich dalekich orbitach wstecznych: sama odległość daje rząd { "2" } z { "4" } w jednej chwili i wymaga łuku około { "2.09" } h, prędkość zmiany odległości (Doppler) daje rząd { "4" } natychmiast, a współestymacja stacji ze stanami satelitów i zegarami pozostaje o jeden niedoborowa rzędem bez zewnętrznej obserwabli interferometrycznej. Jej liczby są regenerowane przez rodzaj <c1/> (<c2/>); <c3/> testuje próg niezależnym estymatorem. Niosą ją karta badań w README, README crate, npm i PyPI oraz generator.

seg-d74a1b2dcb38 = Neutralny arbiter, uczyniony mierzalnym.

seg-bf568567fe06 = <c1/> odczytuje opublikowany katalog testów i plan transmisji NPRA Jammertest jako zaplanowaną prawdę odniesienia (identyfikatory katalogowe zachowane), a <c2/> ocenia log odbiornika względem niego dla każdego testu (opóźnienie detekcji, niewykryte alarmy, fałszywe alarmy, czas do powrotu do normy), opcjonalnie jako podpisany pakiet dowodowy (<a1><c3/></a1>). Progi oceny zarejestrowano z góry przed jakimkolwiek ocenianym przebiegiem (<c4/>). Na zbiorze danych JammerTest { "2024" } (pobieranym, nigdy nie dołączanym) zarejestrowana z góry reguła minimalnej ilości danych nie została spełniona zarówno w pierwszym przebiegu, jak i w rewizji obsługi danych, więc żaden próg nie podlega ocenie i niczego się nie twierdzi; oba przebiegi są zapisane i przypięte. MODELLED: harmonogram to zapisane w zbiorze danych okna, a nie zarejestrowane czasy emisji. Zbiór NMEA SimulaMet z { "2025" } roku nie jest adaptowany (brak podanej licencji na jego stronie).

seg-0a2bcad8d645 = <b>Własne flagi odbiornika, obok flag Kshana.</b> UBX-NAV-STATUS <c1/> i UBX-SEC-SIG są odczytywane do <c2/> w każdej epoce, a porównanie <c3/> w wyniku zestawia je z monitorami Kshana (oba, tylko odbiornik, tylko Kshana, żaden); nie wywołuje alarmu i nie zmienia żadnej oceny. Czytnik Septentrio SBF (PVTGeodetic, MeasEpoch, RFStatus, wyłącznie do odczytu, na crate <c4/> na licencji MIT) oraz <c5/> (kanał NMEA szeregowy lub USB, wyłącznie do odczytu; nigdy nie zapisuje do odbiornika) dołączają do nich.

seg-90d9927fe3e2 = <b>Synchronizacja czasu i bezpieczeństwo sprzętu</b> (<a1><c1/></a1>, <a2><c2/></a2>). Rodzaj scenariusza <c3/> ocenia test holdover systemu synchronizacji czasu (GNSS usunięty przez operatora, holdover, powrót) na podstawie zmierzonego zapisu błędu czasu, mierzony względem masek ITU-T z tabel publicznych. <c4/> odczytuje logi linuxptp (<c5/>, <c6/>, <c7/>) i chrony (<c8/>, <c9/>). <c10/> zapisuje metadane ION GNSS SDR, a <c11/> monitoruje nagranie SigMF w trakcie jego powiększania się (tylko odbiór). <c12/> zyskuje Foundational PNT Profile NIST IR 8323r1 ({ "15" } sparafrazowanych wierszy, dostarcza dowodów na (supports evidence for)). Pakiet dowodowy może zapisać <c13/> operatora w swoim podpisanym manifeście, nigdy nie weryfikowane; etapy sprzętowe od { "0" } do { "4" } i uwagi prawne są w <c14/> (oczekują na przegląd prawny). Nie ma żadnej ścieżki nadawczej.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): stałe zadania, podziały i metryki dla detekcji zakłóceń GNSS w logach odbiornika (JammerTest { "2024" }) i IQ, predykcji holdover synchronizacji czasu (zegary IGS) oraz luki optymizmu poza rozkładem; manifesty podziałów z przypiętymi skrótami i skrypty pobierania (bez dołączania danych), zapieczętowany holdout przez commit i ujawnienie, schemat pliku wyników i statyczna strona rankingu. Punkty odniesienia według progów zarejestrowanych z góry w <c4/>: progi oceniającego spełnione, C1 do C3 spełnione, D2 spełnione; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } wobec co najmniej { "0.80" } na podziale testowym), <b>D1 NOT MET</b> (największa różnica { "0.0301" }) i <b>zadanie (b) R1 NOT MET</b> (przeniesione, nie uruchomione ponownie), każdy przypięty (<c6/>). Każda ocena jest MODELLED. Python <c7/>, <c8/>; WebAssembly tak samo; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Obserwatorium zakłóceń</b> (<c1/>, <c2/>, <a1><c3/></a1>): odtwarzalne dzienne GeoJSON, PNG i JSON raportu incydentów z trzema stanami (pogorszone, niepogorszone, nieobserwowane), minimalnym opóźnieniem { "24" } h, komórkami o rozmiarze { "0.5" } stopnia lub grubszymi, bez przypisywania przyczyny i z odrzucaniem danych OpenSky; badanie czułości parametrów zarejestrowanych z góry; 30-dniowy bałtycki katalog wsteczny z adsb.lol.

seg-497ae18bfb03 = <b>Wejścia maszynowe i czujnikowe dla <c1/></b> (<a1><c2/></a1>). Nowe wartości <c3/>, wszystkie wyłącznie do odczytu, MODELLED, z samodzielnie napisanymi fixtures i bez dołączania danych: <c4/> (pliki rozwiązań RTKLIB <c5/>), <c6/> (OEM7 ASCII i binarne <c7/>, <c8/> C/No i <c9/>; flaga zagłuszacza odbiornika staje się <c10/> epoki, zestawianym z alarmami Kshana przez porównanie <c11/>), <c12/> (C/N0 MSM4 i MSM7 dla GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou i NavIC; układy z tabel pyrtcm na licencji BSD, których zawiadomienie jest w <c13/>, a nie z normy RTCM) oraz <c14/> (komunikaty GNSS-SDR Monitor i monitora PVT jako linie JSON, przekazywane przez <c15/>).

seg-22e8b434782f = Logi IMU jako drugi czujnik.

seg-5491196d6421 = <c1/> (<c2/> lub <c3/>) całkuje prędkość kątową odchylenia z żyroskopu do kursu, który odczytuje monitor <c4/>; wbudowane na każdej powierzchni i przenoszone przez pakiety dowodowe. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, wtyczka <c9/>, akcja JetBrains) dopasowuje parametry akcelerometru i żyroskopu scenariuszy <c10/> i <c11/> na podstawie logu w spoczynku metodą odchylenia Allana i drukuje tabelę <c12/> z SHA-256 logu w jej pochodzeniu.

seg-f48fdf6252cd = <b>Integracje:</b> pakiet ROS { "2" } (<c1/>: NavSatFix i <c2/> na wejściu, tematy zaufania na wyjściu; jego most niezależny od ROS jest testowany z prawdziwym silnikiem, sam węzeł nie był uruchamiany na działającym grafie ROS), most <c3/> (<c4/>, zależność MIT, opcjonalna) oraz przekaźnik GNSS-SDR.

seg-1a8727ad42bb = <b>Eksporter MQTT Home Assistant</b> dla telemetrii zaufania: <c1/> i <c2/> (komunikaty wykrywania i dokument stanu JSON; tylko publikacja, bez poświadczeń i TLS) oraz <c3/> jako tekst w Pythonie, WebAssembly i MCP.

seg-f1cb2c2881c9 = Siedem wierszy rejestru MODELLED dla powyższego. Nic tu nie jest VALIDATED: nie odczytano żadnego zapisu z prawdziwego odbiornika, stacji bazowej, IMU, przebiegu GNSS-SDR, grafu ROS ani brokera MQTT.

seg-12c7a28c80b5 = <b>Margines łącza optycznego w czasie.</b> Rodzaj <c1/> przyjmuje opcjonalną tabelę <c2/> (<c3/>, <c4/>, <c5/>), a następnie zapisuje też, dla każdej lokalizacji, jedną zasianą realizację podanego modelu lokalizacji w czasie: epizody zachmurzenia, kolumnę wody ciekłej dla każdego epizodu, jedną próbkę scyntylacji gamma-gamma na krok, a z nich margines łącza, zaniki chmurowe i scyntylacyjne oraz flagę działania łącza, z zrealizowaną dostępnością, udziałem zachmurzenia, liczbą przerw i najdłuższą przerwą. MODELLED (jedno losowanie z modelu, a nie klimat; brak zewnętrznej wyroczni). Bez tej tabeli wynik jest dokumentem { "0.37" }. Dwa dołączone scenariusze optyczne zawierają tę tabelę ({ "336" } h, { "600" } s, ziarno { "37" }). Progi zarejestrowane z góry w <c6/> przed pierwszym przebiegiem.

seg-78524dbb3bd2 = Specyfikacja warunków testu i obieg laboratoryjny round-trip.

seg-fbf034925641 = <c1/> jest publikowane jako <a1><c2/></a1> ze schematem JSON i zyskuje <c3/>. <c4/> zapisuje także <c5/>. <c6/> buduje podpisany pakiet łączący skrót scenariusza, skrót podanych warunków, skrót logu odbiornika i ocenę względem podanych zdarzeń oraz odmawia przyjęcia warunków niezgodnych ze zdarzeniami oceny. Przykład opracowany z gps-sdr-sim zapisującym wyłącznie plik; odtwarzanie jest odpowiedzialnością operatora i nigdy nie jest automatyzowane. Python <c7/>, MCP <c8/>, wtyczka <c9/>.

seg-8bda4472d561 = <b>Pakiety norm</b> (<c1/>, <c2/>): profile testów ram DHS Resilient PNT dla poziomów od { "1" } do { "4" }, poziomy dokładności i ocena integralności IMO MSC.1/Circ.1575 oraz ICAO Doc { "9849" } Appendix F monitorowanie, ocena i łagodzenie, każdy będący zestawem scenariuszy ocenianych względem progów ustalonych przed przebiegiem, z wierszami compliance-report, na które dostarczają dowodów (supports evidence for). Chybienia są zapisane i przypięte: DHS L4-T1 i cztery testy dokładności IMO. Samego Doc { "9849" } nie czytano (płatny); pakiet ICAO opiera się na własnej prezentacji ICAO dotyczącej planu łagodzenia RFI. <c3/> zyskuje sekcję standards-pack. Wszystko MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): kody Golda AFS-I i Weila AFS-Q dla PRN od { "1" } do { "210" }, sygnały <c2/> i <c3/> w <c4/>, kod SB1 BCH, CRC-24Q i przeplatacz oraz <c5/> (<c6/>, <c7/>, <c8/>), przypięte do LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } stycznia { "2025" }). Kody VALIDATED względem drukowanych tabel dokumentu (które oznacza jako TBC); jedna drukowana kolumna kodu trzeciorzędowego (PRN { "147" }) jest prawdopodobnie błędem druku, a chybienie jest przypięte. Kodowanie LDPC podramek od { "2" } do { "4" } nie jest zaimplementowane.

seg-5a5720500b6d = <b>Notebooki kursu</b> (<c1/>): jamming, spoofing, holdover, integralność, OSNMA i mapa zakłóceń, każdy z ćwiczeniami.

seg-3d543433051c = <b>Badanie maksymalnego URA w Kamieniu Milowym { "3" } ARAIM grupy EU-US WG-C</b> (<c1/>, <c2/>), zastępujące wycofany plan „Table A-3”; MODELLED przy podanych odstępstwach.

seg-4f1f786e2658 = <b>Szkice do zatwierdzenia przez właściciela</b> w <c1/>: artykuł JOSS, poprawka do karty TSC, proces rejestru wyroczni i propozycja podziału <c2/>. Nic z tego nie zostało przyjęte.

seg-49a758039871 = <b>Widoki Studio dla funkcji { "0.38" }</b> (kshana.dev/studio/). Odtwarzanie mostu (dwa przebiegi syntetyczne na jednym zegarze: tor, wskaźnik zaufania, satelity słyszane przez log i werdykt, z własnymi flagami odbiornika obok alarmów Kshana); Optical PNT (dwa scenariusze <c1/>, z opcjonalną zasianą realizacją <c2/>, MODELLED); test holdover (wynik <c3/> mierzony względem masek ITU-T, narysowany z własnego <c4/> wyniku); przeglądarka obserwatorium zakłóceń, która otwiera pliki wytworzone przez użytkownika i żadnych nie dostarcza; na stronie Narzędzia ocena Jammertest, dopasowanie IMU i MQTT jako format telemetrii; oraz w Zaufaniu wybór formatu logu (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) z opcjonalnym plikiem IMU. Każdy widok odczytuje pliki w przeglądarce i niczego nie wysyła; każda wartość zachowuje etykietę, którą ma dla niej rejestr, a każdy niesie oświadczenie doradcze. Strona witryny <c6/> pokazuje fragment <c7/>.

seg-91f6beb29f8e = <b>Zgłoszenie #36: warstwy przypięć co do bajtu.</b> Warstwy przypięć co do bajtu działają tylko na hoście zadeklarowanym jako punkt odniesienia (<c1/>, ustawiane przez <c2/>), a nie na każdym Macu z Apple silicon, ponieważ biblioteka matematyczna Apple różni się między wydaniami macOS; warstwa przenośna działa wszędzie, a <c3/> powstrzymuje ponowne bramkowanie warstwy co do bajtu wyłącznie według platformy. Same porównania z wyrocznią przechodzą na macOS. Nie pobrano ponownie żadnego literału i nie zmieniono żadnej tolerancji. <c4/> i <a1><c5/></a1> mówią, jak zbadać różnicę; <c6/> jest ręczną i cotygodniową diagnostyką, a nie bramką.

seg-15070f7dcc0a = <b>CodeQL: niezakotwiczony wzorzec w pomocniku trust-open Studio</b> dopasowuje teraz cały nagłówek (<c1/>).

seg-56856063519f = <b>CI: dysk runnera.</b> Zadanie <c1/> buduje profile dev i test bez informacji debugowania, więc linkowanie nie zapełnia już dysku.

seg-38c59868835e = <b>Strażnicy źródeł.</b> Każdy plik źródłowy zawierający fixtures testowe z przypięciami deklaruje zakres swoich przypięć, a testy zapisujące pliki tymczasowe używają unikalnej ścieżki przy każdym wywołaniu, więc przebiegi równoległe nie mogą kolidować.

seg-884f693585fa = <b><c1/></b> jest regenerowany dla opcjonalnego pola optical-atmosphere <c2/>.

seg-e16d328f3967 = <b>Wtyczka JetBrains: brak użycia przestarzałego lub przeznaczonego do usunięcia API platformy.</b> IntelliJ Plugin Verifier (<c1/>) względem IntelliJ IDEA w wersji { "263" } ({ "2026.3" }: { "263.6800.24" } i { "263.7031.23" }) znalazł jedno przestarzałe wywołanie, <c2/>, w Insert Example; teraz otwiera ono nowy plik przez <c3/>. Wtyczka jest zgodna z { "2024.3" } (since-build, bez zmian) i obydwoma buildami { "263" } i jest na nich czysta. CI uruchamia teraz <c4/> i kończy się niepowodzeniem przy problemach ze zgodnością oraz przy każdym użyciu API przeznaczonego do usunięcia.

seg-07ce053c906a = <b>Optical PNT przez atmosferę</b> (rodzaj scenariusza <c1/>, <a1><c2/></a1>, notatka projektowa <c3/>). Dla łącza optycznego i zbioru stacji naziemnych podaje zależną od długości fali i elewacji stratę w czystym powietrzu, stan turbulencji Hufnagela-Valleya (wariancja Rytova, wskaźnik scyntylacji, zaniki gamma-gamma, uśrednianie apertury), dostępność względem marginesu łącza z podanego klimatu zachmurzenia, margines potrzebny dla docelowych dostępności i pułap, którego żaden margines nie podnosi, rozkład czasów trwania przerw, błąd czasu i odległości na przerwę przez model holdover zegara, różnorodność stacji skorelowaną odległością oraz zyski what-if dla zmiany długości fali, większej apertury, redukcji scyntylacji przez optykę adaptacyjną i dodatkowego marginesu. <c4/> zyskuje budżet uwzględniający atmosferę; bez niego jego wyjście jest identyczne bit w bit z { "0.36" } (próg A5). Dwa dołączone scenariusze niosą klimaty zachmurzenia ILLUSTRATIVE. MODELLED: trzy wiersze rejestru. Obliczenia spełniają progi A1 do A6 zarejestrowane z góry w <c5/> względem niezależnego programu mpmath; to sprawdza implementację podanych wzorów, a nie atmosferę, i nie porównano żadnego zmierzonego zapisu dostępności, więc żaden wiersz nie jest VALIDATED. Próg A4 został najpierw chybiony o { "3e-9" }, ponieważ używana dystrybuanta normalna była przybliżeniem { "1.5e-7" }; dystrybuantę wymieniono, a próg pozostawiono jak zarejestrowany. Buildy natywny i WebAssembly zwracają dokumenty identyczne bajt w bajt dla obu dołączonych scenariuszy (A7, uruchomione na commicie integracyjnym { "0.37.0" }).

seg-eb589aff44ad = <b>ROC detekcji monitorów IQ</b> (PRO-32, <a1><c1/></a1>). Kampania z monitorami zachowuje maksimum każdej statystyki testowej w oknach podanych zdarzeń (dodatnie) i w kafelkowanych oknach poza zdarzeniami (ujemne, <c2/>). Raport łączy je dla każdego rodzaju alarmu w ROC z jego AUC i punktem pracy przy skonfigurowanym progu, jako <c3/> i sekcja raportu. Na kampaniach syntetycznych kontrola poziomu przypadkowego jest spełniona. Próg AUC dla C/N0 ({ "0.95" }) nie jest spełniony ({ "0.79" }), ponieważ okna ujemne tuż po zdarzeniu dziedziczą po detekcji zanikanie CUSUM; jest to zapisane. MODELLED.

seg-d25a34e23f1a = <b>Monitory IQ w kampanii lab-replay</b> (PRO-31, <a1><c1/></a1>). Opcjonalna tabela <c2/> w pliku kampanii uruchamia monitory IQ w pojedynczym przejściu runnera: mocy i widmowy po każdym łańcuchu front-endu oraz C/N0, SQM i blokady dla każdego śledzonego kanału. Ich alarmy są oceniane względem podanych zdarzeń: wykryto lub niewykryto, czas do detekcji i fałszywe alarmy na godzinę ekspozycji. Dla każdego testu podano wzór zamknięty na fałszywy alarm, w tym nową dwustronną wartość gaussowską dla testów SQM (<c3/>). Bez tabeli nic się nie zmienia. Na kampaniach syntetycznych progi fałszywych alarmów dla mocy i SQM oraz próg fałszywych alarmów dla C/N0 są spełnione; wykryto { "18" } z { "18" } tłumień, ale ograniczenie czasu do detekcji, z konstrukcji poniżej jednej próbki detektora, nie jest spełnione i jest zapisane. MODELLED; wiersz rejestru „Monitory IQ oceniane w kampaniach lab-replay”.

seg-8eb0f650065e = <b>Dopasowanie laboratoryjne z kampanii IQ, kontynuacja</b> (<c1/>, zadanie CI <c2/>). Testuje dwie hipotezy, które §{ "13.6" } z <c3/> zostawił otwarte, względem progów zarejestrowanych z góry w 1e532f84. Dodaje dwie kampanie syntetyczne: S, ze schodkowym J/S (ziarno 2026_1014), oraz R, nową rampę (ziarno 2026_1015). Wyniki są w <c4/>.

seg-ce60405d0005 = S1 spełnione: przy utrzymanym każdym poziomie J/S <c1/> jest odtwarzane w granicach +{ "0.185" } dB. Błąd −{ "1.1" } dB w kampaniach z rampą to opóźnienie estymatora.

seg-ea9f206c2999 = S2 niespełnione, przypięte testem stwierdzającym chybienie: (d) w brzmieniu zapisanym, na kampanii schodkowej, zachodzi dla modelu pętli śledzenia ({ "0.45" } dB), ale nie dla modelu empirycznego ({ "6.42" } dB).

seg-fab0653558e4 = R1 spełnione: na nowej kampanii z rampą (d) z dopasowanymi czasami przebywania spadku razy szybkość rampy każdego zdarzenia mieści się w granicach { "1" } dB dla obu modeli.

seg-24c6725c2c7d = Chybienia (a′) i (d) powtarzają się w R.

seg-7cbbce356973 = Kampania może teraz podawać swoje J/S jako profil <c1/> w zestawie testowym.

seg-34007ba58a9f = Żaden werdykt z §{ "13" } się nie zmienia, a wiersz rejestru pozostaje MODELLED.

seg-df2c3f2532d6 = <b>Ograniczone wciąganie FLL, opcjonalne</b> (DS-LOOP-05): nowy klucz projektu pętli <c1/> (s), w Rust <c2/>. Przy <c3/> wymusza przejście z FLL na PLL po tym czasie, niezależnie od PLI. Domyślnie nieustawione, a wtedy poza skrótem projektu; projekt domyślny i jego skrót są bez zmian.

seg-ae2794b2d3d5 = Sprawdzone względem progów zarejestrowanych z góry w 58789af0, na wprowadzonej prawdzie odniesienia. Kontrola jest spełniona: ustawienie domyślne nigdy nie przekazuje sterowania w { "9" } z { "10" } ziaren przy { "33" } dB-Hz.

seg-6d9483874b35 = Niespełnione: przy ograniczeniu { "1.0" } s { "16" } z { "20" } przebiegów utrzymuje blokadę przy { "33" } dB-Hz, a { "8" } z { "20" } przy { "31" } dB-Hz; pozostałe krążą między wymuszonymi przekazaniami a powrotem FLL. Jitter fazy jest { "1.8" }× większy niż samego PLL przy { "33" } dB-Hz.

seg-deeefaf50e3e = Próg wciągania ~{ "35" } dB-Hz pozostaje udokumentowanym ograniczeniem ustawienia domyślnego.

seg-780de73c01e1 = MODELLED; wiersz rejestru „Ograniczone wciąganie FLL poniżej progu przejścia z FLL na PLL w projekcie domyślnym (opcjonalne)”.

seg-ace6b53749bd = <b>Histereza akwizycji i kwantyzator front-endu w rodzaju jamming</b> (CAP-06c): dwie opcjonalne sekcje dla scenariusza <c1/>.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, na progu śledzenia lub powyżej) i <c3/> (s, domyślnie { "0" }). Satelita jest akwizycjonowany na progu akwizycji lub powyżej, gdy był nieakwizycjonowany przez czas opóźnienia. Jest utrzymywany, dopóki jest na progu śledzenia lub powyżej. Wyjścia: <c4/> (true/false), <c5/> (liczba) i <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> (od { "1" } do { "16" }) i <c3/> (MHz, domyślnie dwukrotność szybkości chipów). Wyprowadza blok <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, odejmowane od efektywnego C/N0 każdego łącza) i <c8/>. Strata dotyczy wejścia gaussowskiego i jest oznaczona jako nieważna dla zagłuszaczy CW, wąskopasmowych i przemiatanych.

seg-0dad81736863 = Bez tych sekcji każde wyjście jest identyczne bajt w bajt.

seg-92007bfb6680 = Sprawdzone względem progów zarejestrowanych z góry w 70c72fcc. Strata kwantyzatora mieści się w granicach { "0.0007" } dB od niezależnego Monte Carlo, a odczyt AGC w granicach { "0.012" } dB od pętli AGC warstwy IQ.

seg-973e451df99d = Zarejestrowane przebiegi histerezy były nieinformatywne (każde łącze utracone), więc ten próg jest NOT MET. Dodatkowy zestaw przebiegów zarejestrowany przy { "37793290" } go spełnia: każda flaga równa się niezależnemu przeliczeniu, a { "732" } z { "1824" } łączy wykazuje histerezę.

seg-912e9f1a4d5b = Ustalenie: przy zagłuszaczu CW 1-bitowy ADC traci około { "5" } dB więcej niż wartość gaussowska.

seg-a19aee81b581 = MODELLED; wiersz rejestru „Histereza akwizycji i kwantyzator front-endu w rodzaju jamming względem niezależnych przeliczeń”.

seg-97f43a4fe71d = <b>Zacienianie terenu zagłuszacza w rodzaju jamming</b> (CAP-06b): opcjonalna sekcja <c1/> w scenariuszu <c2/> z zagłuszaczem. Pola:

seg-6d59a2857ab9 = <c1/>: kafelek SRTM <c2/>, względem katalogu roboczego;

seg-fa5b15500405 = <c1/>, <c2/> i <c3/> (deg): rozmiar i narożnik kafelka;

seg-09a35655f010 = <c1/> (m, domyślnie { "0" }), <c2/> (domyślnie 4/3) i <c3/> (m, domyślnie { "30" }).

seg-ad58fe7ff627 = Silnik próbkuje profil terenu po ortodromie między zagłuszaczem a odbiornikiem i znajduje dominującą krawędź nożową. Moc odbierana zagłuszacza, a więc każde J/S, jest obniżona o stratę pojedynczej krawędzi nożowej według ITU-R P.526-15 §{ "4.1" }.

seg-001d7b88b26d = Wynik zyskuje blok <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) i <c7/> (liczba).

seg-b9696f5eda4b = Bez tej sekcji każde wyjście jest identyczne bajt w bajt.

seg-593b6a5b4480 = Sprawdzone względem progów i dziesięciu rozmieszczeń zarejestrowanych z góry w 92cd2bfd, na zatwierdzonym prawdziwym kafelku SRTM Doliny Śmierci, względem niezależnego przeliczenia w numpy. Wszystko spełnione: najgorsza różnica { "1.6e-10" } dla <c1/> i dla straty (próg { "1e-9" }), strata monotoniczna względem wysokości zagłuszacza, a strata obniżająca J/S dokładnie o siebie.

seg-62e07defd715 = MODELLED; wiersz rejestru „Zacienianie terenu zagłuszacza w rodzaju jamming względem niezależnego przeliczenia w numpy na prawdziwym kafelku SRTM”.

seg-378e9052e2c4 = <b>Wzmocnienia anten CRPA w rodzaju jamming</b> (CAP-06a): opcjonalna sekcja <c1/> w scenariuszu <c2/>. Pola: <c3/> (położenia elementów w lokalnym układzie wschód-północ-góra, m), <c4/> (<c5/> lub <c6/>) oraz <c7/> (pasmo szumu MVDR, MHz, domyślnie dwukrotność szybkości chipów).

seg-ca39fefc0fb3 = Każdy kanał tworzy wiązkę bez zniekształceń w stronę swojego satelity. Szum łącza jest skalowany przez <c1/>, a zagłuszacz przez <c2/> przed istniejącym równaniem C/N0 odpornego na zagłuszanie.

seg-1f1ddc11ad94 = Każde łącze zyskuje blok <c1/>: <c2/> (dB) i <c3/> (dB).

seg-790ecc6a1bd4 = Nieprawidłowa sekcja (pusta lista elementów, nieznane ważenie, niedodatnie pasmo) jest błędem, zarówno przez <c1/> i <c2/>, jak i przez <c3/>.

seg-2464d9dde85f = Sprawdzone względem progów zarejestrowanych z góry w 08d83b4d. Spełnione: addytywność (po poprawce: pierwszy build dodał nowe jednostki do tabeli jednostek każdego przebiegu jamming); jeden element to brak macierzy; wzmocnienie szumu i efektywne C/N0 względem niezależnego przeliczenia w numpy w granicach { "1e-9" } dB; MVDR dąży do zera przy wysokim JNR.

seg-c04495f7a65a = Niespełnione: wzmocnienie zagłuszacza MVDR na { "194" } z { "456" } łączy na { "0.36" } przenośnej matematyce ({ "202" } na matematyce hosta; <c1/>) (najgorzej { "1.7e-6" } dB). Reszty od −{ "100" } do −{ "188" } dB są poniżej rozdzielczości float64 przy tym progu, a numpy nie zgadza się sam ze sobą w tym samym rzędzie wielkości.

seg-c10e1c72eb15 = MODELLED; wiersz rejestru „Wzmocnienia anten CRPA w rodzaju jamming względem niezależnego przeliczenia w numpy”.

seg-0a3adfa7271c = <b>Silnik śledzenia IQ względem GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> i GNSS-SDR śledzą te same niezależne nagrania numpy GPS L1 C/A przy { "30" } do { "45" } dB-Hz.

seg-cc73857e38e8 = Progi zarejestrowane z góry w 48edd4a5. Zarejestrowana kalibracja nie powiodła się z powodu błędnego przekazania w GNSS-SDR (F3), więc Poprawka { "1" } (1e4288c4) dodaje do obu odbiorników FLL tylko do wciągania, zatwierdzony przed jakimkolwiek nagraniem testowym.

seg-1d651ff134f9 = Spełnione: jitter nośnej i kodu oraz Doppler zgadzają się w granicach { "5" } % przy każdym C/N0.

seg-bc9c9a0247d1 = Niespełnione: C/N0 NWPR silnika odczytuje się o { "2.3" }–{ "7.1" } dB poniżej SNV GNSS-SDR (F4, znana granica estymatora; M2M4 jest w granicach { "0.06" } dB od prawdy odniesienia); wskaźniki blokady różnią się z definicji (F5); jedna niezgodność co do zgubienia cyklu przy { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; wiersz rejestru „Silnik śledzenia IQ względem GNSS-SDR { "0.0.19" } na niezależnych nagraniach”.

seg-6ba057fab559 = <b>Dwa wiersze VALIDATED dla kodów warstwy IQ</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Wszystkie { "63" } kody podstawowe B1I zgadzają się z niezależnym generatorem GNSS-SDR { "v0.0.19" } chip po chipie (próg zarejestrowany z góry w 911106d1). Zatwierdzone jest tylko wyjście tego programu: kody PRN B1I, które definiuje publiczny ICD, jako prefiks i skrót.

seg-37437a09dd67 = <b>GPS L1C.</b> Wszystkie { "126" } kodów L1CP/L1CD i { "63" } nakładek L1CO zgadza się z kolumnami kontrolnymi, które drukuje IS-GPS-800J, a obliczony ciąg Legendre'a zgadza się z jego Tabelą 6.2-1 (progi zarejestrowane z góry w fe372e26).

seg-f445784a7f2d = Wiersze: „Podstawowe kody dalmiercze BeiDou B1I względem niezależnego generatora” i „Kody dalmiercze i nakładkowe GPS L1C względem drukowanych kolumn kontrolnych IS-GPS-800J”.

seg-001f48d86a3c = <b>Pasma GLONASS, BeiDou i Galileo E6 w modelu widma</b> (CAP-12, sygnały): nowe nazwy pasm <c1/> i <c2/> (dowolny kanał FDMA jako <c3/>, K = −{ "7" } do { "6" }), <c4/>, <c5/>, <c6/>, <c7/> i <c8/>. Każde niesie swoją nośną, modulację i minimalną moc odbieraną z ICD. Są opcjonalne według nazwy: domyślny zestaw pasm i każde istniejące wyjście są bez zmian.

seg-158a6ec19d6b = Sprawdzone względem progów zarejestrowanych z góry w 5806f28b: wartości ICD, zera widma, złożona B1C i ścieżka C/N0 są spełnione.

seg-805092ae8ca2 = Dwa progi nie zostały spełnione. Próg jednostkowego pola był nieosiągalny w brzmieniu, w jakim go zapisano (F1). Przebiegi B1I i B1C warstwy IQ zgadzają się z modelem tylko po uśrednieniu po paśmie, z powodu nierównomiernych widm liniowych ich kodów (F2).

seg-db88f07d97bb = MODELLED; wiersz rejestru „Model widma: pasma GLONASS, BeiDou i Galileo E6 (opcjonalne)”.

seg-b0147cf3acc8 = <b>Opcja CFAR z uśrednianiem komórek w akwizycji IQ</b> (PRO-37): <c1/> i <c2/> rozstrzygają na siatce akwizycji, porównując każdą komórkę ze średnią komórek odniesienia w jej wierszu Dopplera. Próg wynika ze wzoru zamkniętego na prawdopodobieństwo fałszywego alarmu CA-CFAR dla <c3/> blokowań niekoherentnych (<c4/>, <c5/>), więc decyzja nie zależy od normalizacji mocy próbki. Jest opcjonalna; detektor domyślny i każde istniejące wyjście są bez zmian.

seg-a56e74b1e091 = Sprawdzone względem progów zarejestrowanych z góry w 3724aefa: wzór zamknięty względem Monte Carlo ({ "18" } z { "18" } przypadków) oraz projektowana częstość { "1" } % zmierzona jako { "0.97" }–{ "1.01" } % na szumie gaussowskim i skwantowanym do 2 bitów.

seg-f88fe97e0ee6 = Jeden próg nie został spełniony: na pozbawionym szumu sygnale 2-bitowym { "1.28" } % komórek poza szczytem przekracza próg detekcji, w listkach bocznych korelacji kodu (ustalenie F1).

seg-8d88b626c31e = MODELLED; wiersz rejestru „Opcja CFAR z uśrednianiem komórek w akwizycji IQ”.

seg-d596329195cf = <b>Model scyntylacji względem danych zmierzonych</b> (PRO-34): model scyntylacji Cornell kanału IQ porównano ze zmierzoną intensywnością i fazą GPS L1 { "50" } Hz z równikowej nocy scyntylacji (rekord Zenodo { "16941224" }, INGV, Malindi, CC BY { "4.0" }), według progów zarejestrowanych z góry w b6ccb499. Spełnione: rozkład intensywności i scyntylacja fazy powiązana z S4. Niespełnione: model zanika { "2.4" } razy częściej poniżej −{ "10" } dB i { "3.5" } razy dłużej (ustalenie F1). Zarejestrowane przetwarzanie odczytuje zawiniętą fazę modelu (ustalenie F2); wynik dla fazy utrzymuje się po jej rozwinięciu. <c1/> pobiera dane. Wiersz pozostaje MODELLED: „Kanał scyntylacji jonosferycznej IQ (model Cornell) względem zmierzonej scyntylacji GPS L1 { "50" } Hz”.

seg-d6740cab2271 = <b>Poprawiony czytnik próbek LuGRE</b> (MR-09): <c1/> odczytuje partię IQ LuGRE z I w górnym półbajcie i poziomami mid-rise <c2/> (<c3/>), co usuwa średnią −½, jaką gołe liczby całkowite w kodzie uzupełnień do dwóch niosą na I i Q. <c4/> daje GNSS-SDR ten sam odczyt. Ogólny czytnik ION i każde istniejące wyjście są bez zmian: { "149" } wyników scenariuszy i badanie są identyczne bajt w bajt przed i po, a przypięte ustalenia LuGRE odczytują się jak zarejestrowane (<c5/>). Żaden wiersz rejestru się nie zmienia.

seg-5adf36c03c14 = <b>Opcjonalne śledzenie BOC({ "1,1" })</b> (CAP-07 (a)): <c1/> przeskalowuje dyskryminatory DLL dla głównego szczytu sinusoidalnego BOC({ "1,1" }) i dodaje monitor bump-jump (korelatory bardzo wczesny i bardzo późny przy ±{ "0.5" } chipa, liczniki w górę/w dół, <c2/>), który odsuwa NCO kodu od bocznego szczytu; <c3/> wymienia skoki. Domyślnie wyłączone, a każde istniejące wyjście jest bez zmian. Sprawdzone względem progów zarejestrowanych z góry w 6b68f6cc na syntetycznym sygnale BeiDou B1C: start na bocznym szczycie, który bez tej opcji pozostaje { "0.55" } chipa od szczytu, jest z nią ściągany na główny szczyt jednym skokiem przy { "0.08" } s, a z głównego szczytu nie zaobserwowano fałszywego skoku. Jeden próg nie został spełniony: siatka testów jednostkowych dla skalowania sięga poza zakres liniowy dyskryminatorów (ustalenie F1 w <c4/>). MODELLED; wiersz rejestru „Śledzenie BOC({ "1,1" }): skalowanie DLL i rozwiązywanie niejednoznaczności bump-jump (opcjonalne)”.

seg-89345aa385f7 = <b>Dopasowanie laboratoryjne z kampanii IQ</b> (B7.1, <a1><c1/></a1>). <c2/> scenariusza labfit dopasowuje folder wyjściowy <c3/> w wierszu poleceń (<c4/>), w Pythonie (<c5/>) i w narzędziu labfit MCP (wyłącznie foldery w jego katalogu roboczym). Dopasowuje jedną jednostkę dla każdego sygnału, projektu pętli, łańcucha front-endu i typu zagłuszacza:

seg-1726361b81c4 = model C/N0 względem podanego J/S, z cenzurowaniem;

seg-e1b8a27b06fd = próg śledzenia, bezpośrednio i we wzorze zamkniętym;

seg-8dce89923619 = modele blokady pętli śledzenia i empiryczny, sprzężone przez model C/N0, z ich czasami przebywania;

seg-108646713c97 = zasiany bootstrap klastrowy po nagraniach, przedziały predykcji { "90" } % oraz zbiory wyłączone metodą pomiń-jedno-nagranie;

seg-ee5deb4d5d4b = zarejestrowana z góry tabela <c1/>, z haszem, z PASS/FAIL dla każdego progu.

seg-4d58263106af = Raport to <c1/> jako JSON, CSV i Markdown, z blokiem jednostek. <b><c2/> nie jest identyfikowalne z danych C/N0</b> bez niezależnego pomiaru mocy. Jest podawane, nigdy nie dopasowywane, a dopasowywanym parametrem jest <c3/> (poprawka projektu 2026-10-12). Nieznany typ zagłuszacza przyjmuje najbardziej szkodliwe podane <c4/> (cw, { "1" }). Na kampaniach syntetycznych z własnych scen Kshana próg pokrycia zbiorów wyłączonych (c) przechodzi. Progi <c5/> (a') i (b') ({ "0" } z { "50" } kampanii pokrytych) oraz próg (d) dla progu śledzenia we wzorze zamkniętym nie są spełnione: zapisano je wraz z ich wartościami. MODELLED; wiersz rejestru „Kalibracja modeli C/N0 i blokady otwartego odbiornika do wyników kampanii IQ, z podanym błędem predykcji”. Ścieżka labfit logów odbiornika i jej wyjścia są bez zmian.

seg-308d19be658d = <b><c1/> na jądrze JPL</b> (CAP-31): <c2/> bierze każde ciało, które SPK zawiera (z de440s: Merkury, Wenus, Ziemię, Księżyc) z jądra, etykieta <c3/>, i dodaje blok <c4/> tylko po ustawieniu. Nowy wiersz, VALIDATED względem SPICE (zarejestrowane z góry f8e946ea; najgorzej { "3.3e-5" } m, { "1.0e-11" } m/s). Raport domyślny jest bez zmian.

seg-fe16c24eae60 = <b>Porkchop na efemerydach DE440</b> (CAP-20b): <c1/> przeszukuje C3 i V∞ przylotu na stanach heliocentrycznych z SPK DE440. Nowy wiersz, VALIDATED względem stanów SPICE

seg-a8632f3c86e9 = pykep { "3.0.1" } (zarejestrowane z góry 2d857fb1; Ziemia–Mars 2026-2028, { "304" } komórek, najgorzej { "2.6e-14" }, ta sama komórka o minimalnym C3).

seg-266cffab38a7 = <b>Makromodel sił niegrawitacyjnych LRO: NOT MET</b> (DS-LRO-10, zarejestrowane z góry e82047e2). <c1/> (opcjonalny przez <c2/>): płaskie płyty z bezpośrednim promieniowaniem słonecznym z cieniem Księżyca, panel śledzący Słońce oraz albedo Księżyca i promieniowanie termiczne w podczerwieni; <c3/> to oznaczone, ogólne przybliżenie LRO z opublikowanych faktów (bez płyt korpusu: tabeli płyt nie udało się uzyskać). Na { "4" }-godzinnym łuku LRO pozostawia RMS reduced-dynamic na poziomie { "6.668" } m, a dynamiczny na { "11.94" } m, z nieprawdopodobnym współczynnikiem promieniowania (około +{ "21" } / −{ "22" }), więc wszystkie trzy progi są chybione. Ustalenie jest przypięte testem i żadne wyjście domyślne się nie zmienia (<c4/>). Opcjonalne księżycowe SRP kuli armatniej używa teraz stożkowego cienia Księżyca zamiast Ziemi (<c5/>).

seg-e4ed6e0e5048 = <b>Lunar OD: opcjonalny pływ stały k2 i selenocentryczna względność</b> (DS-LRO-11), domyślnie wyłączone (<c1/>, <c2/>); przełącznik <c3/> dla walidacji krzyżowej ANISE (DS-LRO-04); fixture łuku LRO o długości { "24" } h i wyłącznie informacyjne dopasowanie długiego łuku (DS-LRO-09). Przebiegi informacyjne są zapisane w <c4/>; żadna opublikowana liczba się nie zmienia.

seg-b065138adba8 = <b>NRHO CR3BP { "9" }:{ "2" } względem CAPSTONE</b> (CAP-29d): nowy wiersz MODELLED mierzący kołową ograniczoną NRHO silnika względem lotnej orbity CAPSTONE (JPL Horizons, marzec { "2023" }; zarejestrowane z góry { "4e868170" }): okres { "1.07" } %, apoluna { "0.05" } %, peryluna { "4.1" } % względem średnich CAPSTONE, w granicach zarejestrowanych progów { "3" } / { "5" } / { "20" } %. Pomiar, a nie walidacja.

seg-954bd2771180 = <b>Stany obracające się CR3BP do ICRF o środku w Księżycu</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> odwzorowują bezwymiarowy obracający się stan Ziemia–Księżyc na chwilową linię Ziemia–Księżyc DE440, wraz z pozapłaszczyznową prędkością układu. Nowy wiersz, VALIDATED względem dwuwektorowego układu SPICE (zarejestrowane z góry 2313eb1b, poprawione przed jakimkolwiek przebiegiem d5ef79b3; { "72" } przypadków, najgorzej { "1.8e-7" } m i { "1.2e-9" } m/s).

seg-14599ab79300 = <b>Człony rodzin CR3BP względem API okresowych orbit trzech ciał JPL: NOT MET</b> (RM-35, zarejestrowane z góry a9074f65). <c1/> (korekcja halo, NRHO i DRO, wskaźnik stabilności monodromii, kontynuacja pseudołukowa) zgadza się z { "54" } z { "58" } członów API według każdego progu (stan, okres i Jacobi w granicach { "1e-10" } wszędzie). Jeden wskaźnik stabilności halo L1 ({ "9.5e-2" }) i trzy zamknięcia małych DRO (od { "1.5e-8" } do { "3.3e-8" } wobec { "1e-8" }) są chybione, więc moduł jest <c2/> i żaden wiersz go nie dotyczy. Wyniki: <c3/>.

seg-0cd0e67a2e28 = <b>Opcjonalna orientacja i środowisko księżycowe DE440</b> (FUT-05, DS-LRO-08; ustawienia domyślne bez zmian): <c1/>, <c2/> / <c3/> (zakotwiczone w epoce, osie główne DE440) oraz <c4/> (wbudowana orientacja PA DE440 oraz geocentryczne Słońce i Księżyc z dostarczonego przez użytkownika SPK DE440). Względem ANISE (zarejestrowane z góry ea537710): orientacja w granicach { "3.5e-7" } rad, a dopasowania LRO w granicach { "1" } mm, ale odnoga efemeryd chybiła swój próg (Słońce { "30.7" } m, Księżyc { "1.1" } m, przesunięcie czasu ~{ "1" } ms po stronie ANISE), więc nie jest to wiersz sprawdzony względem wzorca zewnętrznego. Wyniki: <c5/>.

seg-92cc171c69da = <b>Datum kampanii układu księżycowego, próg NumPy skalowany uwarunkowaniem: NOT MET</b> (zarejestrowane z góry b887eb05; pozostaje MODELLED). Krok { "0" } wyklucza zapasowe użycie pseudoodwrotności jako przyczynę luki { "0.30" } przy szacowanych stacjach; NumPy zgadza się w granicach progu w sześciu z ośmiu scenariuszy, ale stations_estimated go chybia ({ "6.8e-6" } wobec { "5.9e-7" }), a w nowej dacie 2026-12-01 nieobserwowana radiolatarnia na biegunie południowym czyni informację radiolatarni niedoborową rzędem, czego niezmieniona wyrocznia nie potrafi ocenić. Wyniki: <c1/>.

seg-8d2f1e9708ff = <b>Datum układu księżycowego z prawdziwej kampanii obserwacyjnej (analityczny Księżyc) VALIDATED</b> na nowych punktach normalnych EDC z { "2025" } roku (zarejestrowane z góry 31f5283 przed pobraniem jakiegokolwiek): niezmieniona wyrocznia SPICE i NumPy zgadza się co do księgowania, rzędów i zerowego sprzężenia oraz w granicach { "1.11e-3" } dla sigm (próg { "1e-2" }), { "8.95e-4" } dla uwarunkowania i { "1.79e-3" } dla stosunków poprzecznych/wzdłużnych (próg { "2e-2" }). Kontrola biblioteczna samego obliczenia kowariancji; progi nie rozróżniają modeli Księżyca. Wyniki: <c1/>.

seg-058d7d490111 = <b>Orientacja IAU i GM czternastu dodanych ciał Układu Słonecznego</b> wydzielone z wiersza „Stałe fizyczne każdego ciała Układu Słonecznego” do wiersza VALIDATED (zarejestrowane z góry 154bc54): <c1/> zgadza się z SPICE <c2/> na pck00011 w granicach { "1e-9" } rad na { "574" } macierzach w pierwotnych epokach i na { "574" } w { "41" } nowych epokach nigdy wcześniej niporównywanych (najgorzej Fobos { "1.38e-10" } rad), a <c3/> jest równe gm_de440 dla wszystkich czternastu ciał. Reszta pierwotnego wiersza (J2, promień średni, raport) pozostaje MODELLED. Wyniki: <c4/>.

seg-56c445aa8d9e = <b>Lambert wieloobrotowy</b> (<c1/>): każde rozwiązanie z co najwyżej trzema obrotami, obie gałęzie. Nowy wiersz rejestru, VALIDATED względem pykep { "3.0.1" } (zarejestrowane z góry a75de851; { "382" } przypadków, { "1058" } rozwiązań, najgorsza różnica prędkości { "1.6e-13" } wobec { "1e-8" }). Wewnętrzny strażnik lądowania Keplera znalazł jedno ograniczenie <c2/> na łuku o e = { "0.994" }; jest ono zapisane w <c3/>.

seg-b62dc38b09e9 = Ciśnienie promieniowania słonecznego box-wing i ECOM2 (DS-PA-14), opcjonalne.

seg-fd50e846d10e = <c1/>: płaskopłytowy model box-wing z tabelami Galileo FOC/IOV z metadanych satelitów GSC, w nominalnym sterowaniu odchyleniem GNSS, z pochodnymi cząstkowymi współczynnika promieniowania i dla każdego panelu, oraz empiryczny model ECOM2 z jego pochodnymi cząstkowymi. Wybierany przez <c2/> / <c3/> (pola <c4/>, domyślnie <c5/>: ścieżka kuli armatniej i każdy golden są bez zmian); przy zestawie box-wing <c6/> jest jego współczynnikiem promieniowania. Porównane z Orekit { "12.2" } według wstępnej rejestracji (<c7/>): każdy próg spełniony, około { "1e-15" } względnie; VALIDATED jako ewaluacja modelu, predykcja SRP Galileo pozostaje MODELLED.

seg-fd7a7fe09705 = <b>Cień SRP spłaszczonej Ziemi i pociemnienie brzegowe tarczy Słońca (FUT-09, RM-11).</b> Nowy moduł <c1/>: <c2/> (elipsoida zasłaniająca WGS-84), <c3/> (prawo Eddingtona) oraz <c4/>, wybierane przez <c5/> (domyślnie: istniejący sferyczny cień stożkowy, bez zmian); <c6/>. Cień spłaszczonej Ziemi zgadza się ze współczynnikiem oświetlenia Orekit { "12.2" } w granicach { "7.4e-9" } na { "2400" } geometriach (VALIDATED, <c7/>); pociemnienie brzegowe nie ma zewnętrznej wyroczni (MODELLED).

seg-f09d4b831dfe = Termosfera NRLMSISE-00 (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: port <c2/> i <c3/> (przełączniki, tryby dziennego Ap i 3-godzinnej tablicy ap) z wersji C w domenie publicznej oryginalnego Fortranu NRL. Jest identyczny bit w bit z tym portem C i w granicach { "1.9e-6" } względnych od pymsis { "0.13.0" } (Fortran NRL, pojedyncza precyzja) na siatce 720 punktów oraz odtwarza { "17" } opublikowanych przypadków testowych (VALIDATED; <c4/>). To potwierdza port, a nie dokładność modelu względem zmierzonej gęstości.

seg-9e8e9018dbaf = Opcjonalny poziom gęstości oporu NRLMSISE-00.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> i <c4/>. Statyczny model wykładniczy pozostaje domyślny, bit w bit. Pogoda kosmiczna jest stała dla każdego modelu. VALIDATED na poziomie orbity względem własnego oporu NRLMSISE-00 w Orekit { "12.2" } w ciągu { "24" } h (najgorzej { "0.03" } m wobec do { "142" } km przemieszczenia od oporu; <c5/>).

seg-b1b2ac9ac91e = Opcjonalne Słońce i Księżyc z DE440 w propagatorze Cowella (RM-33, FUT-10).

seg-4f323703b251 = <c1/> przyjmuje dowolny <c2/> (np. <c3/> DE440) dla członów trzeciego ciała i SRP; odmawia dostawcy, który nie może obsłużyć epoki, zlicza przejścia awaryjne do szeregu analitycznego i jest domyślnie wyłączone. <c4/> zachowuje dwuczęściową precyzję. Względem Orekit { "12.2" } na jego własnym czytniku DE440 orbity { "24" } h zgadzają się do { "0.017" } m; zarejestrowany z góry próg położenia Słońca/Księżyca został chybiony ({ "6.4" } m / { "0.24" } m; SPICE pokazuje tę samą lukę), więc MODELLED (<c5/>).

seg-6ac7f3f65b33 = Opcjonalny pływ atmosferyczny S1 (DS-PA-03).

seg-35da1ed0dc83 = <c1/> i <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Tabela { "1" } model N1, stopnie od { "2" } do { "6" }), włączane przez <c3/> w <c4/> i <c5/>; domyślnie wyłączone. MODELLED (współczynniki ponownie sprawdzone względem opublikowanej tabeli; brak zewnętrznej wyroczni dla efektu siły).

seg-c62d816a93cf = Wsadowe wyznaczanie orbity z prędkości zmiany odległości i azymutu/elewacji z maską elewacji (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (wariacyjne STM z analitycznymi pochodnymi cząstkowymi dwóch ciał + J2), <c5/>, <c6/>; <c7/>. Ścieżka wyłącznie z odległością jest bez zmian. Porównane z wsadową metodą najmniejszych kwadratów Orekit { "12.2" } na { "8" } zarejestrowanych z góry scenariuszach: każdy próg spełniony, z wyjątkiem zgodności stanu bez szumu (≤ { "1" } cm), chybionej w { "2" } z { "4" } scenariuszy przy { "1.46" } i { "1.74" } cm, przy czym kshana mieści się w granicach { "1e-8" } m od prawdy odniesienia; zapisane, MODELLED.

seg-223f1e39669f = Ważenie dokładnością SP3 (DS-PA-06).

seg-b5560ff1c426 = <c1/> i <c2/> odwzorowują kody dokładności z nagłówka i z każdego rekordu na sigmy obserwacji; wariant dopasowania Galileo ważony SP3 (RMS 3D Poziomu 2 { "0.035" } m wobec { "0.070" } m bez ważenia) dodano obok niezmienionych zapisanych przebiegów. MODELLED.

seg-831d35c5f97e = <b>Zadanie dispatch pełnego łuku Swarm-A (DS-PA-08)</b> w <c1/>.

seg-cc5e8af7cb0d = Grawitacja planetarna z tabel PDS SHADR (CAP-30, część CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) odczytuje Mars GMM-3 (d/o { "120" }) i GRAIL GL0660B (d/o { "660" }); <c3/> dołącza dowolne wczytane pole (ustawienia domyślne bez zmian). Przycięcia do stopnia 20 są dołączone (NASA PDS, domena publiczna; <c4/>); pełne pliki pobiera <c5/>. VALIDATED względem pyshtools { "4.14.1" } (w granicach { "4e-15" } całkowitej grawitacji przy d/o { "120" } na całej sferze, { "5e-14" } przy d/o { "660" } dla |lat| ≤ { "60" }°); okablowanie układu ciała pozostaje MODELLED (natywny układ każdego pola nie jest używanym układem IAU).

seg-afb5fbf86ffc = Grawitacja wysokiego stopnia do stopnia { "2190" } (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (zmodyfikowana kolumna w przód Holmesa–Featherstone'a, bez niedomiaru, bez osobliwości biegunowej), <c3/>, strumieniowy ładowacz ICGEM <c4/> / <c5/> (kontrole normy i maksymalnego stopnia, zapisany system pływów, człony zmienne w czasie odrzucane) oraz <c6/> (pełne EGM2008, SHA-256 przypięty, niedołączane; testy bramkowane przez <c7/>). <c8/> wybiera je w opcjonalnym <c9/>. Zgadza się z Orekit { "12.2" } do { "7.3e-17" } m/s² do stopnia { "2190" }, a orbita { "24" } h { "200" }×{ "200" } zgadza się do { "0.13" } m. MODELLED: pyshtools chybił zarejestrowany z góry próg w pobliżu bieguna (przypisane pyshtools), a kontrola czułości orbity na stopień 70 została chybiona ({ "0.73" } m < { "1" } m); oba zapisano w <c10/>.

seg-4ef4f74f21c1 = Integrator DOP853 (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (gęste wyjście 7. rzędu), <c4/>, <c5/>, ze strażnikiem kroku zamykającym się bezpiecznie przy błędzie; <c6/>, <c7/>, <c8/>. Sterownik domyślny jest bez zmian. VALIDATED względem SciPy { "1.18.1" } <c9/>: pojedyncze kroki w granicach { "5.6e-15" }, zgodne ciągi kroków, stany końcowe w granicach { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Solidny rozwiązywacz Keplera (FUT-12).</b> Nowy moduł <c1/>: <c2/> (starter Markleya { "1995" }, rezyduum bez kasowania) dla wszystkich { "0" } ≤ e < { "1" }, opakowany przez <c3/>. VALIDATED względem 50-cyfrowych pierwiastków mpmath do { "0.9" } ε·|E| aż do e = { "0.999999" } (<c4/>).

seg-5e82deb7c853 = Opcjonalna tesseralna grawitacja Ziemi w propagatorze Cowella (RM-09).

seg-e1a7ad42211e = <c1/> zyskuje <c2/> (<c3/>, <c4/>). Ewaluuje <c5/> (dołączone EGM2008 do stopnia/rzędu { "70" } lub dowolny <c6/> ICGEM) w układzie związanym z Ziemią osiąganym przez kąt obrotu Ziemi (<c7/>) lub łańcuch CIO GCRS-do-ITRS (<c8/>). Domyślnie <c9/>: żadne istniejące wyjście się nie zmienia. VALIDATED względem Orekit { "12.2" } Holmes–Featherstone w ciągu { "24" } h ({ "6" } przypadków, najgorzej { "0.036" } m), z progami zarejestrowanymi z góry w <c10/>.

seg-957686bb351e = <b>Dwuczęściowe daty juliańskie przez obrót Ziemi na ścieżce orbity</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> i <c6/>, konwersje <c7/> między <c8/> a <c9/> oraz opcjonalne <c10/> dla scenariusza <c11/> (ECEF, ślad na powierzchni i widok ze stacji; domyślnie wyłączone i bez zmian, a klucz jest pomijany w skrócie scenariusza, gdy jest wyłączony). Nowy wiersz rejestru, VALIDATED względem pyerfa <c12/>/<c13/> (zarejestrowane z góry b10475ee; { "40" } dat: GMST identyczne bit w bit, macierz w granicach { "2.7e-14" }, obrót w krokach { "1" } µs w granicach { "1.1e-14" } rad, gdzie ścieżka pojedynczego <c14/> je chybia). Epoka modelu sił Cowella pozostaje pojedynczym <c15/>; powód jest w jej dokumentacji.

seg-0680b1f4c98b = <b>Predykcja EOP poza tabelą</b> (<c1/>, <c2/>): opcjonalne rozszerzenie szeregu orientacji Ziemi IERS predyktorem LS+AR wystawionym w jego ostatnim wierszu, tak aby argumenty układów dla późniejszej epoki podążały za prognozą zamiast przycinać się do ostatniego wiersza. Odpowiedzi w obrębie tabeli są identyczne bit w bit (przetestowano); szereg nadal się przycina, chyba że to wywołano. Dokładność prognozy pozostaje istniejącym ustaleniem LS+AR względem Bulletin A (MODELLED).

seg-a7d272a1ddd6 = <b>Przesunięcia bieguna niebieskiego dX, dY w łańcuchu CIO</b> (<c1/>) oraz bezpośrednie kontrole wektorowe ERFA dla <c2/>, <c3/> i nowej funkcji. Nowy wiersz rejestru, VALIDATED względem pyerfa (zarejestrowane z góry 979c1e39; { "40" } epok { "1950" }–{ "2100" }: precesja i CIO identyczne bit w bit, TEME→GCRS w granicach { "1.1e-10" } rad, przewidywany efekt dwuczłonowego szeregu równania równonocy). Istniejące funkcje są bez zmian.

seg-20d19a2d65ec = <b>UTC sprzed 1972 na dwuczęściowej ścieżce czasu</b> (<c1/> oraz <c2/>, <c3/> i <c4/> od 1960-01-01): epoka dryfującej szybkości („rubber-second”), z tabelą dryfu SOFA, ułamkowymi skokami na koniec doby i skalowaniem UTC do SI części ułamkowej doby. Nowy wiersz rejestru, VALIDATED względem pyerfa <c5/>/<c6/>/<c7/> (zarejestrowane z góry 23c40661; { "117" } chwil { "1960" }–{ "1971" }, najgorzej { "2.9e-11" } s wobec progu { "1" } µs). Każdy wynik od { "1972" } jest identyczny bit w bit (suma kontrolna przypięta przed zmianą). Przed { "1960" } TAI − UTC wynosi { "0" }, jak w SOFA. Pojedyncze <c8/> <c9/> jest bez zmian.

seg-3ff0d080d9e6 = <b>Zegar satelity GLONASS z depeszy nawigacyjnej</b> (<c1/>): <c2/> z rekordu RINEX, w czasie odczytanym na zegarze satelity (dwie iteracje stałoprzecinkowe, konwencja RTKLIB). Sparsowane <c3/> i <c4/> były wcześniej nieużywane. Nowy wiersz rejestru „Zegar satelity GLONASS z depeszy nawigacyjnej i propagacja orbity z depeszy nawigacyjnej”, VALIDATED względem RTKLIB 2.4.2-p13 <c5/>/<c6/> (zarejestrowane z góry e099c42a; { "292" } przypadków na prawdziwym pliku depesz z { "2013" } roku: różnica zegara { "0" } s, najgorsze położenie { "1.1" } mm wobec progu { "1" } cm). Funkcja biblioteczna; żadne wyjście scenariusza się nie zmienia. Nie stosuje się żadnej transformacji PZ-90.11 → ITRF, i moduł to mówi.

seg-71ae2ee163e0 = <b>Rozwiązanie czasu PPP względem zegara stacji IGS</b> ({ "0.36" }, FUT-19): zegar odbiornika filtru PPP z liczbami rzeczywistymi na WTZR zgadza się z końcowym połączonym zegarem IGS dla stacji do { "0.075" } ns (odchylenie standardowe) ze stałym przesunięciem −{ "0.66" } ns w ciągu zbieżnych dwóch godzin. Progi zarejestrowano z góry w <c1/>. VALIDATED (nowy wiersz rejestru). Nowy fixture <c2/>, zapisy zegara stacji z końcowego pliku zegarów IGS, używanego już dla zegarów satelitów.

seg-463ac67600b1 = <b>Zgodność PPP z gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } uruchomiono na tych samych wejściach WTZR jako osobne narzędzie (rdzeń Apache-2.0; suma kontrolna pobrania sprawdzona względem opublikowanej listy), z wierszem poleceń z procedurowej poprawki zatwierdzonej przed przebiegiem. W pierwszym zarejestrowanym przebiegu PPP z liczbami rzeczywistymi Kshana i gLAB zgadzają się w granicach { "0.05" } m w { "240" } z { "240" } epok i do { "5.0" } mm w ostatniej. Próg SPP został chybiony (mediana { "1.187" } m wobec { "0.50" } m) i jest zapisany jako ustalenie: własne rozwiązania SPP gLAB i RTKLIB różnią się od siebie o { "0.852" } m. Zarejestrowana reguła pozostawia więc odnogi obu narzędzi jako niespełnione w całości, podczas gdy zgodność PPP zachodzi.

seg-158717c78c80 = <b>Odczyt depesz nawigacyjnych RINEX { "4" }</b> ({ "0.36" }, WP-07, PRO-41): <c1/> odczytuje pliki nawigacyjne RINEX 4.00-4.02 (<c2/> GPS LNAV, Galileo I/NAV i F/NAV, BeiDou D1/D2, QZSS LNAV; inne rekordy pomijane do następnego nagłówka rekordu), a <c3/> przyjmuje opcje. VALIDATED względem scalonego pliku IGS RINEX { "3" } z tego samego dnia: każde zdekodowane pole identyczne i { "0" } m w położeniu. Odczyt RINEX 2/3 jest bez zmian.

seg-57aa5c6ef4f8 = <b>Położenia GEO BeiDou z depeszy nawigacyjnej</b> (opcjonalne): <c1/> i <c2/> (BDS ICD, nachylenie −{ "5" } deg). <c3/> nadal pomija GEO. MODELLED: zarejestrowane z góry porównanie z precyzyjną orbitą jest uzależnione od danych i jeszcze nie uruchomione.

seg-416f58111d1f = <b>Pliki obserwacyjne RINEX { "4" }</b>: prawdziwy plik obserwacyjny RINEX { "4.00" } MGEX jest odczytywany w testach (MODELLED, zgodność formatu).

seg-64b4664c0ff6 = <b>RTK z LAMBDA na prawdziwym RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, podwójne różnice krótkiej bazy kodu i fazy GPS dwuczęstotliwościowego z filtrem Kalmana z liczbami rzeczywistymi i całkowitoliczbowym ustalaniem LAMBDA (test ilorazu). VALIDATED na stacjach IGS WTZR i WTZZ (odległych o { "1.4" } m) względem ich bazy ITRF2020 według progów zarejestrowanych z góry: ustalone w każdej epoce po pierwszych dziesięciu minutach, błąd bazy mediana { "4.5" } mm i 95. percentyl { "5.5" } mm.

seg-69db4437ebbb = <b>Zgodność z RTKLIB dla PPP na prawdziwych danych</b> (RM-31): <c1/> i <c2/> z progami zarejestrowanymi z góry. PPP RTKLIB v2.4.2-p13 na tych samych wejściach WTZR zgadza się z Kshana w granicach { "5" } cm w każdej epoce ostatnich dwóch godzin ({ "9.7" } mm na końcu) w trzeciej rejestracji; pierwsze dwa przebiegi, zapisane jako ustalenia, miały wyłączony pływ stały i antenę odbiornika w bazowym slocie RTKLIB. Próg zgodności pozycji pojedynczego punktu został chybiony (mediana { "1.09" } m wobec { "0.5" } m). Odnoga gLAB nie została uruchomiona (uzależniona od danych).

seg-fb6e053a0a9d = <b>Kodery komunikatów nawigacyjnych poza LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> koduje GPS CNAV (typy komunikatów { "10" }, { "11" }, { "30" }; CRC-24Q; ciągłe kodowanie o szybkości 1/2 K={ "7" }), Galileo I/NAV (typy słów 1-5 w parzystych/nieparzystych stronach nominalnych; przeplatacz 30x8; synchronizacja <c2/>) i Galileo F/NAV (typy stron 1-4; przeplatacz 61x8; synchronizacja <c3/>), z dekoderami testowymi. MODELLED: obiegi tam i z powrotem oraz znane odpowiedzi ICD; zarejestrowana z góry kontrola, że efemerydy Galileo z depeszy leżą na siatce LSB kodera, powiodła się (najgorzej { "3.6e-3" } LSB), ale chybiła próg liczby satelitów ({ "15" } z { "20" }), co zapisano. Kodery są funkcjami bibliotecznymi; podłączenie do sceny nie jest częścią tej zmiany.

seg-562f36eb18e6 = <b>Czytnik plików IONEX</b> ({ "0.36" }, WP-07): <c1/> z <c2/>, <c3/>, <c4/>, <c5/> i <c6/>: ścisły czytnik IONEX { "1.0" } o stałych kolumnach z epokami liczonymi od dnia pierwszej mapy, <c7/> odczytywane jako brak danych, mapami RMS oraz interpolacjami czasowymi formatu: najbliższą, kolejną i obróconych map; ukośne TEC na wysokości powłoki z nagłówka. Sprawdzone na zatwierdzonej mapie syntetycznej oraz, uzależnione od danych (pobierane w czasie testu z przypiętym SHA-256, niedołączane), na wycinku prawdziwego CODE GIM: każdy węzeł dokładny; interpolacja zgadza się ze wzorcem wzoru do { "4e-13" } TECU. <c8/> RTKLIB zgadza się do { "3.6e-13" } TECU w { "6885" } punktach (zarejestrowane z góry B6). VALIDATED na dowodzie uzależnionym od danych (decyzja właściciela, 2026-10-13): test kończy się niepowodzeniem na każdej mapie innej niż przypięta przez SHA.

seg-9fac2e8535c8 = <b>Wygładzanie nośnej Hatcha</b> ({ "0.36" }, WP-07): <c1/> i <c2/>, forma bez dywergencji (bez jonosfery) w precyzyjnym składaniu pojedynczego punktu. MODELLED z zapisanym ustaleniem: na stacji IGS WTZR obniża medianę błędu pojedynczego punktu z { "1.55" } m do { "1.12" } m, a 95. percentyl z { "3.47" } m do { "3.21" } m, poniżej zarejestrowanej z góry redukcji o { "40" } % (pozostały błąd jest typu bias, a nie szumu).

seg-7e4c7639d102 = <b>PPP z liczbami rzeczywistymi na prawdziwym RINEX</b> ({ "0.36" }, WP-07): <c1/>, statyczny filtr precyzyjnego pozycjonowania punktowego z liczbami rzeczywistymi na prawdziwym dwuczęstotliwościowym kodzie i fazie GPS z końcowymi produktami IGS (przesunięcia i wariacje anten, pływ stały Ziemi, wind-up fazy, opóźnienie Shapiro, szacowane opóźnienie mokre, detekcja zgubień cykli), z <c2/>. VALIDATED na wyłączonej z dopasowania stacji IGS WTZR względem jej współrzędnej ITRF2020 według progów zarejestrowanych z góry: po { "6" } h błąd wynosi { "1.5" } mm w poziomie i { "2.9" } cm w pionie, a każda epoka ostatnich dwóch godzin mieści się w granicach { "10" } cm.

seg-173aa308e3e8 = <b>Interpolacja precyzyjnych zegarów SP3</b> ({ "0.36" }, WP-07): <c1/> i <c2/> interpolują liniowo tabelaryczne zegary satelitów SP3 między dwoma obejmującymi poprawnymi węzłami (wartość wartownik złego zegara pomijana), a <c3/> przekazuje je do <c4/>, więc łańcuch precyzyjny działa z samego SP3. VALIDATED względem końcowych zegarów IGS { "30" } s z 2025-02-24 według progów zarejestrowanych z góry: { "32" } satelity GPS, RMS w punkcie środkowym { "0.121" } ns (próg { "0.15" } ns), 95. percentyl { "0.265" } ns (próg { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM obok wskaźników jakości holdover zegara</b> (CAP-05b): opcjonalna sekcja <c1/> w rodzaju clock podaje osobny blok <c2/> (migawkowy RAIM na zadanym niebie z podanej lokalizacji: werdykt i poziomy ochrony dla każdej epoki, dostępność; niedostępny, gdy GNSS jest odmówiony, nigdy nie ekstrapolowany). Wskaźniki holdover są bez zmian; bez tej sekcji wyjście jest identyczne bajt w bajt. MODELLED.

seg-99d9a67fc2f3 = <b>Progi receiver-trust skalibrowane na JammerTest { "2024" }</b> (CAP-13): zarejestrowana z góry kalibracja monitorów spadku C/N0, AGC i wskaźnika zagłuszania na publicznym zbiorze danych JammerTest { "2024" } (pobieranym w czasie działania, nigdy nie dołączanym; <c1/>), dostarczana wyłącznie jako opcjonalny <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Na zbiorze wyłączonym: progi AGC, wskaźnika zagłuszania i sumy przechodzą; próg fałszywych alarmów C/N0 nie przechodzi ({ "0.023" } wobec { "0.02" }), więc wiersz jest MODELLED (<c3/>). Ustawienia domyślne i wyjścia bez profilu są bez zmian.

seg-8ccd18c54b4b = <b>Hipotezy usterek ARAIM z wieloma satelitami</b> (CAP-05a): reguła podzbiorów ADD v4.2 uogólniona poza pary (<c1/>, <c2/>; rząd { "2" } to dokładnie istniejąca ścieżka sprawdzona przez MAAST) oraz opcjonalny zaawansowany RAIM dla tych hipotez (<c3/>), który zgłasza podzbiór największego rozdzielenia, gdy wykryto usterkę. Założenia a priori wymagające głębszych podzbiorów są odrzucane, nigdy nie obcinane. MODELLED.

seg-02f1f2d72263 = <b>Linia horyzontu w receiver trust</b> (FUT-01): sesja receiver-trust może podać <c1/>; satelity za nią są tracone dla nieba (<c2/>, <c3/>, <c4/>), a ich straty są klasyfikowane jako <c5/>, nigdy <c6/>; bez niej rozwiązanie zapasowe z luką w azymucie i każde wyjście są jak dotąd. Generator szkoleniowy załóg zyskuje zdarzenie <c7/> (zablokowane niebo, a nie zakłócenia) i scenariusz <c8/>. Monte Carlo UERE x DOP zyskuje dwie zamaskowane geometrie linii horyzontu z notatki projektowej, zarejestrowane z góry osobno: wszystkie { "26" } kontrole przechodzą.

seg-69fa2ecdc4e9 = <b>Weryfikacja znacznika czasu RFC { "3161" }</b> (CAP-14): <c1/> sprawdza podpis tokenu znacznika czasu (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 i P-384), wiązanie certyfikatu podpisującego ESS, użycie timeStamping przez podpisującego i jego łańcuch do zaufanej kotwicy w genTime tokenu, offline; <c2/> stosuje to do <c3/> pakietu (opcjonalnie; bez tego raport jest bez zmian). VALIDATED, wąsko: wszystkie { "27" } samodzielnie wygenerowanych przypadków zgadza się z OpenSSL { "3.0.13" } co do werdyktu i genTime, według porównania zarejestrowanego z góry przed napisaniem weryfikatora. Unieważnienie nie jest sprawdzane.

seg-1b7777e600a8 = <b>Poziomy weryfikacji dla każdej wartości w każdym rodzaju</b> (RM-04): wynik każdego rodzaju scenariusza kończy się teraz blokiem <c1/> wskazującym jego główne wartości, wiersz macierzy weryfikacji, który każdą z nich posiada, i poziom odczytany z tego wiersza (wartości, których żaden wiersz nie posiada, są wymienione jako bez poziomu). Blok jest dołączany po przebiegu i cofa się do poprzedniego dokumentu bajt w bajt (<c2/>). <c3/> nie ma <c4/>, dopóki nowa datowana predykcja nie zastąpi swojej zamrożonej; <c5/>, <c6/>, <c7/> i <c8/> nie mają skalarnej głównej wartości, a <c9/> zapisuje zwarty JSON. Członkowie kampanii zachowują swoje dokumenty bez poziomu.

seg-54aec3e311cf = <b>Preset kwantowy <c1/></b> (CAP-08c): dołączony scenariusz inercyjny, w którym akcelerometr z interferometrem zimnych atomów, określony przez fizykę interferometru (<c2/> z podanym poziomem drgań platformy), pracuje w wybiegu na tle akcelerometru kwarcowego klasy nawigacyjnej podczas 110-minutowej przerwy w GNSS. MODELLED.

seg-21d2b7fd2a21 = <b>Dokładna liczba stopni swobody Greenhalla</b> (CAP-03): <c1/>, pełny algorytm Greenhalla i Rileya ({ "2003" }) (rzędy różnic od { "1" } do { "3" }, wykładniki szumu od +{ "2" } do -4, z nakładaniem i bez, zmodyfikowane i niezmodyfikowane, z tablicami dla dużego J), z nakładkami ADEV, MDEV i HDEV. VALIDATED w ramach wstępnie zarejestrowanego porównania z allantools { "2024.6" }: { "4 876" } punktów siatki w granicach { "6.0e-13" } względem wartości; allantools zawodzi w { "32" } dalszych punktach, które zapisano bez wartości z wyroczni. Przedziały ufności <c2/> pozostają bez zmian co do bitu.

seg-8e04ebc15045 = <b>Człony błędów interferometru zimnych atomów</b> (RM-26/27/28): szum fazy lasera Ramana (z członem opóźnienia retroreflekcji), obciążenie od krzywizny czoła fali chmury termicznej (czysty defokus, z promieniem detekcji) oraz rozwiązywanie niejednoznaczności prążków (wspomagane klasycznie i z dwoma czasami interrogacji), jako funkcje biblioteki w <c1/>, każda w postaci zamkniętej sprawdzona kwadraturą lub metodą Monte Carlo. MODELLED; jeszcze nieosiągalne z rodzaju scenariusza (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Formaty dzienników zegara</b> (RM-03): <c1/> odczytuje pliki zegarowe RINEX, dzienniki fazy lub częstotliwości ASCII w stylu TimeLab oraz dzienniki liczników TAPR TICC do jednego znormalizowanego szeregu fazy (tau0 podane lub wykryte, luki policzone, polityka luk). Opcjonalnie: szereg synchronizacji telekomunikacyjnej może wskazać dziennik (<c2/>), a tabela <c3/> scenariusza zegara dodaje blok <c4/> (ADEV, TDEV, MTIE). Bez tej tabeli oba rodzaje są identyczne co do bajta (<a1><c5/></a1>). Wstępnie zarejestrowane porównanie na trzech syntetycznych dziennikach spełniło progi dla fazy i okablowania; estymatory zgadzają się z allantools w granicach { "2.5e-14" } wszędzie tam, gdzie ten je oblicza, a punktu MTIE dla całego zapisu nie oblicza (odnotowano). MODELLED.

seg-53369a5c3749 = <b>Maski wander dla synchronizacji częstotliwości</b> (RM-01): rodzaj <c1/> zyskuje siedem masek wander MTIE i TDEV w stałej temperaturze: ITU-T G.811 PRC, G.812 Typy I do III, G.8262 EEC Opcje { "1" } i { "2" } oraz G.8262.1 eEEC, z fragmentami potęgowymi zapisanymi w tabelach, a także scenariusz odniesienia <c2/> (swobodnie pracujący OCXO wobec masek EEC: nie spełnia ich przy { "1 000" } s, gdzie pracę musi wykonać pętla). Każdy wiersz ponownie odczytano z tekstu na itu.int; G.812 (06/2004) zastąpiono wstępnie opublikowanym wydaniem 08/2026, którego nie dało się odczytać. MODELLED (transkrypcja); istniejące maski i wyniki pozostają bez zmian.

seg-5e84b35ee4e7 = <b>Wskazówki dotyczące priora filtra dla rodzaju <c1/></b> ({ "0.36" }, WP-09, ustalenie RM-21): domyślny prior filtra w pakiecie odpowiada IMU klasy taktycznej. Przy IMU klasy nawigacyjnej wartość domyślna może pogorszyć wybieg z fuzją względem swobodnego INS: { "52" } m wobec { "11" } m dla profilu samolotu przy { "70" } m/s. Ustaw <c2/> zgodnie z klasą czujnika, jak w nowych pakietach morskim, kolejowym i lotniczym. Żaden dołączony scenariusz nie łączy IMU klasy nawigacyjnej z domyślnym priorem: każdy, który używa wartości domyślnej, ma resztkowe obciążenia akcelerometrów wynoszące co najmniej { "0.015" } m/s². Tylko dokumentacja; wyniki bez zmian.

seg-f74b3c265f3a = <b>Eksport do test bench sprawdzony własnymi czytnikami symulatora</b> ({ "0.36" }, WP-09, CAP-16): pliki ruchu <c1/> z { "8" } dołączonych scenariuszy odczytano z powrotem czytnikami NMEA, szerokości/długości/wysokości i ruchu w układzie związanym z Ziemią z gps-sdr-sim (MIT, commit 28ca29a6, użytego jako osobne narzędzie przez <c2/>; nie jest wywoływana żadna funkcja sygnałowa). Zwracają one wyeksportowaną trajektorię z dokładnością do { "1.2" } mm, { "0.15" } mm oraz dokładnie. USTALENIE: czytnik ruchu w układzie związanym z Ziemią w tym symulatorze nie przyjmie pełnoszerokiego pliku CSV, ponieważ jego 100-znakowy bufor linii dzieli każdy wiersz. <c3/> podaje teraz cięcia kolumn, których należy użyć, oraz limit { "300" } s tego symulatora. VALIDATED (nowy wiersz rejestru); bajty eksportu bez zmian.

seg-e77e1ac87dd5 = <b>GNSS/INS na zbiorze danych KF-GINS</b> ({ "0.36" }, WP-09, FUT-17): ładowarki i program uruchomieniowy <c1/> oraz model pomiarowy ramienia dźwigni w zamkniętopętlowym EKF. Na demonstracyjnym zbiorze danych KF-GINS (pobieranym w czasie testu, niedołączonym do repozytorium) poziomy RMS Kshana względem trajektorii odniesienia wynosi { "1.09" } cm wobec { "1.11" } cm własnego KF-GINS, a każdy wstępnie zarejestrowany próg został dotrzymany. VALIDATED na dowodach zależnych od danych (decyzja właściciela, 2026-10-13): zbiór jest pobierany z przypięciami SHA-256, a ścieżka odtworzenia znajduje się w <c2/>.

seg-4d5a503c5c9c = <b>Sprzężony filtr PNT w pakiecie fuzji</b> ({ "0.36" }, WP-09, FUT-16): rodzaj <c1/> przyjmuje opcjonalną tabelę <c2/>, która uruchamia jeden zbiorczy filtr na pseudoodległościach ze stanem obciążenia akcelerometru (<c3/>), a <c4/> jest 3-wymiarową wersją o 8 stanach. Nowy dołączony scenariusz <c5/>: przy obciążonych akcelerometrach tryb sprzężony utrzymuje pozycję zestawu kwantowego w granicach { "18.7" } m (95. percentyl) z pełną integralnością, gdzie filtry rozprzężone osiągają { "430" } m. Bez tabeli zarówno <c6/>, jak i <c7/> pozostają bez zmian (przypięte); <c8/> odrzuca tę tabelę. MODELLED.

seg-b7f07e3693df = <b>Pakiety GNSS/INS: morski, kolejowy i lotniczy</b> ({ "0.36" }, WP-09, RM-21): dołączone scenariusze <c1/>, <c2/> i <c3/> w bibliotece trajektorii oraz opcjonalna tabela <c4/> dla rodzaju <c5/>, która łączy pseudoodległości z konstelacji Walkera SGP4 (wszystkie satelity w stanie nominalnym, kilka najwyższych w stanie pogorszonym). W pakiecie kolejowym ścisłe sprzężenie utrzymuje rozwiązanie klasy nawigacyjnej na poziomie { "5.3" } m w przekopie i tunelu, wobec { "12.9" } m przy sprzężeniu luźnym. Bez <c6/> pakiet pozostaje bez zmian (przypięty). MODELLED.

seg-0daf8b2646ad = <b>Ścisłe sprzężenie z fazą nośnej</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, EKF stanu błędu z jawnym dwustanowym zegarem odbiornika i zmiennoprzecinkowymi niejednoznacznościami nośnej, sterowany konstelacją Walkera SGP4 z poprawkami Klobuchara i Saastamoinena w pętli pomiarowej, detekcją poślizgów z różnicowanej w czasie nośnej i ponowną inicjalizacją niejednoznaczności, oraz przebiegiem wyłącznie na kodzie na tych samych pomiarach dla porównania. MODELLED: na przejeździe po trasie w kształcie 8 rozwiązanie z nośną wynosi { "2.5" } cm wobec { "47" } cm tylko na kodzie, a NIS/NEES są spójne dla różnych ziaren.

seg-7032646c0bc4 = <b>Biblioteka trajektorii GNSS/INS</b> ({ "0.36" }, WP-09, RM-24): rodzaj <c1/> przyjmuje opcjonalną tabelę <c2/> z <c3/>. Profile zadają prędkości kątowe Eulera i przyspieszenie wzdłuż toru na podstawie stanu prawdziwego i wyprowadzają prawdziwe IMU z kinematyki bryły sztywnej (zakręty skoordynowane, wznoszenia, Coriolis); <c4/> importuje trajektorię prawdziwą (<c5/>) i wylicza IMU, które ją odtwarza. Bez tabeli pakiet wykonuje swój historyczny przejazd, co do bitu (przypięty). MODELLED.

seg-e6b31bf61185 = <b>Kafle DEM szerokości/długości dla horyzontu księżycowego</b>: <c1/> odczytuje kafel tekstowy <c2/> (wysokości nad średnią sferą na siatce szerokości/długości) zamiast biegunowego stereograficznego <c3/>, zarówno dla <c4/>, jak i <c5/>; raport odtwarza kafel (<c6/>, z jego SHA-256). <c7/> jest teraz podłączony do przemiatania promienia horyzontu. Kafel przepróbkowany z dołączonego wycinka daje stacji horyzont wycinka z dokładnością do { "0.22" } deg. MODELLED.

seg-0c7ebb6c7d0d = <b>Teren w miejscu eksportu objętości usługi</b>: przy sekcji <c1/> każdy wiersz eksportu geometrii poszczególnych satelitów <c2/> zawiera <c3/> (satelita wychodzi ponad płaską maskę i horyzont miejsca eksportu w swoim azymucie), raport zawiera horyzont tego miejsca (<c4/>), a CSV środowiska wykonawczego zyskuje tę kolumnę. Bez terenu eksport pozostaje bez zmian. MODELLED.

seg-7c8789777c26 = <b>Pola nagłówkowe z silnika</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> i WebAssembly <c3/> wskazują dla dwunastu rodzajów, które pola scenariusza odpowiadają na jego pytanie, od najlepszego, jako ścieżki z kropkami (<c4/>). Studio odczytuje je przed własnym rankingiem. Wyłącznie metadane wyświetlania: silnik ich nigdy nie czyta, żaden plik scenariusza ich nie potrzebuje, żaden wynik od nich nie zależy. <c5/> kończy się niepowodzeniem, jeśli rodzaj nie jest dyspozycyjny albo ścieżka nie występuje w żadnym z dołączonych scenariuszy tego rodzaju (wykrył dwie ścieżki, które spłaszczone identyfikatory Studio zapisały bez nawiasów tablicy).

seg-7528700924b2 = <b>Tabela rodzaj–moduł z silnika</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> i WebAssembly <c3/> podają, dla każdego rodzaju scenariusza, którego wiersze macierzy weryfikacji wymieniają inny moduł niż jego własny, nazwy modułów. Mapa możliwości Studio używała własnej, ręcznie napisanej kopii; <c4/> kończy się niepowodzeniem, jeśli rodzaj z tabeli nie jest dyspozycyjny albo moduł nie występuje w żadnym wierszu macierzy. Wyniki bez zmian.

seg-af7d28b7fb0e = <b>Krótki przebieg IQ w wersji przeglądarkowej</b> ({ "0.36" }): <c1/> i <c2/> w module WebAssembly budują scenę syntetyczną, akwizycjonują każdego satelitę i śledzą te, które udało się zdobyć, wszystko w pamięci, z ograniczeniem do { "0.25" } s, { "1 000 000" } próbek i { "8" } satelitów. Budowniczy sceny i wyszukiwanie sygnału po nazwie przeniesiono z <c3/>, dostępnego tylko w wersji natywnej (do <c4/> i <c5/>), aby obie wersje z nich korzystały; wynik wiersza poleceń jest bez zmian. Test natywny i <c6/> porównują to samo żądanie z jednym wzorcem (<c7/>), bajt po bajcie: od zmiany na przenośną matematykę (STUDIO-15, poniżej) wersja przeglądarkowa i natywna dają te same bity.

seg-c0eab9b97b7d = <b>Typowane API dla Pythona i TypeScriptu</b> (CAP-34): <c1/> typuje zamknięte słowniki (<c2/>, każda nazwa rodzaju; <c3/>; <c4/>) oraz słowniki <c5/> i <c6/>; <c7/> i <c8/> je zwracają. Pakiet WebAssembly dodaje <c9/> (jeden przebieg jako typowany obiekt <c10/> ze sparsowanym dokumentem jako <c11/>) oraz <c12/> (sparsowane <c13/>), a jego <c14/> zawiera ten sam słownik; <c15/> jest typowany jako <c16/>. <c17/> utrzymuje obie listy równe tym z silnika.

seg-b097c2f105c3 = <b>Jednostki dla każdej kolumny <c1/></b> (FUT-28): wynik <c2/> zawiera teraz <c3/> i <c4/>, czyli jednostkę każdego przemiatanego klucza i każdej zapisanej metryki, odczytaną z własnej tabeli jednostek przemiatanego pakietu. Oś może zadeklarować <c5/> dla klucza, którego pakiet nie powtarza; zadeklarowana jednostka sprzeczna z jednostką pakietu jest odrzucana, a jednostka, której nie podaje żadne z nich, to <c6/>, nigdy zgadywana. <c7/> i <c8/> są opisane, więc każdy z { "76" } rodzajów jest teraz w pełni objęty bramką jednostek pól (pułap rodzajów nieobjętych { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>Tablice NumPy z <c1/></b> (FUT-26): <c2/> w Pythonie zyskuje <c3/>, <c4/> i <c5/>, które zwracają <c6/> dla listy liczbowej, kolumn liczbowych listy rekordów albo każdego szeregu rekordów w dokumencie. Każda tablica jest równa <c7/> tych samych wartości z <c8/> (dtype i bity). NumPy jest importowany tylko wtedy, gdy wywoła się któreś z nich, i nie należy do wymagań środowiska uruchomieniowego. Typowane w <c9/> i sprawdzane przez stubtest.

seg-1c7a22dabad3 = <b>Optymalizator kampanii</b> (CAP-32): nowa, opcjonalna sekcja <c2/> rodzaju <c1/> przeszukuje od jednego do trzech kluczy scenariusza w podanych granicach w poszukiwaniu najlepszej wartości jednej metryki: minimalizacja, maksymalizacja albo trafienie w wartość docelową. Przeszukuje wyczerpująco na siatce albo deterministycznym, ograniczonym sympleksem Neldera–Meada. Każde obliczenie jest rzeczywistym przebiegiem wskazanego rodzaju i jest wymienione w <c3/> wyniku. Przykład: <c4/>. Progi zarejestrowano wstępnie (<c5/>):

seg-f4e79236b6bf = funkcja Rosenbrocka jest spełniona (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = rozwiązanie zadania 1-D z wartością docelową w postaci zamkniętej jest spełnione ({ "6e-15" } względem wartości);

seg-5ab478e03354 = siatka jest równa co do bitu niezależnemu przeszukaniu wyczerpującemu;

seg-ea0a04c6e713 = sympleks radzi sobie co najmniej tak dobrze jak siatka { "41" } × { "41" } w { "177" } przebiegach.

seg-161d8c5b55e8 = Próg 1-D rundy { "1" } zapisano jako NOT MET, ponieważ wstępnie zarejestrowane pudełko wykluczało rozwiązanie. MODELLED; wiersz rejestru "Bounded optimisation of one metric over campaign parameters". Dodatek: kampanie bez tej sekcji pozostają bez zmian.

seg-83d40a636fcb = <b>Zespoły kalibracyjne</b> (CAP-10): trzy kontrole z pojedynczym ziarnem powtórzone dla { "200" } niezależnych ziaren względem wstępnie zarejestrowanych progów, w <a1><c1/></a1> (wygenerowane przez <c2/>; wartości dla poszczególnych ziaren w <c3/>).

seg-b163e53e06e9 = Przedział { "95" } % z bootstrapu Monte Carlo kampanii obejmuje prawdziwą średnią w { "192" } z { "200" } zespołów, a jego kontrola chi-kwadrat jest zaliczona w { "196" }.

seg-022a7fbee13a = Tolerancja percentyla dla pojedynczego ziarna jest zaliczona tylko w { "183" } z { "200" }: NOT MET, zgodnie z przewidywaniem. To próg rzędu 2 sigma, zapisany i niezluzowany.

seg-096f36d21b02 = Kalibracje ADEV dla białego FM są zaliczone dla każdego ziarna, a ich najgorszy błąd mieści się daleko w granicach tolerancji.

seg-369c7f2a115c = <b>Rodzaje wbudowane przez cechę <c1/></b> (FUT-27, w toku): cecha <c2/> (<c3/>, z haczykiem poziomu dowodowego dla każdej wartości i <c4/>) oraz pierwsze rodzaje przeniesione na nią (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). Wynik jest bez zmian: manifest całego katalogu z SHA-256 każdego wyniku jest identyczny przed zmianą i po niej (<c10/>).

seg-fd6e68ff5e5d = <b>Kontrola braku pobierania w Playground</b> (RM-07): <c1/> sprawdza trzy rzeczy:

seg-3e424188f6e1 = każdy scenariusz biblioteki Studio znajduje się w pakiecie przeglądarkowym;

seg-2803ccf8b9ae = pakiet jest identyczny co do bajta z <c1/>;

seg-b98016a4a844 = każdy scenariusz przeglądarkowy uruchamia się z pustego katalogu roboczego.

seg-efc143b4f2a9 = <b>Mapy Alt-PNT: rzeczywiste pole grawitacyjne, Monte Carlo błędu mapy, SRTM w pełnej rozdzielczości</b> ({ "0.36" }, WP-10). Rodzaj <c1/> przyjmuje opcjonalną sekcję <c2/>: anomalię grawitacyjną zsyntetyzowaną z dołączonych współczynników EGM2008 (albo z pliku ICGEM <c3/> przez <c4/>, tylko w wersjach natywnych). Ta synteza zgadza się z ICGEM Calculation Service do około { "1e-8" } mGal na { "794" } węzłach w dwóch regionach, wobec wstępnie zarejestrowanych progów { "0.005" } mGal RMS i { "0.02" } mGal maks. (VALIDATED; wiersz rejestru "Gravity-anomaly synthesis from a spherical-harmonic model"). Nowy dołączony scenariusz <c5/> uruchamia 60-minutowy benchmark na tym rzeczywistym polu stopnia 70. Wynik zarejestrowany wstępnie: błąd dopasowania { "3106" } m, więc próg < { "500" } m jest NOT MET, zgodnie z przewidywaniem (stopień { "70" } jest zbyt gładki), a dziesięciokrotne zmniejszenie dryfu jest MET (MODELLED). Opcjonalna sekcja <c6/> powtarza benchmark dla ziarnowanych, gaussowsko skorelowanych błędów mapy i podaje rozkład błędu dopasowania (dołączony scenariusz <c7/>). Eksploracyjnie i bez wstępnej rejestracji: przy błędzie mapy { "2" } mGal skorelowanym na { "0.2" } deg (rozmiar, który uwzględnia własny budżet sigma dopasowywacza) w granicach { "500" } m mieści się { "1" } z { "20" } realizacji (mediana { "2.9" } km, p95 { "14.7" } km), wobec { "144" } m przy idealnej mapie. Syntetyczny benchmark z poprawką poniżej 500 m zakłada, że mapa jest dokładna. Bez żadnej z tych opcji dokument jest identyczny co do bajta z wcześniejszymi wydaniami. <c8/> przyjmuje opcjonalną tabelę <c9/> (<c10/>, <c11/>), która odczytuje kanał magnetyczny z pliku CSV w formacie EMAG2v3. EMAG2 nie jest dołączony, ponieważ jego warunki nie są jednoznaczne: <c12/> pobiera go z przypiętym SHA-256 i przycina obszar. Nie twierdzi się żadnego wyniku nawigacyjnego na rzeczywistej siatce EMAG2. Wspólna estymacja mapy (SLAM terenowy, RM-18): <c13/> prowadzi sekwencyjny nawigator terenowy nad zapisaną mapą, która różni się od prawdziwej, albo jej ufając, albo estymując poprawkę mapy dla każdej komórki filtrem Rao-Blackwella w stylu FastSLAM. Wstępnie zarejestrowano względem SITAN ze znaną mapą przy skorelowanym błędzie mapy { "15" } m dla { "20" } ziaren: średni zysk { "1.5" } %, lepiej w { "10" } z { "20" }, więc oba progi poprawy są NOT MET ({ "10" } % i { "12" } z { "20" }), bez szkody na idealnej mapie (MET). Pojedynczy przelot bez powrotów nie pozwala nauczyć się mapy (<c14/>, MODELLED). Dokumenty <c15/> są identyczne co do bajta. Testy z rzeczywistym SRTM działają teraz w CI na dwóch zatwierdzonych wycinkach w pełnej rozdzielczości; wszystkie wstępnie zarejestrowane progi są spełnione, a najbliższy węzeł jest równy GDAL { "3.8.4" } w { "8" } z { "8" } punktów (<c16/>).

seg-aa7ac7a47111 = <b>Interoperacyjność, WP-08</b> ({ "0.36" }; każdy punkt zarejestrowany wstępnie i zatwierdzony osobno przed uruchomieniem wyroczni, każdy jako nowy wiersz rejestru VALIDATED, z wyjątkiem punktu telemetrii, który rozszerza istniejący wiersz):

seg-a5d0b22337d7 = <b>Komunikaty danych orbitalnych CCSDS</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 i OCM { "3.0" } (bloki TRAJ, PHYS, COV, MAN, USER) zapisywane i odczytywane w KVN oraz NDM/XML, a także OMM w pełnej precyzji z zestawu elementów SGP4 (<c2/>); wynik <c3/> jest bez zmian. Względem Orekit { "13.1.8" } w obu kierunkach: { "27" } z { "30" } komunikatów Kshana daje się sparsować w Orekit, a Kshana odczytuje każdy komunikat zapisany przez Orekit, z wartościami w granicach { "1e-14" } względem wartości i epokami w granicach { "1e-9" } s; przypięto cztery ustalenia (Orekit wymaga <c4/>, odrzuca <c5/> w parametrach zdefiniowanych przez użytkownika w XML, nie zapisze <c6/> bez <c7/> i odczytuje względne epoki OCM w TDB w sekundach SI). Starszy zapis OMM z <c8/> jest odrzucany przez Orekit (odnotowano). Wiersz "CCSDS Orbit Data Messages (OPM, OMM, OCM)".

seg-39c70cb59f31 = <b>Komunikaty danych orientacji CCSDS</b> (<c1/>, <c2/>): AEM 2.0/1.0 i APM { "2.0" } w KVN i XML względem Orekit { "13.1.8" }, każdy próg spełniony; zapis APM w Orekit odrzuca manewr bez <c3/> (przypięte). Wiersz "CCSDS Attitude Data Messages (AEM, APM)".

seg-bdfce382a98c = <b>Eksport SPICE SPK</b> (<c1/>): zapis i odczyt SPK typów { "9" } i { "13" } oraz eksport z OEM do SPK; względem CSPICE N0067 jądra są identyczne co do bajta z jądrami SPICE i dają identyczne co do bitu wyniki obliczeń. Wiersz "SPICE SPK export (types { "9" } and { "13" })".

seg-ce217acb9fe7 = <b>SPICE SPK typów { "3" } i { "21" }</b> (<c1/>): segmenty typu { "3" } (Czebyszewa) i typu { "21" } (rozszerzone linie różnic) zapisane z podanych rekordów i obliczane tak jak w SPICE; względem CSPICE N0067 jądra są identyczne co do bajta z jądrami SPICE, a każde obliczenie zgadza się co do bitu w obu kierunkach. Wiersz "SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)".

seg-72b8edbc74dc = <b>Rozszerzenia Space Packet</b> (<c1/>): nagłówek wtórny z kodami czasu CUC/CDS, kontrola błędów pakietu, segmentacja i kontrole strumienia, względem ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } i CPython <c2/>, zero niezgodności. Wiersz "CCSDS Space Packet secondary header, packet error control and segmentation".

seg-c5fcf933b656 = <b>Schemat telemetrii { "1.3" } przez rzeczywistych konsumentów</b>: ekspozycja Prometheus i JSON OTLP/HTTP syntetycznego strumienia w schemacie 1.3, w tym szereg geometrii i etykieta <c1/>, odczytane dokładnie przez prometheus_client i proto OTLP, zaakceptowane przez promtool { "3.5.0" } <c2/> bez problemów lintera i przepuszczone bez zmian przez OpenTelemetry Collector contrib { "0.135.0" } (zależne od danych: narzędzia pobrane z przypiętym SHA-256, wyniki zatwierdzone).

seg-013344665417 = <b>Wyznaczanie orbity Marsa, przebieg { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> skaluje macierz normalną jej przekątną i tłumi krok (Levenberg-Marquardt), po tym jak zarejestrowane dopasowanie Gaussa-Newtona zawiodło na macierzy, której surowa przekątna obejmuje osiem rzędów wielkości. Zarejestrowane osobno (<c2/>, ten sam łuk, progi i redakcja). Na ocenianych przelotach MRO orbita mieści się w { "0.36" } km RMS ({ "0.53" } km maksimum) od rekonstrukcji nawigacyjnej MRO, progi spełnione. Doppler po dopasowaniu wynosi { "48.6" } mHz wobec progu { "30" } mHz, niespełniony (ustalenie przypięte). Poprawkę dotyczącą wyłącznie oceny, R2-A1, ujawniono w <c3/>. Wiersz pozostaje MODELLED.

seg-fee311480417 = <b>Model Dopplera 2-way z rampą dla Marsa i wyznaczanie orbity</b> ({ "0.36" }, WP-14, część CAP-30, etap { "2" }): <c1/> przewiduje Doppler 2-way DSN z rampą w paśmie X na podstawie tablic rampy ODF (czas światła, Shapiro, troposfera, czas stacji, stacje DSN przez łańcuch CIO i IERS EOP) i dopasowuje orbiter Marsa (GMM-3, ciała trzecie, SRP, opór). <c2/> odczytuje SPK typu { "1" } (sprawdzone względem CSPICE), a <c3/> odczytuje pola PDS SHADR. Zarejestrowane wstępnie względem rekonstrukcji nawigacyjnej MRO na rzeczywistych przelotach MRO (zależne od danych, <c4/>, comiesięczne CI): przewidziany Doppler zgadza się z obserwacjami do { "12.5" } mHz (próg { "30" } mHz, spełniony); zarejestrowane dopasowanie orbity zawiodło na ocenianym łuku i nie dało orbity (ustalenie przypięte). Wiersz pozostaje MODELLED.

seg-d8212aa309ef = <b>Czytnik plików danych orbitalnych DSN</b> ({ "0.36" }, WP-14, część CAP-30): <c1/> odczytuje ODF TRK-2-18. Na rzeczywistym ODF Mars Reconnaissance Orbiter (NASA PDS, dołączonym) czytnik zgadza się z liczbą rekordów, pozycjami grup, stacjami i czasami z etykiety PDS, a wszystkie jego typy danych są znane. Tabela końca pliku w etykiecie jest o jeden wiersz krótsza niż plik, co jest niespójnością etykiety odnotowaną jako ustalenie. MODELLED. Wyznaczanie orbity na tych danych nie zostało jeszcze wykonane.

seg-bf26920a50bc = <b>Budżet TWSTFT i stabilność transferu czasu: rodzaj <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Równanie dwukierunkowe:

seg-c1fdd431db57 = <c1/> rozwiązuje je względem T_A − T_B z opóźnieniami aparatury stacji, asymetrią jonosferyczną w górę i w dół w paśmie Ku, różnicą opóźnień transpondera i członami Sagnaca oraz odtwarza model w przód z dokładnością do { "1e-15" } s.

seg-a5468765380d = <b>Budżet niepewności:</b> składany kwadraturowo, z TDEV łącza jako składnikiem typu A.

seg-7f365f91bb3e = <b>Szum łącza:</b> szereg dwukierunkowy zyskuje podłogę szumu fazy typu flicker, dobową nierecyprokalność i stałą resztę recyprokalności. Pakiet <c1/> z białym jitterem pozostaje bez zmian.

seg-8b40e74db08c = <b>Rzeczywiste szeregi:</b> stabilność dostarczonych szeregów BIPM Circular T, CSV <c1/> lub zegara stacji IGS.

seg-267fd20d823c = MODELLED. Nowy dołączony scenariusz <c1/>. Rozwiązanie czasu PPP jest osobno VALIDATED względem zegara stacji IGS w gałęzi rzeczywistych danych GNSS.

seg-ae33b92da4a6 = <b>Nagrzewanie przy wejściu w atmosferę, radiometria EO i straty wynoszenia</b> ({ "0.36" }, WP-14, CAP-28): trzy nowe rodzaje.

seg-34951878aa49 = <c1/>: wejście w atmosferę jako masa punktowa o 3 stopniach swobody nad wirującą Ziemią lub Marsem z nagrzewaniem punktu stagnacji według Suttona-Gravesa.

seg-98fe7a4c464a = <c1/>: SNR obrazowania, MTF przy Nyquiście, względna odpowiedź krawędziowa i NIIRS GIQE { "4" }.

seg-173dfbe3cc3e = <c1/>: wielostopniowe wynoszenie po zakręcie grawitacyjnym ze stratami na grawitację, opór, sterowanie i przeciwciśnienie, sprawdzane dokładną tożsamością idealnego dv minus straty.

seg-0c9e7aacec80 = Maksymalne opóźnienie przy wejściu w atmosferę sprawdzono względem opublikowanego nominału Stardust w ramach wstępnie zarejestrowanego progu: { "35.44" } g wobec { "33.4" } g (+{ "6.1" } %, próg { "10" } %). Ten wiersz jest VALIDATED. Nagrzewanie, radiometria i wynoszenie są MODELLED. Nowe są też: <c1/>, dołączone scenariusze <c2/>, <c3/> i <c4/> oraz <c5/>.

seg-d4648c4e6655 = <b>Sterowanie orientacją za pomocą kół reakcyjnych: rodzaj <c1/></b> ({ "0.36" }, WP-14, CAP-21). Zwrot w inercyjnym ukierunkowaniu sztywnego korpusu z trzema lub więcej zrównoważonymi kołami reakcyjnymi ze sprzężeniem zwrotnym MRP, z momentami kół o minimalnej normie obciętymi do limitu każdego silnika (<c2/>). Może też zamknąć pętlę na multiplikatywnym EKF z symulowanego żyroskopu i śledzika gwiazd (<c3/>). Pętlę prawdziwego stanu porównano z Basilisk { "2.9.1" } na trzech przypadkach zarejestrowanych wstępnie, zanim powstał kod (trzy ortogonalne koła, piramida czterech kół, przypadek z nasyceniem). Każda składowa MRP, prędkość kątowa korpusu, prędkość koła i moment silnika zgadzały się w każdej próbce, w najgorszym przypadku { "2.4e-14" } w sigma i { "2.9e-11" } rad/s w prędkości koła. Ten wiersz jest VALIDATED; MEKF jest MODELLED (spójność NEES). Nowe dołączone scenariusze <c4/> i <c5/> oraz <c6/>.

seg-8ce699586340 = <b>Planowanie kontaktów z naziemnymi stacjami i ACM DVB-S2</b> ({ "0.36" }, WP-14, CAP-22/23): dwa nowe rodzaje scenariuszy. <c1/> podaje dla jednego satelity nad jedną stacją Es/N0 każdego przelotu oraz wybrany wzdłuż niego MODCOD DVB-S2 (progi z ETSI EN { "302" } 307-1, tabela { "13" }, plus margines). Podaje też wolumen danych, jaki ACM przenosi względem punktu odniesienia ze stałym kodowaniem. <c2/> robi to samo dla kilku satelitów nad kilkoma stacjami i buduje bezkonfliktowy plan kontaktów (zawracanie anteny, jedna stacja na satelitę, dostarczanie ważone priorytetem, ograniczone do każdej zaległości). Zgłasza zachłanny plan wartości krańcowej, punkt odniesienia typu kto pierwszy, ten lepszy oraz dokładne optimum na małych zbiorach, wraz z luką optymalności planu zachłannego. Okna dostępu pochodzą z VALIDATED predyktora pozornych przelotów. Nowe dołączone scenariusze <c3/> i <c4/> (dane wejściowe poglądowe) oraz <c5/>. MODELLED (dwa nowe wiersze rejestru).

seg-cd6dbcc3a78b = <b>Pozycjonowanie Dopplerowskie Starlink na tle opublikowanego eksperymentu</b> ({ "0.36" }, WP-14, część CAP-11, MODELLED). Jest to wstępnie zarejestrowane porównanie zastępcze trybu Dopplera <c1/> z presetem <c2/> względem percentyli zbioru danych 3 z "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Model użył { "3" } satelitów (maska { "47" } deg wybrana stałą regułą), bez wspomagania wysokością i z sigma Dopplera { "30" } Hz, dla { "200" } ziaren. Jego 90. percentyl błędu 3-D wynosi { "92.2" } m przy { "20" } s i { "870" } m przy { "8" } s, wobec opublikowanych { "2" } m i { "10" } m, więc oba progi dwukrotności są NOT MET. Model jest pesymistyczny, a nie optymistyczny, jak przewidywano: trzy stałe satelity dają znacznie mniejszą różnorodność geometryczną niż { "63" } satelitów eksperymentu w ciągu { "10" } minut z przełączaniem kanału co { "15" } s. Oba niedociągnięcia są asercjami (<c3/>).

seg-ffeb1b66cda5 = <b>Optymalizator transferów impulsowych na DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> znajduje daty odlotu i przylotu balistycznego transferu dwuimpulsowego o jednym obiegu, które minimalizują C3 odlotu albo V-infinity przylotu w obrębie Typu I lub Typu II. Przeszukuje siatkę 2-dniową, a następnie dopracowuje metodą Neldera-Meada 2-D, na stanach heliocentrycznych z jądra DE440; opiera się na <c2/>. Porównanie zarejestrowano wstępnie (bf0439e8) względem niezależnego optymalizatora SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } na okazji Ziemia-Mars z { "2026" }: wszystkie cztery optymalizacje zgadzają się do { "8.7e-13" } względem wartości, z datami w granicach { "1e-5" } doby (VALIDATED, nowy wiersz rejestru). Jako dodatkowy opublikowany punkt odniesienia NASA/TM-2010-216764 (poradnik Ziemia-Mars na lata 2026-2045) zgadza się dla minimalnego C3 Typu II ({ "9.182" } wobec { "9.144" }) i minimalnego V-infinity przylotu Typu II ({ "2.564" } wobec { "2.565" }). Minimalne C3 Typu I się nie zgadza: { "10.535" } wobec { "11.11" } (-5.18 %), przy czym wyrocznia biblioteczna zgadza się z Kshana. To niedociągnięcie jest odnotowane i objęte asercją.

seg-91fe2e2625a1 = <b>Badanie księżycowej stacji referencyjnej</b> ({ "0.36" }, zainspirowane opublikowanymi materiałami o planowanej księżycowej stacji referencyjnej na biegunie południowym; źródła w <a1><c1/></a1>): rodzaj <c2/>, przemiatanie Monte Carlo modelu księżycowego różnicowego PNT po siatce użytkowników na biegunie południowym i dobie epok, podające dla każdego punktu i dla całego regionu percentylowy błąd skorygowany i nieskorygowany, dostępność wraz z przyczynami, pokrycie względem podanego progu, poziomy ochrony, promień pokrycia dla każdego azymutu oraz budżet łącza poprawek. W jednym punkcie, jednej epoce i jednej próbie redukuje się dokładnie do <c3/>; jego arytmetykę przeliczono ponownie w numpy wobec wstępnie zarejestrowanego progu (pozycje i percentyle spełnione; poprawki stacji nie spełniły swojego progu z powodu zaokrągleń podwójnej precyzji, odnotowano). MODELLED; wiersz rejestru "Lunar reference-station coverage and accuracy map". Bez powiązań z jakąkolwiek agencją ani jej poparcia; bez twierdzeń o działaniu jakiegokolwiek rzeczywistego systemu.

seg-3d0cd9692787 = <b>Wstępnie zarejestrowana prognoza: pokrycie księżycowej stacji referencyjnej</b> (nie jest to walidacja; MODELLED). <a1><c1/></a1> zamraża, w commicie c05dac1d, wyniki <c2/> przy publicznie podanych założeniach, wraz z haszami SHA-256 danych wejściowych i wyników oraz protokołem oceny ustalonym teraz (współczynnik { "2" } dla dokładności i poziomów ochrony, { "10" } punktów procentowych dla dostępności i pokrycia; zmienione założenie dostaje nową, datowaną prognozę, nigdy edycję; pudło publikuje się równie wyraźnie jak trafienie). Każda wartość zależy głównie od niepublikowanego zestawu elementów orbitalnych czteroelementowej konstelacji satelitów, który jest ILLUSTRATIVE i tak to deklaruje. <c3/> go pilnuje; <c4/> zyskuje sekcję "Pre-registered predictions". Bez wiersza rejestru.

seg-00ec7ccd4d0d = <b>Rozszerzenia księżycowej stacji referencyjnej</b> ({ "0.36" }; ograniczenia { "2" } i { "3" } badania stacji oraz styl rozwiązania z publikacji źródłowych), każde opcjonalne w <c1/> i domyślnie nieobecne, więc każdy istniejący dokument, łącznie z zamrożoną prognozą, pozostaje bez zmian: <c2/> (wielodrogowość <c3/> u użytkownika i na stacji, na stacji opcjonalnie Gaussa-Markowa w epokach, szum kodu DLL z C/N0, obciążenia międzykanałowe; wartości ILLUSTRATIVE na Księżycu); <c4/> (liniowy wzrost błędu orbity rozgłaszanej w czasie opóźnienia poprawek, ILLUSTRATIVE); <c5/> (ograniczenie wysokości, przy nim minimum trzech satelitów, okno użytkownika nieruchomego w epokach). Dwa uzupełnienia porównania z opublikowanymi twierdzeniami, każde zarejestrowane wstępnie osobno przed swoim uruchomieniem, znajdują się obok niezmienionego zapisanego przebiegu: K5 ze wzrostem zawodzi przy każdej szybkości; ze stylem rozwiązania z publikacji źródłowych K1 do K5 zawodzą, a K6 przechodzi ({ "1" } z { "6" }), przy czym skorygowany błąd 3-D p95 dla R300 spada z { "280.6" } m do { "2.11" } m. MODELLED; trzy wiersze rejestru.

seg-1d0a0dcd42de = <b>Maski horyzontu terenu księżycowego</b> ({ "0.36" }; pierwsze ograniczenie badania księżycowej stacji referencyjnej): opcjonalna sekcja <c1/> w <c2/> (stacja i każdy punkt użytkownika) oraz <c3/> (każdy punkt siatki) nadaje każdemu miejscu zależny od azymutu horyzont w formacie tabeli skyline z { "0.36" }, z podanego profilu opatrzonego źródłem (<c4/>, <c5/>) i/lub przemiatania promienia nad polarnym DEM (<c6/>) wzdłuż kół wielkich sfery księżycowej z dokładną krzywizną. Dołącza wycinek o rozmiarze { "0.98" } MB publicznego, należącego do domeny publicznej południowobiegunowego DEM LRO LOLA <c7/>, przepróbkowany uśrednianiem bloków { "5" } x { "5" } do { "1200" } m (<c8/>, z jego NOTICE, SHA-256 i <c9/>), oraz scenariusz tylko dla repozytorium <c10/>. Sprawdzone względem horyzontów w postaci zamkniętej (gołej sfery, krateru na płaskowyżu, rasteryzowanego stożka); MODELLED, wiersz rejestru "Lunar terrain horizon masks from a stated profile or a polar DEM". Bez tej sekcji każdy dokument, z blokiem jednostek włącznie, jest identyczny co do bajta.

seg-ca0c6ca7396a = <b>Zaufanie uwzględniające geometrię</b> (nota projektowa o geometrii z { "0.36" }, sekcja { "4" }). Każda epoka <c1/>, statyczna lub statku, wsadowa lub na żywo, niesie geometrię swoich satelitów: <c2/>, <c3/> (przyczyny <c4/>, <c5/>, <c6/> oraz informacyjna <c7/>) albo <c8/>, gdy dziennik nie podaje geometrii satelitów, wraz z HDOP, PDOP, VDOP i użytymi satelitami. Jest wyprowadzana z elewacji i azymutów podawanych przez odbiornik (NMEA GSV, UBX NAV-SAT) przez istniejące jądro <c9/> albo brana z NMEA GSA. Każda epoka niesie też etykietę, <c10/>, <c11/> lub <c12/>, zawsze zgłaszaną i nigdy nieoceniającą, oraz uwagę z HDOP, PDOP, VDOP, liczbą satelitów i utratą sygnału opisaną słowami. Wskaźnik statku zyskuje monitor <c13/>, który nic nie odejmuje, dopóki geometria nie jest słaba (HDOP powyżej { "4" }, PDOP powyżej { "6" } lub mniej niż { "5" } użytych satelitów), po czym narasta do limitu { "15" } punktów; sama geometria osiąga co najwyżej pasmo pogorszone, nigdy nieufne (bez alarmu). Każde odjęcie dostaje klasę, <c14/>, <c15/> lub <c16/>, aby słabe niebo nie było odczytywane jako atak. <c17/> jest <c18/>, gdy utracone satelity były wszystkie poniżej { "15" } stopni w ostatnim raporcie; odjęcie za słabą geometrię jest <c19/>, gdy HDOP podany przez odbiornik różni się od jego podanego nieba o więcej niż max({ "1.0" }, { "25" } % wyprowadzonego HDOP), więc sfałszowane słabe niebo nie może kupić etykiety. Nowa tabela <c20/> podaje każdy próg wraz z pochodzeniem (HDOP { "4" }, PDOP { "6" }, co najmniej { "5" } użytych, sigma_UERE { "1.5" } m, tolerancja HDOP max({ "1.0" }, { "25" } % wyprowadzonego HDOP), przy czym { "25" } % jest wyborem reprezentatywnym dla odbiorników z zegarami dla poszczególnych konstelacji lub rozwiązaniami z podzbioru, { "15" } stopni; wartości IEC 61108-1 i GPS SPS jak cytowano, do sprawdzenia z tekstem norm). Całkowita utrata sygnału nie jest opisywana jako niebo: gdy satelity w widoczności nie są śledzone, a DOP satelitów w widoczności jest dobry (i nieśledzone nie są ograniczone do jednej połowy horyzontu), epoka niesie <c21/>, a odjęcie za geometrię ma klasę <c22/>. Podane HDOP lub PDOP równe { "99" } albo większe, jakość GGA { "0" } i tryb GSA { "1" } są odczytywane jako brak rozwiązania, a nie jako DOP. Limit (<c23/> { "15" }), koniec narastania (<c24/> { "1.5" }) i dolna granica (<c25/>, domyślnie <c26/> wskaźnika) znajdują się w <c27/>, podobnie jak dobre poziomy etykiety (HDOP { "2" }, PDOP { "3" }, { "6" } satelitów, reprezentatywne); obowiązujący limit to <c28/>, więc tabela <c29/>, która podnosi <c30/> (również taka z { "0.35" }), obniża limit zamiast być odrzucona, a dolna granica poniżej <c31/> jest odrzucana. MODELLED; oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.

seg-d976d3495695 = Geometria dociera do każdej powierzchni: wyniku JSON (<c1/>, <c2/> przy każdym odjęciu, <c3/>, <c4/>), linii JSON na żywo (schemat { "1.3" }), <c5/> w Pythonie i WebAssembly, <c6/> i <c7/>, narzędzi MCP <c8/>, pakietów dowodowych (<c9/>, <c10/>, ścieżka geometrii na stronie podsumowania) oraz <c11/> (Prometheus <c12/> i etykieta <c13/> w <c14/>, OTLP <c15/>, pola niestandardowe CEF <c16/> (stan i klasy geometrii), <c17/> (HDOP) i <c18/> (PDOP), sprawdzone względem obu parserów wyroczni CEF, oraz LEEF <c19/>, <c20/>, <c21/>). Eksportowana jest także etykieta geometrii, dołączana po każdym wcześniejszym szeregu i polu i tylko dla danych wejściowych, które ją niosą: Prometheus <c22/> i <c23/>, OTLP <c24/> i <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, a w CEF trzecie pole <c30/> (etykieta) i <c31/> (użyte satelity); VDOP nie ma w CEF (pola niestandardowe zmiennoprzecinkowe są zajęte). Oba parsery wyroczni CEF odczytują przypadki etykiet z powrotem tak, jak je zapisano (poprawka { "5" }: { "176" } linii, { "172" } sparsowanych przez pycef, { "176" } przez Logstash). Podany HDOP, którego podane niebo nie wyjaśnia, jest oznaczany przy każdej epoce i liczony (<c32/>, wiersz na stronie podsumowania dowodów), oceniany tylko wtedy, gdy geometria jest słaba. Utrata sygnału jest eksportowana osobno, ponieważ stan geometrii pozostaje <c33/>, dopóki ona trwa: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; w CEF widać ją jako klasę <c37/> w <c38/>.

seg-5030e5214ed0 = <c1/>: współczynnik kowariancji <c2/> stojący za <c3/>, wyodrębniony z niego z tą samą arytmetyką.

seg-c6cc061a3ed6 = Wiersz rejestru "Position error from geometry: RMS error = sigma_UERE x DOP" (<b>MODELLED</b>, spójność wewnętrzna): ziarnowane Monte Carlo rozwiązania najmniejszych kwadratów silnika na { "8" } geometriach DOP zgodnych z gnss_lib_py względem współczynnika kowariancji sprawdzonego jądra DOP, z tolerancjami zarejestrowanymi wstępnie przed pierwszym uruchomieniem i dwiema kontrolami negatywnymi, które zawodzą zgodnie z wymaganiem; obok wcześniejsza kontrola na czterech ręcznie dobranych niebach z przedziałami ufności chi-kwadrat, zgłoszona jako wykonana przed wstępną rejestracją.

seg-b87b6eafd465 = <b>Maski skyline zależne od azymutu</b> (<c1/>, <a1><c2/></a1>, punkt { "1" } noty projektowej): odcięcie elewacji zależne od azymutu, maksimum punktowe tabel (każda interpolowana osobno, zawijana przy { "360" }°), kanion uliczny w postaci zamkniętej (z opcjonalnymi otwartymi końcami), sektory o ostrych krawędziach i profil terenu z krzywizną Ziemi; efektywne odcięcie to <c3/>. Cztery presety REPRESENTATIVE z podanym pochodzeniem (<c4/>, <c5/>, <c6/>, <c7/>), z możliwością nadpisania pole po polu. Opcjonalna sekcja <c8/> w plikach szkoleniowych <c9/>, <c10/>, <c11/> (każdy tryb, z przemiataniem polarnym włącznie), <c12/> i <c13/> oraz w <c14/> i <c15/> przez nowego użytkownika w miejscu naziemnym, <c16/> (geodezyjne kąty widzenia na wirującej Ziemi, z geodezyjnym zenitem dla podziału ARAIM na poziomy i pionowy; każda próbka to jeden bezwzględny moment, <c17/>, do którego zestawy elementów, efemerydy rozgłaszane i pliki SP3 są przesuwane od swoich własnych epok, datowane od najnowszej epoki satelity, gdy nie podano <c18/>; orbitujący <c19/> odrzuca skyline). Wyniki zyskują <c20/> i dla każdej próbki <c21/>. Bez tej sekcji każdy scenariusz jest identyczny co do bajta z { "0.35.0" }, co sprawdzono względem skrótów z commitu wydania. Sześć dołączonych przykładów: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> i kampania <c27/> (kanion pojazdu autonomicznego jako płaskie odcięcie i jako ulica; istniejąca kampania pozostaje bez zmian). MODELLED.

seg-95cdecf341d6 = <b>Funkcje geometrii nieba</b> (<c1/>, punkt { "2" } noty projektowej): <c2/> (satelity widoczne i zamaskowane z miejsca, czasu i presetów konstelacji, dwuwierszowych zestawów elementów (<c3/>, co najwyżej { "4" } MiB, propagowanych przez SGP4 silnika do <c4/> w UTC) lub podanych satelitów; <c5/> i <c6/> mówią, czy niebo jest reprezentatywne, czy jest niebem, jakie zestawy elementów dają w tej epoce, a nie pomiarem; <c7/> wymienia każdą nieużytą linię wraz z przyczyną; limity wejścia { "2000" } satelitów nad horyzontem, sprawdzane przed zbudowaniem tabeli systemu, oraz { "16" } zegarów odbiornika; pięć współczynników DOP; kofaktor i kowariancja ENU z jednym zegarem na system albo jednym wspólnym; poziomą elipsę błędu przy jednym sigma i przy podanym poziomie ufności), <c8/> (ziarnowane błędy najmniejszych kwadratów, co najwyżej { "5000" }), <c9/>, <c10/> i <c11/>. <c12/> udostępnia kowariancję stojącą za <c13/>, które jest teraz jej redukcją (sprawdzone wartości skalarne bez zmian). Powierzchnie: <c14/> i <c15/>, funkcje Pythona i WASM o tych samych nazwach, narzędzie MCP <c16/> ({ "40" } narzędzi) oraz notatnik <c17/> (z lustrem <c18/>; uruchamiany przez <c19/>). Każdy wynik niesie etykietę MODELLED, oświadczenie o modelu błędu i uwagę doradczą.

seg-9414d387cf79 = Rejestr: pięć wierszy dotyczących skyline i geometrii nieba. <b>VALIDATED</b>, każdy w porównaniu zarejestrowanym wstępnie przed uruchomieniem jego wyroczni: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> względem Orekit { "12.2" } (<c1/>, <c2/>) i gnss_lib_py { "1.0.4" } (<c3/>), najgorsze różnice kątów widzenia i masek { "1.1e-12" }° wobec { "1e-9" }°, identyczne zbiory widocznych, DOP { "3.3e-13" } względem wartości (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> względem numpy <c5/> i <c6/> (standardowe P2), { "270" } przypadków, osie { "5.1e-13" } względem wartości (<c7/>). <b>MODELLED</b>: redukcje kanionu, sektora i terenu; presety; złożenie geometrii nieba (niebo z presetu, chmura Monte Carlo).

seg-8f5ebce999fe = Z wierszami o zaufaniu geometrycznym, skyline i księżycowej stacji referencyjnej rejestr liczy { "274" } wierszy: { "134" } sprawdzonych względem niezależnego wzorca zewnętrznego, { "136" } obliczonych z modelu, { "4" } partnerskich.

seg-686b1211d7bb = <b>Księżycowa stacja referencyjna: laboratorium czasu stacji</b> (<b>MODELLED</b>). Opcjonalny blok <c1/> w <c2/> (<c3/>). Modeluje zegar stacji (domyślnie klasy miniRAFS, dowolna nazwana klasa albo karta urządzenia dopasowana do podanych punktów stabilności) sterowany do LTC, a następnie swobodnie pracujący lub ponownie sterowany co N sekund. Wystawia krzywą błędu czasu x(t), czas do { "1" }, { "10" } i { "100" } ns (bisekcja obok postaci zamkniętej) oraz dominujący człon dla każdego horyzontu, wszystko z jednostkami. Reszta sterowania jest ILLUSTRATIVE. Tempo LTC nie jest wyprowadzane na nowo i zachowuje swój własny wiersz VALIDATED. Docelowy poziom nanosekund z publicznych materiałów ICG WG-B o księżycowym PNT (czerwiec { "2024" }) jest przytoczony jako stwierdzenie źródła, a nie twierdzenie. Uporządkowanie zegarów optyczny < PHM < RAFS < miniRAFS obowiązuje od { "1" } s do { "7e5" } s, a test przypina przecięcie krzywych PHM i RAFS w pobliżu { "7.5e5" } s. To przecięcie jest własnością modeli zegarów z pojedynczym typem szumu (czysty flicker FM wobec czystego białego FM), a nie wynikiem fizycznym. Bez tego bloku raport, jego tabela i jego podsumowanie pozostają bez zmian. Przykład: <c4/>. Dodaje jeden wiersz rejestru z etykietą MODELLED.

seg-863c2c7a5f0b = <b>Księżycowa stacja referencyjna: geodezja stacji</b> (<b>MODELLED</b>). Opcjonalne dane wejściowe <c1/> i <c2/> w <c3/> dodają blok <c4/>. Informacja o datum w pięciu tablicach z zarchiwizowanego wycinka laserowych pomiarów odległości jest łączona z tym, co wniosłyby dodany retroreflektor i dodana latarnia VLBI w podanych miejscach. Odległość do reflektora mierzy się w zarchiwizowanych epokach, w których jest on widoczny, z ich zarchiwizowanymi wagami. Latarnia używa sieci i harmonogramu <c5/>, ze stałymi stacjami. Blok podaje 1-sigma każdego parametru Helmerta przed i po oraz ich stosunek. Są to granice Craméra-Rao dla zredukowanego zestawu parametrów, na harmonogramie i miejscu ILLUSTRATIVE. Nieobecne lub puste dane wejściowe pozostawiają raport identyczny co do bajta. Przykłady: <c6/> i <c7/>. Dodaje jeden wiersz rejestru z etykietą MODELLED.

seg-45c6febcc7fc = <b>Księżycowa stacja referencyjna: porównanie z opublikowanymi twierdzeniami</b> (<b>MODELLED</b>). Każde twierdzenie liczbowe z pięciu publicznych źródeł jest wymienione z dokładnym brzmieniem, stroną i podanymi założeniami oraz sklasyfikowane jako porównywalne, częściowo porównywalne lub nieporównywalne (<c1/>; źródła z adresem URL, datą pobrania, SHA-256 i licencją w <c2/>). Twierdzenia częściowo porównywalne oceniono według sześciu jednostronnych progów zarejestrowanych wstępnie przed uruchomieniem (<c3/>, rewizja { "2" }, 05bf9a19): { "1" } z { "6" } twierdzeń mieści się w wstępnie zarejestrowanym progu (zarejestrowane wstępnie 05bf9a19). Pokrycie wynosi { "0.00" } wobec >= { "0.95" } na obu kołach południowobiegunowych, a skorygowane p95 wynosi { "280.6" } m wobec <= { "1.5" } m. Przyczyną są elementy orbit satelitów, których żadne źródło nie publikuje: przy elementach ILLUSTRATIVE z repozytorium cztery satelity są we wspólnej widoczności w { "8" } % epok, przy geometrii bliskiej osobliwej. Przebieg nie odtwarza tych twierdzeń na tych elementach i nie jest dowodem, że twierdzenia są błędne. Przypięte w <c4/>. Jeden wiersz rejestru, z etykietą MODELLED i ustaleniem.

seg-2b01d2ccb666 = <b>Księżycowa stacja referencyjna: gotowość danych plików zegarowych</b>. <c1/> podaje teraz system czasu swoich epok. Jest to wartość <c2/> albo, gdy jest nieokreślona, wartość domyślna dla systemu satelitarnego z nagłówka. Wynik mówi też, czy system został zadeklarowany. Funkcja odrzuca nieznany system czasu (na przykład księżycową skalę czasu), plik o niezadeklarowanym mieszanym systemie oraz pliki, które się nie zgadzają, zamiast odczytywać je jako czas GPS. Dostarcza syntetyczny przykład zegara stacji. Nie zdefiniowano formatu pliku poprawek, ponieważ żaden publiczny nie istnieje.

seg-0fb89eb36003 = Zmienione

seg-b63c95f12bc4 = Dokumentacja modułów <c1/>, <c2/> i <c3/> nie nazywa już 17-stanowego nawigatora UKF, ścisłego sprzężenia pełnego INS ani jawnego stanu zegara przyszłą pracą; odsyła do <c4/>, <c5/> i <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } nie jest już odrzucany</b> ({ "0.36" }, WP-07): plik nawigacyjny RINEX { "4" } był wcześniej celowo odrzucany; teraz jest odczytywany (zob. Dodano). Dla plików obserwacji w wersji { "4" } i nowszych etykiety nagłówka są dopasowywane tylko w kolumnach 61-80, aby nowe rekordy dowolnego tekstu nie mogły uchodzić za etykiety.

seg-5829841b58d7 = <b><c1/> odczytuje rzeczywiste pliki IONEX</b> ({ "0.36" }, WP-07): pełny rekord 16 wartości wypełnia kolumny 61-80, które czytnik brał za etykietę, więc zwracał <c2/> dla każdego rzeczywistego pliku IONEX. Teraz odczytuje rekord, którego pole etykiety jest liczbowe, jako wartości. Żaden dostarczany wynik z tego nie korzystał.

seg-a66bd6592b93 = <b>Moce odbierane Galileo E1 i E5a według OS SIS ICD Issue { "2.1" }</b> (rewizja, 2026-10-14). Pasma widma <c1/> i <c2/> oraz ofiary GNSS wśród sygnałów LEO, które biorą z nich swoją moc, używają teraz minimalnych mocy odbieranych z tabeli { "12" } Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (było −{ "157.0" }) i −{ "155.25" } dBW (było −{ "155.0" }).

seg-b0386f62923f = Dziewięć wyników scenariuszy się zmienia: przykłady widma, kampania widma, trzy pionowe zastosowania odporności LEO i trzy projekty sygnałów LEO. Efektywne C/N0 zmienia się o −{ "0.25" } dB, a J/S o +{ "0.25" } dB w tych pasmach.

seg-2af90bfcefae = Każda zmieniona wartość ({ "1766" }, stara → nowa) jest wymieniona w <c1/> i jego CSV wraz z tabelami dokumentacji, które się zmieniły. Żaden wiersz rejestru nie zmienia statusu.

seg-d468174b2d4c = Druga część, tego samego dnia: ofiary wśród sygnałów LEO <c1/> (−{ "155.0" } → −{ "155.25" } dBW, tabela { "12" } E5b) i <c2/> (−{ "152.0" } → −{ "152.24" } dBW). ICD nie ma wiersza dla pełnego pasma E5, więc wartość AltBOC jest sumą mocy sum E5a i E5b z tabeli { "12" }, zbudowaną tak, jak dawną wartość. Trzy wyniki projektów sygnałów LEO się zmieniają ({ "64" } wartości: te moce odbierane i degradacja C/N0 z LEO do GNSS na dwóch ofiarach), wymienione w tej samej rewizji (§{ "5" }) i CSV. Nic więcej się nie zmienia.

seg-a96992246ef8 = <b>Poprawka pływu atmosferycznego S2</b> (<c1/>). Harmoniczne ciśnienia powietrza S2 według Raya ({ "2001" }) są współczynnikami nieznormalizowanego <c2/> z opóźnieniami fazy w kosinusie; używano ich jako w pełni znormalizowanych, z opóźnieniem jako wyprzedzeniem sinusowym IERS. Teraz wchodzą podzielone przez <c3/> z <c4/>; nowe <c5/> odtwarza model A2 z GFZ STR06/01, tabela { "5" }, dla wszystkich { "21" } fal (najgorzej { "0.0005" } cm, { "0.05" }°; VALIDATED). Zmieniają się tylko wyniki z włączonymi pływami: dopasowanie CI Galileo { "0.132" } → { "0.133" } m, składowe Swarm-A o { "1" }–{ "2" } mm (zarejestrowane wstępnie w <c6/>).

seg-6fa076226c01 = Tylko dokumentacja: <c1/>, <c2/> i <c3/> są opisane jako starsze rozwiązania, liczbowo bez zmian, z odesłaniem do <c4/>.

seg-a757fd7ca793 = <b>Stan rundy { "3" } D9 (<c1/>).</b> BIPM Circular T { "465" } ukazał się 2026-10-12. Wstępnie zarejestrowana ocena prospektywna nadal nie została uruchomiona: wydanie { "465" } zawiera około { "285" } wartości testowych, a reguła zatrzymania wymaga { "1000" }, więc około wydań { "465" }–{ "468" }. Uruchomienie wymaga też zarchiwizowanych plików poszczególnych laboratoriów z 2026-09-30, ponieważ BIPM od tego czasu przepisało { "87" } z { "113" }. Wiersz rejestru i nagłówek testu to mówią; test, jego progi i jego podział są bez zmian.

seg-e064546d05ec = <b>Przegląd rzetelności dokumentacji</b> ({ "0.36" }). Mapa drogowa, wiersze możliwości, wiersze statusu dokumentów projektowych i komentarze modułów dostosowano do kodu; wyniki bez zmian. Pozycje już zbudowane, ale nadal wymienione jako otwarte, są teraz oznaczone jako zrobione: kontrole masek ITU-T, scenariusz holdover { "24" } h i wczytywanie dzienników zegara (synchronizacja czasu w telekomunikacji), szybkie starty na pierwszą minutę, Lense–Thirring i porównanie krzyżowe propagatora Orekit, łańcuch GCRS z precyzyjnym ITRF, skróty wzorcowe i międzyplatformowe, pochodzenie, ARAIM z wieloma błędami (ADD v4.2), FDE dla pojedynczego satelity, biblioteka CRPA, granica niejednoznaczności prążków CAI, wymiarowanie streets-of-coverage i widok orbity 3-D, dynamika orientacji bryły sztywnej, zapisywacz OMM i czytnik jąder NAIF, libracja księżycowa DE440, zdanie o znaczeniu przebiegu w playground, <c1/>, 17-stanowy nawigator ze ścisłym sprzężeniem i rodzaj mapy grawitacyjnej. Wiersze podają też dokładnie, co nadal jest otwarte (na przykład dwuczęściowa JD w <c2/>, czytnik <c3/> względem rzeczywistego produktu i wykluczanie wielu satelitów w <c4/>). Brakujący <c5/> napisano na podstawie świeżego uruchomienia jego testów (M1–M4 zaliczone), a robocza wersja walidacji IQ skierowana do partnerów ma aktualne liczby wierszy rejestru.

seg-e2290a640df7 = Kody pamięci Galileo E1 nie są już dołączane.

seg-80f8ca869682 = <c1/> i <c2/> (załącznik C.7/C.8 do ICD) zostały usunięte z repozytorium i pakietów. Warunki ICD (zacytowane w <c3/>) pozwalają użytkownikowi przechowywać kody z podaniem źródła i używać ich w produkcie, ale zezwalają na redystrybucję tylko do celów niekomercyjnych, a Kshana jest oferowana także na licencji komercyjnej. <c4/> / <c5/> zwracają teraz <c6/> i odczytują własną kopię użytkownika z <c7/> / <c8/> albo, w kopii źródeł, z <c9/>, gdzie nowy <c10/> wyodrębnia je z PDF-a ICD (ze sprawdzeniem skrótu). <c11/> / <c12/> zostały usunięte. Bez tablic sygnały Galileo E1 (<c13/>, <c14/>) zwracają błąd, który mówi, jak je dostarczyć, a testy E1 są pomijane z komunikatem. Przy obecnych tablicach każdy wynik E1 jest bez zmian. Żaden scenariusz, wzorzec ani wynik widma nie używa tablic kodów. Wzorce testowe E5a z załączników C.3/C.4 (wyrocznia LFSR w <c15/>) są traktowane tak samo: pobierane tym samym skryptem, ignorowane przez git, a test jest pomijany bez nich.

seg-654d0358137b = <b>Przenośna matematyka wszędzie</b> ({ "0.36" }, STUDIO-15): każda funkcja przestępna <c1/> w bibliotece oraz próbniki rozkładu normalnego, gamma i wykładniczego z <c2/> liczą teraz przez czysto rustowe <c3/> (<c4/>, <c5/>), więc wersja natywna i wersja WebAssembly zwracają identyczne co do bajta wynikowe JSON dla wszystkich { "141" } dołączonych scenariuszy oraz dla krótkiego przebiegu IQ. Kosztem jest to, że ostatnie bity wyników liczonych biblioteką matematyczną hosta się zmieniły: zmieniło się { "98" } ze { "141" } dołączonych scenariuszy, { "43" } się nie zmieniło; { "5" } zmieniło się o więcej niż { "1e-3" } w swoim największym polu, a pozostałe o mniej. Każda zmieniona wartość jest wymieniona jako stara -> nowa w <a1><c6/></a1> (wraz z CSV wszystkich { "136,127" } zmienionych liczb); żaden próg, tolerancja ani wartość graniczna się nie zmieniły. Opublikowane liczby, które się zmieniły: dostępność <c7/> przy zasięgu Ziemi { "0.719" } -> { "0.713" } i błąd RMS { "86.147" } -> { "86.499" } m (jedna epoka na krawędzi dostępności rozstrzyga się teraz wszędzie tak samo; na macOS arm64 wypisywała { "0.725" } / { "85.800" } m); błąd stacji <c8/> { "3.541350" } -> { "3.536885" } m z VLBI i { "2183.558" } -> { "2184.021" } m bez; <c9/>, osiem wartości <c10/> o { "3" } jednostki na ostatnim miejscu (erratum w raporcie technicznym); wydany dokument <c11/> w wielkościach na poziomie podłogi zaokrągleń (osiem wartości poza sześcioma cyframi znaczącymi, do { "6.8e-5" } względem wartości; żadna ranga ani próg się nie zmieniły). Przypięte skróty strażników identyczności co do bajta (<c12/>, <c13/>, <c14/>) przeliczono na nazwany punkt odniesienia "{ "0.36" } portable", a wartości z { "0.35.0" } zachowano jako zapis historyczny; zamrożona prognoza księżycowej stacji referencyjnej jest nietknięta, a jej przenośne ponowne uruchomienie zapisano obok (<c15/>). <c16/> (sprawdzony wiersz księżycowego wspólnego OD): wzorce wyeksportowano ponownie, a porównanie z numpy powtórzono z numpy { "2.4.6" }, zarejestrowaną wersją, skryptem i progiem bez zmian; wszystkie sześć sieci jest zaliczonych (<a2><c17/></a2>). Praca z partii 2-3 włączona po STUDIO-15 również korzysta z przenośnej matematyki ({ "457" } miejsc wywołań w { "62" } plikach); to, co to zmieniło, jest w <a3><c18/></a3>: { "12" } dołączonych scenariuszy (największa zmiana względna { "5.2e-8" }, żadna wypisana wartość się nie zmienia), { "28" } wierszy strażnika skyline zatwierdzonych na nowo, skrót M2M4 w <c19/>, starsze skróty prawdy <c20/>, sigma datum nieobserwowanej latarni ({ "632.3769" } -> { "632.3772" } m) oraz dwa zapisane ustalenia (domknięcia DRO w CR3BP; CRPA A3, { "194" } z { "456" } łączy). Dokładne edf Greenhalla zachowuje swój sprawdzony próg dzięki logarytmowi double-double w jądrze (<a4><c21/></a4>), a wyrocznię test bench gps-sdr-sim uruchomiono ponownie na zmienionych eksportach NMEA, przy czym każdy próg został dotrzymany (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: wiersz zestawu księżycowego podaje poziom dowodowy każdego elementu (wcześniej głosił, że wszystkie są MODELLED).

seg-ffb14764a7a9 = <c1/> zwraca <c2/> (szereg, dziennik siatkowania, system czasu, informację, czy został zadeklarowany, typ rekordu) zamiast krotki <c3/>. Teraz przechodzi z rekordów satelitarnych (<c4/>) do rekordów odbiornika/stacji (<c5/>) o żądanej nazwie.

seg-6777ca96624a = Żaden wskaźnik się nie zmienia, chyba że geometria jest słaba; etykieta jest zawsze zgłaszana. Przy dobrej lub przyzwoitej geometrii (w tym otwartego nieba tylko GPS z { "8" } satelitami) albo nieznanej geometrii (monitor nie działa) każdy wskaźnik jest taki jak w { "0.35" }: <c1/> trzyma wyniki obu przykładowych sesji, a <c2/> każdy zatwierdzony korpus NMEA statku (także jako otwarte niebo tylko GPS) i scenariusze szkolenia załóg przy bajtach z { "0.35.0" } po usunięciu dołączonych kluczy; w dwóch scenariuszach szkoleniowych, w których zagłuszanie pogarsza geometrię, słabe epoki różnią się wyłącznie odjęciem za geometrię. Dziennik ze słabą geometrią traci do { "15" } punktów, których nie tracił w { "0.35" }. Poza tym zamierzone zmiany, wszystkie addytywne: powyższe klucze w wynikowym JSON i pakietach dowodowych (<c3/> bez zmian); schemat linii JSON na żywo przechodzi z { "1.2" } na { "1.3" } (<c4/> dołączone, <c5/> w każdym odjęciu); podsumowanie fragmentu zyskuje <c6/>; telemetria zyskuje szeregi geometrii, pola i etykietę <c7/> tylko dla danych wejściowych, które je niosą, więc strumień lub wynik z { "0.35" } renderuje się co do bajta tak jak wcześniej. <c8/> jest 17. nazwą monitora; jest wymieniana jako ostatnia w <c9/>, gdy podjął decyzję (statek, którego dziennik podaje geometrię; lista z { "0.35" } zachowuje swoją kolejność, a liczba monitorów w podsumowaniu rośnie o jeden) i nie ma wpisu <c10/> (ustawienie go jest odrzucane: jego odjęcie ustawia się w <c11/>).

seg-45b44c851937 = <c1/> nazywał licencję gnss_lib_py Apache-2.0; wydanie { "1.0.4" } jest na licencji MIT.

seg-a1a670a9c63e = Czytnik NMEA odczytuje teraz GSA (krótkie GSA jest ignorowane, nie liczone jako pominięte) i zachowuje elewacje i azymuty GSV, także dla satelitów wymienionych bez sygnału; czytnik UBX zachowuje elewację i azymut NAV-SAT. C/N0 jest odczytywane dokładnie tak jak przedtem.

seg-0bafbea5c75d = <b>Zmiana wyniku: zagłuszacze szerokopasmowe i przemiatane używają teraz Q = { "2" }.</b> Równanie odporności na zagłuszanie używa dla tych zagłuszaczy podręcznikowej poprawki widma rozproszonego Q, tam gdzie używało { "1" }. Q = { "2" } to biały szum nad listkiem głównym z unormowaną mocą sygnału w paśmie; w testach jest przypięte do postaci zamkniętej z <c1/>.

seg-21f31ec302de = <b>Bez zmian:</b> zagłuszacze CW i wąskopasmowe (Q = { "1" }), nierozpoznany typ zagłuszacza (Q = { "1" }, wartość najbardziej szkodliwa) oraz <c1/>.

seg-f362499d2ed0 = <b>Skutek:</b> tam, gdzie działa zagłuszacz szerokopasmowy lub przemiatany, efektywne C/N0 rośnie nawet o { "3.0103" } dB, wyprowadzone progi J/S rosną o { "3.0103" } dB, a promienie odmowy w wolnej przestrzeni maleją o czynnik { "0.7071" }.

seg-088dcd34cc88 = <b>Zmienione dołączone scenariusze:</b> zmienia się { "12" } ze { "144" }, wszystkie zgodnie ze wstępną rejestracją (<c1/>, wyniki w <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: utracone satelity { "26" } → { "0" }, mediana odległości utraty synchronizacji { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: promień odmowy dla dynamiki pętli { "75.2" } → { "53.2" } km;

seg-096a24491872 = oraz kampanie i kontrole krzyżowe widma, które je zawierają.

seg-ecdf60335064 = <b>Dotknięci odbiorcy:</b> rodzaje <c1/>, <c2/>, <c3/> i <c4/>, <c5/> rodzajów widma, krzywa odniesienia MODELLED kampanii IQ i domyślne Q w labfit oraz eksport sceny interop.

seg-89672d99e9e2 = Wtyczka JetBrains: brak przestarzałego lub przeznaczonego do usunięcia API platformy. Pięć okien wyboru używa małego <c1/> z listą rozwijaną zamiast przestarzałego <c2/>; selektory pojedynczego pliku używają konstruktora <c3/> zamiast przestarzałego <c4/>; animacja otwiera się przez <c5/> zamiast <c6/>, które platforma { "2026.3" } przewiduje do usunięcia. Since-build pozostaje { "243" }. IntelliJ Plugin Verifier zgłasza Compatible, bez użycia przestarzałych lub przeznaczonych do usunięcia elementów, dla { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) i { "2026.3" } EAP (IU-263.6259.32); <c7/> domyślnie sprawdza { "2024.3" } oraz każdą listę podaną w <c8/>.

seg-58ee61cbd633 = <c1/> i <c2/> zwracają <c3/>: nieprawidłowa sekcja <c4/> jest błędem przy wywołaniu bezpośrednim, jak już było przez <c5/>, zamiast cichego powrotu do płaskiej maski. <b>Zmiana łamiąca</b> dla wywołujących te dwie funkcje z Rusta.

seg-9b4113258e1e = <b>Punktacja kampanii: rzeczywisty fałszywy zaczep trackera nigdy nie był liczony</b> (<c1/>). Kontrola fałszywego zaczepu trackera przenosi kanał z LOCKED do LOST w chwili zadziałania. Punktacja oznaczała natomiast następną aktualizację kanału, która była już niezaczepiona i dlatego nigdy nie była liczona. Zdarzenie <c2/> zgłoszone z LOCKED jest teraz jednym epizodem w swoim czasie, w przebiegu i w każdym podanym zdarzeniu, które je zawiera. Zdarzenie znalezione podczas wciągania albo powtórzone przez kanał już LOST nie jest nowym epizodem. Nowy test wymusza rzeczywisty fałszywy zaczep: prawidłowa nośna GPS L1 C/A przesuwana skokiem o 1/(2T) w stanie zaczepienia (<c3/>).

seg-ac508954b6a6 = W kampanii odniesienia z <c1/> zmienia się tylko PRN { "11" } dla ramp/agc-3bit (epizody fałszywego zaczepu { "0" } → { "1" }, { "426" } i { "437" } na godzinę zaczepienia).

seg-cfc47d9d9237 = Jego DIGESTy komórek zostały przypięte na nowo.

seg-fcfa0de18b05 = Wstępnie zarejestrowane przypięcie ocenionych wyników pozostaje aktywne i nadal odtwarza się dokładnie: w jego haszu tylko te sześć pól, zmienionych przez tę poprawkę wprowadzoną po rejestracji, jest odwzorowanych z powrotem na wartości sprzed poprawki. Poprawione wartości są przypięte osobno.

seg-b96d34bb1d36 = Żaden próg nie został zmieniony i żaden wiersz VALIDATED, żadna wartość ani liczba w sieci się nie zmieniły.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: latarnia bez obserwacji jest teraz zgłaszana</b> (znaleziono w MR-05). Raport zyskuje <c1/> i <c2/> tylko wtedy, gdy jakaś latarnia nie ma obserwacji, a wtedy sigmy obserwowanych latarni pochodzą z ich własnej informacji zamiast być wszystkie puste. Datum jest bez zmian i żaden domyślny, dołączony ani opublikowany wynik się nie zmienia (<c3/>).

seg-c223c1fc1323 = <b>Księżycowy układ osi głównych</b> (<c1/>, używany przez <c2/> i dopasowanie LRO): przesunięcie DE421 od średniej Ziemi do osi głównych z <c3/> było zastosowane w złym kierunku i z błędną kolejnością kątów Eulera, więc analityczny układ PA leżał około { "208" }″ od PA zamiast na nim. Jest teraz przepisane tak, jak definiuje je Frames Required Reading SPICE, i zgadza się z SPICE <c4/> do { "2.6e-16" } rad; analityczny układ PA jest { "6" }″ do { "8" }″ od PA z DE440 (zarejestrowane wstępnie e1ead19b, zarejestrowane ponownie be33382e po tym, jak pierwsza proponowana zmiana nie spełniła progu { "1e-12" }; <c5/>). Opublikowane liczby, które się zmieniają: dopasowanie LRO (<c6/>) nakładanie surowe { "53.8" } → { "39.9" } m, dynamiczne { "12.6" } → { "12.05" } m, zredukowane dynamicznie { "6.65" } → { "6.67" } m (progi bez zmian). Stos analityczny zgadza się teraz z walidacją krzyżową ANISE klasy DE ({ "12.0" } / { "6.67" } m) na obu poziomach; wcześniejsza luka na poziomie dynamicznym była tym błędem.

seg-ef2b49d4ad48 = <b>Serwer MCP odrzuca <c1/></b> (dalszy ciąg CAP-06b). Ścieżka kafla terenu dla rodzaju jamming jest teraz w <c2/>. Powierzchnia wbudowana odrzuca scenariusz, który ją wskazuje, komunikatem niezawierającym ani ścieżki, ani błędu systemu operacyjnego. Test strażnika źródeł plikowych oznacza teraz także pola kończące się na <c3/>.

seg-ef005d2e3d42 = <c1/> z ułamkową częścią dnia gubiło ułamek w konwersjach UTC, TAI, UT1 i obrotu Ziemi (jedna godzina części dnia obracała Ziemię błędnie o { "15" }°); część dnia jest teraz normalizowana do liczby całkowitej. Nie dotknęło to żadnego wywołującego z silnika: każdy przekazuje dzień całkowity, a każdy dostarczany wynik jest identyczny co do bitu.

seg-144d90307ec6 = Planowane

seg-7ef4cd25cb87 = Geometria z podanego skyline ({ "0.36" }, punkt { "1" }, teraz w silniku jako <c1/>): <c2/> i <c3/> ze skyline, gdy dane wejściowe go podają (luka azymutu jako rozwiązanie zastępcze), zdarzenie naturalnej degradacji (fiord lub terminal) w <c4/> oraz dwie zamaskowane geometrie z noty projektowej w wierszu sigma_UERE x DOP, zarejestrowane wstępnie jako uzupełnienie.

seg-49481d2fdf31 = Geometria dla dzienników RINEX z nawigacją (z własnego rozwiązania silnika) i dzienników Androida (z wierszy <c1/>); oba odczytują dziś <c2/>. Geometria w <c3/> (wersja { "1" } bez zmian w { "0.36" }) oraz integracje z Signal K i OpenCPN.

seg-57df1332ff87 = Istniejąca wcześniej luka, niewprowadzona w { "0.36" }: gdy pole SNR każdego satelity jest puste, nie zadziała ani <c1/>, ani odjęcie za C/N0; całkowita utrata sygnału jest widoczna tylko przez <c2/> monitora geometrii (klasa <c3/>). Odjęcie za nią jest planowane.

seg-a5a7a10ee11c = Strumień schematu { "1.3" } w zewnętrznych wyroczniach telemetrii (parser formatu tekstowego Prometheus i kolektor OTLP), które dziś obejmują tylko strumienie { "1.2" }.

seg-caa1977b5b5e = Przeszkoda dwustronna (kanion lub wąski fiord) jest odczytywana jako utrata sygnału, a nie zablokowane niebo, dopóki skyline nie zostanie zintegrowany.

seg-4bd0f178ca4e = Fragment wymieniający klientów AI osób trzecich pominięto tutaj; znajduje się w <a1>CHANGELOG.md</a1> na GitHubie.

seg-b2689beaba9e = Weryfikator Galileo OSNMA

seg-d16c9b4bf537 = <b>Nowy moduł <c1/> i <c2/>: otwarty, czysto rustowy weryfikator OSNMA Galileo po stronie odbiornika.</b> Odczytuje strony I/NAV i zgłasza, dla każdego satelity i epoki, czy dane nawigacyjne są uwierzytelnione, wraz z przyczyną każdej porażki lub opóźnienia: parsowanie HKROOT i MACK, ponowne składanie DSM-KROOT i DSM-PKR, weryfikacja klucza publicznego drzewem Merkle'a, weryfikacja łańcucha kluczy TESLA, weryfikacja MACSEQ i znaczników dla ADKD { "0" }, { "4" } i { "12" } z uwierzytelnianiem krzyżowym oraz wynik w kształcie <c3/> dla monitora zaufania do odbiornika. Wynik niesie uwagę doradczą, że status nie jest usługą integralności nawigacji. <c4/> podaje, co jest, a co nie jest weryfikowane, wymóg czasowy oraz to, że Kshana nie przyznaje żadnych praw w ramach IPR ICD OSNMA UE (użytkownicy opierają się na autoryzacji z załącznika E do ICD). Zaimplementowane względem SIS ICD Issue { "1.1" } i Receiver Guidelines Issue { "1.3" }. Strony są sprawdzane CRC, a strumień bajtów UBX-RXM-SFRBX z u-blox można odczytać bezpośrednio (<c5/>). Testy domyślne używają danych syntetycznych i opublikowanych testów znanych odpowiedzi dla prymitywów; opcjonalny test odczytuje lokalnie pobraną kopię oficjalnych wektorów. Po niezależnym przeglądzie weryfikator bierze czas tylko ze zweryfikowanych kluczy TESLA (sfałszowana podramka z dalekiej przyszłości nie może już skasować porażki), pozwala uwierzytelnieniu wygasać i podążać za używanym IODnav, uwzględnia zweryfikowane komunikaty alarmowe (których liść Merkle'a obejmuje teraz losowe pole NPK) i status NMA "don't use", trzyma znaczniki zastępcze poza statusem satelity, prowadzi łańcuchy według CID z unieważnianiem i odnawianiem, sprawdza hasz dopełnienia KROOT oraz ogranicza długości ramek UBX i nakład weryfikacji TESLA. Satelita jest uznawany za uwierzytelnionego tylko dopóty, dopóki najnowsze dane efemeryd i zegara, które nadaje, są co do bitu danymi, które zostały uwierzytelnione (nie tylko pod tym samym IODnav), status lub unieważnienie z nieuwierzytelnionego nagłówka NMA liczy się tylko wtedy, gdy zgadzają się dwa satelity albo niesie je zweryfikowany KROOT, odtworzony starszy KROOT nie może zastąpić łańcucha, a zatrzymany strumień kluczy jest zgłaszany.

seg-3e7df5c888ca = Dodano (kanały serwera MCP)

seg-4e70d8b85211 = <b><c1/>, strumieniowy HTTP, hostowany samodzielnie.</b> Domyślnie pętla zwrotna; adres inny niż pętla zwrotna wymaga <c2/> i tokenu bearer w <c3/>; żadne narzędzie nie czyta ani nie zapisuje ścieżki (narzędzia plików IQ są wyłączone); limity rozmiaru żądania, czasu i współbieżności; brak nagłówka CORS; kontrole Host i Origin. Kshana nie hostuje żadnego punktu końcowego (<c4/>, z szablonami dla Dockera, Fly.io i Cloud Run).

seg-c392cde151c9 = Dodano (powierzchnie)

seg-19ab5c068b6e = <b><c1/> w Pythonie i WebAssembly.</b> Weryfikator stojący za <c2/> na bajtach w pamięci, zwracający JSON, który wypisuje <c3/> (uwaga doradcza w polu <c4/>; tylko status uwierzytelnienia, nie usługa integralności nawigacji). Te same odmowy co w wierszu poleceń. Nie w MCP: dane wejściowe to długi surowy strumień odbiornika, lepiej obsługiwany przez CLI i Pythona. Mówią o tym <c5/> i <c6/>.

seg-6128929994b4 = <b><c1/> w WebAssembly, Pythonie i MCP, z poleceniem wtyczki i akcją JetBrains.</b> Renderuje strumień zaufania lub wynik <c2/> jako tekst Prometheus, linie syslog CEF lub LEEF albo ładunek JSON OTLP, kodekami, których używa <c3/> (<c4/>); bez gniazda i bez zegara. Wtyczka: <c5/> i umiejętność <c6/>. JetBrains: Render Trust Telemetry. Funkcje <c7/> i <c8/> oraz serwer MCP włączają teraz także <c9/>, co nie dodaje żadnego crate'a.

seg-83d01411c6d4 = <b>Przegląd parytetu.</b> Akcje JetBrains Validate Scenario, List Scenario Kinds i Assess Receiver Stream; <c1/> wymienia teraz <c2/>, <c3/>, <c4/> i <c5/>; notatnik <c6/> (mapowanie compliance i eksport test bench); a każda pozostała komórka JetBrains "CLI only" w <c7/> jest teraz jawnym N/A z uzasadnieniem.

seg-062ef0cf7ee7 = Dodano (pakiety dowodowe)

seg-9889575c2df1 = <b><c1/> i <c2/>: podpisane, weryfikowalne pakiety dowodowe dla zdarzenia zaufania do GNSS.</b> Pakiet zawiera surowy fragment dziennika i SHA-256 całego dziennika, konfigurację z każdym progiem, wyniki i przyczyny dla poszczególnych epok, wersję silnika, manifest powiązany łańcuchem haszy i samodzielne podsumowanie HTML, podpisane Ed25519 (kluczem z <c3/> albo z własnego pliku; klucze nigdy nie są przechowywane w pakiecie, a <c4/> jest ignorowane przez git). <c5/> sprawdza każdy hasz, łańcuch i podpis i wskazuje dokładnie, co zawodzi; z <c6/> przypina podpisującego. Można dołączyć token RFC { "3161" }, który jest odczytywany i wiązany z manifestem (własny podpis urzędu nie jest sprawdzany przez tę wersję; obejmuje go <c7/>). Fragment dziennika to dokładne bajty okna tam, gdzie czytnik zgłasza zakresy źródła (NMEA, UBX, RINEX { "3" }, Android), a w przeciwnym razie cały dziennik, i manifest mówi, który przypadek zachodzi. Tworzenie i weryfikacja to czyste funkcje publiczne (<c8/>), które budują się dla <c9/>. Pakiety stwierdzają, że są zapisem technicznym, a nie opinią prawną. Nowe zależności to drzewo <c10/> (BSD-3-Clause i Apache-2.0/MIT, minimalne funkcje) oraz bezpośrednie <c11/> (już w tym drzewie) do zerowania materiału kluczowego. Zob. <c12/>.

seg-280fd37126c1 = Dodano (telemetria zaufania)

seg-ebd269c618b0 = <b><c1/>: zaufanie do GNSS jako źródło telemetrii bezpieczeństwa.</b> Czyta strumień zaufania dla poszczególnych epok (linie JSON: wskaźnik 0-100, pasmo, przyczyny) albo wynik wsadowy <c2/> i zasila punkt końcowy Prometheus <c3/> (domyślnie localhost), zdarzenia syslog w CEF lub LEEF w kopercie RFC { "5424" } (UDP lub TCP) oraz, za domyślnie wyłączoną funkcją <c4/>, eksport JSON OTLP/HTTP. Dostarczanie działa na wątkach roboczych z limitami czasu połączenia i zapisu, ograniczonym wycofywaniem ponownych połączeń i licznikiem <c5/>, więc martwy lub zawieszony kolektor nie może zatrzymać oceny na żywo ani zamrozić <c6/>; etykiety przyczyn są ograniczone do { "64" } szeregów. Bez nowych zależności. Przykładowy pulpit Grafana jest w <c7/>. Nazwy metryk, etykiety i odwzorowanie pól CEF/LEEF są w <c8/>. Format strumienia jest wyizolowany w <c9/>.

seg-fa5e803edb44 = Zaufanie morskie: wskaźnik zaufania 0-100 na żywo dla pozycji poruszającego się statku, z NMEA { "0183" }, które odbiornik już wysyła, z opcjonalną bramką.

seg-c5b3fcb9bba8 = <c1/> przyjmuje tabelę <c2/> (<c3/> lub <c4/>, maksymalna prędkość statku, przyspieszenie i prędkość zwrotu, wysokość anteny nad linią wodną i opcjonalny czujnik kursu; każda wartość domyślna udokumentowana wraz z uzasadnieniem). Dla statku statyczny monitor skoku pozycji, który mierzy odległość od średniej kalibracyjnej i jest błędny na płynącym statku, zostaje zastąpiony przyczynowymi monitorami platformy w ruchu: spójnością kinematyczną pozycji względem zgłoszonej prędkości i kursu oraz względem limitów statku, kursem żyrokompasu względem kursu nad dnem, logiem prędkości względem prędkości nad dnem, wysokością anteny względem podanej wysokości nad linią wodną, zapadaniem się i jednoczesnym wzrostem rozrzutu C/N0 względem punktu odniesienia z kalibracji oraz spójnością czasu (w trybie na żywo także względem zegara tego komputera). Odczytuje też zgłoszony status uwierzytelnienia, ogólny lub dla poszczególnych satelitów (tylko zgłoszony status: bez kryptografii OSNMA). Każdy próg jest podany w tabeli <c5/> przed uruchomieniem. Każda epoka dostaje wtedy wskaźnik od { "0" } do { "100" } według deterministycznego, wstępnie zarejestrowanego odwzorowania (bez uczenia, nic nie jest dopasowywane do zdarzeń; wagi, granice pasm i dowody zawiera tabela <c6/>), odwzorowany na istniejące stany zaufania, wraz z monitorami, które odjęły punkty, i ich punktami. Scenariusze statyczne są bez zmian i mają te same skróty co wcześniej. <c7/> czyta stdin, dopisywany plik, TCP lub UDP i zapisuje jedną linię JSON na epokę oraz własnościowe zdanie <c8/>; z <c9/> przepuszcza strumień bez zmian, dopóki pozycja jest zaufana, a oznacza pozycję jako nieważną (jakość GGA { "0" }, status RMC i GLL <c10/>, tryb GNS i VTG <c11/>), gdy nie jest. Bramka jest wyłączona, chyba że się o nią poprosi; <c12/> udostępnia strumień po bramce dowolnej liczbie klientów TCP (domyślnie pętla zwrotna, wolny klient jest odrzucany, zamiast blokować innych). To oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }); operator nadal ponosi odpowiedzialność. <c13/> to syntetyczny dziennik Tallinn–Helsinki, zapisany tylko jako tekst, z oderwaniem pozycji w połowie drogi, podczas którego odbiornik nadal zgłasza ważną pozycję; jego oczekiwany wynik jest przypięty testem. Przewodnik: <c14/>. Kontrole nie widzą spoofera, którego pozycja jest spójna ze wszystkim na magistrali; przewodnik to mówi.

seg-80f3f0aae42c = Mapa zakłóceń

seg-8539a42718cb = <b><c1/> i <c2/>: publiczny obraz tego, gdzie statki powietrzne i statki zgłaszały pogorszone dane nawigacyjne, i jak duży fragment trasy to obejmuje.</b> Dane wejściowe to lokalne pliki CSV sporządzone z otwarcie licencjonowanych danych ADS-B (adsb.lol, ODbL { "1.0" }) i AIS (NOAA MarineCadastre, Kystverket na NLOD { "2.0" }); każdy plik wyjściowy to jedno źródło i jedna doba UTC w GeoJSON z metodą, jej progami, licencją danych, atrybucją i obciążeniem pokrycia źródła. Metoda ADS-B agreguje NIC i NACp na stałej siatce i uznaje komórkę za pogorszoną na podstawie udziału odrębnych statków powietrznych, z zabezpieczeniami dla sprzętu, który nigdy nie zgłasza dokładności, dla niskiej wysokości i dla przyczyn o szerokim zasięgu. Metoda AIS uruchamia pięć detektorów: pozycje na lądzie (względem linii brzegowej dostarczonej przez użytkownika), tory kołowe, nieprawdopodobne skoki, nieprawdopodobne prędkości i wiele statków w jednej pozycji. Progi są wstępnie zarejestrowanymi stałymi nazwanej wersji metody. Tylko agregaty: identyfikatory są haszowane w pamięci i nigdy nie zapisywane, a komórki z mniej niż { "5" } odrębnymi statkami powietrznymi lub statkami nie są publikowane. Pogorszona komórka nie jest stwierdzeniem zakłóceń. Polecenia domyślne nie używają sieci; opcjonalny pomocnik <c3/> pobiera wielokąty lądu Natural Earth z adresu przypiętego do commitu i zachowuje plik tylko wtedy, gdy jego SHA-256 się zgadza. Dane ADS-B to CSV albo bezpośrednio pliki historii readsb z adsb.lol (nowa zależność: <c4/> z czysto rustowym backendem, dla gzip). Obie metody są w wersji { "2" }: wywołanie pogorszone lub anomalne wymaga co najmniej { "5" } statków powietrznych lub statków (minimum publikacji), każda liczba w komórce poniżej { "5" } jest wstrzymywana jako <c5/>, a doba, której tła nie da się oszacować, wstrzymuje swoje wywołania. Pliki wyjściowe są nazywane <c6/> i nigdy nie są nadpisywane; dane wejściowe są strumieniowane linia po linii; ekspozycja trasy obsługuje antypołudnik. Testy używają wyłącznie danych syntetycznych. Zob. <c7/> oraz przegląd licencji w <c8/>.

seg-7a54dfab93dc = Dodano (strumienie szkoleniowe)

seg-0b01d1d871e2 = <b><c1/>: syntetyczne NMEA { "0183" } mostka do szkolenia załóg w rozpoznawaniu zagłuszania i spoofingu GNSS.</b> Ze scenariusza TOML zapisuje plik albo nadaje strumień przez TCP lub UDP (unicast lub broadcast; w czasie rzeczywistym, przyspieszonym albo tak szybko, jak się da), pełny zestaw mostka GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT i VBW dla toru statku z ograniczeniami prędkości zwrotu, przyspieszenia i prądu, z geometrią satelitów z własnych nominalnych konstelacji silnika. Zdarzenia skryptowane na osi czasu: zagłuszanie, oderwanie pozycji (ważne rozwiązanie, które się oddala), spoofing czasu i opóźnienie odtwarzania, każde z rampami narastania i ustępowania. Dziennik instruktora (JSON i tekst) zapisuje, co i kiedy wprowadzono, z torem prawdziwym obok zgłoszonego. Biblioteka w <c2/> (zagłuszanie na otwartym morzu, oderwanie przy brzegu, spoofing czasu przy podejściu do portu, połączony) zawiera notatki dla trenera. Wynik ma poprawne sumy kontrolne i jest deterministyczny dla każdego ziarna; testy przypinają wzorcowy fragment dla każdego scenariusza i odczytują każde zdanie czytnikiem NMEA z <c3/>. Tylko tekst: bez wyniku RF, IQ ani przebiegu; strumienie służą do szkolenia i testów i nigdy nie wolno ich podawać do działających systemów nawigacyjnych statku. Zob. <c4/>.

seg-bb8d508c92fa = Integracje morskie ({ "0.35.0" }, ścieżka robocza B)

seg-538cdf145ac1 = <b>Wtyczka Signal K</b> (<c1/>, nieopublikowana w npm): uruchamia <c2/> albo się z nim łączy (własne wejście NMEA serwera, niestandardowe argumenty wejścia, kanał TCP z liniami JSON albo zdania <c3/> ze strumienia bramki), publikuje wskaźnik zaufania, pasmo, przyczyny, alarmy i stan bramki pod <c4/> (w tym pozycję zgłaszaną przez odbiornik jako kontekst, nigdy jako <c5/>) i podnosi powiadomienie Signal K (<c6/> przy pogorszeniu, <c7/> przy braku zaufania, z progami utrzymania, zniesienia i nieaktualności, wszystkimi w schemacie konfiguracji). Bez zależności npm. Przetestowano na zarejestrowanym wyniku syntetycznym.

seg-b6eb7110291e = <b>OpenCPN</b>: NMEA w trybie bramki jest udostępniane bezpośrednio przez <c1/> (zalecane); przekaźnik TCP bez zależności (<c2/>) to opcjonalna alternatywa. Tak czy inaczej OpenCPN widzi nieważną pozycję, gdy zaufanie się załamuje, i <c3/> w swoim oknie debugowania NMEA; testy odtwarzają syntetyczny strumień po bramce przez prawdziwe gniazdo TCP i sprawdzają, co otrzymuje odbiorca. Natywna wtyczka panelu wskaźnika (<c4/>, API wtyczek { "1.18" }, CMake) czyta <c5/> z własnego strumienia NMEA OpenCPN i alarmuje w paśmie braku zaufania; buduje się, jej logikę przetestowano jednostkowo i uruchomiono ją w OpenCPN { "5.8.4" } na wirtualnym ekranie (dowody i skrypt odtworzenia w <c6/>); nie jest spakowana dla menedżera wtyczek.

seg-bb26e8c1aff0 = <b>Budowa referencyjna</b> (<c1/>): ogólna lista części, konfiguracja systemu operacyjnego, jednostki systemd dla monitora doradczego i opcjonalnej bramki (sprawdzane przez <c2/> za pomocą <c3/>), opcja kontenera, okablowanie Signal K.

seg-6695d4c1f13b = Wtyczka Signal K przyjmuje schemat JSON na żywo { "1.2" } (dołączony klucz <c1/>, potem <c2/>; nieznane dołączone klucze są ignorowane), sprawdzona na rzeczywistym wyniku { "1.2" } i względem rzeczywistego signalk-server.

seg-622c2d3dd8fa = Poprawki po przeglądzie: jednostki systemd zawsze się restartują i działają w piaskownicy (bez powłoki, bez sieci tam, gdzie nie jest potrzebna), fragment logrotate, <c1/> kończy się niepowodzeniem przy każdym znalezisku; kontener uruchamia bramkę ze zmiennych środowiskowych z kontrolą stanu i obrazami bazowymi przypiętymi skrótem; metadane wskaźnika Signal K, nieaktualne powiadomienie jest zastępowane po wznowieniu danych, błędy procesów potomnych są zachowywane, a zabijanie eskaluje, niebezpieczne <c2/> są odrzucane, a powiadomienie jest pod <c3/>; przekaźnik ogranicza przechowywaną niepełną linię; parsery <c4/> odrzucają wskaźniki spoza zakresu od { "0" } do { "100" }; kontrola odnośników w dokumentacji; przepływ CI (<c5/>) uruchamiający to wszystko, łącznie z prawdziwym plikiem binarnym od końca do końca.

seg-7c615a62ca26 = <c1/>. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt z zatwierdzeniem typu; operator nadal ponosi odpowiedzialność. Wyłącznie oprogramowanie: nic nie nadaje i nie podaje się żadnej wartości detekcji ani fałszywych alarmów.

seg-72cb9f45ce99 = Dodano: mapowanie compliance i eksport test-bench

seg-15aae04a9490 = <b><c1/> i <c2/>.</b> Odwzorowanie wyników Kshana na pięć ram i norm odporności (amerykański DHS Resilient PNT Conformance Framework v2.0, wytyczne IMO dla statków, wytyczne EASA dla lotnictwa, NIS2 art. { "21" }, EN { "16803" }, płatna norma cytowana według części i kilku numerów klauzul widocznych w tekście katalogu), jedna tabela na ramę: odniesienie, czego wymaga w naszym streszczeniu, wyniki, które dostarczają dowodów na (supports evidence for) to wymaganie, oraz luka. Wersje źródeł, adresy URL i to, co przeczytano, a czego nie, są zapisane. <c3/> wypełnia odwzorowanie z podanych przebiegów i oznacza każdy wiersz jako <c4/>, <c5/>, <c6/> lub <c7/>, w Markdown i JSON, z luką zachowaną w każdym wierszu. Sformułowanie to „dostarcza dowodów na” (supports evidence for); nic nie jest oceniane ani zatwierdzane. Testy używają przebiegów syntetycznych i kończą się niepowodzeniem, gdy zatwierdzona tabela rozjeżdża się z kodem.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Zapisuje ruch pojazdu i zdarzenia scenariusza <c2/>, <c3/> lub <c4/> dla laboratoryjnego symulatora GNSS: plik CSV ruchu użytkownika z udokumentowanymi układami i plik metadanych obok, NMEA { "0183" } <c5/>/<c6/>, tekst punktów trasy oraz zdarzenia jako CSV i jako bloki <c7/> <c8/> (<c9/>). Tylko ruch i zdarzenia: nie zapisuje się żadnego sygnału. Każdy plik jest odczytywany z powrotem w <c10/> i porównywany w granicach podanej tolerancji. <a1><c11/></a1> podaje metodę odtwarzania eksportu przez symulator i oceniania dziennika odbiornika za pomocą <c12/>.

seg-fc0fe915ed3d = <b>Co liczy się jako dowód.</b> Wynik liczy się dla danej możliwości tylko wtedy, gdy niesie pola, które zapisuje jego rodzaj; sama etykieta rodzaju nie znaczy nic. Nieznane rodzaje, wynik niezgodny ze swoim scenariuszem siostrzanym, hasze nieszesnastkowe i źle sformowane liczby zaufania do odbiornika są wymienione jako niewykorzystane, wraz z przyczyną. Raport ucieka komórki Markdown i nie może spanikować na haszu spoza ASCII. <c1/> i <c2/> przyjmują teksty, a nie ścieżki.

seg-6b46de1164d8 = Eksport test-bench.

seg-c48a4dd4134b = <c1/> jest sprawdzane pod kątem zakresu (<c2/>); plik punktów trasy sprawdza każdy przedział, a polecenie podaje przyczynę, gdy go pominie; dokumentacja stwierdza, że kurs <c3/> to odchylenie korpusu, a nie kurs nad dnem, pola zastępcze <c4/> oraz własną zmianę wysokości scenariusza. <c5/> i <c6/> są w tekście użycia.

seg-eb2e415ec540 = <c1/> udostępnia historię prawdziwego stanu profilu jazdy <c2/> (ten sam krok, którego używa własna prawda tego rodzaju), a <c3/> zyskuje pola daty i czasu NMEA.

seg-fbfc1a59e99b = Walidacja mapy zakłóceń

seg-a68d88381eea = <b>Semantykę dekodowania i geometrię mapy zakłóceń sprawdzono względem niezależnych implementacji na danych syntetycznych.</b> Znaczenia kodów NIC i NACp względem dekodowania syntetycznych ramek ADS-B przez pyModeS, wartości „niedostępne” AIS względem dekodowania syntetycznych zdań AIVDM przez pyais, przypisanie komórek siatki względem shapely, długość trasy w komórce według stanu względem shapely i GeographicLib oraz maskowanie lądu względem shapely i pyproj, każde do tolerancji ustalonej przed pierwszym porównaniem (<c1/>). To sprawdza, jak odczytywane są kody i wartości pól oraz geometrię, a nie to, że oznaczona komórka jest zakłóceniem. Czytnik wielokątów lądu zamyka teraz pierścień, który nie powtarza swojego pierwszego wierzchołka, a który wcześniej odczytywał bez ostatniej krawędzi. Dokumentacja podaje niskie progi dokładności NACp i NIC jako granicę, którą reprezentuje każdy kod (NACp { "6" } to granica EPU { "556" } m, NIC { "5" } to granica zawierania { "1" } NM).

seg-cf4ffdbba1a6 = Dodano (walidacja formatów telemetrii i pakietów dowodowych)

seg-ad6730e0e891 = <b>Zewnętrzne kontrole kryptografii pakietów dowodowych, weryfikatora pakietów i formatów przewodowych telemetrii.</b> Wektory testowe Ed25519 z RFC { "8032" }, sekcja { "7.1" } ({ "1" }, { "2" }, { "3" } i { "1024" }) oraz przykłady SHA-256 z FIPS 180-4 przechodzą przez własne funkcje podpisywania, weryfikowania i haszowania pakietu, do dokładnej równości. Weryfikator napisany w Pythonie wyłącznie na podstawie części normatywnej <c1/> (hashlib i <c2/>) zgadza się z weryfikatorem w Ruście na { "71" } nienaruszonych i naruszonych pakietach: werdykt, zbiór błędów, werdykt podpisu i oba nagłówki łańcucha. Nasza ekspozycja Prometheus jest odczytywana przez parser oficjalnego klienta Pythona, a nasz JSON OTLP przez oficjalny komunikat <c3/>, ściśle, i oba zgadzają się ze stanem, z którego powstały. CEF i LEEF nie mają niezależnego otwartego walidatora i pozostają tylko obliczone z modelu. <c4/> zyskało normatywny format pakietu i procedurę weryfikacji, z których napisano weryfikator w trybie clean-room; <c5/> zyskało <c6/>. Wyrocznie i wzorce: <c7/>, <c8/> z <c9/>, <c10/>; testy <c11/>, <c12/> i <c13/>. CI nie potrzebuje Pythona.

seg-20d1b02bfda4 = Dodano (walidacja zdarzeń CEF)

seg-8c464e43e43d = Zdarzenia CEF telemetrii są poprawnie odczytywane z powrotem przez dwa niezależne parsery open source.

seg-a6321d13b0ab = <c1/> { "1.11" } i kodek CEF Logstash (<c2/> { "6.2.7" } w Logstash { "8.15.3" }) parsują { "157" } linii CEF (każdą zmianę pasma i każdą epokę zatwierdzonego strumienia telemetrii, a także tekst przeciwnika zawierający <c3/>, ukośniki wsteczne, kreski pionowe, podziały wierszy, tabulatory i tekst wielobajtowy) i odzyskują każde pole nagłówka, ważność, dokładny zbiór kluczy rozszerzenia i każdą wartość dokładnie. Kodek Logstash odczytuje też cztery linie, których tekst nagłówka wymaga ucieczki, czego <c4/> nie potrafi. Próg zarejestrowano przed uruchomieniem któregokolwiek parsera (<c5/>); wzorce w <c6/>, skrypty wyroczni <c7/> i <c8/>; CI nie potrzebuje ani Pythona, ani Logstash. LEEF nie ma utrzymywanego otwartego parsera i pozostaje tylko obliczony z modelu. Zdarzenia CEF niosą teraz wskaźnik zaufania i przesunięcie epoki w polach niestandardowych zmiennoprzecinkowych ze słownika CEF (<c9/>, <c10/>) zamiast w polach całkowitych <c11/> i <c12/>, które nie pasowały do żadnej z tych wartości; CEF jest nowy w tym wydaniu, więc nic z dostarczonego się nie zmienia.

seg-65b362fa8711 = MCP: <c1/> przyjmuje dziennik jako <c2/> lub <c3/>; dane wejściowe narzędzia są ograniczone do { "4" } MiB.

seg-8999974aa1fa = Wykres zagłuszania również bierze kolory z palety.

seg-8c8ff384dbf6 = <c1/> był jedynym modułem, który rewizja palety Observatory zostawiła przy własnych kolorach, gdy lądowały prace nad Q zagłuszacza; jego <c2/> (scenariusze rodzajów <c3/>, <c4/> i innych <c5/>) odczytuje teraz <c6/>, a lista dozwolonych w <c7/> jest pusta. Tylko kolory i czcionka: wykresy <c8/> i <c9/> są równe swoim wcześniej zarejestrowanym renderom po znormalizowaniu koloru, <c10/> i stopki z wersją. Żadna wykreślona wartość się nie zmieniła. Zarejestrowane kopie Studio w <c11/> zarejestrowano ponownie przy portowaniach { "0.33.0" } i { "0.34.0" } (tylko stempel wersji): nadal niosą dawne kolory wykresu zagłuszania i przejmą kolory z palety przy następnym portowaniu.

seg-a059d10c5330 = <b>Granica 3-sigma zespołu zegarów obejmuje teraz podłogę flicker, a kontrola stanu filtra ją widzi.</b> Przy <c1/> zegar prawdziwy niósł flicker FM, ale dwustanowy filtr dostarczający granicę integralności nie, więc pokrycie 3-sigma dla dostarczanego scenariusza <c2/> wynosiło { "0.41" } (klasyczny) i { "0.33" } (kwantowy), a kontrola NIS/NEES, która czerpała swoją prawdę z modelu filtra, zgłaszała identyczne wartości z podłogą i bez niej. Granica to teraz wariancja dwustanowa plus dokładna wariancja fazy flicker zgromadzonej od ostatniej synchronizacji, obliczona z tego samego banku, z którego korzysta zegar prawdziwy; kontrola NIS/NEES czerpie prawdę z modelu rozszerzonego z tym bankiem i uruchamia dopasowany filtr rozszerzony (a filtr dwustanowy wobec prawdy z flickerem zgłasza <c3/>). Zmiana wyniku, tylko dla zegarów z niezerowym <c4/>: <c5/> w <c6/> przechodzi z { "0.40866" } / { "0.33026" } na { "0.99970" } / { "1.0" } (klasyczny / kwantowy), a NIS/NEES z <c7/> zawierają teraz flicker; błąd czasu, <c8/> i <c9/> są bez zmian, a scenariusze bez podłogi są identyczne co do bajta. <c10/> (rodzaj orbity, ziarno { "7" }, podłogi { "1e-16" } / { "2e-11" }) także się zmienia: <c11/> klasyczny { "0.7734" } na { "1.0" } i kwantowy { "0.9796" } na { "1.0" }, a NIS/NEES z <c12/> i ich pasma się zmieniają. Jego kwantowe <c13/> przechodzi z <c14/> na <c15/>: zdarzenie próbkowania zespołu flicker 16 ziaren na 60 kroków (NIS { "0.8815" } wobec pasma [{ "0.9125" }, { "1.0914" }]), a nie wada. Pasmo jest pasmem { "95" } %, więc około { "5" } % ziaren z założenia oznacza dopasowany filtr ({ "40" } nowych ziaren tego scenariusza: kwantowy { "1" } i klasyczny { "2" } oznaczone); przy { "64" } na { "200" } to samo ziarno mieści się w paśmie dla obu zegarów (NIS { "0.990" } i { "1.001" }). Znana kontynuacja: rodzaj fusion ma tę samą lukę (integralność klasyczna { "0.80" } z podłogą); rodzaj hybrid pozostaje powyżej { "0.99" }.

seg-c7308350b6d4 = <b>Utwardzono dane wejściowe serwera MCP.</b> Narzędzia scenariuszy serwera MCP przyjmują teraz tylko treść wbudowaną i odrzucają pola ze źródłem plikowym; rozmiar danych wejściowych jest ograniczony. Biuletyn bezpieczeństwa: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Odtwarzanie laboratoryjne: silnik śledzenia, monitory detekcji i program uruchamiający kampanie dla nagrań IQ z GNSS, z projektami pętli, estymatorami C/N0 i wskaźnikami, które do nich należą. Klasa dowodowa: wszystko poniżej jest <b>MODELLED</b> albo sprawdzone pod kątem spójności wewnętrznej względem postaci zamkniętych i ziarnowanej symulacji; nic z tego nie dodaje wiersza VALIDATED, a rejestr weryfikacji jest bez zmian ({ "251" } wierszy: { "124" } sprawdzonych względem niezależnego wzorca zewnętrznego, { "123" } obliczonych z modelu, { "4" } partnerskie). To programowa warstwa analityczna: nic tu nie syntetyzuje przebiegu zagłuszacza ani spoofera i nic nie nadaje.

seg-912ecb44cee4 = Odtwarzanie laboratoryjne: warunki testu, program uruchamiający kampanie i ocena ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> odtwarza nagrania × łańcuchy układu wejściowego × projekty pętli (<c2/>) i ocenia każdą komórkę względem pliku warunków testu dla nagrania (<c3/>, TOML lub JSON). Ten plik podaje, co laboratorium wie o nagraniu: oczekiwane satelity, a dla każdego zdarzenia jego etykietę typu, początek i koniec, dotknięte satelity oraz podany profil J/S lub mocy zagłuszacza. To wyłącznie metadane. Wskaźniki dla każdego satelity, dla całego przebiegu i dla każdego zdarzenia, to:

seg-180447aaf31e = dostępność, czas do utraty synchronizacji i podane J/S w chwili utraty;

seg-1ababddb0d87 = czas ponownego zdobycia, liczony od końca zdarzenia i od utraty;

seg-a6468323c971 = zmierzona degradacja C/N0 dla każdego przedziału podanego J/S;

seg-4cb6f510e159 = epizody fałszywego zaczepu na godzinę zaczepienia (flaga trackera albo Doppler względem pliku prawdy);

seg-97c6243bac2e = jitter dyskryminatorów PLL i DLL.

seg-014b28f61db8 = Obok każdej zmierzonej krzywej degradacji rysowana jest analityczna krzywa odniesienia separacji widmowej (<c1/> z <c2/> danego typu) i wszędzie, gdzie się pojawia, jest opisana jako MODELLED.

seg-eb5c38197dab = Komórki działają równolegle przez maszynę stanów zaczepienia sesji śledzenia, a każda jest zapisywana atomowo pod kluczem będącym haszem zawartości. Klucz obejmuje SHA-256 nagrania, hasze warunku, układu wejściowego, projektu, przebiegu i oceny, wymagane <c1/> (<c2/> | <c3/>) oraz wersję silnika. Przy ustawionym <c4/> strumień <c5/> każdej komórki i zdarzenia zaczepienia są także zachowywane, nazwane kluczem komórki i zhaszowane w komórce. <c6/> i <c7/> są publiczne, więc odbiorca może wyprowadzić ponownie każdy klucz i skrót. Ponowny przebieg pomija więc ukończone komórki, a wyniki nigdy nie zależą od liczby wątków roboczych. Przebieg zapisuje <c8/>/<c9/>, samodzielny <c10/> i <c11/>. Progi zaliczenia i niezaliczenia (<c12/>, z możliwością nadpisania dla nagrania) są stosowane przy budowie raportu.

seg-beec1c1264c9 = <c1/> (domyślnie <c2/>, część haszu oceny) wybiera C/N0 stojące za zgłaszanym C/N0 i krzywą degradacji. Obie estymaty są zawsze oceniane i zgłaszane (mediany dla całego przebiegu i punktu odniesienia oraz dla każdego przedziału J/S), a komórka i karta wyników zapisują estymator. NWPR odczytuje zaniżenie o około { "8" } dB × Bn·T przy własnym jitterze pętli; M2M4 nie.

seg-baf1a2422a66 = Nowe jest także:

seg-f36e22ff54c3 = <c1/> odbudowuje karty wyników, raport i skrót z komórek;

seg-aad7fcc28bc8 = <c1/> sprawdza plik warunków testu względem jego schematu;

seg-c3e5e4461aaa = <c1/> importuje adnotacje <c2/> nagrania SigMF jako zdarzenia;

seg-c1a2ebb844c5 = Python zyskuje <c1/>, <c2/> i <c3/>;

seg-cd69258ccc09 = <c1/> zyskuje <c2/>, które jest przyrostowe i wznawialne w ramach budżetu próbek na wywołanie, z każdym plikiem ograniczonym do katalogu roboczego, oraz <c3/>.

seg-c398b66a7058 = Testy: <c1/> uruchamia syntetyczną kampanię z { "3" } nagrań × { "2" } układów wejściowych × { "2" } projektów. Jej sceny niosą podane profile C/N0 i obejmuje ona:

seg-3f2fbdecb101 = każdą metrykę sprawdzoną względem wstrzykniętej prawdy;

seg-e103a30260db = wznowienie po częściowym przebiegu jednego wątku roboczego z uszkodzoną komórką, identyczne co do bajta z nieprzerwanym przebiegiem czterech wątków;

seg-79164d8b0b22 = pliki epok dla każdej komórki;

seg-9470016f056a = regresję ponownego zdobycia trzech satelitów przez { "20" } s: przy włączonym <c1/> każdy kanał wraca w ciągu { "2" } s od przerwy trwającej { "2" } s; wynik przy wyłączonym <c2/> jest przypięty;

seg-1deb4ab83054 = progi oceniane ponownie bez ponownego uruchamiania;

seg-351f9cdcbcd6 = CLI;

seg-2c35af369a36 = ignorowane kontrole przepustowości i pamięci w trybie release, w tym nagranie { "4" } GB ({ "5.45" }× czasu rzeczywistego, szczytowa pamięć { "2" } MB ponad początkowe RSS; pomiary na jednej maszynie, a nie progi).

seg-efbaf5a00ea2 = Wyłącznie oprogramowanie: nic nie nadaje i nie syntetyzuje się żadnego przebiegu zakłócenia ani spoofingu. Notatki projektowe i wykonawcze: <c1/>.

seg-c9871226c82f = Silnik śledzenia do odtwarzania laboratoryjnego ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Pliki projektów pętli</em>: TOML <c1/> (<c2/>; parser <c3/>). Jeden lub więcej nazwanych projektów ustawia każde pole pętli:

seg-0437148324ca = rodzaj nośnej (PLL, FLL albo PLL wspomagana FLL), rzędy i pasma;

seg-4e722960f8c6 = dyskryminatory PLL/FLL/DLL i wspomaganie nośnej;

seg-44976e3ad4e7 = odstęp i całkowanie;

seg-5c06173036d6 = progi zaczepienia i okna C/N0 oraz synchronizację bitów;

seg-405e693dd757 = maszynę stanów zaczepienia;

seg-e6908584e2f4 = akwizycję przekazania (<c1/> albo jawną).

seg-8844cc963705 = Projekty mogą się wzajemnie <c1/>. Nieznane klucze są odrzucane. Każdy rozstrzygnięty projekt ma hasz SHA-256 z kanonicznej postaci JSON (klucze posortowane na każdym poziomie, stałe formatowanie liczb), więc hasz nie zależy od kolejności pól; każdy wynik go zapisuje. Powierzchnie:

seg-5c32182634f7 = <c1/>, gdzie jawne flagi nadpisują projekt i są zapisywane;

seg-9356751a6b98 = <c1/>, które uruchamia każdy projekt z pliku;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

seg-70d3b295bea0 = <em>C/N0 M2M4</em> (<c1/>, kolumna epoki śledzenia <c2/> po <c3/>; słowniki epok w Pythonie). Estymata z momentów drugiego i czwartego rzędu w tych samych oknach co NWPR, wyłącznie z mocy prompt: NWPR odczytuje zaniżenie przy własnym jitterze nośnej pętli (około { "8" } dB × Bn_PLL·T), a M2M4 nie. Na GPS L2C CM ({ "20" } ms, nominalnie { "40" } dB-Hz, PLL od { "1" } do { "10" } Hz) odczytuje { "39.93" } dB-Hz przy każdym paśmie, podczas gdy NWPR spada z { "39.55" } do { "38.22" }; na L1 C/A przy { "45" } dB-Hz odczytuje { "45.34" }. NWPR i każdy inny wynik są bez zmian (przypięcie co do bitu). Rekord binarny pozostaje { "184" } bajtów (wartość zajmuje zarezerwowany float i bit flagi { "6" }).

seg-c02d07475717 = Dodatkowe odczepy korelatora (wielokorelatorowe / SQM).

seg-70fcdc903413 = <c1/> (przesunięcia w chipach od prompt, dodatnie dla early; co najwyżej { "16" }, każde w granicach ±{ "2" }) koreluje dodatkowe repliki obok E/P/L i zwraca je jako <c2/> (<c3/> w kolejności projektu). Pętle nigdy z nich nie korzystają. Klucz jest pomijany w kanonicznym JSON, gdy jest pusty, więc hasz domyślnego projektu i każdy wynik bez odczepów są bez zmian (<c4/> pozostaje; CSV/JSONL/binarny bez odczepów są identyczne co do bitu). Z odczepami: kolumny CSV/JSONL oraz rekord binarny o <c5/> bajtach, którego nagłówek niesie <c6/>, więc stary czytnik odrzuca plik zamiast go źle zinterpretować. <c7/> (CLI), <c8/> (Python) i <c9/> (MCP <c10/>). Projekty jednego przebiegu muszą się zgadzać co do odczepów.

seg-66d494267598 = <em>Kanały równoległe</em> (<c1/> / <c2/>; Rust <c3/>). Kanały każdego fragmentu działają na co najwyżej N wątkach (<c4/>; <c5/> pozostaje szeregowe). Korelacja i maszyna stanów zaczepienia kanału dotykają tylko tego kanału; jego epoki i zdarzenia są buforowane i zapisywane do ujść w kolejności kanałów, więc wynik (CSV, JSONL, binarny, zdarzenia, podsumowanie) jest identyczny co do bajta z przebiegiem szeregowym dla dowolnego N. Domyślnie pozostaje { "1" } wątek. Zmierzone na nagraniu z 12 kanałami, { "4" } s, { "4.092" } MHz na { "4" } rdzeniach: { "19.5" } s szeregowo, { "11.5" } s przy { "2" } wątkach, { "6.3" } s przy { "4" } ({ "3.1" }×; akwizycja początkowa jest szeregowa).

seg-cf59911d458f = <em>Eksport powierzchni akwizycji</em> (<c1/>; <c2/>, <c3/>). <c4/> (jeden PRN; CSV, JSON lub binarny), <c5/> w Pythonie oraz <c6/> <c7/> w MCP zapisują całą powierzchnię mocy korelacji Doppler × faza kodu, którą oblicza wyszukiwanie (jej komórki są komórkami <c8/>, co do bitu), ze szczytem i dwoma dopracowaniami drobnego Dopplera: estymatą paraboliczną i drobnym wyszukiwaniem w 1/16 przedziału (≈{ "5" } Hz przy { "4" } ms koherentnie, wobec przedziałów { "167" } Hz). Samo <c9/> i każda wartość domyślna są bez zmian.

seg-a01bf371cc4f = <em>Strumieniowe wyjście epok</em> (<c1/>; <c2/>). Każda aktualizacja pętli niesie:

seg-ff549f07ce78 = korelatory early/prompt/late;

seg-00457c1bb059 = wszystkie trzy wyjścia dyskryminatorów;

seg-b17d335f6cac = stany NCO PLL/FLL/DLL i fazę nośnej;

seg-a3bf3f1034cd = flagi PLI i zaczepienia;

seg-7912a72da79b = obie estymaty C/N0 i bity;

seg-8d105d656041 = stan zaczepienia.

seg-6af6331255fb = Jest zapisywane na bieżąco, jako CSV, JSON Lines albo wersjonowana postać binarna z czytnikami w Ruście (<c1/>) i Pythonie (<c2/>).

seg-aa081bfd9878 = <c1/> zyskuje <c2/>, <c3/> i <c4/> (<c5/>), a <c6/> zyskuje <c7/> i <c8/>. MCP <c9/> zyskuje <c10/>/<c11/> i buduje swoją odpowiedź z podsumowania o ograniczonej pamięci.

seg-8cb2f8b27bad = Sterta przebiegu nie rośnie już wraz z długością nagrania: <c1/> mierzy ją licznikiem alokacji ({ "6" }× długość, ten sam szczyt w granicach { "64" } KiB), z kontrolą pokazującą, że ścieżka w pamięci rośnie.

seg-e3eff59db445 = Dane wyjściowe przesyłane strumieniowo są bitowo identyczne z odtworzeniem w pamięci.

seg-c602902313f8 = <em>Automat stanów blokady</em> (<c1/>, <c2/>): wciąganie → zablokowany → utracony → ponowne pozyskanie → wciąganie, albo wycofanie, gdy utrata trwa dłużej niż <c3/> (domyślnie { "30" } s). Nieudane wyszukiwania są ponawiane co <c4/> ({ "0.1" } s), w równych odstępach, więc harmonogram ponowień dodaje co najwyżej { "0.1" } s do zmierzonego czasu ponownego pozyskania. Opcjonalne wydłużanie odstępów (<c5/> powyżej <c6/>) jest domyślnie wyłączone, a <c7/> to opcjonalny limit ({ "0" }, domyślnie brak). Zanik sygnału trwający { "2" } s na trzech PRN przy { "4.092" } MS/s kończy się teraz ponownym pozyskaniem i zablokowaniem każdego kanału. Przy limicie 3 prób każdy kanał został wycofany w ciągu { "0.2" } s od utraty.

seg-56bc109dbef9 = Progi (<c1/>, <c2/>, okno Dopplera ponownego pozyskania) wynikają z projektu. Każde przejście jest zdarzeniem z podaną przyczyną.

seg-b1c551e48389 = Kontrola fałszywej blokady szuka śledzonego Dopplera względem jego aliasu FLL/PLL ±1/(2T). Wychwytuje fałszywą blokadę zmierzoną w PR #38 (−{ "2400" } Hz śledzone { "500" } Hz od wartości właściwej). Przy włączonym ponownym pozyskaniu kanał kończy zablokowany na wprowadzonym Dopplerze.

seg-39409dd0b4bc = Przerwa w sygnale trwająca { "0.8" } s jest uznawana za utratę i ponownie pozyskiwana w ciągu { "0.3" } s od powrotu sygnału.

seg-ce3162720ce5 = <c1/> (oraz kolumna tabeli) to stan po ostatnim przejściu, więc kanał wycofany po ostatniej aktualizacji pętli ma wartość <c2/>.

seg-520ab6d84a6c = <b>Wspomaganie FLL tylko podczas wciągania</b> (<c1/>, wartość domyślna; <c2/> zachowuje wcześniejsze działanie bit w bit). FLL przekazuje sterowanie do PLL, gdy wygładzony PLI utrzymuje się na poziomie co najmniej <c3/> ({ "0.8" }) przez <c4/> ({ "0.1" } s), i wraca do działania, gdy spadnie poniżej <c5/> ({ "0.6" }). Po pozostawieniu FLL włączonego tor FLL { "10" } Hz zrywał blokadę fazy poniżej około { "38" } dB-Hz na czystych sygnałach: przy { "35" } dB-Hz odsetek blokady fazy wynosił { "10" }–{ "16" } %, a prawdziwy błąd fazy { "38" }–{ "41" }°. Z bramkowaniem wartość domyślna utrzymuje { "100" } % przy { "35" } dB-Hz z błędem { "4.5" }°, tak samo jak sama PLL. Wciąganie z błędu przekazania { "100" } Hz pozostaje bez zmian. Dowody ze wstępnie zarejestrowanymi progami: <c6/>. <b>Domyślne pętle nie są zatem zgodne bit w bit z wcześniejszymi przebiegami domyślnego projektu.</b> Aby je odtworzyć, użyj <c7/>. Znane ograniczenie: przy { "35" } dB-Hz przekazanie następuje { "1.9" }–{ "2.6" } s po rozpoczęciu śledzenia, a przy { "33" } dB-Hz FLL { "10" } Hz utrzymuje PLI poniżej progu przekazania, więc wciąganie nigdy się nie kończy.

seg-1a911b958f8e = Nowe klucze projektu pętli i nowe API, wymienione poniżej:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, przy czym <c5/> zmieniono z wartości domyślnej { "3" } na opcjonalny limit (domyślnie { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = Skrót projektu jest liczony z kanonicznej postaci JSON, a skrót wbudowanego projektu domyślnego to <c1/> (zapisany w teście).

seg-2405be1bc0c6 = Uwagi o zgodności danych wyjściowych:

seg-77670b7dd608 = tabela <c1/> ma końcową kolumnę <c2/>;

seg-a52d9bbdd1a4 = plik CSV z <c1/> ma końcową kolumnę <c2/>, a jego JSON ma <c3/> i <c4/>;

seg-3fa0f9243806 = wartość <c1/> w przeglądzie jest teraz średnią ze wszystkich aktualizacji, które mają estymatę NWPR (podsumowanie o ograniczonej pamięci), a nie już z drugiej połowy przebiegu.

seg-d542c1616f35 = Ponowne pozyskanie jest <b>wyłączone we wbudowanym projekcie domyślnym</b>, gdzie automat stanów tylko obserwuje, a pętle działają bit w bit tak, jak bez niego. (Same domyślne pętle jednak się zmieniły: zob. wspomaganie FLL powyżej.) Włącza się je w projekcie (<c1/>), przez <c2/> lub przez <c3/>.

seg-61d6b3122888 = <b>Ostrzeżenie <c1/></b>: gdy fs różni się o mniej niż { "1e-6" } od wielokrotności połowy częstotliwości chipów (<c2/>), <c3/>/<c4/> (dane wyjściowe, <c5/>, JSON przeglądu), odpowiedź MCP <c6/> i wynik Pythona <c7/> ostrzegają, że jitter i błąd systematyczny pętli kodu nie są reprezentatywne. Przyczyna źródłowa jest opisana ze wstępnie zarejestrowanymi progami w <c8/>. Przy dokładnie { "2" } próbkach na chip i odstępie 0.5 chipa krzywa S pętli DLL jest pojedynczym schodkiem i pętla oscyluje: ≈ { "0.09" } chipa RMS błędu kodu (≈ { "26" } m) przy { "45" } dB-Hz, wobec ≈ { "0.004" } chipa przy częstotliwości niewspółmiernej. Zaniżenie NWPR C/N0 o ~{ "2" } dB przy tej częstotliwości ma tę samą przyczynę. Przy dokładnie { "0" } Hz Dopplera kodu i { "4" } próbkach na chip kod nigdy nie przekracza martwej strefy ±0.21 chipa, więc błąd systematyczny fazy kodu do około { "0.2" } chipa może się utrzymywać bez widocznego wpływu na jitter (zmierzono: odstęp 0.5 chipa daje { "2.0" }× błędu kodu próby kontrolnej przy średniej +{ "0.011" } chipa; odstęp 0.25 chipa daje +{ "0.125" } chipa); ostrzeżenie obejmuje tę częstotliwość.

seg-8fbfb3f0bee2 = <b>Znane ograniczenie: projekt domyślny nie przekazuje FLL→PLL poniżej około { "35" } dB-Hz</b> (próg wciągania ~{ "35" } dB-Hz; zob. wspomaganie FLL powyżej oraz <c1/>).

seg-43f02bc861be = Wyszukiwanie fałszywej blokady lub ponownego pozyskania, którego nie można wykonać (częstotliwość bez całkowitej liczby próbek na okres kodu), nie zatrzymuje już śledzenia.

seg-14f4e9edc443 = Testy: <c1/>, <c2/>, <c3/>, <c4/> oraz pełny obieg IQ przez MCP.

seg-60141bb08f64 = Profile C/N0 w scenach syntetycznych ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> planuje zmienne w czasie C/N0 dla każdego satelity we własnych scenach Kshana, jako przesunięcia w dB względem C/N0 sceny. Kształty: skok, rampa, odcinkowo liniowy oraz generowane z ziarna zaniki Rice'a podobne do scyntylacji, z podanym S4 i czasem dekorelacji. Stosuje się je przez istniejący punkt zaczepienia kanału sceny (<c2/>, w połączeniu z efektami jonosfery, troposfery, scyntylacji i wielodrogowości), bez zmian w rdzeniu sceny. <c3/> w pliku prawdy odpowiada profilowi.

seg-548eeca516ff = Interfejsy: <c1/> i <c2/>.

seg-a242e4d9f071 = Do czego służy: pętle, monitory i punktowanie kampanii można testować obciążeniowo względem znanej prawdy. Zmienia ono wyłącznie moc sygnałów prawidłowych.

seg-ff4df7c343dc = Kontrole (<c1/>). Progi: średnia intensywność zaniku w granicach { "5" } % od { "1" }, S4 w granicach { "8" } % wartości docelowej (przy S4 = { "0.3" }, { "0.7" } i { "1" }), korelacja intensywności powyżej { "0.9" } przy { "0.05" } τ i poniżej { "0.05" } przy { "5" } τ; prawda dokładnie równa podanemu C/N0 plus profil; spadek śledzonego NWPR C/N0 w granicach { "0.7" } dB od skoku { "6" } dB. Zmierzono: S4 w granicach { "1.3" } % wartości docelowej oraz spadek śledzony { "6.26" } dB.

seg-e214458cd1b6 = <b>Monitory detekcji na ścieżce IQ ({ "0.34.0" } „Lab replay”).</b> Nowy moduł <c1/>, polecenie <c2/> i powiązanie <c3/>. Obserwują nagranie i raportują szeregi czasowe oraz oznaczone zdarzenia (czas początku, alarmu i końca, wartość szczytowa, próg). Tylko wykrywają i mierzą; nic tu nie generuje sygnału.

seg-5b05b2a54fab = <b>Moc całkowita / AGC</b>: moc bloku i wzmocnienie, które zastosowałby idealny AGC; oznacza wzrosty i spadki.

seg-2a84a640d7f1 = <b>Widmo przed korelacją</b>: PSD Welcha na blok względem wyuczonej linii bazowej. Próg nadwyżki wynika z docelowego poziomu fałszywych alarmów. Także kurtoza zespolona i detektor impulsów. Detektor impulsów zlicza próbki powyżej progu w każdym bloku i zgłasza zdarzenie, gdy dokładny górny ogon rozkładu dwumianowego dla tej liczby jest poniżej <c1/> (domyślnie { "1e-4" } na blok), a nie gdy wynik z przekroczy limit: przy małych oczekiwanych liczbach w krótkich blokach pojedyncza próbka jest już kilka sigma od średniej.

seg-7704ac807c38 = <b>C/N0 dla każdego kanału</b>: dwa jednostronne detektory zmian CUSUM (spadek i wzrost), zasilane niezależnymi estymatami (krok wynika z okna C/N0 pętli).

seg-f965a68d388b = <b>SQM z korelatorów</b>: delta <c1/> i iloraz <c2/>, a także testy asymetrii z dodatkowych korelatorów, gdy kanał je dostarcza.

seg-a4006c2e8692 = <b>Szereg wskaźników blokady</b>: PLI i wskaźnik blokady częstotliwości z kolejnych próbek prompt, jako sygnały surowe. Decyzje o blokadzie i utracie blokady pozostają przy automacie stanów blokady silnika śledzenia.

seg-da72318f44cc = Jeden przebieg strumieniowy (<c1/>) uruchamia wszystko, z plikiem ustawień TOML/JSON (<c2/>); moduł kampanii używa tego samego punktu wejścia. Wszystkie MODELLED. Każda statystyka jest sprawdzana względem swojej postaci zamkniętej przez symulację z ziarnem (<c3/>):

seg-0ff96e4c5a20 = przekroczenia mocy bloku względem ogona rozkładu Gamma;

seg-97b559ea0897 = średnia kurtozy { "2" } i rozrzut <c1/>;

seg-2b941c702b7f = ułamek impulsów <c1/>;

seg-e8f068c41f0c = długości przebiegów CUSUM względem przybliżenia Siegmunda (zmierzono { "330" } i { "8.46" } próbek wobec { "338" } i { "8.34" });

seg-e2cd6a55e49b = wskaźnik blokady fazy względem średniej dla fazy o rozkładzie Rice'a;

seg-06291b1c6274 = na śledzonym sygnale C/A rozrzut delty i ilorazu SQM wynosi około { "6" } % względem postaci zamkniętych pierwszego rzędu (zmierzono { "5.97" } %; próg testu { "12" } %).

seg-12deb36a2e3a = Wzór na fałszywy alarm nadwyżki widmowej jest przybliżeniem; zmierzony poziom wynosił { "1.3" }× wartości ze wzoru. W pełnym torze monitory oznaczają:

seg-b002c66c7881 = skok C/N0 o { "6" } dB (czas zmiany w granicach jednej estymaty);

seg-2e828d106393 = ścieżkę odbitą pojawiającą się w trakcie nagrania (test ilorazu);

seg-68063f036e2c = zanik sygnału (w jego trakcie PLI spada z { "0.999" } do −{ "0.3" }, a FLI z { "0.93" } do { "0.03" });

seg-0cd95f0197ec = ton wąskopasmowy i rzadkie próbki o dużej amplitudzie (testy widmowy, impulsowy i kurtozy). To ogólne wejścia testowe DSP, a nie modele zakłóceń.

seg-7128b9000cc2 = <c1/>/<c2/> działają strumieniowo przez nową sesję (zob. Dodano).

seg-98891d33e48c = <c1/> zachowuje swoje kolumny z wersji { "0.32" }, ale jest teraz przesyłany strumieniowo, więc wiersze kilku kanałów przeplatają się w kolejności czasu zamiast być pogrupowane według kanału. <c2/> zachowuje swój kształt z wersji { "0.32" } i nadal trzyma w pamięci każdą epokę: do długich nagrań użyj <c3/>.

seg-2ef2d5771ade = <c1/> mierzy jitter na aktualizacjach z drugiej połowy czasu trwania przebiegu (wcześniej z drugiej połowy liczby aktualizacji), a jego CSV/JSON zyskują kolumnę <c2/>.

seg-f23b6db96748 = Tabela śledzenia zyskuje kolumnę <c1/>.

seg-a5769fbc201e = Tekst pomocy nie twierdzi już, że <c1/> przyjmuje flagi toru wejściowego; stosuje je tylko <c2/>.

seg-cf28fa21786a = Parametry <c2/> i <c3/> w Pythonowym <c1/> mają teraz domyślnie wartość <c4/> (wartości z projektu, { "1" } i { "5000" } Hz we wbudowanym projekcie). Jego epoki zyskują korelatory wczesny/późny, <c5/>, <c6/>, <c7/> i <c8/>, a wynik zyskuje <c9/> i <c10/>.

seg-666b9e3faa5d = <b>Domyślny krok akwizycji nie przekazuje już śledzeniu Galileo E1 reszty, której FLL nie potrafi wciągnąć.</b> Krok <c1/> pozostawia przy przekazaniu do <c2/> błędu Dopplera, ale domyślna dwukwadrantowa FLL wciąga tylko <c3/>. Dla każdego kodu o długości { "4" } ms lub większej (<c4/>), w tym Galileo E1-B i E1-C, reszta ({ "83.3" } Hz przy { "4" } ms) wykraczała poza wciąganie { "62.5" } Hz, a śledzenie łapało fałszywą blokadę przy +{ "125" } Hz, ze wskaźnikiem blokady fazy { "0.97" }, który ją ukrywał. Domyślny krok jest teraz dodatkowo ograniczony do <c5/> (<c6/>), czyli { "0.8" } zakresu wciągania, więc przekazanie mieści się w nim, nawet gdy wygra sąsiedni przedział. ({ "0.4" } wypróbowano najpierw: dawało fałszywą blokadę w { "1" } przebiegu na { "42" } na E1-B, a koherentne wyszukiwanie GPS L1 C/A { "1" } ms wybrało przedział { "350" } Hz obok i zablokowało się przy +{ "500" } Hz; { "0.25" } i { "0.2" } nie dały żadnej w tych samych przebiegach.) Koszt: Galileo E1-B/E1-C przechodzą z przedziałów { "166.7" } Hz na { "50" } Hz, czyli { "201" } przedziałów w zakresie ±{ "5" } kHz zamiast { "61" }; kody { "1" } ms ({ "166.7" } Hz, <c7/>) pozostają bez zmian. <c8/> w projekcie pętli oznacza właśnie to; jawnie podane <c9/> lub <c10/> jest używane tak, jak zapisano, a <c11/> (bez przekazania do śledzenia) zachowuje krok podręcznikowy. Nagłówek epoki i <c12/> zapisują teraz rozstrzygnięty krok i szerokości pasma pętli dla każdego kanału (<c13/>). Skrót projektu domyślnego pozostaje bez zmian. Zmiana danych wyjściowych: detekcje dla kodów o długości { "4" } ms i większej mogą trafiać w inne przedziały Dopplera.

seg-9150dc89e186 = <b>GPS L2C CM (aktualizacja pętli co { "20" } ms) utrzymuje blokadę z projektem domyślnym.</b> Domyślna PLL { "15" } Hz i FLL { "10" } Hz mają <c1/> równe { "0.3" } i { "0.2" } przy T = { "20" } ms, a pętla traciła blokadę nawet przy idealnym starcie (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). Nowy klucz projektu <c2/> (domyślnie { "0.1" }) ogranicza szerokości pasma szumów PLL i FLL do <c3/>, gdy czas aktualizacji pętli jest dłuższy niż { "4" } ms (<c4/>): { "5" } Hz i { "5" } Hz przy { "20" } ms, { "10" } Hz i { "10" } Hz przy { "10" } ms dla BeiDou B1C; kody { "1" } ms i { "4" } ms zachowują { "15" } i { "10" } Hz. Dotyczy to także jawnie podanych szerokości pasma; <c5/> to wyłącza. Klucz jest pomijany w postaci kanonicznej przy wartości domyślnej, więc skrót projektu domyślnego pozostaje bez zmian; projekt ustawiający jakąkolwiek inną wartość ma inny skrót. Przy { "45" } dB-Hz L2C CM daje teraz PLI { "0.996" }, błąd Dopplera { "0.00" } Hz i M2M4 { "42.71" } dB-Hz. Znana otwarta kwestia: NWPR C/N0 jest tam zaniżone o { "1.76" } dB (i o { "2.45" } dB na B1C przy { "10" } ms), więc T5 macierzy dla L2C pozostaje ignorowanym ustaleniem.

seg-74517bee3f6f = <b>Plik <c1/> wygenerowano ponownie: zatwierdzony rysunek był nieaktualny względem własnego scenariusza (zmiana danych, nie przemalowanie).</b> Wykres narysowano 2026-06-02 z <c2/>; dwa dni później 67fed19e ustawił w tym scenariuszu progi szumu flicker-FM (kwantowy <c3/>, CSAC <c4/>), a rysunku nigdy nie narysowano ponownie. Pokazywał przebieg sprzed progów: oś y od { "0" } do { "47" } ns, p95 zaniku dla przebiegu CSAC od { "10.5" } do { "47.6" } ns (średnia { "25.2" } ns), holdover klasyczny { "4050" } s średnio. Scenariusz w wersji dostarczonej (jak podają już samouczek i podsumowanie CLI) daje oś y od { "0" } do { "407" } ns, p95 dla przebiegu CSAC od { "40.8" } do { "374.0" } ns (średnia { "167.0" } ns), holdover klasyczny { "844" } s [{ "220" } do { "2130" } s]; linia specyfikacji { "20" } ns leży przy tych samych { "20" } ns na osi wyższej około dziewięć razy. Silnik jest niezmieniony: dzisiejszy silnik na czerwcowym pliku scenariusza dokładnie odtwarza oś starego rysunku. Rysunek nie jest przywoływany w README ani w dokumentacji.

seg-75636f9419b2 = Znane ograniczenia

seg-2c607b56048e = <b>NWPR C/N0 jest zaniżone przy wysokim C/N0·T na próbkę prompt, a BOC({ "1,1" }) przy { "5" } MS/s traci około { "1" } dB.</b> NWPR jest nieobciążone na idealnych próbkach prompt, ale własny jitter PLL pętli kosztuje około dopasowanych { "8" } dB × Bn·T (jedna scena, cztery punkty: −0.24/−0.44/−0.77/−{ "1.58" } dB przy 1/2.5/5/10 Hz i { "20" } ms; około −{ "1" } dB przy domyślnym <c1/>); M2M4 jest niewrażliwe. Dane BeiDou B1C przy { "5" } MS/s tracą też około { "1" } dB mocy prompt na ograniczeniu pasma (użyj { "10" } MS/s lub więcej). Żadne z tych zjawisk nie jest wadą estymatora; wiersze T5 macierzy sygnałów dla GPS L2C i BeiDou B1C pozostają ignorowanymi ustaleniami z tymi przyczynami.

seg-ff195e575023 = <b>Utwardzono tekst wykresów i przyjmowanie wykresów w Studio.</b> Tekst, który scenariusz przenosi do wygenerowanego wykresu, jest teraz spójnie escapowany przez jedną wspólną procedurę, a Studio przyjmuje z wykresu wyłącznie znaczniki rysunku. Parametry adresu Studio, wyszukiwania według rodzaju i pobieranie scenariuszy są ograniczone do znanych wartości. Dołączone wykresy, zapisane wyniki i opublikowane liczby pozostają bez zmian. Zaleca się aktualizację każdemu, kto otwiera w Studio pliki scenariuszy z niezaufanych źródeł lub osadza wygenerowane wykresy na stronach internetowych. Biuletyn: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>Zakres zakłóceń i spoofingu w warstwie IQ, opisany dokładnie.</b> Wpisy { "0.31.0" } i { "0.32.0" } poniżej mówią, że warstwa IQ dodaje „brak syntezy przebiegów zakłóceń ani spoofingu”. Jest to prawdą o samej warstwie IQ (<c1/> generuje wyłącznie prawidłowe sygnały GNSS), ale brzmiało to jak stwierdzenie o całym silniku, a takim nie jest: od { "0.29.0" } sekcja <c3/> rodzaju <c2/> zapisuje migawkę SigMF swojego modelu analitycznego wraz ze skonfigurowanymi zagłuszaczami (zagłuszacze szumopodobne przedział po przedziale, tony i chirpy jako przebiegi), a <c4/> sumuje w pamięci sygnał prawdziwy i replikę spoofera, by testować przechwycenie pętli (suma nigdy nie jest zapisywana). Silnik zawiera też programowy odbiornik GNSS od { "0.20.0" } (<c5/>: akwizycja i śledzenie; od { "0.31.0" } także <c6/> i <c7/>). Nic w Kshana niczego nie nadaje ani nie steruje sprzętem radiowym. Wiersz stanu w README, <c8/>, <c9/> i notatki projektowe IQ mówią to teraz wprost; wydane wpisy pozostawiono w postaci, w jakiej opublikowano. Zachowanie się nie zmienia.

seg-61befd8b474d = <b>Znane ograniczenie: próbkowanie współmierne.</b> Przy częstotliwości próbkowania będącej całkowitą lub półcałkowitą wielokrotnością częstotliwości chipów próbki leżą w każdym chipie w tych samych fazach chipa, a dyskryminator kodu staje się schodkiem. Na syntetycznym sygnale GPS L1 C/A przy { "45" } dB-Hz i odstępie 0.5 chipa { "2.046" } MHz ({ "2" } próbki na chip) daje ≈ { "0.09" } chipa (≈ { "26" } m) RMS błędu kodu i błąd systematyczny −{ "0.09" } chipa, wobec ≈ { "0.003" } chipa przy częstotliwości niewspółmiernej. NWPR C/N0 jest tam zaniżone o ≈ { "2.4" } dB. Przy { "4.092" } MHz zależy to od odstępu i Dopplera kodu. Przy { "0.5" } chipa jest nieszkodliwe przy Dopplerze { "1500" } Hz, ale daje { "2" }× przy błędzie systematycznym { "0.011" } chipa przy { "0" } Hz, a przy { "0.25" } lub { "0.1" } chipa błąd kodu jest { "8" }–{ "10" }× większy. Śledzenie nośnej nie jest dotknięte. Pomiary zawiera <c1/>.

seg-3a30bd47380a = Warstwa IQ GNSS na serwerze MCP (faza B.1).

seg-ef81eca03bca = <c1/> zyskuje sześć narzędzi, które z poziomu agenta obsługują warstwę <c2/>: <c3/> (akceptowane nazwy sygnałów i konfiguracja IQ), <c4/> (opis nagrania), <c5/> (generowanie sceny o podanym profilu lub z efemerydami nadawczymi, z opcjonalnym kanałem na poziomie sygnału), <c6/> (akwizycja FFT, opcjonalnie za stopniami toru wejściowego), <c7/> (akwizycja, a następnie zespół pętli DLL/PLL/FLL) i <c8/> (filtr pasmowy, notch, wygaszanie, wycinanie, AGC, kwantyzator). Próbki IQ nigdy nie przechodzą przez protokół: każde narzędzie przyjmuje ścieżki plików w jednym katalogu roboczym ustawionym przez <c9/> (brak ustawienia wyłącza narzędzia plików IQ i nie wpływa na żadne inne), odrzuca ścieżki wskazujące poza niego oraz wyjścia, które już istnieją, chyba że ustawiono <c10/>, egzekwuje limit próbek na wywołanie (<c11/>, domyślnie { "50 000 000" }) przed jakąkolwiek pracą, odrzuca nieznane argumenty i odpowiada zwięzłym podsumowaniem JSON (detekcje, C/N0, stan blokady oraz każdy zapisany plik z liczbą bajtów). Dane wyjściowe dla każdej epoki trafiają tylko do plików wskazanych przez wywołującego. Narzędzia uruchamiają tę samą ścieżkę kodu co CLI przez nowy publiczny punkt styku, <c12/>, który zwraca komunikat CLI zamiast go drukować (stdout jest kanałem JSON-RPC MCP); <c13/> i <c14/> są teraz również publiczne. Wyłącznie programowe i addytywne: warstwa IQ nie dodaje syntezy zakłóceń ani spoofera, nic nigdy nie jest nadawane i nie ma nowych zależności. <c15/> deklaruje dwie zmienne środowiskowe. Testy obiegu w <c16/> generują krótką scenę z dwoma satelitami i sprawdzają akwizycję względem własnego pliku prawdy sceny, blokadę śledzenia i C/N0, tor wejściowy, zapis SigMF, limit, ograniczenie ścieżek i stan wyłączony.

seg-6963f3fa1db7 = <b>Warstwa IQ GNSS w rejestrze walidacji.</b> Wstępnie zarejestrowana kontrola krzyżowa względem gps-sdr-sim (niezależnego generatora pasma podstawowego GPS L1 C/A, MIT, commit 28ca29a6) jest teraz częścią zawsze włączonego zestawu testów (<c1/>). Jej zatwierdzone dane odniesienia (<c2/>: { "20" } ms własnego 8-bitowego I/Q gps-sdr-sim, jego lista kanałów i stan kanałów, który za nim stoi, z modułu zlinkowanego z tym samym buildem) są generowane ponownie przez <c3/>. Podczas testu nic nie wymaga sieci ani zewnętrznego narzędzia. Dodano dwa wiersze rejestru ({ "251" } wierszy: { "124" } sprawdzonych względem niezależnego wzorca, { "123" } obliczonych z modelu, { "4" } partnera):

seg-21d005e2ef0e = <em>Geometria sygnału sceny IQ GNSS względem niezależnego generatora pasma podstawowego</em>: <b>sprawdzone względem niezależnego wzorca</b>. Prawda sceny (zbiór widocznych satelitów, pseudoodległość, faza kodu, Doppler, kąty widzenia) dla sceny z efemerydami nadawczymi zgadza się ze stanem kanałów gps-sdr-sim na wszystkich { "11" } kanałach: w najgorszym przypadku { "1.6" } mm, { "5.5e-6" } chipa, { "7.4e-5" } Hz, { "4e-9" } stopnia, wobec progów { "0.05" } m, { "2e-4" } chipa, { "0.02" } Hz i { "1e-4" } stopnia ustalonych przed przebiegiem.

seg-5c8858182d41 = <em>Akwizycja IQ GNSS na niezależnie wygenerowanych próbkach I/Q</em>: <b>obliczone z modelu, z ustaleniem</b>. <c1/> znajduje każdy symulowany satelita w próbkach gps-sdr-sim w granicach zarejestrowanych progów (faza kodu w granicach { "0.195" } chipa, Doppler w granicach { "72" } Hz). Zarejestrowany próg „nie wykryto żadnego innego PRN” jednak nie zostaje spełniony: na wolnym od szumu wyjściu gps-sdr-sim próg dla szumu gaussowskiego jest przekraczany przez korelację wzajemną pozostałych satelitów dla wszystkich { "21" } nieobecnych PRN. Test ścisły pozostaje, ignorowany wraz z ustaleniem, a przypięty test je rejestruje. Kod silnika ani publiczne API się nie zmieniają. Próbki I/Q nie są porównywane próbka po próbce: całkowitoliczbowa tablica sinusa gps-sdr-sim, wzmocnienia, zerowa początkowa faza nośnej i obcięte pola LNAV nie są wielkościami, co do których odbiornik musi się zgadzać. Porównanie wykonuje się na obserwablach, które mierzy odbiornik.

seg-a2be63287ce4 = <b><c1/> domyślnie przekazuje z akwizycji ≈{ "4" } ms (zmiana zachowania).</b> Akwizycja inicjalizująca każdy kanał śledzenia całkuje teraz koherentnie <c2/> okresów kodu zamiast jednego, gdzie <c3/> to pełny okres kodu (iloczyn długości kodu podstawowego i wtórnego dla kodu warstwowego, jednostka, po której całkuje akwizycja). Niewarstwowe kody { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) przeszukują teraz { "4" } okresy ({ "4" } ms), więc domyślny krok Dopplera <c4/> wynosi ~{ "167" } Hz zamiast ~{ "667" } Hz. Każdy kod, którego pełny okres wynosi już { "4" } ms lub więcej, zachowuje { "1" } okres: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms) oraz warstwowe GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q i E1-C (od { "10" } do { "100" } ms z kodami nakładkowymi), a także GPS L2C. Każdy sygnał całkuje więc co najmniej ~{ "4" } ms. Wyszukiwanie jednookresowe mogło przekazać kanał z błędem do ~{ "333" } Hz, poza wciąganiem FLL, a kanał śledził wtedy fałszywą blokadę ~{ "500" } Hz dalej, zgłaszając czyste śledzenie. W przeglądzie z ziarna obejmującym { "180" } kanałów GPS L1 C/A (Doppler w zakresie ±{ "5" } kHz, od { "38" } do { "47" } dB-Hz, połowa z danymi nawigacyjnymi; <c5/>, do ponownego uruchomienia) fałszywe blokady spadają z { "27" } na { "180" } do { "1" } na { "180" }, a chybione akwizycje ze { "102" } do { "11" }, kosztem ~{ "40" } ms dłuższego wyszukiwania na PRN w GPS L1 ({ "11" } → { "52" } ms). Jedyna pozostała fałszywa blokada występuje przy { "38" } dB-Hz, { "36" } Hz od wartości właściwej. Wszystkie interfejsy są zgodne: <c6/> i <c7/> (<c8/>), Pythonowe <c9/> (<c10/> jest teraz automatyczne; stub zaktualizowany) i narzędzie MCP <c11/>. Kto polegał na dawnej wartości domyślnej, może podać <c12/> (<c13/>). Własna wartość domyślna <c15/> w <c14/> pozostaje { "1" }. Nowe publiczne <c16/> i <c17/>; test regresji <c18/>.

seg-52768eb8e3d5 = <b>Każda generowana grafika podąża teraz za motywem Observatory witryny: zmieniają się bajty każdego wykresu.</b> To celowa korekta wyłącznie opublikowanych rysunków, kolorów i krojów pisma; żadna wykreślana wartość, współrzędna ani etykieta się nie przesunęła. Każdy <c1/> scenariusza (a więc eksporty wykresów w Studio i wykresy demonstracyjne w README), raport z przebiegu w HTML (<c2/>), animacja osi czasu (<c3/>), strony HTML wyników scenariuszy i badań, podsumowanie walidacji oraz rysunki i diagramy w dokumentacji używały ciepłej ciemnej lipcowej palety (tło <c4/>, złoto <c5/>) i ciepłego papierowego motywu raportu. Teraz biorą każdy kolor i krój z jednego modułu, <c6/>, który odzwierciedla <c7/>: wykresy są rysowane w stylu ciemnego przyrządu na tle Observatory (<c8/>) w zestawie kroju Geist; raport, odtwarzacz animacji i strony wyników podążają za preferencją jasnego/ciemnego motywu przeglądarki z jasnymi i ciemnymi tokenami Observatory. Sześć dziedzin awarii zachowuje po jednym kolorze (zakłócenia koralowy, spoofing magenta, synchronizacja czasu niebieski, orbity cyjan, integralność limonkowy, nawigacja bursztynowy), a poziomy dowodowe czytają się: sprawdzone limonkowy, obliczone z modelu bursztynowy, partnera magenta. Rampy wodospadu zachowują swoją percepcyjną kolejność (inferno), zakotwiczoną ponownie na nowym tle.

seg-d967e354a966 = <c1/> utrzymuje moduł zgodny z <c2/> w obu motywach, sprawdza, czy <c3/> i <c4/> (oba generowane z modułu, dla narzędzi rysunków w Pythonie i mermaid-cli) są aktualne, i kończy się błędem, jeśli w <c5/> poza paletą pojawi się literał koloru szesnastkowego.

seg-fa3e60422ca5 = <c1/> zyskuje trzecią diagnozę, „przesunęły się tylko kolory i kroje pisma”, aby odróżnić korektę palety od przesuniętej wykreślanej wartości. Każdy ponownie wyrenderowany wykres README został sprawdzony jako równy swojemu poprzednikowi po tej normalizacji.

seg-3bc4056fd57e = <c1/> czyta paletę, a teraz także generuje trzy rysunki wyników w README, które nie miały zatwierdzonego generatora (<c2/>, <c3/>, <c4/>), z prawdziwymi elementami tekstowymi, z <c5/>, wyniku <c6/> i <c7/>. <c8/> czyta tę samą paletę, co poprawia jego odchylenie jasnego motywu względem witryny. Wartości <c9/> to kolumna najgorszego przypadku <c10/> z tego pliku wzorcowego ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } i { "4.12e-6" } km), bez zmian względem rysunku z Matplotlib, a <c11/> kończy się teraz błędem, jeśli zatwierdzony rysunek i plik wzorcowy się różnią.

seg-3196836a2a0d = <b><c1/> odświeżono do aktualnych danych (zmiana danych, nie przemalowanie).</b> Rysunek podawał { "28" } możliwości w { "8" } dziedzinach ({ "11" } sprawdzonych względem niezależnego wzorca, { "17" } obliczonych z modelu), co było nieaktualne względem jego własnego podanego źródła; narysowany teraz przez nowy generator z <c2/>, podaje { "46" } możliwości w { "8" } dziedzinach ({ "17" } sprawdzonych względem niezależnego wzorca, { "29" } obliczonych z modelu).

seg-55d5b16379aa = <b>Q zagłuszacza CW/wąskopasmowego wynosi teraz { "1.0" }, a nie { "1.5" }.</b> Wartość podręcznikowa dla tonu na nośnej to { "1" } (ton zachowuje szczyt widmowy sygnału, <c1/>, <c2/>); dawne { "1.5" } sprawiało, że ton był mniej szkodliwy niż szum szerokopasmowy przy równym J/S. Zmiana danych wyjściowych: około −{ "1.8" } dB efektywnego C/N0 pod zagłuszaczami CW/wąskopasmowymi przy wysokim J/S w rodzajach <c3/>, <c4/> i interop (ton w dołączonym przykładzie <c5/>: { "17.98" } dB-Hz z tabeli, było { "19.74" }). Q szerokopasmowe pozostaje { "1.0" } (ostrożnie, około { "3" } dB poniżej podręcznikowego ~{ "2" }) do przeglądu w { "0.34" }. Ustaw <c6/>, aby zachować dawne { "1.5" }.

seg-99fab1936170 = <b>Wyjście całkowitoliczbowe <c1/> wykorzystuje zakres całkowitoliczbowy.</b> Przy szumie o mocy jednostkowej i skali zapisu { "1" } sceny <c2/>/<c3/> wychodziły jako około { "{" }-1, { "0" }, { "1" }{ "}" }, a sceny 2-bitowe miały progi przy { "2.8" } sigma. Formaty całkowitoliczbowe są teraz skalowane tak, aby oczekiwane RMS na składową wynosiło jedną czwartą pełnej skali ({ "31.75" } LSB w ci8, { "8191.75" } w ci16) lub { "2" } LSB w formacie 2-bitowym. Skala i liczba obciętych elementów są drukowane i zapisywane w pliku towarzyszącym. Wyjście zmiennoprzecinkowe pozostaje bez zmian.

seg-696109ae70f8 = <b>Osiem przypięć wzorców w siedmiu plikach testowych nie zawodzi już na macOS z powodu różnic na ostatnim bicie</b> (część zgłoszenia #36). Przypięcia sprawdzające, że silnik nadal buduje zatwierdzone dane wejściowe wyroczni (jakobiany, tablica stanów, azymuty startu), porównywane bit w bit, zawodziły na macOS arm64 o { "2" } do kilku tysięcy jednostek na ostatnim miejscu. Teraz porównują w granicach { "1e-12" } skali wziętej z pliku wzorcowego; liczby całkowite, klucze i długości nadal porównuje się dokładnie, a test mutacyjny pokazuje, że zmiana względna { "1e-6" } nadal powoduje błąd. Przypięcie azymutu startu porównuje <c1/> i gałąź wstępującą/zstępującą zamiast samego azymutu, ponieważ <c2/> wzmacnia jedną ulp argumentu do około { "3e-9" } rad tam, gdzie nachylenie równa się kodoszerokości miejsca. Żadna tolerancja wyroczni ani wstępnie zarejestrowany próg się nie zmieniły. Dwa testy (łączne OD księżycowe, obserwowalność księżycowa) nie są objęte: na macOS ich wstępnie zarejestrowane porównania same się przesuwają, co pozostawiono do dalszych prac.

seg-b6c354fa0c28 = <b><c1/> i <c2/> stosują flagi toru wejściowego.</b> Tekst pomocy reklamował <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> przy <c9/>, ale <c10/> i <c11/> nigdy nie budowały łańcucha: flagi były po cichu ignorowane, a flaga bez wartości, taka jak <c12/>, pochłaniała następującą po niej flagę. Oba polecenia parsują je teraz tak jak <c13/> i umieszczają świeży łańcuch toru wejściowego przed przebiegiem akwizycji i przebiegiem śledzenia. Wynik jest równy uruchomieniu polecenia na pliku, który zapisuje <c14/> dla tych samych flag.

seg-d7238dab610e = Dane sceny IQ są umieszczane osobno dla każdego sygnału.

seg-46ace9a3e008 = <c1/> (oraz <c2/>) umieszczały bity { "50" } bit/s na każdym sygnale, także pilotach, i z szybkością GPS LNAV na Galileo i BeiDou. Dane podążają teraz za własnym taktowaniem symboli każdego sygnału, podanym przez nowe <c3/> (<c4/>, ustawiane przez każdy konstruktor w <c5/>). To { "10" } ms dla L5-I5, { "4" } ms dla E1-B, { "2" } ms dla BeiDou B1I GEO (D2) oraz bity { "20" } ms z meandrem { "10" } ms dla GLONASS L1OF. Dane są odrzucane na pilotach, na GPS L2C jako jednym strumieniu CM/CL, a <c6/> na wszystkim poza L1 C/A. Kody własne zachowują domyślnie poprzednie taktowanie { "20" } ms. Programowa <c7/>, która żądała <c8/> na kodzie innym niż L1 C/A albo <c9/> na pilocie, generowała po cichu, a teraz zwraca błąd przy pierwszym odczycie.

seg-9dd38fa39d14 = Kanały GLONASS L1OF są pozyskiwane i śledzone na własnej nośnej FDMA.

seg-a775751ed6f6 = <c1/> i kanały śledzenia mieszały każdy kod w dół wyłącznie od <c2/>. W wielokanałowym nagraniu GLONASS wyszukiwanie kanału +{ "3" } znajdowało więc sygnał kanału { "0" } (wszystkie kanały dzielą jeden kod dalmierczy) i nigdy nie szukało { "1.6875" } MHz wyżej. Oba używają teraz <c3/>. Składnik nośnej jest zerowy dla każdego nagrania wyśrodkowanego na własnej nośnej sygnału i jest pomijany, gdy środek jest nieznany, więc przetwarzanie CDMA jest bez zmian. Jeśli obchodziłeś dawne zachowanie, wpisując <c4/> do <c5/> w pliku towarzyszącym, usuń ten składnik: przesunięcie jest teraz stosowane z nośnej i środka, więc pozostawienie go stosuje je dwukrotnie. Znane ograniczenie, tu bez zmian: scena GLONASS identyfikuje każdy satelita po jego kanale częstotliwości <c6/>, a identyfikator satelity <c7/> zawija kanał ujemny. Plik prawdy zapisuje <c8/> jako <c9/> { "4294967289" } (<c10/>). Odczytaj to z powrotem jako <c11/> z rzutowaniem <c12/>.

seg-1c88bffc605b = <b>Warstwa IQ GNSS w CLI i Pythonie (faza A wersji { "0.32.0" }).</b> Istniejący moduł <c1/> można teraz używać bez pisania w Ruście. Pięć nowych poleceń <c2/> dołącza do grupy obsługi danych: <c3/> generuje długą wielosatelitarną scenę IQ do pliku z plikiem prawdy; <c4/> wykonuje akwizycję FFT jednego lub więcej PRN na nagraniu i raportuje każdą detekcję (PRN, Doppler, faza kodu, statystyka, próg); <c5/> pozyskuje, a następnie uruchamia zespół pętli DLL/PLL/FLL na nagraniu i wypisuje dane śledzenia dla każdej epoki (CSV/JSON) z konfigurowalnymi szerokościami pasma pętli, czasem całkowania i odstępem korelatorów; <c6/> odtwarza jedno nagranie przez kilka projektów pętli i raportuje wynikowy jitter i wskaźniki blokady dla każdego projektu; a <c7/> dopasowuje model utraty blokady pętli śledzenia do osi czasu zaufania do odbiornika. Ten sam rdzeń jest udostępniony w Pythonie (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), zwracając listy i słowniki przyjazne dla NumPy. Wyłącznie programowe i addytywne: brak nowych zależności, brak nadawania, brak syntezy przebiegów zakłóceń czy spoofingu; silnik, akwizycja, śledzenie i projekty pętli są własne dla crate, więc wywołujący z CLI lub Pythona otrzymuje te same bity co testy w Ruście. Nowy moduł <c13/>; własny plik prawdy sceny jest niezależną wyrocznią w <c14/> (akwizycja odzyskuje każdą wprowadzoną fazę kodu i Doppler, śledzenie zbiega do wprowadzonego Dopplera). Żadna opublikowana liczba rodzajów scenariuszy ani wiersz macierzy weryfikacji się nie zmienia.

seg-1971e3e9cfe6 = <b>Pozostałe możliwości biblioteki IQ GNSS w CLI <c1/> i Pythonie (faza A.2 wersji { "0.32.0" }).</b> Rozbudowuje fazę A, udostępniając resztę warstwy <c2/> bez pisania w Ruście:

seg-67c485097357 = <b>Kanał propagacyjny w <c1/></b> (i w Pythonowym <c2/>): jonosfera pierwszego rzędu (<c3/>/<c4/> lub <c5/>), troposfera Saastamoinena/Niella (<c6/>), model scyntylacji Cornella (<c7/>, <c8/>, <c9/>), zwierciadlana wielodrogowość od gruntu (<c10/>/<c11/>), trójstanowy kanał lądowo-ruchomy (<c12/>) oraz blok bez linii widzenia (<c13/>) działają na każdy satelita przez nowy wewnętrzny mostek crate (<c14/>), który przekształca bezwzględne ścieżki z modeli kanału do postaci nadmiaru ponad geometrię używanej w scenie.

seg-d736671f2251 = <b>Wyjście SigMF w <c1/></b> (<c2/>): zapisuje próbki jako parę <c3/>/<c4/> z przechwyceniem i adnotacjami dla każdego satelity; <c5/>/<c6/> już czytają SigMF, więc scena przechodzi pełny obieg.

seg-c59ae97779ae = <b>DSP toru wejściowego</b>: nowe polecenie <c1/> i te same flagi w <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) uruchamiają stopnie <c10/> (filtr FIR pasmowy, adaptacyjny notch, wygaszanie impulsów, wycinanie w dziedzinie częstotliwości, AGC, kwantyzator); odzwierciedlone w Pythonie jako <c11/>.

seg-878d66b73571 = <b>Sceny z efemerydami nadawczymi</b>: <c1/> (z <c2/>/<c3/>/<c4/>) umieszcza każdego sprawnego satelitę GPS w jego prawdziwej geometrii nadawczej, używając czytnika RINEX silnika, więc plik prawdy zawiera rzeczywistą odległość, Doppler i fazę kodu dla każdego satelity; odzwierciedlone w Pythonie jako <c5/>. Wyłącznie programowe i addytywne: brak nowych zależności, brak nadawania, brak syntezy przebiegów zakłóceń czy spoofingu (efekty propagacji kanału działają tylko na sygnał prawidłowy). Każde twierdzenie liczbowe jest testowane względem niezależnego wzorca (postać zamknięta lub wprowadzona prawda) w testach jednostkowych kanału i toru wejściowego oraz w <c6/>.

seg-1e71370d87d8 = <b>Warstwa IQ GNSS: symulacja na poziomie sygnału i przetwarzanie programowego odbiornika.</b> Nowy moduł <c1/> przenosi Kshana od jednosatelitarnego toru wejściowego L1 C/A z krótkim blokiem do pełnej warstwy na poziomie sygnału, dostępnej z grupy poleceń <c2/>. Generuje długie, wielosatelitarne surowe sceny IQ z plikiem prawdy dla każdej epoki (<c3/>); stosuje propagację na poziomie sygnału — jonosferę z rozbieżnością kod-nośna, troposferę, scyntylację amplitudy i fazy (model Cornella), wielodrogowość Fresnela i trójstanowy kanał lądowo-ruchomy, z brakiem linii widzenia (<c4/>); pozyskuje i śledzi za pomocą akwizycji FFT i wielokanałowego zespołu pętli DLL/PLL/FLL, odtwarzając jedno nagranie przez wiele projektów pętli (<c5/>, <c6/>); modeluje tor wejściowy — filtrowanie FIR/IIR, kwantyzację od 1 do 14 bitów, AGC, notch, wygaszanie impulsów i wycinanie w dziedzinie częstotliwości (<c7/>); przesyła strumieniowo duże zarejestrowane zbiory danych w ograniczonej pamięci — formaty int8/int16/float32/spakowane 2-bitowe i rzeczywiste IF, wieloplikowy SigMF, resampling, inwentarz zbioru danych z SHA-256 dla każdego pliku i moduł wsadowy (<c8/>); dodaje kody rozpraszające dla GPS L5/L2C, Galileo E1 (CBOC, rzeczywiste kody pamięciowe ICD) i E5a, BeiDou B1C/B1I oraz GLONASS L1OF, każdy sprawdzony względem swojego dokumentu kontroli interfejsu (<c9/>); a także dopasowuje model utraty blokady pętli śledzenia do obserwowanego zachowania prawdziwego odbiornika w przebiegach laboratoryjnych, z błędem zbioru wyłączonego metodą leave-one-run-out i ekstrapolacją oznaczoną jako predykcja (<c10/>). Każde twierdzenie liczbowe jest testowane względem niezależnego wzorca (tablica ICD, postać zamknięta lub niezależny odbiornik odzyskujący wprowadzoną prawdę); fizyczne modele kanału i pętli pozostają MODELLED. To wyłącznie warstwa programowa: zapisuje pliki IQ dla odbiorników programowych i nie syntetyzuje przebiegów zakłóceń ani spoofingu, ani nie steruje sprzętem radiowym. Żadna opublikowana liczba rodzajów scenariuszy ani wiersz macierzy weryfikacji się nie zmienia. Projekt: <c11/>.

seg-943e21ccb25f = Zaufanie do odbiornika: ocena rzeczywistego logu odbiornika GNSS.

seg-f8274120bff2 = <c1/> wczytuje log u-blox UBX, RINEX { "3" } (z opcjonalnym plikiem nawigacyjnym nadawczym), Android GnssLogger lub NMEA { "0183" } do jednej osi czasu ze znacznikami czasu i uruchamia na niej monitory zaufania: spadek stosunku nośnej do gęstości szumu (C/N0), utratę blokady, automatyczną regulację wzmocnienia (AGC), wskaźnik zagłuszania u-blox, skok pozycji oraz, z RINEX i nawigacją, własne rozwiązanie jednopunktowe silnika z autonomicznym monitorowaniem integralności przez odbiornik (RAIM) pod względem parzystości i monitor wspomagany zegarem. Każda epoka jest nominalna, degraded lub nieufna, a wynik podaje kiedy i dlaczego. Zdarzenia i przewidywane spadki C/N0 podane w scenariuszu są oceniane względem tolerancji podanych w tym samym pliku: wykryte, spóźnione lub pominięte oraz zgodne lub niezgodne. Wynikami są JSON wyniku, plik CSV dla każdej epoki i wykres; wynik zawiera SHA-256 logu i każdy próg. Dostępne także z Pythona (<c2/>), pakietu WebAssembly (<c3/>, logi wbudowane) i nowego narzędzia <c4/> serwera Model Context Protocol (MCP). Przewodnik: <c5/>; przykład: <c6/>. Na logach spoofingu JammerTest { "2024" } ścieżka silnika odtwarza pierwszy alarm wstępnie zarejestrowanego potoku wyroczni przy każdym opublikowanym początku (<c7/>). Monitory pozostają MODELLED; żaden wiersz macierzy weryfikacji się nie zmienia.

seg-55669fe92932 = Wydanie pomocnicze. Rundy walidacji { "2" } i pakiety fali 1 zwiększają macierz weryfikacji z { "223" } wierszy ({ "93" } VALIDATED) w { "0.29.3" } do { "249" } wierszy ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); każde podniesienie sprawdzono względem niezależnej wyroczni przy tolerancji ustalonej przed przebiegiem, a każda niezgodność jest publikowana jako ustalenie. Nowe: natywny czytnik jąder NAIF i ścieżka DE440, jedna zwalidowana ścieżka propagacji i czasu SGP4 do ITRS, zmierzona biblioteka zegarów, generator odniesienia LunaNet AFS, solwery o rozszerzonej precyzji i pierwiastkowe solwery informacyjne oraz rzeczywiste przetwarzanie IQ księżycowego na danych LuGRE. Opublikowane liczby, które się zmieniły, są wymienione poniżej jako korekty.

seg-f75f1878045e = Dwadzieścia siedem wierszy macierzy weryfikacji uzyskuje status VALIDATED po tym, jak niezależna wyrocznia zgodziła się w granicach tolerancji ustalonej przed pierwszym porównaniem (reguła podniesienia w <c1/>): dziesięć w pierwszej rundzie walidacji i siedemnaście w drugiej. Pięćdziesiąt jeden wierszy MODELLED poddano zewnętrznej wyroczni w pierwszej rundzie, a pozostałe możliwe do skierowania wiersze w drugiej; każda niezgodność jest poniżej odnotowana jako ustalenie, a nie dostrajana. Trzy wiersze podzielono tak, aby część sprawdzona względem niezależnego wzorca nie niosła niesprawdzonej reszty, co zwiększa macierz z { "223" } do { "226" } wierszy; pakiety walidacji włączone od tego czasu zwiększają ją do { "249" }. Liczby są odczytywane z wygenerowanego <c2/>.

seg-8d542741fa77 = po rundzie { "1" }

seg-ae3743f976c5 = Wiersze macierzy weryfikacji

seg-6c4b1fd56a31 = w tym VALIDATED względem zewnętrznej wyroczni

seg-90450fe87280 = w tym MODELLED

seg-86972e4c7f12 = w tym PARTNER

seg-61c5c5e308ed = Skróty użyte w tym wpisie

seg-5907283b71da = Skrót

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (dla ARAIM); zaawansowane autonomiczne monitorowanie integralności przez odbiornik; Matlab Algorithm Availability Simulation Tool Uniwersytetu Stanforda

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = odchylenie Allana; błądzenie losowe prędkości; błądzenie losowe kąta

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = otwartoźródłowy zestaw narzędzi astrodynamicznych (Nyx Space); zestaw narzędzi NASA Spacecraft, Planet, Instrument, C-matrix, Events z jej Navigation and Ancillary Information Facility; jądro stałych planetarnych

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = Barycentryczny Niebieski Układ Odniesienia; barycentryczny czas dynamiczny; czas ziemski

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Międzynarodowe Biuro Miar i Wag; realizacja uniwersalnego czasu koordynowanego przez laboratorium

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; księżycowe systemy czasu zapisywane w polu TIME_SYSTEM komunikatu

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = dolna granica Craméra–Rao

seg-a1fff77503b4 = CW

seg-064470740a35 = ruch względny Clohessy'ego–Wiltshire'a

seg-d70a9b3e92a7 = Development Ephemeris { "440" } Jet Propulsion Laboratory

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = rozmycie dokładności; rozmycie dokładności pozycji

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = rozszerzony filtr Kalmana; filtr Kalmana typu unscented; system nawigacji inercyjnej; globalny system nawigacji satelitarnej; inercyjna jednostka pomiarowa

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = efektywny próg monitora; pionowy i poziomy poziom ochrony

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = parametry orientacji Ziemi; Międzynarodowa Służba Ruchu Obrotowego Ziemi i Układów Odniesienia; Prediction Comparison Campaign; średni błąd bezwzględny

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = General Mission Analysis Tool NASA

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = sieć nieziemska (3GPP); blok sygnału synchronizacji

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = Międzynarodowa Służba GNSS; Międzynarodowa Służba Pomiarów Laserowych; Międzynarodowy Ziemski Układ Odniesienia { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = całkowitoliczbowa metoda najmniejszych kwadratów; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = błąd międzysystemowy

seg-743c3303e01c = LEO

seg-d7b83e7c427f = niska orbita okołoziemska

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = rozdzielenie rozwiązań dla wielu hipotez; poziom ochrony; poziom ochrony czasu

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = widmowa gęstość mocy; próbki w fazie i kwadraturze; Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kwantowy szum projekcji

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = autonomiczne monitorowanie integralności przez odbiornik

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = system wspomagania oparty na satelitach; amerykański Wide Area Augmentation System; dwuczęstotliwościowy wielokonstelacyjny; geostacjonarny satelita SBAS

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = pierwiastek ze średniej kwadratowej; błąd odległości sygnału w przestrzeni

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = otwartoźródłowa biblioteka pozycjonowania GNSS

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = interferometria o bardzo długiej bazie

seg-c3bc7d828ecc = Każdy wiersz poniżej podaje rodzaj swojej wyroczni (Biblioteka: niezależna biblioteka zewnętrzna obliczająca jednoznacznie określoną wielkość; Dane pomiarowe: rzeczywiste dane zmierzone; P2: niezależna biblioteka numeryczna przeliczająca wielkość algebry liniowej na zatwierdzonych danych wejściowych), wyrocznię, tolerancję ustaloną przed przebiegiem i wynik. Każde podniesienie powtórzył drugi recenzent, który wygenerował plik wzorcowy ponownie bajt w bajt i wykazał, że celowa mutacja silnika zmienia test na czerwony.

seg-be0a4e3ac81c = <b>Fuzja sensorów GNSS/INS</b> (biblioteka), ograniczona do luźno sprzężonego 15-stanowego EKF stanu błędu: NaveGo v1.4 (LGPL-3.0, uruchamiany w GNU Octave) na jego własnym rzeczywistym przejeździe z Ekinox IMU/GNSS. RMS poziomy, pionowy i innowacji pozycji w Kshana wynoszą { "0.912" }, { "0.940" } i { "0.861" } wartości NaveGo (próg { "1.2" }), a jej średnia znormalizowana innowacja wynosi { "0.395" } (próg { "1.5" }). GNSS jest obecny przez cały przejazd, więc nie testowano żadnego zaniku. Ściśle sprzężony UKF i sprzężony filtr zegara pozostają poza twierdzeniem.

seg-0c82afd5ba30 = <b>Budżet błędu orientacji 3-DOF i celowania</b> (biblioteka), zawężony do szczytu momentu gradientu grawitacyjnego: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } przypadków, w granicach { "1e-12" } względnie (najgorszy { "2.1e-15" }). Budżet celowania RSS jest sumą liczb podanych przez wywołującego i pozostaje poza nim.

seg-71cf58e91a09 = <b>Łączna geometria księżycowej komunikacji i nawigacji</b> (biblioteka), zawężona do umiejscowienia miejsca, azymutu, elewacji i odległości: ANISE { "0.10.2" }, { "768" } próbek, w granicach { "1e-6" } stopnia i { "1" } mm (najgorszy { "2.2e-12" } stopnia i { "5.6e-9" } m). Parametr dokładności dalmierczej jest daną projektową spoza twierdzenia.

seg-0687c757231b = <b>Swobodna od momentów dynamika orientacji ciała sztywnego</b> (biblioteka): hub statku Basilisk { "2.9.1" }, { "1e4" } s na dwóch ogólnych tensorach bezwładności, kwaternion i prędkości w granicach { "1e-9" } (najgorsze { "3.3e-11" } i { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>Rozwiązywanie całkowitoliczbowej niejednoznaczności fazy nośnej GNSS (LAMBDA)</b> (biblioteka), zawężone do rozwiązania ILS i jego dwóch najlepszych norm: RTKLIB v2.4.2-p13 <c1/>, { "300" } kowariancji, { "0" } niezgodności całkowitoliczbowych, normy w granicach { "1e-9" } względnie (najgorsza { "5.6e-13" }). Współczynnik powodzenia metodą bootstrap pozostaje sprawdzany tylko wewnętrznie.

seg-c23196cbdc96 = <b>Złożony PL czasu, skalarny MHSS</b> (P2): numpy { "2.3.5" } i scipy { "1.18.1" } na { "300" } zatwierdzonych danych wejściowych, PL w granicach { "1e-9" } względnie (najgorszy { "1.2e-10" }), podzbiór sterujący identyczny.

seg-8f524d815949 = <b>Wybielanie wspólnego trybu GLS i tożsamość Mahalanobisa</b> (P2): numpy { "2.3.5" } LAPACK na { "201" } zatwierdzonych kowariancjach, w granicach { "1e-12" } względnie (najgorszy { "7.9e-16" }); liczby uwarunkowania do { "19.3" }.

seg-b4136cdb8a98 = <b>Dostawca orientacji osi głównych Księżyca z DE440</b> (biblioteka): SPICE <c1/> na binarnym PCK w { "2 000" } epokach poza węzłami, w granicach { "1.7e-5" } rad (najgorszy { "1.7e-6" } rad, około { "3" } m na powierzchni), po poprawce wymienionej w „Fixed”.

seg-c28de00a491c = <b>Wejście i wyjście nagrań SigMF oraz widma Welcha</b> (biblioteka), zawężone do odczytu i zapisu SigMF oraz <c1/>: scipy { "1.18.1" } <c2/> w granicach { "1e-12" } względnie na przedział (najgorszy { "6.0e-14" }); nagrania sigmf-python { "1.13.0" } zdekodowane bit w bit; metadane crate zgodne ze schematem SigMF { "v1.2.6" }. Synteza IQ i jej porównania modelowe pozostają poza nim.

seg-a7756d2e124a = <b>Dopasowanie efemeryd nadawczych LEO i SISRE względem przedziału dopasowania</b> (dane pomiarowe), zawężone do 16-parametrowego dopasowania keplerowskiego i jego SISRE wyłącznie orbitalnego: precyzyjne orbity TU Graz ITSG czterech satelitów względem statystyk Liu et al. { "2025" }, składowe w granicach 1.5x ({ "0.804" } do { "1.087" }) i SISRE w granicach 1.5x ({ "0.716" } do { "0.809" }).

seg-99debd58724a = Ustalenia

seg-3f5b2f54c7bf = Wyrocznia nie zgodziła się z tymi wierszami, więc pozostają MODELLED. Każde ustalenie jest też zapisane w tekście wyroczni wiersza (a więc w <c1/>), z testem, który je przypina.

seg-e28fac875d8c = <b>Estymacja stanu zegara pokładowego:</b> na zbiorze wyłączonym zegarów IGS { "11" } satelitów GPS Block IIF filtr trójstanowy jest spójny o jeden krok naprzód, ale zbyt pewny siebie przy jednej godzinie dla { "9" } z { "11" } (składniki okresowe i flicker nie są w modelu).

seg-5900ce454dc7 = <b>Detekcja spoofingu:</b> na JammerTest { "2024" } żaden monitor na poziomie obserwabli nie zaalarmował w ciągu { "10" } s od żadnego z { "8" } opublikowanych początków, a trzy okna przed początkiem zawierały fałszywe alarmy.

seg-08b6e6aa7d08 = <b>Poziom ochrony czasu przy spoofingu:</b> zmierzony niewykryty błąd czasu przekracza TPL przy { "3" } z { "8" } wykrytych początków (1.9x do 5.3x); kalibracja zegara { "60" } s nie obejmuje wędrowania TCXO odbiornika.

seg-a2f4df11d9cc = <b>Okno startowe i geometria wznoszenia:</b> względem Orekit { "12.2" } geometria zgadza się do zaokrągleń, ale prędkość miejsca wynikająca z obrotu Ziemi nie mieści się w { "1e-6" } względnie przy szerokości { "62.9" } stopnia ({ "1.12e-6" }, ruch bieguna pomijany przez model sferyczny). Runda { "2" }: prędkość dla prawdziwego bieguna z epoką się zgadza, domyślna prędkość bez epoki nadal się nie mieści (zob. poniżej).

seg-f6b6c9251a17 = <b>Korytarz wejścia balistycznego (Allen–Eggers):</b> przewidywane szczytowe opóźnienie dla wejścia Stardust wynosi { "61.8" } g wobec zrekonstruowanych { "32.89" } g (+{ "88" } %, tolerancja { "15" } %).

seg-5d83648dd867 = <b>Łączny błąd UT1 i ruchu bieguna:</b> względem wzoru na dokładność wydrukowanego w { "178" } wydaniach IERS Bulletin A biegun zgadza się w granicach 1.5x, ale UT1 nie ({ "0.48" } przy { "10" } dniach, { "1.59" } przy { "40" } dniach). Zastąpione w rundzie { "2" }: wiersz ma teraz status VALIDATED (zob. poniżej).

seg-98a99bcba894 = <b>Domyślne wejście orientacji Ziemi w trybie offline:</b> astropy potwierdza spis wierszy, ale { "12" } wierszy, które crate nazywa predykcjami Bulletin A, jest oznaczonych jako zmierzone (I), a nie przewidywane (P). Liczby zgodności wiersza operacyjnego predyktora dotyczyły więc wierszy zmierzonych. Zastąpione w rundzie { "2" }: silnik klasyfikuje wiersze według flagi, a wiersz ma status VALIDATED.

seg-d96fbfa4be79 = <b>Błąd predykcji orientacji Ziemi w stylu operacyjnym:</b> błąd UT1 predyktora wynosi od 2.4x do 12.6x błędu Bulletin A przy { "1" } do { "10" } dniach i { "5.32" } ms przy { "10" } dniach, poza zakresem { "0.36" } do { "3.13" } ms w 2nd EOP PCC.

seg-1833bf6e3b6f = <b>Księżycowe geodezyjne VLBI:</b> względem czasów światła ANISE przez DE440 żadne opóźnienie nie mieści się w { "1" } ps; największa różnica to { "24" } µs, głównie z powodu analitycznego środka Księżyca (około { "200" } km od DE440). Runda { "2" }: ścieżka jąder ma status VALIDATED we własnym wierszu; ta ścieżka analityczna pozostaje MODELLED.

seg-0ec8a2a91702 = <b>Księżycowy eksport interoperacyjny:</b> Orekit { "12.2" } odrzuca systemy czasu LTC i TCL, więc wymiana księżycowych plików OEM z drugim czytnikiem nie jest ustalona.

seg-09cfd4e61b7b = <b>Ruch względny Clohessy'ego–Wiltshire'a:</b> względem nieliniowego ruchu w Orekit przy { "100" } m różnica wynosi od { "1.2" } do { "6.3" } mm, powyżej { "1" } mm; skaluje się jak pominięty człon drugiego rzędu, więc wstępnie zarejestrowana tolerancja leżała poniżej błędu linearyzacji. Zastąpione w rundzie { "2" }: poprawka drugiego rzędu ma status VALIDATED względem tego samego progu.

seg-af1bdd974ba5 = <b>Wzrost błędu dryfu INS/TRN:</b> względem swobodno-inercyjnego Monte Carlo NaveGo prawa wzrostu zgadzają się w granicach { "5" } % do { "600" } s i zawyżają poza nimi (2.2x do 8x po godzinie), ponieważ pomijają sprzężenie zwrotne Schulera. Zastąpione w rundzie { "2" }: model błędu Schulera ma status VALIDATED.

seg-8459bc50f8b4 = <b>Księżycowa objętość usługi z rzeczywistej geometrii konstelacji:</b> { "4" } z { "12" } opublikowanych statystyk dostępności różni się o więcej niż { "2" } punkty procentowe (do { "22.5" }).

seg-7a0fd1377b9c = <b>Górne ograniczenie obciążenia identyfikowalności heterogenicznego UTC(k):</b> na { "105 024" } wierszach BIPM ograniczenie jest przekroczone w { "50.8" } % wierszy; opublikowana niepewność ogranicza pomiar przesunięcia przez BIPM, a nie samo przesunięcie.

seg-814acf34cffd = <b>Klasyfikacja przestrzeni zerowej księżycowego datum:</b> na opublikowanej geometrii pięciu reflektorów korelacja wynosi -0.78 wobec -0.97, a CRLB początku układu jest o { "96" } do { "98" } % niższe niż w artykule.

seg-da01b5e08a87 = <b>Podłoże geometrii datum księżycowego LLR:</b> względem { "192" } normalnych punktów księżycowych ILRS z { "2024" } RMS reszty jednokierunkowej wynosiło { "96" } m przy wcześniejszej interpolacji orientacji, a po poprawce poniżej wynosi { "22.7" } m, nadal powyżej progu { "10" } m (zaokrąglone współrzędne stacji, brak ruchu bieguna). Szereg orientacji po cichu przycina wartości poza 2024-2025. Runda { "2" }: model zmierzonej odległości ma status VALIDATED we własnym wierszu ({ "2.81" } m); szereg obejmuje teraz 2014-2030 i zgłasza błąd poza nim.

seg-fd9ad94680e9 = <b>Sprzężenie względnościowego tempa zegara z układem odniesienia:</b> człon potencjału własnego jest { "3.18e-4" } powyżej wartości opublikowanej (tolerancja { "1e-4" }); artykuł oblicza inny potencjał, więc nie istnieje opublikowana wartość tej postaci zamkniętej. Zastąpione w rundzie { "2" }: równikowy potencjał stopnia 2 ma status VALIDATED względem tego samego artykułu.

seg-e002819c1e2d = <b>Stałe fizyczne każdego ciała Układu Słonecznego:</b> { "12" } z { "84" } stałych dodanych ciał różni się od NAIF pck00011 i gm_de440 (starsze elementy księżyców Marsa; inne rozwiązania GM dla Urana, Neptuna i Plutona). Runda { "2" }: stałe podążają teraz za NAIF (transkrypcja, nieliczona), a obliczona orientacja zgadza się z SPICE; wiersz pozostaje MODELLED.

seg-e722d242e78e = <b>Wybieralne modele efemeryd LEO:</b> dopasowanie 22-parametrowe pozostawia 1.71x i 1.86x opublikowanego błędu wzdłuż toru na łukach { "20" } min, powyżej 1.5x. Zastąpione w rundzie { "2" }: model 22-parametrowy i jego dopasowanie mają status VALIDATED we własnym wierszu.

seg-c136023752df = <b>Łączne pozycjonowanie GNSS i LEO:</b> błąd międzysystemowy zgadza się z RTKLIB, ale { "93.2" } % epok mieści się w { "3" } m od ITRF2020 wobec { "95" } %; sam RTKLIB osiąga na tych danych { "88.2" } % ({ "93.6" } % po poprawce opóźnienia grupowego z rundy 2).

seg-e5f0e3c21def = <b>Ślepota integralności w trybie wspólnym</b> i <b>mapy pokrycia i DOP:</b> oba porównania przeszły, ale odrzucono je w przeglądzie, ponieważ celowo błędny silnik też je przechodzi (pierwsze sprawdza tylko tożsamość wewnętrzną; opublikowane dolne granice drugiego nie widzą podwojonego PDOP). Runda { "2" }: ślepota integralności w trybie wspólnym ma status VALIDATED na danych wejściowych z parzystością; mapy pokrycia pozostają ustaleniem (zob. poniżej).

seg-688e1753cd53 = Runda walidacji { "2" }

seg-b320fbdb72c3 = Druga runda objęła każdy wiersz, który pierwsza runda pozostawiła możliwym do skierowania, ze świeżymi wstępnymi rejestracjami zatwierdzonymi przed pobraniem jakiegokolwiek pliku wzorcowego lub uruchomieniem wyroczni, z adwersaryjnym drugim recenzentem, który powtórzył każde porównanie, i celową mutacją silnika, która musi zmienić każdy test na czerwony. Właściciel zaakceptował poprawione sformułowanie wiersza ograniczenia poza Omega w dniu 2026-10-02, zanim go podniesiono (jego stary tekst przeczył kodowi).

seg-7b7c584caaaf = <b>Podniesione do VALIDATED ({ "17" }).</b> Rodzaj wyroczni w nawiasach; tolerancja ustalona przed przebiegiem.

seg-555e6ad454d2 = <b>Sprzężenie względnościowego tempa zegara z układem odniesienia</b> (odniesienie): Ashby i Patla { "2024" } L_m w granicach { "2.8e-6" } (próg { "1e-4" }) z równikowego potencjału stopnia 2 obu pól cytowanych przez artykuł; grawitacja pyshtools stopnia 350 dla wejścia radialnego ({ "8.3e-5" }); prędkość księżycowa DE441 ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Domyślne wejście orientacji Ziemi w trybie offline</b> (biblioteka): astropy { "8.0.1" } i IERS Bulletin A nr { "039" } potwierdzają { "30" } wierszy ostatecznych, { "54" } szybkich i { "90" } przewidywanych ponownie wyciętego wyciągu.

seg-b77253dd26b5 = <b>Łączny błąd UT1 i ruchu bieguna</b> (biblioteka): pełne rotacje astropy i pyerfa odtwarzają tablicę łączną (UT1 i biegun w granicach { "6e-16" }, kombinacja w granicach { "1.9e-7" }); zrealizowane błędy z IERS Annual Report { "2019" } dają ilorazy od { "1.001" } do { "1.100" }.

seg-378414f812c1 = <b>Ślad i pokrycie ładunku obserwacji Ziemi</b> (biblioteka): Orekit { "12.2" } i GeographicLib { "2.1" } przy każdym wstępnie zarejestrowanym progu, z regresją węzłów J2 uwzględnioną teraz w rozstawie węzłów.

seg-792bf58a1c1e = <b>Ruch względny Clohessy'ego–Wiltshire'a</b> (biblioteka): z poprawką drugiego rzędu w postaci zamkniętej, w granicach { "1.2e-7" } m od nieliniowego ruchu w Orekit wobec { "1e-3" } m; sama macierz liniowa pozostaje scharakteryzowana (od { "1.2" } do { "6.3" } mm).

seg-423437d90022 = <b>Celowanie w płaszczyźnie B i asysta grawitacyjna metodą stożków sprzężonych</b> (biblioteka): GMAT R2026a płaszczyzna B, asymptoty, C3 i elementy heliocentryczne; sbpy { "0.6.0" } oraz Kasuga i Jewitt { "2019" } dla parametru Tisseranda.

seg-b29b0dfcd3a4 = <b>Wzrost błędu dryfu INS/TRN</b> (biblioteka): dziewięciostanowy model błędu Schulera w granicach { "5" } % od poprawionych przebiegów dryfu NaveGo we wszystkich { "48" } punktach (najgorszy { "3.70" } %).

seg-8cc49496b4c6 = <b>Ślepota integralności w trybie wspólnym</b> (P2): numpy <c1/> na { "1464" } danych wejściowych z parzystością w granicach { "1e-12" } (najgorszy { "1.06e-14" }).

seg-f0ff538b7329 = <b>Księżycowe łączne wielotechnikowe OD i zegar</b> (P2): numpy przelicza każdy krok Gaussa-Newtona, sigmę i błąd stacji w sześciu sieciach (w granicach { "2.4e-11" }) po poprawce rozwiązania QR.

seg-7ed9b059f888 = <b>Kowariancja współrzędnych stacji księżycowego VLBI</b> (biblioteka): jakobian zbudowany w SPICE odtwarza harmonogram, widmo, sigmy i przestrzeń zerową w granicach { "1" } % i { "0.1" } stopnia; numpy do { "2e-13" }.

seg-0e4e1c3fc899 = <b>Górne ograniczenie niewykrywalnego błędu w trybie wspólnym dla reszty poza Omega</b> (P2, sformułowanie poprawione decyzją właściciela): numpy LAPACK na { "256" } przypadkach w granicach { "1e-12" }, sześć dokładnych nieskończoności.

seg-0fc8ce9cde6c = <b>Klasyfikacja przestrzeni zerowej niezmiennicza względem bazy</b> (P2): przecięcie podprzestrzeni w SciPy i NumPy na { "72" } skonstruowanych macierzach, liczby całkowite dokładnie, norma rzutnika w granicach { "6.0e-15" }.

seg-4e5e7a6072bc = <b>Jednoczęstotliwościowe usługi jonosferyczne i UTC komunikatu nawigacyjnego LEO</b> (biblioteka): GNSSTk { "15.3.1" } dla Klobuchara, Az i dryfu UTC; ERFA dla trzech przypadków sekundy przestępnej.

seg-a644bf49c816 = <b>Granica pozycjonowania w sieci nieziemskiej 5G</b> (P1): granice pojedynczego SSB Bachl, Lei i Nabeel { "2026" } w granicach połowy drukowanej cyfry; numpy dla kowariancji rozwiązań.

seg-b326f6fc55ad = <b>Model zmierzonej odległości LLR</b> (dane pomiarowe, nowy wiersz wydzielony z podłoża datum LLR): { "192" } normalnych punktów księżycowych ILRS przy { "2.81" } m RMS wobec progu { "10" } m, z barycentrycznym czasem światła IERS { "2010" }; składowe poniżej progu nie są rozdzielane jedna po drugiej, i wiersz to mówi.

seg-82e9fba684dc = <b>Księżycowe geodezyjne VLBI, ścieżka jąder</b> (biblioteka, nowy wiersz wydzielony z wiersza księżycowego VLBI): zbieżne czasy światła SPICE w granicach { "1" } ps i pochodne cząstkowe w granicach { "1e-6" } w epokach bliskich J2000; domyślna ścieżka analityczna pozostaje MODELLED.

seg-03c47d262ff3 = <b>22-parametrowy model efemeryd LEO Liu et al. { "2025" } i jego dopasowanie</b> (dane pomiarowe, nowy wiersz wydzielony z wiersza modeli wybieralnych): rzeczywiste precyzyjne orbity w granicach 1.5x opublikowanych statystyk w dniach z artykułu i dniach wyłączonych ({ "0.683" } do { "1.186" }); konwencja skali n_dot jest przepisana i nie jest sprawdzana tym porównaniem, a reguła zatrzymania to reguła zbieżności parametrów Kshana, a nie reguła zmiany RMS z artykułu. Wielomian ATOMIC i tabela pięciu wysokości pozostają MODELLED.

seg-b49f96eb52ad = Istniejące wiersze VALIDATED ponownie oparte na wzorcu (bez zmiany liczby).

seg-4e26bec3297c = <b>Pozycje planet z elementów JPL Standish</b> i <b>czas światła między ciałami Układu Słonecznego</b>: post factum ustalone progi dwukrotnie nominalne zastąpiono wstępnie zarejestrowanymi porównaniami z JPL Horizons DE441 (RMS co najwyżej wartość z Explanatory Supplement, tabela { "8.10.1" }, najgorszy { "0.778" }, wraz z podziałem Ziemi i rotacją ICRF; czasy światła w granicach { "1e-6" } s od Horizons na pozycjach DE441, najgorszy { "6.7e-9" } s). Ich flagi „limit ustalony po porównaniu” usunięto.

seg-d3b745392d29 = <b>Integralność (RAIM/ARAIM/SBAS)</b>: wiersz nie opiera się już na kontrolach wiarygodności. Mówi teraz: rozdzielenie rozwiązań dla wielu hipotez ARAIM z ADD v4.2 zgadza się ze Stanford MAAST dla ARAIM { "2" } na { "270" } rzeczywistych przypadkach (najgorsza różnica VPL { "2.2e-3" } m wobec { "0.05" } m); detekcja i wykluczanie w migawkowym RAIM zgadzają się z RTKLIB <c1/> w { "2016" } z { "2016" } decyzji, z poziomem ochrony nachylenia w granicach { "2.7e-12" } m; poziomy ochrony SBAS DO-229E L1 zgadzają się ze Stanford MAAST na rzeczywistych transmisjach WAAS ({ "2868" } par w granicach { "1.6e-5" } m). Mówi wprost, że funkcje o jednolitej sigmie <c2/> i <c3/> NIE są zgodne z ADD (różnice przy dopasowanych danych wejściowych 0.75/4.04 m i 0.39/1.93 m VPL/HPL, ustalenie), że porównanie DFMC L5 SBAS jest ustaleniem ({ "308" } par bez GEO w widoku jest chronionych przez Kshana, a nie przez MAAST) oraz że <c4/> nie ma porównania zewnętrznego. Jego samooznaczenie usunięto.

seg-d059b9953c3f = <b>Dopasowanie efemeryd nadawczych LEO</b>: scałkowana orbita prawdziwa została dodana do części sprawdzonej względem niezależnego wzorca (Orekit { "12.2" } w granicach { "4.55" } mm w ciągu { "6" } h, próg { "2" } cm); wielomiany korekcyjne, dopasowanie zegara i kompromis okresu aktualizacji pozostają obliczone z modelu.

seg-166d511bbba3 = <b>Ustalenia i zablokowane wiersze (pozostają MODELLED).</b> Tekst wyroczni każdego wiersza zawiera ustalenie i jego przypięty test.

seg-7f233dbdf110 = Modulacja sygnałów nawigacyjnych (Betz { "2001" }, Hein { "2006" }): widma i korelacje się zgadzają; boczne listki { "24" } MHz i każde obciążenie wielodrogowości (o { "11" } do { "15" } % za niskie) nie, przyczyna nierozstrzygnięta.

seg-4d5a6bb44d64 = Geolokalizacja TDOA/FDOA: granice zgadzają się z Ho i Chan oraz Ho i Xu, a także z kodem autorów w granicach { "3e-12" }; czynniki z Ottawy wydrukowane z Monte Carlo różnią się o { "1.3" } % i { "4.4" } %.

seg-5fa189f788ca = GNSS Ziemi w odległości księżycowej: średnie zenitalne GENESIS zgadzają się z Montenbruck et al. { "2023" } w { "5" } z { "6" }; średnie nadirowe są o { "1.0" } do { "2.4" } satelity za wysokie.

seg-d7e5b5a64f43 = Mapy pokrycia i DOP: projekty ziemskie zgadzają się z Orekit, gnss_lib_py i numpy przy każdym progu; projekty księżycowe i marsjańskie przekraczają { "1e-9" } tylko w komórkach bliskich osobliwości.

seg-3c8fb07d83ec = Łączne pozycjonowanie GNSS: dwuczęstotliwościowe { "79.9" } % i produkty precyzyjne { "94.2" } % w granicach { "3" } m wobec { "95" } % (RTKLIB { "67.9" } % i { "94.1" } %); różnica ISB dla produktów precyzyjnych wynika z ignorowania przez RTKLIB przesunięć anten.

seg-5d3d4d99fbc4 = Pętle śledzenia (GNSS-SDR { "0.0.19" }): zgadzają się przy { "35" } do { "45" } dB-Hz; przy { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, progi +{ "1.5" } dB; czasy poślizgu krótsze o { "0.5" } do { "2" } rzędów wielkości.

seg-0dd24947169c = Księżycowa objętość usługi (Orekit i Hipparchus): { "155" } z { "160" } wartości się zgadza; wymaganie najgorszej próbki zawodzi na geometrii LNCSS B bliskiej osobliwości.

seg-74002245287f = Kwantowy czujnik inercyjny: próg tylko QPN jest o { "21" } do { "31" } % poniżej zmierzonego szumu Gauguet { "2009" } (próg { "30" } %, chybiony o { "0.5" } punktu).

seg-ab8b17cf325e = Predefiniowane oscylatory: zmierzone egzemplarze przekraczają predefiniowane wartości holdover rubidu, krótkookresowe cezu i najgorszego egzemplarza CSAC; predefiniowany OCXO nie ma zmierzonego zapisu.

seg-81ad9b839a28 = Gęstość pogody kosmicznej: Jacchia { "1971" } mieści się w czynniku { "2" } względem gęstości z akcelerometrów w maksimum słonecznym, ale jest około 1.7x za gęsta w minimum { "2008" }.

seg-68e5d0942847 = Ukośne TEC wolne od geometrii: { "33" } z { "36" } łuków w granicach { "3" } TECU od mapy CODE (najgorszy { "6.84" }).

seg-f410ce9cf195 = Detekcja spoofingu i TPL względem oficjalnego logu JammerTest { "2024" }: { "4" } z { "10" } początków wykryto na czas; TPL jest przekroczony w { "4" } z { "10" }.

seg-41eb2c318469 = Filtr zegara na świeżych zegarach IGS: dwa z { "11" } satelitów nie spełniają kryterium sumy innowacji.

seg-064b623e918b = Predyktor EOP metodą najmniejszych kwadratów z autoregresją: UT1 { "1.73" } do 2.11x Bulletin A przy { "2" } do { "10" } dniach.

seg-d98571cc21f4 = Górne ograniczenie zrealizowanego przesunięcia UTC(k): łączne przekroczenie { "0.0333" } wobec { "1e-2" }.

seg-527aca91ec7c = Księżycowe datum układu odniesienia z kampanii: ramię SPICE się zgadza; ramię P2 z estymowanymi stacjami nie mieści się w { "1e-9" } na zadaniu o uwarunkowaniu 2.1e8.

seg-9805c4c821f9 = Księżycowe datum układu odniesienia z rzeczywistego LLR: { "15" } z { "16" } wielkości zgadza się z SPICE; sigma translacji z jest o { "1.03" } % za wysoka wobec { "1" } %.

seg-08e6c541b59e = Wejście w atmosferę (Allen-Eggers): rozwiązanie masy punktowej zgadza się z rekonstrukcjami agencji (tylko kontrola krzyżowa); porównanie z akcelerometrem jest zablokowane w oczekiwaniu na czytelne źródło Hayabusa2.

seg-0bb78ffbd915 = Maski ITU-T: wydrukowane wartości przykładowe się zgadzają; limity klas G.8273.2 ich nie mają (zablokowane).

seg-308c1bca3fd9 = Geometria okna startowego: prędkość miejsca dla prawdziwego bieguna z epoką zgadza się z Orekit ({ "4.9e-8" }); domyślna prędkość bez epoki nadal się nie mieści ({ "1.12e-6" }). Nie podniesiono; dalsze prace w toku.

seg-f0b7c3d60df8 = Stałe fizyczne każdego ciała: teraz { "0" } z { "84" } różni się od NAIF (transkrypcja), a obliczona orientacja zgadza się z SPICE w granicach { "1.4e-10" } rad. Nie podniesiono; dalsze prace w toku.

seg-a5a787c9a761 = Zablokowane decyzją właściciela dotyczącą zakresu, każde z zatwierdzonym zgodnym porównaniem: obserwowalność bezwzględna stacji księżycowych, DOP latarni powierzchniowych, eksport poza osią celowania, moc detekcji międzymodalnej, statystyka spójności trybu wspólnego i pokrycie polarnych LEO.

seg-cf638ec9878b = Zablokowane brakiem danych: budżetowanie błędu transferu czasu (wymaga redukcji rzeczywistych danych), C/N0 JammerTest (położenie anteny i podział mocy nieudokumentowane).

seg-e8709509eef3 = Korekty (opublikowane liczby, które się zmieniły, stare -> nowe).

seg-5e93ab237b15 = Poziomy ochrony <c1/> leżą teraz na geodezyjnym poziomie lokalnym zamiast radialnego: do { "0.31" } m HPL i { "0.14" } m VPL w ABMF ({ "16" } stopni N); żaden wzorzec złoty się nie zmienił, ale zapisane podsumowanie samouczka <c2/> zmienia się ze średniego HPL { "22.1" } m / VPL { "40.0" } m na { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Domyślne sprzężenia układu tempa księżycowego: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } na metr.

seg-8ac9cb8c5631 = Domyślny przebieg EOP w trybie offline (<c1/>, komórki wymienione w <c2/>): predicted_rows { "12" } -> { "90" }; próg bieguna { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; wiersze tabeli { "2" } w <c3/>; zgodność predyktora operacyjnego 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

seg-dd93329245ba = <c1/> liu22 SISRE orbita/z zegarem: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

seg-e4205dfdb0d2 = Tabela wysokości Liu, Kshana (iloraz): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = Skala <c1/> komunikatu nawigacyjnego LEO { "2" }^-60 -> { "2" }^-58 (niezarejestrowana wstępnie, ujawniona; poza porównaniem dopasowania); CRC ramki próbki liu22 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = Tabela weryfikacji <c1/>: wiersz Liu i ATOMIC podzielono na 22-parametrowy wiersz VALIDATED oraz wiersz ATOMIC i pięciu wysokości MODELLED.

seg-537f5d80b66c = Tekst wiersza orientacji osi głównych Księżyca z DE440: zakres 2024-2025 / { "731" } wierszy -> 2014-2030 / { "6 209" } wierszy; „po cichu przycina” -> błąd poza zakresem.

seg-17a5dd090566 = Scenariusz <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nowe pola inclination_deg ({ "98.19" }) i nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (zegar odniesienia TDOP/GDOP to teraz konstelacja o najniższym numerze w widoku): globalne GDOP maks. { "2.2236" } -> { "2.1205" }, średnia { "1.122" } -> { "1.131" }, mediana { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" } oraz mapa GDOP dla każdej komórki; mean_visible_by_constellation sumowane jako liczby całkowite (około { "1e-12" } względnie, niewidoczne przy { "4" } miejscach dziesiętnych).

seg-e48b212c4881 = Łączne rozwiązanie jednoczęstotliwościowe GNSS po poprawce opóźnienia grupowego transmisji: { "93.2" } % -> { "93.6" } % w granicach { "3" } m; mediana ISB -0.351 -> -0.114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (SNR pętli Costasa rho/4): przy progu { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; przy { "25" } dB-Hz { "9.55" } -> { "1.60" }; przy { "22" } dB-Hz { "2.24" } -> -0.14.

seg-789a302679f7 = <c1/>: każde wyjście zmienia się wraz z modelem błędu Schulera; szczyt TRN dostarczonego scenariusza { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = Raport <c1/>: nowy klucz geometry_path („analytic” w przebiegu domyślnym, żadna wartość liczbowa się nie zmieniła); nowe opcjonalne pola planetary_kernel_path, earth_orientation_kernel_path i moon_orientation_kernel_path, z epoch_partials na ścieżce jąder; opis rodzaju przepisano. Wyrocznią wiersza weryfikacji dla ścieżki jąder jest SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) staje się kontrolą krzyżową oceny jąder.

seg-3631a31e7b26 = Stałe ciał: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uran { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptun { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluton { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); promień równikowy Phobosa { "13.1" } -> { "13.0" } km; biegun i południk zerowy Phobosa i Deimosa z pck00011; prime_meridian_deg Układu Słonecznego zawiera teraz człony kwadratowe i okresowe.

seg-ac1251d7a0fd = <c1/> (<c2/> na Europie), z pełnej orientacji Europy pck00011 (7cfd66b4; orientacja zgadza się z SPICE pxform w granicach { "1.4e-10" } rad), co przesuwa lądownik w przestrzeni inercjalnej: dostępność tylko przekaźniki / z odległością od Ziemi { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } z { "171" } epok tylko przekaźniki), mediana PDOP { "5.266" } -> { "5.360" }, RMS błędu rozwiązania { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, mediana sigmy formalnej { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. Tabela w <c3/> i przypięcie w <c4/> podążają za tym; <c5/> pozostaje bez zmian.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), skalibrowany czynnik zastąpiony przez Jacchia { "1971" }: activity_density_kg_m3 przy 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k usunięto, dodano mean_exospheric_temperature_k ({ "1186.7" } K); <c2/>: wahanie cyklu słonecznego przy { "800" } km wynosi teraz 10.4x (NRLMSISE-00 13.6x), a asercja wysokości podąża za wzrostem NRLMSISE do { "500" } km i spadkiem przy { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (tekst podsumowania bez zmian: { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (rozwiązanie QR): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> wygenerowano ponownie dla nowych i usuniętych pól powyżej.

seg-717c51e1cca0 = Pakiety walidacji

seg-4ec44f8a5f8e = D12, rozszerzona precyzja i solwer pierwiastkowy (dwa nowe wiersze VALIDATED: { "226" } -> { "228" } wierszy, { "110" } -> { "112" } sprawdzonych względem niezależnego wzorca).

seg-d28005966948 = Część { "1" }, wyrocznia o rozszerzonej precyzji:

seg-9a5f94973450 = Księżycowe datum układu odniesienia z estymowanymi stacjami: 50-cyfrowa wyrocznia mpmath o rozszerzonej precyzji (wstępnie zarejestrowana 804662d5, progi skalowane uwarunkowaniem z wzoru a priori na błąd wsteczny) zgadza się na nowej dacie kampanii (2026-03-18) i na pierwotnym scenariuszu 2024-01-01; nowy wiersz VALIDATED w P2. Rozstrzyga wcześniejszy spór o podwójną precyzję: sigmy datum silnika odbiegają do { "9.7e-6" }, drogi odwrotności i wartości własnych w NumPy do { "6.2e-6" }, a jego drogi Cholesky'ego i QR o około { "1e-8" }. Silnik mieści się w swoim ograniczeniu błędu, ale jest około tysiąc razy mniej dokładny niż droga faktoryzacji.

seg-b055435a2138 = Środowisko wyroczni: dodano mpmath { "1.3.0" }.

seg-d0c2b2a8e635 = Korekty: brak. Żaden plik wzorcowy ani opublikowany rysunek się nie zmienia; wiersz „Księżycowe datum układu odniesienia z kampanii obserwacyjnej” pozostaje MODELLED (decyzja założyciela 2026-10-02, opcja A: nie pożycza statusu osobnego wiersza); jego tekst testów przywołuje nowy test i jego ustalenie.

seg-50b53908fb7c = Część { "2" }, solwer datum w postaci pierwiastkowej informacji:

seg-4c6089cfac5e = Nowy opcjonalny solwer pierwiastkowej informacji (<c1/>; <c2/> w scenariuszu lunar-frame-campaign): QR Householdera, marginalizacja przez czynnik trójkątny, SVD Jacobiego dla widma i produkty kompensowane wyłącznie z poprawnie zaokrąglonych operacji. Względem 50-cyfrowej wyroczni (wstępnie zarejestrowana b41908c9) jego sigmy datum zgadzają się w granicach { "3e-13" } na nowej dacie (2026-06-09); na danych wejściowych z 2026-03-18 i 2024-01-01 solwer domyślny odbiega do { "1e-5" }. Nowy wiersz VALIDATED w P2. Solwer domyślny i jego wyjście pozostają bez zmian. Wstępnie zarejestrowane progi poświadczają błędy tylko powyżej około { "2e-7" } względnie: odrzucają solwer domyślny, ale nie odwrócony znak Householdera, nieskompensowany iloczyn skalarny ani widmową odwrotność końcową, i wiersz to mówi.

seg-de9aeb2adde0 = Opcjonalne ścieżki pierwiastkowe obok niezmienionych wartości domyślnych: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> i <c6/>, na nowych <c7/> i <c8/>. Każda zgadza się ze swoją wartością domyślną tam, gdzie obie są dokładne (kontrola wewnętrzna, bez wiersza; nie twierdzi się dla nich żadnej walidacji). <c9/> deleguje teraz do wspólnej procedury; jego wyjście i domyślne wyjście każdego scenariusza pozostają bez zmian.

seg-87a632404f32 = Decyzje o rzędzie kampanii układu księżycowego: wstępnie zarejestrowana kontrola o rozszerzonej precyzji na { "40" } dniach potwierdza każdą rozstrzygalną decyzję bloku stacji i pełnego rzędu Helmerta. Ograniczenie a priori nie może poświadczyć { "20" } dni Helmerta z deficytem rzędu; w arytmetyce dokładnej ich defekt jest geometryczny, a próg { "1e-9" } leży wewnątrz naturalnego zakresu ilorazów wartości własnych kampanii. Bez wiersza.

seg-3b24e7fa36bf = Twierdzenie wiersza kampanii o rozszerzonej precyzji zawężono do „w granicach ograniczenia najgorszego przypadku”, a jego kontrola najsłabszego kierunku przy ustalonych stacjach mierzy teraz rzeczywisty kąt ({ "6.6e-16" } rad; komparator zmieniono z acos na cięciwę, próg nie).

seg-4fad02ab4b6d = Korekty: brak. Żaden plik wzorcowy ani opublikowany rysunek się nie zmienia; wiersz „Księżycowe datum układu odniesienia z kampanii obserwacyjnej” pozostaje bez zmian i nadal MODELLED (decyzja założyciela 2026-10-02, opcja A).

seg-627d3357d620 = D4, szkielet efemeryd jąder JPL, faza { "1" } (cztery nowe wiersze VALIDATED: { "228" } -> { "232" } wierszy, { "112" } -> { "116" } sprawdzonych względem niezależnego wzorca).

seg-30e8a645191f = Czytnik jąder NAIF ma własny wiersz.

seg-98ff121aa2a9 = <c1/> (kontener DAF, SPK typu { "2" }, binarny PCK typu { "2" }) zgadza się z SPICE Toolkit (CSPICE N0067 przez spiceypy { "8.2.0" }) i z ANISE { "0.10.6" } na wszystkich { "600" } stanach DE440 i { "200" } rotacjach orientacji księżycowej losowej siatki wylosowanej ze skrótu własnego zatwierdzenia wstępnej rejestracji (abcd9133), w granicach progów wyprowadzonych wcześniej z oceny Czebyszewa w podwójnej precyzji (najgorszy { "0.6" } % progu, { "1.95e-3" } m). Wiersz twierdzi, że silnik czyta jądra JPL poprawnie, a nie że DE440 lub szereg analityczny jest dokładny (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: pozycje DE440 (lub dowolnego SPK typu 2) przez własny czytnik silnika, z dwuczęściowymi epokami TDB i SHA-256 jądra zachowanym do raportów; nigdy nie podstawia barycentrum układu za planetę. <c2/> pozwala ścieżce geometrii wybrać szereg analityczny (domyślnie) lub jądro.

seg-6c7dae98601e = <b>Opcjonalny Księżyc z jądra dla <c1/> i <c2/></b>: klucz <c3/> czyta geocentryczny środek Księżyca z jądra; nic innego się nie zmienia, a raport zyskuje blok <c4/> nazywający jądro i jego SHA-256. Bez klucza oba raporty są bajt w bajt identyczne jak wcześniej.

seg-74e8def84747 = <b>Kowariancja punktu na powierzchni Księżyca na ścieżce jąder</b> (nowy wiersz VALIDATED): przy wszystkich stacjach ustalonych i latarni na Księżycu DE440 kowariancja latarni zgadza się z jakobianem czasu światła SPICE (najgorszy { "1.7e-3" } wobec progu { "1" } %) i odwrotnością w NumPy ({ "4e-14" } wobec { "1e-9" }), wstępnie zarejestrowana 4a51256 (<c1/>). Wiersz ścieżki analitycznej pozostaje MODELLED: na analitycznym Księżycu jej najmniejsza sigma latarni jest o { "3.9" } % poniżej wyroczni.

seg-55002d236ab0 = <b>Księżycowe datum układu odniesienia z rzeczywistej kampanii, środek Księżyca z jądra</b> (nowy wiersz VALIDATED): na { "447" } niewidzianych normalnych punktach z 2019-Q2, wstępnie zarejestrowanych 830d945a przed pobraniem któregokolwiek, kowariancja datum na ścieżce jąder zgadza się z niezmienioną wyrocznią SPICE i NumPy w granicach { "7.6e-5" } wobec progów { "1" } % i { "2" } % (<c1/>). Założyciel zdecydował, że ten wiersz jest podnoszony tylko na świeżych punktach; diagnostyka na widzianych danych (c51f8b2) jest ustaleniem, a nie dowodem. Próg nie rozróżnia modeli Księżyca: analityczny Księżyc też przechodzi na tym samym wycinku (najgorszy { "3.8e-3" }), planowana mutacja (Księżyc z jądra spóźniony o godzinę) nie została wykryta, a przy zgięciu środek Księżyca błędny o około { "4,650" } km (Księżyc wzięty wokół barycentrum Ziemia-Księżyc) również przeszedł. Wiersz twierdzi kowariancję na tej ścieżce, a nie środek Księżyca, i to mówi.

seg-f147f9257b8b = <b>Pozycje Słońca, Księżyca, Merkurego i Wenus z DE440 w epokach UTC</b> (nowy wiersz VALIDATED): <c1/> zgadza się ze Skyfield { "1.54" } na { "600" } pozycjach między { "1973" } a { "2026" }, najgorszy { "2.96" } m, w granicach wstępnie zarejestrowanego progu (0bfafe6d) wyznaczonego dwuczłonowym szeregiem TDB − TT (<c2/>). Pozycje planet otrzymują teraz ten nowy wiersz jąder; wiersz Standisha i wiersz księżyców planet pozostają bez zmian, a księżyce czekają na scenariusz, który ich potrzebuje (decyzja założyciela).

seg-bb840641c655 = Ustalenia: jedyne chybienie porównania datum LLR (sigma translacji z { "1.025" } % wobec { "1" } %) spada do { "0.049" } %, gdy z DE440 czyta się tylko środek Księżyca, na widzianych danych (<c1/>); na świeżym wycinku { "2019" } analityczny Księżyc także przechodzi, więc chybienie z { "2015" } było marginalne względem geometrii tamtego kwartału. Wiersze analityczne „Księżycowe datum układu odniesienia z RZECZYWISTEJ kampanii obserwacyjnej” i „Kowariancja współrzędnych punktu na powierzchni Księżyca … utrzymywana osobno od kowariancji stacji ziemskiej” pozostają MODELLED; ich teksty wyroczni wskazują teraz wiersze ścieżki jąder.

seg-64c9f3b96392 = <c1/> nie mówi już, że silnik nie ma czytnika jąder binarnych; wskazuje wiersz czytnika i wyjaśnia, dlaczego jądra statków kosmicznych (typy { "13" } i { "21" }) nadal pochodzą z Horizons.

seg-841deceb80e6 = Korekty: brak. Żaden plik wzorcowy, opublikowany rysunek ani istniejąca wartość testowa się nie zmienia; analityczne raporty <c1/>, <c2/> i <c3/> ze wszystkimi stacjami ustalonymi są bajt w bajt identyczne jak wcześniej (prefiksy SHA-256 wyniku 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, zmierzona biblioteka zegarów „Clock Atlas” (trzy nowe wiersze, jeden VALIDATED: { "232" } -> { "235" } wierszy, { "116" } -> { "117" } sprawdzonych względem niezależnego wzorca).

seg-1f8644486f5d = <b>Zmierzona biblioteka zegarów (<c1/>).</b> Karty urządzeń (szum fazy biały, modulacja częstotliwości biała, flicker i błądzenie losowe, liniowy dryf częstotliwości oraz opcjonalnie człony fazy od jednego do czterech na obrót) dopasowane do nazwanego zmierzonego zapisu zegara i oceniane na danych wyłączonych; wariancje Allana i Hadamarda uwzględniające luki; detektor kondycjonowania, który zapisuje każdą lukę, odstającą fazę, skok fazy, wybuch i skok częstotliwości i nic nie wie o granicach plików ani dni; przeliczenie karty na model szumu taktowania szczeliny, rozszerzony model zegara Kalmana i poziomy szumu monitora spoofingu. Czytniki plików zegarów RINEX i IGS, plików BIPM dla poszczególnych laboratoriów oraz Circular T sekcja { "1" } (<c2/>); łączone, hierarchiczne ograniczenie starzenia dla UTC(k) (<c3/>, jeszcze nieocenione).

seg-93add052ae56 = <b>Identyfikacja szumu z autokorelacji opóźnienia 1</b> (<c1/>, Riley i Greenhall { "2004" }), nowy wiersz VALIDATED (biblioteka): zgadza się z allantools { "2024.6" } <c2/> na { "140" } przypadkach, liczby całkowite identyczne, najgorsza różnica { "9.6e-13" } wobec progu { "1e-9" } (wstępnie zarejestrowana 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Zmierzone karty urządzeń z predykcją na danych wyłączonych</b>, nowy wiersz MODELLED (ustalenie): dopasowanie na jednej trzeciej, predykcja odchylenia Allana pozostałych dwóch trzecich w granicach czynnika { "1.5" } (wstępnie zarejestrowana 2ec76864). GPS Block IIF na świeżym oknie IGS (od 2026-03-01 do { "14" }): { "10" } z { "11" }; G27 jest optymistyczny w skali dwóch godzin (najgorszy czynnik { "1.510" }). Cez (w granicach, { "1.070" }), OCXO (poza, { "2.348" }) i stront (w granicach) są raportowane, a nie ślepe. Karta odbiornika JammerTest oraz karty masera Galileo i Deep Space Atomic Clock są zablokowane. Klasa modelu TCXO odbiornika ZED-F9P na { "12" } statycznych stacjach Wrocławia (Zenodo { "6488497" }) zawodzi: { "1" } z { "11" } ślepych stacji w ujawnionym poprawionym ponownym przebiegu (<c1/>, <c2/>).

seg-26fa898f6272 = <b>Karty GPS Block IIF z członami na obrót</b>, nowy wiersz MODELLED (ustalenie): na drugim świeżym oknie (od 2026-04-01 do { "14" }) { "9" } z { "11" } w granicach progu; G03 ({ "1.947" }) i G25 ({ "1.581" }) są optymistyczne, ponieważ ich zapisy wyłączone są bardziej zaszumione niż ich trzecie dopasowania; pominięcie członów okresowych zawodzi dla wszystkich { "11" } (wstępnie zarejestrowana fb475550; <c1/>).

seg-ef456da29319 = <b>M002, estymacja stanu zegara pokładowego, runda { "3" }</b> (ustalenie, pozostaje MODELLED): po zamrożonym detektorze kondycjonowania rozszerzony filtr z rundy 2, z niezmienionym strojeniem i kryteriami, spełnia (a) i (c) dla wszystkich { "11" } satelitów po raz pierwszy; (b) zawodzi dla G09 ({ "0.894" }) i G26 ({ "0.876" }) (wstępnie zarejestrowana fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, detekcja spoofingu, rundy { "3" } do 4b</b> (pozostaje MODELLED): runda { "3" } zablokowana ({ "167" } epok treningowych z innych sesji urządzenia JammerTest wobec { "3600" }); z kartą klasy modelu ZED-F9P (rundy { "4" } i 4b) monitor zegara zgłasza zero fałszywych alarmów przed początkiem przy wszystkich { "10" } zarejestrowanych początkach (runda { "2" }: { "86" }), a { "6" } z { "10" } początków jest wykrywanych w ciągu { "10" } s (runda { "2" }: { "4" }); te same cztery pozostają spóźnione (<c1/>).

seg-79757abc69e3 = <b>M083, górne ograniczenie UTC(k), runda { "3" }</b>: wstępnie zarejestrowane prospektywnie (fb475550) na wydaniach Circular T od { "465" }, jeszcze nieuruchomione (<c1/>).

seg-09abf996ed16 = Środowisko wyroczni: zapis Wrocław ZED-F9P jest bramkowany danymi pod <c1/> (CC BY { "4.0" }, około { "1.5" } GB); fixtures zegarów IGS są dołączone (produkty IGS, z przypisaniem autorstwa).

seg-b05fa0811a3e = Korekty: brak. Żaden plik wzorcowy, opublikowany rysunek ani istniejąca wartość testowa się nie zmienia; M001 (ponowne zakotwiczenie holdover) nie jest podejmowane, ponieważ żadna klasa zegara nie została podniesiona.

seg-986f4075210b = D8, jedna zwalidowana ścieżka propagacji, układu odniesienia i czasu (trzy nowe wiersze VALIDATED i podniesiony M131: { "235" } -> { "238" } wierszy, sprawdzonych względem niezależnego wzorca { "117" } -> { "121" }).

seg-d7a612528765 = Rodzaje orbit okołoziemskich, które niosły własne modele dwóch ciał, wekowego J2 lub wyłącznie czasu gwiazdowego, dzielą teraz jedną ścieżkę: zestawy elementów SGP4/SDP4 z dwuczęściowymi datami juliańskimi, przeniesione do GCRS i ITRS (International Terrestrial Reference System) łańcuchem IAU (International Astronomical Union) 2006/2000A, z opcjonalnymi parametrami orientacji Ziemi.

seg-016507ccdb8f = Nowe <c1/>, <c2/>, <c3/>, <c4/> i <c5/>; <c6/> i <c7/> przyjmują dwuczęściowe epoki. Nowe <c8/> (konwencja SOFA <c9/> dla dni z sekundą przestępną), <c10/>, <c11/>, <c12/> (przez TAI, jak SOFA <c13/>), <c14/> oraz dwuczęściowe <c15/>.

seg-158c39fff817 = Tryb polarny <c1/> propaguje przez SGP4 na 2026-01-01T00:{ "00" }:{ "00" } UTC łańcuchem IAU (<c2/> przyjmuje dowolną epokę); generator Walkera SGP4 obraca do układu związanego z Ziemią łańcuchem IAU.

seg-86ecad91a601 = Rodzaj <c1/> uruchamia nowy predyktor przejść pozornych (<c2/>, <c3/>): SGP4 w łańcuchu IAU, refrakcja ITU-R P.834-9 i czas światła łącza w dół (nowe przełączniki <c4/> i <c5/>, domyślnie włączone), parametry orientacji Ziemi (<c6/>, <c7/>, <c8/>, domyślnie { "0" }), przecięcia rozwiązywane do { "1e-7" } s i kulminację przez wyszukiwanie złotego podziału. Geometryczne <c9/> pozostaje bez zmian.

seg-9ce091899bf1 = <c1/> pilnuje, aby jądra geometrii, czasu i propagacji pakietu nie zawierały prywatnej propagacji keplerowskiej, wekowych tempa J2 ani rotacji opartej wyłącznie na czasie gwiazdowym; nazwane szybkie poziomy i fizyka będąca przedmiotem wiersza są uzasadnionymi dopuszczeniami.

seg-cf4ae964c5d1 = Nowy wiersz VALIDATED „Dwuczęściowe daty juliańskie i sekundy przestępne na ścieżce czasu orbit okołoziemskich”: pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> na { "224" } chwilach wokół wszystkich { "27" } sekund przestępnych w granicach { "1e-6" } s (wstępnie zarejestrowana e947e69d); najgorszy { "1.9e-11" } s.

seg-c0dec16ea932 = Nowy wiersz VALIDATED „Jedna ścieżka orbit okołoziemskich”: pozycje TEME { "232" } zestawów elementów względem python-sgp4 { "2.24" } (referencyjnego SGP4 Vallado) w granicach { "6.1e-8" } m (próg { "1" } cm) oraz rotacje GCRS -> ITRS i TEME -> ITRS względem ERFA <c1/>, <c2/> i <c3/> w granicach { "2.9e-6" } mas i { "0.41" } mas (progi { "0.1" } i { "2" } mas), z parametrami orientacji Ziemi (wstępnie zarejestrowana 72ea9eb0). Ujawnione: pierwszy przebieg zawiódł przy 2016-12-31T23:{ "59" }:{ "59.5" } o jedną sekundę rotacji; UT1 wzięto z quasi-daty juliańskiej UTC w dniu z sekundą przestępną, silnik idzie teraz przez TAI, a drugi przebieg zgadza się przy niezmienionych progach.

seg-a72ccdc2516e = M131 „Pokrycie LEO i rozmycie dokładności dla użytkowników polarnych i arktycznych względem GNSS MEO” zyskuje status VALIDATED: Orekit { "13.1.8" } bierze stany GCRS silnika, obraca je i oblicza widoczność i DOP (NumPy dla grup wielozegarowych); pozycje w granicach { "6.8e-5" } m (próg { "0.2" } m), liczby widocznych identyczne na 4040/4040 próbek, mediana DOP w granicach { "2.3e-11" } względnie.

seg-db498ac8e135 = Nowy wiersz VALIDATED „Predykcja przejść pozornych nad stacją naziemną z refrakcją i czasem światła”: Orekit { "13.1.8" } propaguje te same zestawy elementów w TEME zbudowanym wg podanej definicji, z refrakcją ITU-R P.834 i jego modelem pomiaru czasu światła, na { "60" } przypadkach dla stacji na poziomie morza: { "1210" } przejść, przecięcia w granicach { "3.4e-6" } s (próg { "5" } ms), maksymalna elewacja w granicach { "5.5e-7" } stopnia, kierunek pozorny w granicach { "8.8e-7" } stopnia (próg { "1e-4" } stopnia).

seg-ab87bb0ee63d = Ustalenia, utrzymywane jako przypięte: pierwsze porównania pełnego twierdzenia z Orekit od końca do końca chybiły swoich progów pozycji i kierunku, nie z winy silnika, lecz dlatego, że SDP4 w Orekit { "13.1.8" } odbiega od referencyjnego SGP4 dla orbit kołowych głębokiego kosmosu (e = { "0" }) (do { "67" } m), a jego domyślny TEME jest zbudowany na nutacji IERS { "1996" } (IAU { "1980" }), około { "72" } milisekund łuku od łańcucha IAU 2006/2000A ({ "2.7" } m na LEO). Współczynnik ITU-R P.834 w Orekit przy h*theta0^{ "2" } to { "0.011380" }, gdzie Zalecenie podaje { "0.01380" }; porównanie jest na poziomie morza, gdzie ten człon zanika, a różnica powyżej jest przypięta.

seg-49978e6a73b2 = „Predykcja przejść nad stacją naziemną (segment naziemny)” pozostaje VALIDATED, z twierdzeniem zawężonym do geometrycznego <c1/>; rodzaj <c2/> należy do nowego wiersza.

seg-60d6ac0011f1 = Środowisko wyroczni: Orekit { "13.1.8" } z Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Korekty: dołączony <c1/> całkowity dostęp { "1675" } s -> { "1659" } s (pięć przejść jak wcześniej; najlepsza maksymalna elewacja { "73.25" } stopnia -> { "70.08" } stopnia), a każde wyjście <c2/> zmienia się wraz z nową ścieżką (wypisana linia w <c3/> i wpis <c4/> w <c5/> mówią to teraz); dołączony <c6/> GNSS VDOP na równiku { "1.19669" } -> { "1.19710" }, przy { "89.9" } stopnia { "1.50645" } -> { "1.50590" }, VDOP fuzji przy { "89.9" } stopnia { "1.14388" } -> { "1.14250" } (opublikowane liczby z dwoma miejscami dziesiętnymi { "1.20" }, { "1.51" } i { "1.14" } pozostają bez zmian). Żaden plik wzorcowy się nie zmienia.

seg-b65f3186a7e9 = Jeszcze nieskierowane: <c1/>, tryby doppler, joint i timing <c2/> oraz orbita prawdy <c3/> (ich modele żyją w <c4/> i <c5/>), a także projekty ziemskie w <c6/> (nazwany szybki poziom dwóch ciał).

seg-03f638f20376 = D6, generator odniesienia LunaNet AFS, LSIS V1.0 (cztery nowe wiersze, dwa VALIDATED: { "238" } -> { "242" } wierszy, sprawdzonych względem niezależnego wzorca { "121" } -> { "123" }).

seg-1d09f0582781 = <b>Generator odniesienia LunaNet Augmented Forward Signal (AFS)</b> (<c1/>), przypięty do LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 z { "29" } stycznia { "2025" } i nazywający tę wersję w każdym wyniku: nośna { "2492.028" } MHz; kanał danych AFS-I BPSK({ "1" }) przy { "500" } symbolach na sekundę z 2046-chipowym kodem Golda; pilot AFS-Q BPSK({ "5" }) z 10230-chipowym kodem pierwotnym Weila, 4-chipowym wtórnym i 1500-chipowym trzeciorzędnym; ramka o identyfikatorze { "0" } (wzorzec synchronizacji, podramka { "1" } BCH ({ "51" }, { "8" }), CRC-24, podramki LDPC o szybkości jedna druga od { "2" } do { "4" }, przeplatacz blokowy { "60" } na { "98" }) z wyczerpującym dekoderem podramki 1 i dekoderem LDPC min-sum napisanym wyłącznie z macierzy kontroli parzystości; oraz synteza IQ pasma podstawowego z etykietami prawdy zapisana jako nagranie SigMF. Kody są generowane z rejestrów przesuwnych standardu i konstrukcji Legendre'a/Weila. Nic skopiowanego ze standardu nie jest redystrybuowane (nie ma on warunków ponownego użycia): indeksy pierwotne AFS-Q pochodzą z IS-GPS-800J, a to, co definiują wyłącznie załączniki standardu (opóźnienia G2 AFS-I, kody trzeciorzędne, podmacierze LDPC), jest odczytywane w czasie działania z lokalnej pamięci podręcznej, którą <c2/> wypełnia z PDF hostowanego przez NASA, przy czym każdy plik jest sprawdzany względem przypiętego SHA-256 (<c3/>). Model jest wzorcem zgodności, a nie modelem kanału, propagacji ani bilansu łącza.

seg-7b8cb0461377 = <c1/> i <c2/>: nagranie może nieść pola rozszerzeń z przestrzeni nazw zadeklarowane w <c3/>.

seg-a9465820a1fc = Nowy wiersz VALIDATED „Renderowanie pasma podstawowego LunaNet AFS względem niezależnego generatora, przy danym jego stanie kanału”: względem LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, build pasma S) zero niezgodności chipów w kodach PRN od { "1" } do { "210" }, zero niezgodności symboli w trzech ramkach przebiegu oraz znormalizowana korelacja zespolona { "0.999990" } na { "23.9" } s jego własnych próbek (najgorszy blok { "2" } ms { "0.999948" }), w granicach progów ustalonych przed porównaniem (wstępnie zarejestrowana 986ac280). Steruje rendererem własnym stanem kanału symulatora i nie obejmuje podziału mocy z gęstości nośna-szum ani zapisu SigMF i 8-bitowego.

seg-07edced2764a = Nowy wiersz VALIDATED „Kodowanie kanałowe ramki LunaNet AFS, FID { "0" }”: ramki 6000 symboli są równe ramkom LANS-AFS-SIM symbol po symbolu (wstępnie zarejestrowana 986ac280); kod podramki 1 odtwarza przykład z rysunku { "8" } LSIS, a CRC-24 wartość kontrolną z katalogu CRC-24/LTE-A.

seg-ab94ac9f41fc = Oba podniesione wiersze są bramkowane danymi z pamięci podręcznej LSIS: ich test wyroczni jest pomijany z komunikatem, dopóki nie uruchomiono <c1/>.

seg-89a4bc4a766e = Ustalenie (nowy wiersz MODELLED), „Generowanie kodów rozpraszających LunaNet AFS”: z { "2 937 232" } wygenerowanych chipów i bitów porównanych z tablicami standardu i plikami Annex { "3" } jeden się różni, „ostatnie { "24" } chipy” wydrukowane w tabeli E-5 dla trzeciorzędnego PRN { "147" }, które dubluje komórkę PRN { "151" }, podczas gdy własny plik Annex { "3" } standardu zgadza się z generatorem. Kryterium zera niezgodności zostaje chybione.

seg-d4e76301323f = Ustalenie (nowy wiersz MODELLED), „Dekodowalność w pętli zamkniętej LunaNet AFS”: trzy wstępnie zarejestrowane przebiegi względem PocketSDR-AFS; trzeci spełnił w pełni progi śledzenia i dekodowania, ale nie swój warunek, że build odbiornika tylko z wydrukiem odtwarza log przypiętego buildu, ponieważ dwa przebiegi niezmodyfikowanego odbiornika już różnią się zapisami akwizycji.

seg-93cfa05a1923 = Poprawiono: domyślna nośna <c1/> (<c2/>), <c3/> i <c4/> była zaokrąglonym { "2.4" } GHz; jest nią teraz nośna AFS z LSIS-020, { "2492.028" } MHz. Przy dawnej wartości domyślnej tłumienie w wolnej przestrzeni było zaniżone o { "0.327" } dB.

seg-ed7c170ccc2c = Korekty: brak. Każdy dołączony scenariusz nazywa swoją nośną, a wyniki wszystkich { "138" } plików scenariuszy są bajt w bajt identyczne jak w poprzednim main.

seg-3ec7f5b17122 = D7, rzeczywiste IQ księżycowe i GPS LNAV (siedem nowych wierszy, żaden VALIDATED: { "242" } -> { "249" } wierszy, sprawdzonych względem niezależnego wzorca { "123" } bez zmian).

seg-0c3dcf4f2b0f = <c1/>: mieszanoradiksowa szybka transformata Fouriera (FFT), której wynik to te same bity na każdej platformie; przypięcie SHA-256 transformat 8000- i 24000-punktowych przechodzi na x86_64 i na wasm32-wasip1 (moduł uruchamiający w <c2/>).

seg-150d9809c584 = <c1/>: równoległe wyszukiwanie fazy kodu na próbkowanym IQ (<c2/>, <c3/>) ze składaniem koherentnym, akumulacją niekoherentną, progiem chi-kwadrat dla prawdopodobieństwa fałszywego alarmu w całym wyszukiwaniu i statystyką uśredniania komórek dla szumu ograniczonego pasmem; <c4/>, <c5/> z Dopplerem kodu oraz estymatory gęstości nośna-szum (C/N0) M2M4 i szczytu siatki.

seg-46bda8ecf2cd = <c1/>: koder starszego komunikatu nawigacyjnego (LNAV) IS-GPS-200 dla podramek od { "1" } do { "3" }, z parzystością z tabeli 20-XIV i dekoderem pól.

seg-43444792974c = <c1/>: czytnik ION GNSS SDR Metadata Standard (<c2/>) i jego plików próbek, z <c3/> dla poziomów w kodzie uzupełnieniowym do dwóch.

seg-a7dfc3475923 = <c1/>: nagłówek partii IQS, telemetria RAW, ACQ i NAV oraz pliki CLK z LuGRE (Lunar GNSS Receiver Experiment) i kontrola, która wypisuje, gdzie metadane <c2/> przeczą nagłówkowi binarnemu.

seg-f0125531c4f8 = <c1/> oraz, w <c2/>, układ ciała ze sterowaniem odchyleniem, azymut nadawania i kąty od nadiru, a także <c3/> dla względnego C/N0 ze zmierzonymi charakterystykami.

seg-679aa02de1d0 = Kodowanie komunikatu nawigacyjnego GPS LNAV (nowy wiersz, pozostaje MODELLED po weryfikacji końcowej integratora): na pliku nadawczym IGS z { "2" } marca { "2025" }, sparsowanym i zdekodowanym przez RTKLIB v2.4.2-p13, wszystkie { "960" } słów przechodzą parzystość, wszystkie { "96" } podramek się dekoduje, a wszystkie { "608" } nadawanych liczb całkowitych równa się wartościom Kshana (<c1/>), ale wstępna rejestracja (d4d9eb9d) trafiła do gałęzi publicznej dwie sekundy po zatwierdzeniu zawierającym wynik, więc kolejności „zarejestrowano przed pobraniem pliku” nie można wykazać i wiersz nie został podniesiony.

seg-2875ba2d8f5f = <c1/> wypełnia słowa od najstarszego bitu (I w górnym półbajcie bajtu LuGRE; wcześniejszy odczyt dawał sygnał sprzężony), zachowuje stary odczyt jako <c2/> i czyta próbki szersze niż słowo.

seg-f6e0e3b9b166 = <c1/>: koherentne dopracowanie Dopplera w fazie ({ "0.2" } Hz RMS przy { "30" } dB-Hz w ciągu { "200" } ms w symulacji).

seg-b0f6a61acce0 = GPS L1 C/A względem gps-sdr-sim: chipy i parzystość bit w bit; { "230" } z { "1152" } pól LNAV różni się o jedną jednostkę, ponieważ gps-sdr-sim obcina tam, gdzie nadawana liczba całkowita wymaga zaokrąglenia.

seg-1c525ca495c0 = LNAV zdekodowany przez RTKLIB: cała parzystość i podramki przechodzą, a każdy parametr mieści się w połowie kwantu; { "41" } wartości skalowanych różni się o kilka jednostek na ostatnim miejscu przez dziesiętną stałą RTKLIB { "2" }^-43, powyżej zarejestrowanego progu.

seg-14e26e69777b = Akwizycja LuGRE względem GNSS-SDR { "0.0.19" }: { "266" } z { "266" } decyzji się zgadza, { "250" } wskazało tę samą komórkę; większość wyników dodatnich to artefakty średniej −{ "0.5" } w surowych 4-bitowych poziomach; ramię C/N0 nie miało równoczesnych danych lotu. Dwie partie (OP5, OP12) wykluczono błędnie: ich metadane zgadzają się z nagłówkami, ale czytnik nie potrafił wtedy czytać próbki szerszej niż słowo.

seg-3a32ff9d66fc = Akwizycja LuGRE względem Dopplera przewidzianego z orbity: przy decyzji opartej na mocy próbek każde wyszukiwanie przekracza próg na szumie ograniczonym pasmem; przy decyzji uśredniającej komórki najsilniejsze pary zgadzają się co do wielkości z odwróconym znakiem, co pokazuje, że zarejestrowana kolejność I/Q jest sprzężeniem danych.

seg-2bb618ba4059 = Ślepa akwizycja na partiach z powierzchni Księżyca: cztery partie pozyskują po jednym satelicie (przewidziany jako widoczny, bez fałszywego alarmu przy { "1e-7" }), żadna dwóch, więc próg różnicy Dopplera nie ma pary do oceny.

seg-f95606e17fd1 = Względne C/N0 w odległości księżycowej (M039 ujęte na nowo): { "15" } zapisów Block IIR/IIR-M i jedna para, zbyt mało dla zarejestrowanego progu.

seg-9306cf44fc44 = Korekty: brak; żadna opublikowana liczba, plik wzorcowy ani rysunek w dokumentacji się nie zmienił.

seg-2a3cb68c94d6 = Wiersz M039 „GNSS Ziemi w odległości księżycowej” ujmuje na nowo swoje twierdzenie w odległości księżycowej jako względne C/N0 między satelitami w jednej epoce plus widoczność (bezwzględne C/N0 nie jest twierdzone); pozostaje MODELLED. NOTICE najwyższego poziomu zawiera przypisanie autorstwa LuGRE CC BY { "4.0" }.

seg-e1e4094a186a = Orientacja osi głównych Księżyca z DE440 jest teraz interpolowana wzdłuż geodezyjnej między dziennymi węzłami. Wcześniejsza interpolacja element po elemencie była błędna do { "2.0e-4" } rad ({ "340" } m na powierzchni Księżyca) w pobliżu ćwiartek każdego dnia, a nie „około { "14" } m”, jak podawał wiersz. Jego użytkownicy (geometria księżycowego dalmierza laserowego, księżycowe datum, obserwowalność uskoków księżycowych) otrzymują poprawioną orientację.

seg-a2071d345923 = Poprawki silnika z rundy { "2" }, każda ponownie uruchomiona względem niezmienionej wstępnie zarejestrowanej tolerancji: wersja IERS wiersza EOP jest odczytywana z jego flag I/P, a nie z pustego bloku Bulletin B; <c1/> używa geodezyjnego poziomu lokalnego; sprzężenie księżycowego układu tempa używa promienia równikowego, J2 i rotacji; dopasowanie liu22 startuje od zerowych poprawek bez priorów i używa tempa ruchu średniego z artykułu; rozstaw węzłów EO niesie regresję węzłów J2; czas poślizgu cyklu Costasa używa rho/4; rozwiązanie łączne stosuje nadawane opóźnienie grupowe pary; księżycowe rozwiązanie łączne używa kroku QR; granica NTN jest oceniana w pozycji prawdziwej; zegar odniesienia projektu konstelacji to najniższa konstelacja w widoku; szereg orientacji DE440 obejmuje 2014-2030 i zgłasza błąd poza nim zamiast przycinać.

seg-74f397ad9c16 = <c1/>, orbita prawdy zbudowana z tablicowych stanów w układzie związanym z Ziemią, używana przez porównanie dopasowania rzeczywistej orbity.

seg-7293b717d978 = Pliki testowe i fixtures powyższych porównań, każdy z własnym generatorem i plikiem <c1/> podającym źródło, licencję, datę pobrania i SHA-256.

seg-920fe965bda9 = Runda { "2" }: <c1/> i <c2/> (detekcja uszkodzeń ADD v4.2, wg Stanford MAAST dla ARAIM { "2" }, uwaga BSD-3 w źródle); <c3/>; <c4/> i <c5/>; dziewięciostanowy model błędu INS <c6/>; pochodne cząstkowe <c7/> i dane wejściowe <c8/> na ścieżce jąder; <c9/>, czytnik jąder SPK typu { "2" } i binarnych PCK; <c10/> ze stacjami ITRF2020; gęstość Jacchia { "1971" }; <c11/> dla dowolnego dostawcy efemeryd; <c12/>; <c13/> i <c14/>; <c15/>; <c16/> (czytniki RINEX zegara, ANTEX i DCB).

seg-e3336e670d51 = Wydanie poprawkowe po { "0.29.2" }. Kshana Studio zostało przebudowane wokół dwóch widoków: widoku prostego, który najpierw podaje odpowiedź i wyjaśnia ją zwykłymi słowami, oraz widoku zaawansowanego z pełnym panelem. Razem z nim trafiają dwie drobne poprawki na kshana.dev. Silnik się nie zmienia: każdy dołączony scenariusz daje wynik identyczny bajt w bajt z { "0.29.2" }, poza stemplem wersji.

seg-c40ab967ace6 = <b>Kshana Studio ma widok prosty.</b> To on otwiera się jako pierwszy.

seg-6a5ae001d00e = Odpowiedź jest na pierwszym miejscu: scenariusz otwiera się na swoim wyniku, podanym w jednym prostym zdaniu. Każdy dołączony scenariusz ma własne zdanie, napisane pod kątem tego, co ten scenariusz mierzy.

seg-375421534e4c = Widocznych jest najwyżej pięć ustawień, tych, które najbardziej zmieniają odpowiedź. Pozostałe znajdują się w sekcji „Ustawienia zaawansowane”, zwiniętej do czasu jej otwarcia.

seg-d8650ae64549 = „Jak to jest obliczane” wyjaśnia metodę w kilku wierszach, a „Dla badaczy” podaje własne wartości silnika, plik scenariusza i dowody stojące za wynikiem.

seg-36af7640e6ad = <b>Pełny panel to widok zaawansowany.</b> Jest w nim każdy panel, wykres, eksport i raport z wcześniejszego Studio.

seg-0428d0a7921b = <b>Przełącznik przechodzi między dwoma widokami i zachowuje miejsce, w którym się jest.</b> Scenariusz, widok, w którym się było, i wszystkie zmienione ustawienia zostają przeniesione. Studio zapamiętuje, którego widoku użyto ostatnio. Odnośniki ze strony i z dokumentacji otwierają widok prosty; odnośnik z <c1/> otwiera widok zaawansowany, a każdy wcześniejszy odnośnik do Studio nadal otwiera ten sam scenariusz i ten sam widok.

seg-2c98ed084c10 = <b>Szybszy pierwszy widok przy wolnych połączeniach.</b> Zapisana odpowiedź dla scenariusza jest rysowana, zanim wczyta się reszta Studio, więc przy wolnym połączeniu mobilnym odpowiedź pojawia się po około dwóch sekundach zamiast po około dziewięciu.

seg-2214d2dcfab4 = <b>Lepsze wyszukiwanie.</b> Wyszukiwanie wyświetla teraz najpierw scenariusze, których obszar lub tytuł pasuje do wpisanych słów, przed scenariuszami, które wspominają je tylko w nazwie pliku lub w tekście.

seg-aa8d43280c19 = <b>Globus na stronie głównej nie robi się już pusty przy włączonym ograniczeniu ruchu.</b> Przy włączonym systemowym ustawieniu ograniczenia ruchu zmiana rozmiaru okna mogła pozostawić główny globus pusty aż do przewinięcia strony. Globus rysuje się teraz ponownie w tej samej klatce co zmiana rozmiaru.

seg-da4b78816df1 = <b>Konsola pasma L na stronie głównej wyjaśnia swoje puste pasmo.</b> W „Watch a jammer take the band” panel GPS L5 / Galileo E5a przez całą minutę pozostawał ciemny, co wyglądało na usterkę. W tym scenariuszu żaden jammer nie nadaje w tym paśmie, a sygnały satelitów leżą poniżej poziomu szumu, więc nic tam nad nim nie wystaje. Dyskretna etykieta mówi to teraz w każdym fragmencie panelu, w którym nic nie wystaje ponad poziom szumu (panel L5 / E5a oraz panel L2C, zanim zacznie nadawać jego jammer szumowy), wraz z C/N0 i stanem uchwycenia każdego pasma z tego samego przebiegu. Etykieta jest umieszczana tylko tam, gdzie nic nie jest powyżej poziomu szumu, więc nigdy nie zasłania energii jammera.

seg-e353fdee7033 = Wydanie poprawkowe po { "0.29.1" }. Usuwa zduplikowany kod w modułach wiadomości nawigacyjnej LEO, fuzji i widma, dodaje jasny motyw do kshana.dev, przenosi Kshana Studio pod własny adres, czyni stronę czytelną dla wyszukiwarek i asystentów AI, poprawia kilka drobiazgów w Studio i pozwala publikować wydania npm bez zapisanego tokenu. Wyniki silnika się nie zmieniają: każdy dołączony scenariusz daje wynik identyczny bajt w bajt z { "0.29.1" }, poza stemplem wersji.

seg-e8bf0a4fdc35 = <b>Jasny motyw dla kshana.dev.</b> Każdą stronę można czytać w trybie jasnym lub ciemnym. Strona podąża za ustawieniem systemowym czytelnika i ma przełącznik, który je zmienia.

seg-8e7cabc14c40 = <b>Wyszukiwarki i asystenci AI mogą czytać stronę.</b> Każda strona ma teraz własny tytuł, opis, adres kanoniczny, znaczniki kart społecznościowych i dane strukturalne schema.org, a także zwykły tekst dla sekcji rysowanych skryptem. Strona publikuje <c1/>, <c2/> z datą ostatniej zmiany każdej strony, <c3/> i <c4/> (krótki i pełny przewodnik w postaci zwykłego tekstu dla asystentów AI) oraz klucz IndexNow, dzięki któremu wdrożenie może powiadomić wyszukiwarki o tym, co się zmieniło.

seg-804ba71be9ed = <b>Wydania npm można publikować bez zapisanego tokenu.</b> Zadanie npm działa teraz na Node { "24" } i npm { "11.5.1" } lub nowszym, które obsługują zaufane publikowanie npm: npm wymienia tożsamość GitHub zadania wydania na krótkotrwałe poświadczenie. Sekret <c1/> nadal działa i jest używany, dopóki jest ustawiony, więc nic się nie zmienia, dopóki zaufane publikowanie nie zostanie włączone dla pakietu na npmjs.com. <c2/> wymienia kroki.

seg-81405e5a5e06 = <b>Nagłówek strony głównej jest czytelny nad globusem.</b> Delikatny cień leży teraz za nagłówkiem i jego tekstem, przygaszając linie orbit i punkty satelitów animowanego globusa tam, gdzie go przecinają.

seg-24b8363acc14 = <b>Kshana Studio ma własny adres: <a1>https://kshana.dev/studio/</a1>.</b> Każdy odnośnik na stronie i w dokumentacji prowadzi tam. Stary adres, <c1/>, nadal działa i przekierowuje na nowy, z zachowaniem scenariusza, widoku i innych ustawień zapisanych w odnośniku.

seg-12f223b986bd = <b>Poprawki w Studio.</b> Plik silnika jest pobierany raz zamiast dwa razy. Podczas pobierania Studio od razu pokazuje zapisany wynik scenariusza, oznaczony jako zapisany, zamiast pustego ekranu. Na telefonie nagłówek to jeden zwarty wiersz. Kluczowe wartości zawijają się po dwie w wierszu, więc żadna nie jest ukryta poza krawędzią ekranu. Etykiety pól używają własnych słów scenariusza, z nazwą pola obok, a wyszukiwanie znajduje pola po jednym i drugim.

seg-c130d8a4dc5e = <b>Mniej zduplikowanego kodu.</b> Tabela jednostek wiadomości nawigacyjnej LEO zapisywała te same dziesięć wierszy statystyk SISRE dla czterech podsumowań dopasowania. Teraz makro zapisuje je raz. Dwa wykresy wodospadu widma mają wspólną oś czasu, pasek kolorów i panel paska C/N0. Próbkowanie w dół głównej siatki używa ponownie <c1/>, a całka Simpsona używa ponownie <c2/>. Dwa punkty wejścia rodzaju przelotu LEO mają wspólny krok przygotowania. <c3/> importuje pomocnicze funkcje wektorowe z <c4/> zamiast je kopiować. Raport zaawansowany importuje funkcję ucieczki HTML z raportu API zamiast ją kopiować. Każdy z { "139" } plików scenariuszy w <c5/> uruchomiono na { "0.29.1" } i na tym kodzie, a każdy plik wyjściowy jest identyczny bajt w bajt.

seg-166b0435c96f = <b>Tabele jednostek leo-navmsg i leo-pvt mają własne pliki.</b> Przeniesiono je z modułów, które zawierają także logikę, do <c1/> i <c2/>. <c3/> zachowuje swoją ścieżkę publiczną. Tylko te dwa pliki tabel dołączają do wyłączeń z wykrywania kopii dla katalogów deklaratywnych w <c4/>, które sprawdza <c5/>.

seg-f8b372e08ef9 = <b>Plakietka CI w README pokazuje wynik pushy do main.</b> Plakietka liczyła przebiegi każdego zdarzenia na main, więc mogła pokazywać „failing”, choć każdy przebieg dla pusha był zielony; teraz prosi tylko o przebiegi dla pushy (<c1/>).

seg-7c41a482c7d8 = Wydanie poprawkowe po { "0.29.0" }: zmierzona wartość pokrycia, wiersz z nazwą projektu na kshana.dev, szybsze zadanie pokrycia i odświeżony README. Wyniki silnika się nie zmieniają: każdy scenariusz daje ten sam wynik co na { "0.29.0" }.

seg-997490bd1696 = Rewizje opublikowanych liczb

seg-ed4b071e4bd9 = <b>Pokrycie wierszy: ~{ "96" } % → ~{ "95" } %.</b> Zadanie pokrycia ponownie zmierzyło kod wydania { "0.29.0" } (commit <c1/>, przebieg CI { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } z { "58,697" } wierszy w <c3/>. Opublikowana wartość wynosiła { "95.63" } % ({ "37,697" } z { "39,419" } wierszy), zmierzona na <c4/> przed { "0.28.0" }; zaokrąglała się do ~{ "96" } %. Nowa wartość zaokrągla się do ~{ "95" } %, więc razem zmienia się każda powierzchnia, którą przypina <c5/>: <c6/>, plakietka README, wiersz Evidence i tabela CI, plakietki crates.io, PyPI i npm, raport techniczny oraz strona pokrycia na kshana.dev. Próg dolny { "85" } % pozostaje bez zmian.

seg-577baa03af04 = <b>Wiersz z nazwą na kshana.dev.</b> „Kshana · क्षण · the precise instant” otwiera teraz główną sekcję Home i znajduje się pod marką w stopce każdej strony. kshana.dev nadal nie wysyła żadnego żądania do innego hosta: dewanagari to samodzielnie hostowany podzbiór Noto Sans Devanagari z trzema literami क्षण ({ "1,692" } bajtów, <c1/>, z tekstem licencji SIL Open Font License i jego SHA-256 w <c2/>). <c3/> nauczył się zapisywać podzbiór Google Fonts <c4/> pod nazwą pliku adresowaną zawartością.

seg-35b5bc4ee466 = <b>Odnośniki na stronie trafiają tam, dokąd wskazują, pod czystymi adresami.</b> Odnośnik do sekcji ustawia teraz tę sekcję tuż pod nagłówkiem, na telefonie i na komputerze: odnośnik do sektora w Missions otwiera ten sektor z jego panelem na górze; odnośniki do Capabilities i Editions utrzymują swoje miejsce, gdy rysują się znajdujące się nad nimi wykresy; Editions nie dodaje już drugiego odsunięcia nagłówka; a odnośnik do zwiniętej części strony dokumentacji ją otwiera. Każda strona jest linkowana swoim czystym adresem (<c1/>, <c2/>, <c3/> dla Home), a odnośniki kanoniczne, mapa witryny i przekierowania starych adresów podają te same; adresy <c4/> nadal działają. Research ma własny odnośnik w nagłówku, między Evidence a Developers, i w stopce. Dokumentacja nie pokazuje już planu rozwoju (<c5/> pozostaje w repozytorium): grupa Project to Changelog, Licensing, Security, Contributing, Governance i Code of conduct, a Glossary przeniesiono do Get started.

seg-3da9f00f5ce6 = <b>Zadanie pokrycia jest szybsze.</b> Na { "0.29.0" } trwało { "143" } minut wobec zdrowych { "91" } do

seg-85d502773367 = Fuzzer <c1/>, przyczyna za ostatnim razem, zajmował { "4" } z nich. Dołączony korpus urósł z { "74" } do { "139" } scenariuszy, a trzy pliki binarne testów przechodziły go cały, plik po pliku (<c2/> dwa razy, <c3/> i <c4/> po razie): razem { "37" } minut pod instrumentacją pokrycia, wobec { "3" } na { "0.27.2" }. Teraz współdzielą <c5/>, który wykonuje pracę dla każdego scenariusza na wszystkich rdzeniach i oddaje wyniki w posortowanej kolejności; każdy scenariusz i każda asercja pozostają. Na laptopie arm64, kompilacja debug: <c6/> trwa { "143" } s na { "14" } rdzeniach wobec { "612" } s z <c7/> (dawne przejście szeregowe).

seg-bb69dbadbc81 = <b>README, odświeżone.</b> Otwiera się tym samym wierszem z nazwą co strona; zrzuty ekranu Studio zrobiono na nowo ze Studio w wersji { "0.29.1" }, z nowym zrzutem Studio na telefonie i jego dolnym paskiem kroków; nowy pas „The site” pokazuje trzy strony kshana.dev z kompilacji { "0.29.1" } (<c1/>, złożone przez <c2/> i zapisane w <c3/>); wartość pokrycia brzmi ~{ "95" } %; a tekst alternatywny rysunku badawczego, który powtarzał tekst rysunku architektury, opisuje teraz artykuły. Plakietki w nagłówku są mniejsze i krótsze ({ "18" } px wysokości; „~{ "95" }%”, „83/223”, „quality”, „AGPL-3.0”, „zenodo.20528627”), więc jedenaście mieści się w dwóch wierszach; każdy odnośnik i tekst alternatywny zachowuje pełne znaczenie.

seg-f61ef3e16884 = <b>Zadanie obrazu kontenera dostaje { "90" } minut.</b> Na { "v0.29.0" } emulowana kompilacja linux/arm64 obrazu <c1/> przekroczyła dawny limit 45 minut podczas kompilowania ostatniego crate'a, więc obraz, wpis w rejestrze MCP i kontrola kanału nie zostały opublikowane. Limit wynosi teraz { "90" } minut; obraz jest niezmieniony.

seg-1688bf9f0fec = <b>Osiem literałów zmiennoprzecinkowych pogrupowano na nowo</b> w <c1/> i <c2/> (<c3/> → <c4/>): SonarQube Cloud odczytał ostatnią grupę <c5/> lub <c6/> jako brakujący sufiks <c7/> lub <c8/> (reguła S7454). Wartości to te same liczby, więc żaden wynik się nie zmienia.

seg-81fd160937db = Dwanaście nowych rodzajów scenariuszy i trzy nowe sposoby czytania przebiegu. Silnik obejmuje teraz widmo radiowe, cały Układ Słoneczny, konstelacje wokół dowolnego ciała, kampanie łączące scenariusze w jedną misję oraz pozycjonowanie, nawigację i czas (PNT) z niskiej orbity okołoziemskiej (LEO), od sygnału do rozwiązania pozycji. Każdy przebieg można też zapisać jako animację, pełny raport i zestaw plików interoperacyjności dla innych narzędzi.

seg-118be64d7cb2 = Wokół silnika: przeprojektowane kshana.dev (strona wielostronicowa i nowy panel Kshana Studio, który uruchamia każdą możliwość w przeglądarce), przepisane README, czternaście narzędzi na serwerze Model Context Protocol (MCP), kompilacja przeglądarkowa dająca te same liczby co natywna oraz publiczna strona Kshana Pro.

seg-ea31356bc17d = Pliki scenariuszy (plus jeden manifest zestawu)

seg-26654cd81de1 = { "138" }, z czego { "132" } dołączono do <c1/>

seg-3d1a85e93e48 = z czego MODELLED (podany model, sprawdzony tylko pod kątem wewnętrznej spójności)

seg-e77f9d273ee1 = z czego PARTNER (wymaga sprzętu lub danych partnera)

seg-e94cd6b3561a = Skąd bierze się wzrost:

seg-1759a8cce7d6 = Rodzaje

seg-94de9433d99f = Pliki scenariuszy

seg-03d7aea335dc = Wiersze macierzy (sprawdzone + obliczone z modelu)

seg-fdd674722717 = Widmo

seg-59583fa40da3 = Układ Słoneczny i pozycjonowanie wokół dowolnego ciała

seg-fafa167623df = Scenariusze morskie, drogowe i kolejowe

seg-fc571c46e522 = Animacja, raporty, eksporty interoperacyjności

seg-2746e0d9f787 = Projekty sygnałów LEO i widmo wielopasmowe

seg-d40ec114d1f9 = Pozycjonowanie, synchronizacja czasu i fuzja LEO

seg-0157f649e65b = Łańcuch LEO od początku do końca

seg-423283112128 = Odporność LEO oraz scenariusze obszarów zainteresowania i użytkowników końcowych

seg-395beca13299 = Razem dodano

seg-ea9dc4093d8a = Możliwość LEO jest niezależna od systemu: działa na ogólnych, podanych parametrach i nie wymaga żadnego nazwanego systemu. Nazwane systemy są opcjonalnymi presetami, każdy w osobnym pliku z publicznym źródłem. Jeden preset, Celeste IOD (demonstracja na orbicie), używa wartości przedstawionych na warsztatach ESA NAVISP LEO-PNT, { "2026" } (ESA to Europejska Agencja Kosmiczna; NAVISP to jej Program Wsparcia i Innowacji w Nawigacji); znajduje się w jednym pliku, <c1/>, wraz z pięcioma scenariuszami dostępnymi tylko w repozytorium, więc można go wstrzymać bez edycji źródła, a żadna z jego wartości z warsztatów nie jest powtórzona w tym dzienniku zmian.

seg-c36a5015c03c = <b>Przed aktualizacją przeczytaj „Revisions to published numbers”.</b> Zmienia się jeden wynik silnika (kolumny układu inercjalnego rodzaju <c1/>, po poprawce znaku w macierzy nutacji), a audyt dokumentacji poprawił wartości, które wcześniejsze dokumenty podawały w druku.

seg-7fe505d3232b = Statusy: <b>VALIDATED</b> oznacza sprawdzone względem niezależnej wyroczni zewnętrznej (opublikowanej tabeli, oprogramowania innej grupy lub danych pomiarowych); <b>MODELLED</b> oznacza podany model sprawdzony tylko pod kątem wewnętrznej spójności; <b>PARTNER</b> oznacza, że sprawdzenie wymaga sprzętu lub danych partnera.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project (Projekt Partnerski Trzeciej Generacji); sieć mobilna piątej generacji; sieć nienaziemna

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = ery kalendarzowe (anno Domini, przed Chrystusem)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = Amerykański Instytut Aeronautyki i Astronautyki

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternatywna modulacja z przesunięciem binarnym nośnej; modulacja z przesunięciem binarnym nośnej; binarna kluczowanie fazy; multipleksowana modulacja z przesunięciem binarnym nośnej (modulacje sygnałów)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (opublikowany model efemeryd LEO)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = kod zgrubny/akwizycyjny oraz nazwy nośnych i sygnałów cywilnych Global Positioning System

seg-e464509f3abb = stosunek mocy nośnej do gęstości szumu

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin (niebieski początek pośredni)

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = interfejs wiersza poleceń

seg-9aa3c2e54398 = 24-bitowa cykliczna kontrola nadmiarowa (wielomian Qualcomm)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets (kaskadowe arkusze stylów); HyperText Markup Language (język znaczników hipertekstu); Scalable Vector Graphics (skalowalna grafika wektorowa); Extensible Markup Language (rozszerzalny język znaczników)

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = wartości rozdzielone przecinkami; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; jednolity lokalizator zasobów

seg-3ad592244ea8 = fala ciągła

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (formaty map i globusów)

seg-3415aa029e39 = Development Ephemeris { "441" } Jet Propulsion Laboratory

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = cyfrowy identyfikator obiektu

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = rozmycie dokładności: geometryczne, położenia, poziome, pionowe

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = nazwy sygnałów Galileo

seg-544f4fcbd68f = nazwa miejsca w tabeli konstelacji Global Positioning System

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = geocentryczny, związany z Ziemią

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = równanie równonocy

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = równoważna moc promieniowana izotropowo

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (biblioteki astronomii referencyjnej)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = Europejska Agencja Kosmiczna; jej Program Wsparcia i Innowacji w Nawigacji

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = wielodostęp z podziałem częstotliwości

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentryczny Niebieski Układ Odniesienia (Geocentric Celestial Reference Frame); Geocentryczny Niebieski System Odniesienia (Geocentric Celestial Reference System)

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = rosyjski Globalny System Nawigacji Satelitarnej

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = globalny system nawigacji satelitarnej; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = Międzynarodowa Unia Astronomiczna

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = dokument kontroli interfejsu; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = Międzynarodowy Niebieski Układ Odniesienia

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Międzynarodowa Organizacja Morska

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = inercjalny system nawigacji; układ mikroelektromechaniczny

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = demonstracja na orbicie

seg-92cd0058a058 = IQ

seg-c7fa50165400 = składowe synfazowa i kwadraturowa

seg-41471e51e661 = specyfikacja interfejsu Global Positioning System

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Międzynarodowa Stacja Kosmiczna

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = Międzynarodowy Ziemski Układ Odniesienia (International Terrestrial Reference Frame); Międzynarodowy Ziemski System Odniesienia (International Terrestrial Reference System); pseudo-związany z Ziemią; prawdziwy równik, średnie równonocy (układy odniesienia)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Międzynarodowy Związek Telekomunikacyjny; jego Sektor Radiokomunikacji

seg-a524e4c4a670 = stosunek jammera do sygnału

seg-5d93361e20d4 = J2 do J6, J2000

seg-50255586b303 = harmoniki strefowe pola grawitacyjnego; epoka 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Jet Propulsion Laboratory

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = niska orbita okołoziemska; średnia orbita okołoziemska

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = inżynieria systemów oparta na modelach

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = znormalizowany kwadrat błędu estymacji

seg-56d5135d987d = model jonosfery Galileo

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (precyzyjne orbity); zestaw elementów dwuliniowych

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = pozycjonowanie, nawigacja i czas; precyzyjne pozycjonowanie punktowe

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = gęstość widmowa mocy; współczynnik separacji widmowej

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = autonomiczne monitorowanie integralności w odbiorniku; monitorowanie jakości sygnału

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format (niezależny od odbiornika format wymiany); Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = pierwiastek ze średniej kwadratów

seg-e1c3c49833fc = otwartoźródłowa biblioteka pozycjonowania GNSS, używana tu jako wyrocznia

seg-9ead536db4aa = Simplified General Perturbations { "4" } (model orbity zestawów elementów dwuliniowych)

seg-865e7d1794b6 = Secure Hash Algorithm, 256-bitowy

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format (format metadanych sygnału)

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = błąd odległości sygnału w przestrzeni

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (jego format pliku efemeryd <c1/>)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = identyfikator pojazdu kosmicznego

seg-de4e841ce8a2 = łączna liczba satelitów konstelacji Walkera, jej płaszczyzny i fazowanie

seg-4d6ebfefc096 = TEC

seg-5149401781dd = całkowita zawartość elektronów

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrawysoka częstotliwość

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = uniwersalny czas koordynowany

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = nazwy sygnałów systemu Xona Pulsar

seg-d6a3f210958a = Zmieniona opublikowana liczba jest rewizją i zostaje zapisana, nigdy poprawiana po cichu. To wydanie zawiera jedną rewizję wyniku silnika i kilka rewizji wartości podanych w dokumentacji.

seg-1669eb4224f1 = Wynik silnika

seg-185961ebab61 = Redukcja TEME→GCRS była obrócona o { "2" }·Δψ: macierz nutacji miała odwrócony znak Δψ.

seg-504b78f30c54 = <c1/> budowało <c2/>, tam gdzie <c3/> z SOFA buduje <c4/>, więc <c5/>, <c6/>, <c7/> i <c8/> obracały o dwukrotną nutację w długości, około { "25" } sekund łuku. Każda kontrola łańcucha była testem własności (obrót właściwy, przejście w obie strony, niezerowy udział nutacji), który przepuszcza pomyłkę znaku; kompleksowy test Vallado obejmował TEME→PEF, TEME→ITRF i GCRS→ITRS, ale nie TEME→GCRS. Na przykładzie Vallado (AIAA 2006-6753, 2004-04-06) łańcuch mijał opublikowany GCRF o { "1 145" } m; teraz ląduje { "0.11" } m od niego, a macierz jest równa <c9/> z ERFA z dokładnością { "1e-14" }. <c10/> i <c11/> oba zawodzą na starym znaku. Test spójności CIO (Celestial Intermediate Origin) w <c12/> przypisał wynikającą z tego niezgodność ~{ "130" } m „≈ { "2" }·EE”; reszta wynosi teraz { "5" } cm, a jej granicę zaostrzono z { "250" } m do { "1" } m. <b>To zmienia opublikowane liczby, zapisane tu jako rewizja:</b> kolumny <c14/> i <c15/> rodzaju <c13/> (około { "0.8" }–{ "1.0" } km dla dołączonego scenariusza ISS (Międzynarodowa Stacja Kosmiczna); jego kolumny TEME, związane z Ziemią, śladu na powierzchni, kątów widzenia i Dopplera nie zmieniają się) oraz <c16/> / <c17/> dla układów GCRS i ITRS. Żaden wiersz podsumowania, wykres ani złoty hasz dołączonego scenariusza nie odczytuje tych kolumn. Nowe eksporty interoperacyjności używają poprawionego łańcucha: pozycja CZML pierwszego satelity <c18/> zgadza się z redukcją ERFA tego samego TLE (propagowanego pakietem Pythona <c19/>) z dokładnością { "2.3" } cm.

seg-a0a4026d22ed = <b>Rodzaj <c1/>, natywnie i w kompilacji przeglądarkowej.</b> Rodzaj oblicza teraz każdą funkcję przestępną przez jedną przenośną bibliotekę matematyczną, więc jego ramka ma te same bajty na każdej platformie i w każdej kompilacji (przy Fixed). Wraz z tym zmienia się każda wartość <c2/> oraz etap <c3/> w <c4/>. Rodzaj jest nowy w tym wydaniu, więc nic z wcześniejszego wydania się nie zmienia, ale zmieniają się wartości podane przed poprawką: wartość kontrolna z <c5/> dla scenariusza kodowania i dekodowania wynosiła <c6/>, a wynosi <c7/>, a SISRE zdekodowanej wiadomości to { "0.129" } cm. Na kshana.dev karta Missions dla <c8/> pokazywała najgorszy błąd odległości { "1.6" } mm przy dopasowaniu { "60" } s i { "40.3" } mm przy dopasowaniu { "900" } s; strona jest teraz budowana z silnika tego wydania i pokazuje { "1.8" } mm i { "46.6" } mm.

seg-77f441bfc3c3 = <b>Mapa zasięgu zagłuszania na kshana.dev (Missions).</b> Każda z jej { "875" } komórek to jeden przebieg <c1/> ze zmienioną tylko pozycją odbiornika. Komórki są teraz obliczane z tych samych współrzędnych o trzech miejscach po przecinku, które odnośnik „open this run” komórki podaje Kshana Studio, więc komórka pokazuje dokładnie to, co odtwarza jej odnośnik. Średni stosunek jammera do sygnału (J/S) w { "30" } komórkach zmienia się o { "0.1" } dB, w górę lub w dół; dostępność śledzenia żadnej komórki się nie zmienia. Silnik daje identyczne wyniki dla każdej komórki w { "0.28.0" } i { "0.29.0" }.

seg-146588a39e7c = <b>Próbkowanie z ziarnem w pakiecie WebAssembly (WASM).</b> Kompilacja przeglądarkowa losowała inne indeksy bootstrapu i tasowania niż kompilacja natywna z tego samego ziarna (przy Fixed). Przedział <c1/> pola pod krzywą w przeglądarce wynosił <c2/>, a teraz jest to natywne <c3/>. Żadna liczba natywna się nie zmienia.

seg-017810049453 = Wartości podane w dokumentacji

seg-85ab2a364a37 = Dokumentację przeaudytowano słowo po słowie względem przebiegów silnika tego wydania. Tam, gdzie podana wartość nie zgadzała się z przebiegiem, dokument poprawiono, a każda poprawka jest tu wymieniona, stare → nowe. W każdym poniższym przypadku wynik silnika się nie zmienił; to dokument źle go odczytał, źle zaokrąglił lub się zdezaktualizował.

seg-1eacdefbfda2 = <b>Audyt dokumentacji stron o widmie, konstelacjach, kampaniach, animacji, raportach i interoperacyjności oraz nowy <c1/>.</b> Każdą wartość przeliczono ponownie tym silnikiem. Zmieniają się dwie opublikowane liczby: <c2/> podawał test pokrycia dla { "5" } 000 satelitów jako „około { "0.13" } s w kompilacji debug”; to się nie odtworzyło ({ "1.24" } s na obciążonym laptopie), więc strona podaje teraz udział prefiltra, który drukuje test ({ "9.9" } % z { "19 440 000" } testów par), oraz { "0.14" } s binarki wydaniowej dla dołączonego <c3/>. Ta sama strona podawała przecięcie E3F jako „off by { "0.050" } deg”; żaden test nie drukuje tej wartości, więc strona podaje teraz tylko próg { "0.06" } deg, który test wymusza, oraz wyprowadzenie { "7.30" } wobec { "7.36" } deg, które za nim stoi. Żaden wynik silnika się nie zmienia.

seg-2ad182e2db15 = Dokumenty LEO-PNT: poprawione opublikowane wartości (przeliczone ponownie na silniku tego wydania).

seg-6c2401365dd5 = <c1/> kompromis między pasmami: opóźnienie jonosferyczne pierwszego rzędu dla <c2/> wynosi { "3.24" } m (podano { "3.25" } m), a dla <c3/> { "0.77" } m (było { "0.78" } m). <c4/> kodowanie i dekodowanie: SISRE zdekodowanej wiadomości podano jako { "0.119" } cm, gdy przebieg dał { "0.122" } cm; strona podaje teraz { "0.129" } cm, wartość po poprawce niezależności od platformy przy Fixed poniżej. <c5/> przelot LEO w porównaniu z GNSS: o { "32" } dB mniejsza strata w wolnej przestrzeni w szczycie przelotu (było „{ "26" } do { "32" } dB”). Dla wartości sygnału i przelotu wynik silnika się nie zmienił; dokumenty źle go odczytały lub źle zaokrągliły.

seg-fc3c8ba1b789 = <b>Samouczki, przykład potoku roboczego i polecenie <c1/>, przeaudytowane względem silnika tego wydania.</b> Rewizje opublikowanych wartości, stare → nowe: rodzajów, które zapisują <c2/>, jest sześć, nie cztery (brakowało <c3/> i <c4/>; <c5/>, <c6/>); przecięcie ½bT² dla zimnych atomów w Samouczku { "3" } wynosi { "18,443" } s, nie { "18,440" } s; błąd przejścia w obie strony <c7/> w <c8/> to zmierzone { "4.88e-7" } km, nie „~{ "1e-7" } km”; pasmo holdover CSAC w Samouczku { "2" } to { "2000" }–{ "3200" } s, które test potwierdza, a nie „~{ "2600" }–{ "4400" } s”; Samouczek { "1" } cytuje wiersze SP3 i blok geometrii z dokładnością, z jaką zapisuje je silnik. Żaden wynik silnika się nie zmienił.

seg-4c613cabb87b = Strony o walidacji, kwantowych, SGP4, animacji, twierdzeniach i integralności.

seg-c49d5cdb36e1 = <c1/>: wymuszany próg dla symulowanego jednosekundowego odchylenia Allana zegara z szumem białym częstotliwości wynosi { "20" } % (podano { "25" } %; próg { "25" } % dotyczy krzywej przy { "1" }, { "10" } i { "100" } s); wiersz błądzenia losowego prędkości podaje teraz swój wymuszany próg { "20" } % obok obserwowanych około { "12" } %; a dostępność zegara atomowego w skali chipa w <c2/> wynosi około { "0.73" } (podano około { "0.83" }). <c3/>: szum pojedynczego strzału ograniczony wibracjami w przykładzie roboczym zimnych atomów na stronie wynosi około { "46" } razy jego dolną granicę szumu śrutowego (było „~{ "45" }×”; przeliczone { "46.49" }), a zakres „{ "1" }–{ "50" } µg/√Hz” dla urządzeń terenowych, który przeczył urządzeniu cytowanemu przez samą stronę, zastąpiono opublikowanymi wartościami dwóch cytowanych urządzeń. <c4/>: najgorsza różnica pozycji wynosi { "4.12" } mm (było „≈ { "4" } mm”), z nazwanym satelitą. <c5/>: przykład z koderem wideo odczytywał klatki o { "24" } klatkach na sekundę jako { "12" }; teraz używa { "24" }, czyli częstotliwości podanej w manifeście klatek. <c6/>: model zagłuszania ma { "10" } testów (było { "8" }), a „{ "2.97" } m wobec { "48.8" } m” dla filtru sprzężonego zastąpiono tym, co jego test potwierdza (sprzężony błąd pozycji poniżej { "0.6" } razy błędu niesprzężonego, wygrywając w co najmniej { "90" } z { "100" } prób). <c7/>: stempel „Today” brzmiał { "v0.22.0" }; teraz nazywa to wydanie, a dwie możliwości zbudowane od tamtej pory (tryb błędu całej konstelacji i wiadomość wsparcia integralności) znikają z jego listy luk.

seg-4fde8788f95f = <b>Rodzaj scenariusza <c1/>: model widma pasma L i wodospad</b> (<c2/>, <c3/>, <c4/>). Całe pasmo L GNSS jako jedna gęstość widmowa mocy (PSD): GPS L1 kod zgrubny/akwizycyjny (C/A) i L2 cywilny (L2C) (BPSK({ "1" })), Galileo E1 (multipleksowana modulacja z przesunięciem binarnym nośnej, MBOC(6,1,1/11), lub BOC({ "1,1" })), GPS L5 i Galileo E5a (BPSK({ "10" })), poziom szumu kT ze współczynnikiem szumu odbiornika oraz jammery fali ciągłej (CW), wąskopasmowe, z przemiataniem i z szumem dopasowanym na zapisanej osi czasu. Każdy jammer jest oceniany w każdym paśmie przez swój współczynnik separacji widmowej (SSC), co daje stosunek jammera do sygnału (J/S) i efektywny stosunek mocy nośnej do gęstości szumu (C/N0) na pasmo na wiersz. Wykres to wodospad SVG z słupkami C/N0; result.json zawiera siatkę uśrednioną blokowo w mocy. Opcjonalne <c5/> rysuje model jako próbki IQ, zapisuje i odczytuje nagranie Signal Metadata Format (SigMF) (<c6/>, <c7/>) i porównuje estymatę Welcha z modelem; opcjonalne <c8/> estymuje rzeczywisty plik SigMF. Dołączony przykład <c9/>: przemiatany sygnał przejmuje L1 C/A i E1 w { "10" } s, ton CW na nośnej L1 utrzymuje C/A na poziomie { "17.98" } dB-Hz po ustaniu przemiatania, podczas gdy E1, którego widmo ma tam zero, wraca do normy; L5 i E5a pozostają nietknięte.

seg-fa9976349886 = Nowy wiersz VALIDATED: PSD i SSC sygnałów, względem głównego listka BPSK(n) o szerokości 2n x { "1.023" } MHz, listków BOC({ "1,1" }) wyśrodkowanych w +/-1.023 MHz, zamkniętych postaci Parsevala stojących za opublikowanymi SSC -61.8 / -64.8 / -67.8 dB/Hz oraz podręcznikowych Q = { "1" } (CW) i { "1.5" } (dopasowany). Maksimum PSD BOC({ "1,1" }) leży w +/-0.759 MHz, a nie w środku listka; test przypina jedno i drugie.

seg-411431a9b26b = Dwa nowe wiersze MODELLED: wodospad i oś czasu C/N0, które sprowadzają się dokładnie do łańcucha rodzaju <c1/> (sprawdzane krzyżowo w każdym raporcie), oraz kodek SigMF i estymator Welcha. W repozytorium nie ma żadnego nagrania osób trzecich.

seg-5c5c695e7c0a = <c1/>: wariant MBOC oraz <c2/>.

seg-bb346f4942a9 = Raport drukuje wartość C/N0, jaką dałaby reprezentatywna tabela Q rodzaju <c1/>, obok wartości wyprowadzonej z widma; dla tonu CW na nośnej C/A różnią się one o { "1.8" } dB. Trzy nowe wiersze macierzy: jeden sprawdzony (widma sygnałów i współczynniki separacji widmowej) i dwa obliczone z modelu.

seg-673dfe048dad = <b>Efemerydy Układu Słonecznego i pozycjonowanie wokół dowolnego ciała.</b> Dwa nowe rodzaje scenariuszy.

seg-3e1b0e8e99e9 = <c1/>: Słońce, osiem planet, Pluton, Księżyc, Fobos, Deimos, Io, Europa, Ganimedes, Kallisto i Tytan w jednej epoce: położenie i prędkość heliocentryczne w Międzynarodowym Niebieskim Układzie Odniesienia (ICRF), parametr grawitacyjny, promienie, J2 (druga harmoniczna strefowa), tam gdzie jest opublikowana, rotacja gwiazdowa, biegun i południk zerowy według Międzynarodowej Unii Astronomicznej (IAU), ślad orbity w ciągu jednego obiegu oraz czas światła, odległość w jedną i w obie strony, solarne opóźnienie Shapiro i separacja od Słońca z ciała obserwatora i dla każdego dodatkowego łącza. Planety pochodzą z elementów keplerowskich Jet Propulsion Laboratory (JPL) według Standisha i Williamsa (Tabela { "1" }, { "1800" } AD do { "2050" } AD; Tabele 2a/2b, { "3000" } BC do { "3000" } AD); księżyce z elementów średnich JPL z synchroniczną prędkością obrotu według IAU, a Tytan z modelu rotacji IAU. Przykład: <c2/>.

seg-6a094973208b = <c1/>: orbiter lub lądownik na powierzchni wokół dowolnego z tych ciał, nawigujący za pomocą pseudoodległości z konstelacji Walkera wokół ciała i odległości w obie strony bez zegara z Ziemi; rozmycie dokładności, niepewność formalna i rozwiązania metodą najmniejszych kwadratów z ziarnem, z łączem z Ziemią i bez niego. Przykłady: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> zyskuje Merkurego, Wenus, Jowisza, Saturna, Urana, Neptuna, Plutona i siedem księżyców, wyszukiwanie po nazwie oraz rekord fizyczny; <c2/> podaje dowolne ciało względem dowolnego innego przez istniejący szew <c3/>.

seg-8b5c2fbe91f7 = VALIDATED względem JPL Horizons (Development Ephemeris DE441; wzorce i zapytania w <c1/>): od Merkurego do Saturna oraz Ziemia z Tabeli { "1" } w granicach dwukrotności podanego błędu nominalnego (najgorzej { "1.87" } razy), wszystkie osiem planet z Tabel 2a/2b (najgorzej { "1.71" } razy) oraz czas światła Ziemia–Mars i Ziemia–Jowisz. MODELLED: Uran i Neptun z Tabeli { "1" }, które przekraczają podany błąd względem DE441 ({ "2.0" } i { "5.2" } razy), Pluton, księżyce, stałe ciał i wyniki <c2/>.

seg-a3c83f6d2078 = Ustalenie: szereg księżycowy Montenbrucka i Gilla w <c1/> jest już odniesiony do równonocy J2000 przez własny człon precesji ({ "0.05" } stopnia od Horizons), więc używa się go bez dodatkowej rotacji precesji. Sześć nowych wierszy macierzy: dwa sprawdzone (położenia planet, czas światła) i cztery obliczone z modelu.

seg-564133d6a0c4 = Konstelacje wokół dowolnego ciała

seg-d1ddb76d8bf3 = <b>Projektowanie konstelacji na dużą skalę (rodzaj <c1/>, <c2/>).</b> Wzory Walker delta i Walker star (T/P/F), jawne listy elementów i projekty wielopowłokowe, kilka konstelacji na przebieg, wokół Ziemi, Księżyca, Marsa lub innej planety, Plutona albo większego księżyca, ze stałych ciał dodanych przez rodzaj <c3/>. Presety z opublikowanych elementów nominalnych: bazowa i rozszerzalna 24-slotowa konstelacja Global Positioning System (GPS) (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, wydanie { "1.1" }), BeiDou na średniej orbicie okołoziemskiej Walker 24/3/1 plus satelity geostacjonarne i nachylone geosynchroniczne (Open Service Performance Standard { "3.0" }) oraz GLONASS 24/3/1 (Interface Control Document { "5.1" }). Pokrycie i rozmycie dokładności (DOP) na siatce szerokości i długości geograficznej: satelity w zasięgu widzenia, GDOP, PDOP, HDOP i VDOP (geometryczne, położenia, poziome, pionowe) i dostępność na komórkę, globalnie i w najgorszym miejscu, z jednym zegarem odbiornika na konstelację. Prefiltr widoczności (półkąt pokrycia plus pas szerokości podsatelitarnej, dokładny na ciele kulistym) przetwarza { "5 000" } satelitów na siatce { "10" } deg w około { "0.13" } s w kompilacji debug.

seg-8f4ebd177f3d = VALIDATED: generator Walkera odtwarza Tabelę { "23" } Galileo OS SDD i wzór slotów z GLONASS ICD; preset GPS odtwarza kolumnę przecięć równika z SPS PS ({ "35" } z { "36" } lokalizacji w granicach { "0.0108" } deg; E3F w granicach { "0.06" } deg, przy czym własny wiersz tabeli jest niespójny); bazowy globalny rozkład HDOP dla GPS zgadza się z Dodatkiem B SPS PS (mediana { "0.940" } wobec { "0.94" }, { "95" } % { "1.255" } wobec { "1.25" }, średnia { "0.965" } wobec { "0.96" }; próg { "0.03" }).

seg-65658a896a73 = MODELLED: dowolne projekty, inne ciała, faza BeiDou i węzły nachylone geosynchroniczne, orbity dwóch ciał z opcjonalnym J2, wyłącznie geometria.

seg-3dfe470e8a5c = Scenariusze: <c1/> ({ "102" } satelitów, dostępność { "100" } %, mediana PDOP { "0.95" }, { "31.0" } w zasięgu widzenia powyżej { "10" } deg), <c2/> ({ "5 000" } satelitów, dostępność { "99.22" } % przy PDOP { "3" } lub mniejszym powyżej { "20" } deg, { "0" } % na czapach polarnych, prefiltr zachowuje { "11.5" } % testów par), <c3/> ({ "14" } satelitów wokół Księżyca, dostępność { "21.33" } % ogółem i najwyższa nad rejonem południowego bieguna). Wszystkie trzy są dołączone do <c4/>. Uwagi: <c5/>. Trzy nowe wiersze macierzy: dwa sprawdzone (generator Walkera i presety GNSS, globalny DOP GPS) i jeden obliczony z modelu.

seg-79e2d2c42166 = Kampania napędzana modelem widma i konstelacje wokół dowolnego ciała.

seg-4ab5f6f6bbbb = <c1/> łączy rodzaj <c2/> z holdoverem zegara i monitorem integralności (przemiatany sygnał przejmuje L1 C/A i E1; ton CW utrzymuje następnie C/A w dole, podczas gdy E1 wraca do normy, a odbiornik przechodzi na niebo wyłącznie Galileo), przypięta względem samodzielnego przykładu wodospadu w <c3/>. <c4/> rozwiązuje teraz swoje ciało centralne przez <c5/>, więc konstelację można rozmieścić wokół dowolnej planety, Plutona lub większego księżyca ze stałymi używanymi przez rodzaj <c6/>.

seg-dc904f639fed = <b>Kampanie: wiele scenariuszy złożonych w jeden przebieg.</b> Nowy rodzaj <c1/> (<c2/>, opisany w <c3/>) uruchamia członków istniejących rodzajów przez to samo rozdzielanie co wiersz poleceń i odczytuje liczby z ich wyników. Cztery sekcje, w dowolnej kombinacji:

seg-903ee141047a = <c1/>: łańcuchowa misja na jednej osi czasu. Presety dla poszczególnych rodzajów odczytują błąd czasu zegara względem jego strażnika, średni efektywny stosunek mocy nośnej do gęstości szumu (C/N0) względem progu śledzenia, pionowy poziom ochrony względem limitu alarmu, błąd pozycji, śledzące satelity i flagi alarmów, utrzymane na wspólnej siatce z granicami faz i zdarzeniami. Stan jest przekazywany przez <c2/>, <c3/> i <c4/>.

seg-4eeedde09a77 = <c1/>: od jednego do trzech kluczy z kropkami dowolnego rodzaju, opcjonalnie z zespołem z ziarnem w każdym węźle.

seg-4c113198cbb7 = <c1/>: realizacja k przy ziarnie bazowym + k, ze średnią, rozrzutem, percentylami i { "95" }% przedziałem ufności bootstrapu ze stałym ziarnem.

seg-df107253752d = <c1/>: wspólne wartości powiązane z kilkoma członkami, ze złożonym podsumowaniem najlepszego i najgorszego przypadku. Każdy wynik niesie hasz kampanii i skrót ze wszystkich wyników członków. Cztery dołączone scenariusze: <c2/> (nominalny, zagłuszanie, spoofing zakończony przy detekcji monitora zegara po { "370" } s, holdover z przesunięciem { "37.0" } ns po spoofingu przy bezwładnościowym wybiegu, alarm integralności, odzyskanie), <c3/>, <c4/> i <c5/>. <c6/> przypina tożsamości złożenia: kampania jednofazowa odtwarza samodzielny przebieg bit w bit dla trzech rodzajów, zespół ze stałym ziarnem jest stabilny co do bajta, a przy zegarze z szumem białym częstotliwości średnia zespołu leży wewnątrz zgłoszonego przedziału, z rozrzutem wewnątrz przedziału chi-kwadrat dla sqrt(q_wf * tau) = { "16.459" } ns. Trzy nowe wiersze macierzy typu obliczonego z modelu.

seg-c611ee59301a = Animacja

seg-14b2d3cc9e7c = <b>Eksport animacji (<c1/>, <c2/>, <a1><c3/></a1>).</b> Każdy przebieg, którego wynik zawiera szereg czasowy, można teraz zapisać jako animowany plik Scalable Vector Graphics (SVG) (klatki kluczowe Cascading Style Sheets, bez skryptu: ślady rysują się za poruszającym się kursorem czasu), jeden samodzielny odtwarzacz HyperText Markup Language (HTML) (odtwarzanie i pauza, przewijanie, prędkość, każdy panel na jednym zsynchronizowanym kursorze, znaczniki zdarzeń przewijające po kliknięciu; bez zewnętrznych zasobów) albo ponumerowaną sekwencję klatek SVG z plikiem <c4/> podającym liczbę klatek na sekundę, czas trwania i czasy klatek dla kodera wideo. Kampania odtwarza się jako jej fazy z zaznaczonymi alarmami; przebieg widma animuje swój wodospad wiersz po wierszu. Odtwarzacz stosuje się do <c5/>, a przy <c6/> zarówno SVG, jak i odtwarzacz pokazują gotowy obraz zamiast ruchu. <c7/> i <c8/> ustawiają odtwarzanie; <c9/> i <c10/> to punkty wejścia biblioteki, a <c11/> zyskuje blok <c12/> tylko wtedy, gdy działa <c13/>. Wynik jest czystą funkcją wyniku i opcji, identyczny bajt w bajt przy ponownym przebiegu, bez znacznika czasu. Rodzaj bez próbkowanej osi czasu zostaje odrzucony z komunikatem „no time series to animate” i nic nie jest zapisywane. Eksporter rysuje własne próbki przebiegu i nie dodaje żadnej liczby, więc jest MODELLED (wewnętrzna spójność) i nie ma wiersza macierzy weryfikacji; żadna opublikowana liczba się nie zmienia. Testy: <c14/> (determinizm, liczba klatek, brak zewnętrznego adresu, poprawnie sformułowany XML, ścieżka ograniczenia ruchu i animowanie każdego dołączonego scenariusza z szeregiem czasowym).

seg-c01b78b64065 = Raporty

seg-2662fdb991f3 = <b>Zaawansowane raporty z przebiegów (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Każdy przebieg z interfejsu wiersza poleceń (CLI) zapisuje teraz <c2/>, raport HyperText Markup Language (HTML) do wydruku, oraz <c3/>, tę samą treść jako dokument JavaScript Object Notation (JSON) czytelny dla maszyn. Sekcje: streszczenie dla kierownictwa; każde wejście scenariusza z jego jednostką, odczytaną ze schematu jednostek pól (blok <c4/> wyniku), w przeciwnym razie z sufiksu nazwy pola, w przeciwnym razie podane jako niepodane; wyniki z wykresem przebiegu, każdą wartością skalarną i podsumowaniem każdej kolumny liczbowej; dla kampanii tabela węzłów przeglądu, średnia Monte Carlo, odchylenie standardowe, percentyle 5. / 50. / 95. i przedział ufności bootstrapu z histogramem dla każdej metryki, tabela faz łańcucha albo członkowie kompozycji i podsumowanie złożone (oraz siatka przebiegu <c5/> lub <c6/>); oś czasu zdarzeń; etykieta VALIDATED / MODELLED / PARTNER, wyrocznia i dowody testowe każdego wiersza macierzy weryfikacji, który wykorzystują rodzaje przebiegu, odczytane z macierzy przez tabelę przyporządkowania rodzaj–wiersz (wiersz, który ocenia jedną ścieżkę wejściową, taką jak ścieżka Simplified General Perturbations { "4" } (SGP4) rodzaju <c7/> lub ścieżka zmierzonego zapisu rodzaju <c8/>, jest wymieniany tylko wtedy, gdy przebieg poszedł tą ścieżką, a wiersz czytnika Shuttle Radar Topography Mission (SRTM) nie jest wymieniany dla żadnego rodzaju, ponieważ żadne pole scenariusza nie czyta kafla SRTM); stwierdzenia o tym, czego nie modelowano, i założenia, każde zacytowane ze swoim źródłem; oraz zapis odtwarzalności (wersja silnika, commit źródłowy, gdy kompilacja ustawia <c9/>, skróty Secure Hash Algorithm 256-bit (SHA-256) pliku scenariusza i dokumentu wyniku, ziarno, platforma i dokładne polecenie). Raport nie czyta zegara: ten sam scenariusz, ziarno i kompilacja silnika dają raport identyczny bajt w bajt, a jedyny znacznik czasu, jaki może pokazać, to ten, który <c10/> już zapisuje. Arkusz stylów do druku mieści się na A4 i US Letter, powtarza nagłówki tabel i utrzymuje wiersze i rysunki w całości na stronach; plik Portable Document Format (PDF) powstaje przez „Zapisz jako PDF” w przeglądarce. Nie ma opcji <c11/>, ponieważ renderowanie wykresów do PDF wymagałoby nowej, ciężkiej zależności. Testy: <c12/> raportuje każdy dołączony scenariusz (żadnej pustej sekcji, żadnego tekstu zastępczego, etykiety równe macierzy, skrót scenariusza równy skrótowi pliku, identyczność bajt w bajt przy ponownym przebiegu), a <c13/> ponownie uruchamia zapisane polecenie w nowym katalogu i wymaga identycznego bajt w bajt <c14/>. Żadna opublikowana liczba się nie zmienia, a liczby rodzajów, plików scenariuszy i wierszy macierzy pozostają bez zmian.

seg-ce45e75c6d67 = <b>Raport, animacja i eksporty działają razem.</b> Raport zaawansowany zyskuje sekcję „Animation and exports”: animowany rysunek przebiegu osadzony jako nieaktywny obraz (lub powód, dla którego go nie ma), odnośniki do plików animacji i eksportu zapisanych obok oraz każdy format interoperacyjności z informacją, czy ma zastosowanie, dlaczego nie, i jego specyfikacją; <c1/> zawiera ten sam blok <c2/>. Odtwarzacz animacji HTML wymienia pliki eksportu zapisane obok niego. Interfejs wiersza poleceń (CLI) renderuje teraz eksporty przed zapisaniem raportu, więc oba mogą nazywać te pliki.

seg-c60dc5b92a60 = Eksporty interoperacyjności

seg-5bfce52c5a13 = Eksporty i importy interoperacyjności (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> zapisuje geometrię scenariusza jako CZML (Cesium Language), KML (Keyhole Markup Language { "2.2" }, standard Open Geospatial Consortium, ze śladami ze znacznikami czasu <c2/>), GeoJSON (Internet Engineering Task Force Request for Comments { "7946" }) i efemerydy Ansys STK (Systems Tool Kit) <c3/> (<c4/>, metry, jeden plik na poruszający się obiekt), a zsyntetyzowaną migawkę IQ (składowe synfazowa i kwadraturowa) rodzaju <c5/> jako parę SigMF (Signal Metadata Format) przez istniejący <c6/>. <c7/> zapisuje każdy format, który ma zastosowanie, i drukuje, dlaczego pozostałe nie; <c8/> raportuje bez uruchamiania. Poruszające się obiekty są zapisywane w Geocentrycznym Niebieskim Systemie Odniesienia (CZML <c9/>, STK <c10/>) oraz jako długość, szerokość i wysokość związane z Ziemią w WGS { "84" } (World Geodetic System { "1984" }) (KML, GeoJSON); stałe miejsca w CZML to <c11/>. Rodzaj <c12/> dodaje dwa zasięgi jammerów z własnych równań łącza. <c13/> zapisuje GeoJSON <c14/> w wejściach śladu <c15/>, <c16/>, <c17/> i <c18/>. Eksporty są deterministyczne co do bajta i nie niosą znacznika czasu. <c19/> waliduje każdy eksport względem opublikowanej specyfikacji, porównuje wyeksportowane stany satelitów z własnymi stanami silnika z dokładnością { "1" } mm i przepuszcza każdy dołączony scenariusz przez każdy format, każdy albo eksportuje, albo podaje dlaczego nie (tabela w docs/INTEROP.md). Żadna opublikowana liczba się nie zmienia: synteza IQ rodzaju <c20/> przeniesiona do jednej wspólnej funkcji, a jego dokument wyniku jest identyczny bajt w bajt, a <c21/> zyskuje <c22/> i <c23/> używane przez jego własny przebieg. Liczby rodzajów, plików scenariuszy i wierszy macierzy weryfikacji pozostają bez zmian. Scenariusz orbity lub integralności bez <c24/> jest datowany własnymi danymi swoich satelitów: <c25/> to najwcześniejsza epoka TLE (zestawu elementów dwuliniowych), efemerydy rozgłaszanej lub SP3 (Standard Product { "3" }), a każdy taki satelita jest obracany do układów GCRS i związanych z Ziemią w swojej własnej chwili; 2000-01-01T00:{ "00" }:00Z jest używane tylko wtedy, gdy żaden satelita nie niesie epoki. Eksporty SP3 i OEM (Orbit Ephemeris Message) zachowują swoją etykietę 2000-01-01. Aby to wesprzeć, dodano <c26/>, <c27/> i <c28/>; nic, co istniało, ich nie czyta.

seg-12c151a800f9 = Nawigacja z niskiej orbity okołoziemskiej: sygnał

seg-9b665682695a = <b>Projekty sygnałów LEO-PNT i widmo wielopasmowe.</b> Nowy rodzaj <c1/> i rodzaj <c2/>, który sięga poza pasmo L: jeden rodzaj, cztery pliki scenariuszy (trzy dołączone; plik Celeste IOD jest tylko w repozytorium) i cztery wiersze macierzy (dwa VALIDATED, dwa MODELLED).

seg-b355b28bfd1b = <c1/>: sparametryzowane projekty sygnałów pozycjonowania, nawigacji i czasu (PNT) z niskiej orbity okołoziemskiej (LEO) dla dowolnego systemu (pasmo, szerokość pasma nadawania, przydział ITU; składowe akwizycyjna, danych i pilotowa z widmami BPSK(n), BOC(m,n), MBOC lub płaskimi, udziałami mocy, podnośnymi FDMA, długościami kodu i szybkościami danych), z wkompilowanych publicznych plików presetów w <c2/> (Xona Pulsar X1/X5, Iridium STL, sygnał okazji Starlink, CentiSpace, reprezentatywny projekt w paśmie C oraz reprezentatywne projekty UHF/L/S/C/szerokie C, każdy z podanym adresem URL źródła) albo zapisane w treści. Na sygnał: PSD ograniczone pasmem i udziały mocy w paśmie, szerokość pasma Gabora, ograniczony pasmem jitter śledzenia kodu wczesny–późny względem C/N0 i odstępu (Betz i Kolodziejski { "2009" }) oraz dokładność wyznaczania odległości, przestrzeń przeszukiwania akwizycji, prawdopodobieństwo detekcji i średni czas akwizycji szeregowej i równoległej względem kodu, SSC do GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b i AltBOC i z nich, wraz ze stratą C/N0, tolerancją J/S dla CW, szerokopasmową i dopasowaną z kodu SSC rodzaju widma, kompromis między pasmami (opóźnienie jonosferyczne, strata w wolnej przestrzeni, wyznaczanie odległości przy równym C/N0 i równym EIRP, tolerancja na jammer) oraz opcjonalne kontrole kształtu względem opisanego pomiaru. Przykłady: <c3/>, <c4/>, <c5/> (pasma i konfiguracja sygnału Celeste IOD przedstawione na warsztatach ESA NAVISP LEO-PNT, { "2026" }; wstrzymane razem z presetem Celeste IOD, zob. „LEO-PNT end to end” poniżej). Uwagi w <c6/>.

seg-8f58debf721f = <c1/>: pasma mogą być teraz presetowym projektem sygnału (każda składowa narysowana, ograniczona pasmem, C/N0 i J/S odniesione do śledzonej składowej) albo własną nośną i modulacją; <c2/> dodają wodospady dla innych zakresów częstotliwości na jednej osi czasu; jammer <c3/> (zaporowy) dołącza do czterech przebiegów. Raport dodaje <c4/>, <c5/> i <c6/> oraz jeden wpis <c7/>. Zwykłe pasma dają te same liczby co wcześniej. Przykład: <c8/>.

seg-98f74d85c54b = <c1/> zyskuje całkę sinusową, zamknięte postaci mocy BPSK w paśmie i szerokości pasma Gabora ograniczonej pasmem, jitter wczesny–późny ograniczony pasmem dla dowolnego widma i jego granicę Gabora, zamkniętą postać SSC dla przesuniętego BPSK, widmo Galileo E5 AltBOC({ "15,10" }) oraz parser etykiet modulacji; <c2/> drukuje BPSK(1/3) jako ułamek.

seg-78d9e5e2c615 = Cztery wiersze macierzy: VALIDATED zamknięte postaci ograniczone pasmem ({ "90.3" } % mocy BPSK w głównym listku, jitter sprowadzający się do postaci koherentnej Kaplana i Hegarty'ego, { "0.0039564" } chipa przy { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, oraz do swojej granicy Gabora, i własne SSC BPSK 2/({ "3" } R_c); zamknięta postać Gabora i przesunięte SSC względem jego postaci Parsevala podano jako wewnętrzne kontrole krzyżowe); VALIDATED maksymalny Doppler LEO (Xona X1 { "33.2" } kHz w opublikowanym zakresie od { "32" } do { "34" } kHz, Iridium w granicach { "0.5" } kHz od { "36" } kHz); MODELLED <c1/>; MODELLED widmo wielopasmowe.

seg-45d3d4a46d6b = Nawigacja z niskiej orbity okołoziemskiej: łącze

seg-1d120db87aae = <b>Przelot LEO-PNT i bilans łącza dla każdego pasma: rodzaj <c1/>.</b> LEO-PNT to pozycjonowanie, nawigacja i czas z satelitów na niskiej orbicie okołoziemskiej (LEO). Użytkownik (naziemny, morski, powietrzny lub we wnętrzu, nieruchomy lub w ruchu) i jeden lub więcej satelitów LEO z zaprojektowanego przelotu, jawnych elementów, zestawu elementów dwuliniowych (TLE) przez SGP4 albo konstelacji Walkera z kodu <c2/>. Na satelitę, pasmo i epokę: kąty widzenia, odległość, zamknięta postać prędkości i przyspieszenia zmiany odległości (sprawdzane w każdym przebiegu względem różnic centralnych), Doppler i jego tempo, strata w wolnej przestrzeni, EIRP (równoważna moc promieniowana izotropowo) z charakterystyką satelity izoflux, wiązką gaussowską lub płaską, antena użytkownika typu patch, tłumienie gazowe ITU-R P.676, tłumienie deszczu ITU-R P.838/P.618, scyntylacja troposferyczna P.618, strata wnikania do budynku ITU-R P.2109 dla użytkownika we wnętrzu, niedopasowanie polaryzacji, temperatura szumowa systemu i C/N0 (stosunek mocy nośnej do gęstości szumu); opóźnienie jonosferyczne pierwszego rzędu w każdym paśmie z ukośnego TEC (całkowitej zawartości elektronów) według Klobuchara lub pionowego TEC poniżej satelity oraz pary pasm wolne od jonosfery z ich wzmocnieniem szumu. Satelity Galileo lub GPS są oceniane tym samym odbiornikiem na podstawie mocy odbieranych z dokumentów interfejsu, więc dzwonowaty przelot LEO i płaskie nośne MEO (średnia orbita okołoziemska) mają wspólny wykres. Sekcja <c3/> podaje czas do pierwszego rozwiązania pozycji, energię na rozwiązanie i czas pracy baterii względem cyklu pracy (MODELLED).

seg-17f3503e1be3 = Niezależność od systemu: silnik nie potrzebuje żadnego presetu. Opcjonalne presety, każdy w osobnym pliku i oznaczony PUBLIC (z URL), REPRESENTATIVE lub WORKSHOP: ogólny wielopasmowy (UHF, L, S, C), ogólne pasmo C, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink jako sygnał okazji wyłącznie dopplerowski, CentiSpace oraz Celeste IOD (demonstracja na orbicie), którego parametry sygnału przedstawiono na warsztatach ESA NAVISP LEO-PNT, { "2026" }, i które znajdują się w <c1/>, aby można je było wstrzymać (zob. „LEO-PNT end to end” poniżej).

seg-a338cc46a1e0 = Publiczne bloki konstrukcyjne w <c1/> (geometry, antenna, itu, iono, energy, presets), które mogą wywoływać inne moduły.

seg-887ad03cb6f6 = Scenariusze: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-a20f1602c236 = Dziewięć wierszy macierzy. VALIDATED ({ "6" }): współczynniki ITU-R P.838-3 względem jego Tabeli { "5" }; tłumienie deszczu i scyntylacja P.618-14 względem przykładów walidacyjnych ITU-R Study Group { "3" }; strata wnikania do budynku P.2109 względem skoroszytu Study Group { "3" }; skalowanie jonosferyczne pierwszego rzędu względem stosunku opóźnień grupowych z IS-GPS-200, ze stratą w wolnej przestrzeni; maksymalny Doppler użytkownika nieruchomego na orbicie kołowej względem arXiv { "2509.19551" }, Tabela { "1" }. MODELLED ({ "3" }): przelot i bilans łącza, presety oraz bilans rozwiązania niskoenergetycznego. Jeden rodzaj i sześć plików scenariuszy. Uwagi w <c1/>.

seg-ef74b0f08aa1 = Nawigacja z niskiej orbity okołoziemskiej: wiadomość nawigacyjna

seg-866ff4ee8b19 = <b>Wiadomość nawigacyjna LEO (rodzaj <c1/>, <c2/>).</b> Rozgłaszana wiadomość z efemerydami i zegarem satelity pozycjonowania, nawigacji i czasu (PNT) na niskiej orbicie okołoziemskiej (LEO), dla dowolnej orbity, nośnej i modelu; nazwane presety są danymi opcjonalnymi, a każda możliwość działa bez nich. Jeden rodzaj, pięć plików scenariuszy i dziewięć wierszy macierzy (trzy VALIDATED, sześć MODELLED). Zob. <c3/>.

seg-c42821b6e855 = Zawartość wiadomości: SVID, wydanie danych, pasmo i stan sprawności sygnału; tydzień, czas tygodnia i wielomian zegara drugiego rzędu; efemerydy w jednym z czterech modeli — 16-parametrowy zestaw keplerowski z Galileo OS SIS ICD, ten zestaw plus wielomiany poprawek wzdłuż toru, poprzecznych do toru i radialnych, 22-parametrowy model Liu i in. { "2025" } (doi 10.3390/rs17162894) albo wielomian ECEF ATOMIC z zerowym zegarem — oraz zestaw Klobuchara, współczynniki NeQuick-G z efektywnym poziomem jonizacji i parametry czasu systemowego do UTC z przypadkami sekundy przestępnej z ICD.

seg-e4565696f162 = Dopasowanie: orbita prawdziwa całkowana z grawitacją zonalną J2–J6 lub EGM2008 i oporem, zegar swobodny lub sterowany z ziarnem, dopasowanie Levenberga–Marquardta na elementach niesingularnych, następnie liniowe wielomiany poprawek metodą najmniejszych kwadratów oraz zegar dopasowany po odjęciu relatywistycznego członu użytkownika.

seg-a7287b7b336c = Cztery analizy i scenariusze: <c1/> (błąd odległości sygnału w przestrzeni (SISRE) względem przedziału dopasowania i okresu aktualizacji), <c2/> (cztery modele, bity i 22-parametrowe dopasowanie Kshana na wysokościach z Liu i in. obok opublikowanych wartości, MODELLED), <c3/> (ciągłość przy każdym przełączeniu wiadomości w przelocie) i <c4/> (własna udokumentowana ramka binarna Kshana z CRC-24Q i bilansem kwantyzacji, blok w stylu RINEX-4 oznaczony jako rozszerzenie Kshana oraz tabela CSV).

seg-e272dce3d10f = VALIDATED: globalnie uśrednione wagi SISRE względem opublikowanej tabeli orbit średnich i geostacjonarnych Montenbrucka i in. { "2018" }; algorytm użytkownika Galileo względem RTKLIB na czterech rzeczywistych rozgłaszanych efemerydach Galileo (<c1/>); CRC-24Q względem wartości kontrolnej z katalogu i ramki przykładowej RTCM { "10403" } { "1005" }.

seg-5c8592195b0d = Presety, po jednym pliku ze źródłami: Xona Pulsar i Pulsar-0, Iridium, Starlink, CentiSpace, reprezentatywny system w paśmie C, ATOMIC oraz Celeste IOD (jedyny preset używający materiałów przedstawionych na warsztatach ESA NAVISP LEO-PNT, { "2026" }, przechowywany w <c1/> razem ze swoimi scenariuszami, aby można go było wstrzymać).

seg-9fb0cbf29cef = Nawigacja z niskiej orbity okołoziemskiej: fuzja

seg-071f4db017c5 = <b>Połączone pozycjonowanie, nawigacja i czas MEO + LEO: <c1/>, <c2/> i <c3/>.</b> Trzy nowe rodzaje scenariuszy w <c4/>, niezależne od systemu: każda konstelacja to powłoki Walkera, zestawy elementów lub preset GNSS, każdy sygnał to nośna, szybkość chipów i obwiednia stosunku mocy nośnej do gęstości szumu (C/N0), każdy bilans błędów to jawne jedno sigma, a nazwane systemy na niskiej orbicie okołoziemskiej (LEO) są opcjonalnymi presetami, po jednym pliku ze źródłami oznaczonymi jako publiczne, z warsztatów lub wyprowadzone (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), sygnały okazji Starlink, CentiSpace, reprezentatywny system w paśmie C, model efemeryd ATOMIC z zerowym zegarem oraz jeden preset ESA Celeste z demonstracji na orbicie, którego parametry wyprowadzone z warsztatów znajdują się w <c5/>, aby można je było wstrzymać).

seg-f28f7a441263 = <c1/> ma cztery tryby: pozycjonowanie dopplerowskie (wsadowa metoda najmniejszych kwadratów na prędkości zmiany odległości ze stanami dryfu zegara i prędkości, tryb sygnałów okazji wyłącznie dopplerowski, dokładność wzdłuż toru i poprzeczna do toru w pojedynczym przelocie oraz obwiednia Dopplera, tempa Dopplera i szarpnięcia); łączną ważoną metodę najmniejszych kwadratów GNSS + LEO z jednym zegarem na system (przesunięcie międzysystemowe) lub znanym przesunięciem, z sigmami poszczególnych pomiarów jako wejściami i DOP względem liczby satelitów LEO; pokrycie polarne i arktyczne względem szerokości geograficznej; oraz transfer czasu LEO do uniwersalnego czasu koordynowanego (UTC) względem C/N0 i oscylatora odbiornika z wyrażeniem czasu systemowego do UTC z IS-GPS-200.

seg-57afa384aabd = <c1/>: filtr Kalmana rozszerzony dla precyzyjnego pozycjonowania punktowego (PPP) z liczbami zmiennoprzecinkowymi na kodzie i fazie wolnych od jonosfery, tylko GNSS i z wsparciem LEO, z czasem zbieżności i testem spójności NEES (znormalizowany kwadrat błędu estymacji) metodą Monte Carlo. Dołączony scenariusz daje { "7.4" } min z czterema systemami MEO oraz { "4.8" }, { "3.2" }, { "2.7" } i { "2.3" } min przy { "60" }, { "96" }, { "192" } i { "288" } satelitach LEO, obok { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } i { "1.3" } min Li i in. (J. Geod. { "93" }:{ "749" }, { "2019" }) jako porównanie trendu typu MODELLED.

seg-3fa0556b3737 = <c1/>: pozycjonowanie w sieci nienaziemnej (NTN) 5G w mobilnym pasmie satelitarnym S 3GPP n256 z granicy Craméra–Rao dla czasu przybycia i Dopplera.

seg-a0cc2699e276 = Scenariusze: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (dołączone) i <c8/> (tylko w repozytorium, wstrzymany razem z presetem Celeste IOD).

seg-c0b6b98eeac3 = Osiem wierszy macierzy: obwiednia Dopplera LEO VALIDATED względem opublikowanych wartości dla Iridium (±{ "36" } kHz: { "35.9" } kHz, w granicach { "5" }%) i Xona Pulsar X1 (od { "32" } do { "34" } kHz: { "33.6" } kHz z powłoki { "97" } deg, bez poszerzenia) (<c1/>); pozycjonowanie dopplerowskie, łączne pozycjonowanie z pseudoodległości, zbieżność PPP, granice NTN, czas LEO, pokrycie polarne i presety MODELLED. Trzy rodzaje i osiem plików scenariuszy. Dokumentacja: <c2/>.

seg-173793480abc = <b>LEO-PNT od początku do końca: rodzaj <c1/> i etapy LEO połączone razem.</b> Jeden system pozycjonowania, nawigacji i czasu (PNT) na niskiej orbicie okołoziemskiej (LEO) prześledzony od projektu sygnału do pozycji użytkownika, każdy etap to własny rodzaj silnika na własnej tabeli scenariusza, z wartościami przekazywanymi w kodzie (<a1><c2/></a1>):

seg-41a4a2183ba3 = Pasma <c1/> mogą wskazywać projekt <c2/> (<c3/>): pasmo przejmuje środek projektu, szerokość pasma nadawania i szybkość chipów śledzonej składowej, dzieli swoje EIRP (równoważną moc promieniowaną izotropowo) między składowe projektu i raportuje w każdej epoce C/N0 śledzonej składowej (stosunek mocy nośnej do gęstości szumu) oraz jitter śledzenia kodu ograniczony pasmem (błąd wyznaczania odległości; szum pary <c4/> także go używa). Pasmo bez projektu daje takie samo wyjście jak wcześniej.

seg-a076a43a9d44 = <c1/> uruchamia sygnał -> przelot -> wiadomość nawigacyjna -> łączne rozwiązanie <c2/> -> opcjonalnie <c3/>. Każdy system LEO etapu pozycjonowania, który ich nie ustawia, przyjmuje linię C/N0 w sin(elewacji) dopasowaną do przelotu, błąd odległości sygnału w przestrzeni wiadomości (SISRE: jej błąd reprezentacji na orbicie satelity przelotu, ze wskazanym członem wyznaczania orbity <c4/> w pierwiastku sumy kwadratów) oraz nośną i szybkość chipów projektu; przypadki precyzyjnego pozycjonowania punktowego (PPP) przyjmują SISRE. Każde przekazanie jest wymienione ze swoją wartością i jednostką, a <c5/> sprawdza, że każde jest równe wyjściu poprzedniego etapu i że zmiany poprzedniego etapu przesuwają wartości następnego. <c6/> to nowy punkt wejścia wiadomości.

seg-8c256ed478e9 = Scenariusze: <c1/> (ogólna konstelacja { "1080" } km i reprezentatywny sygnał <c2/>), <c3/> (publiczny sygnał X5), oba dołączone, oraz opcjonalny, tylko w repozytorium <c4/>.

seg-879259c7ff86 = Presety Celeste IOD (demonstracja na orbicie) z obszarów przelotu, wiadomości i połączonego pozycjonowania znajdują się teraz w jednym pliku, <c1/>, który <c2/> kompiluje tylko wtedy, gdy istnieje (flaga konfiguracji <c3/>). Jego pięć scenariuszy (<c4/>) jest tylko w repozytorium, więc usunięcie tego pliku i tych scenariuszy wstrzymuje każdą liczbę przedstawioną na warsztatach ESA NAVISP LEO-PNT, { "2026" }, bez edycji źródła; <c5/> sprawdza, które pliki mogą wymieniać preset lub zawierać liczby jego planu pasm.

seg-110b1f7c7c63 = Każdy rodzaj LEO w tabeli przyporządkowania raportu zaawansowanego, z wierszami zależnymi od ścieżki wymienianymi tylko wtedy, gdy przebieg poszedł tą ścieżką (natężenie deszczu, budynek, analiza lub tryb, które się wykonały). Okna Dopplera <c1/> zyskują <c2/>, a przypadki <c3/> zyskują <c4/>, więc oba się animują; <c5/> i <c6/> eksportują efemerydy CZML, KML, GeoJSON i STK, a pozostałe rodzaje LEO podają, dlaczego format nie ma zastosowania.

seg-1419edea5329 = Nawigacja z niskiej orbity okołoziemskiej: odporność, obszary zainteresowania i scenariusze użytkowników końcowych

seg-d084d86044b4 = <b>Odporność LEO-PNT, jeden scenariusz na obszar zainteresowania eksperymentu i jeden na branżę użytkowników końcowych oraz <c1/> jako przegląd każdego rodzaju i scenariusza LEO.</b> Każdy scenariusz działa bez żadnych danych Celeste i jest dołączony.

seg-07e91f076ab2 = <c1/> zyskuje sekcję <c2/>: spoofer podrabia, spójnie w odległości i prędkości zmiany odległości, sygnały deklarowanej pozycji, która po początku ataku skacze lub jest odsuwana od prawdziwej (dla każdego pasma LEO oraz sygnału MEO GNSS), z jonosferą lub bez niej. Dwa monitory działają przy podanym prawdopodobieństwie fałszywego alarmu: spójność Dopplera i geometrii przelotu (zmierzone prędkości zmiany odległości względem przewidywanych z orbit i niezależnej pozycji oraz prędkości z wcześniejszej wiedzy; uogólniony chi-kwadrat metodą najmniejszych kwadratów w oknie, dla kanałów GNSS, LEO i wszystkich, z szumem pętli synchronizacji częstotliwości wyznaczonym z C/N0) oraz spójność międzypasmowa (skok skorygowanej modelem kombinacji wolnej od geometrii każdej pary pasm LEO). Wynik podaje statystyki na epokę (więc się animuje), każdą parę oraz moment, w którym każdy monitor wykrywa. Bloki konstrukcyjne w <c3/>. Brak sekcji, wyjście bez zmian.

seg-6a7852f1f053 = Każda para pasm <c1/> raportuje także ukośną całkowitą zawartość elektronów (TEC), którą jej kombinacja wolna od geometrii odzyskuje w szczycie przelotu, oraz sigmę szumu kodu tego oszacowania (sondowanie jonosfery). Dodaje to dwa pola do każdego wielopasmowego wyniku <c2/>; żadna istniejąca liczba się nie zmienia.

seg-bdf333f4c978 = Tryb czasu <c1/> przyjmuje <c2/>: każdy wiersz raportuje wtedy swój błąd czasu i przewidywaną sigmę w każdej epoce, z tymi samymi losowaniami, więc statystyki wierszy nie zmieniają się, a przebieg się animuje i łączy w kampanię.

seg-eb4461740dc5 = Kampania eksportuje teraz każdy scenariusz członka, który ma geometrię (przebiegi faz, scenariusze bazowe przeglądu i Monte Carlo, członkowie złożeni z powiązanymi wspólnymi wartościami), jako osobny zestaw plików, z etykietą członka w nazwie pliku; wcześniej kampania nie eksportowała niczego. Tabela interoperacyjności w <c1/> zmienia się odpowiednio.

seg-c0b1f4d9fed0 = Klucz przeglądu kampanii może indeksować tablicę tabel według pozycji (<c1/>).

seg-4c995017dd9c = Scenariusze odporności: <c1/> (zaporowy jammer w paśmie L5 o szerokości { "50" } MHz przemiatany w mocy: każdy sygnał pasma L zanika, sygnały LEO w pasmach UHF, S i C zachowują swoje C/N0), <c2/> (margines J/S z mocy odbieranej: GPS L5, Galileo E5a i Xona X5 tracone przy -105, -100 i -95 dBW, ogólny sygnał LEO -135 dBW nadal śledzony przy -90 dBW), <c3/> (skok o { "30" } m niewykryty przez test Dopplera wyłącznie GNSS i wykryty przez test na wszystkich kanałach { "105" } s po początku), <c4/> (cztery spoofery wobec obu monitorów) i <c5/> (GNSS zagłuszony, warstwa LEO w pasmach S i C śledzona, autonomiczne monitorowanie integralności w odbiorniku na samej warstwie LEO alarmuje w { "2" } z { "30" } epok).

seg-bae66dac04cc = Scenariusze obszarów zainteresowania: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (odporność w L, S i C to <c8/>).

seg-c7947d9cc592 = Kampanie branżowe, każda animowana i eksportująca swoje przeloty LEO: <c1/>, <c2/> (dołączone scenariusze morskie i kolejowe plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Wyniki w jednym wierszu w <c7/>.

seg-222ad0b777f8 = Trzy wiersze macierzy MODELLED: monitor spoofingu oparty na Dopplerze i geometrii przelotu, monitor spoofingu międzypasmowy oraz sondowanie jonosfery. <c1/> sprawdza monitory (milczące przed początkiem, statystyka Dopplera kwadratowa względem skoku, skok jonosferyczny spoofera naziemnego i brak takiego skoku u spoofera uwzględniającego jonosferę), tożsamość sondowania, ślad czasu względem statystyk wierszy oraz to, że eksport kampanii jest równy eksportowi każdego z jej członków.

seg-f650b42bf210 = Strona <c1/> przenosi się do <c2/>; <c3/> jest przeglądem.

seg-00a4ba834f37 = <b>Scenariusze morskie, drogowe i kolejowe.</b> Pięć dołączonych przykładów na istniejących rodzajach, tak aby statki, pojazdy drogowe i pociągi miały każde swój przykład roboczy. Każda wartość jest MODELLED; żadna nie jest sprawdzona względem danych pomiarowych.

seg-682414bbe0c6 = <c1/> (<c2/>): szerokopasmowy jammer { "50" } W na maszcie { "30" } m, { "30" } km po otwartej wodzie od statku. Średni stosunek jammera do sygnału (J/S) około { "48" } dB, a dostępność spada z { "1.00" } do { "0.00" }.

seg-4666dcd72c24 = <c1/> (<c2/>): inercjalny system nawigacji (INS) klasy nawigacyjnej przy { "12" } węzłach, z utraconym GNSS i bez wspomagania. Przekracza { "10" } m po { "281" } s i { "100" } m po { "833" } s, czyli wartości dla podejścia do portu i wód oceanicznych z Rezolucji A.1046({ "27" }) Międzynarodowej Organizacji Morskiej (IMO), użyte tu jako budżety.

seg-7407bb97aedd = <c1/> (<c2/>): spoofer +{ "2" } dB, niewyrównany z nośną, spychający cztery satelity, aby zepchnąć statek o { "500" } m. Połączony monitor wykrywa go (wynik { "0.70" } wobec progu { "0.50" }) przez autonomiczne monitorowanie integralności w odbiorniku (RAIM) i monitorowanie jakości sygnału (SQM); samo monitorowanie mocy go nie wykrywa.

seg-1edc0541930b = <c1/> (<c2/>): samochód przejeżdżający przez { "15" } s tunel pod drogą i { "60" } s przerwę wywołaną przez jammer przy drodze, względem budżetu { "1.5" } m na pół pasa. Błąd średniokwadratowy (RMS) połączonego rozwiązania w czasie przerwy wynosi { "1.9" } m dla jednostki mikroelektromechanicznej (MEMS) klasy motoryzacyjnej i { "0.7" } m dla porównawczej jednostki klasy taktycznej; przy swobodnej pracy jednostka MEMS dryfuje do { "850.8" } m.

seg-f9830a49659f = <c1/> (<c2/>): INS klasy taktycznej w pociągu jadącym { "160" } km/h w tunelu. Przekracza { "2" } m (rozróżnienie torów) po { "35.8" } s, po około { "1.6" } km, a { "20" } m po { "107.3" } s. To jest wyłącznie INS: silnik nie ma modelu drogomierza, więc jest to ograniczenie pesymistyczne. Liczba plików scenariuszy w README zmienia się z { "77" } na { "82" }. Wszystkie pięć jest dołączonych do <c3/> i wymienionych w przeglądarkowym playground.

seg-77c8c53126fd = Serwer Model Context Protocol

seg-2deb4b35b41a = Serwer Model Context Protocol (MCP) sięga każdego rodzaju i każdego widoku przebiegu: siedem nowych narzędzi, w sumie czternaście.

seg-7f4035dfd9db = <c1/> już rozdzielał każdy rodzaj; agentowi brakowało drogi do poprawnego scenariusza danego rodzaju i trzech wyników, które wiersz poleceń zapisuje obok wyniku. Nowe narzędzia:

seg-d9df5ab8817a = <c1/> i <c2/> udostępniają dołączone scenariusze referencyjne (tabela <c3/>), każdy z jego rodzajem i pierwszym zdaniem własnego nagłówka, bajt w bajt jak plik w <c4/>. Scenariusz, który jest w repozytorium, ale nie jest dołączony, zostaje odrzucony z podaniem powodu. Każdy rodzaj poza <c5/> (którego wycinek danych jest dostarczany tylko z repozytorium) ma co najmniej jeden przykład.

seg-cb24ad7147ef = <c1/> zwraca raport z przebiegu jako JSON (JavaScript Object Notation) albo jako stronę HTML (HyperText Markup Language) do wydruku (<c2/>).

seg-9264b2f20e15 = <c1/> zwraca szereg czasowy przebiegu jako animowany rysunek SVG (Scalable Vector Graphics), odtwarzacz HTML lub ponumerowane klatki, po podsumowaniu JSON tego, co narysowano (<c2/>). Odpowiedź zawiera najwyżej { "120" } klatek; wiersz poleceń zapisuje dowolną długość.

seg-959f23871238 = <c1/>, <c2/> i <c3/> udostępniają eksporty interoperacyjności i import trasy GeoJSON (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, efemerydy STK (Systems Tool Kit) <c5/> i SigMF (Signal Metadata Format), z indeksem JSON plików (sufiks, rozmiar i SHA-256, 256-bitowy skrót Secure Hash Algorithm) oraz binarnym plikiem próbek SigMF jako base64.

seg-9ec3f9639b8c = Biblioteka zyskuje domyślnie wyłączoną funkcję <c1/>, która udostępnia tabelę scenariuszy referencyjnych jako <c2/>; włącza ją tylko serwer MCP, więc koło Pythona i moduł WebAssembly nadal nie niosą tekstu scenariuszy. Zestawy badań (<c3/>) pozostają tylko w wierszu poleceń, ponieważ zestaw nazywa pliki na dysku, a serwer żadnych nie czyta. Testy przejścia w obie strony uruchamiają każde nowe narzędzie na dołączonych scenariuszach i sprawdzają liczby silnika: widmo, Układ Słoneczny, konstelacje wokół Księżyca i Europy, przegląd kampanii oraz rodzaje: sygnał na niskiej orbicie okołoziemskiej (LEO), przelot, wiadomość nawigacyjna, połączone pozycjonowanie, precyzyjne pozycjonowanie punktowe, sieć nienaziemna i od początku do końca. Każda powierzchnia, która podaje liczbę narzędzi MCP lub je wymienia, mówi teraz czternaście, z wyjątkiem strony playground w <c4/>, która jest zastępowana stroną.

seg-c11823028688 = kshana.dev, Kshana Studio i README

seg-fb584cf84218 = <b>Przeprojektowane kshana.dev.</b> Pojedyncza strona playground została zastąpiona stroną wielostronicową: Home, Missions, Capabilities, Evidence, Developers, Editions i Docs, z Kshana Studio w odległości jednego kliknięcia. Każdy wykres, mapa i liczba na niej to zapisany przebieg silnika tego wydania, ze scenariuszem i odnośnikiem, który otwiera ten sam przebieg ponownie w Studio; kompilacja strony odrzuca zapis wykonany przez inny commit silnika. Strony dokumentacji są generowane z <c1/> repozytorium, a opcje instalacji z jego kanałów. Czcionki i biblioteki skryptów są serwowane z samego kshana.dev, więc żadna strona nie żąda niczego od hosta zewnętrznego. Stare adresy (<c2/>, <c3/>, odnośniki udostępniania <c4/>, odnośniki osadzania <c5/> i reszta) przekierowują na nowe miejsce, a nieznany adres dostaje stronę { "404" }.

seg-9fa1c542332b = <b>Kshana Studio, panel dla każdej możliwości.</b> Studio otwiera się na ekranie startowym z kafelkami domen i dobrymi pierwszymi przebiegami, a następnie prowadzi przebieg przez pięć ponumerowanych kroków: wybór scenariusza, ustawienie jego parametrów, uruchomienie silnika lokalnie w przeglądarce, odczytanie wyników (najpierw kluczowe wartości, każda z chipem PASS lub FAIL tam, gdzie przebieg podaje próg, potem panele) oraz udostępnienie lub eksport. Jedno pole wyszukiwania znajduje scenariusze, domeny i pola w nich oraz przeskakuje do kontrolki; przebiegi można przypinać i porównywać; ścieżka okruszków mówi, gdzie się jest; na telefonie kroki stają się paskiem kroków. Każdy rodzaj scenariusza ma swój widok, w tym wodospad widma, Układ Słoneczny, pokrycie konstelacji, kampanie, animację, raport z przebiegu, eksporty interoperacyjności i łańcuch niskiej orbity okołoziemskiej. Odnośnik bezpośredni (<c1/>) otwiera ten sam przebieg na wskazanym panelu.

seg-dcf2788bb430 = <b>Badania i cytowanie.</b> Strona Evidence wymienia pięć artykułów Kshana na arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } i { "2607.06212" }), każdy z podsumowaniem, rysunkiem obliczonym przez ten silnik, poleceniem, które go odtwarza, odnośnikiem do Studio i BibTeX, obok informacji, jak cytować oprogramowanie. README zyskuje tę samą sekcję Research.

seg-fab395bab130 = Publiczna strona dla Kshana Pro.

seg-167a59e94101 = <c1/> i strona Editions witryny mówią, co dodaje własnościowa nakładka Pro do tego samego silnika (optymalizator projektu, niepewność i czułość, dossier misji, obserwacja kampanii, współistnienie widma, usługa zadań na miejscu, śledzenie wymagań), co każda z tych funkcji wytwarza i czego nie robi. Każda wartość Pro pokazana na stronie jest podana na tej publicznej stronie. Pro nie dodaje żadnego modelu fizycznego, a otwarty silnik pozostaje cały i bezpłatny.

seg-f57f0a610943 = <b>Przepisane README.</b> Krótkie sekcje, jeden obraz na sekcję, znak Kshana, dwa rzędy plakietek, generowane obrazy architektury, przepływu scenariuszy, łańcucha niskiej orbity okołoziemskiej i weryfikacji (<c1/>, który zawodzi przy nieaktualnym obrazie) oraz zrzuty ekranu Studio wykonane z działającego Studio przez <c2/>. README dla crates.io, PyPI, npm i serwera MCP mają ten sam projekt. Długie materiały referencyjne są zwinięte lub przeniesione do <c3/>.

seg-e06522ca762e = <b><c1/> jest teraz zaawansowanym raportem z przebiegu</b> opisanym w sekcji Added, a wiersz <c2/> w CLI nazywa także <c3/>. Jednostronicowa karta wyników, którą zastąpił, pozostaje bez zmian jako <c4/>, które wiązania Pythona i WebAssembly nadal zwracają. <c5/> udostępnia zdanie, które <c6/> drukuje dla każdego wiersza MODELLED; ten dokument jest bez zmian.

seg-77a6f35c5c9a = <b>README mówi, na czym opiera się Kshana Pro.</b> Sekcja Editions i wiersz Kshana Pro w „Support & professional services” podają teraz, co robią narzędzia Pro do inżynierii systemów opartej na modelach (MBSE) i do programów oraz które opublikowane wyniki otwartego silnika odczytują (<c1/> i <c2/> każdego przebiegu, plik scenariusza, schemat jednostek pól i etykiety macierzy weryfikacji), a także na czym w otwartym silniku opierają się cyfrowe bliźniaki zegarów, studia kompromisów i pakiety dowodowe. Tylko sformułowania: żaden wynik silnika ani opublikowana liczba się nie zmienia.

seg-1a19675ffa3b = <b>Zgodność wsteczna.</b> Publiczny enum <c1/> zyskuje wariant <c2/>, co jest zmianą łamiącą dla wywołującego, który dopasowuje go wyczerpująco. Kolumny <c4/> i <c5/> rodzaju <c3/> się zmieniają (zob. „Revisions to published numbers”). Przebieg nadal odtwarza wersja silnika, która go wykonała.

seg-e7c5f77a6602 = <b><c1/> na serwerze MCP wymieniało cztery rodzaje jako jedyne z tabelą CSV (wartości rozdzielone przecinkami); sześć ją publikuje.</b> Narzędzie zawsze zwracało tabelę dla <c2/> i dla <c3/> (jego analiza <c4/> na modelu wiadomości <c5/> lub <c6/>), ale jego opis, komunikat odmowy i dokumenty wymieniające rodzaje pomijały oba, więc agentowi mówiono, żeby o nie nie prosił. Teraz są wymienione, a test przejścia w obie strony pobiera obie tabele.

seg-4094f58a5f4b = Ramka wiadomości nawigacyjnej na niskiej orbicie okołoziemskiej (LEO) nie miała tych samych bajtów na każdej platformie ani w każdej kompilacji jednej platformy.

seg-5191262de022 = <c1/> kodowało ramkę z cykliczną kontrolą nadmiarową <c2/> w kompilacji wydaniowej na aarch64 macOS, <c3/> w kompilacji debug tego samego źródła na tej samej maszynie i <c4/> w kompilacji WebAssembly (WASM); <c5/> dawało natywnie <c6/>, a w przeglądarce <c7/>. Trzy przyczyny, każda wyśledzona do pierwszej rozbieżnej wartości:

seg-f6501c3cd89d = <em>Między platformami.</em> Orbita prawdziwa była identyczna bit w bit na obu; punkt startowy dopasowania nie. <c1/> bierze nachylenie oskulacyjne z <c2/>, a argument perygeum z <c3/>, a obie biblioteki matematyczne zaokrąglają je inaczej na ostatnim miejscu (na { "20 000" } argumentach różnią się dla { "781" } sinusów, { "858" } cosinusów, { "1 931" } funkcji wykładniczych i { "1 899" } arcusów tangensów dwuargumentowych).

seg-cd6f05096b8b = <em>Między profilami kompilacji.</em> Zoptymalizowana kompilacja na macOS łączy sinus i cosinus jednego argumentu w jedno wywołanie połączonej procedury systemowej, a jej sinus nie jest sinusem samotnego <c1/> dla { "379" } z { "200 000" } argumentów; niezoptymalizowana kompilacja wykonuje dwa wywołania. Rodzaj bierze sinus i cosinus razem w trzynastu miejscach.

seg-91b0700dcb30 = <em>W zegarze.</em> Próbnik normalny z <c1/> wywołuje systemowe <c2/> i <c3/> w swoich dwóch rzadkich gałęziach: z czterech milionów losowań z ziarnem trzy różniły się na ostatnim bicie między kompilacją natywną a WASM.

seg-0a4724333429 = Dopasowanie Levenberga–Marquardta, które na tym łuku zatrzymuje się na swoim limicie 80 iteracji, a nie w minimum, przenosi jedną jednostkę na ostatnim miejscu do różnych skwantowanych pól. Rodzaj oblicza teraz każdą funkcję przestępną przez nowy <c1/>, który wywołuje czysto rustowy crate <c2/> (już w drzewie zależności, teraz nazwany w <c3/>), kompilowany z jednego źródła dla każdego celu, a nie wywołanie biblioteki, które optymalizator przepisuje: <c4/> i kod scenariusza. Potęgi całkowite na tej ścieżce są rozpisane jako podnoszenie do kwadratu i mnożenie, ponieważ <c5/> ma nieokreśloną precyzję, a zegar prawdziwy czerpie swoje odchylenia normalne z <c6/> (metoda biegunowa Marsaglii na surowym wyjściu generatora). Wspólne procedury, przez które całkowana jest orbita prawdziwa, są napisane raz, generycznie względem biblioteki matematycznej, z wewnętrznym dla crate'a punktem wejścia <c7/> obok istniejącego: przyspieszenie harmonik sferycznych, przyspieszenia zonalne i oporu, tempa wiekowe J2 i opóźnienie Klobuchara. Istniejące punkty wejścia pozostają bez zmian co do ostatniego bitu, więc liczba żadnego innego rodzaju się nie zmienia. <c8/> przypina całą 171-bajtową ramkę i jedną wartość kontrolną na model efemeryd, w zwykłym (niezoptymalizowanym) profilu testowym, na każdej platformie i bez bramki bazowego hosta; <c9/> czyta źródła rodzaju z dysku i zawodzi przy wywołaniu wbudowanej funkcji przestępnej, przy próbniku <c10/> lub przy wywołaniu modułu, który nie został przejrzany. Po zmianie kompilacja debug, kompilacja wydaniowa i kompilacja WASM dają dokumenty wyników identyczne bajt w bajt dla wszystkich pięciu scenariuszy <c11/>. <b>To zmienia liczby, zapisane tu jako rewizja.</b> Rodzaj <c12/> jest nowy w tym wydaniu, więc nic opublikowanego we wcześniejszym wydaniu się nie zmienia, ale zmienia się każda wartość <c13/>, natywnie i w kompilacji WASM, a wraz z nią etap <c14/> w <c15/>: wartości orbity, ponieważ dopasowanie startuje teraz z przenośnych elementów, wartości zegara, ponieważ zegar prawdziwy jest inną realizacją tego samego procesu. <c16/> jest wygenerowany ponownie z nowych wyników; jego opublikowana wartość kontrolna dla scenariusza kodowania i dekodowania wynosiła <c17/>, a wynosi <c18/> (pozycja w granicach { "1.126" } mm od dokładnej wiadomości, gdzie było { "0.665" } mm, zegar w granicach { "0.185" } mm, gdzie było { "0.451" } mm). Wielkość zmian w wartościach poniżej milimetra to czułość dopasowania, a nie błąd żadnego z dwóch zestawów: dopasowanie jest bez zmian i nadal zatrzymuje się na limicie iteracji.

seg-c30f4cef4797 = Próbkowanie z ziarnem losowało inne indeksy na celu 32-bitowym.

seg-2bf668e23ec1 = <c1/> na <c2/> bierze { "64" } bity z generatora na hoście 64-bitowym i { "32" } bity na 32-bitowym, więc to samo ziarno dawało inne indeksy i zostawiało strumień w innym miejscu w kompilacji WASM. Tak losowały trzy miejsca: bootstrapy percentylowe w <c3/> (<c4/>, <c5/>), tasowanie przed każdym przebiegiem treningowym w <c6/> oraz test permutacyjny w <c7/>. Teraz losują przez <c8/>, które zawsze próbkuje jako <c9/>: dokładnie to, co robił host 64-bitowy, więc żadna liczba natywna się nie zmienia. <b>To zmienia opublikowane liczby pakietu WASM, zapisane tu jako rewizja:</b> przedział bootstrapu <c10/> dla pola pod krzywą (<c11/>, <c12/>) wynosił <c13/> w przeglądarce, a teraz jest to natywne <c14/>.

seg-80f783da1d4f = <b>Nazwy plików efemeryd STK z identyfikatorów ruchomych obiektów.</b> Identyfikator ruchomego obiektu zawierający <c1/> lub spację (powłoka konstelacji i satelita, <c2/>) powodował panikę CLI przy <c3/>; teraz każdy identyfikator przechodzi przez bezpieczną część nazwy pliku (litery, cyfry, <c4/>, <c5/>).

seg-a0dc5729d5e9 = <b>Znak nutacji TEME→GCRS</b>, opisany powyżej w „Revisions to published numbers”, ponieważ zmienia opublikowany wynik.

seg-5ecbf0787f39 = <b>Rodzaj scenariusza <c1/></b> (<c2/>): sekundy, zanim wolno biegnący zegar opuści strażnika slotu trasowania lub zadań indeksowanego czasem, każdy składnik w tej chwili z nazwanym dominującym, czas pozostały od ostatniego rozwiązania pozycji i największy odstęp między rozwiązaniami, który utrzymuje zegar w granicach, po odjęciu opóźnienia rozwiązania. Zegar pochodzi z domyślnej klasy, presetu z karty katalogowej telecom-timing, wbudowanej karty katalogowej (maksima odchylenia Allana, starzenie, współczynnik temperaturowy) lub zmierzonego zapisu fazy. Naruszenie poza najdłuższym czasem uśredniania, który obsługuje źródło, jest oznaczane jako ekstrapolowane. Dołączony przykład: <c3/>. Zob. <c4/>.

seg-40dd4c16b760 = <b>Zmierzony próg szumu czerwonego.</b> Nakładające się odchylenie Allana zapisu fazy jest dopasowywane ważoną metodą najmniejszych kwadratów w bazie szumu białego fazy i modulacji częstotliwości według IEEE Std { "1139" } (<c1/>), każdy punkt ważony swoimi równoważnymi stopniami swobody, więc odpowiedź dla holdover może opierać się na własnym progu zegara zamiast na założeniu klasy. Dopasowanie bez ważenia nałożyło pozorny próg szumu migotania na testowy zapis szumu białego i skróciło naruszenie po { "2 000" } s o { "30" } %.

seg-22c09748488b = <b>Walidacja na zbiorze zapieczętowanym dla inwersji holdover na prawdziwym zegarze</b> (<c1/>): dopasowane na pierwszej jednej trzeciej zapisu cezu 5071A względem masera wodorowego, przewidziane naruszenia jednego sigma przy sześciu progach od { "0.5" } do { "2.5" } ns wypadają w granicach od { "0.84" } do { "1.03" } naruszeń zmierzonych na pozostałych dwóch trzecich, wobec progu { "1.5" } ustalonego przed pierwszym uruchomieniem testu. Kontrola (jednosekundowe odchylenie Allana odczytane jako szum biały) chybia około { "1 000" } razy i nie spełnia progu. Nowy wiersz rejestru VALIDATED; przepływ pracy <c2/> teraz go uruchamia.

seg-cd73dc87a22f = <b>Ta sama prognoza na prawdziwym oscylatorze kwarcowym</b> (<c1/>, <c2/>): na zmierzonym oscylatorze kwarcowym z termostatem prognoza na zbiorze zapieczętowanym jest zachowawcza, na poziomie od { "0.59" } do { "0.70" } zmierzonego naruszenia i nigdy później, i w większości poza progiem { "1.5" }, ponieważ próg szumu tego oscylatora zmniejszył się o połowę w trakcie 5.5-godzinnego zapisu; dopasowana w próbce mieści się w granicach od { "0.98" } do { "1.17" }. Przypadek kwarcowy nie jest sprawdzony i pozostaje MODELLED. Przebieg ujawnił też brakujący człon: częstotliwość kwarcu wędruje, więc model niesie teraz niepewność częstotliwości znanej w chwili rozwiązania (<c3/>); bez niego prognoza była zbyt optymistyczna nawet { "2.5" }×.

seg-8519979d184c = <b>Ta sama prognoza na zegarach atomowych na orbicie</b> (<c1/>, <c2/>): { "14" } dni końcowych zegarów International GNSS Service dla satelitów GPS Block IIF, z protokołem spisanym przed pobraniem danych. Osiem z dziesięciu satelitów mieści się w progu { "1.5" }; G25 i G30 przewidują naruszenia nawet około dwa razy późniejsze niż zmierzone. Protokół wymaga, aby zaliczył każdy satelita, więc przypadek orbitalny nie jest sprawdzony i pozostaje MODELLED; wynik jest przypięty.

seg-0d666a725b77 = <b>Klasy zegarów: kwarc z kompensacją temperaturową (TCXO), kwarc z termostatem (OCXO) i rubidowy wzorzec częstotliwości atomowy (RAFS)</b> (<c1/>, <c2/>, <c3/>), części, które lata komercyjna magistrala małego satelity lub bramka naziemna, każda z jedną publiczną kartą katalogową (<c4/>). Dodano <c5/>, <c6/> i <c7/>. <c9/> z <c8/> przyjmuje trzy nowe identyfikatory. Dodanie wariantów do publicznego enum jest zmianą łamiącą dla wywołującego, który dopasowuje go wyczerpująco.

seg-24ae82b115f5 = <b>Poziom ochrony czasu dla odbiornika na orbicie</b> (<c1/>, opcjonalna sekcja <c3/> rodzaju <c2/>): jak długo spoofer naziemny może dosięgać satelity na niskiej orbicie okołoziemskiej w jednym przelocie, odchylenie, które spoofer przy podanym maksymalnym tempie narastania gromadzi, zanim satelita opuści jego zasięg lub zostanie wykonana niezależna kontrola, oraz czy każda kontrola z kontaktu naziemnego lub łącza międzysatelitarnego jest niezależna od tego spoofera. Sprowadza się dokładnie do <c4/> dla zegara bez szumu migotania, białego fazy lub błądzenia losowego. MODELLED.

seg-4032bc03fad5 = <b>Trzy uwagi</b>: <c1/> (w tym względem której metryki wędrówki należy akceptować slot: maksymalny bezwzględny błąd czasu, a nie maksymalny błąd interwału czasu ani odchylenie czasu, i dlaczego), <c2/> (podpisane polecenie zastosowane w oszukanym czasie nadal błędnie trasuje) oraz <c3/> (gdzie działa Kshana; nie oferuje się rdzenia lotniczego <c4/>).

seg-712035e19515 = Wydanie { "v0.27.3" } dotarło do crates.io (<c1/> i <c2/>) i PyPI, po czym zatrzymało się na npm, więc npm, obraz MCP na ghcr.io, rejestr MCP, JetBrains Marketplace i kshana.dev nigdy go nie otrzymały. { "0.27.4" } niesie ten sam silnik, z poniższą poprawką wydania, do każdego kanału.

seg-bab8d4d1bc54 = <b>Krok publikacji npm wskazuje tarball jawną ścieżką.</b> npm odczytuje samo <c1/> jako skrót GitHub <c2/>, więc zadanie npm dla { "v0.27.3" } próbowało sklonować <c3/> i zawiodło z „Permission denied (publickey)”. Sam tarball został zbudowany i poświadczony. Krok publikuje teraz <c4/>. Wszystko po npm w kolejności wydania (obraz MCP, wtyczka JetBrains, kontrola parzystości kanałów i strona) zostało pominięte, zgodnie z założeniem.

seg-f9a112755eb1 = <b>Katalogi jednostek telecom-timing i <c1/> są wyłączone z wykrywania kopii</b>, według tej samej polityki i testu uzasadnienia co inne katalogi. Bramka jakości SonarCloud zaczerwieniła się z powodu duplikacji w nowym kodzie ({ "4.0" }% wobec { "3" }%), a każdy zduplikowany blok był wierszem jednostek lub wpisem maski ITU-T.

seg-3c3dacae06d6 = <b><c1/>: jak długo nawigacja małego drona wytrzymuje po zagłuszeniu GNSS.</b> Uruchamia jednostkę inercjalną mikroelektromechaniczną (MEMS) klasy kontrolera lotu, Bosch BMI088, wobec jednostki klasy taktycznej. Sygnał GNSS (globalnego systemu nawigacji satelitarnej) jest nominalny przez { "100" } s, a potem odmówiony przez { "60" } s (<c2/> pokazuje, dlaczego robi to pobliski jammer). Błędy systematyczne BMI088 to reszty pozostające po kalibracji początkowej, wzięte ze współczynników temperaturowych w jego karcie katalogowej (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s na K dla żyroskopu i < { "0.2" } mg na K dla akcelerometru. W pliku oznaczono dwa założenia: { "10" } K nagrzania po kalibracji i dalsze nagrzewanie o { "1" } K na minutę w locie. Dryf w locie to błąd, którego filtr nie może się nauczyć, zanim zacznie się zagłuszanie, i to on kończy wybieg. Każda wartość jest obliczona z modelu; jej sprawdzenie wymaga zapisów lotów ze środowiska zagłuszanego. <c3/> ją drukuje.

seg-7154f69a2b8a = <b>Każdy czujnik <c1/> może ustawić własny prior filtru</b> (<c2/> lub <c3/>, z <c4/> i <c5/>). Wartość domyślna jest bez zmian, więc każdy istniejący scenariusz daje ten sam wynik. Pozostały błąd systematyczny żyroskopu jednostki klasy konsumenckiej leży około { "26" } sigma poza domyślną wartością klasy taktycznej, gdzie filtr nigdy by się go nie nauczył. Prior, który nie jest skończony i dodatni, jest odrzucany, a wynik powtarza prior, gdy jest ustawiony.

seg-2b54735b19aa = <b><c1/> daje użytkownikowi rejestru scenariusz do uruchomienia.</b> Użytkownik <c2/> ma plik wykonywalny i nie ma katalogu <c3/>, więc pierwsze polecenie z każdego szybkiego startu zawodziło. Interfejs wiersza poleceń (CLI) niesie teraz { "75" } scenariuszy referencyjnych, które działają samodzielnie, bajt w bajt, wkompilowanych z <c4/> (<c5/>; tabela żyje w binarce CLI, więc koło Pythona i moduł WebAssembly nie rosną). <c6/> je wymienia; <c7/> zapisuje jeden. Pozostałe dwa pliki są tylko w repozytorium: <c8/> czyta zarchiwizowane dane księżycowego pomiaru laserowego, które są dostarczane tylko z repozytorium, a <c9/> to manifest badania, który uruchamia trzy pliki siostrzane przez <c10/>. Zażądanie któregokolwiek podaje powód i kończy się kodem { "2" } zamiast drukować coś, co nie może działać samodzielnie. <c11/> trzyma tabelę zgodną z katalogiem w obu kierunkach, więc nowy plik scenariusza, który nie jest ani dołączony, ani nazwany jako tylko w repozytorium, zawodzi.

seg-43249b6a1f3c = <b>Każdy wskaźnik jakości w wyniku dla zegara, orbity, hybrydy lub fuzji mówi teraz, czy jest VALIDATED, czy MODELLED, w samym wyniku.</b> Dokument wyniku zyskuje blok <c1/>, zawsze jego ostatni klucz. Wymienia każdą raportowaną wartość (na przykład <c2/>) z jej poziomem — VALIDATED oznacza sprawdzone względem niezależnej wyroczni zewnętrznej, MODELLED oznacza model oparty na pierwszych zasadach, testowany wewnętrznie — i wiersz macierzy weryfikacji, z którego poziom jest odczytywany. Poziom pochodzi z <c3/> przez <c4/>, więc nie ma drugiej tabeli, która mogłaby się rozjechać. Wcześniej słowa „sprawdzone” i „obliczone z modelu” pojawiały się w wyniku holdover zegara zero razy, a czytelnik surowego JSON (JavaScript Object Notation) nie miał jak odróżnić tych dwóch. Wartości położenia <c5/> i <c6/> nie mają własnego wiersza macierzy, więc są wymienione pod <c7/> zamiast otrzymać poziom. Blok nie niesie liczb. Jest udowodnione, że jest addytywny, a nie założone: jego usunięcie przywraca dokument sprzed zmiany bajt w bajt, dla wszystkich pięciu rodzajów (test silnika), a oba zestawy wzorców (<c8/>, <c9/>) odcinają teraz dokładnie ten klucz, i tylko gdy jest ostatni, po czym haszują resztę względem swoich <b>niezmienionych</b> zamrożonych stałych. Lista w każdym zestawie przypina, które scenariusze muszą nieść blok, więc wyłączenie nie może się po cichu rozszerzyć.

seg-8faf1981d797 = <b>Rodzaj <c1/> odpowiada w jednostkach inżyniera czasu: błąd czasu, maksymalny błąd interwału czasu (MTIE) i odchylenie czasu (TDEV), każde z PASS lub FAIL i marginesem względem masek Sektora Normalizacji Telekomunikacji Międzynarodowego Związku Telekomunikacyjnego (ITU-T).</b> Maski są przepisane z wydań obowiązujących: G.8272 (07/2025) dla klas A i B podstawowego zegara czasu odniesienia (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) dla rozszerzonego PRTC w trybie zablokowanym i w holdover (w tym jego obwiednia błędu czasu, która rośnie od { "30" } ns do { "100" } ns w okresie holdover zależnym od tego, jak długo zegar był zablokowany), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) dla zegarów granicznych i podrzędnych czasu telekomunikacyjnego, klasy od A do D, oraz G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) dla limitów sieciowych w punkcie odniesienia C. Każdy wpis, który te Zalecenia pozostawiają „do dalszych badań”, jest nieobecny, a nie szacowany, a <c2/> wymienia każdą liczbę z jej tabelą lub klauzulą i każdą pominiętą pozycję. Raport podaje też czas przekroczenia każdego budżetu błędu czasu: domyślnie domyślny holdover ePRTC { "100" } ns, alokację holdover sieci { "400" } ns, limit punktu C { "1 100" } ns i wymaganie end-to-end klasy { "4" } wynoszące { "1.5" } mikrosekundy.

seg-9e5325e1b0ca = Wejściem jest albo syntetyczny holdover, albo własny szereg. Syntetyczny używa jednego z czterech presetów oscylatora (oscylator kwarcowy z termostatem, wzorzec rubidowy, wzorzec cezowy i zegar atomowy w skali chipa), każdy niesie wartości stabilności, starzenia i temperatury z nazwanej karty katalogowej Microchip. To, jak te wartości stają się szumem białym, migotania i błądzenia losowego częstotliwości, starzeniem i członem temperaturowym, jest podane w każdym raporcie i oznaczone MODELLED. Własny szereg to pary <c1/>, w treści (tak działa w przeglądarce) lub, w kompilacjach natywnych, z pliku z wartościami rozdzielonymi przecinkami. Tabela MTIE/TDEV, z limitem każdej wybranej maski obok, jest zapisywana jako artefakt CSV przebiegu.

seg-a23a96819dee = <c1/> to 24-godzinny holdover rubidowy ze starzeniem, migotaniem i dobowym cyklem temperatury: jego największy błąd czasu wynosi { "603.2" } ns, przekracza { "100" } ns po { "8 206" } s od utraty i przez cały dzień mieści się w { "1.5" } mikrosekundy, a nie spełnia obwiedni holdover rozszerzonego PRTC, jak powinien zegar, który nie jest klasy cezowej. <c2/> pokazuje wejście w treści. MTIE i TDEV raportowane przez rodzaj są sprawdzone względem pakietu allantools na zatwierdzonym { "2" } 048-próbkowym szeregu holdover, dokładnie dla MTIE i do { "1.1e-15" } dla TDEV, więc macierz zyskuje jeden wiersz VALIDATED i dwa MODELLED (transkrypcja masek i presety) i wynosi teraz <b>{ "171" } wierszy — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. Pokrycie jednostek pól rośnie z { "60" } z { "61" } rodzajów do { "61" } z { "62" } i z { "1,742" } do { "1,788" } opisanych pól. Rodzaj jest nowy i addytywny: żaden istniejący scenariusz, pin ani opublikowana wartość się nie zmienia.

seg-5bb1ad9a34ec = Playground uruchamia silnik w tle w Web Workerze, więc wolny scenariusz nie zamraża już strony.

seg-b1ab3546f131 = <c1/> hostuje silnik WebAssembly, a <c2/> przekazuje do niego każde wykonanie scenariusza — przebiegi, przeglądy parametrów oraz eksporty SP3 / OMM / OEM / CSV. Przebieg, który trwa dłużej niż { "150" } ms, pokazuje stan zajętości (Run wyłączone, „Running… N s”) i przycisk Cancel, który kończy i ponownie uruchamia workera; przeglądarka, która nie może uruchomić workera modułowego, wraca do dawnej ścieżki w głównym wątku. <c3/>, pominięty w katalogu, ponieważ zamrażał stronę, wrócił do niego, oznaczony jako wolny: trwa około { "13" } s w Chrome (cztery wywołania silnika po około { "3" } s każde), w czasie których strona pozostaje responsywna.

seg-146200dfac7e = <b>Każda raportowana wielkość <c1/> niesie teraz jednostkę, klasę pochodzenia i definicję — to przedostatni rodzaj na liście wyłączeń obejmującej cały crate.</b> Wszystkie { "41" } pól liczbowych dokumentu WYDANEGO są opisane, więc pokrycie jednostek pól rośnie z { "59" } z { "61" } rodzajów do { "60" } z { "61" } i z { "1,698" } do { "1,742" } opisanych pól, przy niezmienionym zaległym zbiorze bez definicji, wynoszącym { "239" }.

seg-61b1219ae0e3 = Blokował to pin, który zamraża wydany dokument i który nazywał <c1/> kluczem, jakiego dokument nigdy nie może zyskać. Dodanie go oznaczałoby usunięcie tej asercji i ponowne ustalenie wzorców trzech haszy w trzech plikach — kształt nieodróżnialny od zatuszowania regresji. Zamiast tego dwa piny, które mierzą ten dokument, <em>dowodzą</em> teraz, że dodatek jest addytywny: każdy odcina blok <c2/> z powrotem i haszuje ponownie względem stałej zamrożonej, zanim blok istniał, a <b>obie stałe są niezmienione</b>. Mutacja potwierdza, że gwarancja jest prawdziwa — przesuń wydaną wartość i ustal ponownie wzorzec hasza całego dokumentu tak, jak zrobiłaby to nieuważna poprawka, a odcięcie i ponowne haszowanie nadal zawodzi. Trzeci pin, w ogólnym zestawie wzorców rejestru, jest ustalony ponownie zgodnie z sześcioma rodzeństwa, które ustalono ponownie dokładnie z tego powodu, a jego niosący wartość literał <c3/> się nie zmienia.

seg-a73409e0b664 = <c1/> raportuje, względem której prawdy oceniono każdy wiersz orientacji Ziemi i jak często zadziałał zapas.

seg-6e0493a39f1a = <c1/> zyskują <c2/> i <c3/>. Próg <c4/> jest oceniany względem Bulletin B final i może używać tylko epok, które go publikują; każdy wiersz <c5/> jest oceniany względem <c6/>/<c7/>, które wracają do szybkiej wartości z Bulletin A. W dołączonym wyciągu { "2026" } to { "12" } z { "31" } próbek przy jednym dniu, wobec { "0" } przy progu — więc wiersz progu i wiersze predykcji obok niego opierają się na mierzalnie innej prawdzie, co raport teraz podaje, zamiast zostawiać do wywnioskowania z liczby próbek, która rośnie tam, gdzie zagnieżdżone horyzonty mówią, że nie może.

seg-7ba5be07fa8c = <c1/> emituje punkt odniesienia keplerowski dopasowany wielkością.

seg-f9dc8fae6452 = <c1/> ponownie uruchamia konstelację ilustracyjną przy własnej liczbie satelitów zestawu POBRANEGO, obecne tylko wtedy, gdy liczby się różnią. Liczba jest częścią geometrii tego projektu — RAAN i anomalia średnia są obie rozłożone jako <c2/> — więc bez niej pięciosatelitarny pobrany zestaw oceniano względem ośmiosatelitarnego ilustracyjnego i projekt mieszano z rozmiarem. Dla pięciosatelitarnego zestawu referencyjnego LANS { "8.68" } z 14.24-punktowej luki pokrycia okazuje się trzema brakującymi satelitami, a tylko { "5.56" } punktu projektem; dla czterech statków naprawdę na orbicie księżycowej, specjalnie zbudowany czterosatelitarny zestaw osiąga { "4.86" } % tam, gdzie one osiągają { "0" } %. Test przypina, że dopasowany wiersz jest odbudowaną konstelacją, a nie skonfigurowaną ze zmienioną etykietą, bo tak został najpierw napisany i to właśnie przebieg wtedy zgłaszał.

seg-2e7e4dbbb7f6 = <b>Dziewięć kart możliwości na stronie publicznej, obejmujących { "22" } wiersze macierzy weryfikacji, które zostały wydane bez karty na poziomie produktu.</b> Silnik urósł o rodzinę możliwości — kontrolę ARAIM względem opublikowanych wektorów referencyjnych Working Group C, rzeczywistą pobraną geometrię konstelacji księżycowej, księżycowy kontur odmowy ze zmierzonym pasmem C/N₀, krok od harmonogramu VLBI do kowariancji stacji, przekazanie optyczne i RF z wstrzykiwaniem błędów między modalnościami, predykcję orientacji Ziemi w czasie rzeczywistym względem zarchiwizowanego Bulletin A, współdzielenie apertury nawigacja–komunikacja, wybieg INS/TRN oraz pokrycie jednostek i pochodzenia — każdą z wierszem macierzy i dołączonym scenariuszem, a żadna nie była nazwana na kshana.dev. Pokrycie kart względem wierszy rośnie z { "72" } z { "168" } wierszy do { "94" }.

seg-3dc189224fe8 = <b>Osiem scenariuszy dodano do katalogu playground.</b> Przycisk Run na karcie możliwości pojawia się tylko wtedy, gdy <c1/> zawiera także dany plik; sześć kart wskazywało scenariusz, którego tam nie było, więc wyświetlały się bez możliwości uruchomienia. Jedna z nich, dotycząca rzeczywistego pomiaru odległości laserem, była w tym stanie od chwili wydania. Test <c2/> pilnuje teraz tej niezmienniczości w obu częściach: cel <c3/> karty musi być dołączony w <c4/> <em>i</em> oferowany przez katalog. Sprawdzone testami mutacyjnymi względem obu rodzajów błędu.

seg-2d69334516e9 = <b><c1/> zapisuje geometrię poszczególnych satelitów jako <c2/></b>, gdy skonfigurowano miejsce eksportu (G11). Jest to największa tablica, jaką publikuje crate: { "2304" } wierszy w wydanej łącznej tabeli komunikacji i nawigacji. Trafiała ona do odbiorców wyłącznie w JSON, czyli w kształcie, który w sąsiednim scenariuszu obciął krzywą o 57 punktach do { "23" } punktów pod kolumną deklarującą wszystkie z nich. Jeden wiersz na łącze, liczba wierszy w wierszu nagłówka, kolumny anteny tylko wtedy, gdy skonfigurowano antenę. Przebieg bez miejsca eksportu pozostaje bez zmian co do bajta i nie zapisuje żadnego pliku.

seg-7958d26072f7 = SBOM opisuje teraz to, co faktycznie jest dostarczane: z { "60" } komponentów zrobiło się { "66" }.

seg-219cd333b000 = <c1/> wymieniał każdy pakiet z rozwiązania zależności dla funkcji domyślnych, łącznie z zależnościami deweloperskimi. Przez to <c2/> i <c3/>, crate'y używane tylko w testach i niewkompilowane do żadnego artefaktu, trafiły do zestawienia komponentów, a pominięto łańcuch <c4/>, z którym linkuje się wheel z PyPI (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), czyli granicę obcych funkcji (FFI) tego wheela. Skrypt przechodzi teraz po grafie zależności od pakietu kshana, tylko po krawędziach zwykłych i budowania, po sumie zestawów funkcji domyślnych, <c13/> i <c14/> (pakiet npm zawiera ten sam SBOM), dla każdej platformy docelowej. Przypięty werdykt testu zgodności formatu CycloneDX został ponownie wyznaczony przez zatwierdzony generator: z { "60" } do { "66" } komponentów, z { "53" } do { "60" } złożonych wyrażeń licencyjnych, nadal przy zerze błędów schematu po zapisaniu ich w standardowej postaci <c15/>.

seg-23c98d31f749 = <b>Tabela odtwarzalności CSV jest dostępna w każdym punkcie wejścia, nie tylko w CLI i w wheelu Pythona.</b> Serwer MCP zyskuje siódme narzędzie, <c1/>, które uruchamia scenariusz i zwraca stabilną co do bajta tabelę, jaką CLI zapisuje jako <c2/>, albo błąd wskazujący rodzaje, które ją publikują (<c3/>, <c4/>, <c5/> oraz <c6/> tylko przy ustawionych <c7/> + <c8/>). Moduł WebAssembly zyskuje <c9/>, zwracające ten sam tekst albo <c10/>. Test pełnego obiegu MCP i testy wiązań Pythona porównują teraz zwracany plik CSV bajt po bajcie z <c11/> oraz sprawdzają, że <c12/> zwraca liczbę zapisanych bajtów, a dla rodzaju bez tabeli zwraca { "0" } bez utworzenia pliku. Każda powierzchnia, która podaje liczbę narzędzi MCP lub je wymienia, mówi teraz o siedmiu.

seg-86c3fed5e23a = <c1/> w module WebAssembly: jeden przebieg silnika dla wszystkich wyników.

seg-3f2677cd280b = <c1/>, <c2/>, <c3/> i <c4/> wykonują scenariusz każde od początku, więc playground płacił za cztery pełne przebiegi przy każdym kliknięciu: w przeglądarce około { "12" } s zamiast { "3" } s dla <c5/>. <c6/> zwraca <c7/> z jednego przebiegu i playground go teraz używa. Wynik jest identyczny bajt po bajcie z czterema osobnymi wywołaniami.

seg-fa05c9ee0c6a = <b>KOREKTA: sprzężenie biasu żyroskopu w filtrze GNSS/INS miało zły znak, a wartości dla przestoju w <c1/> się zmieniają.</b> Rozszerzony filtr Kalmana stanu błędu (EKF) przechowuje oba biasy inercyjne jako reszty (wartość prawdziwa minus bieżąca estymata, wprowadzane z powrotem przez dodawanie). Kolumna akcelerometru wpływała na błąd prędkości przez <c2/>, ale kolumna żyroskopu wpływała na błąd orientacji przez <c3/>. Resztkowy bias żyroskopu faktycznie obraca obliczoną orientację o <c4/>, więc każda estymata biasu żyroskopu przesuwała wynik w złą stronę. Pakiet pozostawał stabilny tylko dlatego, że jego domyślna wartość a priori biasu żyroskopu ({ "1e-4" } rad/s, 1-sigma) była dość ciasna, by utrzymać te stany w miejscu. Przy szerszej wartości a priori filtr rozbiegał się nawet wtedy, gdy prawdziwy bias żyroskopu wynosił zero: { "93" } m błędu fuzji w przestoju zamieniło się w { "4.3" } km. Opublikowane wartości dla <c5/> zmieniają się następująco:

seg-47e22e713df6 = przed (≤ { "0.27.2" })

seg-5215a0a41b89 = po

seg-f58aecc6864c = IMU na zimnych atomach, RMS błędu fuzji w przestoju

seg-c4fbd933ddb2 = { "96.1" } m

seg-002d765fca02 = { "1.9" } m

seg-d14616d4ea1b = IMU na zimnych atomach, dryf w specyfikacji ({ "50" } m)

seg-35f8f623ea28 = { "30" } s

seg-91645c14401b = { "60" } s (cały przestój)

seg-f297a2652cf8 = IMU taktyczny, RMS błędu fuzji w przestoju

seg-0ac27c6d4206 = { "62.5" } m

seg-eda895cc3b86 = { "3.1" } m

seg-e0ab83f1d8d7 = IMU taktyczny, dryf w specyfikacji ({ "50" } m)

seg-5c526991a521 = { "37" } s

seg-743060da5543 = Wartości dla pracy swobodnej ({ "130.7" } m i { "314.3" } m) się nie zmieniają; nigdy nie korzystały z filtra. Wcześniejszy wniosek z pakietu, że dryf z fuzją jest ograniczony dolną granicą orientacji z przekazania, a więc nie poprawia się przy lepszym czujniku, był artefaktem tego błędu i zostaje wycofany. Przy stałych, wolnych od szumu biasach filtr uczy się ich teraz, gdy GNSS działa, więc dryf z fuzją jest przypadkiem najlepszym. Zewnętrzny wzorzec filterpy (<c1/>) sprawdza tylko aktualizacje pomiarowe, dlatego nigdy nie zauważył propagacji. Dwa testy sprawdzają teraz znak bezpośrednio i oba zawodzą na starym. Pierwszy, w <c2/>, podaje znany resztkowy bias żyroskopu przez strapdown i wymaga, by filtr przewidział wynikowy błąd orientacji z dokładnością do { "2" } %. Drugi wymaga, by filtr z szerokim rozkładem a priori nauczył się biasu żyroskopu { "1e-3" } rad/s i pozostał w granicach { "6" } m. Złoty wzorzec międzyplatformowy <c3/> zostaje ponownie przypięty z tego powodu i z żadnego innego.

seg-f764678e3376 = <b>Każdy quickstart z rejestru działa teraz tak, jak jest zapisany, na czystej maszynie.</b> Zmierzono przed tą zmianą: przykłady crates.io i PyPI (Python Package Index) odczytywały <c1/>, którego instalacja z rejestru nie zawiera, a przykład npm zawieszał się w Node.js z błędem <c2/>, ponieważ <c3/> pakietu pobiera binarny plik WebAssembly, a <c4/> w Node nie potrafi odczytać pliku lokalnego. Teraz:

seg-e77a540d2f90 = <c1/> i <c2/> zawierają ten scenariusz w treści, tak jak robił to już <c3/>. Blok kodu Rust jest kompletnym programem z własnym <c4/>, ponieważ ukryta w rustdoc linia <c5/>, którą się kończył, jest pokazywana na crates.io i po wklejeniu się nie kompiluje. <c6/> nadal kompiluje go bajt po bajcie, a teraz także odrzuca ukrytą linię w tym bloku.

seg-ea5204ced0d2 = <c1/> rozdziela przeglądarkę i Node.js oraz podaje przepis dla Node, który odczytuje plik binarny z dysku i przekazuje go do <c2/>. Test synchronizacji dokumentacji przyjmuje <c3/> jako loader generowany przez wasm-bindgen.

seg-ebb763695c59 = Wszystkie trzy osadzają scenariusz z nieskróconymi ciągami pochodzenia, więc skrót scenariusza to <c1/> na każdej powierzchni. Przykład npm dawniej je skracał, przez co miał inny skrót niż CLI.

seg-dc52363432f8 = Odtworzono z lokalnych kompilacji tego drzewa: świeży projekt <c1/> z zależnością przez ścieżkę od spakowanego crate'a zbudował i uruchomił przykład Rust; wheel zbudowany maturinem ze spakowanych źródeł, zainstalowany w nowym środowisku wirtualnym, uruchomił przykład Python; a pakiet <c2/>, spakowany i zainstalowany przez npm, uruchomił przepis dla Node. Wszystkie trzy wypisały tę samą linię podsumowania.

seg-07e465a602f1 = <c1/> działa z sklonowanego repozytorium.

seg-77ce31300b69 = <c1/> ustawia <c2/>. Bez tego cargo odmawiało z komunikatem „could not determine which binary to run”, na który natrafiała każda linia <c3/> w dokumentacji.

seg-2d516597b5f5 = <b>Błędy CLI w pierwszej minucie mówią, co robić dalej.</b> Ścieżka scenariusza, która nie istnieje, dodaje teraz wskazówkę kierującą do <c1/>, a drugi argument pozycyjny wypisuje tekst użycia, a nie tylko nazywa argument. <c2/>, <c3/>, błąd nieznanej opcji (kod wyjścia { "2" }) oraz jednolinijkowe <c5/> z <c4/> po powodzeniu były już na main. <c6/> obejmuje teraz wszystkie z nich, ponieważ wcześniej żaden test nie uruchamiał dla nich pliku binarnego.

seg-fdd9a27ccfc4 = <b><c1/> w Pythonie jest udokumentowane jako zwracające jeden ciąg JSON, a nie listę.</b> Zwraca te same metadane co <c2/>, w postaci zserializowanej, więc iterowanie po nim przechodzi po znakach. Zachowuje zwracany ciąg, aby nie zepsuć istniejących wywołań. <c3/>, komentarz dokumentacyjny wiązania, <c4/> i <c5/> mówią to teraz i wskazują <c6/>.

seg-f0e0c8c12f8a = <b>Trzy README rejestrów rozwijają każdy skrót przy pierwszym użyciu.</b> PNT jest teraz rozwinięte w haśle, w którym występuje po raz pierwszy, a CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL i API są rozwinięte w plikach, które ich używają. Nagłówek tabeli wyroczni nie mówi już „CI-gated” przed zdefiniowaniem CI.

seg-554c5b0c9c60 = Poprawiono opublikowaną wartość: dostępność ARAIM dla dwóch konstelacji na dołączonych TLE Celestrak dla GPS + Galileo.

seg-1f023a822c91 = <c1/> stwierdzał, że dodanie Galileo podnosi dostępność z { "0.21" } do { "0.67" } przy VAL { "12" } m oraz że tryb odporny na awarię konstelacji jest ograniczony przy tylko dwóch konstelacjach. Wynikało to z tego, że <c2/> propagował każdego satelitę od jego własnej epoki TLE (<c3/> odrzuca epokę), a epoki w tych plikach obejmują { "70.6" } h (GPS) i { "335.7" } h (Galileo), więc satelity znajdowały się w wzajemnie niespójnych chwilach. Test zachowuje teraz każdą epokę (<c4/>) i ocenia wszystkie satelity w jednej wspólnej chwili UTC, czyli najpóźniejszej epoce TLE w zbiorze (2026-06-07T07:{ "21" }:{ "04" }). Zmierzona dostępność na tej samej { "24" }-godzinnej siatce 289 próbek wynosi teraz dla samego GPS { "0.993" } (było { "0.208" }), dla połączonych { "1.000" } (było { "0.671" }) i dla dwóch konstelacji w trybie odpornym na awarię konstelacji { "0.990" } (było { "0.031" }); przy granicy APV-I tryb dwukonstelacyjny przechodzi z { "0.180" } na { "1.000" }. Wniosek się odwraca: na spójnym niebie dwie konstelacje podtrzymują hipotezę awarii konstelacji przy VAL { "12" } m. Te same wartości wychodzą przy najwcześniejszej epoce TLE jako odniesieniu. Samokontrola w teście przypina jego pętlę dostępności próbka po próbce do <c5/>, więc jedyną różnicą jest wyrównanie czasu. <c6/> i <c7/> §{ "3" } zawierają nowe liczby; wpis { "0.13.0" } poniżej pozostaje w wersji wydanej.

seg-3173a2e03521 = <b>Publiczne powierzchnie nie reklamują już RINEX { "4" } jako sprawdzonego niezależnie.</b> Silnik odmawia teraz po nazwie obsługi pliku nawigacyjnego RINEX { "4" }, zamiast go błędnie dekodować, ale siatka standardów nadal pokazywała kartę „RINEX { "3" } / { "4" }” ze znacznikiem <em>sprawdzone niezależnie</em>, powiązanym z dowodami parsera nawigacyjnego dla RINEX-3. Karta brzmi teraz „RINEX { "3" }”, a README, <c1/>, <c2/>, <c3/> i podsumowanie możliwości mówią, co jest prawdą: pliki obserwacji RINEX 3.0x są parsowane, układ obserwacji { "4.00" } powinien być obsługiwany, ale żaden plik { "4.00" } nie został odczytany przez ten kod, a pliki nawigacyjne RINEX { "4" } są odrzucane.

seg-c9bb514acb7a = <b><c1/> mówi, kiedy „ok” oznacza, że nie było czego sprawdzać.</b> Około dwie trzecie katalogu nie publikuje żadnego wymaganego pola; te pakiety uruchamiają swoją konfigurację referencyjną z pustej treści, więc lint mógł dla nich wypisać tylko „ok”, tymi samymi słowami, których używał po sprawdzeniu sześciu pól. Linia powodzenia podaje teraz liczbę wymaganych pól, które stwierdzono jako obecne, albo że rodzaj nie wymaga żadnego.

seg-06b324d00285 = <b><c1/> odrzuca nienumeryczne <c2/> lub <c3/>.</b> W bash { "3.2" } wartość <c4/> powodowała błąd porównania liczbowego i wynik fałszywy, więc bramka ogłaszała „repeatability loop SKIPPED (REPEAT={ "0" })” dla wartości, która nie była { "0" }, i mimo to zapisywała potwierdzenie. Oba pokrętła kończą się teraz kodem { "2" }, jeśli nie są zwykłymi liczbami całkowitymi.

seg-09d04ffdd9ac = MSRV jest podane jako { "1.85" } wszędzie, gdzie czyta je człowiek.

seg-dafc23725315 = <c1/> w ostatnim wydaniu przeszło na { "1.85" }; plakietka w README, tekst instalacji i rozwiązywania problemów, <c2/> oraz własne uzasadnienie crate'a MCP nadal podawały { "1.75" }.

seg-c2fa8a31058c = <b><c1/> w wiązaniu Pythona podaje bajty, a nie „chars”.</b> Wypisywało <c2/> ciągów UTF-8, co jest liczbą bajtów: { "710" } „chars” dla tabeli o 708 znakach.

seg-6b4452a4e340 = README nie dokumentuje już razem <c1/>.

seg-47d83e4d847b = <c1/> jest flagą dla pojedynczego scenariusza i jest ignorowana z <c2/> (binarka ostrzega). Dwa przykłady do skopiowania w README.md i README.crates.md pokazują teraz samo polecenie study.

seg-5ed7f8330b2d = <b>Dowody stabilności zegara na stronie podają obie zaobserwowane tolerancje.</b> Seria cezowa 5071A jest odtwarzana z dokładnością ≤ { "3e-5" }, a PHASE.DAT z ≤ { "5e-5" }; akapit podawał { "3e-5" } dla obu.

seg-8bba7f1171f3 = Dwa pliki wyjściowe silnika nie są już śledzone.

seg-ea9bf1d14371 = <c1/> zostały opatrzone znacznikiem silnika { "0.20.0" } z pustymi wszystkimi wskaźnikami jakości, a własne polecenie study w README nadpisywało je, brudząc drzewo i blokując bramkę push. <c2/> / <c3/> są teraz ignorowane jak pozostałe cztery pliki wyjściowe silnika.

seg-77ce9b90859d = <b>Przegląd ziarna (seed) w playground nie zawodzi już przy każdym przebiegu.</b> Przegląd zmieniał całkowite pokrętło <c1/> liniowo ({ "1" }, { "10.9" }, { "20.8" }, …), a silnik, odczytując je jako <c2/>, odrzucał każdą wartość ułamkową. Pokrętła całkowite przeglądają teraz różne liczby całkowite.

seg-e1b1e1360eb9 = <b>Każde pobranie z playground mówi, który silnik i które dane wejściowe je wytworzyły.</b> Kilka rodzajów (np. <c1/>) nie zapisuje <c2/> ani <c3/>, więc ich pobrania nazywały się po prostu <c4/>. Nazwa korzysta teraz z wersji wczytanego silnika i 12-cyfrowego szesnastkowego odcisku FNV-1a-64 tekstu scenariusza.

seg-0181e86b576a = <b>Opublikowany crate jest mniejszy niż połowa dawnego rozmiaru, a <c1/> buduje samo CLI.</b> Pakiet zawierał dawniej artykuły, ich pakiety zgłoszeniowe, artefakty rysunków do artykułów, notatniki, <c2/>, skrypty opiekunów i programy przykładowe. Żadne z nich nie jest kompilowane przez bibliotekę ani CLI. Zawierał też trzy wewnętrzne generatory w <c3/> (<c4/>, <c5/>, <c6/>), więc instalacja z rejestru kompilowała i instalowała cztery pliki wykonywalne, z których trzy były użyteczne tylko wewnątrz checkoutu. Te drzewa i trzy źródła generatorów są teraz wykluczone. Cargo wylicza binaria pakietu z zawartych w nim plików, więc opublikowany manifest wymienia tylko <c7/>. W klonie generatory nadal są znajdowane automatycznie, więc <c8/> i zadanie wydania uruchamiające <c9/> pozostają bez zmian. Zmierzono przez <c10/>: wcześniej { "763" } plików, { "16.7" } MiB, { "6.8" } MiB po kompresji; teraz { "591" } plików, { "10.5" } MiB, { "3.0" } MiB po kompresji. Jego kompilacja weryfikacyjna, która kompiluje tylko spakowane pliki, przechodzi. <c11/> na spakowanym crate'cie zainstalowało jeden plik wykonywalny, <c12/>.

seg-567c7059286f = <b>Wynik czytelny dla inżyniera czasu: koniec z <c1/>, koniec z <c2/> bez ataku oraz liczby na stronie takie same jak w README.</b> To korekta sposobu wyświetlania. Żadna opublikowana liczba się nie zmienia; wartości JSON są identyczne, co potwierdzają powyższe skróty złotych wzorców.

seg-849fa9a29f07 = Jednolinijkowe podsumowanie wypisywało 95. percentyl (p95) błędu czasu zegara optycznego jako <c1/>, podczas gdy tabela obok pokazywała { "1.20e-4" } ns. Niezerowa wartość czasu zbyt mała na jedno miejsce po przecinku jest teraz wypisywana z trzema cyframi znaczącymi (<c2/>); dokładne zero nadal wypisuje się jako <c3/>. Raport HTML (HyperText Markup Language), tabela porównania studiów i pobierany raport z playground stosują tę samą regułę, więc żadna niezerowa wartość nie jest też wypisywana jako <c4/>.

seg-c44323babd1e = <c1/> to analityczna granica wykrywalności spoofingu, która ma sens tylko wobec skonfigurowanego ataku. Rodzaje <c2/>, <c3/>, <c4/> i <c5/> go nie konfigurują, więc ich podsumowanie wypisuje teraz <c6/> zamiast liczby takiej jak <c7/>, którą można odczytać jako nieudaną detekcję. Wartość pozostaje w <c8/>, oznaczona <c9/> z powodem w <c10/>, a tabele raportu pokazują „nie dotyczy”. Rodzaj <c11/> nadal ocenia detekcję.

seg-f54d5ffb7dff = Dwa przypięte podsumowania w <c1/> zmieniły się dokładnie z tych dwóch powodów i z żadnego innego: <c2/> (p95 kwantowe i obie wartości <c3/>) oraz <c4/> (obie wartości <c5/>; jego wartości p95 są dokładnie zerowe). Skróty całych dokumentów się nie zmieniły. Oczekiwane podsumowania w README, trzech samouczkach i ich scenariuszach dydaktycznych zostały zaktualizowane, a <c6/> sprawdza kopie dydaktyczne względem silnika.

seg-e8e012376fa3 = Przewodnik po playground nie otwiera się już przy pierwszym wczytaniu. Jego okno modalne przechwytywało pierwsze kliknięcia, a podświetlenie przewijało stronę z miejsca, w którym znalazł się odwiedzający. Uruchamia się przyciskiem „Take the 60-second tour” albo pływającym przyciskiem Tour.

seg-4d60d4ea4d7d = Strona nie przewija się już na boki na telefonie. Przy { "390" } px wiersz marki i przycisk GitHub zajmowały około { "410" } px zawartości, czyli przepełnienie o { "4" } px; nagłówek mieści się teraz od { "320" } px w górę, a tabela wskaźników jakości przewija się wewnątrz własnego pola, zamiast rozszerzać stronę.

seg-f6ec6a64071d = Eksplorator możliwości zaczynał od własnej liczby kart („{ "46" } kart możliwości … { "17" } popartych zewnętrzną wyrocznią”), obok README podających { "64" } z { "168" }. Zaczyna teraz od macierzy weryfikacji, odczytanej z generowanego <c1/> (tej samej macierzy, do której przypięto liczby w README), a karty nazywa dopiero potem tym, czym są: warstwą podsumowującą. <c2/>, nowy krok w przepływie ciągłej integracji (CI), sprawdza arytmetykę i porównuje README.md z opisami na stronie; <c3/> przypina to połączenie od strony Rust.

seg-606098743e57 = <b>Publiczny opis zaczyna się teraz od synchronizacji czasu i holdover, czyli najlepiej zwalidowanej dziedziny.</b> Początek README i <c1/> przedstawiają Kshana jako otwarty, odtwarzalny silnik dowodowy odporności PNT z oznaczonym pochodzeniem: najpierw synchronizacja czasu i holdover w infrastrukturze krytycznej (estymatory Allana, zmodyfikowanego Allana, odchylenia czasu i maksymalnego błędu odstępu czasu oraz inwersja wariancji dryfu w holdover to wiersze VALIDATED, które za tym stoją), kwantowe jako neutralna metoda porównania kwantowego z klasycznym, której wyniki są oznaczone MODELLED, a nawigacja księżycowa / cislunarna i w głębokiej przestrzeni jako utrzymywane możliwości, a nie hasło przewodnie. Obie strony mówią teraz, czym Kshana nie jest: nie jest symulatorem sygnałów radiowych ani stanowiskiem hardware-in-the-loop, nie jest zamiennikiem MATLAB/Simulink, STK ani Orekit; wskazują też nowy rodzaj <c2/> i <c3/>. Dawne zdanie „nie ma dobrego otwartego narzędzia” znika: wyszukiwanie, które niczego nie znajduje, nie jest dowodem, że nic nie istnieje. <c4/> zyskuje niedatowaną kolejność priorytetów (najpierw synchronizacja czasu, potem kwantowe porównanie, a lunarne utrzymywane) i traci trzy nieaktualne pozycje (systematyki Coriolisa i przesunięcia świetlnego, warunki początkowe NRHO i scenariusz księżycowy, wszystkie dostarczone); linia README „Coriolis i przesunięcie świetlne pozostają w planie” jest poprawiona w ten sam sposób.

seg-7bc48692be0b = <b><c1/> przestało się niedoceniać.</b> Wiersz układów związanych z Ziemią mówił „none”, podczas gdy macierz ocenia GCRS→ITRS jako VALIDATED; jest teraz „full”, a wiersz układów rdzenia odnotowuje porównanie z ANISE jako dostarczone. Tryb prowadzony figurował jako plan; playground dostarczył suwaki prowadzone i przewodnik. Przegląd względem <c2/> poprawił pięć kolejnych wierszy, które były starsze od swoich walidacji: model sił Cowella oraz wsadowe/sekwencyjne wyznaczanie orbity względem Orekit { "12.2" }, przeloty nad stacjami naziemnymi względem detektora elewacji Orekit, jądro współczynnika rozmycia dokładności względem gnss_lib_py oraz import OEM względem niezależnego parsera <c3/>; wiersz weryfikacji i walidacji wymienia teraz zabezpieczenia sprawdzające, że każdy przywołany test istnieje.

seg-9d144df304ca = Słownik wyjaśnia, co mówi plik wyniku.

seg-eed672b2f8fd = <c1/> zyskuje wpisy w prostym języku dla terminów wyniku (holdover, p95, integralność, wskaźnik bezpieczeństwa, PDOP, <c2/>, <c3/>), terminów synchronizacji telekomunikacyjnej (błąd czasu, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) oraz trzech poziomów dowodowych (VALIDATED, MODELLED, PARTNER).

seg-1a4f9d5eef96 = <b>Skróty są rozwijane przy pierwszym użyciu w każdym ręcznie pisanym dokumencie publicznym.</b> README i { "24" } plików w <c1/> miało kilkaset skrótów użytych przed rozwinięciem lub bez niego; każdy jest teraz rozwinięty tam, gdzie pojawia się w danym pliku po raz pierwszy. Trzy pliki generowane (<c2/>, <c3/>, <c4/>) pozostają bez zmian: są pisane z <c5/> i <c6/>, więc ich brzmienie trzeba zmienić u źródła.

seg-2889ce118381 = Pokrycie linii ma pomiar referencyjny.

seg-9c4684c0a4ef = <c1/> zapisuje { "95.63" } % ({ "37,697" } z { "39,419" } linii) z zadania CI <c2/> dla <c3/>, a <c4/> przypina do niego pięć publicznych powierzchni z „~{ "96" }%”, czyli jedyną główną liczbę, którą utrzymywano ręcznie i która już raz zmieniła się niezauważona.

seg-ebd36b7291df = Nowe bramki synchronizacji dokumentacji dla powierzchni, których nic nie czytało.

seg-3dd44fc69a28 = <c1/> sprawdza każde <c2/> w bloku JavaScript względem eksportów WebAssembly i przypina przykład Rust z README.crates.md bajt po bajcie do kopii kompilowanej przez binarkę testową. <c3/> zawodzi, jeśli <c4/> traci <c5/> lub SECURITY.md przestaje to stwierdzać. <c6/> skanuje teraz także <c7/> i trzy README rejestrów, a każdy standard na stronie musi jawnie podawać swój <c8/>.

seg-a506d14f3447 = Dwie kontrole zegara na rzeczywistym sprzęcie działają na runnerze.

seg-c7f8b8627137 = <c1/> (co miesiąc i na żądanie) pobiera serie 5071A i PHASE.DAT i uruchamia oba testy z <c2/>, więc brakujące dane wejściowe powodują porażkę zamiast pominięcia. Oba skrypty pobierania są przypięte do jednego commitu allantools i weryfikują SHA-256.

seg-3b4a7fee3cd0 = <b>Stub typów Pythona jest sprawdzany względem zbudowanego wheela</b> (<c1/> w zadaniu bindings), przez co <c2/>/<c3/> zostały wydane bez stubu.

seg-24c2ccf3634a = <b>Słownik definiuje URE, EOP, FoM, CTI i TIB</b>, których README i rejestr używały bez rozwinięcia.

seg-ae044195cd47 = <b>Opublikowany kontrakt pól każdego rodzaju jest teraz prawdziwy, a test go tak utrzymuje.</b> Zmieniło się pięć z { "61" } rodzajów. Rodzaje z niepustym <c1/> przechodzą z { "21" } do { "22" }: <c2/> wymaga teraz <c3/> (samo <c4/> dawniej przechodziło <c5/>, a potem kończyło przebieg błędem), a <c6/> dodaje <c7/>, czego jego przebieg już wymagał. Wymagany wpis może używać <c8/> (jedno z nich) i <c9/> (wszystkie razem); <c10/> rozumie oba. <c11/>, <c12/> i <c13/> publikują { "9" } rzeczywistych pól opcjonalnych, które wcześniej pominięto. <c14/> mówi teraz, że <c15/> jest wymagane dla każdego rodzaju poza <c16/>. <c17/> sprawdza każdy rodzaj względem dostarczonego scenariusza: usunięcie dowolnego wymaganego wpisu musi sprawić, że przebieg zawiedzie, a dokument zawierający tylko wymagane pola musi się uruchomić.

seg-09ba716f3e97 = Notatki JetBrains Marketplace są objęte bramką.

seg-938ff48e7a2d = <c1/> kończy się teraz błędem, jeśli najnowszy wpis <c2/> w <c3/> nie podaje wydawanej wersji; siedem opublikowanych wersji serwowało bez zmian notatki { "0.22.0" }.

seg-3d38550854e0 = Wartość pokrycia w raporcie technicznym jest wartością zmierzoną.

seg-bd312cd26746 = <c1/> podawał „near { "97" } %”; teraz podaje około { "96" } % ({ "95.63" } % zmierzone, <c2/>) i jest szóstą powierzchnią, którą przypina test pokrycia.

seg-934680d402da = <b>Klient silnika poza głównym wątkiem jest testowany</b> (<c1/>, w CI): lista dozwolonych wywołań, anulowanie i ponowne uruchomienie, trzy ścieżki awaryjne w głównym wątku oraz odzyskiwanie po awarii, na atrapie workera.

seg-fd5f9a8a4f43 = <b>Nic nie jest publikowane, dopóki otagowany commit nie przejdzie swoich testów, a wydanie nie jest zakończone, dopóki każdy rejestr go nie serwuje.</b> Kolejność to teraz tag, weryfikacja, publikacja, parytet, strona, w jednym przebiegu <c1/> (<a1><c2/></a1>).

seg-745b11c8ed74 = Publikacja czeka na werdykt.

seg-e66c890cf6c0 = <c1/>, <c2/> i <c3/> nie startują już po wypchnięciu tagu; wywołuje je <c4/> z zadań, które mają <c5/>. Wcześniej ścigały się z nim: przy { "v0.27.2" } crates.io, npm i Python Package Index (PyPI) opublikowały wszystko w ciągu { "4.5" } minuty od tagu, a <c6/> zwróciło wynik { "84" } minuty po nim; przy { "v0.27.0" } npm i PyPI opublikowały, podczas gdy zadanie crates.io zakończyło się błędem. Ręczną ponowną próbę na tagu wstrzymuje nowy <c7/>, który wymaga zielonego <c8/> dla dokładnie tego commitu z interfejsu Actions i w każdym innym przypadku kończy się odmową.

seg-3800247c81f2 = <em>Wszystko jest budowane, zanim cokolwiek zostanie wysłane</em>, a crates.io, którego krok pakowania zawiódł w połowie wydania, publikuje jako pierwszy.

seg-6929a7608da7 = <em>Brak tokenu rejestru kończy zadanie błędem</em> zamiast pominąć wysyłkę i zgłosić powodzenie.

seg-460811602293 = Kontrola parytetu po publikacji.

seg-86eb0fab2f7c = <c1/> odpytuje crates.io (<c2/> i <c3/>), npm, PyPI (dystrybucję źródłową i wszystkie sześć wheeli platformowych) oraz ghcr.io, aż każdy serwuje daną wersję, albo kończy przebieg błędem; docs.rs i rejestr Model Context Protocol (MCP) są raportowane, ale nie wymagane. Uruchomiony na dawnych wydaniach stwierdza brak { "0.22.0" } w npm i PyPI, brak { "0.23.0" } w PyPI i brak { "0.27.0" } w crates.io.

seg-79578a00fd78 = <em>Gotowe binaria wiersza poleceń dla macOS (Apple silicon i Intel) oraz Windows x86-64</em>, nazwane według celu (<c1/> i tak dalej), obok linuksowego <c2/>, którego nazwa się nie zmienia. Plik <c3/> obejmuje każdy zasób, a <c4/> sprawdza go i uruchamia binaria dla macOS i Windows na ich własnych systemach.

seg-3e1f5afa9f2a = <em>kshana.dev pokazuje wydanie, a nie <c1/>.</em> Dawniej wdrażało się ponownie przy każdym pushu do <c2/>, podczas gdy jego strony wymieniały ostatnie wydanie. <c3/> buduje teraz tylko tag wydania: wydanie uruchamia go raz, gdy każdy kanał serwuje daną wersję, a ręczne uruchomienie wdraża ponownie ostatnie wydanie (lub wskazane).

seg-43da8f3f171e = Jedno źródło wheeli.

seg-b911ac65e231 = Ręcznie skopiowana macierz sześciu celów w <c1/> zniknęła; wywołuje on <c2/>, więc bramka znacznika auditwheel i sprawdzenie odtwarzalności bajt po bajcie oceniają teraz wheele, które otrzymuje PyPI, a porażka któregokolwiek z nich zatrzymuje wydanie.

seg-194c4b019a4c = <em>Przypięte narzędzia budowania.</em> Każdy workflow żąda Rust { "1.93.0" } (zadanie msrv własnej wersji); <c1/> i <c2/> żądały <c3/>, a log { "v0.27.2" } pokazuje, że rustup instalował { "1.98.1" }, a następnie kompilował z { "1.93.0" } tylko dlatego, że <c4/> ma pierwszeństwo. wasm-pack jest przypięty do { "0.13.1" } (wersja, która zbudowała { "v0.27.2" }, wybrana przez nieprzypięty skrypt instalacyjny) ze sprawdzeniem sumy kontrolnej, a mcp-publisher do { "1.8.1" } z opublikowanym SHA-256. <c5/> kończy się teraz błędem, jeśli workflow prosi o inny kompilator lub przekazuje pobrany skrypt do powłoki. Żadne zadanie weryfikacji, przypięty złoty wzorzec ani lokalny skrypt bramki nie zostały usunięte ani osłabione.

seg-9e2a7376367e = <b>Każda zewnętrzna akcja GitHub jest przypięta przez SHA commitu</b>: { "93" } odwołań w { "15" } workflowach, z czego { "92" } nowo, a tag zostaje jako końcowy komentarz do aktualizacji przez Dependabot. Wyjątkiem jest <c1/>, którego tag jest selektorem toolchainu.

seg-6afb4a8770b0 = <b>Bazowe warstwy obrazu serwera MCP są przypięte przez skrót wieloarchitekturowy</b>, a Dependabot obserwuje teraz Dockerfile <c1/>, więc warstwy systemu nadal dostają aktualizacje bezpieczeństwa, przez zrecenzowany PR.

seg-4ea8b158b408 = Sprawdzenie zgodności tagu z manifestem działa w dwóch workflowach publikacji, które wydają wersję z tagu.

seg-4b77764e955d = <c1/> (obraz ghcr, rejestr MCP) i <c2/> (Marketplace) ścigają się z <c3/> zamiast na niego czekać, więc błędnie wycięty tag był bramkowany tylko w siostrzanym workflow. Oba uruchamiają teraz <c4/> przed budowaniem.

seg-bf90c4063843 = <b>Naprawiono cztery ostrzeżenia, które Dependabot zgłosił w dniu włączenia alertów.</b> Serwer MCP przechodzi z <c1/> { "1.7" } na { "2.2" }: trzy ostrzeżenia dotyczące <c2/> < { "2.1" } (wyciek tabeli sesji Streamable-HTTP, brak walidacji chronionego zasobu OAuth, własne nagłówki podążające za przekierowaniem między źródłami); żadne nie jest tu osiągalne, bo serwer mówi tylko przez stdio, ale opublikowany crate nie powinien przypinać podatnego SDK. Makra <c3/> { "2" } wymagają Rust { "1.88" }, więc tylko <c4/> deklaruje teraz <c5/>; biblioteka <c6/> zostaje przy { "1.85" }. Jedna zmiana API (<c7/> → <c8/>) została zastosowana, a testy pełnego obiegu przechodzą. Akcja skanowania SonarQube przechodzi z v5 na v6, co naprawia ostrzeżenie o wstrzyknięciu argumentu (≥ { "4.0" }, < { "6.0" }).

seg-2652aaad177e = <b>Każdy element Rust przywołany przez wiersz macierzy weryfikacji jest teraz rozstrzygany względem crate'a.</b> Dotychczasowa bariera sprawdzała cytowania w kształcie ścieżek plików; { "63" } ze { "164" } wierszy niepartnerskich podaje swoje dowody jako element wewnątrz crate'a: <c1/>, <c2/>, <c3/>, a token bez przyrostka <c4/> był niewidoczny dla skanera ścieżek. Takie wiersze mogły wskazywać zmieniony moduł, opróżniony moduł testów lub funkcję, która nigdy nie istniała, a każda bramka pozostałaby zielona.

seg-01eee5115e3f = <c1/> rozstrzyga wszystkie { "339" } takich cytowań przez drzewo modułów, wymaga, aby każdy wiersz niepartnerski wskazywał co najmniej jeden test, który faktycznie ma <c2/>, i wymaga, aby wiersze partnerskie nie wskazywały żadnego. Do oceny testu użyto czterech mutacji: zmiany nazwy cytowanego modułu, skierowania jedynego cytowania testu w wierszu na funkcję niebędącą testem, zmiany nazwy prawdziwego <c3/> oraz usunięcia z niego atrybutów <c4/>; każda z nich zaczerwienia asercję, która za nią odpowiada.

seg-7731d549c739 = Jeden wiersz był już błędny: <em>Alternative / complementary PNT</em> przywoływał <c1/>, czyli glob, który nie jest cytowaniem. Wymienia teraz <c2/> oraz trzy stojące za nim wewnętrzne moduły testów crate'a.

seg-cf6fd64368de = <b>Opublikowane wykresy są ponownie sprawdzane względem silnika przy każdej kompilacji</b> (<c1/>). Trzy wykresy demonstracyjne w README to własny wynik <c2/> silnika i nic nie uruchamiało scenariusza ponownie; dwa studia punktu przecięcia z artykułu zostały wygenerowane raz i zatwierdzone; a README podaje cztery wskaźniki jakości w tekście obok <c3/>. Wszystkie trzy są teraz przypięte do bieżącego wyniku silnika.

seg-276b65a8f76a = Ich uzgodnienie przyniosło użyteczny wynik: wykresy demonstracyjne narysowano w silniku { "0.22.0" }, a JSON punktu przecięcia z artykułu w { "0.20.0" }, a w { "0.27.1" } <b>każda narysowana wartość we wszystkich pięciu artefaktach jest identyczna</b>; trzy wykresy SVG różnią się od świeżego przebiegu dokładnie dwoma znakami każdy, czyli znacznikiem wersji w stopce. Wykresy wyrenderowano ponownie, aby stopka była prawdziwa. JSON artykułu celowo pozostaje ze znacznikiem { "0.20.0" }: jest zapisem przebiegu, którego wykres zawiera opublikowany artykuł, a zmiana znacznika przypisałaby mu pochodzenie, jakiego PDF nie ma. Bariera stwierdza zamiast tego mocniejszą własność: że obecny silnik nadal odtwarza każdą opublikowaną wartość.

seg-c88647c5f2fc = Analizy SonarCloud były zapisywane jako <c1/>, więc okres nowego kodu <c2/> nigdy nie przesuwał się: nadal był zakotwiczony w analizie z 2026-07-02, oceniając osiemdziesiąt dwa dni pracy jako jedną deltę i mierząc { "7877" } „nowych” zduplikowanych linii wobec progu { "3" } %. Skan przekazuje teraz wersję crate'a. Leżąca u podstaw duplikacja jest prawdziwa i to jej nie ukrywa: skupia się w deklaratywnych rejestrach <c3/> powtarzanych w <c4/>, <c5/>, <c6/>, <c7/> i <c8/> oraz w 168-wierszowej tabeli weryfikacji i jest tu nazwana pracą do wykonania, a nie wyłączona z pomiaru.

seg-f2a0960a6f11 = <b><c1/> nie miało blokady jednego piszącego, a każdy przebieg zapisywał ten sam log.</b> To nie jest kwestia porządku: wartości <c2/>, <c3/> i <c4/> z potwierdzenia są odczytywane Z tego logu, a hak pre-push ufa potwierdzeniu. Bramka, która została zabita, ale której binarka testowa nadal żyła, zapisywała dalej do pliku, który następny przebieg właśnie obciął, więc liczby jednego przebiegu mogły zostać poświadczone jako liczby innego, co upoważniało do pushu na podstawie zestawu, który nigdy nie uruchomił się na wypychanym drzewie. Teraz jest jedna bramka na checkout (odmawia z kodem wyjścia { "75" } obok żywej, usuwa przestarzałą blokadę, której pid już nie istnieje) i jeden log na przebieg, a <c5/> jest odświeżany z kończącego się przebiegu przy wyjściu. Oba kierunki są przetestowane: żywy pid powoduje odmowę, martwy zostaje wyczyszczony.

seg-687d6fe87221 = <c1/> twierdził, że jego testy <b>nie</b> dowodzą, że ciągi nazw testów i wyroczni wskazują żywy kod. Dwie bariery robią teraz dokładnie to, więc dokumentacja modułu mówiła odwrotnie niż jest naprawdę; podaje teraz, co jest sprawdzane maszynowo, a co pozostawiono ocenie człowieka. Nieaktualne odwołanie do <c2/>, bo moduł nazywa się <c3/>, zostało poprawione w dokumentacji siostrzanej bariery.

seg-014070f0873c = <b><c1/> została przepisana 2026-09-22 i wypchnięta siłą.</b> Dziesięć commitów stało się czterema. Przepisanie wchłonęło każdy commit, który zostawiał bramkę czerwoną, w commit, który ją naprawiał, więc każdy commit na <c2/> ma teraz drzewo, które przechodzi, i usunęło anulowane przebiegi, które grupa współbieżności obejmująca cały branch zostawiała na każdym zastąpionym commicie.

seg-b48d6cfc3b42 = Nic nie zostało odrzucone. Commity sprzed przepisania pozostają osiągalne przez tagi, które na nie wskazują, a końcowe drzewo jest identyczne bajt po bajcie z drzewem, od którego przepisanie zaczęło: <c1/> między starym a nowym końcem jest puste, poza trzema plikami workflow, które zmienia to wydanie.

seg-0549cfdc6d69 = Zastąpione SHA, dla każdego, kto trzyma do któregoś odwołanie:

seg-14812deb1b6b = stary

seg-c63f549e6a1d = temat

seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

seg-9c220336c895 = <b>Tagi { "v0.27.0" } i { "v0.27.1" } celowo NIE zostały przesunięte.</b> Nadal wskazują <c1/> i <c2/>, dokładnie te commity, których drzewa wytworzyły artefakty obecnie dostępne w crates.io, npm, PyPI, ghcr.io i rejestrze MCP. <c3/> crate'a zapisuje sha1, z którego został spakowany, rejestry są niezmienne, a atestacja pochodzenia budowy SLSA na zasobach wydania { "v0.27.1" } jest związana z tym commitem. Przesunięcie tagów zostawiłoby każdy z tych opublikowanych artefaktów wskazujący commit, który już nie istnieje. Pozostawienie ich utrzymuje stare commity osiągalnymi i każdy opublikowany łańcuch pochodzenia rozstrzygalnym, kosztem dwóch tagów, które nie są już przodkami <c4/>; dlatego to wydanie istnieje: { "v0.27.2" } daje <c5/> własny tag, spakowany z commitu, który się na niej znajduje.

seg-3c644384256f = To drugie ujawnione przepisanie tej historii; pierwsze, 2026-09-21, ujednoliciło autorstwo i jest zapisane w notatkach { "0.27.0" } wraz z jego dwoma wiszącymi sha1 crate'ów. Przepisanie jest tu ujawniane za każdym razem, bo repozytorium, które sprzedaje weryfikowalne pochodzenie, nie może po cichu ruszać gruntu spod opublikowanego artefaktu.

seg-d82d7a3c9054 = Opublikowany crate się nie kompilował.

seg-ebc99c9df1ef = <c1/> zawiera <c2/> najwyższego poziomu dla <c3/>, a manifest wyklucza <c4/> z pakietu, więc archiwum otrzymywane przez crates.io nie miało pliku, który sama biblioteka osadza. Publikacja { "v0.27.0" } zawiodła w kompilacji weryfikacyjnej z tego powodu i żadne { "0.27.0" } nie dotarło do crates.io; npm i PyPI, których zadania od niego nie zależą, opublikowały normalnie. Wykluczenie ma teraz wyjątek dla tego jednego katalogu.

seg-6ff9cdb976e8 = Każde inne <c1/> fixture w <c2/> znajduje się wewnątrz modułu <c3/>, więc nigdy nie trafia do spakowanej biblioteki. Tylko to na najwyższym poziomie trafia.

seg-7f0975453b8f = <b>Nic w CI nie uruchamiało <c1/>,</b> dlatego archiwum, które nie może się skompilować, zostało po raz pierwszy wykryte przez zadanie publikacji, gdy dwa inne rejestry już je wydały. Zadanie <c2/> buduje teraz i kompiluje dokładnie to archiwum przy każdym pushu.

seg-1f2df48821fc = Przypięte skróty emisji realizacji układu księżycowego nie przesuwają się już przy podbiciu wersji. Stopka SVG zawiera wersję silnika, więc każde wydanie wymuszało nowe wyznaczenie trzech skrótów, dwukrotnie w jednym dniu, a pin ponownie wyznaczany z rutyny przestaje być czytany. Ciąg wersji jest normalizowany do symbolu zastępczego przed haszowaniem, a emisja jest osobno sprawdzana pod kątem podania działającej wersji, więc ten fakt jest sprawdzany dokładniej, niż kiedykolwiek sprawdzał go skrót.

seg-56309487ea7e = <c1/>: księżycowy datum układu z prawdziwej kampanii obserwacyjnej.

seg-966a2cc4e40d = <c1/> zastąpiło wstrzykniętą transformację Helmerta <em>symulowaną</em> kampanią i powiedziało to wprost: jej sieć stacji, harmonogram i sigma na obserwację są wejściami ilustracyjnymi. Ten scenariusz usuwa symulację z dwóch miejsc, w których harmonogram i model błędu wchodzą do wyniku. Epokami są czasy nadania { "337" } zarchiwizowanych normalnych punktów księżycowej laserowej lokacji ILRS (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } i Matera MLRO { "7941" }, wszystkie pięć macierzy reflektorów), a waga każdej obserwacji to własna zarchiwizowana precyzja tego punktu normalnego, <c2/>, czyli mediana { "5.13" } mm odległości w jedną stronę, wzięta z pliku, a nie wybrana tutaj. Współrzędne stacji pochodzą z IERS ITRF2020, a współrzędne reflektorów z tabeli { "7" } JPL DE430; każde fixture zapisuje adres URL, datę pobrania i SHA-256 i jest regenerowane ze swojego źródła przez zatwierdzony generator, który weryfikuje źródło i przerywa zamiast wyemitować liczbę. Raport nazywa, które łącza są zmierzone, a które pozostają modelowane, i te modelowane są <em>zmierzone</em>: różnica obserwowana minus obliczona odległości w jedną stronę na rzeczywistych danych wynosi { "156 494" } m RMS, co ten sam zestaw testów potwierdza względem JPL Horizons na tym samym przedziale ({ "195 655" } m RMS wektora, najgorsza epoka { "0.054" }°, czyli w granicach ~{ "0.3" }°, które wbudowany analityczny szereg księżycowy deklaruje dla siebie). Addytywnie: nowy rodzaj, nowy czytnik (<c3/>) i nowy moduł (<c4/>); istniejące pakiety układu księżycowego są przypięte bit po bicie.

seg-7fcd2af0a688 = <b><c1/> jako parametr scenariusza</b> w <c2/> i <c3/>. Dokładność pomiaru odległości w sygnale w przestrzeni była stałą czasu kompilacji (<c4/>), więc przegląd objętości usługi mógł odpowiedzieć tylko „zaliczone albo nie” przy jednej ustalonej wartości. Poziomy ochrony są względem niej dokładnie liniowe, więc jej udostępnienie zamienia przegląd w <b>wymaganie</b> dokładności pomiaru odległości w całej objętości. Wartość domyślna odtwarza dotychczasowe zachowanie bit po bicie.

seg-c3ccc1e89a2d = <b>Eksport geometrii poszczególnych satelitów</b> w <c1/>: <c2/> + <c3/> dodają tablicę <c4/> podającą azymut, elewację i odległość ukośną do każdego satelity w każdej epoce dla jednego nazwanego miejsca selenograficznego, plus znacznik widoczności. Zbiorcze podsumowanie pokrycia celowo zwija geometrię poszczególnych satelitów, ale odległość ukośna jest dokładnie tym, czego używa bilans łącza, więc łącznej analizy komunikacji i nawigacji nie dało się wykonać z samego podsumowania. Wyłączone, jeśli nie podano obu współrzędnych; wyłącznie addytywne.

seg-ae7886fbca9d = <c1/>, publiczna funkcja pomocnicza kątów widzenia stojąca za eksportem.

seg-b187bade5f04 = Wiersz macierzy weryfikacji dla nowej możliwości geometrii.

seg-14ef785b6c12 = <b>Rzeczywisty wzorzec anteny w eksporcie geometrii.</b> Silnik od P1 zawiera wzorzec jednorodnie oświetlonej apertury kołowej (<c1/>, postać Airy’ego <c2/>), a <b>nic poza <c3/> go nie używało</b>; zamiast tego pracę wykonywała wzmocnienie na osi w parze z regułą kciuka wzmocnienie–szerokość wiązki. Opcjonalna tabela <c4/> w <c5/> (odczytywana tylko wtedy, gdy ustawiono miejsce eksportu) daje teraz każdemu wierszowi eksportu <b>kąt poza osią na satelicie</b> i <b>wzmocnienie nadawcze w kierunku miejsca z tego wzorca</b> oraz dodaje blok <c6/>, który podaje <b>liczbę w wiązce według rzeczywistego wzorca obok liczby w wiązce według przybliżenia symetrycznego</b> (<c7/>) z różnicą jako nazwaną korektą. Emitowane są obie liczby; żadna nie zastępuje drugiej. Zmierzone przy własnej reprezentatywnej aperturze księżycowej silnika (czasza { "1" } m, { "2.4" } GHz, η = { "0.60" }) nad miejscem przy biegunie południowym i ilustracyjną powłoką klasy LCNS obie <b>różnią się o więcej niż jednego satelitę</b>: rzeczywisty wzorzec umieszcza { "0" } z { "76" } widocznych łączy w wiązce półmocy, przybliżenie twierdzi { "28" }; korekta wynosi −{ "2.33" } satelity na epokę, a najgorsza pojedyncza epoka { "3" }. Przybliżenie ma własną sprawność apertury ({ "0.641" } wobec reguły <c8/> stopni, w której zwykle się je podaje, { "0.920" } wobec jednorodnej apertury kołowej), więc dla czaszy o η = { "0.60" } zwraca wiązkę { "1.238" }× za szeroką; blok emituje obie implikowane sprawności zamiast zostawiać je do wywnioskowania. Wyłącznie addytywnie: zmierzone w udokumentowanym punkcie pracy, { "597" } dotychczasowych liści, <b>{ "0" } zmienionych, { "0" } usuniętych, { "494" } dodanych</b>.

seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> i <c7/>, publiczne elementy za tym stojące. Wzorzec jest też teraz zakotwiczony względem opublikowanych stałych Airy’ego, a nie tylko względem samego siebie: przejście przez połowę mocy jest lokalizowane bisekcją i porównywane z <c8/>, co daje dokładną szerokość połowy mocy <c9/> i uczciwie zapisuje, że konwencjonalny współczynnik <c10/> daje <c11/> równe <b>−{ "2.955" } dB</b>, a nie −{ "3.010" } dB.

seg-bac7217bb128 = <b>Długa tabela odtwarzalności dla <c1/>.</b> Wyniki scenariusza będące tablicami, czyli siatka czasów uśredniania, siedem krzywych <c2/> dla poszczególnych składników i ich suma kwadratowa, docierały do odbiorców tylko jako tablice JSON. Jedna wydana tabela została obcięta na { "400" } znakach i opublikowała { "23" } z { "57" } czasów uśredniania pod kolumną deklarującą wszystkie z nich, a manuskrypt odbudowywał krzywe składników ze wzorów zamkniętych, bo silnik nigdy ich nie emitował. Zwykły przebieg zapisuje teraz także <c3/> z jednym wierszem na (indeks siatki, czas uśredniania, składnik), którego nie da się obciąć do czegoś, co nadal wygląda na całość. Indeks siatki jest dokładnym kluczem złączenia; <c4/> jest zapisywane z { "13" } cyframi znaczącymi, a każde <c5/> z { "7" }, więc bajty nie rozchodzą się między kompilacjami tego samego źródła. Wyłącznie addytywnie: raport JSON jest identyczny bajt po bajcie.

seg-ab9209297ec2 = <b>Raport <c1/> opisuje teraz sam siebie.</b> Blok <c2/> powtarza rozstrzygnięte wejścia łącza (długość fali nośnej, apertura nadawcza i odbiorcza, odległość, szerokość impulsu, czas integracji, sprawności i straty) z zastosowanymi wartościami domyślnymi, więc artykuł podaje konfigurację, z którą się uruchomił, zamiast cytować wartość domyślną odczytaną ze źródła. Blok <c3/> podaje jednostkę i klasę pochodzenia każdej wielkości, którą artykuł prawdopodobnie zacytuje. Powodem jego istnienia są ślady kowariancji przekazania: były emitowane jako goły <c4/>, a manuskrypt wywnioskował metry kwadratowe z wewnętrznej kontroli spójności. Wniosek był słuszny, i właśnie dlatego był defektem: nic nie wychwyciłoby, gdyby był błędny. Wyłącznie addytywnie: zmierzone dla czterech konfiguracji, { "456" } dotychczasowych pól, <b>{ "0" } zmienionych, { "0" } usuniętych, { "196" } dodanych</b>.

seg-5c810155300c = Wiersz macierzy weryfikacji dla tabeli odtwarzalności bilansu czasu, uczciwie <c1/> / <b>MODELLED</b>: suma jest sprawdzana względem sumy kwadratowej składników w tym samym pliku, który współdzieli własne definicje składników silnika i dlatego nie jest niezależną wyrocznią. Razem dodają one trzy wiersze. Bieżąca suma dla tej niewydanej sekcji to <b>{ "168" } wierszy: { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

seg-ed290a85ab0e = <b>Autorstwo commitów w całej historii jest teraz jedną tożsamością, a dwa opublikowane crate'y wskazują commit, który już nie istnieje.</b> 2026-09-21 historię git przepisano tak, aby każdy commit od człowieka miał jako autora i zatwierdzającego <c1/>. Wcześniej nosiła trzy zapisy jednej osoby: { "688" } commitów jako <c2/>, { "34" } jako <c3/> i { "94" } już kanonicznych. Jedyny commit <c4/> celowo pozostawiono z własnym autorem: zmiana etykiety aktualizacji zależności od bota przypisywałaby autorstwo pracy, której nikt tu nie wykonał.

seg-ec4e75f94462 = <b>Żadna treść się nie zmieniła.</b> Przepisanie dotknęło wyłącznie nagłówków autora i zatwierdzającego, i da się to sprawdzić, a nie tylko twierdzić: drzewo każdego tagu i każdego brancha jest bit po bicie takie samo jak wcześniej. <c1/> nadal wskazuje drzewo <c2/>, dokładnie tak jak przedtem.

seg-bc0f4fa0a009 = <b>Ile to kosztowało.</b> Nazwa commitu jest skrótem drzewa, rodziców i nagłówków autora, więc zmiana przodka zmienia nazwę każdego potomka. Commit wydania <c1/> miał <c2/>, a ma teraz <c3/>. Dwa artefakty zapisały starą nazwę w chwili publikacji i nie można ich poprawić, bo opublikowana wersja w rejestrze jest z założenia niezmienna:

seg-52e096332738 = <c1/> { "0.26.0" } w crates.io: <c2/> zapisuje <c3/>

seg-8ec39d2f136c = <c1/> { "0.26.0" } w crates.io: ten sam sha1, <c2/>

seg-9a21b7c7b41c = Nic więcej nie jest dotknięte. Pakiet npm nie zapisuje <c1/>, a dystrybucja PyPI w ogóle nie zapisuje commitu; oba sprawdzono, a nie założono.

seg-9c51c5fb0d80 = Nie ma naprawy, po której <c1/> wskazywałoby przepisany commit: ten ciąg <em>jest</em> starym rodowodem, a jedyny sposób, w jaki da się go rozstrzygnąć, to pozostawienie opublikowanej historii sprzed przepisania, co przywróciłoby autorstwo, które przepisanie usunęło. Pochodzenie { "0.26.0" } biegnie więc przez tag, a nie przez zapisany sha1, a tag dostarcza identyczne bajty, z których crate zbudowano. Następne wydanie zapisuje prawidłowy commit bez żadnego działania.

seg-30ecea86118a = <b><c1/> domyślnie używało pliku EOP bez wierszy predykcji (G12).</b> Scenariusz osadzał pięciowierszowy wyciąg <c2/> <em>tylko z wartościami ostatecznymi</em> jako domyślny tryb offline, więc goły przebieg raportował <c3/>, a tabela dla poszczególnych horyzontów opierała się na parach { "5" }, { "4" }, { "3" } i { "2" }. Silnik zawsze potrafił odczytać wiersz predykcji; po prostu dane wejściowe żadnego nie miały. Domyślnym jest teraz dosłowny wyciąg IERS { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } wartości ostatecznych Bulletin B i <b>{ "12" } wierszy Bulletin A wyłącznie z predykcją</b>, więc goły przebieg bez argumentu pliku i bez sieci raportuje <c5/> i tabelę dla poszczególnych horyzontów przy n = { "20" } / { "31" } / { "30" } / { "29" }, a porównanie z predyktorem operacyjnym i uzgodnienie z własnymi opublikowanymi predykcjami produktu również się wypełniają. Długi 45-wierszowy wyciąg zmierzono jako alternatywę i odrzucono: również zawiera tylko wartości ostateczne, więc zostawiłby <c6/> na { "0" }. <b>To zmienia opublikowane liczby</b>, na mocy reguły R4 i za zgodą założyciela: dziesięć z { "22" } komórek wydanego <c7/> i { "24" } z { "42" } wypełnionych komórek <c8/>. Zmierzona podłoga bieguna rapid minus final wynosi { "0.0678" } mas (z { "0.0769" } mas), czyli wartość, którą własna tabela ruchu bieguna w artykule P4 już publikuje przy n = { "20" }; obie zgadzają się teraz zamiast różnić się o { "13.5" } %. Każda inna wartość, którą P4 drukuje z tej tabeli, jest bez zmian przy drukowanej precyzji. Pełne zestawienie stare → nowe, w tym pól, które <em>nie</em> uległy zmianie, jest w <a1><c9/></a1>. Wyciąg tylko z wartościami ostatecznymi nadal jest dostarczany, przypięty co do bajta i ćwiczony: zerowa liczba wierszy predykcji na nim jest własnością tego pliku i test nadal to dowodzi.

seg-17fbc566dc5b = <b>Przestarzałe ograniczenie liczby satelitów w <c1/>.</b> Scenariusz ograniczał <c2/> do { "12" }, chociaż jego własny konstruktor konstelacji obsługuje { "24" }, a test stwierdza { "24" }, więc każda żądana liczba powyżej { "12" } była po cichu zmniejszana, a przegląd liczby satelitów zwracał identyczne wartości powyżej { "12" }, nie do odróżnienia od prawdziwego nasycenia geometrycznego. Teraz ograniczenie wynosi tyle, ile limit konstruktora. Jest to zmiana zachowania tylko dla <c3/>.

seg-4df7d4d61b40 = To samo przestarzałe ograniczenie w <c1/>.

seg-8adfbd27c4f8 = <c1/> ograniczało <c2/> do { "12" } z tym samym skutkiem, a ten trafił do opublikowanej tabeli: <c3/> zawiera wiersz <c4/> identyczny bajt po bajcie z wierszem <c5/>, bo silnik zwracał odpowiedź dla dwunastu satelitów pod etykietą szesnastu. Teraz ograniczenie wynosi limit konstruktora { "24" }, a nowy test to przypina: każda większa konstelacja musi zarówno podać własną liczbę, jak i ściśle poprawić poziom ochrony, więc ograniczenie nie może wrócić niezauważone. <b>To zmienia opublikowane liczby</b>: poziom ochrony <c6/> zmienia się z { "16.92" } m na { "14.57" } m. Przy przeglądzie do { "24" } krzywa jest ściśle monotoniczna ({ "11.94" } m przy { "24" } satelitach, o { "29.5" } % lepiej niż przy { "12" }), więc przy { "12" } nie ma nasycenia; pozorne plateau było tym ograniczeniem. Zmiana zachowania tylko dla <c7/>.

seg-ebee158b73c8 = Wydanie dokumentacji, przejrzystości i playground. Zachowanie silnika się nie zmienia: macierz weryfikacji liczy <b>{ "102" } wierszy: { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, bez zmian względem { "0.25.0" }.

seg-7af422ed6d89 = <b>Rustdoc na poziomie crate'a</b> (<c1/> w <c2/>) obejmujący punkty wejścia, model rzetelności i poziomów dowodowych oraz odtwarzalność, aby docs.rs otwierało się na prawdziwej stronie startowej, a nie na gołej ścianie modułów.

seg-dd44c25f3af5 = <b><c1/></b>: referencja dla każdego z <c2/> rodzajów scenariuszy, generowana z <c3/> (jedyne źródło prawdy) przez <c4/> i pilnowana przez <c5/>, więc nie może rozjechać się z dyspozytorem.

seg-e2cc77d3b413 = <b>Dokumentacja modułów</b> dla { "11" } dotąd nieudokumentowanych modułów publicznych (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

seg-8d156713799d = <b>Źródła literaturowe</b> dla pięciu modułów wzorów, które podawały równanie, ale nie wskazywały źródła: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon i in.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

seg-832b4bfbc48a = <b>Opublikowany <c1/></b> na kshana.dev do skoordynowanego ujawniania.

seg-30603f59e27d = <b>Poziom dowodowy walidacji dla każdego przebiegu w playground.</b> Tabela wskaźników jakości pojedynczego przebiegu zawiera teraz dla każdej wartości znacznik VALIDATED/MODELLED odczytany z tego samego wyszukiwania <c1/>, którego używa pobierany raport (odzwierciedla <c2/>, wyprowadzone z macierzy weryfikacji), więc poziom pokazany obok wartości na żywo nigdy nie może się rozejść z rejestrem.

seg-93b203f3a1c0 = <b><c1/></b> w menu playground: wszystkie { "50" } rodzajów dostępnych do uruchomienia jest teraz o jedno kliknięcie (było 49/50).

seg-1ec0830db404 = <b>Pięć kolejnych kart możliwości z możliwością uruchomienia</b> (pogoda kosmiczna, ocena zakłóceń RF, odporność, interoperacyjność CCSDS OEM, KIF), co podnosi liczbę uruchamialnych kart z { "11" } do { "16" }. Karty tylko dla API i biblioteki zachowują uczciwy odnośnik do dokumentacji zamiast fałszywego przycisku uruchomienia.

seg-977ea074dd9d = Pokrycie dokumentacją jest teraz pilnowane w CI przez zapadkę.

seg-beb308bcaafb = <c1/> kompiluje bibliotekę z <c2/>, liczy ostrzeżenia i kończy się błędem tylko wtedy, gdy liczba przekroczy przypięty pułap ({ "986" }). Twarde <c3/> pod <c4/> zamieniłoby ~{ "1000" } obecnie nieudokumentowanych elementów publicznych w nocną awarię budowania; w ten sposób nowe nieudokumentowane elementy publiczne przerywają budowanie, a istniejące zaległości są spłacane świadomie.

seg-27668072a608 = <b>Wiersz narzędzia MCP <c1/> reklamował „~{ "17" } wbudowanych rodzajów scenariuszy”</b>, podczas gdy <c2/> od pewnego czasu udostępniało { "50" }: dokumentacja dla agentów trzykrotnie zaniżała rzeczywiste możliwości. Przypięto do prawdziwej liczby.

seg-1ffc9f9816e8 = Ponownie wygenerowano wyrocznię zgodności SBOM CycloneDX dla zaktualizowanego grafu zależności ({ "60" } komponentów). Werdykt testu zgodności formatu się nie zmienia: zero znormalizowanych błędów schematu, a każdy atomowy identyfikator licencji nadal należy do oficjalnego wyliczenia SPDX.

seg-a6db590bbcbe = <b>Pięć możliwości awansowało do zewnętrznie VALIDATED</b>, z których każda jest teraz sprawdzona względem niezależnej implementacji strony trzeciej tej samej jednoznacznie zdefiniowanej wielkości (nieokrężnie, z fixture odtwarzalnymi offline):

seg-98588143b4bb = <b>Konwersja potęgowa IEEE-1139 → odchylenie Allana</b> względem wzorów zamkniętych <c1/> dla wszystkich pięciu rodzajów szumu (<c2/>);

seg-ce37d70fa8bc = <b>Wagi beamformera CRPA MVDR / o minimalnej normie z zerowaniem kierunku</b> względem numpy/scipy LAPACK (<c1/>);

seg-0f033d1027f8 = <b>Wyznaczanie orientacji Wahba / TRIAD / QUEST</b> względem SVD <c1/> SciPy na obserwacjach bez szumu (<c2/>);

seg-e1e2283cb524 = <b>Wymiana bloków kowariancji CCSDS { "502.0" } OEM</b> przeprowadzona w obie strony przez parser niezależnej biblioteki <c1/> (<c2/>);

seg-579eefbb646f = <b>jądro statystyk detekcji akwizycji w detektorze kwadratowym</b> (uogólnione Marcum-Q / P_d / P_fa / próg) względem SciPy <c1/>/<c2/> (<c3/>). Sprawdzana maszynowo macierz walidacji przechodzi na <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> w <b>{ "102" } wierszach</b> (było { "51" } · { "47" } · { "4" }). Zastrzeżenia co do uczciwego zakresu zostają zachowane, np. awans akwizycji obejmuje tylko jądro statystyk detekcji; straty CFAR/straddling pozostają MODELLED.

seg-b6a140d55580 = <b>Wskaźniki jakości w dziedzinie pozycji</b> (<c1/>): dokładne CEP, SEP i 2DRMS z kowariancji pozycji ENU 3-D rozwiązania nawigacyjnego oraz poziomego poziomu ochrony. CEP/SEP są <em>dokładnymi</em> medianami błędu promieniowego (a nie regułą liniową <c2/>), sprawdzonymi względem kwantyli rayleigh/maxwell z <c3/> i niezależnej mediany Monte-Carlo w NumPy (<c4/>). Zastępuje dotychczasowy uczciwy zaślepiony brak implementacji: <b>sygnatura funkcji się zmieniła</b> z <c5/> zwracającego błąd na <c6/> zwracającą <c7/>.

seg-1551afa17154 = <b>Równoważna liczba stopni swobody (EDF) przedziału ufności dopełniona dla wszystkich estymatorów rodziny Allana</b> (<c1/>): EDF dla zmodyfikowanego Allana, Hadamarda i wariancji całkowitej używa teraz algorytmu łącznego EDF Greenhalla i Rileya oraz postaci TOTVAR z tabeli 7 NIST SP { "1065" } (dotąd zaimplementowano tylko EDF nakładającego się Allana, a pozostałe po cichu go ponownie wykorzystywały), sprawdzone względem <c2/> <c3/>/<c4/> (<c5/>).

seg-39753e7919cc = <b>Niezależne zewnętrzne kontrole dla geometrii PNT księżycowego, DOP, EOP, DRO i możliwości pomiaru odległości RF</b> (<c1/>, z fixture i generatorami wyroczni w <c2/>). Każda kontrola uruchamia już dostarczoną <b>modelowaną</b> możliwość względem wyroczni wytworzonej przez <em>inną</em> implementację, więc zgodność nie jest okrężna: orbitalny ślad nadawania/przechwytu względem <c3/> (Cephes, rzeczywiście inna funkcja Bessela J1); geometryczne DOP naziemnych radiolatarni względem niezależnego rozwiązania NumPy <c4/>; wzrost błędu predykcji persystencji UT1/EOP względem osobnego ponownego sparsowania w NumPy tych samych dosłownych wierszy IERS <c5/>; płaska rodzina orbit wstecznych dalekich (DRO) względem bazy NASA/JPL Three-Body Periodic Orbit Database; oraz bilans precyzji pomiaru odległości RF względem odniesienia z pierwszych zasad. Są to dodatkowe dowody regresji dla istniejących modułów; dodanie tych testów kontrolnych samo w sobie nie zmienia etykiety żadnej możliwości (pięć awansów powyżej to osobne zmiany statusu poparte wyrocznią w <c6/>).

seg-662c04f0552f = <b>Scenariusz <c1/></b> (<c2/>, <c3/>): złożony, osiągalny z binarki (CLI / Python / MCP / wasm przez <c4/>) przebieg P1 bezpieczeństwa sygnału księżycowego, który łączy deficyt mocy bilansu łącza i jego pasmo czułości { "12" }–{ "18" } dB, wymaganą moc nadawczą zagłuszania/spoofingu względem odległości odstępu, orbitalny ślad przechwytu przy rzeczywistym wzorcu anteny, wynik wciągnięcia przy przechwyceniu przez spoofing w pętli śledzenia, zasięg horyzontu ciała bez atmosfery oraz bilans uwierzytelniania OSNMA/TESLA. Puste ciało odtwarza punkt odniesienia P1.

seg-a9b7ee942a23 = <b>Pasmo czułości deficytu mocy</b> (<c1/>, <c2/>): prawdziwy wieloosiowy przegląd (odniesienie × EIRP × odległość ukośna) zbudowany na <c3/> i oceniany przez <c4/>, odtwarzający pasmo P1 { "12" }–{ "18" } dB i uzgadniający wartości współczynnika liniowego { "32" }× (zaokrąglone) / { "36" }× (niezaokrąglone).

seg-0734a4ca7535 = <b>Trójwymiarowa kostka przechwycenia przez spoofing</b> (<c1/>): dodaje do mapy przechwycenia oś przesunięcia nośnej/Dopplera (J/S × przesunięcie kodu × przesunięcie nośnej, czas zaczepienia na komórkę); przekrój z zerową nośną redukuje się dokładnie do <c2/> 2-D.

seg-3b9bbc25b114 = <b>Detekcja w rzadkiej sieci monitorów</b> (<c1/>) składa teraz fizyczną statystykę AGC <c2/> i siatkę widoczności selenograficznej <c3/>, aby wyprowadzić statystykę detekcji i geometrię każdej stacji, zamiast swobodnych parametrów i doraźnego nakładania się kół wielkich; prawdopodobieństwa detekcji monitora i sieci pozostają zamkniętymi postaciami chi-kwadrat/Marcum-Q z <c4/>. <b>Pola <c5/> / <c6/> zmieniły się</b> na wielkości fizyczne (szer./dł./wysokość/moc).

seg-54c36267382c = <b>Wymiarowanie narzutu uwierzytelniania OSNMA/TESLA</b> (<c1/>): części pól OSNMA na stronę (8-bitowy HKROOT + 32-bitowy MACK na stronę { "2" } s) były błędnie oznaczone jako sumy na podramkę, co zaniżało narzut { "15" }× ({ "1.33" } bit/s). Poprawiono do opublikowanych w SIS-ICD sum na podramkę 30 s (HKROOT { "120" } + MACK { "480" } bitów ⇒ <b>{ "20" } bit/s</b>). Konsekwencja jest teraz podana uczciwie: przy szybkości danych nawigacyjnych AFS { "50" } bit/s narzut uwierzytelniania jest kosztem <b>pierwszego rzędu ≈{ "40" } %</b>, a nie pomijalnymi kilkoma procentami; pole <c2/> jest udokumentowane jako opóźnienie ujawnienia klucza (dolna granica czasu do pierwszego uwierzytelnionego rozwiązania).

seg-0cf179a34252 = Szerokie wydanie możliwości. Wprowadza dwa w pełni <b>zewnętrznie zwalidowane</b> zestawy analiz, kompletną rodzinę <b>wielokryterialnej analizy decyzyjnej (MCDA)</b> oraz estymatory <b>wędrówki Allana / stabilności zegara dla długich τ</b>, i otwiera nową uruchamialną warstwę scenariuszy: <b>księżycowy bilans czasu, ramka/EOP w czasie rzeczywistym, hybryda optyczno-RF, obserwowalność cislunarna i odporność warstwowego PNT na konflikt</b>, na wierzchu podstawy, plus podstawę możliwości dla <b>naziemnej radiolatarni księżycowej</b> i <b>bezpieczeństwa sygnału</b>. Sprawdzana maszynowo macierz walidacji rośnie do <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> w <b>{ "102" } wierszach</b> (było { "40" } · { "47" } · { "4" } w { "91" }): wszystkie jedenaście nowych wierszy to walidacje względem wyroczni zewnętrznej dla analizy decyzyjnej i estymatorów czasu, sprawdzone względem niezależnych bibliotek (SciPy, pymcdm, pyDecision, allantools) z ciasną tolerancją, podczas gdy nowa powierzchnia możliwości PNT jest uczciwie pokazana jako MODELLED. Jak zawsze, żadne twierdzenie o modelu liczbowym nie jest podnoszone bez zewnętrznego zbioru danych.

seg-267e50f8dd56 = <b>Scenariusze do uruchomienia</b>: każdy to zarejestrowany scenariusz <c1/>, wywoływany przez silnik i potwierdzany w CI od początku do końca przez <c2/> (który uruchamia każdy dołączony <c3/> i kończy się twardym błędem przy każdym fixture, którego nie da się uruchomić):

seg-c87fc11dd86b = <b>Odporność warstwowego PNT na konflikt</b> (<c1/>, <c2/>): silnik odporności Monte-Carlo z ziarnem (seed) dla wielowarstwowej architektury PNT, z modelem <b>przeżywalności przy łagodnej degradacji dla każdego wektora</b> z §{ "4.2" } (cztery nazwane wektory zagrożeń, zamknięta postać przeżywalności użytecznego PNT, do której zbiega Monte-Carlo dla każdej warstwy, emitowana w JSON wyniku) oraz udokumentowanym, pilnowanym przed dryfem pochodzeniem parametrów zagrożeń (<c3/>). Architektury MODELLED; zbieżność Monte-Carlo przeżywalności do postaci zamkniętej jest rdzeniem sprawdzonym niezależnie.

seg-9c69e4d8ade9 = <b>Obserwowalność cislunarna</b> (<c1/>, <c2/>): widmo wartości własnych gramianu obserwowalności na łuku, generator orbit wstecznych dalekich (DRO) z korekcją różnicową oraz niezależna kontrola filtrem pierwiastka informacji, której kowariancja a posteriori staje się skończona dokładnie przy pełnym rzędzie obserwowalności. Konstelacja MODELLED; niezmienniki rzędu/gramianu/STM/SRIF są rdzeniem sprawdzonym niezależnie.

seg-92fb333483e5 = <b>Heterogeniczna hybrydowa ciągłość i integralność optyczno-RF</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>): dostępność i integralność międzydziedzinowa, gdy łączy się PNT optyczne i RF. MODELLED.

seg-08e2f640ae14 = <b>Endogeniczny księżycowy bilans czasu</b> (<c1/>, <c2/>) i <b>bilans ramki / EOP w czasie rzeczywistym</b> (<c3/>, <c4/>, <c5/>): bilanse czasu księżycowego i orientacji Ziemi P3/P4 wyprowadzone endogenicznie z łańcucha synchronizacji czasu, a nie zakładane. MODELLED.

seg-52c2f9c2c9a7 = <b>Zewnętrznie zwalidowane zestawy analiz</b>: możliwości biblioteczne, każda wchodzi do macierzy jako nowe wiersze VALIDATED (sprawdzone względem niezależnej wyroczni zewnętrznej, a nie samokontroli):

seg-709789e8fb04 = <b>Pełny zestaw wielokryterialnej analizy decyzyjnej (MCDA)</b> (<c1/>): cztery rodziny metod: agregacja wartości (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), system ilorazowy (<b>MOORA</b>) i proporcjonalny (<b>COPRAS</b>), odległość od ideału (<b>TOPSIS</b>), programowanie kompromisowe (<b>VIKOR</b>) i przewyższanie (<b>PROMETHEE II</b> z sześcioma uogólnionymi kształtami kryteriów, zgodność/niezgodność <b>ELECTRE I</b>), a ponadto wagi priorytetów <b>AHP</b> z wektora własnego Perrona z bramką współczynnika spójności Saatyego (CR < { "0.10" }), użyteczność <b>MAUT</b>, wydobywanie frontu Pareto i analiza <b>wrażliwości</b> wag. Dziewięć agregatorów odtwarza <b>pymcdm</b> / <b>pyDecision</b>, a wektor własny AHP zgadza się z SciPy/LAPACK, wszystko do < { "1e-9" } (<c2/>). Tornado wrażliwości jest też dostępne w scenariuszu odporności na konflikt.

seg-2ce49cbfd8bf = <b>Estymatory wędrówki Allana i stabilności zegara dla długich τ</b> (<c1/>): <b>MTIE</b> (statystyka wędrówki błędu czasu między szczytami wg ITU-T G.810/G.823/G.8261, względem której pisane są maski synchronizacji), <b>MDEV</b> i <b>TDEV</b> jako wędrówka w dziedzinie czasu oraz estymatory o rozszerzonym zakresie <b>Theo1 / TOTVAR</b>. VALIDATED względem <b>allantools</b> na serii NIST SP { "1065" }; hybryda <b>ThéoH</b> z usuniętym obciążeniem, zbudowana na TOTVAR, pozostaje uczciwie MODELLED.

seg-68bcdf8bd5de = <b>Zestaw zapewnienia / zewnętrznej wyroczni</b> (<c1/>): zestaw wyroczni podłączony bezpośrednio do bramki rzetelności CI, rekord pochodzenia <b>W3C-PROV</b> z deterministycznym korzeniem Merkle'a oraz <b>Greenhall</b>, równoważna liczba stopni swobody + przedziały ufności chi-kwadrat dla estymat stabilności.

seg-dcb91813b24c = <b>Szew rozszerzeń PackRegistry / ExternalPack</b> (<c1/>, <c2/>): szew dyspozytora, dzięki któremu pakiety możliwości trafiają przez jeden rejestr (wbudowane wywołania są na gorącej ścieżce CLI; pakiety spoza drzewa podłączają się za domyślnym <c3/>), pilnowany przez złoty zestaw zgodności identyczności bajtowej oraz bramki CI standalone / wasm32.

seg-16b1f5d249ed = <b>Podstawa możliwości oparta na modelu</b>: nowe moduły biblioteczne zasilające powyższe scenariusze i przyszłe (jeszcze nie samodzielny scenariusz <c1/>):

seg-f8c9ffbc56cf = <b>DOP naziemnej radiolatarni księżycowej</b> (<c1/>) z bilansem osiągniętej dokładności, przeglądem liczby N satelitów i mapą GDOP, a także zaburzona efemeryda księżycowa (<c2/>) i geometria horyzontu ciała bez atmosfery / odwrotność mocy spoofingu / pasmo deficytu AFS (<c3/>, <c4/>). Wykorzystuje ponownie jądro DOP sprawdzone względem gnss_lib_py.

seg-28209a2747d5 = <b>Wczytywanie DEM w formacie LOLA</b> + widoczność bezpośrednia terenu (<c1/>).

seg-6e98ac90a0e2 = <b>Trójwarstwowa obrona bezpieczeństwa sygnału</b>: przechwycenie przez spoofing, integralność międzyczujnikowa i wymiarowanie sieci monitorów (<c1/>, <c2/>, <c3/>) z orbitalnym śladem wiązki anteny i bilansem uwierzytelniania OSNMA (<c4/>, <c5/>). MODELLED.

seg-bd5b9511accb = Macierz walidacji i każdy pochodny artefakt zostały ponownie wygenerowane z jedynego źródła prawdy (<c1/>): rejestr na stronie, diagramy mapy modułów i pochodzenia walidacji oraz ciągi liczbowe README i poszczególnych powierzchni pokazują teraz <b>{ "51" } / { "47" } / { "4" } z { "102" }</b> (było { "40" } / { "47" } / { "4" } z { "91" }); bariera rzetelności liczb skanuje teraz pełną historię git, a rysunki w README ujednolicono w ciemnej palecie marki.

seg-c2ec7e2b6296 = Jeden wspólny adaptacyjny sterownik całkowania obsługuje teraz zarówno <c1/>, jak i <c2/> (<c3/>), usuwając zduplikowany stepper.

seg-85cfb0f10268 = <b>SonarQube Cloud</b>: analiza statyczna dodana do CI (Rust + zaimportowane pokrycie), z plakietkami ocen bezpieczeństwa / łatwości utrzymania / niezawodności w README.

seg-deeef8318367 = Dyscyplina wydań i pakowania: CI rejestruje środowisko wdrożeniowe dla każdej publikacji pakietu/rejestru, a ukierunkowane zadanie publiczne standalone jest odcięte od wolnych binarek walidacyjnych.

seg-30181148b098 = Bariera higieny braku atrybucji jest ograniczona wyłącznie do znaczników autorstwa, więc wymienienie hosta integracji lub produktu nie przerywa już budowania.

seg-6eb3868fdce0 = Dokumentacja: sekcja <b>Citing</b> w README wymienia teraz cztery opublikowane preprinty arXiv, a możliwość DOP naziemnej radiolatarni jest udokumentowana w wierszu księżycowym.

seg-d12533cbf1f2 = Całkowite liczniki pętli dla pętli sterowanych liczbami zmiennoprzecinkowymi (Sonar S2193).

seg-3c213354187f = Dokładna odwrotność chi-kwadrat przy małej liczbie stopni swobody przez udoskonalenie Newtona w ścieżce przedziałów ufności zapewnienia.

seg-386b7094d34d = kshana.dev: sekcja standardów otwiera się teraz domyślnie, a zapasowa liczba w rejestrze jest poprawiona; nieaktualne ciągi README / strony wokół warstwy obserwowalności zsynchronizowano.

seg-33448f46894f = Wydanie możliwości dodające ogólną <b>warstwę obserwowalności Fishera / Cramér–Rao i optymalnego projektowania eksperymentu</b> oraz wydanie, na którym opiera się artykuł o obserwowalności PNT księżycowego. Sprawdzana maszynowo macierz walidacji rośnie do <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> w <b>{ "91" } wierszach</b> (było { "39" } · { "46" } · { "4" } w { "89" }): nowy silnik estymacji jest sprawdzony względem wyroczni zewnętrznej i jest VALIDATED; jego zastosowanie księżycowe jest uczciwie MODELLED. Jak zawsze, żadne twierdzenie o modelu liczbowym nie jest podnoszone bez zewnętrznego zbioru danych.

seg-c377207026f4 = <b><c1/>: informacja Fishera, granice Cramér–Rao i optymalne projektowanie eksperymentu.</b> Ogólny, wielokrotnego użytku silnik teorii estymacji: macierz informacji Fishera <c2/> z jakobianu pomiarów i wag; symetryczny rozwiązywacz wartości własnych (cykliczny Jacobiego); dolna granica Cramér–Rao przez odwrotność albo pseudoodwrotność Moore'a–Penrose'a plus baza przestrzeni zerowej, gdy informacja jest o niepełnym rzędzie (przypadek sieci swobodnej / defektu datum); oraz miary D-, A-, E- i T-optymalne projektowania eksperymentu z selektorem <c3/> po kandydackich geometriach. <b>VALIDATED</b> względem NumPy (<c4/>/<c5/>) i opublikowanych zamkniętych granic Kaya ({ "1993" }) do { "1e-9" } (<c6/>), więc wchodzi do macierzy jako wiersz z wyrocznią zewnętrzną, a nie samokontrola.

seg-91d09b4e737f = <b>Obserwowalność księżycowego łącznego wyznaczania orbity</b> (<c1/> w <c2/>, uwidoczniona w raporcie lunar-combination): stosuje silnik FIM/CRLB do łącznego rozwiązania orbity i zegara, aby ujawnić defekt datum bezwzględnego położenia stacji, odzyskiwanie rzędu wraz z dodawaniem stacji z bazą ziemską, osiągniętą CRLB położenia stacji oraz kondycjonowanie E-optymalne. Uczciwie <b>MODELLED</b>: silnik estymacji jest zwalidowany zewnętrznie, ale sieć księżycowa, do której go zastosowano, jest reprezentatywną symulacją, a żaden obecny zbiór danych nie może zamienić tej geometrii w pomiar.

seg-6b1cd00aca8c = <b>Reprezentatywna geometria eliptycznej księżycowej orbity zamrożonej (ELFO)</b> dla scenariusza lunar-combination (<c1/>, <c2/>, <c3/>, <c4/>; domyślnie pozostaje rozmieszczenie kołowe) oraz pole obserwowalności bez VLBI w raporcie, aby można było pokazać, że wynik defektu datum jest ogólny względem geometrii. Ta sama drabina { "3" }→{ "1" }→{ "0" } i próg trzech stacji obowiązują na ELFO rodziny Moonlight/LCNS, a przy trzech ziemskich liniach bazowych VLBI bezwzględne położenie stacji jest obserwowalne przy granicy poniżej metra, co blokuje <c5/>. Nadal MODELLED.

seg-9e6627c0c417 = Macierz walidacji i każdy wygenerowany artefakt dowodowy zostały ponownie wygenerowane z jedynego źródła prawdy (<c1/>): rejestr (<c2/>), <c3/>, <c4/>, rysunki podziału walidacji i rodzaju wyroczni oraz ciągi liczbowe README na wszystkich powierzchniach dystrybucji pokazują teraz <b>{ "40" } / { "47" } / { "4" } z { "91" }</b>.

seg-6f90233290a2 = Wydanie poprawkowe wyłącznie pakowania. Bez zmian silnika, scenariuszy ani wyników; macierz walidacji pozostaje bez zmian: { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER w { "89" } wierszach.

seg-9d41e1412d1f = Publikacja npm: pakiet <c1/> wyprowadzony z manifestu crate'a używał właściciela GitHub z błędną wielkością liter (<c2/>), co nie przeszło weryfikacji pochodzenia sigstore w npm (porównuje właściciela z uwzględnieniem wielkości liter). Manifest <c3/> ma teraz kanoniczne małe litery <c4/>, więc wygenerowany <c5/> zgadza się z podmiotem pochodzenia, a wydanie npm się publikuje.

seg-fe1f8aae99f4 = Budowanie wheela przypina <c1/>, aby wheel manylinux był odtwarzalny bajt po bajcie przy przebudowach (sprawdzenie odtwarzalności przez przebudowę i porównanie).

seg-b87075b47007 = Wydanie konsolidacyjne skupione na <b>dyscyplinie dowodów, pochodzenia i dystrybucji</b>. Sprawdzana maszynowo macierz walidacji rośnie do <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> w <b>{ "89" } wierszach</b> (było { "15" } · { "42" } · { "4" } w { "61" }), co wynika z walidacji krzyżowej możliwości modelowanych względem niezależnych wyroczni zewnętrznych. Każdy dystrybuowany artefakt ma teraz kryptograficzną atestację pochodzenia budowy SLSA, dostarcza SBOM CycloneDX i jest publikowany równolegle na wszystkich powierzchniach. Żadne twierdzenie o modelu liczbowym nie jest podnoszone bez zewnętrznego zbioru danych; nowe możliwości pozostają uczciwie MODELLED.

seg-f6de783bfd29 = <b>Dynamika orientacji</b> (<c1/>, MODELLED): równania Eulera bryły sztywnej bez momentu + kinematyka kwaternionów (RK4), z samotestami praw zachowania (norma kwaternionu, energia kinetyczna, |Iω|, precesja symetrycznego bąka).

seg-339bc18b9fc4 = <b>Walidacja krzyżowa możliwości modelowanych</b> względem niezależnych wyroczni zewnętrznych, co podnosi macierz walidacji do { "39" } wierszy VALIDATED, każdy poparty zewnętrznym zbiorem danych (bramka rzetelności CI zabrania statusu VALIDATED bez niego). Najnowsze walidacje z wyrocznią zewnętrzną: <b>zmierzona krzywa stabilności zegara optycznego</b> (dopasowanie krzywej ADEV w <c1/> odtwarza opublikowane σ_y(τ) optycznego zegara sieciowego ⁸⁸Sr Norcii i in., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, dołączone w <c2/>); <b>generowanie kodu rozpraszającego GPS L1 C/A</b> (LFSR G1/G2 w <c3/> odtwarza ósemkowe fazy kodu z tabeli 3-Ia IS-GPS-200 dla PRN { "1" }–{ "9" }); oraz <b>czytnik cyfrowego modelu terenu SRTM na rzeczywistym terenie</b> (<c4/> odczytuje dołączony kafel SRTM v3 NASA/USGS z domeny publicznej, N36W117 / Dolina Śmierci, umieszczając Badwater Basin w jego udokumentowanym paśmie pomiaru).

seg-665d0dde637b = <b>Nowe możliwości MODELLED</b>, każda sprawdzona wewnętrznie względem postaci zamkniętej lub siostrzanej ścieżki kodu: dynamika ruchu względnego Clohessy’ego–Wiltshire’a / Hilla, pasywna geolokalizacja emiterów TDOA/FDOA, wyznaczanie orientacji Wahba/TRIAD/QUEST, rozwiązywanie całkowitoliczbowej niejednoznaczności fazy nośnej GNSS (LAMBDA), celowanie w płaszczyźnie B i asysta grawitacyjna z przybliżeniem stożkowych, formowanie wiązki w macierzy antyzakłóceniowej CRPA, statystyki akwizycji GNSS w detektorze kwadratowym, niejednoznaczność prążków / zakres dynamiczny kwantowego czujnika inercyjnego, szum zegara IEEE-1139 o prawie potęgowym + podłoga flicker-FM oraz wymiana bloków kowariancji CCSDS-OEM.

seg-b3f53d5e3c3a = <b>Rejestr dowodów z jednego źródła</b> z generowaną dokumentacją weryfikacji i barierą przed dryfem; przeglądalny rejestr walidacji na kshana.dev z odnośnikami do dowodów dla poszczególnych kart.

seg-b3c0545157b3 = <b>Maszynowo czytelne metadane cytowania</b>: <c1/> (CodeMeta { "2.0" }) i <c2/>, przypięte do manifestu Cargo przez <c3/>.

seg-2ca8875da9de = <b>Pochodzenie łańcucha dostaw</b>: atestacja pochodzenia budowy SLSA dla archiwum crate'a, wheeli, sdist i archiwum npm; PyPI OIDC Trusted Publishing; SBOM CycloneDX dostarczany w wheelu i pakiecie npm; porównanie budowy odtwarzalnej i weryfikacja po wydaniu.

seg-18fdecf7f2fa = <b>Wykrywalność</b>: <c1/>, <c2/> oraz metadane Open Graph / JSON-LD na kshana.dev; generowany rysunek <c3/> wyprowadzony z macierzy.

seg-f80db0b0f545 = <b>README dla poszczególnych powierzchni</b> w crates.io / PyPI / npm z barierą rzetelności liczb.

seg-bd33b21f8f91 = <b>Wyrocznia transferu czasu Sagnaca</b> podniesiona do ExternalDataset: poprawka Sagnaca dla okrążenia równika jest teraz sprawdzana względem opublikowanej przez Ashby'ego wartości { "207.4" } ns (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, wzór { "1.29" }; odtworzone z dokładnością < { "0.05" } ns). Złożona możliwość transferu czasu pozostaje uczciwie MODELLED.

seg-882133bf1fcc = <b>Dokumentację, diagramy i rysunki odświeżono</b> do bieżącej macierzy (39/46/4/89): diagram pochodzenia walidacji, rysunek <c1/> (teraz generowany z macierzy z barierą CI przed dryfem), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, dokumenty architektury i samouczków oraz łączną liczbę w rejestrze kshana.dev.

seg-a9be3d71a52c = Przeformatowano drzewo źródeł przypiętym rustfmt (toolchain { "1.93.0" }): czysty styl, bez zmiany zachowania.

seg-4542eb4fabfc = <b>Wersjonowanie w zgodnym kroku.</b> Każda powierzchnia dystrybucji (crate, PyPI, npm, crate MCP + obraz OCI, wtyczka JetBrains) wersjonuje się teraz w kroku z silnikiem, co wymusza w CI <c1/>.

seg-792df0cdc8a7 = <b>Wtyczka JetBrains</b> przelicencjonowana na <b>AGPL-3.0-only</b> (opublikowana { "0.1.1" } nadal podawała Apache-2.0) i wyprowadza teraz wersję w Marketplace z tagu wydania.

seg-171f5649c90f = <b>Utwardzenie odporności</b>: <c1/> poza testami usunięto lub uzasadniono; <c2/> wymuszane na kodzie poza testami.

seg-0e5abb2fad02 = <b>kshana.dev</b>: gruntowna przebudowa z dowodami na pierwszym miejscu: dominujący hero, diagramy architektury i rysunki wyników, i18n, zwijane i responsywne sekcje rejestru i standardów.

seg-05ef9b9f3653 = <b>Precyzyjna efemeryda SP3</b>: stosowanie poprawki węzła rotacji Ziemi IGS podczas interpolacji.

seg-bbd0dc3dd9cb = <b>Obrazy w rejestrach</b>: README dla PyPI/crates.io/npm używają bezwzględnych adresów URL obrazów; względne ścieżki obrazów z głównego README renderowały się jako uszkodzone obrazy na stronie PyPI { "0.21.0" }. Bariera CI (<c1/>) zapobiega regresji.

seg-6d044971dbc8 = <b>CI</b>: <c1/> + <c2/> zielone; koniec z kompilowaniem względem prawdziwych danych ignorowanych przez git.

seg-c3c260b7063e = Testy

seg-5dca3defcfe3 = Kowariancja zegara Kalmana pozostaje dodatnio półokreślona i symetryczna (test własności, <c1/>).

seg-c861779f04ca = Bariery synchronizacji dokumentacji: każdy publiczny ciąg liczby walidacji, metadane cytowania, wygenerowany rysunek i adresy URL obrazów w README powierzchni są przypięte do swojego źródła prawdy.

seg-0540044c92a6 = To wydanie dodaje do otwartego silnika dwa zestawy zastosowań MODELLED: <b>demonstrator PNT z technologiami kwantowymi</b> (zaufany kwantowy transfer czasu, nawigacja kwantowa bez GNSS, kwantowa detekcja usterek/anomalii) oraz <b>zestaw PNT księżycowego / cislunarnego</b> (księżycowy czas współrzędnych, księżycowe VLBI, łączne wyznaczanie orbity i zegara, realizacja układu odniesienia, objętość usługi, różnicowe PNT, eksport interoperacyjności), każdy uruchamiany z jednego <c1/>, każdy emitujący uczciwy zapis <c2/> oraz rejestr reprezentatywności / luk do lotu. Wprowadza też <b>sześć nowych walidacji względem wyroczni zewnętrznych</b>, co podnosi sprawdzaną maszynowo macierz walidacji do <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> w jej { "61" } wierszach. Nowe liczby zastosowań są MODELLED z ilustracyjnych parametrów ze źródeł publicznych: bez TRL, doświadczenia lotnego, certyfikacji ani poparcia agencji, a ponownie używane sprawdzone niezależnie jądra są tak oznaczone.

seg-82a1822f53e2 = <b>Zestaw demonstratora PNT z technologiami kwantowymi</b> (<c1/>, <c2/>, <c3/>). Trzy uruchamialne obszary zastosowań MODELLED za silnikiem, każdy emituje <c4/> oraz zapis reprezentatywności / luk do lotu:

seg-07532f03a1f1 = <b>Zaufany kwantowy transfer czasu</b> (<c1/>): bilans optyczny zegar sieciowy + łącze fotoniczne wobec CSAC + dwukierunkowe RF, z ponownym użyciem poziomu ochrony czasu, ze wskaźnikiem jakości bezpieczeństwa wobec ataku opóźnienia/odtwarzania ({ "1" } − P_md) oraz detekcją anomalii zegara + opóźnieniem CUSUM.

seg-4c9036cffe1b = <b>Nawigacja kwantowa bez GNSS</b> (<c1/>): inercyjny dryf z interferometrem zimnych atomów wobec INS klasy nawigacyjnej w czasie przestoju GNSS, z uczciwym zastrzeżeniem, że bez zewnętrznego poprawienia pozycji bias akcelerometru pozostaje nieobserwowalny, więc błąd nadal rośnie.

seg-6188f1c6893a = <b>Kwantowa detekcja usterek / anomalii</b> (<c1/>): oznaczony katalog usterek z ROC AUC z przedziałem ufności bootstrap i minimalną wykrywalną usterką przy ustalonym wskaźniku fałszywych alarmów.

seg-9e22314b1337 = Wspólna biblioteka modeli błędów urządzeń kwantowych (<c1/>) i ujednolicony harness porównania kwantowego z klasycznym (<c2/>) stoją za wszystkimi trzema.

seg-808e20f28556 = <b>Zestaw PNT księżycowego / cislunarnego.</b> Siedem uruchamialnych <c1/> MODELLED osadzonych na rdzeniu CR3BP: <b>księżycowy czas współrzędnych</b> (świecka stopa LTC/TCL − TT, <c2/>), geodezyjna wielkość obserwowalna opóźnienia <b>księżycowego VLBI</b> (<c3/>), <b>łączny wielotechnikowy estymator wsadowy OD + zegar</b> (<c4/>), <b>realizacja układu odniesienia</b> (transformacja Helmerta o 7 parametrach + powiązanie IAU { "2015" } WGCCRE, <c5/>), analiza <b>objętości usługi klasy Moonlight / LCNS</b> (<c6/>), <b>księżycowe różnicowe PNT</b> (<c7/>) oraz <b>eksport interoperacyjności zgodny z LunaNet / IOAG</b> (CCSDS-OEM + księżycowa skala czasu w kopercie KIF, <c8/>). Wszystko MODELLED z ilustracyjnych parametrów ze źródeł publicznych; niesprawdzone względem rzeczywistego VLBI / śledzenia Gateway; bez afiliacji ani poparcia agencji.

seg-a892ce052e3c = <b>Sześć nowych walidacji względem wyroczni zewnętrznych</b> (macierz walidacji liczy teraz { "15" } wierszy sprawdzonych niezależnie):

seg-c30ae6767c6c = <b>ADEV / HDEV na rzeczywistym zegarze cezowym 5071A</b>: sprawdzone niezależnie względem punktów dekadowych Stable32 (<c1/>).

seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV na wzorcu Stable32 <c1/></b>: sprawdzone niezależnie względem opublikowanych tabel Stable32 (<c2/>).

seg-e8728f57effa = <b>ROC AUC detekcji anomalii na rzeczywistej telemetrii ESA OPS-SAT</b>: sprawdzone niezależnie względem scikit-learn (<c1/>).

seg-5446957ac631 = <b>Synteza funkcjonałów grawitacyjnych ICGEM</b>: sprawdzona niezależnie względem standardu normalnej grawitacji GRS80 (γ Somigliany do { "3.5e-12" }; mapa zaburzeń EGM2008, <c1/>).

seg-751c5ac90229 = <b>Model jonosfery nadawanej Klobuchara</b>: sprawdzony niezależnie względem RTKLIB (<c1/>).

seg-dcc6d4e04a5c = <b>Jądro detekcji RAIM</b> ({ "171" } przypadków, <c1/>) i <b>poziom ochrony SBAS DO-229E</b> na rzeczywistych danych EGNOS (fork RTKLIB SBAS-PL, <c2/>): oba sprawdzone niezależnie względem swoich wyroczni zewnętrznych.

seg-3f6c1ff0b3a4 = <b>Rejestr reprezentatywności i luk do lotu</b> (<c1/>). Ustrukturyzowany zapis emitowany przez każdy demonstrator: co jest reprezentatywne, co uproszczone i co dzieli model od lotu; uczciwy towarzysz każdego porównania MODELLED.

seg-6b4c78bdaf35 = <b>Agregacja studiów i ergonomia CLI.</b> Manifest zestawu scenariuszy z agregacją studium jednym poleceniem, stabilne co do skrótu metadane studium + <c1/>, lintowanie scenariuszy <c2/> oraz pokazywanie poziomu walidacji dla każdego wskaźnika jakości w raportach studiów.

seg-e24230b80a89 = <b>kshana.dev przeprojektowano wokół wspólnego kręgosłupa dziedzin</b>: możliwości i walidacja złożone w jeden eksplorator dziedzin ze wspólnym słownictwem, uwidocznione nowe wyspy sprawdzone niezależnie, wierna lądom animowana mapa Ziemi oraz wezwanie do zamówienia studium, a także marka i odnośniki Ashforde OÜ.

seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE zbadano pod kątem kompletności i rzetelności</b>: poprawiono nieaktualne liczby wyników sprawdzonych niezależnie (teraz { "15" } wyroczni zewnętrznych), rozszerzono diagramy oraz zacytowano preprinty o Warunkowym Poziomie Ochrony Czasu (arXiv:{ "2606.24210" }) i o luce optymizmu przy zakłóceniach RF (arXiv:{ "2606.22054" }).

seg-42a317c6ce06 = Źródła <c1/> i potok szkicu JOSS są utrzymywane w publicznym repozytorium.

seg-8ed5cf845b00 = To wydanie dodaje do otwartego silnika cztery możliwości studiów: warunkowy Poziom Ochrony Czasu, ocenę odporności PNT zgodną z ramami, ocenę luki optymizmu przy zakłóceniach RF oraz front end odbiornika programowego / rzeczywistych danych, z których każdy jest odtwarzalny jednym poleceniem i zapisuje artefakt deterministyczny co do bajta. Wszystkie studia są MODELLED (kalibracja na danych syntetycznych lub publicznych zbiorach), niosą uczciwe pochodzenie (wersja silnika, ziarna, skrót konfiguracji) i etykiety walidacji oraz nie są certyfikacjami.

seg-0c9f0c665491 = <b>Warunkowy Poziom Ochrony Czasu (<c1/>).</b> Ograniczona holdoverem granica niewykrytego błędu czasu przy spoofingu GNSS, z podłogą monitora k-sigma, wariancją dryfu van Loana na opóźnieniu detekcji i czasem do alarmu CUSUM. Skalibrowany na rzeczywistym zarejestrowanym ataku (JammerTest { "2024" }, scenariusz { "2.1.1" }) przez <c2/>, które odtwarza swoją tabelę referencyjną ze skalarów odzyskanych z publicznego nagrania (surowy zbiór danych nie jest redystrybuowany).

seg-d874d7f13f28 = <b>Ocena odporności PNT zgodna z ramami + studium niestabilności decyzji (<c1/>).</b> Model architektury, ocena zgodna z RPCF, sympleks wag Dirichleta, niestabilność Kendalla-tau i częstość odwrócenia pozycji top-1 oraz załamanie różnorodności wspólnego trybu (Hill-N2), z <c2/>. Tabela odpowiedniości w <a1><c3/></a1>.

seg-343f7af54503 = <b>Studium luki optymizmu przy zakłóceniach RF (<c1/>, <c2/>, <c3/>).</b> Panel 13 detektorów na syntetycznym korpusie ugruntowanym w parametrach, luka optymizmu między rozkładem wewnętrznym a zewnętrznym, trendy praw skalowania z zerem permutacyjnym oraz predyktor degradacji typu leave-one-out, przez <c4/>.

seg-6eed55859bbf = <b>Front end odbiornika programowego (<c1/>) i adaptery rzeczywistych danych (<c2/>).</b> Surowe IQ/IF do odczepów korelatora i SQM, plus adaptery wczytywania (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) i przykłady sond. Odczytują one nagrania dostarczone lokalnie przez użytkownika; żadne nagrania nie są zatwierdzane do repozytorium.

seg-afe2282fa771 = <b>Zatwierdzone artefakty studiów.</b> Deterministyczne co do bajta <c1/> i <c2/> są teraz śledzone w <c3/>, aby liczby studiów można było sprawdzić bez przebudowy; pozostają odtwarzalne z powyższych generatorów. Surowe zbiory danych pozostają poza repozytorium (<c4/>).

seg-450d82cddc28 = Wersja podniesiona do { "0.20.0" } w <c1/>, <c2/> i <c3/>; artefakty studium punktu przecięcia są wygenerowane ponownie, aby ich znacznik zgadzał się z wydaną wersją.

seg-a0a66af8fd14 = <b>Przelicencjonowano z Apache-2.0 na GNU AGPL-3.0-only, z licencją komercyjną dostępną od Ashforde OÜ (podwójne licencjonowanie).</b> Otwarty silnik pozostaje w pełni otwarty i publicznie weryfikowalny; sieciowy copyleft AGPL (§{ "13" }) oznacza, że zamknięta lub hostowana pochodna musi wrócić do otwartego źródła albo przyjąć licencję komercyjną. To broni sprawdzonego niezależnie rdzenia przed forkiem i zamknięciem, zachowując wiarygodność publicznego, uruchamialnego, audytowalnego silnika. Zob. <a1><c1/></a1> (AGPL) i nowy <a2><c2/></a2> (co obejmuje każda licencja i kiedy ma zastosowanie).

seg-ffa799fdb814 = <c1/> zawiera teraz tekst AGPL-3.0; nagłówki SPDX we wszystkich źródłach zaktualizowano do <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, strona internetowa oraz metadane crate'a/pakietów (<c7/>, <c8/>, <c9/>, crate MCP + obraz) zostały odpowiednio zaktualizowane.

seg-8d67aba2af0b = <b>Warunki dla współtwórców</b> (<a1><c1/></a1>) licencjonują teraz wkład przychodzący na AGPL <b>i</b> dają Ashforde OÜ prawo do włączania wkładów do wydania licencjonowanego komercyjnie, dzięki czemu podwójna licencja nadal działa.

seg-93644d1c1420 = <b>Polityka zależności bez zmian, ale uzasadniona na nowo</b> (<a1><c1/></a1>, <c2/>): zależności pozostają permisywne (Apache/MIT/BSD/ISC). AGPL jest dozwolona tylko dla własnego crate'a kshana; <em>zależność</em> typu copyleft zainfekowałaby wydanie komercyjne i zepsuła podwójne licencjonowanie.

seg-9b77c2d36241 = <b>Uwaga dla dalszych użytkowników:</b> to przelicencjonowanie na copyleft. Użytkownicy, którzy polegali na permisywnych warunkach Apache-2.0, mogą nadal używać ostatniego wydania na Apache-2.0 (<c1/> i wcześniejsze, jak opublikowano); od <c2/> w górę obowiązuje AGPL-3.0 / licencja komercyjna.

seg-51e32f15b7ea = <b>Podniesiono <c1/> { "0.24" } → { "0.29" }</b>, aby usunąć RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) ze skanów zewnętrznych OSV/zależności. Oba to ostrzeżenia <em>na poziomie funkcji</em>, których dotknięte funkcje (<c2/>/<c3/>, <c4/>) Kshana nigdy nie wywołuje, a <c5/> jest zależnością opcjonalną (funkcja <c6/>), więc rzeczywiste narażenie wynosiło zero, ale podniesienie utrzymuje czysty skan dla audytorów dalej w łańcuchu. Zmigrowano <c7/> do API pyo3 { "0.29" } (typ zwracany Bound dla <c8/>; jawne <c9/> na pyclass <c10/>). Wszystkie { "11" } testów wiązania Pythona przechodzą na przebudowanym rozszerzeniu.

seg-8d9332df5c74 = <b>Jedenaście nowych uruchamialnych rodzajów scenariuszy: demonstratory dla dwóch przetargów, most interoperacyjności CCSDS oraz zestaw analizy misji pierwszego rzędu / środowiska (wszystkie MODELLED, addytywne; istniejące złote wzorce odtwarzalności bez zmian).</b> Każdy można wywołać z CLI / Pythona / WASM / MCP, ma <c1/> i niesie jawną etykietę MODELLED w JSON wyniku i jednolinijkowym podsumowaniu (test dla każdego rodzaju w <c2/> stwierdza, że etykieta jest obecna i że wynik nigdy nie zawiera ciągu <c3/>):

seg-20b74caf58cc = <c1/> (<c2/>): stanowisko oceny uczenia maszynowego do wykrywania zakłóceń RF: oznaczony korpus <b>syntetyczny</b> + niezależny od detektora harness <b>ROC/AUC</b> + raport <b>luki optymizmu</b> między rozkładem wewnętrznym a zewnętrznym (tylko charakterystyki operacyjne, nigdy dane terenowe/IQ).

seg-0253656a0ecf = <c1/> (<c2/>): porównanie PNT kwantowego z klasycznym ze wczytywaniem zmierzonego ADEV i obwiednią odporności bez GNSS.

seg-901bd713bd62 = <c1/> (<c2/>): wskaźniki słoneczne/geomagnetyczne (tabela IAGA Kp↔ap, dzienne Ap, centrowane 81-dniowe F10.7a), temperatura egzosferyczna <b>Jacchia-71</b> oraz sprzężenie gęstości termosfery sterowane aktywnością nad statyczną atmosferą (NIE jest to model gęstości bezwzględnej NRLMSISE).

seg-2323b43c0ffc = <c1/> (<c2/>): import <b>CCSDS { "502.0" } OEM</b> + most w obie strony dla efemeryd GMAT / Orekit / STK (czytnik <c3/>, dokładna odwrotność zapisu).

seg-188aeb3e8219 = <c1/> (<c2/>): <b>azymut startu</b> dla dwóch ciał (<c3/>), Δv zmiany płaszczyzny, bonus rotacji miejsca i geometria dziennych okazji.

seg-6200a47276e6 = <c1/> (<c2/>): korytarz balistycznego wejścia w atmosferę <b>Allena-Eggersa</b>: szczytowe opóźnienie, prędkości szczytowego g i szczytowego nagrzewania, wysokość szczytowego g.

seg-0874c2241748 = <c1/> (<c2/>): geometria <b>pasa / GSD / dostępu / ponownego przeglądu</b> EO (trójkąt kosmiczny SMAD).

seg-83c7588ff074 = <c1/> (<c2/>): kodowanie/dekodowanie nagłówka głównego <b>CCSDS 133.0-B Space Packet</b> z obiegiem w obie strony dokładnym co do bitu.

seg-ae1bcad02880 = <c1/> (<c2/>): <b>moment grawitacyjno-gradientowy</b> 3-DOF + <b>bilans błędu wskazywania RSS</b> (skalarny bilans przed sprzętem, nie pętla sterowania).

seg-65f59cc12e02 = <c1/> (<c2/>): <b>przewidywanie przelotów nad stacją naziemną</b> (AOS/TCA/LOS, maksymalna elewacja, dostęp).

seg-178776497627 = <c1/> (<c2/>): jednokierunkowe równanie łącza <b>CCSDS-401 / DSN-810-005</b> (<c3/>, FSPL / Eb·N₀ / zapas / domknięcie).

seg-e7fee32a00f5 = <b>17-stanowy hybrydowy kwantowo-klasyczny ściśle sprzężony UKF, udostępniony jako scenariusz do uruchomienia (MODELLED).</b> Nowy rodzaj scenariusza <c1/> (<c2/>, <c3/>), który zamienia dotąd dostępny tylko przez API 17-stanowy ściśle sprzężony filtr nieśladowy GNSS/INS (<c4/>) w scenariusz, który mogą wywoływać wiązania CLI/Python/WASM/MCP. 17-stanowy wektor błędu to <b>{ "15" } stanów błędu INS</b> (położenie, prędkość, błąd ustawienia orientacji, bias akcelerometru + żyroskopu) rozszerzonych o <b>poprawkę biasu akcelerometru z CAI</b>: interferometr zimnych atomów (<c5/>) wyznacza podłogę przypadkowego błądzenia prędkości <c6/>, więc długoterminowy dryf jest ograniczony przez czujnik kwantowy, oraz o <b>2-stanowy zegar fazy + częstotliwości</b>, którego szum procesu pochodzi z <b>silnika zegara z parametrami q</b> (<c7/>, odwzorowującego profil odchylenia Allana zegara na PSD <c8/>/<c9/>, przeskalowane do jednostek odległości). Platforma jest wspomagana GNSS w fazie wstępnej (filtr uczy się biasów, prędkości i zegara), po czym dryfuje przez przestój GNSS tylko na IMU CAI + zegarze, więc przebieg pokazuje hybrydyzację <b>klasycznego IMU w krótkim okresie + kwantowego w długim</b>. Wskaźnikiem jakości jest <b>samospójność filtra</b>: zbiorcze <b>NEES</b> (Normalised Estimation Error Squared, na szacowalnym podzbiorze położenie/prędkość/zegar) i <b>NIS bieli innowacji</b> (Normalised Innovation Squared) na zespole Monte-Carlo, sprawdzone względem ich pasm χ² { "95" }% (Bar-Shalom §{ "5.4" }). Dopasowany filtr mieści się w pasmach; celowo źle nastrojony filtr (pokrętła <c10/> / <c11/>) jest oznaczany: obiektywnie sprawdzalna, rozróżniająca bramka, a nie pieczątka. <b>Kontrola NEES/bieli innowacji jest WYROCZNIĄ STATYSTYCZNĄ: stwierdzeniem samospójności (raportowana kowariancja filtra uczciwie odpowiada rozrzutowi jego własnych błędów przy modelowanym szumie), a NIE gwarancją dokładności w świecie rzeczywistym.</b> Uczciwy zakres: wszystko jest <b>obliczone na podstawie modelu / symulacja</b>: wejścia CAI i zegara to ujęte w granice wartości reprezentatywne dla literatury, a nie zmierzony sprzęt; sprzęt CAI i jego Key-Person pozostają po stronie partnera; nic tu nie sugeruje TRL > { "3" }, doświadczenia lotnego ani zewnętrznej walidacji (JSON wyniku i jednolinijkowe podsumowanie niosą te etykiety jawnie). Pojedyncza trajektoria o stałej prędkości i poziomym locie czyni stany orientacji i biasów IMU obserwowalnymi tylko słabo, więc NEES jest oceniane na { "8" } szacowalnych stanach; trajektoria z manewrami dla pełnej obserwowalności 17 stanów jest w planie. Dodaje też instrumentację spójności <c12/> (zwraca NIS dla każdej aktualizacji) i <c13/>. Wszystkie istniejące scenariusze pozostają nietknięte (addytywnie; złote wzorce odtwarzalności bez zmian).

seg-9b55f4ac5053 = <b>Sekwencyjna (rekurencyjna) nawigacja odniesiona do terenu: SITAN jako filtr bieżący.</b> Nowy rodzaj scenariusza <c1/> (<c2/>, <c3/>), który uruchamia istniejący model pomiaru wysokościomierz–DEM <b>epoka po epoce</b> przez silnik SIR <c4/>, zamiast wsadowego przeszukiwania od grubego do drobnego, którego <c5/> używa do odzyskania pojedynczego <em>stałego</em> przesunięcia INS. W każdym punkcie trasy chmura jest propagowana o przyrost raportowany przez INS (sam zepsuty przez wzrost dryfu na krok), ponownie ważona dopasowaniem do terenu i próbkowana ponownie przy degeneracji, więc <b>zmienny w czasie</b> dryf INS jest <em>śledzony</em> wzdłuż trasy, czego dopasowanie stałego przesunięcia strukturalnie nie potrafi. Na syntetycznym DEM estymata rekurencyjna pozostaje ograniczona i ponownie zbiega (końcowo ≈ { "70" } m), podczas gdy nieobsługiwane rozwiązanie inercyjne rozbiega się bez ograniczenia do ≈ { "5" } km; błąd w każdej epoce podąża za wyrazistością terenu (dryfuje na obciążonym INS nad płaskimi siodłami i ponownie się zaczepia nad wyrazistą rzeźbą), a monitor efektywnej liczby próbek potwierdza zdrową chmurę. Uczciwy zakres: mapa jest <b>znana i stała</b>, to rekurencyjna <em>lokalizacja</em> względem zapisanego DEM (lokalizacyjna połowa SLAM terenu), a nie łączne estymowanie mapy; nieokrężne z konstrukcji (wstrzyknięta rampa dryfu jest niezależną prawdą). Wszystkie istniejące scenariusze pozostają nietknięte (addytywnie; złote wzorce odtwarzalności bez zmian).

seg-87ba3bc926fa = <b>Rdzeń odporności bez GNSS + wycinki demonstratora FutureNAV</b> (<c1/> oraz podstawy obwiedni odporności w <c2/>, <c3/>, <c4/>, <c5/>, z wycinkami weryfikacji FutureNAV w <c6/>). Składa elementy składowe alternatywnego PNT (holdover zegara, śledzenie sygnału, dryf inercyjny, teren) w jedną narrację odporności na przestój GNSS. MODELLED; addytywnie.

seg-071bb6654f24 = <b>Kshana Interchange Format (KIF): wersjonowana, samoopisująca się koperta artefaktu</b> (<c1/>). Opakowanie z tagiem schematu wokół wyników scenariuszy, aby zapisany artefakt niósł ze sobą swój rodzaj, wersję schematu i etykiety MODELLED/VALIDATED, a starsze koperty pozostawały odczytywalne z zachowaniem zgodności w przód. Addytywnie; istniejący JSON wyniku bez zmian.

seg-07147766ab22 = <b>Modulacja / śledzenie sygnału nawigacyjnego + korektor różnicowy halo/NRHO w CR3BP</b> (<c1/>, <c2/>). Model modulacji i śledzenia sygnału nawigacyjnego pierwszego rzędu oraz korektor różnicowy kołowego ograniczonego problemu trzech ciał dla orbit halo / prawie prostoliniowych orbit halo, udostępnione na istniejącej osi możliwości głębokiej przestrzeni. MODELLED.

seg-d0d2366e3351 = <b>Tryb oceny przesunięcia rozkładu + pokrętło skali dotkliwości korpusu dla <c1/></b> (<c2/>). Dodaje jawny podział na rozkład wewnętrzny i zewnętrzny oraz regulowaną skalę dotkliwości korpusu do harnessu luki optymizmu ROC/AUC (tylko charakterystyki operacyjne, nigdy dane terenowe/IQ).

seg-9bb8ee93e70b = <b>Zwrot z inwestycji na pokrycie + odwzorowanie wpływu niewykrycia na integralność</b> (<c1/>, <c2/>). Soczewka ROI inżynierii oszczędnej (koszt na jednostkę pokrycia) i odwzorowanie częstości niewykryć na wpływ na integralność. MODELLED; addytywnie.

seg-55f8ba5b52ee = <b>Arkusz parametrów modelu błędów interferometru zimnych atomów (CAI) z cytowaniami</b> (<c1/>). Oparty na literaturze, ujęty w granice arkusz parametrów modelu inercyjnego CAI: wejścia są <b>cytowane, a nie ze zmierzonego sprzętu</b> (bez deklaracji TRL / lotu); zasila podłogę przypadkowego błądzenia prędkości <c2/>.

seg-cfbff4acc64c = Zarządzanie projektem.

seg-982f9ea3eee8 = <c1/> dokumentuje model decyzyjny i granicę otwarte/zamknięte; wiersz społeczności/zarządzania w mapie możliwości przechodzi <c2/>, aby to odzwierciedlić.

seg-c9ff6a7183eb = <b>Poziom ochrony integralności ARAIM: nominalny bias (<c1/>) i σ_URA są teraz stosowane.</b> Poziom ochrony MHSS odejmuje teraz jednostronną projekcję nominalnego biasu <c2/> dla każdego trybu usterki i używa sigmy <b>integralności</b> σ_URA (odrębnej od sigmy <b>dokładności</b> σ_URE) niesionej w Integrity Support Message. To czyni poziom ochrony bardziej zachowawczym i poprawnym względem standardów, a zatem <b>zmienia wartości PL raportowane przez istniejące scenariusze integralności</b>. ISM/scenariusz zyskuje pola <c3/> <c4/> / <c5/>, więc dane wejściowe, które ich nie ustawiają, zachowują dotychczasowe zachowanie. Zob. <c6/> dla przywróconego wzoru <c7/> i uczciwej uwagi implementacyjnej.

seg-c408f8944ac6 = Spójność χ² monitora spoofingu.

seg-92e2b5c5458c = <c1/> używa teraz wspólnej ścieżki odwrotności χ² <c2/>, co usuwa drugą rozbieżną implementację χ², więc RAIM i monitor spoofingu w parytecie zgadzają się co do swoich progów.

seg-6d424034e500 = <b><c1/> podłączono do dyspozytora CLI.</b> Scenariusz był wcześniej osiągalny tylko przez API; teraz jest wywoływany jako <c2/> jak każdy inny scenariusz.

seg-62c3efb54991 = <b>Dokumentacja i dokładność liczników.</b> Liczby rodzajów scenariuszy w README są teraz przypięte do <c1/> przez test <c2/>, więc udokumentowana liczba nie może już rozjechać się z dyspozytorem.

seg-5f0f497aa643 = <b>PNT dla kosmosu głębokiego i Marsa — otwarty silnik nawigacji radiometrycznej oraz symulacja GSE.</b> Nowa, w pełni addytywna oś możliwości dobudowana na sprawdzonym względem wzorców rdzeniu ziemskim (każdy istniejący scenariusz ziemski jest <b>identyczny co do bajtu</b> — wzorce odtwarzalności przechodzą bez zmian i bez ponownego generowania). Dodaje: rdzeń dynamiki wielociałowej (<c1/> z tesseralnym polem grawitacyjnym Marsa GMM-3, układem związanym z ciałem Marsa wg IAU, wymiennym złączem <c2/>, dwuczęściowymi datami juliańskimi z dokładnością poniżej mikrosekundy oraz TT↔TDB); obserwable radiometryczne (iteracyjny czas przelotu światła i opóźnienie Shapiro, dwu-, jedno- i trójdrogowy Doppler oraz odległość przez rozwiązanie dwuodcinkowe Moyera, spójne zawracanie transpondera, pomiar odległości regeneracyjny/PN wg CCSDS { "414" }, Δ-DOR wg CCSDS { "506" }, media: plazma słoneczna, troposfera i jonosfera); parsowanie i emisję CCSDS-TDM ({ "503" }); filtr informacyjny w postaci pierwiastka o zredukowanej dynamice z empirycznymi przyspieszeniami RTN, trójstanowym zegarem pokładowym i modelem oporu Marsa; łączony estymator fuzji jednokierunkowej i dwukierunkowej; powierzchnię scenariuszy <c3/> (konstelacja przekaźników oraz LMO/transfer/powierzchnia) w CLI, Pythonie, WASM, MCP i playground; a także kompleksowy symulator osiągów GSE (geometria → bilans łącza → obserwable → SRIF → kowariancja). <b>Poziom walidacji — zwalidowany symulacyjnie:</b> syntetyczne wyznaczanie orbity w zamkniętej pętli (Mars-LMO ≈ { "0.2" } m) i analityczna samospójność, przy czym dynamika Marsa względem Słońca została niezależnie skontrolowana względem JPL <b>DE440</b> (<c4/>, bramkowane jądrem: { "137" } m przy łuku 1-dobowym, uczciwa pozostałość niemodelowanego efektu n ciał). Podawane dokładności dla kosmosu głębokiego to <b>symulacyjne wskaźniki jakości oparte na kowariancji</b>, a nie wyniki rzeczywistych misji; walidacja na rzeczywistych danych śledzenia DSN/ESTRACK pozostaje w planie rozwoju. ANISE (MPL-2.0, edycja 2024) jest ograniczone do wyłączonego z przestrzeni roboczej crate'a kontroli krzyżowej, więc bramka licencyjna <c5/> i zadanie MSRV-1.75 pozostają nietknięte.

seg-2ab34100a2d7 = <b>Ślady na powierzchni z dokładnością agencji na podstawie rzeczywistej orientacji Ziemi wg IERS.</b> Scenariusz <c1/> przyjmuje opcjonalne pole <c2/> — wstawioną treść rzeczywistego pliku IERS <c3/> — i redukuje ślad na powierzchni przez UT1−UTC oraz ruch bieguna dla każdej epoki, interpolowane z tego pliku (tym samym <c4/>, którego używa <c5/>), zastępując nominalne skalary <c6/>/<c7/>/<c8/>. Dane podróżują wraz ze scenariuszem, więc przebieg pozostaje odtwarzalny i nie wymaga systemu plików (działa w playground WASM). Flaga <c9/> wkłada rzeczywisty plik do scenariusza z poziomu CLI. Usuwa asymetrię, w której rzeczywiste dane orientacji Ziemi wykorzystywał tylko <c10/>.

seg-e778245e7d8f = <b>Spójność układów w prędkości zmian odległości.</b> Stacja naziemna jest teraz odwzorowywana w układ inercjalny przez dokładną odwrotność redukcji satelity (<c1/>, cofającą ruch bieguna <em>oraz</em> rotację gwiazdową), a nie przez rotację GMST ślepą na ruch bieguna, więc oba końce współdzielą jeden układ. Wpływ na raportowany Doppler leży poniżej progu walidacji, ale usuwa to rzeczywistą niezgodność układów i przesadne twierdzenie „dokładnie” w źródle.

seg-3b912d8a819d = <b><c1/> jest walidowane.</b> Zerowa lub nieskończona/niefinitna częstotliwość nośnej zwraca teraz błąd zamiast po cichu dawać zerowy Doppler (powodowała nieskończoną λ = c/nośna), zgodnie z istniejącą kontrolą <c2/>.

seg-7d70317ca717 = <b>Walidacja modelu sił przez dopasowanie efemeryd, sprawdzona krzyżowo względem rzeczywistych produktów agencji.</b> Nowy wsadowy estymator najmniejszych kwadratów (<c1/>) z wariacyjną macierzą przejścia stanu i edycją wartości odstających, napędzany pełnym modelem sił (<c2/>: geopotencjał EGM2008, ciała trzecie, pływy stałe, oceaniczne i atmosferyczne oraz empiryczne przyspieszenia CPR/2-na-obrót), zasilany parserem rzeczywistych danych orientacji Ziemi IERS <c3/>. Sprawdzone względem opublikowanych orbit referencyjnych: <b>Galileo MEO do { "13" } cm po dopasowaniu</b>, ESA <b>Swarm-A LEO</b> oraz <b>LRO księżycowy</b> (selenocentryczny, grawitacja GRAIL, układ ciała wg IAU-2015 — o zredukowanej dynamice { "6.6" } m, uczciwie powyżej celu { "5" } m na otwartej ścieżce; ścieżka klasy DE ANISE/DE440, która go osiąga, to crate wyłączony z przestrzeni roboczej).

seg-bf88a3eb4733 = <b>Scenariusz <c1/></b> — zintegrowany wielowarstwowy detektor spoofingu łączący parzystość RAIM dla każdej epoki, monitory AGC i jakości sygnału (SQM) oraz decyzję fuzyjną, sprawdzony względem opublikowanych parametrów scenariusza <b>TEXBAT</b> (Humphreys i in., ION GNSS { "2012" }), w tym trudnego przypadku z wyrównaniem nośnej.

seg-976036ba124b = <b>Scenariusz <c1/> — stan, układy odniesienia, ślad na powierzchni i Doppler.</b> Propaguje jednego satelitę (TLE→SGP4 lub orbita analityczna) i dla każdego kroku podaje inercjalny stan TEME i GCRS (<b>położenie <em>i</em> prędkość</b>), położenie ITRF/ECEF związane z Ziemią, <b>ślad na powierzchni</b> punktu podsatelitarnego w WGS-84 (szerokość / długość / wysokość) oraz topocentryczny azymut / elewację / odległość wraz z prędkością zmian odległości i <b>Dopplerem</b> ze stacji naziemnej. Dostępny z CLI, Pythona, WASM i serwera MCP oraz dostarczany jako <b>zestaw „Ground track”</b> w webowym playground, gdzie ślad jest rysowany <b>na rzeczywistej mapie świata</b> (linie brzegowe Natural Earth { "1" }:110m, wbudowane — bez sieci i zewnętrznych zależności).

seg-761c95f2ede5 = <b>Eksport CCSDS OEM</b> (<c1/> / <c2/>) — Orbit Ephemeris Message z prędkością, używany przez GMAT / Orekit / STK, na równi z istniejącymi eksporterami SP3 i OMM.

seg-111b0896fdd4 = <b>Pływy Ziemi: stałe, oceaniczne (FES2004) i atmosferyczne (Ray { "2001" } S2)</b> na geopotencjale (IERS Conventions rozdz. { "6" }), podłączone do modelu sił.

seg-7e392131261a = <b>Koła ARM64</b> — kompilacja PyPI tworzy teraz także koła Linux aarch64 (manylinux_2_28), macOS arm64 i Windows arm64.

seg-7cc04ea3362b = <b>Rozszerzony raport techniczny (preprint)</b> podlinkowany z README oraz artykuł JOSS przygotowany do zgłoszenia (ORCID autora, kompilowany do PDF w CI przy każdej zmianie).

seg-3b1e95acc728 = <b>Układy odniesienia sprawdzone z dokładnością do milimetra względem opublikowanych wektorów Vallado.</b> Redukcja TEME→PEF/ITRF, pełny łańcuch CIO IAU 2006/2000A GCRS→ITRS oraz konwersja ECEF→geodezyjne WGS-84 są teraz przypięte do przykładu opracowanego w Vallado i in. (AIAA 2006-6753) wraz z jego EOP wg IERS, a nie tylko do wewnętrznej samospójności.

seg-fd9818877a6c = <b>Niezależne kontrole krzyżowe skal czasu.</b> ERA i skale UTC/TAI/TT zgadzają się z <c1/> do < { "1" } µs, a efemerydy planet DE440 zgadzają się z JPL Horizons (geocentryczne położenia Księżyca i Słońca) — obie kontrole jako zawsze włączone bramki CI.

seg-75aeec4cd6d0 = Webowy playground ukrywa kartę wskaźników jakości, gdy wynik nie zawiera wierszy wskaźników jakości, więc pakiety wyłącznie z wykresem (efemerydy, RAIM, spoofing) otwierają się na swoim wykresie — dla efemeryd na śladzie na powierzchni — zamiast na pustej tabeli.

seg-b8ab0cc3ce7f = Prowadzone suwaki playground <b>i przegląd parametru działają teraz dla scenariusza efemeryd / śladu na powierzchni</b>: jego pokrętła (szerokość / długość stacji, krok czasu, czas trwania, UT1−UTC) można stroić, a przegląd może wykreślać geometrię przelotu (maksymalna elewacja, szczytowy Doppler, wysokość, prędkość) względem dowolnego z nich — np. maksymalną elewację względem szerokości stacji. Karta Sweep jest teraz pokazywana tylko wtedy, gdy scenariusz rzeczywiście można przeglądać, więc żaden pakiet nie oferuje kontrolki, która nic nie wykreśla.

seg-9e7a37e51940 = Udokumentowano przybliżenie SGP4 <c1/> w miejscu wywołania GMST (błąd rotacji ≤ ~{ "13" }″, dobrze w granicach własnego błędu modelu SGP4) i odświeżono <c2/>.

seg-174a75e840b0 = Wtyczka JetBrains <b>Kshana — PNT simulator</b> jest już opublikowana i zatwierdzona w <a1>JetBrains Marketplace</a1>. README, <c1/> i dokumentacja dystrybucji odsyłają do niej bezpośrednio.

seg-4deaf7918fff = <b>Publikacja w rejestrze MCP</b> już się udaje: <c1/> <c2/> przekraczał limit 100 znaków rejestru (HTTP { "422" }). Skrócono go oraz ujednolicono nazwę serwera (i etykietę własności obrazu) z kanoniczną przestrzenią nazw <c3/>.

seg-1408961042a1 = <b>Publikacja w JetBrains Marketplace</b> już się udaje: CI ponownie przesyłało tę samą wersję wtyczki, która została wystawiona ręcznie, a Marketplace to odrzuca. Wersja wtyczki została podniesiona do <c1/>, a zabezpieczenie idempotencji traktuje teraz odpowiedź „already contains version” także jako bezskuteczne, lecz udane wywołanie.

seg-74e8cab2f10e = <b>Unieważnianie pamięci podręcznej <c1/></b>: opatrzone wersją ciągi zapytań <c2/>/<c3/> śledzą wydanie, więc powracający odwiedzający zawsze dostają bieżącą kompilację.

seg-65949229eed7 = <b><c1/> — Kshana jako serwer Model Context Protocol (MCP)</b> (<c2/>). Samodzielny crate wyłączony z przestrzeni roboczej (SDK <c3/> ma edycję { "2024" }), który udostępnia sprawdzony silnik agentom AI i asystentom — Cursor, JetBrains AI Assistant / Junie i każdemu klientowi MCP — przez stdio. Narzędzia: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, każde jako cienka nakładka na <c9/>.

seg-bd792f66363c = <b>Wtyczka do IDE JetBrains</b> (<c1/>). Kliknij prawym przyciskiem scenariusz <c2/> → <b>Run Kshana Scenario</b>; wskaźniki jakości i JSON wyniku płyną do okna narzędzia Kshana. Czysta platformowa wtyczka w Kotlinie, zgodna z każdym IDE JetBrains { "2024.3" }+.

seg-755358390517 = <b>Publiczna dystrybucja i automatyczna publikacja przy każdym wydaniu</b> dla obu:

seg-14fc2fd73553 = <c1/> do <b>crates.io</b> (<c2/>) przez <c3/>.

seg-2b39bbfc0581 = <c1/> jako wieloarchitekturowy <b>obraz OCI</b> w <c2/> (<c3/>) przez nowy <c4/>.

seg-c824d1532eb6 = <c1/> do <b>oficjalnego rejestru MCP</b> przez GitHub OIDC (zero sekretów); wpis rejestru (<c2/>) używa typu pakietu OCI z właścicielem weryfikowanym etykietą.

seg-f90da0c61aac = wtyczka do IDE do <b>JetBrains Marketplace</b> przez <c1/> (bramkowane tokenem, opcjonalne podpisanie przez programistę) przy każdym tagu wydania.

seg-21d7457dad23 = <b>Niezależna walidacja krzyżowa układów odniesienia ANISE/SPICE</b> (<c1/>). Samodzielny crate wyłączony z przestrzeni roboczej porównuje redukcję CIO IAU 2006/2000A w <c2/> (<c3/>, GCRS→ITRS) z <b>ANISE</b> (czysto rustową reimplementacją NAIF/SPICE) obracającym GCRF→ITRF93 z <c4/> z JPL, przy czym <b>te same parametry orientacji Ziemi IERS <c5/> trafiają do obu stron</b>, na ośmiu kwartalnych epokach { "2020" }–{ "2023" }. Dwie niezależne realizacje układu zgadzają się do <b>maksymalnego względnego obrotu { "0.028" }″ — ≤ { "0.86" } m na ziemi, ≤ { "0.93" } m na LEO, ≤ { "3.6" } m na orbicie GNSS</b>, co spełnia dawną kontrolę krzyżową układów z ROADMAP „< { "10" } m” z dużym zapasem (uzupełnia istniejące kotwice SOFA/ERFA zgodne co do bitu, a nie je zastępuje). Crate jest izolowany, ponieważ <c6/> + <c7/> mają licencję MPL-2.0 / edycję 2024 i nigdy nie mogą trafić do opublikowanego grafu zależności <c8/>, jego <c9/>, bramki licencyjnej <c10/> ani kompilacji MSRV; ANISE jest przypięte z <c11/>. Zawiera binarkę <c12/> (pobiera ~{ "5" } MB BPC, drukuje tabelę, zapisuje <c13/>), bramkę testową samoczynnie pomijającą brak jądra/sieci oraz opcjonalne zadanie CI wyłącznie <c14/> (nigdy nie blokuje <c15/>). Udokumentowane w <c16/> (wiersz CIO) i <c17/>.

seg-eb45b43dacc2 = <b>Playground przyjazny urządzeniom mobilnym.</b> Naprawiono poziome przepełnienie <c1/> playground na telefonach (element siatki CSS z domyślnym <c2/> był renderowany o ~{ "100" } px szerzej niż okno) przez <c3/> i kontrolki z ograniczoną szerokością; sprawdzono czysto przy { "360" } / { "390" } / { "414" } / { "768" } px. Wyrównano przyciski akcji „Pin to compare” / „Download report” (równe pola marginesów w rzędzie flex). Powiększono przyciski uruchamiania, suwaki, listy wyboru i linki nawigacji do minimum celu dotykowego ~{ "44" } px wg WCAG { "2.5.5" } / Apple-HIG na telefonach i urządzeniach dotykowych, bez zmiany rozmiarów na pulpicie.

seg-fe5095d5e61f = <b>Utwardzenie odporności po przejściu wrogiego testu bojowego.</b> ({ "1" }) <c1/> odrzuca teraz niefinitną elewację/azymut/wariancję oraz ujemne lub niefinitne przekątne kowariancji (niemal osobliwa geometria przeskalowana małym σ mogła wcześniej ominąć bramkę bezwzględnego elementu osiowego i zwrócić NaN VPL / absurdalny HPL jako <em>poprawny</em> <c2/> — cichą awarię integralności). ({ "2" }) Propagator numeryczny (<c3/>/<c4/>) kończy się bezpiecznym błędem przy niefinitnym stanie początkowym zamiast kręcić adaptacyjny kontroler bez końca. ({ "3" }) Pomocnik komórki DEM nie powoduje już paniki na siatce z pojedynczą próbką ({ "1" }×N). ({ "4" }) Azymut <c5/> jest utrzymywany ściśle w <c6/>. ({ "5" }) <c7/> odrzuca niefizyczne (NaN / niedodatnie) <c8/>/promień.

seg-9ca339d8977a = <b>Binarka <c1/> i artefakt wydania</b>: generator bez zależności, który tworzy jednostronicowe, gotowe do druku podsumowanie walidacji w HTML, indeksujące każdą walidację egzekwowaną w CI (SGP4 666/666, EGM2008, układy zgodne co do bitu, Allan wg NIST, arkusze danych IMU, ARAIM/SBAS, odtwarzalność na 3 systemach, pokrycie) z jej testem i zewnętrzną wyrocznią. Workflow wydania generuje <c2/> i dołącza go (wraz z proweniencją SLSA) do każdego otagowanego wydania.

seg-bd231d07658f = <b>pytest współpracy z numpy i utwardzenie kół</b>: <c1/> (uruchamiany w CI) oraz przypięty kontener manylinux i krok weryfikacji <c2/> w kompilacji kół.

seg-5427cae6fc39 = <b>Samouczki i edukacja</b>: <c1/> (trzy opracowane samouczki, opatrzone adnotacjami scenariusze dla każdej dziedziny, ćwiczenia poziomów 1/2/3) z <c2/> przypinającym każdą przytoczoną liczbę do bieżącego wyniku silnika.

seg-2fad9124c5a6 = <b>Artefakty zgłoszeń zewnętrznych</b> (<c1/>, <c2/>, <c3/>): szkic artykułu JOSS, notatnik kwantowy kontra klasyczny oraz gotowe zestawy do zgłoszenia do awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, a także <c4/> — przygotowanie zewnętrznych kroków zgłoszenia.

seg-0f88f8bccbc1 = <b>Nawigacja alt-PNT odniesiona do terenu i łączona</b> (moduł <c1/>): nawigator dopasowania terenu TERCOM/SITAN na DEM (loader <c2/> i generator syntetycznych danych testowych) oraz łączony nawigator grawitacyjno-magnetyczny (IGRF) i terenowy dla środowisk bez GPS, udostępniony jako rodzaje scenariuszy <c3/> i <c4/>. Sprawdzony przez zbieżność dopasowania terenu (odzyskano znane wstrzyknięte przesunięcie) oraz ograniczony błąd filtra łączonego w oknie bez GPS.

seg-bd01ec72fa2a = <b>Geometria LunaNet LANS</b> (<c1/>): nazwane księżycowe miejsca na powierzchni (Apollo 11/15/16, krawędź Shackleton) z autorytatywnymi współrzędnymi selenograficznymi, powierzchniowe kąty widzenia (az/el/odległość), widoczność/pokrycie i DOP miejsca, sprawdzone względem promienia Księżyca, opublikowanych współrzędnych miejsc oraz tożsamości elewacji { "90" }° dla położenia radialnie nad głową.

seg-2dad9cf59ea9 = <b>Prowadzony playground w przeglądarce</b>: suwaki trybu prowadzonego, panel wyników z kartami, nakładka wycieczki przy pierwszym uruchomieniu, tryby przeglądu parametru i nakładania wielu przebiegów, niezależny od zależności widok orbity 3D na canvas/SVG (zestaw orbity emituje teraz addytywne <c1/>), tryb osadzania/iframe oraz pobieranie jako raport HTML — każde z testami jednostkowymi node w CI.

seg-261604603d67 = <b>Model błędów IMU sprawdzony względem arkuszy danych</b> (<c1/>): ARW/VRW/niestabilność biasu ADIS16465/16488/16460 odzyskane z zsyntetyzowanego odchylenia Allana i skontrolowane względem specyfikacji producenta (identyfikacja wg NIST SP1065 / IEEE { "952" }).

seg-dc7b9bdb3076 = <b>Walidacja estymatorów Allana wg NIST SP1065</b> (<c1/>): cztery estymatory odtwarzają opublikowane 1000-punktowe odchylenia referencyjne i granice ufności z Tabeli 32.

seg-5d50be22aacd = <b>Poziomy ochrony SBAS / DO-229E, jonosferycznie wolne L1/L5 i mapa compliance DO-316</b> (moduł <c1/>). <c2/> tworzy ważoną macierz geometrii z elewacji/azymutu każdego satelity oraz budżetu błędów UDRE/GIVE/pokładowego/troposferycznego, odwraca macierz normalną (wspólne <c3/>) i rzutuje wariancje na HPL/VPL przez współczynniki K z DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> dodaje wolną od jonosfery pseudoodległość GPS L1/L5 (IS-GPS-705, <c5/>), sprawdzoną pod kątem znoszenia niezależnego opóźnienia jonosferycznego pierwszego rzędu w silniku. <c6/> wiąże wymagania DO-316/DO-229E z funkcjami, które je realizują. Sprawdzone względem definicji współczynników K w postaci zamkniętej, geometrii referencyjnej <c7/> w numpy oraz tożsamości kowariancji dwóch dróg; kontrola zgodności opublikowanych PL z RTKLIB/gLAB jest udokumentowana jako oczekująca na przegląd w <c8/>.

seg-e9e60b40e42a = <b>Pełna tesseralna grawitacja w harmonikach sferycznych — pole EGM2008 do stopnia/rzędu { "70" }.</b> Nowy <c1/> oblicza geopotencjał i jego przyspieszenie w układzie związanym z Ziemią z w pełni znormalizowanych współczynników <c2/>, używając stabilnej znormalizowanej rekurencji Legendre'a Holmesa–Featherstone'a (denormalizacja przepełniłaby się przy tym stopniu). Dostarczane współczynniki to produkt NGA EGM2008 (domena publiczna, przez ICGEM), dołączony w <c3/> i odtwarzany co do bitu przez <c4/> z zatwierdzonego <c5/>; dowolny model ICGEM <c6/> wczytuje się przez <c7/>. Sprawdzone względem trzech niezależnych wyroczni: zapadnięcia do masy punktowej (tylko <c8/> = <c9/>), pola wyłącznie zonalnego odtwarzającego istniejące <c10/> do ~{ "1e-9" } oraz analitycznego przyspieszenia zgodnego z gradientem różnic skończonych bezpośrednio zsumowanego potencjału do <{ "1e-6" }.

seg-c33a2dbf851d = <b>Ogólnorelatywistyczne przyspieszenie Lense’a–Thirringa (unoszenie układów inercjalnych)</b> (<c1/>, IERS { "2010" } równ. { "10.12" }), człon grawitomagnetyczny wykraczający poza istniejącą poprawkę Schwarzschilda, podłączony do propagatora numerycznego przez nową flagę <c2/>. Sprawdzone jako liniowe względem momentu pędu Ziemi i o { "1" }–{ "2" } rzędy wielkości poniżej członu Schwarzschilda, w reżimie pomiarów LAGEOS / Gravity Probe B.

seg-909562023109 = <b>Trait <c1/> jednoczący analityczne i numeryczne propagatory orbity.</b> Numeryczny propagator Cowella z modelem sił jest teraz pełnoprawnym partnerem SGP4: nowy typ <c2/> (stan początkowy + <c3/> + <c4/> + wybór <c5/> z podwajaniem kroku lub Dormanda–Prince’a) oraz <c6/> implementują <c7/>, którego <c8/> zwraca inercjalny stan TEME w jednostkach SI (m, m/s), więc oba są wymienne za <c9/>. Implementacja SGP4 to dokładna konwersja km/min→SI metody własnej (sprawdzona testem równości); implementacja numeryczna przechodzi przez trait tę samą bramkę dokładnego Keplera poniżej metra, oba adaptacyjne sterowniki zgadzają się, a <c10/> ujawnia podstawowy kod SGP4.

seg-d094880df57b = To wydanie zamyka największą lukę poprawności w silniku: orientacja Ziemi i redukcja układów odniesienia są teraz wykonywane na poziomie implementacji referencyjnej (sprawdzone <b>co do bitu względem ERFA/SOFA</b>), stos integralności zyskuje <b>dwukonstelacyjny ARAIM</b> na rzeczywistych TLE GPS+Galileo, a warstwy propagacji, sensorów kwantowych, księżycowa/cislunarna i geomagnetyczna pogłębiają się — obok typowanego API Pythona, bogatszego playground w przeglądarce i macierzy odtwarzalności na trzech systemach. Najważniejsze:

seg-bfe1d4a7cabd = <b>Układy odniesienia, co do bitu.</b> Pełna nutacja IAU 2000A i 2000B, precesja IAU { "2006" }, oparta na CIO (X, Y, s) redukcja IAU 2006/2000A GCRS↔ITRS, ruch bieguna wg IERS oraz układy wyjściowe TEME→GCRS/ITRS — każde sprawdzone co do bitu względem procedur referencyjnych ERFA/SOFA.

seg-bb5705347a24 = <b>Dwukonstelacyjny ARAIM</b> (GPS + Galileo) na rzeczywistych TLE, z HPL/VPL, wyjściem w postaci diagramu Stanforda i otwartym <c1/>.

seg-2865dadcd4c8 = <b>PNT cislunarny</b>: propagator CR3BP Ziemia–Księżyc, układy MCI↔MCMF, współrzędne selenograficzne oraz uruchamialny scenariusz integralności księżycowej LunaNet.

seg-3b636707a158 = <b>Sensing kwantowy</b>: systematyki Coriolisa i AC-Stark dla interferometru zimnych atomów, przegląd dryfu oraz walidacja względem budżetu Freiera ({ "2016" }).

seg-10bc94801a6a = Geomagnetyczny model pola głównego <b>IGRF-14</b>, samodzielny i sprawdzony.

seg-6485f627d793 = <b>Typowane API Pythona</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, stuby typów) z kompilacją kół w CI, a także pełnoprawne wyjście propagatora GCRS/ITRS i eksport CCSDS OMM.

seg-2b7693641333 = <b>Wiarygodność i odtwarzalność</b>: bezpośrednie porównanie dokładności SGP4 z niezależnym crate'em <c1/>, bramka pokrycia w CI (~{ "97" }% linii w <c2/>) oraz macierz odtwarzalności na trzech systemach (<c3/>/<c4/>/<c5/>).

seg-32e53ac66056 = <b>Każdy wykres playground jest teraz zgodny z motywem strony.</b> Wszystkie dwanaście generatorów wykresów SVG — wykres wyniku/holdover (<c1/> + <c2/>), wykres odchylenia Allana (<c3/>) i każdy wykres scenariusza (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + dostępność, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>) — używało chłodnych granatowych paneli (<c15/>), chłodnoszarych osi/tekstu i kłócącej się palety serii czerwony/niebieski/fioletowy. Teraz używają w całości ciepłej grafitowej palety: panele <c16/>, ciepła siatka <c17/>, etykiety <c18/>, ze spójnym przypisaniem serii — kwantowe = miodowozłote (<c19/>), klasyczne = ciepły bursztyn (<c20/>), specyfikacja/limit = <c21/>. Widoki kodowane bezpieczeństwem zachowują swoje znaczenie: diagram Stanforda RAIM pozostaje zielony (dostępny) / bursztynowy (mylący) / czerwony (niebezpieczny) / przygaszona stal (niedostępny), a HPL/VPL czytają się jako złoto/brąz.

seg-2bb31dfc7756 = <b>Wykresy są teraz samoopisujące po zapisaniu/pobraniu.</b> Oba wykresy wbudowują tytuł w SVG (tytuł wykresu Allana i podtytuł „lower is better” były wcześniej tylko HTML wokół obrazu, więc zapisany obraz nie miał podpisu), a oba mają stopkę proweniencji — <c1/> — dzięki czemu pobrany wykres jest samodzielny i pozostaje odtwarzalny.

seg-9f528e334cd8 = <b>Każdy wykres ma teraz stopkę proweniencji.</b> Stopka — <c1/> — jest nakładana centralnie dla wszystkich rodzajów scenariuszy w <c2/> (wcześniej była tylko na wykresach holdover i Allana), więc każdy zapisany lub pobrany obraz — z playground, z eksportu <c3/> w CLI lub z karty wyników HTML — identyfikuje swoją wersję, odcisk scenariusza i źródło. Hash jest oznaczony <c4/> dla jasności i pochodzi z <c5/> wyniku, gdy jest dostępny, z zapasowym hashem źródła dla raportów integralności/księżycowych. Czym jest odcisk i po co tam jest, opisano w sekcji „Output” README oraz w <a1><c6/></a1>.

seg-635697ed3fb1 = <b><c1/> i próbnik szumu Stanforda RAIM nie powodują już paniki przy danych spoza zakresu / niefinitnych</b> (znalezisko fuzzingu zależne od kolejności <c2/> z nowych scenariuszy ARAIM). <c3/> chroni teraz <c4/>/<c5/> tak jak <c6/> (zwracając wartość brzegową zamiast paniki <c7/>), a <c8/> szumu Stanforda dla dostępności ogranicza σ do ściśle dodatniej — więc stos integralności/ARAIM nigdy nie wpada w panikę przy zmutowanych lub błędnie skonfigurowanych scenariuszach.

seg-b36a0c42845e = <b>Macierz CI odtwarzalności między platformami.</b> Nowe zadanie <c1/> uruchamia testy odtwarzalności na <b>ubuntu-latest, macos-latest i windows-latest</b> przy każdym pushu. Ponieważ pełny JSON wyniku nie jest identyczny co do bajtu między systemami (rozbieżność libm na ostatniej jednostce ULP), dokładnie asercjonuje rzut niezmienniczy względem platformy — odcisk wejścia plus kształt wyjścia, przypięte dla każdego scenariusza jako wzorce SHA-256 w <c2/> przez nowy <c3/> — obok przypięć numerycznych (<c4/>, do { "1e-6" }), stanów SGP4 (<c5/>, do { "2e-5" } km) i determinizmu w obrębie procesu (<c6/>). Razem dowodzą one odtwarzalności między platformami na trzech systemach bez kruchości dokładnego hashowania bajtów pełnego wyjścia. <c7/> opisuje ten podział.

seg-9b8c0a407387 = <b>Bramka pokrycia kodu w CI.</b> Nowe zadanie <c1/> uruchamia <c2/> z silnikiem opartym na źródłach LLVM, publikuje raport lcov jako artefakt kompilacji i egzekwuje dolną granicę pokrycia linii dla <c3/> (z wyłączeniem generowanych tabel danych, punktu wejścia CLI, testów i zasobów webowych). Zmierzone pokrycie linii to ~{ "97" }% dla <c4/> (SGP4 i moduły zegara ≥{ "95" }%); bramka jest ustawiona na { "85" }% — powyżej celu ≥{ "80" }% i z dala od zmierzonej wartości, więc wychwytuje regresje bez fałszywych alarmów. Odznaka pokrycia jest publikowana w README.

seg-1dfc4beb239a = <b>SGP4/SDP4 bezpośrednio z niezależnym crate'em <c1/>.</b> Nowy test (<c2/>) sprawdza krzyżowo propagator Kshana względem najczęściej używanej biblioteki SGP4 w Rust (neuromorphicsystems/sgp4, dodanej jako zależność wyłącznie testowa) na tych samych { "666" } wektorach AIAA 2006-6753. Gdy oba są napędzane modelem grawitacji WGS72, którego używają wektory, dwie niezależne implementacje zgadzają się <b>poniżej mikrometra</b> dla orbit okołoziemskich i rezonansowych oraz do <b>{ "4.12" } mm w najgorszym przypadku</b> dla wszystkich reżimów, obie odtwarzając tabelę referencyjną <c3/>. Zatwierdzona tabela porównawcza (<c4/>, regenerowana przez <c5/>) rozbija wynik na reżimy (LEO/MEO, kosmos głęboki, rezonans ½-dobowy i 1-dobowy) i odnotowuje cztery celowo patologiczne przypadki, które crate odrzuca przy konstrukcji. Aktywne asercje utrzymują oba wyniki w granicach { "2e-5" } km od wzorca i zgodność między sobą w granicach { "4e-5" } km — to zabezpieczenie przed regresją, a nie jednorazowa kontrola. To konkurencyjny pedigree: poprawność względem niezależnej bazy kodu, a nie tylko statyczna tabela. (Domyślne <c6/> w crate używa WGS84, więc różni się od wzorca WGS72 o ~km — co zostało uczciwie podane w opisie tabeli.)

seg-dc75162ecd64 = <b>Eksport CCSDS OMM jest teraz dostępny od końca do końca.</b> Zapisywacz OMM (<c1/>) wcześniej nie miał ścieżki CLI/API; średnie elementy scenariusza <c2/> można teraz opublikować jako katalog OMM CCSDS 502.0-B-2 — jedna wiadomość OMM KVN na każdego satelitę zdefiniowanego przez TLE — przez <c3/>, albo <c4/> w scenariuszu automatycznie zapisuje <c5/> (analogicznie do istniejącego <c6/>). Każda wiadomość zawiera <b>rzeczywisty</b> numer katalogowy NORAD satelity, międzynarodowe oznaczenie COSPAR (<c7/>) i epokę (w formie dnia roku CCSDS), sparsowane z linii TLE { "1" } przez nowe <c8/>; linia nazwy staje się <c9/> (w przeciwnym razie <c10/>). <c11/> to epoka scenariusza, a nie czas zegarowy, więc wynik jest odtwarzalny. Nowe API: <c12/> / <c13/>, <c14/>, <c15/>. Syntetyczny scenariusz Walkera lub RINEX (bez średnich elementów TLE) kończy się błędem zamiast emitować pusty plik. Sprawdzone względem dołączonej migawki 30 satelitów <c16/> (<c17/>).

seg-036782a2b65e = <b>Interaktywne odczyty po najechaniu na wykresy playground.</b> Przesunięcie kursora nad wykresem przyciąga celownik do najbliższej próbki i pokazuje podpowiedź z wartością (<c1/>, podłączone w <c2/>). Na wykresie Allana odczytuje τ i σ_y(τ) każdego zegara; na wykresach szeregów czasowych scenariuszy (holdover zegara, nawigacja zliczeniowa, transfer czasu, hybrydowe PNT, GNSS/INS) odczytuje czas i wartość każdego zestawu w jednostkach samego wykresu (ns / m / ps / wykorzystanie), sparsowane z wyniku, więc odczyt zgadza się z krzywą. Wyspecjalizowane diagramy (RAIM, spoofing, przegląd) nie dostają nakładki. Wykresy pozostają samoopisującymi się blobami <c3/> — nakładka to przezroczysty celownik i podpowiedź na wierzchu, więc pobieranie/porównywanie/eksport pozostają nietknięte. Matematyka współrzędnych (najbliższa próbka, kursor→ułamek wykresu, parsowanie łamanej) jest testowana jednostkowo (<c4/>, uruchamiane w CI).

seg-1588ae024e5d = <b>Tryb porównania A/B w playground.</b> Przypnij dowolny przebieg jako punkt odniesienia A, uruchom drugi scenariusz, a oba zostaną pokazane obok siebie z tabelą różnic wskaźników jakości (holdover, RMS/p95 synchronizacji czasu, dostępność), która koloruje zwycięzcę dla każdej metryki (<c1/>, podłączone w <c2/>; logika różnic testowana jednostkowo w <c3/>, uruchamiana w CI). Wszystkie wartości są wstawiane jako tekst, a wszystkie wykresy przez blob <c4/>, więc nic z ciągu scenariusza nie jest nigdy wstrzykiwane jako znaczniki.

seg-6e7a99f8f275 = <b>Przyciski pobierania wykresów (SVG + PNG).</b> Każdy wykres playground ma teraz dopasowany do motywu pasek „Download SVG / PNG” (<c1/>, podłączone w <c2/>). SVG zwraca wierny, skalowalny oryginał; PNG rasteryzuje ten sam samoopisujący się obraz w skali 2x na potrzeby slajdów i dokumentów. Pliki są nazywane zgodnie z ich proweniencją — <c3/> — a logika nazw plików i rozmiarów jest testowana jednostkowo (<c4/>, uruchamiane w CI).

seg-4cb87e7dc892 = <b>Geomagnetyczny model pola głównego IGRF-14 (<c1/>).</b> Standardowe pole w harmonikach sferycznych IAGA (stopień/rząd { "13" }, epoka { "2025.0" } + wariacja wiekowa { "2025" }–{ "2030" }; współczynniki generowane maszynowo z oficjalnego <c2/> przez <c3/> do <c4/>, odtwarzalne co do bitu). Synteza ze znormalizowaniem Schmidta zwraca wektor pola (północ/wschód/dół) oraz elementy pochodne (deklinacja, inklinacja, natężenie poziome/całkowite) w dowolnym położeniu geodezyjnym i dowolnej dacie, a także biegun geomagnetyczny i siłę dipola — magnetyczny odpowiednik dopasowywania map grawitacyjnych w nawigacji alternatywnej wobec PNT. Sprawdzone samodzielnie: synteza zgadza się z dokładnym dipolem przechylonym w postaci zamkniętej, pełne analityczne pole stopnia 13 zgadza się z różnicą skończoną potencjału skalarnego, oś dipola odtwarza znany biegun geomagnetyczny (~{ "80.7" }°N, −{ "72.7" }°E) i siłę ~{ "29.7" } µT, a pole globalne jest fizyczne.

seg-c69d50031da4 = <b>Typowane wiązania Pythona (<c1/>).</b> Poza działającymi na ciągach <c2/>/<c3/> moduł udostępnia teraz typowaną klasę <c4/> (<c5/>, <c6/>, <c7/> oraz akcesor <c8/> zwracający wynik sparsowany do natywnego słownika Pythona — bez ponownego parsowania JSON, z możliwością opakowania w NumPy), a także <c9/>, <c10/> (sparsowana lista słowników metadanych) i <c11/> (niepowodująca wyjątku lista komunikatów o błędach). Zawiera stub typów PEP { "561" } (<c12/> + <c13/>) dla mypy/pyright/edytorów oraz krótki przewodnik <c14/>. Istniejące funkcje są bez zmian.

seg-fb65ac14344c = <b>Pełnoprawne układy wyjściowe dla propagatorów (enum <c1/> <c2/> + <c3/> + <c4/>).</b> Każdy <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) może teraz podawać swoje położenie w TEME, <b>GCRS</b> (≈ J2000) lub <b>ITRS</b> (związanym z Ziemią) — TEME natywnie, GCRS przez sprawdzoną redukcję TEME→GCRS, ITRS przez złożenie jej z rotacją CIO IAU 2006/2000A <c6/> — oraz swój pełny stan GCRS (położenie + prędkość) przez <c7/>. Inercjalne wyjście na datę nie jest już ograniczone do TEME.

seg-8f596733c439 = <b>Redukcja niebiańskiego do ziemskiego układu IAU 2006/2000A oparta na CIO (<c1/>).</b> Nowoczesny łańcuch GCRS↔CIRS↔ITRS bez równonocy: współrzędne CIP <c2/> odczytane z macierzy bias-precesja-nutacja IAU 2006/2000A (z ponownym użyciem sprawdzonej precesji FW i nutacji 2000A z korektą <c3/> P03), 66-członowy szereg lokalizatora CIO <c4/> (<c5/>, generowany maszynowo z wzorca ERFA przez <c6/> do <c7/>, odtwarzalny co do bitu), macierz GCRS→CIRS (<c8/>), kąt obrotu Ziemi (<c9/>) oraz pełna rotacja GCRS→ITRS (<c10/>, złożona z istniejącego ruchu bieguna IERS). Sprawdzone <b>co do bitu</b> względem opublikowanych wektorów testowych <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 przy JD_TT { "2453736.5" }), <c12/> i <c13/>. Wykazano, że łańcuch CIO i dawna redukcja TEME wg równonocy/GMST-1982 zgadzają się z dokładnością do udokumentowanej różnicy konwencji czasu gwiazdowego ≈{ "2" }·(równanie równonocy). To rygorystyczna redukcja, którą ścieżka równonocy/GMST jedynie przybliżała.

seg-32e6d8dfcebc = <b>Pełny szereg nutacji IAU 2000A (<c1/> <c2/>, <c3/>).</b> Kompletny model MHB2000 — { "678" } członów księżycowo-słonecznych + { "687" } planetarnych — o dokładności < { "0.1" } mas, obok istniejącego 77-członowego obcięcia 2000B. Tabele są generowane maszynowo z wzorca IAU SOFA / ERFA <c4/> przez <c5/> do <c6/> (generator odtwarza zatwierdzony plik co do bitu), a cały szereg — zarówno zestawy argumentów fundamentalnych IERS-2003 i MHB2000, jak i długości planet — jest sprawdzony <b>co do bitu</b> względem opublikowanego wektora testowego <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } przy JD_TT { "2453736.5" }, do { "1e-13" } rad). Domyślna redukcja TEME→GCRS zachowuje szereg 2000B (~{ "1" } mas, poniżej uproszczenia rotacji układu prędkości w łańcuchu); <c8/> udostępnia macierz na datę o dokładności < { "0.1" } mas dla wywołujących, którzy jej potrzebują.

seg-35e9e419d2ae = <b>Uruchamialny scenariusz integralności księżycowej (<c1/>, <c2/>).</b> Podłącza przebieg poziomu ochrony na południowym biegunie Księżyca (<c3/> <c4/> → <c5/>) do uruchamiacza scenariuszy z JSON <c6/> i wykresem SVG HPL w funkcji czasu, dzięki czemu przypadek integralności cislunarnej jest osiągalny prosto z CLI. Uczciwie ujawnia lukę: przy σ_URE LANS równym { "30" } m HPL na południowym biegunie (≈ { "260" }–{ "450" } m) przekracza limit alarmowy { "50" } m ({ "0" } % dostępności) — integralność PNT na Księżycu nie jest jeszcze spełniona.

seg-1910e8110b43 = <b>Dostępność ARAIM dwukonstelacyjnego na rzeczywistych TLE GPS+Galileo i podłączenie do uruchamiacza scenariuszy (<c1/>, <c2/>, <c3/>).</b> Dodaje <c4/> (zaawansowany silnik ARAIM — błędy pojedynczego satelity <em>oraz</em> błędy całej konstelacji — uruchamiany na siatce czasu) i <c5/> oraz podłącza go do uruchamiacza <c6/> przez flagę <c7/>, tak że wieloGNSS-owe badanie ARAIM jest osiągalne prosto z TOML. Test na rzeczywistych danych (<c8/>) na dołączonych migawkach Celestrak GPS+Galileo z 2026-06-07 pokazuje, że połączenie Galileo podnosi dostępność ARAIM z { "0.21" } do { "0.67" } przy wymagającym VAL { "12" } m ({ "10.5" }→{ "21.8" } widocznych satelitów), podczas gdy tryb odporny na błędy konstelacji jest zasadniczo ograniczony przy zaledwie dwóch konstelacjach — to ilościowy powód, dla którego odporna integralność dwukonstelacyjna zmierza ku trzeciej konstelacji lub SBAS. Uczciwa pozostałość: liczbowo dokładne odtworzenie Tabeli A-3 z EU ARAIM TN względem pojedynczej epoki zablokowanej wersją oraz rekord danych testowych w Zenodo.

seg-78ab887a4543 = <b>Ograniczony kołowy problem trzech ciał (CR3BP) dla układu Ziemia–Księżyc (<c1/>).</b> Nowy rdzeń dynamiki cislunarnej, którego nie mogą zapewnić propagatory dwuciałowe/SGP4: równania ruchu w układzie wirującym (<c2/>), propagator RK4 (<c3/>), całka Jacobiego (<c4/>) i pięć punktów Lagrange'a (<c5/>). Sprawdzone względem kotwic w postaci zamkniętej / opublikowanych: współliniowe punkty Ziemia–Księżyc (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), dokładne równoboczne L4/L5 = (½−μ, ±√3/2, { "0" }), wszystkie pięć potwierdzone jako równowagi pola, stała Jacobiego zachowana z precyzją integratora w trakcie propagacji oraz siła przywracająca poza płaszczyzną, która umożliwia orbity halo/NRHO. To fundament do reprezentowania rzeczywistej NRHO. Uczciwa pozostałość: okresowe warunki początkowe NRHO { "9" }:{ "2" } skorygowane różniczkowo, model ekscentryczny/efemerydowy (DE) oraz zdenormalizowane przekształcenie do układów selenocentrycznych w <c6/>.

seg-14f4572144f3 = <b>Ruch bieguna wg IERS i redukcja TEME→ITRF (<c1/>).</b> Dodaje <c2/> (SOFA <c3/>: <c4/> z lokalizatorem TIO <c5/>), <c6/> / <c7/> oraz <c8/> — rotację TEME→PEF opartą na GMST, po której następuje ruch bieguna — dopełniając precyzyjne według ITRF położenie związane z Ziemią na bazie samego GMST <c9/> (ruch bieguna to efekt rzędu dziesiątek metrów na promieniu orbity). <c10/>/<c11/> to obserwowane wielkości IERS dostarczane przez wywołującego. Uczciwa pozostałość: w pełni oparty na CIO łańcuch (X, Y, s) oraz numeryczna kontrola krzyżowa ANISE/SPICE <{ "10" } m pozostają kolejnymi krokami.

seg-b5e84faf880c = <b>Systematyki interferometru zimnych atomów, przegląd dryfu i walidacja względem opublikowanego urządzenia (<c1/>, <c2/>).</b> Rozszerza akcelerometr CAI zbudowany od podstaw o dwie wiodące systematyki deterministyczne: fazę <b>Coriolisa/rotacji</b> <c3/> (<c4/>, z równoważnym biasem przyspieszenia <c5/> przez <c6/>) oraz fazę <b>przesunięcia świetlnego AC-Stark</b> <c7/> (<c8/>, która znosi się dzięki symetrii π/2–π–π/2 dla stałego przesunięcia). Dodaje <c9/> (dryf położenia nawigacji zliczeniowej względem czasu cyklu — rdzeń porównania kwantowego z klasycznym) oraz test walidacyjny względem mobilnego grawimetru Freiera i in. { "2016" } (arXiv:{ "1512.05660" }): modelowany poziom szumu rzutu kwantowego leży poniżej opublikowanego krótkoterminowego szumu { "96" } nm/s²/√Hz i w granicach ~{ "2" } rzędów wielkości od niego. <c10/> zaktualizowano. Uczciwa pozostałość: systematyki czoła fali/wskazywania wiązki, rozwiązywanie niejednoznaczności prążków, dokładne odtworzenie testu lotnego CARIOQA-PMP / Boeing-AOSense (wymaga opublikowanych PSD platformy) oraz zestaw ustawień JS dla playground.

seg-f32829ed9cf1 = <b>Redukcja układów cislunarnych i przebieg integralności na południowym biegunie Księżyca (<c1/>).</b> Rozszerza księżycowy silnik ARAIM o rotację MCI↔MCMF (inercjalny środkowany na Księżycu ↔ związany z Księżycem) (<c2/> / <c3/>, uproszczony model średniej rotacji w tempie gwiazdowym Księżyca), selenograficzną szerokość/długość/wysokość (<c4/> / <c5/>) oraz <c6/> — odbiornik w rejonie Artemis na lądowisku względem reprezentatywnego zestawu przekaźników LunaNet w ciągu przebiegu { "24" } h, co uczciwie określa ilościowo lukę integralności: przy nominalnym σ_URE LANS { "30" } m poziom ochrony jest skończony, ale przekracza limit alarmowy operacji powierzchniowych { "50" } m. Uczciwa pozostałość: precyzyjna efemeryda NRHO LANS (3-ciałowa orbita cislunarna), fizyczna libracja / precesujący biegun Księżyca (DE421/SPICE) i scenariusz TOML LunaNet pozostają kolejnymi krokami.

seg-5ef720855cc4 = <b>Komunikat wspierający integralność ARAIM, SVG diagramu Stanforda i otwarty wzorzec ARAIM (<c1/>, <c2/>).</b> Dodaje jawny <c3/> (σ_URA / σ_URE / b_nom / P_sat / P_const, z wartościami referencyjnymi WG-C GPS+Galileo oraz konwerterami <c4/> / <c5/> do silników <c6/> pojedynczego błędu i <c7/> błędów całej konstelacji), samodzielny renderer <c8/> diagramu integralności Stanforda (cztery strefy, granica <c9/>, prowadnice limitu alarmowego, jeden kolorowany znacznik na epokę) oraz <c10/> dokumentujący algorytm, ISM, hipotezy błędów, kontrakt poziomu ochrony i korzyść z dwóch konstelacji. Testy wykazują zysk geometrii/redundancji (połączenie drugiej konstelacji zacieśnia HPL pojedynczego błędu) i tolerancję błędów konstelacji (użytkownik dwukonstelacyjny przeżywa utratę całej konstelacji; użytkownik jednokonstelacyjny nie). Uczciwa pozostałość: liczbowe odtworzenie Tabeli A-3 z EU ARAIM TN / wartości dostępności { "15" }–{ "25" } % względem migawki rzeczywistych TLE zablokowanej wersją, rekord danych testowych w Zenodo oraz podłączenie <c11/> do uruchamiacza plików scenariuszy.

seg-3607eb34acd9 = <b>Nutacja IAU 2000B i pełna inercjalna redukcja TEME→GCRS/J2000 (<c1/>).</b> Dodaje drugi i trzeci element prawdziwej redukcji do układu inercjalnego na bazie dostarczonej precesji IAU { "2006" }: 77-członowy księżycowo-słoneczny szereg nutacji MHB2000 (<c2/>, standardowe obcięcie IAU 2000B o dokładności ~{ "1" } mas) z argumentami fundamentalnymi Delaunaya i macierzą nutacji SOFA <c3/>, oraz łańcuch Vallado AIAA-2006-6980 TEME→TOD (równanie równonocy) → TOD→MOD (nutacja) → MOD→GCRS (bias-precesja), udostępniony jako <c4/> / <c5/>. Szereg, argumenty i stałe jednostkowe są przepisane ze wzorca IAU SOFA / ERFA <c6/> i sprawdzone <b>co do bitu</b> względem opublikowanego wektora testowego <c7/> (Δψ, Δε do { "1e-13" } rad). Uczciwa pozostałość: pełny 678-członowy szereg IAU 2000A (<{ "0.1" } mas), numeryczna kontrola krzyżowa ANISE/SPICE <{ "10" } m oraz ruch bieguna pozostają kolejnymi krokami (zob. <c8/>).

seg-d9b5e459f6eb = To wydanie wprowadza pierwszy w Kshana <b>nieanalityczny propagator orbity</b> — integrator Cowella z hierarchicznym modelem sił o sześciu perturbacjach (dwuciałowy + zonalne J2–J6 + zależne od epoki ciało trzecie Słońce/Księżyc + ciśnienie promieniowania słonecznego ze stożkowym cieniem umbry/półcienia + opór atmosferyczny + postnewtonowska poprawka relatywistyczna Schwarzschilda) napędzany jednym z dwóch integratorów adaptacyjnych (RK4 z podwajaniem kroku oraz zagnieżdżona para Dormanda–Prince'a RK5({ "4" })) — obok warstwy manewrów / projektowania trajektorii (manewry impulsowe i o skończonym czasie, solver Lamberta Izzo i przegląd porkchop), warstwy alt-PNT z dopasowaniem map grawitacyjnych, która odtwarza 60-minutowy ślad bez GPS z dokładnością poniżej { "500" } m, potoku wsadowego i sekwencyjnego wyznaczania orbity oraz pełnego 17-stanowego ściśle sprzężonego UKF GNSS/INS z nawigacją zliczeniową opartą na kwantowym CAI. Każda możliwość numeryczna jest przypięta do prawdy analitycznej lub ręcznie wyprowadzonej postaci zamkniętej; perturbacje domyślnie wyłączone nie naruszają opublikowanych wzorców.

seg-aa8d478f5c10 = <b>Postnewtonowska (Schwarzschilda) poprawka relatywistyczna (<c1/> + <c2/>).</b> Dodaje dominującą ogólnorelatywistyczną perturbację na orbicie okołoziemskiej — główny czynnik relatywistycznego przesuwu perygeum — w formie IERS / Montenbruck–Gill <c3/> <c4/>. Podobnie jak opór atmosferyczny jest <b>zależna od prędkości</b>, więc jedzie na prawej stronie integratora <c5/> przez [<c6/>], opcjonalna i domyślnie wyłączona. Sprawdzone samodzielnie: na orbicie kołowej zapada się do postaci zamkniętej <c7/> (czysto radialnej i <b>skierowanej na zewnątrz</b>, składowe poza osią dokładnie zerowe); jej <b>stosunek do członu dwuciałowego to podręcznikowe <c8/> na LEO</b> (sygnatura <c9/>); przypadek prędkości radialnej zgadza się z ręcznie uproszczonym <c10/>; a w propagatorze <b>perturbuje orbitę bez jej rozpraszania</b> — półoś wielka jest zachowana do znacznie poniżej metra/dobę, strukturalne przeciwieństwo monotonicznego zaniku wywołanego oporem. Ponieważ jest domyślnie wyłączona, wzorce dwuciałowe/J2/zonalne pozostają nietknięte. Strojenie parametrów PPN (<c11/>, <c12/>) i człon unoszenia układów inercjalnych Lense’a–Thirringa pozostają kolejnymi krokami.

seg-043e831224ab = <b>Stożkowy model cienia umbry i półcienia (<c1/>), teraz używany przez ciśnienie promieniowania słonecznego.</b> Ulepsza binarne zaćmienie w cylindrze umbry do gładkiego współczynnika <c2/>: Słońce i Ziemia są modelowane jako tarcze o pozornych promieniach kątowych <c3/>, <c4/> z pozornym oddaleniem środków <c5/>, a <c6/> to jeden minus ułamek tarczy Słońca zasłonięty tarczą Ziemi (pole nakładania się kół w kształcie soczewki) — pełne Słońce dla <c7/>, całkowita umbra dla <c8/>, obrączkowe dla <c9/> oraz ciągły półcień pomiędzy. <c10/> teraz go używa, więc siła SRP maleje gładko podczas zaćmienia zamiast włączać się i wyłączać. Dodaje nominalne <c11/> wg IAU. Sprawdzone samodzielnie: <c12/> w pełnym Słońcu i <c13/> głęboko w umbrze (dokładnie), <b>gładki monotoniczny półcień</b> (<c14/> rośnie { "0" } → ~½ przy <c15/> → { "1" } w paśmie <c16/>) oraz stożkowy półcień <b>wykracza poza cylinder umbry</b> (punkt, który binarny cylinder uznaje za w pełni oświetlony, ma <c17/> dla stożka). Prostszy <c18/> pozostaje dostępny; pociemnienie brzegowe Słońca i cień spłaszczonej Ziemi pozostają kolejnymi krokami.

seg-8d1c16019f3c = <b>Zagnieżdżony integrator Dormanda–Prince'a RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Dodaje standardową zagnieżdżoną parę Dormanda–Prince'a ({ "1980" }) z tablicą Butchera obok istniejącego sterownika RK4 z podwajaniem kroku: siedem etapów FSAL daje rozwiązanie 5. rzędu i oszacowanie błędu 4. rzędu z jednego zestawu obliczeń ({ "7" } wobec { "11" } wywołań funkcji na krok), tańsze oszacowanie błędu lokalnego. Sterownik adaptacyjny używa tej samej normy błędu RMS i sterownika kroku <c4/>, więc jest zamiennikiem; <c5/> udostępnia go w modelu sił orbity. Sprawdzone samodzielnie: zagnieżdżone oszacowanie błędu jest <b>O(h⁵)</b> (połowienie kroku zmniejsza je ~{ "32" }×); DP5({ "4" }) całkuje <c6/> do <c7/> oraz oscylator harmoniczny przez { "50" } okresów, zachowując energię do <{ "1e-6" }; osiąga ten sam punkt końcowy przy tej samej tolerancji w <b>mniejszej liczbie obliczeń funkcji</b> niż podwajanie kroku (bez utraty dokładności); a <c8/> przechodzi tę samą bramkę prawdy analitycznej co ścieżka RK4 — <b>poniżej metra względem dokładnego rozwiązania Keplera w zmiennych uniwersalnych na orbicie LEO w ciągu { "24" } h</b> — podczas gdy oba sterowniki zgadzają się do <{ "1" } m na orbicie J2..J6 (bez postaci zamkniętej). Wyższe pary zagnieżdżone (RKF7({ "8" }) / DOP853) pozostają kolejnym krokiem.

seg-cca3c00757d6 = <b>Opór atmosferyczny podłączony do propagatora jako pierwsza siła zależna od prędkości (<c1/> + <c2/> + <c3/>).</b> Dodaje atmosferę <b>kawałkami wykładniczą wg Vallado, Tabela 8-4</b> <c4/> ({ "28" } pasm od poziomu morza po { "1000" } km, ograniczona poniżej powierzchni) oraz kwadratowy opór <c5/> względem <b>współobracającej się atmosfery</b> <c6/> (<c7/>). Ponieważ opór zależy od prędkości, <c8/> zyskuje nowe <c9/>, a prawa strona integratora przekazuje teraz prędkość (<c10/>); zależne tylko od położenia <c11/> pozostaje bez zmian, więc człony zachowawcze i wzorce są nietknięte. Sprawdzone samodzielnie: gęstość <b>kotwiczy się na wartości { "1.225" } kg/m³ na poziomie morza</b>, jest ograniczona poniżej powierzchni, <b>maleje monotonicznie</b> przez LEO, mieści się w paśmie ~{ "1e-12" } kg/m³ uśrednionym dla Słońca na { "400" } km, a jej <b>odzyskana lokalna wysokość skalowa (≈ { "58" } km na { "400" } km)</b> jest fizyczna; opór <b>przeciwstawia się współobracającej się prędkości względnej</b> z wielkością LEO ~{ "2e-6" } m/s² dla <c12/>; i — kluczowa sygnatura — opór jest <b>dysypatywny</b>: orbita na { "300" } km traci energię właściwą <b>monotonicznie</b>, a jej półoś wielka <b>zanika o ograniczone ~km/dobę</b>, podczas gdy punkt odniesienia w próżni zachowuje energię do <{ "1e-9" }. Gęstość termosferyczna NRLMSISE-00 (klauzula gęstości oporu < { "5" } %) pozostaje kolejnym krokiem.

seg-0d20f02ef85f = <b>Ciśnienie promieniowania słonecznego podłączone w modelu sił propagatora zależnie od epoki (<c1/> + <c2/>).</b> Dodaje <b>model SRP kuli armatniej</b> <c3/> ze <b>współczynnikiem zaćmienia w cieniu cylindrycznym</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): ciśnienie promieniowania <c5/> z nowoczesnej całkowitej irradiancji słonecznej { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), spadek strumienia odwrotnie proporcjonalny do kwadratu <c6/> oraz radialne popchnięcie <b>od Słońca</b>. Jedzie na <b>tej samej zależnej od epoki prawej stronie</b> co ciało trzecie, próbkując Słońce <c7/> raz w przesuniętej epoce <c8/> współdzielonej między ciałem trzecim Słońcem a SRP. Składalne: <c9/>. Sprawdzone samodzielnie względem ręcznie wyprowadzonych sygnatur: <b>ciśnienie promieniowania na 1 AU przypina się do podręcznikowego ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; SRP w pełni oświetlonego satelity LEO jest <b>identyczne co do bitu</b> ze wzorem kuli armatniej, wskazuje <b>od Słońca</b> i mieści się w <b>paśmie ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> dla cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>podwojenie odległości od Słońca czterokrotnie zmniejsza wielkość</b> (odwrotny kwadrat); <b>cień cylindryczny zaćmiewa tylko cylinder umbry</b> (przeciwsłonecznie <em>i</em> w obrębie jednego promienia Ziemi od linii Ziemia–Słońce) i daje <b>dokładnie zerowe</b> SRP w zaćmieniu; a w propagatorze SRP <b>perturbuje orbitę LEO o niewielką ograniczoną wartość, skalującą się ~liniowo z A/m</b> — podczas gdy model bez perturbacji pozostaje niezależny od czasu co do bitu, nie naruszając wzorców dwuciałowych/J2/zonalnych. Stożkowa umbra/półcień (gładkie ν ∈ [{ "0,1" }]), opór atmosferyczny oraz zewnętrzna walidacja krzyżowa z GMAT/Orekit pozostają kolejnymi krokami.

seg-d3f819c21660 = <b>Zależne od epoki ciało trzecie Słońce/Księżyc podłączone do zmiennej w czasie prawej strony propagatora (<c1/> / <c2/>).</b> Perturbacja od ciała trzeciego nie jest już samodzielnym członem siły — jest teraz całkowana przez propagator Cowella jako naprawdę <em>zmienna w czasie</em> siła: każde obliczenie prawej strony próbkuje położenia Słońca/Księżyca <c3/> w <b>przesuniętej epoce <c4/></b> (z ponownym użyciem <c5/> do konwersji doba↔stulecie), więc perturbatory poruszają się po swoich orbitach w trakcie całkowania, zamiast być zamrożone na początku. Składalne z dowolnym modelem grawitacji (<c6/>). Sprawdzone samodzielnie: człon Słońca prawej strony jest <b>identyczny co do bitu</b> z <c7/> obliczonym w położeniu efemerydy dla tej chwili zarówno przy <c8/>, jak i <c9/> (co dokładnie dowodzi okablowania { "86400" } s ↔ { "1" } doba ↔ 1/36525 stulecia), perturbator <b>przesuwa się o ~{ "2.6" }·10⁹ m/dobę</b> między próbkami (nie jest zamrożony), <b>chwilowe wielkości pływowe na LEO</b> trafiają w podręcznikowe pasma ~{ "5" }·{ "10" }⁻⁷ m/s² (Słońce) i ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Księżyc, ≈ { "2" }× Słońce), każde ciało <b>mierzalnie perturbuje całodobową trajektorię, pozostając ograniczone</b>, a ten sam stan początkowy propagowany w <b>epokach oddalonych o kwartał roku daje inną trajektorię</b> (oś pływowa obraca się o { "90" }°) — podczas gdy model bez żadnego z tych ciał jest niezależny od czasu co do bitu, nie naruszając wzorców dwuciałowych/J2/zonalnych. Dokładność efemerydy klasy DE i zewnętrzna walidacja krzyżowa z GMAT/Orekit pozostają kolejnymi krokami.

seg-0a517f6c4b1b = <b>Efemeryda Księżyca o niskiej precyzji (<c1/>), dopełniająca parę ciał trzecich Słońce/Księżyc.</b> Dodaje księżycowy szereg niskiej precyzji Montenbrucka i Gilla (<c2/>) obok modelu Słońca, dzięki czemu niezależne od ciała <c3/> może być teraz napędzane przez każde z tych ciał niebieskich <b>bez zewnętrznego jądra DE/SPK</b>. Sprawdzone samodzielnie względem ręcznie wyprowadzonych sygnatur księżycowych: odległość geocentryczna mieści się w rzeczywistej <b>kopercie perygeum/apogeum (~{ "356 500" }–{ "406 700" } km)</b> w ciągu miesiąca, a jej <b>średnia miesięczna odtwarza półoś wielką ~{ "384 400" } km</b>; <b>szerokość ekliptyczna nigdy nie przekracza nachylenia orbity Księżyca ~{ "5.3" }°</b> (sprawdzone przez rzutowanie na biegun ekliptyki we współrzędnych równikowych, co sprawdza razem szereg szerokości i rotację nachylenia ekliptyki); <b>kierunek Księżyca wraca w granicach { "1" }° po jednym miesiącu gwiazdowym ({ "27.3217" } d)</b>, a jego <b>dobowy ruch mieści się w fizycznym paśmie { "12" }–{ "15" }°/dobę</b>; zaś księżycowa perturbacja od ciała trzeciego na satelicie LEO ma <b>podręczną wielkość ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ dwukrotność wartości dla Słońca). Dokładność położenia klasy DE, opór atmosferyczny i SRP pozostają kolejnymi krokami.

seg-8b7025e00dd1 = <b>Grawitacja ciała trzeciego (Słońca) z wbudowaną efemerydą o niskiej precyzji (<c1/>, <c2/>).</b> Dodaje do modelu sił perturbację od ciała trzeciego: <c3/> (bezpośrednie przyciąganie minus człon pośredni, który układ geocentryczny musi odjąć), z położeniem Słońca dostarczanym przez nowy moduł <c4/> z analitycznym szeregiem niskiej precyzji Montenbrucka i Gilla — <b>bez zewnętrznego jądra DE/SPK</b> dla przebiegu o niskiej wierności. Sprawdzone samodzielnie: przyspieszenie <b>zgadza się z dokładnym gradientem własnego potencjału zaburzającego</b> (<c5/>), perturbacja <b>znika w geocentrum</b> i ma <b>podręczną wielkość ~{ "5" }·{ "10" }⁻⁷ m/s² na satelicie LEO</b>, a efemeryda Słońca trafia w ręcznie wyprowadzone kotwice J2000 — <b>odległość w peryhelium ≈ { "1.471" }·10¹¹ m</b>, <b>deklinacja ≈ −{ "23" }° w pobliżu przesilenia grudniowego</b>, pozorny ruch <b>≈ { "1" }°/dobę</b> (≈ { "90" }° na kwartał roku) oraz odległość mieszcząca się w kopercie orbity Ziemi { "0.983" }–{ "1.017" } AU w ciągu pełnego roku. Dostarcza połowę ciała trzeciego w kroku modelu sił kamienia milowego propagatora numerycznego (Księżyc jest dostarczony we wpisie towarzyszącym powyżej); dokładność położenia klasy DE, opór atmosferyczny i SRP pozostają kolejnymi krokami.

seg-99fd6ae1ea09 = <b>Model sił zonalnych harmonik J2–J6 (<c1/> / <c2/>).</b> Rozszerza model sił propagatora Cowella poza J2 do pełnego pola zonalnego Ziemi do stopnia { "6" } (standardowe opublikowane nieznormalizowane <c3/> z EGM-96), podłączone do propagatora jako <c4/>. Przyspieszenie to <b>dokładny analityczny gradient</b> zonalnego potencjału zaburzającego <c5/> (wielomiany Legendre'a rekurencją w górę), sprawdzony na trzy niezależne sposoby: <b>redukuje się z precyzją maszynową do <c6/> sprawdzonego na 666 wektorach</b>, gdy ogranicza się do <c7/>; <b>zgadza się z numerycznym gradientem własnego potencjału</b> w całym polu J2..J6 (złoty standard kontroli pola zachowawczego); a człony nieparzyste <c8/> wobec parzystych <c9/>/<c10/> wykazują swoją <b>charakterystyczną (anty)symetrię północ–południe</b> względem <c11/> — asymetrię kształtu gruszki. Propagowana orbita J2..J6 zachowuje energię całkowitą (kinetyczną + centralną + potencjał zonalny) do ~{ "1e-8" } w ciągu doby i perturbuje orbitę tylko z J2 o niewielką, niezerową wartość. To dostarcza krok 2 („harmoniki zonalne J2–J6”) kamienia milowego propagatora numerycznego; pole tesseralne EGM wysokiego stopnia, opór, SRP, ciało trzecie i zewnętrzna walidacja krzyżowa z GMAT/Orekit pozostają kolejnymi krokami.

seg-59f0ba5a6269 = <b>Numeryczny propagator orbity (Cowella) (<c1/>).</b> Pierwszy w Kshana propagator <b>nieanalityczny</b> (reszta stosu orbitalnego to analityczne SGP4/SDP4): łączy model sił dwuciałowy + J2 (<c2/>) z adaptacyjnym sterownikiem RK4 z podwajaniem kroku (<c3/>) jako <c4/>, z przełącznikiem <c5/>. Sprawdzony względem <b>prawdy analitycznej, silniejszej niż byłoby narzędzie numeryczne do porównań krzyżowych</b>: niezaburzona orbita odtwarza <b>dokładne rozwiązanie Keplera w zmiennych uniwersalnych poniżej metra na 24-godzinnej orbicie LEO</b> (ostrzejsza bramka niż „względem numerycznego wzorca < { "10" } m”, którą formułuje kamień milowy), energia właściwa i moment pędu zachowują się do ~{ "1e-9" } względnie, a regresja węzła J2 odtwarza postać zamkniętą <c6/> do teorii pierwszego rzędu (w granicach { "2" } %, pozostałość O(J2²)). Dodaje także <c7/>, solver Newtona dla równania Keplera, który <b>zwraca <c8/> zamiast po cichu błędnej odpowiedzi</b>, gdy nie zbiega się w ograniczonym budżecie iteracji (przypadek <c9/> w pobliżu perygeum). Uczciwy zakres: model sił to wyłącznie dwuciałowy + J2 — pole tesseralne EGM wysokiego stopnia ({ "200" }×{ "200" } + loader), opór (NRLMSISE-00), SRP, siły od ciał trzecich i zewnętrzna walidacja krzyżowa z GMAT/Orekit pozostają kolejnymi krokami.

seg-d4c7c29f09d1 = <b>60-minutowe dopasowanie map grawitacyjnych bez GPS do < { "500" } m (<c1/>).</b> Pogłębia warstwę alt-PNT do celu walidacji <em>Quantum Wayfarer</em> ESA NAVISP: pojazd leci po śladzie ~{ "700" } km przez pełną jednogodzinną przerwę GNSS — jego rozwiązanie inercjalne dryfuje do <b>≈ { "70" } km</b> — a grawimetr zimnych atomów wraz z <b>hierarchicznym, od zgrubnego do dokładnego</b> dopasowywaczem cząstek/siatki odzyskuje stały dryf INS do <b>≈ { "145" } m</b> (< { "500" } m), czyli redukcję > { "480" }×. Rzeczywisty poziom szumu białego grawimetru jest wstrzykiwany jako <b>deterministyczna sekwencja z ziarnem</b>, więc dopasowywacz nigdy nie dostaje wolnej od szumu prawdy, a przebieg jest dokładnie odtwarzalny (sprawdzony jako identyczny co do bitu i stabilny do kilku metrów dla różnych realizacji szumu). Test klasy regresyjnej pokazuje, że udoskonalanie jest <em>konieczne</em> — pojedyncza zgrubna siatka zatrzymuje się na ~{ "2" } km, dopiero trzyetapowe udoskonalanie przełamuje barierę { "500" } m. Nowy zatwierdzony scenariusz <c2/>. Wiersz <c3/> pozostaje uczciwie <b>częściowy</b> (nadal brak dołączonej mapy EGM2008), a jego dowody zaktualizowano do wyniku 60-min < { "500" } m. Uczciwy zakres bez zmian: pole harmonik sferycznych niskiego stopnia + syntetyczne mascony; Monte Carlo po realizacjach błędu reprezentacji mapy jest kolejnym krokiem.

seg-4262a99328bb = <b>Rejestr nadmiernych twierdzeń i zabezpieczenie przed regresją (<c1/>, <c2/>).</b> Zamyka ścieżkę uczciwości/odstąpienia od twierdzeń: czternaście nadmiernych twierdzeń skatalogowanych we wcześniejszym audycie (<c3/>…<c4/>) jest teraz w całości GREEN — mocne twierdzenia (sprzężony filtr Kalmana zegara i położenia <c5/>, <c6/> jamming J/S→C/N₀→utrata blokady, fizyka CAI Macha–Zehndera <c7/>, ARAIM HPL/VPL <c8/>) są <b>zastąpione dostarczonymi, przetestowanymi możliwościami</b>, a nie złagodzonym sformułowaniem, a pozostałe wiersze są pozbawione twierdzeń, by odpowiadały kodowi. Nowy test CI skanuje aktualne powierzchnie publiczne (<c9/>, <c10/>, <c11/>, <c12/>) i kończy się niepowodzeniem, jeśli jakiekolwiek wycofane, gołe sformułowanie nadmiernego twierdzenia pojawi się ponownie bez zastrzeżeń, więc wiersz GREEN nie może po cichu ulec regresji. Wskaźnik jakości „integralność” dla każdego przebiegu pozostaje uczciwie oznaczony jako <em>samospójność filtra</em> (a nie integralność lotnicza); prawdziwe ARAIM HPL/VPL jest przedstawiane osobno, aby nigdy nie były mylone.

seg-27da62a7ff63 = <b>Nawigacja z dopasowaniem map grawitacyjnych (alt-PNT bez GPS).</b> Nowy <c1/> dodaje warstwę możliwości alt-PNT, której wymagają badania dopasowywania map grawitacyjnych <em>Quantum Wayfarer</em> / QT-CCI ESA NAVISP: <b>model pomiaru grawimetru</b> zimnych atomów, którego poziom szumu białego pochodzi z ASD akcelerometru CAI (<c2/>); niskostopniowe, w pełni znormalizowane <b>pole anomalii grawitacyjnych w harmonikach sferycznych</b> (sprawdzone względem funkcji Legendre'a w postaci zamkniętej <c3/>, <c4/>, <c5/> oraz ręcznie wyprowadzonej anomalii jednego członu { "1.897" } mGal) plus syntetyczne <b>mascony</b> dla lokalnych cech wysokiego stopnia; oraz <b>filtr cząstek dopasowujący mapę grawitacyjną</b> (składający <c6/> + <c7/>), który odtwarza ślad bez GPS z sekwencji anomalii, przez którą leci. Zatwierdzony benchmark NAVISP (<c8/>) redukuje dryf swobodnej inercji ~{ "73" } km do kilku km. Uczciwy zakres: Kshana <b>nie</b> dołącza pełnego zestawu współczynników EGM2008 { "2190" }° — pole jest niskostopniowe + mascony, a nie prawdziwą mapą wysokiej rozdzielczości; loader EGM/EIGEN, mapa magnetyczna, SLAM wspomagany terenem i podłączenie <c9/> silnika scenariuszy z wykresem dryfu SVG pozostają kolejnymi krokami. <c10/> „Gravity-map / alt-PNT navigation” → <b>częściowo</b>.

seg-d028a2db7837 = <b>Modelowanie manewrów i przyczółek projektowania trajektorii.</b> Nowy <c1/> dodaje pierwszą warstwę projektowania trajektorii ponad SGP4: impulsowe węzły ΔV, które stosują nieciągłość prędkości i przenoszą dalej kowariancję { "6" }×{ "6" } (deterministyczny manewr ⇒ tożsamościowe przejście stanu; kowariancja błędu wykonania obraca się z układu manewru — ECI lub LVLH — do bloku prędkości), całkowanie manewru o skończonym czasie (stały ciąg na łuku manewru z masą jako stanem), którego osiągnięte ΔV jest sprawdzane względem postaci zamkniętej równania rakietowego <b>Ciołkowskiego</b> z dokładnością lepszą niż { "0.01" } %, jednoobrotowy solver <b>Lamberta</b> wg <b>Izzo-2015</b> (<c2/>, <c3/>, czas przelotu ⇒ <c4/>, <c5/>), dokładny <b>propagator Keplera</b> w zmiennych uniwersalnych (prawda dwuciałowa) oraz przegląd <b>porkchop</b>, który odwzorowuje siatkę epoka startu × epoka przylotu na C3 odlotu i V∞ przylotu, emitowany jako tablica JSON 2-D do renderowania konturów w przeglądarce. Walidacja jest samodzielna i silniejsza niż odczyt z samouczka: każde wyjście Lamberta jest przepuszczane w obie strony przez propagator Keplera (musi wylądować z powrotem w <c6/>), a minimum porkchop jest sprawdzane względem analitycznej dolnej granicy C3 transferu Hohmanna dla dwóch współpłaszczyznowych orbit kołowych. Kshana pozycjonuje to jako warstwę symulacji osiągów ponad GMAT/Orekit, a nie jako zamiennik (gałęzie wieloobrotowe i rzeczywista efemeryda planet pozostają poza zakresem). Dziesięć testów.

seg-cbdd0e56d89f = <b>Pełny 17-stanowy ściśle sprzężony UKF GNSS/INS z nawigacją zliczeniową opartą na kwantowym CAI.</b> Nowy <c1/> niesie kompletny stan nawigacji inercjalnej, który estymuje filtr ściśle sprzężony — <c2/> ({ "17" } stanów) — propagowany przez mechanizację strapdown napędzaną zmierzoną siłą właściwą i prędkością kątową, z rotacją ciało→inercjalny w przybliżeniu małych kątów <c3/>, tak aby błąd orientacji sprzęgał się z przyspieszeniem poziomym (standardowe sprzężenie przechyłu INS). Podczas przerwy GNSS filtr dryfuje wyłącznie na IMU; szum procesu losowego błądzenia prędkości to wyprowadzone <c4/> akcelerometru interferometru zimnych atomów (<c5/>), więc dryf nawigacji zliczeniowej jest ograniczony przez czujnik kwantowy — 120-sekundowa przerwa pozostaje ograniczona do kilkuset metrów wobec kilometrów, do których doszłoby swobodne INS klasy nawigacyjnej. Aktualizacja pseudoodległości/prędkości zmian odległości przechodzi przez wspólny filtr bezśladowy (z α = { "1" } dla dobrze uwarunkowanych wag przy tym rozmiarze stanu). Pięć testów: tożsamość modelu pomiaru, całkowanie ze stałą prędkością przy doskonałym IMU, wspomaganie GNSS, estymacja biasu akcelerometru oraz benchmark 120-s przerwy ograniczonej przez CAI.

seg-087521bb32b7 = <b>Uczciwe ujęcie pozycjonowania kwantowego.</b> Nagłówkowy deskryptor to teraz <b>„symulator odporności PNT z modelami osiągów czujników kwantowych”</b> konsekwentnie w haśle README, linii cytowania, <c1/> (tytuł + streszczenie) i grafice banera — zastępując luźniejsze marketingowe sformułowanie „hybrydowy kwantowo-klasyczny symulator PNT”. Sekcja README <em>Czym jest / czym nie jest</em> zyskuje jawne stwierdzenie zakresu <b>„Nie jest (jeszcze)”</b> (nie jest silnikiem fizyki interferometrii atomowej od podstaw, nie jest odbiornikiem GNSS / solverem PVT, nie jest narzędziem do projektowania misji), a nowy <c2/> najwyższego poziomu czyni <b>warstwę fizyki kwantowej pozycją P2</b> (faza CAI Macha–Zehndera, szum rzutu, tensor wibracji), aby czytelnicy wiedzieli, że fizyka od podstaw jest w zakresie i nadchodzi, a nie została porzucona. Bez zmian w zachowaniu ani w API.

seg-f8fa36190ec7 = Badanie kompromisów projektu konstelacji: przegląd projektów Walkera z frontem Pareto, JSON czasu rewizyty oraz walidacja wzoru Walkera z dokładnością poniżej kilometra.

seg-31518e92d8cf = <c1/> zyskuje <c2/>, który uruchamia siatkę <c3/> (np. kompromis { "3" }×{ "3" }) przy stałym nachyleniu i dla każdego projektu zestawia ułamek pokrycia, najgorszy PDOP oraz maksymalną/średnią przerwę rewizyty; <c4/> oznacza projekty niezdominowane (mniej satelitów, większe pokrycie, niższy PDOP, krótsza rewizyta), a <c5/> serializuje komórki i front Pareto — wraz z polami czasu rewizyty — jako JSON. Nowa walidacja przypina generator do wzoru Walkera <c6/>: wykazano, że satelity w tych samych slotach w sąsiednich płaszczyznach odwzorowują się na siebie dokładną rotacją <c7/> z dokładnością <b>poniżej { "1" } km w ciągu pełnych { "24" } h</b> propagacji SGP4 (oddychanie krótkookresowe J2 jest wspólne i znosi się), a sloty w płaszczyźnie są potwierdzone jako rozmieszczone co <c8/> w średniej. Opiera się na zatwierdzonej rzeczywistej migawce Celestrak <c9/> z 2021-07-28 (<c10/>, wykorzystywanej przez testy pokrycia scenariuszy i obiegu SP3).

seg-71d257587c28 = <b>Zaawansowany transfer czasu i częstotliwości: TWSTFT, wspólny widok GNSS, PPP, optyczny, dopasowanie potęgowe PSD wg IEEE-1139 i zespół zegarów.</b> Nowy <c1/> buduje operacyjne metody transferu na dostarczonych postaciach zamkniętych Sagnaca/wspólnego widoku oraz narzędziach stabilności Allana. <c2/> podaje poprawkę Sagnaca dla dwukierunkowego transferu czasu i częstotliwości przez satelitę (Two-Way Satellite Time and Frequency Transfer) jako sumę pętli o trzech skokach, równą dokładnie postaci zamkniętej BIPM <c3/> (sprawdzonej krzyżowo przez niezależne <c4/>); <c5/> emituje jednodobowy szereg <c6/> i jego TDEV. <c7/> wykonuje pojedyncze różnicowanie dwóch syntetycznych stacji naziemnych, tak że zegar satelity się znosi. <c8/> + <c9/> to kombinacja wolna od jonosfery dla PPP i rozwiązanie zegara odbiornika względem prawdy klasy SP3 (syntetycznej), dokładnie znosząca jonosferę pierwszego rzędu. <c10/>, <c11/> i <c12/> o jednostkowej średniej modelują wywołaną turbulencją scyntylację łącza optycznego w wolnej przestrzeni. <c13/> to pełne pięciowspółczynnikowe dopasowanie najmniejszych kwadratów <c14/> wg IEEE-1139 do krzywej wariancji Allana (wszystkie pięć kanonicznych procesów szumu naraz) z dominującym procesem podawanym dla każdej dekady τ. <c15/> tworzy ważoną odwrotnością wariancji papierową skalę czasu, której odchylenie Allana spada ściśle poniżej najlepszego zegara składowego. { "31" } testów jednostkowych; celami walidacji są postacie zamknięte i prawda syntetyczna — rzeczywisty import BIPM Circular-T / IGS SP3 pozostaje do zrobienia.

seg-c3ab93e7324f = Mapy jonosfery IONEX: parser plików, interpolacja w czasie i mapowanie nachylenia ukośnego.

seg-7b94a515ce2b = <c1/> zyskuje <c2/>, który odczytuje format plików IONEX (definicja siatki w nagłówku + bloki <c3/>) do sekwencji <c4/> — normalizując kolejność szerokości od północy do południa do <c5/> z dodatnim krokiem i skalując wartości przez <c6/>. <c7/> łączy dwie kolejne mapy do epoki zapytania, a <c8/> / <c9/> odwzorowują pionowe TEC na promień ukośny przez współczynnik cienkiej powłoki jednowarstwowej <c10/> (<c11/>). Razem z dostarczonym modelem siatki zamieniają one zmierzoną globalną mapę jonosfery IGS w użyteczne opóźnienie ukośne.

seg-2ed90763cf11 = Projekt konstelacji: wymiarowanie ulic pokrycia (streets-of-coverage) i porównanie wielu konstelacji.

seg-326e8957bb10 = <c1/> zyskuje <c2/>, wyidealizowany solver minimalnej liczby satelitów metodą ulic pokrycia — z dostarczonego półkąta pokrycia <c3/> i półszerokości ulicy <c4/> wymiaruje prawie biegunową konstelację dla ciągłego pojedynczego pokrycia globalnego jako <c5/> płaszczyzn (np. 4-satelitowa płaszczyzna na wysokości GPS wymaga { "2" } płaszczyzn, { "8" } satelitów) i zgłasza <c6/>, gdy satelity są zbyt rzadkie, by utworzyć ciągłą ulicę. <c7/> to narzędzie porównania wielu konstelacji: ocenia każdy nazwany projekt Walkera na tej samej stacji/oknie przez <c8/> i zwraca ich pokrycie / PDOP / rozmiar obok siebie. Uczciwy zakres: korekcja Ridera dokładna na szwie na granicy płaszczyzn przeciwbieżnych oraz glob pokrycia 3-D są kolejnymi krokami.

seg-90f5ec9ff4ae = Wielowarstwowa detekcja spoofingu: detektor parzystości zgodności RAIM + fuzja warstw.

seg-a0e4878bea45 = <c1/> zyskuje trzecią i ostatnią warstwę detekcji oraz etap fuzji: <c2/> dopasowuje metodą najmniejszych kwadratów rozwiązanie położenia/zegara do nadmiarowego zestawu pseudoodległości i testuje pozostałą ważoną sumę kwadratów reszt względem jej progu χ²<c3/> — oznaczając obciążony <em>podzbiór</em> satelitów, a jednocześnie poprawnie pozostawiając obciążenie <em>wspólne</em> (pochłaniane przez zegar odbiornika) niewidocznym dla RAIM, a nie zamaskowanym. <c4/> łączy warstwy parzystości, AGC i SQM w jedną ważoną decyzję, która zapisuje, które warstwy zadziałały. Monte Carlo charakteryzuje detektor: empiryczne <b>P_fa ≈ { "0.068" }</b> względem punktu projektowego { "0.05" }, z <b>niewykrytymi zdarzeniami spadającymi z { "0.885" } przy obciążeniu spoofingu 2σ do { "0.16" } przy 8σ</b>. Uczciwy zakres: walidacja krzyżowa względem konkretnych opublikowanych wektorów testowych spoofingu (Spirent / ION GNSS+) wymaga tych zewnętrznych zbiorów danych i pozostaje kolejnym krokiem.

seg-2413b3d10f5b = <b>Zespół walidacyjny filtru Kalmana: sprzężony wobec rozprzężonego.</b> 100-próbowe Monte Carlo w <c1/> określa ilościowo wartość utrzymywania kowariancji krzyżowej położenie↔zegar: wierny, wbudowany rozprzężony punkt odniesienia (sprawdzony co do bitu względem dostarczonego <c2/>) przetwarza te same dane z wyzerowanymi blokami krzyżowymi, a po niemal zdegenerowanych pseudoodległościach i poprawce wyłącznie zegara filtr sprzężony odtwarza położenie z <b>{ "2.97" } m RMS wobec { "48.8" } m filtru rozprzężonego, wygrywając w { "97" } z { "100" } prób</b> — poprawka zegara wyostrza położenie tylko przez korelację, którą rozprzężony pakiet odrzuca. To dopełnia zestaw walidacji poprawności Kalmana (postać Josepha, bezpieczeństwo PSD, spójność NEES/NIS, a teraz zespół filtra sprzężonego).

seg-804f35695553 = <b>Potok wyznaczania orbity (wsadowy + sekwencyjny).</b> Nowy <c1/> odtwarza stan orbitalny satelity <c2/> ze śledzenia odległości ze stacji naziemnej, składając trzy dostarczone elementy: model sił dwuciałowy + J2 (<c3/>) i integrator RK4 (<c4/>) propagują stan kandydujący przez łuk, model pomiaru odległości przewiduje odległość do każdej stacji, a wsadowy korektor Gaussa–Newtona (<c5/>) sprowadza kandydata do stanu najlepszego dopasowania (<c6/>). Ta sama dynamika i model odległości napędzają też <b>sekwencyjne</b> rekurencyjne wyznaczanie na dostarczonym filtrze bezśladowym (<c7/>). Cztery testy je walidują: przewidywanie odległości na łuku; <b>odzyskanie wsadowe poniżej metra / mm·s⁻¹ z bezszumowych odległości</b>; odzyskanie wsadowe do <b>~{ "2" } m z resztą po dopasowaniu na poziomie szumu { "5" } m</b> (sygnatura spójnego dopasowania najmniejszych kwadratów); oraz odzyskanie sekwencyjne w granicach dziesiątek metrów. Uczciwy zakres: pomiary prędkości zmian odległości/Dopplera i kątów, analityczna macierz przejścia stanu J2 oraz maskowanie widoczności stacji są kolejnymi krokami.

seg-0a81039e510c = <b>Ściśle sprzężony nawigator UKF GNSS/INS.</b> Nowy <c1/> podłącza dostarczony rdzeń bezśladowego filtru Kalmana (<c2/>) do działającego ściśle sprzężonego nawigatora na ośmiostanowym <c3/> (położenie/prędkość ECEF oraz bias i dryf zegara odbiornika w jednostkach odległości). Przyjmuje <b>surowe pomiary satelitarne</b> — <c4/> (<c5/>) oraz <c6/>/Doppler (<c7/>) — zamiast wstępnie sformowanej poprawki położenia, więc <c8/> (z <c9/>/<c10/>/ <c11/>) nadal koryguje <b>przy mniej niż czterech satelitach</b> i dryfuje przez przerwy GNSS na swojej propagowanej dynamice. Pięć testów waliduje go od końca do końca, w tym scenariusze akceptacyjne kamienia milowego: geometrię pseudoodległości/Dopplera względem wartości ręcznych; bezszumową zbieżność do <b>poniżej metra</b> przy pięciu satelitach; przypadek <b>trzech satelitów</b> zbiegający z ~{ "212" } m do ~{ "13" } m, gdzie migawkowego PVT nie da się nawet sformować; <b>120-sekundową przerwę</b> przy stałej prędkości w granicach { "50" } m; oraz — główny test akceptacyjny — <b>30-minutowy przelot po zakrzywionej orbicie LEO</b> (rzeczywista orbita dwuciałowa + J2) z <b>120-sekundową przerwą GNSS</b>, utrzymany na <b>{ "0.77" } m RMS przelotu</b> i <b>{ "2.9" } m w najgorszym przypadku podczas przerwy</b>. Ten orbitalny dryf składa dostarczony model sił grawitacji (<c12/>) i integrator RK4 (<c13/>) w model procesu UKF (<c14/>), więc filtr podąża za krzywizną orbity — czego nie potrafi dryf przy stałej prędkości (sama krzywizna to ~{ "58" } km na { "120" } s na LEO). Uczciwy zakres: dryf orbitalny używa modelu sił dwuciałowego + J2, a nie surowej siły właściwej z IMU (dla niezasilanej platformy orbitalnej są one tożsame); dołączenie stanu błędów IMU strapdown i korekcji jono/tropo w pętli pozostaje kolejnym krokiem.

seg-792f25a4a1da = <b>Model pomiaru z dopasowaniem map (nawigacja odniesiona do terenu / grawitacji).</b> Nowy <c1/> dostarcza model pomiaru, który zamienia dostarczony filtr cząstek z sekwencyjną ważoną próbkowaną ponownie ważnością (<c2/>) w działający nawigator bez GPS: <c3/> (gaussowska wiarygodność dopasowania pola) i <c4/>, które próbkuje dowolne georeferencyjne pole odniesienia — wysokość terenu (TRN) lub anomalię grawitacyjną — w położeniu cząstki i waży ją zgodnością ze zmierzoną wartością pojazdu. Polem jest dowolny próbnik <c5/>, więc składa się z siatką dwuliniową w <c6/> lub domknięciem. Dwa testy go kotwiczą — wiarygodność ma szczyt (={ "1" }) przy idealnym dopasowaniu i spada do <c7/> przy jednym sigma, a filtr cząstek nad wyrazistym syntetycznym fragmentem terenu odzyskuje prawdziwe położenie w granicach { "0.1" }. Uczciwy zakres: rzeczywiste mapy referencyjne (wysokość SRTM, anomalia grawitacyjna EGM/EIGEN) i ich loadery są kolejnymi krokami.

seg-9240e95a5058 = <b>Integralność PNT cislunarnego (księżycowe ARAIM).</b> Nowy <c1/> stosuje ziemski silnik ARAIM MHSS do usługi nawigacji księżycowej w stylu LunaNet z parametrami księżycowymi (<c2/> wobec { "0.6" } m dla GPS, <c3/>): stałe księżycowe, selenocentryczna baza Wschód/Północ/Góra i pomocnik geometrii nieba oraz <c4/> (HPL/VPL). Trzy testy go kotwiczą — ortonormalną bazę selenocentryczną, geometrię odległości ukośnej oraz dokładne liniowe skalowanie poziomu ochrony z <c5/> (księżycowe { "30" } m daje { "50" }× większy poziom ochrony niż ta sama geometria przy { "0.6" } m GPS — ilościowy powód, dla którego integralność PNT na Księżycu jest trudna). Uczciwy zakres: precyzyjna efemeryda NRHO LANS, budżet błędów sygnału w przestrzeni i redukcja układów MCI↔MCMF są kolejnymi krokami.

seg-4a43e2ff83d7 = <b>Dwuczęściowe (wysokiej precyzji) daty juliańskie.</b> Nowy <c1/> dodaje <c2/>, datę juliańską podzieloną na całkowitą <c3/> i ułamkową <c4/> w <c5/> (konwencja SOFA/hifitime), z <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Różnice pobliskich epok pozostają dokładne do dna <c11/>, gdzie pojedyncza JD w <c12/> traci ~{ "50" } µs w pobliżu J2000. Cztery testy go kotwiczą: obieg w obie strony, normalizację ułamka, dokładne odzyskanie mikrosekundy (z pokazaną obok awarią pojedynczej <c13/>) oraz addytywną i odwracalną arytmetykę sekund.

seg-8eef92a85711 = <b>Zapisywacz CCSDS OMM (Orbit Mean-Elements Message).</b> Nowy <c1/> uzupełnia zapisywacz efemeryd <c2/> o komunikat średnich elementów: <c3/> odwzorowuje średnie elementy SGP4/TLE na jednostki OMM (ruch średni w obr./dobę, kąty w stopniach oraz <c4/>), a <c5/> serializuje formę KVN CCSDS 502.0-B-2 z toru standaryzacji — dzięki czemu orbitę Kshana może przetworzyć każde narzędzie rozumiejące OMM, zamiast własnego TLE. Dwa testy kotwiczą konwersję jednostek TLE→OMM (≈ { "15.5" } obr./dobę, nachylenie { "51.6" }° itd.) oraz obecność wymaganych słów kluczowych KVN. Uczciwy zakres: forma KVN i odwzorowanie TLE są dostarczone tutaj; renderowanie XML (<c6/>) i obieg w obie strony z parserem referencyjnym są kolejnymi krokami.

seg-ca2b730b5cc3 = <b>Filtr cząstek z sekwencyjnym ważonym próbkowaniem ponownym.</b> Nowy <c1/> dodaje nieliniowy, niegaussowski estymator stojący za nawigacją wspomaganą mapą, bez GPS (dopasowanie map terenu lub grawitacji): <c2/> (propagacja cząstek przez dynamikę + gaussowski szum procesu), <c3/> (przeważenie wiarygodnością pomiaru dla każdej cząstki), systematyczne <c4/>, monitor degeneracji <c5/> i estymata średniej ważonej. Sześć testów dokładnie kotwiczy deterministyczny rdzeń — ESS obejmujące { "1" }…N, systematyczne próbkowanie ponowne wybierające indeksy proporcjonalnie do wagi, wypukłą kombinację średniej ważonej, gaussowską wiarygodność przyciągającą estymatę do pomiaru, zachowanie próbkowania ponownego do rozkładu jednostajnego oraz determinizm predict z ziarnem. Uczciwy zakres: silnik jest dostarczony tutaj; mapy referencyjne (wysokość SRTM, anomalia grawitacyjna EGM) i model pomiaru mapy są kolejnymi krokami (próbnik siatki z interpolacją dwuliniową <c6/> obsłużyłby równie dobrze mapę grawitacji/terenu).

seg-564ad319685e = <b>Mapy jonosfery TEC w stylu IONEX.</b> Nowy <c1/> dodaje zmierzoną jonosferę jako alternatywę dla nadawanego modelu Klobuchara: <c2/> (regularna siatka szerokość/długość pionowego TEC, globalna mapa jonosfery IGS) z interpolacją dwuliniową w punkcie przebicia (<c3/>, ograniczoną poza siatką) oraz opóźnieniem pierwszego rzędu <c4/> (<c5/>, <c6/>). Cztery testy go kotwiczą: <c7/> na L1 ze skalowaniem <c8/>, interpolację dokładną w węzłach, środki dwuliniowe uśredniające narożniki oraz zapytania spoza siatki ograniczone do krawędzi. Uczciwy zakres: siatka i interpolacja są dostarczone tutaj; parsowanie formatu plików IONEX, interpolacja w czasie między mapami i funkcja mapowania ukośnego są kolejnymi krokami.

seg-26c7b53cbc8c = <b>Geometryczne poprawki transferu czasu (Sagnac + wspólny widok GNSS).</b> Nowy <c1/> dodaje dwa efekty deterministyczne, które musi uwzględniać rzeczywiste porównanie zegarów, uzupełniając stochastyczny model dwukierunkowy w <c2/>: <c3/> (<c4/>, opóźnienie wirującej Ziemi — dziesiątki ns dla linii bazowych kontynentalnych) oraz <c5/>, pojedynczą różnicę wspólnego widoku GNSS, która dokładnie znosi błąd zegara satelity i odtwarza przesunięcie między stacjami. Trzy testy kotwiczą je na dokładnych wzorcach: ≈ { "33" } ns efektu Sagnaca dla równikowego ćwierćobrotu, antysymetrię i zerowe przypadki radialny/biegunowy oraz dokładne zniesienie zegara satelity. Uczciwy zakres: pełny budżet opóźnień transpondera/sprzętu TWSTFT oraz rozwiązanie transferu czasu PPP wolne od jonosfery są kolejnymi krokami.

seg-098e7ea0ee13 = <b>Model sił orbitalnych (dwuciałowy + J2).</b> Nowy <c1/> dodaje model przyspieszeń, który całkuje propagator numeryczny: <c2/> (<c3/>), perturbację spłaszczenia <c4/> (postać zamknięta ECI) oraz <c5/> je sumujące — w parze z <c6/> jako <c7/>. Udostępnia też analityczne <b>tempa wieku</b> J2 (<c8/>): regresję węzła <c9/>, obrót apsyd <c10/> i dryf anomalii średniej <c11/>. Sześć testów kotwiczy fizykę na dokładnych wzorcach: <c12/> dla członu dwuciałowego, postać zamkniętą J2 na równiku (~{ "10" }⁻³ wielkości dwuciałowej), <b>nachylenie krytyczne</b> ({ "63.4349" }°), które zamraża perygeum (<c13/>), regresję węzła ISS (<c14/>) oraz dryf na wschód orbity wstecznej heliosynchronicznej. Uczciwy zakres: wyłącznie dwuciałowy + J2; J3–J6, opór, SRP i ciało trzecie są kolejnymi krokami.

seg-d5c03ebc5707 = <b>Odnośniki do scenariuszy do udostępniania.</b> Nowy <c1/> dodaje niezależny od zależności kodek Base64 wg RFC { "4648" } (standardowy alfabet <c2/> z dopełnieniem oraz bezpieczny dla URL alfabet <c3/> bez dopełnienia) i opakowania <c4/> / <c5/>, dzięki czemu TOML z playground można zakodować w parametrze zapytania <c6/> i udostępnić jako URL. Udostępniony przeglądarce jako wiązania wasm <c7/> / <c8/>. Cztery testy go kotwiczą na kanonicznych wektorach RFC { "4648" } (<c9/> → <c10/> itd.), obieg w obie strony scenariusza bezpiecznego dla URL (bez <c11/>/<c12/>/<c13/> do uciekania), odrzucanie nieprawidłowych symboli oraz obieg w obie strony wszystkich 256 bajtów. Uczciwy zakres: kodek i wiązania są dostarczone tutaj; interfejs przycisku Share w playground, wielosegmentowy wykres Plotly/D3 i tryb porównania A/B są kolejnymi krokami.

seg-b615fb16d547 = <b>Wsadowa metoda najmniejszych kwadratów Gaussa–Newtona (wsadowy korektor różniczkowy).</b> Nowy <c1/> dodaje rdzeń estymacji, na którym opiera się wsadowe <em>wyznaczanie orbity</em> (lub dowolne dopasowanie parametrów): <c2/> linearyzuje dostarczony przez użytkownika model <c3/> za pomocą jakobianu z centralnej różnicy skończonej, tworzy i rozwiązuje ważone równania normalne <c4/> (z ponownym użyciem przetestowanej macierzy odwrotnej) i iteruje do zbieżności z wagami dla każdego pomiaru. Cztery testy go kotwiczą: liniowe dopasowanie prostej osiągające dokładne rozwiązanie ważonych najmniejszych kwadratów, nieliniowe dopasowanie <c5/> odzyskujące prawdziwe parametry, trójwymiarową multilaterację odległości 3-D, która odzyskuje znane położenie z wolnych od szumu odległości (odmiana wyznaczania orbity), oraz odrzucanie wejść niedookreślonych/niezgodnych. Uczciwy zakres: to ogólny silnik korektora; model pomiaru odległości/prędkości zmian odległości/azymutu-elewacji specyficzny dla orbity, analityczna macierz przejścia stanu J2 i walidacja na opublikowanym przypadku są kolejnymi krokami.

seg-0ada87934135 = <b>Monitory spoofingu w warstwie RF (moc AGC i SQM).</b> Nowy <c1/> dodaje dwa niezależne detektory spoofingu w przednim torze odbiornika, które uzupełniają wspomagany zegarem monitor spoofingu czasu w <c2/>: <b>monitor mocy AGC</b> (<c3/> niekoherentna suma mocy + <c4/>), który oznacza nadmiar odbieranej mocy dodawany przez nadajnik spoofingu ponad konfigurowalny margines w dB, oraz <b>monitor jakości sygnału</b> (<c5/> trójkątna autokorelacja kodu + <c6/>), który oznacza niezrównoważenie korelatora Early-minus-Late wprowadzane przez wielodrogowość/meaconing/replay. Cztery testy kotwiczą dokładne postacie zamknięte ({ "3.01" } dB dla podwojenia mocy, agregat <c7/>, trójkątne <c8/> i próg alarmowy Early/Late { "10" } %). Uczciwy zakres: pełny detektor spoofingu parzystości zgodności RAIM, wielowarstwowa fuzja wyjść monitorów i walidacja względem opublikowanych wektorów spoofingu Spirent/ION GNSS+ są kolejnymi krokami.

seg-b1ff62d88cd2 = <b>Adaptacyjny numeryczny integrator równań różniczkowych zwyczajnych.</b> Nowy <c1/> dodaje pierwszy element propagatora <em>numerycznego</em> (propagacja orbity w Kshana jest poza tym analityczna wg SGP4/SDP4): ogólny krok Rungego–Kutty czwartego rzędu (<c2/>) dla dowolnego układu pierwszego rzędu <c3/> oraz sterownik adaptacyjny (<c4/>), który kontroluje błąd lokalny przez <b>podwajanie kroku</b> (ekstrapolacja Richardsona) ze standardowym sterownikiem kroku <c5/> i logiką akceptacji/odrzucenia. Sześć testów go kotwiczy na dokładnych rozwiązaniach: wykładnicze <c6/> do <c7/>, ~{ "16" }-krotne zmniejszenie błędu przy każdym połowieniu kroku, co dowodzi zbieżności czwartego rzędu, zachowanie energii/powrotu oscylatora harmonicznego przez pełny okres oraz sterownik adaptacyjny spełniający ścisłą tolerancję ze zmiennymi krokami. Uczciwy zakres: to rdzeń integratora i jego kontrola błędu; zagnieżdżone tablice Dormanda–Prince'a RK5({ "4" })/RKF7({ "8" }) i hierarchiczny model sił orbity (dwuciałowy + J2–J6 + opór + SRP + ciało trzecie), które czynią z niego <c8/>, są kolejnymi krokami.

seg-ca53c62839d8 = <b>Bezśladowy (sigma-point) filtr Kalmana.</b> Nowy <c1/> dodaje skalowany bezśladowy filtr Kalmana (Julier i Uhlmann; Wan i van der Merwe) jako ogólny estymator <c2/>-stanowy nad dostarczonymi przez użytkownika funkcjami procesu i pomiaru — estymator punktów sigma, którego używa ściśle sprzężony nawigator GNSS/INS, gdy model pseudoodległości/Dopplera jest silnie nieliniowy, a jakobian EKF się pogarsza. Zawiera towarzyszącą gęstą algebrę liniową (czynnik Choleskiego dla rozrzutu punktów sigma, odwrotność Gaussa–Jordana dla kowariancji innowacji) oraz aktualizację <c3/> bez formy Josepha. Sześć testów go przypina, kluczowe z nich wykorzystują dokładną własność, że dla modelu <em>liniowego</em> transformacja bezśladowa odtwarza filtr Kalmana z precyzją numeryczną (predykcja, aktualizacja i pełny cykl predykcja+aktualizacja dopasowane do ręcznie uruchomionego liniowego KF, plus analityczna kontrola 1-D posterioru bayesowskiego i tożsamości Choleskiego/odwrotności). Uczciwy zakres: to silnik estymatora; 17-stanowy ściśle sprzężony nawigator GNSS/INS, model pomiaru pseudoodległości/Dopplera i scenariusz walidacji przerwy pozostają kolejnymi krokami.

seg-da92d32b5715 = <b>Poziomy ochrony ARAIM dla dwóch konstelacji.</b> Nowy <c1/> rozszerza ARAIM (Advanced RAIM) pojedynczego błędu (<c2/>) o <b>tryb błędu całej konstelacji</b> z EU ARAIM / DO-316: obok hipotez bez błędu i błędu pojedynczego satelity każda konstelacja (oznaczona dla każdego satelity) wnosi jedną hipotezę usuwającą naraz wszystkie jej satelity, z prawdopodobieństwem a priori <c3/> (nowe <c4/>). Każda hipoteza dodaje człon do tej samej sumy integralności MHSS, więc VPL/HPL to najmniejsze granice, których całkowite <c5/> spełnia budżet dla błędów: brak błędu + pojedynczy SV + na konstelację (podział fałszywych alarmów Bonferroniego obejmuje wszystkie <c6/> hipotezy). Przy <c7/> wynik jest identyczny co do bitu z <c8/>; użytkownik jednokonstelacyjny zwraca <c9/> względem błędu własnej konstelacji (nie można jej wykluczyć) — i właśnie dlatego pokrycie dwukonstelacyjne ma znaczenie. Cztery testy obejmują równoważność, poszerzenie poziomu ochrony, niedostępność w przypadku jednej konstelacji i walidację wejścia, z ponownym użyciem istniejącej maszynerii podrozwiązań separacji rozwiązań.

seg-d06c5f88282b = <b>Precesja IAU { "2006" } (kąty Fukushimy–Williamsa i macierz bias-precesja).</b> Nowy <c1/> implementuje precesję IAU { "2006" } (P03; Capitaine, Wallace i Chapront { "2003" }): cztery kąty Fukushimy–Williamsa <c2/> jako wielomiany w stuleciach juliańskich TT (<c3/>) oraz macierz rotacji bias-precesja GCRS→średni układ na datę zbudowaną z nich metodą SOFA <c4/> (<c5/>, z pomocnikami <c6/> / <c7/>). To pierwszy element układu inercjalnego na bazie istniejącej redukcji <c8/> opartej na GMST. Osiem testów waliduje względem kotwic w postaci zamkniętej — średniego nachylenia ekliptyki J2000 <c9/>, opublikowanych stałych członów kątów, akumulacji precesji ogólnej <c10/> w ciągu stulecia, ortonormalności macierzy i <c11/>, wartości prawie tożsamościowej (wyłącznie bias układu) w J2000 oraz kąta rotacji netto <c12/>/stulecie. Uczciwy zakres (<c13/>): wyłącznie precesja — 678-członowa nutacja IAU 2000A, pełny łańcuch TEME→GCRS i numeryczna kontrola krzyżowa SOFA/ANISE µas/<{ "10" } m są kolejnymi krokami.

seg-14c0a863eef1 = Fizyka akcelerometru interferometru zimnych atomów (CAI) od podstaw.

seg-408fc6feb284 = <c1/> modeluje trzyimpulsowy interferometr atomowy Macha–Zehndera od podstaw, a nie z arkusza danych: efektywny wektor falowy <c2/>, fazę interferometru <c3/>, kwantowy szum rzutowania (śrutowy) <c4/>, czułość na przyspieszenie dla pojedynczego strzału, zanik kontrastu <c5/> i — co najważniejsze — <c6/>, które <b>wyprowadza</b> białe PSD przyspieszenia, które klasyczne <c7/> już zużywa, z liczby atomów, czasu interrogacji i kontrastu. Model obejmuje teraz także <b>sprzężenie drgań</b> — dominujący człon w rzeczywistym urządzeniu: funkcję przejścia interferometru przyspieszenie→faza <c8/> (<c9/>), wariancję fazy dla białego PSD <c10/> (<c11/>, z numeryczną kontrolą krzyżową całki pasmowej <c12/>), rzut wzdłuż wiązki rzędu 1 <c13/> oraz <c14/> / <c15/> (to ostatnie redukujące się do poziomu <c17/> niezależnego od <c16/>). Jedenaście testów ręcznie weryfikuje fizykę (Rb-87 <c18/>, <c19/>, <c20/>/strzał poziom szumu śrutowego wobec ≈ { "5.9" } µg poziomu drgań, prawa skalowania <c21/>, <c22/> i <c23/>). Uczciwy zakres w <c24/>: obejmuje to poziom szumu rzutowania i reżim ograniczony drganiami powyżej niego; szum fazy lasera, systematyki Coriolisa i przesunięcia świetlnego oraz scenariusze walidacyjne PHARAO/CARIOQA pozostają kolejnymi krokami.

seg-ed668459d019 = <b>Akcelerometr kwantowy CAI podłączony do scenariusza inercjalnego.</b> Akcelerometr w scenariuszu nawigacji zliczeniowej inercjalnej rozstrzyga się teraz do nowego <c1/> — <c2/> (istniejący czujnik ze współczynnikami z arkusza danych) lub <c3/>, gdy niesie opcjonalny blok <c4/> (<c5/>: długość fali, odstęp impulsów, liczba atomów, kontrast, czas cyklu i opcjonalne <c6/> platformy). Czujnik <c7/> ma PSD losowego błądzenia prędkości <c8/> <b>wyprowadzone</b> z fizyki interferometru — poziom szumu śrutowego plus, gdy podano PSD drgań, składnik ograniczony drganiami w kwadraturze — zamiast dostarczonego współczynnika, a proweniencja przebiegu zapisuje, że szum pochodzi z fizyki. Pole <c9/> to <c10/>, więc istniejące scenariusze je pomijają i serializują się identycznie co do bajtu (hash scenariusza bez zmian). Pięć testów obejmuje wyprowadzenie, sumę drgań w kwadraturze, wybór <c11/>/<c12/>, serializację stabilną względem hasha i przebieg od końca do końca napędzany przez CAI.

seg-c3978a122010 = Optymalizator projektu konstelacji i geometria ulic pokrycia (streets-of-coverage).

seg-aae519e71c00 = <c1/> zyskuje <c2/>, bezgradientowy optymalizator siatkowy, który przeszukuje przestrzeń projektów <c3/> i zwraca najlepszy projekt Walkera dla wybranego <c4/> — <c5/>, <c6/> lub <c7/> — na już sprawdzonym przeglądzie PDOP (test potwierdza, że zwraca zwycięzcę z przeszukania wyczerpującego). Dodatkowo analityczne postacie zamknięte <b>ulic pokrycia</b> <c8/> (<c9/>) i <c10/> (<c11/>, Rider/Beste), ręcznie zweryfikowane względem podręcznikowej geometrii i wykrywające lukę niedoludnienia. Pełny solver minimalnej liczby satelitów dla pokrycia globalnego wg Ridera, glob playground 3-D i zewnętrzna kontrola krzyżowa DOP pozostają kolejnymi krokami.

seg-7b8468636dea = <b>Eksport precyzyjnych efemeryd SP3 z CLI.</b> Propagowany scenariusz orbity/konstelacji można teraz zapisać do pliku SP3-c: <c1/>, albo <c2/> w scenariuszu automatycznie zapisuje <c3/> (<c4/> / <c5/>, <c6/>, opcjonalne <c7/>). Test obiegu w obie strony (<c8/>) propaguje rzeczywistą migawkę Celestrak <c9/>, eksportuje ją, ponownie parsuje i potwierdza, że odzyskane położenia ECEF zgadzają się z prawdą SGP4 w ciągu { "24" } h do <b>< { "0.5" } m</b> (dobrze w granicach tolerancji klasy TLE { "10" } m). README dokumentuje rolę interoperacyjności (RINEX → RTKLIB/gLAB, SP3 → Ginan/precyzyjne produkty orbit).

seg-56c729ba110f = Sprzężony filtr Kalmana zegara i położenia (kowariancja krzyżowa między blokami).

seg-0a424875131d = <c1/> to pojedynczy skumulowany filtr <c2/> (aktualizacje w formie Josepha), którego pomiar <b>pseudoodległości</b> <c3/> naprawdę sprzęga bloki położenia i zegara — w przeciwieństwie do dawnego pakietu fuzji z dwoma niezależnymi filtrami dwustanowymi, które utrzymują kowariancję między blokami dokładnie zerową. Sprawdzone: wspólna pseudoodległość czyni <c4/> niezerowym; dwie odrębne geometrie łącznie rozwiązują wstrzyknięte przesunięcia położenia i zegara, których pojedyncza odległość nie rozdzieli; <b>poprawka wyłącznie zegara wyostrza położenie</b> przez kowariancję krzyżową (korzyść, której filtry rozprzężone nie dają); a NEES z Monte Carlo jest <b>spójne z χ²({ "4" })</b>. To realizacja 1-DOF (wymiarowość pakietu fuzji); rozszerzenie 3-D z 8 stanami i podłączenie do uruchamialnego pakietu są śledzone jako kolejne kroki.

seg-3983794a9584 = <b>Monitorowanie zdrowia spójności filtra Kalmana (NIS/NEES).</b> Aktualizacja kowariancji dwustanowego filtra zegara jest teraz w <b>stabilizowanej formie Josepha</b> `P⁺ = (I−KH)P(I−KH)ᵀ

seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, table-checked).

seg-f9689061a1d2 = <b><c1/> — jedna cytowalna tabela proweniencji.</b> Konsoliduje każdy parametr czujnika (zegary, inercjalne, transfer czasu), model fizyczny/algorytmiczny (orbita, systemy czasu, układy odniesienia, jono/tropo, integralność, detekcja, jamming, Allan) i zbiór danych walidacyjnych (AIAA 2006-6753, Celestrak <c2/>) wraz z jego opublikowanym źródłem — arkuszem danych, artykułem, ICD lub normą — oraz uczciwą etykietą dojrzałości (flight-qualified / ground-lab / space-goal-on-ground-hardware). Podlinkowana z wprowadzenia README i tabeli Documentation; uzupełnia ciągi <c3/> dla każdego przebiegu, które już podróżują w JSON wyniku.

seg-55c7b52b5fdb = <b>Typowane API scenariuszy.</b> Dyspozycja odbywa się teraz po typowanym enumie <c1/> zamiast dopasowania surowego ciągu <c2/> (<c3/> + wyczerpująca dyspozycja), więc dodanie pakietu jest sprawdzane przez kompilator. Nowe typowane powierzchnie obok niezmienionego <c4/> zwracającego ciąg: <c5/> ze strukturalną taksonomią błędów (<c6/> / <c7/> / <c8/> / <c9/>, każdy ze stabilnym <c10/>); trait <c11/> i punkt rozszerzeń <c12/> (przez niego podłączony jest pakiet <c13/> jako przykład opracowany); oraz introspekcja <c14/> (nazwa, opis, pola wymagane/opcjonalne dla każdego rodzaju). Wiązania Pythona i WebAssembly zyskują <c15/> i <c16/>. Udokumentowane w <c17/>.

seg-2b86391b753e = Rzeczywista konstelacja GPS i pokrycie obwiedni operacyjnej.

seg-288f2b1872c8 = <c1/> dostarcza teraz <b>rzeczywistą migawkę Celestrak <c2/></b> (2021-07-28, { "30" } satelitów) zamiast syntetycznych TLE Walkera, z <c3/>, więc ładuje się tylko wtedy, gdy każda suma kontrolna TLE jest prawidłowa; <c4/> dokumentuje odtwarzalne odświeżanie, a README wskazuje źródło otwartych danych. Nowy <c5/> ćwiczy każdy pakiet na ≥{ "5" } wariantach obwiedni, asercjonując skończone/ograniczone wyjście, potwierdza, że <b>poziom flicker-FM mierzalnie pogarsza dryf zegara</b>, gdy jest włączony (teraz ustawiony w trzech dostarczanych scenariuszach), i potwierdza, że <b>filtr fuzji zbiega się przy realistycznym niezerowym biasie akcelerometru</b> (w granicach { "3" }× przypadku z wyzerowanym biasem), zamykając lukę realizmu „fuzja działa tylko z wyzerowanymi biasami”. <c6/> zyskuje tabelę obwiedni operacyjnej.

seg-f78d7dce7bfa = <b>Symulacja GNSS w dziedzinie pomiarów (rodzaj <c1/>).</b> Model w przód na poziomie pseudoodległości: dla każdego widocznego satelity syntetyzuje <c2/> i Doppler L1, z jednoczęstotliwościową jonosferą <b>Klobuchara</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) i zenitalną troposferą <b>Saastamoinena</b> rzutowaną funkcją mapowania <b>Niella ({ "1996" })</b> — udostępnione jako bloki TOML <c3/> i <c4/>. Reszty zasilają migawkowe RAIM dla HPL/VPL w każdej epoce, a tablica JSON <c5/> niesie pseudoodległość, Doppler, C/N₀ i poprawki jono/tropo każdego SV. Przebieg bez szumu odtwarza geometrię + poprawki z dokładnością poniżej milimetra (test CI). Nowe <c6/> i <c7/>.

seg-833249802c56 = <b>Stochastyczny detektor spoofingu czasu (rodzaj <c1/>).</b> Pakiet spoofingu uruchamia teraz prawdziwy detektor zamiast deterministycznego porównania rampy z granicą: cztery kształty wstrzyknięć (<c2/>, <c3/>, <c4/>, <c5/>), dwustronny test energii χ²₁ / Neymana–Pearsona na statystyce monitora wspomaganego zegarem z progiem ustawionym z docelowego budżetu fałszywych alarmów <c6/> oraz prawdopodobieństwo niewykrytego zdarzenia <c7/> raportowane zarówno w postaci zamkniętej, jak i metodą Monte Carlo (<c8/> prób na hipotezę — oba zgadzają się do kilku ×1/√N). Wskaźnik jakości Security to teraz <c9/> przy operacyjnie szkodliwej (specyfikacyjnej) wielkości. Nowy <c10/> (funkcje ogona gaussowskiego, test NP/energii, Monte Carlo P_fa/P_md) i <c11/>. Zgodny wstecz: sam <c12/> jest nadal akceptowany jako rampa liniowa.

seg-b3f3d2ca8a3d = <b>Definicja wskaźnika jakości Security (rodzaj <c1/>):</b> od analitycznej granicy wykrywalności <c2/> do <c3/> detektora stochastycznego. Pole <c4/> pakietu zegara pozostaje szybszym analitycznym zastępnikiem.

seg-ee1268975b2c = Dodano (ciąg dalszy)

seg-f71696b7fa20 = <b>Model zagłuszania RF (rodzaj <c1/>).</b> Model zakłóceń z bilansem łącza, który zamienia moc i geometrię zagłuszarki na utratę blokady dla każdego satelity: stosunek zagłuszarki do sygnału z tłumienia w wolnej przestrzeni i zysku anteny odbiorczej w każdym kierunku, efektywne C/N₀ przez standardowe równanie przeciwzagłuszeniowe (zysk przetwarzania z despreadingu × współczynnik separacji widmowej <c2/>; Kaplan i Hegarty §{ "9.4" }) oraz konfigurowalny próg śledzenia, oceniane na konstelacji Walkera jako wskaźnik jakości <c3/>. Nowe <c4/> i <c5/>. Uczciwy zakres (bez wielodrogowości, cieniowania terenu, AGC ani adaptacyjnego zerowania) jest udokumentowany w <c6/> / <c7/>.

seg-d4dc36011ea1 = <b>Ogólny przegląd parametrów N-D dla dowolnego rodzaju scenariusza (<c1/>).</b> Poprzedni przegląd N-D dotyczył tylko pakietu zegara. <c2/> zmienia klucze TOML z kropkami scenariusza <c3/> po iloczynie kartezjańskim jego osi, ponownie kieruje każdy węzeł siatki zwykłą ścieżką uruchomienia i odczytuje jedną lub więcej metryk z wyniku po ścieżce JSON z kropkami — więc działa dla każdego pakietu (inertial, gnss-ins, integrity, spoof, …) bez sprzęgania z typem Rust każdego pakietu. Węzły siatki są obliczane równolegle na wątkach systemu operacyjnego na celach natywnych (bez dodatkowej zależności); wasm wraca do sekwencyjnego. Deterministyczny i wierszowo-główny niezależnie od liczby wątków. Nowy przykład <c4/>.

seg-1c42e15d65a9 = <b>Konfigurowalny w TOML deterministyczny model błędów IMU w pakiecie <c1/>.</b> Trójosiowy łańcuch błędów strapdown (współczynnik skali, niewspółosiowość, czułość na g, kwantyzacja, rampa prędkości; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) jest teraz osiągalny dla każdego czujnika z pliku scenariusza przez opcjonalny blok <c2/>, nałożony na stałe biasy włączenia. Pominięcie bloku pozostawia każdy czujnik jako czyste źródło stałego biasu, więc istniejące przebiegi <c3/> są bez zmian. To podłącza dotąd wyłącznie bibliotekowy model błędów do uruchamialnego pakietu i wskaźnika jakości.

seg-e035371fbe58 = <b>Walidacja na rzeczywistych danych.</b> Parser nawigacyjny RINEX dla wielu GNSS, propagator GLONASS RK4 i czytnik SP3 są teraz ćwiczone na autentycznych plikach IGS/DLR (rzeczywisty mieszany nadawany plik nawigacyjny RINEX { "3" } i produkt orbit IGS SP3-c), a nie tylko na samodzielnie przygotowanych próbkach — asercjonując niepuste zbiory satelitów i skończone, fizycznie rozsądne położenia ECEF. Dane testowe służą wyłącznie testom (wyłączone z opublikowanego crate'a); zob. <c1/>.

seg-2a807ae8e194 = <b>RAIM na geometrii rzeczywistej orbity referencyjnej.</b> Rdzenie migawkowe, separacji rozwiązań (MHSS) i poziomów ochrony ARAIM są teraz sprawdzone względem rzeczywistej geometrii precyzyjnych orbit IGS (SP3), a nie tylko syntetycznych konstelacji: geometria linii widzenia jest budowana z pierwszej epoki SP3 na rzeczywistej stacji naziemnej, a testy potwierdzają poziomy ochrony rzędu metrów, dostępne dla APV-I, że obciążenie pseudoodległości { "60" } m wyzwala monitor χ², że separacja rozwiązań <b>identyfikuje</b> uszkodzony satelita oraz że poziomy ARAIM spełniają przydzielone <c1/>. Zamyka lukę walidacji wyłącznie na syntetycznej geometrii (zgodność z gLAB w dziedzinie odbiornika na pełnym łuku RINEX pozostaje pozycją planu rozwoju — wymaga rozwiązania pseudoodległości).

seg-651cc4af4872 = <b>Przedziały ufności dla każdego węzła przeglądu parametrów N-D</b> (<c1/>). Każdy węzeł siatki N-wymiarowego przeglądu po iloczynie kartezjańskim można teraz obliczyć jako zespół Monte Carlo ziaren, raportując średnią metryki, percentyle i percentylowy przedział ufności bootstrap { "95" }% dla każdego węzła (dla obu zegarów) — statystycznie uczciwy przegląd zamiast jednego losowania na węzeł. Wykorzystuje maszynerię zespołu/bootstrap (<c2/>); deterministyczny; <c3/> redukuje się dokładnie do jednoziarnistego <c4/>. (Uogólnienie przeglądu na wszystkie pakiety, powiązane z refaktoryzacją typowanego Scenario, i wykonanie równoległe pozostają.)

seg-815eda56aad9 = <b>Walidacja krzyżowa potoku szumu IMU względem NaveGo</b> (<c1/>). Zewnętrzna kontrola krzyżowa względem NaveGo (otwartoźródłowego zestawu narzędzi INS/GNSS R. Gonzaleza): odtwarza syntetyczny obieg w obie strony z <c2/> na jego opublikowanym profilu odniesienia Microstrain 3DM-GX3-35 i potwierdza, że nasz estymator overlapping-ADEV odzyskuje współczynniki błądzenia przypadkowego prędkości i kąta z NaveGo (<c3/>) z dokładnością poniżej { "5" }%, z oczekiwanym nachyleniem −1/2 dla szumu białego. (Zarejestrowany dziennik STIM300 <c4/> o wielkości { "40" } MB nie jest wczytywany, ponieważ wymaga formatu binarnego.)

seg-b67b3ec240de = Ścisło sprzężona (pseudoodległościowa) aktualizacja GNSS/INS.

seg-c926dddc5256 = <c1/> (oraz nakładka <c2/>) realizują wcześniej tylko zaślepiony pomiar w dziedzinie odległości: innowacją jest różnica między odległością przewidzianą od pozycji INS do każdego satelity a zmierzoną pseudoodległością, z jakobianem kierunku widzenia względem błędu pozycji. Ponieważ każdy satelita to pomiar skalarny, filtr nadal koryguje stan przy <b>mniej niż czterech satelitach</b>, gdy luźno sprzężone rozwiązanie PVT nie istnieje. Pięć testów obejmuje zerowanie błędu przy czterech satelitach, korekcję przy dwóch satelitach (bez możliwości PVT), obserwowalność wzdłuż linii widzenia przy jednym satelicie oraz walidację danych wejściowych. Wyłącznie pseudoodległość; faza nośnej i jawny stan zegara odbiornika pozostają w planach rozwoju. Nieużywana funkcja cargo <c3/> (która obejmowała dawną zaślepkę błędu) została usunięta.

seg-94ebfac3bbc3 = <b>Pakiet scenariuszy luźno sprzężonego GNSS/INS (<c1/>, <c2/>).</b> Łączy trójosiowy nawigator strapdown i 15-stanowy EKF stanu błędu (<c3/> / <c4/>) w uruchamialny scenariusz ze wskaźnikiem jakości: EKF dyscyplinuje mechanizację za pomocą zaszumionych pozycji GNSS, gdy pokrycie jest dostępne, a następnie przechodzi przez przerwę w ruchu bezwładnym, zastępując reset z przywróceniem prawdy z dawnego pakietu skalarnego 1-DOF prawdziwą fuzją. Wynik podaje szereg połączonego błędu poziomego, oceniany wskaźnik jakości pozycji (dostępność / RMS w przerwie / holdover) oraz RMS swobodnego INS w układzie otwartym dla porównania; para IMU kwantowy/klasyczny różni się wyłącznie rzeczywistym biasem. Wywoływany z punktu wejścia CLI/Python/wasm z przykładem <c5/>. Uczciwe ujęcie: wyłącznie sprzężenie luźne, jedna deterministyczna trajektoria, a błąd połączony w przerwie jest ograniczony od dołu błędem orientacji przy przekazaniu (więc nie twierdzimy, że skaluje się z biasem); wnioski solidne są takie, że fuzja pokonuje nieasystowane nawigowanie zliczeniowe dla czujnika z biasem, a czujnik o mniejszym biasie ma lepszy przebieg bez wspomagania.

seg-0a2df01f99d8 = <b>Projektowanie konstelacji na sprawdzonym rdzeniu SGP4 (<c1/>).</b> Nowy moduł <c2/> generuje zaprojektowany wzór Walker-delta (<c3/>) jako <b>elementy uśrednione</b> SGP4, dzięki czemu syntetyczna konstelacja propaguje się tą samą ścieżką SGP4, sprawdzoną z dokładnością { "4.12" } mm względem wektorów AIAA 2006-6753, a nie analitycznym generatorem keplerowskim. Na nim: <c4/> tabeluje pokrycie oraz medianę i najgorszą wartość PDOP w siatce projektów <c5/>, a <c6/> podaje ułamek pokrycia i przerwy w powrotach (najgorsza/średnia) w punkcie naziemnym. Sprawdzone przez fizyczne monotoniczności, których musi przestrzegać kompromis projektowy (więcej satelitów ⇒ większe pokrycie, niższy PDOP, krótszy czas powrotu). Osobno, prawdziwa <b>migawka TLE Celestrak <c7/></b> (2021-07-28, { "30" } działających satelitów GPS) została dodana jako wyłącznie testowy zestaw danych, a ścieżkę geometrii prawdziwe TLE → SGP4 → ECEF sprawdzono względem niej (pełna powłoka MEO w granicach { "1" }%, dziewięć satelitów jednocześnie widocznych przy PDOP { "1.64" }), obok istniejących ścieżek danych rzeczywistych SP3 i RINEX.

seg-9e051f3725df = Efektywne stopnie swobody zależne od typu szumu dla przedziałów ufności Allana.

seg-2392bec8f0b6 = <c1/> implementuje zamknięte wzory z NIST SP { "1065" }, tabela { "5" } (prosty zestaw Stable32) dla wszystkich pięciu kanonicznych typów szumu potęgowego: biały/migotania PM, biały/migotania FM, błądzenie przypadkowe FM, zastępując zachowawczą liczbę nienakładających się próbek jako stopnie swobody χ². Nowy typ wyliczeniowy <c2/> i funkcja <c3/> wskazują typ dominujący na podstawie nachylenia <b>zmodyfikowanego</b> odchylenia Allana rekordu (MDEV odróżnia biały PM od migotania PM tam, gdzie ADEV tego nie potrafi), a <c4/> dołącza teraz do każdego punktu eksportowanej krzywej ADEV zidentyfikowany typ szumu, jego edf oraz pasmo ufności { "95" }% (<c5/> zyskuje <c6/>/<c7/>/<c8/>/<c9/>, addytywnie, z domyślnymi wartościami serde). Sprawdzone dwojako: pięć wzorów zgadza się z wartościami obliczonymi ręcznie z dokładnością { "1e-12" }, a zespół Monte Carlo { "4" } 000 rekordów białego FM potwierdza, że wzór przewiduje rzeczywiste edf chi-kwadrat estymatora w granicach { "20" }% (i że wyraźnie przewyższa liczbę zachowawczą). Osiem nowych testów.

seg-df59cc71120f = Stochastyczny model dwukierunkowego transferu czasu.

seg-d2add1ce01e1 = <c1/> zastępuje próbnik wyłącznie białego szumu modelem o fizycznych podstawach: wzajemne (wspólne) opóźnienie ścieżki znosi się w estymacie <c2/> (<c3/>, więc dwa niezależne pomiary jednokierunkowe uśredniają się do <c4/>), a resztą jest <b>niewzajemne</b> opóźnienie różnicowe, modelowane jako barwny proces biały FM + błądzenie przypadkowe FM (sprawdzony <c5/>), co nadaje szeregowi błędu synchronizacji realistyczną sygnaturę Allana (<c6/>) zamiast płaskiego szumu białego. <c7/> zyskuje <c8/>/<c9/> (domyślnie serde { "0" } ⇒ dawne zachowanie wyłącznie białego szumu, bit w bit), wskaźnik jakości łącza podaje <c10/> (odchylenie Allana modelu przy kroku bazowym), a scenariusz <c11/> i CLI je udostępniają. Wzorcowy wskaźnik jakości zapisano ponownie. Sześć testów wyprowadzonych ręcznie (znoszenie składowej wspólnej, dwukierunkowe wzmocnienie sqrt({ "2" }), prawo RWFM <c12/> przez własne <c13/> łącza, równoważność z dawnym zachowaniem przy <c14/>, determinizm i end-to-end ujawnienie wskaźnika jakości).

seg-6c7a1dd63be0 = Zgodność numeryczna ze Stable32 dla estymatorów rodziny Allana (NBS14).

seg-adbb47ca87b4 = <c1/> sprawdza estymatory overlapping ADEV, modified ADEV, odchylenia czasu oraz overlapping Hadamarda względem odchyleń wzorcowych Stable32 dla kanonicznego zbioru <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ok. s. 107) przy tau = { "1" }, { "2" } z tolerancją względną { "1e-4" }; faktyczna zgodność wynosi ok. { "1e-6" }. Przypina to matematykę estymatorów do de facto wzorcowej implementacji, a nie tylko do własnej analitycznej spójności estymatorów. Używane są wyłącznie publiczne liczby wzorcowe; żadnego kodu osób trzecich.

seg-35b0c0644fa2 = <b>Pionowy diagram integralności Stanforda eksportowany przez scenariusz <c1/>.</b> Uruchamialny rodzaj scenariusza <c2/> eksportuje teraz pionowy diagram Stanford(-ESA) obok mapy dostępności HPL/VPL: w każdej epoce chronionej wylosowany z ziarnem, odtwarzalny błąd odległości bez uszkodzenia jest przekształcany przez geometrię w rzeczywisty błąd pozycji pionowej i klasyfikowany względem VPL oraz pionowego limitu alarmowego (Available / System-Unavailable / Misleading / Hazardously-Misleading). Diagram (punkty dla poszczególnych epok i liczby w regionach) jest zawarty w JSON wyniku, a liczby zdarzeń integralności / HMI w podsumowaniu CLI, więc klasyfikator Stanforda, dotąd tylko w bibliotece, jest osiągalny od końca do końca. <c3/> zyskuje pole <c4/> (domyślnie { "0" }) sterujące realizacją błędu; sama mapa dostępności pozostaje wyłącznie geometryczna i niezależna od ziarna.

seg-5d76a638ae77 = Budżet ryzyka integralności ARAIM (P_HMI) dla poziomów ochrony.

seg-449adb9ad6e6 = <c1/> wyprowadza poziomy ochrony poziomy i pionowy z jawnego budżetu ryzyka integralności zamiast ze stałego mnożnika <c2/>: dla rozwiązania ze wszystkich widocznych satelitów i każdego podrozwiązania z wykluczeniem jednego satelity buduje dla każdej osi <c3/> poszczególnych trybów, po czym <c4/> wyznacza najmniejszy PL, którego sumaryczne prawdopodobieństwo niebezpiecznie mylących informacji (<c5/>, <c6/>, Blanch i in., <em>Baseline ARAIM</em>) spełnia przydzielone <c7/>. Wynik podaje ryzyko integralności faktycznie osiągane przez poziomy, więc użytkownik może jawnie wymieniać integralność na limit alarmowy. Sześć testów wyprowadzonych ręcznie (zamknięte wzory dla trybu pojedynczego bez uszkodzenia i z progiem, sumowanie/monotoniczność wielu trybów, ochrona end-to-end bez uszkodzenia, gdzie 10⁵× ciaśniejszy budżet podnosi PL, detekcja/identyfikacja uszkodzenia oraz próg redundancji sześciu satelitów). Pojedyncze uszkodzenie MHSS jest bazą ARAIM; jednoczesne uszkodzenia wielu podzbiorów SV, tryb uszkodzenia dotyczący całej konstelacji i walidacja na zbiorze referencyjnym gLAB są udokumentowanymi rozszerzeniami.

seg-3e33581644a5 = Dwuszybkościowa kompensacja coning/sculling dla mechanizacji strapdown.

seg-c900e193ac29 = <c1/> wyłącza z uporządkowanych przyrostów IMU w podprzedziałach zgrubnej aktualizacji składowe coning (orientacja) oraz rotacji+sculling (prędkość) o wysokiej częstotliwości, dzięki czemu <c2/> o umiarkowanej częstotliwości odtwarza ruch wyprostowany drganiami, którego zgrubny krok na surowych sumach nie wychwytuje. Test walidacyjny prowadzi środowisko coning+sculling o częstotliwości { "10" } Hz przez { "60" } s i porównuje prawdę o drobnej częstotliwości, naiwne całkowanie zgrubne i zgrubne całkowanie ze złożeniem: złożenie zmniejsza błąd pozycji ok. { "18" }× (od metrów naiwnego dryfu do poniżej decymetra), co potwierdza, że składowe coning/sculling mają znaczenie nośne. Alias typu <c3/> nazywa dawny 1-DOF <c4/> tym, czym jest, odrębnie od trójosiowego nawigatora <c5/>.

seg-ceb037e7a6ea = <b>Parser plików obserwacji RINEX.</b> Nowy moduł <c1/> wczytuje plik <em>obserwacji</em> RINEX 3.0x / { "4.00" } (rzeczywiste pomiary odbiornika), uzupełniając parę RINEX obok istniejącego parsera komunikatu nawigacyjnego. <c2/> dekoduje nagłówek (wersja/typ, listy <c3/> dla poszczególnych systemów z liniami kontynuacji, pozycja przybliżona, interwał, czas pierwszej obserwacji) oraz rekordy każdej epoki dla poszczególnych satelitów: pseudoodległość, fazę nośnej, Doppler i siłę sygnału, indeksowane kodem obserwacji RINEX { "3" } (<c4/>, <c5/>, …) wraz z flagami utraty synchronizacji (LLI) i siły sygnału (SSI); puste pole jest zachowywane jako brak wartości, a nie zero. Uczciwy zakres: to jest <em>wczytywanie</em> formatu standardowego (rzeczywisty dziennik obserwacji RTKLIB/gLAB/stacji IGS na wejściu, typowane pomiary na wyjściu), a nie silnik pozycjonowania; nie ma tu rozwiązania z pseudoodległości, PPP ani RTK.

seg-60efb0c44522 = <b>Zapisywacz CCSDS OEM (Orbit Ephemeris Message).</b> Nowy moduł <c1/> eksportuje propagowaną konstelację jako poprawny komunikat CCSDS 502.0-B OEM { "2.0" }, czyli format efemeryd KVN, który wczytują GMAT, Orekit, STK i większość narzędzi dynamiki lotu. <c2/> próbkuje na siatce czasu stan inercjalny (TEME) każdego satelity, czyli pozycję <b>i</b> prędkość, wzięte wprost z propagatora bez obrotu do układu związanego z Ziemią, inaczej niż w eksporcie SP3, a <c3/> serializuje nagłówek <c4/>/<c5/>/ <c6/> oraz jeden segment <c7/> na satelitę (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>), po których następują jego linie <c15/> (km, km/s). Pole <c16/> podaje wywołujący, nigdy zegar ścienny, więc wynik jest identyczny bajt w bajt między przebiegami (kontrakt odtwarzalności). To odpowiednik efemeryd statku kosmicznego dla eksportu SP3 GNSS: orbitę Kshana można teraz przekazać narzędziu dynamiki lotu w standardowym formacie.

seg-f8538db4a17c = Precyzyjne efemerydy SP3 jako źródło propagacji.

seg-2cf2e224deb9 = <c1/> buduje dla każdego satelity <c2/>, który wypełnia pozycję między tabelarycznymi epokami SP3 wielomianem Lagrange'a 9. rzędu (standardowa praktyka IGS) i obraca ją do wspólnego układu TEME, udostępniony jako <c3/>. Plik precyzyjnych orbit IGS/centrum analiz może teraz napędzać ten sam potok geometrii/widoczności/integralności co propagatory transmitowane i analityczne. Sprawdzone obiegiem w obie strony: orbita Keplera zapisana do SP3 i ponownie wczytana przez interpolator zgadza się z oryginałem z dokładnością poniżej metra w węzłach i < { "100" } m w środku przedziału. Interpolacja zegara jest następna.

seg-8d50fd42f53c = <b>Efemerydy transmitowane GLONASS (dopełniają wielosystemową nawigację RINEX).</b> Nowy moduł <c1/>: GLONASS nie nadaje elementów keplerowskich, lecz <b>wektor stanu</b> w układzie PZ-90 związanym z Ziemią (pozycja, prędkość, przyspieszenie lunisolarne). <c2/> wczytuje rekordy RINEX { "3" } <c3/>, a pozycję satelity w dowolnej chwili uzyskuje się przez <b>całkowanie metodą Runge–Kutty 4. rzędu</b> równań ruchu z ICD GLONASS (grawitacja centralna + <c4/> + człony Coriolisa/odśrodkowe obrotu Ziemi + przyspieszenie transmitowane). Udostępnione jako <c5/>, dzięki czemu satelity GLONASS przechodzą przez potok konstelacji/widoczności/integralności obok systemów keplerowskich; pojedynczy blok konstelacji <c6/> może teraz mieszać GPS, Galileo, QZSS, BeiDou i GLONASS.

seg-8d88144e3726 = <b>Wielosystemowa nawigacja RINEX (GPS, Galileo, QZSS, BeiDou).</b> Parser nawigacyjny RINEX { "3" } dekoduje teraz rekordy Galileo (<c1/>), QZSS (<c2/>) i BeiDou (<c3/>, MEO/IGSO) obok GPS (<c4/>); mają one wspólny układ keplerowski i algorytm użytkownika, a każdy z nich jest obliczany z własną stałą grawitacyjną i prędkością obrotu Ziemi (μ Galileo/BeiDou, Ω̇ₑ BeiDou). Plik z mieszaną konstelacją daje wszystkie te systemy, przechodzące przez potok konstelacji/widoczności/integralności jako <c5/>. Geostacjonarne satelity BeiDou używają innego obrotu współrzędnych i są pomijane do czasu uzyskania wzorcowego zestawu danych do ich sprawdzenia. Przeglądarka rekordów używa liczby linii zależnej od systemu, co naprawia ukryty błąd, w którym czteroliniowe rekordy GLONASS/SBAS były pomijane tak, jakby miały osiem linii. GLONASS (model wektora stanu) jest następny.

seg-91a6907acc8d = <b>Czytnik i zapisywacz precyzyjnych efemeryd SP3-c/d.</b> Nowy moduł <c1/> parsuje pliki precyzyjnych orbit SP3 IGS/centrów analiz (<c2/>), czyli przetworzony po fakcie produkt pozycji/zegara ECEF, który silniki PPP (Ginan, RTKLIB, gLAB) traktują jako wzorzec, do ustrukturyzowanego <c3/> (nagłówek, siatka epok, pozycja dla każdego satelity km→m, zegar µs i prędkość dm/s→m/s dla produktów <c4/>), zachowując wartości wartowników błędnych danych SP3. Pokryty jest też kierunek odwrotny: <c5/> buduje SP3 z propagowanej konstelacji (TEME→ECEF dla każdej epoki), a <c6/> go serializuje, więc orbity Kshana można eksportować w formacie, który wczytują zewnętrzne narzędzia PPP: obieg odczyt↔zapis. Interpolacja epok i źródło propagatora SP3 są następne.

seg-7d51d1b6f39f = <b>Efemerydy transmitowane RINEX jako uruchamialne źródło konstelacji.</b> Konstelacja przyjmuje teraz wbudowany blok <c1/> (tekst nawigacyjny GPS RINEX { "3" }) obok istniejącej opcji <c2/>, więc prawdziwy plik transmitowany napędza scenariusz od końca do końca z CLI, Pythona lub playgroundu w przeglądarce: RINEX na wejściu, geometria PNT na wyjściu. Nowy <c3/> pokazuje dostępność GNSS i DOP dla ośmiu satelitów GPS zbudowanych wprost z rekordów transmitowanych. (Tylko GPS LNAV; wielosystemowość i SP3 są następne.)

seg-9730835bfc64 = <b>Efemerydy transmitowane RINEX jako źródło propagacji.</b> Sparsowany <c1/> jest teraz konwertowany do <c2/> (<c3/>): pozycja to orbita transmitowana IS-GPS-200 obrócona z ECEF do wspólnego inercjalnego układu TEME (<c4/>, z poprawnym względem sekund przestępnych czasem GPS→UT1), prędkość z centralnej różnicy skończonej, a okres orbitalny keplerowski. Rzeczywiste dane transmitowane GPS mogą teraz napędzać ten sam potok geometrii, widoczności i integralności (RAIM) co analityczne propagatory SGP4/Keplera. (Jeszcze nieudostępnione jako rodzaj scenariusza z plikiem RINEX; to oraz wielosystemowość/SP3 są następne.)

seg-a355e3e52ec3 = <b>Archiwalny DOI.</b> Wydania są teraz deponowane w Zenodo i otrzymują cytowalny DOI.

seg-c6e4556e1ce5 = <b>Dokumentacja.</b> Odświeżono README do poziomu instytucjonalnego: przegląd możliwości pełnego stosu { "v0.9.0" }, sekcja Wersjonowanie i wydania, czysty nagłówek z nowym znakiem oraz zwięzła linia statusu. Bez zmian w silniku.

seg-1bfc4e965d2b = To wydanie dodaje trzy istotne obszary możliwości na podstawie substratu SGP4 { "0.8.0" }: prawdziwy trójosiowy INS strapdown, luźno sprzężony EKF stanu błędu GNSS/INS ze sprzężeniem zwrotnym w pętli zamkniętej, prawdziwy migawkowy RAIM oraz RAIM z separacją rozwiązań (w stylu ARAIM) z HPL/VPL i uruchamialnym scenariuszem <c1/>, a także pierwszy krok interoperacyjności formatów GNSS (wczytywanie efemeryd GPS RINEX-3).

seg-7fa2f68d436a = <b>Parser komunikatu nawigacyjnego GPS RINEX { "3" } (<c1/>).</b> Pierwszy krok ku interoperacyjności formatów GNSS: <c2/> wczytuje plik nawigacyjny RINEX { "3" }.x i dekoduje każdy rekord efemeryd transmitowanych GPS (<c3/>), czyli ośmioliniowy blok SV/epoka + <c4/>, do <c5/> elementów keplerowskich i poprawek zegara, z nazwami pól i jednostkami zgodnie z IS-GPS-200. Obsługuje format liczb zmiennoprzecinkowych Fortrana z wykładnikiem <c6/> (<c7/>) i układ kolumn o stałej szerokości; rekordy dla systemów innych niż GPS są pomijane, a nie odrzucane, więc plik mieszany nadal daje swoje efemerydy GPS. Cztery testy: parsowanie wykładnika <c8/> (w tym puste pola i błędy), pełny rekord zdekodowany względem znanych wartości pól ze sprawdzeniem poprawności półosi wielkiej GPS (√A² ≈ { "26 560" } km), pomijanie systemów innych niż GPS oraz przypadek pustego pliku.

seg-9c4a068f204c = Efemerydy transmitowane GPS → pozycja ECEF (<c1/>).

seg-5deeec4b8cc9 = <c1/> oblicza pozycję satelity w układzie związanym z Ziemią ze sparsowanych efemeryd według algorytmu użytkownika IS-GPS-200 §{ "20.3.3.4.3.1" }: rozwiązanie równania Keplera metodą Newtona dla anomalii mimośrodowej, poprawki drugiej harmonicznej do argumentu szerokości / promienia / nachylenia oraz obrót do ECEF z uwzględnieniem obrotu Ziemi od epoki odniesienia (ze stałymi GPS <c2/> i <c3/> narzuconymi przez specyfikację oraz złożeniem <c4/> przy przełomie tygodnia). Trzy testy: promień geocentryczny pozostaje w paśmie GPS (≈ { "26 560" } km), prędkość w układzie związanym z Ziemią wynosi ok. { "3.9" } km/s, a obliczenie dla chwili odległej o pełny tydzień odtwarza tę samą pozycję.

seg-583433389a70 = Błąd zegara SV GPS z poprawką relatywistyczną (<c1/>).

seg-957588ed5dff = <c1/> oblicza transmitowany wielomian zegara <c2/> względem <c3/> oraz relatywistyczny człon mimośrodowy <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Nowa <c5/> przelicza epokę kalendarzową rekordu na czas GPS w tygodniu za pomocą arytmetyki dni juliańskich od epoki GPS (1980-01-06), a rozwiązanie Keplera jest wspólne z obliczaniem pozycji. Testy: czas GPS w tygodniu dla niedzieli/wtorku/soboty (granice tygodni) oraz błąd zegara zdominowany przez af0 z obecnym, ograniczonym członem relatywistycznym. Opóźnienie grupowe L1 <c6/> jest udostępnione, ale celowo nie jest wliczane. Uczciwy zakres: źródło <c7/>, Galileo/BeiDou/GLONASS i SP3 pozostają kolejnymi krokami. (<c8/> zaktualizowano zgodnie z tym.)

seg-ef971feff16c = <b>Uruchamialny przez użytkownika rodzaj scenariusza <c1/> (<c2/>).</b> Możliwość oceny dostępności RAIM jest teraz osiągalna z CLI/TOML jak każdy inny pakiet: <c3/> parsuje <c4/> (orbita użytkownika, jedna lub więcej konstelacji GNSS, maska elewacji i konfiguracja integralności <c5/>), uruchamia <c6/> i emituje mapę dostępności HPL/VPL dla poszczególnych epok jako JSON oraz samodzielny SVG: poziomy ochrony w czasie względem limitów alarmowych, z zielono-czerwonym paskiem dostępności. <c7/> zapisuje JSON, wykres i raport HTML. Dołączony scenariusz (24-satelitarny Walker, pomiar odległości dwuczęstotliwościowy { "1" } m, limity APV-I) podaje ok. { "95" } % dostępności; dokumentuje, że jednoczęstotliwościowy RAIM nie spełnia pionowego limitu APV-I przy jednej konstelacji, dlatego prowadzenie w pionie używa SBAS/dwóch częstotliwości/ARAIM. Testy obejmują wywołanie, JSON mapy dostępności i SVG.

seg-bbe5721c1785 = <b>Uruchamialna ocena dostępności RAIM dla konstelacji (<c1/>).</b> Moduł integralności nie miał wywołującego: <c2/> czyni go prawdziwym punktem wejścia od końca do końca: w każdej epoce na siatce czasu propaguje widoczne satelity (tymi samymi <c3/> SGP4/Keplera, których używa silnik), oblicza poziomy ochrony bez uszkodzenia i ocenia dostępność względem poziomych/pionowych limitów alarmowych, zwracając <c5/> serializowalny przez <c4/> (dla każdej epoki <c6/>/HPL/VPL/<c7/> oraz ułamek dostępności). <c8/> łączy <c9/>, a <c10/> dla poszczególnych epok jest udostępnione wywołującym, którzy sami rozstrzygają własną geometrię. Trzy testy: epoka oceniona jako dostępna przy limitach APV-I dla geometrii dziesięciu satelitów, uznana za niedostępną przy nierealistycznie ciasnym limicie oraz poziomy <c11/> poniżej pięciu satelitów; a także przebieg end-to-end dla 24-satelitarnej konstelacji Walker, który daje skończoną mapę dostępności i serializuje się. (Sześć satelitów, czyli próg redundancji residual-RAIM, uczciwie <em>nie</em> spełnia APV-I nawet przy pomiarze odległości { "1" } m; dostępność APV-I wymaga gęstszej geometrii użytej w teście.)

seg-91e32e587cb6 = <b>Akumulator diagramu integralności Stanford(-ESA) (<c1/>).</b> Standardowy sposób podsumowania monitora integralności w wielu epokach: nanosi rzeczywisty błąd pozycji (x) względem poziomu ochrony (y) i klasyfikuje każdą epokę, według przekątnej <c2/> i limitu alarmowego, jako <c3/> (PL ogranicza błąd, w granicach AL), <c4/> (PL ogranicza błąd, ale przekracza AL: bezpiecznie, lecz bezużytecznie), <c5/> (PL < błąd ≤ AL) lub <c6/> (PL < błąd i błąd > AL: awaria niebezpieczna). <c7/> to czysty klasyfikator; <c8/> akumuluje punkty <c9/> względem stałego limitu alarmowego, udostępniając liczby w regionach, dostępność, sumy zdarzeń integralności oraz punkty serializowalne przez <c10/> do wykresów/eksportu JSON. Cztery testy: każdy region (w tym granica ograniczenia <c11/>), akumulacja liczb/dostępności i obieg JSON w obie strony. To powierzchnia raportowania dla poziomów ochrony RAIM; podłączenie jej do scenariusza konstelacji i walidacja na publicznym zbiorze danych pozostają pozycjami planu rozwoju.

seg-cdeb3a5a4acf = <b>RAIM z separacją rozwiązań (w stylu ARAIM) (<c1/>).</b> Monitor integralności z wieloma hipotezami obok istniejącego chi-kwadrat <c2/> opartego na resztach/parytecie. Dla rozwiązania najmniejszych kwadratów ze wszystkich widocznych satelitów i każdego podrozwiązania z wykluczeniem jednego satelity tworzy separację <c3/>, o zerowej średniej i rozkładzie gaussowskim przy braku uszkodzenia, z kowariancją <c4/> (tożsamość estymatorów zagnieżdżonych, ważna, ponieważ rozwiązanie ze wszystkich widocznych satelitów jest BLUE), dzięki czemu <b>wykrywa</b> uszkodzenie i <b>identyfikuje</b> uszkodzony satelita (ten, którego wykluczenie daje największą znormalizowaną separację). Poziomy ochrony poziomy/pionowy wynikają ze standardowej alokacji MHSS <c5/>, gdzie <c6/>, <c7/>. Nowe, niezależne od zależności <c8/>/<c9/>, zbudowane z istniejącej w module regularyzowanej niepełnej funkcji gamma (<c10/>). Cztery testy wyprowadzone ręcznie: rozkład normalny CDF / kwantyl względem wartości podręcznikowych (Φ({ "1.95996" })={ "0.975" }, ogon { "1e-7" } = { "5.1993" }, symetria); geometria bez uszkodzenia, która nie wywołuje alarmu i daje skończone, dodatnie HPL/VPL; bias pojedynczego satelity równy 60 σ, który jest wykrywany <em>i</em> poprawnie identyfikowany (<c11/>); oraz próg redundancji sześciu satelitów. Zamyka po stronie algorytmu lukę P0 z audytu „tautologiczna integralność: brak prawdziwego RAIM/HPL/VPL”; walidacja na zbiorze gLAB i akumulator diagramu Stanforda pozostają pozycjami planu rozwoju.

seg-67e771fc0a48 = Integracja GNSS/INS w pętli zamkniętej (<c1/>).

seg-5aa467783b99 = <c1/> łączy jądro EKF stanu błędu z trójosiową mechanizacją strapdown: każda próbka IMU jest korygowana bieżącymi estymatami biasów, mechanizowana w przód, a kowariancja EKF jest propagowana w czasie z odpowiednim kontekstem nawigacyjnym; każda pozycja/prędkość GNSS tworzy innowację INS−GNSS i wprowadza estymowane <b>błędy pozycji, prędkości, orientacji (ψ, jako obrót kwaternionowy) oraz biasy akcelerometrów/żyroskopów</b> z powrotem do rozwiązania, zerując średnią stanu błędu. Wprowadzenie z powrotem orientacji (a nie tylko biasów) jest konieczne dla stabilności: przechył i bias akcelerometru tworzą sprzężoną parę, więc korygowanie jednego bez drugiego prowadzi do rozbieżności. INS i GNSS są porównywane w lokalnym stycznym układzie NED z użyciem własnych promieni krzywizny mechanizacji (nowe <c2/>; udostępnione <c3/>/<c4/>). To uczciwy zamiennik <em>resetu z przywróceniem prawdy</em> pakietu hybrydowego. Trzy testy: pętla zamknięta zerująca wprowadzony błąd pozycji { "8" } m / −{ "5" } m do <{ "0.1" } m; rozwiązanie wspomagane pozostające w granicach metrów (<{ "6" } m) na trajektorii jazdy, podczas gdy swobodnie działający INS rozbiega się powyżej { "100" } m; oraz kamień milowy, czyli benchmark: <b>RMS pozycji Monte Carlo rozwiązania połączonego podczas przerwy GNSS trwającej { "60" } s pokonuje nieasystowany nawigator zliczeniowy w układzie otwartym o >{ "2" }× (≈{ "4" }× w różnych ziarnach)</b>. Uczciwe ograniczenie udokumentowane w module: w trybie luźno sprzężonym bias akcelerometru i przechył są rozdzielne tylko słabo (oba sprzęgają się przez grawitację), więc dostarczoną wartością jest ograniczony, skorygowany stan i czyste wejście w przerwę, a nie precyzyjna kalibracja inercjalna; bogatsza dynamika i rozszerzenie na sprzężenie ścisłe pozostają pozycjami planu rozwoju.

seg-aa9bf0ff6f84 = <b>Jądro luźno sprzężonego EKF stanu błędu GNSS/INS (<c1/>).</b> 15-stanowy rozszerzony filtr Kalmana stanu błędu, <c2/>, z dynamiką błędów strapdown według Grovesa { "2013" } §{ "14.2" } (sprzężenie siły właściwej i przechyłu, Coriolis, rzutowanie biasu z układu ciała na układ nawigacyjny, modele biasu Gaussa–Markowa), dyskretną macierzą przejścia pierwszego rzędu <c3/> oraz luźno sprzężoną aktualizacją pomiaru pozycji i prędkości (<c4/>) w postaci Josepha. Algebra liniowa gęsta, niezależna od zależności (odwracanie Gaussa–Jordana, aktualizacja kowariancji Josepha). Funkcja cargo <c5/> bramkuje udokumentowaną, jeszcze niezaimplementowaną aktualizację pseudoodległości/Dopplera. { "7" } testów z oczekiwaniami wyprowadzonymi ręcznie: tożsamość iloczynu wektorowego, sprawdzona odwrotność { "3" }×{ "3" }, kowariancja pozostająca symetryczna/PSD podczas predykcji (przy rosnącej niepewności pozycji bez wspomagania), pozycja zmniejszająca kowariancję pozycji, dokładne odzyskanie znanego błędu pozycji przy analitycznym wzmocnieniu Kalmana <c6/> oraz mniejsze korekty przy większym szumie pomiaru. To jest jądro, które zastąpi reset z przywróceniem prawdy z układu otwartego w pakiecie hybrydowym sprzężeniem zwrotnym w pętli zamkniętej (podłączenie pakietu i walidacja względem NaveGo w następnej kolejności).

seg-5be84079b8b6 = Deterministyczny model błędów IMU dla 3-osiowego nawigatora strapdown (<c1/>).

seg-492e670736b2 = <c1/> zniekształca prawdziwą parę <c2/> w układzie ciała w parę zmierzoną przez pięć systematycznych kategorii (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, tabela { "4.1" }): <b>współczynnik skali</b> (błąd wzmocnienia w ppm dla każdej osi), <b>niewspółosiowość / sprzężenie krzyżowe</b> (nieortogonalność triady poza przekątną), <b>czułość na g</b> (bias prędkości kątowej żyroskopu proporcjonalny do siły właściwej), <b>kwantyzacja</b> (zaokrąglanie do wyjściowego LSB) oraz <b>narastanie liniowe</b> (dryf liniowy w czasie, czyli trzeci obszar Allana), a także stały bias włączenia. Każdy człon domyślnie wynosi zero, więc <c3/> jest przezroczystym przejściem, a istniejące scenariusze pozostają nienaruszone. Każde źródło błędu ma test izolacji (skala liniowa z dokładnością <{ "0.01" }%, niewspółosiowość międzyosiowa powyżej poziomu VRW, bias czułości na g, siatka LSB, narastanie liniowe), a test end-to-end prowadzi błąd nawigacji przez mechanizację ze zniekształconego IMU. Niemodelowane: błąd prostowania drgań, dryf od gradientu temperatury. (Dostarczany pakiet scenariuszy <c4/> nadal używa dawnego skalarnego budżetu 1-DOF; ten model zasila bibliotekę 3-osiową.)

seg-f57bc89d4688 = <b>Kompensacja coning i sculling dla integratora strapdown.</b> Ścieżka orientacji dodaje dwupróbkowy <c1/> (<c2/>); zgrubne całkowanie z częstotliwością { "30" } Hz (5 próbek na cykl) środowiska coning o częstotliwości { "5" } Hz śledzi prawdę o drobnej częstotliwości co najmniej { "3" }× lepiej z korekcją niż przy naiwnym sumowaniu przyrostów, co zweryfikowano. Ścieżka prędkości dodaje <c3/> (<c4/>, równanie { "5.82" } Grovesa) i rozkłada przyrost prędkości w układzie ciała przez nową aktualizację przyrostową <c5/> z użyciem obrotu względem ciała <c6/>, dzięki czemu platforma związana z Ziemią nie ponosi pozornego sculling, a rzeczywiste drganie uruchamia pełny człon.

seg-56c599250ed4 = Pełna trójosiowa mechanizacja strapdown w układzie NED (<c1/>).

seg-d0897492e89b = <c1/> jest przesuwany przez <c2/> według standardowych równań NED w układzie ziemskim (Groves §{ "5.4" }): orientacja ciało→NED skorygowana o prędkość kątową inercjalny→nawigacyjny <c3/> (obrót Ziemi + prędkość transportowa); siła właściwa rozkładana ciało→NED przez DCM; prędkość całkująca <c4/> (Coriolis/transport + grawitacja); oraz pozycja geodezyjna przez promienie krzywizny południkowy/poprzeczny. Grawitacją jest zamknięta postać Somigliany WGS-84, czyli <b>grawitacja normalna (pionu)</b> z poprawką wysokościową NIMA w powietrzu swobodnym, nigdy stała zapisana na sztywno. To jest prawdziwy trójosiowy nawigator, który zastępuje ścieżkę skalarnego budżetu błędów 1-DOF. Zweryfikowano fizycznymi niezmiennikami: platforma przymocowana do obracającej się Ziemi na { "45" }°N (wykrywająca prędkość obrotu Ziemi + { "1" } g) pozostaje w granicach { "1" } mm przez { "60" } s; pozioma siła właściwa skierowana na północ daje <c5/> i przemieszczenie <c6/>; grawitacja normalna zgadza się ze znanymi wartościami na powierzchni dla równika/bieguna/45° i z gradientem w powietrzu swobodnym.

seg-290b08199bfb = <b>Trójosiowa reprezentacja orientacji dla INS strapdown (<c1/>).</b> Typ kwaternionu jednostkowego <c2/> (skalar na początku, konwencja Hamiltona) niosący obrót ciało→nawigacja, z widokiem DCM (<c3/>/<c4/> metodą Shepparda), iloczynem Hamiltona, konstruktorami z osi i kąta oraz z wektora obrotu (dokładna mapa wykładnicza) i kinematyką kwaternionów: zarówno aktualizacja prędkości kątowej metodą RK pierwszego rzędu (<c5/>), jak i aktualizacja wektora obrotu z korekcją coning. Dwupróbkowy <c6/> (Savage / Bryan–Lewantowski, <c7/>) dostarcza człon sprzężenia krzyżowego prędkości obrotu, który pomija skalarne nawigowanie zliczeniowe. To jest fundament orientacji dla pełnej 3-osiowej mechanizacji, która zastępuje dawną ścieżkę budżetu błędów 1-DOF. Zweryfikowano względem obrotów w postaci zamkniętej: propagacja ze stałą prędkością kątową zgadza się z kwaternionem oś–kąt z dokładnością { "1e-6" }, DCM są ortonormalne z wyznacznikiem jednostkowym, a coning znika dla ruchu jednoosiowego. (<c8/> jest teraz katalogiem modułu <c9/>; ścieżka publiczna <c10/> pozostaje bez zmian.)

seg-5e6e5bba25a5 = Geodezyjnie poprawna widoczność ze stacji naziemnej (<c1/>).

seg-69bdb1e5bfc8 = <c1/>, <c2/> i <c3/> obliczają elewację satelity nad horyzontem stacji naziemnej względem <b>normalnej do elipsoidy WGS-84</b> (prawdziwej lokalnej pionowej), a nie geocentrycznego promienia; oba kierunki różnią się nawet o ok. { "0.19" }° ugięcia geodezyjnego, co wystarcza, by satelity bliskie horyzontowi wchodziły do maski elewacji lub z niej wypadały. Zweryfikowano od końca do końca (konstelacja Walker propagowana, obrócona TEME→ECEF i zliczona z miejsca geodezyjnego) oraz względem przybliżenia geocentrycznego.

seg-4de1d79d2e76 = <b>Niezawodność CI.</b> Zadanie <c1/> buduje teraz wheel za pomocą <c2/> (kontener manylinux) zamiast surowego <c3/> na hoście, eliminując sporadyczny konflikt rustup <c4/>/<c5/> w obrazie runnera. Zadanie <c6/> instaluje <c7/> jako gotowy plik binarny przez <c8/> zamiast opartego na Dockerze <c9/>, usuwając przekroczenie czasu pobierania z rejestru Docker Hub. Żadna ze zmian nie wpływa na wykonywane kontrole.

seg-05055c993904 = Prędkość inercjalna jest udostępniona dalej.

seg-1228235c99b6 = <c1/> i <c2/> (zwracające <c3/>) przekazują wywołującym w m/s analityczną prędkość TEME, którą SGP4 już oblicza i dotąd odrzucał; <c4/> daje ścieżce keplerowskiej spójną prędkość. Test weryfikacyjny AIAA 2006-6753 sprawdza teraz także prędkość dla każdego wiersza wzorcowego (najgorszy błąd prędkości { "1.85e-9" } km/s w całym zbiorze { "666" } stanów) i przypina liczbę porównywanych wierszy dokładnie do { "666" }.

seg-8ac2598291b8 = <b>Surowsze parsowanie TLE bez panik.</b> Linie muszą być ASCII i są dzielone bezpiecznie (koniec z paniką przy indeksowaniu bajtów w danych wielobajtowych); elementy są sprawdzane pod kątem zakresu (nachylenie, mimośród, ruch średni); sumę kontrolną z kolumny 69 można wymusić przez <c1/> / <c2/> i nową flagę <c3/> w <c4/> (domyślnie łagodnie).

seg-1cd2c6621a04 = <b>Krzywa odchylenia Allana w wyniku.</b> Każdy przebieg zegara podaje teraz <c1/> (<c2/>), a playground w przeglądarce rysuje wykres logarytmiczno-logarytmiczny „Stabilność zegara (ADEV)”.

seg-c76ff20811e7 = Walidacja wejściowej siatki czasu.

seg-75436d067802 = <c1/> odrzuca siatkę czasu nieskończoną lub niebędącą liczbą, zerową, ujemną albo zbyt dużą (krok większy niż czas trwania lub więcej niż <c2/> próbek) przed jakąkolwiek alokacją, dzięki czemu błędny scenariusz zwraca błąd zamiast panikować lub wyczerpywać pamięć.

seg-d0a8ce50cf6e = Zespoły Monte Carlo dla pakietu inercjalnego.

seg-3225674ce4ea = <c1/> w scenariuszu inercjalnym uruchamia N ziaren i podaje dla każdej metryki średnią, odchylenie standardowe, percentyle oraz przedział ufności { "95" }% metodą bootstrapu percentylowego (<c2/>). Każdy przebieg inercjalny niesie teraz flagę <c3/>, więc wskaźnika jakości z pojedynczej realizacji nie myli się już z rozkładem. (CEP/2DRMS celowo nie są podawane, ponieważ wymagają modelu 3-osiowego, który jest w planach rozwoju.)

seg-2967872bfca1 = <b>Tryb playgroundu z przewodnikiem.</b> Playground w przeglądarce nie rzuca już użytkownika na surową ścianę TOML: pasek „Zacznij tutaj” z kartami scenariuszy jednym kliknięciem wczytuje i uruchamia przykład, suwaki udostępniają uniwersalne pokrętła (ziarno, próg czasu) bez dotykania TOML, uwaga „Jak to czytać” wyjaśnia wynik, a pełny TOML jest o jedno rozwinięcie dalej. Każdy przebieg można udostępnić: <b>Kopiuj link do udostępnienia</b> koduje cały scenariusz we fragmencie URL (nic nie jest wysyłane), więc link odtwarza dokładnie ten przebieg po wczytaniu. Kodek ma testy jednostkowe (<c1/>, uruchamiane w CI).

seg-2e47e8864718 = N-wymiarowe przeglądy parametrów (<c1/>).

seg-5076a9ad20d7 = <c1/> oblicza metrykę na pełnym iloczynie kartezjańskim kilku zakresów <c2/> (wieloparametrowe studium kompromisów), w kolejności wierszowej, deterministycznie. Addytywnie: istniejące API przeglądu 1-wymiarowego pozostaje bez zmian. Przedziały ufności bootstrap dla poszczególnych węzłów i uogólnienie poza pakiet zegara pozostają w planach rozwoju.

seg-958718831037 = <b>Prawdziwy migawkowy RAIM (<c1/>).</b> Prawdziwy autonomiczny monitoring integralności odbiornika w dziedzinie pozycji: buduje geometrię kierunków widzenia do widocznych satelitów, tworzy rozwiązanie najmniejszych kwadratów i reszty, uruchamia test detekcji uszkodzeń na resztach χ² (dokładny próg z niezależnej od zależności niepełnej funkcji gamma dla χ²/niecentralnego χ²) i oblicza poziomy ochrony poziomy i pionowy (HPL/VPL) oparte na nachyleniu, z biasem niewykrytego zdarzenia wyprowadzonym dla skonfigurowanych P_fa/P_md. Jest to odrębne od wskaźnika Integrity z potoku scenariuszy, opartego na samospójności filtra, i <b>jeszcze nie jest z nim połączone</b>; wykluczanie uszkodzeń, budżetowanie limitu alarmowego/P_HMI oraz ARAIM pozostają w planach rozwoju.

seg-1675540acbd9 = <b>Zestaw stabilności częstotliwości: MDEV, TDEV, HDEV + przedziały ufności</b> (<c1/>). Obok overlapping ADEV: zmodyfikowane odchylenie Allana (odróżnia biały szum fazy od szumu migotania), odchylenie czasu (<c2/>) oraz odchylenie Hadamarda (dokładnie odrzuca liniowy dryf częstotliwości i jest zbieżne dla rozbieżnych typów szumu czerwonego). Przedziały ufności oparte na χ² (<c3/>) używają niezależnej od zależności pary kwantyli rozkładu normalnego/χ² (Acklam + Wilson-Hilferty) z zachowawczym edf dla nienakładających się próbek; edf zależne od typu szumu i zgodność numeryczna ze Stable32 pozostają w planach rozwoju.

seg-446a9ed4467c = <b>Redukcja układów odniesienia (<c1/>).</b> Obrót TEME↔ECEF oparty na GMST (z tym samym czasem gwiazdowym IAU-1982 co propagator), dokładna transformacja WGS-84 geodezyjny↔ECEF ze zainicjowaną metodą Bowringa odwrotnością iteracyjną (dokładność maszynowa na wszystkich wysokościach, w tym MEO/GEO) oraz geodezyjny obserwator stacji naziemnej zwracający azymut / elewację / odległość w lokalnym układzie East-North-Up. Ruch bieguna i nutacja poniżej sekundy łuku nie są stosowane (tylko GMST, poniżej kilometra na śladzie naziemnym); precyzyjny łańcuch CIO w ITRF jest w planach rozwoju.

seg-9f6f53583cf5 = <b>Podstawa skal czasu (<c1/>).</b> Niezależne od zależności API dat juliańskich (cywilna gregoriańska ↔ JD, MJD), pełna historia sekund przestępnych IERS (UTC↔TAI, { "10" } s w { "1972" } do { "37" } s od { "2017" }), zdefiniowane przesunięcie TAI→TT, poprawka UT1 przez dostarczone DUT1 oraz kąt obrotu Ziemi IAU-2000. To jest podłoże czasowe, na którym opiera się redukcja do układu ziemskiego (planowana). Chwile są datami juliańskimi o pojedynczym <c2/> (rozdzielczość ok. { "50" } µs w pobliżu obecnej epoki; dwuczęściowe JD jest w planach rozwoju), a epoka sekundy gumowej sprzed 1972 nie jest modelowana; oba ograniczenia są udokumentowane w module.

seg-6ecc053f101f = <b>Odtwarzalność i pochodzenie.</b> Deterministyczny generator SBOM CycloneDX (<c1/>) oraz atest pochodzenia kompilacji SLSA dla pliku binarnego wydania i SBOM; łańcuch narzędzi wydania jest przypięty tak, by zgadzał się z CI. Gwarancje determinizmu, zastrzeżenie dotyczące <c2/> między platformami i podejście z przypinaniem wartości wzorcowych są udokumentowane w <c3/>.

seg-3e98dcdcb82b = <b>Testy oparte na własnościach i fuzz</b> (<c1/>). Deterministyczne testy losowe (bez nowej zależności) sprawdzają niezmienniki na tysiącach danych wejściowych: parsery TLE i scenariuszy nigdy nie panikują na śmieciach, danych spoza ASCII, zmutowanych ani uciętych; <c2/> nigdy nie panikuje na siatkach NaN/inf/ujemnych; suma kontrolna TLE jest spójna i dotyczy wyłącznie kolumny 69; obiegi w obie strony geodezyjny↔ECEF i obrót TEME→ECEF zachowują normę na całym globie i w szerokim paśmie wysokości.

seg-ea252b5d7427 = Testy wzorcowe <b>przypinają wskaźniki jakości pole po polu</b> dla czterech scenariuszy odniesienia (z tolerancją pochłaniającą wahania <c1/> między platformami), zastępując dawne kontrole wyłącznie nierównościowe, dzięki czemu cicha regresja numeryczna jest wychwytywana natychmiast.

seg-4b2a0b78984b = <c1/> w artefaktach wyniku podniesiono z <c2/> do <c3/> (był zamrożony, gdy silnik szedł naprzód).

seg-ecafa9d44810 = <c1/> teraz <b>odrzuca</b> (zamiast ostrzegać) wycofane (yanked) zależności.

seg-c48af44de5b4 = Nowa dokumentacja: <c1/> (mapa zakresu, uczciwie), <c2/> (opis pól wyniku), <c3/>, <c4/>, <c5/>. Strażnik CI zgłasza błąd, jeśli plakietka wersji w README rozjedzie się z <c6/>.

seg-8ef32ebec7f5 = <b>Propagacja orbit SGP4/SDP4.</b> Pełna implementacja standardowego propagatora uproszczonych zaburzeń, niezależna od zależności: SGP4 dla bliskiej Ziemi wraz z rozszerzeniem SDP4 dla głębokiej przestrzeni (zaburzenia sekularne i okresowe księżycowo-słoneczne oraz rezonans geopotencjału { "12" } h / { "24" } h). Sprawdzona względem oficjalnych wektorów weryfikacyjnych AIAA 2006-6753 („Revisiting Spacetrack Report #3”): wszystkie { "666" } stanów wzorcowych w przypadkach bliskiej Ziemi, głębokiej przestrzeni, rezonansowych i kodów błędów zgadza się z najgorszym błędem pozycji ok. { "4" } mm. Jest to model, względem którego definiowane są zestawy elementów dwuliniowych, więc odwzorowuje rzeczywiste konstelacje, zwłaszcza orbity GNSS o okresie ok. { "12" } h, które są głęboką przestrzenią i rezonansowe, a których wcześniejszy model dwóch ciał + sekularnego J2 nie potrafi uchwycić.

seg-06a77fb9233e = Konstelacja podana jako <b>pełne zestawy elementów dwuliniowych</b> (linia { "1" } + linia { "2" }) jest teraz propagowana SGP4/SDP4; konstelacja podana jako elementy tylko z linii 2 zachowuje analityczną keplerowską propagację dwóch ciał, bez zmian. Obie formy można mieszać w jednym bloku. Nowy scenariusz odniesienia <c1/> (konstelacja MEO podobna do GPS w rzeczywistym formacie dwuliniowym, propagowana SGP4): wystarczy wstawić aktualny zestaw Celestrak „gps-ops”, aby badać działającą konstelację.

seg-2dbb4054e9b8 = <b>Demonstrator aktywnego ataku spoofing.</b> Nowy rodzaj scenariusza <c1/> wstrzykuje narastający fałszywy spoofing czasu i uruchamia dla każdego zegara monitor integralności wspomagany zegarem, podając, czy i kiedy spoofing jest wykrywany oraz czy dociera do specyfikacji operacyjnej niewykryty, co zamienia wskaźnik jakości Security w konkretną demonstrację ataku i obrony. Nowy scenariusz odniesienia <c2/>.

seg-aa0cb8038baa = <b>Dostępność wielu konstelacji.</b> Scenariusz orbitalny może łączyć kilka konstelacji (lista <c1/> obok podstawowej <c2/>) dla dostępności wielosystemowego GNSS i rozmycia dokładności, np. GPS plus Galileo. Nowy scenariusz odniesienia <c3/>.

seg-9b9dcd5be0a7 = <b>Raport w postaci karty wyników HTML.</b> Każdy przebieg tworzy teraz także samodzielną kartę wyników HTML z marką: jednoliniowe podsumowanie, wykres (osadzony jako bierny obraz data-URI) i pełny JSON, zapisywane przez CLI obok JSON i SVG. Udostępnialny artefakt w jednym pliku dla wyniku studium lub aneksu.

seg-76c573048a91 = <b>Łączny estymator fuzji czujników.</b> Nowy rodzaj scenariusza <c1/> uruchamia jeden rekurencyjny filtr Kalmana jako rozwiązanie nawigacyjne: łączy stan zegara <c2/> i stan pozycji <c3/>, dyscyplinowany przez GNSS (uczący się przesunięcia częstotliwości i prędkości) i wspomagany optycznym transferem czasu podczas przerwy, zamiast składać niezależne predyktory. Podaje połączony holdover czasu/pozycji oraz integralność ze wspólnej kowariancji. Nowy scenariusz odniesienia <c4/>.

seg-10f0501c91ef = <b>Pełniejszy model szumu IMU.</b> Akcelerometr modeluje teraz pozostałe człony wariancji Allana poza stałym biasem i błądzeniem przypadkowym prędkości: <b>niestabilność biasu</b> (poziom migotania 1/f przy standardowym współczynniku niestabilności biasu Allana, z ponownym użyciem syntezy migotania zegara) oraz <b>błądzenie przypadkowe przyspieszenia</b>. Nowe opcjonalne pola scenariusza inercjalnego <c1/> i <c2/>; ponowne wyznaczenie pozycji GNSS rekalibruje resztkowy dryf biasu.

seg-251ffc7b7722 = <b>Rzeczywista geometria konstelacji z TLE.</b> Konstelację można podać jako blok zestawów elementów dwuliniowych (standardowy format NORAD/Celestrak) w polu <c1/>, dzięki czemu dostępność i rozmycie dokładności używają opublikowanej geometrii rzeczywistej konstelacji zamiast syntetycznego wzoru Walker. Silnik wczytuje uśrednione elementy keplerowskie każdego TLE i propaguje je metodą dwóch ciał, a nie SGP4, co jest uzasadnione dla studium migawkowego od wspólnej epoki. Nowy scenariusz odniesienia <c2/>.

seg-7deb93b51cc7 = <b>Przeglądy parametrów dla studiów kompromisów.</b> Nowy rodzaj scenariusza <c1/> zmienia jeden parametr (<c2/>, <c3/>, <c4/> lub <c5/>) w zakresie liniowym lub logarytmicznym i zapisuje wybrany wskaźnik jakości w każdym punkcie dla obu zegarów, tworząc wykres porównawczy „jak holdover skaluje się ze stabilnością zegara?”, którego potrzebuje kompromis projektowy. Nowy scenariusz odniesienia <c6/>.

seg-ef6f3e77b476 = <b>Pasma ufności Monte Carlo.</b> Scenariusz holdover zegara może uruchomić wiele realizacji (nowe opcjonalne pole <c1/>): każdy wskaźnik jakości jest wtedy podawany jako średnia z rozrzutem między 5. a 95. percentylem, a wykres zacienia obwiednię błędu { "5" }–{ "95" }% wokół mediany dla każdego zegara. Domyślnie pozostaje pojedynczy przebieg. Nowy scenariusz odniesienia <c2/>.

seg-e70cc0973fa3 = <b>Orbity mimośrodowe i dryf J2.</b> Typ orbity jest teraz pełną orbitą keplerowską (półoś wielka, mimośród, nachylenie, RAAN, argument perygeum, anomalia średnia), propagowaną przez rozwiązanie równania Keplera, z opcjonalną sekularną regresją węzłów J2 i precesją apsyd. Nowe opcjonalne pola scenariusza <c1/>, <c2/> i <c3/> oraz scenariusz odniesienia <c4/> (użytkownik o okresie { "12" } h, silnie mimośrodowy, o krytycznym nachyleniu). Orbity kołowe zachowują pierwotną ścieżkę w postaci zamkniętej bit w bit.

seg-cc041e16d418 = Pakiet hybrydowy (połączone PNT) podaje teraz <b>Integrity</b> i <b>Security</b>, więc wszystkie cztery pakiety obejmują pełny zestaw operacyjnych wskaźników jakości. Integrity to zawieranie w granicy ochrony kanału czasu przez estymator Kalmana dyscyplinowany do prawdy, gdy GNSS jest nominalny, i zakotwiczany ponownie (luźniej) przy każdej optycznej resynchronizacji; jego granica obejmuje poziom szumu pomiarowego łącza, więc zegar znacznie lepszy od łącza jest oceniany względem rzeczywistego szumu dostarczonego rozwiązania. Security to wskaźnik wykrywania spoofingu wspomaganego zegarem względem specyfikacji czasu.

seg-e0b666457d6e = Notatki wydania są teraz generowane ze starannie przygotowanej sekcji CHANGELOG dla tagu (<c1/>), więc każde wydanie na GitHubie wyróżnia to, co się zmieniło, zamiast wypisywać surowe commity.

seg-f785718e9454 = Wskaźnik jakości <b>Security</b> (wcześniej niewypełniony): wskaźnik wykrywania spoofingu wspomaganego zegarem dla pakietów zegara holdover i orbity. Modeluje monitor integralności, który porównuje czas pochodzący z GNSS z własną predykcją zegara na biegu swobodnym w oknie koherentnym; próg detekcji łączy uśredniony szum pomiaru z niepewnością biegu swobodnego zegara, więc cichszy zegar wykrywa mniejsze, wolniejsze spoofingi czasu. Wskaźnik jest podawany w <c1/> względem specyfikacji czasu, co uzupełnia sześć operacyjnych wskaźników jakości.

seg-9164140872c8 = <b>Dokładność pozycji</b> wyprowadzona z geometrii dla pakietu orbity: z geometrii kierunków widzenia do widocznych satelitów tworzy macierz projektu i jej czynnik kowariancji <c1/>, dając współczynniki rozmycia dokładności (GDOP/PDOP/HDOP/VDOP/TDOP). Dokładność pozycji to pozycyjny DOP przeskalowany konfigurowalnym błędem odległości równoważnym użytkownika (nowe opcjonalne pole scenariusza <c2/>). Wynik orbity niesie teraz podsumowanie geometrii (ułamek próbek z rozwiązaniem, najlepszy i medianowy PDOP oraz sigma pozycji).

seg-3285502161c6 = <b>Playground</b> w przeglądarce (<c1/>), który uruchamia silnik po stronie klienta jako WebAssembly: wybierz scenariusz odniesienia lub edytuj TOML, uruchom go i zobacz podsumowanie, wykres oraz pełny JSON, bez wysyłania czegokolwiek. Przepływ <c2/> buduje go i publikuje w GitHub Pages, a nowy eksport WebAssembly <c3/> zasila odczyt.

seg-0dca5318f7ce = Opisane osie y wykresów SVG: linie siatki, liczbowe etykiety podziałek i tytuł osi z jednostkami (przez wspólną funkcję pomocniczą <c1/>), dzięki czemu wielkości da się odczytać.

seg-ce84a3d61f19 = Przepływ publikowania pakietów (<c1/>) do crates.io, PyPI i npm, każdy bramkowany tokenem swojego rejestru i uruchamiany opublikowanym wydaniem.

seg-0f01369fc29b = Poziom migotania (1/f) FM dla modelu błędów zegara, syntetyzowany jako suma rozmieszczonych logarytmicznie procesów Ornsteina–Uhlenbecka i skalibrowany tak, by płaski poziom odchylenia Allana leżał na konfigurowalnej wartości. Domyślnie wyłączony; włączany dla każdego zegara przez opcjonalne pole scenariusza <c1/>.

seg-5b7fcd386fd3 = Kanał żyroskopu dla modelu inercjalnego: resztkowy bias żyroskopu i błądzenie przypadkowe kąta wywołują błąd orientacji (przechyłu), który sprzęga grawitację w poziomy błąd siły właściwej, dominujący mechanizm narastania błędu w strapdown. Domyślnie wyłączony; włączany dla każdego czujnika przez opcjonalne pola <c1/> i <c2/>.

seg-efe9f10d2641 = Dwustanowy (faza, częstotliwość) estymator zegara Kalmana z dokładną dyskretyzacją szumu procesu van Loana. Bieg swobodny ze znanego stanu dokładnie odtwarza analityczny wzrost błędu holdover (<c1/>), a filtr dodatkowo podaje bieżącą granicę niepewności 1-sigma.

seg-539e24f34ed1 = Przebieg zegara podaje teraz wskaźnik jakości <b>Integrity</b> (wcześniej niewypełniony): ułamek próbek przerwy, których błąd mieści się w granicy ochrony 3-sigma filtra, udostępniany w JSON wyniku i w podsumowaniu CLI.

seg-80620c97e3f5 = Dostępność GNSS wyprowadzona z geometrii: propagacja orbity kołowej, generator konstelacji Walker-delta i widoczność w linii prostej (zasłanianie przez Ziemię plus maska elewacji) dają oś czasu dostępności z rzeczywistej geometrii orbitalnej. Nowy rodzaj scenariusza <c1/> i scenariusz odniesienia <c2/> (statek kosmiczny wewnątrz powłoki GNSS z przerywanym pokryciem).

seg-67549163ad7d = Opcjonalne rozszerzenie Pythona (PyO3, abi3) udostępniające <c1/>, <c2/> i <c3/>, pakowane maturin (<c4/>) i budowane dla Linuksa, macOS i Windows przez przepływ <c5/> uruchamiany tagiem wydania. Wiązanie jest opcjonalną zależnością za bramką funkcji: domyślna kompilacja, testy i bramka audytu zależności pozostają nienaruszone.

seg-c76dc363f0b1 = Opcjonalny moduł WebAssembly (wasm-bindgen) udostępniający <c1/>, <c2/> i <c3/>, budowany wasm-pack pod funkcją <c4/>; <c5/> jest bramkowany celem, by używać przeglądarkowego źródła entropii na <c6/>.

seg-cf1b0eef2201 = Wspólne wywołanie <c1/> używane przez CLI i oba wiązania, więc wiersz poleceń i wiązania nie mogą się rozjechać.

seg-8d4f855d11bd = Ocena holdover uwzględnia teraz segmenty: osie czasu przerw są dzielone na ciągłe segmenty przy ponownym uzyskaniu GNSS, a podawany holdover to najgorszy (najkrótszy) bieg swobodny spośród nich. Scenariusze z pojedynczą przerwą pozostają bez zmian. Dotyczy ocen zegara, inercjalnej i hybrydowej.

seg-8b3556d125ed = Podawane <c1/> modelu inercjalnego to teraz <c2/> (było <c3/>), co odzwierciedla połączone kanały akcelerometru i żyroskopu.

seg-d842f9cc0a9c = Wydanie początkowe.

seg-962b75c38735 = <b>Deterministyczny silnik symulacji</b> dla hybrydowego kwantowo-klasycznego PNT: wspólny interfejs modeli błędów, deklaratywne scenariusze dostępności GNSS, estymatory holdover / nawigowania zliczeniowego oraz ocena wskaźników jakości względem standardowych operacyjnych kryteriów PNT. Wyniki są odtwarzalne z <c1/> (wersjonowany, samoopisujący się JSON z haszem scenariusza) i renderowane jako wykresy SVG. CLI przydziela scenariusze według <c2/>.

seg-16e574edc3a8 = <b>Cztery pakiety czujników</b>, każdy skalibrowany do opublikowanych danych i sprawdzony względem standardowej zależności:

seg-b49bbb60c2cd = <b>Holdover zegara</b> — biały FM, błądzenie przypadkowe FM i starzenie liniowe; sprawdzone za pomocą overlapping odchylenia Allana (Riley, NIST SP { "1065" }). Chipowy zegar atomowy kontra zegar optyczny na sieci strontowej.

seg-be2c5f28b256 = <b>Nawigowanie zliczeniowe inercjalne</b> — resztkowy bias + błądzenie przypadkowe prędkości, dwukrotnie całkowane do błędu pozycji; sprawdzone względem zależności Grovesa dla wzrostu błędu. Akcelerometr z zimnych atomów kontra akcelerometr klasy nawigacyjnej.

seg-fcb0f72db736 = <b>Transfer czasu</b> — jitter czasowy łącza optycznego kontra RF → precyzja synchronizacji → pomiar odległości jednokierunkowy.

seg-93e5f2f70b58 = <b>Fuzja hybrydowa (zwieńczenie)</b> — połączony zestaw PNT, który musi utrzymać zarówno czas, jak i pozycję, z opcjonalnym wspomaganiem zegara optycznym transferem czasu między satelitami.

seg-e0a8cbe0c105 = <b>Jeden cytowany scenariusz odniesienia na pakiet</b> w <c1/>, przy czym każdy parametr liczbowy niesie recenzowane <c2/>.

seg-8f1cc09b2513 = <b>Strażnicy odtwarzalności i higieny repozytorium</b>; CI (format, clippy, testy, strażnicy, MSRV) oraz bramkowany tagiem potok wydania, który ponownie uruchamia wszystkie kontrole.

seg-8b4e21f56334 = <b>Dokumentacja</b>: README z diagramami architektury, raport stanu walidacji, przewodnik dla współtwórców, polityka bezpieczeństwa i kodeks postępowania; licencja Apache-2.0; szablony zgłoszeń/PR i konfiguracja Dependabot.

seg-e26d94f06ead = Neutralność wobec dostawców w całości; recenzowane cytowania naukowe i metrologiczne zachowano.

seg-84cb67686edf = Higiena licencji Apache-2.0: nagłówki SPDX we wszystkich źródłach, plik <c1/> z zastrzeżeniem znaku towarowego, poświadczenie Developer Certificate of Origin (DCO) dla wkładów oraz egzekwowanie przez <c2/> licencji/zaleceń dotyczących zależności w CI.

seg-a0f14bea7532 = Pozycjonowanie open-core (README): bezpłatny silnik na licencji Apache-2.0 oraz dostępne komercyjne wsparcie, integracja i zastrzeżone rozszerzenia od Ashforde OÜ, utrzymywane z usług, a nie z opłat licencyjnych.

seg-899815063eb1 = <c1/>, aby oprogramowanie można było cytować.

seg-15f45d8ccb0f = <s1>Poprzednia</s1>Gdzie mieści się Kshana

seg-cd8a14a9e8ec = <s1>Następna</s1>Licencjonowanie
