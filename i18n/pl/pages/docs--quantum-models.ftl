# docs--quantum-models: translations (pl)

seg-638b8d451550 = Czujnik

seg-c35a20fa2529 = Dojrzałość

seg-2f51722ab9d4 = Źródło: <c1/>

seg-39ab7752d86d = Modele czujników kwantowych: co { -brand } modeluje, a czego nie

seg-daf0e0c0b16f = { -brand } jest <b>symulatorem odporności PNT (PNT: pozycjonowanie, nawigacja i czas) z modelami parametrów czujników kwantowych</b>. <em>Nie</em> jest symulatorem fizyki kwantowej od pierwszych zasad. Ta strona mówi dokładnie, co to znaczy, aby określenie „kwantowy” nie mogło zostać odebrane jako coś więcej, niż jest.

seg-6e504d97c41e = Co JEST modelowane

seg-7884c9a7d883 = Każdy czujnik kwantowy (i klasyczny) jest <b>modelem błędów</b> sterowanym opublikowanymi parametrami budżetu szumów:

seg-cad22f39d579 = <b>Zegary</b> — widmowe gęstości mocy (PSD) szumu białego częstotliwości i błądzenia losowego częstotliwości, dolna granica Allana dla szumu typu flicker (1/f) oraz dryf liniowy, pochodzące z kart katalogowych i artykułów: CSAC (chip-scale atomic clock) Microchip SA.45s; optyczny zegar strontowy w sieci optycznej autorstwa Origlia i in. (arXiv:{ "1503.08457" }), cel nastawiony na przestrzeń kosmiczną; oraz sześć domyślnych klas <c1/> (CSAC; USO, ultra-stable oscillator; DSAC, Deep Space Atomic Clock; TCXO, temperature-compensated crystal oscillator; OCXO, oven-controlled crystal oscillator; RAFS, rubidium atomic frequency standard), z których każda cytuje jedno źródło. Odchylenie Allana, które z nich wynika, jest sprawdzone względem standardowych nachyleń dla typów szumu (zob. <a1><c2/></a1>). Jedna krzywa zegara optycznego jest rzeczywista: zmierzone odchylenie Allana zegara z pincetami optycznymi ⁸⁸Sr autorstwa Norcia i in. (<em>Science</em> { "2019" }) zostaje odtworzone przez dopasowanie szumu, co jest wierszem VALIDATED w <a2><c3/></a2>; wartości holdover oparte na klasie optycznej pozostają MODELLED.

seg-13c3340e773b = <b>Czujniki inercjalne</b> — w pakietach <c1/> i hybrydowych jednoosiowy (1-DOF, jeden stopień swobody) budżet błędów akcelerometru i żyroskopu: błądzenie losowe prędkości, błądzenie losowe kąta, błądzenie losowe przyspieszenia oraz dolna granica Allana dla niestabilności biasu. Rodzaje <c2/> i <c3/> zamiast tego uruchamiają trójosiową mechanizację strapdown z <c4/> (orientacja w kwaternionach, równania nawigacyjne północ-wschód-dół, deterministyczny model błędów IMU).

seg-f361d586b348 = Kwantowe rodzaje scenariuszy — <c1/>, <c2/>, <c3/>, <c4/> i <c5/> — są zbudowane z tych modeli błędów i są MODELLED; <c6/>, <c7/> i <c8/> podają także zapis reprezentatywności z lukami do lotu.

seg-05bbaddd4df6 = Silnik jest <b>neutralny</b>: „kwantowy” i „klasyczny” to ta sama ścieżka kodu z różnymi współczynnikami. Różnica we wskaźnikach jakości wynika w całości z wejściowych parametrów szumu, z których każdy da się wyśledzić do cytowanego źródła.

seg-a1a067588520 = Czego NIE modelujemy

seg-49a656243210 = W przypadku czujników zegara i transferu czasu żadna z leżących u podstaw fizyki kwantowej nie jest symulowana, a jedynie wypadkowy wkład Allana, podawany jako współczynnik. Dla <b>akcelerometru na zimnych atomach</b> istnieje już warstwa wywodząca się z pierwszych zasad (zob. niżej); pozostałe efekty systematyczne mają nadal poziom współczynników albo nie są modelowane:

seg-844e65d52572 = <b>faza Macha–Zehndera</b> interferometru atomowego (<c1/>), <b>kwantowy szum projekcji / szum śrutowy</b> (<c2/>), zanik <b>kontrastu</b> interferometru, <b>czas cyklu</b> i <b>funkcja przenoszenia sprzężenia drgań</b> (<c3/>, wariancja przy białym PSD <c4/>) <em>są teraz modelowane od pierwszych zasad</em> dla akcelerometru CAI (cold-atom interferometer) (<c5/>), z wyprowadzeniem białego PSD przyspieszenia <c6/>, którego używa model klasyczny, wraz z <b>zakresem dynamicznym niejednoznaczności prążków</b> (<c7/>); zob. <a1><c8/></a1>;

seg-71a782041b89 = efekt systematyczny <b>Coriolisa</b> (<c1/> / <c2/>, sprzężenie krzyżowe <c3/>) oraz efekt systematyczny <b>AC-Stark (AC: alternating-current) / przesunięcia światłem</b> (<c4/>, który znosi się przy symetrycznym odstrojeniu dwufotonowym) <em>są teraz modelowane i objęte testami jednostkowymi</em> w <c5/>;

seg-00c510117abc = trzy dalsze człony błędu CAI <em>są teraz modelowane</em> jako funkcje biblioteczne w <c1/> ({ "0.36" }; MODELLED; nie są jeszcze dostępne z poziomu rodzaju scenariusza):

seg-fcaf6ff00974 = <b>szum fazy lasera Ramana</b>: ważenie funkcją czułości według Cheinet i in. ({ "2008" }), równanie { "8" }, ze zwartą postacią dla szumu fazy białego <c1/> (równanie { "18" } przy jednym cyklu) i drogą numeryczną dla dowolnego widma szumu fazy, a także szum częstotliwości lasera, którego opóźnienie odbicia wstecznego <c2/> nie znosi (Le Gouët i in. { "2007" }, równania od { "9" } do { "11" });

seg-6e2236c81db8 = <b>krzywizna czoła fali</b> (wyłącznie czysty defokus): bias <c1/> chmury termicznej na wiązce o promieniu krzywizny <c2/> oraz jego zmniejszenie, gdy zliczane są tylko atomy wewnątrz promienia detekcji (za Louchet-Chauvet i in. { "2011" } oraz Schkolnik i in. { "2015" }); aberracje wyższego rzędu nie są modelowane;

seg-92295ad17228 = <b>rozwiązywanie niejednoznaczności prążków</b>: prawdopodobieństwo błędnego indeksu prążka, <c1/>, dla wspomagania akcelerometrem klasycznym (Lautier i in. { "2014" }) oraz dla dwóch czasów interrogacji (za Bonnin i in. { "2018" }), wraz z odwrotnością, która daje największy szum klasyczny dla podanego prawdopodobieństwa niepowodzenia.

seg-f383678fb806 = Każda zwarta postać jest sprawdzana względem niezależnej drogi numerycznej (kwadratura w dziedzinie częstotliwości lub Monte Carlo po atomach albo strzałach) i jej przypadków granicznych. Jedyną odtworzoną opublikowaną liczbą jest poziom szumu fazy białego z pracy Cheinet i in.: −{ "111" } dB·rad²/Hz przy <c1/> = { "20" } µs daje około { "1" } mrad na strzał ({ "0.99" } mrad; praca wyprowadza ten poziom z własnego równania { "17" }, flicker plus biały). Nic z tego nie jest pomiarem żadnego przyrządu;

seg-150f8b9dfea4 = nadal <b>nie</b> są modelowane: aberracje czoła fali wyższego rzędu, szum fazy konkretnego układu laserowego oraz fizyka od pierwszych zasad po stronie zegara;

seg-643109601eba = pakiet <c1/> porównujący rozwiązania kwantowe z klasycznymi jest jednoosiowy; trójosiowa ścieżka strapdown działa wyłącznie w <c2/> i <c3/> (zob. uwaga o IMU, czyli jednostce pomiarów inercjalnych, w README oraz <a1><c4/></a1>).

