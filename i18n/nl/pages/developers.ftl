# developers: translations (nl)

seg-d5807f566761 = De statische koppeling aan publieke raamwerken (<c1/> / <c2/>) als Markdown: één tabel per raamwerk met per rij de geparafraseerde eis, de { -brand }-uitvoer die er bewijs voor levert en de lacune die de uitvoer niet dicht; of, met <c3/> op true, de brondocumenten waaraan de tabellen refereren, met versies en URL's. Voorafgegaan door de verklaring die elk rapport bevat en die bij elk fragment hoort: een rij die als evidenced is gemarkeerd betekent dat een run bewijs levert voor de mogelijkheden die de rij noemt; het is geen bevinding dat een raamwerk is gehaald en het betekent niet dat een product door wie dan ook is beoordeeld of goedgekeurd. Vereist geen runs.

seg-01fd088cd243 = Bepaal de sensorparameters van de scenario's <c1/> en <c2/> uit een logbestand van een stilstaande IMU (<c3/>, docs/MACHINE-INPUTS.md). Die scenario's nemen ruisparameters, geen tijdreeks: dit leest ze af uit een log die is opgenomen terwijl de sensor stilstond, met de overlappende Allan-deviatie van het geïntegreerde signaal. Geeft JSON terug: <c4/> (versnellingsmetervooroordeel, PSD van de velocity random walk <c5/>, gyrovooroordeel, PSD van de angle random walk <c6/>, de ondergrens van de biasinstabiliteit als de log lang genoeg is om er een te tonen, de samplefrequentie en tijdspanne van de log, de vroege Allan-hellingen en <c7/> over wat niet kon worden bepaald of niet betrouwbaar was), <c8/> (een <c9/>-tabel waarvan de herkomst de SHA-256 van de log noemt, klaar om in een scenario te plakken) en <c10/>. Een log die niet stilstond, of te kort of ongelijk bemonsterd is, geeft onjuiste parameters of wordt geweigerd; de hellingen (ongeveer -0.5 waar witte ruis overheerst) laten zien welk geval zich voordoet. Er wordt niets naar schijf geschreven. Bewijsniveau: MODELLED (de schatter toegepast op de log, geen externe onafhankelijke referentie).

seg-5b15806ef8af = Geef een lijst van de standaardenpakketten (<c1/>): gescoorde scenarioreeksen voor de testprofielen van het DHS Resilient PNT-raamwerk, IMO MSC.1/Circ.1575 en ICAO Doc { "9849" } Appendix F, elk met de drempels die het vóór de run vastlegt en de compliance-rijen waarvoor het bewijs levert. Vereist geen invoer. Een pakket meet gemodelleerde scenario's aan de hand van vastgelegde drempels; het beoordeelt geen product. Bewijsniveau: MODELLED.

seg-b0ad081ceea6 = Voer één standaardenpakket uit (<c1/>): elk scenario erin, gescoord aan de hand van drempels die vóór de run zijn vastgelegd. Geeft het rapport terug (elke test <c2/>, <c3/>, of <c4/> als er een ontvangerlog nodig is en er niet wordt gescoord; elke drempel met zijn gemeten en verwachte waarde) en hetzelfde als <c5/>. Geef het rapport-JSON door aan <c6/> om de rijen te zien waarvoor het pakket bewijs levert. Zeg ondubbelzinnig dat een drempel met MET betekent dat een gemodelleerd scenario een vastgelegde drempel heeft gehaald, en dat NOT MET een resultaat is dat op record staat; beschrijf de uitvoer nooit als bewijs dat een product of een raamwerk is gehaald. Alleen adviserend: analyse-uitvoer, geen typegoedgekeurde navigatieapparatuur. Bewijsniveau: MODELLED.

