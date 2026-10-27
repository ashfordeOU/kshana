# docs--kind-terrain-slam: translations (pl)

seg-216efc4e6fba = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Alternatywne PNT bez GPS</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-0df60ac6343f = <b>MODELLED</b> Dopasowanie do map grawitacyjnych, nawigacja odniesiona do terenu (TERCOM/SITAN), anomalia magnetyczna. Wyrocznia (InternalConsistency): Współczynniki IGRF-14; CRLB filtra dopasowanego z pierwszych zasad. Pole benchmarku grawitacyjnego w rzeczywistym polu jest sprawdzone zewnętrznie (wiersz 'Gravity-anomaly synthesis from a spherical-harmonic model'), ale jego wynik nawigacyjny nie ma zewnętrznej wyroczni

seg-d776abd5691c = Alternatywne / uzupełniające PNT jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Strona rodziny: <a1>Alternatywne PNT bez GPS</a1>

seg-48e022b0945e = Przykład <c1/> ustawia między innymi:

seg-4aca87f022dc = Wykres zapisywany przez silnik dla scenarios/terrain-slam.toml, rodzaj terrain-slam

seg-832919783819 = <s1>Poprzedni</s1>terrain-nav

seg-1693abd546fe = <s1>Następny</s1>time-transfer-budget

seg-bb7c9c4d4b5d = Źródło: <c1/>

seg-562e59d703e3 = <c1/> (rodzaj scenariusza)

seg-6bdc150ab25b = Sekwencyjna (rekurencyjna) nawigacja odniesiona do terenu bez GPS: filtr cząsteczkowy uruchamia model pomiaru dopasowania do terenu epoka po epoce (SITAN jako filtr ciągły), dzięki czemu zmienny w czasie dryf INS jest śledzony wzdłuż trasy, podczas gdy wsadowe terrain-nav odzyskuje tylko jedno stałe przesunięcie.

seg-1e4350c2c5f0 = Jeden przebieg <c1/> podsumowuje się tak: terrain-slam | { "60" } punktów trasy | RMS swobodnego INS { "2947" } m (końcowy { "5082" } m) | RMS dopasowany do terenu { "1241" } m (końcowy { "69" } m, spadek 2x) | średnie ESS 2599/4000 | sigma dopasowania { "17.0" } m

seg-939d877137f6 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5ceb5b8597ac = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>
