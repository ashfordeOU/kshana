# docs--clock-log-formats: translations (nb)

seg-ca2fcdd60f65 = Kilde: <c1/>

seg-0dfd1160c5d7 = Formater for klokkelogger

seg-f52a62872493 = <c1/> leser en målt klokkelogg til én normalisert faseserie: et jevnt rutenett av <c2/>-samples, med sampleintervallet <c3/> oppgitt eller funnet, hvert hull talt og enhetene i loggen navngitt. Åtte formater leses, hvert en dokumentert delmengde. Alt utenfor delmengden avvises med en feil som navngir det som ble funnet, i stedet for å leses omtrentlig.

seg-dbdbfec37ab6 = <b>Forkortelser.</b> RINEX er Receiver Independent Exchange Format. TICC er TAPR-tidsintervalltelleren (Tucson Amateur Packet Radio). ADEV er den overlappende Allan-deviasjonen, TDEV tidsdeviasjonen og MTIE den maksimale tidsintervallfeilen. <c1/> er sampleintervallet i sekunder.

seg-1d5a6c2090af = Hvor en logg kan brukes

seg-2a391645eeeb = <b><c1/></b>: <c2/> i stedet for <c3/> eller <c4/>. Loggens fase, i ns, er tidsfeilserien som kontrolleres mot maskene, og rapporten får en blokk <c5/> som sier hvordan den ble lest.

seg-4c2a67008451 = <b>Klokketypen</b>: en tabell <c1/> legger til en blokk <c2/> i kjøringen: hvordan loggen ble lest, SHA-256 for tabellen (<c3/>; kjøringens <c4/> dekker ikke tabellen) og for fasesamplene, og den overlappende ADEV, TDEV og MTIE ved oktavvise midlingsfaktorer. Den krever <c5/>. Den simulerte holdoveren er uendret.

seg-2f464fe709c9 = Uten tabellen parses, hashes og rapporteres begge typene nøyaktig som før.

seg-c931c5ec2f4a = Formatene

seg-0b758195e7eb = <b><c1/></b>: ASCII-fase- eller frekvenslogger i TimeLab-stil, tekstformen som TimeLab eksporterer og som ASCII-importen og Stable32 leser. Det er én avlesning per linje: enten én kolonne ved et jevnt <c2/>, eller to kolonner <c3/>. Kolonner kan skilles med blanktegn, komma eller semikolon.

seg-a7ae9e712bea = Linjer som starter med <c1/>, <c2/> eller <c3/> er kommentarer. En kommentar på formen <c4/> (eller <c5/>) setter <c6/> (s), <c7/> (<c8/>, <c9/>, <c10/>, <c11/> eller <c12/>, for fase), <c13/> (<c14/> eller <c15/>) eller <c16/> (<c17/> eller <c18/>, for den første av to kolonner).

seg-84cf463d5e74 = Én innledende ikke-numerisk linje tas som kolonneoverskrift.

seg-84f4b59bcdbf = Frekvensdata (relativ frekvens) godtas bare som én enkelt kolonne. De integreres til fase som <c1/> (NIST SP { "1065" }, { "2008" }, §{ "4.1" }).

seg-8cc445eb84f3 = TimeLabs binære prosjektfiler og prosjektfiler av typen <c1/> leses ikke.

seg-3af6e4e7bc73 = Linjer i tidsstempelmodus (<c1/>, <c2/>) og TimeLab-modusens pseudo-tidsstempelkanal (<c3/>) er tidsstempler for hendelser. Fasen til den valgte kanalen er tidsstempelet minus den nominelle tikken: <c4/>, der <c5/> er det hele antallet <c6/> siden den første hendelsen. En hendelse som uteblir er et hull.

seg-cecf9df4ff10 = Linjer i intervallmodus (<c1/>, eller en hvilken som helst etikett som starter med <c2/>) leses direkte som fase, én avlesning per <c3/>. Scenarioet må oppgi <c4/>, fordi linjen ikke bærer noe tidspunkt.

seg-5ec2509907dd = Linjer som starter med <c1/>, og linjer som ikke er <c2/> (for eksempel oppstartsmenyen), hoppes over og telles.

seg-cb4b7062dd5a = Logger fra linuxptp og chrony

seg-c6c70813a988 = Disse fem formatene leser det en kjørende tidsdaemon skriver om sin egen klokke. De er til for å kontrollere en tidskjede i etterkant (en boundary clock, en grandmasters PHC, en chrony-klient) med de samme estimatorene som for de andre loggene. De leser ikke en daemons konfigurasjon, og ingenting her snakker med en daemon.

seg-e1f85ff146d2 = <b><c1/></b>, <b><c2/></b>, <b><c3/></b>: servolinjene til linuxptp, der hvert format bare leser linjer fra sitt eget program. En avlesning er en linje på formen

