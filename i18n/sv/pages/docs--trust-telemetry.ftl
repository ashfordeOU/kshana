# docs--trust-telemetry: translations (sv)

seg-2247a2344710 = Betydelse

seg-d4e48c972084 = Etiketter

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Typ

seg-2672b7f55371 = försämrade

seg-c711c7fecbfc = Ett förtroenderesultat i tre exportformat, från verkliga körningar av motor v{ $version } (`kshana trust-telemetry`) på examples/maritime-trust: Prometheus-textexposition (det senaste förtroendepoängen är { "5.9" } och det ej betrodda bandet är det som är satt), och de sista CEF- och LEEF-meddelandena. Kommandot publicerar ingenting om det inte får en destination, har inga inloggningsuppgifter och sänder ingen radiosignal. Rådgivande programvara, inte typgodkänd navigationsutrustning (IEC { "61108" }, IEC { "61162" }): operatören är fortsatt ansvarig för fartygets navigering.

seg-15fcf05d16c5 = Källa: <c1/>

seg-05919ac6cf31 = GNSS-förtroende som säkerhetstelemetri

seg-8978c6508ebd = <c1/> omvandlar GNSS-förtroendeströmmen per epok (poäng 0-100, band, skäl) till signaler som ett drifts- eller säkerhetscenter redan tar emot: Prometheus-mätvärden, syslog-händelser i CEF eller LEEF för ett SIEM och eventuellt OpenTelemetry. Den läser strömmen; den ändrar aldrig förtroendebedömningen och sänder inget annat än telemetri.

seg-14ad6b7911d6 = Indata är live-JSON-radsschemat v1.1 som dokumenteras i <c1/>. Läser: <c2/>; <c3/> (<c4/>, bandet); <c5/> (0-100 eller null); <c6/> (epokens tid som den anges); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> eller null); skälen är monitorerna i <c13/>, därefter eventuella övriga i <c14/>; från schema { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) och varje avdrags <c20/>. Övriga nycklar ignoreras, eftersom schemat bara växer genom tillagda nycklar. En rad som inte kan tolkas räknas i <c21/> och hoppas över; poäng utanför 0-100 avvisas, inte kläms, så att en formatändring märks. Den enda kod som känner till det här formatet är <c22/>.

seg-2c94f3717f82 = <c1/> serveras utan autentisering och har <c2/> som standard. Att binda någon annanstans skriver ut en varning; lägg den bakom din egen åtkomstkontroll. Ändpunkten hanterar en anslutning åt gången med en läsgräns på { "2" } s, så en overksam klient kan fördröja en avläsning med upp till så lång tid; den är avsedd för en enda avläsare, inte för det öppna nätet.

seg-7e66e43f15a8 = Home Assistant och NTP-apparater (MQTT)

seg-fbe56ff7f1ed = <c1/> skriver ut, och <c2/> publicerar, ett JSON-tillståndsdokument och MQTT-upptäcktsmeddelanden för Home Assistant. Upptäckten (kvarhållen, under <c3/>) skapar tre entiteter: förtroendepoäng, förtroendeband (med skälen som attribut) och en problemsensor <c4/>. Tillståndsdokumentet går till <c5/> (standard <c6/>, kvarhållet): <c7/>, <c8/> (null medan det saknas), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> och den rådgivande uppgiften; positionen ingår aldrig. Alternativ: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = Publiceraren talar MQTT { "3.1.1" } med QoS { "0" } och läser bara mäklarens CONNACK. Den har inga inloggningsuppgifter och ingen TLS, så använd en mäklare på det lokala nätverket (eller ett lokalt relä som lägger till dem). Leveransen körs på en egen tråd bakom en kö på { "1024" }: en död mäklare tappar meddelanden, som räknas och rapporteras i slutet, och stannar aldrig strömmen. En NTP-apparat eller annan konsument som vill ha ren JSON kan läsa samma tillståndsrad. Ingenting skrivs till en mottagare eller en klocka. Python, WebAssembly och MCP tar <c1/> och returnerar samma <c2/>-rader (ingenting publiceras där).

