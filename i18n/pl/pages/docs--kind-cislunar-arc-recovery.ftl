# docs--kind-cislunar-arc-recovery: translations (pl)

seg-debc2f07db78 = true

seg-330cbcd04718 = ułamek (bezwymiarowy)

seg-8f21a5462b09 = Źródło: <c1/>

seg-e4858b0a33c9 = <c1/> (rodzaj scenariusza)

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f994c81583bf = Test niezależnego estymatora MODELLED dla progu obserwowalności długości łuku cislunarnego. Ten próg jest odczytem RANGI macierzy obserwowalności zbudowanej z ANALITYCZNYCH wierszy jakobianu odległości i ANALITYCZNEJ wariacyjnej macierzy przejścia stanu, a jego kontrola krzyżowa filtrem w postaci pierwiastka informacji składa te same wiersze — jest to kontrola spójności między dwiema maszynami numerycznymi, a nie potwierdzenie. Ten rodzaj dostarcza brakującego arbitra: estymator wsadowy metodą najmniejszych kwadratów, który faktycznie ODZYSKUJE stan początkowy statku głównego z symulowanych pomiarów, z pochodnymi cząstkowymi pomiarów wziętymi jako RÓŻNICE SKOŃCZONE CENTRALNE złożonego modelu w przód. Nie wywołuje żadnego analitycznego wiersza jakobianu, żadnej wariacyjnej STM, żadnego rozkładu według wartości osobliwych ani własnych, żadnej tolerancji rangi i żadnego filtra w postaci pierwiastka informacji — strażnik tekstu źródłowego w tests/cislunar_arc_recovery_reference.rs sprawia, że można to wyegzekwować — podczas gdy dynamika (ten sam przepływ RK4 CR3BP), warunki początkowe (ta sama konstelacja skorygowana różniczkowo), skalarna wielkość obserwowana i siatka epok są celowo wspólne i nazwane w emitowanym bloku <c1/>, ponieważ dwie analizy jednego problemu fizycznego muszą zgadzać się co do fizyki, aby były porównywalne. Dwa kryteria, każde przeglądane w pięciu dekadach własnej granicy: ODZYSKANIE BEZ SZUMU (końcowy błąd stanu każdej próby z ziarnem co najwyżej recovery_factor razy jej przemieszczenie a priori — odpowiednik rangi, bez tolerancji wartości osobliwych) oraz OSZACOWYWALNOŚĆ MONTE CARLO (zmierzony błąd pozycji RMS dla zespołu szumu z ziarnem poniżej podanej granicy — odpowiednik oszacowywalności, zmierzony, a nie przewidziany). Obsługuje planarny stan czteroelementowy i przestrzenny sześcioelementowy, rodziny DRO / halo L2 / NRHO L2, obserwable odległości i prędkości zmiany odległości oraz parametryzację biegunową wokół Księżyca, w której transformację stosuje się do STANU, a model w przód jest tam różniczkowany ponownie. MEASURED na opublikowanej planarnej siatce DRO: estymator odzyskuje stan czteroelementowy od { "0.782609" } h wobec { "2.086957" } h według kryterium rangi przy rel_tol { "1e-6" } (stosunek { "0.375" }) — próg rangi NIE jest potwierdzony jako granica odzyskiwalności — podczas gdy zmierzona granica oszacowywalności trafia w tę samą komórkę siatki co formalna, { "5.739130" } h, a zmierzona krzywa błędu odtwarza formalne 1-sigma w { "21" } długościach łuku ze średnim geometrycznym stosunkiem { "0.98" }. MODELLED: projekt konstelacji, siatka epok, pojedyncze śledzone łącze, wielkość przemieszczenia, sigma pomiaru i dwie podane granice. To nie jest certyfikowany produkt do oceny osiągów nawigacyjnych.

seg-ada71f37b21b = Jeden przebieg <c1/> podsumowuje się tak: cislunar-arc-recovery | rodzina dro, 4 stany, { "4" } s/c, obserwabla odległości, parametryzacja kartezjańska | łuk { "6.0" } h, { "24" } epok (siatka { "0.260870" } h), { "32" } prób, ziarno { "20260920" } | pochodne cząstkowe różnicami skończonymi, bez analitycznego jakobianu / STM / SVD / SRIF | odzyskanie bez szumu od { "0.782609" } h (współczynnik { "1e-2" }) wobec progu rangi Grama { "2.086957" } h | oszacowywalność Monte Carlo od { "5.739130" } h (RMS pozycji ≤ { "1.000" } km, σ { "1.000" } m) wobec oszacowywalności Grama { "5.739130" } h | RMS pozycji na końcu łuku { "0.6026" } km

