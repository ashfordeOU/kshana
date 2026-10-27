# docs--interop: translations (pl)

seg-f2ce7fc60cdf = Format

seg-f917e7fcac09 = Czym jest

seg-cae10fb9bff8 = Scenariusz

seg-8c718f7f9f5d = SigMF

seg-b03d56f501c3 = Rodzaj

seg-357c2320b43a = tak

seg-c8c964a11462 = Źródło: <c1/>

seg-881ec6f8fbe0 = Przebieg zapisuje dokument wyniku, wykres i raport. <c1/> zapisuje też geometrię scenariusza lub jego zsyntezowany sygnał w formatach, które inne narzędzia już czytają: przeglądarka globusa, mapa na komputerze, system informacji geograficznej (GIS), pakiet do analizy misji lub narzędzie radia definiowanego programowo (SDR). Nic tu nie odczytuje zegara ani sieci, a żaden eksport nie zawiera znacznika czasu wygenerowania, więc ten sam scenariusz daje przy każdym przebiegu identyczne bajt w bajt pliki.

seg-736f2dc67a3c = Pliki są zapisywane obok scenariusza i nazywane jak dokument wyniku: <c1/>, <c2/>, <c3/>, jeden <c4/> na każdy obiekt ruchomy (lub <c5/>, gdy jest jeden) oraz para <c6/> / <c7/>. Z <c8/> przyjmują nazwę badania, podobnie jak pozostałe wyniki.

seg-21d3fba059d5 = Format wskazany jawnie, który nie ma zastosowania do scenariusza, jest błędem wypisującym powód; przy <c1/> powód jest wypisywany, a format pomijany. Punkty wejścia biblioteki to <c2/>, <c3/> i <c4/>; przyjmują tekst scenariusza i zwracają bajty, bez dotykania pliku, więc działają także w kompilacji WebAssembly. Serwer Model Context Protocol (MCP) udostępnia te same trzy jako narzędzia <c5/>, <c6/> i <c7/> (zob. <c8/>).

seg-77200201db88 = Kod: <c1/> (<c2/> buduje jeden opis geometryczny scenariusza, a <c3/>, <c4/>, <c5/> i <c6/> go zapisują), <c7/> i <c8/> dla sygnału. Testy: <c9/>.

seg-f13ab6bb2e47 = Formaty

seg-fc52229b569c = Przestrzegana specyfikacja

seg-3f237c8956eb = Cesium Language: tablica JSON (JavaScript Object Notation) pakietów ze znacznikami czasu, czytana przez CesiumJS

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, standard Open Geospatial Consortium (OGC), czytany przez Google Earth i większość narzędzi GIS; ślady ze znacznikami czasu używają rozszerzenia Google <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (przestrzeń nazw schematu <c1/>; przestrzeń nazw rozszerzenia <c2/>)

seg-4cfac7667dbc = JSON geograficzny, Request for Comments (RFC) { "7946" } Internet Engineering Task Force (IETF)

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = plik efemeryd Ansys Systems Tool Kit (STK), w formie czas–pozycja–prędkość <c1/>

seg-a2284e8c0034 = Signal Metadata Format: plik metadanych JSON i surowy plik zespolonych próbek fazowych i kwadraturowych (IQ)

seg-b38ee3ebd012 = Co zawiera każdy plik

seg-7d873bc11593 = Każdy format geoprzestrzenny jest zapisywany z tej samej sceny, więc nie mogą się różnić co do tego, gdzie cokolwiek się znajduje. Scena ma do czterech rodzajów obiektów:

seg-1fc686f6a7ea = <b>Obiekty ruchome</b>: satelity oraz platforma użytkownika, gdy się porusza, próbkowane na własnej siatce czasu scenariusza za pomocą propagatorów, których używa przebieg danego rodzaju.

seg-3db28cb6adc5 = <b>Stanowiska stałe</b>: odbiornik, stacja naziemna, zagłuszarka lub początek lokalnego układu nawigacyjnego.

