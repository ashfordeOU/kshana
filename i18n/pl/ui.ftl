# Interface text (Polish): site chrome, notices, language switcher, Studio shell.

## Site chrome
site-skip-link = Przejdź do treści
site-nav-primary = Główna
site-nav-missions = Misje
site-nav-capabilities = Możliwości
site-nav-evidence = Dowody
site-nav-research = Badania
site-nav-developers = Dla programistów
site-nav-docs = Dokumentacja
site-nav-editions = Wydania
site-nav-search = Szukaj
site-nav-launch = Uruchom
site-nav-studio = { -brand } Studio
site-nav-home = Strona główna { -brand }
site-nav-theme = Przełącz między jasnym a ciemnym motywem
site-version = v{ $version }

site-footer-tagline = Otwartoźródłowy symulator odporności PNT (pozycjonowanie, nawigacja i czas). Nie steruje żadnym sprzętem radiowym i niczego nie nadaje: jego wynikiem na poziomie sygnału są pliki próbek IQ w paśmie podstawowym, a programowy odbiornik GNSS jest narzędziem analitycznym. To nie jest produkt lotniczy.
site-footer-product = Produkt
site-footer-company = Firma
site-footer-benchmark = Benchmark
site-footer-install = Instalacja
site-footer-mcp = Serwer MCP
site-footer-github = GitHub
site-footer-kshana-pro = { -brand } Pro
site-footer-licence = { -brand } v{ $version } · Ashforde® OÜ · AGPL-3.0, z możliwością licencji komercyjnej
site-footer-provenance = Każdy wykres pochodzi z zarejestrowanego przebiegu silnika w wersji v{ $version } i podaje swój scenariusz, ziarno (seed) oraz sposób jego odtworzenia.

## Language switcher
site-lang-label = Język
site-lang-switch-aria = Wybierz język tej strony
site-lang-auto = Język przeglądarki
site-lang-remembered = Twój wybór jest zapamiętany na tym urządzeniu.

## Notices (shown at the top of a page's content)
notice-machine-translation = { -mt-notice }
notice-fallback =
    { $n ->
        [one] { $n } część tej strony zmieniła się od czasu tłumaczenia i jest wyświetlana po angielsku.
        [few] { $n } części tej strony zmieniły się od czasu tłumaczenia i są wyświetlane po angielsku.
        [many] { $n } części tej strony zmieniło się od czasu tłumaczenia i jest wyświetlanych po angielsku.
       *[other] { $n } części tej strony zmieniło się od czasu tłumaczenia i jest wyświetlanych po angielsku.
    }
notice-not-started = Ta strona nie została jeszcze przetłumaczona. Jest wyświetlana po angielsku.
notice-detected = Wyświetlany język: { $language }. <a1>Przełącz na angielski</a1>
notice-dismiss = Zamknij
notice-recorded-in-english = Zapisano po angielsku
notice-advisory = { -advisory }

## Studio shell
studio-title = { -brand } Studio
studio-home = Strona główna { -brand }
studio-search-label = Znajdź scenariusz, obszar, ustawienie lub polecenie
studio-search-placeholder = Szukaj według nazwy, pytania lub ustawienia, na przykład maska elewacji
studio-search-scenarios = Szukaj scenariuszy, obszarów lub ustawień
studio-search-commands = Szukaj scenariuszy i poleceń
studio-search-all = Znajdź scenariusz, obszar, ustawienie, widok lub polecenie
studio-search = Szukaj
studio-theme = Przełącz między jasnym a ciemnym motywem
studio-starting-questions = Pytania na początek
studio-where-you-are = Gdzie się znajdujesz
studio-engine-status = Gdzie działa silnik
studio-views = Widoki: Geometria, Zaufanie do odbiornika, Mapa zakłóceń, Omówienie szkolenia, Narzędzia
studio-more-views = Więcej widoków
studio-advanced-full = Pełny panel: wszystkie panele, pola i karty
studio-advanced-switch = Przełącz na widok zaawansowany
studio-view-geometry = Geometria: skyplot, skyline i DOP
studio-view-training = Omówienie szkolenia: otwórz dziennik instruktora
studio-view-interference = Mapa zakłóceń: otwórz pliki map
studio-view-receiver-trust = Zaufanie do odbiornika: otwórz przebieg statku
studio-view-tools = Narzędzia: dowody, bench, compliance, OSNMA
studio-result = Wynik
studio-result-meaning = Co oznacza wynik
studio-key-figures = Kluczowe wartości
studio-result-views = Widoki tego wyniku
studio-figures-of-merit = Wskaźniki jakości
studio-find-result-field = Znajdź pole wyniku
studio-capability-view = Widok możliwości
studio-time-series = Szereg czasowy
studio-chart-source = Źródło wykresu
studio-signal-band = Sygnał i pasmo
studio-signal-field = Pole sygnału
studio-clock-holdover = Holdover zegara
studio-telecom-masks = Maski synchronizacji telekomunikacyjnej
studio-clock-stability = Stabilność zegara
studio-orbit-3d = Orbita 3D
studio-ground-track = Ślad na powierzchni
studio-parameter-sweep = Przegląd parametru
studio-compare-runs = Porównaj przebiegi
studio-animation = Animacja
studio-engine-report = Raport silnika
studio-exports = Eksporty i raport
studio-full-result = Pełny dokument wyniku
studio-settings = Ustawienia i szczegóły
studio-find-setting = Znajdź ustawienie, na przykład maska
studio-find-scenario-setting = Znajdź ustawienie tego scenariusza
studio-engine-summary = Podsumowanie samego silnika
studio-restore-scenario = Przywróć dołączony scenariusz
studio-copy-scenario = Skopiuj tekst scenariusza
studio-scenario-source = Źródło scenariusza (TOML)
studio-install-engine = Zainstaluj silnik
studio-run-history = Historia przebiegów
studio-scenarios-count =
    { $n ->
        [one] Uruchamiany scenariusz ({ $n })
        [few] Uruchamiane scenariusze ({ $n })
        [many] Uruchamiane scenariusze ({ $n })
       *[other] Uruchamiane scenariusze ({ $n })
    }
studio-ledger-rows =
    { $n ->
        [one] { $n } wiersz rejestru
        [few] { $n } wiersze rejestru
        [many] { $n } wierszy rejestru
       *[other] { $n } wiersza rejestru
    }
studio-recorded-in-english = Zapisano po angielsku
studio-lang-engine-fallback = Nie udało się wczytać tekstu silnika dla tego języka; wyświetlany jest angielski.

studio-geometry-kshana-home = Strona główna Kshana

studio-geometry-back-to-the-studio = Powrót do Studio

studio-geometry-step-the-time = Przesuń czas

studio-geometry-draw-the-skyline = Narysuj skyline

studio-geometry-skip-to-the-view = Przejdź do widoku

studio-geometry-which-satellites-can-you-see = Które satelity są widoczne i jak dobra jest ich geometria?

studio-geometry-what-this-shows = Co to pokazuje

studio-geometry-starting-the-engine = Uruchamianie silnika…

studio-geometry-every-setting-is-in-the = Każde ustawienie jest w adresie strony, więc skopiowany link otwiera to samo niebo.

studio-geometry-offset-from-the-constellations-reference = Przesunięcie względem epoki odniesienia konstelacji

studio-geometry-10-min = −10 min

