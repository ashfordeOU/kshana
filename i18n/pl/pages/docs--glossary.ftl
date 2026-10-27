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
