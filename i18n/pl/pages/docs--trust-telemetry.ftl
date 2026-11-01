# docs--trust-telemetry: translations (pl)

seg-2247a2344710 = Znaczenie

seg-d4e48c972084 = Etykiety

seg-ca448daf5ec7 = nominal

seg-2672b7f55371 = z pogorszoną jakością

seg-c711c7fecbfc = Jeden wynik zaufania w trzech formatach eksportu, z prawdziwych przebiegów silnika v{ $version } (`kshana trust-telemetry`) na examples/maritime-trust: ekspozycja tekstowa Prometheus (ostatni wskaźnik zaufania to { "5.9" }, a ustawione jest pasmo niegodne zaufania) oraz ostatnie komunikaty CEF i LEEF. Polecenie niczego nie publikuje, jeśli nie podano miejsca docelowego, nie przechowuje poświadczeń i nie nadaje żadnego sygnału radiowego. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.

seg-a129b9e613d0 = Typ

seg-15fcf05d16c5 = Źródło: <c1/>

seg-05919ac6cf31 = Zaufanie do GNSS jako telemetria bezpieczeństwa

seg-8978c6508ebd = <c1/> zamienia strumień zaufania do GNSS dla każdej epoki (wskaźnik 0-100, pasmo, powody) na sygnały, które centrum operacyjne lub bezpieczeństwa już przyjmuje: metryki Prometheus, zdarzenia syslog w CEF lub LEEF dla SIEM oraz opcjonalnie OpenTelemetry. Czyta strumień; nigdy nie zmienia oceny zaufania i nie nadaje niczego poza telemetrią.

seg-14ad6b7911d6 = Wejściem jest schemat JSON-lines na żywo v1.1, opisany w <c1/>. Odczytywane: <c2/>; <c3/> (<c4/>, pasmo); <c5/> (0-100 lub null); <c6/> (czas epoki w podanej postaci); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> lub null); powody to monitory w <c13/>, a potem wszelkie dalsze w <c14/>; od schematu { "1.3" } także <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) oraz <c20/> każdego odliczenia. Pozostałe klucze są ignorowane, ponieważ schemat rośnie wyłącznie przez dopisywanie kluczy. Linia, która się nie parsuje, jest liczona w <c21/> i pomijana; wyniki poza zakresem 0-100 są odrzucane, a nie przycinane, aby zmiana formatu była zauważona. Jedynym kodem, który zna ten format, jest <c22/>.

seg-2c94f3717f82 = <c1/> jest serwowane bez uwierzytelniania i domyślnie nasłuchuje na <c2/>. Powiązanie z innym adresem wypisuje ostrzeżenie; umieść je za własną kontrolą dostępu. Punkt końcowy obsługuje jedno połączenie naraz z limitem odczytu { "2" } s, więc bezczynny klient może opóźnić pobranie nawet o tyle; jest przeznaczony dla jednego skrobacza, a nie dla otwartej sieci.

seg-7e66e43f15a8 = Home Assistant i urządzenia NTP (MQTT)

seg-fbe56ff7f1ed = <c1/> drukuje, a <c2/> publikuje dokument stanu JSON i komunikaty wykrywania MQTT dla Home Assistant. Wykrywanie (zachowywane, pod <c3/>) tworzy trzy encje: wskaźnik zaufania, pasmo zaufania (z powodami jako atrybutami) i czujnik problemu <c4/>. Dokument stanu trafia do <c5/> (domyślnie <c6/>, zachowywany): <c7/>, <c8/> (null, gdy brak), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> i oświadczenie doradcze; pozycja nigdy nie jest dołączana. Opcje: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = Wydawca mówi MQTT { "3.1.1" } z QoS { "0" } i czyta tylko CONNACK brokera. Nie ma poświadczeń ani TLS, więc użyj brokera w sieci lokalnej (lub lokalnego przekaźnika, który je dodaje). Dostarczanie działa we własnym wątku za kolejką o długości { "1024" }: martwy broker powoduje porzucanie wiadomości, które są liczone i zgłaszane na końcu, i nigdy nie blokuje strumienia. Urządzenie NTP lub dowolny inny odbiorca, który chce zwykłego JSON, może czytać tę samą linię stanu. Nic nie jest zapisywane do odbiornika ani zegara. Python, WebAssembly i MCP przyjmują <c1/> i zwracają te same linie <c2/> (nic tam nie jest publikowane).

seg-ed95ebb0ba1b = Z Pythona, WebAssembly i MCP

