# docs--claims-vs-reality: translations (pl)

seg-2bd2101ce454 = Powierzchnia

seg-a47934361f43 = Strumienie NMEA do szkolenia załóg

seg-ee2e250497f9 = Eksport dla test bench

seg-ad856ad710eb = Status

seg-98d0bc6b40ce = Mapowanie compliance do publicznych ram

seg-80f3f0aae42c = Mapa zakłóceń

seg-28b1885c4ca7 = Źródło: <c1/>

seg-bf5c2811ce29 = Twierdzenia a rzeczywistość — rejestr nadmiernych twierdzeń

seg-592e007bc3cf = Niezależny audyt wcześniejszej wersji Kshana skatalogował czternaście <b>nadmiernych twierdzeń</b> (<c1/>…<c2/>): miejsc, w których powierzchnia publiczna (README, playground, etykiety wskaźników jakości (FoM), pakiety scenariuszy) opisywała możliwość mocniej, niż dostarczał kod. Ta strona jest rejestrem zamknięcia: każdy wiersz podaje pierwotne nadmierne twierdzenie, sposób jego rozwiązania i dowody. Występują dwa rodzaje rozwiązania:

seg-39250970dbbf = <b>Wycofano twierdzenie</b> — sformułowanie poprawiono tak, by odpowiadało kodowi (uczciwe przeformułowanie, bez zmiany możliwości). „Zero kodu = zero twierdzenia.”

seg-fb7da0f79ead = <b>Zastąpione</b> — rzeczywistą możliwość zbudowano i przetestowano później, więc mocne twierdzenie stało się <em>trafne</em>.

seg-5292f7162e2b = Strażnik regresji (<c1/>) przy każdym przebiegu CI (ciągłej integracji) skanuje aktualne powierzchnie publiczne (<c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> oraz strony główne crates.io, PyPI (Python Package Index) i npm: <c8/>, <c9/>, <c10/>) i zgłasza błąd, jeśli którekolwiek z wycofanych gołych sformułowań nadmiernego twierdzenia pojawi się ponownie bez zastrzeżenia, więc wiersz nie może po cichu wrócić ze stanu GREEN.

seg-dafc6f322f34 = Wszystkie czternaście wierszy jest <b>GREEN</b>.

seg-5cf7bf2d1889 = OC (nadmierne twierdzenie)

seg-0e01d4053d7f = Pierwotne nadmierne twierdzenie

seg-36bf87638923 = Rozwiązanie

seg-70a952c4150b = „łączny estymator fuzji Kalmana” sugerował pojedynczy filtr z kowariancją krzyżową; kod uruchamiał dwa niezależne estymatory

seg-d5682a7fdb11 = <b>Zastąpione</b> — zbudowano prawdziwy filtr Kalmana zegara i pozycji, sprzężony kowariancją krzyżową

seg-1008020cd9e4 = <c1/> ({ "7" } testów, w tym zespół 100 prób sprzężony kontra rozłączony, który wymaga, by RMS (średnia kwadratowa) pozycji w wariancie sprzężonym był niższy niż { "0.6" }× wariantu rozłączonego, a filtr sprzężony wygrał co najmniej { "90" } z { "100" } prób); CAPABILITY „Sensor fusion” → pełne

seg-334fc345d501 = „RAIM (autonomiczny monitoring integralności odbiornika) wykrywania spoofingu wspomagany zegarem” sugerował wielosatelitarny detektor RAIM

seg-cf0795c2ee02 = <b>Wycofano twierdzenie → Zastąpione</b> — przeformułowano jako granicę wykrywalności spoofingu opartą na stabilności zegara; następnie pojawił się prawdziwy RAIM/ARAIM (HPL/VPL (HPL: poziomy poziom ochrony; VPL: pionowy poziom ochrony))

seg-f46432acbfa0 = <c1/> ({ "30" } testów — migawkowy + z separacją rozwiązań ARAIM, HPL/VPL, FDE (detekcja i wykluczanie uszkodzeń), diagramy Stanforda); <c2/>

seg-8b47f69dbb76 = „demonstrator zagłuszania” bez żadnego kodu zagłuszania za nim

seg-bfff34d5a250 = <b>Zastąpione</b> — zbudowano model zagłuszania oparty na bilansie łącza: J/S → efektywne C/N₀ → utrata synchronizacji

seg-5f75628b8201 = <c1/> ({ "10" } testów); wiersz „Resilience” w README

seg-bae512770cd6 = „Pełny model szumu IMU (jednostki pomiaru inercjalnego) oparty na wariancji Allana dla triady IMU” — model był jednoosiowy

seg-50c0b5855cb9 = <b>Wycofano twierdzenie → Zastąpione</b> — przeformułowano jako budżet błędów 1-DOF (DOF: stopień swobody); następnie dostarczono trójosiowy INS (inercjalny system nawigacyjny) strapdown

seg-501bf7d8fff0 = <c1/> trójosiowy strapdown (orientacja kwaternionowa, mechanizacja NED (północ-wschód-dół), coning/sculling); ROADMAP „Inertial”

