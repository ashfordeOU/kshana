# docs--reports: translations (pl)

seg-3ea93ae372ca = Co zawiera

seg-245adc6e6766 = <s1>Poprzedni</s1>Kampanie

seg-aa5482ac34ff = Ograniczenia, podane wprost

seg-b0dcf3142564 = Źródło: <c1/>

seg-4c412bb0ce63 = Każdy przebieg interfejsu wiersza poleceń (CLI) zapisuje obok wyniku raport: drukowalną stronę HyperText Markup Language (HTML), <c1/>, oraz czytelny maszynowo dokument JavaScript Object Notation (JSON), <c2/>, o tej samej treści. Raport działa dla każdego rodzaju scenariusza i dla kampanii.

seg-e26b1a83a86d = Dokument wynikowy odpowiada na pytanie, <em>co obliczył silnik</em>. Raport dodaje to, czego czytelnik potrzebuje, zanim na tej podstawie zadziała: co wprowadzono, na czym opierają się liczby, co pominięto i jak uzyskać te same bajty ponownie. Niczego z tego nie wymyśla. Każda sekcja jest odczytywana ze źródła, które silnik już przechowuje, i podaje to źródło obok cytowanej treści.

seg-bf0456f18e4f = Konstruktorem jest <c1/> (<c2/>). Jest to czysta funkcja wyniku przebiegu, bajtów pliku scenariusza i wiersza poleceń: nie odczytuje zegara, pliku ani sieci i buduje się dla WebAssembly.

seg-bed0af192da5 = Sekcje

seg-fca842769048 = Sekcja

seg-2654051d8292 = Odczytywane z

seg-5790851a4a5f = Podsumowanie wykonawcze

seg-3d34b2ef5988 = co robi ten rodzaj, jednowierszowe podsumowanie przebiegu, główne wartości, etykieta rzetelności na poziomie przebiegu, liczba użytych możliwości VALIDATED / MODELLED / PARTNER

seg-923111083001 = katalog rodzajów (<c1/>), pole <c2/> wyniku, jego blok <c3/> lub blok wskaźników jakości, percentyle kampanii Monte Carlo

seg-e1ce0e8d5c61 = każde pole ustawiane przez plik scenariusza, spłaszczone do swojej ścieżki, z jednostką i informacją, skąd pochodzi jednostka

seg-fbd2e96c92c7 = plik scenariusza; jednostki z bloku <c1/> wyniku (schemat jednostek pól, <c2/>), a w przeciwnym razie z przyrostka nazwy pola (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>, …); jednostka, której nie podaje ani jedno, ani drugie, jest wypisywana jako <b>niepodana</b>

seg-88ccaef6fc49 = wykres przebiegu, każda wartość skalarna dokumentu wynikowego z jednostką oraz podsumowanie liczności / minimum / maksimum / pierwszej / ostatniej wartości każdej kolumny liczbowej

seg-42a82485f8c8 = dokument wynikowy i jego blok <c1/>

seg-f554fbcdd85c = Agregacja (kampanie i przeglądy)

seg-7c0466805f54 = tabela węzłów przeglądu; średnia, odchylenie standardowe, percentyle 5. / 50. / 95. oraz { "95" }% przedział ufności dla średniej w przebiegu Monte Carlo, z histogramem dla każdej metryki; tabela faz łańcucha; wspólne warunki, członkowie i połączone podsumowanie kompozycji

seg-7b5f5b635905 = sekcja <c1/>, <c2/>, <c3/> lub <c4/> wyniku kampanii; siatka wyniku <c5/> lub <c6/>

seg-3bf44008fc65 = Animacja i eksporty

seg-64d1073dfadc = animowany rysunek przebiegu (wyjście <c1/>) osadzony jako obraz nieaktywny albo powód jego braku; odnośniki do plików animacji i interoperacyjności zapisanych przez to samo polecenie obok raportu; każdy format eksportu z informacją, czy ma zastosowanie do scenariusza, dlaczego nie i jaka jest jego specyfikacja

seg-ad7792e04197 = eksporter animacji (<c1/>), <c2/> i pliki zapisane przez wiersz poleceń (<c3/>, <c4/>)

seg-3d3781a3691b = Oś czasu zdarzeń

