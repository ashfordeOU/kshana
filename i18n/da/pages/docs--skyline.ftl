# docs--skyline: translations (da)

seg-f917e7fcac09 = Hvad det er

seg-6c6e7248496f = Himmelgeometri

seg-379f49bff6fb = Python

seg-2bd2101ce454 = Flade

seg-ad856ad710eb = Status

seg-cbf0f9bcd2d8 = Uafhængig reference

seg-6e0cb6acc073 = VALIDATED

seg-c14b8fe46517 = Azimutafhængig horisontmaske: synligt sæt, azimut og elevation samt DOP under masken

seg-bbb1828b3db1 = Reduktion af gadekløft, sektorer og terræn til en tabel

seg-2c53381d48ae = Horisontal fejlellipse og kofaktor for hvert system ud fra geometriens kovarians

seg-de6c33774c9c = CLI

seg-d1e9715513b4 = Eksempel

seg-587beeccaa11 = Forudindstilling

seg-98f4f946a7ac = WASM

seg-b03d56f501c3 = Type

seg-4dbf41c0ec3b = Funktion

seg-2b0d77219437 = Forudindstillinger

seg-7338b6210228 = Række

seg-6317db731879 = Beskrivelse

seg-be2f66de7d07 = Kilde: <c1/>

seg-3cb660ef6b03 = Skylinemasker og himmelgeometri

seg-724f72bdfa36 = Indtil { "0.36" } var hver sigtbarhedstest for Jorden i motoren ét elevationsafskæringspunkt, <c1/>: en satellit talte med, når den var på eller over ét tal, uanset sin retning. En gade, en kaj, en fjord eller en kran blokerer en del af himlen og lader resten stå åben. En <b>skyline</b> er et elevationsafskær, der afhænger af azimut; <b>himmelgeometrifunktionerne</b> omsætter et sted, et tidspunkt, konstellationer og en skyline til det synlige sæt, dilution of precision (DOP), geometrikovariansen, den horisontale fejlellipse, en Monte Carlo-sky og et skyplot. Udformningen er <c2/> (punkt { "1" } og { "2" }).

seg-4c1bc0b37f54 = Evidens: beslutningen om maskeret sigtbarhed (geodætiske sigtevinkler, tabelmasken, det synlige sæt og dets DOP) er <b>VALIDATED</b> mod Orekit { "12.2" } og gnss_lib_py { "1.0.4" } i en sammenligning, der er registreret på forhånd, og det samme gælder fejlellipsen og kofaktoren for hvert system (numpy, registreret på forhånd); reduktionerne for kløft, sektor og terræn, forudindstillingerne og resten af himmelgeometrifunktionerne er <b>MODELLED</b> (<a1>Evidens</a1>). En skyline fjerner satellitter i sigtelinjen og intet mere. Forudindstillingerne er REPRESENTATIVE geometrier, ikke opmålinger.

seg-6fa3291b70e3 = Horisontprofilen

seg-08585dd55bb5 = En horisontprofil er det punktvise maksimum af fire beskrivelser. Azimut er grader med uret fra sand nord i stedets lokale øst-nord-op-system; elevationer er i <c1/>.

seg-9d0e2b0a469f = TOML

seg-3dbc7ff9f5ab = Tabel

seg-a67486e7d10e = Elevationer interpoleret lineært i azimut, ombrudt ved { "360" }°. Azimutter strengt voksende i <c1/>; højst { "3600" } rækker.

seg-bc12ba94381f = Gadekløft

seg-23066e2eb509 = To lige, parallelle vægge (nedenfor).

seg-821762272e2f = Sektorer

seg-7387a718a7c3 = Skarpt afgrænsede intervaller, med uret fra <c1/> (inkluderet) til <c2/> (ekskluderet), som kan løbe gennem nord; højst { "360" }.

seg-2768e3772b56 = Terræn

