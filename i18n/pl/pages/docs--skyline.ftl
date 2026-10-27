# docs--skyline: translations (pl)

seg-2bd2101ce454 = Powierzchnia

seg-f917e7fcac09 = Czym jest

seg-6c6e7248496f = Geometria nieba

seg-379f49bff6fb = Python

seg-ad856ad710eb = Status

seg-cbf0f9bcd2d8 = Wyrocznia

seg-6e0cb6acc073 = VALIDATED

seg-c14b8fe46517 = Maska horyzontu zależna od azymutu: zbiór widocznych satelitów, azymut i elewacja oraz DOP przy masce

seg-bbb1828b3db1 = Redukcje kanionu ulicznego, sektorów i terenu do tabeli

seg-2c53381d48ae = Elipsa błędu poziomego i kofaktor dla poszczególnych systemów z kowariancji geometrii

seg-de6c33774c9c = CLI

seg-d1e9715513b4 = Przykład

seg-587beeccaa11 = Ustawienie predefiniowane

seg-b03d56f501c3 = Rodzaj

seg-4dbf41c0ec3b = Funkcja

seg-98f4f946a7ac = WASM

seg-2b0d77219437 = Gotowe ustawienia

seg-7338b6210228 = Wiersz

seg-6317db731879 = Opis

seg-be2f66de7d07 = Źródło: <c1/>

seg-3cb660ef6b03 = Maski horyzontu i geometria nieba

seg-724f72bdfa36 = Do { "0.36" } każdy test widoczności Ziemi w silniku był jednym progiem elewacji, <c1/>: satelita się liczył, gdy był na tej wysokości lub powyżej niej, bez względu na kierunek. Ulica, nabrzeże, fiord lub żuraw zasłaniają część nieba, a resztę zostawiają otwartą. <b>Skyline</b> (horyzont) to próg elewacji zależny od azymutu; <b>funkcje geometrii nieba</b> zamieniają miejsce, czas, konstelacje i horyzont na zbiór widocznych satelitów, rozmycie dokładności (DOP), kowariancję geometrii, poziomą elipsę błędu, chmurę Monte Carlo i skyplot. Projekt to <c2/> (punkty { "1" } i { "2" }).

seg-4c1bc0b37f54 = Dowody: decyzja o widoczności z maską (kąty widzenia geodezyjne, maska tabelaryczna, zbiór widocznych i jego DOP) jest <b>VALIDATED</b> względem Orekit { "12.2" } i gnss_lib_py { "1.0.4" } w porównaniu zarejestrowanym z góry, podobnie jak elipsa błędu i kofaktor dla każdego systemu (numpy, zarejestrowane z góry); redukcje kanionu, sektora i terenu, ustawienia wstępne i pozostałe funkcje geometrii nieba są <b>MODELLED</b> (<a1>Dowody</a1>). Horyzont usuwa satelity w linii widzenia i nic więcej. Ustawienia wstępne to geometrie REPRESENTATIVE, a nie pomiary terenowe.

seg-6fa3291b70e3 = Horyzont (skyline)

seg-08585dd55bb5 = Horyzont to maksimum punktowe czterech opisów. Azymut to stopnie w prawo od północy prawdziwej w lokalnym układzie wschód-północ-góra miejsca; elewacje są w <c1/>.

seg-9d0e2b0a469f = TOML

seg-3dbc7ff9f5ab = Tabela

seg-a67486e7d10e = Elewacje interpolowane liniowo po azymucie, zawijane przy { "360" }°. Azymuty ściśle rosnące w <c1/>; co najwyżej { "3600" } wierszy.

seg-bc12ba94381f = Kanion uliczny

seg-23066e2eb509 = Dwie proste równoległe ściany (poniżej).

seg-821762272e2f = Sektory

seg-7387a718a7c3 = Przedziały o ostrych krawędziach, w prawo od <c1/> (włącznie) do <c2/> (wyłącznie), które mogą przechodzić przez północ; co najwyżej { "360" }.

seg-2768e3772b56 = Teren

seg-5a5c08a77b86 = Punkty sprowadzone do tabeli: elewacja <c1/>, ze spadkiem krzywizny dla <c2/> (wybrana, podana stała). <c3/> jest liczone nad anteną.

seg-fb86c0db0c90 = <c1/> zaczyna od nazwanej geometrii; pola kanionu następnie nadpisują pole kanionu ustawienia wstępnego pole po polu, a <c2/>, <c3/> i <c4/> do niego dodają.

