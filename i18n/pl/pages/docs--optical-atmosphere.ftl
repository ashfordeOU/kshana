# docs--optical-atmosphere: translations (pl)

seg-6cb7a787ac67 = Bibliografia

seg-1c6199627b90 = Dane

seg-ad856ad710eb = Status

seg-508588352e96 = Źródło: <c1/>

seg-333a1114746a = Optyczne PNT przez atmosferę

seg-47118f54f060 = Rodzaj scenariusza <c1/> odpowiada na pytania, jak często działa łącze optyczne do ziemi, dlaczego zawodzi, jaki zapas lub jaka technika by pomogła i co robi zegar, gdy łącze nie działa.

seg-06db0ea8f428 = Kshana jest wyłącznie stroną analityczną. Nie prowadzi eksperymentu z optyczną stacją naziemną i nie wskazuje żadnego partnera pomiarowego. Rodzaj jest <b>MODELLED</b>: jego obliczenia numeryczne są sprawdzone względem niezależnego programu, ale nie porównano żadnego zmierzonego zapisu dostępności, a każde dane wejściowe dotyczące pogody, techniki i zegara są założeniem. To analiza doradcza, a nie certyfikowany produkt dostępności, integralności ani nawigacji.

seg-83c16fd89005 = Oba dołączone scenariusze zawierają klimaty chmur ILLUSTRATIVE. Są to dane wejściowe, a nie pomiary ani wartości jakiegokolwiek zbioru danych.

seg-e9dbbd9cfa32 = Jedna realizacja z ziarnem (seed) zapasu łącza stanowiska „northern” w ciągu { "336" } h, z prawdziwego przebiegu silnika v{ $version } na scenarios/optical-atmosphere-network.toml (ziarno { "37" }, krok { "600" } s). Zapas spada poniżej zera podczas epizodów zachmurzenia; w tym losowaniu łącze działa przez { "40.5" } % czasu, z { "27" } przerwami i najdłuższą przerwą { "30.7" } h. Dane wejściowe są ilustracyjne, szereg jest jednym losowaniem z modelu, a nie klimatem, i różni się od dostępności statystycznej ({ "37.8" } %) o błąd próbkowania tego losowania. Wyłącznie analiza doradcza: nie jest to certyfikowany produkt dostępności, integralności ani nawigacji ani prognoza dla żadnego prawdziwego stanowiska, chyba że jego dane klimatyczne pochodzą z podanego zbioru danych.

seg-13a52dfbd8d1 = Co jest obliczane

seg-46fbaf0c6a12 = <b>Tłumienie czystego powietrza</b> przy danej długości fali i elewacji: ekstynkcja aerozolowa z prawa widzialności Kima, McArthura i Korevaara, wykładnicza z wysokością, plus rozpraszanie Rayleigha i podana wielkość wejściowa absorpcji gazów. Zastępuje to pojedyncze zbiorcze <c1/> z <c2/>, gdy podana jest atmosfera. Bez niej budżet łącza jest identyczny bit w bit z { "0.36" } (wstępnie zarejestrowany próg A5).

seg-929c80326b41 = <b>Turbulencja.</b> Profil <c1/> Hufnagela–Valleya (domyślnie HV 5/7) scałkowany wzdłuż nachylonej drogi daje wariancję Rytowa dla fali płaskiej lub sferycznej, w górę lub w dół. Z niej wynikają wskaźnik scyntylacji Andrewsa–Phillipsa, parametry gamma-gamma, współczynnik uśredniania apertury przy słabej turbulencji (Churnside) oraz prawdopodobieństwo zaniku gamma-gamma i zapas na zanik. Uśrednianie apertury stosuje się przez dopasowanie momentów: wskaźnik scyntylacji jest skalowany współczynnikiem uśredniania, a obie wariancje logarytmów są przeskalowane tak, by dawały go dokładnie.

seg-3fb7be7ef95d = <b>Chmury.</b> Klimat chmur na stanowisku ma postać ITU-R P.840: prawdopodobieństwo chmury i, przy chmurze, logarytmiczno-normalna kolumna wody ciekłej. P.840 podaje ilość chmur. Tłumienie to głębokość optyczna w optyce geometrycznej <c1/>, ponieważ własne prawo tłumienia P.840 jest prawem mikrofalowym i nie stosuje się przy { "0.85" } do { "1.55" } µm, gdzie krople są znacznie większe od długości fali.

