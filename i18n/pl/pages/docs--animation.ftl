# docs--animation: translations (pl)

seg-8428c41646b0 = Źródło: <c1/>

seg-a61d094894fd = <c1/> zamienia szereg czasowy przebiegu w coś, co się porusza: animowany plik Scalable Vector Graphics (SVG), pojedynczy samodzielny odtwarzacz HyperText Markup Language (HTML) albo ponumerowaną sekwencję klatek SVG dla kodera wideo. Kampania jest odtwarzana jako jej fazy (zagłuszanie, spoofing, holdover, alarm integralności) z zaznaczonymi alarmami; przebieg widma odtwarza swój wykres kaskadowy wiersz po wierszu; przelot na niskiej orbicie okołoziemskiej (LEO) odtwarza swoje łącze w każdym paśmie, a ze spooferem także statystyki monitora epoka po epoce.

seg-39d69331035d = Kod: <c1/>. Testy: <c2/>.

seg-0b708f65d8d3 = Czym jest, a czym nie jest

seg-ad8c12a3b510 = Eksporter czyta dokument wyniku, który przebieg już zapisał. Nie uruchamia ponownie fizyki, nie przepróbkowuje, nie wygładza ani nie interpoluje między próbkami (poza jednym odcinkiem prostym, który kończy ślad przy kursorze) i nie dodaje żadnej własnej liczby. Animacja jest więc dokładnie tak dobra, jak przebieg, który za nią stoi. Jej poziom to <b>MODELLED, spójność wewnętrzna</b>: jest to renderowanie, nigdy dowód, i nie ma własnego wiersza w macierzy weryfikacji.

seg-f37311ad7ef0 = Wyniki

seg-0c21f772932e = Każdy format jest zapisywany obok scenariusza, przy zwykłych <c1/>, <c2/> i <c3/>:

seg-f2ce7fc60cdf = Format

seg-51a8df15f356 = Zapisywany jako

seg-3ea93ae372ca = Co zawiera

seg-3603593b9799 = Jeden SVG animowany klatkami kluczowymi Cascading Style Sheets (CSS), bez skryptu: ślady rysują się za poruszającym się kursorem czasu, zdarzenia pojawiają się w swojej chwili, wiersze wykresu kaskadowego odsłaniają się w kolejności czasu. Zapętla się, z przytrzymaniem gotowego obrazu przez { "1.5" } s.

seg-6c91078b434e = Jeden plik z wbudowanym skryptem i stylem, bez zewnętrznych zasobów: odtwarzanie i pauza, suwak przewijania, szybkość (0.25x do 4x), każdy panel na jednym zsynchronizowanym kursorze, bieżąca wartość każdego śladu, pasek faz oraz lista zdarzeń, która po kliknięciu przeskakuje do zdarzenia. Spacja odtwarza lub wstrzymuje, klawisze strzałek przesuwają o krok, Home i End przeskakują na początek i na koniec.

seg-df02d37cd729 = <c1/>, <c2/>, … i <c3/>.

seg-2e5ebd60cad0 = <c1/> można powtarzać, przyjmuje listę rozdzieloną przecinkami (<c2/>) albo <c3/>. <c4/> (od { "1" } do { "60" }, domyślnie { "12" }) i <c5/> (od { "0.5" } s do { "600" } s, domyślnie { "8" } s) ustawiają odtwarzanie; sekwencja klatek jest ograniczona do { "7,200" } klatek.

seg-7e012ab53f45 = Gdy <c1/> działa w tym samym poleceniu, odtwarzacz HTML wymienia pliki eksportu zapisane obok niego (CZML, KML, GeoJSON, STK, SigMF) jako względne odnośniki do tych plików sąsiednich; odnośnik jest zapisywany tylko dla samej nazwy pliku, więc żaden nie może wyjść poza folder ani sięgnąć do sieci. Raport zaawansowany (<c2/>) osadza animowany rysunek zawsze, gdy wynik ma szereg czasowy, niezależnie od tego, czy <c3/> działało.

