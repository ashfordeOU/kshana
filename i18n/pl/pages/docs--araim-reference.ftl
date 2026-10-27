# docs--araim-reference: translations (pl)

seg-c316596d7ec8 = Źródło: <c1/>

seg-4768b19aaed7 = Opis ARAIM — poziomy ochrony zaawansowanego RAIM w Kshana

seg-93c83a737a43 = Ta notatka dokumentuje otwartą implementację <b>Advanced Receiver Autonomous Integrity Monitoring (ARAIM)</b> w Kshana: algorytm, każde założenie, komunikat wsparcia integralności, z którego korzysta, oraz stan walidacji. Implementacja znajduje się w <a1><c1/></a1>; ten dokument jest prozatorskim uzupełnieniem, które audytor (lub recenzent zakupów) może czytać obok kodu.

seg-f5a7abecc2df = ARAIM to dwukonstelacyjny, wieloczęstotliwościowy następca klasycznego RAIM, zdefiniowany przez GPS (Global Positioning System)–Galileo Working Group C (WG-C) dla wsparcia prowadzenia poziomego i pionowego aż do LPV-200 (LPV: localizer performance with vertical guidance). Odpowiada w każdej epoce na jedno pytanie:

seg-252dac107a2a = Jak duża musi być granica błędu pozycji (<em>poziom ochrony</em>), aby resztkowe prawdopodobieństwo <em>niebezpiecznie mylącej informacji</em> — błędu większego niż granica, gdy granica wciąż mieści się w limicie alarmowym — pozostawało poniżej budżetu ryzyka integralności <c1/>?

seg-04299e9742b7 = { "1" }. Komunikat wsparcia integralności (ISM)

seg-717bea7d6bc8 = ISM to zestaw parametrów dla każdej konstelacji, który stosuje użytkownik. Jest jawnie modelowany przez <a1><c1/></a1>:

seg-fffbeccd4266 = Symbol

seg-2247a2344710 = Znaczenie

seg-d7e49778bed2 = σ_URE / SISE (błąd sygnału w przestrzeni)

seg-b1b5bca63e21 = RMS (root mean square) błędu odległości używane dla <b>dokładności i ciągłości</b>

seg-8ff2973d7f5b = σ_URA / SISA (dokładność sygnału w przestrzeni)

seg-f993962a5c9b = granica błędu odległości używana dla <b>integralności</b> (≥ σ_URE)

seg-727c7fbe1b01 = maksymalne nominalne obciążenie odległości wliczone jednostronnie w granicę integralności (<c1/>); zob. §{ "3" }

seg-a79e42c29c46 = prawdopodobieństwo a priori niewykrytej usterki pojedynczego satelity

seg-78c45312d2ff = prawdopodobieństwo a priori usterki obejmującej całą konstelację

seg-19cc5ff2e541 = <c1/> zwraca opublikowane wartości referencyjne WG-C: <b>σ_URA = { "0.75" } m</b>, <b>σ_URE = { "0.67" } m</b>, <b>b_nom = { "0.75" } m</b>, <b>P_sat = { "1" }×{ "10" }⁻⁵</b>, <b>P_const = { "1" }×{ "10" }⁻⁴</b> w przedziale ekspozycji. Są to wartości używane do wymiarowania dostępności ARAIM w literaturze referencyjnej; operacyjny ISM jest nadawany lub składany po stronie naziemnej i można go konfigurować dla każdej konstelacji. Rozróżnienie między σ_URA (integralność) a σ_URE (dokładność) jest zamierzone i stanowi cechę definiującą pojęcie ISM.

seg-0c1687628e67 = <c1/> i <c2/> przekazują je wprost do obu silników.

seg-8c516e53f595 = { "2" }. Hipotezy usterek

seg-b6353366ebf0 = ARAIM jest metodą <em>separacji rozwiązań dla wielu hipotez</em> (MHSS). Dla każdej hipotezy usterki <c1/> tworzy rozwiązanie z wszystkich widocznych satelitów i podrozwiązanie wyłączające zbiór uszkodzony oraz ogranicza błąd pozycji przy tej hipotezie:

seg-3b340e082b84 = <c1/> (prawdopodobieństwo a priori <c2/>): pełne rozwiązanie metodą najmniejszych kwadratów ze wszystkich widocznych satelitów.

seg-03332e433edc = Usterki pojedynczych satelitów

seg-add4792e4e40 = <c1/> (prawdopodobieństwo a priori <c2/> każda): każde podrozwiązanie z wyłączeniem jednego satelity. To klasyczny punkt odniesienia ARAIM dla pojedynczej usterki, <a1><c3/></a1>.

seg-7e20f419e670 = Usterki obejmujące całą konstelację

seg-920bd35833ff = <c1/> (prawdopodobieństwo a priori <c2/> każda): podrozwiązanie, które usuwa <em>wszystkie</em> satelity jednej konstelacji naraz, rozszerzenie z noty technicznej (TN) ARAIM UE (Unii Europejskiej) / DO-316 zaimplementowane w <a1><c3/></a1>. Przy <c4/> sprowadza się <b>co do bitu</b> do <c5/>.

seg-323dd205d238 = { "3" }. Poziomy ochrony

seg-9ab2676d2554 = Dla każdej osi (pionowej, poziomej) i każdej hipotezy silnik buduje tryb <c1/>, w którym próg jest granicą detekcji separacji rozwiązań przy mnożniku fałszywego alarmu <c2/> (podział Bonferroniego budżetu ciągłości na <c3/> hipotez). Poziom ochrony jest najmniejszą granicą <c4/>, której zsumowane ryzyko integralności

seg-05c0d8fc855c = Uwaga implementacyjna.

seg-248092fe9b94 = <c1/> jest jednostronną projekcją nominalnego obciążenia na oś — najgorszą sumą wartości bezwzględnych wzmocnień poszczególnych satelitów (<a1><c2/>/<c3/></a1>) — pochodzącą z <c4/> z ISM. Referencyjny ISM WG-C używa <c5/>; przy <c6/> granica sprowadza się do postaci MHSS bez nominalnego obciążenia. Uruchamialny scenariusz <c7/> udostępnia <c8/> (granicę integralności użytą do poziomu ochrony, obciętą do ≥ <c9/> i domyślnie równą tej wartości) oraz <c10/> (domyślnie { "0" }), więc poziom ochrony jest zawsze wymiarowany granicą integralności σ_URA, nigdy mniejszą dokładnością σ_URE. Pozostaje to <b>modelowana, niecertyfikowana</b> implementacja ARAIM — zob. <a2><c11/></a2>.

seg-f6bccff61ff5 = mieści się w przydzielonym budżecie ([<c1/>] / <a1><c2/></a1>). VPL (pionowy poziom ochrony) i HPL (poziomy poziom ochrony) są odpowiedziami pionową i poziomą. Wynik podaje także faktycznie osiągnięte ryzyko integralności (<c3/> przydział) oraz informację, czy jakieś podrozwiązanie oddzieliło się poza swój próg.

seg-b1a868221848 = To jest jawny kontrakt ARAIM — „jak duża musi być granica?” — a nie domyślne, zależne od geometrii ryzyko klasycznego RAIM ze stałym mnożnikiem.

seg-c90cf313dea8 = { "4" }. Diagram Stanforda

seg-b51e44c3deda = <a1><c1/></a1> gromadzi <c2/> w każdej epoce względem stałego limitu alarmowego (AL), a <a2><c3/></a2> przypisuje każdą do jednej z kategorii: <em>dostępna</em>, <em>system niedostępny</em> (PL > AL, ostrożnie), <em>mylące informacje</em> (PL < błąd ≤ AL) lub <em>niebezpiecznie mylące informacje</em> (błąd > AL i > PL). <a3><c4/></a3> renderuje klasyczny wykres rozproszenia — granicę integralności <c5/>, prowadnice limitu alarmowego i jeden kolorowo oznaczony znacznik na epokę — jako samodzielny SVG (Scalable Vector Graphics).