studio-geometry-10-min-2 = +10 min

studio-geometry-your-own-orbital-elements-tle = Własne elementy orbitalne (TLE)

studio-geometry-use-these-elements = Użyj tych elementów

studio-geometry-back-to-the-presets = Powrót do ustawień wstępnych

studio-geometry-clear-the-skyline = Wyczyść skyline

studio-geometry-drag-on-the-skyplot-to = Przeciągnij po skyplocie, aby narysować skyline (kroki: 1° azymutu, 0.5° elewacji). Gdy skyplot ma fokus: Strzałki w lewo i w prawo przesuwają po horyzoncie (z Shift o 10°), strzałki w górę i w dół podnoszą lub obniżają skyline w tym miejscu (z Shift o 5°), Delete go czyści.

studio-geometry-copy-a-link-to-this = Skopiuj link do tego nieba

studio-geometry-download-the-skyplot-svg = Pobierz skyplot (SVG)

studio-geometry-zenith-in-the-centre-the = Zenit pośrodku, horyzont na brzegu, północ u góry. Wypełnione znaczniki to satelity w rozwiązaniu; puste znaczniki są zasłonięte przez maskę lub skyline albo nie są używane.

studio-geometry-dilution-of-precision = Rozmycie dokładności

studio-geometry-how-much-the-geometry-multiplies = Ile razy geometria powiększa błąd pseudoodległości. Im mniej, tym lepiej; około 1 to wynik doskonały, powyżej 6 słaby.

studio-geometry-horizontal-position-error = Błąd położenia w poziomie

studio-geometry-satellites-as-a-table = Satelity w tabeli

studio-geometry-the-same-satellites-as-the = Te same satelity co na skyplocie.

studio-geometry-azimuth = Azymut, °

studio-geometry-elevation = Elewacja, °

studio-geometry-in-the-solution = W rozwiązaniu

studio-geometry-the-engine-runs-here-as = Silnik działa tutaj jako WebAssembly. Nic nie jest pobierane z innej witryny i nic, co ustawisz, nie jest nigdzie wysyłane.

studio-holdover-holdover-test-scenarios = Scenariusze testu holdover

studio-holdover-holdover-test = Test holdover

studio-holdover-how-far-does-the-time = Jak duży staje się błąd czasu po utracie GNSS?

studio-holdover-opening-the-scenarios = Otwieranie scenariuszy…

studio-holdover-verdict-step-by-step = Werdykt krok po kroku

studio-holdover-time-error-over-the-record = Błąd czasu w całym zapisie

studio-holdover-the-three-phases-are-shaded = Trzy fazy są zacieniowane; przerywane linie pionowe to dwa czasy podane przez operatora. Przerywane linie poziome to granice masek dla maksymalnego bezwzględnego błędu czasu, każda narysowana nad krokiem, który wskazuje jej maska, oraz pasmo odzyskiwania; trójkąt oznacza chwilę, w której po raz pierwszy zostaje przekroczony budżet lub obwiednia holdover ePRTC-A.

studio-holdover-of-the-baseline-and-the = Dla punktu odniesienia i holdover; krzyżyk to granica maski w chwili, gdy jej sprawdzenie wypadło najgorzej.

studio-holdover-the-same-two-steps-against = Te same dwa kroki wobec granic TDEV.

studio-holdover-the-numbers = Liczby

studio-holdover-everything-below-is-the-engine = Wszystko poniżej pochodzi z silnika, w podanych przez niego jednostkach.

studio-holdover-mask-checks = Sprawdzenia masek

studio-holdover-each-mask-is-measured-on = Każda maska jest mierzona na kroku, który wskazuje jej warunek. Maska, która wymaga dłuższego zapisu, niż dał krok, jest INCOMPLETE i nigdy nie jest ekstrapolowana; każda pozycja, którą Zalecenie pozostawia do dalszych badań, jest pominięta.

studio-holdover-what-this-does-not-cover = Czego to nie obejmuje

studio-interference-cell-size-in-degrees-empty = Rozmiar komórki w stopniach (puste dla 0.5)

studio-interference-https = https://…

studio-interference-about-this-page = O tej stronie

studio-interference-interference-map = Mapa zakłóceń

studio-interference-where-did-position-reports-look = Gdzie raporty położenia wyglądały na pogorszone?

studio-interference-open-map-files = Otwórz pliki map

studio-interference-or-drop-them-here = lub upuść je tutaj

studio-interference-open-the-synthetic-demo = Otwórz demo syntetyczne

studio-interference-close-all-maps = Zamknij wszystkie mapy

studio-interference-nothing-open-yet = Nic jeszcze nie otwarto.

studio-interference-build-a-map-here = Zbuduj mapę tutaj

studio-interference-build-from-the-synthetic-sample = Zbuduj z próbki syntetycznej

studio-interference-route-exposure-here = Narażenie trasy tutaj

studio-interference-use-the-synthetic-route = Użyj trasy syntetycznej

studio-interference-reading-these-maps = Jak czytać te mapy

studio-interference-maps-inherit-the-coverage-of = Mapy dziedziczą pokrycie swojego źródła: odbiorniki ADS-B prowadzone przez wolontariuszy zostawiają otwarte morze słabo pokryte, a otwarte dane AIS pomijają niektóre klasy jednostek. Przeczytaj uwagi o pokryciu w każdym pliku.

studio-interference-no-coastline-or-basemap-is = Nie rysuje się linii brzegowej ani mapy podkładowej i nic nie jest pobierane z żadnego serwera; siatka to wyłącznie szerokość i długość geograficzna.

studio-interference-no-identifier-of-any-aircraft = W tych plikach nie ma identyfikatora żadnego statku powietrznego ani jednostki pływającej; komórki ze zbyt małą liczbą różnych statków powietrznych lub jednostek w ogóle nie są publikowane, a liczba AIS równa jeden lub dwa jest zatajana.

studio-lunar-infra-lunar-infrastructure-scenarios = Scenariusze infrastruktury księżycowej

studio-lunar-infra-lunar-infrastructure = Infrastruktura księżycowa

studio-lunar-infra-what-can-the-moon-s = Co orbita i powierzchnia Księżyca mogą zapewnić jako infrastruktura nawigacyjna i geodezyjna i gdzie nie wystarczają?

studio-lunar-infra-five-studies-of-what-lunar = Pięć badań tego, co orbitery księżycowe i księżycowa stacja powierzchniowa mogłyby razem zapewnić jako infrastruktura nawigacyjna i geodezyjna: wyznaczanie orbity z sygnałów GNSS z Ziemi w porównaniu ze śledzeniem naziemnym, rozwiązywanie fazy nośnej między stacją powierzchniową a orbiterem, wspólne estymowanie księżycowego układu odniesienia, powiązanie GNSS, VLBI i pomiarów laserowych na jednym statku kosmicznym oraz to, jak wrażliwe na pływy i libracje Księżyca są pomiary laserowe i śledzenie. Dane wejściowe są ilustracyjne, a model ograniczony; tam, gdzie badanie nie osiągnęło progu, względem którego zostało wstępnie zarejestrowane, strona to mówi. Każda liczba jest skopiowana z wyniku zapisanego przez silnik; strona ją skaluje i rysuje, a niczego innego nie oblicza.

studio-lunar-infra-what-the-result-holds = Co zawiera wynik

