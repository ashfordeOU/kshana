# docs--glossary: translations (pl)

seg-daf25c6479c1 = Standardy

seg-c851aa23ea42 = wartości rozdzielane przecinkami

seg-366c59b03b4f = CSV

seg-cb273d6705c6 = SVG

seg-49a994d77d2f = kwarcowy oscylator z kompensacją temperaturową

seg-1bac97ee312a = rubidowy wzorzec częstotliwości atomowy

seg-b09ffb8a9095 = Monte Carlo

seg-9939da5da283 = JSON

seg-5907283b71da = Skrót

seg-900c7c7e99cd = GMAT

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = błąd międzysystemowy

seg-7dabf60fd17e = QPN

seg-dae80c23262e = kwantowy szum projekcji

seg-430b3c681347 = RTKLIB

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-e464509f3abb = stosunek mocy nośnej do gęstości szumu

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = cyfrowy identyfikator obiektu

seg-d41af8f18aed = GLONASS

seg-1df73b95ae4d = IAU

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = Międzynarodowy Niebieski Układ Odniesienia

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Międzynarodowa Stacja Kosmiczna

seg-865e7d1794b6 = Secure Hash Algorithm, 256-bitowy

seg-8104773e1484 = STK

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrawysoka częstotliwość

seg-6ce4c2164aee = Źródło: <c1/>

seg-bee5d056ef03 = Przystępne definicje pojęć używanych w { -brand }. Każde hasło zaczyna się jednowierszowym „po prostu” i dodaje dokładne znaczenie tam, gdzie to pomaga. Skróty niezdefiniowane w sekcji znajdują się w tabeli od A do Z pod koniec, <a1>Wszystkie pozostałe skróty, od A do Z</a1>.

seg-f8c5433d1026 = Nawigacja i synchronizacja czasu

seg-2a42d84608ea = <b>PNT — pozycjonowanie, nawigacja i czas.</b> Wiedza, <em>gdzie</em> jesteś, <em>w którą stronę</em> zmierzasz i <em>która jest godzina</em> — z precyzją. Nowoczesne PNT pochodzi głównie z sygnałów satelitarnych (GNSS, globalne systemy nawigacji satelitarnej zdefiniowane dalej); { -brand } bada, co dzieje się z <em>czasem</em> i <em>pozycją</em>, gdy te sygnały zanikają.

seg-6227db2c94e1 = <b>GNSS — globalny system nawigacji satelitarnej.</b> Konstelacje satelitów dostarczające PNT: GPS (Global Positioning System, USA (Stany Zjednoczone Ameryki)), Galileo (UE), GLONASS (rosyjski Global Navigation Satellite System), BeiDou (Chiny). Odbiornik widzący ≥ { "4" } satelity może obliczyć pełne rozwiązanie pozycji 3D i czasu.

seg-f8eda357e640 = <b>Przerwa w GNSS / odmowa / pogorszenie / zagłuszanie (jamming).</b> Gdy sygnały satelitarne są niedostępne (zablokowane, zagłuszone lub poza zasięgiem widzenia). W czasie przerwy system musi „dryfować” na własnych czujnikach pokładowych. Całym celem { -brand } jest zmierzenie, jak dobrze sobie z tym radzi.

seg-a3ade199f465 = <b>Holdover.</b> Po prostu: <em>jak długo zegar potrafi utrzymać dobry czas samodzielnie po utracie GNSS.</em> Lepszy zegar wytrzymuje dłużej, zanim jego błąd przekroczy dozwolony próg.

seg-83b33c15312f = <b>Nawigacja zliczeniowa.</b> Po prostu: <em>szacowanie, gdzie jesteś, przez sumowanie zmierzonego ruchu, bez żadnego zewnętrznego odniesienia.</em> Błędy się kumulują, więc lepszy czujnik inercyjny dryfuje wolniej.

seg-da9bcc994b9c = <b>Specyfikacja / próg.</b> Maksymalny błąd, jaki wolno mieć, zanim rozwiązanie uzna się za „poza specyfikacją” — np. „czas musi mieścić się w { "20" } ns” lub „pozycja w { "100" } m”.

seg-6f37a60a30c7 = Czujniki, które porównuje { -brand }

seg-308b59d89586 = <b>Zegar (zegar atomowy).</b> Urządzenie odmierzające czas przez liczenie naturalnych drgań atomu. Tu dwa przykłady:

seg-3389d08be6bc = <b>CSAC — Chip-Scale Atomic Clock (zegar atomowy w skali układu scalonego).</b> Mały, wdrożony, komercyjny zegar (odniesienie „klasyczne”). Dobry, ale zauważalnie dryfuje podczas długiej przerwy.

seg-3e121d8e6400 = <b>Optyczny zegar sieciowy (np. strontowy).</b> Znacznie stabilniejszy zegar „kwantowy”; stan wiedzy w laboratoriach, jeszcze nie testowany w kosmosie.

seg-4daa6cdf8ae2 = <b>Akcelerometr.</b> Mierzy przyspieszenie (zmianę ruchu). Całkowany dwukrotnie daje pozycję — więc każdy błąd szybko rośnie. <b>Akcelerometr zimnoatomowy</b> to wersja kwantowa ze znacznie lepszą stabilnością długoterminową; <b>klasy nawigacyjnej</b> to wersja klasyczna.

seg-91793676c57c = <b>Żyroskop.</b> Mierzy obrót. Mały błąd obrotu przechyla platformę, co przenosi grawitację na kierunek poziomy i psuje estymatę pozycji.

seg-2d36110effc3 = <b>IMU — Inertial Measurement Unit (inercyjna jednostka pomiarowa).</b> Sam zestaw akcelerometrów i żyroskopów: po trzy osie każdego, raportujący siłę właściwą i prędkość kątową. Mierzy ruch; sam nie wie, gdzie jest.

seg-e3b6b40e0cd0 = <b>INS — Inertial Navigation System (inercyjny system nawigacji).</b> IMU plus „mechanizacja”, która całkuje jego wyjście do orientacji, prędkości i pozycji. INS jest tym, co prowadzi nawigację zliczeniową podczas przerwy w GNSS, a jego dokładność wyznaczają procesy błędów IMU wymienione niżej.

seg-a618ff7ee429 = <b>Transfer czasu.</b> Wysyłanie precyzyjnego sygnału czasu między dwoma miejscami (np. z satelity na satelitę). Łącza <b>optyczne</b> są znacznie precyzyjniejsze niż łącza <b>RF</b> (radiowe).

seg-847fbbeecfae = Jak modeluje się błędy (szum zegara)

seg-5cf197bdbbad = Błąd zegara składa się ze standardowych „rodzajów szumu”, z których każdy ma znaną sygnaturę:

seg-3806d1b1cb50 = <b>White FM (biała modulacja częstotliwości).</b> Po prostu: <em>szybki, losowy jitter tempa zegara.</em> Uśrednianie go poprawia się z czasem. Parametr <c1/>.

seg-0793fdd3abab = <b>Random-walk FM.</b> Po prostu: <em>tempo zegara powoli wędruje.</em> To dominuje w długich przerwach. Parametr <c1/>.

seg-42b74c8b88ff = <b>Flicker FM (szum 1/f).</b> Po prostu: <em>uparty poziom szumu, poniżej którego zegar nigdy nie uśrednia.</em> Jest płaski dla wszystkich czasów uśredniania. Parametr <c1/>.

seg-b3bd841a5a2d = <b>Starzenie / dryf.</b> Powolna, <em>przewidywalna</em> zmiana tempa w czasie; ponieważ jest przewidywalna, estymator { -brand } ją usuwa. Parametr <c1/>.

seg-d929960492e4 = <b>VRW — Velocity Random Walk (błądzenie losowe prędkości).</b> Odpowiednik białego szumu dla akcelerometru: losowe szarpnięcia prędkości, które narastają w błąd pozycji. Parametr <c1/>.

seg-4a97f8d14174 = <b>ARW — Angular Random Walk (kątowe błądzenie losowe).</b> Odpowiednik dla żyroskopu: losowe szarpnięcia orientacji. Parametr <c1/>.

seg-dcd03b326110 = Jak mierzy się stabilność

seg-2181832c6253 = <b>Odchylenie Allana (<c1/>).</b> Po prostu: <em>standardowy sposób podania, jak stabilny jest zegar przy danym czasie uśredniania <c2/>.</em> Karta katalogowa zegara podaje np. <c3/>. { -brand } sprawdza swój model zegara, obliczając odchylenie Allana własnego wyniku i sprawdzając, czy zgadza się z opublikowaną liczbą. (Źródło: Riley, NIST SP { "1065" } — National Institute of Standards and Technology Special Publication { "1065" }.)

seg-11cbe561e633 = <b>PSD — Power Spectral Density (widmowa gęstość mocy).</b> Jak moc szumu rozkłada się po częstotliwościach; formalny sposób określania szumu białego, błądzenia losowego i migotania.

seg-0737d620eb5f = Wskaźniki jakości (jak ocenia się przebieg)

seg-20b66e0d4809 = Sześć operacyjnych wskaźników jakości PNT, które raportuje { -brand } (zob. tabelę „Output” w README):

seg-b17d08246e49 = <b>FoM — Figure of Merit (wskaźnik jakości).</b> Jedna liczba oceniająca jeden aspekt przebiegu, podawana z jednostką i informacją, czy jest sprawdzona względem niezależnego wzorca, czy obliczona na podstawie modelu. Sześć poniższych to operacyjne FoM { -brand }.

seg-b229a69fb4ac = <b>Wydajność pozycjonowania / synchronizacji czasu</b> — wielkość błędu, jako RMS (pierwiastek ze średniej kwadratowej) i jako 95. percentyl.

seg-ba3ed5a28518 = <b>Autonomia</b> — czas holdover (jak długo mieści się w specyfikacji bez GNSS).

seg-13ecdd037098 = <b>Odporność</b> — jak szybko rośnie błąd po utracie GNSS.

seg-be0168f24d6e = <b>Dostępność</b> — ułamek przebiegu, w którym jest rozwiązanie mieszczące się w specyfikacji.

seg-44ef500b371d = <b>Integralność</b> — <em>czy można ufać własnej estymacie błędu systemu?</em> { -brand } podaje ułamek próbek z przerwy, dla których prawdziwy błąd mieści się w ochronnej granicy filtra.

seg-d1cc3819cde9 = <b>Bezpieczeństwo</b> — odporność na spoofing: oparty na stabilności zegara wskaźnik wykrywalności spoofingu (od { "v0.3.0" }), mający sens tylko wtedy, gdy skonfigurowano scenariusz ataku spoofingowego. To <em>nie</em> jest integralność klasy lotniczej: nie oblicza poziomu ochrony poziomego ani pionowego (HPL/VPL) i nie uruchamia autonomicznego monitorowania integralności przez odbiornik (RAIM), ani zwykłego, ani zaawansowanego. Te pochodzą z osobnych rodzajów scenariuszy integralności i ARAIM (zaawansowany RAIM) i są zdefiniowane niżej w „Integralność i wspomaganie”. Wrażliwe eksportowo.

seg-5cae59204d9e = Pojęcia używane obok wskaźników jakości:

seg-7adc0e49a981 = <b>Spoofing.</b> Po prostu: <em>fałszywy sygnał satelity, który kłamie o pozycji lub czasie.</em> Spoofer podaje odbiornikowi wiarygodną, ale błędną odpowiedź, co jest gorsze niż zagłuszanie, bo odbiornik może tego nie zauważyć.

seg-2d2e6cbeade6 = <b>1-DOF — jeden stopień swobody.</b> Pojedyncza oś. Błąd pozycji w pakiecie scenariuszy { -brand } jest jednoosiowy; pełna odpowiedź 3D wymaga modelu trzyosiowego.

seg-14a32d281c4b = <b>Zbiór Monte Carlo.</b> Uruchamianie tego samego scenariusza wiele razy z różnymi ziarnami (seed) i raportowanie rozrzutu wyników zamiast jednego przebiegu.

seg-fcbea49a3592 = <b>CI — przedział ufności.</b> Zakres, w którym statystyka ma się znaleźć z podanym prawdopodobieństwem (na przykład { "95" } %). W tabelach i plakietkach README „CI” częściej oznacza <b>ciągłą integrację</b> — automatyczny przebieg budowania i testów przy każdej zmianie; kontekst mówi, które.

seg-310abfd6a64c = <b>Granica k-sigma.</b> Granica ustawiona na <em>k</em> odchyleń standardowych własnej niepewności filtra; wskaźnik jakości Integralności liczy, jak często prawdziwy błąd mieści się w niej.

seg-ad26afbaa7b4 = <b>CEP / 2DRMS — okrągły błąd prawdopodobny / dwukrotna odległość pierwiastka ze średniej kwadratowej.</b> Dwa standardowe sposoby podawania dokładności poziomej 2D: CEP to promień zawierający { "50" } % rozwiązań; 2DRMS to dwukrotny poziomy błąd średniokwadratowy. Biblioteka potrafi obliczyć oba z kowariancji pozycji (<c1/>), ale żaden rodzaj scenariusza jeszcze ich nie raportuje.

seg-fd93c1effba8 = Czytanie wyniku: pojęcia w wyjściu

seg-3432498093cf = To są nazwy, które spotkasz w pliku wyniku lub podsumowaniu placu zabaw, najpierw po prostu.

seg-099bf2eb4602 = <b>Holdover (<c1/>).</b> Po prostu: <em>ile sekund system mieścił się w swoim limicie błędu po utracie GNSS.</em> { -brand } podaje najkrótszy taki dryf spośród wszystkich przerw w przebiegu, mierzony na siatce czasu przebiegu, więc jest to dolna granica w rozdzielczości kroku czasu. Holdover równy długości przerwy oznacza, że limit nigdy nie został przekroczony.

seg-e68708a219f1 = <b>p95 (<c1/>).</b> Po prostu: <em>w { "95" } % czasu błąd czasu był tak mały lub mniejszy.</em> To 95. percentyl błędu w czasie przerwy. Bardzo mała wartość może w krótkim podsumowaniu wyświetlić się jako <c2/>; plik JSON (JavaScript Object Notation) wyniku zawiera liczbę z pełną precyzją.

seg-4dfaee63262d = <b>Integralność (<c1/>).</b> Po prostu: <em>jak często własna estymata błędu systemu była uczciwa.</em> To ułamek próbek z przerwy, dla których prawdziwy błąd mieścił się w granicy k-sigma filtra (zdefiniowanej niżej). Wartość bliska { "1" } oznacza, że estymator nie zaniżał swojego błędu. To nie jest poziom ochrony klasy lotniczej; zob. „Integralność i wspomaganie” niżej oraz <a1><c2/></a1>.