seg-5a5c08a77b86 = Punkter reduceret til en tabel: elevation <c1/>, med krumningsfaldet for <c2/> (en valgt, angivet konstant). <c3/> er over antennen.

seg-fb86c0db0c90 = <c1/> starter fra en navngiven geometri; kløftens felter tilsidesætter derefter forudindstillingens kløft felt for felt, og <c2/>, <c3/> og <c4/> føjes til den.

seg-0d76504a1d74 = Modtagerens <c1/> bevarer sin betydning: den er en flad horisontprofil. Det effektive snit ved azimut <c2/> er <c3/>, og en satellit er synlig, når dens elevation er <b>ved eller over</b> det: det samme <c4/>, som den flade maske altid har brugt. En satellit over <c5/> men under horisontprofilen er <b>skjult af horisontprofilen</b>.

seg-f7fd13e569e3 = Gadekløften

seg-290f563c1ff7 = En gade løber langs azimut <c1/>, <c2/> meter mellem væggene, antennen <c3/> meter oppe på midterlinjen. Langs azimut <c4/>, med <c5/>, når strålen en væg efter <c6/>, så en væg med højden <c7/> skærer ved

seg-8662708f4f32 = Den åbne strimmel ligger langs gaden. Med <c1/> (antennen på midten) forlader en stråle gaden gennem en åben ende, og væggen skærer intet, når <c2/>. En væg, der ikke er højere end antennen, skærer intet. <c3/> er som standard { "1.5" } m (et biltag eller en håndholdt modtager, et angivet valg); en ny kløft kræver <c4/>.

seg-1eeff52ea5a5 = Valgte og angivne mål (designnotatets), ikke opmålinger af noget virkeligt sted. <c1/> udskriver en med dens proveniens og dens snit for hver grad.

seg-13e8e5460280 = Geometri

seg-6d71c5cbe104 = Kløft: gade { "0" }°, bredde { "20" } m, vægge { "30" } m og { "30" } m, antenne { "1.5" } m. { "70.7" }° på tværs af gaden, åben langs den.

seg-ab3415ff8811 = Forhold mellem højde og bredde { "1.5" }, inden for båndet { "0.5" }–{ "2" } af billedforhold for gadekløfter hos Oke ({ "1988" }), <em>Street design and urban canopy layer climate</em>, Energy and Buildings { "11" }, { "103" }–{ "113" }.

seg-e331f02251f8 = Sektorer: åben mod havet over { "090" }–{ "270" } ({ "180" }°); kajbygninger { "8" }° over { "315" }–{ "045" } ({ "90" }°); bølgebryderen og dens fyr { "3" }° over { "045" }–{ "090" } og { "270" }–{ "315" }.

seg-6926e1bfc55d = Angivne valg (for eksempel { "40" } m lagerhaller omkring { "285" } m væk).

seg-f13d4df9a42c = Terræn: vægge { "600" } m over antennen i { "1500" } m afstand på hver side af en nord-syd-kanal, ét punkt pr. grad (ved <c1/> m), krumningsfald anvendt. { "21.8" }° på tværs, under { "1" }° langs aksen.

seg-4d3dedbe4491 = Af samme størrelsesorden som bredden og relieffet i de dybe vestnorske fjorde (Holtedahl ({ "1967" }), <em>Notes on the formation of fjords and fjord-valleys</em>, Geografiska Annaler 49A, { "193" }–{ "203" }).

seg-51f5219cb050 = Sektorer: containerstakke { "12" }° over den landvendte halvdel { "000" }–{ "180" }; kranbomme { "35" }° over { "245" }–{ "255" } og { "25" }° over { "285" }–{ "295" }; ellers åben mod vandet.

seg-a568ae949c3b = Fem ISO { "668" } high-cube-containere ({ "14.5" } m) omkring { "60" } m væk fra en antenne { "2" } m oppe; en bom omkring { "50" } m over kajen i { "70" } m og { "100" } m, af størrelsesordenen for en post-Panamax-kran. En kransektor er uigennemsigtig.

