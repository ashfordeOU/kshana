# docs--kinds-lunar-and-cislunar: translations (pl)

seg-6e0cb6acc073 = VALIDATED

seg-b03d56f501c3 = Rodzaj

seg-f994c81583bf = Test niezależnego estymatora MODELLED dla progu obserwowalności długości łuku cislunarnego. Ten próg jest odczytem RANGI macierzy obserwowalności zbudowanej z ANALITYCZNYCH wierszy jakobianu odległości i ANALITYCZNEJ wariacyjnej macierzy przejścia stanu, a jego kontrola krzyżowa filtrem w postaci pierwiastka informacji składa te same wiersze — jest to kontrola spójności między dwiema maszynami numerycznymi, a nie potwierdzenie. Ten rodzaj dostarcza brakującego arbitra: estymator wsadowy metodą najmniejszych kwadratów, który faktycznie ODZYSKUJE stan początkowy statku głównego z symulowanych pomiarów, z pochodnymi cząstkowymi pomiarów wziętymi jako RÓŻNICE SKOŃCZONE CENTRALNE złożonego modelu w przód. Nie wywołuje żadnego analitycznego wiersza jakobianu, żadnej wariacyjnej STM, żadnego rozkładu według wartości osobliwych ani własnych, żadnej tolerancji rangi i żadnego filtra w postaci pierwiastka informacji — strażnik tekstu źródłowego w tests/cislunar_arc_recovery_reference.rs sprawia, że można to wyegzekwować — podczas gdy dynamika (ten sam przepływ RK4 CR3BP), warunki początkowe (ta sama konstelacja skorygowana różniczkowo), skalarna wielkość obserwowana i siatka epok są celowo wspólne i nazwane w emitowanym bloku <c1/>, ponieważ dwie analizy jednego problemu fizycznego muszą zgadzać się co do fizyki, aby były porównywalne. Dwa kryteria, każde przeglądane w pięciu dekadach własnej granicy: ODZYSKANIE BEZ SZUMU (końcowy błąd stanu każdej próby z ziarnem co najwyżej recovery_factor razy jej przemieszczenie a priori — odpowiednik rangi, bez tolerancji wartości osobliwych) oraz OSZACOWYWALNOŚĆ MONTE CARLO (zmierzony błąd pozycji RMS dla zespołu szumu z ziarnem poniżej podanej granicy — odpowiednik oszacowywalności, zmierzony, a nie przewidziany). Obsługuje planarny stan czteroelementowy i przestrzenny sześcioelementowy, rodziny DRO / halo L2 / NRHO L2, obserwable odległości i prędkości zmiany odległości oraz parametryzację biegunową wokół Księżyca, w której transformację stosuje się do STANU, a model w przód jest tam różniczkowany ponownie. MEASURED na opublikowanej planarnej siatce DRO: estymator odzyskuje stan czteroelementowy od { "0.782609" } h wobec { "2.086957" } h według kryterium rangi przy rel_tol { "1e-6" } (stosunek { "0.375" }) — próg rangi NIE jest potwierdzony jako granica odzyskiwalności — podczas gdy zmierzona granica oszacowywalności trafia w tę samą komórkę siatki co formalna, { "5.739130" } h, a zmierzona krzywa błędu odtwarza formalne 1-sigma w { "21" } długościach łuku ze średnim geometrycznym stosunkiem { "0.98" }. MODELLED: projekt konstelacji, siatka epok, pojedyncze śledzone łącze, wielkość przemieszczenia, sigma pomiaru i dwie podane granice. To nie jest certyfikowany produkt do oceny osiągów nawigacyjnych.

seg-2fe411ae2153 = Wykres zapisywany przez silnik dla scenarios/cislunar-arc-recovery.toml, rodzaj cislunar-arc-recovery

