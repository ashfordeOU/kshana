# docs--campaigns: translations (pl)

seg-f917e7fcac09 = Czym jest

seg-cae10fb9bff8 = Scenariusz

seg-7603033b1c87 = Źródło: <c1/>

seg-699c946d7d09 = Pojedynczy scenariusz odpowiada na jedno pytanie o jednej sytuacji. Misja to ciąg sytuacji, a badanie projektowe to ich rodzina. Rodzaj scenariusza <c1/> składa istniejące rodzaje w jeden przebieg bez ponownej implementacji któregokolwiek z nich: każdy element jest zwykłą tabelą scenariusza z własnym <c2/>, wywoływaną przez <c3/> dokładnie tak, jak uruchomiłoby ją <c4/>, a kampania tylko odczytuje liczby z dokumentów wyników.

seg-cb4f48673970 = Kampania jest <b>MODELLED</b>. Jej tożsamości składania są testowane (poniżej), ale łączenie faz w łańcuch jest wyborem modelowania, a każda faza jest tak dobra, jak rodzaj, który ją uruchomił.

seg-80e367fbc391 = Uruchom ją jak każdy inny scenariusz:

seg-9f9995ebc904 = Kampania może zawierać dowolną kombinację czterech sekcji; kampania bez żadnej uruchamia się, a jej podsumowanie mówi, że nic nie złożyła.

seg-002ddd72b3a2 = <c1/>: misja połączona w łańcuch na jednej osi czasu

seg-e99c4453b79d = Każda faza uruchamia jeden lub więcej scenariuszy w oknie wspólnej osi czasu misji, na przykład zegar w holdover i bezwładnościowy system nawigacji (INS) dryfujący w tym samym czasie. Wyniki każdego przebiegu są wczytywane do nazwanych <b>kanałów</b>, umieszczane w czasie początku fazy i przepróbkowywane na wspólną siatkę (<c1/>) przez zatrzymanie zerowego rzędu: czas siatki przyjmuje najnowszą próbkę przebiegu fazy będącej właścicielem, nie późniejszą niż on, i jest pusty (null), gdy żaden przebieg tej fazy nie dostarcza kanału.

seg-842b77a21c5f = Kanał

seg-b2eb598fab2a = Źródło ustawienia wstępnego

seg-f42465f7d066 = ns

seg-fdb4600bf100 = błąd czasu zegara

seg-aef6b877191d = zabezpieczenie błędu czasu

seg-cc989ca58f1d = własny <c1/> przebiegu

seg-5e9f7cd33017 = średni efektywny stosunek nośnej do gęstości szumu (C/N0) dla widocznych satelitów

seg-af6f07319f2d = <c1/>: średnia z <c2/>

seg-f6b4ea158327 = dolna granica utraty śledzenia

seg-126535297c32 = <c1/>: <c2/> scenariusza, gdy je podaje

seg-f8f430695a88 = satelity nadal śledzone

seg-3f9a9f33010b = pionowy poziom ochrony

seg-2cfc68fa1c15 = pionowy limit alarmowy

seg-d165177a255c = błąd pozycji

seg-29651ae6be6f = próg błędu pozycji

seg-c893c5e3ace5 = { "1" }, gdy którykolwiek monitor fazy alarmuje

seg-ade1d7072512 = zob. poniżej

seg-e8c7ac7d117f = <c1/> to <c2/>, chyba że przebieg ustawia <c3/>. Każda inna wielkość jest odczytywana jawnym wpisem <c4/>: ścieżka czasu z jednym <c5/> nazywającym wiersze (<c6/>), ścieżka wartości dzieląca te wiersze lub skalar rozgłoszony na każdy wiersz (przedrostek <c7/> odczytuje scenariusz przebiegu zamiast jego wyniku), opcjonalna redukcja (<c8/>, <c9/>, <c10/>, <c11/>) dla kilku wartości w jednym wierszu, skala oraz jednostka dla kanału, którego kampania nie zna.

