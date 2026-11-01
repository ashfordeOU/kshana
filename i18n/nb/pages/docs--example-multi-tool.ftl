# docs--example-multi-tool: translations (nb)

seg-077d900655af = Kilde: <c1/>

seg-42e93cd44e94 = Gjennomgått eksempel — { -brand } som limlag i en analysekjede med flere verktøy for oppdragsanalyse

seg-286cf0e7bb71 = Dette følger én bane gjennom scenariotypene for standardbasert interoperabilitet og oppdragsanalyse fra ende til ende, og viser hvordan { -brand } ligger <em>mellom</em> høyfidelitetsverktøyene et program allerede bruker, i stedet for å konkurrere med dem: GMAT (General Mission Analysis Tool), Orekit og STK (Systems Tool Kit) for banedesign, og Basilisk eller { "42" } for simulering av system for holdnings- og banekontroll (AOCS). Hvert trinn er en scenariotype som kan kjøres, og hvert resultat bærer en <c1/> som oppgir omfanget og evidensnivået.

seg-7198d05bece6 = Merknad om ærlighet: dette er en <em>geometrisk/analytisk</em> kjede på nivået før fase A / for avveiningsstudier (før et oppdrags første formelle designfase). Det er ikke en sertifisering av flygedynamikk; se feltet <c1/> for hver type.

seg-70c18138497b = Andre forkortelser brukt nedenfor: FDS (flight-dynamics system), CCSDS (Consultative Committee for Space Data Systems), OEM (Orbit Ephemeris Message), SGP4 (Simplified General Perturbations { "4" }, propagatoren for tolinjers elementsett), TOML (filformatet for scenarioer) og CLI (kommandolinjegrensesnitt).

seg-7cc0d4d15c4a = Kjeden

seg-09a321d36a10 = Trinnene er separate kjøringer: hvert henter inndataene sine fra sin egen scenariofil, så du tar med et tall fra ett til det neste (for eksempel en skrå avstand fra <c1/> inn i <c2/>) ved å redigere den neste filen. Typen <c3/> kan romme flere typer i én kjøring under felles betingelser; se <a1>CAMPAIGNS.md</a1>.

seg-382ae9161181 = Hver kommando nedenfor kjøres fra roten av repoet, og sammendraget under den er den første linjen kshana { $version } skriver ut for det medfølgende scenarioet.

seg-7939b15235c8 = { "1" }. Les inn banen en designer laget (<c1/>)

seg-4b732dd54291 = GMAT, Orekit og STK <em>eksporterer</em> alle CCSDS Orbit Ephemeris Messages. { -brand } importerer dem (den andre retningen av broen), så en analyse i { -brand } kan starte fra nøyaktig den banen banedesigneren har signert av på, ikke en tilnærming utledet på nytt:

seg-3136cfd5a40e = Den rapporterer segmentene, objektene, referansesystemene og epokespennet og en kontroll av hastighetskonsistens, som viser at efemeriden ble lest inn trofast (rundturfeil under { "1" }×{ "10" }⁻⁶ km). Gitt en ekstern fil i <c1/> i stedet, rapporterer den hva den tolket: matet med OEM-en som <c2/> skriver, skriver den ut <c3/>. <c4/> er uttrykkelig på at dette er en strukturell og fysisk innlesingskontroll, ikke en validering av banenøyaktigheten til kilden.

seg-e2c563fcb8cb = { "2" }. Når er den synlig fra en bakkestasjon? (<c1/>)

seg-d66361888ede = Predikerer passeringene (stigning/nedgang) over en stasjon over en elevasjonsmaske: signalinnhenting (AOS), tidspunkt for nærmeste tilnærming (TCA), signaltap (LOS), maksimal elevasjon og varighet, pluss total tilgangstid. Det er spørringen for planlegging av bakkesegmentet. Banen er et SGP4-elementsett ført over til det jordfaste systemet via kjeden IAU 2006/2000A, og elevasjonene er tilsynelatende: refraksjon etter ITU-R P.834-9 og nedlinkens lystid, hver kan slås av og på (<c1/>, <c2/>).

seg-24d31bafa334 = { "3" }. Går kontakten opp? (<c1/>)

seg-47bdb9d4700c = For en passering setter du den skrå avstanden og terminaltallene inn i linkligningen fra CCSDS { "401" } / DSN 810-005 (NASA Deep Space Network):

