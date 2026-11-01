# developers: translations (nl)

seg-d5807f566761 = De statische koppeling aan publieke raamwerken (<c1/> / <c2/>) als Markdown: één tabel per raamwerk met per rij de geparafraseerde eis, de { -brand }-uitvoer die er bewijs voor levert en de lacune die de uitvoer niet dicht; of, met <c3/> op true, de brondocumenten waaraan de tabellen refereren, met versies en URL's. Voorafgegaan door de verklaring die elk rapport bevat en die bij elk fragment hoort: een rij die als evidenced is gemarkeerd betekent dat een run bewijs levert voor de mogelijkheden die de rij noemt; het is geen bevinding dat een raamwerk is gehaald en het betekent niet dat een product door wie dan ook is beoordeeld of goedgekeurd. Vereist geen runs.

seg-01fd088cd243 = Bepaal de sensorparameters van de scenario's <c1/> en <c2/> uit een logbestand van een stilstaande IMU (<c3/>, docs/MACHINE-INPUTS.md). Die scenario's nemen ruisparameters, geen tijdreeks: dit leest ze af uit een log die is opgenomen terwijl de sensor stilstond, met de overlappende Allan-deviatie van het geïntegreerde signaal. Geeft JSON terug: <c4/> (versnellingsmetervooroordeel, PSD van de velocity random walk <c5/>, gyrovooroordeel, PSD van de angle random walk <c6/>, de ondergrens van de biasinstabiliteit als de log lang genoeg is om er een te tonen, de samplefrequentie en tijdspanne van de log, de vroege Allan-hellingen en <c7/> over wat niet kon worden bepaald of niet betrouwbaar was), <c8/> (een <c9/>-tabel waarvan de herkomst de SHA-256 van de log noemt, klaar om in een scenario te plakken) en <c10/>. Een log die niet stilstond, of te kort of ongelijk bemonsterd is, geeft onjuiste parameters of wordt geweigerd; de hellingen (ongeveer -0.5 waar witte ruis overheerst) laten zien welk geval zich voordoet. Er wordt niets naar schijf geschreven. Bewijsniveau: MODELLED (de schatter toegepast op de log, geen externe onafhankelijke referentie).

seg-5b15806ef8af = Geef een lijst van de standaardenpakketten (<c1/>): gescoorde scenarioreeksen voor de testprofielen van het DHS Resilient PNT-raamwerk, IMO MSC.1/Circ.1575 en ICAO Doc { "9849" } Appendix F, elk met de drempels die het vóór de run vastlegt en de compliance-rijen waarvoor het bewijs levert. Vereist geen invoer. Een pakket meet gemodelleerde scenario's aan de hand van vastgelegde drempels; het beoordeelt geen product. Bewijsniveau: MODELLED.

seg-b0ad081ceea6 = Voer één standaardenpakket uit (<c1/>): elk scenario erin, gescoord aan de hand van drempels die vóór de run zijn vastgelegd. Geeft het rapport terug (elke test <c2/>, <c3/>, of <c4/> als er een ontvangerlog nodig is en er niet wordt gescoord; elke drempel met zijn gemeten en verwachte waarde) en hetzelfde als <c5/>. Geef het rapport-JSON door aan <c6/> om de rijen te zien waarvoor het pakket bewijs levert. Zeg ondubbelzinnig dat een drempel met MET betekent dat een gemodelleerd scenario een vastgelegde drempel heeft gehaald, en dat NOT MET een resultaat is dat op record staat; beschrijf de uitvoer nooit als bewijs dat een product of een raamwerk is gehaald. Alleen adviserend: analyse-uitvoer, geen typegoedgekeurde navigatieapparatuur. Bewijsniveau: MODELLED.

seg-fbdd90ad8ddf = Controleer het LunaNet Augmented Forward Signal (AFS) aan de hand van de gepubliceerde specificatie, vastgepind op LNIS Version { "5" } Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }) (<c1/>, docs/LUNANET-AFS.md). Modus <c2/> controleert deze implementatie aan de hand van de afgedrukte codetabellen van het document (de eerste en laatste { "24" } chips van elke AFS-I Gold-, AFS-Q Weil- en tertiaire code voor PRN { "1" } tot { "210" }, en beide Legendre-reeksen) en uitgewerkte voorbeelden (SB1 BCH, CRC-24Q), drempels B1 tot en met B10 van een preregistratie; B4 meldt één misser (het document drukt dezelfde laatste { "24" } chips af voor tertiaire PRN { "147" } en { "151" }). Modus <c3/> controleert een hard-decisionsymboolstroom (tekst van { "0" } en { "1" }) op het synchronisatiepatroon, SB1-decodering, FID, TOI-continuïteit en frameafstand. Subframes { "2" } tot en met { "4" } (rate-1/2 LDPC, CRC-24Q) zijn NIET geverifieerd: de LDPC-matrices staan in een aparte bijlage die niet is geïmplementeerd. Modus <c4/> geeft een teststroom met plaatsvervangende subframes: symbolen, geen golfvorm; { -brand } schrijft geen signaal. VALIDATED alleen aan de hand van de afgedrukte tabellen van die uitgave, die het document zelf als TBC markeert; zeg dat, en beschrijf een resultaat niet als bewijs dat een LunaNet-node of -dienst correct is. Alleen adviserend.

seg-b38b9289f0ce = Score een kshana-bench-inzending (<c1/>, bench/SPEC.md, docs/BENCH.md): een voorspellingsbestand (<c2/>) tegen een referentiebestand (<c3/>), beide JSON-tekst, hoogstens { "4" } MiB elk, en geef het resultaatbestand (<c4/>) terug met de specificatieversie, taak (a detectie op ontvangerlogs, b detectie op IQ, c voorspelling van timing-holdover, d optimismekloof buiten de verdeling), split, de SHA-256 van beide invoerbestanden en de meetwaarden van de taak (AUC, detectiekans bij een plafond voor valse alarmen, RMSE per horizon, of de optimismekloof). <c5/> is de opgegeven alarmdrempel van taken a en b. Er wordt niets van schijf gelezen of geschreven. Elke score is MODELLED en beschrijft een log of corpus, nooit een product; het is geen certificering en geen enkele organisatie wordt door een score onderschreven. Bewijsniveau: MODELLED.

seg-96aa4ec83eec = Toon kshana-bench-resultaatbestanden (<c1/>) als de statische ranglijstpagina, HTML-tekst in het antwoord: <c2/> is een lijst van JSON-teksten van <c3/> (hoogstens { "256" }, elk { "4" } MiB), elk eerst getoetst; een bestand dat onder een andere hoofdversie van de specificatie is gescoord wordt geweigerd, omdat resultaten van verschillende hoofdversies nooit in één tabel worden gezet. Een rij zegt dat dit bestand dit getal scoorde op deze split; het betekent niet dat een product door wie dan ook is beoordeeld of goedgekeurd. Er wordt niets geschreven. Bewijsniveau: MODELLED.

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

seg-7c6f4dc6bcba = Interoperabiliteit

seg-1ae202ecd892 = Eén engine. <s1>Elke toegang.</s1>

seg-895535d4e6f1 = Eén Rust-engine voor de veerkracht van GNSS (Global Navigation Satellite System) en PNT (positiebepaling, navigatie en tijdsynchronisatie): een opdrachtregelinterface (CLI), pakketten voor Rust, Python en JavaScript, { -brand } Studio in de browser, een plug-in voor JetBrains-IDE's (integrated development environment) en een MCP-server (Model Context Protocol), zodat een AI-assistent (kunstmatige intelligentie) de getoetste engine uitvoert in plaats van de wiskunde te gokken. Opensource onder de AGPL-3.0 (GNU Affero General Public License, versie { "3" }) of een commerciële licentie.

seg-5e769032a8f2 = Terminal · <b>kshana</b> <s1>v{ $version }</s1>

seg-a33627692dbc = De weergave pauzeren

seg-02926579bdbf = Opgenomen run

seg-96eb5cc68188 = Terminalweergave van echte kshana-opdrachten en hun uitvoer

seg-da51d906ef9a = Echte opdrachten, echte uitvoer, afgespeeld zoals vastgelegd. In de uitvoer: SV's, ruimtevaartuigen (satellieten); J/S, jammer-tot-signaalverhouding; thr, drempel; RAIM, receiver autonomous integrity monitoring; SQM, monitoring van signaalkwaliteit; p95, het 95e percentiel.

seg-0e3f488d70d1 = Dezelfde engine, elk kanaal

seg-841247f53ae4 = <b>{ -brand } Studio</b><s1>in de browser</s1>

seg-829150d172a6 = <b>Opdrachtregel</b><s1>crates.io</s1>

seg-12b2c6109af2 = <b>Rust-crate</b><s1>crates.io</s1>

seg-d3a0d8c488e5 = <b>Python</b><s1>PyPI (Python Package Index)</s1>

seg-8551c2db41a2 = <b>JavaScript</b><s1>npm · WebAssembly</s1>

seg-08dae73ec16d = <b>MCP-server</b><s1>voor AI-assistenten</s1>

seg-dd627f5fbd38 = <b>Container</b><s1>Docker-image</s1>

seg-ddf6febf53c1 = <b>JetBrains</b><s1>IDE-plug-in</s1>

seg-daa2ac123c80 = Release

seg-75f38b14d6ac = Release <b>v{ $version }</b>

seg-659201a5bbb1 = MCP-hulpmiddelen