seg-0def04909935 = <b>Ślady bez czasu</b>: punkty trasy, które przelatuje rodzaj alternatywnego pozycjonowania, nawigacji i czasu (PNT) oparty na terenie, grawitacji lub połączony. Te rodzaje nie mają osi czasu, więc ślady jej nie niosą.

seg-e14d49ae7330 = <b>Zasięgi zagłuszarki</b>: dla rodzaju <c1/> dwa okręgi wokół zagłuszarki: zasięg naziemny, wewnątrz którego satelita w zenicie (najsilniejszy) spada poniżej progu śledzenia, więc każdy satelita jest tracony, oraz zasięg, wewnątrz którego to samo dotyczy satelity na masce elewacji (najsłabszego), więc śledzenie zaczyna zawodzić. Oba pochodzą z własnych równań łącza danego rodzaju (Kaplan i Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), wyd. 3, §{ "9.4" }) przy zagłuszarce na horyzoncie odbiornika i stracie w wolnej przestrzeni, a zestaw testów sprawdza, że efektywny stosunek nośnej do gęstości szumu przy każdym promieniu jest równy progowi z dokładnością do { "1e-6" } dB. Okrąg jest rysowany na sferze o średnim promieniu Ziemi.

seg-e1dd97c47993 = Pierwszy pakiet to pakiet dokumentu (<c1/>, <c2/>) z zegarem obejmującym siatkę czasu. Każdy obiekt ruchomy to pakiet, którego <c3/> ma epokę <c4/> w ISO { "8601" } (format daty i czasu Międzynarodowej Organizacji Normalizacyjnej) UTC (uniwersalny czas koordynowany), <c5/> <c6/> oraz próbki <c7/> <c8/>: sekundy po epoce, metry w Geocentrycznym Niebieskim Układzie Odniesienia (GCRS). CesiumJS traktuje <c9/> jako Międzynarodowy Niebieski Układ Odniesienia (ICRF), którego osie GCRS dzieli. Stanowiska stałe i środki zasięgów to stałe pozycje <c10/> związane z Ziemią z <c11/> <c12/>. Zasięg to <c13/> z obiema półosiami równymi jego promieniowi; ślad bez czasu to przylegająca do terenu <c14/>. <c15/> każdego pakietu ponownie opisuje układ słowami.

seg-be6362f4c7e7 = Jeden <c1/> z jednym <c2/> na klasę obiektów. Obiekt ruchomy to <c3/> zawierający <c4/>: jeden <c5/> na próbkę (ISO { "8601" } UTC), a następnie jeden <c6/> na próbkę (długość, szerokość, wysokość). Stanowiska to <c7/>, zasięgi to <c8/>, których pierścień jest zamknięty i skierowany przeciwnie do ruchu wskazówek zegara, ślady bez czasu to <c9/>. Współrzędne to długość i szerokość geograficzna w World Geodetic System { "1984" } (WGS { "84" }) w stopniach dziesiętnych oraz wysokość w metrach nad elipsoidą WGS { "84" }, zapisane z <c10/> <c11/>. KML odczytuje <c12/> jako wysokość nad średnim poziomem morza; różnica, czyli undulacja geoidy, mieści się w około ±{ "110" } m i nie jest uwzględniana. Opis dokumentu o tym mówi.

seg-37dc14626a6c = Jeden <c1/>. Pozycje to <c2/> lub <c3/>, najpierw długość, jak wymaga RFC { "7946" }, w stopniach WGS { "84" }, z wysokością w metrach nad elipsoidą. Obiekt ruchomy to <c4/> z właściwością <c5/> zawierającą jeden czas ISO { "8601" } na pozycję; ślad przekraczający południk { "180" }° jest zapisywany jako <c6/> przecięty w tym miejscu, jak wymaga RFC { "7946" } §{ "3.1.9" } (punkt przecięcia jest interpolowany, a <c7/> wylicza wtedy tylko próbki oryginalne). Stanowiska to <c8/>, zasięgi to <c9/> z zamkniętym zewnętrznym pierścieniem skierowanym przeciwnie do ruchu wskazówek zegara (§{ "3.1.6" }), ślady bez czasu to <c10/>. Każdy obiekt ma właściwość <c11/> nazywającą jednostkę każdego członu liczbowego.

