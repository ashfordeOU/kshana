# docs--kind-lunar-vlbi: translations (pl)

seg-c1ce24cd6008 = analityczny

seg-37d29d8303fe = km

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-df90e5910fb4 = godz.

seg-3843825d0733 = us

seg-d1a6a5086102 = <b>VALIDATED</b> Pochodne cząstkowe opóźnienia zsumowane po harmonogramie baz × epok do macierzy informacyjnej Fishera, odwrócone do kowariancji współrzędnych stacji i sigma stacji na współrzędną, zastępujące założone izotropowe powiązanie ekwipartycji z

seg-55ce02ad5dd5 = <b>MODELLED</b> Trzeci wybór układu odniesienia, <c1/>, który utrzymuje wszystkie stacje ziemskie i szacuje samodzielnie współrzędne LATARNI związane z ciałem Księżyca — konfiguracja, dla której faktycznie podaje się niepewność punktu na powierzchni Księżyca, ponieważ współrzędne stacji ziemskich

seg-afeb6e26c5ad = Źródło: <c1/>

seg-6d1a32afd780 = <c1/> (rodzaj scenariusza)

seg-e01f77d493a0 = Modelowana księżycowa geodezyjna obserwabla opóźnienia VLBI: baza ziemska (dwie stacje naziemne, GCRS) obserwuje jednokierunkowy sygnał z latarni klasy NovaMoon na powierzchni Księżyca. Emituje opóźnienie bliskiego pola jako różnicę dwóch odległości, jego tempo i poprawkę na krzywiznę czoła fali w bliskim polu podczas przelotu — sprawdzone krzyżowo względem obserwabli Δ-DOR fali płaskiej z tej samej bazy kodu w granicy dalekiego pola, z pochodnymi cząstkowymi zweryfikowanymi różnicą skończoną. Domyślna ścieżka analityczna ma poziom MODELLED i niesie zastrzeżenia dotyczące spójności układów odniesienia, ruchu bieguna xp=yp={ "0" } oraz fali płaskiej względem bliskiego pola. Ustawienie planetary_kernel_path, earth_orientation_kernel_path i moon_orientation_kernel_path uruchamia zamiast niej ścieżkę jądrową (DE440, MOON_PA_DE440, ITRF93; zbieżne barycentryczne czasy przelotu światła; dodaje pochodne cząstkowe latarni i stacji dla epoki), której newtonowskie opóźnienie i pochodne cząstkowe zgadzają się ze zbieżnymi czasami przelotu światła NAIF SPICE do { "0.06" } ps i { "7.4e-9" }. Nie sprawdzono niezależnie względem rzeczywistych danych VLBI.

seg-92227c085867 = Jeden przebieg <c1/> podsumowuje się tak: lunar-vlbi | baza { "10727" } km | odległość latarni { "402900" } km | opóźnienie -10049.126 µs (tempo { "1.312e-6" } s/s) | bliskie pole { "58.9" } µs | { "13" } próbek w ciągu { "6.0" } h

seg-1a38a07a0d70 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>

seg-11450a55fc9d = Przykład <c1/> ustawia między innymi:

seg-07d97fc1abac = Wykres, który silnik zapisuje dla scenarios/lunar-vlbi.toml, rodzaj lunar-vlbi

seg-9af586816181 = MODELLED { "3" } · VALIDATED { "3" }: wiersze <a1>macierzy weryfikacji</a1> dotyczące tego rodzaju.

seg-61f431e422e5 = <b>MODELLED</b> Opóźnienie VLBI w bliskim polu dla bazy ziemskiej obserwującej księżycową latarnię + pochodne cząstkowe

seg-7342b50d34e4 = <b>VALIDATED</b> Opóźnienie VLBI w bliskim polu dla bazy ziemskiej obserwującej księżycową latarnię, z pochodnymi cząstkowymi latarni i stacji, na ścieżce jądrowej (lunar_vlbi::KernelGeometry): Ziemia i Księżyc z DE440, główne osie księżycowe z DE440, orientacja Ziemi ITRF93 z UT1 i Testy: <a1>naif_kernel_reader_check.rs</a1>.

seg-5547f1f662d3 = oraz { "2" } więcej w macierzy.

seg-1461c84350d8 = <b>MODELLED</b> Opóźnienie VLBI w bliskim polu dla bazy ziemskiej obserwującej księżycową latarnię + pochodne cząstkowe. Wyrocznia (ReferenceImpl): delta_dor fali płaskiej (ta sama baza kodu) w granicy dalekiego pola; pochodne cząstkowe różnicą skończoną. { "0.30" } porównanie zewnętrzne, ustalenie (pozostaje MODELLED): względem zbieżnych czasów przelotu światła ANISE { "0.10" } przez DE440 ({ "75" } opóźnień z 2024-01-01 na trzech bazach DSN, wygenerowanych przez xval/anise-lunar-od bez kodu Kshana) żadne opóźnienie nie mieści się w tolerancji { "1" } ps. Największa różnica to { "24" } µs, z analitycznego środka Księżyca (około { "200" } km od DE

seg-b41c162b015f = Domyślna ścieżka analityczna ma poziom MODELLED i niesie zastrzeżenia dotyczące spójności układów odniesienia, ruchu bieguna xp=yp={ "0" } oraz fali płaskiej względem bliskiego pola. (katalog rodzajów (<c1/>))

seg-0beac99bb095 = Rzetelność: MODELLED, NIE sprawdzone niezależnie względem rzeczywistych danych VLBI. Ruch bieguna jest pominięty (xp = yp = { "0" }), więc inercjalne pozycje stacji niosą błąd układu odniesienia rzędu kilku metrów; latarnia łączy szereg Księżyca w średnim równiku daty z przesunięciem związanym z ciałem w ICRF (jd_tdb ~ jd_tt), niespójność układów odniesienia poniżej wierności modelu; bez iteracji czasu przelotu światła, ośrodków ani aberracji poza różnicowanym członem Shapiro. Bez TRL, dorobku lotniczego ani poparcia agencji (komentarz w pliku scenariusza, wiersze { "17" } do { "21" })

seg-58b64e5ff3db = Księżycowe geodezyjne VLBI ma poziom MODELLED, nie jest niezależnie sprawdzone względem wzorca zewnętrznego: sprawdzono je względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-04089c4d6fbe = <s1>Poprzedni</s1>lunar-vlbi-fim

seg-6adcdfbaa8be = <s1>Następny</s1>mars-pnt
