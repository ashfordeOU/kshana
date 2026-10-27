# docs--interference-map: translations (pl)

seg-6555ff9a6d8e = Wynik

seg-2247a2344710 = Znaczenie

seg-c3c260b7063e = Testy

seg-d4a762001549 = Licencja

seg-e7b6d071246e = Źródło: <c1/>

seg-143c73287d6c = <c1/> buduje dzienny obraz tego, gdzie statki powietrzne i okręty zgłaszały pogorszone dane nawigacyjne, na podstawie otwarcie licencjonowanych plików śledzenia, które dostarczasz. <c2/> mówi następnie, jaka część planowanej trasy leżała w danym dniu wewnątrz dotkniętych komórek.

seg-158f33f95ec3 = Czym to jest: opisem tego, jak wyglądały opublikowane raporty pozycji w minionych dniach. Czym nie jest: pomiarem jakiegokolwiek odbiornika, prognozą ani dowodem zakłóceń. Komórka z pogorszeniem lub anomalią ma kilka możliwych przyczyn (wymienionych poniżej), a komórka bez wpisu po prostu nie była obserwowana.

seg-64d3ee269407 = Wszystko działa na plikach lokalnych. Domyślne polecenia nigdy nie otwierają połączenia sieciowego; jedyny opcjonalny pomocnik pobierania wymaga jawnej flagi.

seg-e251b385ff46 = Dwa syntetyczne dni mapy zakłóceń narysowane z zatwierdzonych próbek w examples/interference-map/output, każdy z własną syntetyczną trasą i udziałami ekspozycji trasy, które podaje silnik. Po lewej dzień ADS-B: { "1" } komórka z pogorszeniem, { "6" } bez pogorszenia, { "4" } nieocenione (kreskowane) oraz komórki bez wpisu, narysowane jako puste, które nie były obserwowane. Trasa ma { "525" } km: { "11.5" }% jej długości w komórkach z pogorszeniem, { "38.3" }% bez pogorszenia, { "9.1" }% nieocenione i { "41.1" }% nieobserwowane. Po prawej dzień AIS: komórki oznaczone przez detektory okręgu i lądu, komórki bez anomalii i puste komórki; trasa ma { "454" } km, z { "10.5" }% w komórkach z anomalią, { "21.2" }% bez anomalii, { "0.0" }% nieocenione i { "68.3" }% nieobserwowane. ADS-B i AIS są oddzielnymi warstwami, nigdy niełączonymi. Oznaczona komórka nie jest stwierdzeniem zakłóceń, a komórka bez koloru nie była obserwowana, co nie oznacza, że było czysto. Wszystkie dane są zmyślone, na otwartym środkowym Atlantyku, i nie są pomiarem.

seg-765f43228dc6 = Oba dni to syntetyczne próbki w <c1/>, każdy z syntetyczną trasą w <c2/>; udziały ekspozycji trasy to to, co <c3/> wypisuje dla nich. Nic w nich nie jest rzeczywistym miejscem, statkiem powietrznym ani jednostką pływającą.

seg-228f39c0305b = Dane i licencje

seg-d3336cc18ff7 = Wbudowane są tylko źródła przejrzane w <a1><c1/></a1>, wybierane za pomocą <c2/>:

seg-b03d56f501c3 = Rodzaj

seg-2328672e782f = Pole licencji wyniku

seg-2319c7a6f6e2 = ODbL { "1.0" }

seg-7464d3c830f3 = AIS

seg-c13f76567536 = domena publiczna USA (CC0 { "1.0" } według wydawcy)

seg-636c2bb6f29d = domena publiczna

seg-f6f4e431d36d = NLOD { "2.0" }

seg-5621e3a3908f = każdy z nich

seg-6b3a1f8ca649 = cokolwiek podasz

seg-be349e2c455f = wymagane <c1/>, <c2/>, <c3/>

seg-590344d1eae5 = Każdy plik wynikowy osadza licencję, adres URL licencji, wymaganą informację o autorstwie i ograniczenia pokrycia źródła. Nie ma wbudowanego wpisu dla źródeł, których warunki zabraniają użycia komercyjnego lub redystrybucji map pochodnych.

seg-2d8eaefab0f8 = <b>ODbL i wydania { -brand }.</b> Plik ADS-B na komórkę wykonany z danych adsb.lol jest Derived Database i jest wydawany na licencji ODbL { "1.0" }; mówi o tym jego pole <c1/>. Własny kod { -brand } pozostaje na AGPL-3.0. Wydania komercyjne { -brand }, które zapisują takie pliki, dołączają tę samą informację, a każdy, kto plik ponownie publikuje, musi ją zachować. Wyniki ADS-B i AIS nigdy nie są łączone w jednym pliku, więc ODbL nie obejmuje warstwy AIS.