seg-ea28a2bd431c = Jeden plik na obiekt ruchomy, ponieważ efemerydy STK opisują jeden pojazd. Nagłówek podaje <c1/> (równe liczbie wierszy danych), <c2/> (UTC, <c3/>), <c4/> z <c5/>, <c6/>, <c7/> i <c8/>; wiersze pod <c9/> to sekundy po epoce, pozycja w metrach i prędkość w metrach na sekundę, w GCRS. Scena zawierająca tylko stanowiska stałe lub ślady bez czasu nie zapisuje pliku <c10/>: punkt stały to STK Facility, a nie efemerydy. Identyfikator, który nie jest zwykłą częścią nazwy pliku (powłoka konstelacji i satelita, <c11/>), jest zapisywany z każdym innym znakiem jako <c12/>, z numerowaniem, jeśli dwa identyfikatory by się wtedy pokryły.

seg-52a78be5db9f = Rodzaj <c1/> i rodzaj <c2/> (przez etap <c3/>) eksportują każdego satelitę na niskiej orbicie okołoziemskiej (LEO) i użytkownika z własnych propagatorów i siatki czasu danego rodzaju. Rodzaj działa w ECI0, geocentrycznym układzie inercyjnym wyrównanym z układem związanym z Ziemią w epoce; każda próbka jest przekształcana do układu związanego z Ziemią w swojej własnej chwili przez rotację Ziemi danego rodzaju, a stamtąd do GCRS przez układ true equator, mean equinox (TEME), w którym propagator Simplified General Perturbations { "4" } (SGP4) podaje wyniki, w tej samej chwili, przy UT1 (czas uniwersalny, kąt obrotu Ziemi) przyjętym jako równy UTC i pominiętym ruchu bieguna, jak w pozostałych eksportach. Pozostałe rodzaje LEO podają powód, dla którego format nie ma zastosowania (tabela poniżej).

seg-b134baf33fba = <c1/> eksportuje każdy scenariusz członkowski, który ma geometrię, jako osobny zestaw plików, z etykietą członka wstawioną przed przyrostkiem formatu: każdy przebieg fazy (<c2/>, lub <c3/>, gdy faza ma kilka przebiegów), scenariusz bazowy przeglądu (<c4/>), scenariusz Monte Carlo (<c5/>) i każdy złożony członek (jego etykieta, z zapisanymi wartościami wspólnymi, które wiąże). <c6/> zapisuje <c7/> i <c8/>. Członek identyczny z wcześniejszym jest zapisywany raz, a wartości, które kampania stosuje w czasie działania (przekazania, wartości przeglądu, ziarna), nie występują w eksportowanym członku. Format ma zastosowanie do kampanii, gdy ma zastosowanie do któregokolwiek członka; w przeciwnym razie powód podaje przypis { "4" } tabeli poniżej. Zob. <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = Migawka <c2/> rodzaju <c1/>: modelowane pasmo L narysowane jako zespolone próbki w jednej chwili, jako para <c3/> / <c4/>, w typie danych, który nazywa <c5/> (<c6/> lub <c7/>). Jest to to samo nagranie, które przebieg zapisuje i odczytuje z powrotem na potrzeby własnej kontroli spójności: wyeksportowane metadane są równe blokowi <c8/> dokumentu wyniku, a plik danych ma długość <c9/>. Zapisuje je <c10/>, moduł, którego rodzaj <c11/> już używał; nic nie jest duplikowane.