seg-65b1b45c787f = I et scenarie

seg-e489759bbd65 = Et valgfrit afsnit <c1/>, over typens egen afskæringsvinkel:

seg-f98345079e70 = Hvad horisontprofilen ændrer

seg-cbe2f5ae721f = Pr. sampel

seg-7368ea5c4b79 = <c1/> (med <c2/>)

seg-fde216d940fb = Synlighedstidslinjen (GNSS-tilgængelighed) og DOP-oversigten.

seg-7f6b2fcda681 = <c1/> (med <c2/>)

seg-8fafdb892253 = De satellitter, som RAIM og ARAIM (<c1/>) bruger.

seg-c0156fd1c895 = De satellitter, hvis pseudoafstande simuleres og bruges af RAIM.

seg-d7fa5e5cf33d = De satellitter, modtageren kan følge, før jammeren.

seg-86caf3ae19ad = Hver tilstands synlige mængde over hvert systems egen maske, polarsvinget medregnet (den samme horisontprofil på hvert sted). Doppler-tilstandens omhylling og det udformede enkeltpassage er grænser for, hvad en modtager skal kunne håndtere, og beholder hvert systems maske.

seg-20d2e86d17bc = Hvilke epoker der tæller som over masken, tiden over den og GNSS-sammenligningens satellitter.

seg-ed5bbd6b2c46 = <c1/> (trænings-NMEA)

seg-d0eb9fd84d24 = Satellitterne i GSV og i positionsbestemmelsen. Azimutter er sande pejlinger fastlagt i forhold til jorden, ikke fartøjets kurs.

seg-56cc8ae30218 = <b>Jordstedet for <c1/> og <c2/>.</b> Begge typer modellerer en kredsende bruger med en geocentrisk elevation og uden jordfast azimut, så de tager kun en horisontprofil med designnotatets jordstedstilstand: <c3/> i stedet for <c4/> (nøjagtigt en af de to). Hvert sampel er ét absolut tidspunkt, <c5/>: hver satellit propageres til det (et elementsæt, en broadcast-efemeride eller en SP3-fil fremføres fra sin egen epoke, en Walker-satellit tæller <c6/> fra <c7/>) og roteres til jordfast ved det, så stedet ser én sammenhængende himmel. <c8/> er orbitscenariets egen; uden en (og altid for <c9/>, som ikke har nogen) er den den nyeste epoke blandt de satellitter, der har en, eller J2000 kun for Walker-mønstre. Elevation og azimut er geodætiske (WGS-84). Opdelingen i vandret og lodret af integritetstypens ARAIM-beskyttelsesniveauer og Stanfords lodrette fejl bruger den samme geodætiske opretning (WGS-84-ellipsoidens normal, omkring { "0.19" }° fra den geocentriske radiale ved { "45" }° bredde); snapshot-RAIM brugte den allerede. En <c10/> uden horisontprofil er en almindelig jordbruger; stien for den kredsende <c11/> er uændret.

seg-fae979b3b96f = <b>Bagudkompatibilitet.</b> Uden et afsnit <c1/> er et scenarie byte-identisk med, hvad den samme motor gav, før horisontprofilkoden fandtes: <c2/> kontrollerer JSON, diagram og oversigt for hvert medfølgende scenarie, der kører en af disse typer, og NMEA-teksten for hvert træningsscenarie, mod SHA-256-digests af "{ "0.36" } portable"-baselinen (digests fra release-committen for { "0.35.0" }, genberegnet, da motoren skiftede til portabel matematik, og bevaret i testen som optegnelsen: <c3/>). Et tomt afsnit <c4/> skærer intet; resultatet er da lig med kørslen uden det bortset fra den tilføjede blok <c5/> og nul-tallene for <c6/>.

