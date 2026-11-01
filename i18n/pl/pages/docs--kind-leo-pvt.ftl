# docs--kind-leo-pvt: translations (pl)

seg-7f5ad6ab8c23 = GPS

seg-b054c73f22e5 = brak wartości

seg-cb91473bfdda = Strona tematu: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Strona tematu: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-c5478f572d21 = Strona rodziny: <a1>Nawigacja z niskiej orbity okołoziemskiej</a1>

seg-be21370c2446 = joint

seg-dfe64e82e4e9 = Źródło: <c1/>

seg-fdba999dab11 = <c1/> (rodzaj scenariusza)

seg-093aac4b5ff1 = Łączne pozycjonowanie, nawigacja i czas (PNT) z średniej orbity okołoziemskiej (MEO) i niskiej orbity okołoziemskiej (LEO) dla DOWOLNYCH konstelacji: każdy [[system]] to ustawienie wstępne GNSS rodzaju constellation-design, ustawienie LEO (xona-pulsar, iridium-stl, starlink-sop, centispace, generic-c-band, model efemeryd atomic-zero-clock albo inny plik ustawienia wstępnego, każdy w osobnym pliku ze źródłami oznaczonymi PUBLIC, WORKSHOP lub WYPROWADZONE), powłoki Walkera lub jawne zestawy elementów, z nośną, tempem chipów, obwiednią gęstości nośnej do szumu (C/N0) od maski elewacji do zenitu, błędem odległości sygnału w przestrzeni (SISRE), sigmą Dopplera i modelem zegara (własny zegar odbiornika, więc bias międzysystemowy jest estymowany, albo znane przesunięcie rozgłaszane). Cztery tryby. DOPPLER: wsadowe pozycjonowanie Gaussa–Newtona z prędkości zmiany odległości z pochodnymi analitycznymi, stanami dryfu zegara i opcjonalnie prędkości oraz opcjonalnym ograniczeniem wysokości, dla jednego lub wielu satelitów, błąd w funkcji długości okna, obwiednia Dopplera, tempa Dopplera i szarpnięcia każdego systemu LEO oraz dokładność wzdłuż i w poprzek toru przy pojedynczym przelocie w funkcji przesunięcia poprzecznego (błąd poprzeczny rośnie bez ograniczeń, gdy przelot przechodzi nad głową; pojedynczy przelot ma też rozwiązanie lustrzane względem śladu naziemnego). Tutaj działa sygnał okazji wyłącznie Dopplera (starlink-sop). JOINT: rozwiązania pseudoodległościowe metodą ważonych najmniejszych kwadratów dla każdej epoki z samego GNSS, samego LEO i obu, sigmy dla każdego pomiaru z modelu szumu termicznego pętli synchronizacji opóźnienia przy C/N0 plus SISRE (albo stała sigma, aby zasilał je model sygnału), estymowane biasy międzysystemowe oraz PDOP/HDOP/VDOP w funkcji liczby dodanych satelitów LEO. POLAR: widoczne satelity i DOP w funkcji szerokości geograficznej dla GNSS, LEO i obu. TIMING: transfer czasu do czasu uniwersalnego koordynowanego (UTC) z satelitów LEO w znanym położeniu dwustanowym filtrem zegara, którego szum procesu pochodzi z klas oscylatorów silnika, w funkcji C/N0 i oscylatora, oraz wyrażenie z IS-GPS-200 na czas systemowy do UTC; przy [timing] trace = true każdy wiersz podaje też swój błąd czasu i przewidywaną sigmę w każdej epoce. VALIDATED: największy Doppler przelotu od zenitu do horyzontu względem opublikowanych wartości Iridium (do { "36" } kHz) i Xona Pulsar X1 (od { "32" } do { "34" } kHz). MODELLED: wszystko inne; DOP sprawdzono na przypadku wyprowadzonym ręcznie, rozwiązania względem ich kowariancji, a model Dopplera względem tożsamości przyspieszenia odległości.

seg-f34d4bbcac4d = Jeden przebieg <c1/> podsumowuje się tak: LEO PVT (joint) at { "61.10" }, { "6.60" } over { "1800" } s GPS gnss { "24" } sats at { "20182" } km, { "1575.42" } MHz Galileo gnss { "24" } sats at { "23222" } km, { "1575.42" } MHz Pulsar X5 leo { "258" } sats at { "1080" } km, { "1190.52" } MHz LEO ranging satellite in view on { "100.0" }% of epochs GNSS only availability { "1.000" }, median PDOP { "1.48" }, RMS 3D error { "1.29" } m LEO only availability { "1.000" }, median PDOP { "2.33" }, RMS 3D error { "0.69" } m fused availability { "1.000" }, median PDOP { "1.14" }, RMS 3D error { "0.63" } m

seg-e271a69236bf = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-f850cba7d96e = Przykład <c1/> ustawia między innymi:

seg-bb3b3e8be839 = fjord

seg-99a3c57c7926 = Ten rodzaj stosuje { "7" } dołączonych scenariuszy; pozostałe są w <a1><c1/></a1>.

seg-b43a7ee40372 = Etykieta wyniku (silnika): MODELLED łączne pozycjonowanie pseudoodległościowe metodą ważonych najmniejszych kwadratów z jednym zegarem na system lub znanym przesunięciem; szum z modelu pętli synchronizacji opóźnienia przy obwiedni C/N0 plus błąd odległości sygnału w przestrzeni