seg-6e7c5f0e34f3 = Układy odniesienia i czas

seg-01d1bedb0595 = Silnik propaguje w TEME (true equator, mean equinox of date), swoim układzie natywnym. Obiekty ruchome są obracane do GCRS redukcją <c1/> (precesja IAU { "2006" } i nutacja IAU 2000B, gdzie IAU to Międzynarodowa Unia Astronomiczna), która odtwarza opublikowany przykład Vallado TEME–GCRF (Geocentric Celestial Reference Frame) z dokładnością { "0.11" } m, dla CZML i STK, a do układu związanego z Ziemią przez <c2/> dla KML i GeoJSON. Rotacja do układu związanego z Ziemią to średni kąt gwiazdowy Greenwich przy UT1 przyjętym jako równy UTC i niestosowanym ruchu bieguna: ta sama redukcja, której używa eksport SP3 (Standard Product { "3" }). Przy promieniu orbity GPS pominięta różnica UT1−UTC do { "0.9" } s przesuwa długość geograficzną satelity o do około { "1.7" } km; stanowiska naziemne nie są dotknięte, ponieważ są podane w szerokości i długości geograficznej.

seg-4eaa7b3e6946 = Rodzaj <c1/> jest wyjątkiem: jego wynik z silnika już niesie pozycje w GCRS i w układzie związanym z Ziemią (z UT1−UTC i ruchem bieguna scenariusza lub z rzeczywistej serii Międzynarodowej Służby Ruchu Obrotowego Ziemi i Układów Odniesienia (IERS)), i są one zapisywane bez zmian.

seg-2299da743a4c = Każdy czas jest w UTC. Sekundy przestępne nie są modelowane: przesunięcie przez sekundę przestępną jest liczone tak, jakby każdy dzień miał { "86 400" } s, tak jak liczą siatki czasu silnika.

seg-4f7a0b8b4358 = Epoka <c1/> jest tą, której używa przebieg danego rodzaju, a każdy plik ją podaje: <c3/> rodzaju <c2/>; gdy go brak, najwcześniejsza epoka, jaką niosą własne dane satelitów (epoka dwuwierszowego zestawu elementów orbitalnych (TLE), czas odniesienia efemeryd rozgłaszanych, początek pliku SP3), i 2000-01-01T00:{ "00" }:00Z tylko wtedy, gdy żaden satelita jej nie niesie (elementy keplerowskie). Eksporty SP3 i OEM (Orbit Ephemeris Message) zachowują 2000-01-01T00:{ "00" }:00Z dla scenariusza bez <c4/>, więc dla takiego scenariusza ich daty różnią się od dat tych plików. Bez <c5/> scenariusza każdy satelita, który niesie własną epokę, jest obracany do GCRS i układu związanego z Ziemią w swojej własnej chwili (jego epoka plus <c6/>), ponieważ do tej daty należy jego pozycja TEME; tam, gdzie epoki satelitów się różnią, wspólne znaczniki czasu podążają za założeniem silnika, że każdy satelita startuje w <c7/>, a plik podaje, o ile godzin się różnią. Epoka elementów SGP4 konstelacji Walkera rodzajów <c8/> i <c9/> (2018-06-12T00:{ "00" }:00Z), której ich przebiegi używają także do rotacji Ziemi; <c11/> rodzaju <c10/>; <c13/> rodzaju <c12/> lub epoka TLE. Rodzaj <c14/> nie ma epoki kalendarzowej; jego eksport datuje <c15/> jak dla scenariusza orbity bez niej.

seg-ee8eeb47f41b = Satelity zachowują identyfikatory pozycyjne <c1/>, <c2/>, ..., które nadają im eksporty SP3 i OEM, ponieważ propagatory nie niosą wierszy nazw TLE.

seg-0491624c5f12 = Importy

seg-798f3ae1b77d = Trasa GeoJSON.