seg-7d7bc5d19a61 = <b>Alarmy</b> pochodzą z trzech miejsc, łączonych logicznym OR w obrębie fazy:

seg-74a10f5283ec = flagi ustawień wstępnych odczytane z przebiegu: <c1/> alarmuje, gdy śledzi mniej niż cztery satelity (własna definicja dostępności); <c2/> alarmuje w epokach, które oznacza jako niedostępne;

seg-f22be2880015 = reguły ustawień wstępnych na kanałach fazy, oceniane <b>po</b> <c1/>: <c2/> alarmuje, gdy bezwzględny błąd czasu przekracza <c3/>; <c4/>, gdy błąd pozycji przekracza <c5/>; jawne reguły trafiają do <c6/>;

seg-ccd94a7cb652 = zdarzenia alarmujące: <c1/> zgłasza jedno przy <c2/> swojego monitora wspomaganego zegarem; <c3/> zgłasza jedno na początku fazy, gdy jego scalona decyzja alarmuje.

seg-f88b8ad5672f = <b>Stan jest przekazywany</b> między fazami na trzy jawne sposoby:

seg-0e3a0ee8e172 = <c1/> dodaje wartość kanału z końca poprzedniej fazy do wartości tej fazy. Faza zegara, którą przeciągnął spoofer, jest punktem, od którego zaczyna się holdover. Dodanie przesunięcia jest dokładne dla fazy zegara, który całkuje częstotliwość; dla błędu pozycji zakłada, że oba błędy są współliniowe, co jest przypadkiem pesymistycznym.

seg-4db8b11391a5 = <c1/> zapisuje liczbę z poprzedniej fazy (<c2/> dla wartości końcowej kanału lub dowolnej ścieżki wyniku poprzedniego przebiegu) do klucza z kropkami w scenariuszu tej fazy przed jego uruchomieniem, z opcjonalną skalą i przesunięciem.

seg-fdd5aa8b9627 = <c1/> kończy fazę w czasie obliczonym przez przebieg, ograniczonym do <c2/>. Dołączona misja kończy swoją fazę spoofingu przy <c3/>.

seg-cdd64676f509 = <c1/> odrzuca pierwsze sekundy własnej osi czasu przebiegu (rozgrzewkę) przed zerem czasu fazy.

seg-d48bcd9890d3 = Dołączona misja

seg-52fc5abca41f = <c1/> uruchamia { "18" } scenariuszy składowych w sześciu fazach na siatce { "10" } s:

seg-baea4e05ad26 = Faza

seg-9d3ee6a5613e = Przebiegi

seg-87fbeeb9abb9 = Co pokazuje oś czasu

seg-82bebc2bb038 = nominalny, { "600" } s

seg-cf54dae64cb7 = <c1/>, <c2/> (bez zagłuszacza), <c3/>

seg-5cb80e4a7d4d = błąd czasu { "0" } ns; C/N0 { "43.0" } dB-Hz wobec dolnej granicy { "25" } dB-Hz; pionowy poziom ochrony od { "9.1" } do { "21.6" } m wobec limitu alarmowego { "50" } m

seg-13c92a72544a = zagłuszanie, { "600" } s

seg-f9c01304734d = to samo, zagłuszacz o mocy -30 dBW, { "1" } km

seg-27d3b65152b0 = C/N0 spada do { "27.7" } dB-Hz, wszystkie { "8" } satelitów nadal śledzonych

seg-6a052db03815 = spoofing, zakończony po { "370" } s przez <c1/>

seg-89856c1f83f8 = <c1/> (rampa czasu { "0.1" } ns/s), <c2/>, <c3/>

seg-cfcdd96b1132 = błąd czasu narasta do { "36" } ns; detektor radiowy alarmuje na początku fazy, monitor wspomagany zegarem po { "370" } s

seg-92c8a76b84c2 = holdover, { "1800" } s