seg-9c1d2204edab = Gdy <c1/> działa, <c2/> zyskuje blok <c3/>: formaty, liczbę klatek na sekundę (fps), czas trwania, liczbę klatek, przedział czasu, tytuły paneli, ścieżki JSON, z których odczytano każdy ślad (<c4/>), oraz każdą znalezioną, lecz nienarysowaną serię (<c5/>). Bez <c6/> wynik jest identyczny co do bajta ze zwykłym przebiegiem.

seg-fa8388ae976e = Sekwencja klatek

seg-db4b53abe7d6 = Sekwencja ma dokładnie <c1/> klatek. Klatka <em>i</em> pokazuje oś czasu do <c2/>, więc pierwsza klatka to początek, a ostatnia to gotowy obraz. <c3/> zapisuje <c4/>, <c5/>, <c6/>, <c7/> (<c8/>), rozmiar w pikselach, <c9/>, <c10/>, czas misji każdej klatki (<c11/>), fazy, zdarzenia i źródła. Ponowny eksport do tego samego katalogu najpierw usuwa każdy już istniejący <c12/> (i nic więcej), więc krótsza sekwencja nie zostawia klatek dłuższej, które koder mógłby odczytać.

seg-13b57b6d3c14 = Klatki są w formacie SVG, a nie Portable Network Graphics (PNG). <c1/> zbudowany z biblioteką <c2/> czyta je bezpośrednio, z szybkością, z jaką zapisano sekwencję ({ "24" } w przykładzie powyżej; <c3/> w manifeście):

seg-b20beeb45fac = <c1/> bez <c2/> zatrzymuje się z komunikatem „no decoder found for: svg”. Najpierw zrasteryzuj klatki, na przykład za pomocą <c3/>, i zakoduj pliki PNG:

seg-fc61f546f605 = Dostępność i motyw

seg-7015f7ed77dc = <b>Schemat kolorów.</b> Odtwarzacz podąża za <c1/> i przerysowuje się przy zmianie; animowany SVG zawiera jasny wariant palety pod tym samym zapytaniem o media. Klatki używają ciemnej palety wykresów statycznych, ponieważ wideo nie ma schematu.

seg-c3b1f19f191b = <b>Ograniczony ruch.</b> Przy <c1/> animowany SVG wyłącza każdą animację i pokazuje gotowy obraz (jego style bazowe są stanem końcowym, więc nic nie jest ukryte), a odtwarzacz otwiera się wstrzymany na gotowym obrazie zamiast odtwarzać; użytkownik nadal może przewijać lub nacisnąć Play.

seg-f8dd26194eec = SVG ma <c1/> i <c2/>; elementy sterujące odtwarzacza to opisane przyciski, pole zakresu z wymawianą wartością czasu oraz lista wyboru.

seg-f5356cbf3675 = Co jest szeregiem czasowym

seg-ba43cf36ac20 = Dokumenty wyników różnią się w zależności od rodzaju, więc eksporter rozpoznaje kształty, które emituje silnik, a nie listę rodzajów:

seg-952d09156712 = <b>Tablica rekordów z polem czasu</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> lub <c6/> w tablicy <c7/>), które rośnie ściśle wzdłuż tablicy. Każde inne pole liczbowe staje się śladem; to samo pole pod dwoma korzeniami (<c8/> i <c9/>) dzieli panel.

seg-2c3abce3f70a = <b>Obiekt ze ściśle rosnącą tablicą czasu</b> (<c1/>, <c2/>, <c3/>, …) obok tablic tej samej długości: sąsiednich tablic liczbowych, mapy <c4/> rekordów <c5/> (oś czasu <c6/>), tablicy rekordów zawierających takie tablice (pasma <c7/>, ślady satelitów konstelacji) oraz tablicy dwuwymiarowej, której wiersze odpowiadają osi czasu, z sąsiednią osią częstotliwości <c8/> (wykres kaskadowy <c9/>).

seg-0edf8c38f9eb = Obok tej tablicy czasu <c1/> (<c2/>, <c3/>, <c4/>) stają się paskiem faz, a <c5/> (<c6/>, <c7/>, <c8/>) stają się znacznikami. Skalary <c9/> pasma (jego pierwsza utrata synchronizacji, jego najniższy stosunek gęstości nośnej do szumu) są także zaznaczane.

