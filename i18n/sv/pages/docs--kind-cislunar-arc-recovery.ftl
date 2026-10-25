# docs--kind-cislunar-arc-recovery: translations (sv)

seg-debc2f07db78 = true

seg-330cbcd04718 = andel (dimensionslös)

seg-8f21a5462b09 = Källa: <c1/>

seg-e4858b0a33c9 = <c1/> (scenariotyp)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-f994c81583bf = MODELLED test med oberoende estimator av observerbarhetströskeln för cislunar båglängd. Den tröskeln är en RANG-avläsning på observerbarhetsmatrisen som byggs av de ANALYTISKA avståndsjakobiraderna och den ANALYTISKA variationella tillståndsövergångsmatrisen, och dess kontroll med kvadratrotsinformationsfiltret viker in just de raderna — en konsistenskontroll mellan två numeriska maskiner, inte styrkande belägg. Den här typen tillhandahåller den saknade skiljedomaren: en batch-estimator med minsta kvadrat som faktiskt ÅTERFINNER chefens initialtillstånd från simulerade mätningar, med mätpartialerna tagna som CENTRALA FINITA DIFFERENSER av den sammansatta framåtmodellen. Den anropar ingen analytisk jakobirad, ingen variationell STM, ingen singulärvärdes- eller egenvärdesuppdelning, ingen rangtolerans och inget kvadratrotsinformationsfilter — en källtextspärr i tests/cislunar_arc_recovery_reference.rs gör det verkställbart — medan dynamiken (samma RK4-CR3BP-flöde), begynnelsevillkoren (samma differentialkorrigerade konstellation), den skalära observabeln och epokrutnätet delas medvetet och namnges i det utsända <c1/>-blocket, eftersom två analyser av ett fysikaliskt problem måste vara överens om fysiken för att vara jämförbara. Två kriterier, vart och ett svept över fem dekader av sin egen gräns: BRUSFRI ÅTERFINNING (varje seedad körnings slutliga tillståndsfel högst recovery_factor gånger dess a priori-förskjutning — rangmotsvarigheten, utan singulärvärdestolerans i sig) och MONTE CARLO-SKATTBARHET (det uppmätta RMS-positionsfelet över en seedad brusensemble under en angiven gräns — skattbarhetsmotsvarigheten, uppmätt i stället för förutsagd). Stöder det plana fyratillståndet och det rumsliga sextillståndet, familjerna DRO / L2 halo / L2 NRHO, observabler för avstånd och avståndshastighet, och en månecentrerad polär parametrisering där transformationen tillämpas på TILLSTÅNDET och framåtmodellen deriveras om där. UPPMÄTT på det publicerade plana DRO-rutnätet: estimatorn återfinner fyratillståndet från { "0.782609" } h mot rangkriteriets { "2.086957" } h vid rel_tol { "1e-6" } (kvot { "0.375" }) — rangtröskeln är INTE styrkt som gräns för återfinnbarhet — medan den uppmätta skattbarhetsgränsen hamnar i samma rutnätscell som den formella, { "5.739130" } h, och den uppmätta felkurvan reproducerar den formella 1-sigma över { "21" } båglängder till en geometrisk medelkvot på { "0.98" }. MODELLED: konstellationsutformningen, epokrutnätet, den enda spårade länken, förskjutningens storlek, mätsigman och de två angivna gränserna. Inte en certifierad produkt för navigeringsprestanda.

seg-ada71f37b21b = En körning av <c1/> sammanfattas som: cislunar-arc-recovery | dro-familj, 4 tillstånd, { "4" } s/c, avståndsobservabel, kartesisk parametrisering | { "6.0" } h båge, { "24" } epoker (rutnät { "0.260870" } h), { "32" } körningar, frö { "20260920" } | partialer med finita differenser, ingen analytisk jakobian / STM / SVD / SRIF | brusfri återfinning från { "0.782609" } h (faktor { "1e-2" }) mot Gramian-rangtröskel { "2.086957" } h | Monte Carlo-skattbarhet från { "5.739130" } h (RMS pos ≤ { "1.000" } km, σ { "1.000" } m) mot Gramian-skattbarhet { "5.739130" } h | RMS pos vid bågens slut { "0.6026" } km