seg-2406b4cde89d = AGPL-3.0 of commerciële licentie

seg-bd4da5bc989d = Gegenereerd uit de repository

seg-c7f14b9c4b7e = AI-assistenten

seg-a3c7607259f6 = Manieren om te beginnen

seg-fcd0ebea49bc = Opdrachtregel

seg-85e423fab31a = Rust, Python, JavaScript

seg-76dc5d9ec114 = JetBrains

seg-ebf571f759af = Installeren en AI-assistenten

seg-84812cc9eb32 = Installeren · AI-assistenten

seg-485fee02bbcc = Installeren in één regel. Of in nul.

seg-fa7515f06aa2 = Gegenereerd uit de manifesten van de repository en gecontroleerd tegen de README's ervan, zodat elke opdracht overeenkomt met v{ $version }. <b>kshana-mcp</b> geeft uw AI-assistent dezelfde engine: een TOML-scenario (Tom's Obvious, Minimal Language) erin, JSON (JavaScript Object Notation) en CSV (door komma's gescheiden waarden) eruit.

seg-e07e65946b76 = Uit de manifesten

seg-8b738c82a006 = Kies hoe u installeert

seg-2469b76c5361 = Proberen in de browser

seg-4cd111ab2de6 = Opdrachtregel (Rust)

seg-379f49bff6fb = Python

seg-ada3fcf67363 = JavaScript en WebAssembly

seg-86566e989fd1 = AI-assistent (MCP-server, cargo)

seg-6b1e4eb0f596 = Docker-image

seg-97ea215c09db = Rust-bibliotheek

seg-8e6e6c943c15 = JetBrains-IDE-plug-in

seg-6816f4e1a0a0 = Versie

seg-78240346be65 = Nieuwste

seg-1e466f300d6e = v{ $version } vastzetten

seg-d8008680650d = Voor iedereen, niets te installeren.

seg-567be575c392 = De engine draait lokaal als WebAssembly; er wordt niets geüpload.

seg-3df5e87998a1 = { -brand } Studio openen

seg-baa129bfde8b = Voor ingenieurs die de opdracht kshana willen.

seg-7635e731e2ed = Kopiëren: cargo install kshana

seg-a438a9c22d93 = cargo install kshana

seg-9b7ab12bdc24 = Controleer het daarna

seg-ef5d93d86762 = crates.io: kshana

seg-0bee80bf3587 = Gebruik van de opdrachtregel

seg-7e7bd8b95987 = Voor analisten en notebooks.

seg-f0e7f4300315 = Kopiëren: pip install kshana

seg-f8b955a55c46 = pip install kshana

seg-965e1b5d2d99 = PyPI: kshana

seg-15b1e4c3e367 = Gids voor de Python-API

seg-b617f3e23c43 = Voor web- en Node.js-ontwikkelaars.

seg-e041699adc44 = Kopiëren: npm install kshana

seg-24b13e851369 = npm install kshana

seg-37497aec27f8 = npm: kshana

seg-d74b8819d872 = Gids voor npm en WebAssembly

seg-56691d997ee6 = Voor iedereen die een assistent met MCP-ondersteuning gebruikt.

seg-e28638b04b18 = Kopiëren: cargo install kshana-mcp

seg-e5b97a088d7c = cargo install kshana-mcp

seg-d3fbc25e22ae = Registernaam <c1/>. Registreer hem bij uw client, uit de README van kshana-mcp:

seg-6f1410b393fb = Lokaal binair bestand

seg-fa37e351f6b4 = Kopiëren

seg-34908f7d11bb = crates.io: kshana-mcp

seg-61a4eb09767f = Gids voor de MCP-server

seg-6d9b9517915c = Zonder Rust-toolchain; de MCP-server in een container.

seg-49d67e60d43e = Kopiëren: docker run --rm -i ghcr.io/ashfordeou/kshana-mcp

seg-be7c746091ac = docker run --rm -i ghcr.io/ashfordeou/kshana-mcp

seg-105a50c566fd = GitHub container registry

seg-6d6fb6ef5db5 = Gids voor de MCP-server: Docker

seg-696be127ad12 = Voor Rust-ontwikkelaars die de engine inbouwen.

seg-5916a37aecdc = Kopiëren: cargo add kshana

seg-366139eafcb5 = cargo add kshana

seg-2a7a767138b9 = API-referentie op docs.rs

seg-bd2592af9684 = Voor gebruikers van IntelliJ, PyCharm en CLion.

seg-0aa89091ff42 = Settings → Plugins → Marketplace → zoek naar “Kshana” (plug-in-ID dev.kshana.ide). Klik met de rechtermuisknop op een scenario-.toml en kies Run Kshana Scenario.

seg-f36464ef1b66 = JetBrains Marketplace

seg-9f6e5af01266 = Gids voor de plug-in

seg-f69d7fe65b66 = <b>Rust</b>-engine

seg-33b5c1f7b29e = <b>AGPL-3.0</b> of commerciële licentie

seg-8867b06059d3 = <b>Software bill of materials</b> en buildherkomst bij elke release

seg-4895b1130db4 = AI-assistent + kshana-mcp

seg-4d7cd0c679fc = Afspelen

seg-2eef59dde3f2 = Opgenomen sessie

seg-686139ab9806 = De berichten die een assistent uitwisselt met kshana-mcp, vastgelegd van de server.

seg-50605fd27580 = Vorige stap

seg-32c07578eab3 = Stappen van de opgenomen sessie

seg-2cff891dc970 = Volgende stap

seg-45da99dccd40 = Een opgenomen sessie met de kshana-mcp-server (Model Context Protocol, engine v{ $version }): de assistent geeft de { "49" } hulpmiddelen weer, controleert <c1/> (geldig: gedetecteerde scenariosoort `clock`) en voert het uit: scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity { "1.000" } security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity { "1.000" } security n/a (no attack).

seg-102015d6ebd2 = <c1/>: Voer een { -brand }-scenario uit en geef de tijdreeks ervan terug als animatie.

seg-0247e08ba09d = <c1/>: Beoordeel het vertrouwen in een echt GNSS-ontvangerlogboek: lees een u-blox-UBX-, RINEX { "3" }- (eventueel met uitgezonden navigatiegegevens, wat de eigen positiebepaling van de engine, RAIM en een klokgestuurde monitor toevoegt), Android-GnssLogger- of NMEA-logboek, laat de vertrouwensmonitors draaien (daling van de draaggolf-ruisdichtheid, AGC, jamming-indicator, verlies van vergrendeling, positiesprong, RAIM, klok) tegen een kalibratiebasislijn, en geef terug wanneer en waarom de ontvanger niet meer te vertrouwen was.

seg-155a62e8bc94 = <c1/>: Beoordeel het NMEA { "0183" }-logboek van een vaartuig als batchrun (`kshana receiver-trust` met `[platform] kind = "vessel"`): het scoremodel, de monitors die draaiden en de score van 0 tot 100 van elke epoche met zijn aftrekken, de satellietgeometrie ervan (good, degraded, unknown) met een `label` (good, fair, poor) bij elke epoche, waarbij geometrie alleen aftrekt wanneer die poor is, en een klasse bij elke aftrek (geometry, environment, inconsistency), met `geometry_model` (drempels, het geldende plafond en de ondergrens, en herkomst) en `geometry_summary`.

seg-8ff4e06de726 = <c1/>: Beoordeel een begrensd fragment van de NMEA { "0183" }-stream van een vaartuig zoals `kshana receiver-trust live` dat doet, en geef de vertrouwenstoestand per epoche (calibrating, nominal, degraded, untrusted) en de score van 0 tot 100 terug, met de monitors die aftrokken (live JSON-lines-schema { "1.3" }: elke epoche bevat `position`, een `advisory`-verklaring dat de uitvoer adviserend is, en zijn satelliet-`geometry` (good, degraded met redenen zoals few-satellites of high-pdop, of unknown wanneer het fragment geen GSV of GSA heeft) met een `label` (good, fair, poor; geometrie trekt alleen af wanneer die poor is); elke aftrek bevat een `class`: geometry (de hemel, geen vaststelling dat er geen aanval was), environment of inconsistency (aanvalachtig)), de samenvatting (aantallen per toestand, geometrie en klasse, laagste en laatste score, wanneer de eerste untrusted epoche kwam) en de laatste `$PKSHT`-zin.

seg-7de08fd247e0 = <c1/>: Bind een RFC { "3161" }-tijdstempeltoken aan een bewijspakket (`kshana evidence attach-timestamp`), in het geheugen: `files` is een pakket zoals `create_evidence_pack` het teruggeeft, `token_base64` de bytes van het `.tsr`-bestand van een tijdstempelautoriteit.

seg-dc1953969ec4 = <c1/>: Bouw een GNSS-interferentiekaart uit openlijk gelicentieerde positiemeldingen van vliegtuigen (ADS-B NIC/NACp) of schepen (AIS), aangeleverd als CSV-tekst (`kshana interference-map adsb|ais`).

seg-7a7a1e7a3f0d = <c1/>: De statische koppeling met openbare kaders (`kshana compliance-report --mapping` / `--sources`) als Markdown: één tabel per kader met per rij de geparafraseerde vraag, de { -brand }-uitvoer die er bewijs voor levert en het hiaat dat de uitvoer niet dicht; of, met `sources` op true, de brondocumenten die de tabellen aanhalen, met versies en URL's.

seg-21caa50ec277 = <c1/>: Vul de koppeling met openbare kaders in uit { -brand }-resultaatdocumenten (`kshana compliance-report`): voor welke rijen van zes kaders en standaarden voor veerkracht (het Amerikaanse DHS-kader Resilient PNT v2.0, IMO-richtlijnen voor schepen, EASA-richtlijnen voor de luchtvaart, NIS2 artikel { "21" }, EN { "16803" }, NIST IR 8323r1) de aangeleverde runs bewijs leveren, voor welke niet, en het hiaat dat elke rij behoudt.

seg-e9202a8c1176 = <c1/>: Maak een ondertekend bewijspakket voor een venster van het NMEA { "0183" }-logboek van een vaartuig (`kshana receiver-trust evidence`): de ruwe logbytes voor het venster, de configuratie met elke drempel, de resultaten en redenen per epoche, een zelfstandige samenvattingspagina, en een manifest met de SHA-256 van elk bestand, met de hash van het volledige logboek en een hashketen, ondertekend met Ed25519.

seg-f09af0fa8fcd = <c1/>: Maak het ondertekende round-trippakket voor het laboratorium (`kshana evidence round-trip`, docs/spec/TEST-CONDITIONS.md): koppelt via hash het scenario dat de beweging voortbracht, het document `kshana.test-conditions/1` van het laboratorium, het ontvangerlogboek en de score ervan tegen de vermelde gebeurtenissen, in een ondertekend bewijspakket waarvan `config.json` een `round_trip`-blok bevat.

seg-404efdf9e8d2 = <c1/>: Exporteer een { -brand }-scenario in één interoperabiliteitsformaat: `czml` (Cesium Language, voor CesiumJS), `kml` (Keyhole Markup Language, voor Google Earth en geografische informatiesystemen), `geojson` (RFC { "7946" }), `stk` (Systems Tool Kit-efemeride `.e`, één bestand per satelliet) of `sigmf` (opname in Signal Metadata Format van de gesynthetiseerde samples van een `spectrum`-scenario).

seg-91fc7df72b42 = <c1/>: Exporteer de gepropageerde constellatie van een `orbit`-scenario als CCSDS OEM { "2.0" }-efemeridetekst — de inertiële (TEME) toestandstijdreeks met positie EN snelheid, die vluchtdynamicahulpmiddelen (GMAT / Orekit / STK) lezen.

seg-e7086c7b5491 = <c1/>: Exporteer de gemiddelde elementen van een `orbit`-scenario als CCSDS 502.0-B-2 OMM-catalogus (Orbit Mean-Elements Message) — één OMM per satelliet.

seg-5689ddc45bb8 = <c1/>: Exporteer de gepropageerde constellatie van een `orbit`-scenario als SP3-c-tekst met precieze efemeriden (het standaardformaat voor GNSS-nabewerking).

seg-73b7eb38abe9 = <c1/>: Voer een { -brand }-scenario uit en geef de reproduceerbaarheidstabel ervan terug als CSV-tekst — de byte-stabiele tabel die de CLI schrijft als `<scenario>.table.csv` en die de artikelen aanhalen.

seg-afec41e44d7a = <c1/>: Exporteer de voertuigbeweging en gebeurtenissen van een scenario voor een GNSS-simulator in een laboratorium (`kshana bench-export`, docs/TEST-BENCH.md): een bewegings-CSV en de JSON-beschrijving ervan (aardgebonden en geodetische positie, snelheid, attitude, UTC), NMEA { "0183" }-zinnen GGA/RMC, een waypointtekst wanneer het samplerooster op de milliseconde regelmatig is, en de gebeurtenissen van het scenario als CSV en als `[[events]]`-TOML voor een `receiver-trust`-scenario.

seg-cffb261ea30e = <c1/>: Pas de sensorparameters van de scenario's `hybrid` en `fusion` aan uit een stationair IMU-logboek (`kshana imu-fit`, docs/MACHINE-INPUTS.md).

seg-c31f25888d91 = <c1/>: Genereer synthetische NMEA { "0183" } van de brug voor bemanningstraining uit een `nmea-scenario`-TOML (`kshana nmea-scenario`): een vaartuigtrack en een tijdlijn van gescripte gebeurtenissen (jamming, positie-wegtrekking, tijdspoofing, replay-vertraging, met herstel).

seg-b1ed1e518609 = <c1/>: Geef de TOML-tekst van één meegeleverd referentiescenario terug, byte voor byte het bestand dat de repository onder `scenarios/` meelevert.

seg-aafdb73abfac = <c1/>: Schrijf een GeoJSON-route in een { -brand }-scenario dat een waypointtrack vliegt, en geef de nieuwe scenario-TOML terug (voer die uit met run_scenario).

seg-21086f42f34d = <c1/>: FFT-acquisitie van een of meer PRN's over een IQ-opname in de werkmap (`kshana iq acquire`).

seg-4091e4073457 = <c1/>: Voer een lab-replaycampagne uit die in de werkmap staat (`kshana iq campaign`): opnamen (elk beschreven door een `kshana.test-conditions/1`-bestand met de bekende referentie van het lab) x front-endketens x lusontwerpen, elke cel gevolgd en gescoord tegen de vermelde omstandigheden (tijd tot verlies van vergrendeling, heracquisitietijd, C/N0-degradatie tegen de vermelde J/S naast een analytische referentie met het label MODELLED, percentage valse vergrendeling, PLL/DLL-jitter, beschikbaarheid).

seg-df54bfe48786 = <c1/>: Rapporteer de voortgang van een lab-replaycampagne uit de uitvoermap in de werkmap, uitsluitend door bestanden te lezen: voltooide en openstaande cellen, de opnamen, front-ends en ontwerpen in het plan, en de `digest` zodra elke cel klaar is.

seg-ddc737c9ba9a = <c1/>: Pas front-end- en interferentieonderdrukkings-DSP van de ontvanger toe op een IQ-opname in de werkmap en schrijf het resultaat als nieuwe ruwe opname met een `<out>.json`-sidecar (`kshana iq frontend`).

seg-0f9fef6134e1 = <c1/>: Beschrijf één IQ-opname in de werkmap zonder haar te verwerken: soort (ruw met sidecar, SigMF, SigMF-collectie), sampleformaat, samplefrequentie, middenfrequentie, totaal aantal samples, duur, gegevensbestanden en hun grootte, opnamegrenzen en aantal annotaties, als JSON (dezelfde rij die `kshana iq info` afdrukt).

seg-d416e59af6b1 = <c1/>: Pas het model voor verlies van vergrendeling van de volglus aan op labruns (`kshana iq labfit`): een `iq-labfit`-scenario-TOML noemt een of meer runs, elk een ontvangerlogboek plus de vermelde testomstandigheden; de engine laadt elk logboek, past de lus- en empirische modellen aan, bootstrapt de onzekerheid en berekent de fout op de achtergehouden set.

seg-a409849c2544 = <c1/>: Laat de monitors voor interferentie en spoofdetectie draaien over een IQ-opname in de werkmap (`kshana iq monitor`): de breedbandige monitors `power` en `spectral` en, gegeven `signal` + `prns`, de monitors voor C/N0 en signaalkwaliteit per satelliet, elk tegen een basislijn die is geleerd uit de eerste `baseline_s` seconden (of uit een instellingenbestand).

seg-442716c37495 = <c1/>: Genereer een GNSS-IQ-scène met meerdere satellieten in een bestand in de werkmap (`kshana iq scene`).

seg-d965c4c42205 = <c1/>: De configuratie van de GNSS-IQ-laag, als JSON: `signals` (de signaalnamen die iq_scene, iq_acquire en iq_track accepteren), `enabled` (of de IQ-bestandshulpmiddelen aan staan), `work_dir` (de enige map die ze lezen en schrijven; elk padargument is relatief eraan), `max_samples` (de meeste complexe samples die één aanroep mag genereren of verwerken) en, wanneer uit, `reason`.

seg-0709a11ca4ed = <c1/>: Speel één IQ-opname in de werkmap af over meerdere ontwerpen van de volglus en rapporteer het stationaire resultaat van elk ontwerp (`kshana iq sweep`): de ontwerpen zijn elk ontwerp van een `kshana.loop-design/1`-bestand (`design`), of het product van de lijsten `pll_bws_hz`, `dll_bws_hz`, `spacings_chips` en `coherents` op het ingebouwde ontwerp.

seg-155a371604fb = <c1/>: Controleer een testconditiebestand van een lab (`kshana iq conditions`): een `kshana.test-conditions/1`-bestand, TOML- of JSON-tekst, met de bekende referentie van het lab voor een opname (de verwachte satellieten, de insteltijd, het vermelde schema van jamming of interferentie).

seg-e485776388d7 = <c1/>: Acquireer en volg daarna een of meer PRN's over een IQ-opname in de werkmap (`kshana iq track`): acquisitie initialiseert elk kanaal, waarna de DLL/PLL-lusbank (eventueel FLL-ondersteund) de opname één keer afspeelt.

seg-604b653903df = <c1/>: Lees de gepubliceerde Jammertest-testcatalogus en het zendplan (NPRA/jammertest-plan, MIT) als geplande referentie (`kshana jammertest import`): de slots van één testgebied worden receiver-trust-gebeurtenissen met de catalogus-id en het jaar in elk label.

seg-32761d35a4f0 = <c1/>: Score een ontvangerlogboek tegen het Jammertest-schema (`kshana jammertest score`): per geplande test de detectielatentie (eerste alarm min geplande start), of die binnen de tolerantie, te laat of niet is gedetecteerd, en de hersteltijd (een alarmvrij stuk van `recover_hold_s`), plus de valse alarmen buiten elk slot en zijn beschermperiode.

seg-c41dc865f6f0 = <c1/>: Geef de meegeleverde referentiescenario's weer als JSON: `count`, en `scenarios`, een array van `name`, `kind` en `about` (de eerste zin van de eigen kopcommentaar van het bestand).

seg-8744e56b9d92 = <c1/>: Rapporteer welke interoperabiliteitsexportformaten van toepassing zijn op een { -brand }-scenario, zonder het uit te voeren: een JSON-array met één item per formaat (`czml`, `kml`, `geojson`, `stk`, `sigmf`) met `applies`, de `reason` wanneer het niet van toepassing is, en `spec_url`, de gepubliceerde specificatie die de schrijver volgt.

seg-a16109ccf9e7 = <c1/>: Geef elke ingebouwde { -brand }-scenariosoort weer met zijn beschrijving en verplichte/optionele TOML-velden, als JSON-array.

seg-299e14da6de8 = <c1/>: Geef de standaardenpakketten weer (`kshana standards-pack list`): gescoorde scenariosets voor de testprofielen van het DHS Resilient PNT-kader, IMO MSC.1/Circ.1575 en ICAO Doc { "9849" } Appendix F, elk met de drempels die het voor de run vermeldt en de compliance-rijen waarvoor het bewijs levert.

seg-1097125b8282 = <c1/>: Controleer het LunaNet Augmented Forward Signal (AFS) tegen de gepubliceerde specificatie, vastgezet op LNIS Version { "5" } Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }) (`kshana lunanet-afs-check`, docs/LUNANET-AFS.md).