seg-2a04d7d4bafc = <c1/> (biblioteka: <c2/>) odczytuje pierwszy <c3/> dokumentu GeoJSON (samodzielną geometrię, <c4/> lub <c5/>) i zapisuje go w wejściach śladu rodzajów <c6/>, <c7/>, <c8/> i <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>) przed przebiegiem. Te rodzaje lecą po <c15/>, więc trasa jest przyjmowana, gdy jest dokładnie taka: jej dwa końce (liczba <c16/> scenariusza jest zachowana) albo trzy lub więcej pozycji rozmieszczonych równomiernie na prostej w szerokości i długości geograficznej, z dokładnością do { "1e-7" } stopnia (około { "1" } cm). Każda inna trasa jest odrzucana, a błąd wskazuje pozycję najbardziej oddaloną od prostej. Trasa dla rodzaju bez wejścia trajektorii jest odrzucana z tym powodem. Długość i szerokość geograficzna są sprawdzane pod kątem zakresu, co wychwytuje plik z szerokością na pierwszym miejscu.

seg-be9fddebd47a = <b>Nagranie SigMF.</b> Blok <c2/> rodzaju <c1/> czyta parę <c3/> / <c4/> przez <c5/> i rysuje jej estymatę Welcha obok modelu (zob. <a1>SPECTRUM.md</a1>). Odczyt plików jest funkcją kompilacji natywnej; kompilacja WebAssembly przyjmuje bajty przez <c6/>.

seg-f1ca9cee1065 = Jak sprawdzane są eksporty

seg-afe73c19e369 = <c1/> parsuje każdy eksport walidatorem napisanym na podstawie specyfikacji formatu, a nie kodem samego zapisującego:

seg-bdc892a450c0 = CZML: tablica JSON, której pierwszy pakiet to pakiet dokumentu z <c1/>; unikalne identyfikatory pakietów; każda pozycja podaje <c2/> <c3/> lub <c4/>; pozycje próbkowane to <c5/> z epoką ISO { "8601" } i rosnącymi czasami.

seg-a28abb42c103 = KML: poprawnie sformowany dokument XML (Extensible Markup Language) w przestrzeni nazw OGC KML { "2.2" } z jednym obiektem głównym; kolejność elementów schematu wewnątrz Placemark; co najwyżej jedna geometria na Placemark; zamknięte pierścienie liniowe z czterech lub więcej pozycji; krotki <c1/> w zakresie; prawidłowe wartości <c2/>; <c3/>, które da się rozwiązać; <c4/> z tyloma <c5/> co <c6/> oraz zadeklarowana przestrzeń nazw rozszerzenia.

seg-8e0f4e4c2309 = GeoJSON: najpierw długość i w zakresie, szerokość w zakresie, dwie lub trzy liczby na pozycję, linie z dwóch lub więcej pozycji, zamknięte zewnętrzne pierścienie skierowane przeciwnie do ruchu wskazówek zegara, brak odcinka przez południk { "180" }°, brak członu <c1/>, właściwość <c2/> w każdym obiekcie.

seg-57bf7f9291e1 = STK: wiersz wersji <c1/>, blok <c2/> / <c3/> z wymaganymi słowami kluczowymi, <c4/>, <c5/> równe liczbie wierszy danych, siedem liczb na wiersz, rosnące czasy.

seg-e474c11480d8 = SigMF: <c1/> i <c2/> w tablicach <c3/>, <c4/> i <c5/>, <c6/> w każdym przechwyceniu oraz plik danych złożony z całych próbek.

