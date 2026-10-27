# docs--trust-telemetry: translations (nl)

seg-2247a2344710 = Betekenis

seg-d4e48c972084 = Labels

seg-ca448daf5ec7 = nominal

seg-a129b9e613d0 = Type

seg-2672b7f55371 = verslechterd

seg-c711c7fecbfc = Eén vertrouwensresultaat in drie exportformaten, uit echte runs van engine v{ $version } (`kshana trust-telemetry`) op examples/maritime-trust: Prometheus-tekstexpositie (de laatste vertrouwensscore is { "5.9" } en de niet-vertrouwde band is de ingestelde) en de laatste CEF- en LEEF-berichten. De opdracht publiceert niets tenzij een bestemming is opgegeven, bewaart geen inloggegevens en zendt geen radiosignaal uit. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.

seg-15fcf05d16c5 = Bron: <c1/>

seg-05919ac6cf31 = GNSS-vertrouwen als beveiligingstelemetrie

seg-8978c6508ebd = <c1/> zet de GNSS-vertrouwensstroom per epoch (score 0-100, band, redenen) om in signalen die een operations- of beveiligingscentrum al verwerkt: Prometheus-metrics, syslog-gebeurtenissen in CEF of LEEF voor een SIEM, en optioneel OpenTelemetry. Het leest de stroom; het wijzigt de vertrouwensbeoordeling nooit en zendt niets uit behalve telemetrie.

seg-14ad6b7911d6 = De invoer is het live JSON-lines-schema v1.1 dat is beschreven in <c1/>. Gelezen wordt: <c2/>; <c3/> (<c4/>, de band); <c5/> (0-100 of null); <c6/> (de tijd van de epoch zoals opgegeven); <c7/> (<c8/>); <c9/> (<c10/>, <c11/>, <c12/>, of null); de redenen zijn de monitors in <c13/>, daarna eventuele verdere in <c14/>; vanaf schema { "1.3" } <c15/> (<c16/>, <c17/>, <c18/>, <c19/>) en de <c20/> van elke aftrek. Andere sleutels worden genegeerd, omdat het schema alleen groeit door toegevoegde sleutels. Een regel die niet kan worden geparseerd, wordt geteld in <c21/> en overgeslagen; scores buiten 0-100 worden afgewezen en niet afgekapt, zodat een formaatwijziging wordt opgemerkt. De enige code die dit formaat kent, is <c22/>.

seg-2c94f3717f82 = <c1/> wordt zonder authenticatie aangeboden en staat standaard op <c2/>. Binden aan een ander adres drukt een waarschuwing af; plaats het achter uw eigen toegangsbeheer. Het eindpunt verwerkt één verbinding tegelijk met een leeslimiet van { "2" } s, zodat een niet-actieve client een scrape tot zo lang kan vertragen; het is bedoeld voor één scraper, niet voor het open netwerk.

seg-7e66e43f15a8 = Home Assistant en NTP-apparaten (MQTT)

seg-fbe56ff7f1ed = <c1/> drukt een JSON-statusdocument en Home Assistant MQTT-discoveryberichten af, en <c2/> publiceert ze. Discovery (behouden, onder <c3/>) maakt drie entiteiten aan: vertrouwensscore, vertrouwensband (met de redenen als attributen) en een probleemsensor <c4/>. Het statusdocument gaat naar <c5/> (standaard <c6/>, behouden): <c7/>, <c8/> (null zolang er geen is), <c9/>, <c10/>, <c11/>, <c12/>, <c13/> en de adviserende verklaring; de positie wordt nooit opgenomen. Opties: <c14/>, <c15/>, <c16/>.

seg-252025356c0e = De publisher spreekt MQTT { "3.1.1" } met QoS { "0" } en leest alleen de CONNACK van de broker. Hij heeft geen inloggegevens en geen TLS, dus gebruik een broker op het lokale netwerk (of een lokaal relay dat die toevoegt). De aflevering draait op een eigen thread achter een wachtrij van { "1024" }: een niet-reagerende broker laat berichten vallen, die worden geteld en aan het eind gerapporteerd, en houdt de stroom nooit tegen. Een NTP-apparaat of elke andere afnemer die gewone JSON wil, kan dezelfde statusregel lezen. Er wordt niets naar een ontvanger of een klok geschreven. Python, WebAssembly en MCP accepteren <c1/> en geven dezelfde <c2/>-regels terug (daar wordt niets gepubliceerd).

seg-ed95ebb0ba1b = Vanuit Python, WebAssembly en MCP

