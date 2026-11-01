# docs--clock-log-formats: translations (pl)

seg-ca2fcdd60f65 = Źródło: <c1/>

seg-0dfd1160c5d7 = Formaty dzienników zegara

seg-f52a62872493 = <c1/> wczytuje zmierzony dziennik zegara do jednego znormalizowanego szeregu fazy: jednorodnej siatki próbek <c2/>, z podanym lub znalezionym interwałem próbkowania <c3/>, każdą przerwą policzoną i nazwanymi jednostkami dziennika. Wczytywanych jest osiem formatów, każdy jako udokumentowany podzbiór. Wszystko poza podzbiorem jest odrzucane z błędem, który nazywa to, co znaleziono, zamiast być odczytywane w przybliżeniu.

seg-dbdbfec37ab6 = <b>Skróty.</b> RINEX to Receiver Independent Exchange Format. TICC to licznik interwałów czasu TAPR (Tucson Amateur Packet Radio). ADEV to overlapping odchylenie Allana, TDEV to odchylenie czasu, a MTIE to maksymalny błąd interwału czasu. <c1/> to interwał próbkowania w sekundach.

seg-1d5a6c2090af = Gdzie można użyć dziennika

seg-2a391645eeeb = <b><c1/></b>: <c2/> zamiast <c3/> lub <c4/>. Faza dziennika, w ns, jest szeregiem błędu czasu sprawdzanym względem masek, a raport zyskuje blok <c5/> mówiący, jak go odczytano.

seg-4c2a67008451 = <b>Rodzaj clock</b>: tabela <c1/> dodaje do przebiegu blok <c2/>: jak odczytano dziennik, SHA-256 tabeli (<c3/>; <c4/> przebiegu nie obejmuje tabeli) i próbek fazy oraz overlapping ADEV, TDEV i MTIE przy oktawowych współczynnikach uśredniania. Wymaga <c5/>. Symulowany holdover pozostaje bez zmian.

seg-2f464fe709c9 = Bez tabeli oba rodzaje są parsowane, haszowane i raportowane dokładnie tak jak dotąd.

seg-c931c5ec2f4a = Formaty

seg-0b758195e7eb = <b><c1/></b>: dzienniki fazy lub częstotliwości ASCII w stylu TimeLab, czyli zwykła postać tekstowa, którą eksportuje TimeLab i którą wczytują jego import ASCII oraz Stable32. W każdej linii jest jeden odczyt: albo pojedyncza kolumna przy jednorodnym <c2/>, albo dwie kolumny <c3/>. Kolumny mogą być oddzielone białymi znakami, przecinkami lub średnikami.

seg-a7ae9e712bea = Linie zaczynające się od <c1/>, <c2/> lub <c3/> są komentarzami. Komentarz w postaci <c4/> (lub <c5/>) ustawia <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> lub <c12/>, dla fazy), <c13/> (<c14/> lub <c15/>) albo <c16/> (<c17/> lub <c18/>, dla pierwszej z dwóch kolumn).

seg-84cf463d5e74 = Jedna początkowa linia nienumeryczna jest traktowana jako nagłówek kolumn.

seg-84f4b59bcdbf = Dane częstotliwości (częstotliwość względna) są przyjmowane tylko jako pojedyncza kolumna. Są całkowane do fazy jako <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = Binarne pliki projektów TimeLab oraz <c1/> nie są wczytywane.

seg-3af6e4e7bc73 = Linie trybu znaczników czasu (<c1/>, <c2/>) oraz kanał pseudoznacznika czasu trybu TimeLab (<c3/>) są znacznikami czasu zdarzeń. Fazą wybranego kanału jest jego znacznik czasu minus nominalny takt: <c4/>, gdzie <c5/> to liczba całkowita <c6/> od pierwszego zdarzenia. Pominięte zdarzenie jest przerwą.

seg-cecf9df4ff10 = Linie trybu interwału (<c1/> lub dowolna etykieta zaczynająca się od <c2/>) są odczytywane bezpośrednio jako faza, jeden odczyt na <c3/>. Scenariusz musi podać <c4/>, ponieważ linia nie niesie czasu.

