# docs--trust-telemetry: translations (da)

seg-2247a2344710 = Betydning

seg-d4e48c972084 = Labels

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Type

seg-2672b7f55371 = forringet

seg-c711c7fecbfc = Ét tillidsresultat i tre eksportformater, fra egentlige kørsler af motor v{ $version } (`kshana trust-telemetry`) på examples/maritime-trust: Prometheus-tekstvisning (den seneste tillidsscore er { "5.9" }, og det utroværdige bånd er det, der er sat), og de sidste CEF- og LEEF-meddelelser. Kommandoen udgiver intet, medmindre den får en destination, rummer ingen legitimationsoplysninger og udsender intet radiosignal. Vejledende software, ikke typegodkendt navigationsudstyr (IEC { "61108" }, IEC { "61162" }): operatøren er fortsat ansvarlig for fartøjets navigation.

seg-15fcf05d16c5 = Kilde: <c1/>

seg-05919ac6cf31 = GNSS-tillid som sikkerhedstelemetri

seg-8978c6508ebd = <c1/> omdanner strømmen af GNSS-tillid for hver epoke (score 0-100, bånd, årsager) til signaler, som et drifts- eller sikkerhedscenter allerede indlæser: Prometheus-metrikker, syslog-hændelser i CEF eller LEEF til et SIEM og eventuelt OpenTelemetry. Det læser strømmen; det ændrer aldrig tillidsvurderingen og sender intet andet end telemetri.

seg-14ad6b7911d6 = Input er live-JSON-linje-skemaet v1.1, dokumenteret i <c1/>. Læst: <c2/>; <c3/> (<c4/>, båndet); <c5/> (0-100 eller null); <c6/> (epokens tid som angivet); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/> eller null); årsager er monitorerne i <c13/>, derefter eventuelle yderligere i <c14/>; fra skema { "1.3" }, <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) og hvert fradrags <c20/>. Andre nøgler ignoreres, da skemaet kun vokser ved tilføjede nøgler. En linje, der ikke kan fortolkes, tælles i <c21/> og springes over; scorer uden for 0-100 afvises og afkortes ikke, så en formatændring bliver opdaget. Den eneste kode, der kender dette format, er <c22/>.

seg-2c94f3717f82 = <c1/> serveres uden autentificering og er som standard <c2/>. Binding andre steder udskriver en advarsel; sæt den bag din egen adgangskontrol. Endepunktet håndterer én forbindelse ad gangen med en læsegrænse på { "2" } s, så en inaktiv klient kan forsinke en indsamling med op til så lang tid; det er beregnet til én indsamler og ikke til det åbne netværk.

seg-7e66e43f15a8 = Home Assistant og NTP-appliances (MQTT)

seg-fbe56ff7f1ed = <c1/> udskriver, og <c2/> publicerer, et JSON-tilstandsdokument og Home Assistant MQTT-discovery-meddelelser. Discovery (bevaret, under <c3/>) opretter tre entiteter: tillidsscore, tillidsbånd (med årsagerne som attributter) og en problemsensor <c4/>. Tilstandsdokumentet går til <c5/> (standard <c6/>, bevaret): <c7/>, <c8/> (null, mens der ingen er), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> og den vejledende erklæring; positionen medtages aldrig. Indstillinger: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = Udgiveren taler MQTT { "3.1.1" } ved QoS { "0" } og læser kun mæglerens CONNACK. Den har ingen legitimationsoplysninger og ingen TLS, så brug en mægler på det lokale netværk (eller et lokalt relæ, der tilføjer dem). Leveringen kører på sin egen tråd bag en kø på { "1024" }: en død mægler taber meddelelser, som tælles og rapporteres til sidst, og standser aldrig strømmen. En NTP-appliance eller enhver anden forbruger, der vil have almindelig JSON, kan læse den samme tilstandslinje. Intet skrives til en modtager eller et ur. Python, WebAssembly og MCP tager <c1/> og returnerer de samme <c2/>-linjer (intet publiceres dér).

seg-ed95ebb0ba1b = Fra Python, WebAssembly og MCP

