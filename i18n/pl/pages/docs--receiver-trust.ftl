# docs--receiver-trust: translations (pl)

seg-2247a2344710 = Znaczenie

seg-adc34608c46b = Klasa

seg-fdbb9db68f1d = brak

seg-f63dd3d7aad4 = Źródło

seg-98151954f217 = false

seg-c353e7bec219 = Klucz

seg-cc38b40eb7a5 = Monitor

seg-7670cf4ceda3 = Wartość domyślna

seg-a0cc45088f5f = GSV

seg-7000c522cc93 = Własna flaga spoofingu odbiornika zestawiona z alarmami Kshana, z prawdziwego przebiegu silnika v{ $version } na zmyślonym dzienniku UBX ({ "200" } epok przy { "1" } Hz). C/N0 spada o { "20" } dB w { "80" } do { "90" } s i { "120" } do { "130" } s; odbiornik flaguje { "120" } do { "130" } s i { "160" } do { "165" } s. Spośród { "140" } epok porównanych po kalibracji w { "11" } flagowały oba, w { "6" } tylko odbiornik, w { "11" } tylko Kshana, a w { "112" } żaden. Żadna ze stron nie jest prawdą terenową, a zgodność nie jest walidacją. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia.

seg-26ab8544afba = Wskaźnik zaufania podczas jednego syntetycznego rejsu, z rzeczywistego przebiegu silnika v{ $version } na examples/maritime-trust (zmyślony dziennik NMEA promu na trasie Tallinn–Helsinki, { "3001" } epok przy { "1" } Hz). Trzy pasy dzielą jedną oś czasu. Góra: odległość między pozycją zgłaszaną przez odbiornik a rzeczywistą pozycją statku, która pozostaje w granicach kilku metrów do około { "1576" } s, gdy zaplanowane w dzienniku odciągnięcie pozycji ją odsuwa, podczas gdy odbiornik nadal zgłasza ważne rozwiązanie pozycji. Środek: wskaźnik zaufania od { "0" } do { "100" }, nieobliczany w pierwszych { "300" } s kalibracji, w przedziale nominalnym (co najmniej { "90" }) do odciągnięcia pozycji, a potem spadający przez przedział obniżony (co najmniej { "55" }) do przedziału braku zaufania. Dół: przedział każdej epoki jako kolorowa wstęga z jego nazwą. Wynik ma charakter doradczy. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator. Dziennik jest zmyślony, aby pokazać format i monitory; nie jest pomiarem i nic nie mówi o tym, jak poradziłby sobie jakikolwiek odbiornik.

seg-caadaad98cf6 = Źródło: <c1/>

seg-4f10c2397fcc = Zaufanie do odbiornika: ocena rzeczywistego dziennika odbiornika GNSS

seg-2596bdcdaf8e = <c1/> odczytuje dziennik z rzeczywistego odbiornika globalnego systemu nawigacji satelitarnej (GNSS), przepuszcza go epoka po epoce przez monitory zaufania i mówi, kiedy i dlaczego pozycja odbiornika przestała być wiarygodna. Może też ocenić dziennik względem zdarzeń i predykcji podanych <b>przed</b> przebiegiem: czy każde zdarzenie wykryto na czas i czy modelowany spadek stosunku nośnej do gęstości szumu (C/N0) zgadza się z tym, co zmierzył odbiornik.

seg-63f24d5f2d5e = Obserwable pochodzą z samego odbiornika; monitory i ich progi pochodzą z silnika i od użytkownika. Każdy wynik niesie tę etykietę, SHA-256 dziennika i każdy próg, z którym był uruchomiony, więc przebieg można powtórzyć i poddać audytowi.

seg-6f5014b93fbc = Dla statku w drodze, z bieżącym wskaźnikiem i opcjonalną bramką przed systemem map, zob. <a1><c1/></a1>.

seg-82cdabb6086f = To zapisuje <c1/>, <c2/> (jeden wiersz na epokę) i <c3/> (średnie C/N0 w czasie ze stanem zaufania pod spodem) obok scenariusza i wypisuje jednowierszowy werdykt. Przykładowy dziennik jest syntetyczny, stworzony, by pokazać format; <c4/> należy skierować na dziennik własnego odbiornika.

seg-ec2be1ea73f5 = Powyższy rysunek to demo statku z <a1><c1/></a1>: zmyślony dziennik, wskaźnik wyłącznie doradczy.

seg-0f24c5cf4b9b = Ten sam scenariusz uruchamia się z Pythona (<c1/>), z pakietu WebAssembly (<c2/>, z dziennikiem wstawionym w treści) oraz z narzędzia <c3/> serwera Model Context Protocol (MCP).

seg-1f3cc12b6230 = Dzienniki, które odczytuje

seg-23fd4a5bf5dd = Co jest odczytywane

seg-2e1a655cf846 = Binarne u-blox

