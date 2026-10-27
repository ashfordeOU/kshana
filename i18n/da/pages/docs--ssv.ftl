# docs--ssv: translations (da)

seg-0857a94a948e = Begrænsninger

seg-75c8da01c0f1 = MET

seg-069a652c402e = tærskel

seg-1f79a5aae6c5 = Signaltilgængelighed for en bruger på en kugle i { "36000" } km højde med en halvkugleantenne, fra en egentlig kørsel af motor v{ $version } på scenarios/gnss-ssv-shell.toml (en reduceret kørsel: { "162" } brugere, { "3" } dage, trin på { "10" } min), ved en tærskel på { "20" } dB-Hz. For hver konstellation og hvert bånd to søjler: andelen af (bruger, epoke)-par med mindst ét signal og med mindst fire. Kombineret, L1: { "99.4" } % mindst ét, { "73.2" } % mindst fire, længste udfald under fire signaler { "160" } min. Kombineret, L5: { "100.0" } % mindst ét, { "99.9" } % mindst fire, længste udfald under fire signaler { "20" } min. MODELLED: en modelleret undersøgelse ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Den reducerede størrelse er ikke sammenligningen med hæftet. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-92ef8e0b78de = Signaler langs én høj jordbane (perigæum { "497" } km, apogæum { "58622" } km, omløbstid { "18.8" } h), fra en egentlig kørsel af motor v{ $version } på scenarios/gnss-ssv-heo.toml, bånd L1. Øverst: den bedste bærebølge-til-støj-tæthed blandt de signaler, der er i sigte, mod tærsklen på { "20" } dB-Hz. I midten: antallet af signaler i sigte fra alle konstellationer, fra { "4" } til { "55" } langs de udtagne punkter. Af de modtagne links kom { "2252" } gennem en hovedlobe og { "696" } gennem sidelober, med et mærket parametrisk stedfortrædermønster, ikke noget systems målte mønster. Median PDOP { "67" }, 95. percentil { "358" }. MODELLED: en modelleret undersøgelse ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-902c5c7da9aa = Et filter med ni tilstande om bord på en overgang fra lav bane mod Månen, fra en egentlig kørsel af motor v{ $version } på scenarios/gnss-ssv-nav-lunar.toml ({ "289" } epoker, { "13" } punkter tegnet). På en logaritmisk akse den sande positionsfejl og filterets egen énsigmagrænse mod tid siden start. Inden for GNSS-banerne er positions-RMS { "1.4" } m; over dem er den { "90" } m, med den endelige fejl { "184" } m i { "193,330" } km højde med { "1" } måling. Middel af normaliseret estimeringsfejl i anden over hele kørslen er { "4.4" } (omkring { "3" } for en konsistent positionsblok). Referencen og filteret deler deres stedfortrædere for Solen og Månen. MODELLED: en modelleret undersøgelse ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-9a947b61a4cb = Relativ navigation af { "2" } deputies omkring en chief på en høj bane, fra en egentlig kørsel af motor v{ $version } på scenarios/gnss-ssv-formation-heo.toml ({ "401" } epoker). For hver deputy to søjler: den relative positions-RMS ved at trække de to uafhængige absolutte estimater fra hinanden, og fra det relative filter på enkeltdifferencerede pseudoafstande. Baseline { "0.8" } km: { "5.1" } m og { "1.2" } m. Baseline { "2.0" } km: { "4.1" } m og { "2.1" } m. Det absolutte filter er ikke konsistent her: middel af normaliseret estimeringsfejl i anden { "187" } mod omkring { "3" } for et konsistent filter, så dets angivne usikkerhed er langt for lille. MODELLED: en modelleret undersøgelse ud fra angivne input, ikke en måling og ikke en påstand om servicevolumen for noget system. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-d76123040989 = Den registrerede sammenligning af tilgængelighedsmodellen for rumbrugere med det offentlige hæfte om Space Service Volume, fra de indlagte resultater af den på forhånd registrerede kørsel (xval/gnss-ssv/results-run1.json, skrevet af eksemplet ssv_booklet_check i motor v{ $version }). Tærskel for tærskel, cellerne inden for tolerance: S0 { "13" } af { "13" } (MET); S1 { "43" } af { "52" } (NOT MET); S2 { "48" } af { "52" } (NOT MET); S3 { "122" } af { "155" } (NOT MET); S4 { "132" } af { "156" } (NOT MET); S5 { "18" } af { "26" } (NOT MET); S6 { "26" } af { "26" } (MET); S7 { "0" } af { "20" } panelmønstre (NOT MET). Kun S0 og S6 er nået under den på forhånd registrerede aflæsning. En diagnostisk variant, der bruger hæftets andre GLONASS-vinkler, bringer S1, S2 og S4 til alle celler, men erstatter ikke den registrerede kørsel. Ingen registerrække er VALIDATED. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en livsikkerhedstjeneste.

