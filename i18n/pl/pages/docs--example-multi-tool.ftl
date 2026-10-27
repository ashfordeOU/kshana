# docs--example-multi-tool: translations (pl)

seg-077d900655af = Źródło: <c1/>

seg-42e93cd44e94 = Przykład krok po kroku — { -brand } jako warstwa łącząca wiele narzędzi do analizy misji

seg-286cf0e7bb71 = Ten przykład prowadzi jedną trajektorię od początku do końca przez oparte na normach rodzaje scenariuszy interoperacyjności i analizy misji, pokazując, jak { -brand } stoi <em>pomiędzy</em> wysokiej wierności narzędziami, z których program już korzysta, zamiast z nimi konkurować: GMAT (General Mission Analysis Tool), Orekit i STK (Systems Tool Kit) do projektowania trajektorii oraz Basilisk lub { "42" } do symulacji systemu kontroli orientacji i orbity (AOCS). Każdy krok jest uruchamialnym rodzajem scenariusza, a każdy wynik niesie <c1/> podającą jego zakres i poziom dowodowy.

seg-7198d05bece6 = Uwaga o rzetelności: to jest potok <em>geometryczno-analityczny</em> na poziomie przed fazą A / studium wariantów (przed pierwszą formalną fazą projektową misji). Nie jest to certyfikacja dynamiki lotu; zob. pole <c1/> każdego rodzaju.

seg-70c18138497b = Inne skróty użyte poniżej: FDS (system dynamiki lotu), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, propagator elementów dwuwierszowych), TOML (format pliku scenariusza) i CLI (interfejs wiersza poleceń).

seg-7cc0d4d15c4a = Potok

seg-09a321d36a10 = Kroki są osobnymi przebiegami: każdy bierze dane wejściowe z własnego pliku scenariusza, więc liczbę z jednego przenosisz do następnego (na przykład odległość ukośną z <c1/> do <c2/>) przez edycję następnego pliku. Rodzaj <c3/> może zawierać kilka rodzajów w jednym przebiegu przy wspólnych warunkach; zob. <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Każde polecenie poniżej uruchamia się z katalogu głównego repozytorium, a podsumowanie pod nim to pierwszy wiersz, który kshana { $version } wypisuje dla dołączonego scenariusza.

seg-7939b15235c8 = { "1" }. Wczytaj trajektorię, którą wytworzył projektant (<c1/>)

seg-4b732dd54291 = GMAT, Orekit i STK wszystkie <em>eksportują</em> komunikaty CCSDS Orbit Ephemeris Message. { -brand } je importuje (drugi kierunek mostu), więc analiza { -brand } może zacząć od dokładnej orbity zatwierdzonej przez projektanta trajektorii, a nie od ponownie wyprowadzonego przybliżenia:

seg-3136cfd5a40e = Podaje segmenty, obiekty, układy odniesienia i zakres epok oraz kontrolę spójności prędkości, pokazując, że efemerydy wczytano wiernie (błąd w obie strony poniżej { "1" }×{ "10" }⁻⁶ km). Gdy zamiast tego poda się zewnętrzny plik w <c1/>, raportuje, co sparsował: po podaniu OEM, który zapisuje <c2/>, wypisuje <c3/>. <c4/> jednoznacznie stwierdza, że jest to strukturalna i fizyczna kontrola wczytania, a nie walidacja dokładności orbity źródła.

seg-e2c563fcb8cb = { "2" }. Kiedy jest widoczny ze stacji naziemnej? (<c1/>)

seg-d66361888ede = Przewiduje przeloty (wschód i zachód) nad stacją powyżej maski elewacji: pozyskanie sygnału (AOS), czas największego zbliżenia (TCA), utrata sygnału (LOS), maksymalna elewacja i czas trwania, oraz łączny czas dostępu. To jest zapytanie planistyczne segmentu naziemnego. Orbita to zestaw elementów SGP4 przeniesiony do układu związanego z Ziemią łańcuchem IAU 2006/2000A, a elewacje są pozorne: refrakcja ITU-R P.834-9 i czas światła w łączu w dół, każde z nich przełączane (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Czy łącze się domyka? (<c1/>)

seg-47bdb9d4700c = Dla przelotu wstaw odległość ukośną i wartości terminala do równania łącza CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network):