studio-lunar-infra-findings-disclosures-and-what-was = Ustalenia, ujawnienia i to, czego nie zweryfikowano

studio-lunar-what-these-figures-are = Czym są te wartości

studio-lunar-map-key = Legenda mapy

studio-lunar-lunar-station = Stacja księżycowa

studio-lunar-what-accuracy-could-a-reference = Jaką dokładność mogłaby zapewnić stacja referencyjna w pobliżu księżycowego bieguna południowego i gdzie?

studio-lunar-the-constellation-its-signal-in = Konstelacja, jej błąd sygnału w przestrzeni, błąd pomiaru położenia stacji, opóźnienie poprawek i kwantyzacja łącza to dane wejściowe podane w pliku scenariusza, każda ze źródłem lub oznaczona jako ilustracyjna. Żadna wartość tutaj nie została sprawdzona względem prawdziwej stacji ani danych z lotu.

studio-lunar-the-source-and-every-input = Źródło i każda zmieniona dana wejściowa są w adresie strony, więc skopiowany link otwiera to samo badanie.

studio-lunar-a-result-file-is-the = Plik wyniku to JSON zapisywany przez silnik dla tego rodzaju (wynik JSON z wiersza poleceń lub przebieg zapisany stąd). Jest czytany na tej stronie; nic nie jest wysyłane.

studio-lunar-each-field-shows-the-scenario = Każde pole pokazuje wartość z pliku scenariusza, dopóki jej nie zmienisz. Doba epok na całej siatce trwa dłuższą chwilę: mniej prób lub dłuższy krok czasu przyspieszają obliczenia.

studio-lunar-run-it-here = Uruchom tutaj

studio-lunar-back-to-the-file-s = Powrót do wartości z pliku

studio-lunar-copy-a-link = Skopiuj link

studio-lunar-save-this-result-json = Zapisz ten wynik (JSON)

studio-lunar-corrected-error-over-the-south = Błąd po korekcji w regionie podbiegunowym południowym

studio-lunar-south-polar-stereographic-the-pole = Stereograficzny południowobiegunowy: biegun pośrodku, brzeg siatki na obwodzie, długość 0° u góry, 90° na wschód po prawej. Każda komórka to jeden punkt siatki; gruba linia to miejsce, w którym błąd po korekcji przekracza próg, a linia przerywana to promień pokrycia dla danego azymutu.

studio-lunar-region-figures = Wartości dla regionu

studio-lunar-over-the-whole-grid-means = Na całej siatce: średnie ważone polem powierzchni oraz najgorszy punkt.

studio-lunar-coverage-radius-per-azimuth = Promień pokrycia dla azymutu

studio-lunar-along-each-bearing-from-the = Wzdłuż każdego kierunku od stacji: odległość, przy której pokrycie po raz pierwszy spada poniżej 95 %.

studio-lunar-as-a-table = W tabeli

studio-lunar-radius-km = Promień, km

studio-lunar-at-the-grid-edge = Na brzegu siatki

studio-lunar-points-along-it = Punkty wzdłuż niego

studio-lunar-an-epoch-is-unavailable-at = Epoka jest niedostępna w danym punkcie, gdy użytkownik widzi mniej niż cztery satelity albo stacja nie widzi każdego satelity używanego przez użytkownika; dla takiej epoki nie oblicza się błędu.

studio-lunar-grid-points-as-a-table = Punkty siatki w tabeli

studio-lunar-the-same-points-as-the = Te same punkty co na mapie, najbliższe stacji jako pierwsze.

studio-lunar-latitude = Szerokość geograficzna, °

studio-lunar-longitude = Długość geograficzna, °

studio-lunar-from-the-station-km = Od stacji, km

studio-lunar-corrected-error = Błąd po korekcji

studio-lunar-uncorrected-error = Błąd bez korekcji

studio-lunar-hpl-median = Mediana HPL

studio-lunar-the-engine-s-statement-inputs = Oświadczenie silnika, dane wejściowe i bilans łącza

studio-lunar-inputs-as-the-engine-read = Dane wejściowe w postaci odczytanej przez silnik

studio-lunar-error-model = Model błędu

studio-lunar-correction-link-budget-at-the = Bilans łącza korekcji w stacji i w najgorszym punkcie

studio-observatory-previous-day = Poprzedni dzień

studio-observatory-day-opened = Otwarty dzień

studio-observatory-next-day = Następny dzień

studio-observatory-interference-observatory = Obserwatorium zakłóceń

studio-observatory-what-did-one-day-s = Jak wyglądały raporty położenia z jednego dnia?

studio-observatory-the-observatory-writes-a-few = Obserwatorium zapisuje kilka plików dla każdego dnia UTC i regionu: komórki siatki z jednym z trzech stanów, listę incydentów i manifest. Otwórz tutaj wytworzone pliki i je przeczytaj. Strona niczego nie oblicza i pokazuje tylko to, co mówią pliki. Nie dostarcza żadnych danych obserwatorium, niczego nie pobiera i niczego nie wysyła.

studio-observatory-open-a-day = Otwórz dzień

studio-observatory-larr = ←

studio-observatory-rarr = →

studio-observatory-the-three-states = Trzy stany

studio-observatory-the-picture-the-observatory-wrote = Obraz zapisany przez obserwatorium

studio-observatory-the-png-you-opened-as = Otwarty plik PNG, bez zmian. Komórki, które nie są narysowane, nie były obserwowane.

studio-observatory-cells-drawn-from-the-file = Komórki narysowane z pliku

studio-observatory-plate-carr-eacute-e-no = Odwzorowanie równoprostokątne (plate carrée), bez mapy podkładowej. Najedź na komórkę lub użyj tabeli, aby zobaczyć jej stan i liczby. Miejsce bez komórki nie było obserwowane.

studio-observatory-hover-or-focus-a-cell = Najedź na komórkę lub ustaw na niej fokus, aby zobaczyć jej stan.

studio-observatory-every-cell-in-the-file = Każda komórka w pliku

studio-observatory-a-count-the-file-withholds = Liczba zatajona przez plik (mniej niż 5 statków powietrznych) jest podawana jako „zatajone”, nigdy jako 0.

studio-observatory-files-and-their-hashes = Pliki i ich skróty

studio-observatory-dataset-licence-and-notice = Zbiór danych, licencja i informacja

studio-observatory-what-this-page-does-and = Co ta strona pokazuje, a czego nie

studio-observatory-products-are-released-at-least = Produkty są publikowane co najmniej 24 godziny po zakończeniu dnia UTC, na komórkach 0.5 stopnia lub grubszych. To nigdy nie jest widok na żywo i nigdy nie mówi „teraz”.

studio-observatory-it-shows-no-cause-no = Nie pokazuje przyczyny, kraju, siły ani źródła zakłóceń, alertu, porównania między miejscami lub dniami ani AIS. ADS-B i AIS nigdy nie są łączone.

studio-observatory-the-page-ships-none-of = Strona nie dostarcza żadnych produktów obserwatorium. Ich publikacja jest decyzją właściciela.

studio-optical-optical-atmosphere-scenarios = Scenariusze atmosfery optycznej

studio-optical-optical-pnt = Optyczne PNT

studio-optical-can-an-optical-link-get = Czy łącze optyczne przebije się przez pogodę?

studio-optical-the-link = Łącze

studio-optical-sites-as-the-engine-states = Stanowiska, tak jak podaje je silnik

