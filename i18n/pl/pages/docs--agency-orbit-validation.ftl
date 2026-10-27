# docs--agency-orbit-validation: translations (pl)

seg-31d58f23c0a2 = Uruchom

seg-fbe4b3eb7310 = Źródło: <c1/>

seg-87910a33b87b = Walidacja modelu sił przez dopasowanie efemeryd — metodologia i sprawdzone względem wzorca residua

seg-09a1b1b673fb = Pełny silnik sił Kshana (<c1/>) dopasowany do <b>rzeczywistych agencyjnych produktów precyzyjnych orbit</b>, z uczciwymi, cytowalnymi residuami opatrzonymi skrótem commita. To jest zapis walidacji dla kamienia milowego P4 planu rozwoju („Precyzyjna astrodynamika: grawitacja wysokiego stopnia, SRP (ciśnienie promieniowania słonecznego), walidacja względem zbiorów danych agencji”).

seg-90f366667f78 = Co tutaj oznacza residuum sprawdzone względem wzorca

seg-3861b68a03e2 = Residuum jest podawane tylko wtedy, gdy spełnione są wszystkie poniższe warunki (projekt <c1/>):

seg-954f4f934461 = <b>Model sił</b> obejmuje każde zaburzenie, które ma znaczenie przy docelowej dokładności: geopotencjał wysokiego stopnia EGM2008 (Earth Gravitational Model { "2008" }) (obcięty przy podanym stopniu i rzędzie, d/o), <b>pływy</b> stałe, oceaniczne i atmosferyczne (<c1/>, IERS (International Earth Rotation and Reference Systems Service) Conventions { "2010" } Ch. { "6" }), trzecie ciała Słońce/Księżyc, SRP typu kula armatnia ze stożkowym cieniem i szacowanym <c2/>, opór (tylko LEO (low Earth orbit)), człony ogólnej teorii względności (GR) Schwarzschilda i Lense'a–Thirringa (<c3/>).

seg-710f89c088cc = <b>Estymator</b> to rzeczywista wsadowa metoda najmniejszych kwadratów Gaussa–Newtona z wariacyjną <b>macierzą przejścia stanu</b> (sprawdzoną krzyżowo względem różnicy skończonej na całym łuku do < { "1e-6" }), ważeniem obserwacji <c1/> i edycją wartości odstających n-sigma.

seg-dd5dcc66ed22 = <b>Układy i czas</b> wykorzystują <b>rzeczywiste parametry orientacji Ziemi (EOP) IERS finals2000A</b> (UT1 (Universal Time { "1" }, czas obrotu Ziemi)−UTC (Coordinated Universal Time), ruch bieguna; <c1/>) w sprawdzonym względem wzorca łańcuchu IAU (International Astronomical Union) 2006/2000A CIO (Celestial Intermediate Origin) (<c2/>). Czas GPS (Global Positioning System) w SP3 (Standard Product { "3" }, format precyzyjnych orbit) → TT (Terrestrial Time) przez stałe przesunięcie { "51.184" } s (<c3/>).

seg-665bb53b81fb = <b>Residua</b> są podawane w <b>RTN</b> (radialnie/wzdłuż toru/poprzecznie) i w 3D, <b>z przyspieszeniami empirycznymi i bez nich</b>, obok surowego (bez dopasowania) nakładania.

