# docs--jetbrains: translations (nl)

seg-f8a0fe9968c4 = Bron: <c1/>

seg-c55e49fd2a72 = Kshana voor JetBrains-IDE's

seg-d7280bb554bf = <a1><b>Kshana — PNT simulator</b> op de JetBrains Marketplace</a1> — of, in elke JetBrains-IDE, <em>Settings → Plugins → Marketplace → search "Kshana"</em>.

seg-959ab829762c = Een native plug-in die de PNT-veerkrachtsimulator <b>Kshana</b> uitvoert vanuit elke JetBrains-IDE (IntelliJ IDEA, CLion, RustRover, PyCharm, …). Klik met de rechtermuisknop op een scenario <c1/> → <b>Run Kshana Scenario</b>; de kwaliteitsmaten en het resultaat-JSON stromen naar het toolvenster <b>Kshana</b>.

seg-594199d2ce06 = Vult de <a1>MCP-server</a1> aan (die JetBrains <em>AI Assistant</em> toegang tot Kshana geeft): deze plug-in is het <em>menselijke</em> pad met aanwijzen en klikken.

seg-a356f2c30afb = Actie <b>Run Kshana Scenario</b> op elke <c1/> (contextmenu's van editor en projectweergave) — voert <c2/> uit en toont de uitvoer in het toolvenster Kshana.

seg-116d04ae5538 = <b>Assess Receiver Trust</b> op een scenario <c1/> <c2/> (<c3/>): de vertrouwenstijdlijn, met een score van 0-100 en redenen voor een vaartuig. Adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.

seg-726d88d0dea7 = <b>Generate Training NMEA</b> op een <c1/> <c2/> (<c3/>): synthetische brug-NMEA en een instructeurslog, naast het scenario geschreven. Alleen tekst; voor training, nooit voor de live navigatiesystemen van een vaartuig.

seg-99510426a384 = <b>Build Interference Map</b> op een ADS-B- of AIS-<c1/> (projectweergave; vraagt om welke toegestane dataset het gaat) en <b>Route Exposure</b> op een routebestand (vraagt om de map met kaarten). Een gedegradeerde cel geeft interferentie niet aan als oorzaak; geen voorspelling.

seg-8c50e6aeb5e2 = <b>Export Test-Bench Files</b> op een scenario <c1/> (<c2/>): voertuigbeweging, NMEA en gelabelde gebeurtenissen voor een GNSS-simulator in het laboratorium, naast het scenario geschreven. Het schrijft geen signaal; gebruik een simulator alleen waar dat is toegestaan.

seg-79c553c303c5 = <b>Build Compliance Report</b> op een runresultaat <c1/> (<c2/>) en <b>Tools → Show Compliance Mapping</b> (<c3/>): de koppeling met het openbare kader, getoond met de eigen verklaring van de engine woord voor woord.

seg-9b6ce5bbb523 = <b>Verify Evidence Pack</b> op een map met een bewijspakket (projectweergave; <c1/>): vraagt om de publieke sleutel van de ondertekenaar ({ "64" } hexadecimale cijfers of een bestand <c2/>; altijd vastgepind, de plug-in accepteert nooit een niet-vastgepinde ondertekenaar) en optioneel om het volledige sessielogboek. Alleen een geverifieerd resultaat leest als geverifieerd; een intact pakket met een niet-vastgepinde ondertekenaar leest "NOT VERIFIED".

seg-253d5b7f94ce = <b>Render Trust Telemetry</b> op een resultaat <c1/> <c2/> (<c3/>): Prometheus-tekst, CEF/LEEF-syslog-gebeurtenissen of Home Assistant MQTT-regels, afgedrukt in het venster van Kshana. Er wordt niets verzonden of aangeboden; de draaiende exporters blijven op de opdrachtregel.

seg-ce12ebcdccb5 = <b>Fit Sensor Parameters from IMU Log</b> op een stilstaande IMU <c1/> (<c2/>): de accelerometer- en gyroparameters van de scenario's <c3/> en <c4/>, gefit met Allan-deviatie, afgedrukt in het venster van Kshana als een tabel <c5/>. Er wordt niets geschreven; de fit is MODELLED.

seg-b81f27c51c22 = <b>Validate Scenario</b> (<c1/>), <b>List Scenario Kinds</b> (menu Tools; <c2/>) en <b>Assess Receiver Stream</b> (een vaartuigsessie <c3/> plus een opgeslagen NMEA-log die u kiest; <c4/>, eenmaal gescoord zonder socket en zonder gate).

seg-38037d36639c = <b>Insert Example Scenario</b> (map in de projectweergave of menu Tools; <c1/>): kies een meegeleverd scenario en het wordt als nieuw <c2/> geschreven (nooit over een bestand heen). <b>Export Scenario</b> op een <c3/> (SP3, OMM, OEM, CZML, KML, GeoJSON, STK, SigMF; alleen gesimuleerde uitvoer), <b>Animate Scenario</b> (HTML of SVG, geopend in de browser) en <b>Import Route</b> op een route <c4/> (vraagt om welk scenario).

seg-1f1b18f8e102 = <b>Create Evidence Pack</b> op een sessie <c1/> voor ontvangervertrouwen (<c2/>): vraagt om het venster, een sleutelbestand voor ondertekening dat u al hebt, en de uitvoermap. De plug-in maakt, leest of bewaart nooit een sleutel (<c3/> blijft op de opdrachtregel). <b>Attach Timestamp</b> op een pakketmap (<c4/>): Kshana controleert de handtekening van de tijdstempelautoriteit niet; voer zelf <c5/> uit.

seg-f4f6605d3db9 = Nog steeds alleen op de opdrachtregel: de IQ-opdrachten, <c1/> en <c2/>.

seg-63efd04104f1 = Een toolvenster <b>Kshana</b> onderaan dat de runconsole bevat.

seg-decda07aa7eb = Niet in de plug-in: <c1/> (een langlopend streamproces met een gate en een optionele TCP-listener) en <c2/> blijven op de opdrachtregel, omdat een IDE-actie een opdracht tot het einde uitvoert en zijn uitvoer toont; zie <c3/>.

seg-9c185454d0c0 = <b>Settings → Tools → Kshana</b> om naar het binaire bestand <c1/> te wijzen (leeg → opgelost via <c2/>; installeren met <c3/>).

seg-44dfdd65bd0a = De plug-in is puur platform (geen taalspecifieke afhankelijkheden), dus hij laadt in elke JetBrains-IDE op build { "243" } ({ "2024.3" }) en nieuwer.

seg-453bd42c23fa = Bouwen en uitvoeren

seg-b5328f8c7a8a = Vereist JDK { "17" }+ (de build pint JDK { "21" }) en de meegeleverde Gradle-wrapper.

seg-758124ceb1c7 = <c1/> controleert standaard de since-build, { "2024.3" }. Om andere lijnen te controleren, noemt u ze als <c2/> (elke IDE is een download van ongeveer { "1" } GB):

seg-15d175aaeb59 = De plug-in gebruikt op geen van die lijnen een verouderde of voor verwijdering geplande platform-API; houd dat zo (een keuzedialoog loopt via <c1/>, niet via <c2/>).

seg-39cfd740d9b3 = Installeer de gebouwde zip via <b>Settings → Plugins → ⚙ → Install Plugin from Disk…</b>.

seg-87aff08f344c = Indeling

seg-73b3f55b7208 = Isolatie

seg-a14db8de576a = Net als <c1/> en <c2/> is dit een zelfstandig Gradle-project, uitgesloten van de gepubliceerde crate <c3/> (<c4/> in het pakket <c5/>); de buildoutput staat in gitignore.

seg-b38914a430b9 = Licentie: AGPL-3.0-only (of een commerciële licentie van Ashforde OÜ — zie <c1/> van de repository).

seg-bb286e3ce9c9 = <s1>Vorige</s1>Waar elke mogelijkheid bereikbaar is

seg-e62586b5f58c = <s1>Volgende</s1>Waar Kshana draait
