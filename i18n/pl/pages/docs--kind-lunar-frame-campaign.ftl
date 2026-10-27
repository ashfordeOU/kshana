# docs--kind-lunar-frame-campaign: translations (pl)

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-3319b18ac61f = oraz { "1" } kolejny w macierzy.

seg-dd57b833cb20 = Źródło: <c1/>

seg-120769aba2cc = <c1/> (rodzaj scenariusza)

seg-55679aff66db = Siedmioparametrowy układ odniesienia Helmerta (podobieństwa) wynikający z SYMULOWANEJ KAMPANII OBSERWACYJNEJ, a nie z wprowadzonej transformacji. Sieć stacji ziemskich obserwuje katalog księżycowych latarni powierzchniowych według jawnego harmonogramu; cząstkowe pochodne opóźnienia księżycowego VLBI są sumowane po tym harmonogramie do macierzy informacyjnej Fishera współrzędnych latarni dokładnie tak jak w lunar-vlbi-fim; a ta informacja jest propagowana przez macierz projektu Helmerta A = [I3 | [p]_x | p] w punktach katalogu do kowariancji układu odniesienia H = A^T M_b A, diagnozowanej przez crate::fim::crlb. ŻADNA transformacja nie jest wprowadzana i nic nie jest odzyskiwane z podłożonej odpowiedzi, więc podana dokładność układu odniesienia wynika z programu obserwacji: dwukrotne zmniejszenie sigma opóźnienia zmniejsza ją dokładnie dwukrotnie, a wydłużenie łuku ją poprawia, ponieważ libracja, którą raport MIERZY (sub_earth_direction_sweep_deg), oddziela współrzędną latarni wzdłuż linii widzenia od współrzędnych w płaszczyźnie nieba. Rząd, defekt układu odniesienia, uwarunkowanie, całe widmo, niewidoczne kierunki W BAZIE SIEDMIU PARAMETRÓW, najsłabszy kierunek nawet przy pełnym rzędzie i udział każdego parametru w nim są podawane w każdym przebiegu; parametr, którego kampania nie ogranicza, jest publikowany jako NULL ze statusem, nigdy nie odczytywany z niemal osobliwej odwrotności. Korelacja błędów latarni jest mierzona, a nie zakładana: przy stałych stacjach żadna obserwacja nie dotyczy dwóch latarni, więc macierz informacyjna jest dokładnie blokowo-diagonalna (offblock_fraction { "0" }), a przy szacowanych stacjach blok zmarginalizowany metodą Schura jest sprzężony, wywołana korelacja jest drukowana, a cała propagacja jest powtarzana z jej pominięciem, tak że cena założenia o niezależności jest liczbą. Ta sama propagacja przy izotropowym sigma na współrzędną oraz błąd odzyskania podawany przez scenariusz lunar-frame-realisation są tu uruchamiane i drukowane obok wartości kampanii wraz z ich stosunkami. MODELLED: katalog latarni ma źródło, ale KAMPANIA jest symulowana — sieć stacji i sigma opóźnienia są ilustracyjnymi danymi wejściowymi, pojedyncze obserwacje opóźnienia traktuje się jako niezależne, a efemerydy środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są STAŁE, więc kowariancja układu odniesienia jest granicą Craméra-Rao dla zredukowanego zbioru parametrów. Nie jest to produkt geodezyjny.

seg-2e02c1ff8f48 = Jeden przebieg <c1/> podsumowuje się tak: lunar-frame-campaign | { "4" } latarnie x { "3" } bazy x { "49" } epok = { "64" } obs (sigma opóźnienia { "1.000e-11" } s) | układ stacji stały | rząd Helmerta 7/7 cond { "3.798e5" } | sigma translacji układu { "6.397500" } m wobec błędu odzyskania wprowadzonej transformacji { "0.3125" } m (stosunek { "0.049" })

seg-9c5feacf15ce = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>

seg-1d70a5b4a197 = Przykład <c1/> ustawia między innymi:

seg-df90e5910fb4 = godz.

seg-d9523213de9f = Etykieta wyniku (silnika): MODELLED księżycowy układ odniesienia wynikający z kampanii. Siedmioparametrowa kowariancja Helmerta jest propagowana z macierzy informacyjnej współrzędnych latarni, zsumowanej z własnych pochodnych cząstkowych opóźnienia księżycowego VLBI silnika po jawnym harmonogramie latarni, baz i epok; ŻADNA transformacja podobieństwa nie jest wprowadzana i

seg-883d94b321b4 = Wykres, który silnik zapisuje dla scenarios/lunar-frame-campaign.toml, rodzaj lunar-frame-campaign

seg-fbac1cbb2422 = MODELLED { "2" } · VALIDATED { "3" }: wiersze <a1>macierzy weryfikacji</a1> dotyczące tego rodzaju.

seg-2595bd629ffb = <b>MODELLED</b> Siedmioparametrowy układ odniesienia Helmerta propagowany z SYMULOWANEJ KAMPANII OBSERWACYJNEJ zamiast odzyskiwany z wprowadzonej transformacji.

