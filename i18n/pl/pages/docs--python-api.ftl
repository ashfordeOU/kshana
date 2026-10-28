# docs--python-api: translations (pl)

seg-5ad814c7ef9e = Uwagi

seg-2bd2101ce454 = Powierzchnia

seg-fffbeccd4266 = Symbol

seg-a129b9e613d0 = Typ

seg-ce0b6a889a87 = Źródło: <c1/>

seg-aea4d3625c20 = { -brand } dostarcza w pełni rozwinięty interfejs programistyczny (API) w Pythonie, zbudowany przy użyciu <a1>PyO3</a1> i <a2>maturin</a2>. Jego pakiety wheel <c1/> są budowane względem stabilnego binarnego interfejsu aplikacji (ABI) Pythona, więc jeden pakiet na platformę działa z CPython ≥ { "3.9" }; pakiety obejmują Linuksa, macOS i Windows, każdy na architekturach x86-64 i 64-bitowym ARM (zob. <a3>WHEEL_TAGS.md</a3>). Dołączony plik typów (<c2/> + <c3/>) daje edytorom oraz narzędziom <c4/>/<c5/> pełne informacje o typach.

seg-8b0ad6639bd5 = Szybki start

seg-28e092a5a781 = Uruchamiaj te fragmenty z katalogu głównego kopii repozytorium: odczytują one pliki scenariuszy z <c1/>. Wiersz z NumPy wymaga <c2/>.

seg-8c83544270b5 = Sygnatura

seg-fa90b5cd182b = Zwraca

seg-6f62744a47df = wynik typowany (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>)

seg-67cd4e7f6ad0 = dokument wynikowy jako ciąg JSON (JavaScript Object Notation)

seg-8246b2be7aaf = dostępne rodzaje scenariuszy i metadane (po sparsowaniu)

seg-b5ad97d3ec18 = te same metadane jako JEDEN ciąg z tablicą JSON, a nie lista (zachowane dla dotychczasowych wywołań; do sparsowanej listy służy <c1/>)

seg-8ce669f8e1d0 = komunikaty o błędach (puste, jeśli dane są poprawne)

seg-6017d21f52dd = znacznik kategorii błędu (<c1/>, <c2/>, <c3/> lub <c4/>) albo <c5/> w razie powodzenia

seg-c62c5ab99132 = wersja silnika

seg-fdaaf33250d1 = ocena rzeczywistego dziennika odbiornika opisanego scenariuszem <c1/>: dokument wynikowy, CSV wskaźnika zaufania dla każdej epoki, wykres i podsumowanie; tabela <c2/> dodaje monitory morskie oraz wskaźnik zaufania 0-100 z uzasadnieniami (wyłącznie doradczo)

seg-0fb76af3d043 = ograniczony fragment NMEA oceniony tak, jak ocenia go tryb na żywo: stan w każdej epoce, wskaźnik 0-100 z uzasadnieniami, podsumowanie (bez gniazda, bez bramki; wyłącznie doradczo)

seg-6ecd9bb3a1cd = dziennik NMEA statku jako przebieg wsadowy: model wskaźnika i wskaźnik każdej epoki wraz z odliczeniami (wyłącznie doradczo)

seg-7cd62f15bc3c = opublikowany katalog i plan Jammertest jako zdarzenia z harmonogramu wzorcowego (<c1/>, <c2/>); są to zaplanowane sloty, a nie zarejestrowane czasy emisji

seg-1e2faf2894e3 = dziennik odbiornika oceniony względem tego harmonogramu: opóźnienie, niewykryte zdarzenia, czas odzyskania i fałszywe alarmy dla każdego testu (MODELLED; podpisany pakiet wymaga wiersza poleceń)

seg-f94eaef45f04 = podpisany pakiet dowodowy dla okna dziennika, w pamięci: <c1/>, <c2/>, <c3/> (zachowaj prywatnie); zapis techniczny, a nie opinia prawna

seg-ebd10aea2f6f = weryfikacja pakietu: skróty, łańcuch, podpis, opcjonalnie zaufany podpisujący, pełny dziennik i znacznik czasu; <c1/> ma wartość <c2/>, <c3/> (nie podano klucza publicznego: pakiet nienaruszony, podpisujący niepotwierdzony) lub <c4/>

