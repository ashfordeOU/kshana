# docs--integrity: translations (pl)

seg-668241606715 = Źródło: <c1/>

seg-9a8c218ce054 = Integralność i bezpieczeństwo: co { -brand } modeluje, a czego nie

seg-52038c93765d = { -brand } podaje dwa wskaźniki jakości (FoM): <b>Integralność</b> i <b>Bezpieczeństwo</b>, które łatwo pomylić z wielkościami o tych samych nazwach stosowanymi w lotnictwie. Ta strona wprost opisuje, czym są dziś, czym <em>nie</em> są i co dodaje plan rozwoju. Jeśli oceniasz { -brand } pod kątem zastosowań związanych z bezpieczeństwem życia lub certyfikacji, przeczytaj to najpierw.

seg-fb6e93a107e7 = Stan obecny ({ "v0.37.0" })

seg-ecd20ae1a05d = Wskaźnik integralności: samospójność filtra

seg-153391e55508 = Wskaźnik integralności to odsetek próbek z przerwy w sygnale, w których prawdziwy błąd czasu mieści się w granicy ochrony k-sigma wyznaczonej przez sam filtr Kalmana:

seg-ac2413a97a7b = Mierzy on, czy <em>zgłaszana przez filtr</em> niepewność uczciwie odzwierciedla jego <em>własny</em> błąd podczas przerwy w działaniu GNSS (globalnego systemu nawigacji satelitarnej). Jest to użyteczna wewnętrzna kontrola spójności.

seg-c9f80760ea53 = To <b>nie jest</b>:

seg-8899525ad177 = <b>poziomy/pionowy poziom ochrony (HPL/VPL)</b>: nie ma żadnego poziomu ochrony w dziedzinie pozycji (pakiety zegara dotyczą dziedziny czasu);

seg-dd9a3e58e10b = <b>ryzyko integralności / prawdopodobieństwo niebezpiecznie mylących informacji (P_HMI)</b>;

seg-31fa92b3271d = porównanie z <b>limitem alarmowym</b>;

seg-ee998b974e6f = wynik zgodny z <b>RTCA DO-229E / DO-316</b> lub <b>EUROCAE ED-259A</b> (RTCA: Radio Technical Commission for Aeronautics; EUROCAE: European Organisation for Civil Aviation Equipment) ani z żadną inną normą certyfikacyjną.

seg-f84a56b6fe10 = Wskaźnik bezpieczeństwa: analityczna granica wykrywalności spoofingu

seg-e532288ed262 = Wskaźnik bezpieczeństwa to <b>granica wykrywalności spoofingu oparta na stabilności zegara</b>: przy danym szumie zegara (PSD szumu białego częstotliwości i błądzenia losowego (PSD: gęstości widmowe mocy)) i oknie monitorowania jest to analityczny margines detekcji monitora spójności pojedynczego zegara wobec powoli narastającego fałszywego czasu spoofingu. Cichszy zegar (np. zegar optyczny) wykrywa mniejszy, wolniejszy spoofing niż głośniejszy (np. CSAC (atomowy zegar w skali układu scalonego)); ten kontrast jest sednem demonstratora.

seg-fc718a805b28 = To <b>nie jest</b> wielosatelitarny detektor RAIM (autonomicznego monitorowania integralności przez odbiornik). Nie ma tu rezyduów pseudoodległości między satelitami, poziomu ochrony ani P_HMI. Test innowacji względem sigma ma ten sam matematyczny kształt co klasyczna detekcja błędów RAIM (Brown), ale liczba ta jest analityczną granicą dla danego zegara, a nie implementacją RAIM, i ma sens wyłącznie w kontekście skonfigurowanego scenariusza spoofingu (zob. rodzaj scenariusza <c1/>, który wprowadza rzeczywisty narastający atak).