seg-fbdd90ad8ddf = Controleer het LunaNet Augmented Forward Signal (AFS) aan de hand van de gepubliceerde specificatie, vastgepind op LNIS Version { "5" } Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }) (<c1/>, docs/LUNANET-AFS.md). Modus <c2/> controleert deze implementatie aan de hand van de afgedrukte codetabellen van het document (de eerste en laatste { "24" } chips van elke AFS-I Gold-, AFS-Q Weil- en tertiaire code voor PRN { "1" } tot { "210" }, en beide Legendre-reeksen) en uitgewerkte voorbeelden (SB1 BCH, CRC-24Q), drempels B1 tot en met B10 van een preregistratie; B4 meldt één misser (het document drukt dezelfde laatste { "24" } chips af voor tertiaire PRN { "147" } en { "151" }). Modus <c3/> controleert een hard-decisionsymboolstroom (tekst van { "0" } en { "1" }) op het synchronisatiepatroon, SB1-decodering, FID, TOI-continuïteit en frameafstand. Subframes { "2" } tot en met { "4" } (rate-1/2 LDPC, CRC-24Q) zijn NIET geverifieerd: de LDPC-matrices staan in een aparte bijlage die niet is geïmplementeerd. Modus <c4/> geeft een teststroom met plaatsvervangende subframes: symbolen, geen golfvorm; { -brand } schrijft geen signaal. VALIDATED alleen aan de hand van de afgedrukte tabellen van die uitgave, die het document zelf als TBC markeert; zeg dat, en beschrijf een resultaat niet als bewijs dat een LunaNet-node of -dienst correct is. Alleen adviserend.

seg-b38b9289f0ce = Score een kshana-bench-inzending (<c1/>, bench/SPEC.md, docs/BENCH.md): een voorspellingsbestand (<c2/>) tegen een referentiebestand (<c3/>), beide JSON-tekst, hoogstens { "4" } MiB elk, en geef het resultaatbestand (<c4/>) terug met de specificatieversie, taak (a detectie op ontvangerlogs, b detectie op IQ, c voorspelling van timing-holdover, d optimismekloof buiten de verdeling), split, de SHA-256 van beide invoerbestanden en de meetwaarden van de taak (AUC, detectiekans bij een plafond voor valse alarmen, RMSE per horizon, of de optimismekloof). <c5/> is de opgegeven alarmdrempel van taken a en b. Er wordt niets van schijf gelezen of geschreven. Elke score is MODELLED en beschrijft een log of corpus, nooit een product; het is geen certificering en geen enkele organisatie wordt door een score onderschreven. Bewijsniveau: MODELLED.

seg-96aa4ec83eec = Toon kshana-bench-resultaatbestanden (<c1/>) als de statische ranglijstpagina, HTML-tekst in het antwoord: <c2/> is een lijst van JSON-teksten van <c3/> (hoogstens { "256" }, elk { "4" } MiB), elk eerst gevalideerd; een bestand dat onder een andere hoofdversie van de specificatie is gescoord wordt geweigerd, omdat resultaten van verschillende hoofdversies nooit in één tabel worden gezet. Een rij zegt dat dit bestand dit getal scoorde op deze split; het betekent niet dat een product door wie dan ook is beoordeeld of goedgekeurd. Er wordt niets geschreven. Bewijsniveau: MODELLED.

seg-4d9c09d4b58d = Toon een GNSS-vertrouwensstroom of een <c1/>-resultaat als beveiligingstelemetrietekst (<c2/>, docs/TRUST-TELEMETRY.md), met dezelfde encoders die de opdrachtregel gebruikt: <c3/> (de expositie van de eindtoestand), <c4/> of <c5/> (één RFC { "5424" }-syslogregel per bandwijziging, of per epoch met <c6/>; geen tijdstempel, omdat er geen klok wordt gelezen) of <c7/> (de OTLP/HTTP-JSON-metricspayload). <c8/> is <c9/> (standaard) of <c10/>; een streamregel die niet te parsen is, wordt overgeslagen en geteld in <c11/>. Er wordt niets verzonden, aangeboden of geschreven: de uitvoer is tekst in het antwoord (de draaiende exporters, die een proces zijn, blijven op de opdrachtregel). De door de ontvanger gemelde positie wordt weggelaten tenzij <c12/> true is. Een invoer met satellietgeometrie (live schema { "1.3" }, resultaten vanaf { "0.36" }) voegt het geometrielabel toe (good, fair, poor; nooit gescoord behalve bij poor) en status, HDOP, PDOP, VDOP en gebruikte satellieten, en een <c13/>-label (geometry, environment, inconsistency) bij elke reden; een oudere invoer wordt precies zoals voorheen weergegeven. Alleen adviserend: { -brand } is geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }) en de exploitant blijft verantwoordelijk. Bewijsniveau: MODELLED.

