# docs--npm: translations (nl)

seg-3d770dd786e4 = Gebruik

seg-d4a762001549 = Licentie

seg-81a87d14efda = Kshana: het merkteken, een kompasvizier dat het precieze moment markeert, naast het woordmerk kshana

seg-0ddcab84868f = Bron: <c1/>

seg-32c82b87acd6 = <b>Kshana · <s1>क्षण</s1> · <em>het precieze moment</em></b><br/> Een opensource-simulator voor de veerkracht van PNT (positiebepaling, navigatie en tijdsynchronisatie).

seg-3b861b2f08b8 = Release v{ $version }

seg-6a1906d8d4ad = Ongeveer { "95" }% regeldekking, in continue integratie bewaakt op { "85" }%

seg-a9f4f2795fb5 = Licentie: AGPL-3.0-only, of een commerciële licentie

seg-3f6b9ca5e225 = DOI 10.5281/zenodo.20528627

seg-7fcbe854ebc4 = Oefen de minuut waarin GNSS uitvalt: de missieconsole van Kshana, getekend op basis van een echte run van de engine, een geketende campagne van jamming, spoofing, holdover en integriteit over de { "102" } satellieten van GPS, Galileo, BeiDou en GLONASS

seg-d1153c5e9112 = Oefen de minuut waarin GNSS uitvalt

seg-d284448743af = Kshana speelt jamming, spoofing en klok-holdover na wanneer GNSS-signalen (Global Navigation Satellite System) uitvallen, en vertelt u hoe lang een systeem tijd en positie binnen zijn budget houdt, en welke klok of sensor de meeste marge oplevert. Dit is het WebAssembly-pakket: de hele engine in JavaScript, in de browser of in Node.js. Elke run is bit voor bit reproduceerbaar uit het scenario, de seed en de engineversie.

seg-d1a3f78ad8e0 = Probeer het eerst zonder iets te installeren: <a1>Kshana Studio</a1> draait de hele engine in uw browser, gecompileerd naar WebAssembly, en uploadt niets.

seg-d662055d817f = Het pakket is een ES-module (ECMAScript, standaard-JavaScript) met een WebAssembly-payload, gebouwd voor de browser. Initialiseer het één keer en roep de engine daarna synchroon aan. Het enige verschil tussen de browser en Node.js is hoe het WebAssembly-binary wordt geladen.

seg-0b750617ea08 = <b>In de browser</b> (via een bundler, of een pagina die <c1/> serveert) haalt <c2/> <c3/> op naast de module:

seg-70fc98eb8d2e = <b>In Node.js</b> faalt <c1/> met <c2/> (de <c3/> van Node kan geen lokaal bestand lezen), dus lees het binary van schijf en geef het aan <c4/>:

seg-2c181d5e0942 = Sla de Node.js-versie op als een <c1/>-bestand (of stel <c2/> in in uw <c3/>) zodat <c4/> werkt. Vanaf daar zijn beide gelijk:

seg-06eb982ef260 = TypeScript ziet getypeerde resultaten: <c1/> geeft een <c2/> terug (<c3/>, <c4/>, <c5/>, <c6/>, <c7/>), <c8/> een <c9/> waarvan <c10/> de <c11/>-unie van elke soort is, en <c12/> een <c13/> (of <c14/> bij succes). De eigen velden van elk resultaatdocument verschillen per soort; <c15/> typeert de gedeelde envelop (<c16/>, <c17/> en het <c18/>-blok van <c19/>s).

seg-31d983ae7036 = Vier andere functies beschrijven de engine voor een front-end. <c1/> geeft een JSON-object van soort naar de modules die de rijen van de verificatiematrix noemen, <c2/> een van soort naar de resultaatvelden die zijn vraag beantwoorden (weergavemetadata; de engine leest het nooit), <c3/> de signaalnamen die <c4/> accepteert, en <c5/> een korte synthetische IQ-scène, in het geheugen geacquireerd en gevolgd (hoogstens { "0.25" } s, { "1,000,000" } samples en { "8" } satellieten), met hetzelfde antwoord als de native build.

