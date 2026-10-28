# docs--kind-lunar-differential-pnt: translations (pl)

seg-9feefecdcf67 = rafs

seg-f42465f7d066 = ns

seg-37d29d8303fe = km

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-549a6103e711 = bit

seg-d0c9bec248b4 = Źródło: <c1/>

seg-d226df2bb634 = <c1/> (rodzaj scenariusza)

seg-8ac5ac006ae7 = Modelowany księżycowy DIFFERENTIAL PNT (księżycowy odpowiednik DGNSS/SBAS): stacja referencyjna klasy NovaMoon w ZNANEJ lokalizacji selenograficznej oblicza dla poszczególnych satelitów poprawki różnicowe z ILLUSTRATIVE, opartej na źródłach publicznych konstelacji klasy Moonlight/LCNS (NovaMoon wymieniony tylko jako KLASA systemu, bez powiązań z ESA), a użytkownik przesunięty o baseline_km stosuje je tak, że WSPÓLNE błędy orbity i zegara znoszą się. Składnik zegara znosi się DOKŁADNIE (tożsamość algebraiczna); składnik orbity pozostawia tylko rzut różnicy linii widzenia, który dąży do { "0" } gdy baza dąży do { "0" } (dolna granica dekorelacji przestrzennej) i rośnie w przybliżeniu liniowo z bazą. Podaje błąd pozycji użytkownika 3-D Z poprawkami i BEZ poprawek, współczynnik redukcji, krzywą błędu w funkcji bazy oraz poziom ochrony użytkownika, który WYKORZYSTUJE mechanizm SBAS z DO-229E (crate::sbas) z resztą różnicową σ. MODELLED — dokładna tożsamość znoszenia + model dekorelacji pierwszego rzędu; nie sprawdzone na danych rzeczywistych; bez TRL, dorobku ani poparcia agencji. Deterministyczne, jeśli zadano ziarno.

seg-4b7355b174a3 = Jeden przebieg <c1/> podsumowuje się tak: lunar-differential-pnt | { "8" } sats (ilustracyjna klasa LCNS, bez powiązań) | baza { "50" } km | błąd użytkownika { "24.46" } m → { "0.0077" } m (redukcja { "3186" }×) | HPL { "23.1" } m (σ_resid { "5.0" } m) | MODELLED

seg-1115464be513 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-3f32e0fea066 = Przykład <c1/> ustawia między innymi:

seg-8e67df89448a = Wykres, który silnik zapisuje dla scenarios/lunar-differential-pnt.toml, rodzaj lunar-differential-pnt

seg-6f4246bd8f6f = <b>MODELLED</b> Różnicowa stacja referencyjna klasy NovaMoon: znoszenie błędów wspólnych + reszta rosnąca z bazą + poziomy ochrony DGNSS. Wyrocznia (InternalConsistency): tożsamość znoszenia błędów różnicowych + ponowne użycie mechanizmu PL SBAS z DO-229E; rozwiązanie z różnicą pojedynczą + WLS sprawdzono dodatkowo względem lsq()/matinv() z RTKLIB (Takasu, BSD-2-Clause, skompilowany kod C) — niezależny kod solwera, ale ta sama algebra pierwszego rzędu różnicy LOS, więc nadal InternalConsistency

seg-8d02b1426187 = <b>MODELLED</b> Trzy składniki, które poprawka różnicowa zbiera między epoką, w której ją obliczono, a epoką, w której ją użyto, każdy dotąd pozostawiony jako niezamodelowany zapas:. Wyrocznia (InternalConsistency): tożsamości w postaci zamkniętej i samospójność: wariancja kwantyzatora jednostajnego step²/12, dokładna propagacja kowariancji (GᵀG)⁻¹GᵀRG(GᵀG)⁻¹ sprowadzająca się do σ·PDOP dla równych σ, przeniesienie składnika pomiaru { "1" }:{ "1" } jako konsekwencja û_user ≈ û_ref oraz domknięcie kwadraturowe przy wyłączaniu. Sprawdzenie PDOP względem orbit::dop dzieli macierz normalną [−û, { "1" }], więc jest sprawdzeniem spójności i tak je oznaczono, a nie jako niezależne

seg-f1e7283d2e15 = MODELLED — dokładna tożsamość znoszenia + model dekorelacji pierwszego rzędu; nie sprawdzone na danych rzeczywistych; bez TRL, dorobku ani poparcia agencji. (katalog rodzajów (<c1/>))

seg-9d54d8c07ca3 = RZETELNOŚĆ: MODELLED. Znoszenie błędów wspólnych jest DOKŁADNĄ tożsamością algebraiczną; reszta dekorelacji przestrzennej jest modelem geometrycznym PIERWSZEGO RZĘDU (rzut różnicy LOS wprowadzonego błędu orbity), a nie dopasowanym modelem dekorelacji z rzeczywistego śledzenia księżycowego. Poziom ochrony użytkownika WYKORZYSTUJE mechanizm poziomu ochrony SBAS z DO-229E (crate::sbas) z resztą różnicową sigma jako błędem na satelitę (komentarz w pliku scenariusza, wiersze { "23" } do { "28" })

seg-4156a7515574 = ── ŁĄCZE POPRAWEK ────────────────────────────────────────────────────────────── Powyższa tożsamość zakłada IDEALNĄ poprawkę: obliczoną przez stację, która dokładnie wie, gdzie stoi, dostarczoną natychmiast, z nieskończoną rozdzielczością. Żadne z trzech nie jest spełnione, a trzy poniższe dane wejściowe modelują, ile każde kosztuje. Zasilają WYŁĄCZNIE blok <c1/> dokumentu wyniku -- gdy wszystkie trzy mają wartości zapisane h (komentarz w pliku scenariusza, wiersze { "57" } do { "62" })

seg-e7f016777e09 = BŁĄD POMIARU POŁOŻENIA. Stacja tworzy poprawkę względem współrzędnej, którą UWAŻA za prawdziwą. Błąd w niej towarzyszy każdej nadawanej poprawce i dociera do użytkownika jako -delta . u_ref -- co w ogóle nie zawiera geometrii użytkownika, więc w odróżnieniu od składnika orbity nie zanika przy zerowej bazie ani nie rośnie z bazą i przenosi się mniej więcej jeden do jednego na pozycję użytkownika. Domyślne { "0.30" } m to własny księżycowy punkt odniesienia crate (komentarz w pliku scenariusza, wiersze { "64" } do { "70" })

seg-e0648d9b52b4 = STARZENIE SIĘ POPRAWKI. Poprawka obliczona w chwili t i zastosowana w t+tau jest nieaktualna na dwa sposoby. Orbita: satelita się PRZEMIEŚCIŁ, więc zamrożony wektor błędu orbity rzutuje się teraz na obróconą linię widzenia; obrót pochodzi z własnego propagatora tego crate, więc nigdzie nie zakłada się tempa zmian błędu orbity. Zegar: zegar satelity zdryfował o c*sigma_y(tau)*tau dla pełnego prawa potęgowego RAFS w crate::clock_specs, skalibrowanego (komentarz w pliku scenariusza, wiersze { "73" } do { "79" })

seg-7171b2e3f29d = Księżycowy różnicowy PNT ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-35f1876d023e = Księżycowy różnicowy PNT — budżet reszt łącza poprawek ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-8f8871ac8a0f = Strona tematu: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-2b8455001710 = <s1>Poprzedni</s1>lunar-beacon

seg-dca7482d9d75 = <s1>Następny</s1>lunar-frame-campaign

seg-e66e2ca31e54 = Strona tematu: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-f9d918743ec6 = <s1>Poprzedni</s1>lunar-descent