seg-9a7ca52ec440 = <c1/>: Render kshana-bench-resultaatbestanden (`kshana bench leaderboard`) als de statische leaderboardpagina, HTML-tekst in het antwoord: `results` is een lijst van JSON-teksten `kshana-bench-result/1` (hoogstens { "256" }, { "4" } MiB elk), elk eerst gecontroleerd; een bestand dat onder een andere hoofdversie van de specificatie is gescoord, wordt geweigerd omdat resultaten van verschillende hoofdversies nooit in één tabel worden gezet.

seg-4b61dd090d87 = <c1/>: Voer een { -brand }-scenario uit en geef het rapport terug: een managementsamenvatting, de invoer, elke resultaatwaarde met zijn eenheid en zijn label VALIDATED of MODELLED, de gebeurtenissen, de mogelijkheidsrijen die de run heeft doorlopen, en een reproduceerbaarheidsrecord (engineversie, SHA-256-digests van scenario en resultaat, seed, de opdracht die het reproduceert).

seg-02b4cd768b39 = <c1/>: Vat samen hoeveel van een route door gedegradeerde cellen van een of meer interferentiekaarten loopt (`kshana route-exposure`): voor elke kaart (een per bron per UTC-dag, de GeoJSON die `build_interference_map` teruggeeft) de routelengte en de aandelen van de lengte in gedegradeerde cellen, in cellen die niet gedegradeerd waren, in cellen met te weinig steekproef om te beoordelen, en in cellen die niet zijn waargenomen.