seg-93be007cdfda = Kodery są też dostępne jako wywołania tekst na wejściu, tekst na wyjściu, bez procesu, gniazda i zegara: Python <c1/>, eksport WebAssembly <c2/> i narzędzie MCP <c3/> (polecenie wtyczki <c4/>). <c5/> to <c6/>, <c7/>, <c8/> lub <c9/>; <c10/> to <c11/> (strumień) lub <c12/> (wynik wsadowy). Zwracają ten sam tekst, który drukuje wiersz poleceń (<c13/>, <c14/>), z tymi samymi limitami: wiersze syslog nie mają znacznika czasu, <c15/> ma co najwyżej { "255" } drukowalnych znaków ASCII bez spacji (w przeciwnym razie jest odrzucane, tu i w wierszu poleceń), a odpowiedź większa niż limit powierzchni ({ "4" } MiB w MCP) jest odrzucana, ponieważ CEF i LEEF z <c16/> zapisują jedno zdarzenie na epokę. Nic nie jest wysyłane, serwowane ani zapisywane; działające eksportery pozostają procesem w wierszu poleceń.

seg-f8c367611a9e = Dostarczanie nigdy nie blokuje oceny

seg-3853bb63c7ad = Dostarczanie syslog i OpenTelemetry działa we własnych wątkach. Pętla wczytywania tylko przekazuje im wiadomość lub migawkę i nigdy nie czeka, więc martwy, wolny lub niereagujący kolektor nie może wywołać przeciwciśnienia na strumieniu na żywo ani zamrozić <c1/>:

seg-589d02c31dfe = każde połączenie i zapis mają limit { "2" } s; nieudane połączenie jest porzucane i nawiązywane ponownie leniwie, z wykładniczym wycofywaniem od { "1" } s do { "60" } s;

seg-3c272ded25a3 = wiadomość, której nie da się dostarczyć (kolektor nie działa, przekroczono czas zapisu, kolejka { "1024" } pełna), jest porzucana i liczona w <c1/>; ustaw alert na jej częstość;

seg-4a7cd2065731 = eksporter OpenTelemetry dostaje kopię rejestru, więc podczas operacji sieciowych nie jest trzymana żadna blokada; jeśli eksport wciąż trwa, nowa migawka jest pomijana (następna niesie te same sumy skumulowane).

seg-57c3bbe405c8 = Po końcu wejścia wątki nadawcze dostają pozostały czas limitów na dokończenie.

seg-14c13ed8c509 = Metryki Prometheus

seg-d060b2163513 = Metryka

seg-45c41bf74eb8 = gauge

seg-e43a6814d13c = stała { "1" }

seg-3662d2b8a789 = ostatni wskaźnik 0-100; brak, jeśli źródło go nie podaje

seg-1c50874472fc = { "1" } dla bieżącego pasma, { "0" } dla pozostałych

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } dla bieżącego stanu, { "0" } dla pozostałych; brak bez bramki

seg-3e01cab63c59 = pozycja zgłoszona przez odbiornik; <b>tylko z <c1/></b> (punkt końcowy jest nieuwierzytelniony, a pozycja może zidentyfikować miejsce lub statek)

seg-280a5ca2e5d9 = { "1" }, jeśli występuje w ostatniej epoce

seg-22ded4fe7f29 = licznik

seg-800b23c30e2f = odebrane epoki

seg-be11849d8a9b = epoki, w których wystąpił powód

seg-0475fe7b26ba = nieparsowalne linie wejścia

seg-65f1db183cbc = wystąpienia powodów zwinięte do <c1/> (zob. niżej)

seg-e756633e7d5c = niedostarczone zdarzenia syslog

seg-2de3258f83ee = przesunięcie ostatniej epoki od początku strumienia

seg-c02fe207663e = czas odbioru według zegara ściennego; ustaw alert na jego wiek

seg-67d5bbbde75a = geometria satelitów w ostatniej epoce, <c1/>, <c2/>, <c3/>: { "1" } dla bieżącej <em>(dane wejściowe ze schematu { "1.3" })</em>

seg-4878afc243e3 = { "1" } degraded, { "0" } good; brak, gdy geometria jest nieznana

seg-c21f54522128 = { "1" }, gdy widoczne satelity nie są śledzone, mimo że ich geometria jest dobra (utracono sygnał, a nie niebo; <c1/> nadal wskazuje { "1" }), w przeciwnym razie { "0" }; brak, gdy geometria jest nieznana lub wejście o tym nie mówi

