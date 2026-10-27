# docs--kind-gnss-ssv: translations (da)

seg-37d29d8303fe = km

seg-834408a40783 = min

seg-1b94e5a24a2d = Kilde: <c1/>

seg-ee3ecc6e0330 = <c1/> (scenarietype)

seg-d07af7221334 = Scenarietype i motoren v{ $version }, familie <a1>Navigation for rumbrugere</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: afsnittet Evidens i README).

seg-d6d7bca305dc = MODELLED GNSS-tilgængelighed og linkstyrke i Space Service Volume og videre ud: for en bruger på en kugle (ICG-hæftets globale skal) eller på en kepleriansk bane (fra LEO til månetransfer) tæller den pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for dem alle samlet de signaler, der kan bruges over en C/N0-tærskel: tilgængelighed af mindst ét og af fire signaler, maksimal udfaldsvarighed, modtaget C/N0, præcisionsfortynding, links via hovedlobe mod sidelobe, med et mønster for sendeeffekt fra hæftet, parametrisk eller leveret af brugeren, valgfri limb-stråle-ionosfære, plasmasfære og atmosfæreeffekter og en valgfri udformning af modtager til svage signaler; desuden et GNSS-udvidet Kalman-filter om bord til HEO- og månetransferfartøjer (banedynamik, solstrålingstryk, tredjelegemer, ur) og relativ navigation af en formation af flere fartøjer med enkeltdifferencerede pseudoafstande. Kontrolleret mod tabellerne i ICG SSV-hæftet under en præregistrering (xval/gnss-ssv)

seg-d739ae994bf0 = Én kørsel af <c1/> opsummeres sådan: gnss-ssv trajectory { "497" } to { "58622" } km altitude: l1 combined { "1" }+ { "100.0" }% { "4" }+ { "97.4" }% (max outage { "0" } min); l5 combined { "1" }+ { "100.0" }% { "4" }+ { "100.0" }% (max outage { "0" } min)

seg-79d2e350ed73 = Obligatoriske felter: <c1/>

seg-7fc75803140d = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-cebc76420d69 = Eksemplet <c1/> angiver blandt andet:

seg-ce3b64e8c1f4 = [l1, l5]

seg-8b8f5598c9d7 = [gps, glonass, galileo, bds]

seg-b02a3ef32d54 = HEO, antenner med høj forstærkning mod nadir og patch-antenner mod zenit, parametrisk s

seg-666a68730eaa = [booklet-high-gain-nadir, booklet-patch-zenith]

seg-3421a66993bd = heo

seg-8974ff39f695 = parametric

seg-1d65b71c5de0 = { "5" } medfølgende scenarier bruger denne type; de øvrige findes i <a1><c1/></a1>.

seg-8ac8f00f6c77 = 1/m^{ "3" }

seg-15ca016a7a4f = Resultatmærkat (motorens): MODELLED: et geometrisk sweep og et sweep af linkbudget. Hæftets mønster er en hovedlobe med konstant effekt, det parametriske mønster en repræsentativ stedfortræder, og limb-stråle-mediet en enkel angivet model; intet her er en måling af et signal i rummet. Tilgængeligheds- og udfaldstallene følger metoden o

seg-7dae5e291c8b = Diagrammet, som motoren skriver for scenarios/gnss-ssv-heo.toml, scenarietype gnss-ssv

seg-0aae0574c5e6 = <b>MODELLED</b> Tilgængelighedssweepene i <c1/>-typen: pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og samlet andelen af (bruger, epoke)-par med mindst ét og mindst fire signaler og det længste udfald, for en bruger på en kugle

seg-07c94d5ad15c = <b>MODELLED</b> Tilstanden <c2/> i <c1/>-typen: et udvidet Kalman-filter med ni tilstande (position, hastighed, modtagerurets bias og drift, en skala for solstrålingstryk) på pseudoafstande, hvis tilgængelighed, støj og C/N0 kommer fra det samme link

seg-41bfe74c6f6f = <b>MODELLED</b> Tilstanden <c2/> i <c1/>-typen: et hovedfartøj og deputerede kører hver det absolutte filter; den deputeredes position i forhold til hovedfartøjet estimeres ved at trække de absolutte estimater fra hinanden og med et relativt filter på enkeltdifferencerede pseud

seg-de9a2a5b5f04 = <b>MODELLED</b> Tilgængelighedssweepene i <c1/>-typen: pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og samlet andelen af (bruger, epoke)-par med mindst. Uafhængig reference (ExternalDataset): ICG Space Service Volume-hæftet (UN OOSA ST/SPACE/75, { "2018" }), selv en simulering, sammenlignet under en præregistrering, der blev indgivet før kørslen (xval/gnss-ssv/PREREGISTRATION.md; resultater i xval/gnss-ssv/RESULTS.md, fastholdt af tests/ssv_booklet_results.rs, misses medregnet). Kørsel { "1" } på den præregistrerede læsning: konstanterne for minimal udstrålet effekt og månetærsklen stemmer (S0, S6 nået); den øvre og nedre SSV, RF-tærskel