seg-00f57717440f = <c1/>: Voer een { -brand }-PNT-veerkrachtscenario uit een TOML-definitie uit en geef de kwaliteitsmaten ervan terug.

seg-de0623ad4fa4 = <c1/>: Voer één standaardenpakket uit (`kshana standards-pack run <id>`): elk scenario erin, gescoord tegen drempels die vóór de run zijn vermeld.

seg-ac7502865a0b = <c1/>: Score een kshana-bench-inzending (`kshana bench score`, bench/SPEC.md, docs/BENCH.md): een voorspellingsbestand (`kshana-bench-predictions/1`) tegen een referentiebestand (`kshana-bench-truth/1`), beide JSON-tekst, hoogstens { "4" } MiB elk, en geef het resultaatbestand (`kshana-bench-result/1`) terug met de specificatieversie, taak (a detectie op ontvangerlogboeken, b detectie op IQ, c voorspelling van holdover van tijdsynchronisatie, d optimismekloof buiten de verdeling), split, de SHA-256 van beide invoeren en de metrieken van de taak (AUC, detectiekans bij een plafond voor valse alarmen, RMSE per horizon, of de optimismekloof).

seg-961963f408a6 = <c1/>: Hemelgeometrie onder een azimutafhankelijke skyline (een straatcanyon, een haven, een fjord, een containerterminal): vanaf een locatie, een tijdstip en constellatievoorinstellingen, tweeregelige elementensets (`tle`, met een UTC-`epoch`) of satellieten gegeven als azimut/elevatie of ECEF, welke satellieten zichtbaar zijn en welke door de skyline verborgen, GDOP/PDOP/HDOP/VDOP/TDOP uit de door gnss_lib_py gecontroleerde DOP-kern, de east-north-up-cofactor en covariantie met één ontvangerklok per systeem (of één gemeenschappelijke), en de horizontale foutellips bij één sigma en bij een vermeld betrouwbaarheidsniveau voor een vermelde UERE.

seg-76679b4d7efd = <c1/>: Render een GNSS-vertrouwensstream of een `receiver-trust`-resultaat als beveiligingstelemetrietekst (`kshana trust-telemetry`, docs/TRUST-TELEMETRY.md), met dezelfde encoders als de opdrachtregel: `prometheus` (de exposition van de eindtoestand), `cef` of `leef` (één RFC { "5424" }-syslogregel per bandwijziging, of per epoche met `syslog_all`; geen tijdstempel, omdat er geen klok wordt gelezen) of `otlp` (de OTLP/HTTP-JSON-metricspayload).

seg-e20044725e3a = <c1/>: Controle vooraf van een { -brand }-scenario-TOML: verifieer dat het als TOML parset en detecteer de scenariosoort ervan, zonder het uit te voeren.

seg-2598d06895ec = <c1/>: Verifieer een ondertekend bewijspakket (`kshana evidence verify`): de SHA-256 van elk bestand tegen het manifest, de hashketen, de Ed25519-handtekening, en met `public_key` (de sleutel van de ondertekenaar, van de ondertekenaar via een andere route) dat de ondertekenaar de verwachte is, en met `full_log` dat het logboek dat u hebt het logboek is dat het pakket vastlegt en dat het fragment eruit komt.

seg-62b5564e8d90 = De opgenomen sessie wordt hier stap voor stap afgespeeld.

seg-2359edf78388 = <b>Dezelfde run in de Studio:</b> Engine v{ $version } · <c1/> · seed { "42" }

seg-c24f65399c72 = <b>{ "49" } hulpmiddelen</b> via de openbare { -brand }-API (application programming interface), in het officiële MCP-register als <c1/>. Baanexports: SP3 (Standard Product { "3" }) en CCSDS (Consultative Committee for Space Data Systems) OMM en OEM (berichten met gemiddelde baanelementen en efemeriden, TEME: True Equator, Mean Equinox-stelsel). Registreer het onder <b>AI-assistent (MCP-server)</b> of <b>Docker-image</b>. <a1>Documentatie van de MCP-server</a1>

seg-306a0232c581 = Voer een { -brand }-PNT-veerkrachtscenario uit een TOML-definitie uit en geef de kwaliteitsmaten ervan terug. Geeft de voor mensen leesbare samenvatting gevolgd door de volledige resultaat-JSON (FoM's, curven). { -brand } toetst SGP4/SDP4, IAU-referentiestelsels, Allan-deviaties, GNSS-beschikbaarheid/DOP, ARAIM-beschermingsniveaus, GNSS/INS-fusie en kwantumsensormodellen aan gepubliceerde referenties. Elke soort loopt via dit ene hulpmiddel, waaronder <c1/> (radiofrequentiespectrum en waterfall), <c2/>, <c3/> en <c4/> (constellaties rond elk hemellichaam), <c5/> (gekoppelde fasen, parametersweeps, Monte Carlo-ensembles en samengestelde scenario's) en de navigatiesoorten voor de lage aardbaan <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/> en <c12/>. De inhoud staat inline: een scenarioveld dat een bestand noemt, wordt geweigerd, en een scenario is hoogstens { "4" } MiB. Roep eerst list_scenario_kinds aan om scenariotypen en hun velden te ontdekken, en list_example_scenarios / get_example_scenario voor een volledig uitvoerbaar scenario van een soort.

seg-5fe1f6a80612 = Geef elke ingebouwde { -brand }-scenariosoort weer met zijn beschrijving en verplichte/optionele TOML-velden, als JSON-array. Gebruik dit om te ontdekken welke scenario's kunnen worden uitgevoerd en hoe u een geldige scenario-TOML voor run_scenario opbouwt.

seg-8117177c2251 = Controle vooraf van een { -brand }-scenario-TOML: verifieer dat het als TOML parset en detecteer de scenariosoort ervan, zonder het uit te voeren. Geeft de gedetecteerde soort terug, of een beschrijvende fout bij misvormde TOML. (run_scenario voert de volledige controle uit door het scenario uit te voeren.)

