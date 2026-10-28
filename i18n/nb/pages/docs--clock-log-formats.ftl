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

seg-9c8042f0d3d7 = <b><c1/></b>: RINEX-klokkefiler, versjon { "2.00" } og { "3.00" } til { "3.04" } (inkludert navnefeltet på ni tegn i { "3.04" }). Posten <c2/> kontrolleres, og enhver annen versjon avvises med navnet på versjonen som ble funnet: IGS publiserer klokkeformatet (<c3/>, <c4/>, <c5/>) opp til { "3.04" }, og dokumentene RINEX { "4.00" }, { "4.01" } og { "4.02" } definerer bare observasjons-, navigasjons- og meteorologifiler, så det finnes ingen versjon { "4.00" } av klokkefilen å lese. Headeren leses bare for sin <c6/> og hoppes over frem til <c7/>. Av datapostene beholdes bare postene <c8/> (satellitt) og <c9/> (mottaker eller stasjon) for én klokke, valgt etter navn. Det første verdifeltet deres, klokkebiasen i sekunder, er fasen. Fortsettelseslinjer og postene <c10/>, <c11/> og <c12/> hoppes over. Epoker er postens kalenderfelt, som sekunder fra 1980-01-06 { "00" }:{ "00" }:{ "00" } i filens eget tidssystem, uten konvertering.

seg-b65f4a928891 = <b><c1/></b>: logger fra TAPR TICC-telleren (TICC Operation Manual, revisjoner av { "23" } november { "2016" } og { "15" } desember { "2025" }, «measurement modes»). Hvert datafelt er sekunder med { "12" } desimaler ({ "11" } som standard fra firmware { "20251101" }: ethvert antall opp til { "15" } leses). Et tidsstempel leses fra sin desimaltekst som et helt antall femtosekunder, ikke som et binært flyttall, så fasen i en logg tatt dager etter at telleren startet beholder tellerens egen oppløsning: et tidsstempel av typen <c2/> ved { "3.0e5" } s har en avstand på { "5.8e-11" } s, omtrent tellerens { "60" } ps.

seg-bb51bfa2a834 = Paired Timestamp-modus skriver ut de samme linjene i kanalrekkefølge og leses som Timestamp-modus; 3-Corner Hat-modus legger til den syntetiserte <c1/>, lest som over.

seg-220bc7450e83 = Utdata i periodemodus og feilsøkingsmodus avvises. En kanal der avlesningene ikke øker rapporteres som periodemodus. Binær Timestamp-modus er ikke tekst, og en fil av den avvises med en melding som sier det.

seg-1138c53b3eac = Din egen klokke

seg-1f9cce016fa0 = En tabell <c1/> på klokketypen rapporterer hvor stabil din egen klokke var, ved siden av simuleringen: <c2/> (<c3/>) er <c4/> med et utdrag på 96 avlesninger av en IGS-satellittklokke som en innebygd TimeLab-logg. Erstatt <c5/> med <c6/> og <c7/> for din egen fil. Blokken <c8/> i resultatet inneholder hvordan loggen ble lest (format, <c9/> og hvor den kom fra, hvert gap) og dens ADEV, TDEV og MTIE; den endrer ikke simuleringen.

seg-584564d1a734 = Å drive holdoveren med din egen klokke: <c1/>

seg-56799b5fea19 = Loggen tilpasses med enhetskortprosedyren i <c1/> (kondisjonering, kvadratisk ledd fjernet, støyidentifikasjon med lag 1, vektet minste kvadraters metode i hvit PM, hvit FM, flicker FM og random-walk FM ved de midlingstidene som har minst { "30" } frihetsgrader). Den navngitte klokken tar deretter <c2/>, <c3/>, <c4/> og den tilpassede <c5/>; <c6/> forblir som scenarioet har det, fordi en logg bærer offsetten til sin referanse, ikke klokkens etter disiplinering. Hvit fasestøy tilpasses og rapporteres, men simuleres ikke. Resultatet får en blokk <c7/> (koeffisientene, tilpasningspunktene, verdiene kjøringen brukte, hva som ble utelatt, loggens SHA-256), og klokken får id-en <c8/>. Med <c9/> trekker ensemblet fra den tilpassede klokken (blokken <c10/> trenger <c11/>). En tilpasning uten frekvensstøy, en logg for kort til å tilpasses og en <c12/> som er noe annet enn <c13/> eller <c14/> er feil som sier det. <c15/> er et eksempel ({ "6" } timer av en IGS-satellittklokke).

