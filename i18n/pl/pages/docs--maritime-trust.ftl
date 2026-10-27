# docs--maritime-trust: translations (pl)

seg-2247a2344710 = Znaczenie

seg-6940543aa3c0 = ciąg znaków

seg-abec93a4a488 = ciąg znaków lub null

seg-f5e7215e6835 = obiekt

seg-b993ef559bd0 = Z kodu

seg-c353e7bec219 = Klucz

seg-0da78c80fb76 = <c1/>, <c2/>, <c3/> lub <c4/>

seg-2896f449bffb = Źródło: <c1/>

seg-342f34403ac5 = Zaufanie morskie: czy mostek może zaufać tej pozycji?

seg-49b609a9655c = <c1/> może dla <b>poruszającego się statku</b> obliczać bieżący wskaźnik zaufania 0-100 dla każdej pozycji, na podstawie tego, co każdy odbiornik już umieszcza na magistrali (najpierw NMEA { "0183" }), i wskazywać, które kontrole go obniżyły. Jest to warstwa programowa działająca obok odbiornika. Nie jest odbiornikiem, nie zastępuje żadnego i nie czyni pozycji dokładniejszą.

seg-3c66739c9250 = <b>Oprogramowanie wyłącznie doradcze.</b> Kshana nie jest sprzętem nawigacyjnym z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }) i nie została oceniona względem żadnej normy działania. Jej wskaźnik i bramka są pomocą dla osądu nawigatora. Za bezpieczną nawigację statku oraz za każdą decyzję o poleganiu na pozycji lub o zaprzestaniu polegania na niej odpowiada nadal operator.

seg-a9899ca66661 = Ta strona mówi, na co patrzą kontrole, co każda z nich może, a czego nie może wychwycić, jak uruchomić ją na żywo i co robi bramka. Mapowanie wskaźnika i każda wartość domyślna znajdują się w <a1><c1/></a1>.

seg-05e79b6c5a58 = Co odczytuje

seg-e784fdbe26e6 = Statek jest deklarowany w pliku sesji, z limitami podanymi przed przebiegiem:

seg-e8e9ee2965cf = Zdanie

seg-e127f2f26824 = Odczytywane

seg-5e17bb4156f1 = GGA

seg-b38b8385ddcb = położenie, jakość pozycji ({ "0" } = brak pozycji), wysokość nad średnim poziomem morza, separacja geoidy, HDOP

seg-870056f55c30 = RMC

seg-445c02505551 = status (<c1/> ważna, <c2/> nie), prędkość i kurs nad dnem, data, tryb

seg-8a259fc7b06d = VTG

seg-eb3e34f58751 = prędkość i kurs nad dnem, gdy RMC ich nie ma

seg-add66711c27b = HDT, THS

seg-24e36e50b0ad = kurs (THS tylko gdy jego tryb nie jest <c1/>)

seg-bcfb4cd59951 = VHW, VBW

seg-fa0a0dae1510 = prędkość względem wody (VBW tylko gdy jej status to <c1/>)

seg-774d1991fb0b = ZDA

seg-68d981999c72 = czas

seg-a0cc45088f5f = GSV

seg-0fad368a11cb = moc sygnału każdego satelity (dB-Hz), elewacja i azymut (dla geometrii)

seg-032eafc03b42 = GSA

seg-71334afb8a7d = współczynnik DOP i użyte satelity (dla geometrii, gdy GSV nie daje nieba; oraz podany HDOP, z którym porównuje strażnik)

seg-305f423d3ead = status OSNMA zgłoszony przez odbiornik, przetłumaczony na to zdanie przez adapter czytający odbiornik: <c1/> uwierzytelniony, <c2/> niepowodzenie, <c3/> brak wyniku

seg-7ce1d69e710e = Epoki, o których sam odbiornik mówi, że nie są pozycją satelitarną (jakość GGA { "0" } lub od { "6" } do { "8" }: estymowana, ręczna, symulator; status RMC <c1/> albo tryb <c2/>, <c3/>, <c4/>, <c5/>), nie są używane do kontroli położenia i nie niosą żadnego dowodu w żadną stronę: odbiornik już to powiedział.

seg-a0ae80781c6e = Pierwsze <c1/> sekund tworzy punkt odniesienia i nigdy nie jest oceniane. Każdy monitor patrzy tylko na bieżącą i wcześniejsze epoki, więc decyzja w danej epoce nie zmienia się po nadejściu późniejszych danych, a strumień na żywo daje ten sam wskaźnik co ten sam tekst odczytany jako plik.

seg-068593ad0a52 = Co każda kontrola wychwytuje, a czego nie może