seg-93be007cdfda = Indkoderne findes også som kald med tekst ind og tekst ud uden proces, socket eller ur: Python <c1/>, WebAssembly-eksporten <c2/> og MCP-værktøjet <c3/> (plugin-kommando <c4/>). <c5/> er <c6/>, <c7/>, <c8/> eller <c9/>; <c10/> er <c11/> (strømmen) eller <c12/> (et batchresultat). De returnerer den samme tekst, som kommandolinjen udskriver (<c13/>, <c14/>), med de samme grænser: syslog-linjer bærer intet tidsstempel, <c15/> er højst { "255" } printbare ASCII-tegn uden mellemrum (ellers afvist, her og på kommandolinjen), og et svar, der er større end overfladens grænse ({ "4" } MiB på MCP), afvises, fordi CEF og LEEF med <c16/> skriver én hændelse pr. epoke. Intet sendes, serveres eller skrives; de kørende eksportører forbliver en proces på kommandolinjen.

seg-f8c367611a9e = Levering standser aldrig vurderingen

seg-3853bb63c7ad = Levering af syslog og OpenTelemetry kører på deres egne tråde. Indlæsningsløkken afleverer kun en meddelelse eller et øjebliksbillede til dem og venter aldrig, så en død, langsom eller ikke-læsende samler ikke kan lægge modtryk på live-strømmen eller fryse <c1/>:

seg-589d02c31dfe = hver forbindelse og hver skrivning har en grænse på { "2" } s; en mislykket forbindelse droppes og genoprettes dovent, med eksponentiel backoff fra { "1" } s op til { "60" } s;

seg-3c272ded25a3 = en meddelelse, der ikke kan leveres (samler nede, skrivning fik timeout, kø på { "1024" } fuld), droppes og tælles i <c1/>; alarmér på dens rate;

seg-4a7cd2065731 = OpenTelemetry-eksportøren får en kopi af registret, så der ikke holdes nogen lås under netværks-I/O; hvis en eksport stadig er undervejs, springes det nye øjebliksbillede over (det næste bærer de samme kumulative totaler).

seg-57c3bbe405c8 = Ved slutningen af inputtet får afsendertrådene deres resterende tidsgrænser til at blive færdige.

seg-14c13ed8c509 = Prometheus-metrikker

seg-d060b2163513 = Metrik

seg-45c41bf74eb8 = gauge

seg-e43a6814d13c = konstant { "1" }

seg-3662d2b8a789 = seneste score 0-100; fraværende, hvis kilden ikke giver nogen

seg-1c50874472fc = { "1" } for det nuværende bånd, { "0" } for de andre

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } for den nuværende tilstand, { "0" } for de andre; fraværende uden en gate

seg-3e01cab63c59 = modtagerrapporteret position; <b>kun med <c1/></b> (endepunktet er uden autentificering, og en position kan identificere et sted eller et fartøj)

seg-280a5ca2e5d9 = { "1" }, hvis til stede ved den seneste epoke

seg-22ded4fe7f29 = counter

seg-800b23c30e2f = modtagne epoker

seg-be11849d8a9b = epoker, hvor årsagen var til stede

seg-0475fe7b26ba = inputlinjer, der ikke kan fortolkes

seg-65f1db183cbc = forekomster af årsager, der er foldet ind i <c1/> (se nedenfor)

seg-e756633e7d5c = syslog-hændelser, der ikke er leveret

seg-2de3258f83ee = seneste epokes forskydning fra strømmens start

seg-c02fe207663e = modtagelsestid på vægur; alarmér på dens alder

seg-67d5bbbde75a = satellitgeometri ved den seneste epoke, <c1/>, <c2/>, <c3/>: { "1" } for den nuværende <em>(input i skema { "1.3" })</em>

seg-4878afc243e3 = { "1" } degraded, { "0" } good; fraværende, når geometrien er ukendt

seg-c21f54522128 = { "1" }, når satellitter i sigte ikke spores, mens deres geometri er god (signalet var tabt, ikke himlen; <c1/> viser stadig { "1" }), ellers { "0" }; fraværende, når geometrien er ukendt, eller inputtet ikke angiver det