seg-7ccd0a3babb8 = Obserwowalność planarnej konstelacji cislunarnej MODELLED (P6): śledzi czterostatkową konstelację planarnych DRO skorygowanych różniczkowo z pomiarem odległości międzysatelitarnej i podaje, jaka część czteroelementowego stanu statku [x,y,ẋ,ẏ] staje się obserwowalna na danym łuku. Emituje ({ "1" }) tabelę rangi względem długości łuku dla pojedynczego łącza tylko odległościowego — chwilowo o randze 1, rosnącej ku pełnemu stanowi czteroelementowemu w miarę wydłużania łuku (P6 tabela { "1" }); ({ "2" }) widmo wartości własnych gramianu obserwowalności i liczbę uwarunkowania na łuku; ({ "3" }) porównanie chwilowej rangi tylko odległości i odległości z prędkością zmiany odległości (dźwignia projektowa Dopplera) wraz z raportowaniem GDOP osobliwego dla samej odległości i określonego dla odległości z prędkością; oraz ({ "4" }) niezależną walidację krzyżową SRIF, której kowariancja a posteriori staje się skończona / dobrze uwarunkowana dokładnie na łuku, na którym obserwowalna ranga osiąga cztery. Rdzeń VALIDATED: obserwowalna ranga jest progiem wartości osobliwych ujawniającym rangę, sprawdzonym krzyżowo z rangą z wartości własnych gramianu; widmo wartości własnych spełnia niezmienniki spektralne (ślad=Σλ, wyznacznik=Πλ, Frobenius²=Σλ²); wariacyjna STM jest STM CR3BP sprawdzoną względem niezależnego wzorca różnicami skończonymi; wiersze jakobianu odległości / prędkości zmiany odległości są analitycznymi pochodnymi cząstkowymi sprawdzonymi względem niezależnego wzorca różnicami skończonymi (sprawdzonymi krzyżowo z obserwablą 3-D prędkości zmiany odległości w crate); cztery warunki początkowe to planarne DRO skorygowane różniczkowo, które domykają się do ciasnej reszty okresowości i są wsteczne; przejście rangi jest zwalidowane krzyżowo z filtrem w postaci pierwiastka informacji w crate (kowariancja a posteriori skończona dokładnie przy pełnej randze, cond(P)=cond(OᵀO)); migawka o niepełnej randze jest oznaczana jako GDOP-undefined (fim condition=inf), nigdy jako fałszywa wartość skończona — ta sama ochrona przed osobliwą geometrią, którą stosuje pvt::solve_spp. MODELLED: projekt konstelacji (amplitudy i fazy perilunium DRO) oraz konkretny przebieg rangi, który z niego wynika. To nie jest certyfikowany produkt do oceny osiągów nawigacyjnych.

seg-f15bbf30b0dd = Wykres zapisywany przez silnik dla scenarios/cislunar-observability.toml, rodzaj cislunar-observability