seg-18311430b2a3 = <b>Dostępność</b> stanowiska: łącze działa, dopóki zaniki od chmur i turbulencji razem mieszczą się w zapasie pozostałym po tłumieniu czystego powietrza. Chmury i turbulencję przyjmuje się za niezależne. Raport podaje dostępność, dostępność przy czystym niebie, <b>pułap</b>, którego żaden zapas nie przesunie (łącze optyczne nie przebije grubej chmury), oraz dodatkowy zapas potrzebny dla każdej docelowej dostępności albo <c1/>, jeśli cel jest powyżej pułapu.

seg-885e06050a9a = <b>Przerwy.</b> Czasy trwania są logarytmiczno-normalne z podaną średnią i rozrzutem. Raport podaje przerwy na rok, czas trwania przy medianie, 90. i 99. percentylu oraz prawdopodobieństwo i udział czasu przerw ponad { "1" }, { "6" }, { "24" } i { "72" } godziny.

seg-4b9b6fefad6b = <b>Różnicowanie stanowisk.</b> Najlepsze <c1/> stanowisk połączone przy niezależnej pogodzie (<c2/>) oraz przy pogodzie skorelowanej odległością: korelacja par <c3/>, połączona w jednoczynnikowej kopule gaussowskiej. Przy <c4/> jest to niezależna suma zdarzeń, a przy pełnej korelacji najlepsze pojedyncze stanowisko.

seg-b85681b9fd93 = <b>Techniki.</b> Każde <c1/> jest scenariuszem „co by było, gdyby”: nowa długość fali (budżet czystego nieba, tłumienie czystego powietrza i uśrednianie apertury są wyliczane na nowo), nowa apertura odbiorcza, podane ułamkowe zmniejszenie scyntylacji (optyka adaptacyjna) i dodatkowy zapas. Wynikiem jest zysk dostępności względem punktu odniesienia na tym samym stanowisku. Kshana nie modeluje pętli optyki adaptacyjnej, więc zyski są danymi wejściowymi.

seg-a59d07280524 = <b>Czas i pomiar odległości w trakcie przerwy.</b> Każdy czas trwania przerwy jest odwzorowany przez zamkniętą postać wariancji dryfu w modelu holdover zegara, dla zegarów wymienionych w <c1/>. Raport podaje błąd czasu i pomiaru odległości przy podanych czasach trwania przerwy, holdover do progu czasu, udział przerw mieszczących się w nim oraz dostępność czasu <c2/>. Dolne granice potęgowe klas są tymi, które syntezuje moduł holdover, więc ciasny próg jest wyznaczany przez to założone dno, jak stwierdza <c3/>.

seg-59774a9e8685 = Zapas łącza w funkcji czasu ({ "0.38" })

seg-fcfdd2e9e0ad = Tabela <c1/> (<c2/> do { "8760" }, <c3/>, <c4/>) dodaje do każdego stanowiska jedną <b>realizację z ziarnem (seed)</b> powyższego modelu: linia widzenia na przemian przechodzi przez okresy czystego nieba (wykładnicze, ze średnią ustawioną tak, by udział czasu w chmurze był podanym <c5/>) i przerwy z powodu chmur (logarytmiczno-normalne, podana średnia i rozrzut); każda przerwa losuje jedną kolumnę wody ciekłej z podanego klimatu i ją utrzymuje; każdy krok losuje jedną próbkę scyntylacji gamma-gamma (niezależną od kroku do kroku, co jest podanym uproszczeniem), a terminal jest na celu z podaną dostępnością naprowadzania. Zapas kroku to budżet zaniku minus zaniki od chmur i scyntylacji, a łącze działa, gdy zapas nie jest ujemny i terminal jest na celu, czyli w warunku, którego używa całka dostępności.

