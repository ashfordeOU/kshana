# docs--kind-lunar-attack-surface: translations (pl)

seg-8784979d6569 = dBW

seg-37d16b499bc5 = dB

seg-98151954f217 = false

seg-cc2ad9e12064 = <b>MODELLED</b> Bilans łącza J/S wynikający z geometrii, C/N₀ przy zagłuszaniu, utrata śledzenia dla każdego satelity. Wyrocznia (InternalConsistency): Równanie bilansu łącza C/N₀ przy zagłuszaniu sprawdzone krzyżowo z niezależnym ponownym wyprowadzeniem w numpy (ta sama postać zamknięta → InternalConsistency) oraz charakteryzacja spadku C/N₀ w rzeczywistym JammerTest-2024. { "0.30" } runda { "2" }, zablokowane (pozostaje MODELLED): zmierzony spadek C/N0 w JammerTest { "2024" } względem prognozy z bilansu łącza (zarejestrowanej z góry 6a66994b, w granicach { "3" } dB) nie został wykonany, ponieważ położenie i skierowanie anteny F8.1 przy

seg-143f3f1cc521 = Odporność na zagłuszanie przy braku GNSS jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-619127334cf3 = Żaden wiersz macierzy nie wymienia tego rodzaju po nazwie; etykieta na jego wyniku jest własną etykietą silnika, powyżej.

seg-a3697ad561db = Hz

seg-9521a296d617 = dBi

seg-c14d2343d802 = Źródło: <c1/>

seg-9c0b5e933472 = <c1/> (rodzaj scenariusza)

seg-004c56ded47f = Powierzchnia ataku na sygnał nawigacji powierzchniowej Księżyca (P1): składa otwarte analizy bezpieczeństwa sygnału w jeden przebieg osiągalny z poziomu binarium. Podaje ({ "1" }) moc odbieraną AFS i jej NADWYŻKĘ mocy względem naziemnego odniesienia GPS, a także pasmo czułości 12-18 dB jako prawdziwy wieloosiowy przegląd danych wejściowych łącza (poziom odniesienia x EIRP x odległość skośna) z uzgodnieniem współczynnika liniowego 25x po zaokrągleniu / 28x bez zaokrąglenia. ZMIENIONE (reguła R4): raportowało to DEFICYT mocy { "15.6" } dB i współczynnik 32x/36x, dopóki odniesienie GPS nie zostało poprawione z -125 / -128.5 (to wartości w dBm) na -155 / -158.5 dBW, wartości z ICD-GPS-200, które moduł zakłócania zawsze zawierał. Znak się odwraca: modelowany księżycowy sygnał AFS jest o { "14.4" } dB SILNIEJSZY niż naziemny GPS L1 C/A, a nie słabszy. Sama moc odbierana nie zmieniła się ani o bit, a współczynnik liniowy to dawny współczynnik podzielony przez dokładnie { "1000" }, czyli dokładnie przesunięcie { "30" } dB między dBm a dBW; ({ "2" }) wymagana moc nadawania atakującego do spoofingu (J/S = { "3" } dB) i do odmowy (J/S = { "30" } dB) przy każdej odległości, odwrotność łącza J/S; ({ "3" }) orbitalny obszar przechwycenia przy rzeczywistej charakterystyce anteny o jednostajnej aperturze (Airy [{ "2" } J1(x)/x]^{ "2" }), ograniczona wysokością czasza podpółkulista, której brzeg NIE jest przechwytywany; ({ "4" }) obliczony wynik wciągnięcia pętli śledzenia w przechwycenie przez spoofing (czy spoofer z dopasowanym kodem przy danej przewadze mocy i przesunięciu kodu rzeczywiście przeciąga DLL/PLL), a nie zakładany próg { "3" } dB; ({ "5" }) geometryczny zasięg horyzontu nadajnika powierzchniowego wzniesionego nad powierzchnią ciała bez atmosfery; oraz ({ "6" }) budżet uwierzytelniania OSNMA/TESLA (narzut { "20" } bit/s = ~{ "40" } % komunikatu nawigacyjnego AFS o szybkości { "50" } bit/s, opóźnienie ujawnienia klucza, fałszerstwo { "2" }^-40). Puste ciało odtwarza punkt odniesienia P1; każda dana wejściowa ma wartość domyślną i można ją nadpisać. Wyniki częściowe VALIDATED niosą wyrocznię swojego modułu źródłowego (radiometria w dB w postaci zamkniętej; test odwrotny J/S w obie strony; charakterystyka Airy względem funkcji Bessela z A&S i geometrii czaszy kulistej; tożsamość horyzontu stycznego do sfery względem eo_payload; wymiarowanie pól OSNMA SIS-ICD). MODELLED: reprezentatywne rzędy wielkości geometrii i mocy oraz konkretne wartości komórek mapy przechwycenia. Nie jest to certyfikowany produkt bezpieczeństwa.