seg-c8a8be4b8894 = Odbiór Earth-GNSS w odległości księżycowej, warstwa słabego sygnału, którą wymienia artykuł o odporności na konflikt i dla której silnik nie miał modelu. Satelita GNSS kieruje antenę ku Ziemi; odbiornik w pobliżu Księżyca znajduje się około piętnaście razy dalej niż promień orbity, więc działają jednocześnie trzy rzeczy. Ziemia ZASŁANIA OŚ GŁÓWNĄ: z { "26,560" } km rozpina półkąt { "13.9" } deg, więc każdy promień biegnący ku Księżycowi musi opuścić nadajnik co najmniej tyle poza nadirem, co usuwa szczyt wiązki, zanim zostanie obliczona jakakolwiek moc. To, co zostaje, to KRAWĘDŹ GŁÓWNEGO LISTKA I LISTKI BOCZNE, reżim, w którym ładunek LuGRE faktycznie pracował w { "2025" }. A strata w wolnej przestrzeni wynosi około { "208" } dB na L1, czyli mniej więcej { "25" } dB więcej niż płaci użytkownik naziemny. Raport podaje jeden wiersz na satelitę (kąt poza osią, zasłonięcie przez Ziemię, odległość, tłumienie na drodze, wzmocnienie nadawcze pod tym kątem, moc odebrana, stosunek nośnej do gęstości szumu) i agreguje tylko łącza przekraczające próg śledzenia. PODAJE TAKŻE UWARUNKOWANIE, ponieważ to właśnie określa tę warstwę: każdy widoczny satelita leży wewnątrz stożka o szerokości kilku stopni widzianego z Księżyca, więc linie widzenia są niemal równoległe, rozmycie dokładności jest ogromne, a rozwiązanie Earth-GNSS w odległości księżycowej jest obserwacją klasy SYNCHRONIZACJI CZASU znacznie bardziej niż klasy pozycji. MODELLED, a powodem jest wzorzec nadawczy: wzmocnienie pod danym kątem to jednorodna apertura kołowa (Airy), podczas gdy rzeczywista antena GPS L1 jest dwunastoelementową szyką helikalną z ukształtowanym listkiem głównym i listkami bocznymi innymi niż Airy. Zmierzone wzorce istnieją i nie są tutaj dołączone, więc kolejności i rzędy wielkości są znaczące, a dB pojedynczego satelity nie jest. Celowo NIEOBECNE, każde z nich czyni bilans optymistycznym: brak strat jonosferycznych i troposferycznych na promieniach ślizgających się po limbie, brak strat polaryzacji, celowania i implementacji oraz sferyczna Ziemia bez rozszerzenia refrakcyjnego. Położenie Księżyca jest DANĄ WEJŚCIOWĄ (odległość plus kierunek inercjalny), a nie wyszukaniem w efemerydach, ponieważ testowaną wielkością jest łącze i geometria wiązki. Podniesienie tego wiersza do poziomu sprawdzonego względem niezależnego wzorca wymaga zmierzonego wzorca nadawczego i punktów normalnych LuGRE; żadne z nich nie ma się w repozytorium i żadne nie jest tutaj zmyślone.

seg-cf1dce5fc824 = Wykres zapisywany przez silnik dla scenarios/earth-gnss-lunar.toml, rodzaj earth-gnss-lunar

seg-4e31c8daf798 = Rejestr (ledger)

seg-efd15cff3d32 = MODELLED (etykieta wyniku)

seg-06f082922143 = MODELLED { "2" } · VALIDATED { "3" }

seg-02706b96f8fa = MODELLED { "3" } · VALIDATED { "2" }

seg-a240ef37dc6d = Źródło: <c1/>

seg-befef5f2f8dd = Księżyc i przestrzeń cislunarna (rodzina rodzajów scenariuszy)

seg-f964724ea446 = { "20" } rodzajów scenariuszy silnika v{ $version }. Wyłącznie doradczo: wynik analizy z narzędzia badawczo-inżynieryjnego; nie jest to sprzęt nawigacyjny z zatwierdzeniem typu ani usługa bezpieczeństwa życia. Każda etykieta tutaj pochodzi z silnika lub z macierzy weryfikacji; rodzaj ma status MODELLED, chyba że macierz stanowi inaczej (jak zdobywa się etykietę: sekcja Evidence w README).

seg-369e7cfcc1d3 = Strony tematyczne: <a1>LUNAR-REFERENCE-STATION</a1>, <a2>LUNAR-INFRASTRUCTURE</a2>, <a3>LUNANET-AFS</a3>. Uruchom jeden: <c1/>. Wszystkie rodziny: <a4>KINDS.md</a4>.

seg-15b8e26dc24b = Arkusz miniatur wykresów zapisywanych przez silnik dla rodzajów z rodziny Księżyc i przestrzeń cislunarna

seg-fd2a12be04c2 = Przebieg poziomu ochrony ARAIM przy biegunie południowym Księżyca względem reprezentatywnego zestawu przekaźników LunaNet.

seg-240eb5858113 = Modelowane relatywistyczne tempo zegara Ziemia–Księżyc (czas współrzędnych księżycowych, LTC/TCL): wiekowe tempo LTC−TT z różnicy potencjału własnego i członu kinetycznego Księżyca, podane z opublikowanym { "56" }–{ "59" }