studio-optical-inputs-are-marked-everything-else = Dane wejściowe są oznaczone; wszystko inne to wynik silnika dla nich.

studio-optical-it-draws-only-what-the = Rysuje tylko to, co silnik zapisał dla każdego scenariusza, wraz z jego szeregiem czasowym z ziarnem. Strona niczego nie oblicza: skaluje liczby silnika do wykresu.

studio-optical-the-sites-their-cloud-climates = Stanowiska, ich klimaty chmurowe, klasy zegarów i techniki to dane wejściowe wybrane dla ilustracji i tak są oznaczone. Nie porównano ich z żadnym zmierzonym zapisem dostępności.

studio-replay-replay-controls = Sterowanie odtwarzaniem

studio-replay-previous-moment-page-up = Poprzedni moment (Page Up)

studio-replay-step-back = Krok wstecz

studio-replay-step-back-left-arrow = Krok wstecz (strzałka w lewo)

studio-replay-play-or-pause-space = Odtwarzaj lub wstrzymaj (spacja)

studio-replay-step-forward = Krok naprzód

studio-replay-step-forward-right-arrow = Krok naprzód (strzałka w prawo)

studio-replay-next-moment-page-down = Następny moment (Page Down)

studio-replay-replay-speed-mission-seconds-per = Szybkość odtwarzania, sekundy misji na sekundę

studio-replay-mission-clock-seconds-from-the = Zegar misji, sekundy od początku każdego przebiegu

studio-replay-bridge-replay = Odtworzenie mostka

studio-replay-two-runs-one-clock-when = Dwa przebiegi, jeden zegar: kiedy mostek się dowiedział?

studio-replay-put-two-synthetic-runs-side = Zestaw dwa przebiegi syntetyczne obok siebie i odtwarzaj je na jednym zegarze misji. Każdy panel pokazuje, gdzie statek naprawdę był, a gdzie według odbiornika, wskaźnik zaufania silnika i jego pasmo w czasie, satelity wymienione w samym dzienniku (niebo jest puste tam, gdzie dziennik nie słyszy żadnego) oraz werdykt po zakończeniu przebiegu. Wszystko, co narysowano, pochodzi z dziennika lub z wyniku silnika dla niego; nic nie jest czytane z sieci.

studio-replay-save-animated-svg = Zapisz animowany SVG

studio-replay-save-frames-zip = Zapisz klatki (ZIP)

studio-replay-opening-the-two-demo-runs = Otwieranie dwóch przebiegów demo…

studio-replay-the-skyplot-is-the-log = Skyplot pochodzi z GSV samego dziennika: wypełniony znacznik to satelita z natężeniem sygnału, pusty jest wymieniony bez niego, a zacieniowany sektor to zakres azymutu, w którym dziennik wymienia satelity i nie słyszy żadnego z nich. Zasłonięte niebo i zagłuszony sygnał wyglądają tu tak samo. To nie jest skyline, a konstelacja jest nominalna, a nie efemerydami na datę dziennika.

studio-replay-position-error-is-the-logged = „Błąd położenia” to zapisana w dzienniku odległość między położeniem prawdziwym a zgłoszonym; pierścień wokół statku to ta odległość narysowana w skali. Czas od początku zdarzenia do pierwszego wyniku poniżej nominalnego to różnica dwóch zapisanych czasów, a nie miara skuteczności detekcji.

studio-replay-the-vessel-glyph-points-along = Symbol statku wskazuje kierunek według żyrokompasu (HDT), na który nie wpływa żadne zdarzenie; przerywany zarys to miejsce, w którym odbiornik umieszcza statek, wzdłuż zgłaszanego kursu. Różnica między nimi to wskazówka do omówienia.

studio-replay-the-coast-is-natural-earth = Wybrzeże to ląd Natural Earth z domeny publicznej w skali 1:10 milionów, dołączony do tej strony (nic nie jest pobierane). Położenia w demo są zmyślone, więc wybrzeże pokazuje, gdzie wypadają te zmyślone współrzędne. Wyłącznie ilustracja, nigdy do nawigacji.

studio-ssv-space-user-gnss-scenarios = Scenariusze GNSS dla użytkownika w przestrzeni kosmicznej

studio-ssv-space-user-gnss = GNSS dla użytkownika w przestrzeni kosmicznej

studio-ssv-which-navigation-signals-can-a = Z jakich sygnałów nawigacyjnych może jeszcze korzystać statek kosmiczny daleko ponad satelitami GNSS?

studio-ssv-the-satellites-of-a-navigation = Satelity systemu nawigacyjnego skierowane są ku Ziemi, więc statek kosmiczny nad nimi słyszy tylko to, co przecieka obok brzegu tarczy Ziemi lub przez listki boczne. Ta strona pokazuje, co silnik ustala dla pięciu przypadków: dostępność na powłoce na wysokości geostacjonarnej, wysoce eliptyczna orbita, transfer księżycowy z odbiornikiem słabych sygnałów, filtr pokładowy i formacja dwóch statków kosmicznych. Każda liczba jest skopiowana z wyniku zapisanego przez silnik; strona ją skaluje i rysuje, a niczego innego nie oblicza.

studio-ssv-against-the-icg-booklet = W porównaniu z broszurą ICG

studio-tools-leave-empty-to-check-integrity = pozostaw puste, aby sprawdzić tylko integralność

studio-tools-synthetic-osnma-example = Syntetyczny przykład OSNMA

studio-tools-trust-and-evidence-tools = Narzędzia zaufania i dowodów

studio-tools-trust-evidence-and-test-tools = Narzędzia zaufania, dowodów i testów

studio-tools-the-0-35-features-that = Funkcje wersji 0.35, które działają w przeglądarce, i miejsca, gdzie znaleźć te, które nie mogą. Pliki otwierane tutaj są czytane na tej stronie i nigdy nie są wysyłane; silnik działa na Twoim komputerze jako WebAssembly.

studio-tools-maritime-trust = Zaufanie morskie

studio-tools-training-debrief = Omówienie szkolenia

studio-tools-the-engine-starts-when-you = Silnik uruchamia się, gdy użyjesz narzędzia.

studio-tools-every-0-35-feature-and = Każda funkcja wersji 0.35 i gdzie ją znaleźć

studio-tools-in-this-browser-where-it = W tej przeglądarce, gdzie może działać. Pozostałe to funkcje wiersza poleceń lub serwera, a powód jest podany.

studio-tools-in-the-studio = W Studio

studio-tools-verify-an-evidence-pack = Zweryfikuj pakiet dowodowy

studio-tools-open-the-synthetic-example-pack = Otwórz syntetyczny przykładowy pakiet

studio-tools-open-it-with-one-byte = Otwórz go ze zmienionym jednym bajtem

studio-tools-no-pack-files-chosen = Nie wybrano plików pakietu.

studio-tools-verify-the-pack = Zweryfikuj pakiet

studio-tools-attach-a-timestamp-token = Dołącz token znacznika czasu

studio-tools-attach-to-the-chosen-pack = Dołącz do wybranego pakietu

studio-tools-export-a-scenario-for-a = Eksportuj scenariusz dla symulatora laboratoryjnego

studio-tools-which-public-framework-rows-do = Dla których wierszy publicznych ram wyniki Twoich przebiegów dostarczają dowodów (supports evidence for)?

