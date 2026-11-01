# docs--example-multi-tool: translations (sv)

seg-077d900655af = Källa: <c1/>

seg-42e93cd44e94 = Genomgånget exempel: Kshana som sammanbindande lager för flera verktyg i uppdragsanalys

seg-286cf0e7bb71 = Här följs en enda bana genom de standardbaserade scenariotyperna för interoperabilitet och uppdragsanalys, från början till slut. Det visar hur Kshana ligger <em>mellan</em> de högprecisionsverktyg som ett program redan använder, i stället för att konkurrera med dem: GMAT (General Mission Analysis Tool), Orekit och STK (Systems Tool Kit) för banutformning, samt Basilisk eller { "42" } för simulering av attityd- och banstyrsystem (AOCS). Varje steg är en körbar scenariotyp, och varje resultat har en <c1/> som anger dess omfattning och evidensnivå.

seg-7198d05bece6 = Ärlighetsnotering: det här är en <em>geometrisk/analytisk</em> kedja på nivån före fas A och för avvägningsstudier (före uppdragets första formella konstruktionsfas). Det är ingen certifiering av flygdynamik; se fältet <c1/> för varje typ.

seg-70c18138497b = Övriga förkortningar som används nedan: FDS (flygdynamiksystem), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, propagatorn för tvåradiga elementmängder), TOML (scenariofilens format) och CLI (kommandoradsgränssnitt).

seg-7cc0d4d15c4a = Kedjan

seg-09a321d36a10 = Stegen är separata körningar: varje steg hämtar sina indata från sin egen scenariofil, så du för över ett värde från ett steg till nästa (till exempel ett snedavstånd från <c1/> till <c2/>) genom att redigera nästa fil. Typen <c3/> kan innehålla flera typer i en och samma körning under gemensamma villkor; se <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Varje kommando nedan körs från arkivets rot, och sammanfattningen under det är den första raden som kshana { $version } skriver ut för det medföljande scenariot.

seg-7939b15235c8 = { "1" }. Läs in banan som en konstruktör tagit fram (<c1/>)

seg-4b732dd54291 = GMAT, Orekit och STK <em>exporterar</em> alla CCSDS Orbit Ephemeris Messages. Kshana importerar dem (bryggans andra riktning), så en Kshana-analys kan utgå från exakt den bana som banutformaren godkänt, inte från en omräknad approximation:

seg-3136cfd5a40e = Den redovisar segment, objekt, referenssystem och epokspann samt en hastighetskonsistenskontroll, som visar att efemeriden lästs in trogen originalet (avvikelse vid rundtur under { "1" }×{ "10" }⁻⁶ km). Om du i stället anger en extern fil i <c1/> redovisar den vad den tolkat: matas den med den OEM som <c2/> skriver ut den <c3/>. <c4/> anger uttryckligen att detta är en strukturell och fysikalisk inläsningskontroll, inte en validering av källans banprecision.

seg-e2c563fcb8cb = { "2" }. När syns den från en markstation? (<c1/>)

seg-d66361888ede = Förutsäger uppgångs- och nedgångspassager över en station ovanför en elevationsmask: signalupptagning (AOS), tidpunkt för närmaste passage (TCA), signalförlust (LOS), maximal elevation och varaktighet, samt total åtkomsttid. Det är den frågeställning som marksegmentets planering behöver. Banan är en SGP4-elementmängd som förts över till det jordfasta referenssystemet via IAU 2006/2000A-kedjan, och elevationerna är skenbara: refraktion enligt ITU-R P.834-9 och nedlänkens ljustid, var och en möjlig att slå av och på (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Håller förbindelsen? (<c1/>)

seg-47bdb9d4700c = För en passage matar du in snedavståndet och terminalens värden i länkekvationen enligt CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network):

