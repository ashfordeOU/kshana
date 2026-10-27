# docs--kind-lunar-frame-realisation: translations (pl)

seg-98151954f217 = false

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-49f323360dc3 = <b>VALIDATED</b> Dopasowanie 7-parametrowego układu odniesienia Helmerta + powiązanie orientacji ICRF z sieci punktów. Wyrocznia (ExternalDataset): niezależny solver przekształcenia podobieństwa Umeyamy (Horna) ważonego w postaci zamkniętej (oparty na SVD numpy/scipy; Umeyama { "1991" } IEEE TPAMI, Horn { "1987" } JOSA A) — inny algorytm niż iteracyjne dopasowanie Gaussa–Newtona w kshana, dochodzący do tego samego jednoznacznie określonego optimum ważonych najmniejszych kwadratów na identycznych bajtowo sieciach punktów

seg-0225ace73ba8 = Źródło: <c1/>

seg-a092c5795651 = <c1/> (rodzaj scenariusza)

seg-0c4c119abfca = Modelowana realizacja księżycowego układu odniesienia: dopasowanie 7-parametrowego układu Helmerta (podobieństwa) — { "3" } translacje, { "3" } małe obroty, { "1" } skala — wiążące oszacowany zbiór współrzędnych punktów MCMF pochodzących z selenograficznych do układu odniesienia metodą ważonych najmniejszych kwadratów (crate::batch_ls::gauss_newton), plus proste powiązanie orientacji wyrażające zrealizowany mały obrót wokół osi ICRF względem orientacji ciała IAU { "2015" } WGCCRE. Scenariusz wprowadza znaną małą transformację (translacja ~dziesiątki m, obrót ~µrad, skala ~{ "1e-7" }) do dobrze rozłożonej syntetycznej sieci punktów, dodaje szum gaussowski z zadanym ziarnem, odzyskuje układ odniesienia i podaje odzyskaną transformację, błąd odzyskania na parametr względem wprowadzonej prawdy oraz resztę RMS po dopasowaniu. MODELLED samospójność — odzyskuje wprowadzoną transformację podobieństwa (bez szumu do ~precyzji maszynowej), NIE jest to realizacja względem rzeczywistych danych śledzenia/VLBI; deterministyczne (z ziarnem); bez TRL, dorobku ani poparcia agencji.

seg-32d5e2749e64 = Jeden przebieg <c1/> podsumowuje się tak: lunar-frame-realisation | { "8" } punktów | błąd translacji { "3.125e-1" } m, błąd obrotu { "3.418e-7" } rad, błąd skali -5.891e2 ppb | reszta rms { "0.887" } m | converged false

seg-e732d2c2ab91 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>

seg-29f85024974b = Przykład <c1/> ustawia między innymi:

seg-49baab4910f3 = ppb

seg-a7d59ba6e225 = rad

seg-f3a6d69d0225 = Wykres, który silnik zapisuje dla scenarios/lunar-frame-realisation.toml, rodzaj lunar-frame-realisation

seg-f99a78efa965 = MODELLED samospójność — odzyskuje wprowadzoną transformację podobieństwa (bez szumu do ~precyzji maszynowej), NIE jest to realizacja względem rzeczywistych danych śledzenia/VLBI; deterministyczne (z ziarnem); bez TRL, dorobku ani poparcia agencji. (katalog rodzajów (<c1/>))

seg-238cea087ae0 = Rzetelność: MODELLED samospójność. Wyrocznią jest odzyskanie wprowadzonej 7-parametrowej transformacji podobieństwa (bez szumu do ~precyzji maszynowej) oraz algebraiczna tożsamość obiegu w obie strony dla apply_helmert. To NIE jest realizacja księżycowego układu odniesienia względem rzeczywistych danych śledzenia / VLBI i nie rości sobie żadnej bezwzględnej dokładności układu odniesienia. Deterministyczne (z ziarnem). Nie deklaruje się TRL, dorobku lotniczego ani poparcia agencji. (komentarz w pliku scenariusza, wiersze { "23" } do { "27" })

seg-07550d3d9610 = <s1>Poprzedni</s1>lunar-frame-campaign

seg-5a3a7120aae2 = <s1>Następny</s1>lunar-infrastructure