seg-5ec2509907dd = Linie zaczynające się od <c1/> oraz linie niebędące <c2/> (takie jak menu startowe) są pomijane i liczone.

seg-cb4b7062dd5a = dzienniki linuxptp i chrony

seg-c6c70813a988 = Te pięć formatów wczytuje to, co działający demon czasu zapisuje o własnym zegarze. Służą do sprawdzania łańcucha czasu po fakcie (zegar graniczny, PHC grandmastera, klient chrony) tymi samymi estymatorami co inne dzienniki. Nie wczytują konfiguracji demona i nic tu nie komunikuje się z demonem.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: linie serwa linuxptp, przy czym każdy format wczytuje tylko linie własnego programu. Odczytem jest linia w postaci

seg-e32842403b6b = Znacznikiem czasu jest pierwsze <c1/> w linii (zegar monotoniczny demona). Jest on odczytywany także po prefiksie syslog, gdzie identyfikator procesu, taki jak <c2/>, nie ma części ułamkowej i nie jest brany.

seg-72678cd6c03e = Fazą jest zalogowane <c1/>, w nanosekundach, przeliczone na sekundy. Jest to zmierzony przez demona błąd czasu jego zegara podrzędnego względem wzorca, tak jak zalogowano: dodatni, gdy zegar podrzędny wyprzedza. Jest to błąd pozostały pod kontrolą serwa, a nie dryf zegara swobodnego.

seg-f9080412572a = Słowa między znacznikiem czasu a <c1/> nazywają źródło (<c2/>, <c3/> dla prefiksu <c4/>, <c5/>, <c6/>). Dziennik z więcej niż jednym źródłem wymaga <c7/>; błąd je wylicza.

seg-5bef874341f2 = Odczyty sprzed pierwszego zgłoszenia przez serwo <c1/> (zablokowany) są pomijane i liczone w <c2/>: <c3/> i <c4/> to stany niezablokowany i skokowy, których przesunięcia są przejściowymi procesami wejścia. Serwo, które nigdy nie osiąga <c5/>, jest odrzucane. Linia bez pola stanu jest odczytywana tak, jak jest.

seg-121fbe1486cf = Linie podsumowań (<c1/>), komunikaty <c2/> i <c3/> oraz linie innych programów są pomijane i liczone.

seg-92164f4a56be = Znaczniki czasu cofające się (ponownie uruchomiony demon) są odrzucane; podziel dziennik.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: pliki <c3/> i <c4/> chrony, odczytywane według położenia kolumn. Odczytem jest linia z co najmniej { "14" } kolumnami (tracking) lub { "13" } (statistics), zaczynająca się od daty i czasu UTC w postaci <c5/>. Linia nagłówka kolumn jest pomijana i liczona; linia <c6/> pod nią jest pomijana bez liczenia.

seg-bae4f6895d14 = Tracking: kolumna { "7" }, lokalne przesunięcie przy aktualizacji zegara, w sekundach. Adres IP lub identyfikator odniesienia zmienia się wraz z wybranym źródłem, więc bez <c1/> każda linia jest odczytywana jako jeden zegar lokalny. <c2/> zachowuje jeden identyfikator odniesienia.

seg-12b284cd7d8c = Statistics: kolumna { "5" }, estymowane przesunięcie źródła, w sekundach. Dla każdego adresu źródła jest jeden szereg, a dziennik wymaga <c1/>, gdy zawiera więcej niż jeden.

seg-197645e3c7c5 = Epoki to sekundy od 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, bez obsługi sekund przestępnych. Chrony zapisuje linię na aktualizację lub na próbkę źródła, więc odstęp nie jest jednorodny. <c1/> to mediana odstępu; odczyt wcześniejszy niż połowa <c2/> po zachowanym poprzednim jest odrzucany i liczony w <c3/>, a dłuższy odstęp jest przerwą, o czym informuje <c4/>. Podaj <c5/> i <c6/> dla dziennika ze stałym interwałem odpytywania.

