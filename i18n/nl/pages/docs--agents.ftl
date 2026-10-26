# docs--agents: translations (nl)

seg-0619151df586 = Bron: <c1/>

seg-d0e198572cfe = { -brand } gebruiken vanuit een AI-agent

seg-eccd1d5fbdb2 = Voor een agent (of degene die er een aanstuurt): welk hulpmiddel u voor welke vraag aanroept, wat de hulpmiddelen wel en niet doen en wat u bij elk antwoord moet bewaren. Onderdelen en de cellen die op een bepaald onderdeel niet beschikbaar zijn: <a1><c1/></a1>.

seg-a0354cacda4c = Verbinden

seg-337d23a873f5 = Een passage die AI-clients van derden noemt, is hier weggelaten; ze staat in <a1>docs/AGENTS.md</a1> op GitHub.

seg-01a862ed86e6 = De regel voor elk antwoord

seg-0adf5e5ad79a = Laat de engine draaien; raad de getallen niet. Rapporteer wat een hulpmiddel teruggaf met zijn eenheid en zijn bewijsniveau (VALIDATED aan een externe onafhankelijke referentie, of MODELLED), het scenario, de seed en de engineversie, zodat de run kan worden herhaald. Bewaar de eigen kanttekeningen van elk resultaat erbij.

seg-f67845b891c5 = Welk hulpmiddel voor welke vraag

seg-6f4bb4962340 = De vraag

seg-8efda304925b = Hulpmiddel (MCP)

seg-83d609ff5cc7 = Slash-opdracht

seg-9b937d3cbf88 = Een PNT-scenario uitvoeren of uitleggen (banen, GNSS, tijdsynchronisatie, fusie, maan, optische verbindingen, ...)

seg-ba8b3824bba2 = Was dit ontvangerlog, of de NMEA van dit vaartuig, betrouwbaar, en wanneer hield dat op?

seg-f3ea74f278ac = <c1/> (elk logformaat), <c2/> (NMEA van een vaartuig, batch), <c3/> (begrensd fragment)

seg-aa194fda4300 = Ik heb synthetische NMEA nodig met een jamming-, drag-off-, tijd-spoof- of replay-gebeurtenis voor training

seg-0211b49536df = Toon de vertrouwensscore van een vaartuig in monitoring- of SIEM-formaten (Prometheus, CEF, LEEF, OTLP)

seg-701250dfa798 = Score een ontvangerlog aan de hand van het gepubliceerde Jammertest-schema (detectielatentie, gemiste alarmen, valse alarmen, hersteltijd), of zet dat plan om in gebeurtenissen

seg-d1c81008d5f8 = Een fraudebestendig record maken van wat de engine zei over een venster van het log van een vaartuig, of er een controleren

seg-b7892674ac60 = Voor welke Galileo-satellieten authenticeert deze ontvangerstroom de navigatiegegevens (OSNMA)?

seg-084a787c65cf = <b>geen: niet op MCP.</b> Gebruik <c1/> (CLI), <c2/> (Python) of <c3/> (WASM, de OSNMA-kaart van Studio)

seg-4fc021a0a145 = geen slash-opdracht

seg-0f5db62071e9 = Ik heb de voertuigbeweging en gebeurtenistijden van een scenario nodig om af te spelen via een GNSS-simulator in het laboratorium

seg-919946a95002 = Voor welke eisenrijen van publieke raamwerken leveren deze runs bewijs, en wat is de lacune?

seg-5e08ec7f4852 = <c1/> (uit resultaattekst), <c2/> (de tabellen, geen runs)

seg-ff6556a46025 = Een gescoord standaardenpakket (testprofielen van DHS RPCF, IMO MSC.1/Circ.1575, ICAO Doc { "9849" } Appendix F) uitvoeren tegen drempels die vóór de run zijn vastgelegd?

seg-709c6501a661 = <c1/>, <c2/> (geef het rapport aan <c3/> voor de rijen)

