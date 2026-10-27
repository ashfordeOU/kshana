# docs--trust-telemetry: translations (nb)

seg-2247a2344710 = Betydning

seg-d4e48c972084 = Etiketter

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Type

seg-2672b7f55371 = degradert

seg-c711c7fecbfc = Ett tillitsresultat i tre eksportformater, fra ekte kjøringer av motor v{ $version } (`kshana trust-telemetry`) på examples/maritime-trust: Prometheus-tekstvisning (den siste tillitsscoren er { "5.9" } og det ikke-betrodde båndet er det som er satt), og de siste CEF- og LEEF-meldingene. Kommandoen publiserer ingenting med mindre den får en destinasjon, holder ingen legitimasjon og sender ikke noe radiosignal. Veiledende programvare, ikke typegodkjent navigasjonsutstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsatt ansvarlig for fartøyets navigasjon.

seg-15fcf05d16c5 = Kilde: <c1/>

seg-05919ac6cf31 = GNSS-tillit som sikkerhetstelemetri

seg-8978c6508ebd = <c1/> gjør om tillitsstrømmen per epoke for GNSS (score 0-100, bånd, årsaker) til signaler som en drifts- eller sikkerhetssentral allerede tar inn: Prometheus-metrikker, syslog-hendelser i CEF eller LEEF for et SIEM, og eventuelt OpenTelemetry. Den leser strømmen; den endrer aldri tillitsvurderingen og sender ikke noe annet enn telemetri.

seg-14ad6b7911d6 = Inndata er det levende JSON-lines-skjemaet v1.1 som er dokumentert i <c1/>. Leser: <c2/>; <c3/> (<c4/>, båndet); <c5/> (0-100 eller null); <c6/> (epokens tid som oppgitt); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> eller null); årsakene er monitorene i <c13/>, deretter eventuelle flere i <c14/>; fra skjema { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) og hver fradrags <c20/>. Andre nøkler ignoreres, siden skjemaet bare vokser ved at nøkler legges til på slutten. En linje som ikke lar seg tolke, telles i <c21/> og hoppes over; skårer utenfor 0-100 avvises, ikke avkortes, slik at en formatendring blir lagt merke til. Den eneste koden som kjenner dette formatet, er <c22/>.

seg-2c94f3717f82 = <c1/> serveres uten autentisering og bruker <c2/> som standard. Å binde til en annen adresse skriver ut en advarsel; sett det bak din egen tilgangskontroll. Endepunktet håndterer én tilkobling om gangen med en leitegrense på { "2" } s, så en inaktiv klient kan forsinke en innhenting med opptil så lenge; det er ment for én innhenter, ikke for det åpne nettet.

seg-7e66e43f15a8 = Home Assistant og NTP-apparater (MQTT)

seg-fbe56ff7f1ed = <c1/> skriver ut, og <c2/> publiserer, et JSON-tilstandsdokument og Home Assistant MQTT-oppdagelsesmeldinger. Oppdagelsen (beholdt, under <c3/>) lager tre entiteter: tillitsscore, tillitsbånd (med årsakene som attributter) og en <c4/>-problemsensor. Tilstandsdokumentet går til <c5/> (standard <c6/>, beholdt): <c7/>, <c8/> (null så lenge det ikke finnes noen), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> og den veiledende erklæringen; posisjonen tas aldri med. Alternativer: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = Utgiveren snakker MQTT { "3.1.1" } med QoS { "0" } og leser bare meglerens CONNACK. Den har ingen legitimasjon og ingen TLS, så bruk en megler på det lokale nettverket (eller et lokalt relé som legger dem til). Leveringen kjører på sin egen tråd bak en kø på { "1024" }: en død megler gjør at meldinger forkastes, telles og rapporteres på slutten, og stanser aldri strømmen. Et NTP-apparat eller en annen forbruker som vil ha ren JSON, kan lese den samme tilstandslinjen. Ingenting skrives til en mottaker eller en klokke. Python, WebAssembly og MCP tar <c1/> og returnerer de samme <c2/>-linjene (ingenting publiseres der).

