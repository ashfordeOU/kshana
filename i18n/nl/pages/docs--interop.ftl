# docs--interop: translations (nl)

seg-f2ce7fc60cdf = Formaat

seg-f917e7fcac09 = Wat het is

seg-cae10fb9bff8 = Scenario

seg-8c718f7f9f5d = SigMF

seg-b03d56f501c3 = Type

seg-357c2320b43a = ja

seg-c8c964a11462 = Bron: <c1/>

seg-881ec6f8fbe0 = Een run schrijft een resultaatdocument, een grafiek en een rapport. <c1/> schrijft ook de geometrie van het scenario, of zijn gesynthetiseerde signaal, in de formaten die andere hulpmiddelen al lezen: een globeviewer, een desktopkaart, een geografisch informatiesysteem (GIS), een missieanalysepakket of een software-defined-radio-hulpmiddel (SDR). Niets hiervan leest een klok of het netwerk, en geen enkele export draagt een tijdstempel van aanmaak, dus hetzelfde scenario geeft bij elke run byte-identieke bestanden.

seg-736f2dc67a3c = Bestanden worden naast het scenario geschreven, genoemd zoals het resultaatdocument: <c1/>, <c2/>, <c3/>, één <c4/> per bewegend object (of <c5/> wanneer er één is), en het paar <c6/> / <c7/>. Met <c8/> nemen ze in plaats daarvan de naam van de studie over, zoals de andere uitvoer.

seg-21d3fba059d5 = Een expliciet genoemd formaat dat niet op het scenario van toepassing is, is een fout die de reden afdrukt; onder <c1/> wordt de reden afgedrukt en het formaat overgeslagen. De ingangen van de bibliotheek zijn <c2/>, <c3/> en <c4/>; ze nemen de scenariotekst en geven bytes terug, zonder een bestand aan te raken, dus ze draaien ook in de WebAssembly-build. De Model Context Protocol-server (MCP) biedt dezelfde drie aan als de hulpmiddelen <c5/>, <c6/> en <c7/> (zie <c8/>).

seg-77200201db88 = Code: <c1/> (<c2/> bouwt één geometrische beschrijving van het scenario, <c3/>, <c4/>, <c5/> en <c6/> schrijven die), <c7/> en <c8/> voor het signaal. Tests: <c9/>.

seg-f13ab6bb2e47 = Formaten

seg-fc52229b569c = Gevolgde specificatie

seg-3f237c8956eb = Cesium Language: een JSON-array (JavaScript Object Notation) van pakketten met tijdlabels, gelezen door CesiumJS

seg-234fa6710fb9 = Keyhole Markup Language { "2.2" }, een standaard van het Open Geospatial Consortium (OGC), gelezen door Google Earth en de meeste GIS-hulpmiddelen; sporen met tijdlabels gebruiken de Google-extensie <c1/>

seg-ef08da440ce5 = <a1>https://www.ogc.org/standards/kml/</a1> (schema-naamruimte <c1/>; extensienaamruimte <c2/>)

seg-4cfac7667dbc = geografische JSON, Request for Comments (RFC) { "7946" } van de Internet Engineering Task Force (IETF)

seg-de0feb450ae1 = STK <c1/>

seg-96173e7b4238 = het efemeridebestand van Ansys Systems Tool Kit (STK), in de vorm tijd-positie-snelheid <c1/>

seg-a2284e8c0034 = Signal Metadata Format: een JSON-metadatabestand en een ruw bestand met complexe in-phase- en quadrature-samples (IQ)

seg-b38ee3ebd012 = Wat elk bestand bevat

seg-7d873bc11593 = Elk geospatiaal formaat wordt uit dezelfde scène geschreven, dus ze kunnen het niet oneens zijn over waar iets zich bevindt. Een scène heeft tot vier soorten objecten:

seg-1fc686f6a7ea = <b>Bewegende objecten</b> — satellieten, en een gebruikersplatform wanneer dat beweegt — bemonsterd op het eigen tijdraster van het scenario met de propagatoren die de run van het type gebruikt.

seg-3db28cb6adc5 = <b>Vaste locaties</b> — een ontvanger, een grondstation, een jammer, of de oorsprong van een lokaal navigatiestelsel.