seg-bb4932d5d15c = <b>Obciążenie wynikające z pokrycia.</b> Mapy dziedziczą pokrycie swojego źródła. adsb.lol opiera się na odbiornikach wolontariuszy, więc otwarte morze i słabo pokryte regiony są rzadko obsadzone. Otwarte dane Kystverket pomijają jednostki rybackie poniżej { "15" } m i rekreacyjne poniżej { "45" } m, więc jego mapa odzwierciedla większe statki. MarineCadastre obejmuje wyłącznie wody USA.

seg-713babc3963b = <b>Identyfikatory.</b> Wiersze wejściowe zawierają identyfikator statku powietrznego lub jednostki pływającej. Jest on haszowany w pamięci z losową solą dla każdego przebiegu, używany wyłącznie do zliczania odrębnych statków powietrznych lub jednostek pływających i nigdy nie jest zapisywany, logowany ani drukowany. Wyniki są zagregowane: nigdzie w nich nie występuje żaden identyfikator.

seg-fa3c70a8997a = <b>Tłumienie.</b> Komórka z mniej niż <c1/> odrębnych statków powietrznych lub jednostek pływających zaobserwowanych tego dnia nie jest publikowana w ogóle, a dla AIS liczba oznaczeń równa jeden lub dwa w opublikowanej komórce jest podawana jako <c2/>. Żadna opublikowana wartość nie pozwala wskazać pojedynczego statku powietrznego ani jednostki pływającej.

seg-02dbfcb9c808 = Formaty wejściowe

seg-2f291f986a87 = Zwykły CSV z wierszem nagłówka, rozdzielany przecinkami, bez cudzysłowów, czasy w UTC. Kolejność kolumn jest dowolna; nieznane kolumny są ignorowane. Znacznik czasu to sekundy Uniksa lub <c1/>. Wiersze, których nie da się sparsować, są liczone w metadanych wyniku, a nie po cichu pomijane.

seg-571365be20a5 = ADS-B (<c1/>):

seg-aaeff8f42699 = Kolumna

seg-b10a51ed96c0 = Wymagana

seg-357c2320b43a = tak

seg-14ac5d0f109b = czas raportu

seg-6dbe5595d0be = nieprzejrzysty identyfikator (haszowany, nigdy nie przechowywany)

seg-c5fb6b91dc68 = stopnie

seg-e283838c85aa = wysokość w stopach; <c1/> lub puste wyklucza wiersz

seg-9ab90c35bd7d = co najmniej jedna

seg-868e5b9c00ab = liczby całkowite od { "0" } do { "11" }; puste oznacza brak zgłoszenia

seg-db907db790b1 = nie

seg-5c2ce9f61700 = jeśli występuje, używane są tylko wartości zaczynające się od <c1/> (MLAT, TIS-B i podobne są wykluczone)

seg-412f40b8eeb1 = <b>Historia readsb z adsb.lol, czytana bezpośrednio.</b> Dzienne archiwa to dzielony tar plików śladu readsb. Rozpakuj jedno tak, jak opisuje wydawca (połącz części, <c1/>), a następnie podaj { -brand } rozpakowany katalog, pojedynczy plik <c2/> lub plik CSV:

seg-6e7d378bd89b = Katalog jest przeszukiwany rekurencyjnie pod kątem plików <c1/> (inne pliki, takie jak <c2/>, są ignorowane, a dowiązania symboliczne nie są podążane). Każdy plik jest skompresowany gzipem lub jest zwykłym JSON, co jest wykrywane po pierwszych bajtach, ponieważ readsb zapisuje gzip pod nazwą <c3/>; dekompresja jest ograniczona do { "512" } MiB na plik. Z każdego wpisu śladu { -brand } odczytuje przesunięcie czasu, szerokość geograficzną, długość geograficzną, wysokość (znacznik <c4/> wyklucza wpis), pola <c5/> i <c6/> obiektu szczegółów statku powietrznego oraz ciąg źródła pozycji (wpisy z innego źródła niż ADS-B są wykluczane). Wpis bez obiektu szczegółów nie ma pól dokładności i jest liczony jako wykluczony. Plik, którego nie da się odczytać, jest liczony w <c7/> w metadanych wyniku i pomijany.

seg-b1502f7f4c98 = AIS (<c1/>):

seg-91395984ddac = stopnie; wartości AIS „niedostępne” oraz ({ "0" }, { "0" }) są odrzucane