seg-cb31da7b7d88 = NAV-SAT: C/N0, elewacja i azymut każdego satelity, NAV-PVT: pozycja, MON-RF: automatyczna regulacja wzmocnienia (AGC) i wskaźnik zagłuszania <c1/>, NAV-TIMEGPS: tydzień oraz własne flagi odbiornika: NAV-STATUS <c2/> i SEC-SIG (<c3/>, zob. <a1>RECEIVER-PROTOCOLS.md</a1>)

seg-cec582f4afa5 = Plik obserwacji RINEX { "3" }

seg-57708a636148 = kody <c1/> (C/N0) dla każdego satelity i sygnału; z nadawanym plikiem nawigacyjnym (<c2/>) także pseudoodległości do własnego rozwiązania pozycji silnika

seg-176c2493782e = CSV z Android GnssLogger

seg-d69b9dd6ebad = wiersze <c1/>: C/N0 i <c2/> dla każdego satelity; wiersze <c3/>: pozycja

seg-d390120374a9 = Tekst NMEA { "0183" }

seg-9eb885aa79af = GSV: stosunek sygnału do szumu dla każdego satelity (dB-Hz, z identyfikatorem sygnału { "4.10" } lub bez) oraz jego elewacja i azymut, GSA: współczynnik DOP i użyte satelity, GGA i RMC: czas i pozycja

seg-7864926ce37e = Binarne Septentrio ({ "0.38" }, tylko odczyt)

seg-44675c4bdf40 = PVTGeodetic: pozycja, MeasEpoch: C/N0 dla każdego satelity i sygnału, RFStatus: liczba pasm; zob. <a1>RECEIVER-PROTOCOLS.md</a1>

seg-a5367d75c5ee = Plik rozwiązania RTKLIB (<c1/>)

seg-37d28ca5ed00 = czas, pozycja (szerokość/długość geograficzna lub ECEF, po przeliczeniu) i użyte satelity dla każdej epoki; pliki ze stopniami, minutami i sekundami są odrzucane z komunikatem

seg-5e10ecb93f96 = Dzienniki ASCII lub binarne NovAtel OEM7

seg-a630fbcf7425 = <c1/>: pozycja (tylko gdy rozwiązanie obliczono), <c2/>: C/No dla każdego satelity i sygnału; flagi zagłuszania z <c3/> stają się polem <c4/> epoki (stan zagłuszania { "2" }, gdy odbiornik zgłasza zagłuszacz, { "1" }, gdy nie; w RXSTATUS nie ma flagi spoofingu), zestawianym z alarmami { -brand } przez porównanie <c5/>

seg-d4735b581cbf = Strumienie Monitor i PVT-monitor z GNSS-SDR jako wiersze JSON

seg-053235d67fb3 = C/N0 dla każdego kanału, pozycja, użyte satelity, HDOP, azymut i elewacja; tworzone przez <c1/>

seg-2e9033aa4e9d = Szczegóły, źródła i ograniczenia tych trzech: <a1><c1/></a1>.

seg-8987b2c46eb0 = Każda epoka tworzona przez czytniki zawiera także <c1/>, przesunięcia bajtowe <c2/> w danych wejściowych: najmniejszy ciągły zakres obejmujący rekordy, które się na nią złożyły, dzięki czemu dokładny surowy wycinek można zahaszować dla okna zdarzenia. NMEA: każdy wiersz odczytany, gdy epoka jest bieżąca (nadzbiór tam, gdzie niezwiązany wiersz leży między jej zdaniami). UBX: ramki epoki. RINEX { "3" }: rekordy epoki od każdego wiersza <c3/> do następnego. Android: wiersze <c4/> epoki (wiersz <c5/> tylko dla epoki bez wierszy <c6/>). Brak dla strumienia na żywo i wszędzie tam, gdzie nie jest to dobrze określone (RINEX { "2" }).

seg-cea9532b57a2 = Plik podaje się przez <c1/> (rozwiązywane względem własnego folderu scenariusza) lub wstawia w treści jako <c2/> albo <c3/> (jedyne możliwości w przeglądarce).

seg-3bc4f9c91950 = Dziennik IMU jako drugi czujnik

seg-49b10ad5928e = <c1/> dodaje dziennik inercjalny na tym samym zegarze:

seg-9e0560b09f5a = Prędkość odchylenia jest całkowana z <c1/> i wypełnia kurs wszędzie tam, gdzie dziennik odbiornika go nie zawiera, więc monitor <c2/> (który wymaga <c3/> na platformie) porównuje kurs z żyroskopu z kursem nad dnem. Żyroskop dryfuje: kurs jest tak dobry, jak okno całkowania, a <c4/> decyduje, co uznaje się za niezgodność. Układ <c5/> opisano w <c6/>. Bajty IMU są częścią skrótu scenariusza i skrótu scenariusza w pakiecie dowodowym. Wstawienie w treści (<c7/>/<c8/>) działa na każdej powierzchni; <c9/> jest odrzucane tam, gdzie pliki nie są odczytywane.

