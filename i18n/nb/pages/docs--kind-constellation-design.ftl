# docs--kind-constellation-design: translations (nb)

seg-e27476e37522 = Jorden

seg-37d29d8303fe = km

seg-11e8c29ecb45 = Scenariotype i motoren v{ $version }, familie <a1>Konstellasjoner, dekning og geometri</a1>. Veiledende: analyseutdata fra et forsknings- og ingeniørverktøy, ikke typegodkjent navigasjonsutstyr og ikke en sikkerhetskritisk tjeneste for menneskeliv. Hver etikett her er motorens eller verifikasjonsmatrisens; en type er MODELLED med mindre matrisen sier noe annet (hvordan en etikett fortjenes: Evidens-avsnittet i README).

seg-a4f1e7d2041e = Familieside: <a1>Konstellasjoner, dekning og geometri</a1>

seg-670191cf797f = Temaside: <a1>SOLAR-SYSTEM.md</a1>

seg-cb91473bfdda = Temaside: <a1>LEO-PNT.md</a1>

seg-f305ed6dc164 = Kilde: <c1/>

seg-f708c26a5139 = <c1/> (scenariotype)

seg-de173c9f4034 = Konstellasjonsutforming i stor skala: Walker DELTA- og Walker STAR-mønstre i konvensjonen i: T/P/F (noder spredt over { "360" } eller { "180" } deg, avstand i planet { "360" }<em>P/T, faseforskyvning mellom plan { "360" }</em>F/T), eksplisitte elementlister og design med flere skall, flere konstellasjoner i én kjøring, rundt jorden, Månen, Mars eller en hvilken som helst annen planet, Pluto eller en stor måne med konstantene i body-modulen (de samme som typene solar-system og body-pnt bruker). FORHÅNDSINNSTILLINGER fra publiserte nominelle elementer: gps-baseline og gps-expandable (de { "24" } sporene og de seks forover-/bakover-utvidbare parene i GPS Standard Positioning Service Performance Standard, 5. utgave { "2020" }, tabell 3.2-1 til 3.2-3), galileo (Walker 24/3/1 ved { "29 599.801" } km og { "56" } deg, Galileo Open Service Service Definition Document utgave { "1.1" } tabell { "1" } og { "23" }), beidou og beidou-meo (Walker 24/3/1 ved { "21 528" } km og { "55" } deg pluss tre geostasjonære satellitter ved { "80" }, { "110.5" } og { "140" } deg Ø og tre skråstilte geosynkrone satellitter ved { "55" } deg, BeiDou Open Service Performance Standard { "3.0" } avsnitt { "4.1" }; MEO-fasen og krysningen for skråstilt geosynkron ved { "118" } deg Ø er modellert fordi standarden ikke oppgir dem) og glonass (24/3/1 ved { "19 100" } km og { "64.8" } deg fra sporformelen i GLONASS Interface Control Document utgave { "5.1" } avsnitt { "5.2" }). DEKNING OG PRESISJONSFORTYNNING: over et rutenett av breddegrad/lengdegrad og et samplet vindu med en elevasjonsmaske, antall satellitter i sikt, GDOP, PDOP, HDOP og VDOP per celle, tilgjengeligheten (en posisjonsbestemmelse med PDOP ved eller under en terskel, { "6" } som standard) per celle, globalt (arealvektet) og på det verste stedet, med én mottakerklokke per konstellasjon med mindre clock = "common". Den skalerer til tusenvis av satellitter: synlighet er et skalarprodukt mot hver satellitts dekningshalvvinkel, og satellitter deles i bånd etter breddegraden under satellitten hver epoke, slik at en rutenettrad bare tester de som kan være i sikt; rapporten teller parstestene som er spart. JSON-en inneholder rutenettkartene og nedsamplede bakkespor per satellitt. VALIDATED: Walker-generatoren mot Galileo OS SDD tabell { "23" } og sporformelen i GLONASS ICD, GPS-forhåndsinnstillingen mot den publiserte kolonnen for ekvatorkrysning i SPS PS tabell 3.2-1, og den globale HDOP-fordelingen for GPS-grunnlinjen mot SPS PS vedlegg B (median { "0.94" }, { "95" }% { "1.25" }, gjennomsnitt { "0.96" }, toleranse { "0.03" }). MODELLED: todelslegeme-baner med valgfri sekulær J2, et sfærisk legeme, kun geometrisk synlighet (ingen signaleffekt, helse eller terreng), og den relative fasen mellom ulike systemer, som ikke er et øyeblikksbilde av noen virkelig dato.