seg-34ae94eb1797 = prędkość nad dnem w węzłach; { "102.3" } (niedostępne) jest traktowane jako brak

seg-a1e60af5adaa = Detektor lądu wymaga pliku wielokątów lądów (<c1/>): GeoJSON Polygon lub MultiPolygon. Zamierzonym plikiem jest warstwa lądów Natural Earth w skali { "1" }:{ "10" } miliona (domena publiczna). Bez <c2/> detektor jest wyłączony i wynik o tym mówi. Aby ją pobrać (jedyny dostęp do sieci w tej funkcji):

seg-cd55a09894c5 = Uruchamia to systemowy <c1/> (jako listę argumentów, nie przez powłokę) przez HTTPS, jednokrotnie, dla jednego pliku pod stałym adresem wskazującym pojedynczy commit repozytorium źródłowego. Pobrany plik jest zachowywany tylko wtedy, gdy jego SHA-256 jest równy wartości przypiętej w kodzie; niezgodność go usuwa i kończy się niepowodzeniem. Jeśli <c2/> nie jest zainstalowany, polecenie to zgłasza i podaje adres oraz sumę kontrolną, aby plik można było pobrać ręcznie. Nic nie jest dołączone do repozytorium.

seg-95eeaa0033b3 = Jeden plik GeoJSON na źródło na dzień UTC, w katalogu <c1/>, nazwany <c2/>, gdzie <c3/> to <c4/> lub <c5/>, <c6/> to klucz <c7/> (<c8/>, <c9/>, <c10/> lub <c11/>), a data to dzień UTC raportów: <c12/>, <c13/>. Zbiór danych jest w nazwie, aby dwa zbiory danych tego samego rodzaju nie mogły dzielić pliku, a <b>{ -brand } nigdy nie nadpisuje pliku</b>: jeśli istnieje którykolwiek cel, polecenie kończy się niepowodzeniem, zanim cokolwiek zapisze. CLI wypisuje jeden wiersz na każdy zapisany plik. Czytnik może odzyskać te trzy części za pomocą <c14/>; ta sama informacja jest wewnątrz pliku (<c15/>, <c16/>, <c17/>). Syntetyczne pliki próbek, po jednym na źródło, są w <c18/>, wraz z poleceniem, które je odtwarza, do budowania i testowania przeglądarki. Element najwyższego poziomu <c19/> zawiera nazwę schematu, datę, siatkę, identyfikator metody i każdy parametr, wartości dzienne, licencję danych i informację o autorstwie oraz zastrzeżenie. Każdy obiekt to wielokąt komórki z <c20/>, <c21/>, <c22/>, <c23/> i zagregowanymi liczbami.

seg-1ee702004726 = Siatka jest stała: kwadratowe komórki o boku <c1/> stopnia (domyślnie { "0.5" }) w szerokości i długości geograficznej, indeksowane od (-90, -180). Szerokość wschód–zachód zmniejsza się wraz ze szerokością geograficzną: około { "55" } km na równiku i około { "28" } km na { "60" } stopniach dla wartości domyślnej. Szerokość { "90" } należy do ostatniego wiersza, a długość { "180" } to ten sam południk co -180. <b>Metody zarejestrowane z góry są zdefiniowane na siatce { "0.5" } stopnia.</b> Inna wartość <c2/> działa, ale nie jest metodą zarejestrowaną z góry: CLI o tym informuje, a plik zapisuje <c3/> i <c4/> (false), aby przeglądarka też mogła to powiedzieć.

seg-6e1e8f2a9082 = <b>Wstrzymane liczby.</b> Każda liczba na komórkę poniżej minimum publikacji ({ "5" }) jest <c1/>, łącznie z zerem, więc <c2/> nigdy nie oznacza „brak” i żadna opublikowana liczba nie pozwala wskazać pojedynczego statku powietrznego ani jednostki pływającej. Pola <c3/> i <c4/> są nadal podawane. W plikach ADS-B <c5/> wynosi dla opublikowanej komórki zawsze co najmniej { "5" }; <c6/> i <c7/> są <c8/> poniżej { "5" }, a <c9/> jest <c10/>, chyba że obie wartości wynoszą co najmniej { "5" } (udział ujawniłby wstrzymaną liczbę). W plikach AIS każdy wpis <c11/> jest <c12/> poniżej { "5" }.

seg-fd929d6ee90b = Wersja formatu i pola

seg-ff443e9cbd20 = Format jest ustalony jako <c1/>, <c2/>. Zmiana, która usuwa lub zmienia nazwę pola albo zmienia jego znaczenie, podnosi wersję; dodanie pola jej nie podnosi, więc czytnik musi ignorować pola, których nie zna. Liczba równa <c3/> jest wstrzymana, a nie równa zeru.