seg-fd3e6ef1cd93 = Platforma: nieruchoma lub statek

seg-b67c0d57dc1d = Powyższe monitory zakładają nieruchomą antenę. Scenariusz podaje platformę przed przebiegiem w tabeli <c1/> najwyższego poziomu; bez niej platformą jest <c2/> i nic się nie zmienia.

seg-3d6bc18bd83e = Dlaczego ta wartość

seg-32f339f63acf = Powyżej prędkości służbowej kadłubów handlowych i większości jednostek pasażerskich, więc rzeczywisty statek nigdy jej nie osiąga; znacznie poniżej prędkości, jaką oznacza zrywanie pozycji. Wolniejszy statek powinien podać niższy próg: im niższy próg, tym wcześniej wykrywa się zrywanie.

seg-9506e8601857 = Duży statek zmienia prędkość o znacznie mniej niż { "0.1" } m/s²; mała szybka jednostka osiąga kilka dziesiątych przy gwałtownej zmianie przepustnicy.

seg-b0b6baaee456 = Duży statek skręca z prędkością znacznie mniejszą niż { "1" } deg/s, a mała jednostka w ostrym zwrocie z kilkoma stopniami na sekundę.

seg-53d0fffb3c09 = Właściwość instalacji; zgadywanie byłoby ukrytym progiem.

seg-ac48403443f9 = Zadeklarowane <c1/> i nieobecne w dzienniku jest błędem, więc brakujący czujnik nie może uchodzić za czystą kontrolę.

seg-8266739dc26b = Klucze statku są odrzucane przy <c1/>. Dla statku monitor <c2/> nie działa, ponieważ mierzy odległość od średniej kalibracyjnej, co jest błędne dla poruszającej się anteny; pole <c3/> wyniku zapisuje platformę i użyte limity.

seg-7551792a0cb4 = Syntetyczne strumienie NMEA z <a1><c1/></a1>, przygotowane do szkolenia załóg, są przyjmowane przez czytnik NMEA i można je przepuścić przez ten rodzaj jak każdy dziennik NMEA.

seg-18d7538bc56d = Monitory

seg-e5c1cb89f0b3 = Każdy monitor potrzebuje swoich danych; monitor, którego danych nie ma w dzienniku, nie jest uruchamiany i nie jest wymieniony w <c1/>. Pierwsze <c2/> sekund (domyślnie { "60" }) ustalają punkt odniesienia i nigdy nie alarmują.

seg-3be9ee05f087 = Alarmuje, gdy

seg-98ead58c671d = Wymaga

seg-f6e6df453260 = średnie C/N0 po satelitach wspólnych z punktem odniesienia spada o <c1/> lub więcej (domyślnie { "6" } dB)

seg-d9bf6efc6835 = liczba śledzonych satelitów spada o <c1/> lub więcej poniżej mediany z punktu odniesienia (domyślnie { "4" })

seg-60c7a99f9819 = odczyt AGC odbiega od swojego punktu odniesienia o więcej niż <c1/> odchyleń standardowych (domyślnie { "5" })

seg-7c1c65e64418 = UBX MON-RF lub Android <c1/>

seg-a5a5252417cb = <c1/> u-blox przekracza <c2/> (domyślnie { "80" } z { "255" })

seg-8bca191bf4c4 = UBX MON-RF

seg-0ac4898d81cf = własna pozycja odbiornika jest oddalona od jego średniej kalibracyjnej o więcej niż <c1/> (domyślnie { "50" } m)

seg-6a3fec1214b9 = podana pozycja

seg-4c05faf783eb = autonomiczne monitorowanie integralności przez odbiornik (RAIM) metodą parzystości na własnym jednopunktowym rozwiązaniu pozycji silnika odrzuca zestaw pomiarów

seg-037ab193613c = dziennik RINEX z <c1/>

seg-8890a4ebf231 = jednopunktowe rozwiązanie pozycji silnika zawodzi przy pięciu lub więcej satelitach

seg-0a5a708ac75b = zegar odbiornika odbiega od przewidywanej prostej o więcej niż minimalne wykrywalne przesunięcie wynikające z szumu jego kalibracji

seg-31b64b635261 = Skalibrowany profil (opcjonalny).

seg-a73f2c2dfc9a = <c1/> zastępuje trzy progi zakłóceń wartościami skalibrowanymi na publicznym zbiorze danych JammerTest { "2024" } (jeden u-blox ZED-F9P na scenariusz; Zenodo { "15911589" }): <c2/>, <c3/>, <c4/>. Kalibrację zarejestrowano z góry (<c5/>), a profil jest MODELLED, dopasowany na jednej publicznej kampanii: jego próg <c6/> <b>nie spełnił</b> zarejestrowanego z góry progu fałszywych alarmów na zbiorze zapieczętowanym ({ "0.0231" } wobec { "0.02" }); progi AGC i wskaźnika zagłuszania oraz próg dla sumy (fałszywe alarmy { "0.033" }, detekcja { "0.81" }) zostały spełnione (<c7/>). Obowiązuje dla tego typu odbiornika w tym zdarzeniu, względem zaplanowanych slotów ataku, i został skalibrowany na dziennikach CSV zbioru (jego dzienniki UBX dają więcej fałszywych alarmów w dwóch folderach). Wynik uruchomiony z profilem powtarza zastosowane progi i zawiera <c8/> mówiące o tym wszystkim. Bez profilu obowiązują powyższe wartości domyślne i każde wyjście pozostaje niezmienione.