seg-ed95ebb0ba1b = Från Python, WebAssembly och MCP

seg-93be007cdfda = Kodarna finns också som anrop med text in och text ut, utan process, socket eller klocka: Python <c1/>, WebAssembly-exporten <c2/> och MCP-verktyget <c3/> (plugin-kommando <c4/>). <c5/> är <c6/>, <c7/>, <c8/> eller <c9/>; <c10/> är <c11/> (strömmen) eller <c12/> (ett batchresultat). De returnerar samma text som kommandoraden skriver ut (<c13/>, <c14/>), med samma gränser: syslog-rader har ingen tidsstämpel, <c15/> är högst { "255" } utskrivbara ASCII-tecken utan mellanslag (avvisas annars, här och på kommandoraden), och ett svar som är större än ytans gräns ({ "4" } MiB för MCP) avvisas, eftersom CEF och LEEF med <c16/> skriver en händelse per epok. Ingenting skickas, serveras eller skrivs; de pågående exportörerna förblir en process på kommandoraden.

seg-f8c367611a9e = Leveransen stoppar aldrig bedömningen

seg-3853bb63c7ad = Leverans av syslog och OpenTelemetry körs på egna trådar. Inläsningsslingan lämnar bara över ett meddelande eller en ögonblicksbild till dem och väntar aldrig, så en död, långsam eller icke-läsande insamlare kan inte sätta press på live-strömmen eller frysa <c1/>:

seg-589d02c31dfe = varje anslutning och skrivning har en gräns på { "2" } s; en misslyckad anslutning släpps och återansluts lat, med exponentiell backoff från { "1" } s upp till { "60" } s;

seg-3c272ded25a3 = ett meddelande som inte kan levereras (insamlaren nere, skrivningen tog för lång tid, kön på { "1024" } full) tappas och räknas i <c1/>; larma på dess takt;

seg-4a7cd2065731 = OpenTelemetry-exportören får en kopia av registret, så inget lås hålls under nätverks-I/O; om en export fortfarande pågår hoppas den nya ögonblicksbilden över (nästa har samma kumulativa summor).

seg-57c3bbe405c8 = Vid slutet av indata får sändartrådarna sina återstående tidsgränser för att bli klara.

seg-14c13ed8c509 = Prometheus-mätvärden

seg-d060b2163513 = Mätvärde

seg-45c41bf74eb8 = gauge

seg-e43a6814d13c = konstant { "1" }

seg-3662d2b8a789 = senaste poäng 0-100; saknas om källan inte ger någon

seg-1c50874472fc = { "1" } för det aktuella bandet, { "0" } för de andra

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } för det aktuella tillståndet, { "0" } för de andra; saknas utan gate

seg-3e01cab63c59 = mottagarrapporterad position; <b>endast med <c1/></b> (ändpunkten är oautentiserad och en position kan identifiera en plats eller ett fartyg)

seg-280a5ca2e5d9 = { "1" } om närvarande vid senaste epoken

seg-22ded4fe7f29 = counter

seg-800b23c30e2f = mottagna epoker

seg-be11849d8a9b = epoker där skälet förekom

seg-0475fe7b26ba = indatarader som inte kan tolkas

seg-65f1db183cbc = förekomster av skäl som slagits ihop i <c1/> (se nedan)

seg-e756633e7d5c = syslog-händelser som inte levererats

seg-2de3258f83ee = senaste epokens offset från strömmens start

seg-c02fe207663e = mottagningstid enligt väggklocka; larma på dess ålder

seg-67d5bbbde75a = satellitgeometri vid senaste epoken, <c1/>, <c2/>, <c3/>: { "1" } för den aktuella <em>(indata enligt schema { "1.3" })</em>

seg-4878afc243e3 = { "1" } degraded, { "0" } good; saknas när geometrin är okänd

seg-c21f54522128 = { "1" } när satelliter i sikte inte spåras medan deras geometri är god (signalen förlorades, inte himlen; <c1/> visar fortfarande { "1" }), annars { "0" }; saknas när geometrin är okänd eller indata inte anger det