seg-3d4a2773c32f = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Przykład <c1/> ustawia m.in.:

seg-6d584e86deba = stosunek (bezwymiarowy)

seg-f7f4d06e661f = cislunar-observability na identycznej

seg-a6cb7ed2ff6d = Etykieta wyniku (silnika): test odzyskiwania długości łuku cislunarnego MODELLED (potwierdzenie progu obserwowalności P6 niezależnym estymatorem). Rdzeń VALIDATED: estymatorem jest istniejący już w crate ważony korektor wsadowy Gaussa-Newtona (crate::batch_ls), którego macierz projektowa jest RÓŻNICĄ SKOŃCZONĄ CENTRALNĄ złożonego mo

seg-2fe411ae2153 = Wykres zapisywany przez silnik dla scenarios/cislunar-arc-recovery.toml, rodzaj cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> Estymator wsadowy metodą najmniejszych kwadratów, który ODZYSKUJE stan początkowy statku głównego z symulowanych pomiarów międzysatelitarnych na rosnących prefiksach tej samej siatki epok, której używa tabela ranga-względem-łuku, z pochodnymi cząstkowymi pomiarów wziętymi jako centralne skończone Testy: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> Estymator wsadowy metodą najmniejszych kwadratów, który ODZYSKUJE stan początkowy statku głównego z symulowanych pomiarów międzysatelitarnych na rosnących prefiksach tej samej siatki epok. Wyrocznia (ReferenceImpl): Osobny estymator w tej bazie kodu, oparty na innym algorytmie i rozłącznej ścieżce kodu: nieliniowy ważony Gauss-Newton z pochodnymi cząstkowymi różnicami skończonymi, a jego werdykt jest odczytywany jako zmierzony błąd odzyskania stanu w km i mm/s. Nie ma żadnego wspólnego wyrażenia z drogą rangi i kowariancji macierzy Grama, a rozdzielność jest WYMUSZANA przez strażnika tekstu źródłowego, a nie tylko deklarowana. MEASURED na opublikowanej planarnej siatce DRO: th

seg-7be582874f98 = Test odzyskiwania długości łuku cislunarnego MODELLED (potwierdzenie progu obserwowalności P6 niezależnym estymatorem). Rdzeń VALIDATED: estymatorem jest istniejący już w crate ważony korektor wsadowy Gaussa-Newtona (crate::batch_ls), którego macierz projektowa jest RÓŻNICĄ SKOŃCZONĄ CENTRALNĄ złożonego modelu w przód - nie wywołuje żadnego analitycznego wiersza jakobianu pomiaru, żadnej wariacyjnej macierzy przejścia stanu, żadnego rozkładu według wartości osobliwych (wynik <c1/>)

seg-52fe686b1fdf = Test niezależnego estymatora MODELLED dla progu obserwowalności długości łuku cislunarnego. (katalog rodzajów (<c1/>))

seg-48e6e57a0b40 = MODELLED: projekt konstelacji, siatka epok, pojedyncze śledzone łącze, wielkość przemieszczenia, sigma pomiaru i dwie podane granice. (katalog rodzajów (<c1/>))

seg-75f275dcb2d2 = MODELLED: projekt konstelacji, siatka epok, pojedyncze śledzone łącze, wielkość przemieszczenia, sigma pomiaru i dwie podane granice. To nie jest certyfikowany produkt do oceny osiągów nawigacyjnych. (komentarz w pliku scenariusza, wiersze { "33" } do { "35" })

seg-ea82d9fd6506 = Potwierdzenie progu długości łuku cislunarnego niezależnym estymatorem jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem osobnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie autorytatywnej zewnętrznie. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-53d57e6dafa6 = <s1>Poprzedni</s1>campaign

seg-fe3ecf4b55fe = <s1>Następny</s1>cislunar-observability
