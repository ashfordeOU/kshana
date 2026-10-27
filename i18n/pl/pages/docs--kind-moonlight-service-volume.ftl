# docs--kind-moonlight-service-volume: translations (pl)

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-eb9f9a422d38 = Źródło: <c1/>

seg-f8988314faf2 = <c1/> (rodzaj scenariusza)

seg-28c6a5644152 = Obliczona na podstawie modelu analiza lunarnego obszaru usługi nawigacyjnej dla ILLUSTRATIVE, opartej na źródłach publicznych konstelacji na orbicie okołoksiężycowej klasy Moonlight/LCNS (bez powiązania z ESA): przegląda siatkę szerokości i długości selenograficznych w danym horyzoncie czasowym i podaje DOP, pokrycie i dostępność (≥{ "4" } satelitów ORAZ PDOP poniżej progu) oraz uogólnioną obwiednię poziomów ochrony lunarnego ARAIM (HPL/VPL) nad tym obszarem. Geometria DOP PONOWNIE WYKORZYSTUJE jądro VALIDATED względem gnss_lib_py (crate::orbit::dop); poziom ochrony PONOWNIE WYKORZYSTUJE mechanizm lunarnego ARAIM LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) i jako przypadek szczególny sprowadza się do istniejącego poziomu ochrony dla bieguna południowego. Kompozycja MODELLED: zestaw przekaźników na orbitach keplerowskich kołowych lub eliptycznych (nie rzeczywiste efemerydy LCNS/NRHO z korekcją różnicową), Księżyc z rotacją średnią (bez libracji i precesji bieguna). Deterministyczna (czysta geometria). Bez TRL, dziedzictwa lotniczego ani poparcia agencji.

seg-8516d1ded5dd = Jeden przebieg <c1/> podsumowuje się tak: moonlight-service-volume | { "8" } satelitów (ilustracyjne, klasy LCNS, bez powiązania) | { "24" } punktów × { "12" } epok | pokrycie { "37.8" }% (PDOP<{ "6.0" }) | satelity { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | dostępność PL { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Przykład <c1/> ustawia między innymi:

seg-edb738273a3a = Wykres zapisany przez silnik dla scenarios/moonlight-service-volume.toml, rodzaj moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> Lunarny DOP, pokrycie i dostępność klasy Moonlight oraz uogólnione lunarne poziomy ochrony ARAIM nad obszarem usługi. Wyrocznia (ExternalDataset): niezależny propagator keplerowski ANISE { "0.10.2" } astro::Orbit od zewnętrznego autora (Nyx Space, MPL-2.0) — równonocnikowa ścieżka kodu dwóch ciał, odmienna od metody Newtona-Raphsona użytej w kshana do równania Keplera; położenie każdego satelity w układzie MCI zgadza się z dokładnością do <{ "1e-3" } m, a wyprowadzona liczba i zbiór widocznych satelitów w każdym punkcie siatki są identyczne. Jądro DOP jest sprawdzone względem gnss_lib_py; integralność korzysta z opublikowanych parametrów LunaNet/LCNS

seg-47f496c1d603 = <b>VALIDATED</b> Topocentryczne kąty widzenia poszczególnych satelitów (azymut liczony zgodnie z ruchem wskazówek zegara od północy, elewacja) i odległość ukośna w nazwanym miejscu selenograficznym, przy satelicie podanym w układzie miejsca. Wyrocznia (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, uruchamiany jako narzędzie z xval/anise-service-geometry, binarka lunar-look-angles-xval, która nie wywołuje żadnego kodu Kshana): własna procedura ANISE do azymutu, elewacji i odległości (azimuth_elevation_range_sez) dla miejsc zbudowanych jej konstruktorem szerokość-długość-wysokość na Księżycu pck00011 (sfera { "1737.4" } km), z satelitami obróconymi do MOON_PA_DE440 przez moon_pa_de440_200625.bpc. { "768" } próbek o

seg-1f12671176ad = Kompozycja MODELLED: zestaw przekaźników na orbitach keplerowskich kołowych lub eliptycznych (nie rzeczywiste efemerydy LCNS/NRHO z korekcją różnicową), Księżyc z rotacją średnią (bez libracji i precesji bieguna). (katalog rodzajów (<c1/>))

seg-2ff91fe31123 = RZETELNOŚĆ: kompozycja MODELLED. Geometria DOP jest sprawdzona PRZEZ PONOWNE UŻYCIE sprawdzonego jądra; kompozycja pokrycia, dostępności i integralności jest MODELLED — zestaw przekaźników na orbitach keplerowskich kołowych lub eliptycznych (nie efemerydy LCNS / NRHO { "9" }:{ "2" } z korekcją różnicową), Księżyc z rotacją średnią (bez fizycznej libracji i precesji bieguna) oraz opublikowane parametry integralności LunaNet LNIS. To pokazuje lunarny obszar usługi M (komentarz w pliku scenariusza, wiersze { "27" } do { "32" })

seg-f3279128de3b = <s1>Poprzednia</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Następna</s1>ntn-positioning
