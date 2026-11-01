# docs--slot-timing: translations (pl)

seg-3a0e724a8a2b = Poziom

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Znaczenie

seg-f917e7fcac09 = Czym jest

seg-adc34608c46b = Klasa

seg-f63dd3d7aad4 = Źródło

seg-1ff32b87e030 = Satelity

seg-582fd72f1a1a = Werdykt

seg-430edd66bda0 = Niemodelowane

seg-f23c8bd5f203 = Źródło: <c1/>

seg-1f2727dc4ca4 = Rodzaj scenariusza <c1/> odpowiada na trzy pytania dotyczące zegara, który swobodnie dryfuje między synchronizacjami i musi utrzymać ruch w obrębie <b>szczeliny indeksowanej czasem</b>: szczeliny routingu, zadaniowania lub kontaktu, której <b>margines</b> to największy bezwzględny błąd czasu, po dowolnej stronie, przy którym szczelina jeszcze działa.

seg-6b39d8afeb5d = <b>Kiedy margines zostaje przekroczony?</b> Liczba sekund od ostatniej poprawki do chwili, gdy przewidywany błąd czasu osiąga margines, z wyszczególnieniem każdego składnika i wskazaniem dominującego.

seg-60476d723e1a = <b>Ile czasu zostało teraz?</b> Ta sama wartość pomniejszona o czas, który upłynął od poprawki.

seg-84010982db35 = <b>Jak często zegar musi pobierać poprawkę?</b> Największy odstęp między poprawkami, który utrzymuje błąd w granicach marginesu, po odjęciu opóźnienia, zanim poprawka zacznie działać.

seg-3388d46925f1 = Opcjonalna sekcja <c1/> dodaje poziom ochrony czasu (TPL) dla odbiornika na orbicie; zob. <a1>Spoofing odbiornika na orbicie</a1>.

seg-2eb266d992b0 = Uruchom dołączony przykład poleceniem <c1/>.

seg-624e7a70c4f6 = Skróty: GNSS, globalny system nawigacji satelitarnej; TCXO, kwarcowy oscylator z kompensacją temperaturową; OCXO, kwarcowy oscylator termostatowany; RAFS, rubidowy wzorzec częstotliwości atomowej; CSAC, zegar atomowy w skali układu scalonego; USO, oscylator ultrastabilny; DSAC, zegar atomowy dla przestrzeni kosmicznej; ADEV, odchylenie Allana; FM, modulacja częstotliwości (tu: szum częstotliwości zegara); PM, modulacja fazy (szum jego fazy); IEEE, Institute of Electrical and Electronics Engineers; ITU-T, Sektor Normalizacji Telekomunikacji Międzynarodowego Związku Telekomunikacyjnego; TIE, błąd interwału czasu; MTIE, maksymalny błąd interwału czasu; TDEV, odchylenie czasu; max|TE|, maksymalny bezwzględny błąd czasu; CUSUM, detektor zmiany oparty na sumie skumulowanej; TPL, poziom ochrony czasu; LEO, niska orbita okołoziemska; NIST SP, Special Publication Narodowego Instytutu Standardów i Technologii; UFFC, Ultrasonics, Ferroelectrics, and Frequency Control (czasopismo IEEE Transactions); IGS, Międzynarodowa Służba GNSS; GPS, Global Positioning System; Block IIF, satelity GPS Block II Follow-on; SHA-256, 256-bitowy bezpieczny algorytm skrótu; PPS, impuls na sekundę.

seg-f2a0c73ef648 = Model błędu

seg-6bc3f9e78346 = Przewidywany błąd czasu po swobodnym dryfie przez <c1/> sekund od poprawki wynosi

seg-3fbb186c716a = współczynnik pokrycia ({ "3" } to około { "99.7" } % błędu gaussowskiego)

seg-883965151598 = błąd czasu poprawki o jednym sigma

