# docs--kind-constellation-design: translations (da)

seg-e27476e37522 = Jorden

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Scenarietype i motoren v{ $version }, familie <a1>Konstellationer, dækning og geometri</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-a4f1e7d2041e = Familieside: <a1>Konstellationer, dækning og geometri</a1>

seg-670191cf797f = Emneside: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Emneside: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Kilde: <c1/>

seg-f708c26a5139 = <c1/> (scenarietype)

seg-de173c9f4034 = Konstellationsdesign i stor skala: Walker DELTA- og Walker STAR-mønstre i konventionen i: T/P/F (knuder fordelt over { "360" } eller { "180" } deg, afstand i planet { "360" }<em>P/T, faseforskydning mellem planer { "360" }</em>F/T), eksplicitte elementlister og designs med flere skaller, flere konstellationer i én kørsel, omkring Jorden, Månen, Mars eller enhver anden planet, Pluto eller større måne med konstanterne i body-modulet (de samme, som solsystem- og body-pnt-typerne bruger). FORUDINDSTILLINGER ud fra publicerede nominelle elementer: gps-baseline og gps-expandable (de { "24" } pladser og de seks forreste/bageste udvidelsespar i GPS Standard Positioning Service Performance Standard, 5th edition { "2020" }, Tables 3.2-1 til 3.2-3), galileo (Walker 24/3/1 ved { "29 599.801" } km og { "56" } deg, Galileo Open Service Service Definition Document issue { "1.1" } Tables { "1" } og { "23" }), beidou og beidou-meo (Walker 24/3/1 ved { "21 528" } km og { "55" } deg plus tre geostationære satellitter ved { "80" }, { "110.5" } og { "140" } deg E og tre skrå geosynkrone satellitter ved { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } section { "4.1" }; MEO-fasen og den skrå geosynkrone krydsning ved { "118" } deg E er modelleret, fordi standarden ikke angiver dem) og glonass (24/3/1 ved { "19 100" } km og { "64.8" } deg ud fra slotformlen i GLONASS Interface Control Document edition { "5.1" } section { "5.2" }). DÆKNING OG PRÆCISIONSUDVANDING: over et breddegrads-/længdegradsgitter og et samplet vindue med en elevationsmaske, antal satellitter i sigte, GDOP, PDOP, HDOP og VDOP pr. celle, tilgængeligheden (en positionsbestemmelse med PDOP ved eller under en tærskel, { "6" } som standard) pr. celle, globalt (arealvægtet) og på det værste sted, med ét modtagerur pr. konstellation, medmindre clock = "common". Den skalerer til tusindvis af satellitter: synlighed er et skalarprodukt mod hver satellits halve dækningsvinkel, og satellitter opdeles i bånd efter sub-satellitbredde hver epoke, så en gitterrække kun afprøver dem, der kan være i sigte; rapporten tæller de sparede par-tests. JSON'en indeholder gitterkortene og nedsamplede jordspor pr. satellit. VALIDATED: Walker-generatoren mod Galileo OS SDD Table { "23" } og GLONASS ICD's slotformel, GPS-forudindstillingen mod den publicerede kolonne for ækvatorkrydsning i SPS PS Table 3.2-1, og den globale HDOP-fordeling for GPS-baseline mod SPS PS Appendix B (median { "0.94" }, { "95" }% { "1.25" }, middel { "0.96" }, tolerance { "0.03" }). MODELLED: tolegemebaner med valgfri sekulær J2, et kugleformet legeme, kun geometrisk synlighed (ingen signaleffekt, tilstand eller terræn), og den relative fase mellem forskellige systemer, som ikke er et øjebliksbillede af nogen reel dato.

seg-21fbd84bfba1 = Én kørsel af <c1/> opsummeres som: constellation-design: { "5000" } satellitter (LEO-PNT) omkring Jorden; tilgængelighed { "99.22" }% (PDOP <= { "3" } ved { "20" } deg maske), værste sted { "0.00" }%, median-PDOP { "1.11" }, middel { "39.4" } i sigte; { "648" } gitterpunkter x { "12" } epoker (MODELLED)

