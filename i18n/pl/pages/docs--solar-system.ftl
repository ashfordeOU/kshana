# docs--solar-system: translations (pl)

seg-6cb7a787ac67 = Bibliografia

seg-31a05429b836 = Ciała

seg-1c78d5337e16 = Pluton

seg-6e0cb6acc073 = VALIDATED

seg-60cd077d82a7 = Model

seg-c5ce76c91ff7 = Etykieta

seg-7670cf4ceda3 = Wartość domyślna

seg-430edd66bda0 = Niemodelowane

seg-e0eb14018b2c = jak wyżej

seg-3dbc7ff9f5ab = Tabela

seg-9fe60d39f2db = Źródło: <c1/>

seg-c44439432020 = Układ Słoneczny i pozycjonowanie wokół innych ciał

seg-4d4ee55b5fb4 = Dwa rodzaje scenariuszy działają poza układem Ziemia–Księżyc:

seg-fa202376da31 = <c1/> podaje wszystkie ciała katalogu w jednej epoce: położenie i prędkość, stałe fizyczne, czas światła i odległość od ciała obserwatora oraz tor orbity.

seg-9859aabbb4f4 = <c1/> umieszcza użytkownika nawigacji (orbiter lub lądownik) wokół dowolnego ciała katalogu innego niż Słońce i Ziemia, z lokalną konstelacją nawigacyjną i opcjonalną odległością w przestrzeni kosmicznej od Ziemi.

seg-ec582fa8f67f = Rodzaj <c1/> używa tego samego katalogu do budowy konstelacji wokół każdego z tych ciał (<a1>CONSTELLATION-DESIGN.md</a1>).

seg-31f150c83173 = Kod: <c1/> (katalog i jego stałe), <c2/> (efemerydy analityczne), <c3/> (<c4/>, dostawca czytany przez oba rodzaje), <c5/> i <c6/> (rodzaje) oraz <c7/> (czas światła, odległość dwukierunkowa i opóźnienie Shapiro). Testy: <c8/> oraz testy jednostkowe każdego modułu.

seg-3ce9aab4916e = Katalog

seg-35cd9ebaf04e = Osiemnaście ciał: Słońce, osiem planet, Pluton, Księżyc, Fobos, Deimos, cztery księżyce galileuszowe (Io, Europa, Ganimedes, Kallisto) i Tytan. Nazwy są dopasowywane bez względu na wielkość liter. Dla każdego <c1/> zawiera parametr grawitacyjny GM, promienie równikowy i objętościowy średni, drugą harmoniczną zonalną <c2/> wraz z jej promieniem odniesienia, tam gdzie go opublikowano, oraz model bieguna i południka zerowego Międzynarodowej Unii Astronomicznej (IAU) (gwiazdowy okres obrotu, ujemny dla obrotu wstecznego). Każda wartość podaje w kodzie swoje źródło.

seg-525b8b29345d = Skąd pochodzą położenia

seg-0fd4c3af55ba = Merkury do Saturna oraz Ziemia, z tabeli { "1" } (od { "1800" } AD do { "2050" } AD)

seg-9d820791a27b = elementy keplerowskie Jet Propulsion Laboratory (JPL) według Standisha i Williamsa, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>

seg-d8549658ae99 = Wszystkie osiem planet z tabel 2a/2b (od { "3000" } BC do { "3000" } AD)

seg-1f0b417c3809 = elementy długookresowe z tej samej strony

seg-bfe1c209044a = Uran i Neptun z tabeli { "1" }

seg-ba5dfdd2de52 = wiersz tabeli { "1" } z { "1992" } (tylko od { "1800" } AD do { "2050" } AD; obecna strona go usunęła i nie podaje błędu)

seg-001ca2ad22e1 = Księżyc

seg-6ff6068aeacf = szereg księżycowy Montenbrucka i Gilla, z rozdzieleniem barycentrum Ziemia–Księżyc

seg-f906cffa45a2 = Fobos, Deimos, księżyce galileuszowe, Tytan