seg-177bff8d753e = Kompleksowy budżet błędu czasu skoordynowanego czasu księżycowego (LTC) MODELLED: siedem składników błędu LTC złożonych jako krzywe błędu czasu x_i(τ) na całej siatce czasów uśredniania, zsumowanych pierwiastkowo do x_Σ(τ), oraz

seg-df0437ef8324 = Modelowana obserwabla opóźnienia geodezyjnego VLBI dla Księżyca: ziemska baza (dwie stacje naziemne, GCRS) obserwuje jednokierunkowy sygnał z latarni na powierzchni Księżyca klasy NovaMoon.

seg-528223b4d676 = MODELLED { "3" } · VALIDATED { "3" }

seg-38254487fb7f = Kowariancja współrzędnych stacji lunar-vlbi: pochodne cząstkowe opóźnienia obserwabli lunar-vlbi zsumowane po jawnym HARMONOGRAMIE (bazy x epoki) do macierzy informacyjnej Fishera, odwrócone i

seg-23706714da99 = Modelowany łączny wielotechnikowy estymator wsadowy orbity księżycowej i zegara na SYMULOWANEJ sieci: dopasowanie migawkowe Gaussa-Newtona, które łączy opóźnienia geodezyjnego VLBI na ziemskiej bazie, lokalne na Księżycu odległości stacja↔satelita

seg-2359450b3967 = Modelowana realizacja księżycowego układu odniesienia: dopasowanie datum 7-parametrowego (podobieństwa) Helmerta — { "3" } przesunięcia, { "3" } obrotów o małych kątach, { "1" } skala — wiążące estymowany zestaw punktów MCMF wywiedzionych selenograficznie

seg-2a5af9961e99 = Siedmioparametrowe datum układu odniesienia (podobieństwa) Helmerta wyznaczane przez SYMULOWANĄ KAMPANIĘ OBSERWACYJNĄ, a nie przez wstrzyknięte przekształcenie.

seg-3615bea1ea75 = Siedmioparametrowe księżycowe datum układu odniesienia Helmerta wyznaczane przez RZECZYWISTĄ, ZARCHIWIZOWANĄ kampanię obserwacyjną, a nie symulowaną.

seg-5413116b8b42 = Modelowana analiza objętości usługi nawigacyjnej na Księżycu na podstawie konstelacji na orbicie księżycowej klasy Moonlight/LCNS, ILLUSTRATIVE, ze źródeł publicznych (niepowiązanej z ESA): przeszukuje siatkę szerokości/długości selenograficznej nad

seg-a0e202b3566c = Modelowany księżycowy RÓŻNICOWY PNT (odpowiednik księżycowego DGNSS/SBAS): stacja referencyjna klasy NovaMoon w ZNANEJ lokalizacji selenograficznej oblicza dla każdego satelity poprawki różnicowe z ILLUSTRATIVE

seg-ed4ec8b6378c = Modelowane pokrycie stacji referencyjnej na Księżycu: przegląd Monte Carlo księżycowego modelu różnicowego PNT po siatce użytkowników na biegunie południowym i dobie epok.

seg-aeec32be6092 = Wspomaganie księżycowej orbitalnej usługi nawigacyjnej latarniami powierzchniowymi, w postaci uruchamialnej tabeli przed/po.

seg-b28693368acd = Modelowany księżycowy eksport interoperacyjny: emituje księżycowy układ odniesienia, księżycową skalę czasu i księżycowe efemerydy w formach wymiany zgodnych z LunaNet/IOAG, opartych na CCSDS, z kontrolą w obie strony / pól

seg-d88605893c05 = Obserwowalność planarnej konstelacji cislunarnej MODELLED (P6): śledzi czteroSatelitarną konstelację planarnych DRO z korekcją różnicową z pomiarem odległości między satelitami i raportuje, jaka część

seg-8eaec90d1df5 = Test niezależnym estymatorem progu obserwowalności długości łuku cislunarnego MODELLED.

seg-9619b3d699c6 = Powierzchnia ataku na bezpieczeństwo sygnału nawigacji powierzchniowej na Księżycu (P1): składa otwarte analizy bezpieczeństwa sygnału w jeden przebieg osiągalny z binarki.

