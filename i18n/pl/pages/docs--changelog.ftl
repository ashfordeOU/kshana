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

seg-66749e5be121 = [{ $version }] - 2026-10-22

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