seg-8a6e0b2898d1 = <c1/> (odmówiony, przenosi { "37.0" } ns), <c2/> (jednostka taktyczna w dryfie), <c3/> przy { "10" } dBW

seg-1948491e25ec = utracono wszystkie satelity (C/N0 około -12 dB-Hz); błąd czasu od { "36.4" } do { "62.7" } ns wobec zabezpieczenia { "50" } ns; błąd pozycji do { "24" } km

seg-93e59087dd44 = integrity-alarm, { "600" } s

seg-f28f37baf8fe = <c1/> (przenosi { "59.6" } ns), <c2/> i <c3/> z maską { "25" } deg

seg-83d890c819f8 = { "5" } satelitów śledzonych; poziom ochrony od { "19" } do { "135" } m, brak wartości w { "18" } z { "60" } czasów siatki; przeniesiony błąd czasu, od { "52.1" } do { "61.7" } ns, pozostaje powyżej zabezpieczenia { "50" } ns, więc alarm trwa przez całą fazę

seg-1ab40b7893db = odzyskiwanie, { "600" } s

seg-181d2a2f800b = błąd czasu wrócił do { "0" } ns; alarm wyciszony

seg-26ef3dc422ff = Przebiegi integralności używają własnej trajektorii użytkownika z przykładu <c1/> (kołowa trajektoria na wysokości { "0.4" } km), a nie stałego stanowiska odbiornika zagłuszania, a maska { "25" } deg zastępuje częściowe niebo odbiornika odzyskującego śledzenie. Są to wybory scenariusza, podane w pliku.

seg-03ae98f17988 = Misja napędzana widmem pasma L

seg-5daf8c8fdd83 = <c1/> uruchamia { "8" } scenariuszy składowych w trzech fazach na siatce { "1" } s, z C/N0 dla GPS L1 C/A i Galileo E1 odczytywanym z rodzaju <c2/> (zob. <a1>SPECTRUM.md</a1>), a nie z tabeli rodzaju <c3/> dla poszczególnych satelitów. Zagłuszacze są takie jak w <c4/>.

seg-7f34a00af961 = początek, zakończony po { "10" } s przez <c1/>

seg-471ec0d86f76 = <c1/>, <c2/> (czirp od { "10" } s), <c3/>

seg-00b032242ebc = L1 C/A { "43.48" } i E1 { "44.73" } dB-Hz; faza kończy się przy własnej pierwszej utracie L1 C/A w przebiegu widma (<c1/>); poziom ochrony { "21.6" } m wobec { "50" } m

seg-50220d719d5d = holdover, { "600" } s

seg-50de7cd69ac0 = <c1/> (odmówiony, przenosi błąd początkowy, tu { "0" } ns), <c2/> (czirp włączony)

seg-1d59e94d94e5 = L1 C/A { "3.38" } i E1 { "4.44" } dB-Hz, oba poniżej dolnej granicy { "25" } dB-Hz; błąd czasu od -0.07 do { "5.06" } ns wobec zabezpieczenia { "50" } ns; alarm trwa

seg-6c56497d74fb = galileo-fallback, { "300" } s

seg-62bcfd3e8732 = <c1/> (zsynchronizowany ponownie), <c2/> (ton CW na nośnej L1), <c3/> na konstelacji typu Galileo Walker 24/3/1

seg-d455f0c06ee6 = L1 C/A utrzymany na { "17.98" } dB-Hz, E1 wrócił do { "44.73" } dB-Hz; poziom ochrony od { "6.1" } do { "17.7" } m; alarm wyciszony

seg-2db37e292efe = Odzyskanie E1 pod tonem CW opiera się na traktowaniu widma ciągłego w rodzaju widma: ton leży w zerze widma MBOC i niczego nie sprzęga. Prawdziwy ton sprzęgałby się przez linie widmowe kodu; jest to podane w pliku i w SPECTRUM.md.

