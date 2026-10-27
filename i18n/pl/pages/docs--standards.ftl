# docs--standards: translations (pl)

seg-4a2ce9f33ab2 = zapis

seg-9120d3e96e5e = odczyt

seg-5ad814c7ef9e = Uwagi

seg-aab745a65e76 = Moduł

seg-bf09433a7342 = GeoJSON

seg-906440b861cd = Ramka

seg-32b620b3574e = Zastosowanie

seg-8ba331635865 = Standardy i interoperacyjność

seg-96a449a63d11 = Źródło: <c1/>

seg-3ed65a16e7d0 = Kshana mówi standardowymi formatami wymiany społeczności GNSS (globalny system nawigacji satelitarnej), dynamiki lotu i czasu, aby mogła współistnieć z RTKLIB (otwartoźródłową biblioteką kinematycznego pozycjonowania w czasie rzeczywistym), gLAB, Ginan, GMAT (General Mission Analysis Tool), Orekit i narzędziami centrów analiz IGS (International GNSS Service), zamiast tkwić na prywatnej wyspie. Ta strona przypisuje <b>formaty wymiany</b>, które silnik odczytuje lub emituje, do modułu, który każdy z nich implementuje, i do autorytatywnej specyfikacji.

seg-d1aa512ad4ee = Dotyczy formatów, czyli rzeczy mających kierunek odczytu lub zapisu. Standardy sygnałów i algorytmów, które silnik <em>implementuje</em>, a nie odczytuje (IS-GPS-200 (IS: Interface Specification; GPS: Global Positioning System), IEEE (Institute of Electrical and Electronics Engineers) { "1139" }, RTCA (dawniej Radio Technical Commission for Aeronautics) DO-229E, IGRF-14 (IGRF: International Geomagnetic Reference Field), odniesienie ARAIM (zaawansowane autonomiczne monitorowanie integralności przez odbiornik) WG-C (WG: Working Group), CCSDS (Consultative Committee for Space Data Systems) 401/DSN (DSN: Deep Space Network)) są udokumentowane dowodami wiersz po wierszu w <a1><c1/></a1>.

seg-656920618fb7 = Formaty, którymi mówi silnik

seg-4fe4920a3fa1 = Standard

seg-d08f1943c53b = Kierunek

seg-968a1d48364c = Specyfikacja / autorytet

seg-304ffba9669f = <b>CCSDS OEM</b> (Orbit Ephemeris Message)

seg-68d762928f76 = odczyt <b>i</b> zapis

seg-eea6e5c8c220 = CCSDS 502.0-B Orbit Data Messages, postać KVN (notacja klucz-wartość)

seg-be700901c03e = Tabelaryczne efemerydy wektora stanu wczytywane przez GMAT, Orekit, STK (Systems Tool Kit). <c1/> odczytuje je z powrotem; <b>sprawdzone względem niezależnego wzorca przez odtworzenie dosłownego przykładu z Rysunku G-11 Blue Book CCSDS 502.0-B-3</b> (<a1><c2/></a1>). Opcjonalny <b>blok kowariancji</b> położenia i prędkości { "6" }×{ "6" } (<c3/>, 21-elementowa serializacja KVN dolnego trójkąta z opcjonalnym <c4/>) jest zarówno zapisywany (<c5/>), jak i odczytywany (<c6/>), symetrycznie w obie strony (testy <a2><c7/></a2>).

seg-3c439cc66ea6 = <b>CCSDS OMM</b> (Orbit Mean-Elements Message)

seg-8e9f975d443b = CCSDS 502.0-B-2, postać KVN

seg-fb5218415d68 = Publikacja standardowa elementów średnich SGP4/TLE (SGP4: Simplified General Perturbations { "4" }; TLE: zestaw elementów dwuwierszowych) (ruch średni, e, i, Ω, ω, M, BSTAR (człon oporu propagatora orbity)). Dostępne z CLI (CLI: interfejs wiersza poleceń) w scenariuszu <c1/> przez <c2/> lub <c3/> (jeden OMM na satelitę zdefiniowanego przez TLE, z jego rzeczywistym identyfikatorem NORAD (North American Aerospace Defense Command), oznaczeniem COSPAR (Committee on Space Research) i epoką; <a1><c4/></a1>). Postać XML (Extensible Markup Language) i czytnik są kolejnymi krokami.

