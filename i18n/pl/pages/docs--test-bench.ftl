# docs--test-bench: translations (pl)

seg-245fe1f87b08 = Plik

seg-e305279d5b11 = Zawartość

seg-292871e5747d = Źródło: <c1/>

seg-d18a29239225 = Uruchamianie odbiornika na wyeksportowanym scenariuszu

seg-aa3498c7cb16 = Producent odbiornika, który ma laboratoryjny symulator GNSS, może odtworzyć w nim ruch pojazdu ze scenariusza Kshana, zarejestrować, co robi badany odbiornik, i ocenić ten log poleceniem <c1/> względem zdarzeń podanych przed przebiegiem. Kshana dostarcza ruch, czasy zdarzeń i ocenę. <b>Nie zapisuje sygnału</b>: nic, co tu eksportowane, nie syntezuje, nie modeluje ani nie nadaje przebiegu radiowego lub w paśmie podstawowym, a wyeksportowane zdarzenie jest oznaczonym przedziałem czasu, a nie przepisem na wytwarzanie zakłóceń. Sygnały dostarczają symulator i jego operator, a operator odpowiada za uruchamianie ich tylko tam, gdzie jest to dozwolone (w układzie przewodowym lub ekranowanym, zgodnie z własnymi instrukcjami bezpieczeństwa symulatora).

seg-414c7774d133 = Ta strona to metoda. Nie publikuje żadnych wyników.

seg-a0ad7b35922f = { "1" }. Eksport

seg-798d75d3b65c = Dotyczy rodzaju <c1/> (profil jazdy z orientacją; zdarzeniami są przerwy stanu nawigacyjnego) oraz <c2/> i <c3/> (nieruchomy odbiornik przez czas trwania scenariusza; nadajnik zakłócający w scenariuszu <c4/> to jedno zdarzenie w całym przebiegu). Inne rodzaje podają, dlaczego nie mają trajektorii pojazdu. <c5/> to chwila UTC zerowego czasu ruchu (domyślnie 2024-01-01T00:{ "00" }:00Z); scenariusze nie mają własnej daty kalendarzowej dla ruchu pojazdu. Musi to być prawdziwa chwila UTC, <c6/> (końcowe <c7/> jest akceptowane), z rokiem w zakresie od { "2000" } do { "2099" } i każdym polem w zakresie; wszystko inne jest odrzucane. Wynik jest identyczny bajt po bajcie dla tego samego scenariusza i epoki.

seg-c153d8ef8735 = jeden wiersz na próbkę: <c1/>, stałe względem Ziemi <c2/>, <c3/>, geodezyjne <c4/>, <c5/>, <c6/>, <c7/>

seg-fa4c8c0d2b72 = epoka, układy, jednostki, kolumny i tolerancje odtworzenia tego CSV

seg-8c74ca211e3a = zdania NMEA { "0183" } <c1/> i <c2/> na próbkę, z sumami kontrolnymi

seg-2b0fd541f1dc = wiersz <c1/>, a następnie wiersze <c2/> (zapisywane tylko wtedy, gdy każdy odstęp próbkowania jest tą samą całkowitą liczbą milisekund; gdy zostanie pominięte, polecenie podaje powód na standardowym wyjściu błędów)

seg-d09d2dab9a17 = te same zdarzenia jako bloki <c1/> dla scenariusza <c2/>

seg-866a3c4870af = przebieg jako dokument <a1><c1/></a1> dla nagrania <c2/>: zdarzenia jako podana prawda, z <c3/>, <c4/>, <c5/>, <c6/> każdego zdarzenia i mocą pozostawionymi do uzupełnienia przez laboratorium

seg-9ea6a94d4586 = Układy współrzędnych i konwencje

seg-8d3b7d2ef815 = <b>Pozycja:</b> WGS { "84" }, stała względem Ziemi (ECEF: <c1/> przez równik na południku zerowym, <c2/> przez biegun); <c3/>, <c4/>, <c5/> podają tę samą pozycję geodezyjnie, <c6/> ponad elipsoidą.

seg-93a2975d2a19 = <b>Prędkość:</b> osie stałe względem Ziemi, względem Ziemi.