seg-82b7b39e7cad = Poza strukturą satelita wyeksportowany do CZML i STK jest porównywany z własnym stanem silnika po tej samej redukcji układu i zgadza się z dokładnością { "1" } mm w pozycji (pliki niosą { "0.1" } mm): względem własnego wyniku GCRS rodzaju <c1/> oraz względem niezależnej propagacji TEME–GCRS konstelacji <c2/>, przy czym każdy satelita jest datowany własną epoką TLE odczytaną z tekstu scenariusza. Dwie kontrole wychodzą poza silnik: pozycje CZML pierwszego satelity <c3/> zgadzają się z dokładnością { "0.1" } m (zmierzono { "2.3" } cm) z tym samym TLE propagowanym pakietem Pythona <c4/> i zredukowanym do GCRS przez ERFA (Essential Routines for Fundamental Astronomy, otwartą implementację biblioteki SOFA IAU), a pozycje satelitów <c5/> w układzie związanym z Ziemią są równe pozycjom z efemeryd rozgłaszanych według specyfikacji interfejsu Global Positioning System z dokładnością { "1" } mm. Pozycje eksportu <c6/> w układzie związanym z Ziemią są porównywane z pozycjami, które ocenia przebieg zagłuszania, z dokładnością { "5" } mm. Trasa GeoJSON przechodzi cykl w obie strony przez scenariusz śladu, para SigMF odczytuje się z powrotem do tych samych bajtów, a każdy eksport jest deterministyczny co do bajtu.

seg-20fbf9a3fba7 = Są to kontrole względem opublikowanych specyfikacji i względem samego silnika. Pliki nie były wczytywane do CesiumJS, Google Earth, Ansys STK ani narzędzia SDR w ramach zestawu testów, więc akceptacja przez konkretną wersję tych narzędzi nie jest tu testowana.

seg-7349c09206ac = Wymiana danych o orbicie, orientacji i jądrach (biblioteka, { "0.36" })

seg-d5e34188aa96 = Obok formatów <c1/> wersja { "0.36" } dodała biblioteczne czytniki i zapisywacze standardowych plików wymienianych przez narzędzia do analizy misji. Przyjmują i zwracają tekst lub bajty i nie dotykają plików. Każdy z nich to wiersz VALIDATED w <a1>macierzy weryfikacji</a1>, względem niezależnej implementacji wskazanej tam.

seg-cd8b6f2d43be = <b>Komunikaty danych orbitalnych CCSDS</b> (<c1/>, z <c2/> dla postaci XML): OPM, OMM i OCM w notacji klucz–wartość (KVN) i NDM/XML, według CCSDS 502.0-B-3 (OPM i OMM w wersjach { "3.0" } i { "2.0" }, OCM { "3.0" }). Sprawdzone w obu kierunkach względem Orekit: Orekit czyta pliki { -brand }, a { -brand } czyta pliki Orekit. Pozostałe ustalenia są przypięte testami.

seg-00b9fc226c06 = <b>Komunikaty danych orientacji CCSDS</b> (<c1/>, z <c2/>): AEM i APM według CCSDS 504.0-B-2, w KVN i NDM/XML. Sprawdzone względem Orekit w ten sam sposób, a rotacje rekordów względem rotacji Orekit.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): zapisywacze i czytniki segmentów NAIF SPK typów { "9" } i { "13" } (wraz z eksportem CCSDS OEM do jądra SPK) oraz typów { "3" } i { "21" } (wielomiany Czebyszewa i rozszerzone wiersze różnic), sprawdzone względem własnych czytników zestawu NAIF SPICE, aż do tożsamości bajtów. { -brand } zapisuje segmenty z podanych mu rekordów: nie dopasowuje współczynników Czebyszewa ani nie wytwarza wierszy różnic.

seg-bb97cbb1ab9f = Importer i zapisywacz CCSDS OEM oraz blok kowariancji OEM są starsze i opisano je w importach powyżej oraz w macierzy.

seg-8932eba75c68 = Geometrię eksportują tylko rodzaje z poniższej tabeli. Rodzaje, których geometria jest wyśrodkowana na Księżycu, Marsie lub innym ciele, nie są eksportowane: CZML, KML i GeoJSON opisują pozycje względem Ziemi, a to wydanie zapisuje pliki STK tylko z <c1/>, choć sam format STK dopuszcza inne ciała centralne.