seg-db29584bb51c = HDOP, PDOP och använda satelliter vid senaste epoken; var och en saknas när ingen finns

seg-c60ca4530e92 = epoker per geometristatus

seg-fd6bf7764eca = geometrietikett vid senaste epoken, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } för den aktuella; poängsätts aldrig (poängen drar bara av för <c5/>); från indata som bär etiketten ({ "0.36" })

seg-d6f04ef7adfb = VDOP vid senaste epoken; saknas när ingen finns

seg-cb8feee01192 = <b>Geometrietiketten är huvudsignalen.</b> Rita och larma på <c1/> (OTLP <c2/>, CEF det tredje fältet <c3/>, LEEF <c4/>): <c5/> är den enda etikett som poängen drar av för. Geometristatusen är beskrivande: <c6/> omfattar det informativa fallet <c7/>, som kan förekomma med god eller skaplig DOP, så larma inte enbart på <c8/>.

seg-70343708da03 = Från indata enligt schema { "1.3" } bär <c1/> också en etikett <c2/> (<c3/>, <c4/>, <c5/>) på varje skäl som kom med en: avdragets klass vid senaste epoken. Geometriserierna kommer efter alla andra och först när en indataepok bär <c6/> (live-schema { "1.3" }, ett resultat från motor { "0.36" } eller senare), så en ström eller ett resultat från { "0.35" } återges byte för byte som förut. Etikettvärden är fasta mängder (en okänd status läses <c7/>; en okänd klass släpps). Larma på <c8/> i stället för på bandet ensamt, så att en dålig himmel inte larmar som en attack; en klass <c9/> är ett uttalande om himlen, inte ett fastställande att ingen attack inträffade (se <c10/>).

seg-3f45b21003d5 = Etiketten <c1/> är en del av en series identitet: när ett skäls klass ändras mellan epoker (<c2/> från <c3/> till <c4/> när de förlorade satelliterna stod lågt, eller <c5/> till <c6/> när den angivna HDOP inte stämmer med den angivna himlen) exporteras den gamla serien inte längre och en ny börjar. Fråga efter <c7/> med <c8/> när klassen inte spelar roll, och räkna med att ett sådant byte ser ut som att en serie slutar och en annan börjar. Serierna enligt schema { "1.3" }, etiketten <c9/> och CEF/LEEF-geometrifälten kontrolleras av motorns egna tester och av CEF-referenserna (pycef, Logstash); de externa Prometheus- och OTLP-referenserna har ännu ingen ström enligt { "1.3" }.

seg-17ca55cea260 = Skälnamn kapas vid { "128" } tecken, och högst { "64" } skilda skäl får egna serier; senare räknas under <c1/> och i <c2/>, så att en fientlig eller felaktig indata inte kan skapa obegränsad etikettkardinalitet.

seg-35f3faf39d1c = <c1/> är en av <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Skälnamnen är strömmens monitornamn (<c7/>, <c8/>, ...; för batchresultatet <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = En exempelinstrumentpanel finns i <c1/> (importera den och välj din Prometheus-datakälla).

seg-208f33eda580 = Syslog: CEF och LEEF

seg-0d53db66a990 = Händelser skickas i ett RFC { "5424" }-kuvert (facility local0, app <c1/>, meddelande-id <c2/>) över UDP (ett datagram vardera; IPv4 eller IPv6) eller TCP, som standard avslutade med radbrytning eller, med <c3/>, inramade som <c4/> enligt RFC { "6587" }. Som standard skickas en händelse per bandbyte; <c5/> skickar en per epok. Tillverkaren skrivs <c6/> (ASCII) så att inget SIEM avkodar den fel.

seg-9cb6e1b9fec0 = Begrepp

seg-9e4ce52ac5d9 = Syslog-allvarlighet

seg-084d2e726d3f = CEF-allvarlighet

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = calibrating

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } warning

seg-f757a767bd4a = untrusted

