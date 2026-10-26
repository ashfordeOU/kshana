# docs--kind-lunar-infrastructure: translations (sv)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-d1beb62cf742 = { "6" } medföljande scenarier använder denna kind; de övriga finns i <a1><c1/></a1>.

seg-e821670a8b55 = Källa: <c1/>

seg-56953faa67ae = <c1/> (scenariotyp)

seg-d0fb90f506c9 = MODELLED studier av månens bana och yta som infrastruktur för navigering och geodesi, fem studier bakom en enda typ som väljs av <c1/>: od-consistency (banbestämning ombord med jordens GNSS i en NRHO eller ELFO mot oberoende radiometrisk banbestämning från marken, bedömd utifrån deras egna kovarianser över en Monte Carlo-körning med frö), carrier-phase (gemensam dubbeldifferentierad bärvågsfas mellan yta och omloppsfarkost och lösning av heltalsosäkerhet med LAMBDA), frame-coestimation (en markstation och omloppsfarkoster som läggs till avståndsmätningen från jordstationer för det lunara referenssystemsdatumet med sju parametrar), space-tie (GNSS, VLBI och laseravståndsmätning på en farkost, precision i referenssystemstien mot felet i lokal tie) och geodesy-sensitivity (Fisher-information för de lunara Love-talen h2, k2, l2 och den fysiska libration från laseravståndsmätning, spårning av omloppsfarkoster, en gravimeter på ytan och en klocka på ytan). En begränsad trekroppsmodell med angivna förenklingar; numeriken kontrolleras mot oberoende program och ingenting jämförs med en mätning av någon lunar storhet.

seg-5753b7552559 = En körning av <c1/> sammanfattas som: lunar-infrastructure space-tie: { "4" } svepningspunkter på { "1" } bågar; laser jämfört med GNSS x translationens sigma { "1.0363" } m vid den registrerade lokala tien

seg-f2594b18e718 = Obligatoriska fält: <c1/>

seg-4875c29c517c = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>

seg-7b33bdb70a30 = Exemplet <c1/> anger bland annat:

seg-5fad84cbb2be = nrho

seg-def582a1f2ca = Resultatetikett (motorns egen): MODELLED — en begränsad trekroppsmodell (jorden och månen som punktmassor, ingen sol, inga lunara gravitationsharmoniker) med angivna förenklingar och ILLUSTRATIVE indata märkta med sina offentliga källor. Numeriken kontrolleras mot oberoende program; ingenting jämförs med en mätning av en luna

seg-f3b4a80a739b = inget diagram: exemplet skriver inget diagram

seg-35a4a7a25561 = <b>MODELLED</b> Banbestämning i en nästan rätlinjig halobana (eller en elliptisk fryst bana) utifrån två oberoende datatyper: pseudoavstånd från jordens GNSS mottagna ombord. Oberoende referens (ReferenceImpl): Ett oberoende scipy/numpy-program integrerar samma variationsekvationer (tröskel O1). Ingenting jämförs med en mätning av en lunar bana. Den oberoende referensen kontrollerar numeriken i angivna formler, inte fysiken, så raden förblir MODELLED. Begränsad trekroppsmodell: ingen sol, inga lunara harmoniker, jordens rotationsaxel längs banans normal, ILLUSTRATIVE indata för mottagare och station.

seg-32455bf5f804 = <b>MODELLED</b> Enkeldifferentierad bärvågsfas och kod från jordens GNSS mellan mottagare vid en lunar markstation och en omloppsfarkost, där klockdifferensen per epok profileras bort. Oberoende referens (ReferenceImpl): En oberoende numpy-lösning av samma normalekvationer utifrån de exporterade raderna (Q3) och en uttömmande uppräkning av heltal (Q4). Ingen GNSS- eller lunar bärvågsfasmätning jämförs med. MODELLED.

seg-b20c412516b6 = <b>MODELLED</b> Fisher-information för det lunara referenssystemsdatumet med sju parametrar från laseravståndsmätning från jordstationer till enbart de fem reflektorerna och med avståndsmätning mellan omloppsfarkost och markstation. Oberoende referens (ReferenceImpl): En oberoende finit differens i numpy av framåtmodellen (F2). Ingenting jämförs med verkliga lösningar för lunara referenssystem. Faktorn är villkorad av den antagna kända banan och avståndssigmat på { "1" } m. MODELLED.

seg-151c96b1f882 = <b>MODELLED</b> Cramer-Rao-precision för translations-, skal- och rotationsförskjutningarna mellan teknikerna i referenssystemen för GNSS, VLBI och laseravståndsmätning när en farkost bär alla. Oberoende referens (ReferenceImpl): Ett oberoende staplat numpy-system där positionsobekanta eliminerats med explicita Schur-komplement (T3). Inga data från GRASP, Genesis eller andra uppdrag jämförs med. MODELLED.

seg-743d78806f6a = MODELLED — en begränsad trekroppsmodell (jorden och månen som punktmassor, ingen sol, inga lunara gravitationsharmoniker) med angivna förenklingar och ILLUSTRATIVE indata märkta med sina offentliga källor. Numeriken kontrolleras mot oberoende program; ingenting jämförs med en mätning av en lunar storhet, och ingenting här är ett påstående om något uppdrag eller system. Inte knutet till eller stött av någon myndighet. Råd (resultat <c1/>)

seg-da35c5298311 = MODELLED studier av månens bana och yta som infrastruktur för navigering och geodesi, fem studier bakom en enda typ som väljs av <c1/>: od-consistency (banbestämning ombord med jordens GNSS i en NRHO eller ELFO mot oberoende radiometrisk banbestämning från marken, bedömd utifrån deras egna kovarianser över en Monte Carlo-körning med frö), carrier-phase (gemensam dubbeldifferentierad bärvågsfas mellan yta och omloppsfarkost och heltalsosäkerhet (typkatalog (<c2/>))

seg-4658f67623b5 = Kshana-scenario för lunar infrastruktur: space-tie. MODELLED; utformningen, indata och trösklarna är fastställda i xval/lunar-infra/PREREGISTRATION.md (incheckad före någon körning). ILLUSTRATIVE indata är märkta med sina offentliga källor där. (kommentar i scenariofilen, rad { "1" } till { "3" })

seg-f7257c25f137 = Lunar banbestämning: jordens GNSS mot radiometri från marken är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-a3988ca0b8ea = Lunar lösning av bärvågsfasens heltalsosäkerhet: yta och omloppsfarkost är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-b2e4ab7b6e60 = Lunar samestimering av referenssystem: stationer på ytan och omloppsfarkoster är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-6eedb30a58c5 = Precision i space-tie-referenssystemstien: samlokaliserad GNSS, VLBI och laseravståndsmätning är MODELLED, inte validerad: kontrollerad mot en separat implementation i samma kodbas — oberoende av enheten som testas, men inte externt auktoritativ. (verifieringsmatris (docs/MODELLED-RATIONALE.md))

seg-cd5f729c9622 = Ämnessida: <a1>LUNAR-INFRASTRUCTURE.md</a1>

seg-4df4c0059362 = <s1>Föregående</s1>lunar-frame-realisation

seg-c88eef4a7214 = <s1>Nästa</s1>lunar-integrity
