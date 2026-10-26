# docs--nmea-training: translations (nb)

seg-2247a2344710 = Betydning

seg-45425f378b61 = betydning

seg-6940543aa3c0 = streng

seg-f5e7215e6835 = objekt

seg-c5fb6b91dc68 = grader

seg-99427ab75a03 = felt

seg-bbcdd898d24d = heltall

seg-ba00d0453fbf = Kilde: <c1/>

seg-738956d0a4b9 = NMEA-treningsstrømmer: <c1/>

seg-3663955f80c7 = Maritime akademier og simulatorsentre kan mate NMEA { "0183" } generert av Kshana inn i en brosimulator eller en kartplotter for å trene mannskap i å gjenkjenne GNSS-jamming og -spoofing.

seg-4012bc6376aa = <b>Kun for trening og testing.</b> De genererte strømmene er syntetiske. De må aldri mates inn i et fartøys levende navigasjonssystemer. Kshana er veiledende, ikke typegodkjent navigasjonsutstyr. Hver strøm starter med, og gjentar hvert tiende sekund, en proprietær markørsetning, <c1/>, som mottakere ignorerer; <c2/> fjerner den for en simulator som avviser ukjente setninger. Dette skriver <b>bare NMEA-tekst</b>: det er ingen RF-, IQ- eller bølgeformutdata, og ingenting sender annet enn teksten til adressen du oppgir.

seg-b66ff9ca2ff4 = Treningsstrøm fra scenarioet coastal-drag-off (motor v{ $version }, seed { "22" }, { "25" } minutter med én posisjonsbestemmelse per { "10" } s i instruktørloggen). Et kart viser fartøyets sanne spor og sporet mottakeren rapporterer: de stemmer overens til en skriptet posisjons-drag-off begynner ved { "421" } s, deretter går det rapporterte sporet bort fra det sanne mens mottakeren beholder en gyldig posisjonsbestemmelse, og det hopper tilbake når hendelsen slutter ved { "1140" } s. Ved siden av vises avstanden mellom de to sporene over tid og den midlere bærebølge-til-støy-tettheten mottakeren rapporterer, som stiger til ett hevet nivå mens hendelsen varer. Syntetiske treningsdata generert av Kshana. Kun for trening og testing: mat aldri denne strømmen inn i et fartøys levende navigasjonssystemer. Veiledende, ikke typegodkjent navigasjonsutstyr. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon. Posisjoner, datoer og spor er oppdiktet.

seg-1f70c2c761ac = Figuren er tegnet fra instruktørloggen til <c1/>.

seg-32b620b3574e = Bruk

seg-9cbd24964be4 = Valg

seg-aadcf289aed2 = skriv strømmen til en fil; uten nettverksutdata er standarden <c1/>

seg-a3fc46437059 = skriv <c1/> og <c2/> (standard: ved siden av filen)

seg-14dad363af8a = <c1/> eller <c2/>

seg-8e105cf0979b = TCP-server; kjøringen starter når en klient har koblet til (<c1/>). En bar port lytter bare på <c2/>

seg-63ee193b90b4 = <c1/> eller <c2/>

seg-fc322c7ce2db = UDP, én setning per datagram; <c1/> tillater en kringkastingsadresse. En bar port sender til <c2/>

seg-8ca50e2a4b8d = styr tempoet på strømmen; <c1/> er så raskt som mulig. Nettverksutdata går som standard i sanntid, filer så raskt som mulig

seg-97b82dfe97a7 = erstatt scenarioets seed

seg-86ac66fd2771 = utelat markørsetningen

seg-f6cc05a6d39a = <b>Det er ingen autentisering.</b> En TCP-server med en ikke-lokal adresse serverer strømmen til alle som kan nå den, og UDP sender til den adressen du oppgir. En TCP-klient som ikke tar imot dataene sine innen to sekunder, kobles fra, så én fastlåst forbruker ikke kan holde de andre oppe

seg-b4abb5a132ba = Det samme seedet gir de samme bytene på én plattform, og tempostyring endrer aldri bytene. På tvers av plattformer er generatorens egen aritmetikk bit-identisk (den bruker det portable matematikklaget), men satellittposisjoner og siktevinkler kommer fra motorfunksjoner som kaller vertens matematikkbibliotek, så i et sjeldent grensetilfelle kan et avrundet siffer for elevasjon, azimut eller C/N0 i GSV avvike mellom plattformer.

seg-97e31fc7f0d1 = Hva som skrives

