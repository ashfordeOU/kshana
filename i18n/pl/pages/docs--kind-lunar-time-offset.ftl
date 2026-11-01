# docs--kind-lunar-time-offset: translations (pl)

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-4d208b6c0eb8 = doba

seg-64813e3da228 = Źródło: <c1/>

seg-000bb13909f1 = <c1/> (rodzaj scenariusza)

seg-7f3e13712f10 = Modelowane relatywistyczne tempo zegara Ziemia–Księżyc (Księżycowy Czas Współrzędnych, LTC/TCL): wtórne tempo LTC−TT z różnicy potencjału własnego i członu kinetycznego Księżyca, podane wraz z opublikowanym pasmem { "56" }–{ "59" } µs/dobę, plus skumulowane przesunięcie w horyzoncie.

seg-9efcf3e1be04 = Jeden przebieg <c1/> podsumowuje się tak: lunar-time-offset | wtórne tempo LTC−TT { "57.04" } µs/dobę (pasmo { "56" }–{ "59" }) | self-pot { "57.50" } kinetic -0.46 | offset @ { "1.00" } d = { "57.04" } µs

seg-9367773c4889 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Przykład <c1/> ustawia między innymi:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = Wykres, który silnik zapisuje dla scenarios/lunar-time-offset.toml, rodzaj lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relatywistyczne tempo zegara Ziemia–Księżyc (LTC/TCL) + łańcuch TT/TAI/UTC + zespół. Wyrocznia (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; podstawa dla IAU/IAG LunaNet LTC): potencjał własny powierzchni Księżyca L_m = { "3.13881e-11" } i wtórna suma { "56.02" } µs/dobę zgodne jako opublikowane wartości liczbowe; geocentryczną prędkość Księżyca sprawdzono krzyżowo względem JPL DE440 (de440s.bsp przez SPICE)

seg-96b65f604cc2 = Rzetelność: MODELLED, nie certyfikowane. Główna wartość us/dobę zależy od odniesienia (geoida ziemska W0 a selenoida księżycowa, okno uśredniania, pominięte poprawki odśrodkowe/J2 poniżej us/dobę) -> uczciwym wynikiem jest pasmo, a nie pojedyncza liczba. Nic tu nie jest sprawdzone niezależnie do dokładności bezwzględnej poniżej nanosekundy ani certyfikowane do operacyjnego pomiaru czasu. Raport podaje także skumulowane przesunięcie LTC-TT w hori (komentarz w pliku scenariusza, wiersze { "11" } do { "16" })

seg-e4552368a6a7 = <s1>Poprzedni</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Następny</s1>lunar-vlbi-fim

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>
