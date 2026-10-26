# docs--example-multi-tool: translations (da)

seg-077d900655af = Kilde: <c1/>

seg-42e93cd44e94 = Gennemarbejdet eksempel: Kshana som limlag til missionsanalyse på tværs af værktøjer

seg-286cf0e7bb71 = Dette følger én bane gennem de standardbaserede scenarietyper for interoperabilitet og missionsanalyse fra ende til anden og viser, hvordan Kshana sidder <em>mellem</em> de højpræcisionsværktøjer, et program allerede bruger, i stedet for at konkurrere med dem: GMAT (General Mission Analysis Tool), Orekit og STK (Systems Tool Kit) til banedesign og Basilisk eller { "42" } til simulering af attitude- og banestyringssystemer (AOCS). Hvert trin er en scenarietype, der kan køres, og hvert resultat bærer en <c1/>, der angiver dets omfang og evidensniveau.

seg-7198d05bece6 = Bemærkning om ærlighed: dette er en <em>geometrisk/analytisk</em> pipeline på niveau med før-fase-A / afvejningsstudier (før en missions første formelle designfase). Det er ikke en certificering af flyvedynamik; se hver types felt <c1/>.

seg-70c18138497b = Andre forkortelser brugt nedenfor: FDS (flyvedynamiksystem), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, propagatoren for two-line-elementer), TOML (scenariofilens format) og CLI (kommandolinjegrænseflade).

seg-7cc0d4d15c4a = Pipelinen

seg-09a321d36a10 = Trinene er separate kørsler: hver henter sit input fra sin egen scenariefil, så du bærer et tal fra den ene til den næste (for eksempel en skråafstand fra <c1/> ind i <c2/>) ved at redigere den næste fil. Typen <c3/> kan rumme flere typer i én kørsel under fælles betingelser; se <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Hver kommando nedenfor køres fra repositoriets rod, og resuméet under den er den første linje, kshana { $version } udskriver for det medfølgende scenarie.

seg-7939b15235c8 = { "1" }. Indlæs den bane, en designer har lavet (<c1/>)

seg-4b732dd54291 = GMAT, Orekit og STK <em>eksporterer</em> alle CCSDS Orbit Ephemeris Messages. Kshana importerer dem (den anden retning af broen), så en Kshana-analyse kan starte fra præcis den bane, banedesigneren har frigivet, ikke en genudledt tilnærmelse:

seg-3136cfd5a40e = Den rapporterer segmenter, objekter, referencesystemer og epokespænd samt en kontrol af hastighedskonsistens, som viser, at efemeriden blev indlæst tro mod kilden (rundturfejl under { "1" }×{ "10" }⁻⁶ km). Får den i stedet en ekstern fil i <c1/>, rapporterer den, hvad den fortolkede: fodret med den OEM, som <c2/> skriver, udskriver den <c3/>. <c4/> siger eksplicit, at dette er en struktur- og fysikkontrol af indlæsningen, ikke en validering af kildens banenøjagtighed.

seg-e2c563fcb8cb = { "2" }. Hvornår er den synlig fra en jordstation? (<c1/>)