seg-094b90f0c701 = Kierunki między pozycjami (azymut toru używany przez kontrolę prędkości zwrotu, kurs wynikający z dwóch położeń) są kierunkiem cięciwy między nimi, czyli <b>średnim azymutem</b> geodezyjnej między pozycjami, a nie azymutem wprzód w pierwszej pozycji; oba różnią się o około połowę zbieżności południków między pozycjami ({ "0.001" } stopnia dla bazy { "260" } m na szerokości { "59.5" } stopnia).

seg-ed3cdfcfbff5 = Sfałszowane położenie musi zgadzać się z fizyką statku i z jego innymi czujnikami. Każda kontrola porównuje pozycję z jednym z nich. Kontrola jest tak niezależna, jak jej drugie źródło: kurs z kompasu GNSS albo „prędkość względem wody” wyprowadzona z GNSS nie jest niezależna od badanego odbiornika i nic nie wnosi.

seg-5dd62cd853c6 = Może <b>wstrzymać prawidłowe rozwiązanie pozycji</b> (fałszywy alarm), a także przepuścić sfałszowane (niewykryte zdarzenie). Monitory sprawdzają rozwiązanie pozycji na tle fizyki statku i jego pozostałych czujników; podróbka spójna ze wszystkimi z nich nie zostanie zauważona (zob. ograniczenia poniżej).

seg-a284a3ec9dfe = Oczekuje <b>czystego strumienia tekstowego NMEA { "0183" }</b>. Ramki binarne wmieszane w strumień są przekazywane bez zmian, ale <c1/> może wtedy trafić między bajty ramki.

seg-0c919698fa92 = <b>Nie ma zatwierdzenia typu</b>, a nic w nim nie zostało ocenione względem IEC { "61108" } ani IEC { "61162" }. Za nawigację statku odpowiada nadal operator.

seg-9e3ea39c38cf = <s1>Poprzednia</s1>Zaufanie do odbiornika

seg-136da5c10b2d = <s1>Następna</s1>Strumienie szkoleniowe NMEA

seg-990a49527516 = $PKSHT: zdanie własnościowe

seg-9480aabf136e = Sprawdzenie

seg-20e4f746c7e1 = Wychwytuje

seg-e7b2ebe5eabc = Nie potrafi

seg-21ad9895f606 = skok pozycji; trasę, której ruchu nie wyjaśniają zgłoszona prędkość i kurs; wynikającą z przebiegu prędkość, przyspieszenie lub prędkość zwrotu przekraczające podane granice dla statku

seg-dcbc6d4cd17f = zwodzenie (drag), którego zgłoszona prędkość i kurs podążają za sfałszowaną trasą i mieszczą się w granicach (odbiornik wyprowadza je z własnego rozwiązania, więc są ze sobą zgodne); zbyt wysoko podaną granicę prędkości

seg-3542f83a7988 = trasę odbiegającą od kierunku, w którym wskazuje statek, o więcej niż podany kąt znoszenia

seg-75f4d659f716 = zwodzenie wzdłuż kursu (kurs się nie zmienia); kierunek z tego samego odbiornika lub z kompasu GNSS; znos poprzeczny powyżej tolerancji (fałszywy alarm); prędkości poniżej <c1/>

seg-09dde82be447 = zwodzenie, które zmienia prędkość nad dnem względem prędkości względem wody

seg-6ac740e5f51c = log pochodzący z GNSS; prąd powyżej dopuszczalnej wartości (fałszywy alarm); zwodzenie wolniejsze niż dopuszczalna wartość

seg-e85d5f0933b7 = wysokość, która nie jest tam, gdzie umieszczają ją powierzchnia morza i podana wysokość anteny

seg-3806e1d46332 = spoofer, który utrzymuje wiarygodną wysokość; tolerancja jest szeroka, ponieważ samodzielny błąd pionowy jest duży; separacja geoidy jest rejestrowana, ale nie sprawdzana, bo silnik nie ma modelu geoidy

seg-5b70bd80640e = sygnaturę jednego nadajnika: C/N0 wszystkich satelitów spadające razem lub rosnące razem względem bazowego poziomu kalibracji

seg-e6874a8047b1 = spoofera, który kształtuje moc osobno dla każdego satelity; cokolwiek, gdy sam poziom bazowy jest objęty spoofingiem; zbyt wolną kadencję GSV, by dało się za nią nadążyć

seg-371b17ce936a = nieregularne skakanie czasu odbiornika lub jego bieg wstecz; względem zegara tego komputera, rozchodzenie się czasu odbiornika z nim (tylko strumienie w czasie rzeczywistym)