seg-74675df154dc = Kilde: <c1/>

seg-ce7ea32e67f1 = GNSS ud over konstellationen: typen <c1/>

seg-389cb131fd77 = Kun vejledende. Modellerede resultater ud fra angivne input og en simuleret sandhed; ikke en certificering, et flyvekvalificeret tal eller en påstand om servicevolumen for noget system. Kshana udsender intet.

seg-a0011b278269 = Typen <c1/> besvarer: for et rumfartøj over, omkring eller langt forbi GNSS-banerne, hvor mange GNSS-signaler kan det bruge, hvor stærke er de, hvor god er geometrien, og hvad kan et filter om bord gøre med dem? Den har tre tilstande, valgt efter hvilken tabel scenariet har: <c2/>, <c3/> eller <c4/> (med en valgfri <c5/>).

seg-2e4ac6b7a883 = Status: <b>MODELLED</b>. Tilgængelighedssvepene sammenlignes med ICG's booklet om Space Service Volume under en præregistrering; se <a1>hvad sammenligningen viser</a1>, før du støtter dig til noget tal.

seg-a0ff58bccaa8 = Offentlige kilder

seg-4658268e82e1 = <em>The Interoperable Global Navigation Satellite Systems Space Service Volume</em>, United Nations Office for Outer Space Affairs, ST/SPACE/75 ({ "1" } november { "2018" }), udarbejdet af International Committee on GNSS (ICG), Working Group B: metoden (bilag B), banelementerne for hver konstellation (bilag C), sendestrålebredderne og -effekterne (tabel B2, B6, B8, { "4.2" }), brugerantennerne (tabel B10) og de publicerede tilgængelighedstabeller. Den er selv en simulation. Hentet af <c1/> (fastlåst SHA-256), aldrig vendoret.

seg-e46d9353e6f3 = U.S. Coast Guard Navigation Center, antennepanelmønstre for GPS Block IIR og IIR-M (Marquis, { "2014" }): de målte L1-panelmønstre, der kun bruges til at bedømme det parametriske stedfortrædermønster (tærskel S7). Hentet, aldrig vendoret, ingen mønsterdata indskrevet.

seg-0a002dc0df64 = Modellens konstanter (tyngdekraft, jordrotation, frirumsdæmpning, støjtæthed) er standard; Gallagher-plasmasfærens tæthedslov, Chapman-laget og profilen for radiorefraktivitet er publicerede former, brugt med angivne simple parametre (se <c1/>).

seg-c3c3f63df966 = Shell-tilstand: bookletets globale metrik

seg-f1e153c95b13 = <c1/> placerer en bruger på en kugle (standard { "36,000" } km højde med en nadirpegende halvkugleformet antenne, den øvre SSV; eller { "8,000" } km med en rundstrålende antenne, den nedre SSV) på et icosfæregitter med 2.562 punkter og tæller over { "14" } døgn med trin på 1 minut andelen af (bruger, epoke)-par med mindst ét og mindst fire signaler, for hver konstellation og samlet, og det længste udfald hos den værste bruger. Svepet bruger den lukkede form for synlighedsintervallet i centralvinkel (en strålekegle, jordblokering af kuglen på { "6378" } km plus { "50" } km, brugerhalvkuglen og RF-rækkeviddegrænsen) og kører på sekunder i en release-build; en egenskabstest kontrollerer det mod det generelle geometriske prædikat.

seg-3fb4c06c8b3f = Trajektorietilstand: langs en bane