seg-6b2ac6e6c327 = Exporteer de voertuigbeweging en gebeurtenissen van een scenario voor een GNSS-simulator in het laboratorium (<c1/>, docs/TEST-BENCH.md): een bewegings-CSV en de JSON-beschrijving ervan (aardvaste en geodetische positie, snelheid, oriëntatie, UTC), NMEA { "0183" }-zinnen GGA/RMC, een waypointtekst wanneer het samplerooster op de milliseconde regelmatig is, en de gebeurtenissen van het scenario als CSV en als <c2/>-TOML voor een <c3/>-scenario. Geldt voor <c4/> (de uitval van de navigatietoestand zijn de gebeurtenissen), <c5/> en <c6/>; een ander soort wordt geweigerd, met de reden. <c7/> is het UTC-tijdstip van bewegingstijd nul, <c8/> (standaard 2024-01-01T00:{ "00" }:00Z). Er wordt niets naar schijf geschreven: het eerste inhoudsitem is een JSON-index (<c9/> met <c10/>, <c11/>, <c12/>; <c13/> bij elk weggelaten bestand; <c14/>), gevolgd door de tekst van elk bestand in indexvolgorde. Hetzelfde scenario en dezelfde epoch geven byte-identieke bestanden. GEEN SIGNAAL: niets van het geëxporteerde is, modelleert of stuurt een radiofrequent of basisbandsignaal, en een gebeurtenis is een benoemd interval, geen recept om interferentie te veroorzaken; de simulator en zijn exploitant leveren de signalen en zijn ervoor verantwoordelijk ze alleen te laten lopen waar dat is toegestaan. Bewaar de kennisgeving bij de bestanden. { -brand } publiceert geen resultaten van zulke runs. Bewijsniveau: MODELLED.

seg-03947a440c87 = Koppel een RFC { "3161" }-tijdstempeltoken aan een bewijspakket (<c1/>), in het geheugen: <c2/> is een pakket zoals <c3/> het teruggeeft, <c4/> de bytes van het <c5/>-bestand van een tijdstempelautoriteit. Het token wordt opgeslagen als <c6/> naast het ondertekende manifest, niet erin, en het pakket met het token moet nog steeds verifiëren, anders wordt er niets gekoppeld; een bestaand token blijft behouden tenzij <c7/> true is. Geeft de bijgewerkte <c8/> terug (geef ze aan <c9/> door met <c10/> op true om af te dwingen dat het token aanwezig is) en de verificatienotities. Dit controleert de handtekening van de tijdstempelautoriteit op het token of het certificaat van de autoriteit NIET (het controleert de structuur van het token en dat de message imprint ervan de hash is van het manifest.json van dit pakket): zeg dat, en verwijs de gebruiker naar <c11/>. Invoer en antwoord zijn beperkt tot { "4" } MiB. Een tijdstempel toont dat een hash bestond op een tijdstip dat de autoriteit opgeeft; het is geen juridisch oordeel. Bewijsniveau: MODELLED.

seg-fb49aecfe138 = Elk installatiekanaal

seg-8d1e26cab542 = Elk kanaal

seg-669075196148 = Elke manier om het te installeren.

seg-53f99a4bf0b6 = Eén tabel, gegenereerd uit de <c1/> van de repository en gecontroleerd tegen de README's ervan, zodat elke opdracht die is die de README toont, vastgepind op v{ $version }. Vooraf gebouwde binaries voor elk besturingssysteem, de extensie voor de desktopassistent, éénklikknoppen voor Cursor en VS Code, de launchers <c2/> en <c3/>, Homebrew, Scoop en winget, de registers en een zelfgehoste HTTP-modus. Kanalen die zijn gemarkeerd met <b>wanneer gepubliceerd</b> gaan live met de release.

