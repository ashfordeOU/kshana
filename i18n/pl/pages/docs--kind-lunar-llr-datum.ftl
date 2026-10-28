# docs--kind-lunar-llr-datum: translations (pl)

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-3bc1761c76ab = Tego rodzaju używają { "3" } dołączone scenariusze; pozostałe są w <a1><c1/></a1>.

seg-8f8871ac8a0f = Strona tematu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-fd34d760edb1 = <b>VALIDATED</b> Kowariancja siedmioparametrowego układu odniesienia Helmerta, w której dwa symulowane dane wejściowe zastąpiono zmierzonymi: harmonogram to epoki nadawania z Ziemi { "337" } zarchiwizowanych punktów normalnych księżycowego laserowego wyznaczania odległości ILRS (2015-04-08 do 2015-06-27, Grasse MeO { "7" } Testy: <a1>lunar_llr_real_data.rs</a1>.

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-8db575fc6d82 = Źródło: <c1/>

seg-5329c6c75887 = <c1/> (rodzaj scenariusza)

seg-25455a33523c = Siedmioparametrowy księżycowy układ odniesienia Helmerta wynikający z RZECZYWISTEJ, ZARCHIWIZOWANEJ kampanii obserwacyjnej, a nie symulowanej. Tam, gdzie lunar-frame-campaign usunął wprowadzoną transformację, ale nadal podawał sieć stacji, harmonogram i sigma na obserwację jako dane wejściowe ILLUSTRATIVE, ten rodzaj bierze wszystkie trzy z pomiaru: epoki to czasy nadawania z Ziemi zarchiwizowanych punktów normalnych ILRS Consolidated Laser Ranging Data, obserwacje to odległości laserowe naprawdę wystrzelone do pięciu macierzy reflektorów na Księżycu, a każda waga obserwacji to własna zarchiwizowana precyzja tego punktu normalnego bin_rms/sqrt(n_raw) odczytana z pliku. Współrzędne stacji pochodzą z rozwiązania SLR IERS ITRF2020 (przeniesione na epokę ich opublikowanymi prędkościami), a współrzędne reflektorów z JPL DE430 Table { "7" } w układzie średniej Ziemi/średniego obrotu, który realizuje model IAU { "2015" } WGCCRE. Pochodne cząstkowe odległości sumują się do wspólnej macierzy informacyjnej Fishera współrzędnych reflektorów i propagują przez ten sam projekt Helmerta do kowariancji układu odniesienia, diagnozowanej przez crate::fim::crlb. Rząd, defekt, uwarunkowanie, widmo, nieobserwowalne kierunki w bazie siedmiu parametrów, najsłabszy kierunek przy pełnym rzędzie i udział każdego parametru w nim są podawane w każdym przebiegu, a parametr nieograniczony jest publikowany jako NULL ze statusem. Korelacja między macierzami jest MEASURED dokładnie na zero, a nie zakładana, ponieważ odległość laserowa dotyczy jednej macierzy. Rekord, którego katalogi nie potrafią umiejscowić — stacja bez opublikowanej pozycji ITRF — jest POMIJANY I LICZONY, nigdy z podstawioną współrzędną. KTÓRE ŁĄCZA SĄ MEASURED, A KTÓRE MODELLED, TO JEST RAPORT, A NIE PRZYPIS: efemerydy środka Księżyca i orientacja ciała IAU pozostają modelowane, a ich łączna wielkość jest podawana jako jednostronna reszta odległości obserwowana-minus-obliczona po wszystkich użytych punktach; troposfera, pływy ciała stałego, mimośrodowość stacji, ruch bieguna, UT1-UTC, opóźnienie relatywistyczne i zegary stacji są nieobecne i zawarte w tej reszcie. Ponieważ błąd efemerydy dociera do kowariancji tylko przez kierunek każdej linii widzenia, każdy przebieg również rozwiązuje cały układ odniesienia na nowo ze wszystkimi pochodnymi cząstkowymi odchylonymi o sensitivity_tilt_deg (ze zmiennym znakiem) i podaje stosunek, więc niewrażliwość kowariancji na modelowane efemerydy jest liczbą, a nie argumentem. Własne wartości symulowanej kampanii są URUCHAMIANE i drukowane obok zmierzonych, a nie przepisywane. MODELLED: wartości siedmiu parametrów to granica Craméra-Rao dla zredukowanego zbioru parametrów na rzeczywistym harmonogramie — nie rozwiązany układ odniesienia, nie analiza LLR i nie produkt geodezyjny. Zatwierdzony wycinek danych rzeczywistych jest dostarczany z repozytorium, ale nie z opublikowanym crate; wskaż data_dir na jego kopię.

seg-f4359803d67a = Jeden przebieg <c1/> podsumowuje się tak: lunar-llr-datum: { "337" } zarchiwizowanych punktów normalnych ({ "349" } przeanalizowanych) z { "2" } stacji do { "5" } macierzy reflektorów w ciągu { "80.9" } d; mediana zmierzonej precyzji punktu normalnego { "5.13" } mm jednostronnie; rząd informacji reflektorów 15/15; rząd Helmerta 7/7 cond { "2.399e4" }; sigma translacji układu { "1.851746e-2" } m; RMS jednostronnej reszty obserwowana-minus-obliczona { "156493.9" } m (łącza modelowane, głównie analityczne efemerydy księżycowe)

seg-7eda56c1285a = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-c95b4d285cbd = Przykład <c1/> ustawia między innymi:

seg-37a77f49f048 = ps

seg-b5c1e8681164 = Etykieta wyniku (silnika): księżycowy układ odniesienia z RZECZYWISTEJ kampanii obserwacyjnej. Harmonogram, liczba obserwacji i każda waga obserwacji pochodzą ze zarchiwizowanych punktów normalnych księżycowego laserowego wyznaczania odległości ILRS (zmierzone); współrzędne stacji pochodzą z IERS ITRF2020, a współrzędne retroreflektorów z JPL DE430 Table { "7" } (publishe

seg-e4da113cbe18 = Wykres, który silnik zapisuje dla scenarios/lunar-llr-datum.toml, rodzaj lunar-llr-datum

seg-764e54be97a0 = <b>VALIDATED</b> Kowariancja siedmioparametrowego układu odniesienia Helmerta lunar-llr-datum ze zarchiwizowanych punktów normalnych ILRS i ich zmierzonych wag, na ścieżce jądra: geocentryczny środek Księżyca jest odczytywany z JPL DE440 przez własny czytnik jąder silnika (planetary_ker Testy: <a1>validate_llr_datum_kernel_moon.rs</a1>.

seg-cae262db0e46 = <b>VALIDATED</b> Kowariancja siedmioparametrowego układu odniesienia Helmerta, w której dwa symulowane dane wejściowe zastąpiono zmierzonymi: harmonogram to epoki nadawania z Ziemi { "337" } archiwum. Wyrocznia (ExternalDataset): tożsamości w postaci zamkniętej, niezależna droga w repozytorium oraz, od { "0.36" }, niezależna wyrocznia w postaci bibliotek SPICE i NumPy na nowych danych pomiarowych (poniżej); nie istnieje opublikowana para kowariancji układu odniesienia LLR do sprawdzenia, więc nie deklaruje się żadnej dokładności. Jedyna nowa pochodna — pochodna cząstkowa odległości względem położenia reflektora w układzie związanym z ciałem — jest wyprowadzana na nowo przez centralną różnicę skończoną dwudrogowego czasu przelotu światła, którą różnicuje

seg-61ac3609406a = Księżycowy układ odniesienia z RZECZYWISTEJ kampanii obserwacyjnej. Harmonogram, liczba obserwacji i każda waga obserwacji pochodzą ze zarchiwizowanych punktów normalnych księżycowego laserowego wyznaczania odległości ILRS (zmierzone); współrzędne stacji pochodzą z IERS ITRF2020, a współrzędne retroreflektorów z JPL DE430 Table { "7" } (opublikowane). Efemerydy środka Księżyca, orientacja ciała IAU { "2015" } WGCCRE oraz brak troposfery, pływów, mimośrodowości stacji (wynik <c1/>)

seg-97610a2cca73 = Korelacja między macierzami jest MEASURED dokładnie na zero, a nie zakładana, ponieważ odległość laserowa dotyczy jednej macierzy. (katalog rodzajów (<c1/>))

seg-64b1c08eeb11 = KTÓRE ŁĄCZA SĄ MEASURED, A KTÓRE MODELLED, TO JEST RAPORT, A NIE PRZYPIS: efemerydy środka Księżyca i orientacja ciała IAU pozostają modelowane, a ich łączna wielkość jest podawana jako jednostronna reszta odległości obserwowana-minus-obliczona po wszystkich użytych punktach; troposfera, pływy ciała stałego, mimośrodowość stacji, ruch bieguna, UT1-UTC, opóźnienie relatywistyczne i zegary stacji są nieobecne i zawarte w tej reszcie. (katalog rodzajów (<c1/>))

seg-d38710f3ce4a = MODELLED: wartości siedmiu parametrów to granica Craméra-Rao dla zredukowanego zbioru parametrów na rzeczywistym harmonogramie — nie rozwiązany układ odniesienia, nie analiza LLR i nie produkt geodezyjny. (katalog rodzajów (<c1/>))

seg-a19e2b1fcaf1 = epoki to czasy nadawania z Ziemi zarchiwizowanych punktów normalnych ILRS Consolidated Laser Ranging Data; * obserwacje to odległości laserowe naprawdę wystrzelone do pięciu macierzy retroreflektorów na Księżycu; * każda waga obserwacji to WŁASNA zarchiwizowana precyzja tego punktu normalnego, bin_rms/sqrt(n_raw), odczytana z pliku, a nie zakładana. (komentarz w pliku scenariusza, wiersze { "7" } do { "12" })

seg-5ed6b83c01da = KTÓRE ŁĄCZA SĄ MEASURED, A KTÓRE MODELLED, TO JEST RAPORT, A NIE PRZYPIS. Efemerydy środka Księżyca i orientacja ciała IAU pozostają modelowane, a ich łączna wielkość jest podawana jako jednostronna reszta odległości obserwowana-minus-obliczona po wszystkich użytych punktach; troposfera, pływy ciała stałego, mimośrodowość stacji, ruch bieguna, UT1-UTC, opóźnienie relatywistyczne i zegary stacji są nieobecne i leżą wewnątrz tej reszty. Pon (komentarz w pliku scenariusza, wiersze { "18" } do { "26" })

seg-7e7ff3ce4971 = Korelacja między macierzami jest MEASURED dokładnie na zero, a nie zakładana, ponieważ odległość laserowa dotyczy jednej macierzy. Rekord, którego katalogi nie potrafią umiejscowić — stacja bez opublikowanej pozycji ITRF — jest POMIJANY I LICZONY, nigdy z podstawioną współrzędną. Własne wartości symulowanej kampanii są URUCHAMIANE i drukowane obok zmierzonych. (komentarz w pliku scenariusza, wiersze { "28" } do { "31" })

seg-8bfe258bedf5 = MODELLED: wartości siedmiu parametrów to granica Craméra-Rao dla zredukowanego zbioru parametrów na rzeczywistym harmonogramie. Nie rozwiązany układ odniesienia, nie analiza LLR, nie produkt geodezyjny. (komentarz w pliku scenariusza, wiersze { "33" } do { "34" })

seg-598a7d6ba1e7 = <s1>Poprzedni</s1>lunar-joint-od-clock

seg-54b1c9200aae = <s1>Następny</s1>lunar-station-coverage

seg-2053999af5ef = <s1>Następny</s1>lunar-orbit-rendezvous