seg-60818bfc3f90 = Wartości <c1/>: ADS-B <c2/>, <c3/>, <c4/>, <c5/>, <c6/>; AIS <c7/>, <c8/>. <c9/> ma wartość true tylko dla <c10/> i <c11/>. Raport ekspozycji trasy ma własny schemat <c12/>.

seg-ea526ebdd260 = Obserwatorium: produkt dzienny

seg-e33f63fe5c0a = <c1/> zamienia jeden dzień UTC raportów ADS-B w trzy pliki obserwatorium (GeoJSON, PNG i JSON raportu incydentu) oraz manifest skrótów, a <c2/> odtwarza ten dzień przy zmianach po jednym z parametrów zarejestrowanych z góry. Polecenie wymusza reguły wydania: co najmniej { "24" } h po zakończeniu dnia (<c3/> można tylko zwiększać), komórki { "0.5" } stopnia lub grubsze, tylko trzy stany (<c4/>, <c5/>, <c6/>), brak przypisania przyczyny i brak danych OpenSky. Notatka o metodzie, formaty plików i ograniczenia są w <a1><c7/></a1>. Przebieg regionalny (<c8/>) odczytuje tylko raporty z danego prostokąta i mówi o tym w pliku.

seg-31ce42fc05dc = Specyfikacja strony mapy w Studio

seg-a9aca2e2d390 = Dla strony mapy w Studio, która wczytuje plik GeoJSON podany przez użytkownika (strona jest budowana w źródłach Studio, a nie w tym repozytorium). Nic nie jest przesyłane: plik jest odczytywany w przeglądarce, a strona nie wysyła żadnych żądań do żadnego źródła danych.

seg-064ec5d4c91a = <b>Odczyt pliku.</b> Przyjmij plik tylko wtedy, gdy <c1/> zaczyna się od <c2/>, a <c3/> jest liczbą obsługiwaną przez stronę; w przeciwnym razie zgłoś, że plik nie jest obsługiwaną mapą zakłóceń { -brand }. Odczytaj pola wymienione wyżej; nieznane ignoruj. Plik zawiera jedno źródło i jeden dzień. Można wczytać kilka plików.

seg-5be32f8cff46 = <b>Komórki.</b> Narysuj wielokąt każdego obiektu. Koloruj według <c1/> i zawsze wyjaśniaj w legendzie, co oznacza każdy kolor. Cztery stany, z których żadnego nie wolno ukrywać ani łączyć:

seg-b652b86e6b8e = Stan

seg-4a511b6a03e3 = Skąd się bierze

seg-f92da2236260 = Z pogorszeniem (lub z anomalią dla AIS)

seg-591ebe8007cb = wysoki odsetek statków powietrznych zgłosił niską dokładność albo jednostki pływające wykazały anomalie tego dnia

seg-bd993c64b6e8 = <c1/> ma wartość true

seg-88d43eb1c14a = Czysta

seg-af5f7989fd09 = zaobserwowana przy wystarczającej liczbie statków powietrznych lub jednostek pływających i nieoznaczona

seg-2bc810e02210 = <c1/> to <c2/> lub <c3/>

seg-d894eaa21369 = Nieoceniona

seg-38c88ed94111 = zaobserwowana, ale za mało próbkowanych statków powietrznych, dzień był zakłócony przez czynniki zewnętrzne albo nie można było oszacować tła dnia

seg-e358a8c7903f = <c1/> to <c2/>, <c3/> lub <c4/>

seg-013b7c903426 = Nieobserwowana

seg-81bcffa57ec2 = zbyt mało statków powietrznych lub jednostek pływających, więc komórka nie została opublikowana

seg-6828d71822bd = brak obiektu dla tej komórki

seg-753192a770ac = „Nieobserwowana” oznacza brak obiektu: rysuj ją neutralnie (bez wypełnienia lub z kreskowaniem), nigdy kolorem „czystej”. Użyj schematu kolorów, który nie opiera się wyłącznie na czerwieni wobec zieleni. Szczegóły komórki po najechaniu lub zaznaczeniu pokazują liczby z <c1/> bez zmian, a każdą liczbę <c2/> jako „wstrzymana (mniej niż { "5" })”, nigdy jako zero. Przeglądarka powinna też zgłaszać, gdy <c3/> ma wartość false, że plik używa rozmiaru komórki spoza metody zarejestrowanej z góry.

