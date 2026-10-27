# docs--concepts: translations (pl)

seg-501402fc366f = Holdover zegara

seg-9c0eb89a2fbe = Pakiet

seg-41b3740e1db9 = Źródło: <c1/>

seg-8ab3fd09812d = Pojęcia — przystępne wprowadzenie

seg-0f86d0a815d2 = Ta strona wyjaśnia, <em>co robi { -brand } i dlaczego</em>, zaczynając od zera i dochodząc do fizyki. Do pierwszej części nie jest potrzebna żadna wiedza wstępna; późniejsze sekcje dodają dokładne zależności dla specjalistów. Definicje poszczególnych słów znajdziesz w <a1>słowniku</a1>.

seg-34f76bad58cb = { "1" }. Problem w jednym akapicie

seg-45c0199e2224 = Prawie wszystko, co musi wiedzieć, <em>gdzie jest</em> lub <em>jaki jest czas</em> — telefony, samoloty, statki, satelity, sieci energetyczne, systemy finansowe — opiera się na sygnałach satelitów nawigacyjnych (GPS (Global Positioning System) i jego pokrewnych, łącznie <b>GNSS</b> (globalny system nawigacji satelitarnej)). Te sygnały są słabe i łatwo je utracić: zagłuszone, zablokowane albo po prostu poza zasięgiem widzenia w kosmosie. Wtedy system musi <b>radzić sobie samodzielnie</b>, korzystając z czujników pokładowych — zegara do utrzymania czasu i czujników inercyjnych do śledzenia ruchu. Pytanie, na które odpowiada { -brand }, jest proste do sformułowania i trudne do zmierzenia: <b>jak długo i jak dobrze system może sobie radzić?</b>

seg-ea1895772e76 = { "2" }. Dlaczego „kwantowy”?

seg-dd6871645f37 = Czujniki pokładowe dryfują. Zegar powoli traci czas; czujnik inercyjny powoli traci orientację co do pozycji. <b>Kwantowe</b> zegary i czujniki inercyjne dryfują <em>znacznie wolniej</em> niż stosowane dziś części klasyczne — pojazd mógłby więc przetrwać znacznie dłuższą przerwę w GNSS, mieszcząc się w granicach dokładności. Ta przewaga jest całą obietnicą kwantowego PNT (pozycjonowanie, nawigacja i czas). Ale „znacznie wolniej” trzeba zamienić na <b>liczby</b>: ile dodatkowych minut holdover? o ile metrów mniejszy dryf? Te liczby rozstrzygają, czy kwantowy ładunek jest wart swojego kosztu, masy i mocy.

seg-a5d9dc0fb159 = { "3" }. Co właściwie robi { -brand }

seg-cb3a35ba696f = { -brand } jest <b>symulatorem</b>, a nie sprzętem ani projektem sprzętu. On:

seg-cb7fdaf6738b = Przyjmuje <b>scenariusz</b> — oś czasu z odcinkiem przerwy w GNSS i opublikowanymi parametrami czujnika.

seg-701c8c6d0e55 = Prowadzi <b>model błędów czujnika</b> przez tę oś czasu: gdy GNSS jest dostępny, model jest dyscyplinowany względem wartości prawdziwej; podczas przerwy działa swobodnie, kumulując błąd dokładnie tak, jak wymaga tego fizyka.

seg-bc68e3d54e4c = <b>Ocenia</b> wynik względem operacyjnych wskaźników jakości (jak duży staje się błąd, jak długo mieści się w specyfikacji, jak wiarygodna jest estymata).

seg-32d31a9beb71 = Dla pakietów czujników robi to <b>dwukrotnie</b> — raz dla czujnika kwantowego, raz dla jego klasycznego odpowiednika — w <em>tym samym</em> scenariuszu, aby porównanie było uczciwe.

seg-07d8c6eb84e9 = Co istotne, silnik nic nie wie o „kwantowym” i „klasycznym”. Oba są po prostu modelami błędów z innymi (opublikowanymi, cytowanymi) parametrami. Różnica widoczna w wyniku jest różnicą w opublikowanej fizyce — nic nie jest ręcznie dostrajane na korzyść jednej strony.

seg-e20a7d3f32dc = { "4" }. Cztery bloki budulcowe („pakiety”)

seg-638b8d451550 = Czujnik

seg-f891ee876b96 = Na co odpowiada

seg-d1b122c389d4 = zegar atomowy

seg-768230c2eb02 = Jak długo <em>czas</em> pozostaje dokładny bez GNSS?

