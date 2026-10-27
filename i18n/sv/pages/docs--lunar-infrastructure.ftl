# docs--lunar-infrastructure: translations (sv)

seg-cae10fb9bff8 = Scenario

seg-61817375c8ea = Månens omloppsbana och yta som infrastruktur för navigering och geodesi

seg-9872e31ebd72 = Källor

seg-922905241a6b = Källa: <c1/>

seg-bfb9c5efbe57 = Scenariotypen <c1/>, fem studier som väljs med <c2/>. <b>MODELLED</b>: en begränsad trekroppsmodell med angivna förenklingar och ILLUSTRATIVE indata. Numeriken kontrolleras mot oberoende numpy/scipy-program; ingenting jämförs med en mätning av någon månstorhet och ingenting här är ett uttalande om något uppdrag eller system. Inte ansluten till eller stödd av någon myndighet. Rådgivande programvara, inte typgodkänd utrustning. Kshana sänder ingenting och styr ingen hårdvara.

seg-7908583855a2 = Utformningarna, indata och trösklarna fastställdes i <c1/> (incheckad innan någon studie poängsattes) och två redovisade ändringar (<c2/>). Utfallet för varje tröskel finns i <c3/>.

seg-d9d9d0864ae0 = Studie

seg-3b01a756c305 = Vad den beräknar

seg-a4ef7c81b35f = Banbestämning ombord med Earth-GNSS i en NRHO (eller <c1/>) mot oberoende banbestämning från marken med avstånd och avståndshastighet från tre DSN-stationer; varje skattnings formella kovarians; en Monte Carlo-simulering med fast frö av om de två kovarianserna förklarar sin skillnad (q, chi-kvadrat med { "6" } frihetsgrader); en injicerad omodellerad acceleration

seg-849c67471e69 = <c1/> (snabb), <c2/> (poängsatt, cirka åtta minuter)

seg-b9c6eb8d778c = Gemensam dubbeldifferentierad bärvågsfas mellan ytstation och orbiter; kovarians för flytande heltalsosäkerhet; LAMBDA; bootstrappad och Monte Carlo-framgång; sigma för flytande och fixerad position

seg-74c347e0bc69 = Fisher-information för det lunara datumet med 7 parametrar från avståndsmätning mot jordstationer, med och utan avstånd mellan orbiter och ytstation; slumpade stationsuppsättningar med fast frö

seg-4ed875c39781 = GNSS, VLBI och laseravståndsmätning på en och samma rymdfarkost: Cramer-Rao-precision för skillnaderna mellan teknikerna mot felet i den lokala förbindelsen

seg-de25104c09a2 = Information om h2, k2, l2 och den fysiska librationen från laseravståndsmätning, spårning av orbiter, en gravimeter och en ytklocka (konstanter som delas med månmodulerna för tid)

seg-18fc4ba766df = Samstämmighet mellan en banbestämning ombord med Earth-GNSS i en nästan rätlinjig haloomloppsbana och en oberoende banbestämning från marken, från verkliga körningar av motor v{ $version } på scenarios/lunar-infrastructure-od-consistency.toml och varianten med modellfel ({ "400" } försök vardera). Den genomsnittliga normaliserade skillnaden q är { "5.81" } utan modellfel och { "5.95" } med ett injicerat accelerationsfel på { "3e-10" } m/s2, mot { "6" } förväntat: de två banlösningarna är samstämmiga (tröskel C1 MET). Andelen försök över { "95" } %-punkten är { "0.040" } och { "0.052" }; tröskeln för att upptäcka det injicerade felet var minst { "0.5" }, så den är NOT MET (C3): lösningen ombord är känd till cirka { "352" } m mot { "23" } m för den från marken, så en förskjutning på tio meter gömmer sig inom dess kovarians. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon månstorhet. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst.

seg-4c08262e2556 = Fixering av heltalsosäkerhet för bärvågsfas mellan månens ytstationer och en orbiter, från det incheckade resultatet av den poängsatta körningen av motor v{ $version } (tests/fixtures/lunar_infra/phase_full_run.json: { "3" } båglängder, en Monte Carlo-simulering med { "400" } dragningar vardera, skriven av scenarios/carrier-phase-scored.toml). { "1" } dygn: framgång { "1.0" } % (standardfel { "0.5" } %), { "134" } heltalsosäkerheter, sigma för orbiterns position { "45.6" } m flytande och { "18.5" } m fixerad; { "2" } dygn: framgång { "0.5" } % (standardfel { "0.4" } %), { "259" } heltalsosäkerheter, sigma för orbiterns position { "21.5" } m flytande och { "8.7" } m fixerad; { "3" } dygn: framgång { "2.8" } % (standardfel { "0.8" } %), { "375" } heltalsosäkerheter, sigma för orbiterns position { "6.3" } m flytande och { "2.1" } m fixerad. Heltalsfixering uppnås inte: framgången stannar mellan { "1" } % och { "3" } % vid { "25" } dBi, och vid de registrerade { "12" } dBi kan problemet inte formuleras. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon månstorhet. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst.