seg-a784b0c22ad5 = Engine en bindings

seg-702aa931172f = De engine zelf, in de taal of op de plek waar u werkt.

seg-04af86981ef7 = Voor iedereen, niets te installeren. Vereist: niets.

seg-5e0edd49cae9 = Voor ingenieurs die de opdracht kshana willen. Vereist: Rust.

seg-2f047531071b = Vastgepind op v{ $version }

seg-19baff281ca3 = Voor Rust-ontwikkelaars die de engine inbouwen. Vereist: Rust.

seg-5f6db7a6b4ca = Voor analisten en notebooks. Vereist: Python.

seg-88dc6ca4799b = Voor web- en Node.js-ontwikkelaars. Vereist: Node.

seg-6582d85cfa39 = AI-assistenten (MCP-server)

seg-261c059bec54 = Adviserend, geen typegoedgekeurde navigatieapparatuur: de exploitant blijft verantwoordelijk voor de navigatie. De server draait op uw computer; er wordt niets naar Ashforde OÜ verzonden.

seg-bb28e2a66e35 = Voor iedereen die een assistent met MCP-ondersteuning gebruikt. Vereist: Rust { "1.88" }+.

seg-8172b2b48d13 = Voor wie geen Rust-toolchain heeft; de MCP-server in een container. Vereist: Docker.

seg-eda88c6d5b0c = Extensie voor de desktopassistent (.mcpb)

seg-18587e2199b3 = Voor gebruikers van de desktopassistent, zonder terminal. Vereist: niets.

seg-5ab1f0ac7367 = macOS (Apple silicon)

seg-37287d0895cb = macOS (Intel)

seg-6b54b32f7d37 = Windows

seg-074d9a372011 = Linux (x86-64)

seg-b892cd4c216d = Linux (Arm)

seg-690ef01d50f4 = Dubbelklik op kshana-mcp-<target>.mcpb.

seg-9ba55737d291 = GitHub-release

seg-f8c77f4d7864 = Alle MCP-installatiefragmenten

seg-13641146503d = Cursor (één klik)

seg-35cf0ee94c60 = Voor Cursor-gebruikers. Vereist: Node of Docker.

seg-a53041e2bd0c = Kopiëren: npx -y kshana-mcp@{ $version }

seg-ea721373864c = npx -y kshana-mcp@{ $version }

seg-06487ca9ea53 = Aan Cursor toevoegen (npx)

seg-f1cdd05a2c12 = Aan Cursor toevoegen (Docker)

seg-3bd13fe295f4 = VS Code (één klik)

seg-ee9f19a3799a = Voor gebruikers van VS Code en Insiders. Vereist: Node of Docker.

seg-0ba9276b4e31 = Installeren in VS Code (npx)

seg-9fd52c6bfeb3 = Installeren in VS Code (Docker)

seg-2a3f55e82b20 = Installeren in VS Code Insiders (npx)

seg-fea7b394cdde = npx

seg-23ec7a4d28e0 = Voor Node-gebruikers, elke MCP-client. Vereist: Node { "18" }+.

seg-5f3e5c50cb8c = Een launcher: hij downloadt de release-binary, verifieert SHA256SUMS en voert hem uit.

seg-d54b8eda8897 = npm: kshana-mcp

seg-76fcc8024f2f = uvx / pipx

seg-e66aec59caa7 = Voor Python-gebruikers, elke MCP-client. Vereist: Python { "3.9" }+ met uv of pipx.

seg-52b1d8897ac2 = Kopiëren: uvx kshana-mcp=={ $version }

seg-cad43eaead60 = uvx kshana-mcp=={ $version }

seg-8d5edf392220 = PyPI: kshana-mcp

seg-deb5187472d1 = Homebrew

seg-aa9689f9b581 = Voor macOS en Linux. Vereist: brew.

seg-0ceb25056c2c = Kopiëren: brew install ashfordeOU/tap/kshana-mcp

seg-a524b18c6f10 = brew install ashfordeOU/tap/kshana-mcp

seg-deb33ce3ef5d = Homebrew-tap