seg-026479cb7966 = sfałszowany czas, który jest spójny i stały; zegar, który jest błędny od samego początku

seg-906ab911b73d = zgłoszoną porażkę uwierzytelnienia OSNMA

seg-a04757b7ae57 = status jest odczytywany, a nie weryfikowany; spoofer, który tłumi zgłoszenie, nie jest widoczny

seg-c36c24a337b8 = odmowę mocy i utratę satelitów, jak w przypadku statycznym

seg-940b39a3988a = mówią, że środowisko jest wrogie, a nie że rozwiązanie pozycji jest błędne

seg-9d751e1f5938 = <b>Czego monitory oparte wyłącznie na NMEA nie potrafią.</b> Spoofer, który odtwarza całą konstelację ze spójną wewnętrznie pozycją, prędkością, kursem zgodnym z kierunkiem, wiarygodną mocą poszczególnych satelitów i zgodnym zegarem, jest niewidoczny dla każdego z powyższych sprawdzeń: nic w zdaniach nie odróżnia jego rozwiązania od prawdziwego. Tak samo jest z odtworzeniem zarejestrowanych prawdziwych sygnałów. Lukę tę zamykają uwierzytelnianie (OSNMA albo odbiornik z własną ochroną przed spoofingiem) i niezależne czujniki nawigacyjne; ta warstwa może jedynie wykorzystać ich zgłaszany status. Strumień, który jest już poddawany spoofingowi w czasie tworzenia poziomu bazowego, nie ma czystego poziomu bazowego. Brak alarmu nie jest dowodem dobrego rozwiązania pozycji.

seg-e3e09e2412fb = Wskaźnik zaufania

seg-a1c05079de2f = Każda epoka po kalibracji otrzymuje ocenę od { "0" } do { "100" } wraz z przyczynami, dla których nie wynosi ona { "100" }: które sprawdzenia odjęły punkty, ich statystyka względem progu i ich punkty. Przedziały (granice podane w sesji): <c1/> przy { "90" } lub więcej, <c2/> przy { "55" } lub więcej, <c3/> poniżej. Odwzorowanie, każda waga i jej uzasadnienie znajdują się w <a1><c4/></a1>; jest deterministyczne i ustalone przed oceną dziennika, bez uczenia i bez niczego dopasowywanego do zdarzeń.

seg-d56822e82e3d = Każde wyjście dla statku zawiera oświadczenie doradcze: klucz <c1/> w JSON wyniku i w każdej linii na żywo, pierwszy wiersz komentarza <c2/> w CSV (czytniki pomijają go opcją komentarza), <c3/> oraz stopkę SVG. Wyjścia przebiegu wsadowego: <c4/> (z modelem oceny i odjęciami każdej epoki), <c5/> (z kolumnami <c6/> i <c7/>) oraz <c8/>, który dla statku jest trasą zgłoszoną przez odbiornik, pokolorowaną według przedziału zaufania, nad wykresem oceny w czasie.

seg-918516588036 = Demonstracja syntetyczna

seg-e6717d346ca6 = <c1/> zawiera zmyślony dziennik NMEA promu na trasie Tallinn–Helsinki (50-minutowy fragment, około { "17" } kn, { "1" } Hz: GGA, RMC, VTG, kierunek z żyroskopu, log prędkości, GSV z wiarygodnym niebem), w którym od { "1500" } s odciągnięcie pozycji (drag-off) odsuwa <em>zgłaszaną</em> pozycję od rzeczywistej pozycji statku. Odbiornik przez cały czas zgłasza <b>ważne</b> rozwiązanie pozycji; spada wskaźnik zaufania, przechodząc przez przedział obniżony do przedziału braku zaufania. <c2/> podaje przed przebiegiem każdy próg, granice statku i każdą wagę oceny.

seg-b2f24e5091d0 = Dziennik to <b>tekst zapisany do pliku</b> przez <c1/>: nie modeluje żadnego sygnału radiowego i niczego nie nadaje. Nie jest pomiarem, a trasa jest ilustracyjna, nie jest mapą nawigacyjną. <c2/> utrwala dziennik i oczekiwane wyniki jako zabezpieczenia regresji na danych syntetycznych; nie mówią nic o tym, jak jakikolwiek monitor radzi sobie przy rzeczywistych zakłóceniach.

