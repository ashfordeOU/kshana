# docs--nmea-training: translations (da)

seg-2247a2344710 = Betydning

seg-45425f378b61 = betydning

seg-6940543aa3c0 = streng

seg-f5e7215e6835 = objekt

seg-c5fb6b91dc68 = grader

seg-99427ab75a03 = felt

seg-bbcdd898d24d = heltal

seg-ba00d0453fbf = Kilde: <c1/>

seg-738956d0a4b9 = NMEA-træningsstrømme: <c1/>

seg-3663955f80c7 = Søfartsskoler og simulatorcentre kan føre NMEA { "0183" } genereret af Kshana ind i en brosimulator eller en kortplotter for at træne besætninger i at genkende GNSS-jamming og spoofing.

seg-4012bc6376aa = <b>Kun til træning og test.</b> De genererede strømme er syntetiske. De må aldrig føres ind i et fartøjs levende navigationssystemer. Kshana er vejledende, ikke typegodkendt navigationsudstyr. Hver strøm starter med og gentager hvert tiende sekund en proprietær markørsætning, <c1/>, som modtagere ignorerer; <c2/> fjerner den til en simulator, der afviser ukendte sætninger. Dette skriver <b>kun NMEA-tekst</b>: der er intet RF-, IQ- eller bølgeformsoutput, og intet sender andet end teksten til den adresse, du angiver.

seg-b66ff9ca2ff4 = Træningsstrøm fra scenariet coastal-drag-off (motor v{ $version }, seed { "22" }, { "25" } minutter med én positionsbestemmelse pr. { "10" } s fra instruktørloggen). Et kort viser fartøjets sande spor og det spor, modtageren rapporterer: de er enige, indtil en indskrevet positions-drag-off begynder ved { "421" } s; det rapporterede spor driver derefter væk fra det sande, mens modtageren beholder en gyldig positionsbestemmelse, og springer tilbage, når hændelsen slutter ved { "1140" } s. Ved siden af ses afstanden mellem de to spor over tid og den gennemsnitlige bærebølge-til-støj-tæthed, som modtageren rapporterer, og som stiger til ét forhøjet niveau, så længe hændelsen varer. Syntetiske træningsdata genereret af Kshana. Kun til træning og test: før aldrig denne strøm ind i et fartøjs levende navigationssystemer. Vejledende, ikke typegodkendt navigationsudstyr. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation. Positioner, datoer og spor er opfundne.

seg-1f70c2c761ac = Figuren er tegnet ud fra instruktørloggen for <c1/>.

seg-32b620b3574e = Brug

seg-9cbd24964be4 = Indstilling

seg-aadcf289aed2 = skriv strømmen til en fil; uden netværksoutput er standarden <c1/>

seg-a3fc46437059 = skriv <c1/> og <c2/> (standard: ved siden af filen)

seg-14dad363af8a = <c1/> eller <c2/>

seg-8e105cf0979b = TCP-server; kørslen starter, når en klient har forbundet (<c1/>). En enkelt port lytter kun på <c2/>

seg-63ee193b90b4 = <c1/> eller <c2/>

seg-fc322c7ce2db = UDP, én sætning pr. datagram; <c1/> tillader en broadcast-adresse. En enkelt port sender til <c2/>

seg-8ca50e2a4b8d = styr tempoet for strømmen; <c1/> er så hurtigt som muligt. Netværksoutput kører som standard i realtid, filer så hurtigt som muligt

seg-97b82dfe97a7 = erstat scenariets seed

seg-86ac66fd2771 = udelad markørsætningen

seg-f6cc05a6d39a = <b>Der er ingen autentificering.</b> En TCP-server med en ikke-lokal adresse leverer strømmen til enhver, der kan nå den, og UDP sender til den adresse, du angiver. En TCP-klient, der ikke henter sine data inden for to sekunder, bliver droppet, så én gået i stå forbruger ikke kan holde de andre tilbage.