seg-a2825327dc19 = Beoordeel het vertrouwen in een echt GNSS-ontvangerlogboek: lees een u-blox-UBX-, RINEX { "3" }- (eventueel met uitgezonden navigatiegegevens, wat de eigen positiebepaling van de engine, RAIM en een klokgestuurde monitor toevoegt), Android-GnssLogger- of NMEA-logboek, laat de vertrouwensmonitors draaien (daling van de draaggolf-ruisdichtheid, AGC, jamming-indicator, verlies van vergrendeling, positiesprong, RAIM, klok) tegen een kalibratiebasislijn, en geef terug wanneer en waarom de ontvanger niet meer te vertrouwen was. Optionele <c1/> met inzetmomenten en voorspelde C/N0-dalingen worden gescoord tegen toleranties die in het scenario zijn vermeld: gedetecteerd, te laat of gemist, en akkoord of niet akkoord. Geeft de samenvatting en de volledige resultaat-JSON terug (grafiek en CSV op verzoek; de CSV van een vaartuigrun begint met een <c2/>-commentaarregel met de adviserende verklaring, die CSV-lezers met hun commentaaroptie overslaan). De bytes van het logboek gaan inline in de TOML als <c3/> of <c4/> (alleen inline, hoogstens { "4" } MiB). Een <c5/>-tabel selecteert de maritieme monitors (kinematische consistentie, koers tegenover gestuurde koers, log, antennehoogte, C/N0-spreiding, tijdconsistentie) en voegt een vertrouwensscore van 0 tot 100 per epoche toe met de monitors die aftrokken. Elke epoche bevat ook zijn satelliet-<c6/> (good; degraded bij weinig satellieten of hoge PDOP of HDOP; of unknown waar het logboek geen satellietelevaties of DOP heeft); elke epoche heeft een <c7/> (good, fair, poor); voor een vaartuig komt een <c8/>-monitor in de score, die alleen aftrekt wanneer de geometrie poor is (hoogstens { "15" } punten: degraded, nooit untrusted), en elke aftrek bevat een klasse: geometry (de hemel), environment of inconsistency (aanvalachtig). Gebruik <c9/> voor een streamfragment met de poort. Alleen adviserend; bewijsniveau MODELLED.

seg-16bf5c78c5e2 = Geef de meegeleverde referentiescenario's weer als JSON: <c1/>, en <c2/>, een array van <c3/>, <c4/> en <c5/> (de eerste zin van de eigen kopcommentaar van het bestand). Elk is een volledig scenario dat zoals het is draait, dus dit is de snelste weg naar een geldige TOML voor een soort: kies een naam, haal het op met get_example_scenario, bewerk het, voer het uit. Geef <c6/> mee om alleen de voorbeelden van één soort weer te geven (bijvoorbeeld <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>).

seg-ced10df38705 = Geef de TOML-tekst van één meegeleverd referentiescenario terug, byte voor byte het bestand dat de repository onder <c1/> meelevert. Geef de tekst (bewerkt of niet) door aan run_scenario, report_scenario, animate_scenario of een exporthulpmiddel. Namen komen uit list_example_scenarios. Een scenario dat in de repository bestaat maar niet is meegeleverd, wordt geweigerd met de reden.

seg-2d2aa3ea533c = Voer een { -brand }-scenario uit en geef het rapport terug: een managementsamenvatting, de invoer, elke resultaatwaarde met zijn eenheid en zijn label VALIDATED of MODELLED, de gebeurtenissen, de mogelijkheidsrijen die de run heeft doorlopen, en een reproduceerbaarheidsrecord (engineversie, SHA-256-digests van scenario en resultaat, seed, de opdracht die het reproduceert). <c1/> is <c2/> (standaard; het machineleesbare <c3/>) of <c4/> (het afdrukbare, zelfstandige <c5/> met de grafiek ingebed). Het rapport van een campagne bevat ook zijn sweeptabel of Monte Carlo-verdeling. Het rapport is een zuivere functie van het scenario: er wordt geen klok gelezen.

seg-9bb33a881133 = Voer een { -brand }-scenario uit en geef de tijdreeks ervan terug als animatie. <c1/> is <c2/> (standaard: één geanimeerde SVG, zonder script), <c3/> (één zelfstandige spelerpagina) of <c4/> (genummerde statische SVG-frames plus <c5/>, hoogstens { "120" } frames in een antwoord). Optioneel <c6/> ({ "1" } tot { "60" }, standaard { "12" }), <c7/> ({ "0.5" } tot { "600" }, standaard { "8" }) en <c8/> ({ "480" } tot { "3840" } pixels, standaard { "960" }). Het eerste inhoudsitem is een JSON-samenvatting van wat is getekend: het tijdbereik en de eenheid, de titels van de grafieken, het aantal fasen en gebeurtenissen, of er een spectrumwaterfall aanwezig is, de resultaatpaden waaruit de lijnen zijn gelezen, elke weggelaten reeks en de bestandsnamen. De bestanden volgen, elk één inhoudsitem, in de volgorde die de <c9/> van de samenvatting noemt. Een soort waarvan het resultaat geen bemonsterde tijdas heeft, wordt geweigerd met een bericht dat dat zegt. De animatie is een MODELLED-presentatie van de eigen getallen van de run; hetzelfde scenario en dezelfde opties geven byte-identieke bestanden.

seg-21e22c397c8c = Rapporteer welke interoperabiliteitsexportformaten van toepassing zijn op een { -brand }-scenario, zonder het uit te voeren: een JSON-array met één item per formaat (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) met <c6/>, de <c7/> wanneer het niet van toepassing is, en <c8/>, de gepubliceerde specificatie die de schrijver volgt. CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON en de STK-efemeride (Systems Tool Kit) <c9/> beschrijven de geometrie van het scenario; SigMF (Signal Metadata Format) legt de samples vast die een <c10/>-scenario met een <c11/>-blok synthetiseert. Roep dit aan vóór export_interop.

seg-d3e67d0d2ea2 = Exporteer een { -brand }-scenario in één interoperabiliteitsformaat: <c1/> (Cesium Language, voor CesiumJS), <c2/> (Keyhole Markup Language, voor Google Earth en geografische informatiesystemen), <c3/> (RFC { "7946" }), <c4/> (Systems Tool Kit-efemeride <c5/>, één bestand per satelliet) of <c6/> (opname in Signal Metadata Format van de gesynthetiseerde samples van een <c7/>-scenario). Het eerste inhoudsitem is een JSON-index: <c8/>, <c9/> en <c10/>, elk met zijn <c11/> (wat de opdrachtregel aan de uitvoernaam toevoegt, bijvoorbeeld <c12/> of <c13/>), <c14/>, <c15/> en <c16/>. De bestanden volgen, elk één inhoudsitem, in indexvolgorde: <c17/>-bestanden als hun tekst, het binaire SigMF-samplebestand als <c18/>. Een campagne exporteert elk lidscenario waarop het formaat van toepassing is. Een formaat dat niet van toepassing is, wordt geweigerd met de reden; list_export_formats rapporteert alle vijf tegelijk. Tijden zijn in gecoördineerde wereldtijd (UTC); hetzelfde scenario geeft byte-identieke bestanden.

seg-adaa83fc94c7 = Schrijf een GeoJSON-route in een { -brand }-scenario dat een waypointtrack vliegt, en geef de nieuwe scenario-TOML terug (voer die uit met run_scenario). De route is een <c1/> (of een <c2/> / <c3/> die er een bevat) van posities met lengte- en breedtegraad; ze vervangt <c4/>, <c5/>, <c6/>, <c7/> en <c8/> van het scenario. De soorten die een route accepteren zijn <c9/>, <c10/>, <c11/> en <c12/>; elke andere soort wordt geweigerd met de reden. Geef de twee uiteinden van de track, of gelijkmatig verdeelde posities langs een rechte lijn: de tracksoorten vliegen start + i*step, dus elke andere vorm wordt geweigerd.

seg-11062cbf180a = Exporteer de gepropageerde constellatie van een <c1/>-scenario als SP3-c-tekst met precieze efemeriden (het standaardformaat voor GNSS-nabewerking). Geeft een fout als het scenario geen orbit-soort is.

seg-97461f85b298 = Exporteer de gemiddelde elementen van een <c1/>-scenario als CCSDS 502.0-B-2 OMM-catalogus (Orbit Mean-Elements Message) — één OMM per satelliet. Geeft een fout als het scenario geen orbit-soort is.

seg-9e12e635d64d = Exporteer de gepropageerde constellatie van een <c1/>-scenario als CCSDS OEM { "2.0" }-efemeridetekst — de inertiële (TEME) toestandstijdreeks met positie EN snelheid, die vluchtdynamicahulpmiddelen (GMAT / Orekit / STK) lezen. Dit is de aanvulling met snelheid op het alleen-positie-hulpmiddel <c2/>. Geeft een fout als het scenario geen orbit-soort is.

seg-521b51ec756b = Voer een { -brand }-scenario uit en geef de reproduceerbaarheidstabel ervan terug als CSV-tekst — de byte-stabiele tabel die de CLI schrijft als <c1/> en die de artikelen aanhalen. Alleen deze soorten leveren er een: <c2/>, <c3/>, <c4/>, <c5/>, <c6/> wanneer de <c7/>-analyse draait op een <c8/>- of <c9/>-berichtmodel (de tabel met uitgezonden efemeriden), en <c10/> wanneer zowel <c11/> als <c12/> zijn ingesteld. Geeft een fout bij elke andere soort (of een ongeldig scenario); gebruik run_scenario voor de kwaliteitsmaten.