seg-26ab8544afba = Wskaźnik zaufania podczas jednego syntetycznego rejsu, z rzeczywistego przebiegu silnika v{ $version } na examples/maritime-trust (zmyślony dziennik NMEA promu na trasie Tallinn–Helsinki, { "3001" } epok przy { "1" } Hz). Trzy pasy dzielą jedną oś czasu. Góra: odległość między pozycją zgłaszaną przez odbiornik a rzeczywistą pozycją statku, która pozostaje w granicach kilku metrów do około { "1576" } s, gdy zaplanowane w dzienniku odciągnięcie pozycji ją odsuwa, podczas gdy odbiornik nadal zgłasza ważne rozwiązanie pozycji. Środek: wskaźnik zaufania od { "0" } do { "100" }, nieobliczany w pierwszych { "300" } s kalibracji, w przedziale nominalnym (co najmniej { "90" }) do odciągnięcia pozycji, a potem spadający przez przedział obniżony (co najmniej { "55" }) do przedziału braku zaufania. Dół: przedział każdej epoki jako kolorowa wstęga z jego nazwą. Wynik ma charakter doradczy. Oprogramowanie wyłącznie doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu (IEC { "61108" }, IEC { "61162" }): za nawigację statku odpowiada nadal operator. Dziennik jest zmyślony, aby pokazać format i monitory; nie jest pomiarem i nic nie mówi o tym, jak poradziłby sobie jakikolwiek odbiornik.

seg-ed183c325c7e = Rysunek jest tworzony przez <c1/> z rzeczywistego przebiegu tej demonstracji (<c2/>); wynik ma charakter doradczy, a dziennik jest zmyślony.

seg-8badaf0d8586 = Specyfikacja widoku Studio

seg-588092535a89 = Dla tego, kto buduje widok Studio dla przebiegu statku. Nic w tej sekcji nie jest jeszcze zaimplementowane w Studio; strona silnika (dane poniżej) jest.

seg-5c34f31acf1d = <b>Dane wejściowe.</b> Jedno z:

seg-57ca6d9000b1 = JSON wyniku przebiegu wsadowego (<c1/> albo to samo przez <c2/> w pakiecie WebAssembly z dziennikiem w treści): <c3/> (granice przedziałów, narastanie, utrzymanie dowodu, każda waga), <c4/>, <c5/> i <c6/>, każdy z <c7/>, <c8/>, <c9/>, <c10/>, <c11/> oraz od { "0.36" } <c12/> i <c13/> każdego odjęcia, z <c14/> i <c15/> na najwyższym poziomie; albo

seg-bfab64386b6c = linie JSON na żywo (schemat powyżej), po jednym obiekcie na epokę, dopisywane w miarę trwania strumienia. Każda linia zawiera zgłoszone przez odbiornik <c1/> (schemat { "1.1" }).

seg-f7c7462d315e = Zestaw demonstracyjny to <c1/>: <c2/>, <c3/> (dziennik) i <c4/> (<c5/>: gdzie statek naprawdę był, czego nie ma żaden prawdziwy dziennik). Widok powinien uruchomić sesję i równolegle czytać plik prawdy.

seg-c015c26cf30a = Co narysować.

seg-92f452bdbed6 = <em>Trasa</em>, północ u góry, jedna skala na obu osiach: zgłaszane przez odbiornik pozycje jako linia pokolorowana według przedziału epoki (szary kalibracja, zielony nominalny, bursztynowy obniżony, czerwony brak zaufania), z oznaczonym początkiem i końcem oraz podziałką. Dla demonstracji prawdziwa trasa jako cienka neutralna linia pod spodem, aby odciągnięcie pozycji było widać jako rozchodzenie się obu; przełącznik prawdziwej trasy i odczyt odsunięcia w metrach w chwili wskazanej kursorem.

seg-3ba328e2188c = <em>Oś czasu oceny</em>: ocena od { "0" } do { "100" } w funkcji czasu, granice przedziałów (<c1/>, <c2/> z <c3/>) jako linie przerywane, przedział jako pasek poniżej oraz początek każdego podanego zdarzenia jako znacznik. Oś czasu jest wspólna z trasą.

seg-33447da1d56d = <em>Przyczyny</em>: dla epoki pod kursorem odjęcia (monitor, stosunek do progu, punkty) jako poziome słupki, od największego, z wagą każdego monitora z <c1/>; monitory, które działały i nic nie kosztowały, pokazane blado, monitory, które nie działały (brak w <c2/>), wypisane jako „not run”, nigdy jako zaliczone. Monitor <c3/> nie ma wpisu <c4/>: jego limit to <c5/>.

seg-d0379b68ea67 = <em>Paski monitorów</em>: jeden cienki pasek na każdy monitor w <c1/>, pokazujący jego stosunek w czasie (alarm przy { "1" }), aby czytelnik widział, które sprawdzenie poruszyło się pierwsze.