seg-fe88e0ad01e9 = <b>Hvad der afvises</b>, med årsagen i meddelelsen: en horisontprofil på en kredsende <c1/>; <c2/> og <c3/> sammen; en ukendt forudindstilling; en kløft uden <c4/>; en tabel, der ikke er strengt voksende i <c5/>; en elevation uden for <c6/>; en tom sektor; en ikke-positiv terrænafstand; input over lofterne; enhver ukendt nøgle.

seg-d1b10a0c833f = <b>Resultatet</b> får <c1/>, når afsnittet er til stede: <c2/> er <c3/>, <c4/> eller <c5/>; <c6/> er den andel af den øvre halvkugles rumvinkel, der ligger over <c7/> (middelværdien af <c8/> over azimut: { "1" } for en nulmaske, { "0.5" } for et fladt snit på { "30" }°); <c9/> er forudindstillingens linje eller scenariets egen. Enheder og proveniensklasser står i blokken <c10/>.

seg-0842c1133eb5 = Medfølgende eksempler (<c1/>):

seg-5f77a52314c7 = Hvad det viser (fjern afsnittet <c1/> for at sammenligne)

seg-523f8c1a7912 = GPS + Galileo nederst i <c1/>: { "17" } af { "289" } sampler beholder en positionsbestemmelse, median-PDOP { "70.5" } ({ "1.14" } under åben himmel).

seg-6c5618dce8ab = ARAIM med to konstellationer ved indsejling til en havn: { "70" } satellitepoker skjult, tilgængeligheden uændret ({ "145" } af { "145" }).

seg-36254db521fd = Pseudoafstande og RAIM på en kaj: { "44" } satellitepoker skjult; RAIM-tilgængelighed { "0.59" } ({ "0.85" } under åben himmel).

seg-6b0f8b4c700f = En jammer på { "2" } W i en havn: { "83" } satellitepoker skjult, sporingen uændret (jammeren havde allerede taget dem).

seg-22ceab915271 = GPS + Galileo + et LEO-lag i en fjord: median for fusioneret PDOP { "1.14" } ({ "0.93" } under åben himmel).

seg-f940e764e244 = Kløften i <c1/> som et fladt snit på { "35" }° og som <c2/> drejet langs bilens kurs: { "8" } mod { "4" } til { "5" } GPS- og Galileo-satellitter; fusioneret middelfejl { "2.1" } m i begge; alarmen på { "1.5" } m ved { "51" } % og { "59" } % af epokerne.

seg-6aa4ec7e4058 = Fem motorfunktioner (<c1/>), de samme på alle flader:

seg-4d6a793b2794 = Input → output

seg-c99f58f1ccd2 = pr. satellit <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>; <c8/>, <c9/>, <c10/>; <c11/> (GDOP, PDOP, HDOP, VDOP, TDOP, <c12/>); <c13/>, <c14/> (enhedsvarians), <c15/>; <c16/> og <c17/> ved den ønskede konfidens; <c18/>, <c19/>, <c20/>

seg-a5b914aac404 = <c1/> (højst { "5000" }, et inputloft) mindste kvadraters fejl under uafhængige gaussiske afstandsfejl på <c2/> fra en ChaCha8-strøm med seed <c3/>: <c4/>, den empiriske kovarians, vandret og 3D-RMS ved siden af <c5/> og <c6/>, andelen inden for { "95" } %-ellipsen

seg-f435ee3b8709 = forudindstillingerne med etiket, beskrivelse, proveniens, snittet for hver grad og <c1/>

seg-1937af5fa347 = et horisontprofilafsnit reduceret til den tabel med 360 poster, som motoren bruger, med <c1/>, <c2/>, <c3/>

seg-f16a1f2de329 = skyplottet som statisk SVG (uden script, uden eksterne referencer, hver inputstreng escapet)

seg-c802cf2a2e30 = En forespørgsel:

seg-c3c44c1967ba = <c1/> er motorens konstellationsforudindstillinger (<c2/>s <c3/>, <c4/>, <c5/>, <c6/>, ...; LEO-forudindstillingerne <c7/>, <c8/>, ...) eller en fuld <c9/>-tabel <c10/>, propageret til <c11/> (keplersk med sekulær J2, de fælles tilstandsbaner i <c12/>). Deres indbyrdes faser stammer fra forskellige referenceepoker, så himlen er <b>en repræsentativ geometri, ikke den dags himmel på det sted</b>. Satellitter kan i stedet (eller også) angives direkte: <c13/>, eller med <c14/> og et <c15/> eller <c16/>. Standardværdier: hvert systems egen maske ({ "5" }° for GNSS, { "10" }° for LEO; { "5" }° for direkte angivne satellitter), ét modtagerur pr. system (<c17/> for ét fælles ur), <c18/> { "1" } m (en repræsentativ budgetlinje for to frekvenser), konfidens { "0.95" }. Inputlofter: højst { "2000" } satellitter over horisonten (en systemtabel, der beder om flere, afvises, før den bygges) og { "16" } modtagerure.

seg-6408f9b02ccb = En dateret himmel ud fra elementsæt.

seg-7724e4ecafee = <c1/> tager tekst med to-linjers elementsæt (en navnelinje før hvert sæt er valgfri; højst { "4" } MiB, et inputloft), propageret af motorens SGP4 (WGS-72, den propagator som <c2/> bruger) til <c3/> plus <c4/>, roteret til jordfast med UT1 sat lig UTC og uden polbevægelse, og set fra <c5/>. <c6/> er UTC ISO { "8601" } (<c7/>) og dater kun elementsættene (forudindstillingerne har ingen dato, så en <c8/> uden <c9/> afvises); <c10/> mærker dem til uret pr. system (standard <c11/>). Hvert resultat angiver, hvilken himmel det er, i <c12/> og <c13/>:

seg-13a8b4ac40f9 = Himlen

seg-c0bde35f9442 = motorens konstellationsforudindstillinger: en repræsentativ geometri