seg-6ba84144ad88 = średnie elementy JPL z modelem rotacji IAU

seg-d5640ad2cd08 = <c1/> (domyślnie) bierze tabelę { "1" } w zakresie od { "1800" } AD do { "2050" } AD, a tabele 2a/2b poza nim; <c2/> i <c3/> wymuszają jedną z nich. Pluton poza swoją tabelą to błąd, a nie ekstrapolacja. Epoka to data i czas w formacie ISO { "8601" } w uniwersalnym czasie koordynowanym (UTC), przeliczone przez czas ziemski (TT) z sekundami przestępnymi na barycentryczny czas dynamiczny (TDB), albo juliańska data TDB podana bezpośrednio przez <c4/>.

seg-912a2223e495 = Wyrocznią jest JPL Horizons (<a1>https://ssd.jpl.nasa.gov/horizons/</a1>, Development Ephemeris DE441), z zapytanymi wektorami zatwierdzonymi w <c1/>. Wiersz planety jest VALIDATED tam, gdzie mieści się w dwukrotności nominalnego błędu podanego na stronie Standisha. Zmierzone przez <c2/>:

seg-d8bbd5e4f483 = Tabela { "1" }, Merkury do Saturna oraz barycentrum Ziemia–Księżyc, { "12" } epok od { "1800" } do { "2049" }: najgorzej { "1.87" } razy błąd nominalny (odległość Saturna).

seg-18568cec6c91 = Tabele 2a/2b, wszystkie osiem planet, { "15" } epok od około { "1000" } BC do { "2500" } AD: najgorzej { "1.71" } razy (odległość Marsa).

seg-7f3aa4a24e8f = Uran i Neptun z tabeli { "1" } przekraczają wartości ze strony względem DE441: { "2.04" } i { "5.16" } razy nominalny błąd długości. Są przypięte poniżej sześciokrotności i pozostają MODELLED.

seg-41d2f404224b = Pluton: w granicach { "39.2" } sekundy łuku w długości i { "1.14e9" } m w odległości.

seg-11c31908ba69 = Księżyce, najgorszy kąt widziany z planety w latach od { "2000" } do { "2040" }: Fobos { "5.65" } deg, Deimos { "0.38" }, Io { "0.40" }, Europa { "1.63" }, Ganimedes { "0.22" }, Kallisto { "0.27" }, Tytan { "3.31" }. Księżyc geocentryczny: { "0.046" } deg.

seg-24d36a3ce8d4 = Prędkości planet: najgorszy błąd względny { "3.72e-3" } prędkości (MODELLED).

seg-0bae9b8d09ea = Księżyc i siedem księżyców zmierzono z przypiętymi progami, ale nie istnieje opublikowana granica, względem której dałoby się je potwierdzić, więc są MODELLED.

seg-2cf791a940ea = Efemerydy analityczne nie potrzebują pliku jądra. Jądro JPL Development Ephemeris (położenia klasy DE) jest czytane wyłącznie przez osobne skrzynki walidacji krzyżowej w <c1/>, przez ten sam trait <c2/>; główna skrzynka od nich nie zależy.

seg-5bff2c54125b = Dane wejściowe: <c1/> (domyślnie 2026-01-01T00:{ "00" }:{ "00" }) lub <c2/>; <c3/> (domyślnie wszystkie osiemnaście); <c4/> (domyślnie Ziemia); <c5/> na orbitę (od { "8" } do { "2000" }, domyślnie { "120" }); <c6/>; oraz dowolna liczba <c7/>, każde odbierane w epoce.

seg-5787ece2c791 = Dla każdego ciała wynik podaje jego klasę i ciało macierzyste, identyfikator NASA Navigation and Ancillary Information Facility (NAIF), heliocentryczne położenie i prędkość w Międzynarodowym Niebieskim Układzie Odniesienia (ICRF, równikowy J2000) w metrach i metrach na sekundę, długość, szerokość i odległość ekliptyczną, położenie względem ciała macierzystego, okres orbitalny, stałe wymienione wyżej, biegun i południk zerowy w epoce, nominalny błąd Standisha tam, gdzie istnieje, jego etykietę i ciąg metody oraz tor orbity w jednym obiegu (heliocentryczny dla planety, wyśrodkowany na ciele macierzystym dla księżyca; pojedynczy punkt dla Słońca). Łącze od obserwatora i każde dodatkowe łącze podaje:

seg-36bad4b7b4ba = newtonowski jednokierunkowy czas światła, rozwiązany radiometrycznym solwerem czasu światła z punktem stałym, z nadajnikiem w jego położeniu opóźnionym, oraz odpowiadającą mu odległość jednokierunkową;

seg-c5602eb76a05 = dwukierunkowy czas światła i odległość;

seg-dab8e2db61d3 = opóźnienie Shapiro od Słońca, podawane osobno i niedodawane;

seg-90d00587a59f = kąt odległości od Słońca.

seg-4c172f9f7cf6 = Czas światła jest VALIDATED względem jednokierunkowego czasu światła podawanego przez Horizons: Mars i Jowisz do środka Ziemi w czterech epokach od { "2000" } do { "2040" }, najgorszy błąd { "0.070" } s dla Marsa wobec progu { "0.207" } s oraz { "1.31" } s dla Jowisza wobec { "4.04" } s. Próg to dwukrotność sumy błędów odległości Standisha celu i barycentrum Ziemia–Księżyc, podzielona przez prędkość światła: czas światła nie może być lepszy niż położenia. Jest to newtonowski geometryczny czas światła, a nie obserwabla z poprawkami relatywistycznymi lub plazmowymi.

seg-4f8cd6aef754 = Dołączony <c1/> podaje wszystkie osiemnaście ciał w epoce 2026-09-28T00:{ "00" }:{ "00" } z torami o 180 punktach oraz dodaje łącza Mars–Jowisz (jednokierunkowo { "2193.539" } s), Saturn–Ziemia ({ "4212.176" } s) i Europa–Jowisz ({ "2.218" } s).

seg-d22cc535f04b = Użytkownik nawiguje wokół ciała wybranego po nazwie (dowolne ciało katalogu poza Słońcem i Ziemią, których ten rodzaj odmawia) przy dwóch rodzajach pomiarów:

seg-9eeb7f77aec7 = jednokierunkowe pseudoodległości z konstelacji nawigacyjnej Walker delta wokół ciała (<c1/> po <c2/>, przesunięcie fazowe między płaszczyznami <c3/>), lecące po orbitach dwóch ciał z własnym dryfem wtórnym <c4/> tego ciała; zegar użytkownika jest nieznany, więc te wiersze zawierają kolumnę błędu zegara;

seg-56ac318f6f27 = opcjonalnie dwukierunkowa odległość od środka Ziemi (<c1/>), która nie wymaga zegara użytkownika i jest podawana jako odległość jednokierunkowa z własnym szumem. Kierunek i odległość Ziemi pochodzą z efemeryd analitycznych w każdej epoce.

seg-551d44492aae = Linia widzenia jest zablokowana, gdy przechodzi wewnątrz średniego promienia ciała (test cięciwy rodzaju <c1/>), a użytkownik na powierzchni potrzebuje też maski elewacji. W każdej epoce przebieg wyznacza geometryczny i pozycyjny współczynnik rozmycia dokładności (GDOP, PDOP) samej konstelacji, formalną niepewność pozycji o jednym sigma z wierszem Ziemi i bez niego oraz wyznaczenie pozycji metodą najmniejszych kwadratów Gaussa–Newtona z ziarnem w obu wariantach, dzięki czemu raport pokazuje, co dodaje łącze w przestrzeni kosmicznej.

seg-6f1161567330 = najwyższy poziom

seg-432421ccb9d7 = 2027-02-19T00:{ "00" }:{ "00" }, opozycja Marsa

seg-0b688042ed44 = { "86 400" } s, { "600" } s

seg-c7b3aaecd6e2 = <c1/> (lub <c2/>)

seg-c452a6f7a9d4 = orbiter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-67f7b23bf604 = { "400" } km, { "75" } deg, { "0" }, { "0" }, { "0" }

seg-b412b65733d8 = powierzchnia: <c1/>, <c2/>, <c3/>

seg-7639d2583131 = trzy średnie promienie

seg-fe4a8d9da406 = { "60" } deg

seg-7ac449fb9569 = { "1" } m

seg-128c4a5edd9b = <c1/> (użytkownik na powierzchni)

seg-3d4b760f6ed6 = { "10" } deg

seg-498493929023 = true, { "1" } m

seg-18e477dc7f02 = <c1/> to rektascensja węzła wstępującego w układzie równikowym ciała, a <c2/> to argument szerokości w epoce.

seg-a743b0b5e668 = Dwa dołączone scenariusze, tak jak działają w kshana { "0.36" } (przenośna matematyka, taka sama na każdej platformie):

seg-b24010bdb302 = Użytkownik

seg-cb9cd741ba85 = orbiter, { "300" } km, { "93" } deg

seg-fa11e61f0d1d = powierzchnia, { "20" } deg N, { "60" } deg E

seg-e17a9ae6905c = Przekaźniki

seg-359db3c9ad19 = { "12" } na { "10 000" } km, { "60" } deg

seg-1bb041045be4 = { "12" } na { "4500" } km, { "55" } deg, maska { "10" } deg

seg-604aefd62668 = Zakres

seg-825603e2fbed = jeden sol, { "296" } epok

seg-372159825c11 = { "306 822" } s, { "171" } epok

seg-132e3bbcc94c = Czas światła do Ziemi, w jedną stronę / tam i z powrotem

seg-76351e2f75f8 = { "338.3" } s / { "676.6" } s

seg-2d0234ec6301 = { "2182.9" } s / { "4365.8" } s

seg-d0f05f440103 = Ziemia w widoku

seg-d7ad84776ec6 = { "0.811" } epok

seg-44bf83b16660 = Dostępność, tylko przekaźniki / z odległością od Ziemi

seg-07e0a8499670 = Mediana PDOP

seg-e802f5920237 = Błąd średniokwadratowy pozycji, tylko przekaźniki / z odległością od Ziemi

seg-ed769d9370a0 = { "1.883" } m / { "1.629" } m

seg-873187e2b016 = { "112.742" } m / { "86.499" } m

seg-bcba58871d0b = Mediana formalnego sigma, tylko przekaźniki / z odległością od Ziemi

seg-536757d9f141 = { "1.375" } m / { "1.304" } m

seg-14d7b5dc82e8 = { "5.360" } m / { "4.239" } m

seg-67d3d30060ad = (RMS: wartość średniokwadratowa.) Jedna epoka Europy (t = { "16 200" } s) leży na krawędzi dostępności, gdzie ostatni bit obliczonego promienia rozstrzyga, czy wyznaczenie pozycji z odległością od Ziemi zostanie wykonane. Przed { "0.36" } rozstrzygała o tym biblioteka matematyczna gospodarza, więc ten sam scenariusz drukował { "0.719" } i { "86.147" } m w Linux x86-64 oraz { "0.725" } i { "85.800" } m w macOS arm64 dla dwóch wartości „z odległością od Ziemi”. Od { "0.36" } każda funkcja przestępna jest liczona przenośną biblioteką matematyczną, epoka rozstrzyga się jednakowo na każdej platformie (natywnie i w WebAssembly te same bajty), a wartości wynoszą { "0.713" } i { "86.499" } m (<a1><c1/></a1>). Wokół Europy odległość od Ziemi podnosi dostępność z { "0.480" } do { "0.713" } epok. Tam, gdzie Ziemia nigdy nie wychodzi zza limbu, łącze niczego nie dodaje: lądownik na { "89.5" } deg S na Księżycu pod powłoką 12 przekaźników na { "5000" } km ma Ziemię w widoku w { "0" } z { "145" } epok, a jego błędy są takie same z łączem i bez niego.

seg-41507568efb8 = <b>MODELLED.</b> Orbity przekaźników pomijają ciała trzecie (przyciąganie Jowisza na przekaźniki wokół Europy nie jest modelowane), szum jest gaussowski na podanych poziomach, a model pomiaru jest chwilowy, bez opóźnienia o czas światła. Co jest sprawdzane: okres przekaźnika względem trzeciego prawa Keplera dla ciała, orbiter utrzymujący swój promień i lądownik na powierzchni, odległość od Ziemi nigdy niepogarszająca formalnej niepewności, błędy wyznaczenia pozycji z ziarnem zgodne z formalnym sigma (pierwiastek ze średniej kwadratów błędu przez sigma w [{ "0.6" }, { "1.5" }]) oraz deterministyczny przebieg. Nic z tego nie jest danymi nawigacyjnymi żadnej misji.

seg-b78c9e331a43 = Rodzaj <c1/>

seg-b9f40c641a49 = Mimo nazwy <c1/> jest rodzajem dla satelity okołoziemskiego: jeden satelita, z zestawu elementów dwuwierszowych (TLE) przez propagator Simplified General Perturbations { "4" } (SGP4) albo z orbity analitycznej, na siatce czasu. W każdym kroku podaje stan inercjalny (położenie i prędkość) w układzie prawdziwego równika i średniego równonocy (TEME) oraz w Geocentrycznym Niebieskim Układzie Odniesienia (GCRS), położenie w układzie związanym z Ziemią, punkt podsatelitarny w World Geodetic System { "1984" } (WGS { "84" }) oraz, dla opcjonalnej stacji naziemnej, azymut, elewację, odległość i prędkość zmiany odległości. <c2/> przyjmuje tekst pliku <c3/> Międzynarodowej Służby Ruchu Obrotowego Ziemi i Systemów Odniesienia (IERS) z UT1−UTC i ruchem bieguna dla każdej epoki. Kod: <c4/>.

seg-1babcba7b4ba = Relatywistyczne człony czasu światła poza osobno podawanym opóźnieniem Shapiro oraz opóźnienie w plazmie słonecznej.

seg-0c49dfc777ca = Położenia lepsze niż dokładność Standisha i elementów średnich podana wyżej; w głównej skrzynce nie ma czytnika jądra.

seg-18d925e53ce0 = Perturbacje od ciał trzecich dla przekaźników <c1/> i dla orbit <c2/>.

seg-3968ed54e3fe = Teren na dowolnym ciele: ciało jest swoją średnią sferą.

seg-4650526c532e = Eksporty interoperacyjności: CZML, KML i GeoJSON opisują położenia względem Ziemi, więc scenariusze <c1/> i <c2/> niczego nie eksportują (<a1>INTEROP.md</a1>).

seg-cb7e3d4bf5aa = E. M. Standish i J. G. Williams, „Keplerian Elements for Approximate Positions of the Major Planets”, JPL Solar System Dynamics, <a1>https://ssd.jpl.nasa.gov/planets/approx_pos.html</a1>.

seg-aaf6a1f91c1a = O. Montenbruck i E. Gill, <em>Satellite Orbits: Models, Methods and Applications</em>, Springer, { "2000" }, §{ "3.3.2" }.

seg-8b7aa3bb95f0 = B. A. Archinal i in., „Report of the IAU Working Group on Cartographic Coordinates and Rotational Elements: { "2015" }”, <em>Celestial Mechanics and Dynamical Astronomy</em> { "130" }, { "2018" }.

seg-10c8408cab27 = JPL Horizons, <a1>https://ssd.jpl.nasa.gov/horizons/</a1>.

seg-e95a41f0ded7 = <s1>Poprzednia</s1>Walidacja modelu sił

seg-a801b99f7040 = <s1>Następna</s1>Księżycowa stacja referencyjna

seg-e0aba02258f4 = Rodzaj ephemeris