seg-1fa8c4bd1a18 = Dla platformy <c1/> uruchamiane są także monitory platformy ruchomej (progi w tabeli <c2/> najwyższego poziomu, każda wartość domyślna opisana w <c3/>); każdy potrzebuje swoich danych i jest wymieniany w <c4/> tylko wtedy, gdy rozstrzygnął:

seg-4b2840d9d0af = zmiana pozycji nie zgadza się z podaną prędkością i kursem albo oznacza prędkość, przyspieszenie lub prędkość zwrotu powyżej limitów statku

seg-656c19cb5b52 = pozycje; prędkość i kurs (RMC lub VTG) dla części ze zliczania drogi

seg-cedefd52998d = kurs z żyroskopu i kurs nad dnem różnią się o więcej niż <c1/> (prędkość powyżej <c2/>)

seg-c66704cbdd02 = kurs HDT, THS lub VHW, <c1/>

seg-1bbbf0033234 = prędkość względem wody i prędkość nad dnem różnią się o więcej niż <c1/>

seg-c9101740b235 = VHW lub VBW oraz prędkość nad dnem

seg-42ac59072099 = wysokość z GGA różni się od <c1/> o więcej niż <c2/>

seg-811ec460249c = wysokość z GGA, <c1/>

seg-854ea9c26df4 = rozrzut C/N0 między satelitami spada do <c1/> mediany kalibracyjnej

seg-837fc4cb832c = C/N0 satelitów wspólnych wzrosło średnio o <c1/>, a <c2/> z nich wzrosło

seg-faae07674361 = kolejne czasy epok zmieniają się nieregularnie, biegną wstecz albo opuszczają zegar hosta

seg-f799a53897ed = czas NMEA; zegar hosta dla ostatniej części

seg-ee4913c9f2ed = odbiornik zgłasza niepowodzenie uwierzytelniania OSNMA (odczytywany jest zgłoszony status; nic nie jest weryfikowane; aby zweryfikować OSNMA na podstawie samych stron I/NAV, zob. <a1>docs/OSNMA.md</a1>)

seg-3fad5fcde4dc = zdanie statusowe <c1/>

seg-ce072f2ebb6c = Epoka jest <b>niezaufana</b>, gdy alarmuje RAIM, monitor zegara, niepowodzenie rozwiązania lub skok pozycji albo gdy spadek C/N0 osiąga dwukrotność swojego progu; <b>zdegradowana</b> przy każdym innym alarmie; i <b>nominalna</b> w pozostałych przypadkach.

seg-4124ff6013a0 = Ścieżka silnika (<c1/>, <c2/>, <c3/>) to to samo obliczenie co wyrocznia spoofingu JammerTest { "2024" } w <c4/>: <c5/> sprawdza, że dla wszystkich ośmiu opublikowanych początków pierwszy alarm przypada na tę samą epokę i jest tego samego rodzaju.

seg-83be3c22a577 = Wskaźnik zaufania (platforma statku)

seg-812991f245cd = Dla statku każda epoka po kalibracji dostaje także wskaźnik od { "0" } do { "100" } oraz powody, dla których nie wynosi on { "100" }. Odwzorowanie jest deterministyczne i ustalone przed oceną jakiegokolwiek dziennika: bez uczenia, nic nie jest dopasowywane do zdarzeń. Każdy monitor sprowadza swoje dowody do ilorazu <c1/> (alarm przy { "1" } lub więcej); iloraz kosztuje wskaźnik

seg-ada5a0a52315 = więc monitor nic nie kosztuje, dopóki jest poniżej <c1/> swojego progu (domyślnie { "0.5" }), połowę swojej wagi przy progu i całą wagę przy <c2/> razy progu (domyślnie { "1.5" }); wskaźnik jest nierosnący względem każdej statystyki. Źródło, które nie zgłasza się w danej epoce, zachowuje swoją ostatnią statystykę przez <c3/> (domyślnie { "10" } s: dwa cykle zdania C/N0 wysyłanego co { "5" } s), zarówno jako alarm, jak i jako odliczenie.