seg-83d881ce6ab0 = <em>Stan bramki</em>: w widoku na żywo <c1/> każdej epoki (<c2/>, <c3/>, <c4/>) jako pasek pod paskiem przedziału oraz najnowszy <c5/>. W widoku wsadowym epoki, które bramka by wstrzymała, to te, których przedział jest bez zaufania, z zastosowanym wstrzymaniem zwolnienia.

seg-b96652af3a03 = <em>Pas geometrii</em> ({ "0.36" }): pasek pod paskiem przedziału pokolorowany według <c1/> (zielony dobry, bursztynowy obniżony, szary kreskowany nieznany), w innej rodzinie kolorów niż pasy niespójności i środowiska, z legendą „geometry: the sky, not the signal”. Odjęcia pokolorowane według <c2/> (geometria, środowisko, niespójność) w panelu przyczyn i na paskach monitorów oraz liczby epok w poszczególnych klasach z <c3/> obok liczb epok w przedziałach. Dla epoki pod kursorem: <c4/>, <c5/>, HDOP, PDOP, VDOP, <c6/>, <c7/> oraz flaga, gdy ustawiono <c8/> (odjęcie za geometrię jest wtedy niespójnością). <c9/> jest pokazywane jako „geometry unknown: no GSV or GSA in the log”, nigdy jako dobre. Progi <c10/> i ich pochodzenie z <c11/> znajdują się obok ustawień oceny. Uwaga doradcza pozostaje.

seg-c48906d03f90 = <em>Rozwiązanie pozycji zgłoszone przez odbiornik</em>: odbiornik demonstracji przez cały czas zgłasza ważne rozwiązanie (jakość GGA { "1" }, status RMC A); powiedz to w legendzie, ponieważ na tym polega sens widoku.

seg-869c8a92e2cf = <b>Interakcje.</b> Jeden kursor czasu wspólny dla wszystkich paneli (przeciąganie, klawisze strzałek i przycisk odtwarzania, który odtwarza od 1x do 60x); najechanie na trasę lub dowolny pasek go przesuwa. Kliknięcie odjęcia podświetla epoki, w których dany monitor przekroczył swój próg wejścia. Filtr przedziału (pokaż tylko epoki obniżone i bez zaufania) oraz skok do pierwszego odjęcia i do pierwszej epoki bez zaufania. Podpowiedź przy każdej nazwie monitora z jednowierszowym opisem z tej strony. Progi i wagi sesji są pokazane tylko do odczytu obok wykresu, aby na ekranie było widać, czego użyto do oceny.

seg-1f97fe8ea2f1 = <b>Brzmienie do zachowania.</b> Strona musi mówić, że jest to oprogramowanie doradcze, a nie sprzęt nawigacyjny z zatwierdzeniem typu, że demonstracja jest syntetycznym tekstem ze zmyślonym odciągnięciem pozycji oraz że rozwiązanie pozycji bez alarmu nie jest przez to dobre (zob. ograniczenia powyżej). Żadna liczba na stronie nie powinna być odczytywana jako miara tego, jak sprawdzenia radzą sobie przy rzeczywistych zakłóceniach.

seg-079ce44fd53e = Dla wywołujących, którzy mają sesję i bajty w pamięci (bez plików, zegara i gniazd; bezpieczne dla WebAssembly), <c1/> udostępnia:

seg-e8c3172d72b8 = <c1/>: cały dziennik, oceniony jak przebieg wsadowy; ten sam wynik co <c2/>, serializowany do JSON wyniku (<c3/>, <c4/>, <c5/> z ocenami i odjęciami).

seg-0302b7c35fd3 = <c1/>: ograniczony fragment strumienia (najwyżej { "2" } MiB i { "20,000" } epok, a zarazem dość długi, by obejmować okno kalibracji), oceniony tak, jak ocenia tryb na żywo, i zwrócony w schemacie linii JSON na żywo (<c2/>, ostatnie <c3/>, podsumowanie liczb epok w przedziałach, najniższa i końcowa ocena, czas pierwszej epoki bez zaufania). Czas odbiornika nie jest porównywany z zegarem hosta. Długotrwały tryb na żywo (gniazda, dopisywany plik, bramka) należy do pliku binarnego.

seg-d971dae93784 = Oba wymagają sesji z <c1/>; jej tabela <c2/> jest opcjonalna.

seg-870fece8026e = Uruchom na żywo

seg-c132d449414f = Sesja to ten sam <c1/> co w przebiegu wsadowym, z tabelą <c2/>, która deklaruje <c3/>; jej tabela <c4/> nie jest potrzebna. Porty szeregowe nie są jeszcze otwierane bezpośrednio: odczytaj port narzędziem, którego już używasz (<c5/> i <c6/>, serwer terminali, multiplekser) i przekaż dane potokiem lub dalej. Bezpośrednie wejście szeregowe może pojawić się później.