seg-ed95ebb0ba1b = Fra Python, WebAssembly og MCP

seg-93be007cdfda = Koderne er også tilgjengelige som kall med tekst inn og tekst ut, uten prosess, socket eller klokke: Python <c1/>, WebAssembly-eksporten <c2/> og MCP-verktøyet <c3/> (plugin-kommando <c4/>). <c5/> er <c6/>, <c7/>, <c8/> eller <c9/>; <c10/> er <c11/> (strømmen) eller <c12/> (et batchresultat). De returnerer den samme teksten kommandolinjen skriver ut (<c13/>, <c14/>), med de samme grensene: syslog-linjer har ingen tidsstempel, <c15/> er høyst { "255" } skrivbare ASCII-tegn uten mellomrom (avvises ellers, her og på kommandolinjen), og et svar som er større enn flatens grense ({ "4" } MiB på MCP) avvises, fordi CEF og LEEF med <c16/> skriver én hendelse per epoke. Ingenting sendes, serveres eller skrives; de kjørende eksportørene forblir en prosess på kommandolinjen.

seg-f8c367611a9e = Levering stanser aldri vurderingen

seg-3853bb63c7ad = Syslog- og OpenTelemetry-levering kjører på egne tråder. Inntakssløyfen gir dem bare en melding eller et øyeblikksbilde og venter aldri, så en død, treg eller ikke-lesende innsamler kan ikke lage mottrykk på den levende strømmen eller fryse <c1/>:

seg-589d02c31dfe = hver tilkobling og skriving har en grense på { "2" } s; en mislykket tilkobling droppes og kobles opp igjen ved behov, med eksponentiell tilbakeholdelse fra { "1" } s opptil { "60" } s;

seg-3c272ded25a3 = en melding som ikke kan leveres (innsamler nede, skriving fikk tidsavbrudd, køen på { "1024" } full) forkastes og telles i <c1/>; varsle på raten;

seg-4a7cd2065731 = OpenTelemetry-eksportøren får en kopi av registeret, så ingen lås holdes under nettverks-I/O; hvis en eksport fortsatt pågår, hoppes det nye øyeblikksbildet over (det neste har de samme kumulative summene).

seg-57c3bbe405c8 = Ved slutten av inndata får sendertrådene den gjenværende tiden til å bli ferdige.

seg-14c13ed8c509 = Prometheus-metrikker

seg-d060b2163513 = Metrikk

seg-45c41bf74eb8 = måler

seg-e43a6814d13c = konstant { "1" }

seg-3662d2b8a789 = siste score 0-100; mangler hvis kilden ikke gir noen

seg-1c50874472fc = { "1" } for det gjeldende båndet, { "0" } for de andre

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } for den gjeldende tilstanden, { "0" } for de andre; mangler uten gate

seg-3e01cab63c59 = posisjon rapportert av mottakeren; <b>bare med <c1/></b> (endepunktet er uautentisert, og en posisjon kan identifisere et sted eller et fartøy)

seg-280a5ca2e5d9 = { "1" } hvis til stede ved siste epoke

seg-22ded4fe7f29 = teller

seg-800b23c30e2f = mottatte epoker

seg-be11849d8a9b = epoker der årsaken var til stede

seg-0475fe7b26ba = inndatalinjer som ikke lar seg tolke

seg-65f1db183cbc = årsaksforekomster samlet i <c1/> (se nedenfor)

seg-e756633e7d5c = syslog-hendelser som ikke er levert

seg-2de3258f83ee = siste epokes forskyvning fra strømstart

seg-c02fe207663e = mottakstidspunkt etter veggklokke; varsle på alderen

seg-67d5bbbde75a = satellittgeometri ved siste epoke, <c1/>, <c2/>, <c3/>: { "1" } for den gjeldende <em>(inndata med skjema { "1.3" })</em>

seg-4878afc243e3 = { "1" } degraded, { "0" } good; mangler når geometrien er ukjent

seg-c21f54522128 = { "1" } når satellitter i sikte ikke spores mens geometrien deres er god (signalet gikk tapt, ikke himmelen; <c1/> viser fortsatt { "1" }), ellers { "0" }; mangler når geometrien er ukjent eller inndataene ikke sier noe

