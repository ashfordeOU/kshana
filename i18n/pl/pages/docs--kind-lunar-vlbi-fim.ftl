# docs--kind-lunar-vlbi-fim: translations (pl)

seg-b054c73f22e5 = brak wartości

seg-98151954f217 = false

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-3319b18ac61f = oraz { "1" } kolejny w macierzy.

seg-2595bd629ffb = <b>MODELLED</b> Siedmioparametrowy układ odniesienia Helmerta propagowany z SYMULOWANEJ KAMPANII OBSERWACYJNEJ zamiast odzyskiwany z wprowadzonej transformacji.

seg-7ecec8d27f50 = Źródło: <c1/>

seg-d54e29b7bc80 = <c1/> (rodzaj scenariusza)

seg-1bc37634ba9f = Kowariancja współrzędnych stacji księżycowego VLBI: cząstkowe pochodne opóźnienia obserwabli lunar-vlbi zsumowane po jawnym HARMONOGRAMIE (bazy x epoki) do macierzy informacyjnej Fishera, odwrócone i podane jako kowariancja współrzędnych stacji oraz sigma stacji na współrzędną — obliczone wyjście silnika, a nie skalarna precyzja opóźnienia przepuszczona przez założony izotropowy współczynnik ekwipartycji g = { "3" }. Stan niesie współrzędne stacji STAŁE względem Ziemi (ITRS), więc jakobian jest pochodną inercjalną obróconą macierzą GCRS->ITRS każdej epoki: to obrót Ziemi czyni te współrzędne obserwowalnymi, a raport MIERZY przemiatanie linii widzenia stałej względem Ziemi i deklinację latarni, zamiast je zakładać. Jedna obserwacja to jedna para (baza, epoka) z OBIEMA stacjami nad maską elewacji, ważona 1/delay_sigma_s^{ "2" }. Podaje rząd, defekt układu odniesienia, uwarunkowanie, pełne widmo informacji, macierz kowariancji, sigma 3-D i na oś dla każdej stacji oraz przestrzeń zerową sieci swobodnej w każdym przebiegu; przy niedoborze rzędu główna sigma jest publikowana jako NULL ze statusem, nigdy nie odczytywana z niemal osobliwej odwrotności. Wartość ekwipartycji c<em>delay_sigma_s</em>sqrt(g/N) dla TEGO SAMEGO harmonogramu jest emitowana obok wartości obliczonej wraz ze stosunkiem, razem z izotropową granicą śladu sqrt(p/trace(M)), którą AM-HM czyni twardą dolną granicą — więc stosunek jest anizotropią, którą założenie odrzuciło. Domknięcie opóźnienia tau_ik = tau_ij + tau_jk sprawia, że tylko n-1 z n(n-1)/2 baz jest geometrycznie niezależnych; raport podaje obie liczby. MODELLED: efemerydy środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są STAŁE, a obserwacje traktuje się jako niezależne, więc kowariancja jest granicą Craméra-Rao dla zredukowanego zbioru parametrów, a nie przewidywanym wynikiem sesji; sigma opóźnienia, współrzędne stacji i harmonogram są danymi wejściowymi. Pochodną cząstkową, której jakobian opóźnienia geometrycznego nie uwzględnia (różnicowany składnik Shapiro), mierzy się różnicą skończoną i podaje. Nie jest to produkt geodezyjny.

seg-4df72c1b921e = Jeden przebieg <c1/> podsumowuje się tak: lunar-vlbi-fim | { "3" } stacje / { "3" } bazy x { "49" } epok = { "16" } obs (maska { "10.0" } deg) | układ odniesienia anchor-first-station | rząd 6/6 cond { "2.209e4" } | sigma stacji { "0.0926" } m wobec ekwipartycji g={ "3" } { "0.0013" } m (stosunek { "71.360" })

seg-f0dabe1b061b = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>

seg-fabf305ae1de = Przykład <c1/> ustawia między innymi:

seg-7b0f433d1d63 = sigma = c * delay_sigma_s * (beacon_rang

seg-8b098bf1df6b = Etykieta wyniku (silnika): MODELLED kowariancja współrzędnych stacji księżycowego VLBI. Kowariancja jest sumowana z własnych analitycznych pochodnych cząstkowych opóźnienia silnika po jawnym harmonogramie baz i epok i odwracana; NIE jest przeliczana ze skalarnej precyzji opóźnienia za pomocą założonego współczynnika geometrii. Sigma opóźnienia na obserwację

seg-19c383444296 = Wykres, który silnik zapisuje dla scenarios/lunar-vlbi-fim.toml, rodzaj lunar-vlbi-fim

seg-d1a6a5086102 = <b>VALIDATED</b> Pochodne cząstkowe opóźnienia zsumowane po harmonogramie baz × epok do macierzy informacyjnej Fishera, odwrócone do kowariancji współrzędnych stacji i sigma stacji na współrzędną, zastępujące założone izotropowe powiązanie ekwipartycji z

seg-55ce02ad5dd5 = <b>MODELLED</b> Trzeci wybór układu odniesienia, <c1/>, który utrzymuje wszystkie stacje ziemskie i szacuje samodzielnie współrzędne LATARNI związane z ciałem Księżyca — konfiguracja, dla której faktycznie podaje się niepewność punktu na powierzchni Księżyca, ponieważ współrzędne stacji ziemskich

seg-811a412b40b6 = <b>VALIDATED</b> Kowariancja latarni przy wszystkich stacjach stałych w scenariuszu lunar-vlbi-fim (wszystkie stacje ziemskie utrzymane, współrzędne latarni związane z ciałem Księżyca szacowane samodzielnie) z latarnią umieszczoną na Księżycu JPL DE440 odczytanym własnym czytnikiem jąder silnika

seg-a731b913bdf0 = <b>VALIDATED</b> Pochodne cząstkowe opóźnienia zsumowane po harmonogramie baz × epok do macierzy informacyjnej Fishera, odwrócone do kowariancji współrzędnych stacji i sigma stacji na współrzędną, zastępujące założone izotropowe powiązanie ekwipartycji z. Wyrocznia (ExternalDataset): niezależna droga w repozytorium. Każdy wiersz jakobianu jest wyprowadzany na nowo przez centralną różnicę skończoną lunar_vlbi::vlbi_delay_s obliczoną ze współrzędnych stałych względem Ziemi i względem ciała Księżyca samego stanu, obróconych w przód przez łańcuch układów odniesienia — ścieżką, która nie oblicza żadnej pochodnej i nie dzieli żadnego wyrażenia z pochodnymi analitycznymi — a macierze informacyjne zbudowane obiema drogami zgadzają się z dokładnością < { "1e-6" } największego elementu przekątnej.

seg-2300ffd9fc4e = <b>MODELLED</b> Trzeci wybór układu odniesienia, <c1/>, który utrzymuje wszystkie stacje ziemskie i szacuje samodzielnie współrzędne LATARNI związane z ciałem Księżyca — konfiguracja, dla której księż. Wyrocznia (ReferenceImpl): tożsamości w postaci zamkniętej, bez deklarowania ani dostępności zewnętrznej wyroczni. Ramię dźwigni sprawdzono względem ρ/B, a dwie postaci ekwipartycji względem siebie do { "1e-15" } — tożsamości algebraiczne, więc wychwytują błąd okablowania i nic więcej, i tak je oznaczono. Istotny wynik jest MEASURED, a nie zakładany: opóźnienie z ustalonej bazy ogranicza KIERUNEK latarni, więc składowa wzdłuż linii widzenia rea

seg-2cbf700a234e = MODELLED kowariancja współrzędnych stacji księżycowego VLBI. Kowariancja jest sumowana z własnych analitycznych pochodnych cząstkowych opóźnienia silnika po jawnym harmonogramie baz i epok i odwracana; NIE jest przeliczana ze skalarnej precyzji opóźnienia za pomocą założonego współczynnika geometrii. Sigma opóźnienia na obserwację, współrzędne stacji, miejsce latarni i harmonogram są danymi wejściowymi. Efemerydy środka Księżyca, zegary stacji (wynik <c1/>)

seg-8f63c3e774e2 = Kowariancja współrzędnych stacji księżycowego VLBI: cząstkowe pochodne opóźnienia obserwabli lunar-vlbi zsumowane po jawnym HARMONOGRAMIE (bazy x epoki) do macierzy informacyjnej Fishera, odwrócone i podane jako kowariancja współrzędnych stacji oraz sigma stacji na współrzędną — obliczone wyjście silnika, a nie skalarna precyzja opóźnienia przepuszczona przez założony izotropowy współczynnik ekwipartycji g = { "3" }. (katalog rodzajów (<c1/>))

seg-d09b166842d5 = Stan niesie współrzędne stacji STAŁE względem Ziemi (ITRS), więc jakobian jest pochodną inercjalną obróconą macierzą GCRS->ITRS każdej epoki: to obrót Ziemi czyni te współrzędne obserwowalnymi, a raport MIERZY przemiatanie linii widzenia stałej względem Ziemi i deklinację latarni, zamiast je zakładać. (katalog rodzajów (<c1/>))

seg-bb7ff1e5d99f = Wartość ekwipartycji c<em>delay_sigma_s</em>sqrt(g/N) dla TEGO SAMEGO harmonogramu jest emitowana obok wartości obliczonej wraz ze stosunkiem, razem z izotropową granicą śladu sqrt(p/trace(M)), którą AM-HM czyni twardą dolną granicą — więc stosunek jest anizotropią, którą założenie odrzuciło. (katalog rodzajów (<c1/>))

seg-0ed4495d4488 = MODELLED: efemerydy środka Księżyca, zegary stacji, troposfera i parametry orientacji Ziemi są STAŁE, a obserwacje traktuje się jako niezależne, więc kowariancja jest granicą Craméra-Rao dla zredukowanego zbioru parametrów, a nie przewidywanym wynikiem sesji; sigma opóźnienia, współrzędne stacji i harmonogram są danymi wejściowymi. (katalog rodzajów (<c1/>))

seg-4df6e3981cc4 = Opublikowany łańcuch D3 przechodzi od precyzji opóźnienia na obserwację do niepewności współrzędnych stacji przez założony IZOTROPOWY współczynnik ekwipartycji g = { "3" }. Ten krok praca w swoim własnym streszczeniu nazywa modelowanym, a nie zmierzonym. Ten scenariusz go usuwa: cząstkowe pochodne opóźnienia księżycowego VLBI są sumowane po rzeczywistym harmonogramie par (baza x epoka) do macierzy informacyjnej Fishera, odwracane i podawane jako (komentarz w pliku scenariusza, wiersze { "3" } do { "8" })

seg-489b93ca0f7f = Stan niesie współrzędne STAŁE względem Ziemi (ITRS), więc jakobian jest pochodną inercjalną obróconą macierzą GCRS->ITRS każdej epoki: to obrót Ziemi w ogóle czyni te współrzędne obserwowalnymi, a raport MIERZY przemiatanie linii widzenia stałej względem Ziemi i deklinację latarni, zamiast je zakładać. Jedna obserwacja to jedna para (baza, epoka) z OBIEMA stacjami nad maską elewacji, ważona 1/delay (komentarz w pliku scenariusza, wiersze { "10" } do { "14" })

seg-efb5719364af = Co czytać w raporcie * sigma 3-D i na oś dla każdej stacji — obliczona odpowiedź; * wartość ekwipartycji c<em>delay_sigma_s</em>sqrt(g/N) dla TEGO SAMEGO harmonogramu, wydrukowana obok niej ze stosunkiem. Ten stosunek JEST anizotropią, którą założenie odrzuciło, a izotropowa granica śladu sqrt(p/trace(M)) czyni AM-HM twardą dolną granicą, więc założenie może jedynie zaniżać; * rząd, defekt układu odniesienia, uwarunkowanie, pełne wid (komentarz w pliku scenariusza, wiersze { "16" } do { "26" })

seg-96c1a129aeae = <s1>Poprzedni</s1>lunar-time-offset

seg-199d98630271 = <s1>Następny</s1>lunar-vlbi