seg-ae770e25031e = Wynik mówi o tym wprost. Rodzaje <c1/>, <c2/>, <c3/> i <c4/> nie konfigurują żadnego ataku, więc ich jednowierszowe podsumowanie wypisuje <c5/> zamiast liczby, a ich dokument wyniku oznacza <c6/> jako <c7/>, z podaniem powodu, w bloku <c8/>. Sama wartość pozostaje w dokumencie dla każdego, kto chce znać granicę.

seg-960bd91a2b3a = Rzeczywisty RAIM: migawkowy, z rozdzieleniem rozwiązań i ARAIM (<c1/>)

seg-3d31ec251ac0 = Prawdziwy RAIM w dziedzinie pozycji jest zaimplementowany w <c1/>, odrębnie od omówionego wyżej wskaźnika samospójności:

seg-0e8240812c16 = <b>Monitorowanie rezyduów wielu satelitów</b>: buduje macierz geometrii linii widzenia do widocznych satelitów, tworzy rozwiązanie pozycji i zegara metodą najmniejszych kwadratów i testuje sumę kwadratów rezyduów.

seg-69f1535596e0 = <b>Detekcja błędów testem χ²</b>: <c1/> (SSE: suma kwadratów rezyduów) ma rozkład χ²(n−{ "4" }) przy hipotezie braku błędu; błąd jest deklarowany powyżej <c2/>. Progi χ² pochodzą z niezależnego od bibliotek obliczania regularyzowanej niepełnej funkcji gamma (dokładnie, bez tablic).

seg-6721779048f5 = <b>HPL / VPL oparte na nachyleniu</b>: <c1/>, gdzie <c2/> to czułość błędu pozycji na pojedynczy satelita wynikająca z macierzy rzutowej, a <c3/> to obciążenie o niecentralnym rozkładzie χ², które spełnia skonfigurowane prawdopodobieństwo niewykrycia <c4/>.

seg-8dd60e98088d = <b>RAIM z rozdzieleniem rozwiązań (MHSS: rozdzielenie rozwiązań dla wielu hipotez)</b>: dla rozwiązania ze wszystkich widocznych satelitów i każdego podrozwiązania z wykluczeniem pojedynczego satelity rozdzielenie zagnieżdżonych estymatorów <c1/> zarówno <b>wykrywa, jak i identyfikuje</b> uszkodzony satelita i zasila granicę poziomu ochrony.

seg-719e27fdd2c1 = <b>Budżet ryzyka integralności (P_HMI) ARAIM (zaawansowanego autonomicznego monitorowania integralności przez odbiornik)</b>: <c1/> wyznacza najmniejsze HPL/VPL, dla których zsumowane prawdopodobieństwo niebezpiecznie mylących informacji <c2/> (Blanch i in., <em>Baseline ARAIM</em>) spełnia jawny przydział ryzyka integralności, i podaje ryzyko osiągane przez te poziomy. Dzięki temu integralność można bezpośrednio wymieniać na limit alarmowy, zamiast zostawiać ją niejawnie w stałym mnożniku <c3/>.

seg-2f99acf45203 = <b>Diagram integralności Stanford–ESA</b> (ESA: Europejska Agencja Kosmiczna): akumulator dla każdej epoki klasyfikuje <c1/> do obszarów Dostępny / Niedostępny system / Mylący / Niebezpiecznie mylący na potrzeby podsumowania dostępności.

seg-33d01969fb0f = <b>Osiągalne od początku do końca</b>: rodzaj scenariusza <c1/> uruchamia powyższe na konstelacji SGP4 (Simplified General Perturbations { "4" }) lub keplerowskiej albo wczytanej z rzeczywistych TLE (dwuwierszowych zestawów elementów orbitalnych) lub z pliku nawigacyjnego RINEX (Receiver Independent Exchange Format) i generuje dla każdej epoki mapę dostępności HPL/VPL względem skonfigurowanych limitów alarmowych (<c2/>). Ten sam przebieg <b>eksportuje pionowy diagram Stanforda</b>: w każdej chronionej epoce wylosowany z ziarnem, odtwarzalny błąd odległości bez usterki jest odwzorowywany przez geometrię na rzeczywisty błąd pionowy i klasyfikowany względem VPL i pionowego limitu alarmowego, tak że wynik JSON (JavaScript Object Notation) i podsumowanie CLI (interfejs wiersza poleceń) zawierają liczby w poszczególnych obszarach (zdarzenia integralności oraz HMI: niebezpiecznie mylące informacje), a nie tylko odsetek dostępności. Na dołączonym <c3/> przebieg podaje { "344" } z { "361" } epok dostępnych ({ "95.3" } %) przy poziomym limicie alarmowym { "40" } m i pionowym { "50" } m, z { "0" } zdarzeń integralności i { "0" } HMI.