seg-5af09f5129e0 = <b>Wskaźnik bezpieczeństwa (<c1/>).</b> Po prostu: <em>jak prawdopodobne jest wykrycie ataku spoofingowego.</em> To prawdopodobieństwo wykrycia skonfigurowanego ataku — jeden minus prawdopodobieństwo niewykrytego zdarzenia <c2/> — wyprowadzone ze stabilności zegara. Ma sens tylko wtedy, gdy scenariusz konfiguruje atak spoofingowy. Gdy nie skonfigurowano ataku, jednowierszowe podsumowanie wypisuje <c3/>, a wynik oznacza wartość jako <c4/> w bloku <c5/>; wartość pozostaje w dokumencie i oznacza „nie dotyczy”, a nie „zerowe bezpieczeństwo”.

seg-70113d509997 = <b>PDOP — rozmycie dokładności pozycji (klucze takie jak <c1/>).</b> Po prostu: <em>jak bardzo geometria satelitów powiększa błąd pomiaru odległości w błąd pozycji.</em> Błąd pozycji to z grubsza PDOP razy błąd pomiaru odległości, więc im mniej, tym lepiej. Zob. <b>DOP</b> w „Estymacja i geometria”.

seg-a445bf9a3c5f = <b>sigma_y (<c1/>, odchylenie Allana).</b> Po prostu: <em>jak bardzo tempo zegara faluje po uśrednieniu w czasie <c2/>.</em> Wiersz karty katalogowej, taki jak <c3/>, oznacza, że tempo uśrednione w ciągu jednej sekundy zmienia się o około { "3" } części na 10¹⁰. Mniej znaczy stabilniejszy zegar. Zob. „Jak mierzy się stabilność” wyżej.

seg-03b4bb05148d = <b>q_wf — intensywność szumu częstotliwości białego.</b> Po prostu: <em>siła szybkiego, losowego jittera tempa zegara.</em> To współczynnik w <c1/> dla szumu częstotliwości białego, więc scenariusz ustawia <c2/> z jednosekundowego odchylenia Allana z karty katalogowej. Jego towarzyszami są <c3/> (szum częstotliwości typu błądzenie losowe) i <c4/> (starzenie); zob. „Jak modeluje się błędy” wyżej.

seg-074a1337ed99 = Pojęcia synchronizacji czasu w telekomunikacji

seg-9f61398628e4 = Sieci telekomunikacyjne dystrybuują czas przez sieci pakietowe (Precision Time Protocol) z zegara odniesienia zasilanego z GNSS, a Międzynarodowa Unia Telekomunikacyjna, Sektor Normalizacji Telekomunikacji (ITU-T) ustala limity błędu czasu, który może dodać każdy zegar. Te pojęcia występują w rodzaju <c1/>; zob. <a1><c2/></a1>.

seg-f48712300b30 = <b>TE — time error (błąd czasu).</b> Po prostu: <em>jak daleko czas zegara jest od czasu odniesienia w jednej chwili.</em> Dodatni lub ujemny, zwykle w nanosekundach.

seg-ceda70656c6a = <b>max|TE| — maksymalny bezwzględny błąd czasu.</b> Po prostu: <em>najgorszy błąd czasu widoczny w pomiarze, bez względu na znak.</em> To naczelny limit, który ustala większość masek.

seg-38d2922cd91d = <b>cTE — stały błąd czasu.</b> Po prostu: <em>stała część przesunięcia błędu czasu</em> — średni błąd, który nie zmienia się w trakcie pomiaru.

seg-a4a61df332cd = <b>dTE — dynamiczny błąd czasu.</b> Po prostu: <em>falująca część błędu czasu</em> — to, co zostaje po usunięciu stałego przesunięcia. Ocenia się go za pomocą MTIE i TDEV.

seg-31c0a85788b1 = <b>MTIE — maksymalny błąd interwału czasu.</b> Po prostu: <em>największe wahnięcie błędu czasu widoczne w dowolnym oknie danej długości.</em> Dla każdej długości okna przesuwa okno po zapisie i bierze największą zmianę od szczytu do szczytu; maska podaje największą dozwoloną wartość dla każdej długości okna.

seg-53fa12cab0c6 = <b>TDEV — odchylenie czasu.</b> Po prostu: <em>typowe (średniokwadratowe) wędrowanie błędu czasu przy danym czasie uśredniania,</em> po uśrednieniu krótkoterminowego jittera. To kuzyn odchylenia Allana w dziedzinie czasu i, jak MTIE, jest sprawdzany względem maski.

seg-62b5eea14f6c = <b>PRTC — primary reference time clock (podstawowy zegar odniesienia czasu).</b> Zegar na szczycie telekomunikacyjnego łańcucha synchronizacji, zwykle sterowany przez GNSS. Jego limity wydajności są w zaleceniu ITU-T G.8272.

seg-8d6d4538981b = <b>ePRTC — enhanced primary reference time clock (ulepszony podstawowy zegar odniesienia czasu).</b> PRTC z ciaśniejszym limitem błędu czasu, wspierany przez bardzo stabilny lokalny zegar atomowy, aby mógł utrzymać czas podczas długiej utraty GNSS. Zalecenie ITU-T G.8272.1.

seg-93fa4ac7c6fa = <b>T-BC — telecom boundary clock (telekomunikacyjny zegar graniczny).</b> Zegar sieciowy, który odbiera czas z góry i przekazuje go w dół, dodając trochę własnego błędu czasu. Zalecenie ITU-T G.8273.2.

seg-52d32a5db6b8 = <b>T-TSC — telecom time slave clock (telekomunikacyjny zegar podrzędny czasu).</b> Zegar na końcu łańcucha, który odbiera czas i udostępnia go urządzeniom, które go potrzebują (na przykład stacji bazowej radiowej). Obejmuje go również zalecenie ITU-T G.8273.2.

seg-04d8ed12ca88 = <b>OCXO — oven-controlled crystal oscillator (oscylator kwarcowy w termostacie).</b> Oscylator kwarcowy utrzymywany w stałej temperaturze w małym piecyku, co czyni go znacznie stabilniejszym niż zwykły oscylator kwarcowy. Częsty zegar holdover w sprzęcie sieciowym; starzeje się (dryfuje) zauważalnie w ciągu dni.

seg-6742f7ba35ac = <b>CSAC — chip-scale atomic clock (zegar atomowy w skali układu scalonego).</b> Bardzo mały zegar atomowy (zob. „Czujniki, które porównuje { -brand }” wyżej). Stabilniejszy niż OCXO przy długim holdover, za cenę większego kosztu i mocy.

seg-c0e0c18bd867 = Poziomy dowodowe: VALIDATED, MODELLED, PARTNER

seg-61c0aa107fd9 = Każda możliwość w sprawdzanej maszynowo macierzy weryfikacji (<a1><c1/></a1>) ma jeden z trzech poziomów.

seg-13fb20435df3 = <b>VALIDATED.</b> Po prostu: <em>sprawdzone względem cudzej odpowiedzi.</em> Wynik możliwości porównano z niezależną zewnętrzną wyrocznią — rzeczywistymi zmierzonymi danymi, niezależną biblioteką napisaną przez kogoś innego lub opublikowanymi wartościami odniesienia — i zgadzał się w podanej tolerancji. Kontrola ciągłej integracji odrzuca wiersz VALIDATED, który nie wskazuje żadnej zewnętrznej wyroczni.

seg-a5dfb48e4dcb = <b>MODELLED.</b> Po prostu: <em>zbudowane na rzetelnej fizyce i sprawdzone pod kątem spójności wewnętrznej, ale jeszcze nieporównane z zewnętrzną odpowiedzią.</em> Wartości mają sens do porównań i kompromisów projektowych; nie są dowodem, że rzeczywiste urządzenie zadziała w taki sposób. <a1><c1/></a1> wyjaśnia, dlaczego każdy taki wiersz jest obliczony na podstawie modelu.

seg-0512b2d2145a = <b>PARTNER.</b> Po prostu: <em>ta część należy do partnera od sprzętu lub zapewnienia jakości produktu, a { -brand } niczego o niej nie twierdzi.</em> Wiersz istnieje po to, by luka była widoczna, a nie przemilczana.

seg-278dee6d3d4c = Pojęcia dotyczące widma i zakłóceń

seg-285a240c9958 = Te pojęcia występują w rodzaju <c1/>; zob. <a1><c2/></a1>.

seg-db4fdef1c562 = <b>BPSK(n) — binary phase-shift keying przy n × { "1.023" } Mchip/s.</b> Modulacja prostokątnym chipem GPS L1 coarse/acquisition (C/A) i L2 civil (L2C) (n = { "1" }) oraz GPS L5 i Galileo E5a (n = { "10" }). Jego widmo to sinc² z zerami co n × { "1.023" } MHz.

seg-cdd0f4194f42 = <b>BOC(m, n) — binary offset carrier.</b> Kod rozpraszający przy n × { "1.023" } Mchip/s pomnożony przez podnośną prostokątną przy m × { "1.023" } MHz, co dzieli widmo na dwa płaty po obu stronach nośnej.

seg-35ae5134f2c5 = <b>MBOC(6,1,1/11) — multiplexed binary offset carrier.</b> Widmowa gęstość mocy 10/11 × BOC({ "1,1" }) + 1/11 × BOC({ "6,1" }), uzgodniona dla otwartej usługi Galileo E1 i GPS L1C; Galileo nadaje ją jako composite BOC (CBOC).

seg-7423f94e3018 = <b>CW — continuous wave (fala ciągła).</b> Niemodulowana nośna: pojedynczy ton.

seg-55d03dd4af03 = <b>J/S — stosunek zagłuszacza do sygnału.</b> Odebrana moc zagłuszacza względem odebranej mocy sygnału, w decybelach.

seg-b0f2974647d4 = <b>SSC — spectral separation coefficient (współczynnik separacji widmowej).</b> κ = ∫ G_s(f) G_j(f) df po paśmie odbiornika: ile widma zakłócenia o mocy jednostkowej wpada tam, gdzie widmo sygnału. Efektywny stosunek nośnej do gęstości szumu to [1/(C/N₀) + (J/S)·κ]⁻¹.

seg-c5affeee5269 = <b>Współczynnik szumów.</b> Ile odbiornik dodaje do szumu termicznego, jako stosunek F w decybelach; temperatura szumowa systemu to T_ant + { "290" } K × (F − { "1" }).

seg-5307c38d3036 = <b>Waterfall.</b> Obraz czas-częstotliwość widma: częstotliwość w poziomie, czas w dół, kolor dla mocy.

seg-3b1ac094fdc5 = <b>Estymata Welcha.</b> Widmowa gęstość mocy estymowana przez uśrednianie okienkowanych, nakładających się periodogramów (Welch { "1967" }).

seg-9901d64fb895 = <b>SigMF — Signal Metadata Format.</b> Otwarty format nagrań: plik JSON <c1/> opisujący surowy plik <c2/> z próbkami (tutaj zespolonymi <c3/>, <c4/> lub <c5/>).

seg-83041671f422 = <b>IQ — in-phase and quadrature (składowa równofazowa i kwadraturowa).</b> Dwie składowe zespolonej próbki pasma podstawowego.

seg-39e6ea8506b3 = Pojęcia sygnału LEO-PNT

seg-36452ee3f5cc = Te pojęcia występują w rodzaju <c1/> i w wielopasmowych scenariuszach <c2/>; zob. <a1><c3/></a1>.

seg-8363a15f3c5a = <b>LEO-PNT — pozycjonowanie, nawigacja i czas z niskiej orbity okołoziemskiej.</b> Sygnały nawigacyjne nadawane z satelitów znajdujących się od kilkuset do około { "1200" } km nad Ziemią: silniejsze i szybciej poruszające się niż GNSS ze średniej orbity okołoziemskiej.

seg-523469643156 = <b>RNSS, RDSS, MSS, EESS — usługa radionawigacji satelitarnej, usługa radiolokalizacji satelitarnej, usługa satelitarna ruchoma, usługa satelitarna badania Ziemi.</b> Przydziały usług ITU (Międzynarodowego Związku Telekomunikacyjnego), w których może mieścić się pasmo.

seg-d1e494623341 = <b>Składowe pilotowa, danych i akwizycyjna.</b> Części jednego sygnału: pilot bez danych do pomiaru odległości, składowa danych niosąca komunikat nawigacyjny oraz krótka składowa akwizycyjna o niskiej szybkości, którą łatwo odnaleźć.

seg-cce232b7cd6a = <b>FDMA — wielodostęp z podziałem częstotliwości.</b> Składowe lub satelity rozdzielone częstotliwością nośnej, a nie kodem.

seg-9d9476ee62b1 = <b>Szerokość pasma Gabora (RMS).</b> β = √(∫ f² G df / ∫ G df) w paśmie odbiornika: rozrzut mocy sygnału w częstotliwości, który określa, jak dokładnie można mierzyć odległość.

seg-6febe9c2e506 = <b>DLL — pętla synchronizacji opóźnienia.</b> Pętla śledzenia kodu; odstęp korelatora wczesny–późny i szerokość pasma szumów określają fluktuację pomiaru odległości wynikającą z szumu termicznego.

seg-5a55da97daf9 = <b>EFQPSK — ulepszona kwadraturowa modulacja z kluczowaniem fazy Fehera.</b> Modulacja o stałej obwiedni (Xona Pulsar); tutaj przybliżona widmem chipów prostokątnych.

seg-6dcbf1de9904 = <b>OFDM — multipleksowanie z ortogonalnym podziałem częstotliwości.</b> Przebieg wielonośnikowy (łącze w dół Starlink); tutaj narysowany jako płaskie pasmo.

seg-548b285c7c8e = <b>TEC — całkowita zawartość elektronów.</b> Liczba elektronów na metr kwadratowy wzdłuż drogi sygnału; { "1" } TECU = 10¹⁶ el/m². Opóźnienie jonosferyczne pierwszego rzędu wynosi { "40.3" }·TEC/f² metra.

seg-dd7e0743f364 = <b>EIRP — równoważna moc promieniowana izotropowo.</b> Moc nadawania razy zysk anteny w kierunku odbiornika.

seg-aba3b3eaba85 = Integralność i wspomaganie

seg-eab1b2c6728e = Integralność to pytanie o <em>zaufanie</em>: nie „jak duży jest mój błąd?”, lecz „czy potrafię go ograniczyć i czy zostanę poinformowany, gdy to ograniczenie zostanie przekroczone?”. Oto lotnicze terminy opisujące tę kwestię.