seg-0def04909935 = <b>Sporen zonder tijd</b> — de waypoints die een type voor alternatieve positiebepaling, navigatie en tijdsynchronisatie (PNT) met terrein, zwaartekracht of een combinatie vliegt. Deze typen hebben geen tijdas, dus de sporen dragen er geen.

seg-e14d49ae7330 = <b>Voetafdrukken van jammers</b> — voor het type <c1/> twee cirkels rond de jammer: de afstand over de grond waarbinnen een satelliet in het zenit (de sterkste) onder de volgdrempel valt, zodat elke satelliet verloren gaat, en de afstand waarbinnen een satelliet op het elevatiemasker (de zwakste) dat doet, zodat het volgen begint uit te vallen. Beide komen uit de eigen linkvergelijkingen van het type (Kaplan en Hegarty, <em>Understanding GPS/GNSS</em> (Global Positioning System / Global Navigation Satellite Systems), 3e druk, §{ "9.4" }) met de jammer aan de horizon van de ontvanger en vrijeruimteverlies, en de testsuite controleert dat de effectieve verhouding tussen draaggolf en ruisdichtheid op elke straal gelijk is aan de drempel tot { "1e-6" } dB. De cirkel wordt getekend op een bol met de gemiddelde straal van de aarde.

seg-e1dd97c47993 = Het eerste pakket is het documentpakket (<c1/>, <c2/>) met een klok die het tijdraster overspant. Elk bewegend object is een pakket waarvan <c3/> een ISO { "8601" } (datum- en tijdnotatie van de International Organization for Standardization) UTC (Coordinated Universal Time) <c4/> heeft, <c5/> <c6/>, en <c7/>-samples <c8/>: seconden na het epoch, meters in het Geocentric Celestial Reference System (GCRS). CesiumJS neemt <c9/> als het International Celestial Reference Frame (ICRF), waarvan de assen het GCRS deelt. Vaste locaties en middelpunten van voetafdrukken zijn constante aardvaste posities <c10/> met <c11/> <c12/>. Een voetafdruk is een <c13/> met beide halve assen gelijk aan zijn straal; een spoor zonder tijd een aan de grond vastgeklemde <c14/>. De <c15/> van elk pakket noemt het stelsel nogmaals in woorden.

seg-be6362f4c7e7 = Eén <c1/> met een <c2/> per objectklasse. Een bewegend object is een <c3/> met een <c4/>: één <c5/> per sample (ISO { "8601" } UTC), daarna één <c6/> per sample (lengtegraad, breedtegraad, hoogte). Locaties zijn <c7/>s, voetafdrukken <c8/>s waarvan de ring gesloten is en tegen de klok in loopt, sporen zonder tijd <c9/>s. Coördinaten zijn lengte- en breedtegraad in het World Geodetic System { "1984" } (WGS { "84" }) in decimale graden en hoogte in meters boven de WGS { "84" }-ellipsoïde, geschreven met <c10/> <c11/>. KML leest <c12/> als hoogte boven gemiddeld zeeniveau; het verschil, de geoïde-ondulatie, ligt binnen ongeveer ±{ "110" } m en wordt niet toegepast. De beschrijving van het document zegt dat.

seg-37dc14626a6c = Eén <c1/>. Posities zijn <c2/> of <c3/> — lengtegraad eerst, zoals RFC { "7946" } vereist — in WGS { "84" }-graden, met hoogte in meters boven de ellipsoïde. Een bewegend object is een <c4/> met een eigenschap <c5/> die één ISO { "8601" }-tijd per positie bevat; een spoor dat de meridiaan van { "180" }° kruist, wordt geschreven als een <c6/> die daar is afgesneden, zoals RFC { "7946" } §{ "3.1.9" } vraagt (het kruispunt wordt geïnterpoleerd, en <c7/> vermeldt dan alleen de oorspronkelijke samples). Locaties zijn <c8/>s, voetafdrukken <c9/>s met een gesloten buitenring tegen de klok in (§{ "3.1.6" }), sporen zonder tijd <c10/>s. Elke feature heeft een eigenschap <c11/> die de eenheid van elk numeriek lid noemt.