seg-af572ce1fd89 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Eksemplet <c1/> angiver blandt andet:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = { "3" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Resultatmærkat (motorens egen): MODELLED - tolegemers keplerske baner (valgfri sekulær J2) omkring et kugleformet legeme, geometrisk synlighed over en elevationsmaske, alt-i-sigte-præcisionsudvanding med ét modtagerur pr. konstellation, medmindre clock = "common"; ingen signaleffekt, tilstand eller terræn. Walker-geometrien og de publicerede

seg-899e728ad9bd = Diagrammet, som motoren skriver for scenarios/leo-pnt-mega-shell.toml, type constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: rækkerne i <a1>verifikationsmatrixen</a1>, som nævner denne type.

seg-602493ac6987 = <b>VALIDATED</b> Generatorerne i typen <c1/>: Walker delta- og star-mønstre i T/P/F-konventionen (knudeafstand 360/P eller 180/P, afstand i planet { "360" }·P/T, faseforskydning mellem planer { "360" }·F/T), og GPS-baseline og udvidelig 24-slot, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> Dækningsmotoren i typen <c1/> på GPS-baseline-forudindstillingen med 24 slots under betingelserne i GPS Standard Positioning Service Performance Standard (SPS PS) Appendix B (ét siderisk døgn, { "287" } femminuttersskridt, et globalt gitter på { "4" } x { "4" } deg med

seg-1272200ad4f2 = <b>MODELLED</b> Typen <c1/> ud over de to fastlåste tilfælde: eksplicitte udformninger og udformninger med flere skaller, flere konstellationer pr. kørsel med ét modtagerur pr. konstellation, Jorden, Månen og Mars ud fra legemekonstanterne, BeiDou-forudindstillingen. Tests: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> Generatorerne i typen <c1/>: Walker delta- og star-mønstre i T/P/F-konventionen (knudeafstand 360/P eller 180/P, afstand i planet { "360" }·P/T, int. Uafhængig reference (ExternalDataset): Publicerede agenturdokumenter: Galileo Open Service Service Definition Document issue { "1.1" } (European GNSS Service Centre) Tables { "1" } og { "23" }, referencekonstellationen pr. 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document edition { "5.1" } ({ "2008" }) section { "5.2" }, slotformlen for knudelængdegrad og breddegradsargument; GPS Standard Positioning Service Performance Standard 5th edition (April { "2020" }) Tables 3.2-1, 3.2-2 og

seg-87c4e19dc780 = <b>VALIDATED</b> Dækningsmotoren i typen <c1/> på GPS-baseline-forudindstillingen med 24 slots under GPS Standard Positioning Service Performance Standard (SPS PS) Appendix . Uafhængig reference (ExternalDataset): GPS SPS PS 5th edition (April { "2020" }) Appendix B sections B.3.2.2 og B.3.2.3, den publicerede globale gennemsnitlige HDOP-fordeling for den fuldt besatte baseline-konstellation med 24 slots (median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, middel { "0.96" }), Table 3.8-1 (PDOP-tilgængelighed) og Table B.3-1 (ensemble-PDOP for en forringet konstellation, kun brugt som øvre grænse), plus en håndudledt lukket form for én epoke. VDOP og PD

seg-04289f7252cd = <b>MODELLED</b> Typen <c1/> ud over de to fastlåste tilfælde: eksplicitte designs og designs med flere skaller, flere konstellationer pr. kørsel med ét modtagerur pr. konste. Uafhængig reference (InternalConsistency): Intern konsistens: den brute-force-baserede elevationsscanning, de håndberegnede reduktioner og orbit::dop-reduktionerne samt den lukkede Walker- og geosynkrone geometri. Tolegemebaner med valgfri sekulær J2, et kugleformet legeme med den lokale lodrette langs radius, kun geometrisk synlighed (ingen signaleffekt, satellittilstand, terræn eller tredjelegemeforstyrrelse), og den relative fase mellem systemer taget fra forskellige re

seg-00fa65d44cbd = MODELLED - tolegemers keplerske baner (valgfri sekulær J2) omkring et kugleformet legeme, geometrisk synlighed over en elevationsmaske, alt-i-sigte-præcisionsudvanding med ét modtagerur pr. konstellation, medmindre clock = "common"; ingen signaleffekt, tilstand eller terræn. Walker-geometrien og de publicerede forudindstillinger er kontrolleret mod slottabellerne i Galileo OS SDD, GLONASS ICD og GPS SPS Performance Standard, a (resultat <c1/>)

seg-62f0fc16a247 = MODELLED: tolegemebaner med valgfri sekulær J2, et kugleformet legeme, kun geometrisk synlighed (ingen signaleffekt, tilstand eller terræn), og den relative fase mellem forskellige systemer, som ikke er et øjebliksbillede af nogen reel dato. (typekatalog (<c1/>))

seg-3ef4276dd40b = Hvad kørslen svarer på: satellitter i sigte, PDOP/HDOP/VDOP/GDOP pr. celle på { "10" } deg og andelen af tiden med PDOP ved eller under { "3" } over en maske på { "20" } deg over to timer. Det svage punkt, kortet viser, er polarkalotterne: ingen skal når op over cirka { "82" } deg breddegrad, så en bruger nær en pol ser alle satellitter på den ene side af himlen, og den lodrette geometri forringes. MODELLED: et illustrativt design, tolegemebaner med J2, et kugl (kommentar i scenariefilen, linje { "17" } til { "21" })

seg-c333d3fe22cd = Dækningskort og kort over præcisionsudvanding for vilkårlige multikonstellationsdesigns i stor skala, omkring ethvert centrallegeme er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet — fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-436504a8b26f = <s1>Forrige</s1>conflict-resilience

seg-cba188459c80 = <s1>Næste</s1>contact-schedule