seg-f0b778c4922a = <b>MODELLED</b> En Chapman-ionosfære, en plasmasfære af Gallagher-typen og en neutral atmosfære (brydning af refraktivitet, iltabsorption, defokusering) integreret langs den lige. Uafhængig reference (InternalConsistency): Lukkede former og offentliggjorte størrelser i testene (en Chapman-lags top og brydningen ved jordoverfladens limb, nogle få TECU plasmasfære på en GPS-til-GEO-stråle); modtagerudformningen genbruger modellerne for erhvervelse og tracking-sløjfer og deres tests. Ingen målt limb-sondering eller modtagelse af svage signaler er sammenlignet med den

seg-77cef183420e = <b>MODELLED</b> Tilstanden <c2/> i <c1/>-typen: et udvidet Kalman-filter med ni tilstande (position, hastighed, modtagerurets bias og drift, en skala for solstrålingstryk. Uafhængig reference (InternalConsistency): Simuleret sandhed mod filterets eget estimat (et konsistent filters middel af normaliseret estimeringsfejl i anden er ca. { "3" } for positionen) og determinisme for et fast seed. Ingen flyve- eller optagne GNSS-data fra høje baner er sammenlignet; Solen og Månen er cirkulære stedfortrædere med lav præcision

seg-429e154cd691 = <b>MODELLED</b> Tilstanden <c2/> i <c1/>-typen: et hovedfartøj og deputerede kører hver det absolutte filter; den deputeredes position i forhold til hovedfartøjet estimeres ved at trække. Uafhængig reference (InternalConsistency): Den samme simulerede sandhed som det absolutte filter: det relative filters fejl mod den sande relative tilstand og kontrollen af, at det klarer sig mindst lige så godt som at trække to uafhængige absolutte positionsbestemmelser fra hinanden. Ingen flyveformationsdata er sammenlignet

seg-1dd1beb01075 = MODELLED: et geometrisk sweep og et sweep af linkbudget. Hæftets mønster er en hovedlobe med konstant effekt, det parametriske mønster en repræsentativ stedfortræder, og limb-stråle-mediet en enkel angivet model; intet her er en måling af et signal i rummet. Tilgængeligheds- og udfaldstallene følger metoden i ICG Space Service Volume-hæftet (UN ST/SPACE/75) og kontrolleres mod dets tabeller i xval/gnss-ssv/. (resultat <c1/>)

seg-e9c2dedbc971 = MODELLED GNSS-tilgængelighed og linkstyrke i Space Service Volume og videre ud: for en bruger på en kugle (ICG-hæftets globale skal) eller på en kepleriansk bane (fra LEO til månetransfer) tæller den pr. konstellation (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) og for dem alle samlet de signaler, der kan bruges over en C/N0-tærskel: tilgængelighed af mindst ét og af fire signaler, maksimal udfaldsvarighed, modtaget C/N0, (typekatalog (<c1/>))

seg-3add0e744c54 = MODELLED: mønstret er repræsentativt, ikke målt; mediet er en angivet enkel model (docs/SSV.md). (kommentar i scenariefilen, linje { "14" })

seg-6b4655dd5270 = GNSS-signaltilgængelighed i Space Service Volume og videre ud, sammenlignet med ICG SSV-hæftet, er MODELLED, ikke valideret: en delpåstand kontrolleres eksternt, men hele funktionen sammensættes af modellerede dele, så funktionen forbliver modelleret. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-a9e1798308df = Limb-stråle-effekter fra ionosfære, plasmasfære og atmosfære på strejfende GNSS-signaler samt udformningen af modtageren til svage signaler i <c1/>-typen er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-132be2813c10 = GNSS-navigationsfilter om bord til rumfartøjer i høje baner og månetransfer er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-f9405de9adb8 = Relativ navigation af en formation af flere rumfartøjer i en stærkt elliptisk bane ud fra GNSS er MODELLED, ikke valideret: kontrolleret mod sin egen lukkede/analytiske identitet; fanger transskriptions- og koefficientfejl, men er ikke en ekstern uafhængig reference. (verifikationsmatrix (docs/MODELLED-RATIONALE.md))

seg-4881f925ea7f = Familieside: <a1>Navigation for rumbrugere</a1>

seg-4b72df59b3f9 = Emneside: <a1>SSV.md</a1>

seg-c9ac9a99bcbb = <s1>Forrige</s1>gnss-sim

seg-9df48482a140 = <s1>Næste</s1>gravity-map