seg-54e778eceef4 = <b>ARAIM dwukonstelacyjny z komunikatem wsparcia integralności</b>: <c1/> dodaje <b>tryb błędu obejmujący całą konstelację</b>: oprócz hipotez bez usterki i pojedynczego satelity każda konstelacja wnosi jedną hipotezę usuwającą wszystkie jej satelity, z prawdopodobieństwem a priori <c2/>, do tej samej sumy ryzyka integralności MHSS. <c3/> (ISM) zawiera dokładność zasięgu użytkownika dla integralności (<c4/>), średniokwadratową dokładność (<c5/>), maksymalne nominalne obciążenie <c6/> wliczane jednostronnie do każdego trybu oraz prawdopodobieństwa a priori <c7/> i <c8/>; jego zestaw odniesienia WG-C (Grupy Roboczej C unijno-amerykańskiej współpracy w zakresie nawigacji satelitarnej, której podgrupa techniczna ARAIM publikuje wzorzec) to σ_URA = { "0.75" } m, σ_URE = { "0.67" } m, b_nom = { "0.75" } m, P_sat = { "1e-5" } i P_const = { "1e-4" }. <c9/> odtwarza wynik jednobłędowy <c10/> bit w bit. Rodzaj <c11/> korzysta z tej ścieżki z <c12/> (<c13/>: GPS + Galileo, { "48" } satelitów, { "145" } z { "145" } epok dostępnych przy tych samych limitach alarmowych).

seg-1f06bc1976bd = <b>Poziomy ochrony względem opublikowanych wektorów odniesienia</b>: rodzaj <c1/> uruchamia <c2/> i <c3/> silnika na przykładach obliczeniowych z podgrupy ARAIM WG-C (Reference Airborne Algorithm Description Document v3.1, { "2019" }, dodatek D, oraz Milestone { "3" } Report, { "2016" }, załącznik A). Największa różnica poziomów ochrony pionowego/poziomego na wektorze akceptacyjnym wynosi { "0.0437" } m przy tolerancji samych dokumentów równej { "0.05" } m. Ten wiersz ma status VALIDATED w <a1><c4/></a1>: sprawdza równanie poziomu ochrony, a nie operacyjny ISM ani odbiornik.

seg-1dda7b318c5f = Pozostała luka (plan rozwoju)

seg-e27215296e1a = Czego <c1/> jeszcze <b>nie</b> robi:

seg-964c0634eae0 = <b>nie jest włączony do wskaźnika jakości scenariusza zegara/holdover</b>: te pakiety nadal podają opisany wyżej wskaźnik samospójności filtra, a nie HPL/VPL;

seg-eecf2f9f181e = hipotezami błędów są przypadek bez usterki, <b>pojedyncze satelity</b> i <b>całe konstelacje</b>; jednoczesne usterki <b>podzbiorów dwóch lub więcej satelitów (SV: pojazd kosmiczny, czyli satelita)</b> nie są modelowane;

seg-fd0f9fb2de83 = ISM jest konfigurowalnym zestawem parametrów (z wartościami odniesienia WG-C), a nie nadawanym operacyjnym komunikatem ani zwalidowanym modelem zagrożeń;