seg-db29584bb51c = HDOP, PDOP og anvendte satellitter ved den seneste epoke; hver fraværende, når der ingen er

seg-c60ca4530e92 = epoker efter geometristatus

seg-fd6bf7764eca = geometrietiket ved den seneste epoke, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } for den nuværende; scores aldrig (scoren trækker kun for <c5/>); fra input, der bærer etiketten ({ "0.36" })

seg-d6f04ef7adfb = VDOP ved den seneste epoke; fraværende, når der ingen er

seg-cb8feee01192 = <b>Geometrietiketten er hovedpunktet.</b> Tegn grafer og alarmér på <c1/> (OTLP <c2/>, CEF det tredje <c3/>-felt, LEEF <c4/>): <c5/> er den eneste etiket, scoren trækker for. Geometristatussen er beskrivende: <c6/> omfatter det informative tilfælde <c7/>, som kan komme med god eller rimelig DOP, så alarmér ikke alene på <c8/>.

seg-70343708da03 = Fra input i skema { "1.3" } bærer <c1/> også en <c2/>-etiket (<c3/>, <c4/>, <c5/>) på hver årsag, der kom med en: fradragets klasse ved den seneste epoke. Geometriserierne kommer efter alle de andre og først når en inputepoke bærer <c6/> (live-skema { "1.3" }, et resultat fra motor { "0.36" } eller nyere), så en strøm eller et resultat fra { "0.35" } gengives byte for byte som før. Etiketværdier er faste mængder (en ukendt status viser <c7/>; en ukendt klasse droppes). Alarmér på <c8/> frem for alene på båndet, så en dårlig himmel ikke giver alarm som et angreb; en <c9/>-klasse er en udtalelse om himlen og ikke en konstatering af, at intet angreb fandt sted (se <c10/>).

seg-3f45b21003d5 = Etiketten <c1/> er en del af en series identitet: når en årsags klasse ændres mellem epoker (<c2/> fra <c3/> til <c4/>, når de tabte satellitter stod lavt, eller <c5/> til <c6/>, når den angivne HDOP er uenig med den angivne himmel), eksporteres den gamle serie ikke længere, og en ny starter. Forespørg efter <c7/> med <c8/>, når klassen ikke betyder noget, og forvent, at et sådant skifte ser ud som én serie, der slutter, og en anden, der begynder. Serierne i skema { "1.3" }, etiketten <c9/> og CEF/LEEF-geometrifelterne kontrolleres af motorens egne tests og af CEF-referencerne (pycef, Logstash); de eksterne Prometheus- og OTLP-referencer har endnu ingen { "1.3" }-strøm.

seg-17ca55cea260 = Årsagsnavne afkortes til { "128" } tegn, og højst { "64" } forskellige årsager får deres egen serie; senere tælles under <c1/> og i <c2/>, så et fjendtligt eller fejlbehæftet input ikke kan skabe ubegrænset etiketkardinalitet.

seg-35f3faf39d1c = <c1/> er en af <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Årsagsnavne er strømmens monitornavne (<c7/>, <c8/>, ...; for batchresultatet <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = Et eksempel på et dashboard findes i <c1/> (importér det, og vælg din Prometheus-datakilde).

seg-208f33eda580 = Syslog: CEF og LEEF

seg-0d53db66a990 = Hændelser sendes i en RFC { "5424" }-kuvert (facility local0, app <c1/>, meddelelses-id <c2/>) over UDP (ét datagram hver; IPv4 eller IPv6) eller TCP, som standard afsluttet med linjeskift eller, med <c3/>, indrammet <c4/> som i RFC { "6587" }. Som standard sendes én hændelse pr. båndskift; <c5/> sender én pr. epoke. Leverandøren skrives <c6/> (ASCII), så intet SIEM afkoder den forkert.

seg-9cb6e1b9fec0 = Begreb

seg-9e4ce52ac5d9 = Syslog-alvorlighed

seg-084d2e726d3f = CEF-alvorlighed

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = calibrating

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } warning

seg-f757a767bd4a = untrusted