seg-b4abb5a132ba = Det samme seed giver de samme bytes på én platform, og tempoet ændrer aldrig bytes. På tværs af platforme er generatorens egen aritmetik bitidentisk (den bruger det portable matematiklag), men satellitpositioner og elevationsvinkler kommer fra motorfunktioner, der kalder værtens matematikbibliotek, så i et sjældent grænsetilfælde kan et afrundet ciffer for elevation, azimut eller C/N0 i GSV afvige mellem platforme.

seg-97e31fc7f0d1 = Hvad der skrives

seg-632a4ca26567 = Hver epoke ({ "1" }, { "2" }, { "5" } eller { "10" } pr. sekund) indeholder: <b>RMC, GGA, GNS</b> (positionsbestemmelse, position, tid), <b>GSA</b> (anvendte satellitter og DOP, én pr. konstellation), <b>GSV</b> (satellitter i sigte med elevation, azimut og SNR i dB-Hz, ét sæt pr. konstellation, NMEA { "4.10" }-signal-ID), <b>VTG</b> (kurs og fart over grunden), <b>ZDA</b> (tid og dato), <b>HDT</b> (gyrokurs) og <b>VBW</b> (fart gennem vandet og over grunden fra loggen). Taleren er <c1/> ved flere konstellationer, ellers konstellationens egen. Linjerne slutter med CRLF og har gyldig kontrolsum.

seg-942803ad8c49 = HDT og VBW træder i stedet for uafhængige sensorer (et gyrokompas og en Doppler-log). <b>Ingen hændelse berører dem</b>, hvilket er bevidst: forskellen mellem det, GNSS rapporterer, og det, gyroen og loggen siger, er et signal til debriefingen.

seg-2d9a9ea38dde = Når positionsbestemmelsen går tabt, er GGA-kvaliteten { "0" }, RMC-status er <c1/>, positionsfelterne er tomme, og tidsfelterne fortsætter (modtagerens ur kører videre), som rigtige modtagere gør.

seg-c1c51ff381e7 = Fartøjet

seg-ada150c912eb = <c1/> og <c2/> angiver en startposition, en fart og de punkter, der skal styres igennem. Fartøjet styres mod det næste waypoint under en <b>grænse for drejehastighed</b> (<c3/>, standard { "30" }), en grænse for, hvor hurtigt drejehastigheden kan opbygges (<c4/>), og en <b>grænse for fartændring</b> (<c5/>). Et etapes fart er waypointets <c6/>. <c7/> tilføjer en strøm, så farten over grunden afviger fra farten gennem vandet, og kursen afviger fra kursen over grunden, samt en magnetisk misvisning. <c8/> bringer fartøjet til standsning ved det sidste waypoint.

seg-4fc2cb8a1388 = Satellitgeometri

seg-b97bd86ed3a4 = Satellitterne kommer fra motorens egne nominelle konstellationer (GPS-slottabel, Galileo- og BeiDou-MEO-Walker-mønstre, GLONASS ICD), propageret af <c1/> (tolegemeproblem plus sekulær J2, jordrotation) og set fra fartøjet med motorens WGS-84-elevationsvinkler. Det synlige antal, elevationer og azimutter i GSV er plausible for stedet og tidspunktet på dagen. <b>Dette er en nominel himmel, ikke en efemeride for strømmens dato</b>: PRN'er tildeles i slotrækkefølge, og hver konstellation bevarer sin offentliggjorte slotopbygning, propageret kontinuerligt fra GPS-slottabellens epoke (2016-12-31) under J2, så opbygningen er intakt, men dens orientering er ikke den virkelige himmels på strømmens dato. C/N0 følger elevationen (et nominelt zenitniveau, angivet i <c2/>) med et fast offset pr. satellit, langsom fading og støj. En satellit under <c3/> har et tomt SNR-felt; en under <c4/> spores, men anvendes ikke. Op til <c5/> (standard { "12" }, NMEA GGA's loft) anvendelige satellitter bruges, valgt efter geometri (den højeste satellit i hver { "30" } graders azimutsektor først). Færre end fire anvendelige satellitter mister positionsbestemmelsen, og den vender tilbage efter <c6/> med anvendeligt signal.