seg-fb8d8636c554 = <c1/>: siatka parametrów dla dowolnego rodzaju

seg-b14a11d60e9f = Od jednego do trzech kluczy scenariusza w zapisie z kropkami, każdy w zakresie liniowym lub logarytmicznym, na tych samych wartościach osi, których używa rodzaj <c1/>. Każda oś ma nazwę i jednostkę; każda metryka ma nazwę i ścieżkę wyniku, a jej jednostka jest odczytywana z własnego bloku jednostek badanego rodzaju, chyba że kampania deklaruje własną. Przy <c2/> każdy węzeł jest zasianym zespołem Monte Carlo (realizacja <c3/> przy ziarnie węzła plus <c4/>), raportowanym ze statystykami poniżej. <c5/> przegląda zagłuszacz w odległości { "1" } km od odbiornika od -50 do +{ "10" } dBW: średni stosunek zagłuszacza do sygnału zmienia się dokładnie o { "1" } dB na dB (od { "12.2" } do { "72.2" } dB), a dostępność spada z { "1" } do { "0" } między -30 a -25 dBW.

seg-c1931e311cca = Klucz z kropkami może indeksować tablicę tabel według położenia: <c1/> to <c2/> trzeciej tabeli <c3/>, a <c4/> sięga trzy poziomy w głąb.

seg-e774c578906d = <c1/>: zasiany zespół

seg-bbacb9c66f92 = Realizacja <c1/> uruchamia scenariusz z kluczem ziarna ustawionym na <c2/>, zgodnie z konwencją, której już używa zespół zegara, dzięki czemu zespół odtwarza się dokładnie. Każda metryka podaje średnią, odchylenie standardowe populacji, percentyle 5., 50. i 95. metodą najbliższej rangi, percentylowy przedział ufności bootstrap { "95" }% dla średniej o stałym ziarnie ({ "2000" } prób) oraz domyślnie każdą próbkę w kolejności ziaren. Ścieżki wyniku mogą indeksować tablice: <c3/> to ostatnia próbka.

seg-ed182d15151d = <c1/>: kilka scenariuszy we wspólnych warunkach

seg-26fab14de534 = Nazwane wartości wspólne (liczba lub tablica liczb, z jednostką) są zapisywane w każdym elemencie pod kluczami, do których je wiąże, więc elementy nie mogą się nie zgadzać co do wspólnego warunku. Każdy element jest uruchamiany, a dla każdej metryki podsumowanie zbiorcze podaje najmniejszą, największą i średnią wartość po elementach, wskazując najlepszy i najgorszy. <c1/> umieszcza jeden zagłuszacz { "8" } dBW między statkiem w Zatoce Fińskiej (około { "30" } km dalej) a samochodem na nadmorskiej drodze w Helsinkach (około { "50" } km): statek traci każdego satelitę (średni stosunek zagłuszacza do sygnału { "39.0" } dB), a samochód zachowuje co najmniej czterech ({ "34.6" } dB).

seg-c888630c92d7 = <c1/>: najlepsza wartość jednej metryki

seg-b54f0deedd0f = Od jednego do trzech kluczy scenariusza w zapisie z kropkami, każdy ograniczony do <c1/> w skali <c2/> lub <c3/>, jest przeszukiwanych pod kątem najlepszej wartości jednej metryki (<c4/>, <c5/> lub <c6/>, co minimalizuje odległość od <c7/>).

seg-b57ec5e5168a = Są dwie metody:

seg-8fba07ce0cde = <c1/> uruchamia każdy węzeł siatki o <c2/> na klucz, na wartościach osi przeglądu.

seg-844a7c1e3578 = <c1/> (domyślna) uruchamia deterministyczny sympleks Neldera–Meada we współrzędnych znormalizowanych do [{ "0" }, { "1" }] na klucz. Punkty próbne są rzutowane na pudełko. Sekcja przyjmuje <c2/>, początkowy <c3/> oraz tolerancje zatrzymania <c4/> i <c5/>.