seg-f29f1b90edbd = okna czasowe i zdarzenia punktowe, narysowane i zestawione w tabeli na osi czasu przebiegu

seg-4271c092fa45 = tabele scenariusza z <c1/>/<c2/>, <c3/>/<c4/>, <c5/>/<c6/> lub czasem początku; zakres przebiegu <c7/>; każda tablica <c8/> w wyniku; fazy i przekazania kampanii

seg-00bee96167aa = Etykiety weryfikacji

seg-6dea392111a6 = każdy wiersz macierzy weryfikacji, który wykorzystują rodzaje użyte w przebiegu, z jego etykietą, wyrocznią i dowodem z testów, oraz poziomy poszczególnych wartości podane przez wynik

seg-ca56309b9693 = macierz weryfikacji (<c1/>, <c2/>), przez powiązanie rodzajów z wierszami <c3/>

seg-c19ae28a2355 = Niemodelowane i założenia

seg-aff7a016c7e2 = każde ograniczenie, w cytacie

seg-9be853632d3a = bloki <c1/>, <c2/> i <c3/> wyniku; klauzule MODELLED z katalogu rodzajów; komentarze scenariusza i tekst wejściowy, które mówią „not modelled”; powód, dla którego każdy wiersz MODELLED w macierzy pozostaje modelowany (<c4/>)

seg-a3ee5ba71183 = Zapis odtwarzalności

seg-a9746c2f1881 = wersja silnika, commit źródłowy, 256-bitowe skróty Secure Hash Algorithm (SHA-256) pliku scenariusza i dokumentu wynikowego, ziarno, platforma, dokładne polecenie, reguła katalogu roboczego, skrót każdego dalszego pliku wejściowego

seg-ec1f62f6bbd1 = kompilacja, pliki, wiersz poleceń

seg-ea460048debd = Sekcja, w której nie ma nic do wymienienia, mówi dlaczego, jednym zdaniem (na przykład „No timed event: the scenario scripts no window or onset time and the result reports no event”). Żadna sekcja nigdy nie jest pusta i milcząca.

seg-b99234469953 = Co oznacza etykieta w raporcie

seg-f9060b1e8077 = Etykieta weryfikacji ocenia <b>możliwość</b> nazwaną w wierszu macierzy, tak jak zapisuje ją macierz. Nie ocenia konfiguracji scenariusza, a wiersz VALIDATED nie sprawia, że dane wejściowe przebiegu są zmierzone. Wiersz PARTNER to dyscyplina, na której przebieg polega, a której { -brand } nie zapewnia (sprzęt antenowy dla rodzajów radiowych, ładunek kwantowy dla rodzajów kwantowych, magistrala statku kosmicznego dla budżetu orientacji); raport pokazuje ją jako <em>wymaganą, lecz niezapewnianą</em>.

seg-da422ae044d2 = Powiązanie rodzajów z wierszami jest tabelą ciągów <c1/> macierzy. Etykieta, wyrocznia i dowód są odczytywane z macierzy w chwili budowania raportu, więc przeniesienie wiersza między VALIDATED a MODELLED przenosi razem z nim każdy raport. Kampania niesie wiersz swojego trybu (łańcuch, przegląd lub Monte Carlo, kompozycja) oraz każdy wiersz każdego uruchomionego rodzaju składowego; <c2/> niesie wiersze rodzaju, który przeglądał. Każdy przebieg niesie też wiersz „Reproducibility & software assurance”, na którym opiera się zapis odtwarzalności.