seg-632fedc95af5 = <c1/> flyver brugeren på en kepler-bane (en forudindstilling: <c2/>, <c3/>, <c4/>, <c5/> (bookletets tabel { "5.10" }) eller <c6/>, eller elementer) og rapporterer for hvert bånd og hver konstellation tilgængelighed af ét og fire signaler, udfaldsvarigheder, signaler i sigte, bedste C/N0, præcisionsfortynding (median, 95. percentil, værste), links modtaget gennem hovedloben og gennem sidelober samt en valgfri tidsserie og CSV.

seg-7bfd301cd789 = <b>Sendemønster</b> (<c1/>): <c2/> (konstant effekt inden for referencevinklen uden for boresight), <c3/> (et mærket stedfortrædermønster: { "3" } dB pr. grad ud over referencevinklen ned til et gulv { "25" } dB under hovedloben; <b>ikke</b> noget systems målte mønster) eller <c4/> (et målt mønster, du leverer: <c5/> eller indlejret <c6/>; panelmønstrene for Block IIR/IIR-M kan udtrækkes med <c7/>).

seg-c1390929d9f2 = <b>Modtageantenner</b>: rundstrålende, halvkugle eller bookletets højforstærknings- og patchantenner fra tabel B10, nadir eller zenit; hvert link bruger antennen med den højeste forstærkning.

seg-fe56ab7a2cac = <b>Medium for limbstråle</b> (<c1/>): en Chapman-ionosfære, en plasmasfære (Gallagher { "1988" }-form, plasmapause ved L = { "4.5" }, aftagende under { "1,500" } km) og en neutral atmosfære (bøjning omkring { "1.33" } grader ved overfladen, iltabsorption, defokusering) integreret langs den rette stråle. Rapporterer skrå TEC, den plasmasfæriske del, ekstra forsinkelse, tangenthøjde og de links, der mistes ved strejf. Integration langs rette stråler: bøjningen rapporteres, den itereres ikke.

seg-1bad91204f6a = <b>Modtager til svage signaler</b> (<c1/>): kohærent og ikke-kohærent integration, databitgrænse, aiding- og pilotkanaler, Doppler-søgning; acquisition-tærsklen ved de angivne detektions- og falskalarmssandsynligheder og tærsklerne for bærebølge- og kodesporing erstatter den faste C/N0-tærskel (området { "10" } til { "25" } dB-Hz). Genbruger motorens modeller for acquisition og sporingssløjfer.

seg-497126fe23e9 = Navigationstilstand: et filter om bord

seg-af7919ae046e = <c1/> flyver et fartøj i høj bane eller månetransfer og kører et udvidet Kalman-filter med ni tilstande (position, hastighed, modtagerurets bias og drift, en skala for solstrålingstryk) på pseudoafstande. Sandheden integreres med punktmassetyngdekraft, J2, tredjelegemevirkning fra Solen og Månen og strålingstryk med en cylindrisk jordskygge; filteret modellerer tyngdekraft, J2 og tredjelegemerne og estimerer strålingstrykket. Pseudoafstandene kommer fra den samme linkgeometri og C/N0-tærskel som svepene; deres støj vokser, når C/N0 falder; mediets ekstra forsinkelse (med <c2/>) lægges til og modelleres ikke af filteret. Rapporten adskiller den del af kørslen, der ligger inden for GNSS-banerne (under { "20,000" } km højde), fra delen over, angiver det længste hul uden måling og den gennemsnitlige normaliserede estimationsfejl i anden (omkring { "3" } for en konsistent positionsblok). Solen og Månen er cirkulære stedfortrædere med lav præcision.

seg-a515950c13d6 = Formationstilstand: relativ navigation

seg-8d2b72ca56d9 = <c1/> (kræver <c2/> for chefen) tilføjer deputies forskudt i sand anomali. Hvert fartøj kører det absolutte filter; deputyens position i forhold til chefen estimeres ved at trække de uafhængige absolutte estimater fra hinanden og ved et relativt filter på enkeltdifferencerede pseudoafstande for de signaler, begge fartøjer sporer. Rapporten angiver begge, baselinen og antallet af signaler, der spores til fælles.

seg-dc78efcb8bcb = Hvad sammenligningen med bookletet viser