seg-13a043c1ce60 = Każda zakończona epoka zapisuje jedną linię JSON na stdout:

seg-b1f0c563c94d = <c1/> to <c2/>, <c3/>, <c4/> lub <c5/> (przedział oceny, z granicami w tabeli <c6/> sesji); <c7/> jest nieobecne podczas kalibracji; <c8/> wymieniają, które sprawdzenia odjęły punkty i ile, od największych.

seg-9b21238a7dc1 = Schemat linii JSON (wersja { "1.1" })

seg-79306ff2d878 = Jeden obiekt JSON na zakończoną epokę, klucze w tej kolejności:

seg-a129b9e613d0 = Typ

seg-bbcdd898d24d = liczba całkowita

seg-96958263575f = liczba zgłoszonych epok, od { "1" }

seg-16022703e1c0 = liczba

seg-95dde7698840 = sekundy od pierwszej epoki strumienia

seg-dee4f7b91079 = czas epoki podany przez strumień (ISO-8601 UTC z datą, gdy widziano RMC, w przeciwnym razie <c1/>)

seg-0361f40a8e59 = liczba lub null

seg-c2418289d966 = od { "0" } do { "100" }, jedno miejsce po przecinku; null podczas kalibracji lub gdy <c1/> podaje, dlaczego nie można jej było wytworzyć

seg-00575e5df2e1 = tablica

seg-54c1f879643b = <c1/>, od największych punktów; <c2/> to statystyka podzielona przez próg (alarm przy { "1" } lub więcej); wymienione są tylko monitory, które kosztowały punkty; <c3/> <em>(dodano w { "1.3" })</em> to <c4/>, <c5/> lub <c6/>

seg-24d178dfb34f = tablica ciągów

seg-30948e769405 = monitory na poziomie progu lub powyżej niego

seg-fb08af60656f = <c1/>, <c2/> lub <c3/>

seg-495aa49df7e2 = dlaczego nie wytworzono oceny (na przykład zadeklarowany czujnik kierunku jest nieobecny)

seg-3dabfd59cf4b = obiekt lub null

seg-9395d2543ac0 = <em>(dodano w { "1.1" })</em> pozycja zgłoszona przez odbiornik w tej epoce, <c1/> (wysokość elipsoidalna, gdy zdanie podaje separację geoidy, w przeciwnym razie nad średnim poziomem morza); null, gdy odbiornik żadnej nie podał, w tym w epokach kalibracji bez rozwiązania

seg-3af4806d7d74 = <em>(dodano w { "1.2" })</em> czym to oprogramowanie jest, a czym nie jest: doradcze, nie jest to sprzęt nawigacyjny z zatwierdzeniem typu, operator nadal ponosi odpowiedzialność

seg-79adcc5ee873 = <em>(dodano w { "1.3" })</em> geometria satelitów: <c1/> (<c2/>, <c3/>, <c4/>, gdy strumień nie ma elewacji i azymutów GSV ani GSA), <c5/> (<c6/>, <c7/>, <c8/>, <c9/>), <c10/> (<c11/>, <c12/>, <c13/>), <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/> (satelity widoczne, ale nieśledzone, gdy DOP widocznych jest dobry: odjęcie za geometrię jest wtedy <c26/>), <c27/> (<c28/>, <c29/>, <c30/>, <c31/>: zawsze zgłaszane, nigdy nieoceniane; ocena odejmuje punkty tylko za <c32/>) (zob. <a1><c33/></a1>)

seg-fc212411bf3c = Nazwy monitorów (kebab-case; { "17" }): <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/> oraz od { "1.3" } <c17/>. W późniejszych wersjach mogą zostać dodane nowe nazwy; konsumenci powinni traktować nieznaną nazwę monitora jako monitor. Układ <c18/> poniżej niesie wersję formatu w pierwszym polu; ten schemat JSON ma wersję { "1.3" }: { "1.1" } dodała <c19/>, { "1.2" } <c20/>, { "1.3" } <c21/> na końcu i <c22/> w każdym odjęciu, a zmienia się wyłącznie przez dodawanie kluczy na końcu.

seg-0019bf7fbfcd = Wejście uwierzytelniania

seg-39b3dfbd97cc = Monitor <c1/> przyjmuje status uwierzytelnienia poszczególnych satelitów ze źródła uwierzytelniania przez <c2/> (lista <c3/>, status <c4/>, <c5/> lub <c6/>), obok ogólnego <c7/>. Po stronie NMEA to samo przenosi <c8/>, na przykład <c9/>. Każda porażka, ogólna lub dla jednego satelity, uruchamia alarm monitora i kosztuje całą jego wagę (otrzymuje stosunek { "1.5" }); sukces nie jest dowodem. Kshana niczego tu nie weryfikuje: za zgłaszany status odpowiada źródło, które to robi.