seg-61fbb0479c95 = Kolumny chrony i układy linii linuxptp pochodzą z publicznej dokumentacji demonów. Zestawy danych w <c1/> napisano dla Kshana ze zmyślonymi wartościami (zob. jego <c2/>); nie wczytano żadnego prawdziwego dziennika, więc układ różniący się między wersjami demona może nadal zostać odrzucony lub źle odczytany. Linia niepasująca jest pomijana i liczona, nigdy zgadywana.

seg-b120a37b7d60 = <c1/> i przerwy

seg-6fd68aad2fd7 = Gdy dziennik niesie znaczniki czasu i nie podano <c1/>, <c2/> jest medianą odstępu kolejnych znaczników czasu, zaokrągloną do czterech cyfr znaczących, a źródło jest zgłaszane jako <c3/>. Odstęp licznika różni się od nominalnego o przesunięcie częstotliwości wzorca, rzędu { "10" }^{ "6" } lub mniej. <c4/> w scenariuszu zawsze wygrywa (źródło <c5/>), następnie komentarz nagłówka <c6/> (źródło <c7/>).

seg-59e52611a7d3 = Próbki są umieszczane na siatce <c1/>, a brakująca epoka jest przerwą. Odczyty oddalone od siatki o więcej niż { "1" } % <c2/> są odrzucane i liczone, podobnie jak duplikaty (pierwszy jest zachowywany). Polityka przerw jest jedną z:

seg-61b1664a7c48 = <c1/> (domyślnie): każda przerwa jest błędem, który liczy przerwy;

seg-593c998b65e0 = <c1/>: zachowaj najdłuższy ciąg bez przerw;

seg-f184ce746389 = <c1/>: wypełnij przerwy wewnętrzne interpolacją liniową i podaj liczbę wypełnionych.

seg-1f3dc3429615 = Estymatory wymagają zapisu bez przerw, dlatego przerwy są tu rozwiązywane.

seg-0f061f726ec5 = <s1>Poprzednia</s1>Test holdover i sprzęt czasu w pętli

seg-3c89cfcbbd04 = <s1>Następna</s1>Bezpieczeństwo sprzętu

seg-9b52cd5eb4be = tau0 i przerwy

seg-9c8042f0d3d7 = <b><c1/></b>: pliki zegara RINEX, wersje { "2.00" } oraz od { "3.00" } do { "3.04" } (w tym dziewięcioznakowe pole nazwy z { "3.04" }). Sprawdzany jest rekord <c2/>, a każda inna wersja jest odrzucana z podaniem znalezionej wersji: IGS publikuje format zegara (<c3/>, <c4/>, <c5/>) do { "3.04" }, a dokumenty RINEX { "4.00" }, { "4.01" } i { "4.02" } definiują tylko pliki obserwacji, nawigacji i meteorologiczne, więc nie ma wersji { "4.00" } pliku zegara do odczytu. Nagłówek jest czytany tylko dla <c6/> i pomijany do <c7/>. Spośród rekordów danych zachowywane są tylko rekordy <c8/> (satelita) i <c9/> (odbiornik lub stacja) jednego zegara, wybranego po nazwie. Ich pierwsze pole wartości, bias zegara w sekundach, jest fazą. Linie kontynuacji oraz rekordy <c10/>, <c11/> i <c12/> są pomijane. Epoki to pola kalendarzowe rekordu, jako sekundy od 1980-01-06 { "00" }:{ "00" }:{ "00" } we własnym systemie czasu pliku, bez konwersji.

seg-b65f4a928891 = <b><c1/></b>: dzienniki licznika TAPR TICC (TICC Operation Manual, wersje z { "23" } listopada { "2016" } i { "15" } grudnia { "2025" }, „measurement modes”). Każde pole danych to sekundy z { "12" } miejscami po przecinku (domyślnie { "11" } od oprogramowania sprzętowego { "20251101" }: odczytywana jest każda liczba do { "15" }). Znacznik czasu jest odczytywany z jego tekstu dziesiętnego jako całkowita liczba femtosekund, a nie jako liczba binarna zmiennoprzecinkowa, więc faza dziennika zebranego dni po uruchomieniu licznika zachowuje własną rozdzielczość licznika: znacznik czasu <c2/> przy { "3.0e5" } s ma rozstaw { "5.8e-11" } s, około { "60" } ps licznika.