seg-7937ed00cbc0 = Hemelgeometrie onder een azimutafhankelijke skyline (een straatcanyon, een haven, een fjord, een containerterminal): vanaf een locatie, een tijdstip en constellatievoorinstellingen, tweeregelige elementensets (<c1/>, met een UTC-<c2/>) of satellieten gegeven als azimut/elevatie of ECEF, welke satellieten zichtbaar zijn en welke door de skyline verborgen, GDOP/PDOP/HDOP/VDOP/TDOP uit de door gnss_lib_py gecontroleerde DOP-kern, de east-north-up-cofactor en covariantie met één ontvangerklok per systeem (of één gemeenschappelijke), en de horizontale foutellips bij één sigma en bij een vermeld betrouwbaarheidsniveau voor een vermelde UERE. Zonder <c3/> beschrijft het een REPRESENTATIVE skylinevoorinstelling met haar herkomst en haar doorsnede per graad (een lege <c4/> geeft ze weer). Scenario's van de soorten orbit en integrity (met <c5/>), gnss-sim, jamming, leo-pvt en leo-pass nemen dezelfde <c6/>-sectie op via run_scenario. Bewijsniveau MODELLED: geometrie onder een vermeld foutmodel, alleen zichtlijn; geen voorspelling van de werkelijke fout van een ontvanger en geen integriteitsgrens; voorinstellingen voor constellaties zijn een representatieve hemel, niet de hemel van een bepaalde datum; <c7/>-tekst met een <c8/> (UTC) geeft de hemel die die elementensets op dat tijdstip geven (SGP4), geen meting, en <c9/> zegt welke van de twee. Draagt de adviserende verklaring: geen typegoedgekeurde navigatieapparatuur. Geen Monte Carlo via MCP (bulkmonsters; gebruik de CLI, Python of WASM). Alleen inline, hoogstens { "4" } MiB.

seg-f6856d69fa14 = De configuratie van de GNSS-IQ-laag, als JSON: <c1/> (de signaalnamen die iq_scene, iq_acquire en iq_track accepteren), <c2/> (of de IQ-bestandshulpmiddelen aan staan), <c3/> (de enige map die ze lezen en schrijven; elk padargument is relatief eraan), <c4/> (de meeste complexe samples die één aanroep mag genereren of verwerken) en, wanneer uit, <c5/>. IQ-samples reizen nooit door het protocol: hulpmiddelen nemen bestandspaden in de werkmap en antwoorden met compacte JSON-samenvattingen. De IQ-laag voegt geen synthese van interferentie of spoofers toe; er wordt nooit iets uitgezonden. Roep dit eerst aan.

seg-e15b65f4df6d = Beschrijf één IQ-opname in de werkmap zonder haar te verwerken: soort (ruw met sidecar, SigMF, SigMF-collectie), sampleformaat, samplefrequentie, middenfrequentie, totaal aantal samples, duur, gegevensbestanden en hun grootte, opnamegrenzen en aantal annotaties, als JSON (dezelfde rij die <c1/> afdrukt). Optioneel <c2/> beschrijft een ruw bestand zonder sidecar; optioneel <c3/> voegt de SHA-256 van elk gegevensbestand toe (leest het hele bestand).

seg-b8cad9d1eb3a = Genereer een GNSS-IQ-scène met meerdere satellieten in een bestand in de werkmap (<c1/>). Modus met vermeld profiel: <c2/> + <c3/> (+ optioneel <c4/>, <c5/>, <c6/>). Broadcastmodus: <c7/> (een RINEX-navigatiebestand in de werkmap) + <c8/> [lat, lon, alt] plaatst elke gezonde GPS-satelliet op zijn ware uitgezonden geometrie. Optioneel <c9/> past op signaalniveau ionosfeer, troposfeer, scintillatie, multipath, landmobiele schaduwwerking of NLOS toe. <c10/> moet binnen het samplebudget passen (zie iq_signals). Schrijft de opname (ruw + <c11/>-sidecar, of een SigMF-paar) en een referentie-sidecar; antwoordt met de geschreven bestanden en hun bytetellingen, het aantal samples en de bemonstering, en de eerste epoche van de referentie per satelliet (codefase, Doppler, C/N0) om iq_acquire tegen te scoren. De IQ-laag voegt geen synthese van interferentie of spoofers toe; er wordt nooit iets uitgezonden.

seg-876517d21d1a = FFT-acquisitie van een of meer PRN's over een IQ-opname in de werkmap (<c1/>). Leest alleen de samples die één zoekactie nodig heeft (coherente × niet-coherente codeperioden), die binnen het samplebudget moeten passen. Optionele <c2/>-stadia (banddoorlaat, notch, blanking, excisie, AGC, kwantisator) draaien eerst. Antwoordt met één detectie per PRN: <c3/>, <c4/>, <c5/>, de genormaliseerde piek <c6/>, de detectie-<c7/> ervan en de <c8/>; <c9/> / <c10/> bewaren het volledige resultaat ook als bestanden, en <c11/> (één PRN; .csv, .json of .bin) bewaart het hele oppervlak van correlatievermogen over Doppler × codefase met de piek en haar parabolische en fijnzoek-Dopplerverfijningen.

seg-fa1361237fc2 = Acquireer en volg daarna een of meer PRN's over een IQ-opname in de werkmap (<c1/>): acquisitie initialiseert elk kanaal, waarna de DLL/PLL-lusbank (eventueel FLL-ondersteund) de opname één keer afspeelt. De gevolgde samples (de hele opname, of de eerste <c2/>) moeten binnen het samplebudget passen. De lussen komen uit <c3/> (een <c4/>-TOML-bestand in de werkmap, <c5/> om er een te kiezen) of het ingebouwde ontwerp, waarbij de lusargumenten het overschrijven; <c6/> acquireert een kanaal opnieuw dat de vergrendeling verliest of foutief vergrendelt. Het volgen streamt, dus het geheugen groeit niet met de opname. Antwoordt met de naam en hash van het ontwerp, eventuele <c7/> (<c8/>: een samplefrequentie die een veelvoud is van de helft van de chipsnelheid maakt de jitter en bias van de codelus onrepresentatief) en, per kanaal, het aantal epochen, de gevolgde seconden, de uiteindelijke Doppler en codefase, de uiteindelijke en gemiddelde C/N0 (dB-Hz), de fracties epochen met fase- en codevergrendeling, <c9/>, de uiteindelijke vergrendelingstoestand, gedetecteerde foutieve vergrendelingen en heracquisities. Uitvoer per epoche gaat alleen naar bestanden: <c10/> (E/P/L, discriminatoren, luststoestanden, C/N0, vergrendelingstoestand; .csv/.jsonl/.bin), <c11/>, <c12/> / <c13/>. Een PRN die niet wordt geacquireerd, wordt geweigerd met zijn statistiek en drempel.

seg-020ed04404e3 = Pas front-end- en interferentieonderdrukkings-DSP van de ontvanger toe op een IQ-opname in de werkmap en schrijf het resultaat als nieuwe ruwe opname met een <c1/>-sidecar (<c2/>). <c3/> kiest uit: <c4/> [lo, hi] FIR, adaptieve <c5/>, puls-<c6/>, frequentiedomein-<c7/>, <c8/>, en een kwantisator met <c9/> bits (voorafgegaan door een automatische AGC tenzij <c10/>), altijd in die volgorde. De hele invoer moet binnen het samplebudget passen. Antwoordt met de verwerkte samples en de geschreven bestanden met hun bytetellingen. Dit verwerkt een opname; het synthetiseert niets.

seg-dda3a2db08a2 = Voer een lab-replaycampagne uit die in de werkmap staat (<c1/>): opnamen (elk beschreven door een <c2/>-bestand met de bekende referentie van het lab) x front-endketens x lusontwerpen, elke cel gevolgd en gescoord tegen de vermelde omstandigheden (tijd tot verlies van vergrendeling, heracquisitietijd, C/N0-degradatie tegen de vermelde J/S naast een analytische referentie met het label MODELLED, percentage valse vergrendeling, PLL/DLL-jitter, beschikbaarheid). Incrementeel: één aanroep voert de openstaande cellen uit die in het samplebudget passen (of <c3/>), elke voltooide cel wordt bewaard en de volgende aanroep hervat. Antwoordt met de celtellingen, fouten, de geschreven bestanden en de <c4/> zodra elke cel klaar is. Scoort alleen opgenomen gegevens; het synthetiseert geen interferentie.

seg-56574d125f36 = Rapporteer de voortgang van een lab-replaycampagne uit de uitvoermap in de werkmap, uitsluitend door bestanden te lezen: voltooide en openstaande cellen, de opnamen, front-ends en ontwerpen in het plan, en de <c1/> zodra elke cel klaar is.

seg-fd13bae9c868 = Speel één IQ-opname in de werkmap af over meerdere ontwerpen van de volglus en rapporteer het stationaire resultaat van elk ontwerp (<c1/>): de ontwerpen zijn elk ontwerp van een <c2/>-bestand (<c3/>), of het product van de lijsten <c4/>, <c5/>, <c6/> en <c7/> op het ingebouwde ontwerp. Elke PRN wordt één keer geacquireerd en elk kanaal (ontwerp, PRN) volgt dezelfde samples, zodat elk resultaat precies dat is van het afzonderlijk uitvoeren van het ontwerp. Antwoordt met, per ontwerp en PRN, <c8/>, <c9/> en <c10/> (over de tweede helft van de run), <c11/>, <c12/>, <c13/> en de hash van het ontwerp; <c14/> / <c15/> bewaren de tabel als bestanden. De gevolgde spanwijdte moet binnen het samplebudget passen (<c16/> beperkt die) en per aanroep draaien hoogstens { "256" } kanalen (ontwerp, PRN). Dit verwerkt een opname; het synthetiseert niets.