seg-6c06de24ebfe = Zaokrąglenie jest w górę od połowy (<c1/>), pasmo jest pasmem wskaźnika zaokrąglonego, a ograniczenie następuje przed zaokrągleniem. Na liście odliczeń znajdują się tylko monitory, których punkty są powyżej zera, z ich ilorazem i niezaokrąglonymi punktami, najpierw największe; odliczenia o równych punktach są wymieniane w kolejności nazw monitorów <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>. Monitorowi, którego test jest zaliczony lub niezaliczony (nieudane rozwiązanie, nieudane uwierzytelnianie), przypisuje się iloraz { "1.5" }, czyli pełną wagę. Wymienione punkty to te sprzed ograniczenia przy { "0" }.

seg-e36961d46c41 = Waga (punkty)

seg-673f6adcd681 = Dlaczego

seg-399be3301faf = niepowodzenie uwierzytelniania jest stwierdzeniem, a nie statystyką

seg-69cfc61477d6 = fałszywa pozycja musi przeczyć fizyce albo własnym kontrolom odbiornika, a czas nie może biec wstecz; jedno naruszenie z pełną siłą ({ "1.5" } razy próg: { "60" } punktów, wskaźnik { "40" }) jest niezaufane, a przy progu ({ "30" } punktów, wskaźnik { "70" }) zdegradowane

seg-7fa1e6e67411 = jeden niezależny czujnik, który się nie zgadza, to stan zdegradowany; dwa z pełną siłą to stan niezaufany

seg-4c4825d2957a = środowisko sygnału albo kontrola o słabej wartości informacyjnej

seg-b5a364a03714 = środowisko jest wrogie; samo to nie dowodzi, że pozycja jest błędna

seg-4e3749965405 = do { "15" }, <c1/>

seg-1e595dbcf96f = nie jest wagą na tej rampie: nic, chyba że niebo jest słabe, wtedy do <c1/> ({ "15" }); sama geometria osiąga stan zdegradowany, nigdy niezaufany, i nie wywołuje alarmu (zob. „Geometria” poniżej)

seg-9902ca062070 = Granice pasm wynikają z wag: najlżejszy monitor, który alarmuje, kosztuje { "12.5" } punktu przy swoim progu, więc każdy alarm wyprowadza z pasma nominalnego; żaden pojedynczy monitor poniżej { "60" } punktów nie może samodzielnie osiągnąć pasma niezaufanego (kilka razem może). Wynik zapisuje model wskaźnika (<c1/>), a każda epoka zawiera <c2/>: które monitory odliczyły, ich ilorazy i ich punkty. Dla statku stan epoki to pasmo jej wskaźnika.

seg-6f620668ee85 = Geometria: naturalne pogorszenie odróżnione od niespójności przypominającej atak

seg-93257d87e0d4 = Odbiornik przy suwnicy nabrzeżnej, w śluzie lub pod wysokim kadłubem traci satelity, a jego pozycja się pogarsza z powodu, który nie jest atakiem. Od { "0.36" }, zgodnie z notatką projektową geometrii (<c1/>, sekcja { "4" }), każda epoka niesie swoją <b>geometrię satelitów</b>, wskaźnik statku ma <b>monitor geometrii</b>, a każde odliczenie niesie <b>klasę</b>: <c2/> (niebo), <c3/> (środowisko sygnału) lub <c4/> (dowody przypominające atak).

seg-17d13c39b5aa = <b>Skąd pochodzi geometria.</b> Elewacja i azymut każdego śledzonego satelity (NMEA GSV, UBX NAV-SAT), z których wyprowadza się współczynnik DOP (rozmycie dokładności) za pomocą jedynego jądra DOP silnika (<c1/>, VALIDATED względem gnss_lib_py): <c2/>. W razie braku takich danych brane są DOP i użyte satelity podane przez odbiornik (NMEA GSA): <c3/>. Pozycje na niebie i GSA liczą się przez <c4/> wskaźnika (domyślnie { "10" } s), ponieważ wiele magistral wysyła GSV co kilka sekund; zestaw GSV niekompletny w epoce (koniec fragmentu, zgubione zdanie) nie jest używany. Dziennik bez żadnego z nich, taki jak NMEA tylko z GGA i RMC, albo dzienniki Android i RINEX obecnie, dostaje status <b><c5/></b> z notatką „geometry unknown”: silnik nie zgaduje geometrii, której nie otrzymał, a monitor geometrii nie działa.

seg-a267da42ac3d = dość satelitów i DOP w granicach progów

seg-dabcd392914a = jeden lub więcej powodów: <c1/>, <c2/>, <c3/> oraz (informacyjnie, nie we wskaźniku) <c4/>, gdy wszystkie śledzone satelity znajdują się w jednej połowie horyzontu

seg-c255a66d3813 = dziennik nie podaje geometrii satelitów dla tej epoki

seg-0a50145c2bfa = Status jest opisowy, a dla wskaźnika liczy się etykieta (niżej): <c1/> obejmuje informacyjny przypadek <c2/>, który może wystąpić przy dobrym lub przeciętnym DOP, a punktowana jest tylko etykieta <c3/>.