seg-bf13e70f1d5c = artefakty <c1/> z wiersza poleceń jako tekst

seg-1e5eb44bec6f = które formaty interoperacyjne mają zastosowanie do scenariusza, bez jego uruchamiania

seg-f61d1659ed80 = <c1/>, <c2/>, <c3/>, <c4/> lub <c5/> w pamięci: <c6/>, każdy plik jako <c7/> (tekst <c8/> lub <c9/>)

seg-bef8250e8453 = trasa GeoJSON zapisana w scenariuszu toru z punktami trasy (<c1/>)

seg-e25bcb6342db = szereg czasowy przebiegu jako animowany SVG, odtwarzacz HTML lub do { "120" } klatek SVG: <c1/>

seg-9b24b9cf0510 = dołączone scenariusze referencyjne i ich TOML

seg-f62c11fe1e7d = powiązanie tokenu RFC { "3161" } (bajty lub base64) z pakietem w pamięci: <c1/>; pakiet nadal musi przejść weryfikację; podpis urzędu nie jest sprawdzany

seg-95fe54b500a7 = nowy klucz podpisujący w pamięci: <c1/> (PRYWATNY), <c2/>, <c3/>, <c4/>; tylko Python

seg-646e6aba13db = odtworzenie jednego nagrania w różnych projektach pętli (<c1/>): dla każdego projektu i PRN jitter w stanie ustalonym, ułamki zaczepienia i C/N0; jedna akwizycja na PRN, każdy kanał na tych samych próbkach

seg-08d46de5e7cd = opis jednego nagrania lub wszystkich nagrań w folderze (odczytuje pliki; <c1/> odczytuje je w całości)

seg-7d9cc8394e65 = ruch pojazdu i zdarzenia scenariusza dla laboratoryjnego symulatora GNSS, w pamięci: <c1/>; rodzaje <c2/>, <c3/>, <c4/>; żaden sygnał nie jest zapisywany, <c5/> należy zachować razem z plikami

seg-e215c7242eb2 = mapowanie jawnych ram odniesienia wypełnione na podstawie tekstów wyników: <c1/> to lista słowników <c2/> (tekst, co najwyżej { "64" }); zwraca <c3/>; pole <c4/> w każdym wierszu mówi, że przebiegi dostarczają dowodów na (supports evidence for) jego możliwości, a nie że ramy odniesienia są spełnione; przy każdym wyświetleniu należy dołączać <c5/>

seg-18d57e4920dd = statyczne tabele mapowania (lub dokumenty źródłowe) jako Markdown, z oświadczeniem na początku

seg-8284e10dce6a = pakiety norm (identyfikator, tytuł, ramy odniesienia, liczba testów) oraz uwaga; pakiet mierzy modelowane scenariusze względem progów podanych przed przebiegiem

seg-ce6b819604a9 = jeden przebieg pakietu: każdy test <c1/>, <c2/> lub <c3/> z wartościami zmierzonymi i oczekiwanymi, a także raport w Markdown pod <c4/>; zgłasza <c5/> dla nieznanego identyfikatora

seg-0f701bc523c6 = implementacja LunaNet AFS sprawdzona względem wydrukowanych tabel i przykładów obliczeniowych z LSIS-AFS V1.0 (progi B1 do B10; B4 zgłasza jedno zapisane niespełnienie)

seg-82aecf261c46 = strumień symboli AFS (tekst z { "0" } i { "1" }) sprawdzony pod kątem wzorca synchronizacji, dekodowania SB1, FID, ciągłości i odstępów TOI; LDPC i CRC-24Q podramek od { "2" } do { "4" } nie są weryfikowane

seg-f72ab45ae10b = testowy strumień symboli z podramkami zastępczymi (nie jest to przebieg sygnału)

seg-1da34527bb64 = podpisany laboratoryjny pakiet pełnego obiegu, łączący skrótami scenariusz, warunki testu (<c1/>), dziennik odbiornika i wynik; jako <c2/>

seg-dd3726fec672 = plik wyników kshana-bench (tekst JSON) z pliku prawdy i pliku predykcji; MODELLED

seg-b82a110c324c = pliki wyników kshana-bench wyrenderowane jako statyczna strona rankingu (HTML)