seg-696a73449c49 = <b>RAIM — autonomiczne monitorowanie integralności w odbiorniku.</b> Mówiąc prosto: <em>odbiornik porównuje satelity ze sobą.</em> Gdy satelitów jest więcej niż cztery potrzebne do wyznaczenia pozycji, nadwyżki (residua) powinny być małe; duże residuum oznacza, że jeden satelita podaje błędne dane, a odbiornik może to stwierdzić bez pomocy z ziemi. Zaimplementowane w <a1><c1/></a1>.

seg-89237433f01a = <b>ARAIM — zaawansowane autonomiczne monitorowanie integralności w odbiorniku.</b> Nowoczesna, dwuczęstotliwościowa, wielokonstelacyjna postać RAIM. Otrzymuje komunikat wspierający integralność, podający zakładany błąd i prawdopodobieństwo usterki każdego satelity, a zamiast flagi zaliczenia lub niezaliczenia zwraca poziomy ochrony. Pełne omówienie, z każdym założeniem, w <a1><c1/></a1>.

seg-4cc13de05193 = <b>SISRE — błąd odległości w przestrzeni sygnału.</b> Mówiąc prosto: <em>o ile nadawana orbita i zegar satelity zniekształcają odległość mierzoną przez typowego użytkownika.</em> Błąd orbity dzieli się na składowe radialną, wzdłuż toru i poprzeczną, waży się je tym, jak bardzo każda z nich przejawia się wzdłuż przeciętnej linii widzenia, a następnie łączy z błędem zegara (Montenbruck i in. { "2018" }). Dla satelity na niskiej orbicie okołoziemskiej składowe wzdłuż toru i poprzeczna ważą znacznie więcej niż dla GPS, ponieważ użytkownik widzi go daleko od nadiru. Używane przez rodzaj <c1/>.

seg-847e40a033e1 = <b>RAC — radialna, wzdłuż toru, poprzeczna.</b> Trzy kierunki, na które rozkłada się błąd orbity: od środka Ziemi na zewnątrz, wzdłuż kierunku lotu i prostopadle do płaszczyzny orbity. Model <c2/> rodzaju <c1/> dodaje w każdym z nich wielomian korekcyjny.

seg-b725d23c839e = <b>SVID — identyfikator pojazdu kosmicznego.</b> Numer, którym komunikat nawigacyjny wskazuje satelitę, który go nadał.

seg-b0f850eb04b1 = <b>IOD — wydanie danych.</b> Licznik zmieniający się za każdym razem, gdy zmienia się treść komunikatu nawigacyjnego satelity, dzięki czemu odbiornik odróżnia nowy komunikat od powtórzenia. (Nie mylić z demonstracją w locie, również skracaną do IOD, jak w przypadku Celeste IOD z ESA.)

seg-985a5e9c9ce9 = <b>TOW — czas tygodnia.</b> Sekundy od początku bieżącego tygodnia GNSS (niedziela { "00" }:{ "00" }).

seg-1fc62dca46d6 = <b>CRC-24Q — 24-bitowa cykliczna kontrola nadmiarowa (wielomian Qualcomm).</b> Kontrola wykrywająca błędy, którą niosą komunikaty RTCM { "10403" } i Galileo: 24-bitowa reszta z dzielenia bitów komunikatu przez wielomian <c1/>. Odbiornik przelicza ją ponownie i odrzuca komunikat, który się nie zgadza.

seg-abb4679dab23 = <b>URE — błąd odległości użytkownika.</b> Mówiąc prosto: <em>jak bardzo własna nadawana orbita i zegar satelity zniekształcają każdą odległość do niego.</em> Nazywany też błędem w przestrzeni sygnału (SISE); to budżet błędu dla poszczególnych satelitów, którym zasilane są ARAIM i RAIM (<c1/> w <a1><c2/></a1>).

seg-158c210fd3fe = <b>MHSS — separacja rozwiązań dla wielu hipotez.</b> Metoda stosowana w ARAIM. Dla każdego sposobu, w jaki konstelacja mogłaby być uszkodzona, tworzy rozwiązanie wykluczające podejrzane satelity i ogranicza, jak daleko to rozwiązanie cząstkowe może leżeć od rozwiązania ze wszystkich widocznych satelitów.

seg-671711003a6f = <b>HPL / VPL — pozioma / pionowa wartość poziomu ochrony.</b> Mówiąc prosto: <em>promień, w którym system obiecuje, że znajduje się prawdziwy błąd, przy podanym ryzyku dla integralności.</em> To ograniczenie obliczane przez algorytm, a nie zmierzony błąd. Przebieg jest dostępny, gdy poziom ochrony pozostaje poniżej limitu alarmowego dopuszczonego dla danej operacji (VAL, pionowy limit alarmowy; HAL, poziomy).

seg-5bbd2d664862 = <b>SBAS — satelitarny system wspomagania.</b> Sieć naziemna, która obserwuje GNSS, oblicza poprawki i ograniczenia integralności oraz nadaje je z satelitów geostacjonarnych. <b>WAAS — system wspomagania obszaru rozległego</b> to system amerykański; EGNOS (Europejska Służba Nakładkowa Nawigacji Geostacjonarnej) jest jego europejskim odpowiednikiem. { -brand } oblicza poziomy ochrony w postaci ważonych najmniejszych kwadratów według DO-229E (DO-229E to minimalna norma użytkowa RTCA dla odbiorników SBAS; RTCA to dawna Radio Technical Commission for Aeronautics) (<a1><c1/></a1>).

seg-ba8b448582af = Estymacja i geometria

seg-2eb6e72496b8 = <b>Estymator.</b> Algorytm, który na podstawie modelu czujnika przewiduje prawdziwą pozycję lub czas podczas przerwy w sygnale. { -brand } ma analityczny predyktor holdover oraz <b>filtr Kalmana</b>.

seg-9b4aa612c5a9 = <b>Filtr Kalmana.</b> Mówiąc prosto: <em>algorytm, który śledzi pewną wielkość i jednocześnie śledzi, jak bardzo jest ona niepewna.</em> { -brand } używa jego ograniczenia niepewności do obliczania integralności.

seg-8fda81dfccc9 = <b>EKF — rozszerzony filtr Kalmana.</b> Filtr Kalmana dla problemu nieliniowego: w każdym kroku linearyzuje model wokół bieżącego oszacowania. Standardowy wybór przy sprzęganiu GNSS z INS.

seg-9bc2c6f74b29 = <b>UKF — filtr Kalmana typu unscented.</b> To samo zadanie bez linearyzacji: przepuszcza niewielki zbiór deterministycznie dobranych punktów próbnych przez prawdziwy model nieliniowy i odtwarza średnią oraz kowariancję z miejsc, w których te punkty wylądują. Zachowuje się lepiej, gdy nieliniowość jest silna, dlatego korzysta z niego wyznaczanie orbity.

seg-a1e52820e3a0 = <b>DOP — rozmycie dokładności.</b> Mówiąc prosto: <em>w jakim stopniu geometria satelitów wzmacnia błąd pomiaru odległości do błędu pozycji lub czasu.</em> Błąd pozycji ≈ PDOP × błąd pomiaru odległości, więc niska wartość oznacza dobrą geometrię. Rodzina: <b>GDOP</b> (geometryczny — pozycja i czas łącznie), <b>PDOP</b> (pozycja), <b>HDOP</b> (poziomy), <b>VDOP</b> (pionowy), <b>TDOP</b> (czas).

seg-e769a91a3e4b = <b>Konstelacja Walkera.</b> Standardowy sposób opisu konstelacji satelitów przez liczbę płaszczyzn orbitalnych i satelitów w płaszczyźnie (GPS to w przybliżeniu powłoka Walkera 24/6).

seg-b557933a4e4d = <b>Maska elewacji.</b> Minimalny kąt nad lokalnym horyzontem, przy którym satelita uznawany jest za użyteczny; sygnały zbyt nisko są wykluczane.

seg-3ac8e11c3e33 = <b>Okultacja.</b> Sytuacja, gdy Ziemia fizycznie przesłania linię widzenia do satelity.

seg-249bf472cb00 = <b>Skyline (maska linii nieba).</b> Mówiąc prosto: <em>zarys budynków, żurawi lub wzgórz na tle nieba, jako elewacja dla każdego azymutu.</em> Satelita liczy się jako widoczny tylko powyżej <c1/> w swoim azymucie, a satelita powyżej maski, ale za linią nieba, jest „zasłonięty przez skyline”. { -brand } buduje ją z tabeli, kanionu ulicznego, sektorów i terenu (ich maksimum punktowe) lub z ustawienia REPRESENTATIVE; tylko linia widzenia, bez odbić i dyfrakcji (<a1><c2/></a1>).

seg-620a88820a2d = <b>Geometria nieba.</b> Które satelity widzi stanowisko pod daną linią nieba i jak wpływa to na rozwiązanie: współczynniki DOP, kowariancja wschód–północ–góra rozwiązania najmniejszych kwadratów i jej <b>elipsa błędu</b>, czyli obszar poziomy zawierający podany odsetek wyznaczeń ({ "95" } % domyślnie) dla niezależnych, jednakowych gaussowskich błędów odległości. Geometria MODELLED przy podanym modelu błędu, a nie rzeczywisty błąd odbiornika (<a1><c1/></a1>).

seg-f0e610122425 = <b>CTI — złożona integralność czasu.</b> Poziomy ochrony dla <em>czasu</em>, a nie pozycji, obliczane przy przekazaniu między różnymi źródłami czasu — na przykład od zegara sprawdzanego przez satelity (z dostępnym RAIM) do zegara swobodnie biegnącego w trybie holdover — tak aby ograniczenie pozostawało ważne podczas przejścia (<a1><c1/></a1>).

seg-56642f614c3f = <b>TIB — wzorzec integralności czasu.</b> Miarka dla monitorów czasu <em>innych osób</em>: wprowadza zestaw usterek i sprawdza, czy podany przez monitor poziom ochrony rzeczywiście ograniczał jego błąd. Nie stawia żadnego własnego twierdzenia o dokładności, więc nie może go zawyżyć (<a1><c1/></a1>).

seg-8b89f8b913b9 = Orbity i przestrzeń cislunarna

seg-ba6b669eb8ba = <b>CR3BP — kołowy ograniczony problem trzech ciał.</b> Układ Ziemia–Księżyc traktowany jako dwa ciała na orbitach kołowych wokół wspólnego środka masy oraz statek kosmiczny zbyt lekki, by oddziaływać zwrotnie. W pobliżu Księżyca elipsa Keplera dla dwóch ciał ma po prostu zły kształt; CR3BP jest najtańszą dynamiką, która jest właściwa (<a1><c1/></a1>).

seg-2726a22bf14c = <b>NRHO — prawie prostoliniowa orbita halo.</b> Okresowa orbita CR3BP, która przechodzi blisko jednego bieguna Księżyca i daleko nad drugim, więc widziana wzdłuż osi jest niemal linią prostą — stąd „prawie prostoliniowa”. To orbita wybrana dla księżycowego Gateway; zapewnia niemal ciągłą linię widzenia do Ziemi.

seg-2b2e6d04376c = <b>DRO — odległa orbita wsteczna.</b> Kolejna rodzina CR3BP: duża, stabilna orbita, która okrąża Księżyc wstecznie, patrząc w układzie obracającym się.

seg-6bb9229aee5c = <b>EOP — parametry orientacji Ziemi.</b> Mierzone, nieco nieregularne drgania i obrót Ziemi (ruch bieguna, UT1 (czas uniwersalny { "1" }, czas obrotu Ziemi)−UTC — czas obrotu Ziemi minus uniwersalny czas koordynowany — oraz długość doby), potrzebne do przekształcenia pozycji związanej z Ziemią w pozycję inercjalną z dokładnością lepszą niż metry. Publikuje je IERS (Międzynarodowa Służba Ruchu Obrotowego Ziemi i Układów Odniesienia); { -brand } odczytuje jej plik <c1/> przez <c2/>.

seg-7f1e7e523e5b = Normy, formaty i organizacje

seg-5d8d6144c13a = Skróty, których README i strony pakietów używają dla norm, formatów plików, skal czasu, układów odniesienia i stojących za nimi instytucji. Każdy jest też rozwinięty przy pierwszym użyciu na tych stronach.

seg-800d42de0777 = Orbity, układy odniesienia i czas

seg-320a1594dcf1 = <b>SGP4 / SDP4 — uproszczone perturbacje ogólne { "4" } / uproszczone perturbacje głębokiego kosmosu { "4" }.</b> Standardowe analityczne propagatory publikowanych orbit satelitów.

seg-87a098568846 = <b>TLE — dwuwierszowy zestaw elementów.</b> Publiczny format orbity, który odczytuje SGP4.

seg-ad15cf5aa9a5 = <b>LEO / MEO / GTO / IGSO — niska orbita okołoziemska / średnia orbita okołoziemska / geostacjonarna orbita transferowa / nachylona orbita geosynchroniczna.</b> Rodzaje orbit; większość satelitów GNSS lata na MEO.

seg-1ec323dbd7a6 = LMO — niska orbita wokół Marsa.

seg-d0be640282af = <b>ECI / ECEF — inercjalny układ związany ze środkiem Ziemi / układ związany ze środkiem Ziemi i z Ziemią.</b> Układ, który nie obraca się z Ziemią, i układ, który się obraca.

seg-09a937adc1db = <b>TEME — prawdziwy równik, średnie równonocy.</b> Układ, w którym SGP4 podaje wyniki.

seg-eb2a80922118 = <b>GCRS / ITRS / ITRF — geocentryczny niebieski system odniesienia / międzynarodowy system odniesienia związany z Ziemią / jego realizacja, międzynarodowy układ odniesienia związany z Ziemią.</b> Nowoczesne układy inercjalny i związany z Ziemią.

seg-56b24c3734be = <b>CIO — niebieski początek pośredni.</b> Punkt odniesienia nowoczesnego łańcucha obrotu Ziemi, niezależnego od równonocy.

seg-a23b05c85a63 = <b>LVLH — lokalna pionowa, lokalna pozioma.</b> Układ, który porusza się ze statkiem kosmicznym.

seg-ac37217cda0d = <b>WGS-84 — Światowy System Geodezyjny { "1984" }.</b> Elipsoida Ziemi używana przez GPS.

seg-81bc73d1fde8 = UTC / TAI / TT / UT1 / TDB — uniwersalny czas koordynowany / międzynarodowy czas atomowy / czas ziemski / czas uniwersalny { "1" } (czas obrotu Ziemi) / barycentryczny czas dynamiczny.

seg-ea7eb1f34cae = <b>LTC / TCL — księżycowy czas współrzędnych (Temps-Coordonnée Lunaire).</b> Proponowana skala czasu dla Księżyca.

seg-c6e5976d9dff = <b>OD — wyznaczanie orbity.</b> Odtwarzanie orbity z pomiarów śledzenia.

