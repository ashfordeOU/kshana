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