seg-ea28a2bd431c = Eén bestand per bewegend object, omdat een STK-efemeride één voertuig beschrijft. De header geeft <c1/> (gelijk aan het aantal gegevensrijen), <c2/> (UTC, <c3/>), <c4/> met <c5/>, <c6/>, <c7/> en <c8/>; de rijen onder <c9/> zijn seconden na het epoch, positie in meters en snelheid in meters per seconde, in het GCRS. Een scène met alleen vaste locaties of sporen zonder tijd schrijft geen bestand <c10/>: een vast punt is een STK Facility, geen efemeride. Een id die geen gewoon deel van een bestandsnaam is (een constellatieschil en een satelliet, <c11/>) wordt geschreven met elk ander teken als <c12/>, genummerd als twee id's dan samenvallen.

seg-52a78be5db9f = Het type <c1/> en het type <c2/> (via zijn fase <c3/>) exporteren elke satelliet in een lage baan om de aarde (LEO) en de gebruiker uit de eigen propagatoren en het tijdraster van het type. Het type werkt in ECI0, het aardgecentreerde inertiële stelsel dat op het epoch met het aardvaste stelsel samenvalt; elk sample wordt op zijn eigen tijd door de aardrotatie van het type omgezet in het aardvaste stelsel en vandaar in het GCRS via het stelsel met ware evenaar en gemiddelde equinox (TEME) waarin de propagator Simplified General Perturbations { "4" } (SGP4) uitvoer geeft, op dat moment, met UT1 (Universal Time, de hoek van de aardrotatie) gelijkgesteld aan UTC en poolbeweging verwaarloosd, zoals bij de andere exports. De andere LEO-typen geven aan waarom een formaat niet van toepassing is (de tabel hieronder).

seg-b134baf33fba = Een <c1/> exporteert elk lidscenario met geometrie als een eigen bestandsset, met het label van het lid ingevoegd vóór het formaatachtervoegsel: elke fase-run (<c2/>, of <c3/> wanneer de fase meerdere runs heeft), het basisscenario van de sweep (<c4/>), het Monte Carlo-scenario (<c5/>) en elk samengesteld lid (zijn label, met de gedeelde waarden die het bindt erin geschreven). <c6/> schrijft <c7/> en <c8/>. Een lid dat identiek is aan een eerder lid wordt eenmaal geschreven, en waarden die een campagne tijdens de run toepast (overdrachten, sweepwaarden, seeds) staan niet in het geëxporteerde lid. Een formaat is van toepassing op een campagne wanneer het op enig lid van toepassing is; anders is de reden noot { "4" } van de tabel hieronder. Zie <a1>CAMPAIGNS.md</a1>.

seg-6579b6941d10 = De snapshot <c2/> van het type <c1/> — de gemodelleerde L-band getekend als complexe samples op één moment — als paar <c3/> / <c4/>, in het gegevenstype dat <c5/> noemt (<c6/> of <c7/>). Het is dezelfde opname die de run schrijft en terugleest voor zijn eigen consistentiecontrole: de geëxporteerde metadata zijn gelijk aan het blok <c8/> van het resultaatdocument, en het gegevensbestand heeft de lengte <c9/>. De schrijver is <c10/>, de module die het type <c11/> al gebruikte; er wordt niets gedupliceerd.

seg-6e7c5f0e34f3 = Stelsels en tijd

seg-01d1bedb0595 = De engine propageert in TEME (ware evenaar, gemiddelde equinox van de datum), zijn eigen stelsel. Bewegende objecten worden naar het GCRS gedraaid door de reductie <c1/> (IAU { "2006" }-precessie en IAU 2000B-nutatie, waarbij IAU de International Astronomical Union is), die het gepubliceerde voorbeeld van Vallado voor TEME naar GCRF (Geocentric Celestial Reference Frame) tot { "0.11" } m reproduceert, voor CZML en STK, en naar het aardvaste stelsel door <c2/> voor KML en GeoJSON. De aardvaste rotatie is de gemiddelde sterrenhoek van Greenwich met UT1 gelijkgesteld aan UTC en zonder poolbeweging — dezelfde reductie die de SP3-export (Standard Product { "3" }) gebruikt. Op de baanstraal van GPS verschuift de verwaarloosde UT1−UTC van maximaal { "0.9" } s de lengtegraad van een satelliet met maximaal ongeveer { "1.7" } km; grondlocaties worden er niet door beïnvloed, omdat ze in breedte- en lengtegraad worden opgegeven.

seg-4eaa7b3e6946 = Het type <c1/> is de uitzondering: zijn engine-uitvoer bevat al posities in het GCRS en aardvast (met de UT1−UTC en poolbeweging van het scenario, of een echte reeks van de International Earth Rotation and Reference Systems Service (IERS)), en die worden ongewijzigd geschreven.