seg-21fbd84bfba1 = Én kjøring av <c1/> oppsummeres som: constellation-design: { "5000" } satellites (LEO-PNT) around the Earth; availability { "99.22" }% (PDOP <= { "3" } at { "20" } deg mask), worst site { "0.00" }%, median PDOP { "1.11" }, mean { "39.4" } in view; { "648" } grid points x { "12" } epochs (MODELLED)

seg-af572ce1fd89 = Valgfrie felt: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>

seg-fd393ddc7d5d = Eksempelet <c1/> setter blant annet:

seg-d72b4c5393e0 = earth

seg-d9b3c54bd272 = common

seg-6411970ba342 = delta

seg-3bc1761c76ab = { "3" } medfølgende scenarioer bruker denne typen; de andre står i <a1><c1/></a1>.

seg-0a6f7f6c66c4 = km^3/s^{ "2" }

seg-ab9b72b9ffce = Resultatetikett (motorens): MODELLED - two-body Keplerian orbits (optional secular J2) around a spherical body, geometric visibility above an elevation mask, all-in-view dilution of precision with one receiver clock per constellation unless clock = "common"; no signal power, health or terrain. The Walker geometry and the publi

seg-899e728ad9bd = Diagrammet motoren skriver for scenarios/leo-pnt-mega-shell.toml, typen constellation-design

seg-7400f24ec992 = MODELLED { "1" } · VALIDATED { "2" }: radene i <a1>verifikasjonsmatrisen</a1> som nevner denne typen.

seg-602493ac6987 = <b>VALIDATED</b> Generatorene til typen <c1/>: Walker delta- og star-mønstre i T/P/F-konvensjonen (nodeavstand 360/P eller 180/P, avstand i planet { "360" }·P/T, faseforskyvning mellom plan { "360" }·F/T), og GPS-grunnlinjen og den utvidbare 24-sporsvarianten, Gal