seg-1745cce01677 = Het LunaNet Augmented Forward Signal (codes, SB1, frameformaat) controleren aan de hand van LNIS V5 / LSIS-AFS V1.0, of een symboolstroom controleren?

seg-d4d2e950054c = <c1/> (<c2/> spec, symbols of generate); LDPC en CRC-24Q van subframes { "2" } tot en met { "4" } zijn niet geverifieerd

seg-86c207c3996e = Een laboratoriumrun (scenario, vermelde testomstandigheden, ontvangerlog, score) koppelen in één ondertekend pakket?

seg-25bb29e6aa3d = <c1/> na <c2/> (<c3/>)

seg-3856b38bb9d2 = Een detectie- of holdover-inzending scoren tegen een kshana-bench-referentiebestand, of resultaatbestanden tonen als de ranglijstpagina?

seg-87e686c064ce = Ik heb een scenario nodig dat een GeoJSON-route vliegt (terrain-nav, terrain-slam, gravity-map, combined-altpnt)

seg-bf72fff11d84 = Welke satellieten ziet een gebruiker in een straat, een haven, een fjord of een containerterminal, en wat zijn de DOP en de foutellips?

seg-86eb2756fd7f = <c1/> (een verzoek, of een <c2/>); de sectie <c3/> van een scenario via <c4/> (<c5/> en <c6/> hebben <c7/> nodig)

seg-bd7f9d7e8e27 = Waar leek GNSS verslechterd, en hoeveel van deze route valt daarbinnen?

seg-908b6e65372f = <c1/>, daarna <c2/>

seg-1f715d5e0c4f = GNSS-IQ-opnamen (scene, acquisitie, tracking, front-end, campagnes)

seg-5569efd18c6b = eerst <c1/>, daarna de hulpmiddelen <c2/>

seg-d44650438742 = De skills <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> en <c7/> bevatten de onderstaande regels voor agenten die skills laden.

seg-a4de5a40b743 = Wat elk hulpmiddel niet doet

seg-3f27662a983e = <b>Bestanden lezen of schrijven.</b> De inhoud staat inline: invoer is tekst in het verzoek, begrensd op { "4" } MiB, en een scenarioveld dat een bestand noemt wordt geweigerd. Alleen de hulpmiddelen <c1/> raken een map, en alleen die welke door <c2/> wordt genoemd, waarbij elk pad daartoe beperkt blijft.