seg-491167f2310c = Scoop

seg-3c941a0f9366 = Voor Windows. Vereist: Scoop.

seg-3d27d05f7ab4 = Kopiëren: scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp

seg-b78510c8fb5d = scoop bucket add ashforde https://github.com/ashfordeOU/scoop-bucket && scoop install kshana-mcp

seg-fa59790f70ce = Scoop-bucket

seg-a971f0c1ec28 = Ingediend; het verschijnt zodra de derde partij het samenvoegt

seg-1c02f2eb0335 = winget <s1>in beoordeling</s1>

seg-99db55f8d2d4 = Voor Windows. Vereist: winget.

seg-79d2068ac3fe = Kopiëren: winget install AshfordeOU.KshanaMcp

seg-e74f9c5a4eea = winget install AshfordeOU.KshanaMcp

seg-274348a3b12b = Verschijnt zodra Microsoft de inzending samenvoegt.

seg-5c425ea185ee = Vooraf gebouwde binary

seg-da6faee2d5a0 = Voor wie geen pakketbeheerder heeft. Vereist: niets.

seg-adcb69b72fa0 = Download kshana-mcp-<target> uit de release en controleer het tegen SHA256SUMS.

seg-ffc5c2ce76e1 = Officieel MCP-register

seg-48908d14699a = Voor MCP-clients die registers ondersteunen. Vereist: een client die registers ondersteunt.

seg-7661fe051203 = Zoek io.github.ashfordeOU/kshana-mcp.

seg-d107bc8e1950 = MCP-register

seg-1bf757c89ad0 = Op afstand (streamable HTTP), zelfgehost

seg-bd777cb973c1 = Voor clients die een URL aannemen. Vereist: uw eigen host.

seg-1feb00c423e9 = Kopiëren: kshana-mcp --http { "127.0.0.1" }:{ "8080" }

seg-7b7a63c8e3d1 = kshana-mcp --http { "127.0.0.1" }:{ "8080" }

seg-7cd1d5c3e738 = Standaard loopback; een bind buiten loopback vereist --allow-remote en een bearer-token. { -brand } host geen eindpunt.

seg-454740be09bd = Gids voor zelf hosten

seg-89572b9078e0 = Integraties

seg-3f69f6fd1e3d = Plug-ins en images die { -brand } in andere hulpmiddelen brengen.

seg-c78339331023 = Voor gebruikers van IntelliJ, PyCharm en CLion. Vereist: een JetBrains-IDE.

seg-2e34ace70d11 = Signal K-plug-in

seg-54c550e25871 = Voor bootbezitters met een Signal K-server. Vereist: Node, een Signal K-server.

seg-e1a28c4fbeb9 = Kopiëren: npm install signalk-kshana-trust

seg-53731a6f7b8f = npm install signalk-kshana-trust

seg-01981dcfeae4 = npm: signalk-kshana-trust

seg-a46f6205b2c6 = Gids voor de Signal K-plug-in

seg-0dda70c85f4c = OpenCPN-plug-in

seg-5892d7a53111 = Voor gebruikers van de OpenCPN-kaartplotter. Vereist: OpenCPN { "5.8" }+.

seg-cde85890d71d = Download de tarball van de plug-in uit de release. De release bevat de tarball en de XML met catalogusmetadata ervan; opname in de catalogus van OpenCPN gebeurt via een pull request dat met de hand wordt geopend.

seg-ecac46d67578 = Indiening bij de OpenCPN-catalogus

seg-efe3c0bb1ae4 = Grafana-dashboard

seg-fbd9d01fdf66 = Voor exploitanten die Grafana draaien. Vereist: Grafana.

seg-faf86e219716 = Importeer kshana-grafana-*.json uit de release.

seg-b9ec8dcfebfc = Bron van het dashboard

seg-29a25feb563a = Reference-build-image

seg-a8861a7224d8 = Voor gate- en bench-implementaties. Vereist: Docker.

seg-f0f6aa0b6839 = Kopiëren: docker pull ghcr.io/ashfordeou/kshana-reference-build