seg-08425c4b2093 = <b>CCSDS TDM</b> (Tracking Data Message)

seg-bf870037a77d = CCSDS 503.0-B Tracking Data Message, postać KVN

seg-cd96db42ab43 = Rekordy śledzenia odległości / Dopplera / kąta, które przejście DSN/ESTRACK (ESTRACK: European Space Tracking network) dostarcza do systemu OD (wyznaczania orbity). <b>Sprawdzone względem niezależnego wzorca przez odtworzenie dosłownego przykładu z Rysunku E-9 Blue Book CCSDS 503.0-B-2</b> (<a1><c1/></a1>).

seg-4dd7358264b8 = <b>CCSDS Space Packet</b> ({ "133.0" })

seg-40accc5f1a67 = CCSDS 133.0-B-2 Space Packet Protocol

seg-ed9c8bdddd6d = 6-oktetowe ramkowanie nagłówka głównego TM/TC (TM: telemetria; TC: telekomenda), wymieniane przez systemy naziemne. <b>Koder odtwarza opublikowane, bajtowe wektory testowe niezależnej biblioteki <c1/></b> (testy <a1><c2/></a1>).

seg-aa942198bb2e = <b>SP3-c (SP3: Standard Product { "3" }, format dokładnych orbit) / SP3-d</b> (dokładne efemerydy)

seg-4d4237e15ef1 = IGS Standard Product { "3" } (c/d)

seg-8d1089fbd59d = Szereg czasowy położenia w układzie związanym z Ziemią (ECEF) i czasu zegara. Przejście w obie strony sprawdzone względem niezależnego wzorca do < { "0.5" } m na rzeczywistej migawce <c1/> (<a1><c2/></a1>).

seg-761698fcf960 = <b>RINEX (Receiver Independent Exchange Format) { "3" }</b> (nawigacyjne dane rozgłaszane)

seg-897068cff342 = RINEX { "3" }.x NAV (IS-GPS-200, Galileo ICD (dokument kontroli interfejsu), BeiDou ICD, GLONASS (rosyjski Globalny System Nawigacji Satelitarnej) ICD)

seg-1b7710db3abf = Wczytywanie NAV wielu GNSS (GPS LNAV (dawny komunikat nawigacyjny), Galileo F/NAV, QZSS (japoński Quasi-Zenith Satellite System), BeiDou MEO/IGSO (MEO: średnia orbita okołoziemska; IGSO: nachylona orbita geosynchroniczna), wektor stanu GLONASS); użyteczne jako pełnoprawne źródło <c1/>.

seg-44991b52d1ff = <b>TLE / 3LE</b> (elementy dwu-/trzywierszowe)

seg-17769f14095d = NORAD / Celestrak, AIAA (American Institute of Aeronautics and Astronautics) 2006-6753

seg-8d4dd42edc89 = Propagowane przez sprawdzony względem niezależnego wzorca rdzeń SGP4/SDP4 (SDP4: Simplified Deep-space Perturbations { "4" }) ({ "4.12" } mm wobec { "666" } oficjalnych wektorów AIAA).

seg-498aac915067 = <b>RINEX 3.0x</b> (obserwacje)

seg-437d07b5aa4f = RINEX 3.0x OBS (oczekuje się, że { "4.00" } się odczyta, ale nigdy nie sprawdzono tego na pliku { "4.00" })

seg-ac97f77f142c = Druga połowa RINEX: własne rekordy kodu/nośnej/Dopplera/SNR (SNR: stosunek sygnału do szumu) odbiornika (<c1/>). To dane wejściowe, które solwer <c2/> pozycjonowania jednopunktowego zużywa razem z plikiem nawigacyjnym rozgłaszanym (<a1><c3/></a1>, rzeczywista stacja IGS ABMF).