seg-db29584bb51c = HDOP, PDOP og brukte satellitter ved siste epoke; hver mangler når ingen finnes

seg-c60ca4530e92 = epoker etter geometristatus

seg-fd6bf7764eca = geometrietikett ved siste epoke, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } for den gjeldende; skåres aldri (skåren trekker bare for <c5/>); fra inndata som har etiketten ({ "0.36" })

seg-d6f04ef7adfb = VDOP ved siste epoke; mangler når ingen finnes

seg-cb8feee01192 = <b>Geometrietiketten er hovedsaken.</b> Lag graf og varsler på <c1/> (OTLP <c2/>, CEF det tredje <c3/>-feltet, LEEF <c4/>): <c5/> er den eneste etiketten skåren trekker for. Geometristatusen er beskrivende: <c6/> omfatter det informative tilfellet <c7/>, som kan komme med god eller middels DOP, så ikke send sentralt varsel bare på <c8/>.

seg-70343708da03 = Fra inndata med skjema { "1.3" } har <c1/> også en <c2/>-etikett (<c3/>, <c4/>, <c5/>) på hver årsak som kom med en: fradragets klasse ved siste epoke. Geometriseriene kommer etter alle de andre, og bare når en inndataepoke har <c6/> (levende skjema { "1.3" }, et resultat fra motor { "0.36" } eller senere), så en strøm eller et resultat fra { "0.35" } gjengis byte for byte som før. Etikettverdiene er faste mengder (en ukjent status leses som <c7/>; en ukjent klasse forkastes). Varsle på <c8/> i stedet for på båndet alene, slik at en dårlig himmel ikke utløser varsel som om det var et angrep; en <c9/>-klasse er en erklæring om himmelen, ikke en konklusjon om at ingen angrep fant sted (se <c10/>).

seg-3f45b21003d5 = Etiketten <c1/> er en del av en series identitet: når en årsaks klasse endres mellom epoker (<c2/> fra <c3/> til <c4/> når de tapte satellittene sto lavt, eller <c5/> til <c6/> når oppgitt HDOP er uenig med oppgitt himmel), eksporteres den gamle serien ikke lenger og en ny starter. Spør etter <c7/> med <c8/> når klassen ikke spiller noen rolle, og regn med at en slik overgang ser ut som at én serie slutter og en annen begynner. Serien for skjema { "1.3" }, etiketten <c9/> og CEF/LEEF-geometrifeltene kontrolleres av motorens egne tester og av CEF-referansene (pycef, Logstash); de eksterne Prometheus- og OTLP-referansene har ingen strøm for { "1.3" } ennå.

seg-17ca55cea260 = Årsaksnavn kuttes til { "128" } tegn, og høyst { "64" } ulike årsaker får sin egen serie; senere telles under <c1/> og i <c2/>, slik at en fiendtlig eller feilaktig inndata ikke kan skape ubegrenset etikettkardinalitet.

seg-35f3faf39d1c = <c1/> er én av <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Årsaksnavn er strømmens monitornavn (<c7/>, <c8/>, ...; for batchresultatet <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = Et eksempeldashbord finnes i <c1/> (importer det og velg din Prometheus-datakilde).

seg-208f33eda580 = Syslog: CEF og LEEF

seg-0d53db66a990 = Hendelser sendes i en RFC { "5424" }-konvolutt (facility local0, app <c1/>, meldings-id <c2/>) over UDP (ett datagram hver; IPv4 eller IPv6) eller TCP, avsluttet med linjeskift som standard eller, med <c3/>, innrammet <c4/> som i RFC { "6587" }. Som standard sendes én hendelse per båndendring; <c5/> sender én per epoke. Leverandøren skrives <c6/> (ASCII) slik at ingen SIEM dekoder den feil.

seg-9cb6e1b9fec0 = Begrep

seg-9e4ce52ac5d9 = Syslog-alvorlighet

seg-084d2e726d3f = CEF-alvorlighet

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = calibrating

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } warning

seg-f757a767bd4a = untrusted