seg-e90fedf7ad89 = <b>Warstwy.</b> ADS-B i AIS są oddzielnymi warstwami z własnymi przełącznikami, legendami i wierszami licencji. Nigdy nie łącz ich w jedno pole kolorów ani jedną liczbę, nigdy nie rysuj ich jako jednej połączonej komórki i nigdy nie sumuj ich komórek. Różne dni to różne pliki: pokazuj jeden dzień naraz, z wyborem dnia, zamiast nakładać dni.

seg-6d500d3c0baa = <b>Licencja i autorstwo.</b> Dla każdej widocznej warstwy pokaż, na mapie oraz w każdym eksporcie lub zrzucie ekranu, tekst <c1/> dosłownie, <c2/> z odnośnikiem do <c3/> oraz <c4/>. Jeśli pokazywana jest warstwa ADS-B, jej licencja ODbL dotyczy tylko tej warstwy. Nie oferuj eksportu pliku połączonego.

seg-6f786153ef8e = <b>Metoda.</b> Udostępnij identyfikator metody i parametry (<c1/>, <c2/>) oraz wartości <c3/> w panelu szczegółów, w tym <c4/> (powiedz wprost, że żadna komórka nie została uznana za pogorszoną z powodu tła dnia) oraz <c5/>.

seg-905348837439 = <b>Zastrzeżenia do zachowania</b> (pokaż własne <c1/> i <c2/> pliku i utrzymuj to sformułowanie lub jego odpowiednik widoczne przy mapie):

seg-1f70e308010a = Komórka z pogorszeniem lub anomalią nie jest stwierdzeniem zakłóceń. Istnieją inne przyczyny.

seg-7cde0ddadb73 = Komórka bez koloru nie była obserwowana. Nie jest to dowód, że obszar był czysty.

seg-1135dfeadb8f = Jest to opis minionych raportów pozycji, a nie prognoza ani pomiar jakiegokolwiek odbiornika.

seg-3ad1216bf3ed = Pokrycie zależy od źródła danych; przeczytaj uwagi o pokryciu.

seg-046f6af48349 = Strona nie może wymieniać ani pokazywać żadnego pojedynczego statku powietrznego ani jednostki pływającej, a pliki ich nie zawierają.

seg-ae79b67c3b98 = <b>Ekspozycja trasy.</b> Jeśli strona wczytuje także raport <c1/>, pokaż jego wiersze dla każdego dnia i źródła razem z czterema udziałami (z pogorszeniem, czysta, nieoceniona, nieobserwowana), nigdy sam udział z pogorszeniem, oraz <c2/> raportu i <c3/> i <c4/> każdego wiersza.

seg-98131acf49d8 = Metoda ADS-B (<c1/>)

seg-83b660b0bfa6 = Każdy raport ADS-B z powietrza zawiera dwa samoocenione pola jakości nawigacji: NIC (promień ograniczenia pozycji) i NACp (granica dokładności { "95" }%, EPU). Gdy odbiornik na pokładzie traci lub przestaje ufać swojemu rozwiązaniu satelitarnemu, oba spadają, dlatego niosą sygnaturę zakłóceń. Spadają też z innych powodów.

seg-4b9020a68db6 = <b>Parametry zarejestrowane z góry</b> (stałe w kodzie, zapisywane w każdym pliku; zmiana oznacza nową wersję metody):

seg-e73ea9921fcf = Parametr

seg-8650fa804f14 = Dolna granica wysokości

seg-25056ee5a36c = wysokość barometryczna co najmniej { "5000" } ft

seg-17322eff480a = Raport o niskiej dokładności

seg-48ab6ed5eedd = NACp co najwyżej { "6" } (zgłoszona granica EPU wynosi { "556" } m, { "0.3" } NM, lub więcej, albo jest nieznana) lub NIC co najwyżej { "5" } (zgłoszona granica promienia ograniczenia wynosi { "1852" } m, { "1" } NM, lub więcej, albo jest nieznana)

seg-84beb488319d = Dobry raport

seg-2595055d9593 = NACp co najmniej { "8" } i NIC co najmniej { "7" }; oceniane na podstawie pól, które ma wejście (oba, gdy oba są obecne, w przeciwnym razie to, które jest obecne)

seg-b4bbce695b2d = Punkt odniesienia wyposażenia

seg-4986ed51f600 = statek powietrzny liczy się w komórce tylko wtedy, gdy ma co najmniej { "5" } dobrych raportów poza tą komórką tego samego dnia

seg-42859d1d785b = Statki powietrzne próbkowane w komórce

seg-1ae26d6d99a9 = co najmniej { "3" } raporty w komórce

seg-48bba15e2e0e = Statki powietrzne dotknięte w komórce