seg-90361a6f4e3c = Wykres zapisany przez silnik dla scenarios/leo-pvt-fjord-skyline.toml, rodzaj leo-pvt

seg-57cd9c415e31 = MODELLED { "3" } · VALIDATED { "2" }: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-68aa305e05a4 = <b>VALIDATED</b> Dokładna prędkość zmiany odległości satelity, którego położenie i prędkość w układzie związanym z Ziemią pochodzą z orbity dwuciałowej z wiekowym dryfem J2 i obrotem Ziemi (leo_fusion::geom::EarthOrbit::state, prędkość jako dokładna pochodna czasowa położenia), Testy: <a1>leo_doppler_reference.rs</a1>.

seg-c3ef3e0163f2 = <b>MODELLED</b> Wsadowe pozycjonowanie Gaussa–Newtona z prędkości zmiany odległości z pochodnymi analitycznymi (d rho_dot / d r = -(I - u u^T)(v_s - v_u)/rho, d/dv = -u, d/d drift = { "1" }), opcjonalnie stała prędkość użytkownika, pseudopomiar wysokości dla użytkownika na powierzchni, tłumiony s Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-a4e0166269ea = <b>MODELLED</b> Rozwiązania Gaussa–Newtona ważonych najmniejszych kwadratów dla dowolnej mieszanki systemów, jeden zegar odbiornika na system (bias międzysystemowy estymowany razem z położeniem) lub znane przesunięcie rozgłaszane na skali czasu odniesienia; sigmy dla każdego pomiaru dostarczane przez Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-5c9f826efbc8 = <b>MODELLED</b> Pomiary zegara z każdego widocznego satelity LEO w znanym położeniu, łączone odwrotnością wariancji z modelu szumu pseudoodległości, filtrowane dwustanowym (faza, częstotliwość) filtrem Kalmana, którego szum procesu jest w klasy oscylatora Testy: <a1>leo_fusion_scenarios.rs</a1>.

seg-3319b18ac61f = oraz { "1" } kolejny w macierzy.

seg-f6bd93155e41 = <b>MODELLED</b> Rozwiązania Gaussa–Newtona ważonych najmniejszych kwadratów dla dowolnej mieszanki systemów, jeden zegar odbiornika na system (bias międzysystemowy estymowany razem z położeniem) lub znane. Wyrocznia (InternalConsistency): ręcznie wyprowadzony czterosatelitarny DOP (jeden satelita w zenicie i trzy na horyzoncie co { "120" } deg, których macierz normalną odwraca się ręcznie), tożsamość strukturalna, że system z własnym zegarem i jednym satelitą nie dodaje geometrii, odtworzenie bez szumu położenia, zegara i biasu oraz błędy z ziarnem względem kowariancji. Tylko kontrole wewnętrzne; bez porównania z wynikiem odbiornika. { "0.30" } porównania zewnętrznego, ustalenie

seg-4056b0470099 = <b>MODELLED</b> Dane wejściowe niezależne od systemu: każdy system to powłoki Walkera, jawne elementy lub ustawienie wstępne GNSS, sygnał (nośna, tempo chipów, szerokość pasma, moc odbierana lub zakres C/N0. Wyrocznia (InternalConsistency): transkrypcja przytoczonych wartości publicznych, sprawdzona pod względem struktury (każde źródło publiczne ma URL, wzorce Walkera dzielą się równo, C/N0 z mocy odbieranej przez kT przy { "290" } K), a nie względem zewnętrznej wyroczni. Wartości reprezentatywne są nazwane w każdym ustawieniu wstępnym i są ilustracyjne

seg-df745ccdaceb = MODELLED wspólne pozycjonowanie pseudoodległościowe metodą ważonych najmniejszych kwadratów z jednym zegarem na system lub ze znanym przesunięciem; szum z modelu pętli śledzenia opóźnienia (delay-lock loop) przy obwiedni C/N0 plus błąd odległości sygnału w przestrzeni (wynik <c1/>)

seg-c988291eb41d = MODELLED: wszystko pozostałe; DOP sprawdzono na przypadku wyprowadzonym ręcznie, wyznaczenia pozycji względem ich kowariancji, a model Dopplera względem tożsamości przyspieszenia odległości. (katalog rodzajów (<c1/>))

seg-be908356ad19 = Ustawienie wstępne linii horyzontu jest REPRESENTATIVE (pochodzenie w docs/SKYLINE.md i <c1/>): rząd wielkości szerokości i deniwelacji głębokich fiordów zachodniej Norwegii, a nie pomiar żadnego fiordu. Tylko bezpośrednia widoczność: bez dyfrakcji, odbić ani odbioru bez bezpośredniej widoczności. Usuń sekcję [skyline], aby porównać z otwartym niebem. MODELLED. (komentarz w pliku scenariusza, wiersze { "15" } do { "18" })

seg-1d0ab26930e1 = Wspólne pozycjonowanie pseudoodległościowe GNSS i LEO z odchyłkami międzysystemowymi i modelami błędów dla poszczególnych sygnałów ma poziom MODELLED, nie jest niezależnie sprawdzone względem wzorca zewnętrznego: sprawdzono je względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-35916a8ac93e = Nazwane systemy LEO PNT jako opcjonalne dane predefiniowane, każdy z podanym źródłem, mają poziom MODELLED, nie są niezależnie sprawdzone względem wzorca zewnętrznego: sprawdzono je względem ich własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-6ac7dcc57b2a = <s1>Poprzedni</s1>leo-ppp

seg-458b3eda3250 = <s1>Następny</s1>leo-signal