seg-2b1159b467f8 = Przebieg, którego metryka jest nieobecna lub nieskończona, otrzymuje najgorszy wynik i pozostaje w śladzie. Przy <c1/> metryką jest średnia z tych samych ziaren przy każdej ewaluacji. Wynik podaje <c2/>, <c3/>, <c4/>, <c5/>, <c6/> oraz każdą ewaluację w <c7/>.

seg-778a40736e7b = <c1/> przeszukuje zasięg i szybkość transmisji danych pod kątem zapasu łącza { "3" } dB. Optimum jest lokalne względem pudełka i punktu startu. Jest to MODELLED, nigdy twierdzenie globalne.

seg-b94ab5e6dad4 = Protokół i jego wstępnie zarejestrowane progi znajdują się w <c1/>. Test to <c2/>. Wyniki:

seg-232c68472fa4 = rozwiązanie celu 1-D zgadza się ze wzorem zamkniętym do { "6e-15" };

seg-22f7abf70fc4 = metoda siatki zgadza się co do bitu z niezależną pętlą przeszukiwania wyczerpującego;

seg-faea43f01e37 = sympleks radzi sobie co najmniej tak dobrze jak siatka { "41" } × { "41" }, w około jednej dziesiątej jej przebiegów.

seg-df1533fe6b95 = Próg 1-D rundy { "1" } jest zapisany jako NOT MET: wstępnie zarejestrowane pudełko wykluczało rozwiązanie.

seg-0862a4e9aa61 = Każdy wynik kampanii zawiera <c1/>, czyli SHA-256 (Secure Hash Algorithm { "2" }, 256-bitowy skrót) kanonicznej postaci JavaScript Object Notation (JSON) dokumentu kampanii (kolejność kluczy i formatowanie jej nie zmieniają), oraz blok <c2/> z liczbą przebiegów składowych i <c3/>, czyli SHA-256 ze skrótów wyników wszystkich elementów w kolejności dyspozytora. Dwa przebiegi o tym samym skrócie dały identyczne co do bajta wyniki elementów. Każdy przebieg fazy zapisuje też swój rodzaj, własny <c4/>, jeśli rodzaj go ma, oraz SHA-256 swojego dokumentu wyniku. Każda liczba w dokumencie ma wpis jednostek.

seg-2eeddb87e889 = Rdzeń jest sekwencyjny i nie czyta plików, więc kampania działa bez zmian w kompilacji WebAssembly. Kampanie nie mogą zawierać kampanii.

seg-f9b8b78dd64a = Eksporty

seg-c4443bf160f7 = <c1/> na kampanii zapisuje każdy scenariusz składowy, który ma geometrię, jako osobny zestaw plików, z etykietą elementu wstawioną przed przyrostkiem formatu: każdy przebieg fazy (<c2/> lub <c3/>, gdy faza ma kilka przebiegów), scenariusz bazowy przeglądu (<c4/>), scenariusz Monte Carlo (<c5/>) i każdy złożony element (jego własna etykieta, z zapisanymi wartościami wspólnymi, które wiąże). Element identyczny z wcześniejszym jest zapisywany raz; przekazania oraz wartości przeglądu lub ziarna stosowane w czasie przebiegu nie są w eksportowanych scenariuszach.

seg-0ba270495309 = Format, którego żaden z elementów nie potrafi opisać, jest odrzucany z podaniem tego powodu. Tabela dla poszczególnych scenariuszy znajduje się w <a1>INTEROP.md</a1>.

seg-c20904c9d3b5 = Kampanie LEO-PNT

seg-a598e2c06f51 = Piętnaście dołączonych kampanii ujmuje pytania o pozycjonowanie, nawigację i czas (PNT) na niskiej orbicie okołoziemskiej (LEO); <a1>LEO-PNT.md</a1> opisuje, co pokazuje każda z nich. Co każda uruchamia, w ujęciu wiersza poleceń:

