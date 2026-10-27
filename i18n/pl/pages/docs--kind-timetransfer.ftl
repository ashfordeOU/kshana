# docs--kind-timetransfer: translations (pl)

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-5a70fcb097dc = Pola opcjonalne: brak

seg-a1810bbca337 = <b>MODELLED</b> Dwukierunkowy/TWSTFT (Sagnac), GNSS common-view, PPP; link-jitter→odległość. Wyrocznia (ExternalDataset): wielkość efektu Sagnaca sprawdzona względem autorytatywnej OPUBLIKOWANEJ WARTOŚCI — N. Ashby, 'Relativity in the GPS', Living Reviews in Relativity { "6" }:{ "1" } ({ "2003" }), równ. { "1.29" }: okrążenie równika ku wschodowi kumuluje { "207.4" } ns (2ωA_E/c²); kshana odtwarza { "207.386" } ns. Niezależnie potwierdzone przez RTKLIB { "2.4.3" } geodist() (Takasu, BSD-2-Clause), który zawiera tę samą geometrię 2Aω/c². Złożony BIPM TWSTFT transponder/common-view/

seg-a8beb8dfc757 = Budżetowanie błędu transferu czasu jest MODELLED, nie jest sprawdzone względem niezależnego wzorca: podtwierdzenie jest sprawdzone zewnętrznie, ale cała możliwość składa się z elementów obliczonych na podstawie modelu, więc możliwość pozostaje oznaczona jako obliczona na podstawie modelu. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-2ccebbc74d9f = Źródło: <c1/>

seg-289a9f8dc990 = <c1/> (rodzaj scenariusza)

seg-ccb244e60d60 = Optyczny i radiowy (RF) dwukierunkowy transfer czasu i częstotliwości: porównanie.

seg-59347fda6c66 = Jeden przebieg <c1/> daje następujące podsumowanie: scenario 8f9c2e0e31a5 | optical sync_rms 0.98ps range_rms 0.293mm adev(1s) { "1.73e-12" } | RF sync_rms 1137.3ps range_rms 341.0mm adev(1s) { "8.65e-10" }

seg-890040dd3d96 = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-7b887ea27a86 = Przykład <c1/> ustawia między innymi:

seg-2485eaa6dbf4 = Dwukierunkowy satelitarny transfer czasu i częstotliwości (TWSTFT, pasmo Ku

seg-fa54f1a81b57 = Optyczne łącze międzysatelitarne, synchronizacja na poziomie pikosekund

seg-a30fe2b87ee2 = mm

seg-bd76bd68eab3 = Wykres zapisywany przez silnik dla scenarios/timetransfer.toml, rodzaj timetransfer

seg-3c9d28692f9f = <b>MODELLED</b> Dwukierunkowy transfer/TWSTFT (Sagnac), GNSS common-view, PPP; jitter łącza→odległość. Testy: <a1>time_transfer_error_budgeting_reference.rs</a1>.

seg-84fcf20588fb = <s1>Poprzedni</s1>time-transfer-budget

seg-149ad280a1f9 = <s1>Następny</s1>tracking-loop

seg-37a77f49f048 = ps