seg-db12a99edcd2 = Rapporterer fri romtap (FSPL), bærebølge-til-støy-tetthet (C/N₀), energi per bit over støytetthet (Eb/N₀), margin og om linken <b>går opp</b> mot en påkrevd Eb/N₀: den kommunikasjonsmessige gjennomførbarhetskontrollen som gjør «den er synlig» til «vi kan faktisk laste ned dataene». Tallene følger direkte av inndataene i filen (her en EIRP på { "55" } dBW, effektiv isotropisk utstrålt effekt, inn i en mottaks-G/T på { "53" } dB/K, forholdet mellom forsterkning og støytemperatur); sett inn tallene for din egen terminal før du leser marginen. Det er en deterministisk beregning, ikke et kalibrert terminaldatablad.

seg-85ad46986461 = { "4" }. Hvor fort bryter miljøet den ned? (<c1/>)

seg-8977b12fd934 = Driver nøytral tetthet i termosfæren fra solaktivitet (F10.7, radiofluksen på { "10.7" } cm, og dens 81-dagers gjennomsnitt F10.7a) og geomagnetisk aktivitet (indeksene Kp og ap) via eksosfæretemperaturen i Jacchia-71. Det fanger den ~{ "5" }–{ "10" } ganger store variasjonen i tetthet gjennom solsyklusen som en statisk atmosfære utelater, så et anslag for banelevetid eller luftmotstand gjenspeiler romværregimet i stedet for en fast atmosfære. Siden { "0.30" } er tettheten tettheten i termosfæren etter Jacchia { "1971" }, karakterisert mot NRLMSISE-00 (Naval Research Laboratory mass-spectrometer and incoherent-scatter) men ikke en datavalidert NRLMSISE-00-atmosfære.

seg-4b5bdadf3e7e = { "5" }. Gi resultatet videre (eksporter)

seg-f4a438636ea8 = Det samme CLI-et skriver standardfiler for neste verktøy. På et <c1/>-scenario skriver <c2/> en CCSDS OEM { "2.0" }-efemeride med hastighet (filen GMAT, Orekit og STK leser), <c3/> en presis SP3-efemeride (Standard Product { "3" }) og <c4/> en CCSDS Orbit Mean-Elements Message-katalog. <c5/> dekker visningsprogrammene: CZML (Cesium Language), KML (Keyhole Markup Language, for Google Earth), GeoJSON, STK-efemeridefiler (<c6/>, én per satellitt pluss brukeren) og SigMF-opptak (Signal Metadata Format) fra typen <c7/>. <c8/> sier hvilke som gjelder for et scenario. For månen sender typen <c9/> ut månens referansesystem, tidsskala og efemeride som en CCSDS OEM med en kontroll av overensstemmelse. Se <a1>INTEROP.md</a1>.

seg-5293e6d761a8 = Hvorfor dette er limet, ikke en konkurrent

seg-cd78b0435abb = Hvert trinn er et lite, etterprøvbart, reproduserbart scenario med en uttrykkelig omfangsetikett. Høyfidelitetsverktøyene eier baneoptimalisering, AOCS med seks frihetsgrader (6-DoF) og aerotermisk innflyging, nedstigning og landing (EDL); { -brand } eier <b>det åpne, siterbare og kjørbare bindevevet</b>: lese inn standardformatene, besvare de tverrgående spørsmålene om geometri og gjennomførbarhet, og gi resultatet videre, på et nivå enhver partner kan kjøre uten lisens. Se også de tilhørende typene for oppdragsanalyse <c1/>, <c2/>, <c3/>, <c4/> og <c5/>.

seg-af1ab3c55fe6 = <s1>Forrige</s1>{ "3" } · Kvante mot klassisk

seg-b0765a28b4ce = <s1>Neste</s1>Scenariotyper

seg-dc88ec5ccc43 = { "1" }. Les inn banen en designer laget (oem-interop)

seg-cdff21ef6984 = { "2" }. Når er den synlig fra en bakkestasjon? (passes)

seg-afa47b4283a3 = { "3" }. Går kontakten opp? (link-budget)

seg-e508e844bf2d = { "4" }. Hvor fort bryter miljøet den ned? (space-weather)