seg-88f5242b0809 = <b>detekcja i wykluczanie błędów (FDE)</b> jest tylko jednosatelitarne i migawkowe: rozdzielenie rozwiązań wskazuje uszkodzony satelita, a <c1/> ponownie rozwiązuje każde wykluczenie pojedynczego satelity i zwraca wykluczony satelita wraz z testem chi-kwadrat i poziomami ochrony pozostałego podzbioru, ale nie podaje pozycji chronionej po wykluczeniu, a rodzaj scenariusza <c2/> nie wykonuje kroku wykluczenia.

seg-c85aa5dedc86 = Rdzenie migawkowy, z rozdzieleniem rozwiązań i ARAIM są sprawdzane na <b>rzeczywistej geometrii z precyzyjnych orbit IGS (Międzynarodowa Służba GNSS) (SP3: Standard Product { "3" })</b>, a nie tylko na konstelacjach syntetycznych: <c1/> tworzy geometrię linii widzenia z pierwszej epoki prawdziwego produktu IGS SP3 na rzeczywistej stacji naziemnej i sprawdza, że poziomy ochrony są skończone i mieszczą się w limitach alarmowych APV-I (podejście z naprowadzaniem pionowym) wynoszących { "40" } m w poziomie i { "50" } m w pionie, że obciążenie pseudoodległości o { "60" } m uruchamia monitor χ², że rozdzielenie rozwiązań <b>identyfikuje</b> uszkodzony satelita oraz że poziomy ARAIM spełniają przydzielone <c2/>. <c3/> uruchamia ścieżkę dwukonstelacyjną na rzeczywistych katalogach Celestrak GPS i Galileo z 2026-06-07, propagowanych do jednej wspólnej epoki (zob. <a1><c4/></a1> §{ "3" }). Głębsza kontrola krzyżowa, czyli porównanie poziomów ochrony epoka po epoce z gLAB (GNSS-Lab Tool, pakiet do przetwarzania danych GNSS rozpowszechniany przez ESA) na pełnym łuku obserwacji RINEX, dodałaby zgodność w dziedzinie odbiornika. Nie została wykonana: rodzaj <c5/> oblicza kodową pozycję pojedynczego punktu z rzeczywistych obserwacji RINEX, ale żaden poziom ochrony z tego rozwiązania nie został porównany z gLAB.

seg-f5fac2e836a6 = Zatem <c1/> jest prawdziwym rdzeniem poziomu ochrony i ryzyka integralności, osiągalnym z rodzajów scenariuszy <c2/> i <c3/>, sprawdzonym na rzeczywistej geometrii orbit odniesienia i skonfrontowanym z wektorami odniesienia WG-C. Błędy w podzbiorach wielu satelitów, zgodność z gLAB w dziedzinie odbiornika i integracja ze wskaźnikiem integralności zegara pozostają pozycjami planu rozwoju, a nic z tego nie stanowi dowodu na potrzeby certyfikacji.

seg-487f24ed92d8 = <a1><c1/></a1>: jednowierszowe definicje każdego wskaźnika jakości i skrótu.

seg-7d3c12cf802e = <a1><c1/></a1>: parametry ISM i wektory odniesienia WG-C.

seg-04532ba5288f = <a1><c1/></a1>: poziom ochrony czasu (TPL) dryfującego zegara, który zależy od detekcji.

seg-43cea496da93 = <a1><c1/></a1>: które wielkości zostały zwalidowane względem wzorca, a które są kontrolami samospójności.

seg-3037dde8135f = <c1/>: wyprowadzenie granicy wykrywalności spoofingu.

seg-04d63778ca7f = RAIM obok wskaźników jakości holdover zegara ({ "0.36" }, opcjonalnie)