seg-fea4515ba842 = Każda liczba jest <b>odtwarzalna</b> (bramka CI (ciągłej integracji) na otwartych danych) i <b>cytowalna</b> (skrót commita + odwołanie do zbioru danych + SHA-256 fixture'a (SHA: Secure Hash Algorithm)).

seg-fa98a174e799 = Metoda, dla każdego zbioru danych

seg-a98b098e815a = Sparsuj precyzyjną orbitę SP3; dla wybranego satelity weź każdą pozycję w ITRF (International Terrestrial Reference Frame).

seg-a25f69a48b5a = Przelicz epokę GPS w SP3 → TT; wyznacz <c1/> z finals2000A dla tej epoki.

seg-e5338b713d88 = Obróć każdą pozycję ITRF do GCRS (Geocentric Celestial Reference System) przez łańcuch CIO z tymi EOP — to są inercyjne obserwacje pozycji. Dynamika używa <em>tych samych</em> EOP do obrotu geopotencjału związanego z Ziemią, więc obserwacje i siły dzielą jeden układ odniesienia.

seg-ce987e4dda40 = Zainicjuj stan epoki (pozycja = pierwsza pozycja; prędkość = różnica skończona 2. rzędu) i dopasuj wsadowo <c1/> (Tier { "1" }), a następnie dodatkowo { "9" } empirycznych przyspieszeń RTN o jednym cyklu na obieg (CPR) (Tier { "2" }, z ograniczeniem a priori).

seg-22f839d05292 = Podaj RMS (root mean square) po dopasowaniu w RTN i 3D dla obu poziomów oraz surowe nakładanie.

seg-64e2c3662a27 = Galileo, średnia orbita okołoziemska — <b>GREEN</b> (próg < { "5" } m)

seg-e77e8e35ba80 = <b>Zbiór danych:</b> końcowa orbita multi-GNSS (GNSS: globalny system nawigacji satelitarnej) ESA/ESOC (ESA: European Space Agency; ESOC: European Space Operations Centre) <c1/>, ITRF, próbkowanie co 5 min, satelita <b>E11</b> (GSAT0101, Galileo In-Orbit Validation (IOV), nominalna MEO (średnia orbita okołoziemska)), 2022-01-01.

seg-f90d848e7a46 = <b>Otwarte źródło (bez logowania):</b> serwer lustrzany ESA Navigation Office, <c1/>. EOP: IERS <c2/>.

seg-ec7195b80bad = Commit walidacji:

seg-c2ad9f9cc050 = <b>Fixture'y (SHA-256):</b> SP3 <c1/>; EOP <c2/> (<c3/>).

seg-de3df1639939 = Łuk

seg-7db37f753fc1 = RMS 3D

seg-d39e59df38c0 = RTN (R, T, N)

seg-5ad814c7ef9e = Uwagi

seg-bced8a114852 = Fixture CI, Tier { "1" } (siły + <c1/>)

seg-f040df9ee966 = { "8" } h

seg-459900054e0e = { "0.133" } m

seg-994f50a24ab7 = { "0.105" }, { "0.067" }, { "0.047" } m

seg-d15ea658058b = surowe nakładanie { "78.7" } km

seg-1ce1bc363541 = Fixture CI, Tier { "2" } (+ empiryczne CPR)

seg-461105b5c2f3 = { "0.070" } m

seg-073166a26523 = { "0.048" }, { "0.044" }, { "0.027" } m

seg-224a7fc75354 = zmniejsza residuum o połowę

seg-1b422bc76914 = Wysyłka pełnego łuku, Tier { "1" } (przed poprawką†)

seg-f57ee3b36d92 = { "24" } h

seg-5fee750a5e30 = { "0.611" } m

seg-b3a99e7a6724 = { "0.276" }, { "0.381" }, { "0.390" } m

seg-95879df86618 = Liczby z fixture'ów CI powyżej zostały zapisane ponownie w { "0.36" } po poprawce atmosferycznych pływów S2 (<c1/>): Tier { "1" } dla Galileo zmienił się z { "0.132" } → { "0.133" } m (C_R { "1.1744" } → { "1.1743" }), składowe N dla Swarm-A o { "1" }–{ "2" } mm; wartości z wysyłki pełnego łuku nie zostały uruchomione ponownie. † <b>Przed poprawką:</b> wartość z wysyłki pełnego łuku zapisano przed poprawką pływów atmosferycznych S2 z { "0.36" } i nie uruchomiono jej ponownie na poprawionym kodzie (produkty z całych dób pobiera przepływ pracy wysyłki, nie były dostępne w sesji, która wprowadziła poprawkę). Na fixture'ach CI poprawka zmieniła RMS 3D dla Galileo o mniej niż { "1" } mm, a składowe Swarm-A o { "1" }–{ "2" } mm, więc spodziewana jest zmiana tego samego rzędu; następne uruchomienie <c2/> zapisze ją ponownie.

seg-5141c1811e35 = Pole MEO jest zbieżne grawitacyjnie przy stopniu { "8" } (wynik Tier-1 dla { "8" } h jest identyczny co do milimetra przy d/o { "8" }, { "10" } i { "12" }), więc obcięcie fixture'a CI do d/o 12 jest pomijalne; zadanie wysyłki uruchamia pełne d/o 70. Dopasowanie { "8" } h osiąga <b>{ "13" } cm</b> przy samych siłach i <b>{ "7" } cm</b> z poziomem empirycznym; pełny łuk { "24" } h (więcej obciążenia SRP/zaćmieniami, dłuższy zakres dynamiczny) daje <b>{ "61" } cm</b> — wszystko znacznie poniżej progu { "5" } m.

seg-45a95547dbcc = Swarm-A LEO — <b>GREEN</b> (próg < { "5" } m)

seg-cba2e4a9b9b1 = <b>Zbiór danych:</b> precyzyjna orbita naukowa ESA Swarm Level-2 o zredukowanej dynamice <c1/> (<c2/>, wyprowadzona z GPS, ITRF / IGb14, ~{ "2" } cm, przetwarzanie Delft University of Technology), satelita <b>Swarm-A</b> (identyfikator SP3 <c3/>, ~{ "430" } km, LEO), 2022-01-01.

seg-f66ad1515550 = <b>Otwarte źródło (bez logowania):</b> serwer udostępniania ESA Swarm <c1/> → <c2/> (otwarte na mocy ESA Data Policy). EOP: ta sama seria IERS <c3/> 2022-001.

seg-4de8b64c0bf0 = <b>Fixture (SHA-256):</b> SP3 <c1/> (<c2/>).

seg-b46c7e1d476d = Łuk LEO dodaje do modelu sił <b>opór atmosferyczny</b>. Ponieważ model gęstości jest <em>statyczny</em>, odcinkowo wykładniczy, orbita jest dopasowywana w dwóch poziomach: poziom <b>dynamiczny</b> (szacowany jest tylko stan epoki; <c1/> utrzymane na { "1" }, bo na LEO dominuje opór, a SRP jest słabo rozdzielalne na krótkim łuku) oraz poziom <b>o zredukowanej dynamice</b>, który dodaje empiryczne przyspieszenia o jednym cyklu na obieg, przenoszące niezamodelowany opór — operacyjnie znacząca orbita LEO.

seg-dac35ad223dd = Fixture CI, dynamiczny (<c1/>={ "1" })

seg-0652aa62d459 = { "3" } h

seg-cc0a14ba2b40 = { "2.687" } m

seg-3288b1f0615f = { "0.925" }, { "2.522" }, { "0.045" } m

seg-555712268929 = residuum ≈ czysto wzdłuż toru (opór)

seg-4f8e7956aa78 = Fixture CI, o zredukowanej dynamice (+empiryczne)

seg-aa5f651bcfab = { "0.098" } m

seg-147b4eca7fcf = { "0.026" }, { "0.092" }, { "0.025" } m

seg-82a3e25da2bf = człon empiryczny pochłania opór

seg-ff834d33ae70 = Dopasowanie dynamiczne mieści się w progu { "5" } m, a residuum leży niemal w całości wzdłuż toru — podręcznikowy ślad oporu na wysokości ~{ "430" } km. Poziom empiryczny pochłania ten błąd wzdłuż toru ({ "2.52" } → { "0.09" } m), dając dopasowanie o zredukowanej dynamice rzędu <b>~{ "10" } cm</b> względem własnej orbity ESA o dokładności ~{ "2" } cm. Przebieg całodobowy, pełnego stopnia, to ignorowane <c1/> (serwer udostępniania podaje produkt przez sesję przeglądarki plików, więc założyciel pobiera SP3 danej doby i wskazuje go w <c2/>). NRLMSISE-00 (NRLMSISE: Naval Research Laboratory Mass Spectrometer and Incoherent Scatter Radar Extended atmosphere model) ze sterowaniem pogodą kosmiczną to wskazane ulepszenie, które jeszcze bardziej poprawiłoby poziom <em>dynamiczny</em>.

seg-e8f5c385de62 = LRO, Księżyc — sprawdzone względem wzorca, <b>powyżej</b> progu { "5" } m (uczciwie) (P4 W4b)

seg-8a22ef5d3765 = <b>Zbiór danych:</b> rzeczywista zrekonstruowana trajektoria <b>Lunar Reconnaissance Orbiter</b> NASA/JPL (NASA: National Aeronautics and Space Administration; JPL: Jet Propulsion Laboratory) (LRO; NAIF (Navigation and Ancillary Information Facility) −{ "85" }) z JPL Horizons, geometryczne wektory stanu względem środka Księżyca w ICRF (International Celestial Reference Frame), 2022-01-01, wysokość ~{ "98" } km, próbkowanie co 1 minutę ({ "241" } epok, { "4" } h, ~{ "2" } obiegi). Użycie tekstowych wektorów Horizons nie wymaga <b>czytnika SPK/SPICE (SPK: jądro efemeryd planetarnych; SPICE: Spacecraft, Planet, Instrument, C-matrix, Events)</b>.

seg-2bcf078de340 = <b>Grawitacja:</b> pole <b>GRGM660PRIM</b> z GRAIL (Gravity Recovery and Interior Laboratory) (NASA Goddard Space Flight Center, stopień { "660" }), obcięte do d/o { "150" } i dopasowywane przy d/o { "100" }, obliczane w związanym z Księżycem układzie <b>osi głównych</b>.

seg-1454f78e9ca4 = <b>Otwarte źródło (bez logowania):</b> API (application programming interface) Horizons <c1/>; grawitacja przez ICGEM (International Centre for Global Earth Models) <c2/>.

seg-306ffeb843a9 = <b>Fixture'y (SHA-256):</b> LRO <c1/>; GRGM <c2/> (<c3/>).

seg-65ff0c37dd74 = To jest dynamika <b>względem środka Księżyca</b> — odrębny model sił (<c1/>): pole GRGM w układzie związanym z Księżycem (orientacja IAU { "2015" } średniej osi Ziemi <c2/> złożona ze stałym przesunięciem DE421 (Development Ephemeris { "421" }) od średniej osi Ziemi do osi głównych (ME→PA)), a także trzecie ciała Ziemia (dominujące zaburzenie orbity księżycowej) i Słońce, dopasowane przez <em>ten sam</em> ogólny precyzyjny estymator Gaussa–Newtona, którego używają zbiory danych dla Ziemi (cecha <c3/>).

seg-68f1894a1fa5 = Fixture CI, dynamiczny (tylko stan)

seg-0f055118d77a = { "4" } h

seg-c94fc5bf792b = { "12.05" } m

seg-addd9519ffe6 = { "2.91" }, { "10.11" }, { "5.88" } m

seg-af395226ca52 = surowe nakładanie { "39.9" } m

seg-2923b4d58878 = Fixture CI, o zredukowanej dynamice (+empiryczne { "1" }+2/obieg)

seg-19167d54b4ad = { "6.67" } m

seg-f23cb77888a5 = { "3.41" }, { "4.58" }, { "3.44" } m

seg-706a4d52f6c5 = człony empiryczne 1 i 2 na obieg pochłaniają błąd wzdłuż toru

seg-3f33d99fd643 = Poprawka { "0.36" }: do { "0.36" } przesunięcie DE421 ME→PA było stosowane w złym kierunku (i z błędną kolejnością kątów Eulera), przez co analityczny układ PA leżał około { "208" }″ od PA zamiast na nim. Teraz jest przepisane tak, jak definiuje je SPICE (sprawdzone względem <c1/> do { "2.6e-16" } rad, <c2/>; <c3/>). Powyższe wartości są po poprawce; przed nią było { "53.8" } m surowo, <b>{ "12.6" } m</b> dynamicznie ({ "3.07" }, { "10.19" }, { "6.81" } m) i <b>{ "6.65" } m</b> przy zredukowanej dynamice ({ "3.49" }, { "4.56" }, { "3.35" } m).

seg-925d1445fccb = Te residua są <b>powyżej</b> progu { "5" } m, który Galileo ({ "0.13" } m) i Swarm-A ({ "0.10" } m) spełniają, i są podawane uczciwie.

seg-c414e14eaaea = Co faktycznie wyznacza dolną granicę — walidacja krzyżowa klasy DE (i korekta)

seg-72b06bac7f6b = Postawiliśmy hipotezę, że czynnikiem ograniczającym jest wierność <b>analitycznej orientacji Księżyca i efemeryd</b> (szereg libracji IAU, dokładny do kilkudziesięciu sekund łuku w porównaniu z numerycznie całkowanym <c1/> JPL DE (Development Ephemeris), oraz efemerydy Ziemi/Słońca Montenbrucka–Gilla, ~{ "0.3" }° względem jądra DE/SPICE). Aby to sprawdzić bezpośrednio, wyłączony z przestrzeni roboczej crate walidacji krzyżowej <c2/> podmienia <b>tylko</b> te dwa dane wejściowe na dane <b>klasy DE</b> — orientację osi głównych Księżyca DE440 (Development Ephemeris { "440" }) (<c3/>) i efemerydy DE440 (<c4/>), odczytywane przez ANISE (Attitude, Navigation, Instrument, Spacecraft, Ephemeris — czytnik jąder SPICE napisany w czystym Ruście) — i ponownie uruchamia <em>ten sam</em> estymator (commit <c5/>, SHA-256 jąder <c6/> / <c7/>):

seg-3a0e724a8a2b = Poziom

seg-c1ce24cd6008 = analityczny

seg-7d04fb530a3a = surowe nakładanie

seg-d9ce88edb49e = { "53.8" } m

seg-55dc7c7d84f0 = { "41.5" } m

seg-7def7880e134 = dynamiczny

seg-83e37e5e9b3e = { "12.6" } m

seg-c421a0a20278 = { "12.0" } m

seg-f70309824f25 = o zredukowanej dynamice ({ "1" }+2/obieg)

seg-b8ada0c5fab3 = { "6.65" } m

seg-b6d3daff2f23 = <b>Uwaga { "0.36" }: większość poniższego zysku na poziomie dynamicznym wynikała z błędu przesunięcia, a nie z danych klasy DE.</b> Po poprawieniu przesunięcia ME→PA stos analityczny daje { "39.9" } m surowo, { "12.05" } m dynamicznie i { "6.67" } m przy zredukowanej dynamice, wobec { "41.5" }, { "12.0" } i { "6.67" } m dla klasy DE: dopasowanie analityczne i klasy DE zgadzają się teraz na każdym poziomie. Odczyt { "0.30" } z poniższej tabeli z tego wynika, pozostawiony tak, jak został napisany.

seg-691df96321d8 = <b>Hipoteza jest trafna tylko w połowie, a główne twierdzenie wymagało korekty.</b> Orientacja i efemerydy klasy DE <em>poprawiają</em> surowe nakładanie ({ "53.8" } → { "41.5" } m) i dopasowanie <b>dynamiczne</b> ({ "12.6" } → { "12.0" } m) — więc błąd analitycznej orientacji i efemeryd jest rzeczywisty i ogranicza te poziomy. Ale residuum o <b>zredukowanej dynamice</b> pozostawiają w istocie <b>bez zmian</b> ({ "6.65" } → { "6.67" } m): empiryczny poziom { "1" }+2 na obieg <em>już</em> pochłaniał błąd orientacji i efemeryd, więc operacyjną dolną granicę ~{ "6.6" } m wyznacza coś innego — residuum, którego baza cykli na obieg nie potrafi pochłonąć, a układy klasy DE nie usuwają. Najbardziej spójnym wyjaśnieniem są <b>niezamodelowane negrawitacyjne siły działające na LRO</b> (ponowne promieniowanie cieplne, odgazowanie) na krótkim łuku { "4" } h; stopień pola jest wykluczony (identyczne przy d/o { "100" } i { "150" }) i tolerancja całkowania jest wykluczona (identyczne przy <c1/> { "1e-6" } wobec { "1e-9" }). Konstruktywny wniosek: <b>szczupły, pozbawiony jąder analityczny stos księżycowy Kshana już dorównuje wiernością klasie DE dla księżycowej orbity o zredukowanej dynamice (operacyjnej)</b> — domyślne podejście oparte wyłącznie na współczynnikach niczego tu nie zostawia na stole. Przekroczenie { "5" } m wymagałoby zamodelowania negrawitacyjnych sił LRO (modelu skrzydeł-skrzynki i cieplnego specyficznego dla statku oraz dłuższego dopasowania wielołukowego), a nie lepszych układów odniesienia.

seg-4211fbd25380 = Zobowiązanie do uczciwości

seg-f3b0a26ff5b3 = „Zielony” próg < { "5" } m jest osiągnięty dla <b>Galileo MEO</b> ({ "0.13" } m dynamicznie) i <b>Swarm-A LEO</b> ({ "2.69" } m dynamicznie / { "0.10" } m przy zredukowanej dynamice). <b>LRO, Księżyc, jest publikowany w stanie, w jakim jest: { "12.05" } m dynamicznie / { "6.67" } m przy zredukowanej dynamice ({ "1" }+2 empiryczne na obieg) — powyżej progu</b> ({ "0.36" }, po poprawce przesunięcia ME→PA; { "12.6" } / { "6.65" } m przed nią). Walidacja krzyżowa klasy DE (powyżej) <b>sprawdziła i poprawiła</b> twierdzenie o czynniku ograniczającym: dolna granica przy zredukowanej dynamice <b>nie</b> wynika z analitycznej orientacji i efemeryd (jądra DE440 zostawiają ją bez zmian na poziomie { "6.67" } m), więc nie zamyka jej lepsze odwzorowanie układów, lecz zamodelowanie negrawitacyjnej dynamiki LRO — uczciwa, zaktualizowana droga do poziomu metra.

seg-559a269152ae = Dla LEO poziomy <b>dynamiczny</b> (tylko stan, statyczna gęstość) i <b>o zredukowanej dynamice</b> (z przyspieszeniami empirycznymi) są zawsze podawane <b>osobno</b>, aby czytelnik widział, co pochłaniają człony empiryczne; poziom o zredukowanej dynamice jest orbitą operacyjną. To samo rozdzielenie obowiązuje dla poziomów MEO: empirycznego i samych sił.

seg-d20c7ef90250 = Każde residuum niesie powyżej swój skrót commita, odwołanie do zbioru danych i sumę kontrolną fixture'a.

seg-733d96129fca = <b>Zbiory danych sprawdzone względem rzeczywistej prawdy agencji: { "3" } z { "3" }</b> (Galileo MEO, Swarm-A LEO, LRO, Księżyc). <b>Spełniające próg < { "5" } m: { "2" } z { "3" }</b> (Galileo ✓, Swarm-A ✓; LRO przy { "6.67" } m, uczciwie powyżej niego).

seg-d7c77076c9c6 = <s1>Poprzednia</s1>Walidacja SGP4

seg-d661003da754 = <s1>Następna</s1>Układ Słoneczny i inne ciała

seg-36a3b8105d4b = Galileo, średnia orbita okołoziemska — GREEN (próg < { "5" } m)

seg-b6f96cf0d55a = Swarm-A LEO — GREEN (próg < { "5" } m)

seg-9e739bda7f20 = LRO, Księżyc — sprawdzone względem wzorca, powyżej progu { "5" } m (uczciwie) (P4 W4b)