seg-dcb9e011c868 = <b>CR3BP</b>, <b>NRHO</b> i <b>DRO</b> są zdefiniowane powyżej w części „Orbity i przestrzeń cislunarna”.

seg-2e6ba9069396 = Formaty plików i komunikaty

seg-ed5ea0a21e3f = <b>SP3 — produkt standardowy { "3" }.</b> Format pliku precyzyjnych orbit Międzynarodowej Służby GNSS (IGS), w wersjach c i d.

seg-1bfa0d083935 = <b>RINEX — format wymiany niezależny od odbiornika.</b> Standardowy format pliku dla obserwacji GNSS i efemeryd nadawanych.

seg-39ce08a9ae66 = IONEX — format wymiany map jonosfery.

seg-c23ea3515008 = <b>OEM / OMM / TDM — komunikat efemeryd orbity / komunikat średnich elementów orbity / komunikat danych śledzenia.</b> Standardowe komunikaty dla orbit i danych śledzenia, opracowane przez Konsultacyjny Komitet ds. Systemów Danych Kosmicznych (CCSDS).

seg-b267b32f3087 = <b>TOML — Tom's Obvious, Minimal Language.</b> Format tekstowy scenariuszy { -brand }.

seg-2795dff8d607 = <b>KIF — Kshana Interchange Format.</b> Wersjonowana, samoopisująca się koperta wyniku { -brand }.

seg-cd048e90fa3f = <b>DO-229E / DO-316.</b> Minimalne normy użytkowe RTCA dla odbiorników SBAS oraz dla lotniczego wyposażenia GPS ze wspomaganiem opartym na statku powietrznym.

seg-68604f314fa1 = <b>IS-GPS-200 / IS-GPS-705.</b> Specyfikacje interfejsu GPS (druga obejmuje sygnał L5).

seg-2230000aa30b = <b>NIST SP { "1065" }.</b> <em>Handbook of Frequency Stability Analysis</em> Narodowego Instytutu Standardów i Technologii.

seg-8b89719c1859 = <b>TRL — poziom gotowości technologicznej.</b> Skala od 1 do 9 dojrzałości sprzętu.

seg-16c972f4ea0a = Organizacje

seg-9b4692fbc8a1 = <b>ESA / ESOC / ESTRACK</b> — Europejska Agencja Kosmiczna, jej Europejskie Centrum Operacji Kosmicznych i jej europejska sieć śledzenia kosmicznego.

seg-7a1746489724 = <b>NASA / JPL / NAIF / DSN</b> — amerykańska Narodowa Agencja Aeronautyki i Przestrzeni Kosmicznej, jej Jet Propulsion Laboratory, jej Navigation and Ancillary Information Facility (które publikuje zestaw narzędzi SPICE — Spacecraft, Planet, Instrument, C-matrix, Events) oraz jej Deep Space Network.

seg-eaa5a2a51169 = <b>IGS</b> — Międzynarodowa Służba GNSS. <b>IERS</b> — Międzynarodowa Służba Ruchu Obrotowego Ziemi i Układów Odniesienia. <b>IAU</b> — Międzynarodowa Unia Astronomiczna (której biblioteka SOFA, Standards of Fundamental Astronomy, i jej otwarty port ERFA, Essential Routines for Fundamental Astronomy, są odniesieniem dla układów odniesienia w { -brand }).

seg-81af4c0f4c48 = <b>CCSDS</b> — Konsultacyjny Komitet ds. Systemów Danych Kosmicznych. <b>AIAA</b> — Amerykański Instytut Aeronautyki i Astronautyki. <b>RTCA</b> — dawna Radio Technical Commission for Aeronautics.

seg-aa0b395df17f = Oprogramowanie i łańcuch dostaw

seg-b42188d3a6f4 = CLI — interfejs wiersza poleceń.

seg-198c591514ab = <b>MCP — Model Context Protocol</b>, protokół, którym posługuje się serwer agentowy { -brand }. <b>IDE — zintegrowane środowisko programistyczne.</b>

seg-287bf61a1a16 = SBOM — wykaz składników oprogramowania.

seg-80d9d4404221 = <b>SLSA — Supply-chain Levels for Software Artifacts</b>, framework pochodzenia kompilacji, według którego atestowane są wydania { -brand }.

seg-7487c6f9ed18 = Każdy pozostały skrót, od A do Z

seg-56f6039bb38a = Każdy skrót użyty w dokumentacji repozytorium (<c1/> i czterech plikach README), którego nie definiuje żadna sekcja powyżej, oraz kilka takich, które definiuje, powtórzonych dla ułatwienia wyszukiwania. Każda strona rozwija też swoje skróty przy pierwszym użyciu; ta tabela to jedno miejsce, w którym można sprawdzić je wszystkie. Kilka pozycji to identyfikatory lub nazwy, a nie skróty, i jest to tam zaznaczone.

seg-c0dfa446e523 = Oznacza

seg-f272d28225ae = Gdzie występuje

seg-ffb0596f134b = Third Generation Partnership Project

seg-77c1b4478387 = organizacja, która pisze normy 5G, w tym dla sieci nienaziemnych

seg-eaf19768b977 = mobilna sieć piątej generacji

seg-692ddc163c55 = w tym jej pozycjonowanie w sieciach nienaziemnych (NTN)

seg-9524be916f07 = ABI

seg-0e8332db764b = binarny interfejs aplikacji

seg-762ea76708dc = znaczniki pakietów Python wheel

seg-d419d06ed622 = ABMF

seg-b294c714487d = stacja IGS w Le Moule na Gwadelupie

seg-586a8ea87638 = czteroznakowy identyfikator stacji

seg-4cc9a09495e6 = AC

seg-620e2dc5e4ca = prąd przemienny

seg-9cfb5dc4b4bc = jak w efekcie AC-Starka (przesunięcie świetlne)

seg-90308009c536 = ADD

seg-49d97c65662d = dokument opisu algorytmu

seg-493b5ceaa0fb = lotniczy algorytm referencyjny ARAIM WG-C

seg-3fe5d7f41dcd = ADEV / OADEV

seg-089ac7d5ac94 = odchylenie Allana / nakładające się odchylenie Allana

seg-23c38ecbc543 = zob. odchylenie Allana powyżej

seg-25b9fee76c9e = ADIS16460 / ADIS16465 / ADIS16488, STIM300, 3DM-GX3 (GX3)

seg-4b642742f2d4 = numery części czujników inercjalnych (Analog Devices; Safran Sensonor; MicroStrain)

seg-c4c0a93477a8 = identyfikatory, a nie skróty

seg-36743c7fe98e = AEM

seg-142ca108a070 = komunikat efemeryd orientacji

seg-c34185a83d8e = komunikat CCSDS

seg-dd89e1deb663 = AESS

seg-898b29aaef84 = Towarzystwo Systemów Lotniczych i Elektronicznych

seg-78692bf5addf = w IEEE

seg-f429be16014e = AF

seg-afa04bc28b42 = współczynnik uśredniania

seg-b3db60632b92 = całkowita wielokrotność odstępu próbkowania w estymatorze typu Allana

seg-6097c4709542 = AFS

seg-7043ab3fe32b = Augmented Forward Signal

seg-20380d29d286 = księżycowy sygnał nawigacyjny LunaNet

seg-b33d60fa5832 = AGC

seg-98c9c2809bd6 = automatyczna regulacja wzmocnienia

seg-750b8717220b = wskaźnik jammingu w torze wejściowym odbiornika

seg-31b864b910d5 = AHP

seg-f956cbe86552 = analityczny proces hierarchiczny

seg-c2b63847e2dc = wielokryterialna metoda ważenia (Saaty)

seg-0e00edd7e222 = AI / ML

seg-6d804a116a08 = sztuczna inteligencja / uczenie maszynowe

seg-079020f86d22 = AL / HAL / VAL

seg-1981b764715b = limit alarmowy / poziomy limit alarmowy / pionowy limit alarmowy

seg-1e52f04eb047 = błąd, który monitor integralności musi ograniczyć

seg-c7ce4d3299b8 = AltBOC

seg-f630bcd1d523 = alternatywna binarna modulacja z nośną przesuniętą

seg-e3acb231cf4d = modulacja Galileo E5

seg-79b130764f97 = nierówność między średnią arytmetyczną a harmoniczną

seg-190b782b70ce = AOCS

seg-6459d9bce282 = system kontroli orientacji i orbity

seg-14ec3e19c990 = AOS / TCA / LOS

seg-7cdb4a7e6df4 = złapanie sygnału / czas największego zbliżenia / utrata sygnału

seg-8b73e2c51498 = zdarzenia przelotu nad stacją naziemną (LOS oznacza też linię widzenia; kontekst wskazuje, które znaczenie)

seg-27ceb7163571 = API

seg-7903f5ff4027 = interfejs programistyczny aplikacji

seg-d6bea5dea0dc = APID

seg-d468b4555dbf = identyfikator procesu aplikacji

seg-55730824c8cf = pole nagłówka pakietu kosmicznego CCSDS

seg-611cd7a0d378 = APS

seg-55842a648c47 = Amerykańskie Towarzystwo Fizyczne

seg-07dcfba8a3c9 = APV

seg-1a7fbb0deef2 = podejście z prowadzeniem pionowym

seg-69a6cc8a532a = APV-I: poziomy limit alarmowy { "40" } m, pionowy { "50" } m

seg-f357a0a03c60 = ARL

seg-b4ce3803afa6 = średnia długość przebiegu

seg-08a5d53f813c = średni czas, po którym detektor zmiany zgłasza alarm

seg-519e65f68c85 = ARM / ARM64

seg-1db3bdee5f76 = architektura procesorów Arm / jej postać 64-bitowa

seg-33f6dff869b2 = ASD

seg-dd98c69872e0 = amplitudowa gęstość widmowa

seg-9fb629e35a25 = pierwiastek kwadratowy z gęstości widmowej mocy

seg-a020de5e94e5 = AU

seg-2342680bc7a6 = jednostka astronomiczna

seg-894bf4353ce3 = { "149 597 870.7" } km

seg-611aec9d1dce = AUC / ROC

seg-a11aa1d8f433 = pole pod krzywą / charakterystyka operacyjna odbiornika

seg-4d65dbf47a5c = ocena detektora

seg-25dc893d746a = AWS

seg-20979dc817ba = Amazon Web Services

seg-569160c6e52d = udostępnia otwarte lustro kafli wysokości SRTM

seg-298c6a00085d = BEL

seg-c7ce8fa2c544 = tłumienie przy wnikaniu do budynku

seg-b714453f9b2c = ITU-R P.2109

seg-b9aec1857aa9 = BI

seg-40ea7b7e321e = niestabilność biasu

seg-ff2ba8692cbc = płaskie minimum odchylenia Allana czujnika inercjalnego

seg-e7c1cfecd45e = BIPM

seg-dc138478d882 = Bureau International des Poids et Mesures (Międzynarodowe Biuro Miar i Wag)

seg-6ec98084ac58 = publikuje Circular T

seg-4ff08facda60 = BKG

seg-d29da95f483c = Bundesamt für Kartographie und Geodäsie (niemiecki Federalny Urząd Kartografii i Geodezji)

seg-ac4765a77015 = prowadzi lustro danych IGS

seg-a85954d9176e = BSD

seg-eb42c5807e5a = Berkeley Software Distribution

seg-a332a259125a = jak w licencjach BSD

seg-97764c651815 = BSP

seg-8f85848ee08a = binarny SPK

seg-6e01dca47581 = plik binarnego jądra efemeryd SPICE

seg-0157bbd7a064 = BSTAR

seg-23772d56a24c = człon oporu w dwuwierszowym zestawie elementów

seg-628e6c686508 = CAI

seg-a2418a88886c = interferometr zimnych atomów

seg-273a3b8d5385 = zob. QUANTUM.md

seg-c34db5304197 = Cold Atom Rubidium Interferometer in Orbit for Quantum Accelerometry – Pathfinder Mission Preparation

seg-fa257dda6d45 = CC / CC BY

seg-97b3d1136762 = Creative Commons / Creative Commons Uznanie autorstwa

seg-a1f55ee72524 = licencja na dane lub tekst

seg-1b8df20680a0 = CDDIS

seg-0a158229f571 = Crustal Dynamics Data Information System

seg-5b3f50bed1f6 = archiwum geodezji kosmicznej NASA

seg-ee2ac06a3023 = CDF

seg-0a54599e470d = dystrybuanta

seg-6100157bdc02 = CFAR

seg-43ef1f6cd71d = stała częstość fałszywych alarmów

seg-b38b56b63da6 = reguła progowa detektora akwizycji

seg-46835ce9641a = Chiński Geodezyjny Układ Współrzędnych { "2000" }

seg-4dab086e5c3d = układ odniesienia BeiDou

seg-8f7751d39781 = CIP

seg-e34a194da574 = niebieski biegun pośredni

seg-c9b37d94f70b = CIRS

seg-29e69d7f32aa = niebieski pośredni system odniesienia

seg-a543c4d02ace = CISA

seg-c34a7f26944d = Agencja ds. Cyberbezpieczeństwa i Bezpieczeństwa Infrastruktury

seg-59c481cb5741 = amerykańskiego DHS

seg-4f7ba1fd1f4c = CM / CL

seg-4fb8507eb747 = cywilny umiarkowany / cywilny długi

seg-cc0c8f1524f8 = dwa multipleksowane w czasie kody GPS L2C

seg-2ea49f6a1ae9 = CMPL

seg-68b147628ea1 = poziom ochrony dla trybu wspólnego

seg-d469cd44d9d4 = ograniczenie błędów, których test residuów nie widzi

seg-4e25d07b13c9 = CN

seg-e775ec496f2b = zbieżny newtonowski

seg-5d679a981a34 = poprawka SPICE na aberrację czasu świetlnego

seg-3da9a2841b6c = C/N0 (C/N₀)

seg-cf60da0631b4 = w dB-Hz

seg-f4488db8194d = COPRAS

seg-6379891c1750 = COmplex PRoportional ASsessment

seg-b99fe66bd09c = wielokryterialna metoda rankingowa

seg-a562dbafa35f = COSPAR

seg-c09ea7bc49b0 = Komitet Badań Kosmicznych

seg-235850ad0d1f = nadaje międzynarodowe oznaczenia satelitów

seg-dbc3e7c90fe0 = CPR

seg-1fd5b461cc3d = cykl na obrót

seg-a1d4080ce019 = empiryczne przyspieszenie orbity o częstotliwości orbitalnej

seg-96cd47b07b44 = CPU / GPU / NPU

seg-10ad2f10bec0 = centralna / graficzna / neuronowa jednostka przetwarzania

seg-93621c1a1e37 = CRB / CRLB