seg-f65b1f2b4182 = Tryb

seg-e7d7defa7e71 = Pytanie

seg-08ab59acfe62 = złożenie, { "4" } elementy

seg-a21e4db0fda9 = dane usługi komunikatu nawigacyjnego a długość ramki

seg-6c29f4690d2c = przegląd <c1/>, { "7" } węzłów

seg-97fba77aa2ec = scalone pozycjonowanie MEO i LEO a błąd zasięgu sygnału w przestrzeni (SISRE) LEO

seg-7b9fbe34d38c = złożenie, { "2" } elementy

seg-28352bd0c9e3 = LEO-PNT wewnątrz budynków według pasma i klasy budynku

seg-a447c56022ec = przegląd <c1/>, { "9" } węzłów

seg-5b3cbfced221 = energia na jedno wyznaczenie pozycji w Internecie rzeczy (IoT) a moc nadawania LEO w UHF

seg-3ebd95e5933a = przegląd <c1/>, { "9" } węzłów

seg-cfbac004ff64 = pozycjonowanie w sieci nienaziemnej (NTN) a szerokość pasma sygnału referencyjnego

seg-07e8765975d1 = przegląd <c1/>, { "3" } węzłów

seg-db872d35033e = zbieżność precyzyjnego pozycjonowania punktowego (PPP) a wysokość 192-satelitarnej warstwy LEO

seg-a4ec677dc4e6 = łańcuch, { "3" } fazy w ciągu { "2100" } s

seg-2d91ecf8455d = Globalny System Nawigacji Satelitarnej (GNSS) zagłuszony, użytkownika prowadzi warstwa LEO, integralność zachowana

seg-c44991a2a24e = przegląd <c1/>, { "13" } węzłów

seg-4b6e292d88f5 = różnorodność pasm LEO a zagłuszacz zaporowy w paśmie L

seg-30d86b528bee = monitory spoofingu wobec czterech spooferów

seg-1690baf3a1b8 = łańcuch, { "1" } faza w ciągu { "86 400" } s

seg-4d5b507c04de = synchronizacja czasu stacji bazowych 5G: holdover i czas LEO

seg-d32a80c40470 = łańcuch, { "3" } fazy w ciągu { "1440" } s

seg-c38f9d3bd54e = śledzenie kontenerów przez LEO UHF: energia na wyznaczenie pozycji w trakcie podróży

seg-9bf38e403696 = łańcuch, { "2" } fazy w ciągu { "1500" } s

seg-dea7117552f4 = pojazd autonomiczny w miejskim kanionie z warstwą LEO

seg-dbbd9ffcbfb4 = łańcuch, { "2" } fazy w ciągu { "1800" } s

seg-37c0c3570023 = ten sam miejski kanion jako płaskie odcięcie { "35" } deg i jako panorama <c1/>

seg-ccaa34122145 = łańcuch, { "2" } fazy w ciągu { "87 000" } s

seg-d16d8b2e9089 = synchronizacja czasu infrastruktury krytycznej: holdover z czasem LEO

seg-4ee0b3036f4a = łańcuch, { "3" } fazy w ciągu { "10 800" } s

seg-157c5bec7f5f = użytkownicy polarni i arktyczni z polarną warstwą LEO

seg-64404160d0e7 = łańcuch, { "3" } fazy w ciągu { "2520" } s

seg-a35e1603ba32 = użytkownicy kolejowi i morscy z warstwą LEO

seg-3d819fa3fd1c = MEO to średnia orbita okołoziemska, UHF to częstotliwość ultrawysoka, a 5G to piąta generacja sieci komórkowych.

seg-490920844143 = Co jest sprawdzane

seg-483b1d4efb20 = <c1/> przypina tożsamości składania:

seg-881d97a3fa2b = <b>Kampania jednofazowa odtwarza samodzielny przebieg co do bitu.</b> Dla <c1/>, <c2/> i <c3/> dokument wyniku elementu jest identyczny co do bajta z <c4/> na pliku scenariusza, jego skrót jest tym, który podaje kampania, a przy siatce o własnym kroku przebiegu każda wyrównana wartość równa się wartości samodzielnego szeregu (C/N0 zagłuszania równa się średniej obliczonej niezależnie z dokumentu samodzielnego).

seg-1a9e1ed5b18c = <b>Przegląd jednowęzłowy i złożenie jednoelementowe</b> odczytują dokładnie samodzielną liczbę.

seg-883bb72e1239 = <b>Zespół o stałym ziarnie jest stabilny co do bajta</b>, a realizacja <c1/> jest dokładnie samodzielnym przebiegiem przy <c2/>; skrót kampanii ignoruje kolejność kluczy.

seg-170bc86059fa = Przypadek analityczny.

seg-0fd27291d6f4 = <c1/> uruchamia { "200" } ziaren zegara atomowego w skali układu scalonego z wyłącznie białym szumem częstotliwości (q_wf = { "9e-20" } s^2/s, Microchip SA.45s sigma_y({ "1" } s) = { "3e-10" }), zsynchronizowanego do { "590" } s i dryfującego do { "3600" } s. Końcowy błąd czasu ma rozkład Gaussa ze średnią { "0" } i odchyleniem standardowym sqrt(q_wf * { "3010" } s) = { "16.459" } ns (błądzenie losowe fazy przy białym szumie częstotliwości, National Institute of Standards and Technology (NIST) Technical Note { "1337" }). Podany przedział, [-2.52, { "1.59" }] ns, zawiera prawdziwą średnią { "0" }; odchylenie standardowe próbki, { "14.93" } ns, daje statystykę chi-kwadrat { "164.5" } przy { "199" } stopniach swobody, mieszczącą się w dwustronnym przedziale { "99" }% [{ "151.37" }, { "254.14" }]. Przy { "3000" } ziarnach ten sam scenariusz daje { "16.31" } ns.

seg-61b54a16243f = <b>Łańcuch napędzany widmem</b> odczytuje liczby samodzielne: faza początkowa trwa dokładnie tyle, ile czas pierwszej utraty w przebiegu widma, a każda wartość L1 C/A i E1 na osi czasu równa się, z dokładnością do { "1e-9" } dB, wierszowi samodzielnego przykładu wodospadu dla tego samego stanu zagłuszacza (nominalny, sam czirp, sam ton CW).

seg-5ebc02a24ce1 = <b>Łańcuch</b> przekazuje stan dalej zgodnie z dokumentacją: faza spoofingu trwa dokładnie tyle, ile czas detekcji w przebiegu spoofingu, holdover przenosi dokładnie przesunięcie przebiegu spoofingu w chwili detekcji, odzyskiwanie nie przenosi niczego, a alarm trwa wszędzie tam, gdzie brakuje poziomu ochrony lub przekracza on limit alarmowy.

seg-153e28bcb38a = Te sprawdzenia pokazują, że składanie nie zmienia niczego, czego nie powinno. Nie walidują misji połączonej w łańcuch względem zmierzonej, dlatego trzy wiersze kampanii w <a1>VERIFICATION-MATRIX.md</a1> są MODELLED.

seg-e82860f2d902 = <s1>Poprzednia</s1>Używanie rzeczywistych TLE

seg-e40757a0b4cb = <s1>Następna</s1>Raporty z przebiegów

seg-e65edbaca6bf = [[phases]]: misja połączona w łańcuch na jednej osi czasu

seg-a433ddf74e55 = [sweep]: siatka parametrów dla dowolnego rodzaju

seg-7ca90ac531bf = [monte_carlo]: zasiany zespół

seg-03d764a4cb56 = [compose]: kilka scenariuszy we wspólnych warunkach

seg-61a0db2550ba = [optimize]: najlepsza wartość jednej metryki