seg-f38434695c28 = Wiersz oceniający tylko jedną ścieżkę wejściową rodzaju jest wymieniany tylko wtedy, gdy przebieg poszedł tą ścieżką (<c1/>): <c2/> i <c3/> niosą wiersz „Orbit propagation & determination” tylko z blokiem <c4/> (ścieżka Simplified General Perturbations { "4" } (SGP4); orbita analityczna to propagacja dwóch ciał), a <c5/> niesie wiersz zapisu pomiarowego tylko z <c6/>. Ta sama tabela bramkuje wiersz wielopasmowy <c7/> według tego, czy przebieg rysuje <c8/>, oraz wiersze rodzajów niskiej orbity okołoziemskiej (LEO) według ścieżki, którą poszedł każdy przebieg: wiersz deszczu, wejścia do budynku, niskiej energii lub spoofera dla <c9/> albo <c10/> tylko wtedy, gdy scenariusz ustawia ten człon, wiersz scyntylacji, chyba że scenariusz go wyłącza, wiersz <c11/>, <c12/> lub łańcuchowego precyzyjnego pozycjonowania punktowego tylko dla analizy lub trybu, który niesie wynik, oraz wiersz gotowej konfiguracji systemu LEO tylko wtedy, gdy użyto nazwanej konfiguracji. Wiersz czytnika Shuttle Radar Topography Mission (SRTM) nie jest niesiony przez żaden rodzaj: <c13/> i <c14/> działają na syntetycznym cyfrowym modelu wysokościowym terenu (DEM), a żadne pole scenariusza nie odczytuje kafla SRTM. Wiersz VALIDATED, którego przebieg nigdy nie dotknął, rościłby sobie w przeciwnym razie dowody, których przebieg nie ma.

seg-29efeadac5c7 = Odtworzenie przebiegu z jego raportu

seg-e859939f0f42 = <c1/> → <c2/> zawiera wszystko, co jest potrzebne:

seg-d65ad1b942e3 = Należy sprawdzić plik scenariusza względem <c1/> oraz każdy plik w <c2/> (plik orientacji Ziemi <c3/>) względem jego skrótu.

seg-5b3c59266451 = Należy uruchomić <c1/> z katalogu, w którym rozpoczęto pierwotny przebieg. Ścieżka scenariusza i każda względna ścieżka danych wewnątrz scenariusza są rozwiązywane względem niego.

seg-9f38218af0f0 = Nowy <c1/> ma SHA-256 z <c2/>, a nowe <c3/> i <c4/> są identyczne co do bajta ze starymi.

seg-a04db3e1c7f5 = <c1/> robi dokładnie to dla scenariusza zegara, kampanii łańcuchowej, kampanii przeglądu i przebiegu orbity z plikiem <c2/>: odczytuje polecenie z raportu, uruchamia je w nowym katalogu zawierającym tylko zapisane wejścia i porównuje bajty.

seg-1e2e9158544d = <c1/> to skrót dokładnych bajtów pliku. Własne <c2/> wyniku jest czymś innym, odciskiem scenariusza ustalanym przez rodzaj (często z postaci kanonicznej), a raport wypisuje oba z etykietami.

seg-3d72d2059a6c = <b>Ziarno.</b> Ziarnem jest <c1/> scenariusza, a w przeciwnym razie to, które podaje wynik. Dla rodzaju, który nie przyjmuje ziarna, raport mówi o tym oraz że wynik ustalają wyłącznie plik scenariusza i kompilacja silnika.

seg-50457327734e = <b>Commit źródłowy.</b> Silnik zapisuje commit tylko wtedy, gdy został zbudowany z ustawioną zmienną środowiskową <c1/>, odczytywaną w czasie kompilacji:

seg-3c7ed74729d3 = Kompilacja bez niej podaje commit jako niezapisany, a wersja silnika identyfikuje wydanie. Nic nie jest zgadywane.

seg-86ff67531a0e = <b>Platforma.</b> System operacyjny, architektura i rodzina kompilacji. Wyniki są identyczne co do bajta na jednej platformie; między platformami wyniki zmiennoprzecinkowe mogą się różnić na ostatnich cyfrach (zob. <a1>REPRODUCIBILITY.md</a1>).

seg-eeb07da80914 = Determinizm i jeden znacznik czasu

seg-995ad516f5ae = Te same bajty scenariusza, to samo ziarno i ta sama kompilacja silnika dają identyczne co do bajta <c1/> i <c2/>. Raport nie zawiera znacznika czasu. Jedyny odczyt zegara w całym pakiecie robi <c3/>, który wstawia <c4/> do dokumentu wynikowego; raport pokazuje wtedy ten znacznik i mówi, że jest to jedyne pole, którego odtworzenie nie powtórzy. Aby tego uniknąć, należy uruchomić bez <c5/>. <c6/> buduje raport każdego pliku scenariusza w <c7/> (poza manifestem zestawu) dwukrotnie i ponownie uruchamia sześć scenariuszy (wśród nich po jednej kampanii w trybie łańcucha, przeglądu i kompozycji), aby sprawdzić to od końca do końca.