seg-93be007cdfda = De encoders zijn ook beschikbaar als aanroepen met tekst erin en tekst eruit, zonder proces, socket of klok: Python <c1/>, de WebAssembly-export <c2/> en de MCP-tool <c3/> (pluginopdracht <c4/>). <c5/> is <c6/>, <c7/>, <c8/> of <c9/>; <c10/> is <c11/> (de stroom) of <c12/> (een batchresultaat). Ze geven dezelfde tekst terug als de opdrachtregel afdrukt (<c13/>, <c14/>), met dezelfde beperkingen: syslog-regels hebben geen tijdstempel, <c15/> bestaat uit hooguit { "255" } afdrukbare ASCII-tekens zonder spaties (anders geweigerd, hier en op de opdrachtregel), en een antwoord dat groter is dan de limiet van het oppervlak ({ "4" } MiB bij MCP) wordt geweigerd, omdat CEF en LEEF met <c16/> één gebeurtenis per epoch schrijven. Er wordt niets verzonden, aangeboden of geschreven; de draaiende exporters blijven een proces op de opdrachtregel.

seg-f8c367611a9e = Aflevering houdt de beoordeling nooit tegen

seg-3853bb63c7ad = Syslog- en OpenTelemetry-aflevering draaien op eigen threads. De invoerlus geeft hun alleen een bericht of een momentopname en wacht nooit, zodat een niet-reagerende, trage of niet-lezende collector de live stroom niet kan terugdrukken of <c1/> kan bevriezen:

seg-589d02c31dfe = voor elke verbinding en elke schrijfactie geldt een limiet van { "2" } s; een mislukte verbinding wordt verbroken en lui opnieuw opgezet, met exponentiële backoff van { "1" } s tot { "60" } s;

seg-3c272ded25a3 = een bericht dat niet kan worden afgeleverd (collector uit de lucht, schrijfactie verlopen, wachtrij van { "1024" } vol) wordt weggegooid en geteld in <c1/>; laat een alarm afgaan op de snelheid ervan;

seg-4a7cd2065731 = de OpenTelemetry-exporter krijgt een kopie van het register, zodat tijdens netwerk-I/O geen lock wordt vastgehouden; als een export nog loopt, wordt de nieuwe momentopname overgeslagen (de volgende bevat dezelfde cumulatieve totalen).

seg-57c3bbe405c8 = Aan het einde van de invoer krijgen de verzendthreads hun resterende tijdlimieten om af te ronden.

seg-14c13ed8c509 = Prometheus-metrics

seg-d060b2163513 = Metric

seg-45c41bf74eb8 = gauge

seg-e43a6814d13c = constant { "1" }

seg-3662d2b8a789 = laatste score 0-100; ontbreekt als de bron er geen geeft

seg-1c50874472fc = { "1" } voor de huidige band, { "0" } voor de andere

seg-843ba9d00f65 = <c1/>, <c2/>, <c3/>, <c4/>: { "1" } voor de huidige toestand, { "0" } voor de andere; ontbreekt zonder gate

seg-3e01cab63c59 = door de ontvanger gerapporteerde positie; <b>alleen met <c1/></b> (het eindpunt is niet geauthenticeerd en een positie kan een locatie of vaartuig identificeren)

seg-280a5ca2e5d9 = { "1" } als aanwezig bij de laatste epoch

seg-22ded4fe7f29 = counter

seg-800b23c30e2f = ontvangen epochs

seg-be11849d8a9b = epochs waarin de reden aanwezig was

seg-0475fe7b26ba = niet-parseerbare invoerregels

seg-65f1db183cbc = redenvoorvallen samengevoegd onder <c1/> (zie hieronder)

seg-e756633e7d5c = niet afgeleverde syslog-gebeurtenissen

seg-2de3258f83ee = offset van de laatste epoch ten opzichte van het begin van de stroom

seg-c02fe207663e = ontvangsttijd op de wandklok; laat een alarm afgaan op de leeftijd ervan

seg-67d5bbbde75a = satellietgeometrie bij de laatste epoch, <c1/>, <c2/>, <c3/>: { "1" } voor de huidige <em>(invoer met schema { "1.3" })</em>

seg-4878afc243e3 = { "1" } verslechterd, { "0" } goed; ontbreekt als de geometrie onbekend is

seg-c21f54522128 = { "1" } wanneer zichtbare satellieten niet worden gevolgd terwijl hun geometrie goed is (het signaal ging verloren, niet de hemel; <c1/> geeft nog steeds { "1" }), anders { "0" }; ontbreekt als de geometrie onbekend is of de invoer het niet vermeldt

seg-db29584bb51c = HDOP, PDOP en gebruikte satellieten bij de laatste epoch; elk ontbreekt als er geen is