seg-be05c2278e98 = <c1/> zgodnie z ruchem wskazówek zegara od północy prawdziwej w [{ "0" }, { "360" }), <c2/> dodatnie dziobem w górę, <c3/> dodatnie prawym skrzydłem w dół; odchylenie-pochylenie-przechylenie (3-2-1) od lokalnego układu północ-wschód-dół do osi ciała: x do przodu, y w prawo, z w dół. Źródło nieruchome zapisuje zera. NMEA i tekst punktów trasy nie niosą orientacji.

seg-3c3ad1295628 = <b>Kierunek (heading) to odchylenie ciała, a nie kierunek ruchu.</b> W profilu jazdy <c1/> ciało odchyla się falami prostokątnymi, podczas gdy prędkość podąża za ruchem, więc kierunek (heading) i kurs nad ziemią mogą się różnić o dziesiątki stopni (do około { "77" } stopni w dołączonym scenariuszu <c2/>). Kurs <c3/> w NMEA to kurs nad ziemią, kierunek wektora prędkości, więc symulator, który czyta heading z pliku ruchu, i taki, który czyta kurs z pliku NMEA, widzą różne kąty. Kurs nad ziemią z CSV to <c4/> jego prędkości obróconej do układu północ-wschód-dół.

seg-224b53995157 = <b>Wysokość podąża za scenariuszem.</b> Dla <c1/> wartość <c2/> pochodzi z własnego krokowania w płaszczyźnie stycznej, wykonywanego przez rodzaj na jego prawdzie, i nie jest stała (około { "7" } m w ciągu { "180" } s <c3/>); to ruch scenariusza, zapisany takim, jaki jest.

seg-f78a354f96ee = <b>Wartości zastępcze NMEA <c1/>.</b> Jakość pozycji ({ "1" }), liczba użytych satelitów ({ "12" }) i HDOP ({ "1.0" }) są zapisywane wyłącznie po to, by zdanie było poprawnie sformułowane. Nic nie mówią o geometrii scenariusza ani o jakimkolwiek stanie odbiornika.

seg-f5cd510aac0c = <c1/> po epoce, UTC, sekundy przestępne niemodelowane.

seg-d2a2f655760d = <b>Wysokości NMEA są elipsoidalne.</b> Wysokość <c1/> zawiera wysokość elipsoidalną, a separacja geoidy jest zapisywana jako { "0.0" }. Symulator, który traktuje wysokość jako wysokość nad średnim poziomem morza, umieści pojazd z błędem równym lokalnej undulacji geoidy.

seg-ee3a9a3ec84d = <b>Tolerancje odtworzenia</b> (sprawdzone przez odczyt każdego pliku z powrotem): pozycja w CSV { "0.1" } mm, szerokość i długość geograficzna { "1e-9" } stopnia, prędkość { "0.1" } mm/s, kąty { "1e-6" } stopnia; pozycja pozioma w NMEA { "5" } mm, wysokość { "1" } mm, prędkość { "0.001" } węzła, kurs { "0.001" } stopnia.

seg-a554992d2694 = Wczytywanie plików do symulatora

seg-757382614413 = Symulatory laboratoryjne się różnią, a to repozytorium nie powiela instrukcji żadnego symulatora. Sprawdź, które z powyższych formatów czyta Twój, i jego podane wymagania:

seg-cc49ceccea20 = Wiele importerów ruchu oczekuje stałej częstotliwości aktualizacji, najczęściej { "10" } Hz. Scenariusz <c1/> ma krok { "0.1" } s; dla scenariusza nieruchomego ustaw <c2/> na częstotliwość, jakiej chce symulator.

seg-e98bf4bf6c6e = Niektóre importery pomijają próbki przypadające między pełnymi sekundami albo ignorują kolumnę czasu i używają kolejności wierszy. Zacznij ruch w pełnej sekundzie i utrzymuj regularną siatkę.

seg-3c470262eb15 = Importer CSV, który pozwala mapować kolumny, może czytać <c1/> bezpośrednio: wybierz kolumny stałe względem Ziemi lub geodezyjne i ustaw ich jednostki na podstawie <c2/>. Obcinanie miejsc dziesiętnych powoduje fałszywe przyspieszenie, więc zachowaj zapisaną precyzję.

seg-41a2bfe45b37 = Plik zawiera wyłącznie ruch. Skonfiguruj konstelację, zakłócenia i tor wejściowy odbiornika w symulatorze i zsynchronizuj je ze zdarzeniami w <c1/>.