seg-1fe9c3ab930c = co najmniej { "50" }% jego raportów w komórce ma niską dokładność

seg-b147473d133c = Minimalna próba

seg-33060cda8536 = co najmniej { "10" } próbkowanych statków powietrznych

seg-009ca23b9cd6 = Z pogorszeniem

seg-afef85ae2a25 = co najmniej { "5" } dotkniętych statków powietrznych, udział dotkniętych wśród próbkowanych statków powietrznych co najmniej { "0.30" } oraz co najmniej { "0.15" } powyżej mediany udziału w komórkach tego dnia

seg-890dcc56fa5c = Dzień zakłócony przez czynniki zewnętrzne

seg-b27768e64d62 = mediana udziału w komórkach (z co najmniej { "5" } komórek z pełną próbą) co najmniej { "0.15" }: żadna komórka nie jest uznawana za pogorszoną

seg-18fbf3c348c9 = Brak tła

seg-534111e0c6ad = mniej niż { "5" } komórek z pełną próbą, więc nie można oszacować mediany: komórka spełniająca progi jest <c1/>, a nie z pogorszeniem

seg-b571f127c595 = Minimum publikacji

seg-60621ffc5bcf = zaobserwowano co najmniej { "5" } odrębnych statków powietrznych

seg-f36389caf81b = Te wartości ustalono na podstawie definicji kodów NIC i NACp oraz reguły prywatności, zanim spojrzano na jakiekolwiek dane. Nie dostrajano ich na danych rzeczywistych, a testy używają wyłącznie danych syntetycznych. Statusy komórek: <c1/>, <c2/>, <c3/> (opublikowana, ale z mniej niż { "10" } próbkowanych statków powietrznych), <c4/> i <c5/>.

seg-c89afc07989b = <b>Wersja { "2" }.</b> Wersja { "1" } uznawała komórkę za pogorszoną już przy { "3" } dotkniętych statkach powietrznych, mniej niż minimum publikacji wynoszące 5 statków, i bez zgłaszania pomijała kontrolę tła dnia, gdy w pełni próbkowanych było mniej niż { "5" } komórek. Wersja { "2" } wymaga co najmniej { "5" } dotkniętych statków powietrznych i wstrzymuje ocenę (<c1/>), gdy tła nie można oszacować. Obie zmiany zaostrzają metodę (nic, co nie było pogorszone w wersji { "1" }, nie jest pogorszone w wersji { "2" }); powodem jest to, że opublikowana ocena nigdy nie może opierać się na mniejszej liczbie statków powietrznych niż liczba, poniżej której liczby są wstrzymywane. Pliki wersji { "1" } nie zostały wydane.

seg-ffd0e5175548 = Dlaczego pola dokładności spadają z powodów innych niż zakłócenia i jakie jest zabezpieczenie dla każdego z nich:

seg-12b613a77f64 = Przyczyna

seg-e30479c3e5d8 = Zabezpieczenie

seg-ecac3d226210 = Starsze transpondery, które nigdy nie zgłaszają NIC ani NACp albo zgłaszają je ze stałą niską wartością

seg-8b504b60fcc0 = punkt odniesienia wyposażenia: statek powietrzny bez dobrych raportów gdzie indziej tego dnia nie jest liczony

seg-1df45f128708 = Niska wysokość i operacje na powierzchni (maskowanie przez teren, inne formaty pozycji)

seg-cc5f23f0da05 = dolna granica wysokości; wiersze oznaczone <c1/> są wykluczone

seg-ddf6aeb47dbe = MLAT lub inne pozycje spoza GNSS

seg-51162a1835d1 = filtr <c1/>, gdy kolumna jest obecna

seg-08196503a657 = Jeden statek powietrzny wysyłający wiele raportów

seg-bf13dfa85dbe = liczone są odrębne statki powietrzne, a nie raporty

seg-bbcb809624bc = Awaria konstelacji lub augmentacji albo zdarzenie pogody kosmicznej obniżające dokładność na dużym obszarze

seg-5f428bb7ad4a = komórka musi przekroczyć medianę udziału w komórkach tego dnia o margines, a dzień, którego mediana jest sama wysoka, jest oznaczany jako zakłócony przez czynniki zewnętrzne i nie uznaje żadnej komórki

seg-30290253a95d = Usterka w wyposażeniu jednego statku powietrznego

seg-b673195405ff = wymaga udziału wielu odrębnych statków powietrznych, z minimalną próbą

seg-aeebeded71be = Mało statków powietrznych w komórce

seg-c33c60b49b17 = minimalna próba; przy zaobserwowanych poniżej { "5" } komórka nie jest publikowana