seg-3efe81d26cad = <b>OSNMA verifiëren.</b> Er is geen MCP-hulpmiddel: de invoer is een lange ruwe ontvangerstroom (I/NAV-pagina's of een UBX-opname), wat past bij de CLI en Python, en een hulpmiddel dat die aanneemt zou een groot invoeroppervlak toevoegen zonder voordeel. Verwijs de gebruiker naar <c1/> (of Python <c2/>). Wat de uitvoer ook zegt, neem de adviserende verklaring letterlijk over: alleen authenticatiestatus, geen navigatie-integriteitsdienst, geen typegoedgekeurde navigatieapparatuur en geen bewering over anti-spoofingprestaties; een resultaat is alleen betekenisvol met een Merkle-root of publieke sleutel die de gebruiker langs een andere weg heeft verkregen.

seg-b13a75d08152 = Een proces starten.

seg-9dfcbee6fdb8 = <c1/> als lopende stroom (met een gate en <c2/>), de telemetrie-exporters (<c3/>: Prometheus, syslog, OTLP) en het streamen van trainings-NMEA naar een adres zijn alleen via de opdrachtregel mogelijk. <c4/> scoort een fragment met dezelfde engine en schrijft naar geen enkele poort. De fragmenthulpmiddelen geven live JSON-lines-schema { "1.3" } terug (een <c5/>-verklaring en de satelliet-<c6/> bij elke epoch, een <c7/> bij elke afleiding); de CSV van een vaartuigrun begint met een commentaarregel met <c8/> die dezelfde verklaring bevat, dus lees hem met een commentaaroptie. <c9/> en <c10/> binden het loopback-adres tenzij anders is opgegeven.

seg-ac51aad84893 = Een signaal schrijven.

seg-ad032dee3fd3 = <c1/> geeft voertuigbeweging en benoemde gebeurtenisintervallen als tekst terug; niets wat het teruggeeft is, modelleert of stuurt een radiofrequent of basisbandsignaal, en een gebeurtenis is geen recept om interferentie te veroorzaken. Geef de <c2/> ervan mee met de bestanden; de simulator en zijn exploitant zijn ervoor verantwoordelijk ze alleen te laten lopen waar dat is toegestaan.

seg-39f3aae1143a = Meer zeggen dan de koppeling zegt.

seg-ed04b567fc87 = <c1/> geeft aan voor welke rijen van raamwerken een reeks runs bewijs levert, met de lacune van elke rij. Het zegt nooit dat een raamwerk is gehaald of dat een product is beoordeeld of goedgekeurd; neem de <c2/> ervan letterlijk over en zeg „levert bewijs voor”, niets sterkers. Het leest resultaat- en scenariotekst die u aanlevert, nooit een pad.

seg-eda73a8fcbfe = <b>Gegevens ophalen.</b> De download van landpolygonen is alleen via de opdrachtregel mogelijk en vereist <c1/>. Geef het landbestand, indien gewenst, als tekst door. Gebruik alleen gegevens die de gebruiker mag gebruiken.

seg-d513f734248e = <b>Iets uitzenden of RF synthetiseren.</b> De trainingsgenerator schrijft NMEA-tekst; de IQ-laag schrijft samplebestanden voor software-ontvangers.

seg-63eb4c5b4a17 = Wat u bij het antwoord moet bewaren

seg-6555ff9a6d8e = Uitvoer

seg-a056a59fb678 = Bewaren

seg-c01c0fedd895 = Satellietgeometrie en afleidingsklassen ({ "0.36" })

seg-3723ec5a3f8c = Rapporteer de geometrie naast de score en de klasse van elke afleiding zoals teruggegeven: <c1/> betekent de hemel (een uitspraak over de hemel, geen bevinding dat er geen aanval was), <c2/> de signaalomgeving, <c3/> aanvalsachtig bewijs. Zeg „geometrie onbekend” wanneer de status <c4/> is (geen GSV of GSA in het log); leid er geen af. Drempels zijn <b>MODELLED</b> met vermelde herkomst.

seg-0938dfb71d72 = Vertrouwensscore van de ontvanger

seg-8e3a7376cd6b = <b>Adviserend</b>: geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }); de exploitant blijft verantwoordelijk. <b>MODELLED</b>. Leg de grenzen van het vaartuig vóór de run vast en stem een drempel niet af op een resultaat. Een hoge score is geen bewijs van een echte positiebepaling; de controles kunnen een spoofer niet zien die consistent is met elke andere sensor.

seg-ae3f0548e93f = Bewijspakket

seg-81189f29f884 = Een <b>technisch record</b>, geen juridisch oordeel, geen vaststelling van feiten en geen goedkeuring. Verifieer met de publieke sleutel van de ondertekenaar die u langs een andere weg hebt verkregen; zonder die sleutel is het oordeel <c1/>, wat alleen integriteit bewijst ten opzichte van de sleutel die het pakket zelf noemt: zeg „intact, ondertekenaar niet vastgesteld”, nooit „geverifieerd”. Geef, log of vraag nooit een ondertekeningsseed in een gesprek als de sleutel ertoe doet: gebruik de CLI.

seg-512e5ee42c1e = Trainings-NMEA

seg-c59a76aefff5 = <b>Alleen tekst</b>, voor training en testen, <b>nooit</b> voor de live navigatiesystemen van een vaartuig. Geef de seed en het instructeurslog terug.