seg-d66361888ede = Forudsiger op- og nedgangspassager over en station over en elevationsmaske: signalopfangning (AOS), tidspunkt for nærmeste passage (TCA), signaltab (LOS), maksimal elevation og varighed samt samlet adgangstid. Det er planlægningsforespørgslen for jordsegmentet. Banen er et SGP4-elementsæt ført til det jordfaste system på IAU 2006/2000A-kæden, og elevationerne er tilsyneladende: ITU-R P.834-9-refraktion og nedlinkens lystid, hver kan slås til eller fra (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Lukker kontakten? (<c1/>)

seg-47bdb9d4700c = For en passage sættes skråafstanden og terminalens tal ind i linkligningen fra CCSDS { "401" } / DSN 810-005 (NASA's Deep Space Network):

seg-db12a99edcd2 = Rapporterer frirumsdæmpning (FSPL), bærebølge-til-støj-densitet (C/N₀), energi pr. bit over støjdensitet (Eb/N₀), margin og om linket <b>lukker</b> mod et krævet Eb/N₀: komponentkontrollen for kommunikationens gennemførlighed, der gør »den er synlig« til »vi kan faktisk nedlinke dataene«. Tallene følger direkte af inputtet i filen (her en EIRP på { "55" } dBW, effektiv isotropisk udstrålet effekt, ind i en modtage-G/T på { "53" } dB/K, forhold mellem forstærkning og støjtemperatur); sæt din egen terminals tal ind, før du læser marginen. Det er en deterministisk beregning, ikke et kalibreret terminaldatablad.

seg-85ad46986461 = { "4" }. Hvor hurtigt nedbryder omgivelserne den? (<c1/>)

seg-8977b12fd934 = Driver den termosfæriske neutraltæthed ud fra solaktivitet (F10.7, radiofluxen på { "10.7" } cm, og dens 81-dages middel F10.7a) og geomagnetisk aktivitet (indeksene Kp og ap) via eksosfæretemperaturen i Jacchia-71. Det indfanger den ca. { "5" }–{ "10" }× svingning i tæthed over solcyklussen, som en statisk atmosfære udelader, så et estimat af banelevetid eller modstand afspejler rumvejrsregimet frem for en fast atmosfære. Siden { "0.30" } er tætheden Jacchia { "1971" }-tætheden i termosfæren, karakteriseret mod NRLMSISE-00 (Naval Research Laboratory, massespektrometer og inkohærent spredning), men ikke en datavalideret NRLMSISE-00-atmosfære.

seg-4b5bdadf3e7e = { "5" }. Giv resultatet videre (eksport)

seg-f4a438636ea8 = Den samme CLI skriver standardfiler til det næste værktøj. På et <c1/>-scenarie skriver <c2/> en CCSDS OEM { "2.0" }-efemeride med hastighed (den fil, GMAT, Orekit og STK læser), <c3/> en præcis SP3-efemeride (Standard Product { "3" }) og <c4/> et katalog af CCSDS Orbit Mean-Elements Messages. <c5/> dækker fremvisere: CZML (Cesium Language), KML (Keyhole Markup Language, til Google Earth), GeoJSON, STK-efemeridefiler (<c6/>, én pr. satellit plus brugeren) og SigMF-optagelser (Signal Metadata Format) fra typen <c7/>. <c8/> siger, hvilke der gælder for et scenarie. For Månen udsender typen <c9/> månens referencesystem, tidsskala og efemeride som en CCSDS OEM med en formatkontrol. Se <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Hvorfor dette er limen, ikke en konkurrent

seg-cd78b0435abb = Hvert trin er et lille, reviderbart, reproducerbart scenarie med en eksplicit omfangsmærkat. De højpræcisionsværktøjer ejer banenoptimering, AOCS med seks frihedsgrader (6-DoF) og aerotermisk indtræden, nedstigning og landing (EDL); Kshana ejer det <b>åbne, citerbare, kørbare bindevæv</b>: indlæs standardformaterne, besvar de tværgående spørgsmål om geometri og gennemførlighed, og giv resultatet videre, på et niveau, enhver partner kan køre uden licens. Se også de ledsagende missionsanalysetyper <c1/>, <c2/>, <c3/>, <c4/> og <c5/>.

seg-af1ab3c55fe6 = <s1>Forrige</s1>{ "3" } · Kvante mod klassisk

seg-b0765a28b4ce = <s1>Næste</s1>Scenarietyper

seg-dc88ec5ccc43 = { "1" }. Indlæs den bane, en designer har lavet (oem-interop)

seg-cdff21ef6984 = { "2" }. Hvornår er den synlig fra en jordstation? (passes)

seg-afa47b4283a3 = { "3" }. Lukker kontakten? (link-budget)

seg-e508e844bf2d = { "4" }. Hvor hurtigt nedbryder omgivelserne den? (space-weather)