seg-58b8aa919eaf = uwierzytelnianie Galileo OSNMA stron I/NAV lub strumienia UBX w pamięci: słownik, który wypisuje <c1/>, z informacją doradczą w polu <c2/>; wyłącznie doradczo, nie jest to usługa integralności nawigacji

seg-15e4601cd88c = satelity widoczne z punktu przy skyline zależnym od azymutu: dla każdego satelity <c1/> / <c2/>, GDOP, PDOP, HDOP, VDOP, TDOP, kofaktor i kowariancja we współrzędnych wschód-północ-góra oraz poziome elipsy błędów; <c3/> to tekst JSON lub TOML albo słownik (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>); decyzja o widoczności i elipsa są sprawdzane względem niezależnych bibliotek, reszta jest MODELLED, a wynik zawiera informację doradczą (<c14/>, <c15/> mówią, czy niebo jest reprezentatywne, czy pochodzi z zestawów elementów orbitalnych)

seg-51ac7cd68154 = <c1/> ({ "1" } do { "5000" }) błędów metody najmniejszych kwadratów z ziarnem na widocznym zbiorze <c2/>, wraz z ich kowariancją empiryczną, RMS i ułamkiem mieszczącym się w elipsie { "95" } %

seg-8bba3099379a = gotowe skyline (<c1/>, <c2/>, <c3/>, <c4/>) z etykietą REPRESENTATIVE, pochodzeniem i przesłonięciem dla każdego stopnia azymutu; geometrie reprezentatywne, a nie pomiary terenowe

seg-f900de61f6e9 = sekcja skyline (tabela, kanion uliczny, sektory, teren) sprowadzona do znormalizowanej 360-elementowej tabeli używanej przez silnik

seg-824f3c5951fa = skyplot dla <c1/> jako statyczny tekst SVG

seg-0ffb65c8f5f3 = strumień wskaźnika zaufania (<c1/>) lub wynik <c2/> jako tekst Prometheus, wiersze syslog CEF lub LEEF albo ładunek OTLP JSON, z koderami <c3/>; nic nie jest wysyłane i nie jest odczytywany żaden zegar (wiersze syslog nie zawierają znacznika czasu)

seg-c1ab3dbbe2f2 = mapa zakłóceń GNSS z tekstu CSV z ADS-B lub AIS: jeden słownik na dobę UTC z GeoJSON <c1/> (tylko dane zagregowane; zdegradowana komórka nie wskazuje zakłóceń jako przyczyny)

seg-ff4bc7fdbce7 = udział trasy przebiegającej przez zdegradowane komórki tych map, jako tekst JSON (nie jest to prognoza; nieobserwowane komórki nie są dowodem, że trasa jest wolna od zakłóceń)

seg-d70bccba0e03 = syntetyczne NMEA mostka do szkolenia załóg oraz dziennik instruktora (<c1/>, <c2/>, <c3/>); wyłącznie tekst, nigdy do systemów nawigacyjnych statku działających na żywo

seg-3fe13851ac82 = nazwy sygnałów IQ GNSS akceptowane przez <c1/>, <c2/> i <c3/> (<c4/>, <c5/>, <c6/>, ...)

seg-50bf4ad4e23a = wielosatelitarna scena IQ GNSS w pamięci: <c1/> / <c2/> oraz <c3/> dla każdej epoki

seg-b3199839a37c = to samo, przy czym każdy satelita GPS ma geometrię z efemeryd nadawanych, pochodzącą z komunikatu nawigacyjnego RINEX (Receiver Independent Exchange Format)

seg-8f0f9efea46b = akwizycja FFT (fast Fourier transform) każdego PRN (pseudorandom noise code): Doppler, faza kodu, statystyka, próg

seg-3bf994f3f1bf = cała powierzchnia akwizycji jednego PRN (<c1/>): moc korelacji <c2/>, szczyt i dwa uściślenia Dopplera (<c3/>, <c4/>)

seg-393572e31421 = akwizycja, a następnie śledzenie każdego PRN: Doppler, faza kodu, wskaźniki zaczepienia, C/N0 i korelator prompt w każdej epoce

seg-bc39efdb015a = tor wejściowy odbiornika (filtr pasmowy, filtr wycinający, blanking, wycinanie, AGC (automatic gain control), kwantyzator) na próbkach zespolonych