seg-db12a99edcd2 = Podaje tłumienie w wolnej przestrzeni (FSPL), stosunek nośnej do gęstości szumu (C/N₀), energię na bit względem gęstości szumu (Eb/N₀), margines oraz to, czy łącze <b>się domyka</b> względem wymaganego Eb/N₀: kontrolę wykonalności łączności, która zamienia „jest widoczny” w „możemy faktycznie pobrać dane”. Liczby wynikają wprost z danych wejściowych w pliku (tutaj EIRP { "55" } dBW, efektywna moc promieniowana izotropowo, do odbioru z G/T { "53" } dB/K, stosunek zysku do temperatury szumowej); przed odczytaniem marginesu wstaw wartości własnego terminala. To deterministyczne obliczenie, a nie skalibrowana karta katalogowa terminala.

seg-85ad46986461 = { "4" }. Jak szybko środowisko ją wytraca? (<c1/>)

seg-8977b12fd934 = Wyznacza gęstość neutralną termosfery z aktywności słonecznej (F10.7, strumień radiowy { "10.7" } cm, i jego 81-dniowa średnia F10.7a) oraz geomagnetycznej (wskaźniki Kp i ap) przez temperaturę egzosferyczną Jacchii-71. To oddaje ~{ "5" }–{ "10" }× wahania gęstości w cyklu słonecznym, które pomija statyczna atmosfera, więc szacunek czasu życia orbity lub oporu odzwierciedla reżim pogody kosmicznej, a nie stałą atmosferę. Od { "0.30" } gęstość jest gęstością termosfery Jacchii { "1971" }, scharakteryzowaną względem NRLMSISE-00 (Naval Research Laboratory, spektrometr mas i rozpraszanie niekoherentne), ale nie jest to atmosfera NRLMSISE-00 sprawdzona względem danych.

seg-4b5bdadf3e7e = { "5" }. Przekaż wynik dalej (eksporty)

seg-f4a438636ea8 = To samo CLI zapisuje standardowe pliki dla następnego narzędzia. Dla scenariusza <c1/> opcja <c2/> zapisuje efemerydy CCSDS OEM { "2.0" } z prędkością (plik, który czytają GMAT, Orekit i STK), <c3/> precyzyjne efemerydy SP3 (Standard Product { "3" }), a <c4/> katalog CCSDS Orbit Mean-Elements Message. <c5/> obejmuje przeglądarki: CZML (Cesium Language), KML (Keyhole Markup Language, dla Google Earth), GeoJSON, pliki efemeryd STK (<c6/>, po jednym na satelitę plus użytkownika) i nagrania SigMF (Signal Metadata Format) z rodzaju <c7/>. <c8/> mówi, które mają zastosowanie do scenariusza. Dla Księżyca rodzaj <c9/> emituje księżycowy układ odniesienia, skalę czasu i efemerydy jako CCSDS OEM z kontrolą compliance. Zob. <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Dlaczego to jest warstwa łącząca, a nie konkurent

seg-cd78b0435abb = Każdy krok jest małym, audytowalnym, odtwarzalnym scenariuszem z jawną etykietą zakresu. Narzędzia wysokiej wierności zajmują się optymalizacją trajektorii, sześciostopniowym (6-DoF) AOCS i aerotermicznym wejściem, opadaniem i lądowaniem (EDL); { -brand } zajmuje się <b>otwartą, cytowalną, uruchamialną tkanką łączną</b>: wczytuje standardowe formaty, odpowiada na przekrojowe pytania o geometrię i wykonalność oraz przekazuje wynik dalej, na poziomie, który każdy partner może uruchomić bez licencji. Zob. także towarzyszące rodzaje analizy misji <c1/>, <c2/>, <c3/>, <c4/> i <c5/>.

seg-af1ab3c55fe6 = <s1>Poprzednia</s1>{ "3" } · Kwantowe wobec klasycznych

seg-b0765a28b4ce = <s1>Następna</s1>Rodzaje scenariuszy

seg-dc88ec5ccc43 = { "1" }. Wczytaj trajektorię, którą wytworzył projektant (oem-interop)

seg-cdff21ef6984 = { "2" }. Kiedy jest widoczny ze stacji naziemnej? (passes)

seg-afa47b4283a3 = { "3" }. Czy łącze się domyka? (link-budget)

seg-e508e844bf2d = { "4" }. Jak szybko środowisko ją wytraca? (space-weather)