seg-70b6a0b19705 = ograniczenie Craméra–Rao / dolne ograniczenie Craméra–Rao

seg-6eb684e34f56 = najmniejsza wariancja, jaką może osiągnąć estymator nieobciążony

seg-93c4fe0f2990 = CRD

seg-6efd9a1fdbcc = Consolidated laser Ranging Data format

seg-eb95135f849c = pliki punktów normalnych ILRS

seg-f23ff835b9b0 = CRPA

seg-b5c26297e11b = antena o kontrolowanej charakterystyce odbioru

seg-7111b9c4d382 = szyk antenowy przeciw zagłuszaniu

seg-404133a74afc = CR / RI

seg-d35896b2bb24 = współczynnik spójności / indeks losowy

seg-cfa91dc02138 = kontrola spójności AHP (akceptacja CR < { "0.10" })

seg-8572a3faf46a = CS GROUP

seg-5e00428ed929 = francuska firma utrzymująca Orekit

seg-58d5f143ff3b = nazwa firmy, a nie skrót do rozwinięcia

seg-be388831a3e1 = CSK

seg-9cf6cad11f64 = kluczowanie przesunięciem kodu

seg-a3bd162146d6 = CSS

seg-75ddcc97f9e2 = kaskadowe arkusze stylów

seg-0d5c127b2ee5 = CUSUM

seg-d40da5f47035 = suma kumulatywna

seg-66f752e15abc = sekwencyjny detektor zmiany

seg-92ac0357d01e = CV

seg-28f75c073917 = (wspólny widok w transferze czasu; kontekst wskazuje, które znaczenie)

seg-507b8c235614 = CZML

seg-0b76641dee1a = Cesium Language

seg-fd0a7af2ebeb = format sceny JSON biblioteki CesiumJS

seg-1aefbc0b799d = dB / dBW / dB-Hz

seg-8a0d954bd13b = decybel / decybel-wat / decybel-herc

seg-c485de5bcd85 = stosunek mocy, moc bezwzględna oraz jednostka C/N0

seg-6c0cbce59df5 = DC

seg-ddd7d412fce7 = prąd stały

seg-0ea7fccee332 = granica dla częstotliwości zerowej

seg-521e2abbe12d = DCM

seg-3db4487dc2a4 = macierz cosinusów kierunkowych

seg-9d3d9ca79a9d = macierz obrotu

seg-364a2fcec10b = DCO

seg-110b1eb4f532 = Developer Certificate of Origin

seg-1545bd59f5ef = DCT

seg-8b6866288bea = tabela kontroli projektu

seg-80d95f099e9a = tabela bilansu łącza (przykład Galileo w paśmie X z JPL DESCANSO)

seg-7f9734bd79bc = DE / DE421 / DE430 / DE440 / DE441

seg-ed8d5c361e79 = JPL Development Ephemeris (wersje { "421" }, { "430" }, { "440" }, { "441" })

seg-748af19e3f0b = efemerydy planet i Księżyca; „klasy DE” oznacza dokładność tej klasy

seg-6f880928ce0c = DEM

seg-eed6ad669d4c = cyfrowy model wysokości

seg-920f5ff86fa2 = DESCANSO

seg-6d1f2ffa8184 = Deep Space Communications and Navigation Systems Center of Excellence

seg-2e11a1976171 = seria monografii JPL

seg-10dc0c578b92 = Deutsches Geodätisches Forschungsinstitut der Technischen Universität München (Niemiecki Instytut Badań Geodezyjnych przy Politechnice Monachijskiej)

seg-e7cedd55549e = gości EUROLAS Data Center

seg-4389ecd5c81a = DGNSS

seg-fb8c5992354b = różnicowy GNSS

seg-3fed847ae9ec = DHS

seg-2845322fad33 = Departament Bezpieczeństwa Krajowego

seg-6b487421c547 = USA

seg-9e06c8655623 = DoD

seg-7a7ea4a3f0d5 = Departament Obrony

seg-1f6c4757bee5 = DOF / DoF

seg-e1daefad0696 = stopień swobody

seg-bf5bc69cb873 = zob. 1-DOF powyżej

seg-3b5c7c9b324d = DOR / Δ-DOR

seg-3e0b6392f4d9 = różnicowy pomiar odległości w jedną stronę / delta różnicowy pomiar odległości w jedną stronę

seg-6ba2d3b5b724 = kątowe śledzenie w głębokim kosmosie

seg-58c55b8ab7fe = DP5 / RK4 / RK5 / DOP853

seg-ea9b38a5d810 = Dormand–Prince { "5" }({ "4" }) / Runge–Kutta { "4" } / Runge–Kutta { "5" } / Dormand–Prince { "8" }({ "5,3" })

seg-00ecc6de9912 = integratory numeryczne

seg-16c4bf2faef3 = DRMS

seg-8128cc0c1482 = pierwiastek ze średniej kwadratowej odległości

seg-a8ed04890ded = zob. 2DRMS

seg-c9ab798458cb = DS00002980D / DS00002985D / DS00003047A

seg-371644e70b75 = numery dokumentów kart katalogowych Microchip

seg-f25e5c4de1e5 = DSAC

seg-aa0d8d4b3a3b = Deep Space Atomic Clock

seg-e80350ed521f = zegar NASA na uwięzionych jonach rtęci

seg-52e838301c0b = UT1 minus UTC

seg-fbce3b3b7b80 = poprawka na obrót Ziemi

seg-8aa996f34920 = energia na bit względem gęstości szumu

seg-463b21c0b791 = układ inercjalny zrównany z układem związanym z Ziemią na początku przebiegu

seg-4dc987bd9dbf = używany przez eksporty współdziałania leo-pass

seg-61f975df5e21 = ECMAScript / ES

seg-c66e728cd2fa = norma stojąca za JavaScript / moduł ES

seg-e1a4fd0a6a76 = Empirical CODE Orbit Model { "2" }

seg-2967e958f353 = model ciśnienia słonecznego dla GNSS (CODE: Center for Orbit Determination in Europe)

seg-244af4062ccc = ECSS

seg-b74029376aba = Europejska Współpraca na rzecz Normalizacji Kosmicznej

seg-d452e23d503a = ECSS-E-ST-10-02 jest jej normą weryfikacji

seg-becb6685ff13 = ED

seg-b6448e14a567 = dokument EUROCAE

seg-ee4ada9c4c6e = jak w ED-259A

seg-8a57ce8403b1 = EDL

seg-0f065f2290f3 = wejście w atmosferę, opadanie i lądowanie

seg-69f37001de44 = EEE

seg-18a1b66286ee = części elektryczne, elektroniczne i elektromechaniczne

seg-f814c1301059 = zapewnienie jakości produktów kosmicznych

seg-08e455b17435 = EGM / EGM2008

seg-1ed72a253035 = Earth Gravitational Model (wydanie { "2008" })

seg-074e3ceb394e = NGA

seg-69ba7307ea4c = EIGEN

seg-4272020c0ebd = European Improved Gravity model of the Earth by New techniques

seg-a49ce7809382 = ELECTRE

seg-647519f3df17 = ELimination Et Choix Traduisant la REalité (eliminacja i wybór wyrażające rzeczywistość)

seg-efb2f919955a = wielokryterialna metoda przewagi (outranking)

seg-88a2f1813af8 = Éphéméride Lunaire Parisienne, wersja MPP02 (Chapront)

seg-b1d699d70339 = analityczna teoria ruchu Księżyca

seg-aee5eeb23064 = średni równik i równonoc Ziemi epoki J2000

seg-16d9b8eac95d = układ inercjalny

seg-e676d5eec6e3 = EML

seg-f4bba0abbda7 = dyskryminator kodu

seg-0e4110d33849 = EMT

seg-103c6de62575 = efektywny próg monitora

seg-4b2101113387 = wynik ARAIM

seg-0e2817aec74a = ENU / NED

seg-56d5cf1544d9 = wschód–północ–góra / północ–wschód–dół

seg-aae7610833a7 = układy lokalnego poziomu

seg-c7d5c5d5c5b2 = EO

seg-24907930c730 = obserwacja Ziemi

seg-38f9c209c4ac = EPM / EPM2021

seg-d15e1559b7f7 = Ephemerides of Planets and the Moon (wydanie { "2021" })

seg-bd2a27a17f6d = efemerydy IAA RAS

seg-01a8e43fb6c7 = ERA

seg-eb78ffaf7e1d = kąt obrotu Ziemi

seg-966ed500f705 = ESKF

seg-e79112a3132a = filtr Kalmana stanu błędu

seg-25c6b6b19d75 = ESS

seg-fe2b7be913f0 = efektywna liczebność próby

seg-57ce1c1b617b = filtru cząstkowego

seg-f529300f944b = ESSR

seg-869be8388d26 = European Space Software Repository

seg-536d66d208e4 = ESA

seg-27be9c1d7090 = ET

seg-7cc2ef5b0748 = czas efemerydalny

seg-e0c49639649e = nazwa TDB w SPICE

seg-80de6914a5ec = EUROCAE

seg-76897dd8c3be = Europejska Organizacja ds. Wyposażenia Lotnictwa Cywilnego

seg-b4f12b7813dd = EUROLAS

seg-857527c69d6e = Europejska Sieć Laserowa

seg-fa7025d88c88 = laserowe pomiary odległości do satelitów i Księżyca

seg-13fc009b947c = FAQ

seg-f5581b33ae89 = najczęściej zadawane pytania

seg-67d10fd4a4e0 = FCC

seg-0a558c281968 = Federalna Komisja Łączności

seg-f6ade8c24d27 = FCNN

seg-6098513947b8 = w pełni połączona sieć neuronowa

seg-1de7b4410369 = FD

seg-4e73ff36d37f = różnica skończona

seg-e43312a5fbbe = FDE

seg-d6c9fb239b59 = wykrywanie i wykluczanie usterek

seg-8f9d11564223 = FES / FES2004

seg-1a1cf1501056 = Finite Element Solution (wydanie { "2004" })

seg-878b4a645ae9 = model pływów oceanicznych

seg-55c14f474a10 = FIM

seg-b68c86e68570 = macierz informacyjna Fishera

seg-d39671724dfc = skrót Fowlera–Nolla–Vo, wariant 1a

seg-3354ad42f7dd = służy do przypięcia wzorcowych wyników

seg-efca4decfec0 = FOC / IOV

seg-793d96ab9856 = pełna zdolność operacyjna / weryfikacja na orbicie

seg-ce13cca7f222 = generacje satelitów (Galileo, Xona Pulsar)

seg-58df7305e218 = FOV / IFOV

seg-cafe1f8733ec = pole widzenia / chwilowe pole widzenia

seg-4f7168e895d2 = FPGA / MCU / RTOS

seg-abde801ec70b = programowalna macierz bramek / mikrokontroler / system operacyjny czasu rzeczywistego

seg-a082e4570309 = FSL / FSPL

seg-3a8ee2932a46 = tłumienie w wolnej przestrzeni / tłumienie na drodze w wolnej przestrzeni

seg-4535dadf79df = ITU-R P.525

seg-c0209066dc76 = GB / KB / MB

seg-184bb3d8b345 = gigabajt / kilobajt / megabajt

seg-8094e61fdd76 = GCRF

seg-6c6337c7a855 = geocentryczny niebieski układ odniesienia

seg-f050f2b8dee1 = GDAL

seg-98b12fcceb01 = Geospatial Data Abstraction Library

seg-1cef8718c772 = GEO

seg-6131e4ea7858 = orbita geostacjonarna

seg-bf09433a7342 = GeoJSON

seg-f8654e88af67 = Geographic JavaScript Object Notation

seg-70dc52cd5059 = IETF RFC { "7946" }

seg-bb8fbd2ebc28 = GG

seg-b93ed4ab2b79 = gradient grawitacyjny

seg-d8ef4d361e86 = jak w momencie gradientu grawitacyjnego

seg-12fd4eb15c4d = GHz / kHz

seg-0769cc8be024 = gigaherc / kiloherc

seg-3946b69535e4 = GIM

seg-ef5fc608b0e5 = globalna mapa jonosfery

seg-8cbbff1bc1d1 = GINS / KF-GINS

seg-fbe37a571772 = integracja GNSS/INS / zbiór danych i kod filtru Kalmana GNSS/INS Uniwersytetu Wuhan

seg-deca3cbe41ac = GIS

seg-36275ece527d = system informacji geograficznej

seg-ebe8194d12b3 = GIVE

seg-6a99c12984b5 = siatkowy pionowy błąd jonosferyczny

seg-20a40777d78a = termin z komunikatów SBAS

seg-6fbfc5108833 = gLAB

seg-1be22ebbedc3 = GNSS-Lab Tool

seg-93b2c5b68af0 = pakiet do przetwarzania danych GNSS dystrybuowany przez ESA

seg-2aa0f3147ad5 = GLIBC

seg-096e00cb9d9b = biblioteka C GNU

seg-2630ae5f0bc5 = rosyjski Globalny System Nawigacji Satelitarnej (Globalnaja Nawigacjonnaja Sputnikowaja Sistiema)

seg-361f1f18d454 = GLS

seg-397d58b727ee = uogólniona metoda najmniejszych kwadratów

seg-9bb2492e5d5d = GM

seg-6bd8e46e9131 = parametr grawitacyjny

seg-e3a296392ac0 = stała grawitacji razy masa ciała

seg-45a8f50bce06 = General Mission Analysis Tool

seg-60d33e61b446 = NASA

seg-1edd65c52f46 = Goddard Mars Model { "3" }

seg-45abee95253b = pole grawitacyjne Marsa

seg-558ea1e07042 = GMST

seg-d3c4914f0d13 = średni czas gwiazdowy Greenwich

seg-d853b1084a52 = GNC

seg-34a9ddce3d5f = naprowadzanie, nawigacja i sterowanie

seg-d33e343f6635 = GPOD

seg-2ef6bb5a52fc = Grid Processing On Demand

seg-14782f821cde = GR

seg-762f364a05f3 = ogólna teoria względności

seg-3e3f45ad1178 = GRGM / GRGM660PRIM

seg-948167f5f1c3 = modele grawitacyjne Księżyca GRAIL z NASA Goddard (GRAIL: Gravity Recovery and Interior Laboratory)

seg-220fae5cfc61 = Geodetic Reference System { "1980" }

seg-bb3c2a337ae8 = GSD

seg-691791646eb3 = odległość próbkowania na gruncie

seg-448d7036fefe = GSE

seg-d05b88e7d5c5 = naziemny sprzęt wsparcia

seg-95d29f8138f9 = GSFC

seg-2e1460089fed = Goddard Space Flight Center

seg-7680e0663a5b = HDEV / OHDEV

seg-1fd1e3322c86 = odchylenie Hadamarda / nakładające się odchylenie Hadamarda