seg-7e5b10641b20 = Precisionen hos det lunara datumet med sju parametrar (tre translationer, en skala och tre rotationer) från avståndsmätning mot jordstationer, med och utan avstånd mellan orbiter och ytstation, från en verklig körning av motor v{ $version } på scenarios/lunar-infrastructure-frame-coestimation.toml. Cramer-Rao-sigma för translationerna och rotationerna sjunker med orbiterlänkarna (till exempel t_z från { "0.98" } m till { "0.046" } m); det minsta informationsegenvärdet stiger 111 gånger och spåret av CRLB sjunker till { "1.0" } % (tröskel F3 MET). Detta förutsätter att banan är känd i månaxlarna, med sitt fel bärt av orbiterns avståndssigma på { "1" } m. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon månstorhet. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst.

seg-377d29dcc6e8 = Precisionen hos skillnaderna mellan lasermätningens, VLBI:s och GNSS:s positioner för en rymdfarkost, mot felet i den lokala förbindelsen på marken, från en verklig körning av motor v{ $version } på scenarios/lunar-infrastructure-space-tie.toml (en båge på 6.56 dygn, tekniksigma GNSS { "10" } m, VLBI { "1" } m, laser { "0.1" } m). Med en lokal förbindelse från { "1" } mm till { "1" } m stannar translationssigmat för laser minus GNSS nära { "1.04" } m tills förbindelsen når { "1" } m: det begränsas av teknikernas mätbrus, inte av den lokala förbindelsen. Golvet som sätts av förbindelsen ensam är kvadratroten ur två gånger dess sigma. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon månstorhet. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst.

seg-9d507a371319 = Vilken observationsfamilj som är känslig för månens Love-tal h2, k2 och l2, från en verklig körning av motor v{ $version } på scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Varje cell är det kvadratiska medelvärdet (RMS) av partiella derivatan av en familjs observationer med avseende på en parameter, i den familjens egna enheter (så celler jämförs längs en rad, inte nedför en kolumn); ett tankstreck betyder att familjen saknar känslighet. laseravståndsmätning: h2 { "7.6" }, k2 ingen, l2 { "9.8" }. spårning av orbiter: h2 ingen, k2 { "0.00086" }, l2 ingen. ytgravimeter: h2 { "2.9e+03" }, k2 { "4.3e+03" }, l2 ingen. ytklocka: h2 { "2.8e-17" }, k2 { "2.8e-17" }, l2 ingen. Med alla fyra familjerna är Cramer-Rao-sigma { "0.36" } % av nominellt h2, { "0.52" } % av k2 och { "1.16" } % av l2. Att lägga till en familj sänkte aldrig det minsta egenvärdet ({ "28" } av { "28" } tillägg), men spåret av pseudoinversen blev inte större i bara { "16" } av { "28" }: den halvan av tröskel G3 är NOT MET. Orbiterfamiljen ser siktlinjeintegralen av k2-accelerationen, en siffra i den övre änden. MODELLED: en begränsad trekroppsmodell med angivna förenklingar och illustrativa indata, inte en mätning av någon månstorhet. Rådgivande: analysresultat från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livsäkerhetstjänst.

seg-570b9276834b = Uttalade förenklingar

seg-ab053aadb65d = Jorden och månen som punktmassor på en cirkulär bana, ingen sol, inga harmoniska termer i månens gravitation; jordens rotationsaxel är banans normal; det tröga systemet sammanfaller med det roterande systemet vid t = { "0" }; en sfärisk måne; ett synkront månsystem (ingen libration) utom i <c1/>; banan hålls känd i månens axlar i <c2/> (dess fel bärs av omloppsfarkostens avståndssigma); omloppsfarkostfamiljen i <c3/> ser synlinjeintegralen av k2-accelerationen sedan en konstant och en linjär trend har tagits bort, ett värde i den övre delen av intervallet.

seg-fd644b1f33ec = Rapportens form

seg-03efc65cbb0e = Varje rapport innehåller <c1/>, <c2/>, <c3/>, <c4/>, studiens fält och ett <c5/>-block (en enhet och en proveniensklass för varje numeriskt fält). Inga tidsserier per tidpunkt skapas. Fältlistor: <c6/>-blocket i varje rapport samt <c7/>.

seg-bc9bb4f545e2 = k2 = { "0.024116" } +/- { "0.000108" } (Lemoine et al., Geophys. Res. Lett. { "41" }({ "10" }), 3382-3389, { "2014" }, doi 10.1002/2014GL060027), används som nominellt värde. h2 och l2 är linjäriseringspunkter, inte verifierade värden. DSN-stationernas koordinater är ITRF93-värdena i kommentarerna i NAIF-kärnan <c1/>; DSN:s noggrannhetsband lästes endast ur sökträffarnas sammanfattningar. Rymdlänkskonceptet följer de offentliga beskrivningarna av GRASP och ESA Genesis. Hela tabellen, med uppgift om hur varje värde lästes, finns i förhandsregistreringen.

seg-6cd670ae6eea = Resultat i korthet (se RESULTS.md)

seg-6334f82991d3 = Inte uppnådda, och fastlåsta av tester som hävdar missen: C3 (mätvärdet för injicerat fel utlöses inte vid { "3e-10" } m/s2), den bootstrappade frekvensdelen av Q3 vid { "1e-9" } och CRLB-spårdelen av G3. Heltalsosäkerheten löses inte vid de registrerade indata. Ingenting är VALIDATED.

seg-1d3bffc2fd02 = <s1>Föregående</s1>Navigering för rymdanvändare (gnss-ssv)

seg-90932eed0074 = <s1>Nästa</s1>Positionering, navigering och tidssynkronisering i LEO