seg-e32842403b6b = Tidsstempelet er den første <c1/> i linjen (daemonens monotone klokke). Det leses også etter et syslog-prefiks, der en prosess-ID som <c2/> ikke har noen brøkdel og ikke tas.

seg-72678cd6c03e = Fasen er den loggførte <c1/>, i nanosekunder, konvertert til sekunder. Det er daemonens målte tidsfeil for slaveklokken mot referansen, slik den er loggført: positiv når slaven ligger foran. Det er feilen som er igjen under servostyring, ikke driften til en fritt løpende klokke.

seg-f9080412572a = Ordene mellom tidsstempelet og <c1/> navngir kilden (<c2/>, <c3/> for et prefiks <c4/>, <c5/>, <c6/>). En logg med mer enn én kilde trenger <c7/>; feilen lister dem.

seg-5bef874341f2 = Avlesninger før servoen første gang rapporterer <c1/> (låst) utelates og telles i <c2/>: <c3/> og <c4/> er de ulåste tilstandene og steg-tilstandene, hvis avvik er innsvingningstransienter. En servo som aldri når <c5/> avvises. En linje uten tilstandsfelt leses som den er.

seg-121fbe1486cf = Sammendragslinjer (<c1/>), meldinger om <c2/> og <c3/>, og linjer fra andre programmer hoppes over og telles.

seg-92164f4a56be = Tidsstempler som går bakover (en daemon som er startet på nytt) avvises; del opp loggen.

seg-d86fd2a815d8 = <b><c1/></b>, <b><c2/></b>: chronys filer <c3/> og <c4/>, lest etter kolonneposisjon. En avlesning er en linje med minst { "14" } kolonner (tracking) eller { "13" } (statistics) som starter med en UTC-dato og et UTC-klokkeslett på formen <c5/>. Kolonneoverskriftslinjen hoppes over og telles; regelen <c6/> under den hoppes over uten å telles.

seg-bae4f6895d14 = Tracking: kolonne { "7" }, det lokale avviket ved klokkeoppdateringen, i sekunder. IP-adressen eller referanse-ID-en endres med den valgte kilden, så uten <c1/> leses hver linje som én lokal klokke. <c2/> beholder én referanse-ID.

seg-12b284cd7d8c = Statistics: kolonne { "5" }, det estimerte avviket for en kilde, i sekunder. Det er én serie per kildeadresse, og loggen trenger <c1/> når den inneholder mer enn én.

seg-197645e3c7c5 = Epoker er sekunder fra 1980-01-06 { "00" }:{ "00" }:{ "00" } UTC, uten håndtering av skuddsekunder. Chrony skriver en linje per oppdatering eller per kildesample, så avstanden er ikke jevn. <c1/> er medianavstanden; en avlesning under et halvt <c2/> etter den som ble beholdt før den, forkastes og telles i <c3/>, og en lengre avstand er et hull, som <c4/> rapporterer. Oppgi <c5/> og <c6/> for en logg med jevnt pollingintervall.

seg-61fbb0479c95 = Chrony-kolonnene og linjeoppsettene til linuxptp er de fra daemonenes offentlige dokumentasjon. Fiksene i <c1/> er skrevet for Kshana med oppdiktede verdier (se <c2/>); ingen ekte logg ble lest, så et oppsett som er ulikt mellom daemonversjoner kan fortsatt bli avvist eller feiltolket. En linje som ikke passer hoppes over og telles, aldri gjettet.

seg-b120a37b7d60 = <c1/> og hull

seg-6fd68aad2fd7 = Når loggen bærer tidsstempler og ingen <c1/> er oppgitt, er <c2/> medianavstanden mellom påfølgende tidsstempler, avrundet til fire gjeldende siffer, og kilden rapporteres som <c3/>. En tellers avstand avviker fra den nominelle med referansens frekvensavvik, deler per { "10" }^{ "6" } eller mindre. Et <c4/> i scenarioet vinner alltid (kilde <c5/>), deretter en header-kommentar <c6/> (kilde <c7/>).

seg-59e52611a7d3 = Samples plasseres på rutenettet <c1/>, og en manglende epoke er et hull. Avlesninger som ligger mer enn { "1" } % av <c2/> utenfor rutenettet forkastes og telles, det samme gjør duplikater (den første beholdes). Hullpolicyen er én av:

seg-61b1664a7c48 = <c1/> (standard): ethvert hull er en feil som teller hullene;

seg-593c998b65e0 = <c1/>: behold den lengste hullfrie perioden;

seg-f184ce746389 = <c1/>: fyll indre hull med lineær interpolasjon, og rapporter hvor mange som ble fylt.

seg-1f3dc3429615 = Estimatorene trenger en hullfri registrering, og derfor løses hull her.

seg-0f061f726ec5 = <s1>Forrige</s1>Test av holdover og tidsmaskinvare i sløyfen

seg-3c89cfcbbd04 = <s1>Neste</s1>Maskinvaresikkerhet

seg-9b52cd5eb4be = tau0 og hull