seg-bdc81f37ad16 = <b>VALIDATED</b> Dekningsmotoren til typen <c1/> på GPS-grunnlinjens forhåndsinnstilling med 24 spor under betingelsene i vedlegg B i GPS Standard Positioning Service Performance Standard (SPS PS) (ett siderisk døgn, { "287" } femminuttersteg, et globalt rutenett på { "4" } x { "4" } deg med

seg-1272200ad4f2 = <b>MODELLED</b> Typen <c1/> utover de to fastlåste tilfellene: eksplisitte design og design med flere skall, flere konstellasjoner per kjøring med én mottakerklokke per konstellasjon, jorden, Månen og Mars fra legemets konstanter, BeiDou-forhåndsinnstillingen Tester: <a1>coverage_dop_gnss_lib_py_oracle.rs</a1>.

seg-0c64f22330d2 = <b>VALIDATED</b> Generatorene til typen <c1/>: Walker delta- og star-mønstre i T/P/F-konvensjonen (nodeavstand 360/P eller 180/P, avstand i planet { "360" }·P/T, int. Uavhengig referanse (ExternalDataset): Publiserte byrådokumenter: Galileo Open Service Service Definition Document utgave { "1.1" } (European GNSS Service Centre) tabell { "1" } og { "23" }, referansekonstellasjonen ved 2016-11-21 { "00" }:{ "00" } UTC; GLONASS Interface Control Document utgave { "5.1" } ({ "2008" }) avsnitt { "5.2" }, sporformelen for nodelengde og breddeargument; GPS Standard Positioning Service Performance Standard 5. utgave (april { "2020" }) tabell 3.2-1, 3.2-2 og

seg-87c4e19dc780 = <b>VALIDATED</b> Dekningsmotoren til typen <c1/> på GPS-grunnlinjens forhåndsinnstilling med 24 spor under GPS Standard Positioning Service Performance Standard (SPS PS) vedlegg . Uavhengig referanse (ExternalDataset): GPS SPS PS 5. utgave (april { "2020" }) vedlegg B avsnitt B.3.2.2 og B.3.2.3, den publiserte globale gjennomsnittlige HDOP-fordelingen for den fullt besatte grunnlinjekonstellasjonen med 24 spor (median { "0.94" }, { "90" } % { "1.16" }, { "95" } % { "1.25" }, { "98" } % { "1.37" }, gjennomsnitt { "0.96" }), tabell 3.8-1 (PDOP-tilgjengelighet) og tabell B.3-1 (ensemble-PDOP for en degradert konstellasjon, brukt bare som øvre grense), pluss en håndutledet lukket form for én epoke. VDOP og PD

seg-04289f7252cd = <b>MODELLED</b> Typen <c1/> utover de to fastlåste tilfellene: eksplisitte design og design med flere skall, flere konstellasjoner per kjøring med én mottakerklokke per konste. Uavhengig referanse (InternalConsistency): Intern konsistens: brute-force-elevasjonsskanningen, de håndberegnede reduksjonene og orbit::dop, og den lukkede Walker- og geosynkrone geometrien. Todelslegeme-baner med valgfri sekulær J2, et sfærisk legeme med lokal vertikal langs radius, kun geometrisk synlighet (ingen signaleffekt, satellitthelse, terreng eller tredjelegemeforstyrrelse), og den relative fasen mellom systemer hentet fra ulike re

seg-00fa65d44cbd = MODELLED - two-body Keplerian orbits (optional secular J2) around a spherical body, geometric visibility above an elevation mask, all-in-view dilution of precision with one receiver clock per constellation unless clock = "common"; no signal power, health or terrain. The Walker geometry and the published presets are checked against the Galileo OS SDD, the GLONASS ICD and the GPS SPS Performance Standard slot tables, a (resultat <c1/>)

seg-62f0fc16a247 = MODELLED: todelslegeme-baner med valgfri sekulær J2, et sfærisk legeme, kun geometrisk synlighet (ingen signaleffekt, helse eller terreng), og den relative fasen mellom ulike systemer, som ikke er et øyeblikksbilde av noen virkelig dato. (typekatalog (<c1/>))

seg-3ef4276dd40b = Hva kjøringen svarer på: satellitter i sikt, PDOP/HDOP/VDOP/GDOP per celle på { "10" } deg, og andelen av tiden med PDOP ved eller under { "3" } over en maske på { "20" } deg i løpet av to timer. Det svake punktet kartet viser er polkalottene: ingen skall når over omtrent { "82" } deg breddegrad, så en bruker nær en pol ser alle satellitter på én side av himmelen og den vertikale geometrien forverres. MODELLED: et illustrativt design, todelslegeme-baner med J2, en sfæ (kommentar i scenariofilen, linje { "17" } til { "21" })

seg-c333d3fe22cd = Kart over dekning og presisjonsfortynning for vilkårlige design med flere konstellasjoner i stor skala, rundt et hvilket som helst sentrallegeme, er MODELLED, ikke validert: kontrollert mot sin egen lukkede/analytiske identitet – fanger opp transkripsjons- og koeffisientfeil, men er ikke en uavhengig ekstern referanse. (verifikasjonsmatrise (docs/MODELLED-RATIONALE.md))

seg-436504a8b26f = <s1>Forrige</s1>conflict-resilience

seg-cba188459c80 = <s1>Neste</s1>contact-schedule
