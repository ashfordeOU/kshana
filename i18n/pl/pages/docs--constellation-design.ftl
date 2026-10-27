# docs--constellation-design: translations (pl)

seg-f63dd3d7aad4 = Źródło

seg-8f0e4021404d = Źródło: <c1/>

seg-44196ab9678c = Rodzaj <c1/> buduje jedną lub więcej konstelacji satelitów wokół Ziemi, Księżyca, Marsa lub dowolnego innego ciała z katalogu Układu Słonecznego (<c2/>: osiem planet, Pluton, Księżyc, Fobos, Deimos, cztery księżyce galileuszowe i Tytan, z tymi samymi stałymi, których używają rodzaje <c3/> i <c4/>; zob. <a1>SOLAR-SYSTEM.md</a1>) i odwzorowuje ich pokrycie oraz współczynnik DOP (rozmycie dokładności) na siatce szerokości i długości geograficznej. Źródło: <c5/>.

seg-61385c509a3d = Ciało wybiera się za pomocą <c1/> (domyślnie <c2/>). Przebieg obejmuje <c3/> (domyślnie jedną dobę gwiazdową, { "86 164" } s) w krokach <c4/> (domyślnie { "600" } s), powyżej <c5/> (domyślnie { "5" } deg), na siatce <c6/> (domyślnie { "10" } deg), którą mogą ograniczać <c7/>, <c8/>, <c9/> i <c10/>; <c11/> dodaje wiekowy dryf od J2, drugiej harmonicznej strefowej pola grawitacyjnego ciała.

seg-d02f6d747522 = Co wchodzi

seg-743e68478333 = <b>Powłoki Walkera</b> w konwencji <c1/>: <c2/> satelitów w <c3/> równomiernie rozmieszczonych płaszczyznach z przesunięciem fazowym <c4/>. Wzór <em>delta</em> rozkłada węzły wstępujące na { "360" } deg, wzór <em>star</em> na { "180" } deg. Płaszczyzna <c5/> leży w węźle <c6/>, a jej satelita <c7/> ma anomalię średnią <c8/>.

seg-d86b01d633a0 = <b>Jawne zestawy elementów</b>: wielka półoś lub wysokość, mimośród, inklinacja, rektascensja węzła wstępującego (RAAN), argument perycentrum i anomalia średnia.

seg-0737ef1ddb72 = <b>Ustawienia predefiniowane</b> z opublikowanych elementów nominalnych (tylko dla Ziemi; ustawienie predefiniowane wokół innego ciała jest błędem):

seg-587beeccaa11 = Ustawienie predefiniowane

seg-1ff32b87e030 = Satelity

seg-9e0514e371e5 = Global Positioning System (GPS) Standard Positioning Service Performance Standard (SPS PS), 5th edition, April { "2020" }, tabele 3.2-1 i 3.2-3

seg-fb6956d09acc = { "24" } do { "30" }

seg-f679ee0f3a3f = SPS PS, tabela 3.2-2: każdy z sześciu rozszerzalnych slotów (B1, D2, F2, A2, C4, E3) wymienionych w <c1/> jest zastępowany parą przednią i tylną; domyślnie wszystkie sześć

seg-45f3abdcb8d4 = Galileo Open Service Service Definition Document (OS SDD), issue { "1.1" }: Walker 24/3/1, wielka półoś { "29 599.801" } km, { "56" } deg (tabela { "1" }), sloty z tabeli { "23" }

seg-87e23a896f58 = BeiDou Open Service Performance Standard { "3.0" } ({ "2021" }), sekcja { "4.1" }: średnia orbita okołoziemska (MEO) Walker 24/3/1 na { "21 528" } km i { "55" } deg, plus trzy satelity geostacjonarne (GEO) na { "80" }, { "110.5" } i { "140" } deg E oraz trzy satelity nachylonych orbit geosynchronicznych (IGSO) na { "55" } deg

seg-70a32cd2402d = GLONASS Interface Control Document (ICD), edition { "5.1" } ({ "2008" }), sekcja { "5.2" }: wzór na sloty, { "19 100" } km, { "64.8" } deg