studio-tools-use-the-synthetic-example-runs = Użyj syntetycznych przykładowych przebiegów

studio-tools-show-the-mapping-tables = Pokaż tabele odwzorowań

studio-tools-show-the-sources-they-cite = Pokaż cytowane przez nie źródła

studio-tools-no-result-files-chosen = Nie wybrano plików wyników.

studio-tools-build-the-report = Zbuduj raport

studio-tools-galileo-osnma-is-the-navigation = Galileo OSNMA: czy dane nawigacyjne są uwierzytelnione?

studio-tools-load-it = Wczytaj

studio-tools-show-the-recorded-result = Pokaż zapisany wynik

studio-tools-imu-fit-sensor-parameters-for = Dopasowanie IMU: parametry czujników dla scenariuszy hybrydowych i fuzji

studio-tools-fit-the-parameters = Dopasuj parametry

studio-tools-jammertest-score-a-receiver-log = Jammertest: oceń dziennik odbiornika względem opublikowanego planu testów

studio-tools-import-the-schedule = Zaimportuj harmonogram

studio-tools-score-the-log = Oceń dziennik

studio-training-synthetic-library-scenarios = Syntetyczne scenariusze z biblioteki

studio-training-library-scenario-to-generate = Scenariusz z biblioteki do wygenerowania

studio-training-random-seed-optional = Ziarno losowe (opcjonalnie)

studio-training-from-the-scenario = ze scenariusza

studio-training-time-cursor = Kursor czasu

studio-training-replay-speed = Szybkość odtwarzania

studio-training-time-cursor-in-log-rows = Kursor czasu, w wierszach dziennika

studio-training-debrief-timeline-time-cursor = Oś czasu omówienia: kursor czasu

studio-training-what-did-the-crew-see = Co widziała załoga i co naprawdę się działo?

studio-training-open-a-log = Otwórz dziennik

studio-training-choose-an-instructor-log-or = Wybierz dziennik instruktora lub otwórz jeden z pięciu syntetycznych scenariuszy z biblioteki zapisanych przez CLI.

studio-training-or-drop-it-here-or = lub upuść go tutaj, albo otwórz scenariusz z biblioteki:

studio-training-generate-a-stream-here = Wygeneruj strumień tutaj

studio-training-run-the-engine-s-nmea = Uruchom w tej przeglądarce generator szkoleniowy NMEA silnika. Otrzymasz syntetyczny strumień NMEA 0183 na potrzeby ćwiczenia oraz dziennik instruktora i możesz od razu go omówić. Nic nie jest wysyłane; strumieniowanie do symulatora mostka przez TCP lub UDP to funkcja wiersza poleceń (zobacz stronę Narzędzia).

studio-training-previous-moment = Poprzedni moment

studio-training-next-moment = Następny moment

studio-training-true-track-against-reported = Ślad prawdziwy a zgłaszany

studio-training-north-up-one-scale-on = Północ u góry, jedna skala na obu osiach. Cienka szara linia pokazuje, gdzie statek naprawdę był. Kolorowa linia to to, co zgłosił odbiornik, kolorowana według odległości od prawdy. Tam, gdzie odbiornik nie zgłosił pozycji, nic nie jest rysowane.

studio-training-events-and-what-the-receiver = Zdarzenia i to, co powiedział odbiornik

studio-training-one-shared-time-axis-drag = Jedna wspólna oś czasu. Przeciągnij lub kliknij, aby przesunąć kursor; strzałki go przesuwają krokami. Paski zdarzeń pokazują siłę każdego wprowadzonego zdarzenia w czasie.

studio-training-sky-at-the-cursor = Niebo w miejscu kursora

studio-training-the-satellites-the-stream-s = Satelity wymienione w samym GSV strumienia. Wypełniony znacznik ma natężenie sygnału; pusty jest wymieniony bez niego; zacieniowany sektor to miejsce, gdzie strumień wymienia satelity i żaden nie jest słyszany. Konstelacja nominalna, a nie efemerydy na datę strumienia.

studio-training-at-the-cursor = W miejscu kursora

studio-training-events-injected = Wprowadzone zdarzenia

studio-training-as-the-instructor-log-states = Tak, jak podaje je dziennik instruktora, z każdym parametrem.

studio-training-debrief-timeline = Oś czasu omówienia

studio-training-choose-a-moment-to-move = Wybierz moment, aby przesunąć do niego kursor.

studio-training-the-satellite-sky-is-a = Niebo satelitów to nominalna konstelacja, a nie efemerydy na datę strumienia.

studio-training-nothing-here-is-a-measure = Nic tutaj nie jest miarą tego, jak jakikolwiek odbiornik lub system radzi sobie z zakłóceniami.

studio-trust-session-settings-in-toml = Ustawienia sesji w TOML

studio-trust-receiver-trust-session-settings-in = Ustawienia sesji zaufania do odbiornika w TOML

studio-trust-time-cursor-and-filters = Kursor czasu i filtry

studio-trust-time-cursor-in-epochs = Kursor czasu, w epokach

studio-trust-score-timeline-time-cursor = Oś czasu wskaźnika: kursor czasu

studio-trust-each-monitor-s-alarm-ratio = Odsetek alarmów każdego monitora w czasie

studio-trust-about-this-view = O tym widoku

studio-trust-can-the-bridge-trust-this = Czy mostek może ufać tej pozycji?

studio-trust-open-a-run = Otwórz przebieg

studio-trust-open-the-masked-sky-demo = Otwórz demo zasłoniętego nieba (geometria, 0.36)

studio-trust-score-an-nmea-log-here = Oceń tutaj dziennik NMEA

studio-trust-run-the-engine-in-this = Uruchom w tej przeglądarce silnik na dzienniku NMEA 0183 statku i zobacz wynik w widoku poniżej. Dziennik jest czytany na tej stronie i nigdy nie jest wysyłany. Musi być fragmentem o rozmiarze co najwyżej 2 MiB (około 20 000 epok) i zawierać pięciominutowe okno kalibracji. Ustawienia to limity statku i wagi wskaźnika, jak w pliku sesji.

studio-trust-score-the-synthetic-demo-log = Oceń syntetyczny dziennik demo

studio-trust-session-settings-toml = Ustawienia sesji (TOML)

studio-trust-starts-from-the-demo-s = Zaczyna od ustawień demo: edytuj limity prędkości, przyspieszenia i prędkości zwrotu statku, aby pasowały do Twojego. Można tu wkleić plik ustawień dla własnego statku.

studio-trust-jammertest-scorecard = Karta wyników Jammertest

studio-trust-no-scorecard-open = Nie otwarto karty wyników.

studio-trust-generic-receiver-trust-run-not = Ogólny przebieg zaufania do odbiornika (nie statek)

studio-trust-run-the-illustrative-jamming-example = Uruchom ilustracyjny przykład zagłuszania

studio-trust-assess-the-chosen-file = Oceń wybrany plik

studio-trust-the-format-is-guessed-from = Format jest zgadywany na podstawie nazwy pliku; zmień go tutaj, jeśli jest błędny, a następnie oceń ponownie. NovAtel OEM7, RTCM 3 i Septentrio SBF to formaty binarne; są wysyłane do silnika bez zmian, w tej przeglądarce.

studio-trust-imu-file-optional-a-second = Plik IMU (opcjonalnie): drugi czujnik kierunku