seg-8ffc94901796 = Epoka jest zakończona, gdy nadejdzie następne zdanie z czasem; zdania wolniejszych lub niezsynchronizowanych przyrządów (żyroskop kilka dziesiątych sekundy za odbiornikiem), które nadejdą wcześniej, należą do niej. Jeśli strumień zatrzyma się na <c1/> (domyślnie { "1.5" } s, ustaw wartość powyżej najdłuższej przerwy między zdaniami z czasem z twojego odbiornika), epoka jest kończona w takim stanie, w jakim jest. Pierwsze <c2/> sekund strumienia tworzy poziom bazowy i nigdy nie jest oceniane, więc <b>strumień, który jest już poddawany spoofingowi w chwili pierwszego podłączenia, nie ma czystego poziomu bazowego</b>: uruchom warstwę przed rejsem albo wtedy, gdy wiadomo, że rozwiązanie pozycji jest dobre. Okno kalibracji zamyka się raz, według kolejności nadejścia: epoka, której czas jest wcześniejszy niż czas już widziany (cofnięcie, odtworzenie początku strumienia), nigdy nie jest kalibracją, cokolwiek mówi jej czas; jest oceniana z pełnym odjęciem <c3/>, co oznacza brak zaufania. Silnik na żywo ocenia każdą epokę względem epok kalibracji i mniej więcej ostatniej minuty strumienia, więc jego koszt na epokę rośnie z <c4/> razy częstość epok; na szybkim odbiorniku utrzymuj krótkie okno. Jego bufory są ograniczone (zalew linii bez zdania z czasem jest kończony co { "5,000" } linii, kalibracja i historia są ograniczone do { "20,000" } epok).

seg-2ef5aad7c750 = Czas odbiornika jest też porównywany z monotonicznym zegarem tego komputera, co ma sens tylko dla strumienia nadchodzącego w czasie rzeczywistym. Zapisany dziennik podawany z pełną szybkością przez stdin, TCP lub UDP z konstrukcji uruchamia to sprawdzenie: przekaż <c1/>. (<c2/> bez <c3/> już to implikuje.) <c4/> jest czytane jako odtwarzanie, dopóki nie zostanie przeczytane do końca, a zegar hosta jest włączany od tej chwili, więc zaległość nie wygląda na błąd zegara; sprawdzenie wymaga wtedy, aby okno kalibracji było jeszcze otwarte (w przeciwnym razie nie ma poziomu bazowego i się nie uruchamia).

seg-a06e58b2cfc8 = Zakończenia strumieni i błędy: stdin i plik czytany do końca kończą się normalnie (wyjście { "0" }). Połączenie TCP zamknięte przez drugą stronę nie jest normalnym końcem strumienia, który powinien trwać: warstwa kończy działanie z kodem niezerowym po ocenieniu i zapisaniu wszystkiego, co odebrała, i nie łączy się ponownie, więc uruchamiaj ją pod nadzorcą, który ją restartuje. Datagramy UDP dzielące zdanie są łączone; czytniki stdin, pliku i TCP są wspierane ograniczoną kolejką, która wywiera nacisk zwrotny na nadawcę (nic nie ginie), natomiast UDP, które nie może wywierać nacisku zwrotnego, odrzuca datagramy, których silnik nie może przyjąć, i informuje o tym na stderr. <c1/> wiąże się z adresem pętli zwrotnej; podaj <c2/>, aby nasłuchiwać gdzie indziej (wypisywane jest ostrzeżenie).

seg-0a0ed5e74ea4 = <c1/>: zdanie własnościowe

seg-71ccf4a80c99 = Każda epoka tworzy też jedno zdanie NMEA { "0183" } z poprawną sumą kontrolną, które <c1/> zapisuje do pliku lub na stdout i które bramka wstawia do przekazywanego strumienia:

seg-df9382f4b055 = <c1/>: wersja formatu

seg-6986879f86fb = czas UTC epoki, <c1/>; puste, jeśli strumień go nie podał

seg-34418696f9d2 = wskaźnik zaufania od { "0" } do { "100" }, jedno miejsce po przecinku; puste podczas kalibracji lub gdy nie można go było wytworzyć

seg-0b249ba73868 = przedział: <c1/> kalibracja, <c2/> nominalny, <c3/> obniżony, <c4/> bez zaufania