seg-b63c0447865f = błąd o jednym sigma częstotliwości znanej w chwili poprawki; częstotliwość oszacowana w oknie <c1/> obciążona jest błędem rzędu <c2/>

seg-ab28fc69d3ac = wariancja szumu fazy białego: drżenie błędu czasu, stała dolna granica

seg-8792541a7b6d = gęstości szumu FM białego, błądzenia losowego i biegu losowego (człony van Loana z <c1/>)

seg-5d36b32c4de8 = dolna granica szumu FM migotania w wariancji Allana

seg-65da5a90685f = resztkowe względne przesunięcie częstotliwości pozostałe po poprawce

seg-816e427d51f9 = przesunięcie częstotliwości wynikające ze zmiany temperatury <c1/> przez współczynnik temperaturowy <c2/>

seg-e23d0ac960aa = liniowa szybkość starzenia

seg-43e5f75b369c = Każdy człon FM jest równy <c1/> dla swojego rodzaju szumu, przy <c2/> (Zucca i Tavella, IEEE Trans. UFFC { "52" }({ "2" }), { "2005" }). Dla FM białego, błądzenia losowego i biegu losowego ta zależność jest dokładna. Dla FM migotania jest to konwencjonalne oszacowanie błędu predykcji czasu (Riley, NIST SP { "1065" }): FM migotania nie ma postaci zamkniętej bez odcięcia niskich częstotliwości. Przesunięcia częstotliwości sumują się co do wartości bezwzględnej, ponieważ ich znaki są nieznane, więc część deterministyczna to przypadek najgorszy. Każdy człon jest nieujemny i niemalejący względem <c3/>, zatem <c4/> ma jeden pierwiastek, znajdowany przez obramowanie i bisekcję.

seg-f9038fba23e2 = Skąd pochodzi zegar

seg-5c44b2f8d015 = Klucz scenariusza

seg-cb92ae98c231 = Wartość domyślna klasy

seg-7594664253f2 = jedna przytoczona jednosekundowa ADEV i czerwonoszumowa dolna granica zsyntetyzowana dwie i cztery dekady poniżej niej

seg-794e4932b470 = MODELLED: odpowiedź dla stabilnego zegara wyznacza przyjęta dolna granica

seg-5ea820aaa69f = Ustawienie wstępne z karty katalogowej

seg-c943490619f3 = wstępne ustawienia synchronizacji telekomunikacyjnej (<c1/>, <c2/>, <c3/>, <c4/>), każde to nazwana karta katalogowa Microchip

seg-a20353d50011 = MODELLED: obwiednia maksimów z karty katalogowej

seg-b543f3dcd11a = Karta katalogowa podana w treści scenariusza

seg-4983ec096617 = własna tabela ADEV klienta, starzenie i współczynnik temperaturowy

seg-b079bca8a611 = MODELLED: obwiednia podanych maksimów

seg-119d94700cab = Zmierzony zapis

seg-ae6835f0c3c5 = zapis fazy; jego nakładająca się ADEV jest dopasowywana ważoną metodą najmniejszych kwadratów

seg-6e1c4702186d = inwersja jest VALIDATED na zatrzymanym, rzeczywistym zapisie (poniżej)

seg-f4cc2be238b7 = Trzy klasy dodane w { "0.28.0" } przytaczają po jednej publicznej karcie katalogowej:

seg-47f6ddc3bd02 = Jednosekundowa ADEV

seg-5dadad28711a = EndRun Technologies, <em>Disciplined Oscillator Options</em>, kolumna podstawowego TCXO

seg-becbff195fff = Karta katalogowa Microchip OX-208, Rev 12-1-2021

seg-19d8d32203f6 = Karta katalogowa Microchip 8040C Rubidium Frequency Standard, DS00003047A