seg-99cf77fb08fe = Laat de monitors voor interferentie en spoofdetectie draaien over een IQ-opname in de werkmap (<c1/>): de breedbandige monitors <c2/> en <c3/> en, gegeven <c4/> + <c5/>, de monitors voor C/N0 en signaalkwaliteit per satelliet, elk tegen een basislijn die is geleerd uit de eerste <c6/> seconden (of uit een instellingenbestand). Antwoordt met de reeksen (naam en lengte), elke gebeurtenis die de monitors meldden (begin, einde, monitor, wat veranderde; hoogstens { "200" } in het antwoord), en de instellingen en basislijnen die de monitors leerden; <c7/> bewaart het hele rapport (elke reeks, gebeurtenis en elk spectrum) en <c8/> schrijft <c9/> en <c10/>. De spanwijdte moet binnen het samplebudget passen (<c11/> beperkt die). Een monitorgebeurtenis zegt dat een gemeten grootheid haar geleerde basislijn verliet; ze benoemt geen oorzaak of bron. Dit scoort alleen opgenomen gegevens; het synthetiseert niets. Bewijsniveau: MODELLED.

seg-e8b21d821c6a = Controleer een testconditiebestand van een lab (<c1/>): een <c2/>-bestand, TOML- of JSON-tekst, met de bekende referentie van het lab voor een opname (de verwachte satellieten, de insteltijd, het vermelde schema van jamming of interferentie). Antwoordt met de opgeloste omstandigheden en hun <c3/>, of de reden dat het bestand ongeldig is. Alleen inline: er wordt niets van schijf gelezen, en een opnamepad dat het bestand noemt, wordt niet geopend (een campagne lost die op binnen de werkmap). De invoer is begrensd op { "4" } MiB.

seg-90cbfeaf9e14 = Pas het model voor verlies van vergrendeling van de volglus aan op labruns (<c1/>): een <c2/>-scenario-TOML noemt een of meer runs, elk een ontvangerlogboek plus de vermelde testomstandigheden; de engine laadt elk logboek, past de lus- en empirische modellen aan, bootstrapt de onzekerheid en berekent de fout op de achtergehouden set. Alles is inline: de <c3/> van elke run geeft <c4/> of <c5/> (een <c6/> wordt geweigerd) en het hulpmiddel leest en schrijft geen bestand, dus het heeft de IQ-werkmap niet nodig. Als alternatief noemt de <c7/> van het scenario <c8/>, een voltooide uitvoermap van <c9/>: het hulpmiddel past dan de C/N0- en vergrendelingsmodellen aan op de gescoorde cellen ervan (een <c10/>-rapport; Q wordt vermeld, nooit aangepast, en de identificeerbare J/S-offset wordt aangepast; met <c11/> is een <c12/>-tabel vereist). Die map wordt relatief aan de IQ-werkmap opgelost en moet erin liggen (alles daarbuiten wordt geweigerd); ze wordt gelezen, er wordt niets geschreven. Antwoordt met het geparste <c13/>, de residuen en voorspellingen als CSV-tekst en een Markdown-samenvatting. De invoer is begrensd op { "4" } MiB. De fit beschrijft de aangeleverde labruns; het is geen voorspelling voor andere ontvangers of omstandigheden buiten wat het rapport vermeldt. Bewijsniveau: MODELLED.

seg-4b20b03eb0df = Beoordeel een begrensd fragment van de NMEA { "0183" }-stream van een vaartuig zoals <c1/> dat doet, en geef de vertrouwenstoestand per epoche (calibrating, nominal, degraded, untrusted) en de score van 0 tot 100 terug, met de monitors die aftrokken (live JSON-lines-schema { "1.3" }: elke epoche bevat <c2/>, een <c3/>-verklaring dat de uitvoer adviserend is, en zijn satelliet-<c4/> (good, degraded met redenen zoals few-satellites of high-pdop, of unknown wanneer het fragment geen GSV of GSA heeft) met een <c5/> (good, fair, poor; geometrie trekt alleen af wanneer die poor is); elke aftrek bevat een <c6/>: geometry (de hemel, geen vaststelling dat er geen aanval was), environment of inconsistency (aanvalachtig)), de samenvatting (aantallen per toestand, geometrie en klasse, laagste en laatste score, wanneer de eerste untrusted epoche kwam) en de laatste <c7/>-zin. <c8/> verklaart het vaartuig (<c9/>, zijn grenzen voor snelheid, versnelling en draaisnelheid, antennehoogte, of er een koerssensor op de bus zit). Het fragment moet het kalibratievenster bevatten; de invoer is begrensd op { "2" } MiB en { "20,000" } epochen, en het antwoord bevat hoogstens { "200" } regels met degraded of untrusted epochen. Dit is de begrensde vorm van de live-opdracht: er wordt geen socket geopend en er wordt niets naar een poort geschreven, en de poort en de telemetrie-exporters (het langlopende proces en zijn <c10/>-server) zijn alleen via de opdrachtregel beschikbaar. De controles kunnen een spoofer niet zien wiens positiebepaling consistent is met alles op de bus. Alleen adviserend: geen typegoedgekeurde navigatieapparatuur; de exploitant blijft verantwoordelijk. Bewijsniveau: MODELLED.

seg-34c1ecfea464 = Lees de gepubliceerde Jammertest-testcatalogus en het zendplan (NPRA/jammertest-plan, MIT) als geplande referentie (<c1/>): de slots van één testgebied worden receiver-trust-gebeurtenissen met de catalogus-id en het jaar in elk label. <c2/> bevat één planbestand per dag, <c3/> is de eerste epoche van het logboek, <c4/> de afwijking van het plan ten opzichte van UTC (standaard { "2" }, CEST). Geeft <c5/> terug (voeg het toe aan een receiver-trust-sessie), <c6/> (test-id, soort, begin en einde in seconden sinds het begin van het logboek) en de aantallen die zijn overgeslagen. De gebeurtenissen zijn GEPLANDE slots, geen vastgelegde uitzendtijden: een slot kan te laat beginnen of nooit draaien, en het veld <c7/> van het plan is meestal leeg. Er wordt geen contact- of persoonlijk veld van het plan gelezen. De invoer is begrensd op { "4" } MiB per tekst. Bewijsniveau: MODELLED.

seg-b6c610d771dd = Score een ontvangerlogboek tegen het Jammertest-schema (<c1/>): per geplande test de detectielatentie (eerste alarm min geplande start), of die binnen de tolerantie, te laat of niet is gedetecteerd, en de hersteltijd (een alarmvrij stuk van <c2/>), plus de valse alarmen buiten elk slot en zijn beschermperiode. <c3/> heeft alleen <c4/> nodig (of rinex, android, nmea, sbf); geef het logboek als <c5/> (tekstformaten) of <c6/> (binair). Heeft de catalogus- en plan-JSON nodig (<c7/>, <c8/>) en het testgebied (<c9/>). Geeft de scorekaart terug: <c10/>, <c11/>, <c12/> en een label MODELLED. Het schema bestaat uit geplande slots, geen vastgelegde uitzendtijden, dus een gemiste test kan een test zijn die nooit draaide. Een ondertekend bewijspakket heeft een ondertekeningssleutel nodig: gebruik de opdrachtregel (<c13/>). De invoer is begrensd op { "4" } MiB per tekst. Alleen adviserend: geen typegoedgekeurde navigatieapparatuur; de exploitant blijft verantwoordelijk. Bewijsniveau: MODELLED.

seg-5cf645381e15 = Beoordeel het NMEA { "0183" }-logboek van een vaartuig als batchrun (<c1/> met <c2/>): het scoremodel, de monitors die draaiden en de score van 0 tot 100 van elke epoche met zijn aftrekken, de satellietgeometrie ervan (good, degraded, unknown) met een <c3/> (good, fair, poor) bij elke epoche, waarbij geometrie alleen aftrekt wanneer die poor is, en een klasse bij elke aftrek (geometry, environment, inconsistency), met <c4/> (drempels, het geldende plafond en de ondergrens, en herkomst) en <c5/>. <c6/> vermeldt de grenzen van het vaartuig en eventuele monitor- of scoreinstellingen (geen <c7/>-tabel nodig) en <c8/> is de logtekst, waardoor u die niet in een TOML-string hoeft te plakken. De invoer is begrensd op { "4" } MiB; het antwoord bevat het document met <c9/> teruggebracht tot aantallen per toestand en hoogstens { "200" } degraded of untrusted epochen. Gebruik <c11/> voor een logboek in een ander formaat, of met <c10/> om te scoren. Alleen adviserend: geen typegoedgekeurde navigatieapparatuur; de exploitant blijft verantwoordelijk. Bewijsniveau: MODELLED.