seg-8e4e2d9142f9 = { "2" } critical

seg-4c5b832482cb = unknown

seg-5e4f3b0222cd = { "5" } notice

seg-b07ec4ccabf7 = Fältmappning (händelse-id är <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (avgränsare <c1/>)

seg-18a4ca402cd9 = kategori

seg-d3bc36a445cb = skickande värd

seg-521cea5013c8 = band

seg-2b9153eb068d = <c1/> (etikett <c2/>)

seg-f1be6ef87011 = skäl, kommaseparerade

seg-e77a9847bc7b = föregående band

seg-87b7f1652b0c = poäng

seg-470a89a86d79 = <c1/> (<c2/>), utelämnas om ingen finns

seg-fc2aebb988bf = epokens offset, s

seg-9f9d0d551742 = loggtidsetikett

seg-57ed10b00272 = gate-tillstånd

seg-7159f151c079 = geometristatus, därefter <c1/> och klasserna för epokens avdrag, kommaseparerade (till exempel <c2/>) <em>(indata enligt { "1.3" })</em>; från indata som bär etiketten ({ "0.36" }) ett tredje fält, <c3/> och etiketten, där klassfältet då alltid finns (till exempel <c4/>, <c5/>)

seg-973339622a60 = <c1/> (endast status), <c2/> (klasser) och <c3/> (etikett)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, med etiketten)

seg-e0a712018ced = VDOP <em>({ "0.36" }, med etiketten)</em>

seg-42273c09a591 = bärs inte: de fyra anpassade flyttalsfälten är upptagna

seg-292efe9557d6 = använda satelliter <em>({ "0.36" }, med etiketten)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), ett heltal

seg-f69551c20173 = signalförlust: satelliter i sikte som inte spåras medan deras geometri är god

seg-bb927aab7541 = bärs inte som ett fält (ingen CEF-ordboksnyckel är ledig för det): statusen läses <c1/> och geometriavdragets klass <c2/> i <c3/>

seg-6a80d53b2163 = <c1/>, endast medan det gäller

seg-1f099d4ef4b6 = I CEF använder geometrin bara anpassade fält ur ordboken (inga påhittade nycklar); etiketten färdas i <c1/> snarare än <c2/> eftersom Logstash CEF-kodek inte mappar fälten <c3/>. Geometrihändelserna enligt { "1.3" }, etikettfallen inräknade, ingår i den VALIDATED CEF-raden: båda referensparserna läser tillbaka dem som skrivna (<c4/>, ändringarna { "4" } och { "5" }, vardera registrerad innan någon av parserna kördes på dess fall). Fälten för etikett, VDOP och antal satelliter läggs till efter alla tidigare fält och serier, och bara för indata som bär etiketten, så indata utan en återges exakt som förut.

seg-b295bf5bac3e = Tomma fält utelämnas (ingen <c1/> utan skäl). Värdnamnet kapas vid { "255" } tecken. Rubrikvärden i CEF escapar <c2/> och <c3/>; tilläggsvärden escapar <c4/>, <c5/> och radbrytningar. I LEEF-värden ersätts <c6/> och radbrytningar med mellanslag.

seg-a3b77e9593eb = OpenTelemetry (av som standard)

seg-396c34d29783 = Bygg med <c1/> och ange <c2/>. Exportören postar OTLP/HTTP-JSON (<c3/>, <c4/>, <c5/>, <c6/>, och för indata enligt schema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> samt, från indata som bär etiketten ({ "0.36" }), <c13/> (attribut <c14/>) och <c15/>; de kumulativa summorna bär <c16/>) var <c17/>:e epok (standard { "10" }) och vid slutet av indata. Den lägger inte till något beroende och har ingen TLS: skicka till en insamlare på samma värd eller ett betrott segment, som vidarebefordrar över TLS. Ändpunkter med <c18/> avvisas.

seg-c3111d73a8b0 = <s1>Föregående</s1>Himmelsgeometri och skylines

seg-4c539b667a05 = <s1>Nästa</s1>Galileo OSNMA-verifiering