seg-48babc170b93 = Wiersze EndRun dla długich czasów uśredniania zbiegają się w całej tej tabeli ({ "4e-13" } dla każdego oscylatora poza TCXO, { "8e-13" }, przy { "10 000" } s oraz { "6e-14" } dla wszystkich przy { "100 000" } s), co sugeruje, że opisują produkt z dyscyplinowaniem, a nie oscylator swobodnie pracujący, więc nie są używane.

seg-85c7211bb49b = <b>Dopasowanie do zapisu jest ważone.</b> Oszacowanie wariancji Allana z <c1/> równoważnymi stopniami swobody ma wariancję około <c2/>, więc każdy punkt wchodzi z resztą <c3/>. Dopasowanie nieważone pozwalało krótkim czasom uśredniania rozstrzygać o członach długich czasów uśredniania: na zapisie testowym z FM białym dało pozorną dolną granicę migotania, która skróciła przekroczenie po { "2 000" } s o { "30" } %. Karta katalogowa lub zapis wspiera wyłącznie czasy uśredniania do swojego najdłuższego punktu; przekroczenie poza nim jest oznaczane jako <c4/>.

seg-5b61a42c76c2 = Walidacja: inwersja na zatrzymanym, rzeczywistym zegarze

seg-2220a1490923 = <c1/> używa zapisu { "556" } 990 próbek wzorca cezowego 5071A mierzonego względem wodorowego masera (A. Wallin, rozpowszechniany z <c2/>; ten sam zapis, którego używa wyrocznia estymatora <c3/>). Przy maserze jako wzorcu zapis jest 6.4-dobowym swobodnym przebiegiem.

seg-9bae4571f67c = Dopasuj model szumu wyłącznie na <b>pierwszej trzeciej części</b> zapisu.

seg-15b2cb621db7 = Przewidź na podstawie tego modelu czas swobodnego dryfu, po którym błąd czasu o jednym sigma osiąga { "0.5" }, { "0.75" }, { "1" }, { "1.5" }, { "2" } i { "2.5" } ns.

seg-1bd9ac435bfa = Na <b>pozostałych dwóch trzecich</b> dryfuj swobodnie od punktu synchronizacji co { "997" } s, z częstotliwością oszacowaną z poprzedzającej trzeciej części, i zmierz, gdzie średniokwadratowy błąd dryfu osiąga każdy próg.

seg-d7640a2ec444 = Próg zaliczenia, ustalony przed pierwszym uruchomieniem testu, to każde przewidziane przekroczenie w granicach współczynnika { "1.5" } względem zmierzonego. Kontrola, czyli jednosekundowa ADEV odczytana jako FM biały, musi ten próg oblać, aby próg potrafił odróżnić dobry model od złego. Test drukuje swoją tabelę; mutacja, która o połowę zmniejsza poziom FM białego, go oblewa. Surowy zapis to ignorowane przez git dane osób trzecich: pobiera go <c1/>, a przepływ <c2/> uruchamia test z <c3/>, więc brakujący plik kończy się tam niepowodzeniem, a nie pominięciem.

seg-3d11f7c6d4ab = Co to potwierdza: ścieżkę dopasowania i inwersji, dla wzorca atomowego z przewagą FM białego, dla dryfów do około { "50 000" } s. Czego nie potwierdza: źródeł z kart katalogowych i klas, członów deterministycznych oraz oscylatora kwarcowego (następna sekcja).

seg-bfcc5555ed50 = Ta sama predykcja na rzeczywistym oscylatorze kwarcowym: zachowawcza, niepotwierdzona

seg-b77b3f503ca2 = <c1/> używa zmierzonego OCXO: { "19 982" } jednosekundowych odczytów częstotliwości oscylatora { "10" } MHz w analizatorze impedancji HP, względem wodorowego masera (A. Wallin, { "2015" }, rozpowszechniany z <c2/>; <c3/>). Model szumu i liniowy dryf dopasowuje się na pierwszej trzeciej części; każdy swobodny dryf na pozostałych dwóch trzecich zaczyna się od częstotliwości oszacowanej z poprzedzających { "100" } s, a model uwzględnia niepewność tego oszacowania (<c4/>, czyli odchylenie Allana samego modelu przy { "100" } s).