seg-dc8abb9b411f = Co pozostaje: metoda nie odróżni zakłóceń od przyczyny regionalnej, która jest lokalna, a nie szeroka (lokalny efekt geometrii satelitów lub awaria naziemnej augmentacji wyglądałyby tak samo) i jest zachowawcza w jednym kierunku: statek powietrzny, który przez cały dzień lata wyłącznie wewnątrz dotkniętego regionu, nie ma punktu odniesienia i nie jest liczony, więc trwałe duże obszary są zaniżane w raportach.

seg-41d725eeaba9 = Metoda AIS (<c1/>)

seg-7fd53079dccf = Dla każdej jednostki i dnia, pięć detektorów. Detektor <b>kwalifikuje się</b> w komórce, gdy oznacza co najmniej { "5" } odrębnych jednostek stanowiących co najmniej { "20" }% jednostek tam zaobserwowanych; komórka jest <c1/>, jeśli kwalifikuje się którykolwiek detektor.

seg-6d599353e8e1 = Detektor

seg-551f38a9061c = Reguła (zarejestrowana z góry)

seg-295e8a28a5b9 = co najmniej { "3" } raporty w komórce w odległości ponad { "2000" } m w głąb lądu od dostarczonej linii brzegowej

seg-fd21160e6685 = okno { "20" } kolejnych raportów (krok { "10" }, przerwy co najwyżej { "30" } min), których średni promień od środka ciężkości wynosi od { "500" } m do { "20" } km, współczynnik zmienności promienia co najwyżej { "0.15" }, jeden kierunek ruchu z łącznym skrętem co najmniej { "270" } stopni (kroki co najwyżej { "90" } stopni, wypadkowy co najmniej { "80" }% sumy) i średnia prędkość co najmniej { "2" } kn

seg-1aa30db06794 = co najmniej { "2" } skoki docierające do komórki: kolejne raporty oddalone od siebie o co najmniej { "1000" } m, w odstępie co najwyżej { "1" } h, wskazujące na ponad { "70" } kn (prędkość pośrednia używa co najmniej { "1" } s między raportami, więc dwa raporty z tym samym znacznikiem czasu i pozycjami oddalonymi o { "1" } km lub więcej liczą się jako skok)

seg-7f9b22254009 = co najmniej { "3" } zgłoszone prędkości powyżej { "70" } kn w komórce

seg-e0d0968e8751 = co najmniej { "5" } odrębnych jednostek zgłaszających tę samą pozycję (zaokrągloną do { "1e-4" } stopnia, około { "11" } m) w tym samym 10-minutowym oknie

seg-1bf4c460672c = Komórki z mniej niż { "5" } odrębnych jednostek nie są publikowane; każda liczba oznaczonych jednostek poniżej { "5" }, łącznie z zerem, jest podawana jako <c1/>.

seg-b2ea2ec6bad1 = <b>Wersja { "2" }.</b> Wersja { "1" } kwalifikowała detektor od { "3" } oznaczonych jednostek i publikowała liczby { "3" } i { "4" }. Wersja { "2" } podnosi minimum oznaczonych jednostek do { "5" }, czyli do minimum publikacji, tak aby ocena <c1/> nigdy nie opierała się na mniejszej liczbie jednostek niż liczba, poniżej której liczby są wstrzymywane. Zaostrza to metodę i żaden plik wersji { "1" } nie został wydany.

seg-25593339aeb0 = <b>Znane przyczyny fałszywych alarmów</b>, które reguła udziału i progi ograniczają, ale nie usuwają: jednostki w rzekach, kanałach i portach blisko zgrubnej linii brzegowej (bufor { "2" } km w głąb lądu istnieje właśnie z tego powodu); dwie jednostki dzielące jeden identyfikator, co wygląda jak skoki; transpondery ze złą pozycją lub sprzęt testowy; oraz krążenie łodzi pilotowych i jednostek poszukiwawczych, które może przypominać okręgi. Plik linii brzegowej w skali { "1" }:{ "10" } milionów jest dokładny do około kilometra.

seg-ac661440a29a = Detektory skoków i prędkości porównują raporty w obrębie jednego pliku wejściowego; ślad podzielony na pliki lub dni nie jest zszywany.

seg-05f789b26904 = <b>Pamięć.</b> Wejście jest czytane wiersz po wierszu i nigdy nie jest przechowywane w całości. ADS-B zachowuje tylko liczniki dla statku powietrznego i komórki. AIS zachowuje każdy przyjęty raport w zwartym rekordzie (około { "40" } bajtów), dopóki jego dzień nie zostanie oceniony, więc zużycie pamięci rośnie wraz z liczbą raportów AIS na wejściu; bardzo duże wejście AIS podziel według dni.