seg-2299da743a4c = Elke tijd is UTC. Schrikkelseconden worden niet gemodelleerd: een verschil over een schrikkelseconde heen wordt geteld alsof elke dag { "86 400" } s had, zoals de tijdrasters van de engine tellen.

seg-4f7a0b8b4358 = Het epoch van <c1/> is dat wat de run van het type gebruikt, en elk bestand noemt het: de <c3/> van het type <c2/>; wanneer die ontbreekt, het vroegste epoch dat de eigen gegevens van de satellieten dragen (een epoch van een two-line element set (TLE), de referentietijd van een uitgezonden efemeride, het begin van een SP3-bestand), en 2000-01-01T00:{ "00" }:00Z alleen wanneer geen enkele satelliet er een draagt (Kepler-elementen). De exports voor SP3 en OEM (Orbit Ephemeris Message) houden 2000-01-01T00:{ "00" }:00Z aan voor een scenario zonder <c4/>, dus voor zo'n scenario wijken hun datums af van die van deze bestanden. Zonder <c5/> van het scenario wordt elke satelliet die een eigen epoch draagt, op zijn eigen moment (zijn epoch plus <c6/>) in het GCRS en de aardvaste stelsels gedraaid, omdat dat de datum is waartoe zijn TEME-positie behoort; waar de epochs van de satellieten verschillen, volgen de gedeelde tijdlabels de aanname van de engine dat elke satelliet begint op <c7/>, en het bestand zegt met hoeveel uur ze verschillen. Het SGP4-elementepoch van de Walker-constellaties van de typen <c8/> en <c9/> (2018-06-12T00:{ "00" }:00Z), dat hun runs ook voor de aardrotatie gebruiken; het <c11/> van het type <c10/>; het <c13/> of TLE-epoch van het type <c12/>. Het type <c14/> heeft geen kalenderepoch; zijn export dateert <c15/> zoals bij een baanscenario zonder.

seg-ee8eeb47f41b = Satellieten houden de positionele identificatoren <c1/>, <c2/>, ... die de exports voor SP3 en OEM hun geven, omdat de propagatoren de naamregels van de TLE niet meedragen.

seg-0491624c5f12 = Imports

seg-798f3ae1b77d = GeoJSON-route.

seg-2a04d7d4bafc = <c1/> (bibliotheek: <c2/>) leest de eerste <c3/> van een GeoJSON-document — een kale geometrie, een <c4/> of een <c5/> — en schrijft die vóór de run in de spoorinvoer van <c6/>, <c7/>, <c8/> en <c9/> (<c10/>, <c11/>, <c12/>, <c13/>, <c14/>). Die typen vliegen <c15/>, dus een route wordt geaccepteerd wanneer ze precies dat is: haar twee uiteinden (het aantal <c16/> van het scenario blijft behouden), of drie of meer posities gelijkmatig verdeeld op een rechte lijn in breedte- en lengtegraad, tot op { "1e-7" } graad (ongeveer { "1" } cm). Elke andere route wordt geweigerd en de fout noemt de positie die het verst van de lijn ligt. Een route voor een type zonder trajectinvoer wordt met die reden geweigerd. Lengte- en breedtegraad worden op bereik gecontroleerd, wat een bestand met de breedtegraad eerst vangt.

seg-be9fddebd47a = <b>SigMF-opname.</b> Het blok <c2/> van het type <c1/> leest een paar <c3/> / <c4/> via <c5/> en tekent zijn Welch-schatting naast het model (zie <a1>SPECTRUM.md</a1>). Bestanden lezen is een functie van de native build; de WebAssembly-build neemt de bytes aan via <c6/>.

seg-f1ca9cee1065 = Hoe de exports worden gecontroleerd

seg-afe73c19e369 = <c1/> parst elke export met een validator die uit de specificatie van het formaat is geschreven, niet met de eigen code van de schrijver:

seg-bdc892a450c0 = CZML: een JSON-array waarvan het eerste pakket het documentpakket is met een <c1/>; unieke pakketidentificatoren; elke positie vermeldt <c2/> <c3/> of <c4/>; bemonsterde posities zijn <c5/> met een ISO { "8601" }-epoch en oplopende tijden.