seg-e05821406c28 = Dopasowano na

seg-c70aadbd47d4 = Przekroczenie przewidziane ÷ zmierzone, od { "0.2" } do { "10" } ns

seg-d71582148b20 = Odczyt

seg-dcc3fd23bede = pierwsza trzecia część (zatrzymana)

seg-f9bb286f5868 = od { "0.59" } do { "0.70" }

seg-612784f70090 = zachowawczo: nigdy później niż zmierzone, przeważnie poza progiem { "1.5" }

seg-121fa832c30f = sam segment oceny (diagnostycznie)

seg-b4be9afa69ac = od { "0.98" } do { "1.17" }

seg-75e1515b970a = inwersja jest poprawna; różnica na zbiorze zatrzymanym wynika ze zmiany oscylatora

seg-c91da69e9c09 = Dolna granica szumu oscylatora zmniejszyła się o połowę w trakcie zapisu: odchylenie Allana pierwszej trzeciej części spłaszcza się w pobliżu { "7.5e-12" }, reszty w pobliżu { "3.5e-12" }. Model dopasowany wcześniej przeszacowuje szum, co jest kierunkiem bezpiecznym. <b>Przypadek kwarcowy nie jest zatem potwierdzony i pozostaje MODELLED.</b> Dla kwarcu należy dopasowywać model na ustabilizowanym zapisie i ponawiać dopasowanie w miarę starzenia się elementu.

seg-6230fed0e164 = <b>Jak wybrano protokół, co podajemy, ponieważ nie był ślepy.</b> Pierwszy przebieg eksploracyjny użył protokołu dla cezu (częstotliwość z poprzedzającej trzeciej części, bez członu częstotliwości) i przewidział przekroczenia od { "1.4" } do { "2.5" } razy późniejsze niż zmierzone: optymistycznie, w kierunku niebezpiecznym. Częstotliwość kwarcu wędruje, więc częstotliwość oszacowana na kilka godzin przed poprawką jest nieaktualna, a model nie miał członu opisującego, jak dobrze częstotliwość jest znana w chwili poprawki. Człon <c1/> dodano z tego powodu, a protokół ustalono przed napisaniem testu; próg zaliczenia nie został przesunięty. Test sprawdza też, że bez tego członu predykcja na próbie jest optymistyczna przy każdym progu, więc człon jest istotny.

seg-88e01cac525a = Ta sama predykcja na zegarach atomowych na orbicie: { "8" } z { "10" }, niepotwierdzona

seg-17962966b6d6 = <c1/> używa końcowych połączonych zegarów IGS co { "30" } s przez { "14" } dób (od { "17" } do { "30" } sierpnia { "2025" }; <c2/>, każdy plik przypięty przez SHA-256): zegar każdego satelity GPS Block IIF względem skali czasu IGS. Protokół (zbiór satelitów, reguła luk, okno dopasowania, synchronizacja co { "3 570" } s z częstotliwością z poprzedzającej godziny, progi od { "1" } do { "20" } ns, próg { "1.5" } oraz reguła, że klasa zalicza tylko wtedy, gdy zalicza każdy satelita) spisano przed pobraniem jakichkolwiek danych.

seg-1b5832633c87 = Przekroczenie przewidziane ÷ zmierzone

seg-4ae1789040de = G06, G08, G09, G10, G24, G26, G27, G32

seg-9a6fac366156 = od { "0.76" } do { "1.46" }

seg-c14941cb5537 = w granicach progu

seg-dbaaf875f1fb = od { "1.51" } do { "1.99" }

seg-3601e13c39b6 = optymistycznie

seg-ea41cf6dbec2 = od { "1.20" } do { "1.61" }

seg-099fb000bf57 = nie oceniano

seg-a7699b256ee1 = wykluczony regułą luk (brakująca doba)