seg-608c4fed9e98 = Ślady z jednostką dzielą panel, gdy ich wielkości mieszczą się w czynniku { "100" }, więc ochrona { "50" } ns nie spłaszcza błędu { "2" } ns. Rysuje się najwyżej { "6" } paneli po { "6" } śladów; reszta jest wymieniona w <c1/>. Ślady powyżej { "2,400" } próbek są przerzedzane równym krokiem, który zachowuje ostatnią próbkę, a wykres kaskadowy powyżej { "96" } × { "120" } komórek jest uśredniany (w mocy, dla komórek w decybelach, aby wąski zagłuszacz nie został rozmyty).

seg-b68ce4aa301f = Rodzaj, którego wynik nie niesie żadnego z tych kształtów (bilans łącza, geometria jednej epoki, podsumowanie wyłącznie statystyczne Monte Carlo albo holdover telekomunikacyjny, którego wynik publikuje skrót zapisu, lecz nie sam zapis), jest odrzucany z komunikatem <c1/>, a nic nie jest zapisywane. W kshana { $version } { "89" } z { "182" } plików scenariuszy możliwych do uruchomienia (każdy plik poza zestawem badań) daje animację, a { "93" } jest odrzucanych. <c2/> wypisuje spis.

seg-c386389e4f1d = Wśród rodzajów LEO animuje się każdy dołączony scenariusz <c1/>, <c2/> i <c3/>. <c4/> animuje się w trybach Dopplera, wspólnego pozycjonowania i synchronizacji czasu (przebieg synchronizacji czasu wymaga <c5/>, co sprawia, że każdy wiersz podaje swój błąd czasu i przewidywane sigma w każdej epoce) i jest odrzucany w trybie pokrycia biegunowego. <c6/> animuje swoją aktualizację w środku przelotu i jest odrzucany dla analiz kodowania, przedziału dopasowania i porównania modeli. Wyniki <c7/> i <c8/> nie mają osi czasu i są odrzucane.

seg-eb31ec7a07b7 = Determinizm

seg-82bcf8a5b042 = Wynik jest czystą funkcją dokumentu wyniku i opcji: bez zegara, bez liczby losowej, bez iteracji po tablicy mieszającej, bez dostępu do plików lub sieci w bibliotece i bez znacznika czasu gdziekolwiek, więc ten sam scenariusz, ziarno (seed) i opcje dają pliki identyczne co do bajta. Moduł buduje się dla WebAssembly bez zmian; pliki zapisuje tylko interfejs wiersza poleceń.

seg-77e1f459f3d3 = Użycie jako biblioteki

seg-b3fa41e48ea5 = <c1/> animuje dokument wyniku, który już masz, a <c2/> zwraca to, co zostałoby narysowane, bez renderowania.

seg-0857a94a948e = Ograniczenia

seg-02f0f03af2fb = Pakiet Pythona (wheel) i moduł WebAssembly nie udostępniają jeszcze eksportera; jest on dostępny z wiersza poleceń, z biblioteki Rusta i z narzędzia <c1/> serwera Model Context Protocol (MCP) (które zwraca najwyżej { "120" } klatek w jednej odpowiedzi).

seg-cd3ec7b403ba = Osie są liniowe. Seria obejmująca wiele rzędów wielkości (narastanie błędu zegara od { "0.1" } ns do mikrosekundy) wygląda na płaską aż do późnego etapu przebiegu.

seg-ed21d370a73c = Animowany SVG opiera się na animacji CSS prostokąta przycinającego; obecne silniki Chromium, Firefox i Safari go odtwarzają, a przeglądarka bez animacji CSS pokazuje gotowy obraz.

seg-9dfb9596ecf3 = Kampanie przeglądu (sweep), Monte Carlo i kompozycji (compose) nie mają osi czasu i są odrzucane; statystyki podsumowujące przeglądu lub zespołu nie są szeregiem czasowym. Kampania łańcuchowa się animuje.

seg-be1f1afe7424 = <s1>Poprzednia</s1>Raporty z przebiegów

seg-6817433f69f6 = <s1>Następna</s1>Eksporty i importy interoperacyjności