seg-a28abb42c103 = KML: een goedgevormd XML-document (Extensible Markup Language) in de OGC KML { "2.2" }-naamruimte met één rootfeature; de elementvolgorde van het schema binnen een Placemark; hoogstens één geometrie per Placemark; gesloten lineaire ringen van vier of meer posities; tupels <c1/> binnen bereik; geldige waarden van <c2/>; <c3/>s die kunnen worden opgelost; een <c4/> met evenveel <c5/> als <c6/>, en de extensienaamruimte gedeclareerd.

seg-8e0f4e4c2309 = GeoJSON: lengtegraad eerst en binnen bereik, breedtegraad binnen bereik, twee of drie getallen per positie, lijnreeksen van twee of meer posities, gesloten buitenringen tegen de klok in, geen segment over de meridiaan van { "180" }°, geen lid <c1/>, een eigenschap <c2/> op elke feature.

seg-57bf7f9291e1 = STK: de versieregel <c1/>, een blok <c2/> / <c3/> met de vereiste trefwoorden, <c4/>, <c5/> gelijk aan het aantal gegevensrijen, zeven getallen per rij, oplopende tijden.

seg-e474c11480d8 = SigMF: <c1/> en <c2/> in <c3/>, arrays <c4/> en <c5/>, <c6/> bij elke capture, en een gegevensbestand met hele samples.

seg-82b7b39e7cad = Naast de structuur wordt een satelliet die naar CZML en naar STK is geëxporteerd, vergeleken met de eigen toestand van de engine na dezelfde stelselreductie, en komt tot op { "1" } mm in positie overeen (de bestanden dragen { "0.1" } mm): met de eigen GCRS-uitvoer van het type <c1/>, en met een onafhankelijke TEME-naar-GCRS-propagatie van de constellatie <c2/>, waarbij elke satelliet wordt gedateerd met zijn eigen TLE-epoch uit de scenariotekst. Twee controles gaan buiten de engine: de CZML-posities van de eerste satelliet <c3/> komen tot op { "0.1" } m overeen (gemeten { "2.3" } cm) met dezelfde TLE gepropageerd door het Python-pakket <c4/> en door ERFA (Essential Routines for Fundamental Astronomy, de open implementatie van de SOFA-bibliotheek van de IAU) tot het GCRS gereduceerd, en de aardvaste posities van de satellieten <c5/> zijn gelijk aan de posities uit de uitgezonden efemeride van de interfacespecificatie van het Global Positioning System tot op { "1" } mm. De aardvaste posities van de export <c6/> worden vergeleken met de posities die de jammingrun beoordeelt, tot op { "5" } mm. De GeoJSON-route doorloopt een rondreis via een spoorscenario, het SigMF-paar leest terug naar dezelfde bytes, en elke export is byte-deterministisch.

seg-20fbf9a3fba7 = Dit zijn controles tegen de gepubliceerde specificaties en tegen de engine zelf. De bestanden zijn als onderdeel van de testsuite niet in CesiumJS, Google Earth, Ansys STK of een SDR-hulpmiddel geladen, dus acceptatie door een bepaalde versie van die hulpmiddelen wordt hier niet getest.

seg-7349c09206ac = Uitwisseling van baan-, standen- en kernelgegevens (bibliotheek, { "0.36" })

seg-d5e34188aa96 = Naast de formaten van <c1/> voegde { "0.36" } bibliotheeklezers en -schrijvers toe voor de standaardbestanden die missieanalysehulpmiddelen uitwisselen. Ze nemen tekst of bytes aan en geven die terug en raken geen bestand aan. Elk is een rij VALIDATED van de <a1>verificatiematrix</a1>, tegen de daar genoemde onafhankelijke implementatie:

seg-cd8b6f2d43be = <b>CCSDS Orbit Data Messages</b> (<c1/>, met <c2/> voor de XML-vorm): OPM, OMM en OCM in keyword-value-notatie (KVN) en NDM/XML, volgens CCSDS 502.0-B-3 (OPM en OMM versies { "3.0" } en { "2.0" }, OCM { "3.0" }). In beide richtingen gecontroleerd tegen Orekit: Orekit leest de bestanden van Kshana en Kshana leest die van Orekit. De bevindingen die overblijven, zijn met tests vastgepind.

seg-00b9fc226c06 = <b>CCSDS Attitude Data Messages</b> (<c1/>, met <c2/>): AEM en APM volgens CCSDS 504.0-B-2, in KVN en NDM/XML. Op dezelfde manier tegen Orekit gecontroleerd, en de recordrotaties tegen die van Orekit.