seg-029de6b99be0 = Nawigacja zliczeniowa inercyjna

seg-f66f2d7b1d6d = akcelerometr (+ żyroskop)

seg-e067a035f656 = Jak szybko dryfuje <em>pozycja</em> bez GNSS?

seg-9ef8f99ca6e4 = Transfer czasu

seg-1267f82791f9 = łącze optyczne / RF (radio-frequency, radiowe)

seg-6f240700790d = Jak precyzyjnie dwa pojazdy mogą współdzielić czas?

seg-90be2a6a29b1 = Fuzja hybrydowa

seg-780cf1f1127e = wszystko powyższe

seg-6080a05ace19 = Czy <em>łączne</em> rozwiązanie PNT się utrzymuje?

seg-3f74a708a746 = Pakiet hybrydowy to puenta: rozwiązanie nawigacyjne potrzebuje <em>zarówno</em> dobrego czasu, <em>jak i</em> dobrej pozycji. Pokazuje, że łącze optyczne do synchronizacji może utrzymać w synchronizacji nawet przeciętny zegar — co sprawia, że najsłabszym ogniwem staje się czujnik <b>inercyjny</b>, i właśnie tam opłaca się kwantowy akcelerometr.

seg-5f55bb0fd7c5 = Poza czterema pakietami

seg-60191a2cd150 = Ten sam silnik uruchamia wiele innych <em>rodzajów</em> scenariuszy; <c1/> wymienia je wszystkie. Sięgają one poza czujniki, do sygnałów i geometrii, od których czujniki zależą:

seg-995ed414d83d = <b>Gdzie są satelity</b> — propagacja orbit, projektowanie konstelacji wokół Ziemi, Księżyca lub innego ciała oraz pozycje ciał Układu Słonecznego.

seg-bc8abce2a748 = <b>Co widzi odbiornik</b> — zależny od azymutu horyzont (ulica, nabrzeże, fiord) ponad maską elewacji oraz geometria nieba, którą on pozostawia: satelity w zasięgu widzenia, ich współczynnik DOP (rozmycie dokładności) i elipsa błędu.

seg-b7a2c252c41c = <b>Co słyszy odbiornik</b> — widmo pasma L pod wpływem zagłuszacza, zagłuszanie (jamming) i spoofing oraz utrata synchronizacji pętli śledzących.

seg-f354743045c4 = <b>Czy odpowiedzi można ufać</b> — monitorowanie integralności (RAIM, receiver autonomous integrity monitoring, i jego rozszerzona postać ARAIM) z poziomami ochrony.

seg-69aa01a29a49 = <b>Alternatywy dla GNSS</b> — dopasowanie do map grawitacyjnych i terenowych oraz pozycjonowanie, nawigacja i czas z satelitów niskiej orbity okołoziemskiej (LEO), od projektu sygnału przez bilans łącza i komunikat nawigacyjny po wyznaczenie pozycji.

seg-297c98214b5b = <b>Synchronizacja czasu dla sieci</b> — holdover w telekomunikacji sprawdzany względem międzynarodowych masek oraz synchronizacja szczelin czasowych dla harmonogramów indeksowanych czasem.

seg-7eba216a9bf2 = <b>Poza Ziemią</b> — czas i układy odniesienia na Księżycu, objętości usług księżycowych oraz nawigacja przekaźnikowa na Marsie.

seg-b796f49570ed = <b>Wiele przebiegów naraz</b> — kampanie łączą rodzaje na jednej osi czasu, przeglądają parametr lub uruchamiają zbiór Monte Carlo.

seg-ef7f4e025018 = { "5" }. Rzetelność z założenia

seg-65fb8703baf9 = Symulator jest użyteczny tylko wtedy, gdy można mu zaufać. { -brand } jest zbudowany tak, abyś mógł to zrobić:

seg-de8fd160db6d = <b>Każdy parametr jest cytowany.</b> Każda wartość czujnika zawiera ciąg <c1/> wskazujący kartę katalogową lub artykuł, z którego pochodzi. Żadnych anonimowych stałych.