seg-2418cd0e4d79 = <b>IONEX</b> (IONosphere map EXchange format; globalne mapy TEC (całkowitej zawartości elektronów))

seg-bf1bb42f04c4 = IONEX { "1" }.x (produkt jonosferyczny IGS)

seg-af9efa0df270 = <c1/> odczytuje globalne siatki całkowitej zawartości elektronów IGS — <em>zmierzoną</em> alternatywę dla rozgłaszanej poprawki Klobuchara — z dwuliniową interpolacją przestrzenną i czasową oraz odwzorowaniem nachylenia na opóźnienie ukośne.

seg-6f0da4b59d7c = <b>IERS (Międzynarodowa Służba Ruchu Obrotowego Ziemi i Systemów Odniesienia) <c1/> / Bulletin B</b> (orientacja Ziemi)

seg-197dfa18ca19 = IERS Conventions; IERS EOP (parametry orientacji Ziemi) { "14" } C04 / <c1/>

seg-0d102d904cfe = UT1 (Universal Time { "1" }, czas obrotu Ziemi)−UTC (uniwersalny czas koordynowany) i ruch bieguna z oficjalnego produktu, łącznie z wierszami <b>przewidywanymi</b>, tak aby redukcję układów można było uruchamiać w czasie rzeczywistym, a wzrost błędu predykcji budżetować (<a1><c1/></a1>).

seg-2a4e274838ef = <b>KIF</b> (Kshana Interchange Format)

seg-193b33461507 = to repozytorium — zob. <a1><c1/></a1>

seg-33ef8d792a90 = Neutralna, wersjonowana koperta, w którą można opakować każdy artefakt: <c1/> / <c2/> / <c3/> / <c4/> / <c5/>, z jawnym werdyktem zgodności głównej i pobocznej wersji dla konsumenta. To nie jest standard zewnętrzny; opisany tu, ponieważ obce narzędzie musi go rozpoznać.

seg-a492f437efd0 = LunaNet / IOAG (Interagency Operations Advisory Group) wymiana księżycowa

seg-b19cf72da934 = zapis (metadane czasu także odczyt)

seg-d641c72a6449 = specyfikacja interoperacyjności LunaNet / architektura łączności księżycowej IOAG, ponad CCSDS { "502.0" }

seg-cc796afe7a72 = Układ księżycowy, księżycowa skala czasu i księżycowe efemerydy emitowane w formach CCSDS zgodnych z LunaNet/IOAG (<c1/>, <c2/>, <c3/>), z kontrolą pól emitowanego OEM (<a1><c4/></a1>).

seg-5abc05382382 = <b>CZML</b> (Cesium Language)

seg-da7e20d3786b = format pakietów CZML CesiumJS

seg-8d3a73646be3 = Strumień JSON (JavaScript Object Notation) pakietów ze znacznikami czasu dla globusa CesiumJS; obiekty ruchome zapisane w GCRS (<c1/>). <c2/> dla każdego rodzaju, który umieszcza obiekty na Ziemi.

seg-cd7a91109a8d = <b>KML</b> (Keyhole Markup Language)

seg-be4dd74f3915 = OGC (Open Geospatial Consortium) KML { "2.2" }

seg-57468e6d97f2 = Długość, szerokość i wysokość w układzie związanym z Ziemią dla Google Earth i narzędzi GIS (systemów informacji geograficznej). <c1/>.

seg-46d977015b07 = zapis <b>i</b> odczyt (trasa)

seg-42b8e3129e64 = IETF (Internet Engineering Task Force) RFC { "7946" }

seg-425a83b44545 = Geometria w układzie związanym z Ziemią dla map internetowych i narzędzi GIS (<c1/>); <c2/> jest odczytywany z powrotem jako wejście toru prostego dla rodzajów, które nim lecą (<c3/>).

seg-d9b137e11514 = <b>Efemerydy STK</b> (<c1/>, <c2/>)

seg-347ee6f6c1df = format pliku efemeryd Ansys STK

