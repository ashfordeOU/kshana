# docs--kind-cislunar-observability: translations (pl)

seg-1f17ef6a853e = Rodzaj scenariusza silnika v{ $version }, rodzina <a1>Przestrzeń księżycowa i cislunarna</a1>. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi od silnika lub z macierzy weryfikacji; rodzaj jest MODELLED, o ile macierz nie mówi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-6d584e86deba = stosunek (bezwymiarowy)

seg-1c1eeb2dcaa0 = Strona rodziny: <a1>Przestrzeń księżycowa i cislunarna</a1>

seg-258f128cea60 = Źródło: <c1/>

seg-f0c7758e472f = <c1/> (rodzaj scenariusza)

seg-7ccd0a3babb8 = Obserwowalność planarnej konstelacji cislunarnej MODELLED (P6): śledzi czterostatkową konstelację planarnych DRO skorygowanych różniczkowo z pomiarem odległości międzysatelitarnej i podaje, jaka część czteroelementowego stanu statku [x,y,ẋ,ẏ] staje się obserwowalna na danym łuku. Emituje ({ "1" }) tabelę rangi względem długości łuku dla pojedynczego łącza tylko odległościowego — chwilowo o randze 1, rosnącej ku pełnemu stanowi czteroelementowemu w miarę wydłużania łuku (P6 tabela { "1" }); ({ "2" }) widmo wartości własnych gramianu obserwowalności i liczbę uwarunkowania na łuku; ({ "3" }) porównanie chwilowej rangi tylko odległości i odległości z prędkością zmiany odległości (dźwignia projektowa Dopplera) wraz z raportowaniem GDOP osobliwego dla samej odległości i określonego dla odległości z prędkością; oraz ({ "4" }) niezależną walidację krzyżową SRIF, której kowariancja a posteriori staje się skończona / dobrze uwarunkowana dokładnie na łuku, na którym obserwowalna ranga osiąga cztery. Rdzeń VALIDATED: obserwowalna ranga jest progiem wartości osobliwych ujawniającym rangę, sprawdzonym krzyżowo z rangą z wartości własnych gramianu; widmo wartości własnych spełnia niezmienniki spektralne (ślad=Σλ, wyznacznik=Πλ, Frobenius²=Σλ²); wariacyjna STM jest STM CR3BP sprawdzoną względem niezależnego wzorca różnicami skończonymi; wiersze jakobianu odległości / prędkości zmiany odległości są analitycznymi pochodnymi cząstkowymi sprawdzonymi względem niezależnego wzorca różnicami skończonymi (sprawdzonymi krzyżowo z obserwablą 3-D prędkości zmiany odległości w crate); cztery warunki początkowe to planarne DRO skorygowane różniczkowo, które domykają się do ciasnej reszty okresowości i są wsteczne; przejście rangi jest zwalidowane krzyżowo z filtrem w postaci pierwiastka informacji w crate (kowariancja a posteriori skończona dokładnie przy pełnej randze, cond(P)=cond(OᵀO)); migawka o niepełnej randze jest oznaczana jako GDOP-undefined (fim condition=inf), nigdy jako fałszywa wartość skończona — ta sama ochrona przed osobliwą geometrią, którą stosuje pvt::solve_spp. MODELLED: projekt konstelacji (amplitudy i fazy perilunium DRO) oraz konkretny przebieg rangi, który z niego wynika. To nie jest certyfikowany produkt do oceny osiągów nawigacyjnych.

seg-a59f2fa9efb9 = Jeden przebieg <c1/> podsumowuje się tak: cislunar-observability | { "4" } s/c ({ "3" } odniesienia) | łuk { "6.0" } h, { "24" } epok | ranga { "1" } → { "4" } z { "4" } na łuku | λ gramianu [{ "2.92e-11" }…{ "5.98e-2" }] cond { "2.05e9" } | chwilowa ranga tylko odległość { "2" } → odległość+prędkość { "4" } ({ "3" } łącza) | GDOP tylko odległość nieokreślony, odległość+prędkość { "6.353" } | warunki początkowe DRO (maks. reszta okresowości { "4.7e-9" }) | SRIF a posteriori skończona w epoce rangi 4 { "8" } (ranga/STM/domknięcie DRO/SRIF sprawdzone względem niezależnego wzorca, projekt obliczony na podstawie modelu)

seg-fb1601eda130 = Pola opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-f3b5cc590c78 = Przykład <c1/> ustawia m.in.:

seg-0cc8ab10786b = jednostki czasu w układzie wirującym