seg-ead1b81c712f = dopasowanie modelu utraty zaczepienia pętli śledzenia do osi czasu wskaźnika zaufania odbiornika (scenariusz <c1/>)

seg-0ab8531d0465 = sparsowanie pliku <c1/> (ścieżka lub tekst TOML) do rozwiązanych projektów, każdy z polami <c2/> i <c3/>; <c4/> przy niepoprawnym pliku

seg-9c3467d4451e = odczyt binarnego pliku epok śledzenia (<c1/>, tak jak zapisuje go <c2/>): <c3/> i jeden słownik na epokę w <c4/>

seg-469303e33d2a = monitory detekcji IQ dla nagrania w jednym przebiegu strumieniowym (<c1/>): <c2/>, <c3/>, <c4/> i <c5/>; odczytuje plik

seg-bb5c5008f1a8 = walidacja laboratoryjnego pliku warunków testu (<c1/>, TOML lub JSON, ścieżka lub tekst) i zwrócenie go w postaci rozwiązanej, z polem <c2/>

seg-d2441bf762b4 = uruchomienie kampanii odtwarzania laboratoryjnego (<c1/>) do <c2/> tak, jak robi to <c3/>; ukończone komórki są pomijane; zwraca liczby komórek, niepowodzenia i <c4/>, gdy wszystkie komórki są gotowe

seg-7b6d264d9c7f = odbudowanie kart wyników kampanii, raportu HTML i skrótu z jej komórek: liczby komórek i wierszy, wiersze niespełniające progu oraz <c1/>

seg-e3956268cf1c = Sygnatury IQ GNSS i zaufania do odbiornika

seg-817bd0898d46 = Pełne sygnatury, tak jak podaje je <c1/> (każde słowo kluczowe po wymaganych argumentach ma wartość domyślną; docstringi w pliku typów wyjaśniają znaczenie każdego z nich). Listy <c2/> / <c3/> oraz wejścia <c4/> / <c5/> należy dla tablic opakować w <c6/>.

seg-2dd9323829ce = Kampania odtwarzania laboratoryjnego z poziomu Pythona, a potem jej raport (plik kampanii i nagrania są Twoje; ukończona komórka jest pomijana przy następnym wywołaniu; <c1/> odczytuje plik epok śledzenia zapisany przez przebieg <c2/>):

seg-5f48b88438df = Parametr <c2/> w <c1/> ustala, ile okresów kodu integruje koherentnie akwizycja przekazująca. Od wersji { "0.33.0" } domyślnie ma wartość <c3/>, czyli auto: około { "4" } ms ({ "4" } okresy dla kodu { "1" } ms, takiego jak GPS L1 C/A, { "1" } dla kodu o długości { "4" } ms lub większej), dzięki czemu kanał startuje dość blisko, by pętla częstotliwości mogła go wciągnąć; <c4/> zachowuje wyszukiwanie jednookresowe z wersji { "0.32" }.

seg-012a83181bd3 = Typy

seg-0b4f4c6c6014 = <c1/> typuje zamknięte słowniki dla narzędzi sprawdzających (mypy, pyright): <c2/> (każda nazwa rodzaju, <c3/>), <c4/> (cztery znaczniki zwracane przez <c5/>), <c6/> oraz typy <c7/> <c8/> (lista takich elementów jest zwracana przez <c9/>) i <c10/> (wpis bloku <c11/> wyniku, który rozszerza bazę wymaganych kluczy <c12/>). Istnieją wyłącznie dla narzędzi sprawdzających typy i nie można ich importować w czasie działania; <c13/> utrzymuje ich zgodność z listami silnika.

seg-b5ad0d8e1456 = Składowa

seg-2698ab8436e6 = pełny dokument wynikowy (JSON)

seg-7eccc8361120 = samodzielny wykres SVG (Scalable Vector Graphics)

seg-38c8d20ca07a = jednowierszowe podsumowanie dla człowieka

seg-e21e82ad3fe8 = tabela odtwarzalności, dla rodzajów, które ją emitują (zob. niżej)

seg-aadcc1cc4c79 = wynik sparsowany do słownika Pythona (zob. uwaga o kształcie poniżej)

seg-409504363c4c = lista liczbowa pod <c1/> (ze znakiem kropki, <c2/>, lub jako JSON Pointer, <c3/>): 1-D dla liczb, 2-D dla list liczbowych o równej długości