seg-db12a99edcd2 = Redovisar fritt-rymdsdämpning (FSPL), bärvåg-till-brustäthet (C/N₀), energi per bit över brustäthet (Eb/N₀), marginal och om länken <b>håller</b> mot ett krav på Eb/N₀: den kommunikationskontroll som gör “den syns” till “vi kan faktiskt ladda ned data”. Talen följer direkt av indata i filen (här { "55" } dBW EIRP, effektiv isotropiskt utstrålad effekt, in i ett mottagar-G/T på { "53" } dB/K, kvoten mellan förstärkning och brustemperatur); lägg in din egen terminals värden innan du läser marginalen. Det är en deterministisk beräkning, inte ett kalibrerat terminaldatablad.

seg-85ad46986461 = { "4" }. Hur snabbt bryter miljön ned den? (<c1/>)

seg-8977b12fd934 = Driver den termosfäriska neutraltätheten utifrån sol- (F10.7, radioflödet på { "10.7" } cm, och dess 81-dagarsmedelvärde F10.7a) och geomagnetisk aktivitet (indexen Kp och ap) via exosfärstemperaturen enligt Jacchia-71. Det fångar den svängning på ~{ "5" }–{ "10" }× i täthet över solcykeln som en statisk atmosfär utelämnar, så att en uppskattning av banlivslängd eller luftmotstånd speglar rymdvädrets förhållanden i stället för en fast atmosfär. Sedan { "0.30" } är tätheten den termosfäriska tätheten enligt Jacchia { "1971" }, karakteriserad mot NRLMSISE-00 (Naval Research Laboratory, masspektrometer och inkoherent spridning) men inte en datavaliderad NRLMSISE-00-atmosfär.

seg-4b5bdadf3e7e = { "5" }. Lämna över resultatet (exporter)

seg-f4a438636ea8 = Samma CLI skriver standardfiler för nästa verktyg. På ett <c1/>-scenario skriver <c2/> en CCSDS OEM { "2.0" }-efemerid med hastighet (filen som GMAT, Orekit och STK läser), <c3/> en precis SP3-efemerid (Standard Product { "3" }) och <c4/> en katalog med CCSDS Orbit Mean-Elements Message. <c5/> täcker visningsprogrammen: CZML (Cesium Language), KML (Keyhole Markup Language, för Google Earth), GeoJSON, STK-efemeridfiler (<c6/>, en per satellit plus användaren) och SigMF-inspelningar (Signal Metadata Format) från typen <c7/>. <c8/> anger vilka som gäller för ett scenario. För månen skriver typen <c9/> ut månens referenssystem, tidsskala och efemerid som en CCSDS OEM med en formatkontroll. Se <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Därför är det bindemedlet, inte en konkurrent

seg-cd78b0435abb = Varje steg är ett litet, granskningsbart och reproducerbart scenario med en uttrycklig omfattningsetikett. Högprecisionsverktygen äger banoptimering, AOCS med sex frihetsgrader (6-DoF) och aerotermisk ingång, nedstigning och landning (EDL); Kshana äger den <b>öppna, citerbara och körbara bindväven</b>: läsa in standardformaten, besvara de övergripande frågorna om geometri och genomförbarhet och lämna resultatet vidare, på en nivå som vilken partner som helst kan köra utan licens. Se även de närliggande uppdragsanalystyperna <c1/>, <c2/>, <c3/>, <c4/> och <c5/>.

seg-af1ab3c55fe6 = <s1>Föregående</s1>{ "3" } · Kvant mot klassisk

seg-b0765a28b4ce = <s1>Nästa</s1>Scenariotyper

seg-dc88ec5ccc43 = { "1" }. Läs in banan som en konstruktör tagit fram (oem-interop)

seg-cdff21ef6984 = { "2" }. När syns den från en markstation? (passes)

seg-afa47b4283a3 = { "3" }. Håller förbindelsen? (link-budget)

seg-e508e844bf2d = { "4" }. Hur snabbt bryter miljön ned den? (space-weather)