studio-trust-an-imu-log-on-the = Dziennik IMU na zegarze dziennika odbiornika uzupełnia kierunek, który monitor kierunku względem kursu odczytuje wszędzie tam, gdzie dziennik odbiornika go nie zawiera. Używa go tylko sesja statku.

studio-trust-remove-the-imu-file = Usuń plik IMU

studio-trust-no-imu-file = Brak pliku IMU.

studio-trust-session-settings-toml-the-log = Ustawienia sesji (TOML, dziennik jest podany w treści)

studio-trust-first-deduction = Pierwsze odjęcie punktów

studio-trust-first-untrusted = Pierwszy brak zaufania

studio-trust-receiver-reported-track = Ślad zgłoszony przez odbiornik

studio-trust-the-satellites-the-log-s = Satelity wymienione w samym GSV dziennika. Wypełniony znacznik ma natężenie sygnału; pusty jest wymieniony bez niego; zacieniowany sektor to miejsce, gdzie dziennik wymienia satelity i nie słyszy żadnego z nich (zasłonięte niebo i zagłuszony sygnał wyglądają tu tak samo). Konstelacja nominalna, a nie efemerydy na datę dziennika.

studio-trust-score-over-time = Wskaźnik w czasie

studio-trust-score-0-to-100-dashed = Wskaźnik od 0 do 100. Linie przerywane to krawędzie pasm; paski pod spodem to pasmo i bramka. Przeciągnij lub kliknij, aby przesunąć kursor czasu; strzałki przesuwają go krokami.

studio-trust-reasons-at-the-cursor = Powody w miejscu kursora

studio-trust-points-each-check-took-off = Punkty, które każde sprawdzenie odjęło w tej epoce, od największych. Kliknij sprawdzenie, aby zaznaczyć, gdzie było powyżej swojego progu początku.

studio-trust-geometry-at-the-cursor = Geometria w miejscu kursora

studio-trust-the-satellite-geometry-always-shown = Geometria satelitów, zawsze pokazana: jej etykieta (dobra, średnia lub słaba) i współczynniki DOP. Zasłonięte niebo (kadłub, nabrzeże, ściana fiordu) to naturalne pogorszenie, odróżniane od niespójności podobnej do ataku. Wskaźnik odejmuje punkty za geometrię tylko wtedy, gdy jest słaba, co najwyżej 15, i nigdy poniżej pasma pogorszonego.

studio-trust-the-receiver-s-own-flag = Własna flaga odbiornika

studio-trust-what-the-receiver-itself-says = Co sam odbiornik mówi o spoofingu i zagłuszaniu (u-blox UBX-NAV-STATUS i UBX-SEC-SIG), zestawione z monitorami Kshana. Kody pochodzą od odbiornika; żaden z detektorów nie jest prawdą odniesienia, a zgodność nie jest walidacją. Flaga nie zmienia żadnego wskaźnika.

studio-trust-over-the-run = W całym przebiegu

studio-trust-what-the-score-used = Czego użył wskaźnik

studio-trust-read-from-the-run-read = Odczytane z przebiegu, tylko do odczytu.

studio-trust-what-this-view-does-and = Co ten widok pokazuje, a czego nie

studio-trust-nmea-only-checks-cannot-see = Sprawdzenia oparte wyłącznie na NMEA nie widzą spoofera, który odtwarza całą konstelację ze spójnymi położeniem, prędkością, kierunkiem, mocą i zegarem, ani powtórki zapisanych prawdziwych sygnałów. Pozycja bez alarmu nie jest przez to dobrą pozycją.

studio-trust-nothing-on-this-page-is = Nic na tej stronie nie jest miarą tego, jak sprawdzenia działają przy prawdziwych zakłóceniach. Odwzorowanie wskaźnika i każda waga są ustalone, zanim dziennik zostanie oceniony, bez uczenia i bez niczego dopasowywanego do zdarzeń.

studio-main-which-satellites-can-you-see = Które satelity widać z danego miejsca i jak dobra jest ich geometria? Skyplot, skyline i DOP z silnika w Twojej przeglądarce

studio-main-trainer-debrief-for-kshana-nmea = Omówienie dla trenera dzienników instruktora kshana nmea-scenario (tylko szkolenie; pliki zostają w Twojej przeglądarce)

studio-main-where-did-aircraft-and-ships = Gdzie statki powietrzne i statki zgłaszały pogorszone dane nawigacyjne w minionym dniu? Otwórz pliki map dla poszczególnych dni (zostają w Twojej przeglądarce)

studio-main-can-the-bridge-trust-this = Czy mostek może ufać tej pozycji? Otwórz przebieg zaufania do odbiornika statku (pliki zostają w Twojej przeglądarce)

studio-main-evidence-packs-test-bench-export = Pakiety dowodowe, eksport na stanowisko testowe, odwzorowanie compliance, OSNMA, narzędzia wiersza poleceń i asystent AI (pliki zostają w Twojej przeglądarce)

studio-main-map-of-satellites-in-view = Mapa satelitów widocznych nad Ziemią, z zapisanego przebiegu

studio-main-interactive-3-d-view-of = Interaktywny widok 3D propagowanego śladu

studio-main-close-history = Zamknij historię

studio-main-skip-to-the-content = Przejdź do treści

studio-main-receiver-trust = Zaufanie do odbiornika

studio-main-advanced-view = Widok zaawansowany

studio-main-what-would-you-like-to = Co chcesz sprawdzić?

studio-main-pick-a-question-or-start = Wybierz pytanie lub zacznij od wyniku poniżej.

studio-main-showing-below = Pokazano poniżej

studio-main-integrity-over-12-hours = Integralność w ciągu 12 godzin

studio-main-a-radio-waterfall = Wodospad radiowy

studio-main-recorded-result = Zapisany wynik

studio-main-how-many-navigation-satellites-can = Ile satelitów nawigacyjnych widać z dowolnego miejsca na Ziemi?

studio-main-loading-the-recorded-result = Wczytywanie zapisanego wyniku…

studio-main-everything-kshana-can-do = Wszystko, co potrafi Kshana

studio-main-each-area-shows-a-real = Każdy obszar pokazuje prawdziwy zapisany wynik i mieszankę dowodów, na której się opiera.

studio-main-open-your-own-files = Otwórz własne pliki

studio-main-pages-that-run-the-engine = Strony, które uruchamiają silnik na Twoich ustawieniach i plikach. Każda działa w tej przeglądarce; nic nie jest wysyłane.

studio-main-which-satellites-can-you-see-2 = Które satelity widać z danego miejsca i jak dobra jest ich geometria? Narysuj skyline.

studio-main-what-accuracy-could-a-reference = Jaką dokładność mogłaby zapewnić stacja referencyjna w pobliżu księżycowego bieguna południowego i gdzie? MODELLED.

studio-main-can-the-bridge-trust-this-2 = Czy mostek może ufać tej pozycji? Oceń dziennik NMEA statku.

studio-main-where-aircraft-and-ships-reported = Gdzie statki powietrzne i statki zgłaszały pogorszone dane nawigacyjne oraz narażenie trasy.

studio-main-generate-a-drift-or-jamming = Wygeneruj strumień ćwiczenia z dryfem lub zagłuszaniem i omów dziennik instruktora.