seg-744e95749978 = Scenariusz zegara może zawierać sekcję <c1/> (<c2/>): stanowisko (<c3/>, <c4/>, <c5/>), predefiniowane konstelacje (<c6/>, domyślnie <c7/>), maskę, sigma rezyduów odległości, prawdopodobieństwa fałszywego alarmu i niewykrycia, poziomy i pionowy limit alarmowy, odstęp między epokami oraz opcjonalne podane obciążenie jednego satelity. Przebieg podaje wtedy osobny blok <c8/>: dla każdej epoki satelity w zasięgu widzenia, migawkowe poziomy ochrony RAIM i werdykt (<c9/>, <c10/>, <c11/>, <c12/>, <c13/>), a także liczby i dostępność w całym przebiegu. Gdy oś czasu mówi, że GNSS jest zablokowany, RAIM jest niedostępny i nic nie jest ekstrapolowane; okno degradacji jest oceniane jak nominalne. Wskaźniki jakości holdover pozostają bez zmian, a bez tej sekcji wynik jest identyczny bajt w bajt. MODELLED: reprezentatywne predefiniowane niebo, syntetyczne rezydua i podane limity. Wymaga <c14/>.

seg-139639263c90 = Odtworzenie maksymalnego URA z Milestone { "3" } grupy WG-C ARAIM UE–USA (CAP-05c)

seg-97906754d4c8 = Wcześniejszy plan obiecywał porównanie z „Table A-3” z noty technicznej EU-ARAIM. Nie znaleziono publicznego źródła tej tabeli (publiczne raporty Milestone { "1" } do { "3" } podgrupy technicznej ARAIM Grupy Roboczej C UE–USA nie zawierają Table A-3), więc to porównanie zostało <b>wycofane</b> i pod tą nazwą nic nie jest obiecywane.

seg-b61607c477f2 = Próbuje się natomiast odtworzyć raport publiczny: <b>Milestone { "3" } Report</b> ({ "25" } lutego { "2016" }, kopia GPS.gov, SHA-256 <c1/>), tabele { "5" }, { "6" } i { "7" }, które dla każdej konfiguracji konstelacji oraz dla każdego z RNP { "0.1" } i RNP { "0.3" } podają największe <c2/>, przy którym { "90" } % użytkowników ma { "99.5" } % dostępności. Sprawdzono dwanaście wydrukowanych pozycji (wiersze Depleted i Baseline tabel dwuczęstotliwościowych) względem progów zarejestrowanych z góry w <a1><c3/></a1> przed jakimkolwiek przebiegiem ocenianym, wraz z odchyleniami, których nie da się usunąć i które tam opisano: brak plików almanachu, powłoki Walkera zamiast rzeczywistych slotów, grubsza siatka i krok oraz ścieżka pozioma ADD v4.2 silnika zamiast własnego tekstu raportu. Tabele { "8" } do { "13" } (jednoczęstotliwościowe) i wiersze Optimistic nie są podejmowane, z powodami podanymi we wskazanym miejscu. <b>Wynik: odtworzono { "8" } z { "12" } pozycji, { "4" } NOT MET (przypięte):</b> pozycje dwukonstelacyjne i wszystkie pozycje tylko dla Galileo zgadzają się (w tym wiersze N/A), pozycja dwukonstelacyjna Depleted RNP { "0.1" } osiąga pokrycie { "0.847" } przy { "9" } m wobec wydrukowanych { "9" } m (wymagane { "0.90" }), a trzy pozycje tylko dla GPS rozmijają się znacznie (pokrycie { "0.70" } przy { "4" } m, { "0.58" } przy { "6" } m, { "0.65" } przy { "10" } m wobec wydrukowanych { "4" } m, { "6" } m i „>{ "10" } m”). Rozbieżności dla samego GPS mogą wynikać z jednorodnej powłoki Walkera zastępującej rzeczywiste sloty GPS (D1); to hipoteza, a nie ustalenie. Wynik pozostaje MODELLED, jakikolwiek by był. Badanie to <c4/>; jego zmierzone pokrycia są w <c5/>, a oceniane przez <c6/>. Sam raport jest cytowany, a nie dołączany.

seg-0e98826cedcc = <s1>Poprzednia</s1>Bezpieczeństwo sprzętu

seg-e6f1e38977b7 = <s1>Następna</s1>Widmo i wodospad

seg-38ab3bb65327 = Rzeczywisty RAIM: migawkowy, z rozdzieleniem rozwiązań i ARAIM (src/raim.rs)