seg-bb846135ceb4 = miara stabilności niewrażliwa na dryf

seg-0edc4eed2775 = HIL

seg-956a26e1ff6d = sprzęt w pętli

seg-48523cdbbbf5 = HMI / MI

seg-d77e079194df = niebezpiecznie mylące informacje / mylące informacje

seg-1cbf9d6f135d = obszary diagramu Stanforda

seg-b320746fafa5 = HP

seg-465a952272f3 = HTML

seg-45a46390d3ba = HyperText Markup Language

seg-25206f1161f0 = IAA RAS

seg-1a4f063e3583 = Instytut Astronomii Stosowanej Rosyjskiej Akademii Nauk

seg-9f434fdc21f2 = IAG

seg-08fb84d2e01a = Międzynarodowe Stowarzyszenie Geodezji

seg-e4d6251ec64d = IAGA / V-MOD (VMOD)

seg-01880debd7e0 = Międzynarodowe Stowarzyszenie Geomagnetyzmu i Aeronomii / jego Grupa Robocza V-MOD (modelowanie pola geomagnetycznego)

seg-28805f15bae8 = utrzymuje IGRF

seg-d4ce72152bf2 = IC

seg-fa95c4e7fdc2 = warunek początkowy

seg-e4c4373d0c76 = ICAO

seg-2fccffbaf4dc = Międzynarodowa Organizacja Lotnictwa Cywilnego

seg-c2d2d459177d = ICD

seg-a018300615e2 = dokument kontroli interfejsu

seg-433b45040abd = jak w Galileo OS SIS ICD

seg-5e1e49c5000e = ICGEM

seg-c17be0db9e83 = Międzynarodowe Centrum Globalnych Modeli Ziemi

seg-e9650a618b38 = ID

seg-e40875ab1090 = identyfikator (lub identyfikacja, jak w identyfikacji typu szumu)

seg-c643488ba1ea = IEEE

seg-e4b50d4d890f = Institute of Electrical and Electronics Engineers

seg-91966e2931d4 = IETF / RFC

seg-0804111ad44d = Internet Engineering Task Force / Request for Comments

seg-ce9375732735 = IF

seg-746eae5ce367 = częstotliwość pośrednia

seg-ed568f55aa8f = próbki odbiornika

seg-cb4aaa2581bb = realizacja ITRF2014 przez IGS

seg-bfa8e6d5d0d1 = IGRF / IGRF14

seg-55fed0afea05 = Międzynarodowe Pole Referencyjne Geomagnetyzmu

seg-669611e731d0 = IGRF-14 (plik IGRF14.shc) to 14. generacja

seg-f7cf8ff44256 = IGSO

seg-4833bd1e9c03 = nachylona orbita geosynchroniczna

seg-2080ff6f98fd = IIF

seg-cf7a31e569cd = GPS Block II Follow-on

seg-8a19be8033a9 = generacja satelitów GPS

seg-68cc1c937ce9 = ILRS

seg-53cc8d1f6824 = Międzynarodowa Służba Laserowych Pomiarów Odległości

seg-fb5255ba4bc1 = ILS

seg-b8af4d02e031 = całkowitoliczbowa metoda najmniejszych kwadratów

seg-a214c483b8a8 = rozwiązywanie niejednoznaczności

seg-4740fb9ef0b9 = IMCCE

seg-e77c8324583a = Institut de mécanique céleste et de calcul des éphémérides

seg-22048a770612 = Obserwatorium Paryskie; publikuje INPOP

seg-9717f14527d3 = Intégration Numérique Planétaire de l'Observatoire de Paris, wersja 21a

seg-577acd29f11b = efemerydy planetarne

seg-cdb9ea77f5a6 = IOAG

seg-87f308314cd4 = Interagency Operations Advisory Group

seg-690414990ad8 = ION / ITM

seg-b2fbe0c3507a = Institute of Navigation / jego Międzynarodowe Spotkanie Techniczne

seg-53abad80634c = IoT

seg-9b766d557bd1 = Internet rzeczy

seg-1b41d114662e = IR

seg-ff2d89b32d07 = ryzyko dla integralności

seg-2dc9fcadccd6 = prawdopodobieństwo niebezpiecznie mylących informacji

seg-02aeac5e2435 = IRE

seg-9c9c0011de8c = Institute of Radio Engineers

seg-3fbae7e11fca = poprzednik IEEE

seg-9e3d84279d56 = przesunięcie zegara między dwoma systemami GNSS

seg-2ffee4396fbd = ISL

seg-505dee046f7a = łącze międzysatelitarne

seg-010ea5a76e2e = ISM

seg-330b25f923db = komunikat wspierający integralność

seg-1f5a14efd417 = ARAIM

seg-0ee7fcdaf5a9 = ISO

seg-8c1341375f17 = Międzynarodowa Organizacja Normalizacyjna

seg-8291ac1ccba6 = ISO { "8601" } to jej format daty i czasu

seg-5b4dee02dccc = ITRF93 / ITRF2020

seg-93458bf3ba01 = Międzynarodowy Układ Odniesienia związany z Ziemią { "1993" } / { "2020" }

seg-14dc2a58e2c3 = Sektor Radiokomunikacji Międzynarodowego Związku Telekomunikacyjnego

seg-0e8094e4d45c = jego zalecenia serii P modelują propagację

seg-3e325d97365e = IVS

seg-6f8a6ec848a6 = Międzynarodowa Służba VLBI dla Geodezji i Astrometrii

seg-2dd00d470e14 = JD / MJD

seg-107e6683f70d = data juliańska / zmodyfikowana data juliańska

seg-996d4952554f = JMLR

seg-a1ef35b98931 = Journal of Machine Learning Research

seg-d370f89393c7 = JOSA

seg-12c154fcd073 = Journal of the Optical Society of America

seg-58fb16c8a046 = JRC / JRC122785

seg-82f85268028f = Wspólne Centrum Badawcze Komisji Europejskiej / jeden z numerów jego raportów

seg-23f5be8ff49e = JS

seg-516ee91e60c5 = JavaScript

seg-02d421e784cd = JavaScript Object Notation

seg-4da0210abab0 = JSTSP

seg-9d88dcfe6818 = IEEE Journal of Selected Topics in Signal Processing

seg-919a951f3d02 = KF

seg-436a208697f1 = filtr Kalmana

seg-9c92e0bc42aa = KML

seg-caf09d501881 = Keyhole Markup Language

seg-ffe25881cef6 = norma OGC odczytywana przez Google Earth

seg-6e9501f1d4ff = KP16 / KRAC / LU22 / APOL

seg-e1552da90a21 = etykiety typów rekordów własnego tekstowego formatu komunikatu nawigacyjnego LEO w { -brand }

seg-3269a4e6b3e3 = rozszerzenie { -brand }, a nie norma

seg-b7f0168b6037 = KPI

seg-a5ff89f0923d = kluczowy wskaźnik efektywności

seg-1c4a7ccef434 = KSC

seg-73a4bf4da46f = Kennedy Space Center

seg-e401e5d923f0 = KVN

seg-09f93b4d4d0b = Keyword = Value Notation

seg-7379ade4ee0e = postać tekstowa komunikatów CCSDS

seg-a24cf86216d0 = LANS

seg-2ee81a2bc69b = Lunar Augmented Navigation Service

seg-849e3161b64b = LAPACK

seg-3b4f3c08a5ba = Linear Algebra PACKage

seg-69cd99d2f937 = LCG

seg-bcddea3df96d = liniowy generator kongruencyjny

seg-8927ca404e64 = generator serii testowej NIST SP { "1065" }

seg-0b9b908055cf = LCNS

seg-f9200a1b7246 = Lunar Communications and Navigation Services

seg-5253cae4b05b = usługa ESA Moonlight

seg-2361aef1e2e3 = LCRNS

seg-470ea343b5ac = Lunar Communications Relay and Navigation Systems

seg-8fc87d3026e5 = LFSR

seg-bfecf2f88f17 = rejestr przesuwny ze sprzężeniem liniowym

seg-5b09c8e3f127 = generowanie kodów rozpraszających

seg-944b45f65820 = LGPL

seg-1e1bf7d7dc79 = GNU Lesser General Public License

seg-0d4d5316b1d8 = LIL

seg-6d040101c6fa = prawo iterowanego logarytmu

seg-e48d4b1feeaf = LLI / SSI

seg-81ace10136b6 = wskaźnik utraty synchronizacji / wskaźnik siły sygnału

seg-7d95179a5a1f = flagi obserwacji RINEX

seg-2ac0ebb389e7 = LLR

seg-29bcbb78931b = laserowe pomiary odległości do Księżyca

seg-20deda97c876 = LLVM

seg-5a84a3219546 = infrastruktura kompilatorów LLVM (pierwotnie Low Level Virtual Machine)

seg-277ed5c4cbcc = LNAV

seg-d2fa9c420999 = starszy komunikat nawigacyjny

seg-7f5ad6ab8c23 = GPS

seg-6379745571a9 = LNCSS

seg-b8c48f2bfaf0 = księżycowy system satelitarny nawigacji i łączności

seg-4ce3c0ea7a31 = studia przypadków konstelacji w NAVIGATION { "70" }({ "4" }), navi.613

seg-b13c5776e35b = LNIS

seg-7c67c5753d20 = LunaNet Interoperability Specification

seg-881578d31056 = LNSS

seg-25d4f3a4d3f6 = Lunar Navigation Satellite System

seg-97ff1706b4bd = proponowana konstelacja księżycowa

seg-ec733de1adc5 = LPV / LPV-200

seg-40d72ae4bc9a = działanie lokalizatora z prowadzeniem pionowym / jego kategoria wysokości decyzji { "200" } ft

seg-090ba62634a8 = podejście lotnicze

seg-b4921e83ddc9 = LRO

seg-2d1b9f5efdb1 = Lunar Reconnaissance Orbiter

seg-8f782bde5659 = LS

seg-c5bc49526464 = sekundy przestępne

seg-54ea05b82cb4 = jak w Δt_LS

seg-15111a93c6d7 = LT

seg-35231d8b9b39 = czas świetlny

seg-4729314afd46 = LTE

seg-1a7e158f020f = Long-Term Evolution

seg-3c1b3acc46d9 = standard sieci komórkowej 4G

seg-3530cdaca137 = LU

seg-58ad64b9d450 = rozkład dolnotrójkątno-górnotrójkątny

seg-ef1a45eba6aa = LuGRE

seg-72ec36312101 = Lunar GNSS Receiver Experiment

seg-84874825a5d1 = poleciał na Księżyc w { "2025" }

seg-e6719690faa2 = LuPNT

seg-be19fb902b36 = księżycowa biblioteka PNT ze Stanfordu

seg-893ba320da76 = nazwa

seg-fc68b2fb9529 = MAAST

seg-e98d356a165f = MATLAB Algorithm Availability Simulation Tool

seg-a24b3840d248 = Stanford

seg-71063143c8be = MAIT

seg-2d7aa60c26ba = wytwarzanie, montaż, integracja i testy

seg-0397322eae11 = MAR099 / JUP365 / SAT441

seg-bd57191f860b = rozwiązania efemeryd satelitów księżyców Marsa, Jowisza i Saturna z JPL

seg-9b0688bfc31e = identyfikatory

seg-a8748c38de15 = MASPS

seg-e25a3738b952 = minimalne normy użytkowe systemów lotniczych

seg-16a3c8f74c1c = MATLAB

seg-bebc110fded7 = MATrix LABoratory

seg-e722ea781fdf = produkt do obliczeń numerycznych

seg-7c03fb6e56f6 = MAUT

seg-e409f72ac9ab = wieloatrybutowa teoria użyteczności

seg-4a29ddd9b24e = MC

seg-19a7ad528cf3 = MCD

seg-202b82bfefcf = Mars Climate Database

seg-371da1e857e8 = MCDA

seg-17d89019fd4a = wielokryterialna analiza decyzyjna

seg-b522fc3d6c82 = MCI / MCMF

seg-f5544acf642a = inercjalny układ związany z Księżycem / układ związany z Księżycem i z Księżycem

seg-f7b59f61da60 = MDB

seg-0c674a59d087 = minimalny wykrywalny bias

seg-c769430226c3 = MDEV

seg-33a4628c6e67 = zmodyfikowane odchylenie Allana

seg-bde3f0e5dfa7 = MEMS

seg-8b08f307de8a = systemy mikroelektromechaniczne

seg-c960c0e048b7 = MeO / MLRO

seg-48623f76be86 = MéO (Métrologie Optique), stacja laserowa w Grasse / Matera Laser Ranging Observatory

seg-a8fcbefbbf4c = stacje laserowych pomiarów odległości do Księżyca

seg-8b597c678c3f = ME / PA

seg-cb56efe2fb70 = średnia Ziemia / osie główne

seg-f30f1a2778cf = dwa księżycowe układy związane z ciałem (MOON_ME, MOON_PA)

seg-308d4c93a8a3 = MGEX

seg-b2b632cd52d2 = Multi-GNSS Experiment

seg-86fd2d84ed21 = IGS

seg-79f8412f30f2 = MIT

seg-70012b81c998 = Massachusetts Institute of Technology

seg-e9d7062835a9 = jak w licencji MIT

seg-a0b70e8c4c38 = MLP

seg-77abd5634603 = perceptron wielowarstwowy

seg-6975432180f6 = mała sieć neuronowa

seg-a4be7b1d83e3 = MOD / TOD

seg-421b9611e897 = średni na datę / prawdziwy na datę

seg-1af66f9b771d = układy równika i równonocy

seg-b5db821f8008 = MOORA

seg-7f763036e34d = Multi-Objective Optimisation on the basis of Ratio Analysis

seg-d26a24b5d9f0 = MOPS

seg-e8707522cf5f = minimalne normy użytkowe

seg-cd0720a78dbb = MPL

seg-bcdaf8567381 = Mozilla Public License

seg-0f45b55420be = MRO110 / MRO110B2

seg-61415a003e40 = modele grawitacyjne Mars Reconnaissance Orbiter { "110" } i 110B2

seg-8404f70361e7 = MSRV

seg-26a6a79755f9 = minimalna obsługiwana wersja Rusta

seg-959fe8ad53df = MTF

seg-70d61ab4eb42 = funkcja przenoszenia modulacji

seg-7f60d1ac40ad = obrazowanie optyczne

seg-8598e499c145 = MVDR

seg-c767dc9ae21a = odpowiedź bezzniekształceniowa o minimalnej wariancji

seg-83f57219e5b7 = adaptacyjne formowanie wiązki

seg-e1ee50b3ea0a = MWL

seg-12d9510328d2 = łącze mikrofalowe

seg-639266912f59 = łącze transferu czasu ACES