seg-84781b6fff48 = GDOP nieokreślony (niepełna ranga / osobli

seg-856eb311f24b = „nieokreślony” (tekst tak, jak podaje dokument

seg-1767b216650d = określony

seg-fc5d34345fdd = Etykieta wyniku (silnika): obserwowalność planarnej konstelacji cislunarnej MODELLED (P6). Rdzeń VALIDATED: obserwowalna RANGA jest progiem wartości osobliwych ujawniającym rangę, sprawdzonym krzyżowo z rangą z wartości własnych gramianu; widmo wartości własnych gramianu spełnia niezmienniki spektralne (ślad = suma wł., wyznacznik = iloczyn wł., Frobenius^{ "2" } = suma wł.^{ "2" }

seg-f15bbf30b0dd = Wykres zapisywany przez silnik dla scenarios/cislunar-observability.toml, rodzaj cislunar-observability

seg-4564ad90378b = <b>MODELLED</b> Próg obserwowalności długości łuku cislunarnego w PRZESTRZENNYM sześcioelementowym CR3BP zamiast planarnego czteroelementowego, dla rodzin DRO, halo L2 i prawie prostoliniowego halo L2, z szumem pomiarowym wchodzącym do gramianu i DWOMA kryteriami raportowanymi

seg-9f857ff85800 = <b>MODELLED</b> Próg obserwowalności długości łuku cislunarnego w PRZESTRZENNYM sześcioelementowym CR3BP zamiast planarnego czteroelementowego, dla rodzin DRO, halo L2 i L2 prawie prostoliniowego ha. Wyrocznia (InternalConsistency): Niezależna ranga metodą eliminacji Gaussa z częściowym wyborem elementu głównego (postać schodkowa) potwierdza każdy werdykt rangi dla sześciu stanów — inny algorytm niemający wspólnego kodu z testowaną drogą wartości własnych / SVD. Macierz przejścia stanu CR3BP { "6" }×{ "6" }, którą to składa, ma własną wyrocznię ReferenceImpl względem całkowania wariacyjnego w SciPy, a warunki początkowe halo/NRHO pochodzą z korektora, który odtwarza opublikowane L2 południow

seg-53c183035bde = MODELLED obserwowalność planarnej konstelacji cislunarnej (P6). Rdzeń VALIDATED: obserwowalna RANGA jest progiem wartości osobliwych ujawniającym rangę, sprawdzonym krzyżowo z rangą z wartości własnych gramianu; widmo wartości własnych gramianu spełnia niezmienniki spektralne (ślad = suma wł., wyznacznik = iloczyn wł., Frobenius^{ "2" } = suma wł.^{ "2" }); wariacyjna STM jest STM CR3BP sprawdzoną względem niezależnego wzorca różnicami skończonymi (crate::cr3bp); wiersze jakobianu odległości / prędkości zmiany odległości (wynik <c1/>)

seg-f6a217f57bec = Obserwowalność planarnej konstelacji cislunarnej MODELLED (P6): śledzi czterostatkową konstelację planarnych DRO skorygowanych różniczkowo z pomiarem odległości międzysatelitarnej i podaje, jaka część czteroelementowego stanu statku [x,y,ẋ,ẏ] staje się obserwowalna na danym łuku. (katalog rodzajów (<c1/>))

seg-e5182743fd40 = MODELLED: projekt konstelacji (amplitudy i fazy perilunium DRO) oraz konkretny przebieg rangi, który z niego wynika. (katalog rodzajów (<c1/>))

seg-5d3a370f1295 = Uczciwość: MODELLED. Rdzeń VALIDATED -- obserwowalna RANGA jest progiem wartości osobliwych ujawniającym rangę, sprawdzonym krzyżowo z rangą z wartości własnych gramianu; widmo wartości własnych spełnia niezmienniki spektralne (ślad = suma wł., wyznacznik = iloczyn wł., Frobenius^{ "2" } = suma wł.^{ "2" }); wariacyjna STM jest STM CR3BP sprawdzoną względem niezależnego wzorca różnicami skończonymi; wiersze jakobianu odległości / prędkości zmiany odległości są analitycznymi pochodnymi cząstkowymi sprawdzonymi względem niezależnego wzorca różnicami skończonymi (sprawdzone krzyż (komentarz w pliku scenariusza, wiersze { "16" } do { "25" })

seg-c68bc1df8975 = Przestrzenna, zaszumiona, wielorodzinna obserwowalność długości łuku cislunarnego jest MODELLED, nie jest sprawdzona względem niezależnego wzorca: sprawdzona względem własnej tożsamości w postaci zamkniętej / analitycznej; wychwytuje błędy przepisania i współczynników, ale nie jest zewnętrzną wyrocznią. (macierz weryfikacji (docs/MODELLED-RATIONALE.md))

seg-ba3c2a8f0e28 = <s1>Poprzedni</s1>cislunar-arc-recovery

seg-3adfb78b1f34 = <s1>Następny</s1>clock
