# docs--kind-ascent-losses: translations (pl)

seg-99ef7c1d552c = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Analiza misji, łącza i operacje kosmiczne</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-8f1e7d3f5a07 = Strona rodziny: <a1>Analiza misji, łącza i operacje kosmiczne</a1>

seg-5d7cf510f4e9 = Źródło: <c1/>

seg-23e7becab606 = <c1/> (rodzaj scenariusza)

seg-34d041d6bd9f = Planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez atmosferę US Standard Atmosphere { "1976" } (pionowy wznios, kopnięcie pochylenia, ciąg wzdłuż prędkości), z całkowaniem strat grawitacyjnych, oporowych, sterowania i przeciwciśnienia oraz sprawdzeniem, czy idealne dv minus straty zgadza się z prędkością po wypaleniu; max-Q, szczytowe przyspieszenie i stan po wypaleniu. MODELLED.

seg-cd6181de5e43 = Jeden przebieg <c1/> podsumowuje się tak: ascent-losses: idealne dv { "11290" } m/s, straty { "2359" } m/s (grawitacyjne { "2276" }, oporowe { "15" }, sterowania { "0" }, przeciwciśnienia { "67" }); wypalenie { "509" } km przy { "8932" } m/s, gamma { "8.7" } deg; max-Q { "32.5" } kPa (MODELLED)

seg-58f9e8d24a73 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>

seg-ec4396f2fa76 = Przykład <c1/> ustawia m.in.:

seg-a44edb1eb84d = kg

seg-37205a55d23c = m^{ "2" }

seg-98151954f217 = false

seg-68a37ebbc01e = Etykieta wyniku (silnika): MODELLED — planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez US76, z całkowaniem strat grawitacyjnych, oporowych, sterowania i przeciwciśnienia oraz sprawdzoną tożsamością idealne-dv-minus-straty; stałe C_D, bez rotacji, bez fazy bezmocowej, bez sterowania poza kopnięciem pochylenia

seg-ccf2185b0b5e = Wykres zapisywany przez silnik dla scenarios/ascent-losses.toml, rodzaj ascent-losses

seg-3a3ee499961e = <b>MODELLED</b> Planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez atmosferę US Standard Atmosphere { "1976" } (gęstość i ciśnienie), z kopnięciem pochylenia, ciągiem zmniejszonym o przeciwciśnienie dyszy, wypaleniami stopni przy dokładnych s

seg-cac91718c4e1 = <b>MODELLED</b> Planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez atmosferę US Standard Atmosphere { "1976" } (gęstość i ciśnienie), z kop. Wyrocznia (InternalConsistency): Spójność wewnętrzna: dokładna tożsamość prędkość po wypaleniu = suma Isp g0 ln(m0/mf) minus cztery scałkowane straty (reszta poniżej { "1e-6" } m/s), równanie Ciołkowskiego dla pionowego wypalenia w próżni, w którym jedyną stratą jest grawitacja, oraz ciśnienia US76 na poziomie morza i tropopauzie. CZEGO NIE OBEJMUJE: nie porównano strat żadnego opublikowanego pojazdu; brak rotacji Ziemi, fazy bezmocowej, dławienia ani sterowania poza kopnięciem; stałe C_D; nie jest trajektorią

seg-906f001cd9ea = MODELLED — planarne wznoszenie po zakręcie grawitacyjnym wielostopniowego pojazdu nad nieobracającą się kulistą Ziemią przez US76, z całkowaniem strat grawitacyjnych, oporowych, sterowania i przeciwciśnienia oraz sprawdzoną tożsamością idealne-dv-minus-straty; stałe C_D, bez rotacji, bez fazy bezmocowej, bez sterowania poza kopnięciem pochylenia (wynik <c1/>)

seg-f916c5a08595 = Straty wznoszenia po zakręcie grawitacyjnym ILLUSTRATIVE dwustopniowej rakiety na naftę i tlen (to nie jest prawdziwy pojazd): pionowy wznios do { "1" } km, kopnięcie pochylenia o { "3" } deg przez { "10" } s, a następnie ciąg wzdłuż prędkości. Przebieg całkuje straty grawitacyjne, oporowe, sterowania i przeciwciśnienia i sprawdza, czy idealne dv minus straty równa się prędkości po wypaleniu. MODELLED: planarnie, nieobracająca się Ziemia, stałe C_D, bez fazy bezmocowej, bez sterowania poza kopnięciem. (komentarz w pliku scenariusza, wiersze { "1" } do { "5" })

seg-4c237f051651 = Straty grawitacyjne, oporowe, sterowania i przeciwciśnienia przy wznoszeniu rakiety są MODELLED, nie są sprawdzone względem niezależnego wzorca: sprawdzone względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8e62cc4af6ea = Strona tematu: <a1>ENTRY-EO-ASCENT.md</a1>

seg-73148557c9a6 = <s1>Poprzedni</s1>araim-reference-check

seg-3af9699f27a7 = <s1>Następny</s1>attitude-budget