seg-0d76504a1d74 = <c1/> odbiornika zachowuje swoje znaczenie: jest to płaski horyzont. Efektywny próg przy azymucie <c2/> to <c3/>, a satelita jest widoczny, gdy jego elewacja jest <b>równa lub większa</b>: to samo <c4/>, którego zawsze używała płaska maska. Satelita powyżej <c5/>, lecz poniżej horyzontu, jest <b>zasłonięty przez horyzont</b>.

seg-f7fd13e569e3 = Kanion uliczny

seg-290f563c1ff7 = Ulica biegnie wzdłuż azymutu <c1/>, <c2/> metrów między ścianami, antena <c3/> metrów nad ziemią na osi. Wzdłuż azymutu <c4/>, przy <c5/>, promień dociera do ściany po <c6/>, więc ściana o wysokości <c7/> tnie przy

seg-8662708f4f32 = Otwarty pas leży wzdłuż ulicy. Przy <c1/> (antena pośrodku) promień wychodzi przez otwarty koniec, a ściana nic nie zasłania, gdy <c2/>. Ściana nie wyższa niż antena nic nie zasłania. <c3/> domyślnie wynosi { "1.5" } m (dach samochodu lub odbiornik ręczny, wybór podany wprost); nowy kanion wymaga <c4/>.

seg-1eeff52ea5a5 = Wybrane i podane wymiary (z noty projektowej), a nie pomiary żadnego rzeczywistego miejsca. <c1/> wypisuje jedno z nich z jego pochodzeniem i jego progiem co stopień.

seg-13e8e5460280 = Geometria

seg-6d71c5cbe104 = Kanion: ulica { "0" }°, szerokość { "20" } m, ściany { "30" } m i { "30" } m, antena { "1.5" } m. { "70.7" }° w poprzek ulicy, otwarty wzdłuż niej.

seg-ab3415ff8811 = Stosunek wysokości do szerokości { "1.5" }, w paśmie { "0.5" }–{ "2" } proporcji kanionów ulicznych według Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

seg-e331f02251f8 = Sektory: otwarte w stronę morza na { "090" }–{ "270" } ({ "180" }°); budynki nabrzeża { "8" }° na { "315" }–{ "045" } ({ "90" }°); falochron i jego światło { "3" }° na { "045" }–{ "090" } i { "270" }–{ "315" }.

seg-6926e1bfc55d = Wybory podane wprost (na przykład magazyny { "40" } m w odległości około { "285" } m).

seg-f13d4df9a42c = Teren: ściany { "600" } m nad anteną w odległości { "1500" } m po obu stronach kanału północ-południe, jeden punkt na stopień (przy <c1/> m), z uwzględnionym spadkiem krzywizny. { "21.8" }° w poprzek, poniżej { "1" }° wzdłuż osi.