seg-93e49a562493 = <b>Etykieta</b> (zawsze podawana, nigdy punktowana). <c1/> każdej epoki to <c2/> (HDOP co najwyżej <c3/> { "2" }, PDOP co najwyżej <c4/> { "3" } i co najmniej <c5/> { "6" } satelitów), <c6/> (HDOP powyżej <c7/> { "4" }, PDOP powyżej <c8/> { "6" } albo mniej niż <c9/> { "5" } satelitów), <c10/> pomiędzy nimi albo <c11/>. Notatka epoki zawsze zaczyna się od etykiety i liczb, na przykład „geometry fair: HDOP { "1.105" }, PDOP { "1.831" }, VDOP { "1.410" }, { "8" } satellites; not scored (the score deducts only above HDOP { "4" }, PDOP { "6" } or below { "5" } satellites)”, a gdy to zachodzi, dodaje „, signal loss”.

seg-13838e036fae = <b>Monitor geometrii</b> (wskaźnik statku). Odlicza <b>nic, chyba że geometria jest słaba</b>: jego iloraz to <c1/>, a dopóki wynosi co najwyżej { "1" } (dobra lub przeciętna geometria, w tym otwarte niebo tylko z GPS i { "8" } satelitami), nic nie kosztuje, więc taki dziennik dostaje dokładnie ten sam wskaźnik co w { "0.35" }. Powyżej { "1" } odliczenie rośnie liniowo do <c2/> ({ "15" }) przy <c3/> ({ "1.5" } razy progi: HDOP { "6" }, PDOP { "9" }, { "3" } satelity): { "7.5" } punktu przy ilorazie { "1.25" } (HDOP { "5" } lub { "4" } satelity), { "15" } od { "1.5" } wzwyż (wskaźnik { "85" }, zdegradowany). Samo z siebie nigdy nie obniży wskaźnika poniżej <c4/> (domyślnie: <c5/> wskaźnika, { "55" }), więc sama geometria osiąga co najwyżej pasmo zdegradowane, a nigdy niezaufane: obowiązujące ograniczenie to <c6/>, więc tabela <c7/>, która podnosi <c8/> (na przykład taka z { "0.35" } z <c9/> { "90" }), obniża ograniczenie do <c10/> zamiast być odrzucana, a <c11/> ustawione poniżej <c12/> jest odrzucane. Monitor nie wywołuje alarmu; jest wymieniany jako ostatni w <c13/>, gdy rozstrzygnął w jakiejkolwiek epoce (statek, którego dziennik podaje geometrię), i nie wlicza się do tożsamości z { "0.35" }; nie jest wpisem <c14/> (ustawienie takiego jest odrzucane), a obowiązujące ograniczenie i dolny próg są zapisywane w <c15/> i <c16/>. Notatka słabej epoki mówi dlaczego, na przykład „geometry poor: HDOP { "5.200" }, PDOP { "7.900" }, VDOP { "4.100" }, { "7" } satellites; degraded by geometry: HDOP { "5.200" } above { "4" } (derived from { "7" } logged satellites); not an inconsistency”.

seg-2082f4ccb250 = <b>Klasy.</b> Każde odliczenie (<c1/>):

seg-4197bc517f73 = <c1/> (słaba geometria); <c2/>, gdy każdy satelita utracony względem punktu odniesienia kalibracji znajdował się przy ostatnim raporcie poniżej <c3/>

seg-e06597696553 = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, w pozostałych przypadkach <c6/>; <c7/> podczas utraty sygnału (niżej)

seg-5fc0eb79c51b = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>; oraz <c11/>, gdy geometria jest słaba, a podany HDOP nie zgadza się z podanym niebem (niżej)

seg-1b5e88a4aae4 = <b>Zabezpieczenie przed sfałszowanym słabym niebem.</b> Spoofer mógłby wysłać rzadkie GSV albo zgłosić wysoki HDOP, by kupić tolerancję. Silnik oznacza i nie wybacza: żadna inna kontrola nie jest rozszerzana z powodu słabej geometrii, a HDOP podany przez odbiornik (GSA w ramach przytrzymania, w przeciwnym razie GGA) jest porównywany z HDOP wyprowadzonym z podanego przez niego nieba. Gdy różnią się o więcej niż <c1/> ({ "1.0" } lub { "25" } % wyprowadzonego HDOP, zależnie od tego, które większe), epoka niesie <c2/>, a gdy geometria jest słaba, jej odliczenie jest klasyfikowane jako <c3/>. Przy dobrej lub przeciętnej geometrii niezgodność jest zgłaszana i nie jest punktowana: nic nie jest odliczane, chyba że geometria jest słaba. To świadomy wybór ({ "0.36" }): „zero, chyba że słaba” obowiązuje w każdej epoce, więc dobra i przeciętna geometria dostają dokładnie ten sam wskaźnik co w { "0.35" }, a sfałszowany HDOP nigdy nie przechodzi po cichu. Flaga (<c4/>) jest przy każdej epoce wyniku i każdym wierszu na żywo, notatka mówi „…beyond the tolerance: reported, not scored (the geometry is not poor)” albo „…: the geometry deduction is classed an inconsistency”, <c5/> zlicza epoki, a strona podsumowania dowodów pokazuje liczbę, także zero. Wartość { "25" } % jest <b>REPRESENTATIVE</b> wyborem inżynierskim, a nie wartością zmierzoną ani normatywną: odbiornik, który rozwiązuje jeden zegar na konstelację albo na podzbiorze śledzonych satelitów (maska elewacji, odcięcie C/N0, wykluczenie RAIM), podaje HDOP różniący się od HDOP z jednym zegarem dla wszystkich śledzonych satelitów o wartość rosnącą wraz z HDOP, więc sama stała tolerancja uznałaby naturalnie słabą geometrię za niespójność. Większa różnica nadal jest odczytywana jako niespójność. Odliczenie sklasyfikowane jako <c6/> jest stwierdzeniem o niebie, a nie ustaleniem, że atak nie nastąpił.