seg-bb51bfa2a834 = Tryb Paired Timestamp drukuje te same wiersze w kolejności kanałów i jest odczytywany jako tryb Timestamp; tryb 3-Corner Hat dodaje syntetyzowany <c1/>, odczytywany jak wyżej.

seg-220bc7450e83 = Wyjście trybu okresu i trybu debugowania jest odrzucane. Kanał, którego odczyty nie rosną, jest zgłaszany jako tryb okresu. Binarny tryb Timestamp nie jest tekstem, a jego plik jest odrzucany z komunikatem, który to mówi.

seg-1138c53b3eac = Twój własny zegar

seg-1f9cce016fa0 = Tabela <c1/> w rodzaju zegara podaje, jak stabilny był Twój własny zegar, obok symulacji: <c2/> (<c3/>) to <c4/> z 96-odczytowym wyciągiem zegara satelity IGS jako wbudowanym dziennikiem TimeLab. Zastąp <c5/> przez <c6/> i <c7/> dla własnego pliku. Blok <c8/> w wyniku zawiera sposób odczytu dziennika (format, <c9/> i skąd pochodzi, każda przerwa) oraz jego ADEV, TDEV i MTIE; nie zmienia on symulacji.

seg-584564d1a734 = Sterowanie holdover własnym zegarem: <c1/>

seg-56799b5fea19 = Dziennik jest dopasowywany procedurą karty urządzenia z <c1/> (kondycjonowanie, usunięcie składowej kwadratowej, identyfikacja szumu z opóźnieniem 1, ważona metoda najmniejszych kwadratów w szumie PM białym, FM białym, FM typu flicker i FM typu błądzenie losowe w czasach uśredniania z co najmniej { "30" } stopniami swobody). Wskazany zegar przyjmuje wtedy <c2/>, <c3/>, <c4/> oraz dopasowane <c5/>; <c6/> pozostaje takie, jak w scenariuszu, ponieważ dziennik niesie przesunięcie swojego wzorca, a nie zegara po dyscyplinowaniu. Szum fazy białej jest dopasowywany i podawany, ale nie symulowany. Wynik zyskuje blok <c7/> (współczynniki, punkty dopasowania, wartości użyte przez przebieg, co pominięto, SHA-256 dziennika), a zegar nosi identyfikator <c8/>. Przy <c9/> zespół losuje z dopasowanego zegara (blok <c10/> wymaga <c11/>). Dopasowanie bez szumu częstotliwości, dziennik zbyt krótki do dopasowania oraz <c12/> inne niż <c13/> lub <c14/> są błędami, które o tym mówią. <c15/> to przykład ({ "6" } godzin zegara satelity IGS).

seg-fe695061eed3 = Co pokazuje porównanie na znanym szumie (<c1/>) i o czym warto pamiętać:

seg-90657795ba62 = Osiągnięte: poziom FM białego jest odzyskiwany z dokładnością do { "5" } % w każdym zapisie syntetycznym, który go ma; dopasowana karta odtwarza prawdziwe odchylenie Allana w granicach współczynnika { "1.35" } przy każdym czasie uśredniania, dla którego była dopasowana; wykładnik szumu identyfikowany przez dopasowanie równa się wykładnikowi allantools w każdym punkcie (w zapisie 5071A, po usunięciu także z wejścia allantools skoku fazy, który usuwa kondycjonowanie).