seg-db29584bb51c = HDOP, PDOP i liczba użytych satelitów w ostatniej epoce; każda wartość nieobecna, gdy jej brak

seg-c60ca4530e92 = epoki według statusu geometrii

seg-fd6bf7764eca = etykieta geometrii w ostatniej epoce, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } dla bieżącej; nigdy nie jest oceniana (wskaźnik odejmuje punkty tylko dla <c5/>); z danych wejściowych, które niosą etykietę ({ "0.36" })

seg-d6f04ef7adfb = VDOP w ostatniej epoce; brak, gdy go nie ma

seg-cb8feee01192 = <b>Etykieta geometrii jest najważniejsza.</b> Rysuj wykresy i ustawiaj alerty na <c1/> (OTLP <c2/>, CEF trzecie pole <c3/>, LEEF <c4/>): <c5/> to jedyna etykieta, za którą wskaźnik odejmuje punkty. Status geometrii jest opisowy: <c6/> obejmuje informacyjny przypadek <c7/>, który może występować przy dobrym lub średnim DOP, więc nie wywołuj alarmu na samym <c8/>.

seg-70343708da03 = Od danych wejściowych schematu { "1.3" } <c1/> niesie też etykietę <c2/> (<c3/>, <c4/>, <c5/>) przy każdym powodzie, który ją miał: klasa odliczenia w ostatniej epoce. Serie geometrii następują po wszystkich pozostałych i tylko gdy epoka wejściowa niesie <c6/> (schemat na żywo { "1.3" }, wynik z silnika { "0.36" } lub nowszego), więc strumień lub wynik { "0.35" } jest renderowany bajt po bajcie tak jak dawniej. Wartości etykiet są ustalonymi zbiorami (nieznany status daje <c7/>; nieznana klasa jest odrzucana). Ustaw alert na <c8/>, a nie tylko na pasmo, aby słabe niebo nie wywoływało alarmu jak atak; klasa <c9/> to stwierdzenie o niebie, a nie ustalenie, że nie doszło do ataku (zob. <c10/>).

seg-3f45b21003d5 = Etykieta <c1/> jest częścią tożsamości serii: gdy klasa powodu zmienia się między epokami (<c2/> z <c3/> na <c4/>, gdy utracone satelity były nisko, albo <c5/> na <c6/>, gdy podany HDOP nie zgadza się z podanym niebem), stara seria nie jest już eksportowana i zaczyna się nowa. Zapytaj według <c7/> z <c8/>, gdy klasa nie ma znaczenia, i spodziewaj się, że taka zmiana wygląda jak zakończenie jednej serii i początek drugiej. Serie schematu { "1.3" }, etykieta <c9/> i pola geometrii CEF/LEEF są sprawdzane własnymi testami silnika i wyroczniami CEF (pycef, Logstash); zewnętrzne wyrocznie Prometheus i OTLP nie mają jeszcze strumienia { "1.3" }.

seg-17ca55cea260 = Nazwy powodów są obcinane do { "128" } znaków, a co najwyżej { "64" } różnych powodów dostaje własną serię; dalsze są liczone pod <c1/> i w <c2/>, więc wrogie lub błędne wejście nie może wytworzyć nieograniczonej liczności etykiet.

seg-35f3faf39d1c = <c1/> to jedno z <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Nazwy powodów to nazwy monitorów strumienia (<c7/>, <c8/>, ...; dla wyniku wsadowego <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = Przykładowy pulpit jest w <c1/> (zaimportuj go i wybierz swoje źródło danych Prometheus).

seg-208f33eda580 = Syslog: CEF i LEEF

seg-0d53db66a990 = Zdarzenia są wysyłane w kopercie RFC { "5424" } (facility local0, aplikacja <c1/>, identyfikator wiadomości <c2/>) przez UDP (jeden datagram na zdarzenie; IPv4 lub IPv6) albo TCP, domyślnie zakończone znakiem nowej linii lub, z <c3/>, w ramce <c4/> jak w RFC { "6587" }. Domyślnie wysyła się jedno zdarzenie na zmianę pasma; <c5/> wysyła jedno na epokę. Dostawca jest zapisywany jako <c6/> (ASCII), aby żaden SIEM nie zdekodował go błędnie.

seg-9cb6e1b9fec0 = Pojęcie

seg-9e4ce52ac5d9 = Waga syslog

seg-084d2e726d3f = Waga CEF

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = calibrating

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } warning

seg-f757a767bd4a = untrusted

seg-8e4e2d9142f9 = { "2" } critical