seg-b8aa23f78f9e = <b>SPICE SPK</b> (<c1/>): schrijvers en lezers van NAIF-SPK-segmenten van de typen { "9" } en { "13" } (met de export van een CCSDS OEM naar een SPK-kernel) en de typen { "3" } en { "21" } (Chebyshev-polynomen en uitgebreide verschillijnen), gecontroleerd tegen de eigen lezers van de NAIF SPICE-toolkit, tot op byte-identiteit. Kshana schrijft de segmenten uit records die het krijgt: het past geen Chebyshev-coëfficiënten aan en produceert geen verschillijnen.

seg-bb97cbb1ab9f = De CCSDS-OEM-importer en -schrijver en het OEM-covariantieblok zijn ouder en worden beschreven bij de imports hierboven en in de matrix.

seg-8932eba75c68 = Alleen de typen in de tabel hieronder exporteren geometrie. Typen waarvan de geometrie op de Maan, Mars of een ander hemellichaam is gecentreerd, worden niet geëxporteerd: CZML, KML en GeoJSON beschrijven posities rond de aarde, en deze release schrijft STK-bestanden alleen met <c1/>, hoewel het STK-formaat zelf andere centrale lichamen toestaat.

seg-a0593ad77202 = <c1/>, <c2/> en <c3/> hebben aardgerelateerde geometrie die deze release niet exporteert; de tabel geeft de reden voor elk.

seg-2bb9237839f3 = Het type <c1/> vliegt zijn traject in een vlak lokaal raakvlak, dus alleen de oorsprong van het vlak wordt geëxporteerd, niet het traject.

seg-6049ab4ca3c9 = Aardvaste satellietposities verwaarlozen UT1−UTC en poolbeweging (zie Stelsels en tijd); KML-hoogten zijn ellipsoïdaal, niet boven gemiddeld zeeniveau.

seg-4dda05aefd2b = Voetafdrukken gaan uit van voortplanting in de vrije ruimte, een jammer aan de horizon van de ontvanger en een bolvormige aarde voor de cirkel.

seg-2dd0656c518f = Elk scenariobestand

seg-e024f5c1cab1 = Wat <c1/> doet voor elk bestand in <c2/> (het suitemanifest is geen scenario en blijft weg). "ja" betekent dat het formaat wordt geschreven en door zijn validator komt; anders verwijst het nummer naar de reden. Gegenereerd door <c3/>; <c4/> mislukt wanneer het verouderd is.

seg-c27f67dfbb37 = nee [{ "1" }]

seg-3468244e2385 = nee [{ "2" }]

seg-d0cf3f74cd10 = nee [{ "3" }]

seg-62c880979169 = nee [{ "4" }]

seg-9229b499c702 = nee [{ "5" }]

seg-d9d6561c9e5b = nee [{ "6" }]

seg-7d4a6538c638 = nee [{ "7" }]

seg-f170ed4d8dca = nee [{ "8" }]

seg-1c5eb5dca942 = nee [{ "9" }]

seg-a930bb0d2e42 = nee [{ "10" }]

seg-236853169f42 = nee [{ "11" }]

seg-411e4f3aeae7 = nee [{ "12" }]

seg-34fabcbb82f2 = nee [{ "13" }]

seg-772bd344bbce = nee [{ "14" }]

seg-460fd74c7c7e = nee [{ "15" }]

seg-e1d91ce54b8b = nee [{ "16" }]

seg-f3e0486f02e3 = nee [{ "17" }]

seg-884160b0ed12 = nee [{ "18" }]

seg-8202f4a426b0 = nee [{ "19" }]

seg-a4e9a36289e5 = nee [{ "20" }]

seg-034364e38105 = nee [{ "21" }]

seg-3e3b6ecc7b43 = Waarom een formaat niet van toepassing is:

seg-d7bd20cb8710 = de typen <c1/> en <c2/> plannen downlinkcontacten en codering; exporteer een scenario <c3/> voor dezelfde satelliet en hetzelfde station om de geometrie te zien

seg-f587b4df1635 = SigMF bevat complexe basisbandsamples, die alleen het type <c1/> synthetiseert

seg-d102fb18ce8d = het type <c1/> simuleert de stand om het massamiddelpunt zonder baan of grondpositie, dus er is niets om op de aarde te plaatsen