seg-5ac07401e4f8 = NaN

seg-722d679807ee = nie liczba

seg-0e4abc653325 = NavIC

seg-355821380384 = Navigation with Indian Constellation

seg-fc13b86a8365 = NAVISP

seg-2eb6cc573946 = Navigation Innovation and Support Programme

seg-b518d44847fa = NAV / OBS

seg-c6965d4d7202 = nawigacja (komunikat) / obserwacja

seg-1729ddf0eafa = dwa typy plików RINEX; Stanford NAV Lab to Navigation and Autonomous Vehicles Laboratory

seg-f239334e4928 = NBS / NBS14

seg-c8e5edff04d7 = dawne amerykańskie National Bureau of Standards / zbiór danych referencyjnych stabilności częstotliwości NBS14

seg-3d1ac5146fea = służy do sprawdzania estymatorów Allana

seg-37879f5ad9e0 = NEES / NIS

seg-9610f0449fb2 = znormalizowany kwadrat błędu estymacji / znormalizowany kwadrat innowacji

seg-af167a77a1dc = testy spójności filtra

seg-beb7a86721ec = National Geospatial-Intelligence Agency

seg-7aa223cbfe13 = NGS / NOAA

seg-3845b0011dcb = National Geodetic Survey / National Oceanic and Atmospheric Administration

seg-4a1040c5f2fa = NIMA / TR8350

seg-4cf62b739fc6 = National Imagery and Mapping Agency / jej raport techniczny TR8350.2 (definicja WGS { "84" })

seg-ffa6025b5a70 = NIMA to dawna nazwa NGA

seg-af4be907e56c = NLOS

seg-22ab7d58324b = sygnał wyłącznie odbity

seg-9887902c13a1 = NNLS

seg-b4cb6d6bfce4 = nieujemna metoda najmniejszych kwadratów

seg-af8ca8550600 = NORAD

seg-07428e7224cf = North American Aerospace Defense Command

seg-4edb033e3432 = prowadzi publiczny katalog satelitów

seg-dd984e16dbcd = NP

seg-f92816d7c936 = Neymana–Pearsona

seg-fc214695fa83 = teoria detekcji

seg-3ef8006482bb = NPA

seg-81a072ee0520 = podejście nieprecyzyjne

seg-b9fd2cf6a2b9 = lotnictwo

seg-e6cb557ee6d1 = NPB

seg-18510a95b308 = nutacja–precesja–bias

seg-b4562efbafdf = macierz IAU 2006/2000A

seg-c5d8932f6956 = NRL / NRLMSISE-00

seg-9c9f5eac83b2 = Naval Research Laboratory / jego model atmosfery Mass Spectrometer and Incoherent Scatter Radar Extended, { "2000" }

seg-bf373b9cd0c6 = NTN

seg-0ae939342934 = sieć nienaziemna

seg-1ae0305d8455 = 5G z satelitów

seg-20b98c32226f = NTRS

seg-1470d2af037a = NASA Technical Reports Server

seg-243d375db224 = OC-0 … OC-13

seg-d36b43dd505c = identyfikatory przesadnych twierdzeń

seg-47ba87f3730b = wiersze CLAIMS-VS-REALITY.md

seg-e0689f1fc932 = OCI

seg-1a3377171d89 = Open Container Initiative

seg-b5bf07ed6c8c = format obrazu kontenera

seg-7b56c21cca93 = ODE / SDE

seg-722bdf2ca73a = równanie różniczkowe zwyczajne / stochastyczne

seg-a4da10cb1150 = ODM

seg-b1c25bfe0612 = komunikaty danych orbity

seg-35fe6a2f3de3 = rodzina CCSDS obejmująca OEM i OMM

seg-c06d6aa8ba3a = OGC

seg-eb1feb23de1c = Open Geospatial Consortium

seg-9737495b035c = OLS / WLS

seg-63bf35c31a6a = zwykła / ważona metoda najmniejszych kwadratów

seg-487fb3dcfd01 = OPS-SAT / OPSSAT-AD

seg-4be3f4155fc8 = satelita ESA będący laboratorium oprogramowania na orbicie / jego zbiór danych do wykrywania anomalii

seg-14b642ea59e1 = OSIP

seg-4871060090a0 = Open Space Innovation Platform

seg-251b3ff3eb9b = OSNMA / TESLA

seg-aa0d98a5c95a = Open Service Navigation Message Authentication / Timed Efficient Stream Loss-tolerant Authentication

seg-95b6b14facf1 = uwierzytelnianie sygnału Galileo

seg-501a89e8b32b = OS / OSes

seg-5a526cda4166 = Open Service (Galileo, BeiDou) lub system(y) operacyjny(e)

seg-6db10af375e3 = kontekst wskazuje, które znaczenie

seg-584a7e7d4f5e = OU

seg-937187abcdf6 = Ornsteina–Uhlenbecka

seg-9be9042ec983 = proces szumu powracający do średniej

seg-08c583f40405 = PA

seg-9a24d9f45aa4 = zapewnienie jakości produktu (także podejście precyzyjne, jak w K_H,PA)

seg-65ad442b3faa = PCK

seg-c788fe80678e = jądro stałych planetarnych

seg-46a00fdc9d5b = SPICE

seg-417a52c9c154 = PDF

seg-c462c83b47df = Portable Document Format

seg-98aa544ec4de = Pd / Pfa

seg-0c89f304435e = prawdopodobieństwo detekcji / prawdopodobieństwo fałszywego alarmu

seg-5bde4fd55ead = PEF

seg-eb11dcb816ff = układ między TEME a ITRF

seg-4682fd9daa70 = PG01 / PRN120 / GSAT0101

seg-47cc346307a6 = identyfikatory satelitów: etykieta satelity GPS w SP3, numer szumu pseudolosowego SBAS, nazwa satelity Galileo

seg-6ad2383f8545 = PHARAO

seg-0d9ce504e8c7 = Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite

seg-302c8cb738ac = cezowy zegar ACES

seg-2e823cd9d9a6 = PL

seg-099bd07ef3cf = poziom ochrony

seg-7d7eaa5eb223 = PLL

seg-9272ad22c094 = pętla synchronizacji fazy

seg-80e051b734dd = PMC / PMC10301026

seg-1f2a21c5e09f = PubMed Central / jeden z identyfikatorów jego artykułów

seg-3e4617444a63 = PM / FM

seg-c79b1246fb61 = modulacja fazy / modulacja częstotliwości

seg-279251adb2eb = szum fazy zegara lub jego częstotliwości

seg-685fc49957e2 = PN

seg-209dacf76ff3 = jak w pomiarze odległości PN

seg-f9cfe4e70f9a = PNG

seg-bde68df8ee7e = Portable Network Graphics

seg-06998de7b6be = POD

seg-178f55858efb = precyzyjne wyznaczanie orbity

seg-b7919977bf20 = PPN

seg-ed81960f1282 = sparametryzowane postnewtonowskie

seg-9683f98bec2d = PPP / RTK / SPP

seg-73d777100ecd = precyzyjne pozycjonowanie punktowe / kinematyka w czasie rzeczywistym / pozycjonowanie jednopunktowe

seg-edb97cd7ef8b = PPS

seg-197b06571b4d = impuls na sekundę

seg-2619e854281a = PR

seg-66c53cdfc3d9 = pull request

seg-e4dd8a3101cb = PRN

seg-6fb1378e889a = szum pseudolosowy (numer kodu)

seg-6f384580af80 = tak w sygnałach nazywane są satelity GNSS

seg-e8ca48eb958b = PROMETHEE

seg-e4e92d708223 = Preference Ranking Organization METHod for Enrichment of Evaluations

seg-d92234e26d53 = PRX

seg-c5774fede0a9 = Physical Review X

seg-8687e6badb6b = czasopismo

seg-78a947083d45 = PSD

seg-6eb799bd1582 = gęstość widmowa mocy

seg-ab1af8b3d968 = zob. wyżej

seg-f7c4f1cff2a4 = PS / SPS

seg-e90e463df4b8 = Performance Standard / Standard Positioning Service

seg-2800b3a8cd2e = PS dla GPS SPS

seg-c8aa5ca0a4ea = PTB

seg-cf2a7714694f = Physikalisch-Technische Bundesanstalt

seg-611e7e4a34f4 = niemiecki państwowy instytut metrologiczny

seg-2d4bc9f59158 = PTP

seg-6291d09d3a93 = Precision Time Protocol

seg-44a14eeae3dd = IEEE { "1588" }

seg-bc4ad791804e = PVT

seg-1939c4e19702 = pozycja, prędkość i czas

seg-a9aedd1f9806 = PyO3 / PyPA / PyPI

seg-95cead42b0d0 = biblioteka wiążąca Rust i Python / Python Packaging Authority / Python Package Index

seg-96b2c707a6b8 = Parametry Zemli { "1990" }

seg-3d5012a62544 = układ geodezyjny GLONASS

seg-9d14fb150c09 = QA

seg-582cb8ea13ac = zapewnienie jakości

seg-7025be647972 = QEMU

seg-d2209c7eea42 = Quick Emulator

seg-d23b9bd48594 = QPSK

seg-45db179e8e49 = kwadraturowa modulacja z kluczowaniem fazy

seg-b6d487bd53ed = QZSS

seg-c0484340bc52 = Quasi-Zenith Satellite System

seg-531943b17837 = Japonia

seg-697c55525b36 = RAAN

seg-85cd6997e07e = rektascensja węzła wstępującego

seg-79e641db1aae = RAFS

seg-9fa6a6b0e193 = RDRR

seg-19b00c5b9270 = Resist–Detect–Respond–Recover (przeciwstawiaj się, wykrywaj, reaguj, odzyskuj)

seg-76da7c5bf39a = model odporności RethinkPNT/Firesmith

seg-7bb5ed20c788 = RF

seg-35b036272c8e = częstotliwość radiowa

seg-404104795160 = RHEL

seg-dd1bb2300eb5 = Red Hat Enterprise Linux

seg-34b1e77b1ff0 = RHS

seg-0b4bdbcd1476 = prawa strona

seg-f801cff658be = RMS / RSS

seg-6b758beecbfc = pierwiastek ze średniej kwadratowej / pierwiastek z sumy kwadratów

seg-8b2bd83256f1 = RNG

seg-b90957003307 = generator liczb losowych

seg-354b42e3a5d0 = RNTF

seg-0ce1e8f8bd4a = Resilient Navigation and Timing Foundation

seg-43d17f884c69 = ROI

seg-597432415e53 = zwrot z inwestycji

seg-7abb945359d0 = RPCF

seg-8c71df162ddd = Resilient PNT Conformance Framework

seg-2f030c1d70c1 = DHS USA

seg-82b81c1e28d6 = RTCM

seg-7b855a1075d4 = Radio Technical Commission for Maritime Services

seg-4a7703f1b605 = jej norma komunikatów zawiera CRC-24Q

seg-520c91fa0ef0 = otwartoźródłowa biblioteka pozycjonowania GNSS (biblioteka kinematyki w czasie rzeczywistym)

seg-a8b2e577e381 = RTN

seg-6ddf35119d08 = radialny, poprzeczny, normalny

seg-b1b635ff08e4 = układ związany z orbitą

seg-04f4b26e9283 = RW

seg-b8b1a31739aa = błądzenie losowe

seg-8b593d7d5dbd = jak w błądzeniu losowym biasu

seg-6f954dc5a005 = RWFM / WFM / FFM / WPM / FPM

seg-928fe3abcd5b = modulacja częstotliwości typu błądzenie losowe, biała i migotania / modulacja fazy biała i migotania

seg-7fced178bcc5 = potęgowe typy szumu zegara

seg-e39ddb9e8ec1 = SA.45s / SA65, OX-208

seg-0c397d845610 = nazwy produktów Microchip (dwa atomowe zegary w skali układu scalonego, oscylator kwarcowy w termostacie)

seg-8a1ae00c4a52 = nazwy, a nie skróty

seg-a58426a850fd = SD

seg-d46cb77d53f6 = odchylenie standardowe

seg-e29dd726165f = SDD

seg-0ebb68e4b6fd = Service Definition Document

seg-9415da7a79ab = jak w Galileo OS SDD

seg-1022626b788c = SDK

seg-2076da4dd4dd = zestaw narzędzi programistycznych

seg-9fb492bced01 = SDR

seg-1a1082059103 = radio definiowane programowo

seg-0a647acd4355 = SDS

seg-d0f6ae60b687 = Space Defense Squadron

seg-c3f6fc1456ed = 18. SDS prowadzi amerykański katalog satelitów

seg-cf28e3e14401 = SEP

seg-a67fb04e0911 = kąt Słońce–Ziemia–sonda (także kołowy błąd prawdopodobny sferyczny)

seg-0c7631f367e8 = SGD

seg-d58ce1e25c08 = stochastyczny spadek gradientu

seg-2f25205204e4 = SHM

seg-f2e2253a31b3 = prosty ruch harmoniczny

seg-b0973ab206ed = SI

seg-35624e5e4630 = Międzynarodowy Układ Jednostek Miar

seg-02aa435dc884 = SIB

seg-262a811c8b69 = Safety Information Bulletin

seg-b9ee445609f5 = EASA; EASA to Agencja Unii Europejskiej ds. Bezpieczeństwa Lotniczego

seg-8d6d4fe3d155 = SINEX

seg-e5c071685532 = Solution INdependent EXchange format

seg-3466519e4c62 = rozwiązania geodezyjne

seg-b21a3d7fb59d = SIR

seg-303809c700e2 = ponowne próbkowanie z ważnością

seg-7a2e0e9cac08 = filtr cząstkowy

seg-6da637028ef8 = SIS / SISA

seg-9779a20e50d2 = sygnał w przestrzeni / dokładność sygnału w przestrzeni

seg-c0e9f44b333d = SITAN

seg-3eec2c14b564 = Sandia Inertial Terrain-Aided Navigation

seg-ceee87dd4b5e = SLR

seg-c8e722f1609c = laserowe pomiary odległości do satelitów

seg-76d80b0d2deb = SMAD

seg-7fbda47e3858 = Space Mission Analysis and Design

seg-dfc105c0178b = podręcznik

seg-5278559437c5 = SNR

seg-b97c29ce3b37 = stosunek sygnału do szumu

seg-ff2faf259a15 = SOS / SSE

seg-5a2e327af384 = suma kwadratów / suma kwadratów residuów

seg-453c4506fd59 = SOTA

seg-7eaa0caa6916 = stan wiedzy

seg-127e73a3610b = NIST Special Publication { "1065" }

seg-bedc9a3d8d9f = ten sam dokument co NIST SP { "1065" }

seg-cf2491c1a488 = SPD / PD

seg-eade81634bf5 = symetryczna dodatnio określona / dodatnio określona