seg-f65900d7e9e9 = Genereer synthetische NMEA { "0183" } van de brug voor bemanningstraining uit een <c1/>-TOML (<c2/>): een vaartuigtrack en een tijdlijn van gescripte gebeurtenissen (jamming, positie-wegtrekking, tijdspoofing, replay-vertraging, met herstel). Geeft de checksum-geldige zinnenset terug (GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT, VBW; de eerste { "2000" } regels) en het instructeurslogboek (wat wanneer is geïnjecteerd, met de ware track en een <c3/> op het hoogste niveau met pieksnelheden en versnellingen; wegtrekgebeurtenissen bevatten hun piekwegtreksnelheid en -versnelling; schema kshana-nmea-training/1) als JSON en tekst. Het plafond voor zichtbare satellieten van de ontvanger is <c4/> (standaard { "12" }). Deterministisch per <c5/>. ALLEEN TEKST: niets hier synthetiseert RF, IQ of enige golfvorm, er wordt niets uitgezonden, en de uitvoer is voor training en test, nooit voor de live navigatiesystemen van een vaartuig (een markeringszin in de stream zegt dat). Adviserend, geen typegoedgekeurde navigatieapparatuur. Streamen naar een TCP- of UDP-adres kan alleen via de opdrachtregel. Vier voorbeeldscenario's worden meegeleverd in scenarios/training/.

seg-73481bd215d3 = Maak een ondertekend bewijspakket voor een venster van het NMEA { "0183" }-logboek van een vaartuig (<c1/>): de ruwe logbytes voor het venster, de configuratie met elke drempel, de resultaten en redenen per epoche, een zelfstandige samenvattingspagina, en een manifest met de SHA-256 van elk bestand, met de hash van het volledige logboek en een hashketen, ondertekend met Ed25519. <c2/>/<c3/> zijn seconden sinds de eerste epoche van het logboek. Geeft de bestanden terug als JSON (voer ze aan <c4/>), de publieke sleutel van de ondertekenaar en de vingerafdruk. Het ondertekeningsseed wordt nooit teruggegeven of gelogd; als <c5/> ontbreekt, wordt een eenmalige sleutel gebruikt en weggegooid, zodat het pakket de integriteit bewijst tegen de sleutel die het zelf noemt, niet wie het ondertekende: maak voor een sleutel die ertoe doet het pakket op de opdrachtregel (een seed die hier wordt doorgegeven, reist door het gesprek). De invoer is begrensd op { "4" } MiB en het antwoord op { "4" } MiB (maak het venster smaller). Een pakket is een technisch verslag van wat de engine uit een logboek heeft berekend onder vermelde instellingen; het is geen juridisch oordeel, geen vaststelling van feiten over enige gebeurtenis en geen certificering. Bewijsniveau: MODELLED.

seg-255de20bccce = Maak het ondertekende round-trippakket voor het laboratorium (<c1/>, docs/spec/TEST-CONDITIONS.md): koppelt via hash het scenario dat de beweging voortbracht, het document <c2/> van het laboratorium, het ontvangerlogboek en de score ervan tegen de vermelde gebeurtenissen, in een ondertekend bewijspakket waarvan <c3/> een <c4/>-blok bevat. Weigert een pakket waarvan de omstandigheden en scoregebeurtenissen niet overeenkomen, of waarvan de vermelde SHA-256 van het logboek niet die van het logboek is. GEEN SIGNAAL: er wordt niets geschreven, afgespeeld of ingepland; hoe de beweging van een scenario de ontvanger bereikte, is de verantwoordelijkheid van de exploitant en wordt alleen vastgelegd zoals vermeld. Het ondertekeningsseed wordt nooit teruggegeven of gelogd; indien weggelaten wordt een eenmalige sleutel gebruikt en weggegooid (integriteit, geen identiteit). De invoer is begrensd op { "4" } MiB en het antwoord op { "4" } MiB. Een technisch verslag, geen juridisch oordeel of certificering. Bewijsniveau: MODELLED.

seg-c0105e635548 = Verifieer een ondertekend bewijspakket (<c1/>): de SHA-256 van elk bestand tegen het manifest, de hashketen, de Ed25519-handtekening, en met <c2/> (de sleutel van de ondertekenaar, van de ondertekenaar via een andere route) dat de ondertekenaar de verwachte is, en met <c3/> dat het logboek dat u hebt het logboek is dat het pakket vastlegt en dat het fragment eruit komt. Geeft het rapport terug: <c4/>, elke fout met code en bestand, elke controle, <c5/>, notities, en een <c6/>: <c7/> (ondertekenaar vastgepind), <c8/> (alles klopt maar er is geen vertrouwde <c9/> opgegeven, dus de handtekening bewijst alleen dat het pakket intact is tegen de sleutel die het zelf noemt, die iedereen kan genereren; zeg dat, noem het niet geverifieerd) of <c10/>, met een <c11/> om aan de gebruiker te tonen. <c12/> laat een pakket zonder tijdstempeltoken mislukken. De invoer is begrensd op { "4" } MiB. Een geslaagde verificatie zegt dat het verslag ongewijzigd is en wie het ondertekende (de sleutel die u opgaf); ze zegt niet wat een gebeurtenis veroorzaakte, wie verantwoordelijk is, of dat het logboek toont wat de ontvanger werkelijk ontving.

seg-b4ee0795e52c = Bouw een GNSS-interferentiekaart uit openlijk gelicentieerde positiemeldingen van vliegtuigen (ADS-B NIC/NACp) of schepen (AIS), aangeleverd als CSV-tekst (<c1/>). Geeft één GeoJSON-document per UTC-dag terug (schema kshana-interference-map/v1) (bestandsnamen <c2/>; methodeversie { "2" }) waarin elke gepubliceerde rastercel <c3/>, <c4/>, <c5/>, <c6/> of <c7/> is (ADS-B) of <c8/>/<c9/> (AIS), met de methode, haar vooraf vastgelegde drempels, de licentie van de dataset en de naamsvermelding ingebed. Elke telling per cel onder het publicatieminimum ({ "5" }) is <c10/> (achtergehouden, nooit nul), en een dag waarvan de achtergrond niet kan worden geschat, houdt zijn oordelen achter. Alleen aggregaten: identificatoren worden in het geheugen gehasht en nooit teruggegeven, en een cel met minder dan { "5" } verschillende vliegtuigen of vaartuigen wordt niet gepubliceerd. <c11/> is een toegestane voorinstelling of <c12/> (met licence, licence_url, attribution). De invoer is begrensd op { "4" } MiB en het antwoord op { "4" } MiB (gebruik een grovere <c13/> of de opdrachtregel voor meer). Er wordt niets opgehaald: landpolygonen, indien gewenst voor AIS, worden aangeleverd. Een gedegradeerde cel identificeert interferentie niet als oorzaak; een niet-gepubliceerde cel is geen bewijs van een vrije cel; dit is geen voorspelling. Bewijsniveau: MODELLED.

seg-d3175204c0ea = Vat samen hoeveel van een route door gedegradeerde cellen van een of meer interferentiekaarten loopt (<c1/>): voor elke kaart (een per bron per UTC-dag, de GeoJSON die <c2/> teruggeeft) de routelengte en de aandelen van de lengte in gedegradeerde cellen, in cellen die niet gedegradeerd waren, in cellen met te weinig steekproef om te beoordelen, en in cellen die niet zijn waargenomen. De route is een GeoJSON-LineString of <c3/>-CSV-tekst; <c4/>/<c5/> (YYYY-MM-DD) houden kaarten binnen een datumbereik. De invoer is begrensd op { "4" } MiB per item. Niet-waargenomen cellen zijn geen bewijs van een vrije route; een gedegradeerde cel identificeert interferentie niet als oorzaak; dit beschrijft eerdere meldingen en is geen voorspelling. Bewijsniveau: MODELLED.

seg-e11a6425c180 = Vul de koppeling met openbare kaders in uit { -brand }-resultaatdocumenten (<c1/>): voor welke rijen van zes kaders en standaarden voor veerkracht (het Amerikaanse DHS-kader Resilient PNT v2.0, IMO-richtlijnen voor schepen, EASA-richtlijnen voor de luchtvaart, NIS2 artikel { "21" }, EN { "16803" }, NIST IR 8323r1) de aangeleverde runs bewijs leveren, voor welke niet, en het hiaat dat elke rij behoudt. Geef elke run mee als <c2/>, <c3/> (de resultaat-JSON-tekst) en, wanneer u die hebt, <c4/> (de scenario-TOML, die de soort noemt die een resultaat niet noemt; een receiver-trust-resultaat heeft er geen nodig). Hoogstens { "64" } runs en { "4" } MiB in totaal; er wordt niets van schijf gelezen. De <c5/> van elke rij is <c6/>, <c7/>, <c8/> of <c9/>, en elke rij behoudt zijn <c10/> ook als er bewijs is; invoer die niet kon worden gebruikt, wordt vermeld in <c11/> en telt voor niets. Toon de <c12/> van het rapport bij elk resultaat, letterlijk: een status betekent dat een run bewijs levert voor de mogelijkheden die de rij noemt; het is geen vaststelling dat aan een kader is voldaan, en het betekent niet dat een product door wie dan ook is beoordeeld of goedgekeurd. Beschrijf de uitvoer niet in sterkere bewoordingen. Bewijsniveau: MODELLED.

seg-f79048f88b5c = Kshana Studio starten

seg-b02b3eeec184 = scenariosoorten

seg-9a86ef058d27 = Openen in Kshana Studio

seg-34a0cf94d83d = De exports van de run openen in Kshana Studio: reproduceerbaar HTML-rapport, JSON, CSV

seg-92ab4fe6f441 = De getekende gegevens downloaden als kommagescheiden waarden

seg-3a93f60a7714 = <s1><a1>Rapport</a1></s1>

seg-c851aa23ea42 = kommagescheiden waarden

seg-366c59b03b4f = CSV