seg-024ab011a2e3 = Kshana nie zapisuje żadnego interfejsu skryptowego dostawców.

seg-6d67d4e2cdf0 = Sprawdzone czytnikami jednego symulatora open source

seg-e4ce0597a644 = Czytniki ruchu z gps-sdr-sim (MIT, commit 28ca29a6) otrzymały eksporty ośmiu dołączonych scenariuszy. Każdy czytnik zwrócił wyeksportowaną trajektorię (<c1/>, zarejestrowaną wstępnie w <c2/>):

seg-3caed3fc2e47 = opcja gps-sdr-sim

seg-ad9e78555851 = Podaj mu

seg-4f9be75880d3 = Największa różnica względem CSV

seg-0e86c1df1bc5 = <c1/> (NMEA GGA)

seg-e03dd1d45ced = <c1/> tak, jak zapisano

seg-8d28fbcc4c4a = { "1.2" } mm

seg-fd39660fcb73 = <c1/> (czas, szerokość geograficzna, długość geograficzna, wysokość)

seg-c4e171cbf0de = { "0.15" } mm

seg-390b0c0fb695 = <c1/> (czas, x, y, z)

seg-ff26559a85e8 = dokładnie

seg-f4c13a327904 = Nie podawaj <c1/> pełnego CSV ruchu. Jego czytnik mieści { "100" } znaków w wierszu, a wiersz CSV ma około { "160" } znaków, więc każdy wiersz jest czytany jako dwie próbki. Wiersz nagłówka jest czytany jako jeszcze jedna próbka bez żadnych liczb.

seg-43cc6f9c50b2 = gps-sdr-sim mieści co najwyżej { "3000" } próbek, czyli { "300" } s przy stałej częstotliwości { "10" } Hz, i ignoruje kolumnę czasu. Eksporty <c1/> mają krok dokładnie { "0.1" } s. Dłuższe scenariusze, takie jak 20-minutowy <c2/>, są czytane tylko do pierwszych { "300" } s.

seg-500243b6e402 = To sprawdza, że pliki są czytane tak, jak zapisano. Nie sprawdza fizyki scenariusza ani niczego, co symulator nadaje.

seg-a4c4514276e9 = { "2" }. Określ, co będziesz oceniać, przed przebiegiem

seg-3a3e2be36c65 = Plik zdarzeń podaje przedziały, które definiuje scenariusz. Skopiuj <c1/> do scenariusza <c2/>, dodaj każdą prognozę, którą chcesz sprawdzić, i ustal progi monitorów oraz tolerancje <b>przed</b> uruchomieniem odbiornika. Nie zmieniaj ich po obejrzeniu logu; scenariusz, progi i SHA-256 logu wchodzą do skrótu wyniku.

seg-d07b9ad8cfa9 = Wyeksportowane zdarzenia niosą własny rodzaj scenariusza: nadajnik zakłócający w scenariuszu <c1/> to <c2/>; przerwa stanu nawigacyjnego to <c3/>, ponieważ scenariusz stwierdza, że GNSS był niedostępny, a nie w jaki sposób. Zmień <c4/> tak, aby odpowiadał temu, co skonfigurujesz w symulatorze.

seg-faa87b3ba315 = { "3" }. Uruchom odbiornik

seg-0a3b63cf5615 = Uruchom odbiornik i jego rejestrator, uruchom scenariusz symulatora z plikiem ruchu i niech przebieg obejmie interwał kalibracji, każde zdarzenie oraz zapas po ostatnim. Zachowaj własny log odbiornika (UBX, obserwacje RINEX { "3" }, CSV z rejestratora Androida albo NMEA ze zdaniami stanu satelitów). Log bez natężenia sygnału dla poszczególnych satelitów można nadal ocenić na podstawie własnej pozycji odbiornika, ale monitory stosunku nośnej do szumu go wymagają.

seg-fbbc12dfeb3f = { "4" }. Wyrównaj zegary

seg-5828311af3d4 = <c1/> liczy czasy zdarzeń od pierwszej epoki logu odbiornika; plik ruchu liczy od swojej pierwszej próbki. Jeśli log zaczyna się <c2/> sekund przed pierwszą próbką ruchu, dodaj <c3/> do każdego <c4/> i <c5/>. Zapisz przesunięcie i sposób jego pomiaru oraz podaj je w <c6/> scenariusza lub w komentarzu, ponieważ błędne przesunięcie zmienia każdą ocenę. Same czasy zdarzeń nie pozwalają ustalić przesunięcia; użyj znacznika początku scenariusza w symulatorze lub własnych znaczników czasu odbiornika.