seg-8e4e2d9142f9 = { "2" } critical

seg-4c5b832482cb = unknown

seg-5e4f3b0222cd = { "5" } notice

seg-b07ec4ccabf7 = Feltkartlegging (hendelses-id er <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (skilletegn <c1/>)

seg-18a4ca402cd9 = kategori

seg-d3bc36a445cb = sendende vert

seg-521cea5013c8 = bånd

seg-2b9153eb068d = <c1/> (etikett <c2/>)

seg-f1be6ef87011 = årsaker, kommaseparert

seg-e77a9847bc7b = forrige bånd

seg-87b7f1652b0c = score

seg-470a89a86d79 = <c1/> (<c2/>), utelatt hvis ingen

seg-fc2aebb988bf = epokeforskyvning, s

seg-9f9d0d551742 = etikett for logg-tid

seg-57ed10b00272 = gate-tilstand

seg-7159f151c079 = geometristatus, deretter <c1/> og klassene til epokens fradrag, kommaseparert (for eksempel <c2/>) <em>(inndata med { "1.3" })</em>; fra inndata som har etiketten ({ "0.36" }) et tredje felt, <c3/> og etiketten, der klassefeltet da alltid er til stede (for eksempel <c4/>, <c5/>)

seg-973339622a60 = <c1/> (bare status), <c2/> (klasser) og <c3/> (etikett)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, med etiketten)

seg-e0a712018ced = VDOP <em>({ "0.36" }, med etiketten)</em>

seg-42273c09a591 = ikke med: de fire egendefinerte flyttallsfeltene er tatt

seg-292efe9557d6 = brukte satellitter <em>({ "0.36" }, med etiketten)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), et heltall

seg-f69551c20173 = signaltap: satellitter i sikte som ikke spores mens geometrien deres er god

seg-bb927aab7541 = ikke med som felt (ingen CEF-ordboknøkkel er ledig til det): statusen leses som <c1/> og geometrifradragets klasse som <c2/> i <c3/>

seg-6a80d53b2163 = <c1/>, bare mens det gjelder

seg-1f099d4ef4b6 = I CEF bruker geometrien bare egendefinerte ordbokfelt (ingen oppfunnede nøkler); etiketten ligger i <c1/> i stedet for <c2/> fordi Logstash CEF-kodeken ikke tilordner <c3/>-feltene. Geometrihendelsene for { "1.3" }, etikettilfellene inkludert, er en del av CEF-raden som er VALIDATED: begge referanseparserne leser dem tilbake som skrevet (<c4/>, endringene { "4" } og { "5" }, hver registrert før noen av parserne ble kjørt på tilfellene sine). Feltene for etikett, VDOP og antall satellitter legges til etter alle tidligere felt og serier, og bare for inndata som har etiketten, så en inndata uten en gjengis nøyaktig som før.

seg-b295bf5bac3e = Tomme felt utelates (ingen <c1/> uten årsaker). Vertsnavnet kuttes til { "255" } tegn. CEF-hodeverdier escaper <c2/> og <c3/>; utvidelsesverdier escaper <c4/>, <c5/> og linjeskift. I LEEF-verdier erstattes <c6/> og linjeskift med mellomrom.

seg-a3b77e9593eb = OpenTelemetry (av som standard)

seg-396c34d29783 = Bygg med <c1/> og oppgi <c2/>. Eksportøren poster OTLP/HTTP JSON (<c3/>, <c4/>, <c5/>, <c6/>, og for inndata med skjema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> og, fra inndata som har etiketten ({ "0.36" }), <c13/> (attributt <c14/>) og <c15/>; de kumulative summene har <c16/>) hver <c17/> epoke (standard { "10" }) og ved slutten av inndata. Den legger ikke til noen avhengighet og har ingen TLS: send til en innsamler på samme vert eller et pålitelig segment, som sender videre over TLS. Endepunkter med <c18/> avvises.

seg-c3111d73a8b0 = <s1>Forrige</s1>Himmelgeometri og horisontlinjer

seg-4c539b667a05 = <s1>Neste</s1>Galileo OSNMA-verifisering
