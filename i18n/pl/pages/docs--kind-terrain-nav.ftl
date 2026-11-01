# docs--kind-terrain-nav: translations (pl)

seg-216efc4e6fba = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Alternatywne PNT bez GPS</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-0df60ac6343f = <b>MODELLED</b> Dopasowanie do map grawitacyjnych, nawigacja odniesiona do terenu (TERCOM/SITAN), anomalia magnetyczna. Wyrocznia (InternalConsistency): Współczynniki IGRF-14; CRLB filtra dopasowanego z pierwszych zasad. Pole benchmarku grawitacyjnego w rzeczywistym polu jest sprawdzone zewnętrznie (wiersz 'Gravity-anomaly synthesis from a spherical-harmonic model'), ale jego wynik nawigacyjny nie ma zewnętrznej wyroczni

seg-d776abd5691c = Alternatywne / uzupełniające PNT jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Strona rodziny: <a1>Alternatywne PNT bez GPS</a1>

seg-1d36a7dc3fd0 = Źródło: <c1/>

seg-7bfd6d049799 = <c1/> (rodzaj scenariusza)

seg-0d7bf5a4f07e = Nawigacja odniesiona do terenu bez GPS (TERCOM/SITAN): wysokościomierz radarowy/barometryczny dopasowuje profil wysokości terenu do NMT w stylu SRTM, aby odzyskać dryf INS.

seg-54690375328b = Jeden przebieg <c1/> podsumowuje się tak: terrain-nav | dryf swobodnego INS { "70659" } m | dopasowany do terenu { "53" } m (spadek 1342x) | sigma dopasowania { "17.0" } m

seg-db286a072e43 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-efc57f43bd6f = Pola opcjonalne: <c1/>, <c2/>, <c3/>

seg-96e3607379e0 = Przykład <c1/> ustawia między innymi:

seg-c5e33c7122e2 = Wykres zapisany przez silnik dla scenarios/terrain-nav.toml, rodzaj terrain-nav

seg-0fcad0016c78 = <s1>Poprzednia</s1>telecom-timing

seg-fa50992f818f = <s1>Następna</s1>terrain-slam

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-d5da9ee3c152 = <b>MODELLED</b> Rodzaj i faza <c1/>: pięciostanowy model błędu inercjalnego na oś (pozycja, prędkość, bias akcelerometru, przechył, bias żyroskopu) w trakcie lądowania z napędem, wspomagany pozycjami AFS (samodzielnymi lub różnicowymi, z przypadkiem trzech przekaźników wspomaganych zegarem