seg-4c5b832482cb = unknown

seg-5e4f3b0222cd = { "5" } notice

seg-b07ec4ccabf7 = Mapowanie pól (identyfikator zdarzenia to <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (ogranicznik <c1/>)

seg-18a4ca402cd9 = kategoria

seg-d3bc36a445cb = host wysyłający

seg-521cea5013c8 = pasmo

seg-2b9153eb068d = <c1/> (etykieta <c2/>)

seg-f1be6ef87011 = powody, oddzielone przecinkami

seg-e77a9847bc7b = poprzednie pasmo

seg-87b7f1652b0c = wskaźnik

seg-470a89a86d79 = <c1/> (<c2/>), pomijane, jeśli brak

seg-fc2aebb988bf = przesunięcie epoki, s

seg-9f9d0d551742 = etykieta czasu logu

seg-57ed10b00272 = stan bramki

seg-7159f151c079 = status geometrii, następnie <c1/> i klasy odliczeń epoki, oddzielone przecinkami (na przykład <c2/>) <em>(dane wejściowe { "1.3" })</em>; z danych wejściowych, które niosą etykietę ({ "0.36" }), trzecie pole, <c3/> i etykieta, przy czym pole klas jest wtedy zawsze obecne (na przykład <c4/>, <c5/>)

seg-973339622a60 = <c1/> (tylko status), <c2/> (klasy) i <c3/> (etykieta)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, z etykietą)

seg-e0a712018ced = VDOP <em>({ "0.36" }, z etykietą)</em>

seg-42273c09a591 = niesione: nie; zajęte są cztery niestandardowe pola zmiennoprzecinkowe

seg-292efe9557d6 = liczba użytych satelitów <em>({ "0.36" }, z etykietą)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), liczba całkowita

seg-f69551c20173 = utrata sygnału: widoczne satelity nie są śledzone, mimo że ich geometria jest dobra

seg-bb927aab7541 = nie jest niesione jako pole (żaden klucz słownika CEF nie jest wolny): status to <c1/>, a klasa odliczenia geometrii to <c2/> w <c3/>

seg-6a80d53b2163 = <c1/>, tylko gdy zachodzi

seg-1f099d4ef4b6 = W CEF geometria używa wyłącznie niestandardowych pól ze słownika (żadnych wymyślonych kluczy); etykieta jedzie w <c1/>, a nie w <c2/>, ponieważ kodek CEF w Logstash nie mapuje pól <c3/>. Zdarzenia geometrii { "1.3" }, w tym przypadki z etykietą, są częścią wiersza CEF o poziomie VALIDATED: oba parsery wyroczni odczytują je z powrotem tak, jak zapisano (<c4/>, poprawki { "4" } i { "5" }, każda zarejestrowana, zanim któryś parser uruchomiono na jej przypadkach). Pola etykiety, VDOP i liczby satelitów są dopisywane po wszystkich wcześniejszych polach i seriach i tylko dla danych wejściowych, które niosą etykietę, więc wejście bez niej renderuje się dokładnie tak jak dawniej.

seg-b295bf5bac3e = Puste pola są pomijane (bez <c1/>, gdy nie ma powodów). Nazwa hosta jest obcinana do { "255" } znaków. Wartości nagłówka CEF poprzedza się znakiem ucieczki dla <c2/> i <c3/>; wartości rozszerzeń dla <c4/>, <c5/> i podziałów wierszy. W wartościach LEEF <c6/> i podziały wierszy są zastępowane spacjami.

seg-a3b77e9593eb = OpenTelemetry (domyślnie wyłączone)

seg-396c34d29783 = Zbuduj z <c1/> i podaj <c2/>. Eksporter wysyła metodą POST JSON OTLP/HTTP (<c3/>, <c4/>, <c5/>, <c6/> oraz dla danych wejściowych schematu { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> i, z danych wejściowych, które niosą etykietę ({ "0.36" }), <c13/> (atrybut <c14/>) i <c15/>; sumy skumulowane niosą <c16/>) co <c17/> epok (domyślnie { "10" }) i na końcu wejścia. Nie dodaje żadnej zależności i nie ma TLS: wysyłaj do kolektora na tym samym hoście lub w zaufanym segmencie, który przekazuje dane dalej przez TLS. Punkty końcowe <c18/> są odrzucane.

seg-c3111d73a8b0 = <s1>Poprzednia</s1>Geometria nieba i skylines

seg-4c539b667a05 = <s1>Następna</s1>Weryfikacja Galileo OSNMA