seg-45576578d357 = Położenie i prędkość inercjalne (<c1/>) dla STK i narzędzi, które czytają jego format efemeryd. <c2/>.

seg-03fd79cce4a4 = <b>SigMF</b> (Signal Metadata Format)

seg-42272f73f456 = specyfikacja SigMF

seg-202b559c30a6 = Zespolone nagrania pasma podstawowego plus metadane JSON: rodzaj <c1/> zapisuje swoje zsyntetyzowane próbki fazy i kwadratury (IQ) (<c2/>) i odczytuje nagranie przez swój blok <c3/>.

seg-60e7c8505cb5 = <b>Tekst komunikatu nawigacyjnego LEO</b> (w stylu RINEX-4 i CSV (wartości rozdzielone przecinkami))

seg-f22442e0e8ea = układ nawigacyjny RINEX { "4" }, zaadaptowany

seg-8338e445b3a5 = Rozgłaszane efemerydy i zegar rodzaju <c1/> dla satelity niskiej orbity okołoziemskiej (LEO), eksportowane i ponownie importowane; udokumentowana adaptacja, a nie zarejestrowany typ komunikatu RINEX (MODELLED w macierzy weryfikacji).

seg-1b89ab4e93f7 = Układy odniesienia i czas

seg-dbbd023631b6 = Układ, który silnik emituje, jest jawny, a nie domyślny. Redukcja IAU (International Astronomical Union) 2006/2000A oparta na CIO (CIO: Celestial Intermediate Origin) (<a1><c1/></a1>) oraz redukcja równonocy/GMST (GMST: średni czas gwiazdowy Greenwich) TEME (prawdziwy równik, średnia równonoc) (<a2><c2/></a2>, <a3><c3/></a3>) są sprawdzone bit po bicie względem niezależnych wektorów referencyjnych SOFA/ERFA (SOFA: Standards of Fundamental Astronomy; ERFA: Essential Routines for Fundamental Astronomy) (zob. <a4><c4/></a4>).

seg-819d28bd9361 = Realizacja

seg-69aca96b7e42 = TEME

seg-ec81608934a6 = natywny dla SGP4

seg-7631c594fd1a = Prawdziwy równik, średnia równonoc — układ wyjściowy SGP4/SDP4.

seg-eeb28cc286b3 = GCRS (Geocentryczny Niebieski Układ Odniesienia) / J2000

seg-745285e29202 = precesja IAU { "2006" } + nutacja IAU 2000A/2000B

seg-3747add299d5 = <c1/> (łańcuch równonocy).

seg-4859fd3e5864 = <b>CIRS</b> (Celestial Intermediate Reference System)

seg-1c09f22adcf2 = IAU 2006/2000A CIO (X, Y, s)

seg-8891621dc302 = ITRS (Międzynarodowy Ziemski Układ Odniesienia) / ECEF

seg-a28e26cd2481 = ERA (kąt obrotu Ziemi) + ruch bieguna IERS (CIO) lub GMST + ruch bieguna (równonoc)

seg-e7426df3c59d = <c1/> (CIO, <c2/>) / <c3/> (równonoc).

seg-74a4801fd685 = geodezyjny WGS-84 (WGS: World Geodetic System)

seg-b58a44eaaa39 = dokładny + iteracyjna odwrotność

seg-4d9472dd73d3 = Skala czasu

seg-cbe7a7ce7317 = <b>TT</b> (czas ziemski)

seg-25191c1a4135 = Obliczanie argumentów precesji/nutacji/CIO (<c1/>).

seg-8c478d6b4786 = Kąt obrotu Ziemi / GMST (<c1/>).

seg-f7033ca0c13f = <b>Dwuczęściowa JD</b> (data juliańska)

seg-64a5adeacd5b = <c1/> dla rozdzielczości epoki poniżej µs.

seg-210f40885a8e = Odwzorowanie pól wyjściowych na standard (CCSDS { "502.0" })