seg-632a4ca26567 = Hver epoke ({ "1" }, { "2" }, { "5" } eller { "10" } per sekund) inneholder: <b>RMC, GGA, GNS</b> (posisjonsbestemmelse, posisjon, tid), <b>GSA</b> (brukte satellitter og DOP, én per konstellasjon), <b>GSV</b> (satellitter i sikte med elevasjon, azimut og SNR i dB-Hz, ett sett per konstellasjon, NMEA { "4.10" } signal-ID), <b>VTG</b> (kurs og fart over grunnen), <b>ZDA</b> (tid og dato), <b>HDT</b> (gyrokurs) og <b>VBW</b> (fart gjennom vannet og over grunnen fra loggen). Talker er <c1/> med flere konstellasjoner, ellers konstellasjonens egen. Linjene ender i CRLF og har gyldig sjekksum.

seg-942803ad8c49 = HDT og VBW representerer uavhengige sensorer (et gyrokompass og en Doppler-logg). <b>Ingen hendelse berører dem</b>, noe som er bevisst: forskjellen mellom det GNSS rapporterer og det gyroen og loggen sier, er et signal i debriefen.

seg-2d9a9ea38dde = Når posisjonsbestemmelsen går tapt, er GGA-kvaliteten { "0" }, RMC-statusen er <c1/>, posisjonsfeltene er tomme og tidsfeltene fortsetter (mottakerens klokke går videre), slik ekte mottakere gjør.

seg-c1c51ff381e7 = Fartøyet

seg-ada150c912eb = <c1/> og <c2/> gir en startposisjon, en fart og punktene det skal styres gjennom. Fartøyet styres mot neste veipunkt under en <b>grense for svingehastighet</b> (<c3/>, standard { "30" }), en grense for hvor fort svingehastigheten bygges opp (<c4/>) og en <b>grense for fartsendring</b> (<c5/>). Farten på en etappe er veipunktets <c6/>. <c7/> legger til en strøm, så farten over grunnen avviker fra farten gjennom vannet og kursen avviker fra kursen over grunnen, og en magnetisk misvisning. <c8/> bringer fartøyet i ro ved det siste veipunktet.

seg-4fc2cb8a1388 = Satellittgeometri

seg-b97bd86ed3a4 = Satellittene kommer fra motorens egne nominelle konstellasjoner (GPS-slottabell, Walker-mønstre for Galileo og BeiDou MEO, GLONASS-ICD), propagert av <c1/> (tolegemebane pluss sekulær J2, jordrotasjon) og sett fra fartøyet med motorens WGS-84-siktevinkler. Antall synlige, elevasjoner og azimuter i GSV er plausible for stedet og tiden på døgnet. <b>Dette er en nominell himmel, ikke en efemeride for strømmens dato</b>: PRN-er tildeles i slot-rekkefølge, og hver konstellasjon beholder sitt publiserte slot-oppsett, propagert kontinuerlig fra epoken i GPS-slottabellen (2016-12-31) under J2, så oppsettet er intakt, men orienteringen er ikke den til den virkelige himmelen på strømmens dato. C/N0 følger elevasjonen (et nominelt senitnivå, satt i <c2/>), med en fast forskyvning per satellitt, langsom fading og støy. En satellitt under <c3/> har et tomt SNR-felt; en under <c4/> spores, men brukes ikke. Opptil <c5/> (standard { "12" }, taket i NMEA GGA) brukbare satellitter brukes, valgt for geometri (den høyeste satellitten i hver azimutsektor på { "30" } grader først). Færre enn fire brukbare satellitter gir tap av posisjonsbestemmelsen, og den kommer tilbake etter <c6/> med brukbart signal.

seg-f2be7442bdf2 = Hendelser

seg-db86ed4b40a9 = Hver <c1/> har en <c2/>, et starttidspunkt <c3/>, en <c4/> (fra start til begynnelsen av avslippingen), en rampe ved start <c5/> og en rampe ved avslipping <c6/>. Styrken stiger lineært over <c7/>, holdes, og faller deretter over <c8/>; <c9/> er et trinn. Alle virkningene skalerer med den styrken. Parametere som ikke hører til typen, avvises.

seg-3255e99c7265 = kind

seg-9285a9d699c0 = parametere

seg-e83c9db4f9c7 = virkning

seg-e96ef358529d = <c1/>, <c2/> (standard { "6" })

seg-cd6030834371 = hver satellitts C/N0 faller med opptil <c1/> (spredning per satellitt), satellitter faller ut med de laveste først, posisjonsbestemmelsen går tapt når færre enn fire er brukbare, og kommer tilbake etter avslippingen og <c2/>

seg-e5a66c9c3627 = <c1/>, én av <c2/> (sann) eller <c3/> (til kursen <b>ved start</b>, deretter holdt), valgfritt <c4/>, <c5/>

seg-d7d967a60275 = mottakeren beholder en <b>gyldig posisjonsbestemmelse</b> hvis posisjon går bort fra sannheten; SOG og COG inkluderer draget. Draget følger smoothstep på rampene, så det falske sporet starter og stopper uten hastighetstrinn; toppene er <c1/> m/s og <c2/> m/s i annen for en rampe på <c3/> s over <c4/> m (begge logget), og et scenario som ville overskride <c5/>, avvises. Et trinn (<c6/>) flytter posisjonen uten å berøre hastigheten