seg-c60ca4530e92 = epochs per geometriestatus

seg-fd6bf7764eca = geometrielabel bij de laatste epoch, <c1/>, <c2/>, <c3/>, <c4/>: { "1" } voor het huidige; wordt nooit gescoord (de score trekt alleen af voor <c5/>); van invoer die het label meegeeft ({ "0.36" })

seg-d6f04ef7adfb = VDOP bij de laatste epoch; ontbreekt als er geen is

seg-cb8feee01192 = <b>Het geometrielabel is de hoofdzaak.</b> Maak grafieken en alarmen op <c1/> (OTLP <c2/>, CEF het derde veld <c3/>, LEEF <c4/>): <c5/> is het enige label waarvoor de score aftrekt. De geometriestatus is beschrijvend: <c6/> omvat het informatieve geval <c7/>, dat kan voorkomen bij goede of redelijke DOP, dus laat geen oproep afgaan op <c8/> alleen.

seg-70343708da03 = Bij invoer met schema { "1.3" } heeft <c1/> ook een label <c2/> (<c3/>, <c4/>, <c5/>) bij elke reden die er een meekreeg: de klasse van de aftrek bij de laatste epoch. De geometriereeksen komen na alle andere en alleen zodra een invoerepoch <c6/> bevat (live schema { "1.3" }, een resultaat van engine { "0.36" } of later), zodat een stroom of resultaat van { "0.35" } byte voor byte hetzelfde wordt weergegeven als voorheen. Labelwaarden zijn vaste verzamelingen (een onbekende status geeft <c7/>; een onbekende klasse wordt weggelaten). Laat een alarm afgaan op <c8/> in plaats van op de band alleen, zodat een slechte hemel niet als aanval wordt gemeld; een klasse <c9/> is een uitspraak over de hemel, niet een bevinding dat er geen aanval is geweest (zie <c10/>).

seg-3f45b21003d5 = Het label <c1/> maakt deel uit van de identiteit van een reeks: wanneer de klasse van een reden tussen epochs verandert (<c2/> van <c3/> naar <c4/> wanneer de verloren satellieten laag stonden, of <c5/> naar <c6/> wanneer de opgegeven HDOP niet overeenkomt met de opgegeven hemel), wordt de oude reeks niet meer geëxporteerd en begint een nieuwe. Vraag op <c7/> met <c8/> wanneer de klasse er niet toe doet, en verwacht dat zo'n wissel eruitziet als een reeks die eindigt en een andere die begint. De reeksen van schema { "1.3" }, het label <c9/> en de CEF/LEEF-geometrievelden worden gecontroleerd door de eigen tests van de engine en door de CEF-orakels (pycef, Logstash); de externe Prometheus- en OTLP-orakels hebben nog geen stroom van { "1.3" }.

seg-17ca55cea260 = Redennamen worden afgekapt tot { "128" } tekens, en hooguit { "64" } verschillende redenen krijgen een eigen reeks; latere worden geteld onder <c1/> en in <c2/>, zodat een vijandige of foutieve invoer geen onbegrensde labelcardinaliteit kan veroorzaken.

seg-35f3faf39d1c = <c1/> is er een van <c2/>, <c3/>, <c4/>, <c5/>, <c6/>. Redennamen zijn de monitornamen van de stroom (<c7/>, <c8/>, ...; voor het batchresultaat <c9/>, <c10/>, <c11/>).

seg-a726fc8d28c2 = Een voorbeelddashboard staat in <c1/> (importeer het en kies uw Prometheus-gegevensbron).

seg-208f33eda580 = Syslog: CEF en LEEF

seg-0d53db66a990 = Gebeurtenissen worden verzonden in een RFC { "5424" }-envelop (facility local0, app <c1/>, bericht-id <c2/>) via UDP (één datagram per gebeurtenis; IPv4 of IPv6) of TCP, standaard afgesloten met een nieuwe regel of, met <c3/>, ingekaderd als <c4/> zoals in RFC { "6587" }. Standaard wordt één gebeurtenis per bandwijziging verzonden; <c5/> verzendt er één per epoch. De leverancier wordt geschreven als <c6/> (ASCII), zodat geen enkele SIEM hem verkeerd decodeert.

seg-9cb6e1b9fec0 = Begrip

seg-9e4ce52ac5d9 = Syslog-ernst

seg-084d2e726d3f = CEF-ernst

seg-60fa1c602748 = LEEF <c1/>

seg-7948fbcf87cb = calibrating

seg-453691777f9d = { "6" } info

seg-2ac57280bf6a = { "4" } warning

seg-f757a767bd4a = untrusted

seg-8e4e2d9142f9 = { "2" } critical