seg-ceee5ddc0c36 = Op het WebAssembly-vlak is elk toegangspunt een afzonderlijke aanroep: <c1/> (het resultaatdocument als JSON-string), <c2/>, <c3/>, <c4/> (de CSV-tabel (kommagescheiden waarden) van het scenario als string, of <c5/> voor soorten die geen tabel publiceren; het gooit een fout bij een ongeldig scenario), <c6/> (één engine-run die <c7/> als JSON-string teruggeeft — gebruik het wanneer u meer dan één uitvoer wilt, aangezien elke andere aanroep het scenario opnieuw uitvoert), <c8/> (dezelfde uitvoer als één getypeerd object, met het document al geparsed als <c9/>), <c10/>, <c11/> / <c12/> / <c13/> (introspectie; <c14/> geeft de geparsede lijst terug), <c15/> / <c16/> — de codec voor deelbare links (URL, uniform resource locator) die <a1>Kshana Studio</a1> gebruikt om een heel scenario via het fragment in de adresbalk heen en terug te sturen — en <c17/> / <c18/> / <c19/>, de SP3-c- (revisie c van het Standard Product { "3" }-formaat) en CCSDS-efemeridebestanden (Consultative Committee for Space Data Systems) — OMM, het Orbit Mean-elements Message, en OEM, het Orbit Ephemeris Message — die de CLI schrijft — en <c20/>, dat een echt ontvangerlog beoordeelt dat wordt beschreven door een <c21/>-scenario en <c22/> als JSON-string teruggeeft (de browser heeft geen bestandssysteem, dus het log, en elk navigatiebestand, moet inline in het scenario staan als <c23/> of <c24/>; een <c25/>-tabel voegt de maritieme monitors en de vertrouwensscore van 0-100 toe, alleen adviserend), <c26/> / <c27/> (welke interoperabiliteitsformaten een scenario ondersteunt, zonder het uit te voeren, en één export in het geheugen: <c28/>, <c29/>, <c30/>, <c31/> of <c32/> als JSON <c33/>, byte-identiek voor hetzelfde scenario, niets wordt geüpload), <c34/> (een GeoJSON-route geschreven in een scenario met waypoint-spoor, de <c35/> van de opdrachtregel), <c36/> (de tijdreeks van de run als geanimeerde SVG, een enkele HTML-speler of SVG-frames), <c37/> / <c38/> (de meegeleverde referentiescenario's en hun TOML), <c39/> (bind een RFC { "3161" }-token aan een bewijspakket in het geheugen; het pakket moet nog steeds verifiëren en de handtekening van de tijdstempelautoriteit wordt niet gecontroleerd), <c40/> (van welke satellieten de Galileo-navigatiedata een I/NAV-paginabestand of een UBX-stroom authenticeert, met de vertrouwde Merkle-wortel of publieke sleutels en een optionele onafhankelijke referentietijd; het authenticeert data en doet geen claim over anti-spoofingprestaties; niets wordt geüpload), <c41/> (een begrensd NMEA-fragment gescoord zoals de live-modus het scoort; geen gate), <c42/> (het NMEA-log van een vaartuig als batchrun), <c43/> (een vertrouwensstroom of -resultaat als Prometheus-tekst, CEF- of LEEF-syslogregels of een OTLP-payload; niets wordt verzonden), <c44/> (controleer een ondertekend bewijspakket; niets wordt geüpload; pakketten worden gemaakt met de CLI, Python of MCP), <c45/> (de beweging en gebeurtenissen van een scenario als tekst voor een laboratoriumsimulator; er wordt geen signaal geschreven), <c46/> en <c47/> (voor welke rijen met eisen uit een openbaar kader resultaatdocumenten bewijs leveren, met de lacune van elke rij; geen vaststelling dat een kader wordt gehaald), en <c48/> (ADS-B- of AIS-CSV-tekst naar een <c49/> GeoJSON per UTC-dag; alleen geaggregeerd), <c50/> (het aandeel van een route door verslechterde cellen van die kaarten; geen voorspelling), <c51/> (synthetische brug-NMEA en een instructeurslogboek voor bemanningstraining; alleen tekst, nooit voor de live navigatiesystemen van een vaartuig) en de functies voor hemelgeometrie <c52/>, <c53/>, <c54/>, <c55/> en <c56/> (welke satellieten een locatie ziet wanneer gebouwen, kaden of terrein een deel van de hemel blokkeren, met de dilution of precision, de horizontale foutenellips, een geseede Monte Carlo-wolk en een skyplot als SVG-tekst; de zichtbaarheidsbeslissing en de ellips worden gecontroleerd aan onafhankelijke bibliotheken, de voorinstellingen zijn representatieve geometrieën en geen opmetingen, en een skyline verwijdert satellieten in zichtlijn en niets meer). Niet in de browserbuild: <c57/> met zijn gate en TCP-listener, gestreamde training-NMEA en de telemetrie-exporters (Prometheus, OpenTelemetry, syslog) zijn langlopende netwerkprocessen en blijven in het opdrachtregelprogramma; het maken van een bewijspakket vereist een ondertekeningssleutel, die bij de CLI of Python hoort. Er is hier geen <c58/> in één aanroep; die binding bestaat alleen in het Python-wheel.

seg-12a295fba8a5 = Elke mogelijkheid in de verificatiematrix is gelabeld <b>getoetst aan een onafhankelijke externe referentie</b>, <b>modelmatig</b> of <b>in eigendom van een partner</b>; de cijfers voor optische klokken zijn ruimtedoelen op grondhardware (er is nog geen optische strontiumklok gevlogen). De maturiteit is <em>niet</em> uniform over de domeinen — PNT op aarde is getoetst aan echte data; navigatie in de diepe ruimte en op Mars is modelmatig, waarbij alleen de bouwstenen (lichttijd, planeetposities) zijn getoetst aan externe onafhankelijke referenties; baanbepaling (orbit determination) in de diepe ruimte voor echte missies staat op de roadmap.

seg-68ed88ec0b32 = <b>Spectrum</b>: hoe een jammer de GNSS L-band inneemt, band voor band.

seg-f04a0aeeee33 = <b>Klokken en tijdsynchronisatie</b>: holdover tegenover een drempel, tijdoverdracht, en telecom-holdover tegenover de maskers van de standaardisatiesector van de International Telecommunication Union (ITU-T).

seg-7e38ac603ef2 = <b>Constellaties rond elk lichaam</b>: dekking, dilution of precision en beschikbaarheid rond de aarde, de maan of Mars, en het zonnestelsel op één epoch.

seg-82708b06dcc6 = <b>Navigatie met lage aardbaan</b>: signaal, passage en link, navigatiebericht, en een gefuseerde positiebepaling, fase voor fase.

seg-e21e9bb02d00 = <b>Campagnes</b>: een geketende missie, een sweep of een Monte Carlo-ensemble in één scenario.

seg-ba5057da54e4 = <b>Rapporten, animatie en exports</b>: elk cijfer met zijn eenheid en label; een geanimeerde tekening van een run; SP3- (Standard Product { "3" }), CCSDS- (Consultative Committee for Space Data Systems) baanberichten, CZML- (Cesium Language), KML- (Keyhole Markup Language), GeoJSON-, STK- (Systems Tool Kit) en SigMF-bestanden (Signal Metadata Format).

seg-6b43a8c3031e = Eén open engine in het midden, kshana { $version }, met een getypeerde dispatch over { "75" } soorten; eromheen de opdrachtregel, de Rust-bibliotheek, Python, WebAssembly en Kshana Studio, de MCP-server, het Docker-image en de JetBrains-plug-in; eronder Kshana Pro, een propriëtaire laag die van de open engine afhangt en hem nooit forkt

seg-ea6f46d62e7b = Hetzelfde scenariobestand geeft op elk vlak dezelfde bytes. MCP is het Model Context Protocol: <a1><c1/></a1> laat een AI-assistent (kunstmatige intelligentie) de engine uitvoeren.

seg-f51b0a8cd30e = Zes artikelen op arXiv zijn gebouwd op de open engine, elk met de opdracht erachter: <a1>arXiv:{ "2606.22054" }</a1> (de optimismekloof van interferentiedetectoren), <a2>arXiv:{ "2606.24210" }</a2> (een voorwaardelijk beschermingsniveau voor tijdsynchronisatie), <a3>arXiv:{ "2607.05415" }</a3> (hoe stabiel een veerkrachtscore voor PNT is), <a4>arXiv:{ "2607.02566" }</a4> (waarneembaarheid van maanoppervlaktestations met very-long-baseline interferometrie), <a5>arXiv:{ "2607.06212" }</a5> (geometrie van het zuidpoolgebied van de maan en oppervlaktebakens) en <a6>arXiv:{ "2610.23871" }</a6> (cislunaire navigatie als waarneembaarheidsprobleem: booglengte, Gramiaan-conditionering en de Doppler-hefboom). Zie <a7>Onderzoek</a7>.

seg-dad7832bf2d2 = De hele engine is vrij onder de AGPL-3.0. Kshana Pro, een propriëtaire laag die van de open engine afhangt en hem nooit forkt, en studies op maat zijn onder contract beschikbaar bij Ashforde® OÜ: <a1>contact@ashforde.org</a1>. Er zijn geen prijzen; zie <a2>docs/PRO.md</a2>.

seg-d217f23af0c2 = Meer informatie

seg-0e8320f8ea91 = <b>De volledige README</b> → <a1>https://github.com/AshfordeOU/kshana</a1>

seg-acba56f9ed36 = <b>Kshana Studio</b> (de engine in uw browser, als WebAssembly) → <a1>https://kshana.dev</a1>

seg-13426521456e = <b>Mogelijkheden</b> → <a1>docs/CAPABILITY.md</a1>

seg-a42cfefa5e6d = <b>Validatie en herkomst</b> → <a1>docs/VALIDATION.md</a1> · <a2>docs/PROVENANCE.md</a2>

seg-07b9e03942cb = <b>Verificatiematrix</b> → <a1>docs/VERIFICATION-MATRIX.md</a1>

seg-9390336ecc01 = <b>Citeren</b> → <a1>CITATION.cff</a1> · DOI <a2>10.5281/zenodo.20528627</a2>

seg-d059e9fc67e1 = Vrij en opensource onder de <b>GNU AGPL-3.0-only</b> (de GNU Affero General Public License, alleen versie { "3" }). Een <b>commerciële licentie</b> is verkrijgbaar bij <a1>Ashforde® OÜ</a1> (een Estse besloten vennootschap; OÜ = osaühing) voor gesloten integratie; zie <a2>LICENSING.md</a2>. Professioneel ontwikkeld en onderhouden door Ashforde® OÜ.

seg-4ae905aec2ab = <s1>Vorige</s1>Python-API

seg-8af548581ae9 = <s1>Volgende</s1>Rust-crate