seg-09d5cd11b127 = <b>Każdy model jest sprawdzany względem zależności podręcznikowej,</b> a nie tylko względem siebie — na przykład odchylenie Allana symulowanego zegara musi zgadzać się z opublikowaną stabilnością, a dryf inercyjny ze standardowym prawem narastania błędu. Możliwość nazywa się <em>sprawdzoną względem niezależnego wzorca zewnętrznego</em> (validated) tylko wtedy, gdy zgadza się z nią niezależna zewnętrzna wyrocznia (rzeczywisty zbiór danych, niezależna implementacja lub opublikowane wektory odniesienia); reszta jest <em>obliczona na podstawie modelu</em> (modelled), a <a1>macierz weryfikacji</a1> mówi, co jest czym.

seg-ccb5b2fe93c4 = Dojrzałość jest oznaczana.

seg-5a0ac98febed = <a1>VALIDATION.md</a1> oznacza każdy efekt jako <c1/>, <c2/> lub <c3/> i wprost stwierdza, że dane zegarów optycznych to liczby <em>laboratoryjne / z celów kosmicznych</em> — żaden optyczny zegar strontowy nie poleciał w kosmos.

seg-de463596fcdb = <b>Wyniki są odtwarzalne co do bitu:</b> ten sam scenariusz, ziarno (seed) i wersja zawsze dają identyczną odpowiedź na tej samej platformie; między systemami operacyjnymi wartości zgadzają się z błędem względnym { "1e-6" } (zob. <a1>REPRODUCIBILITY.md</a1>).

seg-f87dad1ffc98 = { "6" }. Fizyka, dla specjalistów

seg-8fc6db9faf83 = Zależności, które { -brand } implementuje i testuje (pełne szczegóły i tolerancje w <a1>VALIDATION.md</a1>):

seg-ea61f869c266 = <b>Holdover zegara.</b> Dwustanowy model fazy i częstotliwości z białym szumem modulacji częstotliwości (white FM, widmowa gęstość mocy <c1/>), błądzeniem losowym FM (<c2/>), szumem migotania FM (suma procesów Ornsteina–Uhlenbecka rozmieszczonych logarytmicznie, skalibrowanych do płaskiego dna Allana) oraz deterministycznym starzeniem. Sprawdzone względem niezależnego wzorca przez nakładające się odchylenie Allana względem opublikowanego <c3/> (Riley, NIST (National Institute of Standards and Technology) SP (Special Publication) { "1065" }).

seg-4f46754c399f = <b>Nawigacja zliczeniowa inercyjna.</b> Resztkowe obciążenie akcelerometru → <c1/>; błądzenie losowe prędkości → <c2/>; opcjonalne obciążenie żyroskopu i kątowe błądzenie losowe dają błąd przechyłu, który sprzęga grawitację (<c3/>) z przyspieszeniem poziomym (Groves).

seg-d59595d00f0a = <b>Transfer czasu.</b> Biały jitter czasu → precyzja synchronizacji → pomiar odległości w jedną stronę (<c1/>, { "1" } ps ≈ { "0.3" } mm); średnia z próbek uśrednia się jak <c2/>.

seg-0eb7a53fb4a6 = <b>Fuzja i integralność.</b> Dwustanowy filtr Kalmana, którego szum procesu odpowiada modelowi prawdy; w dryfie jego wariancja błędu fazy rośnie dokładnie do <c1/> — analitycznej zależności holdover — a jego granica 1-σ zasila wskaźnik jakości Integralności.

seg-80daa7cb8641 = <b>Geometria.</b> Keplerowska propagacja dwóch ciał (opcjonalnie z wiekowym J2) lub SGP4 (Simplified General Perturbations { "4" }) z rzeczywistych zestawów elementów dwuwierszowych, konstelacje Walkera i widoczność w linii wzroku (zasłonięcie przez Ziemię + maska elewacji) wyprowadzają dostępność GNSS z geometrii orbit, a nie z ręcznie ustalonych okien.

seg-4ce4c6b79b93 = { "7" }. Dokąd dalej

seg-7c8344a26230 = Przerób to: <a1>samouczki</a1> — trzy przykłady krok po kroku + ćwiczenia o rosnącej trudności.

seg-277f1b435cf6 = Uruchom: zob. krótki start w <a1>README</a1>.

seg-c349981bd4f1 = Zrozum strukturę: <a1>ARCHITECTURE.md</a1>.

seg-f7acbf857c57 = Sprawdź, co jest, a co nie jest sprawdzone względem niezależnego wzorca: <a1>VALIDATION.md</a1>.

seg-04a86ea674a5 = Sprawdź pojęcie: <a1>GLOSSARY.md</a1>.

seg-4a73b906888b = <s1>Poprzednia</s1>Przegląd

seg-2f14e84bfc99 = <s1>Następna</s1>Słownik