seg-4c5b832482cb = unknown

seg-5e4f3b0222cd = { "5" } notice

seg-b07ec4ccabf7 = Veldtoewijzing (gebeurtenis-id is <c1/>):

seg-bfad2619553e = CEF

seg-62108c4b1d75 = LEEF { "2.0" } (scheidingsteken <c1/>)

seg-18a4ca402cd9 = categorie

seg-d3bc36a445cb = verzendende host

seg-521cea5013c8 = band

seg-2b9153eb068d = <c1/> (label <c2/>)

seg-f1be6ef87011 = redenen, door komma's gescheiden

seg-e77a9847bc7b = vorige band

seg-87b7f1652b0c = score

seg-470a89a86d79 = <c1/> (<c2/>), weggelaten als er geen is

seg-fc2aebb988bf = epoch-offset, s

seg-9f9d0d551742 = logtijdlabel

seg-57ed10b00272 = gatestatus

seg-7159f151c079 = geometriestatus, daarna <c1/> en de klassen van de aftrekken van de epoch, door komma's gescheiden (bijvoorbeeld <c2/>) <em>({ "1.3" }-invoer)</em>; van invoer die het label meegeeft ({ "0.36" }) een derde veld, <c3/> en het label, waarbij het klassenveld dan altijd aanwezig is (bijvoorbeeld <c4/>, <c5/>)

seg-973339622a60 = <c1/> (alleen status), <c2/> (klassen) en <c3/> (label)

seg-ae3a1d06bddf = HDOP

seg-c431625778a6 = PDOP

seg-e10eccec5f94 = ({ "0.36" }, met het label)

seg-e0a712018ced = VDOP <em>({ "0.36" }, met het label)</em>

seg-42273c09a591 = niet meegegeven: de vier aangepaste drijvendekommavelden zijn bezet

seg-292efe9557d6 = gebruikte satellieten <em>({ "0.36" }, met het label)</em>

seg-179b75fd8f06 = <c1/> (<c2/>), een geheel getal

seg-f69551c20173 = signaalverlies: zichtbare satellieten die niet worden gevolgd terwijl hun geometrie goed is

seg-bb927aab7541 = niet als veld meegegeven (er is geen CEF-woordenboeksleutel vrij voor): de status geeft <c1/> en de klasse van de geometrieaftrek <c2/> in <c3/>

seg-6a80d53b2163 = <c1/>, alleen zolang het geldt

seg-1f099d4ef4b6 = In CEF gebruikt de geometrie alleen aangepaste woordenboekvelden (geen verzonnen sleutels); het label gaat in <c1/> in plaats van <c2/> omdat de Logstash-CEF-codec de <c3/>-velden niet toewijst. De { "1.3" }-geometriegebeurtenissen, inclusief de labelgevallen, maken deel uit van de rij VALIDATED CEF: beide orakelparsers lezen ze terug zoals ze zijn geschreven (<c4/>, amendementen { "4" } en { "5" }, elk vastgelegd voordat een van beide parsers op zijn gevallen werd gedraaid). De velden label, VDOP en aantal satellieten worden achter alle eerdere velden en reeksen toegevoegd, en alleen voor invoer die het label meegeeft, zodat invoer zonder label precies zo wordt weergegeven als voorheen.

seg-b295bf5bac3e = Lege velden worden weggelaten (geen <c1/> zonder redenen). De hostnaam wordt afgekapt tot { "255" } tekens. CEF-headerwaarden escapen <c2/> en <c3/>; extensiewaarden escapen <c4/>, <c5/> en regeleinden. In LEEF-waarden worden <c6/> en regeleinden vervangen door spaties.

seg-a3b77e9593eb = OpenTelemetry (standaard uit)

seg-396c34d29783 = Bouw met <c1/> en geef <c2/> mee. De exporter post OTLP/HTTP-JSON (<c3/>, <c4/>, <c5/>, <c6/>, en voor invoer met schema { "1.3" } <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/> en, van invoer die het label meegeeft ({ "0.36" }), <c13/> (attribuut <c14/>) en <c15/>; de cumulatieve sommen hebben <c16/>) elke <c17/> epochs (standaard { "10" }) en aan het einde van de invoer. Het voegt geen afhankelijkheid toe en heeft geen TLS: verzend naar een collector op dezelfde host of een vertrouwd segment, die verder doorstuurt via TLS. Eindpunten met <c18/> worden geweigerd.

seg-c3111d73a8b0 = <s1>Vorige</s1>Hemelgeometrie en skylines

seg-4c539b667a05 = <s1>Volgende</s1>Galileo OSNMA-verificatie
