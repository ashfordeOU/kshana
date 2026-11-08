# docs--kind-eo-coverage: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-3068552e4ab4 = VALIDATED: wiersze <a1>macierzy weryfikacji</a1>, które wymieniają ten rodzaj.

seg-98151954f217 = false

seg-8e62cc4af6ea = Strona tematu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-fc32bcd32dec = Źródło: <c1/>

seg-d72c017ca1fa = <c1/> (rodzaj scenariusza)

seg-47b4aea6ed01 = Geometria śladu ładunku obserwacji Ziemi i pokrycia (trójkąt kosmiczny SMAD): kątowy promień Ziemi, szerokość pasa, odległość próbkowania na gruncie w nadirze, maksymalny dostęp poza nadirem, okres kołowy, okres węzłowy J2 i odstęp śladów na równiku z flagą ciągłego pokrycia, dla wysokości orbity, nachylenia (domyślnie heliosynchroniczne) i FOV/IFOV czujnika. Geometria sferycznej Ziemi MODELLED (bez radiometrii/MTF/atmosfery/drgań/odblasku); odstęp węzłów R_e·(ω − Ω̇)·T_nodal z sekularnymi tempami J2 pierwszego rzędu.

seg-105bb8a3c33f = Jeden przebieg <c1/> podsumowuje się tak: eo-coverage: { "700" } km, ±{ "7.5" }° FOV -> pas { "184" } km, GSD w nadirze { "9.8" } m, dostęp do { "745" } km poza nadirem; odstęp węzłów { "2752" } km (z lukami) (MODELLED)

seg-609c5b7bc6f1 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-14f19837e422 = Przykład <c1/> ustawia m.in.:

seg-834408a40783 = min

seg-ade2ba71a96c = Etykieta wyniku (silnika): MODELLED — geometria trójkąta kosmicznego dla sferycznej Ziemi; pas/GSD/dostęp są geometryczne (bez radiometrii/MTF/atmosfery/drgań/odblasku), odstęp śladów to R_e·(ω − Ω̇)·T_nodal z sekularnymi tempami J2 pierwszego rzędu

seg-c2a8332f2ee2 = Wykres zapisywany przez silnik dla scenarios/eo-coverage.toml, rodzaj eo-coverage

seg-d86d43628cf3 = <b>VALIDATED</b> Geometria trójkąta kosmicznego SMAD: kątowy promień Ziemi, szerokość pasa, GSD w nadirze, maksymalny dostęp poza nadirem i okres kołowy, plus okres węzłowy J2 pierwszego rzędu (eo_payload::j2_nodal_period) i odstęp śladów na równiku R_e (omega_ Testy: <a1>eo_payload_coverage_reference.rs</a1>.

seg-9938f1de9eb8 = <b>VALIDATED</b> Geometria trójkąta kosmicznego SMAD: kątowy promień Ziemi, szerokość pasa, GSD w nadirze, maksymalny dostęp poza nadirem i okres kołowy, plus okres węzłowy J2 pierwszego rzędu (. Wyrocznia (ExternalDataset): Orekit { "12.2" } (Apache-2.0) i GeographicLib { "2.1" } (MIT), oba uruchamiane jako osobne programy, zarejestrowane z góry (766823f3) przed zmianą silnika i jakimkolwiek przebiegiem wyroczni: wielkości sfery w granicach { "1e-9" } względnie (najgorsze: promień kątowy { "5.4e-16" }, pas { "7.0e-13" }, dostęp { "1.9e-14" }), okres { "1e-12" } ({ "1.6e-16" }), GSD w nadirze { "1e-7" } ({ "2.9e-10" }), okres węzłowy J2 i odstęp węzłów w granicach { "0.1" } % od numerycznej propagacji J2 w Orekit z detektorem węzła ({ "1" }

seg-45625167e59f = MODELLED — geometria trójkąta kosmicznego dla sferycznej Ziemi; pas/GSD/dostęp są geometryczne (bez radiometrii/MTF/atmosfery/drgań/odblasku), odstęp śladów to R_e·(ω − Ω̇)·T_nodal z sekularnymi tempami J2 pierwszego rzędu (wynik <c1/>)

seg-cf22f13c78d3 = Geometria sferycznej Ziemi MODELLED (bez radiometrii/MTF/atmosfery/drgań/odblasku); odstęp węzłów R_e·(ω − Ω̇)·T_nodal z sekularnymi tempami J2 pierwszego rzędu. (katalog rodzajów (<c1/>))

seg-153325fb00d3 = UCZCIWY ZAKRES: wyłącznie geometria sferycznej Ziemi MODELLED -- bez modelu radiometrii / MTF / atmosfery / drgań celowania / odblasku słonecznego. Odstęp śladów to R_e*(omega - dOmega/dt)*T_nodal z sekularnymi tempami J2 pierwszego rzędu; nachylenie domyślnie jest heliosynchroniczne dla danej wysokości. Uruchomienie: kshana scenarios/eo-coverage.toml (komentarz w pliku scenariusza, wiersze { "7" } do { "11" })

seg-5dc02c3d10f7 = <s1>Poprzedni</s1>entry-heating

seg-33f408d48d13 = <s1>Następny</s1>eo-radiometry