seg-ad250a99b05f = „Integracja hybrydowego PNT (pozycjonowanie, nawigacja i czas)” sugerowała sprzężony filtr GNSS/INS (GNSS: globalny system nawigacji satelitarnej); był to budżet błędów nawigowania zliczeniowego

seg-85fb58d37a5d = <b>Wycofano twierdzenie → Zastąpione</b> — przeformułowano jako nawigowanie zliczeniowe z konfigurowalnym ponownym uchwyceniem; następnie dostarczono prawdziwą ścisło sprzężoną fuzję GNSS/INS

seg-9e6b092d5656 = <c1/> (17-stanowy UKF (nieskentowany filtr Kalmana) z nawigowaniem zliczeniowym kwantowym CAI (CAI: interferometr zimnych atomów)); CAPABILITY „Sensor fusion” → pełne

seg-46a637f8e967 = „sprawdzone ok. { "2" }%” sugerowało ścisłą, egzekwowaną bramkę

seg-5e98d7664558 = <b>Wycofano twierdzenie</b> — <c1/> podaje <em>egzekwowaną</em> bramkę ({ "20" }–{ "25" }%, uśrednioną po ziarnach); „ok. { "2" }%” oznaczało typową obserwację, a nie bramkę

seg-84f4fcdc7e50 = <c1/> nagłówek „On tolerances”

seg-85ec2fe9c7f7 = „deterministyczny między platformami” bez zatwierdzonych dowodów

seg-6e516f04db89 = <b>Wycofano twierdzenie</b> — łańcuch narzędzi przypięty do dokładnego wydania; wzorcowe hasze dla każdego scenariusza zatwierdzone wraz z bramką odtwarzalności. (Identyczność bitowa <em>między</em> OS/arch (OS: system operacyjny) pozostaje otwartą pozycją, podaną uczciwie.)

seg-9db327be56c3 = <c1/> (kanał <c2/>); <c3/> (wartości liczbowe do { "1e-6" }); <c4/> (hasz odcisku wejścia i kształtu każdego wyniku, uruchamiany w macierzy CI dla Linuksa, macOS i Windows); <c5/>

seg-2708139388ed = „hybrydowy kwantowo-klasyczny symulator PNT” sugerował fizykę kwantową od pierwszych zasad

seg-717167714e83 = <b>Wycofano twierdzenie → Zastąpione</b> — przeformułowano jako symulator odporności PNT używający modeli wydajności czujników kwantowych; następnie pojawiła się fizyka CAI Macha–Zehndera od pierwszych zasad

seg-c67fb22add4b = <c1/> ({ "26" } testów — faza Macha–Zehndera, szum projekcji <c2/>, funkcja przenoszenia drgań, Coriolis + systematyki AC-Stark (AC: prąd przemienny)); <c3/>

seg-5c6b7d4f2029 = wskaźnik jakości „Integrity Performance” sugerował lotniczą integralność HPL/VPL/RAIM

seg-ee5487da890c = <b>Wycofano twierdzenie + Zastąpione (warstwowo)</b> — wskaźnik jakości scenariusza dla każdego przebiegu jest uczciwie oznaczony jako <em>samospójność filtra</em> (<b>nie</b> lotnicza integralność); prawdziwy ARAIM HPL/VPL jest pokazywany <em>osobno</em>, by obu nigdy nie mylić

seg-31aacdf17b02 = <c1/> (<c2/>: samospójność, z zastrzeżeniem); <c3/> + <c4/> (prawdziwy ARAIM)

seg-0686fa147c96 = wskaźnik jakości Security przedstawiany jako zawsze znaczący, nawet bez ataku

seg-d6d9296422fc = <b>Wycofano twierdzenie</b> — wskaźnik jakości Security (<c1/>) jest ujęty w kontekście detektora spoofingu i ma sens tylko wtedy, gdy skonfigurowano scenariusz ataku

seg-8f7b211b5a0c = wiersz „Resilience” w README; wskaźnik jakości Security jest zdefiniowany w punkcie specyfikacji szkodliwym operacyjnie

seg-d66421174e94 = wskaźnik jakości „Positioning Performance” sugerował pełną dokładność w dziedzinie pozycji

seg-9eeb13a16350 = <b>Wycofano twierdzenie</b> — oznaczono jako 1-DOF <c1/> dla pakietów inercjalnego/hybrydowego, wyraźnie <b>nie</b> jako 2-wymiarowy CEP/2DRMS (CEP: błąd kołowy prawdopodobny) ani dokładność ważona DOP (DOP: rozmycie dokładności)

seg-e8115df73c10 = tabela wskaźników jakości w README (wiersz „Positioning Performance”)

seg-5c73759a2454 = liczby wskaźników jakości inercjalnych odczytywane jako statystyki zespołu z pojedynczych ziaren

seg-3db3a41ce848 = <b>Wycofano twierdzenie</b> — pojedynczy przebieg jest oznaczony <c1/>; <c2/> podaje średnią/rozrzut/przedział ufności bootstrap { "95" }%