seg-7211280de535 = docker pull ghcr.io/ashfordeou/kshana-reference-build

seg-ea81f7acf313 = Manieren om het te gebruiken

seg-bf1539d8d398 = Elf manieren om binnen te komen.

seg-7717516e084e = Van een browsertabblad tot een regressiesuite voor continue integratie (CI). Elke ingang draait dezelfde engine en schrijft hetzelfde JSON-resultaat, dezelfde SVG-grafiek (Scalable Vector Graphics) en hetzelfde HTML-rapport (HyperText Markup Language). Kies er één; elke opdracht is echt en kopieert met één klik.

seg-a0b0088f15c8 = Manieren om { -brand } te gebruiken

seg-518f5155d5d8 = Proberen

seg-c9a2106b81d6 = Embedmodus

seg-31d58f23c0a2 = Uitvoeren

seg-9a552bb08cd6 = CI-regressie

seg-d7aea3de7e2d = Studiesuite (gratis)

seg-cc651d9cef3b = Code

seg-8349c40ee9f1 = npm · WebAssembly

seg-04f61285f6f5 = Assistenten en hulpmiddelen

seg-e47be3bb3de3 = Elk meegeleverd scenario, uitgevoerd op uw machine als WebAssembly; niets geïnstalleerd, niets geüpload. Stem het af, vergelijk runs, doorloop een parameterbereik en exporteer een reproduceerbaar rapport.

seg-b21664dae8a2 = Alleen { -brand } Studio, voor een cursuspagina of een rapport, met het scenario en de weergave vooraf gekozen

seg-d124f667aba2 = Een ingebedde weergave openen

seg-a08d0d3e393c = kshana <scenario>.toml schrijft result.json, chart.svg en report.html

seg-3a0042586da7 = De uitvoer is deterministisch op basis van scenario, seed en engineversie, dus een vastgelegd result.json is een regressietest (CI: continue integratie): voer opnieuw uit en vergelijk

seg-73291062f208 = Kopiëren: kshana --validate scenarios/integrity-raim.toml

seg-97b17630c261 = kshana --validate scenarios/integrity-raim.toml

seg-176e798df682 = kshana --study: een suite scenario's in één gestempelde study.json en study.html, gratis. Niet de betaalde studie op maat.

seg-4ca771aed118 = Kopiëren: kshana --study scenarios/quantum-pnt-demonstrator.suite.toml

seg-3bff1e181145 = kshana --study scenarios/quantum-pnt-demonstrator.suite.toml