studio-main-two-synthetic-runs-on-one = Dwa przebiegi syntetyczne na jednym zegarze: ślad, wskaźnik zaufania, skyplot na żywo i werdykt.

studio-main-the-two-optical-atmosphere-scenarios = Dwa scenariusze atmosfery optycznej: dostępność względem pułapu chmur, przerwy i dywersyfikacja stanowisk.

studio-main-which-navigation-signals-a-spacecraft = Z jakich sygnałów nawigacyjnych może jeszcze korzystać statek kosmiczny daleko ponad satelitami i jak radzą sobie z nimi filtr pokładowy i formacja.

studio-main-what-lunar-orbiters-and-a = Co orbitery księżycowe i stacja powierzchniowa mogą zapewnić jako infrastruktura nawigacyjna i geodezyjna, z podanymi niepowodzeniami.

studio-main-open-a-day-s-observatory = Otwórz pliki obserwatorium z jednego dnia i je przeczytaj: trzy stany, bez przyczyny, nic nie jest wysyłane.

studio-main-pull-the-antenna-score-the = Odłącz antenę, oceń holdover: zapis błędu czasu zmierzony względem masek ITU-T.

studio-main-check-a-signed-pack-or = Sprawdź podpisany pakiet lub dołącz znacznik czasu.

studio-main-motion-and-event-files-for = Pliki ruchu i zdarzeń dla symulatora laboratoryjnego.

studio-main-what-your-runs-evidence-against = Dla czego Twoje przebiegi dostarczają dowodów w opublikowanych ramach.

studio-main-whether-recorded-galileo-data-is = Czy zapisane dane Galileo są uwierzytelnione, znacznik po znaczniku.

studio-main-use-kshana-from-your-assistant = Używaj Kshana z asystenta przez serwer MCP.

studio-main-all-scenarios = Wszystkie scenariusze

studio-main-pick-one-it-opens-on = Wybierz jeden: od razu otworzy się na swoim wyniku.

studio-main-all-questions = Wszystkie pytania

studio-main-every-published-figure = Każda opublikowana wartość

studio-main-read-from-the-result-document = Odczytane z dokumentu wyniku wraz z jednostką, uwagą i pochodzeniem, które silnik zapisuje dla każdej z nich.

studio-main-kalman-self-consistency = Samospójność filtru Kalmana

studio-main-a-consistent-filter-s-reported = Zgłaszana niepewność spójnego filtru odpowiada jego rzeczywistym błędom. NIS (znormalizowany kwadrat innowacji) powinien być bliski 1, a NEES (znormalizowany kwadrat błędu estymacji) bliski 2, każdy w swoim paśmie χ² 95%.

studio-main-engine-chart = Wykres silnika

studio-main-each-series-this-run-publishes = Każdy szereg publikowany przez ten przebieg, względem czasu. Najedź lub przeciągnij po wykresie, aby odczytać wartości.

studio-main-carrier-to-noise-density-db = gęstość stosunku nośnej do szumu, dB-Hz

studio-main-with-the-jammer = Z zagłuszarką

studio-main-without-it = Bez niej

studio-main-each-cell-is-one-satellite = Każda komórka to jeden satelita w jednej epoce z tego przebiegu. Komórki zakreskowane są poniżej progu śledzenia odbiornika: ten satelita jest utracony.

studio-main-interference-outcome = Skutek zakłóceń

studio-main-error-since-gnss-was-lost = błąd od utraty GNSS

studio-main-scenario-budget = Budżet scenariusza

studio-main-move-the-budget-and-the = Przesuń budżet, a czas do przekroczenia zostanie odczytany z własnego zapisu błędu tego przebiegu. Wartość holdover silnika, obliczona dla budżetu scenariusza, jest pokazana obok i jest liczbą miarodajną. Zmień zegar lub przerwę w parametrach, aby ponownie uruchomić fizykę.

studio-main-maximum-time-interval-error = maksymalny błąd interwału czasu

studio-main-time-deviation = odchylenie czasu

studio-main-mask-checks-and-holdover-budgets = Sprawdzenia masek i budżety holdover

studio-main-each-check-s-limit-is = Granica każdego sprawdzenia jest naniesiona jako pierścień przy czasie uśredniania, w którym margines był najgorszy. Maski są przepisane z zaleceń ITU-T (International Telecommunication Union Telecommunication Standardization Sector) wymienionych w każdym wierszu.

studio-main-lower-is-better-fractional-frequency = Im mniej, tym lepiej. Stabilność częstotliwości względnej w funkcji czasu uśredniania τ, na osiach logarytmicznych.

studio-main-earth-centred-inertial-frame = Ziemski inercjalny układ odniesienia

studio-main-drag-to-rotate-scroll-to = Przeciągnij, aby obrócić, przewiń, aby powiększyć.

studio-main-run-the-engine-once-per = Uruchom silnik raz dla każdej wartości i narysuj jeden wskaźnik jakości. Dodaj drugi parametr, aby uzyskać mapę cieplną. Każdy punkt to prawdziwy przebieg silnika, do 60.

studio-main-pinned-runs-side-by-side = przypięte przebiegi obok siebie

studio-main-clear-pins = Wyczyść przypięcia

studio-main-key-figures-run-against-run = Kluczowe wartości, przebieg przy przebiegu

studio-main-the-headline-readouts-of-each = Główne odczyty każdego przypiętego przebiegu; zmiana jest względem przebiegu A.

studio-main-the-engine-s-own-export = własny eksport silnika

studio-main-written-by-the-engine = zapisane przez silnik

studio-main-czml-kml-geojson-stk-ephemeris = CZML, KML, GeoJSON, efemerydy STK, SigMF

studio-main-try-other-settings = Wypróbuj inne ustawienia

studio-main-change-a-value-then-run = Zmień wartość, a następnie uruchom ponownie. Odpowiedź i wykres aktualizują się na miejscu.

studio-main-run-again = Uruchom ponownie

studio-main-cancel-the-run = Anuluj przebieg

studio-main-runs-in-your-browser-nothing = Działa w Twojej przeglądarce. Nic nie jest wysyłane.

studio-main-advanced-settings = Ustawienia zaawansowane

studio-main-every-setting-comes-from-the = Każde ustawienie pochodzi z pliku scenariusza. Edytuj cały plik w sekcji „Dla badaczy”.

studio-main-how-this-is-computed = Jak to jest obliczane

studio-main-level-of-evidence = Poziom dowodowy

studio-main-the-engine-s-own-one = Jednowierszowe podsumowanie silnika

studio-main-every-figure-is-labelled-with = Każda wartość jest oznaczona swoim poziomem dowodowym. Zwalidowane oznacza sprawdzone względem niezależnego zewnętrznego wzorca; modelowane oznacza fizykę z pierwszych zasad z testami, jeszcze niesprawdzoną względem wzorca.

studio-main-for-researchers = Dla badaczy

studio-main-code-data-citation = kod, dane, cytowanie

studio-main-run-it-on-your-computer = Uruchom na swoim komputerze

studio-main-run-it-from-python = Uruchom z Pythona

studio-main-exported-figures-carry-this-doi = Wyeksportowane wykresy mają w podpisie ten DOI (cyfrowy identyfikator obiektu). Ten sam scenariusz, to samo ziarno i ta sama wersja silnika dają te same liczby.