seg-8a3fc60a5b54 = Drukowanie do PDF

seg-201bcec2caa3 = Silnik nie zapisuje plików Portable Document Format (PDF). Zapisywanie PDF z renderowanymi wykresami oznaczałoby nową, ciężką zależność, więc nie ma opcji <c1/>. Zamiast tego <c2/> zawiera arkusz stylów do druku: należy otworzyć go w przeglądarce, wydrukować i wybrać „Zapisz jako PDF”.

seg-13f1f294ede1 = Arkusz stylów jest napisany zarówno dla A4, jak i US Letter. Nie ustawia rozmiaru papieru (obowiązuje wybór z okna druku), zachowuje marginesy { "15" } mm / { "14" } mm pasujące do obu arkuszy, przełącza na czerń na bieli, powtarza nagłówki tabel na każdej stronie, nie dzieli wierszy tabel, rysunków i kart między strony, trzyma nagłówki z tekstem, który po nich następuje, i zaczyna sekcje wejść, wyników, etykiet weryfikacji i odtwarzalności od nowej strony. Pasek nawigacji jest ukryty w druku.

seg-a25bb320665d = Dokument JSON

seg-9d9af39942a7 = <c1/> ma <c2/> i <c3/>, następnie <c4/> i <c5/> oraz po jednym kluczu na sekcję: <c6/>, <c7/>, <c8/>, <c9/> (tylko kampanie i przeglądy), <c10/>, <c11/>, <c12/>, <c13/> (sekcja 3b: <c14/>, <c15/> i <c16/>) oraz <c17/>. Sekcja listowa ma <c18/>, <c19/> (wiersze, które pominął limit strony; dokument wynikowy zawiera każdą wartość) i, gdy <c20/> jest puste, <c21/> mówiące dlaczego. Wartość zachowuje swoją surową postać JSON w <c22/>, a tekst pokazywany na stronie w <c23/>; brakująca wartość to <c24/> w <c25/> i „no value” w <c26/>.

seg-06cc70ca3601 = <b>Jednostki.</b> Gdy ani schemat jednostek pól, ani nazwa pola nie podaje jednostki, raport mówi „not stated” zamiast zgadywać. Wejścia zagnieżdżone w scenariuszach składowych kampanii są rozwiązywane wyłącznie względem własnego bloku jednostek kampanii i przyrostka nazwy pola, więc więcej z nich odczytuje się jako „not stated” niż w przebiegu samodzielnym.

seg-023d5a1fbffc = <b>Ocena powiązania.</b> To, które wiersze macierzy wykorzystuje dany rodzaj, jest kuratorowaną tabelą, sprawdzaną testem pod kątem tego, że każdy wpis wskazuje dokładnie jeden istniejący wiersz i że pokryty jest każdy wbudowany rodzaj. To, czy każde odwzorowanie jest właściwe, jest oceną człowieka, tak jak sam wybór wyroczni w macierzy.

seg-0a7465f4c29a = <b>Limity.</b> Strona wymienia co najwyżej { "400" } wejść, { "150" } wyników skalarnych, { "60" } kolumn liczbowych i { "200" } zdarzeń; <c1/> zlicza resztę. Tabela z więcej niż { "24" } wierszami wewnątrz scenariusza (wczytany szereg) jest podsumowywana dla każdej kolumny.

seg-1fa26ed86bb8 = <c1/> zachowuje własne <c2/> i <c3/>; nie zapisuje tego raportu.

seg-1ccdffd389fb = <b>Powiązania.</b> Powiązania Pythona i WebAssembly zachowują <c1/>, jednostronicową kartę wyników; pobieralny raport placu zabaw to jego własna strona (<c2/>). Ten raport jest zapisywany przez CLI, a wywołujący z Rusta mogą go zbudować za pomocą <c3/>. Serwer Model Context Protocol (MCP) zwraca go ze swojego narzędzia <c4/>, jako JSON albo stronę HTML; nazwa pliku scenariusza w jego poleceniu odtworzenia to ta, którą poda wywołujący (domyślnie <c5/>), i nie wymienia on żadnego pliku towarzyszącego, ponieważ serwer żadnego nie zapisuje.

seg-c8ab7b4605cf = <s1>Następna</s1>Eksport animacji