seg-206c78a69ded = Ekspozycja trasy

seg-0d8832796ab7 = <c1/> to GeoJSON LineString (samodzielny, w Feature lub w FeatureCollection) albo CSV z wierszami <c2/>. <c3/> przyjmuje pliki map lub ich katalogi i można go powtarzać. Punkty trasy są łączone liniami prostymi w szerokości i długości geograficznej, więc zagęszczaj długie odcinki; odcinek biegnie krótszą drogą wokół w długości geograficznej, więc odcinek przekraczający antypołudnik ({ "179.5" } E do { "179.5" } W) go przekracza. Trasa jest dzielona na fragmenty po około { "250" } m. Każdy fragment jest mierzony między własnymi dwoma końcami na sferze o promieniu { "6371.0088" } km (tą samą ścieżką, która rozstrzyga, w której komórce leży) i przypisywany komórce zawierającej jego środek.

seg-cc5e2553700b = Dla każdego dnia i źródła raport podaje długość trasy i cztery udziały sumujące się do { "1" }: <c1/>, <c2/>, <c3/> (komórka obecna, ale bez oceny) i <c4/> (komórka nieobecna na mapie). Dwa ostatnie czytaj razem z pierwszym: trasa z niskim udziałem z pogorszeniem i wysokim udziałem nieobserwowanym nie została wykazana jako czysta. Wiersze ADS-B i AIS są podawane osobno i nigdy nie są łączone. Każdy wiersz zawiera licencję i informację o autorstwie mapy.

seg-3a087d90e317 = Funkcje biblioteki

seg-67ea1ff00bb8 = Dla wywołujących, którzy trzymają dane w pamięci (powiązania, serwer MCP, kompilacja przeglądarkowa), moduł <c1/> udostępnia te same metody z tekstem lub bajtami na wejściu i JSON na wyjściu, bez dotykania pliku ani sieci:

seg-4dbf41c0ec3b = Funkcja

seg-95f87a38a522 = Wejście

seg-0fe8ff25f4a1 = Wyjście

seg-9e99af2c1f84 = tekst CSV ADS-B

seg-e144f449c5b4 = jeden wycinek bajtów na plik śladu readsb (gzip lub zwykły)

seg-7effd7110c4c = tekst CSV AIS, opcjonalny tekst GeoJSON lądów

seg-10c5e0c0a9c8 = tekst trasy, teksty GeoJSON map, opcjonalne granice <c1/>

seg-be00d23d96e9 = JSON <c1/>

seg-20a842d675c2 = <c1/> ma <c2/> (<c3/>), <c4/> i <c5/> (dokument v1). <c6/> to <c7/> lub <c8/>; <c9/> wynosi { "0.5" }. Błędy to <c10/>. Reguły zbioru danych (zatwierdzone ustawienia predefiniowane, wymagany tekst licencji, zgodność rodzaju) obowiązują dokładnie tak jak w wierszu poleceń.

seg-1195686de09b = Walidacja zewnętrzna

seg-0de37085f544 = <c1/> porównuje { -brand } z niezależnymi implementacjami na wejściach syntetycznych, z tolerancjami zarejestrowanymi z góry w <c2/>: znaczenia kodów NIC i NACp względem dekodowania syntetycznych ramek ADS-B przez pyModeS, wartości „niedostępne” AIS względem dekodowania syntetycznych zdań AIVDM przez pyais, przypisanie do komórek siatki względem shapely, długość trasy w każdym stanie komórki względem shapely i GeographicLib oraz maskowanie lądu względem shapely i pyproj. Dane testowe są tworzone przez <c3/>; CI nie potrzebuje Pythona. Waliduje to sposób odczytu kodów i wartości pól oraz geometrię. Nie waliduje, że oznaczona komórka oznacza zakłócenia.

seg-56a3e955cbcc = Wszystkie testy używają syntetycznie generowanych danych i nie korzystają z sieci: testy jednostkowe w <c1/> oraz <c2/> dla poleceń od początku do końca, w tym sprawdzenie, że żaden identyfikator nie trafia do wyniku i że odmowy nie zostawiają żadnych plików.

seg-212c43d1a41c = <s1>Poprzednia</s1>Strumienie szkoleniowe NMEA

seg-7f13ee5d254e = <s1>Następna</s1>Mapa zakłóceń: źródła danych i licencje

seg-1fc1794d9388 = Metoda ADS-B (kshana-interference-map/adsb/v2)

seg-a3a97ab49ed1 = Metoda AIS (kshana-interference-map/ais/v2)