seg-14781c19be62 = Interferentiekaart, routeblootstelling

seg-7135c6f44d49 = Hoe de nauwkeurigheidscodes worden gelezen en de geometrie van raster en route zijn <b>VALIDATED</b> aan onafhankelijke bibliotheken op synthetische invoer; de drempels van de methode blijven <b>MODELLED</b>, en dat een verslechterde cel interferentie is, wordt <b>niet</b> gecontroleerd: een verslechterde cel wijst interferentie <b>niet</b> aan als oorzaak. Een cel die niet is waargenomen is <b>geen</b> bewijs voor een vrije route. Rapporten uit het verleden, <b>geen voorspelling</b>. Alleen geaggregeerd: probeer geen identificatoren te herstellen. ADS-B- en AIS-kaarten blijven gescheiden.

seg-e47db9be47ea = Hemelgeometrie, skyline

seg-839eb485b1d2 = <b>MODELLED</b> geometrie onder een vermeld foutmodel, alleen zichtlijn: geen diffractie, multipath of ontvangst zonder zichtlijn. Voorinstellingen zijn <b>REPRESENTATIVE</b>, geen opmetingen; neem de herkomst van de voorinstelling mee. Voorinstellingsconstellaties zijn een representatieve hemel, niet de hemel van een bepaalde datum. De ellips schaalt een vermelde UERE: geen gemeten nauwkeurigheid en geen integriteitsgrens. Bewaar de <c1/>.

seg-0002a3dc682e = Beschikbaarheid van optische verbindingen (<c1/>, { "0.37" })

seg-1098f908d9dc = <b>MODELLED</b>, adviserend. De wolkenklimaten zijn vermelde invoeren, geen dataset, en er is geen gemeten beschikbaarheidsrecord vergeleken: zeg „onder deze aannames”, nooit „de beschikbaarheid op die locatie”. Bewaar het <b>plafond</b> van de locatie (<c1/>: wat geen enkele marge verhoogt) naast haar beschikbaarheid, en zeg welke winsten van technieken invoeren zijn ({ -brand } modelleert geen adaptieve-optiekregelkring). De numerieke waarden zijn gecontroleerd tegen een onafhankelijk programma, wat de implementatie van de formules controleert en niet de atmosfeer.

seg-3324b2e2021e = Holdover-test (<c1/>, { "0.38" })

seg-9177789844f7 = <b>MODELLED</b>, adviserend. Zeg „gemeten tegen het masker”, nooit dat een klok of systeem aan een Recommendation voldoet of ertegen is goedgekeurd. De twee tijdstippen (GNSS weggenomen, GNSS hersteld) zijn de <b>verklaring van de exploitant</b>: { -brand } heeft niets weggenomen of hersteld en kan ze niet verifiëren, dus citeer ze zoals vermeld. Een masker waarvoor het record te kort is, is <b>INCOMPLETE</b>, nooit een geslaagd resultaat. Een servolog (linuxptp, chrony) is de fout onder servoregeling, geen onafhankelijke meting tegen UTC; zeg uit welk record de cijfers komen. Zie <c1/>.

seg-18d3f2b50d0a = Elk scenarioresultaat

seg-aab46d50d125 = De <c1/> of <c2/> die het vermeldt, en de herkomstregel.

seg-166f773b2804 = Grenzen

seg-203a91deb52c = Gebruik synthetische gegevens of de eigen gegevens van de gebruiker. Noem in uitvoer geen personen, vaartuigen of organisaties die niet in de invoer van de gebruiker stonden. { -brand } is een analyse- en trainingshulpmiddel, geen vlucht- of navigatieproduct.

seg-ec064f62f7dc = <s1>Vorige</s1>MCP-server: zelfgehoste HTTP-modus

seg-1f44dbd65ce3 = <s1>Volgende</s1>Waar elke mogelijkheid bereikbaar is