seg-3d4a2773c32f = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-eb621f41dfbb = Exemplet <c1/> anger bland annat:

seg-6d584e86deba = kvot (dimensionslös)

seg-f7f4d06e661f = cislunar-observability på identiska

seg-a6cb7ed2ff6d = Resultatetikett (motorns): MODELLED test av återfinning av cislunar båglängd (korroboration med oberoende estimator av P6-observerbarhetströskeln). VALIDATED kärna: estimatorn är cratens redan befintliga viktade Gauss-Newton-batchkorrigerare (crate::batch_ls), vars designmatris är en CENTRAL FINIT DIFFERENS av den sammansatta fo

seg-2fe411ae2153 = Diagrammet som motorn skriver för scenarios/cislunar-arc-recovery.toml, typ cislunar-arc-recovery

seg-99dd8cc0e3ef = <b>MODELLED</b> En batch-estimator med minsta kvadrat som ÅTERFINNER chefens initialtillstånd från simulerade mätningar mellan satelliter över växande prefix av samma epokrutnät som tabellen rang-mot-båge använder, med mätpartialerna tagna som centrala finita Tester: <a1>cislunar_arc_recovery_reference.rs</a1>.

seg-67aab2162719 = <b>MODELLED</b> En batch-estimator med minsta kvadrat som ÅTERFINNER chefens initialtillstånd från simulerade mätningar mellan satelliter över växande prefix av samma epokrutnät. Oberoende referens (ReferenceImpl): En separat estimator i den här kodbasen med en annan algoritm och en disjunkt kodsökväg: icke-linjär viktad Gauss-Newton med partialer från finita differenser, vars utslag läses som ett uppmätt tillståndsåterfinningsfel i km och mm/s. Den har inget uttryck gemensamt med Gramians rang- och kovariansväg, och separationen UPPRÄTTHÅLLS av en källtextspärr i stället för att påstås. UPPMÄTT på det publicerade plana DRO-rutnätet: th

seg-7be582874f98 = MODELLED test av återfinning av cislunar båglängd (korroboration med oberoende estimator av P6-observerbarhetströskeln). VALIDATED kärna: estimatorn är cratens redan befintliga viktade Gauss-Newton-batchkorrigerare (crate::batch_ls), vars designmatris är en CENTRAL FINIT DIFFERENS av den sammansatta framåtmodellen - den anropar ingen analytisk mätjakobirad, ingen variationell tillståndsövergångsmatris, ingen singulärvärdes- o (resultat <c1/>)

seg-52fe686b1fdf = MODELLED test med oberoende estimator av observerbarhetströskeln för cislunar båglängd. (typkatalog (<c1/>))

seg-48e6e57a0b40 = MODELLED: konstellationsutformningen, epokrutnätet, den enda spårade länken, förskjutningens storlek, mätsigman och de två angivna gränserna. (typkatalog (<c1/>))

seg-75f275dcb2d2 = MODELLED: konstellationsutformningen, epokrutnätet, den enda spårade länken, förskjutningens storlek, mätsigman och de två angivna gränserna. Inte en certifierad produkt för navigeringsprestanda. (kommentar i scenariofilen, rad { "33" } till { "35" })

seg-ea82d9fd6506 = Korroboration med oberoende estimator av cislunar båglängdströskel är MODELLED, inte validerad: kontrollerad mot en separat implementering i just den här kodbasen — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-53d57e6dafa6 = <s1>Föregående</s1>campaign

seg-fe3ecf4b55fe = <s1>Nästa</s1>cislunar-observability