seg-0e729ad96db9 = <b>Utrata sygnału to nie niebo.</b> Gdy satelity, które odbiornik wymienia jako widoczne (powyżej <c1/>), nie są śledzone, silnik wyprowadza także DOP dla wszystkich satelitów widocznych. Jeśli ten DOP widocznych mieści się w progach i albo nic nie jest śledzone, albo nieśledzone satelity są rozłożone wokół horyzontu (nie ograniczają się do jego jednej połowy), to niebo było, a sygnału nie było: epoka niesie <c2/>, notatkę „satellites in view but not tracked: signal environment, not geometry”, a odliczenie geometrii jest klasyfikowane jako <c3/>. Nieśledzone satelity ograniczone do jednej połowy horyzontu nadal są odczytywane jako zasłonięte niebo (ściana, klif, nabrzeże). Przeszkoda dwustronna (kanion lub wąski fiord) jest odczytywana jako utrata sygnału, dopóki nie skonfiguruje się skyline. Znaczniki braku pozycji w odbiorniku nie są DOP: podany HDOP lub PDOP równy { "99" } lub więcej, jakość GGA { "0" } i tryb GSA { "1" } nie dają podanego DOP.

seg-0f218d21843b = Klucz <c1/>

seg-e5ec84abd61b = wybrane (notatka projektowa { "4.2" }): przy <c1/> { "1.5" } m HDOP { "4" } daje 2drms równe { "12" } m, czyli <c2/> kontroli kinematycznej. IEC 61108-1 jest powszechnie cytowana jako stawiająca wymagania dokładności dla HDOP ≤ { "4" } (lub PDOP ≤ { "6" }): przywołane z wtórnej literatury o odbiornikach GNSS, bez sprawdzenia konkretnego źródła wtórnego i bez lektury normy; do sprawdzenia względem tekstu normy

seg-d99dc0fd090a = próg dostępności PDOP z <c1/>; GPS SPS Performance Standard, wyd. 5 ({ "2020" }), PDOP ≤ { "6" }, jak cytowano w <c2/>; do sprawdzenia względem tekstu normy

seg-2fffa47378ec = o jeden więcej, niż potrzebuje rozwiązanie pozycji, więc pojedyncza utrata nie kończy rozwiązania; najmniej, przy których jest jeden pomiar nadmiarowy dla RAIM

seg-7dc0baed2bc4 = podane wejście dla łącza 2drms z <c1/>; należy ustawić własną wartość odbiornika

seg-7b5778d93d40 = { "1.0" } HDOP

seg-093cff5d1150 = wybrane (notatka projektowa { "4.2" }): część bezwzględna tolerancji; niezgodność powyżej tolerancji nie jest geometrią

seg-be5c3aefd942 = REPRESENTATIVE wybór inżynierski: część względna, dla odbiorników z zegarami dla poszczególnych konstelacji lub rozwiązaniami z podzbiorów

seg-e71c6876114b = notatka projektowa { "4.3" }: satelity utracone poniżej tej wartości są utracone na rzecz nieba; skyline ({ "0.36" }, pozycja { "1" }) to rozszerzy

seg-bebe291ca1c0 = geometryczne, informacyjne: wszystkie satelity w jednej połowie horyzontu

seg-06519582227b = notatka projektowa { "4.2" }: sama geometria przesuwa wskaźnik z nominalnego do zdegradowanego i nigdy do niezaufanego; odliczane tylko wtedy, gdy geometria jest słaba (decyzja założyciela B1, { "0.36" })

seg-be21b5a31382 = własne <c1/> wskaźnika: rampa osiąga <c2/> przy { "1.5" } razy progach słabej geometrii

seg-e922a5342a3c = <c1/> wskaźnika ({ "55" })