seg-60b88364b7f3 = kshana::api::run_toml geeft JSON, SVG, een samenvatting en CSV (door komma's gescheiden waarden) terug

seg-d85f16c14183 = kshana.run en run_full, plus validate_toml en list_kinds

seg-5a6803e3eb48 = run, summary en chart_svg in de browser of Node.js

seg-1c19f8c0ad84 = { "49" } hulpmiddelen die een AI-assistent kan aanroepen, elk een dunne laag om de publieke API

seg-4ad1a7669b03 = De MCP-server zonder Rust-toolchain, voor meerdere architecturen

seg-9e409a07b3c9 = Klik met rechts op een scenario-.toml, kies Run Kshana Scenario en lees de cijfers in een hulpmiddelvenster

seg-5c54a28b6aec = De pagina openen

seg-a942825ac543 = Opdrachtregel · bibliotheken · formaten

seg-e65ee2744a09 = Eén aanroep, drie talen, hetzelfde antwoord.

seg-e139bbf52549 = De opdrachtregel, de bindings voor Rust, Python en JavaScript en de bestandsformaten die de engine leest en schrijft, naast elkaar. Alles hier is de vrije open kern.

seg-4468dde9e1c9 = Opdrachtregel · <c1/>

seg-0d7c11d5e318 = Uit de binary

seg-6ea4c3e5cb3a = Naslag van de opdrachtregel, uit de eigen gebruikstekst van de binary

seg-542efc7a330f = Een run schrijft <c1/>, <c2/>, <c3/>, <c4/>, <c5/> naast het scenario; <c6/>, <c7/> en <c8/> schrijven baanbestanden; <c9/> schrijft de run ook als iets dat beweegt (<c10/>, <c11/>, <c12/>: een geanimeerde SVG, een op zichzelf staande HTML-speler of een map met genummerde frames), met <c13/> en <c14/> voor de afspeelsnelheid en -duur; <c15/> schrijft de geometrie van het scenario of het gesynthetiseerde signaal ervan voor andere hulpmiddelen: CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON (geographic JSON), een STK-efemeridebestand (Systems Tool Kit), SigMF (Signal Metadata Format); <c16/> leest een route die als GeoJSON-lijn is getekend; <c17/> injecteert aardoriëntatieparameters uit een finals2000A-bestand; <c18/> voert een vrije suite scenario's uit naar <c19/> en <c20/>; <c21/> geeft een lijst van elke soort met zijn velden; <c22/> drukt een scenario af om mee te beginnen. Resultaten kunnen reizen in de envelop van het Kshana Interchange Format (KIF). De MCP-server biedt de baanexports aan als hulpmiddelen.

seg-20e41da100d1 = <c1/> is de gratis suiterunner. Als u de analyse liever laat uitvoeren, is dat een betaalde <a1>studie op maat</a1>.

seg-223fdfdf6a89 = Elke run

seg-05542b723b75 = Deterministisch

seg-84e990e811f9 = Schrijft

seg-955ed4e12157 = <c1/>, <c2/>, <c3/> en hetzelfde rapport als <c4/>, plus een CSV-tabel (door komma's gescheiden waarden) voor de soorten die er een publiceren. Op verzoek schrijft het ook een animatie van de run (<c5/>) en het scenario in de formaten die andere hulpmiddelen lezen (<c6/>).

seg-0c64bda61e6d = <b>Reproduceerbaar</b> op basis van scenario, seed en engineversie, met een CycloneDX-SBOM (software bill of materials) en SLSA-buildherkomst (Supply-chain Levels for Software Artifacts) bij elke release.

seg-ccb6508f25b3 = <b>Gedocumenteerd:</b> concepten, scenarioschema, Python-API, validatie en elke handleiding, gegenereerd uit de repository. <a1>Docs</a1>

seg-297fe9331ba9 = Uitgevoerd tegen v{ $version }

seg-e3e9177d3f4a = Elk programma voert het meegeleverde scenario <c1/> uit (schrijf het met <c2/>) en drukt dezelfde samenvatting van één regel af. De README's van de pakketten bevatten de volledige versies.

seg-62192c7fb74a = Bibliotheektaal

seg-a4ba3c056ab8 = JavaScript · WebAssembly

seg-56f23b36ff24 = src/main.rs · na <c1/>

seg-379fc633497c = <c1/> heeft ook <c2/>, <c3/>, <c4/> en de baanexporteurs. <a1>Rust-docs</a1>

seg-6a13ed4517ad = run.py · na <c1/>

seg-84695d64a758 = Het pakket heeft ook <c1/> en <c2/>. <a1>Python-docs</a1>

seg-fb4a40bdf623 = run.mjs · Node.js, na <c1/>

seg-fcdffb554680 = Hetzelfde pakket draait in de browser; het is wat { -brand } Studio gebruikt. <a1>npm-docs</a1>

seg-c313ec6ff2e9 = Openen in { -brand } Studio: clock-holdover

seg-bca1c3e60fc6 = Interoperabiliteit · lezen en schrijven

seg-7a49e058e17b = Elke rij noemt zijn controle

seg-6f81c59f4c4d = Formaten die de engine vandaag aankan, van de standaardenpagina van de repository (<a1>Docs: standaarden</a1>). Open een rij voor hoe u het bereikt en waartegen het is gecontroleerd.

seg-82e334c3735b = CCSDS OEM <s1>Consultative Committee for Space Data Systems, Orbit Ephemeris Message</s1>

seg-1ef51a222125 = lezen · schrijven

seg-9c1e7fd8f838 = Hoe

seg-e44dd7c5f35e = <c1/>, MCP <c2/>

seg-57db34b43e33 = Gecontroleerd tegen

seg-2fb4c1ee3b74 = Het CCSDS Blue Book-voorbeeld, letterlijk teruggewonnen

seg-c1a375b4412e = CCSDS OMM <s1>Orbit Mean-Elements Message</s1>

seg-4a2ce9f33ab2 = schrijven

seg-9446be51a73a = <c1/>, MCP <c2/>

seg-c239bdbcddd3 = Round-triptest op echte two-line element sets

seg-9fd467ce2279 = SP3-c / SP3-d <s1>Standard Product { "3" }, precieze efemeride</s1>

seg-067520bc1b09 = <c1/>, MCP <c2/>

seg-42b68a98ee82 = Round trip op een echte momentopname van een GPS-constellatie (Global Positioning System)

seg-e8a0dad7ead0 = CCSDS TDM <s1>Tracking Data Message</s1>

seg-696ed71898a5 = CCSDS Space Packet <s1>telemetrie- en telecommandopakketten</s1>

seg-4148f53f1660 = <c1/>-scenario's

seg-c8f2e02e925c = De gepubliceerde testvectoren op byteniveau van een onafhankelijke bibliotheek

seg-cee385651652 = RINEX <s1>Receiver Independent Exchange Format, navigatie en waarneming</s1>

seg-9120d3e96e5e = lezen

seg-5dfeaaabd166 = Scenario-invoer, zoals <c1/>

seg-4f6d921864a3 = Waarnemingsbestanden van een echt station van de International GNSS (Global Navigation Satellite System) Service

seg-7eae3ac5cd17 = TLE <s1>two-line element set</s1>

seg-67503ad04a17 = <c1/>-scenario's

seg-0a5ab63419ce = De officiële referentievectoren van AIAA (American Institute of Aeronautics and Astronautics)

seg-20b591d58b28 = IONEX <s1>IONosphere map EXchange format</s1>

seg-146a79519d84 = Leest het product van de International GNSS Service; nog geen externe controle vermeld

seg-678851c3516f = IERS-aardoriëntatie <s1>International Earth Rotation and Reference Systems Service</s1>

seg-3da2181d7b7b = <c1/> met een finals2000A-bestand

seg-09e0bb159a04 = Het officiële product, inclusief voorspelde rijen

seg-cba783dd4521 = KIF <s1>Kshana Interchange Format</s1>

seg-bec3ac6a5fc7 = Envelop om elk resultaat

seg-8f2f203560f4 = De eigen versiebeheerde envelop van { -brand }, geen externe standaard; elke afnemer krijgt een compatibiliteitsoordeel

seg-e8a8782a7c4e = JSON, SVG, HTML, CSV <s1>de uitvoer van een run</s1>

seg-cc49e9b6404e = Elke run; MCP <c1/>

seg-7994e9983f27 = Deterministisch op basis van scenario, seed en engineversie

seg-8844d0844559 = IntelliJ · PyCharm · CLion

seg-844c84c5252d = Liever klikken?

seg-6b24b242333a = De plug-in „Kshana — PNT simulator”: klik met rechts op een scenario-<c1/>, kies Run Kshana Scenario en lees de kwaliteitsmaten in een hulpmiddelvenster.

seg-65bab13d3eb4 = Openen in de JetBrains Marketplace

seg-8b49f6477e8f = Open kern

seg-3a199156b86e = Elk onderdeel op deze pagina is de vrije open kern, onder de AGPL-3.0 of een commerciële licentie voor gesloten integratie. Wilt u het in uw toolchain geïntegreerd hebben, of een studie voor u laten uitvoeren? <a1>Studie op maat</a1>. Bewijspakketten en gekalibreerde modellen: <a2>{ -brand } Pro</a2>.

seg-c9844e6afd41 = De benchmark uitvoeren

seg-bd7b70852d88 = De benchmark uitvoeren.

seg-193ee1ab991e = <c1/> zet een inzendingsbestand en de referentie van een split om in een resultaatbestand, en <c2/> zet resultaatbestanden om in een statische pagina. Er draait niets namens u en er wordt niets geüpload.

seg-0c50b3629e39 = De benchmark openen