seg-e5edd5b9ef27 = Jeden przebieg <c1/> podsumowuje się tak: lunar-attack-surface | AFS -140.6 dBW, nadwyżka { "14.4" } dB (pasmo -17.9–-12.0, nadwyżka { "25" }×/28×) | spoof@{ "1000" } m { "0.000" } W | obszar { "3" }% czaszy, brzeg false | spoof-capture true (zaczep { "0.00" } s) | zasięg masztu { "21.0" } km | OSNMA { "20" } bit/s ({ "40" }% z { "50" } bit/s), opóźnienie { "30" } s | przegląd obszaru 7x5 (wys. 20-500 km x HPBW 1.83-29.20 deg), przechwycenie 0.6-42.9% | brzeg NIE osiągnięty na tej siatce (najlepiej -0.8 dB, brakuje { "3.8" } dB; potrzeba { "19.8" } dBW wobec { "16.0" } dBW)

seg-781a7094b955 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>

seg-87e0c97de011 = Przykład <c1/> ustawia między innymi:

seg-6ea8f1132b57 = liniowa

seg-8b701f465117 = logarytmiczna

seg-de295af20c55 = Wykres, który silnik zapisuje dla scenarios/lunar-attack-surface.toml, rodzaj lunar-attack-surface

seg-c853e3e832c0 = <b>MODELLED</b> Dwuosiowy przegląd ważonego charakterystyką, ograniczonego wysokością obszaru przechwycenia powierzchni względem wysokości nadajnika i średnicy czaszy, emitowany po jednym wierszu na punkt pracy. Wyrocznia (InternalConsistency): Zawieranie zbiorów: stosunek zakłócenia do sygnału wchodzi jako jednostajne przesunięcie w decybelach, więc zbiór przechwycony przy wyższej mocy nadawania zawiera zbiór przy niższej, a ułamek może tylko rosnąć -- właściwość, której charakterystyka Airy NIE zapewnia w szerokości wiązki ani wysokości, gdzie obszar przechwycony rozpada się na pierścienie, a ułamek jest naprawdę niemonotoniczny. Żadna opublikowana tabela nie podaje przechwyconego ułamka tarczy księżycowego nadajnika orbitalnego

seg-d11486381332 = MODELLED: reprezentatywne rzędy wielkości geometrii i mocy oraz konkretne wartości komórek mapy przechwycenia. (katalog rodzajów (<c1/>))

seg-95be70748647 = Obszar przechwycenia w funkcji wysokości i szerokości wiązki ma poziom MODELLED, nie jest niezależnie sprawdzony względem wzorca zewnętrznego: sprawdzono go względem jego własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-1a1799e01ac4 = <s1>Poprzedni</s1>link-budget

seg-4b0efe4b9b85 = <s1>Następny</s1>lunar-beacon

seg-ca1c7e92b98e = <s1>Poprzedni</s1>lunar-ascent