seg-643bcfcea515 = Tærsklerne blev præregistreret (<c1/>, tillæg { "1" } til { "5" }), før kørslen i fuld størrelse; resultater i <c2/>, celler i <c3/>, fastholdt af <c4/>, misser medregnet.

seg-5498636f8d07 = hvad

seg-32c0ea7929e2 = kørsel { "1" } (præregistreret læsning)

seg-abe521171d2f = variant med GLONASS-vinkel (diagnostisk)

seg-9489ef691574 = minimal udstrålet effekt, { "13" } signaler, inden for { "0.1" } dB

seg-4b7e0252355c = øvre SSV-geometri (tabel B4)

seg-e3c870085a6c = NOT MET ({ "43" } af { "52" } celler)

seg-b57b1f9b0b43 = alle { "52" } celler inden for tolerancen

seg-6bf57763d120 = nedre SSV (tabel { "5.2" })

seg-c9349a3a0185 = NOT MET ({ "48" } af { "52" })

seg-056eae8e55d1 = alle { "52" }

seg-805e4402f556 = øvre SSV med 15/20/25 dB-Hz (tabel B9)

seg-a8d9a1f66989 = NOT MET ({ "122" } af { "155" })

seg-7a6fd0eb8f77 = { "153" } af { "155" }

seg-cb1a6f558a09 = seks GEO-missioner

seg-e4759e8d2baa = NOT MET ({ "132" } af { "156" })

seg-3e59e79791e2 = alle { "156" }

seg-76d88834ab69 = HEO-mission

seg-1c06414304a0 = NOT MET ({ "18" } af { "26" })

seg-b1656692859b = { "21" } af { "26" }

seg-d4cedd711485 = månemission

seg-b52333886109 = NOT MET ({ "23" } af { "26" })

seg-479a041e2b62 = parametrisk mønster mod målte GPS L1-panelmønstre

seg-b514bc035c86 = NOT MET (RMS { "6.3" } til { "8.8" } dB mod { "3" } dB)

seg-dd703fdea949 = Bookletet er internt inkonsistent om GLONASS' referencevinkel uden for boresight: tabel B2 og B6 angiver { "20" } og { "28" } grader, tabel { "4.2" } angiver { "26" } og { "34" }. Kørsel { "1" } brugte den første (det, præregistreringen navngav); næsten alle misser i S1 til S5 er GLONASS. Varianten, der blev fastlagt som diagnostik, før den blev kørt, bruger den anden, og så stemmer den øvre SSV, den nedre SSV og GEO-missionerne celle for celle, udfald medregnet. Varianten erstatter ikke kørsel { "1" }. <b>Ingen række er VALIDATED</b>: bookletet er en simulation, verdiktreglen kræver S0 til S3 under den præregistrerede læsning, og de resterende misser (GPS L1 ved { "20" } dB-Hz, HEO Galileo, QZSS og NavIC, GLONASS-rækkerne for Månen) er ikke forklaret.

seg-6eecf686159b = Kør den

seg-adbb9c22de1c = Hvert medfølgende scenarie er skåret ned, så det kører på sekunder; sammenligningen i fuld størrelse er eksemplet ovenfor. Den samme type kører fra Python (<c1/>), browseren (WebAssembly), MCP-serveren (<c2/>, kun indlejret tekst: <c3/> er en filkilde og afvises, brug <c4/>) og pluginsene.

seg-8fa10c8e7ab7 = MODELLED: intet her blev sammenlignet med målt GNSS-modtagelse i kredsløb. Bookletet er en simulation.

seg-b34e9acebec0 = Keplerske tolegemebaner for GNSS-konstellationerne og for brugeren i svepene; månetransferen er en tolegemeellipse, ikke en propageret trajektorie.

seg-76aa617ba828 = Mediet er en angivet simpel model med integration langs rette stråler; det er ikke en rumvejrsprognose.

seg-3114c4249988 = Navigationsfilteret er et designstudie: ingen manøvrer, ingen attitude, ingen flervejsudbredelse, og sandheden deler sine Sol- og Måne-efemerider med filteret.

seg-2deafc0f9534 = <s1>Forrige</s1>Månereferencestation

seg-23386861eebf = <s1>Næste</s1>Månebane og -overflade som infrastruktur