seg-c902173f6acf = { "5" }. Korzyść z dwóch konstelacji

seg-96e114a6981c = Dwa efekty są zademonstrowane w <c1/>:

seg-06c7d8d62b44 = <b>Geometria / nadmiarowość</b> — połączenie satelitów drugiej konstelacji zacieśnia HPL dla pojedynczej usterki: więcej pomiarów i większy zbiór podrozwiązań z pojedynczym SV (SV: space vehicle, czyli satelitą) dają ściśle mniejszą granicę.

seg-f788c9e07547 = <b>Tolerancja usterki konstelacji</b> — przy aktywnym <c1/> użytkownik dwukonstelacyjny pozostaje dostępny, gdy może zawieść cała konstelacja (satelity <em>drugiej</em> konstelacji przetrwają), podczas gdy użytkownika jednokonstelacyjnego dowodnie nie da się ochronić przed usterką jego własnej konstelacji (<c2/> zwraca <c3/>).

seg-f52a937bad94 = Subtelność, o której warto powiedzieć uczciwie: ponieważ hipoteza usterki konstelacji wymaga przetrwania utraty <em>całej</em> konstelacji, <em>migawkowy</em> poziom ochrony dla dwóch konstelacji jest ograniczony od dołu przez geometrię resztkowej pojedynczej konstelacji — nie jest automatycznie mniejszy niż PL tylko z GPS w każdej chwili. Główny wynik z noty technicznej ARAIM UE, że GPS+Galileo daje <b>o { "15" }–{ "25" } % mniejszy HPL</b>, jest wynikiem <b>dostępności</b> zgromadzonym dla realistycznych konstelacji i położeń użytkownika, a nie gwarancją dla pojedynczej migawki.

seg-b4289b877902 = { "6" }. Stan walidacji

seg-e553de2eee63 = <b>W repozytorium, automatycznie:</b> algebra MHSS (<c1/> ⇒ pojedyncza usterka co do bitu; usterka konstelacji poszerza PL; budżet nigdy nie jest przekroczony), powyższe korzyści z geometrii i usterki konstelacji oraz ćwiczenie na <b>rzeczywistej geometrii precyzyjnych orbit IGS (International GNSS Service; GNSS = globalny system nawigacji satelitarnej) (SP3, Standard Product { "3" })</b> (<c2/>), a nie tylko na konstelacjach syntetycznych.

seg-633bf11af170 = <b>Zewnętrzna wyrocznia — opublikowany przykład obliczeniowy WG-C:</b> poziomy ochrony są sprawdzane względem własnego przykładu liczbowego Podgrupy Technicznej ARAIM, w <a1><c1/></a1>, <c2/> i zatwierdzonym fixture'ze <c3/> (każdy wektor niesie adres URL (adres sieciowy) pobrania, datę pobrania, SHA-256 (SHA: Secure Hash Algorithm) pliku źródłowego i stronę). Tolerancją akceptacji jest własne <c4/> wzorca. Względem Reference Airborne Algorithm Description Document v3.1 ({ "2019" }), Appendix D: <b>VPL { "18.2926" } m wobec { "18.3" } m opublikowanych (Δ { "0.0074" } m)</b>, <b>HPL { "13.4063" } m wobec { "13.45" } m (Δ { "0.0437" } m)</b>, EMT (effective monitor threshold) { "7.2997" } m wobec { "7.2998" } m, σ_v,acc { "1.3694" } m wobec { "1.3694" } m oraz wszystkie sześć opublikowanych wielkości pośrednich usterki konstelacji (σ₃⁽ᵏ⁾, σ_ss,{ "3" }⁽ᵏ⁾, b₃⁽ᵏ⁾) z dokładnością do połowy jednostki na ostatnim wydrukowanym miejscu dziesiętnym. Milestone { "3" } Report z { "2016" } podaje ten sam przykład, ale zawiera dwie wewnętrzne wady — literówkę w znaku w wierszu { "3" } <c5/> oraz <c6/> obliczone dla { "57" } trybów usterek, podczas gdy dokument podaje <c7/> ({ "12" } trybów) — więc jego wielkości pośrednie geometrii odtwarzają się dokładnie, a jego poziomy ochrony są zapisane jako zmierzone rozbieżności (VPL Δ { "0.0171" } m, HPL Δ { "0.0842" } m, EMT Δ { "0.4806" } m) i wyłączone z wartości akceptacji. Kontrola jest osiągalna jako rodzaj scenariusza <c8/>.