seg-7da039c3262e = tiden i RMC, GGA, GNS og ZDA flyttes fra sann UTC; posisjonen forblir sann

seg-ead3ce0162fb = <c1/>, <c2/> (standard true), <c3/>

seg-a1bdb89334df = posisjon, hastighet (og tid) er de til fartøyet for <c1/> siden, der forsinkelsen følger smoothstep på rampene og den rapporterte farten skaleres med <c2/> mens den endres: en forenklet abstraksjon i stil med meaconing, ikke en utbredelsesmodell

seg-6f435224f7fb = <c1/>: mens en drag-off, tidsspoofing eller replay-forsinkelse er aktiv, viser hver sporede satellitt dette ene hevede nivået, et klassisk tegn. Utelat den for en subtil hendelse der det ekte C/N0-mønsteret beholdes. Mens en forfalskningshendelse er aktiv, følger mottakeren det forfalskede signalet, så jamming får den ikke til å falle ut; en posisjonsbestemmelse som er tapt på grunn av tidligere jamming, kommer tilbake etter <c2/> på det forfalskede signalet (se <c3/>). En tidsendring som ville fått rapportert tid til å stoppe eller gå bakover (rate på { "1" } s per sekund eller mer), avvises med mindre det er et trinn (<c4/>).

seg-894aceb32c5c = Hendelser kan overlappe; virkningene deres legges sammen (forskyvninger, tidsendringer, forsinkelser) eller den sterkeste gjelder (jamming). Tidslinjens <c1/> er den første epoken der hendelsen har en virkning, én epoke etter det skriptede <c2/> når hendelsen rampes inn.

seg-09e311ade9e6 = Instruktørloggen

seg-80933b9bdf0d = Sammen med strømmen gir <c1/> og <c2/>:

seg-51930977a6fe = hendelsene slik de ble injisert, på vanlig språk med hver parameter, og UTC-tidspunktet de begynte;

seg-4eab197c487b = en tidslinje: start, full virkning, gjenoppretting begynner, gjenopprettet, og mottakerens egne <c1/> og <c2/>;

seg-af2eb88f14d0 = det sanne sporet mot det rapporterte ved <c1/> intervall: sann og rapportert posisjon, fart og kurs, posisjonsfeil i meter, tidsforskyvning, brukte og sporede satellitter, middel-C/N0, og hvilke hendelser som var aktive;

seg-303f5fbe0351 = toppfarten og toppakselerasjonen til det sanne og det rapporterte sporet;

seg-593a4a1ef296 = scenarioets <c1/>.

seg-8c4aebcd0eff = Vis loggen først i debriefen.

seg-dd1780910af7 = JSON-felt (skjema <c1/>)

seg-60b5b11cdc0b = type, enhet

seg-f4963d090155 = erklæringen om at den bare er for trening

seg-7ad14e03d9e4 = fra scenarioet

seg-fac0fb50b31b = brukt seed

seg-f05d18516bd8 = ISO { "8601" } UTC

seg-8752c09baa6a = start på kjøringen

seg-f0d8bb5aafef = lengden på kjøringen

seg-0989e14f1e51 = knop

seg-b657b979a455 = høyeste sanne og rapporterte fart over grunnen

seg-24e947df31ae = m/s i annen

seg-a1ca3847c8d8 = største hastighetsendring per sekund, sann og mellom påfølgende rapporterte posisjonsbestemmelser

seg-e1daadeb7d48 = én per skriptet hendelse

seg-3aaa0108ac1e = 1-basert; brukes av <c1/> og <c2/>

seg-6bbb9db14f7b = beskrivelse på vanlig språk med parameterne

seg-2f3eac27a997 = skriptet start

seg-4255c67f3db5 = hendelsen nøyaktig slik den er skrevet (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> og typens egne parametere; fraværende utelates)

seg-88db26711d77 = grader sann kurs eller null

seg-2f30c3d8b17b = drag-off: retningen som ble brukt (en relativ peiling løses ved start)

seg-55d6dd667365 = m/s, m/s i annen eller null

seg-021df000164f = drag-off: toppene draget legger til det falske sporet

seg-d3a2c65ebcd4 = øyeblikk for debriefen, i tidsrekkefølge

seg-b2b72301c1c9 = s fra start, ISO { "8601" } UTC

seg-34e24e21ac7e = når (sann tid)

seg-cf29ba5ed968 = heltall eller null

seg-8dbc5e7239be = hendelses-id; null for endringer i mottakerens tilstand

seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (hendelser); <c5/>, <c6/> (mottaker)