seg-bf737455e6f2 = tabela wskaźników jakości w README; testy obwiedni pokrycia scenariuszy

seg-aa362992b5da = scenariusz „konstelacji GPS (Global Positioning System) SGP4 (Simplified General Perturbations { "4" })” używał syntetycznych zastępczych TLE (zestawów elementów dwuliniowych)

seg-ebae20813a52 = <b>Zastąpione</b> — scenariusz osadza teraz prawdziwą migawkę Celestrak <c1/> z datą i ścisłymi sumami kontrolnymi

seg-2d49f6101571 = <c1/> (rzeczywiste <c2/>, <c3/>); <c4/>

seg-cdefa4ee436a = napis wersji w README rozjechał się z <c1/>

seg-8e66b9485565 = <b>Wycofano twierdzenie</b> — bramka CI sprawdza, czy plakietka stanu w README zgadza się z <c1/>

seg-347fd8c1f334 = { "0.35" }: twierdzenia zachowane wąsko i jedna poprawka

seg-946ff389cec5 = Funkcje { "0.35" } opisano z granicami podanymi obok twierdzenia, a te same strażniki (<c1/> oraz strażnik sformułowań w <c2/>) skanują strony, które je opisują. Ta tabela nie jest częścią czternastowierszowego rejestru powyżej; dla nowych powierzchni zapisuje, co jest twierdzone, a co nie.

seg-6ac3f9b26aad = Co jest twierdzone

seg-6f558815da86 = Czego nie twierdzimy

seg-d0964d2f9bbc = Wskaźnik zaufania do jednostki (<c1/>, <c2/>, bramka, Signal K, OpenCPN)

seg-ee4d75006bfc = wskaźnik 0-100 i przyczyny na podstawie własnego NMEA odbiornika, MODELLED

seg-59ff27c84fe4 = doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu; wskaźnik dla jednego dziennika nie jest twierdzeniem o innych odbiornikach; nie zwiększa dokładności pozycji

seg-8869e6a5c10b = syntetyczny mostkowy NMEA ze scenariuszowymi zdarzeniami i dziennikiem instruktora

seg-bc4ba77bc569 = tylko tekst, bez wyjścia o częstotliwości radiowej; nigdy dla bieżących systemów nawigacyjnych jednostki; doradczo, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu

seg-9482ecbb2748 = podpisany zapis techniczny, który można zweryfikować offline

seg-20ae6dd2b780 = nie jest opinią prawną; nie mówi, co spowodowało zdarzenie, kto za nie odpowiadał ani że dziennik pokazuje to, co odbiornik naprawdę odebrał

seg-4132fc36f1d3 = zbiorcze komórki pogorszonej nawigacji z raportów na otwartych licencjach

seg-c64960abf9fb = nie jest prognozą; ekspozycja trasy to udział komórek, a nie ryzyko

seg-ed6d268e0291 = ruch pojazdu i zdarzenia scenariusza w plikach, które może odczytać symulator laboratoryjny

seg-85c8ad22ef03 = nie jest zapisywany żaden sygnał; nie twierdzimy niczego o wydajności symulatora ani odbiornika

seg-1bba9a883650 = które wiersze zestaw przebiegów wspiera dowodami (supports evidence for), z luką w każdym wierszu

seg-f2a836780831 = nigdy że ramy są spełnione ani że produkt jest zatwierdzony; sama etykieta rodzaju nie jest dowodem

seg-31c7009c9914 = <b>Poprawka odnotowana w { "0.35" }.</b> Wcześniejsza wersja <c1/> oraz komentarzy modułu odporności opisywała siedem „kategorii technik” ram DHS Resilient PNT Conformance Framework. Wersja { "2.0" } tych ram definiuje funkcje podstawowe (Prevent, Respond, Recover), poziomy od { "0" } do { "4" } i osiem ponumerowanych wymagań, a listy siedmiu kategorii nie ma. Siedem nazw podwskaźników, które emituje silnik oceny, to własne nazwy Kshana, i tabela powiązań teraz to mówi.

seg-f70787ecb194 = Jak wiersz pozostaje GREEN

seg-f2c599e8882a = Mocne twierdzenia (OC-0/2/7/8 oraz zastąpione połowy OC-1/3/4/12) są GREEN, ponieważ możliwość jest <b>dostarczona i przetestowana</b>, a nie dlatego, że złagodzono sformułowanie. Wiersze wycofane z twierdzeń są GREEN, ponieważ aktualne sformułowanie odpowiada kodowi. Test strażnika czyni drugą kategorię egzekwowalną: jeśli wycofane sformułowanie nadmiernego twierdzenia wróci na powierzchnię publiczną, CI zaświeci się na czerwono. Zob. <c1/>.

seg-39e475441b60 = <s1>Poprzednia</s1>Dlaczego wiersze pozostają obliczone na podstawie modelu

seg-07ef8e1e862e = <s1>Następna</s1>Pochodzenie