seg-09fe8c435ece = sama geometria nigdy nie osiąga pasma niezaufanego; obowiązujące ograniczenie to <c1/>; dolny próg poniżej <c2/> jest odrzucany

seg-a07e6ce67371 = REPRESENTATIVE, tylko etykieta: połowa <c1/> (iloraz początkowy wskaźnika { "0.35" })

seg-06db7e7af59c = REPRESENTATIVE, tylko etykieta: połowa <c1/>

seg-7e7f17d36ea4 = REPRESENTATIVE, tylko etykieta: o jeden więcej niż <c1/>, więc pojedyncza utrata nadal zostawia pomiar nadmiarowy

seg-ef7a4c24e870 = <b>Co zmieniło się w wynikach, a co nie.</b> Żaden wskaźnik się nie zmienia, chyba że geometria jest słaba; etykieta jest zawsze podawana. Dołączone klucze: <c1/> (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/> zaokrąglone do { "0.001" }, <c9/> (null, dopóki nie skonfigurowano skyline), <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/> (satelity wymienione powyżej <c16/>), <c17/>, <c18/>), <c19/> przy każdym odliczeniu, a na końcu <c20/> (progi, przytrzymanie, obowiązujące ograniczenie i dolny próg, pochodzenie, reguły klas) oraz <c21/> (epoki według statusu, etykiety i klasy odliczenia oraz epoki z niezgodnością podanego HDOP); <c22/> jest taki jak w { "0.35" }. Dwa testy wiążą to z bajtami punktu odniesienia „{ "0.36" } portable” po usunięciu tych kluczy (skróty z { "0.35.0" }, ponownie ustalone, gdy silnik przeszedł na matematykę przenośną, i zachowane w testach jako zapis tego, co wydała wersja { "0.35.0" }: <c23/>). <c24/> wiąże każde wyjście obu przykładowych sesji (wynikowy JSON, CSV, SVG, werdykt, odtworzone wiersze na żywo, <c25/>, Prometheus, CEF, LEEF). <c26/> wiąże wynik wsadowy, podsumowanie, wiersze na żywo i <c27/> każdego zatwierdzonego korpusu NMEA statku (demo i referencyjne dane testowe morskie, każdy także jako otwarte niebo tylko z GPS i { "8" } satelitami, oraz scenariusze szkoleniowe generowane z ich ziaren); w dwóch scenariuszach szkoleniowych, w których zagłuszanie pogarsza geometrię, każda epoka, która nie jest słaba, jest identyczna, a każda słaba różni się wyłącznie odliczeniem geometrii. Dziennik ze słabą geometrią traci do { "15" } punktów, których nie tracił w { "0.35" }; to zamierzona zmiana. W demo zrywanie odczytuje się jako <c28/>; <c29/> edytuje dziennik, aby zasłonić niebo zachodnie (przeciętne: oznaczone, niepunktowane), zasłonić je i dwa satelity wschodnie (słabe: odliczenia geometrii, utrata zaczepienia <c30/>, bo wysokie satelity też zniknęły), utracić tylko satelity poniżej { "15" }° (utrata zaczepienia <c31/>) oraz podać HDOP, którego niebo nie wyjaśnia (odliczenie słabej geometrii staje się <c32/>). Progi są MODELLED: wybrane, a nie dopasowane do żadnego dziennika; nic tutaj nie twierdzi, jak często w rzeczywistych danych odróżnia się naturalne pogorszenie od ataków.

seg-8ddaf82ba00b = Podawanie zdarzeń i predykcji

seg-c52c285aa308 = Dla każdego zdarzenia wynik podaje fałszywe alarmy między kalibracją a początkiem, pierwszy alarm i jego monitory, opóźnienie, rezultat (<c1/>, <c2/>, <c3/> lub <c4/>) oraz obserwowany medianowy spadek C/N0 względem predykcji (<c5/>, <c6/>, <c7/> lub <c8/>). Niezgodność jest zgłaszana, nigdy dostrajana: tolerancje są w scenariuszu, a scenariusz jest w skrócie wyniku.

seg-3715df3fd8f7 = Czego to nie twierdzi

seg-21a4b903e179 = Monitory zaufania są MODELLED: ich progi są danymi wejściowymi, a ich skuteczność detekcji dla rzeczywistych zakłóceń jest tym, co mierzy ocena zdarzeń, a nie czymś, co ten rodzaj stwierdza. W sesjach spoofingu JammerTest { "2024" } monitory ze ścieżki silnika wychwytują część początków w ciągu { "10" } s, a w innych są spóźnione; liczby podaje wiersz „Clock-aided χ², RAIM, AGC, SQM fused per-epoch security FoM” w <a1><c1/></a1>. Predykcja zgodna z jednym dziennikiem to jeden punkt danych, a nie walidacja.

seg-0c413c1a491c = <s1>Poprzednia</s1>Powiązanie z odpornością

seg-63fc2b340fd1 = <s1>Następna</s1>Zaufanie morskie