seg-654d7aceff94 = RAAN w tabeli GPS jest inercyjny w jej epoce; ustawienie predefiniowane przelicza go na długość węzła w układzie związanym z Ziemią, używając kąta godzinnego Greenwich podanego w tabeli ({ "100.765" } deg). GLONASS podaje bezwzględne długości węzłów (Greenwich) wprost. Dokument Galileo nie podaje kąta godzinnego, więc jego RAAN jest używany jako długość węzła. Norma BeiDou nie podaje fazy MEO ani węzłów IGSO; ustawienie predefiniowane zaczyna wzór MEO w węźle { "0" } i anomalii średniej { "0" } oraz umieszcza trzy IGSO na jednym śladzie na powierzchni, przecinającym równik na { "118" } deg E. Te dwa wybory są modelowane.

seg-b2bbdd23c13b = Kilka konstelacji może dzielić jeden przebieg. Przy <c1/> (domyślnie) odbiornik estymuje jeden zegar na każdy widoczny system, tak jak odbiornik wielosystemowy GNSS (Global Navigation Satellite System); <c2/> współdzieli jeden zegar.

seg-27db52482bdd = Co wychodzi

seg-2405196cfccb = Dla każdej komórki siatki: średnia, najmniejsza i największa liczba satelitów nad maską; odsetek epok z rozwiązaniem i z DOP pozycji (PDOP) nie większym niż <c1/>; średni geometryczny, pozycyjny, poziomy i pionowy DOP (GDOP, PDOP, HDOP, VDOP); największy PDOP. Globalnie, ważone cosinusem szerokości geograficznej, aby każda komórka liczyła się według swojej powierzchni: dostępność, dostępność w najgorszym miejscu oraz średnia, mediana, 90., 95. i 99. percentyl i maksimum każdego DOP. Dla każdego satelity: przerzedzony ślad na powierzchni (<c2/> próbek, domyślnie { "24" }, dla co najwyżej <c3/> satelitów, domyślnie { "120" }). Wykres to dwie mapy: dostępność i średni PDOP.

seg-6cb532d0bca9 = Jak to się skaluje

seg-988ae3272c1f = Satelita na promieniu <c1/> znajduje się powyżej maski elewacji <c2/> dokładnie wtedy, gdy jego kąt środkowy od użytkownika wynosi co najwyżej <c3/>, więc test widoczności to jeden iloczyn skalarny względem <c4/>. W każdej epoce satelity są też sortowane według szerokości podsatelitarnej, a wiersz siatki na szerokości <c5/> testuje tylko satelity w odległości do <c6/> od <c7/>. Oba zabiegi są dokładne na ciele kulistym, a test jednostkowy porównuje każdą mapę z pełnym przeglądem z bezpośrednim testem elewacji. Blok <c8/> podaje liczbę testów par, które wykonałby pełny przegląd, i tych, które wykonano. Projekt z { "5" } 000 satelitami w teście jednostkowym na siatce { "10" } deg ({ "648" } punktów, { "6" } epok) zachowuje { "9.9" } % z { "19 440 000" } testów par pełnego przeglądu; dołączony scenariusz <c9/> ({ "5 000" } satelitów, { "648" } punktów, { "12" } epok) działa w około { "0.14" } s z wydaniową binarką wiersza poleceń na laptopie z procesorem Apple silicon. Czasy rzeczywiste zależą od maszyny i jej obciążenia. Silnik nie używa wątków, zegara ani systemu plików, więc działa bez zmian jako WebAssembly.

seg-abba032ee1c7 = Co jest sprawdzane i względem czego

seg-2342ed239300 = VALIDATED, względem opublikowanych dokumentów:

seg-dc7fe92fcf05 = generator Walkera odtwarza wszystkie { "24" } wiersze tabeli { "23" } Galileo OS SDD, a wzór GLONASS ICD na sloty daje ten sam zestaw { "24" } slotów co Walker 24/3/1;

seg-686f9543c7c9 = ustawienie predefiniowane GPS odtwarza kolumnę przecięcia równika przez ślad na powierzchni z tabel 3.2-1 i 3.2-2 SPS PS: { "35" } z { "36" } miejsc w granicach { "0.0108" } deg względem progu zaokrąglenia { "0.015" } deg. E3F jest utrzymywany względem luźniejszego progu { "0.06" } deg, ponieważ wiersz E3F w samej tabeli jest niespójny z jej RAAN i argumentem szerokości: jego argument szerokości wyprzedza argument E3 o { "14.60" } deg, co przesuwa przecięcie o { "7.30" } deg, podczas gdy tabela przesuwa je o { "7.36" } deg;

