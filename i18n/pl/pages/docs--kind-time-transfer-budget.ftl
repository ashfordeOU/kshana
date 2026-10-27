# docs--kind-time-transfer-budget: translations (pl)

seg-f42465f7d066 = ns

seg-dfe78b9d0811 = GHz

seg-cd04f5662884 = MODELLED. (katalog rodzajów (<c1/>))

seg-c61e88721556 = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Zegary, synchronizacja czasu i holdover</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-849c08d3ce70 = Strona rodziny: <a1>Zegary, synchronizacja czasu i holdover</a1>

seg-937ebbbd612c = Źródło: <c1/>

seg-6af6f07f5f5a = <c1/> (rodzaj scenariusza)

seg-9a2bb9809aed = Dwukierunkowy satelitarny transfer czasu i częstotliwości między dwiema stacjami przez przekaźnik geostacjonarny: równanie dwukierunkowe rozwiązane względem T_A - T_B z uwzględnieniem każdego składnika nieodwrotnego (opóźnienia aparatury stacji, jonosfera w paśmie Ku, transponder, efekt Sagnaca), kwadraturowy budżet niepewności, w którym składnik typu A jest TDEV symulowanego łącza przy danym czasie uśredniania, symulowane łącze z szumem fazy białym i migotania oraz dobową nieodwrotnością, a także stabilność (tempo zmian, resztkowe RMS, TDEV, ADEV) dowolnych dostarczonych szeregów BIPM Circular T Section { "1" }, plików CSV MJD,ns lub zapisów zegara stacji IGS RINEX. MODELLED.

seg-a4f8e9a09026 = Jeden przebieg <c1/> daje następujące podsumowanie: time-transfer-budget: europe - north-america offset { "12.500" } ns (Sagnac { "204.365" } ns, ionosphere { "0.0213" } ns); combined u { "1.087" } ns (type A { "0.031" } ns at { "86400" } s); { "0" } real series (MODELLED)

seg-0353d795ebdf = Pola wymagane: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>

seg-fe3afa366df2 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-00026a1d3760 = Przykład <c1/> ustawia między innymi:

seg-2409cc9397c7 = Etykieta wyniku (silnika): MODELLED — równanie dwukierunkowe TWSTFT (opóźnienia stacji, jonosfera w paśmie Ku, transponder, efekt Sagnaca) rozwiązane z podanych opóźnień, kwadraturowy budżet niepewności z TDEV symulowanego łącza jako składnikiem typu A, symulowane łącze z szumem fazy migotania i dobową nieodwrotnością oraz stabilność dowolnego r

seg-92d3c84024d7 = Wykres zapisywany przez silnik dla scenarios/time-transfer-budget.toml, rodzaj time-transfer-budget

seg-83b9c66b9e92 = <b>MODELLED</b> Równanie dwukierunkowe TWSTFT rozwiązane względem T_A - T_B z opóźnieniami nadawania i odbioru stacji, asymetrią jonosferyczną w górę i w dół w paśmie Ku, różnicą opóźnień transpondera i składnikami Sagnaca, na tle jego dokładnego modelu prostego; kwadraturowy budżet niepewn

seg-58cf4086c7a5 = <b>MODELLED</b> Równanie dwukierunkowe TWSTFT rozwiązane względem T_A - T_B z opóźnieniami nadawania i odbioru stacji, asymetrią jonosferyczną w górę i w dół w paśmie Ku, różnicą opóźnień transpondera. Wyrocznia (InternalConsistency): Spójność wewnętrzna: model prosty i rozwiązane równanie zgadzają się z dokładnością { "1e-15" } s, składnik Sagnaca jest równy niezależnej postaci pętlowej BIPM 2A omega/c^{ "2" } tego modułu, składnik jonosferyczny wynosi { "40.3" } TEC (1/f_up^{ "2" } - 1/f_down^{ "2" })/c, a procesy szumowe wykazują oczekiwane kształty TDEV. CZEGO NIE DOTYCZY: nie porównano z żadnym rzeczywistym pomiarem TWSTFT ani raportem kalibracji; podane opóźnienia i niepewności są danymi wejściowymi, a nie zmierzonymi; t

seg-15de1cdaa684 = MODELLED — równanie dwukierunkowe TWSTFT (opóźnienia stacji, jonosfera w paśmie Ku, transponder, efekt Sagnaca) rozwiązane z podanych opóźnień, kwadraturowy budżet niepewności z TDEV symulowanego łącza jako składnikiem typu A, symulowane łącze z szumem fazy migotania i dobową nieodwrotnością oraz stabilność dowolnego dostarczonego rzeczywistego szeregu UTC-UTC(k) lub zegara stacji; nie porównano z rzeczywistym łączem TWSTFT (wynik <c1/>)

seg-70448ca49780 = Dwukierunkowy satelitarny transfer czasu i częstotliwości (TWSTFT) między dwiema stacjami ILLUSTRATIVE, jedną w środkowej Europie i jedną we wschodniej Ameryce Północnej, przez przekaźnik geostacjonarny na { "10" } deg W. Przebieg rozwiązuje równanie dwukierunkowe względem T_A - T_B z podanych składników: aparatury, transpondera, jonosfery (pasmo Ku, 14/11 GHz) i efektu Sagnaca. Tworzy budżet niepewności, którego składnik statystyczny jest TDEV, przy jednej dobie, symulowanego (komentarz w pliku scenariusza, wiersze { "1" } do { "8" })

seg-4b0d23aed0ab = Równanie dwukierunkowe TWSTFT, budżet niepewności i stabilność łącza z migotaniem i dobową nieodwrotnością mają status MODELLED, nie są sprawdzone względem niezależnego wzorca zewnętrznego: sprawdzono je względem własnej tożsamości w postaci zamkniętej / analitycznej, co wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-52e06909ccc5 = <s1>Poprzedni</s1>terrain-slam

seg-a22fa1c51042 = <s1>Następny</s1>timetransfer