seg-ecc0e31b0369 = de scenarioinvoer bevat geen horizontale positie (geen breedte- en lengtegraad, geen aardgecentreerde coördinaten, geen baanelementen behalve hooguit een hoogte), dus er is niets om op de aarde te plaatsen

seg-2e0825b27359 = de typen <c1/> en <c2/> berekenen budgetten zonder positie op aarde

seg-1f17b963c7a6 = een STK-efemeride beschrijft de positie en snelheid van een voertuig tegen de tijd; deze scène heeft alleen vaste punten of sporen zonder tijd (een vast punt is een STK Facility, geen efemeride)

seg-f79d0ce7b945 = geen lidscenario van de campagne heeft iets wat dit formaat beschrijft; exporteer een lid afzonderlijk om de reden te zien

seg-08b7e027318a = het type <c1/> analyseert signaalontwerpen (spectra, tracking, acquisitie, compatibiliteit) zonder satelliet- of gebruikerspositie; exporteer het scenario <c2/> of <c3/> dat het ontwerp vliegt

seg-31c8acef1aed = niet geëxporteerd in deze release: de typen voor gefuseerde positiebepaling plaatsen hun satellieten in een aardvast stelsel ten opzichte van een epoch die ze nooit noemen, dus een export met tijdlabels zou de kalenderdatum moeten verzinnen (exporteer in plaats daarvan het scenario <c1/> of <c2/>)

seg-3c57b084f0d7 = de geometrie van het type is gecentreerd op de Maan, Mars of een ander lichaam van het zonnestelsel; CZML, KML en GeoJSON beschrijven posities op of rond de aarde, en deze release schrijft STK-efemeriden alleen met CentralBody Earth

seg-2edebe91839c = niet geëxporteerd in deze release: <c1/> plaatst zijn satellieten in een lichaamsvast stelsel ten opzichte van een epoch die het nooit noemt, dus een export met tijdlabels zou de kalenderdatum moeten verzinnen

seg-951ac7c5f138 = niet geëxporteerd in deze release: de aardse constellatie van het Global Navigation Satellite System (GNSS) van <c1/> wordt gezien vanaf een ontvanger op maanafstand, wiens traject het type niet als tijdreeks beschikbaar stelt

seg-3cf7f7460c55 = niet geëxporteerd in deze release: het type <c1/> rapporteert piekbelastingen en verhitting, en houdt geen grondspoor met tijdlabels bij

seg-cfc3df59e5c8 = het type <c1/> sweept beschikbaarheid en linksterkte voor een gebruiker op een schil of een Kepler-traject; het heeft geen enkele positie om op een kaart te plaatsen

seg-6271953188bd = het scenario <c1/> geeft de breedtegraad van de lanceerlocatie maar geen lengtegraad, dus de locatie kan niet worden geplaatst

seg-c9a63dfb34db = niet geëxporteerd in deze release: de referentiebaan van <c1/> is een fitreferentie waarvan de aardrotatiehoek op het epoch een invoer is (<c2/>, standaard { "0" }), niet afgeleid van de kalenderdatum, dus zijn aardvaste posities zijn niet aan een datum gebonden

seg-a03c2f0426db = dit spectrumscenario heeft geen blok [iq], dus er worden geen samples gesynthetiseerd om op te nemen

seg-d75f8ad6903a = niet geëxporteerd in deze release: <c1/> leest en schrijft een CCSDS-Orbit Ephemeris Message (Consultative Committee for Space Data Systems), die zelf het uitwisselingsbestand voor efemeriden is

seg-fdbaf96ecf3e = het type <c1/> berekent linkstatistieken voor grondlocaties zonder geometrie met tijdlabels om te plaatsen

seg-146a2e8ee590 = het scenario sweept een ander scenario over een raster; exporteer het gesweepte scenario afzonderlijk

seg-b74484e3586b = het type <c1/> berekent een linkbudget en stabiliteiten, zonder geometrie met tijdlabels om te plaatsen

seg-bcd613e62c69 = <s1>Vorige</s1>Animatie-export

seg-0525f7fbbfd2 = <s1>Volgende</s1>Validatiestatus

seg-53a778722c16 = STK .e

seg-507b8c235614 = CZML

seg-bf09433a7342 = GeoJSON

seg-9c92e0bc42aa = KML