seg-d368b50280cc = elementsættene propageret til den angivne epoke: den himmel, som disse elementsæt giver på den epoke, ikke en måling af den (deres egen nøjagtighed er SGP4's og sættenes alder)

seg-0bc07825a9b5 = ingen <c1/>: elementsættene propageret til det nyeste sæts egen epoke plus <c2/>, en repræsentativ himmel

seg-1230388da233 = satellitter angivet direkte, som angivet

seg-1a30004a7f9e = En blanding forener dem med <c1/>. <c2/> er det tidspunkt, elementsættene blev propageret til, og <c3/> angiver, hvad af teksten der ikke blev brugt, med årsagen: forkerte eller forældreløse elementsætlinjer (med deres linjenumre), sæt som parseren afviste, og sæt som SGP4 ikke kunne propagere til det tidspunkt (henfaldet eller uden for sine grænser); højst { "100" } poster i alt, derefter en sidste post, der tæller resten. En tom liste <c4/> tilføjer ingen forudindstillinger. Skyplottet angiver grundlaget i sin fod.

seg-8560c13c7ea3 = <b>Én kerne.</b> Kofaktormatricen er <c1/>, designmatrixens opbygning og Gauss-Jordan-inversen bag <c2/>. <c3/> udstiller kovariansen, og <c4/> er dens reduktion, så de VALIDATED skalarer er uændrede og stadig fastholdt af <c5/>. Der er ingen anden DOP-implementering.

seg-cb1be3e04419 = <b>Ellipsen.</b> Halvakser <c1/> for egenværdierne <c2/> af øst-nord-blokken, med <c3/> (<c4/> ved { "95" } %, { "1" } ved { "39.35" } %), og hovedaksens azimut <c5/> i <c6/> fra nord.

seg-96062e2cfed1 = Indgangspunkter

seg-f8dc86bd9da2 = <c1/> eller <c2/>, med <c3/> eller <c4/>; <c5/>

seg-d5b5bdf6081c = Rust

seg-8d0f99ed4837 = <c1/>, <c2/> med de samme navne

seg-40a7552d2ba9 = MCP

seg-42f0fe3b42ab = <c1/> (<c2/>, eller <c3/>); ingen Monte Carlo over MCP (bulkdata, som en agent bør opsummere, ikke bære)

seg-9d04c658b37a = Hvert resultat bærer <c1/> (MODELLED), <c2/> (geometri under en angiven fejlmodel: uafhængige, ens, middelværdinulstillede gaussiske afstandsfejl; ikke en forudsigelse af en modtagers virkelige fejl, som også har bias, flervejsudbredelse og fejl fra manglende sigtelinje; ikke en integritetsgrænse) og den vejledende linje: <em>Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.</em>

seg-0e1285fdfe52 = Fem registerrækker (<c1/>), som designnotatet afgrænser dem:

seg-1aa76286f152 = Orekit { "12.2" } (<c1/> pejlevinkler, <c2/>) med gnss_lib_py { "1.0.4" } (<c3/> og DOP-matricen), præregistreret i <c4/> (commit e4b9d912), før nogen af dem blev kørt: { "1173" } pejlevinkler på seks steder og fire epoker, seks tabeller, { "142" } synlige sæt; værste elevation { "1.3e-13" }°, azimut { "2.3e-13" }°, maske { "1.1e-12" }° mod { "1e-9" }°; identiske synlige sæt, ingen i grænsebåndet; DOP { "3.3e-13" } relativt og kofaktor { "6.6e-13" } af matricens skala mod { "1e-9" }. Omfang: tabelmasker, geodætiske pejlevinkler, den maskerede mængde og dens DOP og kofaktor med fælles ur.

seg-b33828edbe2f = håndberegnede værdier; sammenligningen ovenfor læser deres tabeller som input og kontrollerer dem ikke

seg-ca950752be62 = Forudindstillinger for horisontprofil

seg-83946f66ca78 = ingen: valgte, angivne mål (kun kontrolleret mod dem selv)

seg-ca5db55640a9 = numpy { "2.5.4" } <c1/> og <c2/> (standard P2) på de { "142" } indskrevne synlige sæt, fælles ur og ét ur pr. system, præregistreret i <c3/> (commit 0bbeeaee): { "270" } tilfælde, akser { "5.1e-13" } relativt, orientering { "5.3e-12" }°, kofaktor { "1.0e-12" } af matricens skala, mod { "1e-9" } og { "1e-6" }°

seg-44e5f9ca28f7 = Funktioner for himmelgeometri

seg-8e3953481bbf = sammensætningen: propagering af forudindstillinger til en repræsentativ himmel, Monte Carlo-skyen (kontrolleret mod den geometri, den samples fra) og fladerne

seg-e8eec007c6b9 = Fraværet af et afsnit <c1/> kontrolleres byte for byte mod outputtet fra { "0.35.0" }, hvilket viser bagudkompatibilitet og ikke validerer noget. gnss_lib_py anvender kun én enkelt elevationsmaske, så den er den uafhængige reference for DOP her, ikke for masken.

seg-d5894e54715b = Hvad en horisontprofil ikke modellerer: diffraktion over en vægkant, refleksioner og signaler uden sigtelinje, som en virkelig modtager stadig kan følge (de udelades, de forringes ikke), delvis gennemsigtighed (en gitterkran er uigennemsigtig over hele sin sektor), terræn ud over de angivne punkter og jordkrumning inde i kløft- og sektorformerne.

seg-745d19d6b35d = <s1>Forrige</s1>Maritime integrationer

seg-bbe8dd07d33b = <s1>Næste</s1>Tillid som sikkerhedstelemetri