seg-6d79f9836abd = <b>Uczciwe residuum (zewnętrzne / oczekujące na przegląd):</b> wartość dostępności { "15" }–{ "25" } % względem <b>zamrożonej w wersji rzeczywistej migawki TLE (two-line element set) z Celestrak</b> oraz złożenie fixture'ów testowych ARAIM jako cytowalnego rekordu w <b>Zenodo</b>. Powyższa kontrola referencyjna obejmuje tylko <c1/> (tryby usterek pojedynczego satelity i pojedynczej konstelacji); jednoczesne podzbiory usterek z wielu zdarzeń, wykluczanie usterek, kontrola spójności χ² i krok ponownego przydziału uwzględniający podwójne liczenie z algorytmu referencyjnego nie są zaimplementowane, a przypadek, którego prawdopodobieństwa a priori by ich wymagały, jest odrzucany, a nie obcinany.

seg-b57b889dc536 = <b>Zasięg w pliku scenariusza:</b> rodzaj scenariusza <c1/> uruchamia <c2/> w każdej epoce, gdy jego plik TOML (Tom's Obvious Minimal Language) ustawia <c3/> (opcjonalnie <c4/>); dołączony <a1><c5/></a1> robi to na połączonej geometrii GPS + Galileo, a <c6/> uruchamia ten sam silnik na rzeczywistych TLE GPS i Galileo z Celestrak, propagowanych do jednej wspólnej epoki. Bez tej flagi program uruchamiający używa klasycznego RAIM z separacją rozwiązań.

seg-6cb7a787ac67 = Bibliografia

seg-46ca3d3cf9df = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Milestone { "3" } Report</em>, Final Version, { "25" } lutego { "2016" } — Annex A (referencyjny algorytm użytkownika) i §A.IX (przykład liczbowy). <a1>https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf</a1>

seg-e5e789005864 = EU–U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM Technical Subgroup, <em>Reference Airborne Algorithm Description Document</em>, Version { "3.1" }, { "20" } czerwca { "2019" } — Appendix D (przykład liczbowy dla LPV-200). <a1>https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/ARAIM_TSG_Reference_ADD_v3.1.pdf</a1>

seg-8758a6e4f6eb = EU–US (Stany Zjednoczone) Cooperation on Satellite Navigation, <em>ARAIM Technical Note</em>.

seg-c4d2879b2ec4 = RTCA (dawniej Radio Technical Commission for Aeronautics) DO-316 / DO-229 MOPS (minimalne wymagania eksploatacyjne); materiały DO-316 ARAIM MASPS (minimalne wymagania dla systemu lotniczego).

seg-d5ed1c3cfb1f = Blanch i in., <em>Baseline Advanced RAIM User Algorithm and Possible Improvements</em>, IEEE (Institute of Electrical and Electronics Engineers) TAES (Transactions on Aerospace and Electronic Systems) / ION (Institute of Navigation) ITM (International Technical Meeting).

seg-a33e29861372 = Walter, Enge, Blanch, Pervan, <em>Worldwide Vertical Guidance of Aircraft Based on Modernized GPS and New Integrity Augmentations</em> (metodologia diagramu Stanforda).

seg-d4f50d307775 = <s1>Poprzednia</s1>Widmo i wykres kaskadowy

seg-f05ca316fe8e = <s1>Następna</s1>Mapa DO-316 / DO-229E