seg-fe695061eed3 = Hva sammenligningen på kjent støy (<c1/>) viser, og hva man bør ha i bakhodet:

seg-90657795ba62 = Nådd: nivået for hvit FM gjenfinnes innenfor { "5" } % på hver syntetiske serie som har det; det tilpassede kortet gjengir det sanne Allan-avviket innenfor en faktor på { "1.35" } ved hver midlingstid det ble tilpasset ved; støyeksponenten tilpasningen identifiserer er lik den til allantools ved hvert punkt (på 5071A-serien, når fasespranget som kondisjoneringen fjerner også er fjernet fra inndataene til allantools).

seg-f1ec27a393ae = <b>Ikke nådd, og festet av testen:</b> random-walk FM gjenfinnes bare når den dominerer de lengste midlingstidene i serien, og selv da i én av tre poster av en serie på { "131 072" } s med et krysningspunkt ved { "3 000" } s, ga tilpasningen den til flicker FM og til driften. Skillet mellom random-walk FM og flicker FM er ikke pålitelig fra én post. Kjøringen gjengir loggens stabilitet over de midlingstidene loggen dekker; utover dem divergerer de to valgene (flicker FM er et konstant gulv, random-walk FM vokser som kvadratroten av midlingstiden).

seg-88ba5ae782d4 = MODELLED: et hva-hvis for den klokkens støy slik loggen viser den, ikke en kalibrering av klokken og ikke en prediksjon av dens fremtidige oppførsel.

seg-6e88b597bbf0 = En feilformet logg er en feil som navngir det som ble funnet (linjen, versjonen, den manglende velgeren), aldri et delvis resultat: <c1/> fester { "24" } slike tilfeller.

seg-4a05abb27420 = MODELLED. Dette er en parser, og utdataene mater estimatorer som er validert andre steder mot allantools. Enhetstestene i <c1/> bruker små håndskrevne logger, og for formatene linuxptp og chrony fiksene i <c2/>. <c3/> kjører sammenligningen som er forhåndsregistrert i <c4/>: tre seedede syntetiske logger, én per format, lest tilbake av en uavhengig leser skrevet ut fra denne siden av den samme forfatteren, med ADEV, TDEV og MTIE kontrollert mot allantools { "2024.6" }; den sammenligningen dekker bare de tre første formatene, og leserne for linuxptp og chrony har parsertester, men ingen sammenligning mot en uavhengig referanse. Loggene i den sammenligningen er syntetiske, så ingenting der beskriver en ekte klokke eller teller; sammenligningen på målte serier er beskrevet nedenfor.

seg-576211abf0b4 = På målte data

seg-3c8d10e8bd1c = <c1/> kjører sammenligningen som er forhåndsregistrert i <c2/> (innsjekket før noen fixtur eller kjøring) på fire målte serier: Stable32-filen <c3/>, de første { "65 536" } avlesningene av en 5071A-cesiumklokke mot et hydrogenmaser, og klokkene til IGS-satellitt G01 ({ "30" } s) og stasjon ABMF ({ "300" } s) fra den endelige IGS-klokkefilen for 2026-08-02, som et medfølgende utsnitt med sin NOTICE. De to første har ingen tillatelse til videredistribusjon: loggene skrevet fra dem ligger i den git-ignorerte <c4/> (<c5/>), og testen sier det og består når de mangler med mindre <c6/>. Hver logg leses av motoren og av en uavhengig leser, og ADEV, TDEV og MTIE sammenlignes med allantools { "2024.6" }. Registrert i <c7/>: på den leverte leseren feilet TICC-loggene, headerversjonen og fem feilmeldinger de forhåndsregistrerte tersklene; de ble rettet og sammenligningen kjørt på nytt uendret. Nådd, bortsett fra ett par: MTIE for en frekvenslogg avviker fra den til allantools, fordi allantools integrerer frekvensen minus middelverdien (festet som NOT MET; sammenligningen på like vilkår er nådd). Raden forblir MODELLED: TICC-loggene er målte klokkedata kodet om til tellerens layout av vårt skript (ingen virkelig TICC-opptak ble funnet), og referanseleseren har samme forfatter som motorens.

seg-52778d17f4db = Å drive holdoveren med din egen klokke: [clock_fit]