seg-eb71202e0b91 = Osiem z dziesięciu to użyteczny dowód, ale dla dwóch satelitów przewiduje się dłuższe utrzymanie niż faktyczne, co jest kierunkiem niebezpiecznym, a protokół wymaga zaliczenia przez każdego satelitę. <b>Przypadek orbitalny pozostaje zatem MODELLED.</b> Satelity Block IIF niosą zarówno wzorce rubidowe, jak i cezowe, a pliki IGS nie podają, który jest aktywny, więc wynik dotyczy satelitów, a nie jednego rodzaju zegara. Dlaczego G25 i G30 się różnią, nie zbadano.

seg-a9be8a92b6b9 = Przebieg bench dla części reprezentatywnej dla lotu (zaplanowany, niewykonany)

seg-43597df55508 = Publiczny zapis OCXO ma { "5.5" } godziny, pochodzi z jednego przyrządu laboratoryjnego, a oscylator wciąż się stabilizował. Potwierdzić przypadek kwarcowy mógłby dłuższy, zmierzony swobodny przebieg OCXO reprezentatywnego dla lotu lub CSAC względem wzorca:

seg-e2698f00a84a = licznik interwałów czasu porównujący impuls { "1" } PPS oscylatora ze wzorcem dyscyplinowanym przez GNSS lub maserem, co najmniej { "10" } dób z jedną próbką na sekundę, z rejestracją temperatury;

seg-c4c902ac028e = ten sam protokół z zatrzymaniem: dopasowanie na pierwszej trzeciej części, przewidzenie przekroczeń, pomiar na reszcie, z tym samym progiem i kontrolą;

seg-0faaa6279195 = zapis i jego skrót opublikowane obok testu, aby wiersz był odtwarzalny.

seg-9b2255563582 = Zależy to od dostępu do sprzętu wzorcowego i nie jest obiecane.

seg-6cb2dc94d1bf = Względem jakiej miary wędrowania należy akceptować szczelinę?

seg-f6d24245dca6 = Normy czasu oferują trzy rodziny miar. Dla szczeliny indeksowanej czasem tylko jedna z nich mierzy to, co szczelinę psuje.

seg-496531d9db93 = <b>MTIE</b> (ITU-T G.810) to największy rozstęp TIE w dowolnym oknie danej długości. Nie widzi stałego przesunięcia: zegar przesunięty o { "1" } µs, ale idealnie stały, ma MTIE bliskie zeru i chybia każdą szczelinę. Mierzy, jak bardzo błąd się <em>zmienia</em>, a nie gdzie <em>jest</em>.

seg-5bdfc694a92a = <b>TDEV</b> (ITU-T G.810) jest zbudowane z drugich różnic uśrednionej fazy. Usuwa stałe przesunięcie i stały błąd częstotliwości, czyli dokładnie te człony, które dominują w swobodnym dryfie. Charakteryzuje rodzaj szumu; nie jest miarą akceptacji dla czasu bezwzględnego.

seg-1a9f01b0c786 = <b>max|TE|</b> (ITU-T G.8260; miara budżetowa w G.8271) to największy bezwzględny błąd czasu względem referencyjnej skali czasu. Porównuje się go bezpośrednio z marginesem.

seg-7eefc395a118 = <b>Wniosek.</b> Szczelinę należy akceptować względem max|TE| odniesionego do referencyjnej skali czasu sieci, wyznaczanego jako przewidywana obwiednia od ostatniej poprawki przy podanym współczynniku pokrycia. Tym właśnie jest <c1/>: ponieważ każdy człon rośnie z <c2/>, maksimum w trakcie swobodnego dryfu o długości <c3/> wynosi <c4/>. MTIE i TDEV pozostają użyteczne jako diagnostyka: TDEV do wskazania, który człon szumu zwalczać, MTIE(L) do ograniczenia, jak bardzo błąd przesuwa się w czasie szczeliny o długości <c5/>.