seg-fd34d760edb1 = <b>VALIDATED</b> Kowariancja siedmioparametrowego układu odniesienia Helmerta, w której dwa symulowane dane wejściowe zastąpiono zmierzonymi: harmonogram to epoki nadawania z Ziemi { "337" } zarchiwizowanych punktów normalnych księżycowego laserowego wyznaczania odległości ILRS (2015-04-08 do 2015-06-27, Grasse MeO { "7" } Testy: <a1>lunar_llr_real_data.rs</a1>.

seg-055864084843 = <b>MODELLED</b> Opcjonalne dane wejściowe extra_reflectors i extra_beacons w scenariuszu lunar-llr-datum dodają blok station_geodesy: pięciotablicową informację Helmerta z zarchiwizowanego wycinka księżycowego laserowego wyznaczania odległości plus informację, jaką wnosi dodany retroreflektor (ran Testy: <a1>lunar_station_geodesy.rs</a1>.

seg-23bd763c32d8 = <b>VALIDATED</b> Kowariancja siedmioparametrowego układu odniesienia Helmerta scenariusza lunar-frame-campaign przy szacowanych stacjach ziemskich (stacja { "1" } zakotwiczona), tak jak oblicza ją lunar_frame_campaign w binary64: wspólna informacja Fishera stacji i latarni, zsumowana Testy: <a1>lunar_frame_campaign_mpmath_oracle.rs</a1>.

seg-49f323360dc3 = <b>VALIDATED</b> Dopasowanie 7-parametrowego układu odniesienia Helmerta + powiązanie orientacji ICRF z sieci punktów. Wyrocznia (ExternalDataset): niezależny solver przekształcenia podobieństwa Umeyamy (Horna) ważonego w postaci zamkniętej (oparty na SVD numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — inny algorytm niż iteracyjne dopasowanie Gaussa–Newtona w kshana, dochodzący do tego samego jednoznacznie określonego optimum ważonych najmniejszych kwadratów na identycznych bajtowo sieciach punktów

seg-d024abcfd87c = <b>MODELLED</b> Siedmioparametrowy układ odniesienia Helmerta propagowany z SYMULOWANEJ KAMPANII OBSERWACYJNEJ zamiast odzyskiwany z wprowadzonej transformacji. Stacje ziemskie obserwują sourc. Wyrocznia (ReferenceImpl): tożsamości w postaci zamkniętej i niezależna droga w repozytorium, bez deklarowania zewnętrznej wyroczni. Macierz projektu Helmerta — jedyna nowa pochodna w module — wyprowadzono ponownie przez różnicę skończoną centralną z lunar_frame_realise::apply_helmert, ścieżką niemającą wspólnego wyrażenia z postacią analityczną. Sumowanie, które składa, jest sumowaniem lunar-vlbi-fim, którego jakobian jest różniczkowany różnicami skończonymi względem lunar_vlbi::vlbi_delay_s tam, i który

seg-0abd7b181f21 = MODELLED księżycowy układ odniesienia wynikający z kampanii. Siedmioparametrowa kowariancja Helmerta jest propagowana z macierzy informacyjnej współrzędnych latarni, zsumowanej z własnych pochodnych cząstkowych opóźnienia księżycowego VLBI silnika po jawnym harmonogramie latarni, baz i epok; ŻADNA transformacja podobieństwa nie jest wprowadzana i nic nie jest odzyskiwane z podłożonej odpowiedzi. Katalog latarni to źródłowa tabela nazwanych miejsc crate, ale KAMPA (wynik <c1/>)

seg-f92d22c06cd5 = Korelacja błędów latarni jest mierzona, a nie zakładana: przy stałych stacjach żadna obserwacja nie dotyczy dwóch latarni, więc macierz informacyjna jest dokładnie blokowo-diagonalna (offblock_fraction { "0" }), a przy szacowanych stacjach blok zmarginalizowany metodą Schura jest sprzężony, wywołana korelacja jest drukowana, a cała propagacja jest powtarzana z jej pominięciem, tak że cena założenia o niezależności jest liczbą. (katalog rodzajów (<c1/>))

seg-534cea416496 = MODELLED: katalog latarni ma źródło, ale KAMPANIA jest symulowana — sieć stacji i sigma opóźnienia są ilustracyjnymi danymi wejściowymi, pojedyncze obserwacje opóźnienia traktuje się jako niezależne, a efemerydy środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są STAŁE, więc kowariancja układu odniesienia jest granicą Craméra-Rao dla zredukowanego zbioru parametrów. (katalog rodzajów (<c1/>))

seg-ec67b9d3adbb = Korelacja błędów latarni jest MEASURED, a nie zakładana. Przy stałych stacjach żadna obserwacja nie dotyczy dwóch latarni, więc macierz informacyjna jest dokładnie blokowo-diagonalna (offblock_fraction { "0" }); przy szacowanych stacjach blok zmarginalizowany metodą Schura jest sprzężony, wywołana korelacja jest drukowana, a cała propagacja jest powtarzana z jej pominięciem, tak że cena założenia o niezależności jest liczbą, a nie c (komentarz w pliku scenariusza, wiersze { "17" } do { "21" })

seg-a2bb557da7ba = MODELLED: katalog latarni ma źródło, ale KAMPANIA jest symulowana — sieć stacji i sigma opóźnienia są ilustracyjnymi danymi wejściowymi, pojedyncze obserwacje opóźnienia traktuje się jako niezależne, a efemerydy środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są STAŁE. Nie jest to produkt geodezyjny. (komentarz w pliku scenariusza, wiersze { "27" } do { "30" })

seg-57a371bca2c7 = Księżycowy układ odniesienia z kampanii obserwacyjnej ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem odrębnej implementacji w tej samej bazie kodu — niezależnej od testowanego elementu, ale nie będącej autorytetem zewnętrznym. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-7b56c979b2c9 = <s1>Poprzedni</s1>lunar-differential-pnt

seg-70072dbfa305 = <s1>Następny</s1>lunar-frame-realisation