seg-ad2c4ff087a8 = To jest losowanie, a nie klimat: jego dostępność różni się od statystycznej o błąd próbkowania losowania, a pierwszy epizod jest losowany w całości. Wynik niesie <c1/>, <c2/>, <c3/> i <c4/> na krok oraz blok <c5/> (dostępność, ułamek chmur, liczba przerw, najdłuższa przerwa). <b>MODELLED</b>; kontrole (<c6/>, progi ustalone w <c7/> przed pierwszym przebiegiem) dotyczą determinizmu i zgodności z podanymi wartościami, a nie zewnętrznej wyroczni. Bez tabeli nic nie jest zapisywane, a wynikiem jest dokument { "0.37" }.

seg-4a9b065bdb28 = Pola scenariusza

seg-4ba70196355d = Wszystkie pola najwyższego poziomu są opcjonalne. Samo <c1/> uruchamia trzy stanowiska ilustracyjne. Wszystkie klucze znajdują się w dwóch dołączonych plikach: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-b7619573e112 = Stan weryfikacji

seg-6598ced4218b = Wariancja Rytowa, wskaźnik scyntylacji, prawdopodobieństwo zaniku gamma-gamma, współczynnik uśredniania apertury, głębokość optyczna chmur i czystego powietrza są obliczane tak, jak mówią podane wzory

seg-2442f7529fbb = Wiersz MODELLED; obliczenia numeryczne sprawdzone względem niezależnego programu mpmath

seg-19854ea8437a = progi od A1 do A3, wszystkie spełnione (<c1/>)

seg-b91d83aea0e8 = Budżet łącza i dotychczasowa dostępność bez zmian bez atmosfery

seg-2192262e26c1 = spełnione

seg-a71527a271df = próg A5, identyczność bit w bit dla { "1,000" } zestawów parametrów

seg-0db8cf4c2ee0 = Granice różnicowania i monotoniczność; sprzężenie z holdover dokładne co do bitu

seg-2a5c5967540c = spełnione (tożsamości)

seg-4b0e5e3ac558 = progi A4, A6

seg-f842c688e29a = Dostępność prawdziwego stanowiska, prawdziwa scyntylacja, prawdziwe statystyki chmur

seg-9a0ead7b1670 = nie jest twierdzone

seg-9cc220190772 = nie porównano z żadną zewnętrzną wyrocznią

seg-7c5050135e2b = Wyrocznia sprawdza implementację podanych wzorów, a nie atmosferę, więc żaden wiersz nie jest VALIDATED. Wartości walidacyjne ITU-R nie są używane i są trzymane poza repozytorium.

seg-73dcf0f31fe9 = Żaden zbiór danych pogodowych nie jest dołączony. Dane klimatu chmur dla prawdziwego stanowiska pochodziłyby z publicznego zbioru danych (Copernicus ERA5, NASA MODIS lub ISCCP); licencję każdego zbioru trzeba przeczytać i zapisać przed użyciem, a surowe dane pobierać w czasie testu z przypiętym SHA-256. Jedyna klimatologia już obecna w repozytorium to tabela czystych nocy Cavazzaniego i współpracowników, używana przez <c1/>.

seg-44d197f3209c = Andrews i Phillips, <em>Laser Beam Propagation through Random Media</em>, wyd. 2 (wariancja Rytowa, wskaźnik scyntylacji, parametry gamma-gamma).

seg-9e9a33d44013 = Kim, McArthur i Korevaar, <em>Comparison of laser beam propagation at { "785" } nm and { "1550" } nm in fog and haze for optical wireless communications</em>, Proc. SPIE { "4214" } ({ "2001" }) (prawo widzialności).

seg-f485b4e9ece4 = Churnside, <em>Aperture averaging of optical scintillations in the turbulent atmosphere</em>, Appl. Opt. { "30" } ({ "1991" }) (współczynnik uśredniania apertury).

seg-309c70f2f4f8 = ITU-R P.840 (statystyki wody ciekłej w chmurach), P.1814 i P.1817 (metody optyki w wolnej przestrzeni).

seg-83b30e1ca261 = <s1>Poprzednia</s1>Pakiety dowodowe

seg-1474b58fb35a = <s1>Następna</s1>Taktowanie slotów

seg-53a7343c076e = Twierdzenie

seg-50f25bceca3c = <s1>Poprzednia</s1>Partnerzy danych i awansowane wiersze