seg-64c78e211181 = Natywne księżycowe zagłuszanie RF: stosunek zagłuszacza do sygnału dla każdego satelity, efektywne C/N₀ i utrata zaczepu dla użytkownika na powierzchni Księżyca (selenograficznego) przy zagłuszaczu na powierzchni (lub podniesionym), dla ilustracyjnej publicznej

seg-df68720ee7a5 = Odbiór ziemskiego GNSS na odległości księżycowej, warstwa słabych sygnałów, którą wskazuje artykuł o odporności na konflikt, a dla której silnik nie miał modelu.

seg-e6475fe9f443 = Badania MODELLED orbity i powierzchni Księżyca jako infrastruktury nawigacyjnej i geodezyjnej, pięć badań w jednym rodzaju wybieranych przez <c1/>: od-consistency (pokładowe wyznaczanie orbity z ziemskiego GNSS w

seg-ca4fac406beb = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>.

seg-da20b48985b9 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-integrity</a1>.

seg-564b491c4bb8 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>.

seg-0f0b2d0ca0b4 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-time-offset</a1>.

seg-128bf57a76d1 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-d6aa5d645fb7 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-time-budget</a1>.

seg-79140f2544ea = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>.

seg-de468e4d4b46 = <b>Rejestr (ledger):</b> MODELLED { "3" } · VALIDATED { "3" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-vlbi</a1>.

seg-7da3c3ff2386 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>.

seg-3119d4005897 = <b>Rejestr (ledger):</b> MODELLED { "3" } · VALIDATED { "2" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-vlbi-fim</a1>.

seg-6f59a33a35b3 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-142f2253e4d6 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-joint-od-clock</a1>.

seg-32c31af24e1b = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-73c0415efd2f = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-frame-realisation</a1>.

seg-96efcb8d55d1 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>.

seg-ce2f0f85dda4 = <b>Rejestr (ledger):</b> MODELLED { "2" } · VALIDATED { "3" }. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-frame-campaign</a1>.

seg-d9e24a9a8c0c = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-4f05fad4b146 = <b>Rejestr (ledger):</b> VALIDATED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-llr-datum</a1>.

seg-8d9e0277303e = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>.

seg-204901ae3684 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>moonlight-service-volume</a1>.

seg-6fe67fa619d0 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-c83350735643 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-differential-pnt</a1>.

seg-facc442295f1 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>, <c29/>, <c30/>, <c31/>, <c32/>, <c33/>, <c34/>, <c35/>.

seg-8a2f6f535c4a = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-station-coverage</a1>.

seg-a790c54ac1aa = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>.

seg-4efffcd615df = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-beacon</a1>.

seg-720d0bbeaf6e = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-019ca0f1051e = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-interop-export</a1>.

seg-28695dd2ecc3 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>.

seg-af5d871bc69e = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>cislunar-observability</a1>.

seg-f646e9fd7553 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>.

seg-5e7bd8bb1adf = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>cislunar-arc-recovery</a1>.

seg-3c514f3acc78 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>, <c27/>, <c28/>.

seg-00b06a4fc0e0 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-attack-surface</a1>.

seg-079d2bb805f1 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-63d4157e2294 = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-jamming</a1>.

seg-7bb977529f30 = Pola wymagane: brak. Opcjonalne: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>.

seg-287f89e6bf6b = <b>Rejestr (ledger):</b> MODELLED. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>earth-gnss-lunar</a1>.

seg-f7ed8b60e7d1 = Pola wymagane: <c1/>. Opcjonalne: <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>.

seg-41e50e49da99 = <b>Rejestr (ledger):</b> żaden wiersz macierzy nie wymienia tego rodzaju; silnik sam oznacza swój wynik. Pełna strona z danymi wejściowymi, wynikami, dowodami i ograniczeniami: <a1>lunar-infrastructure</a1>.

seg-09f7f99d04a6 = <s1>Poprzedni</s1>Nawigacja z niskiej orbity okołoziemskiej

seg-74c6bf83988e = <s1>Następny</s1>Analiza misji, łącza i operacje kosmiczne