seg-1ff01ab9f92d = Dokończenie warstwy fizyki kwantowej (udostępnienie członów błędu CAI z poziomu rodzaju scenariusza, aberracje czoła fali wyższego rzędu i fizyka od pierwszych zasad po stronie zegara) to pozostała praca P2 w <c1/>.

seg-f09a31b33faa = Wartości z laboratorium naziemnego a wartości kwalifikowane do lotu

seg-dcef4579d2a9 = Tabele parametrów łączą różne poziomy dojrzałości; należy je tak traktować:

seg-4f25895df32f = Wartość źródłowa

seg-cef61e912cd0 = CSAC (np. SA.45s)

seg-4a016be9bca9 = z karty katalogowej σ_y({ "1" } s) ≈ { "3e-10" }

seg-38cc72b2405c = <b>wdrożona</b> część komercyjna (istnieją odmiany kosmiczne odporne na promieniowanie)

seg-d38d20629ed6 = Optyczny zegar strontowy w sieci optycznej

seg-1f0d3ec00922 = cel σ_y({ "1" } s) ≈ { "1e-15" } (arXiv:{ "1503.08457" })

seg-1496e0c42086 = <b>laboratorium naziemne</b> — { -brand } nie zna żadnych opublikowanych parametrów takiego zegara na orbicie

seg-ce1d7994188b = Akcelerometr na zimnych atomach

seg-b07fa6b8cebc = opublikowane laboratoryjne wartości Allana

seg-60864f168701 = laboratorium naziemne / rakieta sondująca

seg-84a68aeb467d = Wartości dla zegarów optycznych w { -brand } są <em>celami kosmicznymi osiągniętymi na sprzęcie naziemnym</em>. Żaden zegar optyczny nie latał w kosmosie; README i pochodzenie wyniku mówią o tym wprost.

seg-a204c1b854fa = Wzorzec porównawczy: ACES/PHARAO na ISS (działa od kwietnia { "2025" })

seg-fb88de1257bd = Ładunek <b>ACES/PHARAO</b> ESA (European Space Agency) (ACES: Atomic Clock Ensemble in Space; PHARAO: Projet d'Horloge Atomique par Refroidissement d'Atomes en Orbite) — zegar cezowy chłodzony laserowo plus aktywny maser wodorowy, działający na ISS (International Space Station) od kwietnia { "2025" } — jest obecnym działającym wzorcem porównawczym stabilności zegara na orbicie (docelowa stabilność względna rzędu { "1e-16" } po kilku dniach całkowania). Model zegara optycznego w { -brand } odpowiada <em>bardziej ambitnemu</em> celowi laboratoryjnemu niż parametry cezowego zegara i masera ACES uzyskane w locie; przy porównywaniu liczb optycznych { -brand } z tym, „co faktycznie poleciało”, rzetelnym punktem odniesienia jest ACES/PHARAO, a jest to układ mikrofalowy z maserem, nie zegar na sieci optycznej.

seg-9d2e850cb986 = Dokładne wartości parametrów ACES na orbicie należy cytować z opublikowanych wyników ESA w miarę ich ogłaszania; chodzi tu o <em>lukę dojrzałości</em>, a nie o konkretną liczbę — wartości optyczne { -brand } są celami, a nie parametrami uzyskanymi w locie.

seg-4b373686adf8 = <a1><c1/></a1> — etykiety <c2/> / <c3/> dla poszczególnych parametrów.

seg-3f0c1048aea9 = <a1><c1/></a1> — definicje wskaźników jakości (FoM) i każdy skrót.

seg-a360cd4997e2 = <a1><c1/></a1> — czym są i czym nie są wskaźniki jakości integralności i bezpieczeństwa.

seg-0ac025397b23 = <a1><c1/></a1> — akcelerometr na zimnych atomach oparty na pierwszych zasadach.

seg-41ba2c8f70fe = <s1>Poprzednia</s1>Projekt konstelacji

seg-136fa589fed5 = <s1>Następna</s1>Interferometr na zimnych atomach