seg-f1ec27a393ae = <b>Nieosiągnięte i przypięte przez test:</b> FM typu błądzenie losowe jest odzyskiwany tylko wtedy, gdy dominuje przy najdłuższych czasach uśredniania zapisu, a nawet wtedy w jednym z trzech zapisów serii { "131 072" } s z przecięciem przy { "3 000" } s dopasowanie przypisało go do FM typu flicker i do dryfu. Podział między FM typu błądzenie losowe a FM typu flicker nie jest wiarygodny na podstawie jednego zapisu. Przebieg odtwarza stabilność dziennika w czasach uśredniania, które dziennik obejmuje; poza nimi oba wybory się rozchodzą (FM typu flicker to stała podłoga, FM typu błądzenie losowe rośnie jak pierwiastek kwadratowy czasu uśredniania).

seg-88ba5ae782d4 = MODELLED: scenariusz „co by było, gdyby” dla szumu tego zegara, jaki pokazuje dziennik, a nie kalibracja zegara ani prognoza jego przyszłego zachowania.

seg-6e88b597bbf0 = Zniekształcony dziennik jest błędem, który nazywa to, co znaleziono (wiersz, wersję, brakujący selektor), a nigdy częściowym wynikiem: <c1/> przypina { "24" } takie przypadki.

seg-4a05abb27420 = MODELLED. To jest parser, a jego wynik zasila estymatory sprawdzane gdzie indziej względem allantools. Testy jednostkowe w <c1/> używają małych ręcznie napisanych dzienników, a dla formatów linuxptp i chrony zestawów danych z <c2/>. <c3/> uruchamia porównanie zarejestrowane wstępnie w <c4/>: trzy syntetyczne dzienniki z ziarnem, po jednym na format, odczytane z powrotem przez niezależny czytnik napisany na podstawie tej strony przez tego samego autora, z ADEV, TDEV i MTIE sprawdzonymi względem allantools { "2024.6" }; porównanie to obejmuje tylko pierwsze trzy formaty, a czytniki linuxptp i chrony mają testy parsera, lecz nie mają porównania z wyrocznią. Dzienniki tego porównania są syntetyczne, więc nic tam nie opisuje prawdziwego zegara ani licznika; porównanie na zmierzonych seriach opisano poniżej.

seg-576211abf0b4 = Na zmierzonych danych

seg-3c8d10e8bd1c = <c1/> uruchamia porównanie zarejestrowane wstępnie w <c2/> (zatwierdzone przed jakimkolwiek zestawem danych lub przebiegiem) na czterech zmierzonych seriach: <c3/> ze Stable32, pierwsze { "65 536" } odczytów zegara cezowego 5071A względem masera wodorowego oraz zegary satelity IGS G01 ({ "30" } s) i stacji ABMF ({ "300" } s) z końcowego zegara IGS z 2026-08-02, jako dołączony wycinek z jego NOTICE. Dwa pierwsze nie mają przyznanego prawa redystrybucji: zapisane z nich dzienniki znajdują się w ignorowanym przez git <c4/> (<c5/>), a test o tym mówi i przechodzi, gdy ich brak, chyba że ustawiono <c6/>. Każdy dziennik jest odczytywany przez silnik i przez niezależny czytnik, a ADEV, TDEV i MTIE są porównywane z allantools { "2024.6" }. Zapisano w <c7/>: w dostarczonym czytniku dzienniki TICC, wersja nagłówka i pięć komunikatów o błędach nie osiągnęły progów zarejestrowanych wstępnie; zostały naprawione, a porównanie uruchomiono ponownie bez zmian. Osiągnięte, z wyjątkiem jednej pary: MTIE dziennika częstotliwości różni się od MTIE allantools, ponieważ allantools całkuje częstotliwość pomniejszoną o jej średnią (przypięte jako NOT MET; porównanie jednakowe jest osiągnięte). Wiersz pozostaje MODELLED: dzienniki TICC to zmierzone dane zegara zakodowane ponownie w układzie licznika naszym skryptem (nie znaleziono żadnego rzeczywistego zapisu TICC), a czytnik wzorcowy ma tego samego autora co czytnik silnika.

seg-52778d17f4db = Sterowanie holdover własnym zegarem: [clock_fit]