seg-281aba68405a = bramka: <c1/> wyłączona, <c2/> przepuszczone, <c3/> wstrzymane (rozwiązanie pozycji oznaczono jako nieważne w przekazywanym cyklu)

seg-f306c3f54a48 = do dwóch przyczyn, <c1/> połączonych znakiem <c2/>; puste, gdy nic nie odjęto

seg-4bee29dfe578 = Adres to <c1/> + mnemonik producenta <c2/> + <c3/>. Urządzenia, które nie znają zdania własnościowego, ignorują je. Kshana ignoruje własne <c4/> na wejściu.

seg-d75c9da94f37 = Tryb bramki

seg-30c1f4a5706c = <c1/> umieszcza Kshana między odbiornikiem a urządzeniami, które korzystają z jego rozwiązania pozycji (system map, system sterowania torem). Strumień NMEA wchodzi, wychodzi na stdout i jest:

seg-aa0692146620 = <b>przepuszczany bez zmian</b>, dopóki epoka nie jest bez zaufania (oraz podczas kalibracji), z <c1/> po każdym cyklu zdań; oraz

seg-bbdd68edbb17 = <b>oznaczany jako nieważny</b>, gdy jest bez zaufania: jakość GGA <c1/>; status RMC <c2/> (oraz jego wskaźnik trybu <c3/> i status nawigacyjny <c4/>, gdzie występują); tryb GNS <c5/> w każdej pozycji; status GLL <c6/> i tryb <c7/>; tryb VTG <c8/>, gdzie go ma. Pola pozycji pozostają bez zmian: chodzi o to, aby urządzenie widziało, że sam odbiornik deklaruje rozwiązanie jako nieważne, i podniosło własny alarm. W każdym przepisanym zdaniu suma kontrolna jest obliczana na nowo.

seg-23ee46747297 = Po wstrzymaniu rozwiązanie jest zwalniane dopiero wtedy, gdy epoki przez <c1/> (domyślnie { "30" } s) pozostawały poza przedziałem bez zaufania, więc ocena na granicy przedziału nie może powodować migotania rozwiązania. Linie JSON trafiają tylko tam, gdzie wskazuje <c2/> (domyślnie nigdzie, bo strumień ma stdout).

seg-6b7b557a4909 = Aby umożliwić plotterowi map bezpośrednie połączenie, udostępnij strumień po bramce przez TCP zamiast na stdout:

seg-96ff51df9abe = <c1/> nasłuchuje na adresie pętli zwrotnej; <c2/> nasłuchuje gdzie indziej (wypisywane jest ostrzeżenie, ponieważ każdy, kto dotrze do adresu, może czytać strumień). Może się połączyć dowolna liczba klientów; każdy dostaje ten sam strumień od chwili połączenia, a klienci tylko czytają. Każdy klient ma własną ograniczoną kolejkę i własny zapis, więc ten, który nie nadąża, jest odłączany (jego połączenie zamykane, linia na stderr) i nigdy nie opóźnia pozostałych ani wejścia. <c3/> wymaga <c4/>; stdout nie niesie wtedy nic ze strumienia, więc <c5/> jest wolne.

seg-960e0abb0466 = Czego bramka nie robi i co warto wiedzieć przed jej użyciem:

seg-ee3f18efa84c = Jest <b>dobrowolna</b>. Nic nie oznacza rozwiązania jako nieważnego, jeśli nie podano <c1/>.

seg-9cd8243cb437 = <b>Dodaje opóźnienie</b>: cykl jest wstrzymywany, dopóki jego epoka nie zostanie oceniona, czyli do następnego zdania z czasem (około jednego cyklu: sekundy dla odbiornika { "1" } Hz), albo <c1/> po ostatnim, gdy strumień utknie. Urządzenia, które potrzebują zdania w ciągu kilkudziesięciu milisekund od wyjścia odbiornika, nie mogą się za nią znajdować.

seg-ec63f8f3230b = Jest <b>pojedynczym punktem w łańcuchu</b>: jeśli się zatrzyma, zatrzyma się strumień. Uruchamiaj ją pod nadzorem i z góry zdecyduj, co robi urządzenie dalej w łańcuchu bez strumienia.

seg-536e41a6a5e7 = <b>W razie własnych usterek zawodzi w bezpiecznym kierunku</b>: jeśli monitory nie mogą wytworzyć oceny po kalibracji (zadeklarowany czujnik kierunku nic nie wysyła, za mało epok kalibracji), epoka jest bez zaufania, niesie <c1/> i jest wstrzymywana; wstrzymanie zwolnienia jest mierzone zegarem tego komputera, a nie czasem odbiornika, który kontroluje spoofer (dla odtworzenia jest tylko czas odbiornika).