seg-4d3dedbe4491 = Rząd wielkości szerokości i deniwelacji głębokich fiordów zachodniej Norwegii (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

seg-51f5219cb050 = Sektory: stosy kontenerów { "12" }° na lądowej połowie { "000" }–{ "180" }; wysięgniki żurawi { "35" }° na { "245" }–{ "255" } i { "25" }° na { "285" }–{ "295" }; poza tym otwarte w stronę wody.

seg-a568ae949c3b = Pięć kontenerów high-cube ISO { "668" } ({ "14.5" } m) w odległości około { "60" } m od anteny na wysokości { "2" } m; wysięgnik około { "50" } m nad nabrzeżem na { "70" } m i { "100" } m, rzędu żurawia post-Panamax. Sektor żurawia jest nieprzezroczysty.

seg-65b1b45c787f = W scenariuszu

seg-e489759bbd65 = Opcjonalna sekcja <c1/>, nad własnym progiem danego rodzaju:

seg-f98345079e70 = Co zmienia horyzont

seg-cbe2f5ae721f = Dla każdej próbki

seg-7368ea5c4b79 = <c1/> (z <c2/>)

seg-fde216d940fb = Oś czasu widoczności (dostępność GNSS) i podsumowanie DOP.

seg-7f6b2fcda681 = <c1/> (z <c2/>)

seg-8fafdb892253 = Satelity, z których korzystają RAIM i ARAIM (<c1/>).

seg-c0156fd1c895 = Satelity, których pseudoodległości są symulowane i używane przez RAIM.

seg-d7fa5e5cf33d = Satelity, które odbiornik może śledzić, przed zagłuszaczem.

seg-86caf3ae19ad = Zbiór widocznych satelitów każdego trybu nad maską własną każdego systemu, w tym przemiatanie biegunowe (ten sam horyzont w każdym miejscu). Obwiednia trybu Dopplera i zaprojektowany pojedynczy przelot to granice tego, co odbiornik musi obsłużyć, i zachowują maskę każdego systemu.

seg-20d2e86d17bc = Które epoki liczą się jako powyżej maski, czas powyżej niej, satelity porównania GNSS.

seg-ed5bbd6b2c46 = <c1/> (szkoleniowe NMEA)

seg-d0eb9fd84d24 = Satelity w GSV i w rozwiązaniu. Azymuty to rzeczywiste kierunki związane z ziemią, a nie kurs statku.

seg-56cc8ae30218 = <b>Miejsce naziemne dla <c1/> i <c2/>.</b> Oba rodzaje modelują orbitującego użytkownika z elewacją geocentryczną i bez azymutu związanego z Ziemią, więc przyjmują horyzont tylko w trybie miejsca naziemnego z noty projektowej: <c3/> zamiast <c4/> (dokładnie jedno z dwóch). Każda próbka to jedna bezwzględna chwila, <c5/>: każdy satelita jest do niej propagowany (zestaw elementów, efemeryda rozgłaszana lub plik SP3 jest przesuwany od własnej epoki, satelita Walker liczy <c6/> od <c7/>) i obracany do układu związanego z Ziemią w tej chwili, więc miejsce widzi jedno spójne niebo. <c8/> jest własną epoką scenariusza orbity; bez niej (i zawsze dla <c9/>, który jej nie ma) jest to najnowsza epoka wśród satelitów, które ją niosą, lub J2000 tylko dla wzorców Walker. Elewacja i azymut są geodezyjne (WGS-84). Podział poziomów ochrony ARAIM na poziomy i pionowy rodzaju integrity oraz błędu pionowego Stanforda używa tej samej geodezyjnej pionowej (normalnej do elipsoidy WGS-84, około { "0.19" }° od radialnej geocentrycznej na szerokości { "45" }°); migawkowy RAIM już jej używał. <c10/> bez horyzontu to zwykły użytkownik naziemny; ścieżka orbitującego <c11/> jest bez zmian.

seg-fae979b3b96f = <b>Kompatybilność wsteczna.</b> Bez sekcji <c1/> scenariusz jest identyczny bajt po bajcie z tym, co ten sam silnik dawał, zanim istniał kod horyzontu: <c2/> sprawdza JSON, wykres i podsumowanie każdego dostarczanego scenariusza, który uruchamia jeden z tych rodzajów, oraz tekst NMEA każdego scenariusza szkoleniowego, względem skrótów SHA-256 punktu odniesienia „{ "0.36" } portable” (skrótów z commitu wydania { "0.35.0" }, przeliczonych ponownie, gdy silnik przeszedł na matematykę przenośną, i zachowanych w teście jako zapis: <c3/>). Pusta sekcja <c4/> nic nie zasłania; wynik jest wtedy równy przebiegowi bez niej, z wyjątkiem dodanego bloku <c5/> i zerowych liczników <c6/>.

seg-fe88e0ad01e9 = <b>Co jest odrzucane</b>, z powodem w komunikacie: horyzont na orbitującym <c1/>; <c2/> i <c3/> razem; nieznane ustawienie wstępne; kanion bez <c4/>; tabela, która nie jest ściśle rosnąca w <c5/>; elewacja poza <c6/>; pusty sektor; niedodatnia odległość terenu; dane wejściowe ponad limitami; dowolny nieznany klucz.

seg-d1b10a0c833f = <b>Wynik</b> zyskuje <c1/>, gdy sekcja jest obecna: <c2/> to <c3/>, <c4/> lub <c5/>; <c6/> to ułamek kąta bryłowego górnej półkuli powyżej <c7/> (średnia z <c8/> po azymucie: { "1" } dla zerowej maski, { "0.5" } dla płaskiego progu { "30" }°); <c9/> to wiersz ustawienia wstępnego lub własny wiersz scenariusza. Jednostki i klasy pochodzenia znajdują się w bloku <c10/>.

seg-0842c1133eb5 = Dołączone przykłady (<c1/>):

seg-5f77a52314c7 = Co pokazuje (usuń sekcję <c1/>, aby porównać)

seg-523f8c1a7912 = GPS + Galileo na dole <c1/>: { "17" } z { "289" } próbek zachowuje rozwiązanie, mediana PDOP { "70.5" } ({ "1.14" } przy otwartym niebie).

seg-6c5618dce8ab = ARAIM dla dwóch konstelacji przy wejściu do portu: { "70" } ukrytych epok satelitów, dostępność bez zmian ({ "145" } z { "145" }).

seg-36254db521fd = Pseudoodległości i RAIM na nabrzeżu: { "44" } ukryte epoki satelitów; dostępność RAIM { "0.59" } ({ "0.85" } przy otwartym niebie).

seg-6b0f8b4c700f = Zagłuszacz { "2" } W w porcie: { "83" } ukrytych epok satelitów, śledzenie bez zmian (zagłuszacz już je odebrał).

seg-22ceab915271 = GPS + Galileo + warstwa LEO w fiordzie: mediana połączonego PDOP { "1.14" } ({ "0.93" } przy otwartym niebie).

seg-f940e764e244 = Kanion <c1/> jako płaski próg { "35" }° i jako <c2/> obrócony wzdłuż kursu samochodu: { "8" } wobec { "4" } do { "5" } satelitów GPS i Galileo; połączony średni błąd { "2.1" } m w obu przypadkach; alarm { "1.5" } m w { "51" } % i { "59" } % epok.

seg-6aa4ec7e4058 = Pięć funkcji silnika (<c1/>), takich samych na każdej powierzchni:

seg-4d6a793b2794 = Wejście → wyjście

seg-c99f58f1ccd2 = dla każdego satelity <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (wariancja jednostkowa), <c15/>; <c16/> i <c17/> przy żądanym poziomie ufności; <c18/>, <c19/>, <c20/>

seg-a5b914aac404 = <c1/> (co najwyżej { "5000" }, limit wejściowy) błędów metody najmniejszych kwadratów przy niezależnych gaussowskich błędach zasięgu <c2/> ze strumienia ChaCha8 z ziarnem (seed) <c3/>: <c4/>, empiryczna kowariancja, poziome i 3-D RMS obok <c5/> i <c6/>, ułamek wewnątrz elipsy { "95" } %

seg-f435ee3b8709 = ustawienia wstępne z etykietą, opisem, pochodzeniem, progiem co stopień i <c1/>

seg-1937af5fa347 = sekcja horyzontu sprowadzona do 360-wpisowej tabeli używanej przez silnik, z <c1/>, <c2/>, <c3/>

seg-f16a1f2de329 = skyplot jako statyczny SVG (bez skryptu, bez odwołań zewnętrznych, każdy ciąg wejściowy z escapowaniem)

seg-c802cf2a2e30 = Żądanie:

seg-c3c44c1967ba = <c1/> to ustawienia wstępne konstelacji silnika (<c2/>: <c3/>, <c4/>, <c5/>, <c6/>, ...; ustawienia wstępne LEO <c7/>, <c8/>, ...) lub pełna tabela <c9/> <c10/>, propagowane do <c11/> (keplerowskie z wiekowym J2, orbity trybu łączonego <c12/>). Ich względne fazy pochodzą z różnych epok odniesienia, więc niebo to <b>reprezentatywna geometria, a nie niebo z tej daty w tym miejscu</b>. Satelity można zamiast tego (lub dodatkowo) podać bezpośrednio: <c13/>, lub z <c14/> i <c15/> albo <c16/>. Wartości domyślne: maska własna każdego systemu ({ "5" }° GNSS, { "10" }° LEO; { "5" }° dla satelitów podanych bezpośrednio), jeden zegar odbiornika na system (<c17/> dla jednego wspólnego zegara), <c18/> { "1" } m (reprezentatywna linia budżetu dwuczęstotliwościowego), poziom ufności { "0.95" }. Limity wejściowe: co najwyżej { "2000" } satelitów nad horyzontem (tabela systemu żądająca więcej jest odrzucana przed zbudowaniem) i { "16" } zegarów odbiornika.

seg-6408f9b02ccb = Datowane niebo z zestawów elementów.

seg-7724e4ecafee = <c1/> przyjmuje tekst zestawów elementów dwuwierszowych (wiersz z nazwą przed każdym zestawem jest opcjonalny; co najwyżej { "4" } MiB, limit wejściowy), propagowany przez SGP4 silnika (WGS-72, propagator, którego używa <c2/>) do <c3/> plus <c4/>, obrócony do układu związanego z Ziemią przy UT1 przyjętym jako UTC i bez ruchu bieguna, i widziany z <c5/>. <c6/> to UTC ISO { "8601" } (<c7/>) i datuje tylko zestawy elementów (ustawienia wstępne nie mają daty, więc <c8/> bez <c9/> jest odrzucane); <c10/> oznacza je dla zegara każdego systemu (domyślnie <c11/>). Każdy wynik podaje, jakie to niebo, w <c12/> i <c13/>:

seg-13a8b4ac40f9 = Niebo

seg-c0bde35f9442 = ustawienia wstępne konstelacji silnika: reprezentatywna geometria

seg-d368b50280cc = zestawy elementów propagowane do podanej epoki: niebo, które te zestawy dają w tej epoce, a nie jego pomiar (ich własna dokładność to dokładność SGP4 i wiek zestawów)

seg-0bc07825a9b5 = brak <c1/>: zestawy elementów propagowane do własnej epoki najnowszego zestawu plus <c2/>, reprezentatywne niebo

seg-1230388da233 = satelity podane bezpośrednio, tak jak podano

seg-1a30004a7f9e = Mieszankę łączy się za pomocą <c1/>. <c2/> to chwila, do której propagowano zestawy elementów, a <c3/> wymienia, jakiej części tekstu nie użyto, wraz z powodem: źle sformułowane lub osierocone wiersze zestawów elementów (z numerami wierszy), zestawy odrzucone przez parser i zestawy, których SGP4 nie mógł propagować do tej chwili (rozpadłe lub poza swoimi granicami); co najwyżej { "100" } wpisów łącznie, a potem jeden ostatni wpis liczący resztę. Pusta lista <c4/> nie dodaje żadnych ustawień wstępnych. Skyplot podaje podstawę w stopce.

seg-8560c13c7ea3 = <b>Jedno jądro.</b> Macierz kofaktorów to <c1/>, czyli złożenie macierzy projektu i odwrotność Gaussa-Jordana stojące za <c2/>. <c3/> udostępnia kowariancję, a <c4/> jest jej redukcją, więc skalary VALIDATED pozostają bez zmian i są nadal przypięte przez <c5/>. Nie ma drugiej implementacji DOP.

seg-cb1be3e04419 = <b>Elipsa.</b> Półosie <c1/> dla wartości własnych <c2/> bloku wschód-północ, z <c3/> (<c4/> przy { "95" } %, { "1" } przy { "39.35" } %) oraz azymut osi wielkiej <c5/> w <c6/> od północy.

seg-96062e2cfed1 = Punkty wejścia

seg-f8dc86bd9da2 = <c1/> lub <c2/>, z <c3/> lub <c4/>; <c5/>

seg-d5b5bdf6081c = Rust

seg-8d0f99ed4837 = <c1/>, <c2/> o tych samych nazwach

seg-40a7552d2ba9 = MCP

seg-42f0fe3b42ab = <c1/> (<c2/> lub <c3/>); bez Monte Carlo przez MCP (masowe próbki, które agent powinien streszczać, a nie nosić)

seg-9d04c658b37a = Każdy wynik zawiera <c1/> (MODELLED), <c2/> (geometria przy podanym modelu błędu: niezależne, równe, o zerowej średniej gaussowskie błędy zasięgu; nie jest to prognoza rzeczywistego błędu odbiornika, który ma też biasy, wielodrogowość i błędy spoza linii widzenia; nie jest to granica integralności) oraz uwagę doradczą: <em>Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator.</em>

seg-0e1285fdfe52 = Pięć wierszy rejestru (<c1/>), tak jak zakresuje je nota projektowa:

seg-1aa76286f152 = Orekit { "12.2" } (kąty widzenia <c1/>, <c2/>) z gnss_lib_py { "1.0.4" } (<c3/> i macierz DOP), zarejestrowane z góry w <c4/> (commit e4b9d912), zanim uruchomiono którekolwiek: { "1173" } kątów widzenia w sześciu miejscach i czterech epokach, sześć tabel, { "142" } zbiorów widocznych; najgorsza elewacja { "1.3e-13" }°, azymut { "2.3e-13" }°, maska { "1.1e-12" }° wobec { "1e-9" }°; identyczne zbiory widocznych, żaden w paśmie granicznym; DOP { "3.3e-13" } względnie i kofaktor { "6.6e-13" } skali macierzy wobec { "1e-9" }. Zakres: maski tabelaryczne, kąty widzenia geodezyjne, zbiór zasłonięty oraz jego DOP ze wspólnym zegarem i kofaktor.

seg-b33828edbe2f = wartości obliczone ręcznie; powyższe porównanie czyta ich tabele jako dane wejściowe i ich nie sprawdza