seg-22f7b68c445b = { "5" }. Ocena

seg-e024186a2874 = zapisuje <c1/>, <c2/> i <c3/>. Dla każdego zdarzenia wynik podaje fałszywe alarmy przed początkiem, pierwszy alarm i jego monitory, opóźnienie oraz rezultat (<c4/>, <c5/>, <c6/>, <c7/>), a także przewidywany i zaobserwowany spadek stosunku nośnej do szumu, jeśli podano prognozę. Rozbieżność jest raportowana, a nie wygładzana strojeniem. Zob. <a1>RECEIVER-TRUST.md</a1>.

seg-5fa1e4890f91 = Aby zobaczyć, dla których publicznych wierszy ram sesja dostarcza dowodów (supports evidence for):

seg-abc6aaf44c95 = Zob. <a1>compliance/README.md</a1>. Ten raport opisuje dowody w przebiegach, które mu się poda; nie formułuje żadnego ustalenia o odbiorniku ani o żadnych ramach.

seg-69fa39640c2d = { "6" }. Połącz cały obieg w jednym podpisanym pakiecie

seg-f24e2dd64c47 = Po ocenie <c1/> wiąże ze sobą cztery zapisy: wyeksportowany scenariusz, <a1>warunki testu</a1> laboratorium, log odbiornika i ocenę. Uzupełnij <c2/> (ścieżkę i SHA-256 logu, badany odbiornik, rodzaj i podaną moc każdego zdarzenia), a następnie:

seg-78bed55de550 = <c1/> zawiera blok <c2/> (<c3/>) z <c4/>, <c5/>, <c6/> i oceną (liczba wykrytych zdarzeń spośród ocenialnych, pierwszy alarm), objęty skrótami manifestu i podpisem. Polecenie odrzuca pakiet, w którym warunki i zdarzenia oceny są ze sobą sprzeczne albo w którym podany skrót logu nie jest skrótem tego logu. Jak każdy pakiet dowodowy jest to zapis techniczny, a nie opinia prawna.

seg-5fe6548911da = Przykład praktyczny: gps-sdr-sim zapisujący plik

seg-eeccc823e109 = Ten przykład używa symulatora open source gps-sdr-sim wyłącznie do <b>zapisania pliku pasma podstawowego</b> z wyeksportowanego ruchu. Kshana niczego nie nadaje, a nic na tej stronie nie automatyzuje odtwarzania tego pliku przez radio. Jeśli laboratorium odtwarza taki plik do odbiornika, odpowiada za to jego operator i robi to wyłącznie tam, gdzie jest to dozwolone (w układzie przewodowym lub ekranowanym, według instrukcji bezpieczeństwa symulatora i radia), a Kshana tego ani nie dokumentuje, ani nie obudowuje.

seg-db81fdadfd19 = Cokolwiek laboratorium zrobi następnie z <c1/>, dzieje się poza Kshana. Własny log odbiornika, uzyskany dowolnie, jest tym, co ocenia krok { "5" } i łączy krok { "6" }. Pliki i kontrole, które Kshana wykonuje na własnych eksportach, są testowane wyłącznie na danych syntetycznych (<c2/>); nie twierdzi się tu żadnego przebiegu laboratoryjnego.

seg-dffcbdb8e6c3 = Czego ta metoda nie robi

seg-d0b62c238953 = Nie wytwarza sygnału i nie mówi, jakie zakłócenia powinien generować symulator. Zdarzenia mówią kiedy, a nie co.

seg-3aa11bed60c8 = Pojedyncza sesja to pojedynczy punkt danych. Wynik opisuje ten log przy tej konfiguracji i nic nie mówi o innych odbiornikach, oprogramowaniu układowym, antenach ani rzeczywistych zakłóceniach.

seg-b156403456e4 = Wysokości, szybkości i wyrównanie czasu operator sprawdza względem symulatora; eksport podaje własne konwencje i tolerancje i nic ponadto.

seg-337ff53bc890 = <s1>Poprzednia</s1>kshana-bench

seg-87be81f5e600 = <s1>Następna</s1>Mapowanie compliance