seg-e9dbc25a3ee9 = Co dwa programy zapisujące komunikaty orbitalne umieszczają w każdym polu CCSDS ODM (Orbit Data Messages, { "502.0" }), odczytane z przebiegu <c1/> z <c2/> i <c3/>:

seg-d2b91c300b82 = Wynik Kshana

seg-119884b009cc = Pole CCSDS ODM

seg-8b0593f67c7f = Wartość / jednostka

seg-d33eb162d179 = Metadane segmentu OEM

seg-4b338284e56a = <c1/> / <c2/> / <c3/> — układ, w którym całkują propagatory, i skala czasu siatki epok, bez zmiany etykiet

seg-e0a44af9aaf8 = Epoka stanu OEM

seg-b0623bab9fcc = pierwsza kolumna każdego wiersza danych

seg-410bd5a9ba14 = czas kalendarzowy ISO-8601 (ISO: Międzynarodowa Organizacja Normalizacyjna), skala czasu GPS

seg-a7c95802e01a = Położenie i prędkość OEM

seg-0539cafabf60 = kolumny danych <c1/>

seg-8add7e800e0e = km, km/s

seg-8b386548c03c = Metadane OMM

seg-e2c63414d7c2 = Epoka OMM

seg-5109e5948d2a = postać ISO-8601 z dniem roku (epoka TLE)

seg-b74289a29c24 = Elementy średnie OMM

seg-f3492fa95178 = obr./dobę, –, deg, 1/promienie Ziemi

seg-fc82185abe10 = JSON (JavaScript Object Notation) wyniku rodzaju <c1/> niesie ten sam stan w jednostkach SI (Międzynarodowy Układ Jednostek) na próbkę: <c2/>, <c3/> / <c4/>, <c5/> / <c6/>, <c7/> (m, m/s), a także <c8/>, <c9/>, <c10/>.

seg-014d1392018e = Uczciwy zakres

seg-017c026df3d7 = OEM, TDM, Space Packet, KIF, SigMF i tekst komunikatu nawigacyjnego LEO są w trybie <b>odczytu i zapisu</b>; OMM, CZML, KML i efemerydy STK to <b>programy zapisujące</b> (czytnik OMM i serializacja XML są kolejnymi krokami); GeoJSON jest zapisywany i odczytywany z powrotem jako trasa; RINEX NAV, RINEX OBS, IONEX, produkty IERS EOP i TLE są <b>czytnikami</b>; eksport księżycowy LunaNet/IOAG jest programem zapisującym, którego metadane czasu przechodzą w obie strony. <a1><c1/></a1> wymienia, który eksport dotyczy każdego dołączonego scenariusza.

seg-68b4f5116419 = Powyższe odwzorowanie pól CCSDS/IGS jest dokumentacją, a nie stwierdzeniem, że jakikolwiek standard jest spełniony; formalna ocena względem tych standardów (i rejestracja w otwartym katalogu ESA (European Space Agency) ESSR (European Space Software Repository) / NASA (National Aeronautics and Space Administration)) jest śledzona osobno i oczekuje na przegląd.

seg-e461587ad2cf = Niezależna kontrola numeryczna redukcji układów przez SPICE/ANISE (SPICE: Spacecraft, Planet, Instrument, C-matrix, Events; ANISE: Attitude, Navigation, Instrument, Spacecraft, Ephemeris — czysto rustowy zestaw narzędzi geometrii planetarnej) jest dostarczona w samodzielnej skrzynce wyłączonej z przestrzeni roboczej <c1/>: <c2/> względem rotacji GCRF (Geocentric Celestial Reference Frame) → ITRF93 (International Terrestrial Reference Frame { "1993" }) w ANISE w ośmiu epokach { "2020" }–{ "2023" } zgadza się do ≤ { "0.86" } m na ziemi i ≤ { "3.6" } m na orbicie GNSS (zob. <a1><c3/></a1>). Wymaga jąder SPICE, więc nie jest domyślną bramką ciągłej integracji (CI).

seg-f6d67027d669 = <s1>Poprzednia</s1>Mapa możliwości

seg-01b6270b6c6a = <s1>Następna</s1>Pokrycie linii