seg-b6d5d7e5271a = lista rekordów pod <c1/> (szereg czasowy), jedna tablica na każde pole, które w każdym rekordzie jest liczbą

seg-adb2d15f9f74 = każda lista rekordów z polem liczbowym, indeksowana ścieżką z kropkami, każda jako <c1/>

seg-7f053ad96880 = zapis tej tabeli do <c1/>; zwraca liczbę zapisanych bajtów albo { "0" } (i nic nie zapisuje), gdy rodzaj nie emituje tabeli

seg-276104139e73 = Tabela odtwarzalności

seg-09ebf68b36f9 = <c1/>, <c2/>, <c3/>, <c4/> i <c5/> zawsze publikują tabelę; <c6/> publikuje ją, gdy skonfigurowano punkt eksportu (<c7/> + <c8/>). Każdy inny rodzaj zwraca <c9/>. Tekst to te same bajty, które interfejs wiersza poleceń (CLI) zapisuje jako <c10/>, więc recenzent odtwarzający opublikowaną tabelę z pakietu wheel nigdy nie musi schodzić do wiersza poleceń:

seg-3ad2987110ee = Kształt wyniku

seg-57c7066d3522 = Wskaźniki jakości i szeregi czasowe znajdują się <b>osobno dla każdej strony przebiegu</b>, a nie na najwyższym poziomie. Dla przebiegu zegara dokument wygląda tak:

seg-cb19f961de2b = więc wskaźniki jakości to <c1/>, nigdy <c2/>. Inne rodzaje emitują własne pakiety; pełna dokumentacja pól, z jednostkami i wskaźnikiem źródła, to <a1><c3/></a1>, a przewodnik dla czytelnika to <a2><c4/></a2>.

seg-bfd984e0407b = <c1/> i <c2/> <b>wykonują</b> scenariusz, więc ujawniają błędy parsowania, konfiguracji <em>oraz</em> błędy czasu działania. Nigdy nie zgłaszają wyjątku.

seg-0ca0a1da8356 = <c1/> / <c2/> zgłaszają <c3/> przy niepoprawnym scenariuszu.

seg-901c2ede0cd0 = Wyniki są odtwarzalne: scenariusz zawiera swoje <c1/>, a silnik zapisuje <c2/>, więc te same dane wejściowe dają na tej samej platformie identyczne co do bajta dane wyjściowe (zob. <a1><c3/></a1>).

seg-8c0c32fcba2b = <c1/>, <c2/> i <c3/> zwracają dokładnie <c4/> tych samych wartości, które daje <c5/> (ten sam dtype, identyczne co do bitu; <c6/>). Importują NumPy w chwili wywołania i zgłaszają <c7/>, gdy go brak; NumPy nie należy do wymagań czasu działania pakietu. <c8/> oznacza, że ścieżki brakuje, a <c9/>, że wartość pod nią nie jest tablicą liczbową (ani listą rekordów). Notatniki do uruchomienia znajdują się w <a1><c10/></a1>.

seg-00a3cf088cde = Nie w Pythonie: procesy długotrwałe

seg-3780dd4973f0 = <c1/> (proces strumieniowy z bramką i opcjonalnym serwerem TCP <c2/>), eksportery telemetrii (Prometheus, OTLP, syslog; <c3/>) oraz strumieniowanie <c4/> są dostępne wyłącznie z wiersza poleceń: powiązanie kończy działanie wraz z zakończeniem wywołania i nie trzyma otwartego gniazda. Python obejmuje wsadową postać każdego z nich: <c5/> dla dziennika, <c6/> dla fragmentu strumienia (wskaźniki i stany; bramka nie jest stosowana), <c7/> dla wygenerowanego tekstu.

seg-82379c29d438 = <s1>Poprzednia</s1>Interferometr na zimnych atomach

seg-4a457afc63fb = <s1>Następna</s1>npm i WebAssembly

seg-dbbce10a12d2 = RunOutput

seg-a4c68601516f = szacowane obszary emitera z tekstu CSV ADS-B lub AIS: <c1/>, każdy oznaczony MODELLED; obszary na podanej ufności z centroidem i elipsą niepewności, nigdy goły punkt; tylko zbiorczo, a obszar nie jest pozycją niczyją ani ustaleniem przyczyny
