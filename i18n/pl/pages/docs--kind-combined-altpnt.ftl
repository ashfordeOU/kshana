# docs--kind-combined-altpnt: translations (pl)

seg-a83b25413fd8 = Źródło: <c1/>

seg-92b24377c9be = <c1/> (rodzaj scenariusza)

seg-216efc4e6fba = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Alternatywne PNT bez GPS</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-f496b7f4c63a = Połączony nawigator grawitacyjny + magnetyczny + terenowy bez GPS: trzy skalarne kanały pól łączone w każdym punkcie trasy dla ostrzejszego (o niższym CRLB) wskazania dryfu niż w przypadku pojedynczego pola.

seg-670730bd221e = Jeden przebieg <c1/> podsumowuje się tak: combined-altpnt | dryf swobodny inercjalny { "70659" } m | grawitacyjny { "464" } m magnetyczny { "782" } m terenowy { "368" } m | POŁĄCZONY { "365" } m

seg-cf6981466329 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-078f09d100fa = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-557db767b9c3 = Przykład <c1/> ustawia m.in.:

seg-df8d5e07e737 = mGal

seg-498b1aea3770 = Wykres zapisywany przez silnik dla scenarios/combined-altpnt.toml, rodzaj combined-altpnt

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-0df60ac6343f = <b>MODELLED</b> Dopasowanie do map grawitacyjnych, nawigacja odniesiona do terenu (TERCOM/SITAN), anomalia magnetyczna. Wyrocznia (InternalConsistency): Współczynniki IGRF-14; CRLB filtra dopasowanego z pierwszych zasad. Pole benchmarku grawitacyjnego w rzeczywistym polu jest sprawdzone zewnętrznie (wiersz 'Gravity-anomaly synthesis from a spherical-harmonic model'), ale jego wynik nawigacyjny nie ma zewnętrznej wyroczni

seg-d776abd5691c = Alternatywne / uzupełniające PNT jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Strona rodziny: <a1>Alternatywne PNT bez GPS</a1>

seg-49efcd2ced81 = <s1>Poprzedni</s1>clock

seg-f2ccea3bb03e = <s1>Następny</s1>conflict-resilience