studio-main-toml-tom-s-obvious-minimal = TOML (Tom's Obvious, Minimal Language)

studio-main-in-the-editor-tab-indents = W edytorze Tab wcina o dwie spacje. Naciśnij Escape, a potem Tab, aby przejść dalej. Uruchom ponownie, aby użyć swojej zmiany.

studio-main-every-panel-and-field = Każdy panel i pole

studio-main-the-advanced-view-is-the = Widok zaawansowany to pełny panel: wszystkie panele tego przebiegu obok siebie, każde pole scenariusza, przeglądy, porównania i raport samego silnika. Otwiera się na tym scenariuszu, z Twoimi ustawieniami.

studio-main-kshana-pro = Kshana Pro

studio-main-kshana-studio = Kshana Studio

studio-main-request-an-evaluation = Poproś o ewaluację

studio-main-talk-to-us-about-a = Porozmawiaj z nami o licencji komercyjnej

studio-main-request-a-study = Zleć badanie

studio-main-imagery-nasa-visible-earth-blue = Obrazy: NASA Visible Earth (Blue Marble). Linie brzegowe: Natural Earth. Każdy wykres tutaj jest narysowany z przebiegu silnika; przebieg, raport, animacja lub eksport wykonany przez natywny silnik wiersza poleceń jest oznaczony jako zapisany.

studio-main-this-session = ta sesja

studio-main-runs-you-make-appear-here = Przebiegi, które wykonasz, pojawiają się tutaj. Wybierz jeden, aby przywrócić jego scenariusz i wynik, lub przypnij go, aby porównać.

studio-advanced-find-a-scenario-a-domain = Znajdź scenariusz, dziedzinę, pole lub polecenie

studio-advanced-the-runs-you-made-in = Przebiegi wykonane w tej sesji

studio-advanced-a-short-tour-of-the = Krótki przewodnik po Studio

studio-advanced-toggle-colour-theme = Przełącz motyw kolorystyczny

studio-advanced-switch-to-the-simple-view = Przełącz na widok prosty

studio-advanced-the-simple-view-the-answer = Widok prosty: najpierw odpowiedź, pięć ustawień, szczegóły na żądanie

studio-advanced-scenario-library = Biblioteka scenariuszy

studio-advanced-close-the-library = Zamknij bibliotekę

studio-advanced-find-a-scenario-a-domain-2 = Znajdź scenariusz, dziedzinę lub pole

studio-advanced-scenario-domain-or-field = Scenariusz, dziedzina lub pole

studio-advanced-filter-by-domain = Filtruj według dziedziny

studio-advanced-scenarios-by-mission-domain = Scenariusze według dziedziny misji

studio-advanced-how-the-studio-works = Jak działa Studio

studio-advanced-search-scenarios-domains-or-fields = Szukaj scenariuszy, dziedzin lub pól

studio-advanced-search-scenarios-domains-or-fields-2 = Szukaj scenariuszy, dziedzin lub pól, na przykład maska elewacji

studio-advanced-the-engine-kind-this-scenario = Rodzaj silnika, który uruchamia ten scenariusz

studio-advanced-open-the-scenario-library = Otwórz bibliotekę scenariuszy

studio-advanced-show-the-parameters-and-the = Pokaż parametry i źródło scenariusza

studio-advanced-keep-this-run-to-compare = Zachowaj ten przebieg do porównania z innym (do 4)

studio-advanced-compare-the-pinned-runs = Porównaj przypięte przebiegi

studio-advanced-share-this-run-or-download = Udostępnij ten przebieg lub pobierz go

studio-advanced-result-panels = Panele wyniku

studio-advanced-run-summary = Podsumowanie przebiegu

studio-advanced-parameters-and-scenario-source = Parametry i źródło scenariusza

studio-advanced-close-the-parameters-and-show = Zamknij parametry i pokaż wyniki

studio-advanced-find-a-field-of-this = Znajdź pole tego scenariusza

studio-advanced-find-a-field-for-example = Znajdź pole, na przykład maska

studio-advanced-parameter-view = Widok parametrów

studio-advanced-find-a-scenario-domain-field = Znajdź scenariusz, dziedzinę, pole, panel lub polecenie

studio-advanced-skip-to-results = Przejdź do wyników

studio-advanced-find-anything = Znajdź cokolwiek

studio-advanced-lunar-station-coverage-of-a = Stacja księżycowa: pokrycie stacji referencyjnej (MODELLED)

studio-advanced-simple-view = Widok prosty

studio-advanced-choose-a-scenario = Wybierz scenariusz

studio-advanced-what-do-you-want-to = Co chcesz zrobić?

studio-advanced-pick-a-domain-and-a = Wybierz dziedzinę i scenariusz, skonfiguruj go, uruchom silnik w przeglądarce, a potem odczytaj, porównaj i wyeksportuj wyniki. Nic nie jest wysyłane.

studio-advanced-share-or-export = Udostępnij lub eksportuj

studio-advanced-good-first-runs = Dobre pierwsze przebiegi

studio-advanced-pin-run = Przypnij przebieg

studio-advanced-report-json-scenario-tables-and = raport, JSON, scenariusz, tabele i eksporty

studio-advanced-the-exact-scenario-in-the = dokładny scenariusz, w linku

studio-advanced-an-iframe-for-a-course = iframe dla strony kursu lub wiki

studio-advanced-opens-in-a-new-tab = otwiera się w nowej karcie

studio-advanced-loading-the-engine-the-recorded = Wczytywanie silnika. Najpierw pokazuje się zapisany wynik tego scenariusza.

studio-advanced-got-it = Rozumiem

studio-advanced-headline-numbers-from-the-engine = Główne liczby z wyniku silnika, ze zmianą względem poprzedniego przebiegu tego scenariusza oraz z oceną zaliczone lub niezaliczone, gdy przebieg podaje próg.

studio-advanced-set-parameters = Ustaw parametry

studio-advanced-every-change-re-runs-the = Każda zmiana ponownie uruchamia silnik i aktualizuje kluczowe wartości i panele.

studio-advanced-drag-a-slider-and-the = Przeciągnij suwak, a scenariusz uruchomi się ponownie. Każdy element sterujący zapisuje się wprost w tekście scenariusza poniżej.

studio-advanced-in-the-editor-tab-indents = W edytorze Tab wcina o dwie spacje. Naciśnij Escape, a potem Tab, aby przejść dalej.

studio-mission-thread-time-axis = Oś czasu

studio-mission-thread-mission-thread = Wątek misji

studio-mission-thread-where-does-a-mission-s = Gdzie wyczerpuje się budżet błędu nawigacji i czasu misji?

studio-mission-thread-a-mission-is-a-chain = Misja to łańcuch faz: start, spotkanie, transfer na Księżyc, lądowanie, powrót. Każda faza ma własne czujniki i własny budżet błędu, a każda przekazuje swoją niepewność następnej. Ta strona pokazuje budżet całego łańcucha, faza po fazie, i wskazuje najsłabsze ogniwo.

studio-mission-thread-open-the-artemis-class-example = Otwórz przykład klasy Artemis

studio-mission-thread-open-a-result-file = Otwórz plik wyniku…

studio-mission-thread-the-thread = Wątek

studio-mission-thread-error-against-mission-elapsed-time = Błąd względem czasu od początku misji

studio-mission-thread-the-phases = Fazy

studio-mission-thread-the-budget-of-one-phase = Budżet jednej fazy