seg-5fedf0f7b5c0 = SPDX

seg-3aba3c5a5c19 = Software Package Data Exchange

seg-c10b1f20f37e = identyfikatory licencji w nagłówkach plików

seg-b377a91a047f = SPK

seg-5603642c612d = jądro SPICE dla efemeryd statków kosmicznych i planet

seg-cf18ba9c86d8 = SPOF

seg-cfab8d8a2cdf = pojedynczy punkt awarii

seg-c06f64211c40 = SQM

seg-7e58d6a4a92c = monitorowanie jakości sygnału

seg-a4e75468e6f9 = kontrole spoofingu na podstawie kształtu korelatora

seg-0bb7a4875914 = SRIF

seg-82da1a1f1be4 = filtr informacyjny pierwiastkowy

seg-970edb8ec42f = SRP

seg-ae097fbdabf9 = ciśnienie promieniowania słonecznego

seg-edc814ba451b = SRTM / SRTMHGT

seg-b756bc93d2ea = Shuttle Radar Topography Mission / jej format plików wysokości

seg-4692354a98de = kafle nazywa się według ich południowo-zachodniego narożnika, na przykład N36W117

seg-00f36f1678d6 = SSD

seg-532285d8e6ce = Solar System Dynamics

seg-1d8167212f57 = grupa JPL

seg-d21315ea8c52 = STEC

seg-84689b829867 = ukośna całkowita zawartość elektronów

seg-eabee4bfb30e = Systems Tool Kit

seg-a7ff60ab0bd9 = produkt do analizy misji

seg-17d792c12885 = usługa pozycjonowania i czasu firmy Iridium

seg-3efaadad9c96 = STM

seg-da395fa674ec = macierz przejścia stanu

seg-d116578b987b = SV

seg-caa37a1e7d12 = pojazd kosmiczny (satelita)

seg-845e6f3a37ec = SVD

seg-e775c436db4b = rozkład według wartości osobliwych

seg-3e5561868a7f = Scalable Vector Graphics

seg-4c48f567e37c = TAES

seg-db881ca72cd5 = IEEE Transactions on Aerospace and Electronic Systems

seg-39b93d9b401a = TC / TM

seg-b0df03cff98a = telekomenda / telemetria

seg-fafb84a9796a = TDD

seg-ec3b92ad43c3 = programowanie sterowane testami

seg-40defa915d0d = TDOA / FDOA

seg-e7db8768b023 = różnica czasu / częstotliwości przybycia

seg-aecac9c9d2d0 = pasywna lokalizacja emitera

seg-01861b3d63bf = TERCOM

seg-9ef3f9cbbe77 = dopasowanie konturów terenu

seg-5da9ae904ae0 = TEXBAT

seg-e90183a6fc69 = Texas Spoofing Test Battery

seg-941eccec7400 = zarejestrowane dane ze spoofingu GNSS (OAKBAT to zbiór danych tej samej klasy)

seg-e71c15afe44e = TIE

seg-19bfea0d5c88 = błąd interwału czasu

seg-eb12660210bd = TIES

seg-9335f08b6381 = Telecommunication Information Exchange Service

seg-12f4af2b48c1 = konta członków ITU

seg-c05ba396ac1e = ToA

seg-78a41e672189 = czas przybycia

seg-7d821e75fdf7 = TOL

seg-4c7600f40479 = tolerancja

seg-1f8b3be77dcc = TOPSIS

seg-00812e7bff63 = Technique for Order of Preference by Similarity to Ideal Solution

seg-c9a6058c9715 = TOTDEV / TOTVAR

seg-53a19d838c2d = odchylenie całkowite / wariancja całkowita

seg-7350da5c5c30 = estymatory stabilności o rozszerzonym zakresie

seg-91d2f49dc7c0 = TPAMI

seg-e9b41a993d86 = IEEE Transactions on Pattern Analysis and Machine Intelligence

seg-85692b01a12d = TPL

seg-123ed92776a3 = poziom ochrony czasu

seg-10c9563602b7 = zob. SLOT-TIMING.md

seg-d1e3f93bc0aa = TPS

seg-579b1467ca5f = system ochrony termicznej

seg-3b7fe44cc552 = TRN

seg-5239a432b919 = nawigacja odniesiona do terenu

seg-1df3bcf7eb97 = TR / TN

seg-ef0ff09dc412 = raport techniczny / nota techniczna

seg-643fa447bcee = TU Delft

seg-5c5492ecd86f = Politechnika w Delft

seg-f3f22590bc57 = TWSTFT / TWTFT

seg-28c80c27a136 = dwukierunkowy satelitarny transfer czasu i częstotliwości / dwukierunkowy transfer czasu i częstotliwości

seg-e1a149ff6c43 = UBX

seg-fa0e9838530e = binarny protokół odbiorników u-blox

seg-9555546fed38 = UDRE

seg-5fd7aec5beda = różnicowy błąd odległości użytkownika

seg-a3f5dda611b0 = SBAS

seg-b6f0baa6e478 = UERE

seg-4d1cb1c3ade9 = równoważny błąd odległości użytkownika

seg-7d87e82154ed = UFFC

seg-02457dbb660b = Ultrasonics, Ferroelectrics, and Frequency Control

seg-f4da31f92a79 = czasopismo IEEE Transactions

seg-573db7b5995b = od { "300" } MHz do { "3" } GHz

seg-3688c8d84cdc = UI / UX

seg-42162760360f = interfejs użytkownika / doświadczenie użytkownika

seg-7a56f7e38c5a = ULA

seg-4f4d9da7855c = jednorodny szyk liniowy

seg-db65f4a7586d = ULP

seg-ae7458813685 = jednostka na ostatniej pozycji

seg-d7f4df5a9d13 = precyzja zmiennoprzecinkowa

seg-81dc0f4f1b2c = URA / URE

seg-c92cbc3e3954 = dokładność odległości użytkownika / błąd odległości użytkownika

seg-17e8fb142c6c = URA ogranicza integralność, URE to RMS dokładności

seg-1e02dfc0a52b = URL

seg-f726bcd9d4ad = ujednolicony adres zasobu

seg-088e05d67af1 = USGS

seg-ffed8eca324d = United States Geological Survey

seg-1ded2eb40061 = USNO

seg-2b5f7bbe22e9 = United States Naval Observatory

seg-39ed84639c60 = USO

seg-f9f684640e53 = oscylator ultrastabilny

seg-b3a829cb7d84 = US Standard Atmosphere { "1976" }

seg-ba97a4005ee8 = VIKOR

seg-dfb9c6638023 = VIseKriterijumska Optimizacija I Kompromisno Resenje (optymalizacja wielokryterialna i rozwiązanie kompromisowe)

seg-7fe170288e4e = interferometria o bardzo długiej bazie

seg-2e95d53160df = WAAS / EGNOS

seg-8a3ae96dd95a = Wide Area Augmentation System / European Geostationary Navigation Overlay Service

seg-1746693259e0 = SBAS; zob. wyżej

seg-98f4f946a7ac = WASM

seg-257c477dc510 = WebAssembly

seg-eaf260aa0e21 = WASPAS

seg-4da2350f07f2 = Weighted Aggregated Sum Product ASSessment

seg-c9710476b8b5 = Grupa Robocza C współpracy Unii Europejskiej i Stanów Zjednoczonych w dziedzinie nawigacji satelitarnej

seg-79f0e87410bf = publikuje dokumenty referencyjne ARAIM

seg-199e55106e0f = WGCCRE

seg-9e2d0f828a0a = Working Group on Cartographic Coordinates and Rotational Elements

seg-d1939d914701 = WGN

seg-6bbc3adc6a53 = biały szum gaussowski

seg-1e422c9001d4 = WGS72 / WGS84

seg-dab1ec7739ae = World Geodetic System { "1972" } / { "1984" }

seg-5964aa61f847 = SGP4 używa stałych WGS72

seg-f4ea25131d04 = WHU

seg-7d30c759d92f = Uniwersytet Wuhan

seg-5d028f5e2120 = WSM / WPM

seg-ce407535733f = model sumy ważonej / model iloczynu ważonego

seg-cc68c85bb2b9 = agregacja wielokryterialna (WPM oznacza też białą modulację fazy; kontekst wskazuje, które znaczenie)

seg-9041c866d202 = XML

seg-0e55c3adc568 = Extensible Markup Language

seg-93e0e8702167 = XOR

seg-cfa3197f8c1d = alternatywa wykluczająca

seg-7fba187cb552 = X / Y / Z / F (XYZF), D / I

seg-195082605699 = składowe pola geomagnetycznego: północna, wschodnia, w dół, natężenie całkowite; deklinacja, inklinacja

seg-94835748fcbb = YAGNI

seg-76430d755d74 = you aren't gonna need it (nie będzie ci to potrzebne)

seg-e4e177088376 = zasada projektowa

seg-565c1908393c = ZHD

seg-77a0948bc15d = zenitowe opóźnienie hydrostatyczne

seg-749be52554c5 = Odtwarzalność i licencjonowanie

seg-d78d9bbb905c = <b>Odtwarzalny (deterministyczny).</b> To samo wejście zawsze daje bit po bicie identyczny wynik — <c1/>. Żadnej ukrytej losowości.

seg-1412347e2298 = <b>Ziarno (seed).</b> Liczba inicjująca (deterministyczny) generator liczb losowych, dzięki czemu przebiegi można powtórzyć.

seg-3a35740e04a8 = <b>Open core.</b> Model biznesowy: silnik jest darmowy i otwartoźródłowy (AGPL-3.0, GNU Affero General Public License zdefiniowana poniżej; z podwójnym licencjonowaniem komercyjnym); podtrzymujący go biznes to wsparcie, integracja, licencje komercyjne i zastrzeżone dodatki, a nie opłaty za stanowiska za otwarty silnik.

seg-8ea21ebded3c = <b>AGPL-3.0.</b> GNU Affero General Public License v3 — licencja otwartoźródłowa z silnym copyleftem, zatwierdzona przez OSI (Open Source Initiative). Podobna do GPL (GNU General Public License), lecz z dodatkową klauzulą (§{ "13" }) obejmującą oprogramowanie udostępniane użytkownikom <b>przez sieć</b>: zmodyfikowana wersja dostępna przez sieć musi oferować tym użytkownikom swój odpowiadający jej kod źródłowy. Otwarta licencja { -brand }.

seg-f87860d8197d = <b>Podwójne licencjonowanie.</b> Oferowanie tego samego kodu na dwóch licencjach, spośród których użytkownicy wybierają: tutaj AGPL-3.0 (otwarta, copyleft) <b>albo</b> licencja komercyjna od Ashforde OÜ (estońskiej spółki z ograniczoną odpowiedzialnością; OÜ = osaühing) do użytku zastrzeżonego lub zamkniętego, do którego AGPL się nie nadaje. Zob. <c1/>.

seg-dd5f4a1bbbf5 = Używane także na kshana.dev

seg-9d0c42560a90 = Skróty używane na stronie internetowej, których nie ma w glosariuszu repozytorium powyżej.

seg-67a54ce8c89e = Global Positioning System

seg-814b0d29bbb2 = stosunek mocy nośnej do gęstości szumu, w dB-Hz

seg-f22a269bc575 = pasmo radiowe od { "1" } do { "2" } GHz używane przez GNSS

seg-1f4360a0405c = kod zgrubny/akwizycyjny GPS L1

seg-6f7910207534 = Augmented Forward Signal (księżycowy)

seg-74f02864ce32 = systemy mikroelektromechaniczne

seg-0f931242ecc0 = UAS

seg-dddfd223a3b1 = system bezzałogowego statku powietrznego

seg-7091aabf8b6d = PL · AL

seg-12d88ab45197 = poziom ochrony · limit alarmowy

seg-78134bcc48da = podejście z prowadzeniem pionowym, poziom I

seg-27328b36b476 = LEO · GEO

seg-b1ae7014a663 = niska orbita okołoziemska · orbita geostacjonarna

seg-c1d933dd3965 = OEM · OMM · TDM

seg-5d0ebe2bc51c = komunikaty CCSDS: efemerydy orbity, średnie elementy orbity i dane śledzenia

seg-fa9240660ec4 = IGRF

seg-c19fd59fdca0 = DSN

seg-7979317c75d2 = Deep Space Network

seg-c194401c2039 = TCXO · OCXO

seg-5c9d0b4c561d = oscylator kwarcowy z kompensacją temperatury · w termostacie

seg-f3a7cc221b63 = PHM

seg-08d5cfc5b460 = pasywny maser wodorowy

seg-5ed928b1c6d0 = USO · DSAC

seg-b77f2ea4a521 = oscylator ultrastabilny · Deep Space Atomic Clock

seg-553814463110 = MTIE · TDEV

seg-2d9b8af50414 = maksymalny błąd interwału czasu · odchylenie czasu

seg-5b155b60152f = PRTC · ePRTC

seg-93d590e6408d = podstawowy zegar czasu odniesienia · rozszerzony PRTC

seg-8541a73eef89 = ADEV · σy(τ)

seg-a2ae4a40f486 = odchylenie Allana przy czasie uśredniania τ

seg-96fae3b4fb8e = Międzynarodowy Związek Telekomunikacyjny, Sektor Normalizacji Telekomunikacji

seg-24cab92c0fd3 = NIS · NEES

seg-7e82e2927d59 = znormalizowany kwadrat innowacji · znormalizowany kwadrat błędu estymacji

seg-7175ab55e707 = JSON · CSV · SVG

seg-a9a2906d15de = JavaScript Object Notation · wartości rozdzielone przecinkami · Scalable Vector Graphics

seg-d3a9009a35c0 = CLI · API · IDE

seg-c6418e1f785d = interfejs wiersza poleceń · interfejs programistyczny aplikacji · zintegrowane środowisko programistyczne

seg-8df86177107a = SBOM · SLSA

seg-e54326c78ab0 = wykaz składników oprogramowania · Supply-chain Levels for Software Artifacts

seg-347b23148b8f = NDA

seg-969d2489de28 = umowa o zachowaniu poufności

seg-564cfa0d3084 = Digital Object Identifier

seg-5cbd99859d90 = wodospad C/N₀

seg-ed4a9e041a83 = wykres stosunku mocy nośnej do gęstości szumu dla każdego satelity w czasie

seg-1cb49c7e6c7f = HPL · VPL

seg-ccdc7d672c8f = poziomy · pionowy poziom ochrony

seg-c7a40ebac7e1 = LROC

seg-529f02f85a76 = Lunar Reconnaissance Orbiter Camera

seg-c5da9d350518 = <s1>Poprzednia</s1>Podstawy pojęć

seg-670504be0531 = <s1>Następna</s1>Przewodnik po Studio