seg-a0593ad77202 = <c1/>, <c2/> i <c3/> mają geometrię odniesioną do Ziemi, której to wydanie nie eksportuje; tabela podaje powód dla każdego z nich.

seg-2bb9237839f3 = Rodzaj <c1/> prowadzi swoją trajektorię w płaskiej lokalnej płaszczyźnie stycznej, więc eksportowany jest tylko początek tej płaszczyzny, a nie trajektoria.

seg-6049ab4ca3c9 = Pozycje satelitów w układzie związanym z Ziemią pomijają UT1−UTC i ruch bieguna (zob. Układy odniesienia i czas); wysokości KML są elipsoidalne, a nie nad średnim poziomem morza.

seg-4dda05aefd2b = Zasięgi zakładają propagację w wolnej przestrzeni, zagłuszarkę na horyzoncie odbiornika i kulistą Ziemię dla okręgu.

seg-2dd0656c518f = Każdy plik scenariusza

seg-e024f5c1cab1 = Co robi <c1/> dla każdego pliku w <c2/> (manifest zestawu nie jest scenariuszem i został pominięty). „yes” oznacza, że format jest zapisywany i przechodzi swój walidator; w przeciwnym razie numer wskazuje powód. Generowane przez <c3/>; <c4/> kończy się niepowodzeniem, gdy jest nieaktualny.

seg-c27f67dfbb37 = nie [{ "1" }]

seg-3468244e2385 = nie [{ "2" }]

seg-d0cf3f74cd10 = nie [{ "3" }]

seg-62c880979169 = nie [{ "4" }]

seg-9229b499c702 = nie [{ "5" }]

seg-d9d6561c9e5b = nie [{ "6" }]

seg-7d4a6538c638 = nie [{ "7" }]

seg-f170ed4d8dca = nie [{ "8" }]

seg-1c5eb5dca942 = nie [{ "9" }]

seg-a930bb0d2e42 = nie [{ "10" }]

seg-236853169f42 = nie [{ "11" }]

seg-411e4f3aeae7 = nie [{ "12" }]

seg-34fabcbb82f2 = nie [{ "13" }]

seg-772bd344bbce = nie [{ "14" }]

seg-460fd74c7c7e = nie [{ "15" }]

seg-e1d91ce54b8b = nie [{ "16" }]

seg-f3e0486f02e3 = nie [{ "17" }]

seg-884160b0ed12 = nie [{ "18" }]

seg-8202f4a426b0 = nie [{ "19" }]

seg-a4e9a36289e5 = nie [{ "20" }]

seg-034364e38105 = nie [{ "21" }]

seg-3e3b6ecc7b43 = Dlaczego format nie ma zastosowania:

seg-d7bd20cb8710 = rodzaje <c1/> i <c2/> planują kontakty łącza w dół i kodowanie; wyeksportuj scenariusz <c3/> dla tego samego satelity i stacji, aby zobaczyć geometrię

seg-f587b4df1635 = SigMF przechowuje zespolone próbki pasma podstawowego, które syntetyzuje tylko rodzaj <c1/>

seg-d102fb18ce8d = rodzaj <c1/> symuluje orientację wokół środka masy bez orbity ani pozycji naziemnej, więc nie ma czego umieścić na Ziemi

seg-ecc0e31b0369 = wejście scenariusza nie niesie żadnej pozycji poziomej (brak szerokości i długości geograficznej, brak współrzędnych geocentrycznych, brak elementów orbitalnych poza co najwyżej wysokością), więc nie ma czego umieścić na Ziemi

seg-2e0825b27359 = rodzaje <c1/> i <c2/> obliczają budżety bez pozycji na Ziemi