seg-f2be7442bdf2 = Hændelser

seg-db86ed4b40a9 = Hver <c1/> har en <c2/>, et indsættelsestidspunkt <c3/>, en <c4/> (fra indsættelsen til starten af udløsningen), en indsættelsesrampe <c5/> og en udløsningsrampe <c6/>. Styrken stiger lineært over <c7/>, holdes og falder derefter over <c8/>; <c9/> er et trin. Alle effekter skalerer med denne styrke. Parametre, der ikke hører til typen, afvises.

seg-3255e99c7265 = kind

seg-9285a9d699c0 = parametre

seg-e83c9db4f9c7 = virkning

seg-e96ef358529d = <c1/>, <c2/> (standard { "6" })

seg-cd6030834371 = hver satellits C/N0 falder med op til <c1/> (spredning pr. satellit), satellitter falder fra, laveste først, positionsbestemmelsen går tabt, når færre end fire er anvendelige, og vender tilbage efter udløsningen og <c2/>

seg-e5a66c9c3627 = <c1/>, én af <c2/> (sand) eller <c3/> (til kursen <b>ved indsættelsen</b>, derefter fastholdt), valgfri <c4/>, <c5/>

seg-d7d967a60275 = modtageren beholder en <b>gyldig positionsbestemmelse</b>, hvis position driver væk fra sandheden; SOG og COG omfatter driften. Driften følger smoothstep på rampene, så det falske spor starter og stopper uden hastighedstrin; dens toppe er <c1/> m/s og <c2/> m/s i anden for en rampe på <c3/> s over <c4/> m (begge logges), og et scenarie, der ville overskride <c5/>, afvises. Et trin (<c6/>) flytter positionen uden at røre hastigheden

seg-7da039c3262e = tiden i RMC, GGA, GNS og ZDA flyttes fra den sande UTC; positionen forbliver sand

seg-ead3ce0162fb = <c1/>, <c2/> (standard true), <c3/>

seg-a1bdb89334df = position, hastighed (og tid) er fartøjets for <c1/> siden, hvor forsinkelsen følger smoothstep på sine ramper, og den rapporterede fart skaleres med <c2/>, mens den ændrer sig: en forenklet abstraktion i stil med meaconing, ikke en udbredelsesmodel

seg-6f435224f7fb = <c1/>: mens en drag-off, tids-spoof eller replay-forsinkelse er aktiv, viser hver sporet satellit dette ene forhøjede niveau, et klassisk tegn. Udelad det ved en subtil hændelse, hvor det ægte C/N0-mønster bevares. Mens en vilkårlig falsk hændelse er aktiv, følger modtageren det falske signal, så jamming får den ikke til at falde fra; en positionsbestemmelse, der er gået tabt på grund af tidligere jamming, vender tilbage efter <c2/> på det falske signal (se <c3/>). En tidsændring, der ville få den rapporterede tid til at standse eller løbe baglæns (en hastighed på { "1" } s pr. sekund eller mere), afvises, medmindre den er et trin (<c4/>).

seg-894aceb32c5c = Hændelser kan overlappe; deres virkninger lægges sammen (offsets, tidsændringer, forsinkelser) eller den stærkeste tæller (jamming). Tidslinjens <c1/> er den første epoke, hvor hændelsen har en virkning, én epoke efter den indskrevne <c2/>, når hændelsen rampes ind.

seg-09e311ade9e6 = Instruktørloggen

seg-80933b9bdf0d = Ved siden af strømmen giver <c1/> og <c2/>:

seg-51930977a6fe = hændelserne, som de blev injiceret, i klart sprog med hver parameter og deres UTC-indsættelsestidspunkt;

seg-4eab197c487b = en tidslinje: indsættelse, fuld virkning, begyndende genopretning, genoprettet og modtagerens egne <c1/> og <c2/>;

seg-af2eb88f14d0 = det sande spor over for det rapporterede ved <c1/>-afstand: sand og rapporteret position, fart og kurs, positionsfejl i meter, tidsoffset, anvendte og sporede satellitter, gennemsnitlig C/N0 og hvilke hændelser der var aktive;

seg-303f5fbe0351 = den højeste fart og acceleration for det sande og for det rapporterede spor;

seg-593a4a1ef296 = scenariets <c1/>.

seg-8c4aebcd0eff = Vis kun loggen ved debriefingen.

seg-dd1780910af7 = JSON-felter (skema <c1/>)

seg-60b5b11cdc0b = type, enhed

seg-f4963d090155 = erklæringen om, at den kun er til træning

seg-7ad14e03d9e4 = fra scenariet

seg-fac0fb50b31b = anvendt seed

seg-f05d18516bd8 = ISO { "8601" } UTC

seg-8752c09baa6a = kørslens start

seg-f0d8bb5aafef = kørslens længde

seg-0989e14f1e51 = knob

seg-b657b979a455 = højeste sande og rapporterede fart over grunden

seg-24e947df31ae = m/s i anden

seg-a1ca3847c8d8 = største ændring af hastighed pr. sekund, sand og mellem på hinanden følgende rapporterede positionsbestemmelser

seg-e1daadeb7d48 = én pr. indskrevet hændelse

seg-3aaa0108ac1e = 1-baseret; bruges af <c1/> og <c2/>

seg-6bbb9db14f7b = beskrivelse i klart sprog med parametrene

seg-2f3eac27a997 = indskrevet indsættelse

seg-4255c67f3db5 = hændelsen præcis som skrevet (<c1/>, <c2/>, <c3/>, <c4/>, <c5/> og typens egne parametre; fraværende udelades)

seg-88db26711d77 = grader sand eller null

seg-2f30c3d8b17b = drag-off: den anvendte retning (en relativ pejling bestemmes ved indsættelsen)

seg-55d6dd667365 = m/s, m/s i anden eller null

seg-021df000164f = drag-off: de toppe, som driften tilføjer det falske spor

seg-d3a2c65ebcd4 = øjeblikke til debriefingen i tidsrækkefølge

seg-b2b72301c1c9 = s fra start, ISO { "8601" } UTC

seg-34e24e21ac7e = hvornår (sand tid)

seg-cf29ba5ed968 = heltal eller null

seg-8dbc5e7239be = hændelsens id; null for ændringer i modtagerens tilstand

seg-ae0d2fd5e1d1 = <c1/>, <c2/>, <c3/>, <c4/> (hændelser); <c5/>, <c6/> (modtager)

seg-cd7c4057601b = forklaring

seg-90e65cbe1a59 = én række pr. <c1/>

seg-a57e27a3c470 = s, ISO { "8601" } UTC

seg-24376fe24496 = sand position

seg-f23b251a0e33 = knob, grader sand

seg-242c1f2ccbd3 = sand fart og kurs over grunden samt gyrokurs

seg-696dd61f8bbb = boolesk

seg-ea264ef0395c = modtageren rapporterede en positionsbestemmelse

seg-b073b87a813e = grader, knob, grader sand eller null

seg-b56345697092 = hvad modtageren rapporterede; null, mens positionsbestemmelsen er tabt

seg-c4a33c03d9da = m eller null

seg-463f6fc42ae5 = vandret afstand fra sand til rapporteret position

seg-b68dfce8d81d = rapporteret UTC minus sand UTC

seg-ec28faa1efcc = heltal