seg-dc2756c75401 = baza GPS w warunkach z dodatku B SPS PS (jedna doba gwiazdowa, { "287" } kroków po pięć minut, siatka { "4" } deg, wszystkie satelity widoczne, maska { "5" } deg) daje globalną medianę HDOP { "0.940" }, { "90" } % { "1.165" }, { "95" } % { "1.255" }, { "98" } % { "1.370" } i średnią { "0.965" }, względem opublikowanych { "0.94" }, { "1.16" }, { "1.25" }, { "1.37" } i { "0.96" } (próg { "0.03" }, ustalony przed pierwszym przebiegiem). Mediana PDOP { "1.795" } jest niższa niż { "1.815" } z tabeli B.3-1, która opisuje pogorszony zestaw 20-24 satelitów. PDOP { "6" } lub mniejszy utrzymuje się przez { "100" } % czasu, względem { "98" } % globalnie i { "88" } % w najgorszym miejscu w tabeli 3.8-1.

seg-9aac9d8aa228 = Sprawdzone względem wyprowadzenia ręcznego, a nie zewnętrznego dokumentu: DOP z jednej epoki zgadza się ze wzorem zamkniętym dla satelity w zenicie i trzech na elewacji { "30" } deg (PDOP 8/3, GDOP { "3.0732" }).

seg-d946dad08e23 = MODELLED: orbity dwóch ciał z opcjonalnym wiekowym dryfem J2; ciało kuliste; wyłącznie widoczność geometryczna (bez mocy sygnału, stanu satelity ani terenu); bez zaburzeń od trzeciego ciała, od których zależy prawdziwa księżycowa orbita zamrożona. Najgorszy pojedynczy punkt czasoprzestrzenny zależy od siatki: HDOP { "2.40" } i VDOP { "5.22" } tutaj, względem { "2.49" } i { "5.43" } opublikowanych; są one podawane, a nie zakotwiczane. Ustawienia predefiniowane czterech systemów pochodzą z różnych epok odniesienia, więc ich względna faza w jednym przebiegu nie jest migawką żadnej daty.

seg-a6c63abeb7e6 = Dołączone scenariusze

seg-3e6a942c84d4 = Każdy wiersz podaje to, co przebieg wypisuje w kshana { $version }.

seg-c8b40c9c2c00 = <c1/>: GPS, Galileo, BeiDou i GLONASS ({ "102" } satelity) przez jedną dobę powyżej maski { "10" } deg, jeden zegar na system. Dostępność (PDOP { "6" } lub mniejszy) { "100" } % globalnie i w najgorszym miejscu, mediana PDOP { "0.95" }, średnio { "31.0" } satelitów w zasięgu widzenia.

seg-b65ade1eab04 = <c1/>: { "5 000" } satelitów w czterech powłokach niskiej orbity okołoziemskiej (LEO) dla pozycjonowania, nawigacji i czasu (PNT), z J2, powyżej maski { "20" } deg. Dostępność (PDOP { "3" } lub mniejszy) { "99.22" } % globalnie i { "0" } % w najgorszym miejscu, mediana PDOP { "1.11" }, średnio { "39.4" } satelity w zasięgu widzenia.

seg-7d860ca30360 = <c1/>: { "8" } satelitów na eliptycznych zamrożonych orbitach księżycowych i 6-satelitarna kołowa powłoka wokół Księżyca. Dostępność (PDOP { "6" } lub mniejszy) { "21.33" } % globalnie i { "0" } % w najgorszym miejscu, mediana PDOP { "5.22" }, średnio { "3.2" } satelity w zasięgu widzenia.

seg-0c331bea1f52 = Pokrycie LEO-PNT dla użytkowników polarnych i arktycznych, w porównaniu z GNSS na średniej orbicie okołoziemskiej, to tryb polarny rodzaju <c1/> (<c2/>; zob. <a1>LEO-PNT.md</a1>).

seg-9aab3bf49146 = <s1>Poprzednia</s1>Fuzja pozycjonowania MEO i LEO

seg-9f717b9015e1 = <s1>Następna</s1>Modele czujników kwantowych