seg-cd7c4057601b = forklaring

seg-90e65cbe1a59 = én rad per <c1/>

seg-a57e27a3c470 = s, ISO { "8601" } UTC

seg-24376fe24496 = sann posisjon

seg-f23b251a0e33 = knop, grader sann kurs

seg-242c1f2ccbd3 = sann fart og kurs over grunnen, og gyrokurs

seg-696dd61f8bbb = boolsk

seg-ea264ef0395c = mottakeren rapporterte en posisjonsbestemmelse

seg-b073b87a813e = grader, knop, grader sann kurs, eller null

seg-b56345697092 = det mottakeren rapporterte; null mens posisjonsbestemmelsen er tapt

seg-c4a33c03d9da = m eller null

seg-463f6fc42ae5 = horisontal avstand fra sann til rapportert posisjon

seg-b68dfce8d81d = rapportert UTC minus sann UTC

seg-ec28faa1efcc = heltall

seg-2bf397f77392 = satellitter brukt i posisjonsbestemmelsen, og sporede

seg-96b87348e90e = dB-Hz eller null

seg-40f30b4a88cf = middel-C/N0 for de sporede satellittene

seg-3671c8aa3c1a = id-er for hendelser med en virkning i dette øyeblikket

seg-8401fa92aae1 = Å legge til et felt endrer ikke skjemaetiketten. Å endre navn på eller fjerne et felt, eller endre betydningen eller enheten til et felt, øker nummeret (<c1/>).

seg-656ee92a3130 = Scenariobiblioteket

seg-82a888587138 = <c1/>, hver noen få minutter av en seilas med en trenermerknad i sin TOML:

seg-665b9b46b49b = fil

seg-11ed1f85d4be = hva den viser

seg-50ffa85a1128 = C/N0 faller samlet, satellitter faller ut, posisjonsbestemmelsen går tapt og kommer tilbake

seg-10bc30b9c57b = en gyldig, sunt utseende posisjonsbestemmelse dras { "1.4" } km mot land; ensartet hevet C/N0

seg-f141692988e4 = posisjonen er riktig, UTC drifter { "45" } s foran under en langsom havneinnseiling

seg-ce06a5ebdd42 = jamming, deretter forfalsket overtakelse med drag-off og tidsforskyvning, deretter en replay-forsinkelse

seg-3fbcfd1dd26a = en blokkert himmel, ikke interferens: veggene i en fjord (skyline-forhåndsinnstillingen <c1/>, REPRESENTATIVE) skjuler satellittene mot øst og vest, deretter åpner kanalen seg igjen (hendelse <c2/>, med en <c3/>-tabell)

seg-5462f6b21fae = Posisjoner, datoer og spor er oppdiktet; biblioteket inneholder ingen ekte fartøy, operatør eller opptak. Det gir ingen påstand om hvordan noen mottaker eller noe system ville klart seg mot interferens.

seg-9831ab537b36 = Modelleringsvalg

seg-76a0e0eb57b3 = Generatoren er et treningsverktøy uten ekstern referanse, og tallene er modelleringsvalg, ikke målinger av noen mottaker. De er valgt for å se ut som en vanlig mottakerlogg: C/N0-stigningstallet på { "14" } dB fra senit til horisont under senitnivået (standard { "47" } dB-Hz) og forskyvningen per satellitt på +/-1.5 dB, langsom fading på { "0.8" } dB over { "97" } s og { "0.5" } dB over { "31" } s, { "0.3" } dB jitter; terskelene for sporing ({ "20" } dB-Hz) og bruk ({ "28" } dB-Hz); posisjonsstøyen ({ "1.5" } m ved HDOP { "1" }, korrelert over { "30" } s, vertikalt det dobbelte); { "0.05" } graders gyrostøy og { "0.03" } kn avdriftsstøy; styringstidskonstanten på { "20" } s og ankomstradiene for veipunkter i fartøymodellen; og valget av satellitter etter azimutsektor. Standardene ligger i <c1/> og <c2/> og kan alle endres i scenarioet.

seg-84913be532a0 = Lese den tilbake

seg-fbf4002d25cd = <c1/> kan lese inn disse filene (<c2/>). Testene kontrollerer hver setning i hvert bibliotekscenario mot sine egne regler for feltantall og sjekksum, og kjører filene gjennom den leseren, som tolker GGA, RMC og GSV og går forbi de andre typene uten å hoppe over noen. Testene fester et gullutdrag per scenario (<c3/>); generer på nytt med <c4/> etter en tilsiktet endring.

seg-b94fbc3b1dd3 = <s1>Forrige</s1>Maritim tillit

seg-ecdf748cb63d = <s1>Neste</s1>Interferenskart og rute-eksponering

seg-24ad8471ff2a = JSON-felt (skjema kshana-nmea-training/1)