seg-2bf397f77392 = satellitter anvendt i positionsbestemmelsen og sporede

seg-96b87348e90e = dB-Hz eller null

seg-40f30b4a88cf = gennemsnitlig C/N0 for de sporede satellitter

seg-3671c8aa3c1a = id'er på hændelser med en virkning i dette øjeblik

seg-8401fa92aae1 = At tilføje et felt ændrer ikke skemamærket. At omdøbe eller fjerne et felt eller ændre et felts betydning eller enhed tæller nummeret op (<c1/>).

seg-656ee92a3130 = Scenariebiblioteket

seg-82a888587138 = <c1/>, hver få minutters sejlads med en trænernote i sin TOML:

seg-665b9b46b49b = fil

seg-11ed1f85d4be = hvad den viser

seg-50ffa85a1128 = C/N0 falder samlet, satellitter falder fra, positionsbestemmelsen går tabt og vender tilbage

seg-10bc30b9c57b = en gyldig, sundt udseende positionsbestemmelse driver { "1.4" } km mod kysten; ensartet forhøjet C/N0

seg-f141692988e4 = positionen er korrekt, UTC driver { "45" } s foran under en langsom havneindsejling

seg-ce06a5ebdd42 = jamming, derefter falsk overtagelse med drag-off og tidsoffset, derefter en replay-forsinkelse

seg-3fbcfd1dd26a = en blokeret himmel, ikke interferens: væggene i en fjord (forudindstillingen <c1/> for horisontprofil, REPRESENTATIVE) skjuler satellitterne mod øst og vest, derefter åbner sundet sig igen (hændelse <c2/>, med en <c3/>-tabel)

seg-5462f6b21fae = Positioner, datoer og spor er opfundne; biblioteket indeholder intet rigtigt fartøj, ingen rigtig operatør og ingen rigtig optagelse. Det udtaler sig ikke om, hvordan nogen modtager eller noget system ville klare sig mod interferens.

seg-9831ab537b36 = Modelleringsvalg

seg-76a0e0eb57b3 = Generatoren er et træningsværktøj uden ekstern uafhængig reference, og dens tal er modelleringsvalg, ikke målinger af nogen modtager. De er valgt, så de ligner en almindelig modtagerlog: C/N0-hældningen på { "14" } dB fra zenit til horisont under zenitniveauet (standard { "47" } dB-Hz) og offsettet pr. satellit på +/-1.5 dB, langsom fading på { "0.8" } dB over { "97" } s og { "0.5" } dB over { "31" } s, { "0.3" } dB jitter; tærsklerne for sporing ({ "20" } dB-Hz) og anvendelse ({ "28" } dB-Hz); positionsstøjen ({ "1.5" } m ved HDOP { "1" }, korreleret over { "30" } s, lodret det dobbelte); { "0.05" } grads gyrostøj og { "0.03" } kn afdriftsstøj; styretidskonstanten på { "20" } s og waypointankomstradierne i fartøjsmodellen; og valget af satellitter efter azimutsektor. Standardværdierne findes i <c1/> og <c2/> og kan alle ændres i scenariet.

seg-84913be532a0 = At læse den tilbage

seg-fbf4002d25cd = <c1/> kan indlæse disse filer (<c2/>). Testene kontrollerer hver sætning i hvert bibliotekscenarie mod dens egne regler for feltantal og kontrolsum og kører filerne gennem den læser, som fortolker GGA, RMC og GSV og springer de øvrige typer over uden at udelade nogen. Testene fastholder et gyldent uddrag pr. scenarie (<c3/>); generér igen med <c4/> efter en tilsigtet ændring.

seg-b94fbc3b1dd3 = <s1>Forrige</s1>Maritim tillid

seg-ecdf748cb63d = <s1>Næste</s1>Interferenskort og ruteeksponering

seg-24ad8471ff2a = JSON-felter (skema kshana-nmea-training/1)