seg-51d4ee8484d7 = Dwa doprecyzowania wynikające z wyboru miary:

seg-a52524111ed7 = <b>Margines dotyczy błędu względnego między dwoma węzłami.</b> Jeśli nadajnik i odbiornik dryfują niezależnie, ich błędy stochastyczne sumują się kwadraturowo, a deterministyczne co do wartości bezwzględnej. Gdy dominuje część stochastyczna, każdemu węzłowi można przyznać <c1/>; gdy dominuje starzenie lub temperatura, <c2/>.

seg-073fe7cd8e63 = Współczynnik pokrycia jest wyborem projektowym, a nie właściwością zegara.

seg-eb1cbf9fda2d = <c1/> obejmuje około { "99.7" } % błędów gaussowskich w jednej chwili, a nie w każdej szczelinie w ciągu doby; plan routingu z wieloma szczelinami na dobę wymaga ryzyka na szczelinę, jakie jest w stanie znieść.

seg-04734b8a115b = Spoofing odbiornika na orbicie

seg-9e734bbda345 = Sekcja <c1/> ocenia <c2/> dla tego samego zegara:

seg-a2f21a643389 = <b>Geometria.</b> Naziemny spoofer dosięga satelity LEO tylko wtedy, gdy satelita jest nad jego horyzontem: na { "550" } km najwyżej około dwunastu minut na jedno przejście nad głową. Spoofer narastający z szybkością <c1/> może więc przesunąć zegar najwyżej o <c2/> razy to okno albo razy odstęp do następnej niezależnej kontroli, jeśli jest krótszy (<c3/>).

seg-ff59489b08b8 = <b>Dynamika.</b> Wspólne przesunięcie czasu przesuwa wszystkie pseudoodległości jednakowo i jest pochłaniane w błędzie zegara, a nie w pozycji, więc kontrola pozycji przez propagator orbity nie liczy się jako kontrola krzyżowa czasu.

seg-4302cc49b91f = <b>Kontrole krzyżowe.</b> Satelita rzadko ma drugi niezależny odbiornik czasu. Ma swobodny dryf własnego zegara (monitor z <c1/>), dwukierunkowy transfer czasu ze stacją naziemną podczas kontaktów oraz porównania czasu przez łącza międzysatelitarne. Łącze krzyżowe jest niezależne od jednego naziemnego spoofera tylko wtedy, gdy sąsiad w tej samej chwili znajduje się poza zasięgiem tego spoofera, co raport sprawdza na podstawie liczby satelitów na płaszczyznę.

seg-16c15664a51c = <b>Ograniczenie warunkowe.</b> Dolna granica monitora plus swobodny dryf zegara w czasie opóźnienia detekcji CUSUM, redukujące się dokładnie do <c1/>, gdy zegar nie ma członu migotania, szumu fazy białego ani biegu losowego. Jak tamto ograniczenie, obowiązuje tylko pod warunkiem detekcji.

seg-f7678693be22 = Całość jest MODELLED: sferyczna, nieobracająca się Ziemia, przejście nad głową, jeden naziemny spoofer z podaną maksymalną szybkością narastania. Kierunek przybycia sygnałów do anteny skierowanej w zenit jest rzeczywistą kontrolą krzyżową, która wymaga charakterystyki anteny i nie jest modelowana. <a1><c1/></a1> wyjaśnia, dlaczego podpisany komunikat sterujący nie usuwa tego zagrożenia.

seg-070a4e72b5ea = Skoki częstotliwości, efekty promieniowania i relatywistyczne przesunięcia częstotliwości; model termiczny (zmiana temperatury jest skokiem w chwili poprawki); sam protokół synchronizacji (poprawka resetuje błąd do <c1/>).

seg-a2766c0f19d0 = <s1>Poprzednia</s1>Łącza optyczne przez atmosferę

seg-85ad3eb72a80 = <s1>Następna</s1>Synchronizacja telekomunikacyjna
