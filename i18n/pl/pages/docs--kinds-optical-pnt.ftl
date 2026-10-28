# docs--kinds-optical-pnt: translations (pl)

seg-b03d56f501c3 = Rodzaj

seg-e6839b50b560 = MODELLED heterogeniczny wspólny wskaźnik jakości optycznego i radiowego PNT (P5): składa dwukierunkowy optyczny bilans łącza { "1550" } nm (ograniczone fotonami dwukierunkowe CRLB pomiaru odległości σ_τ/√N i ślad dyfrakcyjny λ/D·odległość), międzymodalny poziom ochrony RAIM z separacją rozwiązań (położenie ORAZ czas), który łączy luźne rozwiązanie radiowe i ścisłe optyczne o różnych kowariancjach, dostępność optyczną przy czystym niebie dla N stacji (suma niezależna { "1" }−Π({ "1" }−a_i) i wariant skorelowany przestrzennie), przekazanie stanu/kowariancji optyczne↔radiowe z UDOWODNIONĄ średnią ciągłą co do bitu (bez skoku) i bramką spójności NEES χ², oraz wspólną ocenę P(dostępne ORAZ klasy precyzyjnej ORAZ z zapewnioną integralnością) z uwzględnieniem korelacji. VALIDATED wzór zamknięty: CRLB pomiaru odległości, ślad dyfrakcyjny, kwantyl poziomu ochrony χ², kombinatoryka sumy, ciągłość średniej przekazania + bramka NEES oraz wspólny iloczyn niezależny. MODELLED: przydziały strat optycznych, wielkości σ radiowe/optyczne, dane wejściowe klimatologii zachmurzenia, korelacje i budżet P_HMI. Nie jest to produkt z certyfikacją dostępności ani integralności.

seg-5cea5229815e = Wykres zapisany przez silnik dla scenarios/hybrid-optical-rf.toml, rodzaj hybrid-optical-rf

seg-4e31c8daf798 = Rejestr (ledger)

seg-963749981a7c = Źródło: <c1/>

seg-079c8b284c44 = Optyczne PNT (rodzina rodzajów scenariuszy)

seg-6dea687b727b = { "2" } rodzaje scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-d019c8511f48 = Strony tematyczne: <a1>OPTICAL-ATMOSPHERE</a1>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a2>KINDS.md</a2>.

seg-b8f937411028 = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Optyczne PNT

seg-76131e6805e5 = Optyczne PNT przez atmosferę MODELLED: dla łącza optycznego i zestawu stanowisk naziemnych z podanym klimatem zachmurzenia raportuje zależne od długości fali i elewacji tłumienie w czystym powietrzu (widzialność Kim

seg-55725043f48e = Heterogeniczny łączny wskaźnik jakości optycznego i RF PNT MODELLED (P5): składa dwukierunkowy budżet łącza optycznego { "1550" } nm (ograniczony fotonami dolny kres Craméra-Rao dwukierunkowego pomiaru odległości σ_τ/√N i ślad dyfrakcyjny λ/D·odległość), a

seg-5e658f01d9f4 = HETEROGENICZNY (etykieta wyniku)

seg-750466e3188c = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-9e3ce423c0b9 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>optical-atmosphere</a1>.

seg-93f5d0527850 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>, <c36/>, <c37/>, <c38/>, <c39/>, <c40/>, <c41/>, <c42/>, <c43/>.

seg-6a6f8eea5767 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>hybrid-optical-rf</a1>.

seg-a4baaf1fbb8c = <s1>Poprzedni</s1>Analiza misji, łącza i operacje kosmiczne

seg-48792381ba0b = <s1>Następny</s1>Nawigacja użytkownika w przestrzeni kosmicznej

seg-a878d9be65b7 = MODELLED optyczne PNT przez atmosferę: dla łącza optycznego i zbioru stacji naziemnych o podanych klimatach chmurowych podaje zależną od długości fali i elewacji stratę w czystym powietrzu (prawo widzialności Kima plus Rayleigh), stan turbulencji Hufnagela-Valleya (wariancja Rytova, wskaźnik scyntylacji, parametry gamma-gamma, uśrednianie apertury), zależną od pogody dostępność względem zapasu łącza (głębokość optyczna chmur z logarytmiczno-normalnego klimatu wody ciekłej, ekstynkcja w optyce geometrycznej, niezależny zanik turbulencyjny), zapas łącza potrzebny dla docelowych dostępności, rozkład czasu trwania przerw, narastanie błędu czasu i odległości przy każdej przerwie według modelu holdover zegara, dostępność dywersyfikacji stacji skorelowaną odległością oraz zyski w scenariuszach „co by było, gdyby” dla technik ulepszania (długość fali, apertura odbiorcza, redukcja scyntylacji optyką adaptacyjną, dodatkowy zapas). VALIDATED jako implementacja podanych wzorów względem niezależnej wyroczni mpmath: wariancja Rytova, wskaźnik scyntylacji, prawdopodobieństwo zaniku gamma-gamma, współczynnik uśredniania apertury, głębokość optyczna chmur i czystego powietrza. MODELLED: każde wejście dotyczące pogody, techniki i zegara oraz założenia niezależności i kopuły; nie porównano żadnego zmierzonego zapisu dostępności. Analiza wyłącznie doradcza, a nie produkt dostępności ani nawigacji objęty certyfikacją.

seg-4e2b759aff17 = Wykres zapisany przez silnik dla scenarios/optical-atmosphere-network.toml, rodzaj optical-atmosphere

seg-22449071fb11 = <s1>Poprzednia</s1>Wątki misji