seg-8e4e2d9142f9 = { "2" } critical

seg-4c5b832482cb = unknown

seg-5e4f3b0222cd = { "5" } notice

seg-b07ec4ccabf7 = Feltafbildning (hændelses-id er <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (skilletegn <c1/>)

seg-18a4ca402cd9 = kategori

seg-d3bc36a445cb = afsendende vært

seg-521cea5013c8 = bånd

seg-2b9153eb068d = <c1/> (etiket <c2/>)

seg-f1be6ef87011 = årsager, adskilt med komma

seg-e77a9847bc7b = forrige bånd

seg-87b7f1652b0c = score

seg-470a89a86d79 = <c1/> (<c2/>), udeladt, hvis ingen

seg-fc2aebb988bf = epokens forskydning, s

seg-9f9d0d551742 = etiket for logtid

seg-57ed10b00272 = gate-tilstand

seg-7159f151c079 = geometristatus, derefter <c1/> og klasserne for epokens fradrag, adskilt med komma (for eksempel <c2/>) <em>(input i { "1.3" })</em>; fra input, der bærer etiketten ({ "0.36" }), et tredje felt, <c3/> og etiketten, hvor klassefeltet så altid er til stede (for eksempel <c4/>, <c5/>)

seg-973339622a60 = <c1/> (kun status), <c2/> (klasser) og <c3/> (etiket)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, med etiketten)

seg-e0a712018ced = VDOP <em>({ "0.36" }, med etiketten)</em>

seg-42273c09a591 = medtages ikke: de fire brugerdefinerede flydendetalsfelter er optaget

seg-292efe9557d6 = anvendte satellitter <em>({ "0.36" }, med etiketten)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), et heltal

seg-f69551c20173 = signaltab: satellitter i sigte, der ikke spores, mens deres geometri er god

seg-bb927aab7541 = medtages ikke som felt (ingen CEF-ordbogsnøgle er ledig til det): statussen viser <c1/> og geometrifradragets klasse <c2/> i <c3/>

seg-6a80d53b2163 = <c1/>, kun mens det gælder

seg-1f099d4ef4b6 = I CEF bruger geometrien kun brugerdefinerede felter fra ordbogen (ingen opfundne nøgler); etiketten sendes i <c1/> og ikke i <c2/>, fordi Logstash-CEF-codec'en ikke afbilder felterne <c3/>. Geometrihændelserne i { "1.3" }, etiketsagerne medregnet, er en del af den VALIDATED CEF-række: begge referenceparsere læser dem tilbage, som de er skrevet (<c4/>, tillæg { "4" } og { "5" }, hvert registreret, før nogen af parserne blev kørt på dets sager). Etiket-, VDOP- og satellittalsfelterne føjes til efter hvert tidligere felt og hver tidligere serie, og kun for input, der bærer etiketten, så et input uden en gengives præcis som før.

seg-b295bf5bac3e = Tomme felter udelades (intet <c1/> uden årsager). Værtsnavnet afkortes til { "255" } tegn. CEF-headerværdier escaper <c2/> og <c3/>; extension-værdier escaper <c4/>, <c5/> og linjeskift. I LEEF-værdier er <c6/> og linjeskift erstattet af mellemrum.

seg-a3b77e9593eb = OpenTelemetry (slået fra som standard)

seg-396c34d29783 = Byg med <c1/>, og angiv <c2/>. Eksportøren poster OTLP/HTTP-JSON (<c3/>, <c4/>, <c5/>, <c6/> og for input i skema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> og, fra input, der bærer etiketten ({ "0.36" }), <c13/> (attribut <c14/>) og <c15/>; de kumulative summer bærer <c16/>) hver <c17/> epoke (standard { "10" }) og ved slutningen af inputtet. Den tilføjer ingen afhængighed og har ingen TLS: send til en samler på samme vært eller et betroet segment, som videresender over TLS. Endepunkter med <c18/> afvises.

seg-c3111d73a8b0 = <s1>Forrige</s1>Himmelgeometri og horisontprofiler

seg-4c539b667a05 = <s1>Næste</s1>Galileo OSNMA-verifikation