seg-1f17b963c7a6 = efemerydy STK opisują pozycję i prędkość pojazdu w funkcji czasu; ta scena ma tylko punkty stałe lub ślady bez czasu (punkt stały to STK Facility, a nie efemerydy)

seg-f79d0ce7b945 = żaden scenariusz członkowski kampanii nie ma niczego, co opisuje ten format; wyeksportuj członka osobno, aby zobaczyć jego powód

seg-08b7e027318a = rodzaj <c1/> analizuje projekty sygnałów (widma, śledzenie, akwizycję, kompatybilność) bez pozycji satelity ani użytkownika; wyeksportuj scenariusz <c2/> lub <c3/>, który wykonuje ten projekt w locie

seg-31c8acef1aed = nie eksportowane w tym wydaniu: rodzaje pozycjonowania z fuzją umieszczają swoje satelity w układzie związanym z Ziemią względem epoki, której nigdy nie nazywają, więc eksport ze znacznikami czasu musiałby wymyślić datę kalendarzową (wyeksportuj zamiast tego scenariusz <c1/> lub <c2/>)

seg-3c57b084f0d7 = geometria rodzaju jest wyśrodkowana na Księżycu, Marsie lub innym ciele Układu Słonecznego; CZML, KML i GeoJSON opisują pozycje na Ziemi lub wokół niej, a to wydanie zapisuje efemerydy STK tylko z CentralBody Earth

seg-2edebe91839c = nie eksportowane w tym wydaniu: <c1/> umieszcza swoje satelity w układzie związanym z ciałem względem epoki, której nigdy nie nazywa, więc eksport ze znacznikami czasu musiałby wymyślić datę kalendarzową

seg-951ac7c5f138 = nie eksportowane w tym wydaniu: konstelacja GNSS (globalnego systemu nawigacji satelitarnej) Ziemi z <c1/> jest widziana z odbiornika w odległości księżycowej, którego trajektorii rodzaj nie udostępnia jako szeregu czasowego

seg-3cf7f7460c55 = nie eksportowane w tym wydaniu: rodzaj <c1/> podaje szczytowe obciążenia i nagrzewanie i nie przechowuje śladu naziemnego ze znacznikami czasu

seg-cfc3df59e5c8 = rodzaj <c1/> przegląda dostępność i siłę łącza dla użytkownika na powłoce lub trajektorii keplerowskiej; nie ma jednej pozycji do umieszczenia na mapie

seg-6271953188bd = scenariusz <c1/> podaje szerokość geograficzną miejsca startu, ale nie długość, więc miejsca nie można umieścić

seg-c9a63dfb34db = nie eksportowane w tym wydaniu: orbita prawdziwa <c1/> jest orbitą wzorcową do dopasowania, której kąt obrotu Ziemi w epoce jest daną wejściową (<c2/>, domyślnie { "0" }), a nie wynika z daty kalendarzowej, więc jej pozycje w układzie związanym z Ziemią nie są związane z datą

seg-a03c2f0426db = ten scenariusz widma nie ma bloku [iq], więc nie są syntetyzowane żadne próbki do nagrania

seg-d75f8ad6903a = nie eksportowane w tym wydaniu: <c1/> czyta i zapisuje CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Message, który sam jest plikiem wymiany efemeryd

seg-fdbaf96ecf3e = rodzaj <c1/> oblicza statystyki łącza dla stanowisk naziemnych bez geometrii ze znacznikami czasu do umieszczenia

seg-146a2e8ee590 = scenariusz przegląda inny scenariusz po siatce; wyeksportuj przeglądany scenariusz osobno

seg-b74484e3586b = rodzaj <c1/> oblicza budżet łącza i stabilności, bez geometrii ze znacznikami czasu do umieszczenia

seg-bcd613e62c69 = <s1>Poprzednia</s1>Eksport animacji

seg-0525f7fbbfd2 = <s1>Następna</s1>Stan walidacji

seg-53a778722c16 = STK .e
