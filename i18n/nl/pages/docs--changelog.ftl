# docs--changelog: translations (nl)

seg-2247a2344710 = Betekenis

seg-9a2a5f0a8a02 = Zonnestelsel

seg-20db2c79b998 = Getoetst

seg-a20b4a6e8f53 = atoomklok op chipschaal

seg-49a994d77d2f = temperatuurgecompenseerde kristaloscillator

seg-5770537524d3 = Gebied

seg-40d4fc0d3922 = Bron: <c1/>

seg-7333b85d448f = Alle belangrijke wijzigingen in Kshana worden hier gedocumenteerd.

seg-bbc8f38627f1 = Het formaat is gebaseerd op <a1>Keep a Changelog</a1> en dit project houdt zich aan <a2>Semantic Versioning</a2>. Zolang het project nog onder 1.0 zit, kan het openbare schema voor scenario's en resultaten nog veranderen; ingrijpende wijzigingen worden expliciet vermeld.

seg-985f7b4c001a = Niet uitgebracht

seg-a2f583aadd0b = Geen nieuwe functies: één reparatie van de opdrachtregel, afhankelijkheidsupdates in de tooling voor kruiscontrole en documentatie. De resultaten van de engine zijn ongewijzigd ten opzichte van { "0.38.0" }.

seg-c9a8a5898ced = Opgelost

seg-3cc8ba4d1be6 = De opdrachtregel sluit stil af met status { "141" } wanneer de standaarduitvoer wordt gesloten (<c1/>), in plaats van te crashen met "failed printing to stdout: Broken pipe". { "141" } is { "128" } plus SIGPIPE, de status die een shell meldt voor <c2/>. Alleen een gesloten pipe wordt afgehandeld: een volle schijf of een andere schrijffout meldt zichzelf nog steeds, en een live feed die naar een gesloten socket schrijft, krijgt nog steeds zijn schrijffout. <c3/> sluit de lezer voordat het programma start, zodat de eerste schrijfactie bij elke run mislukt.

seg-2a47e785cc1d = Afhankelijkheidsupdates in de tooling voor kruiscontrole (<c1/>); geen wijzigingen aan een meegeleverde crate, wheel of pakket.

seg-9df898fb24be = <c1/> { "0.9.10" } naar { "0.9.11" } (RUSTSEC-2026-0186) in de locks van de ANISE-kruiscontrole (<c2/>, <c3/>); de locks synchroniseren ook opnieuw de padafhankelijkheid <c4/> in de repository.

seg-835e9d6058f8 = <c1/> { "12.3.0" } naar { "13.0.0" } en <c2/> { "2026.7.22" } naar { "2026.10.19" } in de pins van de oracle-omgeving (<c3/>, <c4/>): de gepatchte releases voor acht pillow-advisories en één certifi-advisory.

seg-902fc421a851 = <c1/>, de README en dit bestand vermelden elke kshana-bench-drempel die NOT MET is, zoals vastgelegd in <c2/>: <b>A2</b> (<c3/> AUC { "0.766" } tegenover minstens { "0.80" } op de testsplit), <b>D1</b> (grootste kloof { "0.0301" }) en <b>taak (b) R1</b> (overgenomen, niet opnieuw uitgevoerd). Er is geen enkele drempel versoepeld.

seg-44d9c9622c24 = Volledigheidsronde van de README: een inhoudsopgave; de scenariotypen ingedeeld in families, elk met een pagina onder <c1/> (de beschrijving en velden van de engine, de invoer en resultaten van een voorbeeldrun, de registerrijen en onafhankelijke referenties, de beperkingen die het rapport van de run vermeldt en de grafiek die de engine schrijft), een contactvel per familie, alles geïndexeerd door <c2/>; elke opdracht in <c3/>; elk oppervlak, elke plug-in-opdracht, skill en Studio-pagina in <c4/>; elk mogelijkhedendomein in <c5/>; ingebedde Mermaid-diagrammen (systeemoverzicht, oppervlakken, binnenste lus, ontvangervertrouwen, laboratorium-roundtrip, Studio, test- en releaseflow, modulekaart, distributie). Geschreven door <c6/>, <c7/> en <c8/>; gecontroleerd door <c9/>; bewaakt door <c10/>, dat ook van elk item de beschrijving en velden vastpint aan de engine.

seg-b953186d5726 = <c1/>: rendert een Mermaid-diagram naar SVG en PNG op Linux en werkt het renderrecord bij.

seg-68e19f94faed = README: de figuren voor ruimtegebruikers en maan gebruikten paden relatief ten opzichte van <c1/>, waardoor ze niet laadden vanuit de README; één link wees naar <c2/>.

seg-850e1574e2d6 = Twee verouderde, met de hand gekopieerde grafiekbestanden (<c1/>, <c2/>) verwijderd, die geen enkele pagina gebruikte en die niet meer overeenkwamen met de engine; <c3/> bevat de actuele grafieken.

seg-033d52126d8a = Toegevoegd

seg-090bf5ae96b6 = <b>GNSS voorbij de constellatie (<c1/>).</b> Een nieuw scenariotype voor ruimtevaartuigen boven, rond en voorbij de GNSS-banen (<a1><c2/></a1>): beschikbaarheid van één en vier signalen, duur van uitval, C/N0, DOP en hoofdlob tegenover zijlobverbindingen voor GPS, GLONASS, Galileo, BDS, QZSS en NavIC op een schil of langs LEO-, MEO-, GEO-, HEO- en maantransfertrajecten; booklet-, parametrische of door de gebruiker aangeleverde zendpatronen; een model voor ionosfeer, plasmasfeer en atmosfeer met stralen langs de aardrand; een ontwerp voor een zwaksignaalontvanger; een GNSS-extended-Kalmanfilter aan boord voor HEO en maantransfer; en relatieve navigatie in formatie. Vergeleken met het ICG Space Service Volume-booklet onder een preregistratie die vóór de run is vastgelegd: de constanten voor minimaal uitgestraald vermogen en de maandrempel komen overeen, de overige drempels worden onder de vooraf vastgelegde lezing niet gehaald (bijna allemaal door de inconsistente GLONASS-bundelhoek van het booklet), en de parametrische zijlobbenvervanger reproduceert de gemeten GPS-paneelpatronen niet. Alles blijft MODELLED (<a2><c3/></a2>).

seg-3281ef6e21eb = <b>Maanbaan en maanoppervlak als navigatie- en geodetische infrastructuur (<c1/>).</b> Een nieuw scenariotype met vijf studies, gekozen met <c2/> (<a1><c3/></a1>): consistentie van een baanbepaling aan boord met Aarde-GNSS in een bijna-rechtlijnige halobaan tegenover een onafhankelijke grondbepaling van afstand en afstandssnelheid; gezamenlijke dubbelgedifferentieerde draaggolffase van oppervlaktestation en orbiter met LAMBDA-geheeltallige oplossing; Fisher-informatie van het zevenparametrige maandatum met en zonder afstandsmetingen tussen orbiter en oppervlak; offsets tussen GNSS-, VLBI- en laserafstandsmetingtechnieken ten opzichte van de lokale koppeling; en gevoeligheid voor h2, k2, l2 en de fysieke libratie. MODELLED, met ILLUSTRATIVE invoer: de numerieke methoden zijn gecontroleerd aan de hand van onafhankelijke numpy- en scipy-programma's, en niets wordt vergeleken met een meting van een maangrootheid. Drempels zijn vastgelegd in <c4/> en twee bekendgemaakte wijzigingen. Drie zijn NOT MET en elk is vastgepind door een test die de misser vaststelt: C3 (een geïnjecteerde krachtfout wordt niet gedetecteerd met de vooraf vastgelegde frequentie), Q3 (het bootstrapped slagingspercentage wijkt { "1.7e-6" } af van de numpy-referentie tegenover een drempel van { "1e-9" }, door de normale-CDF-benadering van LAMBDA) en de sporenhelft van G3 (het toevoegen van een afstandsmetingsfamilie verlaagt het spoor van de pseudo-inverse niet altijd). De rest wordt gehaald (<a2><c5/></a2>).

seg-022859135e79 = <b>Een zesde artikel in de Research-tabel.</b> "Cislunar navigation is an observability problem: arc-length thresholds, Gramian conditioning, and the Doppler lever" (<a1>arXiv:{ "2610.23871" }</a1>, eess.SP) toont aan dat dilution of precision niet is gedefinieerd voor cislunaire tracking met alleen afstand en gebruikt in plaats daarvan de observeerbaarheidsgramiaan op vier vlakke verre retrograde banen: alleen afstand heeft rang { "2" } van { "4" } op een momentopname en vraagt een boog van ongeveer { "2.09" } uur, afstandssnelheid (Doppler) geeft onmiddellijk rang { "4" }, en het gezamenlijk schatten van een station met satelliettoestanden en klokken blijft met één rang-deficiënt zonder een externe interferometrische waarneembare. De getallen worden opnieuw gegenereerd door het type <c1/> (<c2/>); <c3/> test de drempel met een onafhankelijke schatter. De README-onderzoekskaart, de README's van crates, npm en PyPI en de generator nemen het over.

seg-d74a1b2dcb38 = De neutrale scheidsrechter, meetbaar gemaakt.

seg-bf568567fe06 = <c1/> leest de gepubliceerde NPRA Jammertest-catalogus en het zendplan als geplande referentie (catalogus-id's behouden) en <c2/> beoordeelt een ontvangerlog daaraan per test (detectielatentie, gemiste alarmen, valse alarmen, hersteltijd), optioneel als ondertekend bewijspakket (<a1><c3/></a1>). De beoordelingsdrempels zijn vóór enige beoordeelde run vastgelegd (<c4/>). Op de JammerTest-dataset van { "2024" } (opgehaald, nooit meegeleverd) mislukte de vooraf vastgelegde regel voor minimale data zowel in de eerste run als in de herziening van de gegevensverwerking, dus geen enkele drempel is te beoordelen en er wordt niets beweerd; beide runs zijn vastgelegd en vastgepind. MODELLED: het schema bestaat uit de gelogde vensters van de dataset, niet uit vastgelegde uitzendtijden. De NMEA-set van SimulaMet uit { "2025" } is niet aangepast (op de pagina staat geen licentie vermeld).

seg-0a2bcad8d645 = <b>De eigen vlaggen van de ontvanger, naast die van Kshana.</b> UBX-NAV-STATUS <c1/> en UBX-SEC-SIG worden bij elk epoch ingelezen in <c2/>, en de vergelijking <c3/> in het resultaat zet ze af tegen de monitors van Kshana (beide, alleen ontvanger, alleen Kshana, geen van beide); het geeft geen alarm en wijzigt geen score. Een Septentrio SBF-lezer (PVTGeodetic, MeasEpoch, RFStatus, alleen-lezen, op de crate <c4/> met MIT-licentie) en <c5/> (een seriële of USB-NMEA-feed, alleen-lezen; er wordt nooit naar een ontvanger geschreven) komen erbij.

seg-90d9927fe3e2 = <b>Tijdsynchronisatie en hardwareveiligheid</b> (<a1><c1/></a1>, <a2><c2/></a2>). Het scenariotype <c3/> beoordeelt een holdovertest van een tijdsynchronisatiesysteem (GNSS door de operator verwijderd, holdover, herstel) aan de hand van een gemeten tijdfoutrecord, gemeten ten opzichte van de ITU-T-maskers uit openbare tabellen. <c4/> leest logs van linuxptp (<c5/>, <c6/>, <c7/>) en chrony (<c8/>, <c9/>). <c10/> schrijft ION GNSS SDR-metadata en <c11/> bewaakt een SigMF-opname terwijl die groeit (alleen ontvangen). <c12/> krijgt het NIST IR 8323r1 Foundational PNT Profile ({ "15" } geparafraseerde rijen, levert bewijs voor). Een bewijspakket kan de <c13/> van de operator vastleggen in zijn ondertekende manifest, nooit geverifieerd; de hardwarefasen { "0" } tot { "4" } en de juridische kanttekeningen staan in <c14/> (wacht op juridische toetsing). Er is geen enkel zendpad.

seg-81501a2b8d9c = <b>kshana-bench v1</b> (<c1/>, <a1><c2/></a1>, <a2><c3/></a2>): vaste taken, splits en metrieken voor detectie van GNSS-interferentie op ontvangerlogs (JammerTest { "2024" }) en IQ, voorspelling van tijdsynchronisatie-holdover (IGS-klokken) en de optimismekloof buiten de verdeling; splitmanifesten met vastgepinde hashes en ophaalscripts (geen data meegeleverd), een achtergehouden set via commit en onthulling, een schema voor resultaatbestanden en een statische ranglijstpagina. Basislijnen onder drempels die zijn vastgelegd in <c4/>: scorerdrempels gehaald, C1 tot en met C3 gehaald, D2 gehaald; <b>A2 NOT MET</b> (<c5/> AUC { "0.766" } tegenover minstens { "0.80" } op de testsplit), <b>D1 NOT MET</b> (grootste kloof { "0.0301" }) en <b>taak (b) R1 NOT MET</b> (overgenomen, niet opnieuw uitgevoerd), elk vastgepind (<c6/>). Elke score is MODELLED. Python <c7/>, <c8/>; WebAssembly hetzelfde; MCP <c9/>, <c10/>.

seg-04c0d6161c7a = <b>Interferentieobservatorium</b> (<c1/>, <c2/>, <a1><c3/></a1>): een reproduceerbare dagelijkse GeoJSON, PNG en incidentrapport-JSON met drie toestanden (degraded, niet degraded, niet waargenomen), een minimale vertraging van { "24" } uur, cellen van { "0.5" } graad of grover, geen oorzaak toegekend en OpenSky-data geweigerd; een gevoeligheidsstudie van de vooraf vastgelegde parameters; een Baltische back-catalogus van 30 dagen uit adsb.lol.

seg-497ae18bfb03 = <b>Machine- en sensorinvoer voor <c1/></b> (<a1><c2/></a1>). Nieuwe waarden voor <c3/>, allemaal alleen-lezen, MODELLED, met zelfgeschreven fixtures en zonder meegeleverde data: <c4/> (RTKLIB <c5/>-oplossingsbestanden), <c6/> (OEM7 ASCII en binair <c7/>, <c8/> C/No en <c9/>; de jammervlag van de ontvanger wordt de <c10/> van het epoch, afgezet tegen de alarmen van Kshana door de vergelijking <c11/>), <c12/> (MSM4 en MSM7 C/N0 voor GPS, GLONASS, Galileo, SBAS, QZSS, BeiDou en NavIC; indelingen uit de pyrtcm-tabellen met BSD-licentie, waarvan de vermelding in <c13/> staat, niet uit de RTCM-standaard) en <c14/> (GNSS-SDR Monitor- en PVT-monitorberichten als JSON-regels, doorgegeven door <c15/>).

seg-22e8b434782f = IMU-logs als tweede sensor.

seg-5491196d6421 = <c1/> (<c2/> of <c3/>) integreert de gierdraaisnelheid van de gyro tot de heading die de monitor <c4/> leest; inline op elk oppervlak en meegedragen door bewijspakketten. <c5/> (Python <c6/>, WebAssembly <c7/>, MCP <c8/>, plug-in <c9/>, een JetBrains-actie) fit de accelerometer- en gyroparameters van de scenario's <c10/> en <c11/> uit een stilstaand log met Allan-deviatie en drukt een tabel <c12/> af met de SHA-256 van het log in de herkomst.

seg-f48fdf6252cd = <b>Integraties:</b> een ROS-{ "2" }-pakket (<c1/>: NavSatFix en <c2/> erin, vertrouwenstopics eruit; zijn ROS-vrije brug is getest tegen de echte engine, de node zelf is niet uitgevoerd op een live ROS-graaf), een <c3/>-brug (<c4/>, afhankelijkheid met MIT-licentie, optioneel) en een GNSS-SDR-relay.

seg-1a8727ad42bb = <b>Home Assistant MQTT-exporter</b> voor vertrouwenstelemetrie: <c1/> en <c2/> (discoveryberichten en een JSON-statusdocument; alleen publiceren, geen inloggegevens of TLS), en <c3/> als tekst in Python, WebAssembly en MCP.

seg-f1cb2c2881c9 = Zeven MODELLED registerrijen voor het bovenstaande. Niets hiervan is VALIDATED: er is geen opname van een echte ontvanger, een basisstation, een IMU, een GNSS-SDR-run, een ROS-graaf of een MQTT-broker gelezen.

seg-12c7a28c80b5 = <b>Optische linkmarge in de tijd.</b> Het type <c1/> neemt een opt-in tabel <c2/> (<c3/>, <c4/>, <c5/>) en schrijft dan ook, per locatie, één gezaaide realisatie van het vermelde locatiemodel door de tijd: wolkenepisoden, een vloeibaarwaterkolom per episode, één gamma-gamma-scintillatiesample per stap, en daaruit de linkmarge, de wolken- en scintillatiefades en de link-up-vlag, met de gerealiseerde beschikbaarheid, wolkenfractie, aantal uitvallen en langste uitval. MODELLED (één trekking uit het model, niet het klimaat; geen externe onafhankelijke referentie). Zonder de tabel is het resultaat het { "0.37" }-document. De twee meegeleverde optische scenario's bevatten de tabel ({ "336" } uur, { "600" } s, seed { "37" }). Drempels vastgelegd in <c6/> vóór de eerste run.

seg-78524dbb3bd2 = Specificatie voor testcondities en de laboratorium-roundtrip.

seg-fbf034925641 = <c1/> wordt gepubliceerd als <a1><c2/></a1> met een JSON Schema en krijgt <c3/>. <c4/> schrijft ook <c5/>. <c6/> bouwt een ondertekend pakket dat de scenariohash, de hash van de vermelde condities, de hash van het ontvangerlog en de score ten opzichte van de vermelde gebeurtenissen koppelt, en weigert condities die niet overeenstemmen met de beoordelingsgebeurtenissen. Uitgewerkt voorbeeld met gps-sdr-sim dat alleen een bestand schrijft; afspelen is de verantwoordelijkheid van de operator en wordt nooit geautomatiseerd. Python <c7/>, MCP <c8/>, plug-in <c9/>.

seg-8bda4472d561 = <b>Standaardenpakketten</b> (<c1/>, <c2/>): de testprofielen van het DHS Resilient PNT-kader voor niveaus { "1" } tot { "4" }, de nauwkeurigheidsniveaus en integriteitsevaluatie van IMO MSC.1/Circ.1575 en monitoren, beoordelen en mitigeren van ICAO Doc { "9849" } Appendix F, elk een set scenario's beoordeeld aan de hand van drempels die vóór de run zijn vastgelegd, met de rijen van compliance-report waarvoor ze bewijs leveren. Missers zijn vastgelegd en vastgepind: DHS L4-T1 en de vier IMO-nauwkeurigheidstests. Doc { "9849" } zelf is niet gelezen (betaald); het ICAO-pakket volgt de eigen presentatie van ICAO over het RFI Mitigation Plan. <c3/> krijgt een sectie voor standaardenpakketten. Alles MODELLED.

seg-6d672b84c34f = <b>LunaNet Augmented Forward Signal</b> (<c1/>): AFS-I Gold- en AFS-Q Weil-codes voor PRN { "1" } tot { "210" }, signalen <c2/> en <c3/> in <c4/>, de SB1 BCH-code, CRC-24Q en interleaver, en <c5/> (<c6/>, <c7/>, <c8/>), vastgepind op LNIS V5 Applicable Document { "1" } Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }). Codes VALIDATED aan de hand van de gedrukte tabellen van het document (die het als TBC markeert); één gedrukte tertiaire kolom (PRN { "147" }) is waarschijnlijk een drukfout en de misser is vastgepind. De LDPC-codering van subframes { "2" } tot { "4" } is niet geïmplementeerd.

seg-5a5720500b6d = <b>Cursusnotebooks</b> (<c1/>): jamming, spoofing, holdover, integriteit, OSNMA en interferentiekaart, elk met oefeningen.

seg-3d543433051c = <b>Studie naar de maximale URA voor EU-US WG-C ARAIM Milestone { "3" }</b> (<c1/>, <c2/>), ter vervanging van het ingetrokken plan "Table A-3"; MODELLED onder vermelde afwijkingen.

seg-4f1f786e2658 = <b>Concepten ter goedkeuring door de eigenaar</b> onder <c1/>: JOSS-artikel, wijziging van het TSC-charter, proces voor het oracle-register en een voorstel voor een splitsing van <c2/>. Niets daarvan is aangenomen.

seg-49a758039871 = <b>Studio-weergaven voor de functies van { "0.38" }</b> (kshana.dev/studio/). Bridge replay (twee synthetische runs op één klok: spoor, vertrouwensscore, de satellieten die het log hoort en het oordeel, met de eigen vlaggen van de ontvanger naast de alarmen van Kshana); Optical PNT (de twee <c1/>-scenario's, met een opt-in gezaaide realisatie van <c2/>, MODELLED); Holdover test (het resultaat van <c3/> gemeten tegen de ITU-T-maskers, getekend uit de eigen <c4/> van het resultaat); een viewer voor het interferentieobservatorium die de bestanden opent die u hebt geproduceerd en er geen meelevert; op de pagina Tools een Jammertest-scorer, een IMU-fit en MQTT als telemetrieformaat; en in Trust een keuzelijst voor logformaat (RTKLIB <c5/>, NovAtel OEM7, RTCM { "3" }, GNSS-SDR, Septentrio SBF) met een optioneel IMU-bestand. Elke weergave leest bestanden in de browser en uploadt niets; elk cijfer behoudt het label dat het register ervoor bevat en elk draagt de adviserende verklaring. De sitepagina <c6/> toont het fragment <c7/>.

seg-91f6beb29f8e = <b>Issue #36: byte-exacte pinlagen.</b> Byte-exacte pinlagen draaien alleen op een host die als basislijn is aangemerkt (<c1/>, ingesteld door <c2/>), niet op elke Mac met Apple-silicon, omdat de wiskundebibliotheek van Apple tussen macOS-releases verschilt; de portable laag draait overal, en <c3/> voorkomt dat een byte-exacte laag opnieuw alleen op platform wordt afgeschermd. De vergelijkingen met de onafhankelijke referenties zelf slagen op macOS. Er is geen enkele literal opnieuw genomen en geen enkele tolerantie gewijzigd. <c4/> en <a1><c5/></a1> beschrijven hoe u een verschil triageert; <c6/> is een handmatige en wekelijkse diagnose, geen gate.

seg-15070f7dcc0a = <b>CodeQL: een niet-verankerd patroon in de trust-open-helper van Studio</b> komt nu overeen met de hele header (<c1/>).

seg-56856063519f = <b>CI: schijfruimte van de runner.</b> De job <c1/> bouwt de dev- en testprofielen zonder debuginformatie, zodat het linken de schijf niet meer vult.

seg-38c59868835e = <b>Bronbewaking.</b> Elk bronbestand dat testfixtures met pins bevat, verklaart zijn pinbereik, en de tests die tijdelijke bestanden schrijven gebruiken per aanroep een uniek pad, zodat parallelle runs niet kunnen botsen.

seg-884f693585fa = <b><c1/></b> is opnieuw gegenereerd voor het optionele veld <c2/> van optical-atmosphere.

seg-e16d328f3967 = <b>JetBrains-plug-in: geen gebruik van verouderde platform-API of API die voor verwijdering is gepland.</b> De IntelliJ Plugin Verifier (<c1/>) tegen IntelliJ IDEA-build { "263" } ({ "2026.3" }: { "263.6800.24" } en { "263.7031.23" }) vond één verouderde aanroep, <c2/>, in Insert Example; die opent het nieuwe bestand nu met <c3/>. De plug-in is compatibel met en schoon op { "2024.3" } (de since-build, ongewijzigd) en beide { "263" }-builds. CI draait nu <c4/> en faalt bij compatibiliteitsproblemen en bij elk gebruik van API die voor verwijdering is gepland.

seg-07ce053c906a = <b>Optische PNT door de atmosfeer</b> (scenariotype <c1/>, <a1><c2/></a1>, ontwerpnotitie <c3/>). Voor een optische link en een set grondlocaties rapporteert het het golflengte- en elevatieafhankelijke verlies in heldere lucht, de Hufnagel-Valley-turbulentietoestand (Rytov-variantie, scintillatie-index, gamma-gamma-fades, aperture averaging), de beschikbaarheid ten opzichte van de linkmarge uit een vermeld wolkenklimaat, de marge die nodig is voor beschikbaarheidsdoelen en het plafond dat geen marge verhoogt, de verdeling van de uitvalduur, de tijds- en afstandsmetingsfout per uitval via het klok-holdovermodel, afstandsgecorreleerde locatiediversiteit, en what-if-winsten voor een golflengtewijziging, een grotere apertuur, scintillatievermindering met adaptieve optiek en extra marge. <c4/> krijgt een atmosfeerbewust budget; zonder dat is de uitvoer bitidentiek aan { "0.36" } (drempel A5). Twee meegeleverde scenario's bevatten ILLUSTRATIVE wolkenklimaten. MODELLED: drie registerrijen. De numerieke methoden halen de drempels A1 tot en met A6 die in <c5/> zijn vastgelegd tegen een onafhankelijk mpmath-programma; dat controleert de implementatie van de vermelde formules, niet de atmosfeer, en er is geen gemeten beschikbaarheidsrecord vergeleken, dus geen enkele rij is VALIDATED. De drempel A4 werd eerst met { "3e-9" } gemist omdat de gebruikte normale CDF een benadering van { "1.5e-7" } was; de CDF is vervangen en de drempel is gelaten zoals vastgelegd. De native build en de WebAssembly-build geven byte-identieke documenten voor beide meegeleverde scenario's (A7, uitgevoerd op de integratiecommit van { "0.37.0" }).

seg-eb589aff44ad = <b>Detectie-ROC van de IQ-monitors</b> (PRO-32, <a1><c1/></a1>). Een campagne met monitors bewaart van elke toetsstatistiek het maximum over vensters met vermelde gebeurtenissen (positief) en over getegelde vensters buiten de gebeurtenissen (negatief, <c2/>). Het rapport voegt ze per alarmsoort samen tot een ROC met zijn AUC en het werkpunt bij de ingestelde drempel, als <c3/> en een rapportsectie. Op synthetische campagnes wordt de controle op kansniveau gehaald. De AUC-drempel voor C/N0 ({ "0.95" }) wordt niet gehaald ({ "0.79" }), omdat de negatieve vensters direct na een gebeurtenis het verval van de CUSUM van de detectie erven; dit is vastgelegd. MODELLED.

seg-d25a34e23f1a = <b>IQ-monitors in de lab-replay-campagne</b> (PRO-31, <a1><c1/></a1>). Een optionele tabel <c2/> in een campagnebestand laat de IQ-monitors in de enkele doorgang van de runner draaien: vermogen en spectraal na elke front-endketen, en C/N0, SQM en lock per getrackt kanaal. Hun alarmen worden beoordeeld ten opzichte van de vermelde gebeurtenissen: gedetecteerd of gemist, tijd tot detectie en valse alarmen per blootstellingsuur. Van elke test is het valsalarmcijfer in gesloten vorm vermeld, waaronder een nieuw tweezijdig Gaussiaans cijfer voor de SQM-tests (<c3/>). Zonder de tabel verandert er niets. Op synthetische campagnes worden de valsalarmdrempels voor vermogen en SQM en de valsalarmdrempel voor C/N0 gehaald; { "18" } van { "18" } verzwakkingen worden gedetecteerd, maar de grens voor de tijd tot detectie, die per constructie onder één detectorsample ligt, wordt niet gehaald en is vastgelegd. MODELLED; registerrij "IQ monitors scored in lab-replay campaigns".

seg-8eb0f650065e = <b>Lab fit uit IQ-campagnes, vervolg</b> (<c1/>, CI-job <c2/>). Het toetst de twee hypothesen die §{ "13.6" } van <c3/> openliet, aan de hand van drempels die in 1e532f84 zijn vastgelegd. Het voegt twee synthetische campagnes toe: S, met een J/S in stappen (seed 2026_1014), en R, een nieuwe ramp (seed 2026_1015). De resultaten staan in <c4/>.

seg-ce60405d0005 = S1 gehaald: met elk J/S-niveau vastgehouden wordt <c1/> teruggevonden binnen +{ "0.185" } dB. De fout van −{ "1.1" } dB van de rampcampagnes is schatterlag.

seg-ea9f206c2999 = S2 niet gehaald, vastgepind door een test die de misser vaststelt: (d) zoals geschreven op de campagne in stappen geldt voor het trackinglusmodel ({ "0.45" } dB) maar niet voor het empirische ({ "6.42" } dB).

seg-fab0653558e4 = R1 gehaald: op de nieuwe rampcampagne ligt (d) met de gefitte dropverblijftijden plus de ramphelling van elke gebeurtenis binnen { "1" } dB voor beide modellen.

seg-24c6725c2c7d = De missers van (a′) en (d) herhalen zich op R.

seg-7cbbce356973 = Een campagne mag haar J/S nu vermelden als een profiel <c1/> in de testharnas.

seg-34007ba58a9f = Geen enkel oordeel in §{ "13" } verandert en de registerrij blijft MODELLED.

seg-df2c3f2532d6 = <b>Begrensde FLL-pull-in, opt-in</b> (DS-LOOP-05): een nieuwe lusontwerpsleutel <c1/> (s), Rust <c2/>. Onder <c3/> dwingt hij de overdracht van FLL naar PLL af na zo lang, wat de PLI ook is. Standaard niet ingesteld, en dan buiten de ontwerphash; het standaardontwerp en zijn hash zijn ongewijzigd.

seg-ae2794b2d3d5 = Gecontroleerd aan de hand van drempels die zijn vastgelegd bij 58789af0, op geïnjecteerde referentie. De controle wordt gehaald: de standaard draagt in { "9" } van { "10" } zaden bij { "33" } dB-Hz nooit over.

seg-6d9483874b35 = Niet gehaald: met een begrenzing van { "1.0" } s houden { "16" } van { "20" } runs de lock vast bij { "33" } dB-Hz en { "8" } van { "20" } bij { "31" } dB-Hz; de overige wisselen tussen geforceerde overdrachten en de terugkeer van de FLL. De fasejitter is { "1.8" }× die van de PLL alleen bij { "33" } dB-Hz.

seg-deeefaf50e3e = De pull-in-ondergrens van ~{ "35" } dB-Hz blijft de gedocumenteerde limiet van de standaard.

seg-780de73c01e1 = MODELLED; registerrij "Begrensde FLL-pull-in onder de FLL-naar-PLL-overdrachtsondergrens van het standaardontwerp (opt-in)".

seg-ace6b53749bd = <b>Acquisitiehysterese en de quantiser van de front-end in het jamming-type</b> (CAP-06c): twee optionele secties voor een <c1/>-scenario.

seg-4621a740e6ee = <c1/>: <c2/> (dB-Hz, op of boven de trackingdrempel) en <c3/> (s, standaard { "0" }). Een satelliet wordt geacquireerd op of boven de acquisitiedrempel, zodra hij zo lang als de vertraging niet geacquireerd is geweest. Hij wordt vastgehouden zolang hij op of boven de trackingdrempel ligt. Uitvoer: <c4/> (true/false), <c5/> (aantal) en <c6/> ({ "1" }).

seg-b568f542e23a = <c1/>: <c2/> ({ "1" } tot { "16" }) en <c3/> (MHz, standaard tweemaal de chipsnelheid). Geeft een blok <c4/>: <c5/> (dB, <c6/>), <c7/> (dB, van de effectieve C/N0 van elke link afgetrokken) en <c8/>. Het verlies is dat bij Gaussiaanse invoer, gemarkeerd als niet geldig voor CW-, smalband- en gezwiepte jammers.

seg-0dad81736863 = Zonder de secties is elke uitvoer byte-identiek.

seg-92007bfb6680 = Gecontroleerd aan de hand van drempels die zijn vastgelegd bij 70c72fcc. Het quantiseringsverlies ligt binnen { "0.0007" } dB van een onafhankelijke Monte Carlo en de AGC-aflezing binnen { "0.012" } dB van de AGC-lus van de IQ-laag.

seg-973e451df99d = De geregistreerde hysteresis-runs waren niet informatief (elke link verloren), dus die drempel is NOT MET. Een aanvullende runset, vastgelegd bij { "37793290" }, haalt hem wel: elke vlag is gelijk aan een onafhankelijke herberekening en { "732" } van { "1824" } links tonen de hysterese.

seg-912e9f1a4d5b = Bevinding: met een CW-jammer verliest een 1-bit-ADC ongeveer { "5" } dB meer dan het Gaussiaanse cijfer.

seg-a19aee81b581 = MODELLED; registerrij "Acquisitiehysterese en de quantiser van de front-end in het jamming-type tegen onafhankelijke herberekeningen".

seg-97f43a4fe71d = <b>Terreinafscherming van de jammer in het jamming-type</b> (CAP-06b): een optionele sectie <c1/> in een <c2/>-scenario met een jammer. Velden:

seg-6d59a2857ab9 = <c1/>: een SRTM-<c2/>-tegel, relatief ten opzichte van de werkmap;

seg-fa5b15500405 = <c1/>, <c2/> en <c3/> (deg): de grootte en de hoek van de tegel;

seg-09a35655f010 = <c1/> (m, standaard { "0" }), <c2/> (standaard 4/3) en <c3/> (m, standaard { "30" }).

seg-ad58fe7ff627 = De engine bemonstert het grootcirkelterreinprofiel tussen jammer en ontvanger en vindt de dominante messcherpe rand. Het ontvangen vermogen van de jammer, en dus elke J/S, wordt verlaagd met het verlies van één messcherpe rand volgens ITU-R P.526-15 §{ "4.1" }.

seg-001d7b88b26d = Het resultaat krijgt een blok <c1/>: <c2/> ({ "1" }), <c3/> (dB), <c4/> (m), <c5/> (m), <c6/> (m) en <c7/> (aantal).

seg-b9696f5eda4b = Zonder de sectie is elke uitvoer byte-identiek.

seg-593b6a5b4480 = Gecontroleerd aan de hand van drempels en tien plaatsingen die zijn vastgelegd bij 92cd2bfd, op de vastgelegde echte SRTM-tegel van Death Valley, tegen een onafhankelijke numpy-herberekening. Alles gehaald: ongunstigste verschil { "1.6e-10" } op <c1/> en op het verlies (drempel { "1e-9" }), het verlies monotoon in jammerhoogte, en het verlies dat J/S exact bereikt.

seg-62e07defd715 = MODELLED; registerrij "Terreinafscherming van de jammer in het jamming-type tegen een onafhankelijke numpy-herberekening op een echte SRTM-tegel".

seg-378e9052e2c4 = <b>CRPA-antennewinsten in het jamming-type</b> (CAP-06a): een optionele sectie <c1/> in een <c2/>-scenario. Velden: <c3/> (elementposities in lokaal oost-noord-omhoog, m), <c4/> (<c5/> of <c6/>) en <c7/> (MVDR-ruisbandbreedte, MHz, standaard tweemaal de chipsnelheid).

seg-ca39fefc0fb3 = Elk kanaal vormt een vervormingsvrije bundel naar zijn satelliet. De ruis van de link wordt geschaald met <c1/> en de jammer met <c2/> vóór de bestaande anti-jam-C/N0-vergelijking.

seg-1f1ddc11ad94 = Elke link krijgt een blok <c1/>: <c2/> (dB) en <c3/> (dB).

seg-790ecc6a1bd4 = Een ongeldige sectie (een lege elementenlijst, een onbekende weging, een niet-positieve bandbreedte) is een fout, via <c1/> en <c2/> evengoed als via <c3/>.

seg-2464d9dde85f = Gecontroleerd aan de hand van drempels die zijn vastgelegd bij 08d83b4d. Gehaald: additiviteit (na een correctie: de eerste build voegde de nieuwe eenheden toe aan de eenhedentabel van elke jamming-run); één element is geen array; ruiswinst en effectieve C/N0 tegen een onafhankelijke numpy-herberekening binnen { "1e-9" } dB; MVDR nadert de null bij hoge JNR.

seg-c04495f7a65a = Niet gehaald: de jammerwinst van MVDR op { "194" } van { "456" } links op de portable wiskunde van { "0.36" } ({ "202" } op host-wiskunde; <c1/>) (ongunstigste { "1.7e-6" } dB). De residuen van −{ "100" } tot −{ "188" } dB liggen onder de resolutie van float64 bij die drempel, en numpy wijkt van zichzelf af in dezelfde orde van grootte.

seg-c10e1c72eb15 = MODELLED; registerrij "CRPA antenna gains in the jamming kind against an independent numpy recomputation".

seg-0a3adfa7271c = <b>IQ-trackingengine tegen GNSS-SDR { "0.0.19" }</b> (PRO-33): <c1/> en GNSS-SDR tracken dezelfde onafhankelijke numpy-opnames van GPS L1 C/A bij { "30" } tot { "45" } dB-Hz.

seg-cc73857e38e8 = Drempels vastgelegd bij 48edd4a5. De geregistreerde kalibratie mislukte door een onjuiste overdracht van GNSS-SDR (F3), dus Amendement { "1" } (1e4288c4) voegt een FLL alleen voor pull-in toe aan beide ontvangers, vastgelegd vóór enige testopname.

seg-1d651ff134f9 = Gehaald: draaggolf- en codejitter en Doppler komen binnen { "5" } % overeen bij elke C/N0.

seg-bc9c9a0247d1 = Niet gehaald: de NWPR-C/N0 van de engine leest { "2.3" }–{ "7.1" } dB lager dan de SNV van GNSS-SDR (F4, een bekende schatterlimiet; M2M4 ligt binnen { "0.06" } dB van de referentie); de lock-indicatoren verschillen per definitie (F5); één meningsverschil over een slip bij { "30" } dB-Hz (F6).

seg-7c32867b5c27 = MODELLED; registerrij "IQ tracking engine against GNSS-SDR { "0.0.19" } on independent recordings".

seg-6ba057fab559 = <b>Twee VALIDATED rijen voor codes van de IQ-laag</b> (DS-GIQ-06b, PRO-39).

seg-55524624777b = <b>BeiDou B1I.</b> Alle { "63" } primaire B1I-codes komen chip voor chip overeen met de onafhankelijke generator van GNSS-SDR { "v0.0.19" } (drempel vastgelegd bij 911106d1). Alleen de uitvoer van dat programma is vastgelegd: de B1I PRN-codes die de openbare ICD definieert, als prefix en hash.

seg-37437a09dd67 = <b>GPS L1C.</b> Alle { "126" } L1CP/L1CD-codes en { "63" } L1CO-overlays komen overeen met de controlekolommen die IS-GPS-800J afdrukt, en de berekende Legendre-reeks komt overeen met zijn Tabel 6.2-1 (drempels vastgelegd bij fe372e26).

seg-f445784a7f2d = Rijen: "BeiDou B1I primary ranging codes against an independent generator" en "GPS L1C ranging and overlay codes against the IS-GPS-800J printed check columns".

seg-001f48d86a3c = <b>GLONASS-, BeiDou- en Galileo E6-banden in het spectrummodel</b> (CAP-12, signalen): nieuwe bandnamen <c1/> en <c2/> (elk FDMA-kanaal als <c3/>, K = −{ "7" } tot { "6" }), <c4/>, <c5/>, <c6/>, <c7/> en <c8/>. Elk draagt zijn ICD-draaggolf, modulatie en minimaal ontvangen vermogen. Ze zijn opt-in op naam: de standaardbandenset en elke bestaande uitvoer zijn ongewijzigd.

seg-158a6ec19d6b = Gecontroleerd aan de hand van drempels die zijn vastgelegd bij 5806f28b: de ICD-waarden, nulpunten, het B1C-samenstel en het C/N0-pad worden gehaald.

seg-805092ae8ca2 = Twee drempels werden niet gehaald. De drempel voor eenheidsoppervlak was zoals geschreven onhaalbaar (F1). De B1I- en B1C-golfvormen van de IQ-laag komen alleen gemiddeld over de band met het model overeen, vanwege de ongelijke lijnspectra van hun codes (F2).

seg-db88f07d97bb = MODELLED; registerrij "Spectrum model: GLONASS, BeiDou and Galileo E6 bands (opt-in)".

seg-b0147cf3acc8 = <b>Cell-averaging CFAR-optie in IQ-acquisitie</b> (PRO-37): <c1/> en <c2/> beslissen op een acquisitieraster door elke cel te vergelijken met het gemiddelde van referentiecellen in zijn Dopplerrij. De drempelwaarde komt uit de gesloten-vormkans op vals alarm van CA-CFAR voor <c3/> niet-coherente blokken (<c4/>, <c5/>), zodat de beslissing niet afhangt van de normalisatie van het samplevermogen. Het is opt-in; de standaarddetector en elke bestaande uitvoer zijn ongewijzigd.

seg-a56e74b1e091 = Gecontroleerd aan de hand van drempels die zijn vastgelegd bij 3724aefa: de gesloten vorm tegen Monte Carlo ({ "18" } van { "18" } gevallen), en een ontwerpfrequentie van { "1" } % die is gemeten als { "0.97" }–{ "1.01" } % op Gaussiaanse en 2-bit gekwantiseerde ruis.

seg-f88fe97e0ee6 = Eén drempel werd niet gehaald: op een ruisvrij 2-bit-signaal overschrijdt { "1.28" } % van de cellen naast de piek de drempelwaarde, bij de correlatiezijlobben van de code (bevinding F1).

seg-8d88b626c31e = MODELLED; registerrij "Cell-averaging CFAR option in IQ acquisition".

seg-d596329195cf = <b>Scintillatiemodel tegen gemeten data</b> (PRO-34): het Cornell-scintillatiemodel van het IQ-kanaal is vergeleken met gemeten { "50" } Hz GPS L1-intensiteit en -fase van een equatoriale scintillatienacht (Zenodo-record { "16941224" }, INGV, Malindi, CC BY { "4.0" }), onder drempels die zijn vastgelegd bij b6ccb499. Gehaald: de intensiteitsverdeling en de aan S4 gekoppelde fasescintillatie. Niet gehaald: het model fadet { "2.4" } keer zo vaak onder −{ "10" } dB en { "3.5" } keer zo lang (bevinding F1). De geregistreerde verwerking leest de omwikkelde fase van het model (bevinding F2); het faseresultaat blijft gelden met de fase uitgewikkeld. <c1/> haalt de data op. De rij blijft MODELLED: "IQ ionospheric scintillation channel (Cornell model) against measured { "50" } Hz GPS L1 scintillation".

seg-d6740cab2271 = <b>Gecorrigeerde LuGRE-samplelezer</b> (MR-09): <c1/> leest een LuGRE-IQ-batch met I in de hoge nibble en de mid-rise-niveaus <c2/> (<c3/>), die het gemiddelde van −½ wegnemen dat de kale two's-complement-gehele getallen op I en Q hebben. <c4/> geeft GNSS-SDR dezelfde lezing. De generieke ION-lezer en elke bestaande uitvoer zijn ongewijzigd: { "149" } scenarioresultaten en een studie zijn voor en na byte-identiek, en de vastgepinde LuGRE-bevindingen lezen zoals geregistreerd (<c5/>). Er verandert geen enkele registerrij.

seg-5adf36c03c14 = <b>Opt-in BOC({ "1,1" })-tracking</b> (CAP-07 (a)): <c1/> herschaalt de DLL-discriminatoren voor de hoofdpiek van de sinus-BOC({ "1,1" }) en voegt een bump-jump-monitor toe (zeer vroege en zeer late correlatoren op ±{ "0.5" } chip, op/neer-tellers, <c2/>) die de code-NCO van een zijpiek afhaalt; <c3/> vermeldt de sprongen. Standaard uit, en elke bestaande uitvoer is ongewijzigd. Gecontroleerd aan de hand van drempels die zijn vastgelegd bij 6b68f6cc op een synthetisch BeiDou B1C-signaal: een start op een zijpiek die zonder de optie { "0.55" } chip ernaast blijft, wordt met de optie door één sprong bij { "0.08" } s op de hoofdpiek getrokken, en er is geen valse sprong vanaf de hoofdpiek gezien. Eén drempel werd niet gehaald: het unittestraster voor de schaling reikt buiten het lineaire bereik van de discriminatoren (bevinding F1 in <c4/>). MODELLED; registerrij "BOC({ "1,1" }) tracking: DLL scaling and bump-jump ambiguity resolution (opt-in)".

seg-89345aa385f7 = <b>Lab fit uit IQ-campagnes</b> (B7.1, <a1><c1/></a1>). De <c2/> van een labfit-scenario fit een uitvoermap van <c3/> op de CLI (<c4/>), in Python (<c5/>) en in de MCP-labfit-tool (alleen mappen binnen de eigen werkmap). Het fit één eenheid per signaal, lusontwerp, front-endketen en jammertype:

seg-1726361b81c4 = het C/N0-model tegen vermelde J/S, met censurering;

seg-e1b8a27b06fd = de trackingdrempel, rechtstreeks en in gesloten vorm;

seg-8dce89923619 = de trackinglus- en empirische lockmodellen, gekoppeld via het C/N0-model, met hun verblijftijden;

seg-108646713c97 = een gezaaide clusterbootstrap over opnames, voorspellingsintervallen van { "90" } % en achtergehouden sets waarbij telkens één opname wordt weggelaten;

seg-ee5deb4d5d4b = een vooraf vastgelegde, gehashte tabel <c1/>, met PASS/FAIL per drempel.

seg-4d58263106af = Het rapport is <c1/> als JSON, CSV en Markdown, met een eenhedenblok. <b><c2/> is niet identificeerbaar uit C/N0-data</b> zonder een onafhankelijke vermogensmeting. Het wordt vermeld, nooit gefit, en de gefitte parameter is <c3/> (ontwerpamendement 2026-10-12). Een onbekend jammertype neemt de meest schadelijke vermelde <c4/> (cw, { "1" }). Op synthetische campagnes uit de eigen scènes van Kshana wordt de drempel voor hold-out-dekking (c) gehaald. De <c5/>-drempels (a') en (b') ({ "0" } van { "50" } campagnes gedekt) en de drempel voor de drempelwaarde in gesloten vorm (d) worden niet gehaald: ze zijn met hun waarden vastgelegd. MODELLED; registerrij "Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error". Het labfit-pad voor ontvangerlogs en de uitvoer ervan zijn ongewijzigd.

seg-308d19be658d = <b><c1/> op een JPL-kernel</b> (CAP-31): <c2/> neemt elk lichaam dat de SPK bevat (met de440s: Mercurius, Venus, de Aarde, de Maan) uit de kernel, label <c3/>, en voegt alleen een blok <c4/> toe wanneer ingesteld. Nieuwe rij, VALIDATED tegen SPICE (vastgelegd f8e946ea; ongunstigste { "3.3e-5" } m, { "1.0e-11" } m/s). Het standaardrapport is ongewijzigd.

seg-fe16c24eae60 = <b>Porkchop op de DE440-efemeride</b> (CAP-20b): <c1/> doorloopt C3 en aankomst-V∞ op heliocentrische toestanden uit een DE440-SPK. Nieuwe rij, VALIDATED tegen SPICE-toestanden

seg-a8632f3c86e9 = pykep { "3.0.1" } (vastgelegd 2d857fb1; Aarde naar Mars 2026-2028, { "304" } cellen, ongunstigste { "2.6e-14" }, dezelfde cel met minimale C3).

seg-266cffab38a7 = <b>Niet-gravitationeel macromodel van LRO: NOT MET</b> (DS-LRO-10, vastgelegd e82047e2). <c1/> (opt-in via <c2/>): directe zonnestraling op platte platen met de schaduw van de Maan, een zon-volgend paneel, en maanalbedo en thermische IR; <c3/> is een als zodanig gelabelde generieke LRO-benadering uit gepubliceerde feiten (geen buisplaten: de plaattabel was niet te verkrijgen). Op de LRO-boog van { "4" } uur laat het de reduced-dynamic-rms op { "6.668" } m en de dynamische op { "11.94" } m, met een onwaarschijnlijke stralingsfactor (ongeveer +{ "21" } / −{ "22" }), dus alle drie de drempels worden gemist. De bevinding is vastgepind door een test en er verandert geen standaarduitvoer (<c4/>). De opt-in maan-kogel-SRP gebruikt nu de conische schaduw van de Maan in plaats van die van de Aarde (<c5/>).

seg-e4ed6e0e5048 = <b>Maan-OD: optionele k2-vaste getij en seleno-centrische relativiteit</b> (DS-LRO-11), standaard uit (<c1/>, <c2/>); een schakelaar <c3/> voor de ANISE-kruiscontrole (DS-LRO-04); een fixture met een LRO-boog van { "24" } uur en een louter informatieve fit over een lange boog (DS-LRO-09). Informatieruns zijn vastgelegd in <c4/>; er verandert geen gepubliceerd getal.

seg-b065138adba8 = <b>CR3BP { "9" }:{ "2" } NRHO tegen CAPSTONE</b> (CAP-29d): nieuwe MODELLED rij die de circulair-beperkte NRHO van de engine meet tegen de gevlogen baan van CAPSTONE (JPL Horizons, maart { "2023" }; vastgelegd { "4e868170" }): periode { "1.07" } %, apolune { "0.05" } %, perilune { "4.1" } % ten opzichte van de gemiddelden van CAPSTONE, binnen de vastgelegde drempels van { "3" } / { "5" } / { "20" } %. Een meting, geen toetsing aan een onafhankelijke externe referentie.

seg-954bd2771180 = <b>CR3BP-roterende toestanden naar maangecentreerde ICRF</b> (RM-34, FUT-06): <c1/> / <c2/> / <c3/> zetten een dimensieloze roterende Aarde-Maan-toestand om naar de ogenblikkelijke DE440 Aarde-Maan-lijn, inclusief de buitenvlakse snelheid van het stelsel. Nieuwe rij, VALIDATED tegen een SPICE-tweevectorstelsel (vastgelegd 2313eb1b, gewijzigd vóór enige run d5ef79b3; { "72" } gevallen, ongunstigste { "1.8e-7" } m en { "1.2e-9" } m/s).

seg-54aec3e311cf = <b>Quantumvoorinstelling <c1/></b> (CAP-08c): een meegeleverd inertiaalscenario waarin een accelerometer met koude-atoominterferometer, gespecificeerd door zijn interferometerfysica (<c2/> met een vermeld trillingsniveau van het platform), gedurende een GNSS-uitval van 110 minuten meeloopt naast een kwartsaccelerometer van navigatiekwaliteit. MODELLED.

seg-21d2b7fd2a21 = <b>Exacte equivalente vrijheidsgraden van Greenhall</b> (CAP-03): <c1/>, het volledige algoritme van Greenhall en Riley ({ "2003" }) (verschilordes { "1" } tot { "3" }, ruisexponenten +{ "2" } tot -4, overlappend en niet-overlappend, gemodificeerd en ongemodificeerd, met de grote-J-tabellen), met ADEV-, MDEV- en HDEV-wrappers. VALIDATED in een vooraf vastgelegde vergelijking met allantools { "2024.6" }: { "4 876" } rasterpunten binnen { "6.0e-13" } relatief; allantools faalt bij { "32" } verdere punten, die zonder waarde van een onafhankelijke referentie zijn vastgelegd. De betrouwbaarheidsintervallen van <c2/> zijn bit voor bit ongewijzigd.

seg-8e04ebc15045 = <b>Foutermen van de koude-atoominterferometer</b> (RM-26/27/28): Raman-laserfaseruis (met de term voor de vertraging van de retroreflectie), de bias door golffrontkromming van een thermische wolk (zuivere defocus, met een detectiestraal) en de oplossing van de franje-ambiguïteit (klassiek ondersteund en met twee interrogatietijden), als bibliotheekfuncties in <c1/>, elk in gesloten vorm gecontroleerd met kwadratuur of Monte Carlo. MODELLED; nog niet bereikbaar vanuit een scenariosoort (<a1><c2/></a1>).

seg-7d2899c3173b = <b>Klok-logformaten</b> (RM-03): <c1/> leest RINEX-klokbestanden, ASCII-fase- of frequentielogs in TimeLab-stijl en TAPR TICC-tellerlogs in één genormaliseerde faserij (tau0 opgegeven of gevonden, hiaten geteld, een hiatenbeleid). Op aanvraag: een telecom-tijdsynchronisatiereeks kan een log noemen (<c2/>), en de tabel <c3/> van een klokscenario voegt een blok <c4/> toe (ADEV, TDEV, MTIE). Zonder de tabel zijn beide soorten byte-identiek (<a1><c5/></a1>). Een vooraf vastgelegde vergelijking op drie synthetische logs haalde haar fase- en bedradingsdrempels; de schatters komen overeen met allantools binnen { "2.5e-14" } overal waar die evalueert, en allantools evalueert het MTIE-punt over het hele record niet (vastgelegd). MODELLED.

seg-53369a5c3749 = <b>Maskers voor wander bij frequentiesynchronisatie</b> (RM-01): de soort <c1/> krijgt zeven MTIE- en TDEV-maskers voor wandergeneratie bij constante temperatuur, ITU-T G.811 PRC, G.812 Types I tot III, G.8262 EEC Options { "1" } en { "2" } en G.8262.1 eEEC, met de machtswetstukken die de tabellen opgeven, en het referentiescenario <c2/> (een vrijlopende OCXO tegen de EEC-maskers: het faalt bij { "1 000" } s, waar een lus het werk moet doen). Elke rij is opnieuw gelezen tegen de tekst op itu.int; G.812 (06/2004) is vervangen door een vooraf gepubliceerde editie van 08/2026 die niet kon worden gelezen. MODELLED (een transcriptie); bestaande maskers en uitvoer zijn ongewijzigd.

seg-5e84b35ee4e7 = <b>Richtlijn voor de filter-prior van de soort <c1/></b> ({ "0.36" }, WP-09, bevinding RM-21): de standaard filter-prior van het pakket past bij een IMU van tactische kwaliteit. Met een IMU van navigatiekwaliteit kan de standaardwaarde de gefuseerde meeloop slechter maken dan vrije INS: { "52" } m tegen { "11" } m op een vliegtuigprofiel van { "70" } m/s. Stel <c2/> in op de kwaliteit van de sensor, zoals de nieuwe pakketten voor maritiem, spoor en luchtvaart doen. Geen enkel meegeleverd scenario koppelt een IMU van navigatiekwaliteit aan de standaard prior: elk scenario dat de standaardwaarde gebruikt, heeft resterende accelerometerbiases van ten minste { "0.015" } m/s². Alleen documentatie; geen uitvoer verandert.

seg-f74b3c265f3a = <b>Test-bench-export gecontroleerd met de eigen lezers van een simulator</b> ({ "0.36" }, WP-09, CAP-16): de bewegingsbestanden van <c1/> voor { "8" } meegeleverde scenario's zijn teruggelezen door de NMEA-, breedtegraad/lengtegraad/hoogte- en aardvaste bewegingslezers van gps-sdr-sim (MIT, commit 28ca29a6, gebruikt als afzonderlijk hulpmiddel via <c2/>; er wordt geen signaalfunctie aangeroepen). Ze geven het geëxporteerde traject terug tot op { "1.2" } mm, { "0.15" } mm en exact. BEVINDING: de aardvaste lezer van die simulator kan de CSV met volledige breedte niet verwerken, omdat zijn regelbuffer van 100 tekens elke rij splitst. <c3/> geeft nu de te gebruiken kolomsneden en de limiet van { "300" } s van de simulator. VALIDATED (nieuwe registerrij); de bytes van de export zijn ongewijzigd.

seg-e77e1ac87dd5 = <b>GNSS/INS op de KF-GINS-dataset</b> ({ "0.36" }, WP-09, FUT-17): <c1/>-loaders en -runner en het meetmodel voor de hefboomarm in de gesloten-lus-EKF. Op de KF-GINS-demodataset (op testmoment opgehaald, niet meegeleverd) is de horizontale RMS van Kshana ten opzichte van het referentietraject { "1.09" } cm, tegen de eigen { "1.11" } cm van KF-GINS, en elke vooraf vastgelegde drempel is gehaald. VALIDATED op bewijs dat aan data is gebonden (besluit van de eigenaar, 2026-10-13): de dataset wordt opgehaald met SHA-256-pins en het reproductiepad staat in <c2/>.

seg-4d5a503c5c9c = <b>Gekoppeld PNT-filter in het fusiepakket</b> ({ "0.36" }, WP-09, FUT-16): de soort <c1/> accepteert een optionele tabel <c2/> die één gestapeld filter op pseudoranges laat draaien met een accelerometerbiastoestand (<c3/>), en <c4/> is de 3D-versie met 8 toestanden. Nieuw meegeleverd scenario <c5/>: met bevooroordeelde accelerometers houdt de gekoppelde modus de positie van de quantumsuite op { "18.7" } m (95e percentiel) met volledige integriteit, waar de ontkoppelde filters { "430" } m halen. Zonder de tabel zijn <c6/> en <c7/> ongewijzigd (vastgepind); <c8/> weigert de tabel. MODELLED.

seg-b7f07e3693df = <b>GNSS/INS-pakketten voor maritiem, spoor en luchtvaart</b> ({ "0.36" }, WP-09, RM-21): meegeleverde scenario's <c1/>, <c2/> en <c3/> op de trajectbibliotheek, en een optionele tabel <c4/> voor de soort <c5/> die pseudoranges fuseert van een SGP4-Walkerconstellatie (alle satellieten bij nominaal bedrijf, de hoogste paar bij degradatie). Bij het spoorpakket houdt strakke koppeling de oplossing van navigatiekwaliteit op { "5.3" } m door een insnijding en tunnel, tegen { "12.9" } m bij losse koppeling. Zonder <c6/> is het pakket ongewijzigd (vastgepind). MODELLED.

seg-0daf8b2646ad = <b>Strakke koppeling met draaggolffase</b> ({ "0.36" }, WP-09, RM-25 / FUT-17): <c1/>, een foutentoestands-EKF met een expliciete klok van de ontvanger met twee toestanden en float-draaggolfambiguïteiten, aangedreven door een SGP4-Walkerconstellatie met Klobuchar- en Saastamoinen-correcties in de meetlus, slipdetectie op basis van tijdsverschillen van de draaggolf en herinitialisatie van ambiguïteiten, en een run met alleen code op dezelfde metingen ter vergelijking. MODELLED: bij een rit in een figuur-8 is de draaggolfoplossing { "2.5" } cm tegen { "47" } cm met alleen code, en NIS/NEES zijn consistent over seeds.

seg-7032646c0bc4 = <b>GNSS/INS-trajectbibliotheek</b> ({ "0.36" }, WP-09, RM-24): de soort <c1/> accepteert een optionele tabel <c2/> met <c3/>. De profielen sturen Eulerhoeksnelheden en versnelling langs het spoor aan vanuit de referentietoestand en leiden de ware IMU af uit starrelichaamkinematica (gecoördineerde bochten, klimmen, Coriolis); <c4/> importeert een referentietraject (<c5/>) en lost de IMU op die het reproduceert. Zonder de tabel vliegt het pakket zijn historische rit, bit voor bit (vastgepind). MODELLED.

seg-e6b31bf61185 = <b>DEM-tegels met breedte- en lengtegraad voor de maanhorizon</b>: <c1/> leest een tekstbestand <c2/> (hoogten boven de gemiddelde bol op een raster van breedte- en lengtegraad) in plaats van de poolstereografische <c3/>, voor zowel <c4/> als <c5/>; het rapport toont de tegel (<c6/>, met zijn SHA-256). <c7/> is nu aangesloten op de horizon-raymarch. Een tegel die is geherbemonsterd uit de meegeleverde uitsnede geeft het station de horizon van de uitsnede tot op { "0.22" } graad. MODELLED.

seg-0c7ebb6c7d0d = <b>Terrein op de exportlocatie van het dekkingsvolume</b>: met een sectie <c1/> bevat elke rij van de geometrie-export per satelliet van <c2/> de waarde <c3/> (de satelliet komt vrij van het vlakke masker en van de horizon van de exportlocatie op zijn azimut), bevat het rapport de horizon van de locatie (<c4/>) en krijgt de runtime-CSV de kolom erbij. Zonder terrein is de export ongewijzigd. MODELLED.

seg-7c8789777c26 = <b>Kopvelden uit de engine</b> ({ "0.36" }, STUDIO-06): <c1/>, <c2/> en de WebAssembly-functie <c3/> geven, voor twaalf soorten, aan welke velden van een scenario zijn vraag beantwoorden, de beste eerst, als punt-paden (<c4/>). De Studio leest ze vóór haar eigen rangschikking. Alleen weergavemetadata: de engine leest ze nooit, geen scenariobestand heeft ze nodig, geen resultaat hangt ervan af. <c5/> faalt als een soort niet kan worden aangestuurd of als een pad in geen enkel meegeleverd scenario van de soort voorkomt (de test ving twee paden op die de afgevlakte id's van de Studio zonder de arrayhaken hadden geschreven).

seg-7528700924b2 = <b>Tabel van soort naar module uit de engine</b> ({ "0.36" }, STUDIO-05): <c1/>, <c2/> en de WebAssembly-functie <c3/> geven, voor elke scenariosoort waarvan de rijen van de verificatiematrix een andere module noemen dan de eigen, de modulenamen. De mogelijkhedenkaart van de Studio gebruikte een eigen met de hand geschreven kopie; <c4/> faalt als een soort in de tabel niet kan worden aangestuurd of als een module in geen enkele matrixrij voorkomt. Er is geen uitvoer veranderd.

seg-af7d28b7fb0e = <b>Korte IQ-run in de browserbuild</b> ({ "0.36" }): <c1/> en <c2/> in de WebAssembly-module bouwen een synthetische scène op, acquireren elke satelliet en tracken de geacquireerde, alles in het geheugen, begrensd tot { "0.25" } s, { "1 000 000" } samples en { "8" } satellieten. De scènebouwer en het opzoeken van een signaal op naam zijn verhuisd uit het alleen-native <c3/> (naar <c4/> en <c5/>) zodat beide builds ze delen; de uitvoer van de opdrachtregel is ongewijzigd. De native test en <c6/> vergelijken hetzelfde verzoek met één golden (<c7/>), byte voor byte: sinds de wijziging naar draagbare wiskunde (STUDIO-15, hieronder) geven de browserbuild en de native build dezelfde bits.

seg-c0eab9b97b7d = <b>Getypeerde Python- en TypeScript-API's</b> (CAP-34): <c1/> typeert de gesloten vocabulaires (<c2/>, elke soortnaam; <c3/>; <c4/>) en de woordenboeken <c5/> en <c6/>; <c7/> en <c8/> geven ze terug. Het WebAssembly-pakket voegt <c9/> toe (één run als getypeerd <c10/>-object met het geparseerde document als <c11/>) en <c12/> (de geparseerde <c13/>), en zijn <c14/> bevat hetzelfde vocabulaire; <c15/> is getypeerd als <c16/>. <c17/> houdt beide lijsten gelijk aan die van de engine.

seg-b097c2f105c3 = <b>Eenheden voor elke <c1/>-kolom</b> (FUT-28): een resultaat van <c2/> bevat nu <c3/> en <c4/>, de eenheid van elke gesweepte sleutel en elke vastgelegde metriek, gelezen uit de eigen eenhedentabel van het gesweepte pakket. Een as mag <c5/> declareren voor een sleutel die het pakket niet teruggeeft; een gedeclareerde eenheid die die van het pakket tegenspreekt wordt geweigerd, en een eenheid die geen van beide opgeeft is <c6/>, nooit geraden. <c7/> en <c8/> worden beschreven, zodat elk van de { "76" } soorten nu volledig wordt gedekt door de poort voor veldeenheden (plafond voor niet-gedekte soorten { "1" } -> { "0" }).

seg-3a83af8daa43 = <b>NumPy-arrays uit <c1/></b> (FUT-26): het Python-object <c2/> krijgt <c3/>, <c4/> en <c5/>, die <c6/>s teruggeven voor een numerieke lijst, de numerieke kolommen van een lijst van records, of elke recordreeks in het document. Elke array is gelijk aan <c7/> van dezelfde waarden uit <c8/> (dtype en bits). NumPy wordt alleen geïmporteerd wanneer een van deze wordt aangeroepen en blijft buiten de runtimevereisten. Getypeerd in <c9/> en gecontroleerd met stubtest.

seg-1c7a22dabad3 = <b>Campagne-optimaliseerder</b> (CAP-32): de nieuwe, optionele sectie <c2/> van de soort <c1/> zoekt binnen opgegeven grenzen één tot drie scenariosleutels voor de beste waarde van één metriek: minimaliseren, maximaliseren of een doelwaarde treffen. Hij zoekt uitputtend op een raster, of met een deterministische begrensde Nelder-Mead-simplex. Elke evaluatie is een echte run van de genoemde soort en staat in de <c3/> van het resultaat. Voorbeeld: <c4/>. De drempels zijn vooraf vastgelegd (<c5/>):

seg-f4e79236b6bf = de Rosenbrock-functie is gehaald (f* = { "1.7e-20" });

seg-3dbe3fdfebcf = een 1D-doeloplossing in gesloten vorm is gehaald ({ "6e-15" } relatief);

seg-5ab478e03354 = het raster is bit-gelijk aan een onafhankelijke brute-force-berekening;

seg-ea0a04c6e713 = de simplex doet het minstens zo goed als een raster van { "41" } × { "41" } in { "177" } runs.

seg-161d8c5b55e8 = De 1D-drempel van ronde { "1" } is vastgelegd als NOT MET, omdat de vooraf vastgelegde box de oplossing uitsloot. MODELLED; registerrij "Bounded optimisation of one metric over campaign parameters". Additief: campagnes zonder de sectie zijn ongewijzigd.

seg-83d40a636fcb = <b>Kalibratie-ensembles</b> (CAP-10): drie controles met één seed, opnieuw uitgevoerd over { "200" } onafhankelijke seeds tegen vooraf vastgelegde drempels, in <a1><c1/></a1> (gegenereerd door <c2/>; waarden per seed in <c3/>).

seg-b163e53e06e9 = Het bootstrap-interval van { "95" } % van de campagne-Monte-Carlo dekt het ware gemiddelde bij { "192" } van { "200" } ensembles, en zijn chikwadraatcontrole slaagt bij { "196" }.

seg-022a7fbee13a = De percentieltolerantie met één seed slaagt slechts bij { "183" } van { "200" }: NOT MET, zoals voorspeld. Het is een drempel van ongeveer 2 sigma, vastgelegd en niet versoepeld.

seg-096f36d21b02 = De ADEV-kalibraties voor witte FM slagen bij elke seed, met hun slechtste fout ver binnen de tolerantie.

seg-369c7f2a115c = <b>Ingebouwde soorten via de trait <c1/></b> (FUT-27, in uitvoering): de trait <c2/> (<c3/>, met een tierhaak per cijfer en <c4/>), en de eerste soorten die erop zijn overgezet (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>). De uitvoer is ongewijzigd: een manifest van de hele catalogus met de SHA-256 van elke uitvoer is voor en na identiek (<c10/>).

seg-fd6e68ff5e5d = <b>Playground-controle zonder ophalen</b> (RM-07): <c1/> controleert drie dingen:

seg-3e424188f6e1 = elk bibliotheekscenario van de Studio zit in de browserbundel;

seg-2803ccf8b9ae = de bundel is byte-identiek aan <c1/>;

seg-b98016a4a844 = elk browserscenario draait vanuit een lege werkmap.

seg-efc143b4f2a9 = <b>Alt-PNT-kaarten: echt zwaartekrachtveld, Monte Carlo van kaartfouten, SRTM op volledige resolutie</b> ({ "0.36" }, WP-10). De soort <c1/> accepteert een optionele <c2/>: een zwaartekrachtanomalie gesynthetiseerd uit de meegeleverde EGM2008-coëfficiënten (of uit een ICGEM-bestand <c3/> via <c4/>, alleen native builds). Die synthese komt overeen met de ICGEM Calculation Service tot ongeveer { "1e-8" } mGal over { "794" } knooppunten in twee regio's, tegen vooraf vastgelegde drempels van { "0.005" } mGal RMS en { "0.02" } mGal max (VALIDATED; registerrij "Gravity-anomaly synthesis from a spherical-harmonic model"). Het nieuwe meegeleverde scenario <c5/> draait de benchmark van 60 minuten op dat echte veld van graad 70. Vooraf vastgelegde uitkomst: gematchte fout { "3106" } m, dus de drempel < { "500" } m is NOT MET, zoals voorspeld (graad { "70" } is te glad), en de tienvoudige vermindering van de drift is MET (MODELLED). Een optionele <c6/> draait de benchmark opnieuw over geseede, Gauss-gecorreleerde kaartfouten en rapporteert de verdeling van de gematchte fout (meegeleverd scenario <c7/>). Verkennend en niet vooraf vastgelegd: met een kaartfout van { "2" } mGal, gecorreleerd over { "0.2" } graad (de grootte die de eigen sigma van de matcher begroot), blijft { "1" } van { "20" } realisaties binnen { "500" } m (mediaan { "2.9" } km, p95 { "14.7" } km), tegen { "144" } m met een perfecte kaart. De positiebepaling onder 500 m van de synthetische benchmark gaat ervan uit dat de kaart exact is. Zonder een van beide opties is het document byte-identiek aan eerdere releases. <c8/> accepteert een optionele <c9/> (<c10/>, <c11/>) die het magnetische kanaal uit een CSV in EMAG2v3-formaat leest. EMAG2 wordt niet meegeleverd omdat de voorwaarden niet expliciet zijn: <c12/> haalt het op met een vastgepinde SHA-256 en snijdt een vak uit. Op het echte EMAG2-raster wordt geen navigatieresultaat beweerd. Gezamenlijke kaartschatting (terrain SLAM, RM-18): <c13/> laat de sequentiële terreinnavigator vliegen over een opgeslagen kaart die van de referentie afwijkt, door haar te vertrouwen of door per cel een kaartcorrectie te schatten met een Rao-Blackwell-filter in FastSLAM-stijl. Vooraf vastgelegd tegen SITAN met bekende kaart bij een gecorreleerde kaartfout van { "15" } m over { "20" } seeds: een gemiddelde winst van { "1.5" } %, beter in { "10" } van { "20" }, dus beide verbeteringsdrempels zijn NOT MET ({ "10" } % en { "12" } van { "20" }), zonder schade bij een perfecte kaart (MET). Eén enkele passage zonder herbezoeken laat de kaart niet leren (<c14/>, MODELLED). Documenten van <c15/> zijn byte-identiek. De SRTM-tests met echte data draaien nu in CI op twee vastgelegde uitsneden op volledige resolutie; alle vooraf vastgelegde drempels zijn gehaald, waarbij het dichtstbijzijnde knooppunt gelijk is aan GDAL { "3.8.4" } in { "8" } van { "8" } punten (<c16/>).

seg-aa7ac7a47111 = <b>Interoperabiliteit, WP-08</b> ({ "0.36" }; elk onderdeel vooraf vastgelegd en afzonderlijk gecommit vóór zijn run met een onafhankelijke referentie, elk een nieuwe VALIDATED registerrij behalve het telemetrie-onderdeel, dat een bestaande rij verbreedt):

seg-a5d0b22337d7 = <b>CCSDS Orbit Data Messages</b> (<c1/>): OPM 3.0/2.0, OMM 3.0/2.0 en OCM { "3.0" } (blokken TRAJ, PHYS, COV, MAN, USER) geschreven en gelezen in KVN en NDM/XML, en een OMM met volledige precisie uit een SGP4-elementenset (<c2/>); de uitvoer van <c3/> is ongewijzigd. Tegen Orekit { "13.1.8" } in beide richtingen: { "27" } van { "30" } Kshana-berichten worden door Orekit geparseerd en Kshana leest elk door Orekit geschreven bericht, waarden binnen { "1e-14" } relatief en epochs binnen { "1e-9" } s; vier bevindingen vastgepind (Orekit vereist <c4/>, weigert <c5/> in door de gebruiker gedefinieerde XML-parameters, schrijft geen <c6/> zonder <c7/>, en leest relatieve OCM-epochs onder TDB in SI-seconden). De <c8/> van de oudere OMM-schrijver wordt door Orekit geweigerd (vastgelegd). Rij "CCSDS Orbit Data Messages (OPM, OMM, OCM)".

seg-39c70cb59f31 = <b>CCSDS Attitude Data Messages</b> (<c1/>, <c2/>): AEM 2.0/1.0 en APM { "2.0" } in KVN en XML tegen Orekit { "13.1.8" }, elke drempel gehaald; de APM-schrijver van Orekit weigert een manoeuvre zonder <c3/> (vastgepind). Rij "CCSDS Attitude Data Messages (AEM, APM)".

seg-bdfce382a98c = <b>SPICE SPK-export</b> (<c1/>): schrijver en lezer voor SPK-types { "9" } en { "13" } en OEM-naar-SPK-export; tegen CSPICE N0067 zijn de kernels byte-identiek aan die van SPICE en evalueren ze bit-identiek. Rij "SPICE SPK export (types { "9" } and { "13" })".

seg-ce217acb9fe7 = <b>SPICE SPK-types { "3" } en { "21" }</b> (<c1/>): segmenten van type { "3" } (Chebyshev) en type { "21" } (uitgebreide verschillijnen) geschreven uit gegeven records en geëvalueerd zoals SPICE dat doet; tegen CSPICE N0067 zijn de kernels byte-identiek aan die van SPICE en komt elke evaluatie in beide richtingen bit voor bit overeen. Rij "SPICE SPK types { "3" } and { "21" } (Chebyshev, extended difference lines)".

seg-72b8edbc74dc = <b>Uitbreidingen van Space Packet</b> (<c1/>): secundaire header met CUC/CDS-tijdcodes, packetfoutcontrole, segmentatie en streamcontroles, tegen ccsdspy { "2.0.1" }, spacepackets-rs { "0.18.0" }, spacepackets-py { "0.32.0" } en CPython <c2/>, nul afwijkingen. Rij "CCSDS Space Packet secondary header, packet error control and segmentation".

seg-c5fcf933b656 = <b>Telemetrieschema { "1.3" } via echte consumenten</b>: de Prometheus-exposition en OTLP/HTTP-JSON van een synthetische schema-1.3-stroom, inclusief de geometriereeks en het label <c1/>, exact gelezen door prometheus_client en de OTLP-proto, geaccepteerd door promtool { "3.5.0" } <c2/> zonder lintprobleem, en ongewijzigd doorgegeven door de OpenTelemetry Collector contrib { "0.135.0" } (aan data gebonden: hulpmiddelen opgehaald met vastgepinde SHA-256, uitvoer vastgelegd).

seg-013344665417 = <b>Baanbepaling van Mars, run { "2" }</b> ({ "0.36" }, WP-14, CAP-30): <c1/> schaalt de normaalmatrix met haar diagonaal en dempt de stap (Levenberg-Marquardt), nadat de geregistreerde Gauss-Newton-fit faalde op een matrix waarvan de ruwe diagonaal acht ordes van grootte beslaat. Afzonderlijk geregistreerd (<c2/>, dezelfde boog, drempels en bewerking). Op de gescoorde MRO-passages ligt de baan binnen { "0.36" } km RMS ({ "0.53" } km maximum) van de navigatiereconstructie van MRO, drempels gehaald. De post-fit-Doppler is { "48.6" } mHz tegen de drempel van { "30" } mHz, niet gehaald (bevinding vastgepind). Een amendement dat alleen de scoring betreft, R2-A1, is openbaar gemaakt in <c3/>. De rij blijft MODELLED.

seg-fee311480417 = <b>Gerampt 2-weg-Dopplermodel van Mars en baanbepaling</b> ({ "0.36" }, WP-14, CAP-30 deel, fase { "2" }): <c1/> voorspelt de gerampte X-band-2-weg-Doppler van DSN uit ODF-ramptabellen (lichttijd, Shapiro, troposfeer, stationstijd, DSN-stations via de CIO-keten en IERS EOP) en past een Marsorbiter aan (GMM-3, derde lichamen, SRP, drag). <c2/> leest SPK-type { "1" } (gecontroleerd tegen CSPICE) en <c3/> leest PDS SHADR-velden. Vooraf vastgelegd tegen de navigatiereconstructie van MRO op echte MRO-passages (aan data gebonden, <c4/>, maandelijkse CI): de voorspelde Doppler komt met de waarnemingen overeen tot { "12.5" } mHz (drempel { "30" } mHz, gehaald); de geregistreerde baanfit faalde op de gescoorde boog en leverde geen baan op (bevinding vastgepind). De rij blijft MODELLED.

seg-d8212aa309ef = <b>Lezer voor DSN Orbit Data File</b> ({ "0.36" }, WP-14, CAP-30 deel): <c1/> leest TRK-2-18-ODF's. Op een echte ODF van de Mars Reconnaissance Orbiter (NASA PDS, meegeleverd) komt de lezer overeen met het aantal records, de groepsposities, stations en tijden van het PDS-label, en zijn alle datatypen bekend. De tabel aan het einde van het bestand in het label is één rij korter dan het bestand, een inconsistentie van het label die als bevinding is vastgelegd. MODELLED. Baanbepaling op deze data is nog niet gedaan.

seg-bf26920a50bc = <b>TWSTFT-budget en stabiliteit van tijdoverdracht: de soort <c1/></b> ({ "0.36" }, WP-14, FUT-19).

seg-6038e0d04f89 = Tweewegvergelijking:

seg-c1fdd431db57 = <c1/> lost haar op voor T_A − T_B met apparatuurvertragingen van de stations, de Ku-band-ionosferische op/neer-asymmetrie, het verschil in transponder-vertraging en de Sagnac-termen, en herstelt het voorwaartse model tot { "1e-15" } s.

seg-a5468765380d = <b>Onzekerheidsbudget:</b> kwadratisch gecombineerd, met de link-TDEV als type-A-term.

seg-7f365f91bb3e = <b>Linkruis:</b> de tweewegreeks krijgt een flicker-faseruisvloer, een dagelijkse niet-reciprociteit en een constant reciprociteitsresidu. Het pakket <c1/> met witte jitter is ongewijzigd.

seg-8b40e74db08c = <b>Echte reeks:</b> de stabiliteit van aangeleverde reeksen uit BIPM Circular T, <c1/>-CSV of IGS-stationsklokken.

seg-267fd20d823c = MODELLED. Nieuw meegeleverd scenario <c1/>. De PPP-tijdoplossing is afzonderlijk VALIDATED tegen de IGS-stationsklok op de GNSS-tak met echte data.

seg-ae33b92da4a6 = <b>Intredeverhitting, EO-radiometrie en opstijgverliezen</b> ({ "0.36" }, WP-14, CAP-28): drie nieuwe soorten.

seg-34951878aa49 = <c1/>: een puntmassa-intrede met 3 vrijheidsgraden over een roterende Aarde of Mars met stuwpuntverhitting volgens Sutton-Graves.

seg-98fe7a4c464a = <c1/>: SNR van de imager, MTF bij Nyquist, relatieve randrespons en GIQE { "4" } NIIRS.

seg-173dfbe3cc3e = <c1/>: een opstijging met meerdere trappen en zwaartekrachtbocht, met verliezen door zwaartekracht, drag, sturing en tegendruk, gecontroleerd met de exacte identiteit ideale dv minus verliezen.

seg-0c9e7aacec80 = De piekvertraging van de intrede is gecontroleerd tegen de gepubliceerde nominale waarde van Stardust onder een vooraf vastgelegde drempel: { "35.44" } g tegen { "33.4" } g (+{ "6.1" } %, drempel { "10" } %). Die rij is VALIDATED. Verhitting, radiometrie en opstijging zijn MODELLED. Ook nieuw: <c1/>, meegeleverde scenario's <c2/>, <c3/> en <c4/>, en <c5/>.

seg-d4648c4e6655 = <b>Standregeling met reactiewielen: de soort <c1/></b> ({ "0.36" }, WP-14, CAP-21). Een inertiaal richtende slew van een star lichaam met drie of meer gebalanceerde reactiewielen onder MRP-terugkoppeling, met wieldraaimomenten van minimale norm, begrensd tot de limiet van elke motor (<c2/>). Het kan de lus ook sluiten op een multiplicatieve EKF vanuit een gesimuleerde gyro en sterrenzoeker (<c3/>). De lus met ware toestand is vergeleken met Basilisk { "2.9.1" } op drie gevallen die vastgelegd waren voordat de code bestond (drie orthogonale wielen, een vierwielige piramide, een verzadigend geval). Elke MRP-component, lichaamssnelheid, wielsnelheid en motordraaimoment kwam bij elke sample overeen, met als slechtste { "2.4e-14" } in sigma en { "2.9e-11" } rad/s in wielsnelheid. Deze rij is VALIDATED; de MEKF is MODELLED (NEES-consistentie). Nieuwe meegeleverde scenario's <c4/> en <c5/>, en <c6/>.

seg-8ce699586340 = <b>Planning van grondcontacten en DVB-S2 ACM</b> ({ "0.36" }, WP-14, CAP-22/23): twee nieuwe scenariosoorten. <c1/> geeft, voor één satelliet boven één station, de Es/N0 van elke passage en de DVB-S2-MODCOD die daarlangs wordt gekozen (drempels uit ETSI EN { "302" } 307-1 Table { "13" } plus een marge). Het geeft ook het datavolume dat ACM verplaatst ten opzichte van de basislijn met constante codering. <c2/> doet hetzelfde voor meerdere satellieten boven meerdere stations en bouwt een conflictvrij contactplan (antenne-omlooptijd, één station per satelliet, prioriteitsgewogen aflevering begrensd door elke backlog). Het rapporteert een greedy plan met marginale waarde, een basislijn op volgorde van binnenkomst en het exacte optimum op kleine verzamelingen, met de optimaliteitskloof van het greedy plan. Toegangsvensters komen van de VALIDATED voorspeller van schijnbare passages. Nieuwe meegeleverde scenario's <c3/> en <c4/> (illustratieve invoer) en <c5/>. MODELLED (twee nieuwe registerrijen).

seg-cd6dbcc3a78b = <b>Starlink-Doppler-positiebepaling tegen een gepubliceerd experiment</b> ({ "0.36" }, WP-14, CAP-11 deel, MODELLED). Dit is een vooraf vastgelegde proxyvergelijking van de Dopplermodus van <c1/> met de voorinstelling <c2/> tegen de percentielen van dataset 3 uit "Unveiling Starlink for PNT" (NAVIGATION { "72" }({ "1" }), { "2025" }, doi:10.33012/navi.685). Het model gebruikte { "3" } satellieten (een masker van { "47" } graad gekozen volgens een vaste regel), geen hoogtehulp en een Doppler-sigma van { "30" } Hz, over { "200" } seeds. De 3D-fout op het 90e percentiel is { "92.2" } m bij { "20" } s en { "870" } m bij { "8" } s, tegen de gepubliceerde { "2" } m en { "10" } m, dus beide drempels van factor twee zijn NOT MET. Het model is pessimistisch, niet optimistisch zoals voorspeld: drie vaste satellieten geven veel minder geometrische diversiteit dan de { "63" } satellieten van het experiment over { "10" } minuten met kanaalwisseling elke { "15" } s. Beide missers worden geassereerd (<c3/>).

seg-ffeb1b66cda5 = <b>Optimaliseerder voor impulsieve transfers op DE440</b> ({ "0.36" }, WP-14, CAP-20c/d): <c1/> vindt de vertrek- en aankomstdata van een ballistische transfer met twee impulsen en één omloop die de vertrek-C3 of de aankomst-V-infinity minimaliseren binnen Type I of Type II. Het zoekt op een raster van 2 dagen en verfijnt daarna met 2D-Nelder-Mead, op heliocentrische toestanden uit de DE440-kernel; het bouwt voort op <c2/>. De vergelijking is vooraf vastgelegd (bf0439e8) tegen een onafhankelijke optimaliseerder met SPICE + pykep { "3.0.1" } + SciPy { "1.18.1" } op de Aarde-naar-Mars-gelegenheid van { "2026" }: alle vier de optimalisaties komen overeen tot { "8.7e-13" } relatief, met data binnen { "1e-5" } dag (VALIDATED, nieuwe registerrij). Als secundaire gepubliceerde referentie komt NASA/TM-2010-216764 (het Aarde-naar-Mars-handboek 2026-2045) overeen voor de minimale C3 van Type II ({ "9.182" } tegen { "9.144" }) en de minimale aankomst-V-infinity van Type II ({ "2.564" } tegen { "2.565" }). De minimale C3 van Type I komt niet overeen: { "10.535" } tegen { "11.11" } (-5.18 %), waar de referentie uit de bibliotheek met Kshana overeenkomt. Die misser is vastgelegd en geassereerd.

seg-91fe2e2625a1 = <b>Studie naar een maanreferentiestation</b> ({ "0.36" }, aangezet door gepubliceerd materiaal over een geplande referentiestation aan de maanzuidpool; bronnen in <a1><c1/></a1>): de soort <c2/>, een Monte Carlo-sweep van het maan-differentieel-PNT-model over een gebruikersraster rond de zuidpool en een dag aan epochs, die per punt en over de regio het percentiel van de gecorrigeerde en ongecorrigeerde fout geeft, beschikbaarheid met redenen, dekking tegen een vermelde drempel, beschermingsniveaus, de dekkingsstraal per azimut en het budget van de correctielink. Het reduceert exact tot <c3/> bij één punt, één epoch en één trial; de rekenkunde is opnieuw berekend met numpy onder een vooraf vastgelegde drempel (posities en percentielen gehaald; de stationscorrecties misten de hunne door afronding in dubbele precisie, vastgelegd). MODELLED; registerrij "Lunar reference-station coverage and accuracy map". Niet verbonden aan of onderschreven door enig agentschap; geen uitspraak over de prestaties van enig echt systeem.

seg-3d0cd9692787 = <b>Vooraf vastgelegde voorspelling: dekking van een maanreferentiestation</b> (geen validatie; MODELLED). <a1><c1/></a1> bevriest, bij commit c05dac1d, de resultaten van <c2/> onder de openbaar vermelde aannemingen, met SHA-256-hashes van de invoer en de resultaten en een nu vastgelegd scoringsprotocol (factor { "2" } voor nauwkeurigheden en beschermingsniveaus, { "10" } procentpunten voor beschikbaarheid en dekking; een gewijzigde aanname krijgt een nieuwe gedateerde voorspelling, nooit een bewerking; een misser wordt even nadrukkelijk gepubliceerd als een treffer). Elk cijfer wordt gedomineerd door de niet-gepubliceerde elementenset van de constellatie van vier satellieten, die ILLUSTRATIVE is en dat ook zegt. <c3/> bewaakt haar; <c4/> krijgt een sectie "Pre-registered predictions". Geen registerrij.

seg-00ec7ccd4d0d = <b>Uitbreidingen voor het maanreferentiestation</b> ({ "0.36" }; beperkingen { "2" } en { "3" } van de stationsstudie en de oplossingsstijl van de bronnen), elk op aanvraag bij <c1/> en standaard afwezig, zodat elk bestaand document, de bevroren voorspelling inbegrepen, ongewijzigd is: <c2/> (multipath <c3/> bij de gebruiker en het station, dat van het station optioneel Gauss-Markov over epochs, DLL-coderuis uit C/N0, interkanaalbiases; waarden ILLUSTRATIVE op de Maan); <c4/> (lineaire groei van de fout in de uitgezonden baan over de latentie van de correctie, ILLUSTRATIVE); <c5/> (hoogtebeperking, een minimum van drie satellieten daarmee, een venster voor een stilstaande gebruiker over epochs). Twee addenda bij de vergelijking met gepubliceerde beweringen, elk vooraf vastgelegd en alleen vóór zijn run, staan naast de onbewerkte vastgelegde run: K5 met groei faalt bij elke snelheid; met de oplossingsstijl van de bronnen falen K1 tot K5 en slaagt K6 ({ "1" } van { "6" }), waarbij de gecorrigeerde p95 3D-fout van R300 daalt van { "280.6" } m naar { "2.11" } m. MODELLED; drie registerrijen.

seg-1d0a0dcd42de = <b>Maskers voor de maanterreinhorizon</b> ({ "0.36" }; de eerste beperking van de studie naar het maanreferentiestation): een optionele sectie <c1/> bij <c2/> (het station en elk gebruikerspunt) en <c3/> (elk rasterpunt) geeft elke locatie een van het azimut afhankelijke horizon in het skylinetabelformaat van { "0.36" }, uit een vermeld profiel met zijn bron (<c4/>, <c5/>) en/of een raymarch over een polaire DEM (<c6/>) langs grootcirkels van de maanbol met exacte kromming. Levert een uitsnede van { "0.98" } MB van de DEM van de zuidpool LRO LOLA <c7/> in het publieke domein mee, geresampled met blokgemiddelden van { "5" } x { "5" } naar { "1200" } m (<c8/>, met zijn NOTICE, SHA-256 en <c9/>), en het scenario <c10/> dat alleen in de repository staat. Gecontroleerd tegen horizonten in gesloten vorm (kale bol, krater in een plateau, gerasterde kegel); MODELLED, registerrij "Lunar terrain horizon masks from a stated profile or a polar DEM". Zonder de sectie is elk document, het eenhedenblok inbegrepen, byte-identiek.

seg-ca0c6ca7396a = <b>Geometriebewuste vertrouwensscore</b> (geometrieontwerpnotitie van { "0.36" }, sectie { "4" }). Elke epoch van <c1/>, statisch of vaartuig, batch of live, draagt zijn satellietgeometrie: <c2/>, <c3/> (redenen <c4/>, <c5/>, <c6/> en informatief <c7/>) of <c8/> waar de log geen satellietgeometrie geeft, met HDOP, PDOP, VDOP en de gebruikte satellieten. Ze wordt afgeleid uit de elevaties en azimuts die de ontvanger rapporteert (NMEA GSV, UBX NAV-SAT) via de bestaande kernel <c9/>, of overgenomen uit NMEA GSA. Elke epoch draagt ook een label, <c10/>, <c11/> of <c12/>, altijd gerapporteerd en nooit gescoord, en een notitie met de HDOP, PDOP, VDOP, het aantal satellieten en het signaalverlies in woorden. De score van een vaartuig krijgt een monitor <c13/> die niets aftrekt tenzij de geometrie slecht is (HDOP boven { "4" }, PDOP boven { "6" } of minder dan { "5" } gebruikte satellieten), en dan oploopt tot een plafond van { "15" } punten; geometrie alleen bereikt hooguit de band degraded, nooit die van de niet-vertrouwde ontvanger (geen alarm). Elke aftrek krijgt een klasse, <c14/>, <c15/> of <c16/>, zodat een slechte hemel niet als aanval wordt gelezen. <c17/> is <c18/> wanneer de verloren satellieten bij hun laatste rapport allemaal onder { "15" } graden stonden; een aftrek voor slechte geometrie is <c19/> wanneer de door de ontvanger opgegeven HDOP met meer dan max({ "1.0" }, { "25" } % van de afgeleide HDOP) afwijkt van zijn opgegeven hemel, zodat een vervalste slechte hemel het label niet kan kopen. Een nieuwe tabel <c20/> geeft elke drempel met zijn herkomst (HDOP { "4" }, PDOP { "6" }, ten minste { "5" } gebruikt, sigma_UERE { "1.5" } m, een HDOP-tolerantie van max({ "1.0" }, { "25" } % van de afgeleide HDOP) met de { "25" } % als representatieve keuze voor ontvangers met klokken per constellatie of subsetoplossingen, { "15" } graden; de cijfers van IEC 61108-1 en GPS SPS zoals geciteerd, te controleren tegen de tekst van de normen). Totaal signaalverlies wordt niet als hemel gelabeld: wanneer satellieten in zicht niet worden getrackt en de DOP van de satellieten in zicht goed is (en de niet-getrackte niet tot één helft van de horizon beperkt zijn), draagt de epoch <c21/> en is de geometrieaftrek <c22/>. Een opgegeven HDOP of PDOP van { "99" } of meer, GGA-kwaliteit { "0" } en GSA-modus { "1" } worden gelezen als geen positiebepaling, niet als DOP. Het plafond (<c23/> { "15" }), het einde van de helling (<c24/> { "1.5" }) en de ondergrens (<c25/>, standaard de <c26/> van de score) staan in <c27/>, net als de goede niveaus van het label (HDOP { "2" }, PDOP { "3" }, { "6" } satellieten, representatief); het geldende plafond is <c28/>, zodat een tabel <c29/> die <c30/> verhoogt (ook een van { "0.35" }) het plafond verlaagt in plaats van te worden geweigerd, en een ondergrens onder <c31/> wordt geweigerd. MODELLED; adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }): de gezagvoerder of exploitant blijft verantwoordelijk voor de navigatie van het vaartuig.

seg-d976d3495695 = De geometrie bereikt elk oppervlak: de resultaat-JSON (<c1/>, <c2/> bij elke aftrek, <c3/>, <c4/>), de live JSON-regels (schema { "1.3" }), de Python- en WebAssembly-functies <c5/>, <c6/> en <c7/>, de MCP-tools <c8/>, bewijspakketten (<c9/>, <c10/>, een geometriebaan op de samenvattingspagina) en <c11/> (Prometheus <c12/> en een label <c13/> op <c14/>, OTLP <c15/>, CEF-aangepaste velden <c16/> (geometriestatus en klassen), <c17/> (HDOP) en <c18/> (PDOP), gecontroleerd tegen beide CEF-referentieparsers, en LEEF <c19/>, <c20/>, <c21/>). Het geometrielabel wordt ook geëxporteerd, achter elke eerdere reeks en elk eerder veld toegevoegd en alleen voor invoer die het draagt: Prometheus <c22/> en <c23/>, OTLP <c24/> en <c25/>, LEEF <c26/>, <c27/>, <c28/>, <c29/>, en bij CEF een derde veld <c30/> (het label) en <c31/> (gebruikte satellieten); de VDOP staat niet in CEF (de aangepaste velden met drijvende komma zijn bezet). Beide CEF-referentieparsers lezen de labelgevallen terug zoals geschreven (amendement { "5" }: { "176" } regels, { "172" } geparseerd door pycef, { "176" } door Logstash). Een opgegeven HDOP die de opgegeven hemel niet verklaart wordt bij elke epoch gemarkeerd en geteld (<c32/>, een regel op de samenvattingspagina van het bewijs), en alleen gescoord wanneer de geometrie slecht is. Signaalverlies wordt apart geëxporteerd, omdat de geometriestatus <c33/> blijft zolang het duurt: Prometheus <c34/>, OTLP <c35/>, LEEF <c36/>; in CEF verschijnt het als de klasse <c37/> in <c38/>.

seg-5030e5214ed0 = <c1/>: de covariantiefactor <c2/> achter <c3/>, eruit afgesplitst met dezelfde rekenkunde.

seg-c6cc061a3ed6 = Registerrij "Position error from geometry: RMS error = sigma_UERE x DOP" (<b>MODELLED</b>, interne consistentie): een geseede Monte Carlo van de kleinstekwadratenpositiebepaling van de engine op de { "8" } met gnss_lib_py overeenkomende DOP-geometrieën tegen de covariantiefactor van de kernel voor DOP die aan een onafhankelijke referentie is getoetst, met tolerantiegrenzen die vóór de eerste run zijn vastgelegd en twee negatieve controles die zoals vereist falen; daarnaast een eerdere controle op vier met de hand gekozen hemels met chikwadraatbetrouwbaarheidsintervallen, gerapporteerd als uitgevoerd vóór de preregistratie.

seg-b87b6eafd465 = <b>Van het azimut afhankelijke skylinemaskers</b> (<c1/>, <a1><c2/></a1>, onderdeel { "1" } van de ontwerpnotitie): een elevatiegrens die van het azimut afhangt, het puntsgewijze maximum van tabellen (elk afzonderlijk geïnterpoleerd, omgeslagen bij { "360" }°), een straatcanyon in gesloten vorm (met optionele open uiteinden), scherprandige sectoren en een terreinprofiel met de kromming van de Aarde; de effectieve grens is <c3/>. Vier REPRESENTATIVE voorinstellingen met vermelde herkomst (<c4/>, <c5/>, <c6/>, <c7/>), veld voor veld te overschrijven. Een optionele sectie <c8/> in <c9/>, <c10/>, <c11/> (elke modus, de polaire sweep inbegrepen), <c12/>- en <c13/>-trainingsbestanden, en in <c14/> en <c15/> via een nieuwe gebruiker op een grondlocatie, <c16/> (geodetische kijkhoeken op de roterende Aarde, met de geodetische omhoogrichting voor de horizontale en verticale splitsing van ARAIM; elke sample is één absoluut ogenblik, <c17/>, waartoe elementensets, uitgezonden efemeriden en SP3-bestanden vanaf hun eigen epochs worden doorgevoerd, gedateerd vanaf de nieuwste satellietepoch wanneer geen <c18/> is opgegeven; een in een baan draaiende <c19/> weigert een skyline). Resultaten krijgen <c20/> en per sample <c21/>. Zonder de sectie is elk scenario byte-identiek aan { "0.35.0" }, gecontroleerd tegen digests van de releasecommit. Zes meegeleverde voorbeelden: <c22/>, <c23/>, <c24/>, <c25/>, <c26/> en de campagne <c27/> (de canyon voor het autonome voertuig als vlakke grens en als straat; de bestaande campagne is ongewijzigd). MODELLED.

seg-95cdecf341d6 = <b>Functies voor hemelgeometrie</b> (<c1/>, onderdeel { "2" } van de ontwerpnotitie): <c2/> (zichtbare en gemaskeerde satellieten vanaf een locatie, een tijdstip en constellatievoorinstellingen, two-line element sets (<c3/>, hoogstens { "4" } MiB, door de SGP4 van de engine gepropageerd naar een UTC-<c4/>) of gegeven satellieten; <c5/> en <c6/> zeggen of de hemel representatief is of de hemel die de elementensets op die epoch geven, geen meting; <c7/> noemt elke ongebruikte regel met zijn reden; invoerlimieten van { "2000" } satellieten boven de horizon, gecontroleerd voordat een systeemtabel wordt gebouwd, en { "16" } ontvangerklokken; de vijf DOP's; de ENU-cofactor en -covariantie met één klok per systeem of één gemeenschappelijke; de horizontale foutellips op één sigma en op een opgegeven betrouwbaarheid), <c8/> (geseede kleinstekwadratenfouten, hoogstens { "5000" }), <c9/>, <c10/> en <c11/>. <c12/> maakt de covariantie achter <c13/> toegankelijk, dat nu haar reductie is (de scalars die aan een onafhankelijke referentie zijn getoetst blijven ongewijzigd). Oppervlakken: <c14/> en <c15/>, Python- en WASM-functies met dezelfde namen, en de MCP-tool <c16/> ({ "40" } tools), en het notebook <c17/> (met zijn spiegel <c18/>; uitgevoerd door <c19/>). Elk resultaat draagt het label MODELLED, de verklaring over het foutmodel en het advies.

seg-9414d387cf79 = Register: vijf rijen voor skyline en hemelgeometrie. <b>VALIDATED</b>, elk in een vergelijking die is vastgelegd voordat de onafhankelijke referentie draaide: <em>Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask</em> tegen Orekit { "12.2" } (<c1/>, <c2/>) en gnss_lib_py { "1.0.4" } (<c3/>), grootste verschillen in kijkhoek en masker { "1.1e-12" }° tegen { "1e-9" }°, identieke zichtbare verzamelingen, DOP { "3.3e-13" } relatief (<c4/>); <em>Horizontal error ellipse and per-system cofactor from the geometry covariance</em> tegen numpy <c5/> en <c6/> (standaard P2), { "270" } gevallen, assen { "5.1e-13" } relatief (<c7/>). <b>MODELLED</b>: de reducties voor canyon, sector en terrein; de voorinstellingen; de samenstelling van de hemelgeometrie (voorinstellingshemel, Monte Carlo-wolk).

seg-8f5ebce999fe = Met de rijen voor geometrievertrouwen, skyline en het maanreferentiestation heeft het register { "274" } rijen: { "134" } aan een onafhankelijke referentie getoetst, { "136" } uit een model berekend, { "4" } van de partner.

seg-686b1211d7bb = <b>Maanreferentiestation: tijdlaboratorium van het station</b> (<b>MODELLED</b>). Een optioneel blok <c1/> bij <c2/> (<c3/>). Het modelleert een stationsklok (standaard de miniRAFS-klasse, elke genoemde klasse, of een apparaatkaart die is gefit op opgegeven stabiliteitspunten) die op LTC is gestuurd en daarna vrij loopt of elke N seconden opnieuw wordt bijgestuurd. Het geeft de tijdfoutcurve x(t), de tijd tot { "1" }, { "10" } en { "100" } ns (bisectie naast de gesloten vorm) en de dominante term per horizon, alles met eenheden. Het stuurresidu is ILLUSTRATIVE. De LTC-snelheid wordt niet opnieuw afgeleid en houdt haar eigen VALIDATED rij. Het doel op nanosecondeniveau uit het openbare Lunar PNT-materiaal van ICG WG-B (juni { "2024" }) wordt aangehaald als bronverklaring, niet als bewering. De klokvolgorde optisch < PHM < RAFS < miniRAFS geldt van { "1" } s tot { "7e5" } s, en de test pint het kruispunt van de curven van PHM en RAFS vast bij { "7.5e5" } s. Dat kruispunt is een eigenschap van de klokmodellen met één ruistype (zuivere flicker-FM tegen zuivere witte FM), geen fysisch resultaat. Zonder het blok zijn het rapport, zijn tabel en zijn samenvatting ongewijzigd. Voorbeeld: <c4/>. Voegt één registerrij toe, gelabeld MODELLED.

seg-863c2c7a5f0b = <b>Maanreferentiestation: geodesie van het station</b> (<b>MODELLED</b>). Optionele invoer <c1/> en <c2/> bij <c3/> voegt een blok <c4/> toe. De datuminformatie met vijf arrays uit de gearchiveerde laserafstandsmeting wordt gecombineerd met wat een toegevoegde retroreflector en een toegevoegde VLBI-baken op opgegeven locaties zouden bijdragen. De reflector wordt gemeten op de gearchiveerde epochs die hij kan zien, met hun gearchiveerde gewichten. Het baken gebruikt het netwerk en de planning van <c5/>, met vaste stations. Het blok geeft elke Helmert-1-sigma ervoor en erna, en hun verhouding. Dit zijn Cramér-Rao-grenzen voor een gereduceerde parameterset, op een ILLUSTRATIVE planning en locatie. Afwezige of lege invoer laat het rapport byte-identiek. Voorbeelden: <c6/> en <c7/>. Voegt één registerrij toe, gelabeld MODELLED.

seg-45c6febcc7fc = <b>Maanreferentiestation: vergelijking met gepubliceerde beweringen</b> (<b>MODELLED</b>). Elke numerieke bewering in vijf openbare bronnen is opgesomd met haar exacte formulering, pagina en vermelde aannames, en ingedeeld als vergelijkbaar, gedeeltelijk vergelijkbaar of niet vergelijkbaar (<c1/>; bronnen met URL, ophaaldatum, SHA-256 en licentie in <c2/>). De gedeeltelijk vergelijkbare beweringen zijn gescoord onder zes eenzijdige drempels die vóór de run zijn vastgelegd (<c3/>, revisie { "2" }, 05bf9a19): { "1" } van { "6" } beweringen binnen de vooraf vastgelegde drempel (vooraf vastgelegd 05bf9a19). De dekking is { "0.00" } tegen >= { "0.95" } op beide zuidpoolcirkels, en de gecorrigeerde p95 is { "280.6" } m tegen <= { "1.5" } m. De oorzaak zijn de baanelementen van de satellieten, die geen enkele bron publiceert: op de ILLUSTRATIVE elementen in de boom zijn vier satellieten in { "8" } % van de epochs in gezamenlijk zicht, bij bijna-singuliere geometrie. De run reproduceert de beweringen op die elementen niet en is geen bewijs dat de beweringen onjuist zijn. Vastgepind in <c4/>. Eén registerrij, gelabeld MODELLED met de bevinding.

seg-2b01d2ccb666 = <b>Maanreferentiestation: gereedheid van klokbestandsdata</b>. <c1/> vermeldt nu het tijdsysteem van zijn epochs. Dat is de waarde van <c2/>, of, wanneer die niet is opgegeven, de standaardwaarde van het satellietsysteem van de header. Het resultaat zegt ook of het systeem is opgegeven. De functie weigert een onbekend tijdsysteem (bijvoorbeeld een maantijdschaal), een bestand met gemengde systemen zonder opgave, en bestanden die elkaar tegenspreken, in plaats van ze als GPS-tijd te lezen. Ze levert een synthetische fixture van een stationsklok mee. Er is geen formaat voor een correctiebestand gedefinieerd, omdat er geen openbaar formaat bestaat.

seg-0fb89eb36003 = Gewijzigd

seg-b63c95f12bc4 = De moduledocs van <c1/>, <c2/> en <c3/> noemen de UKF-navigator met 17 toestanden, de strakke koppeling met volledige INS en de expliciete klokstoestand niet langer toekomstig werk; ze verwijzen naar <c4/>, <c5/> en <c6/>.

seg-aedd06cf6127 = <b>RINEX { "4" } wordt niet langer geweigerd</b> ({ "0.36" }, WP-07): een RINEX-{ "4" }-navigatiebestand werd vroeger bewust afgewezen; het wordt nu gelezen (zie Toegevoegd). Bij observatiebestanden van versie { "4" } en later worden headerlabels alleen in kolommen 61-80 vergeleken, zodat de nieuwe vrije-tekstrecords niet voor labels kunnen doorgaan.

seg-5829841b58d7 = <b><c1/> leest echte IONEX-bestanden</b> ({ "0.36" }, WP-07): een volledig record van 16 waarden vult kolommen 61-80, die de lezer voor een label hield, zodat hij bij elk echt IONEX-bestand <c2/> teruggaf. Hij leest nu een record waarvan het labelveld numeriek is als waarden. Geen meegeleverde uitvoer gebruikte het.

seg-a66bd6592b93 = <b>Ontvangen vermogens van Galileo E1 en E5a volgens OS SIS ICD Issue { "2.1" }</b> (revisie, 2026-10-14). De spectrumbanden <c1/> en <c2/>, en de GNSS-slachtoffers met LEO-signaal die hun vermogen daarvan nemen, gebruiken nu de minimale ontvangen vermogens uit Table { "12" } van de Galileo OS SIS ICD Issue { "2.1" }: −{ "157.25" } dBW (was −{ "157.0" }) en −{ "155.25" } dBW (was −{ "155.0" }).

seg-b0386f62923f = Negen scenarioresultaten verschuiven: de spectrumvoorbeelden, de spectrumcampagne, drie LEO-veerkrachtverticals en drie LEO-signaalontwerpen. De effectieve C/N0 verschuift −{ "0.25" } dB en J/S +{ "0.25" } dB op deze banden.

seg-2af90bfcefae = Elke verschoven waarde ({ "1766" }, oud → nieuw) staat in <c1/> en de bijbehorende CSV, met de doctabellen die zijn verschoven. Geen registerrij verandert van status.

seg-d468174b2d4c = Tweede deel, dezelfde dag: de LEO-signaalslachtoffers <c1/> (−{ "155.0" } → −{ "155.25" } dBW, Table { "12" } E5b) en <c2/> (−{ "152.0" } → −{ "152.24" } dBW). De ICD heeft geen rij voor de volledige E5-band, dus de AltBOC-waarde is de vermogenssom van de totalen van E5a en E5b uit Table { "12" }, opgebouwd zoals de oude waarde was. Drie resultaten van LEO-signaalontwerpen verschuiven ({ "64" } waarden: deze ontvangen vermogens en de C/N0-degradatie van LEO naar GNSS bij de twee slachtoffers), opgesomd in dezelfde revisie (§{ "5" }) en CSV. Niets anders verschuift.

seg-a96992246ef8 = <b>Correctie van het atmosferische S2-getij</b> (<c1/>). De S2-luchtdrukharmonischen van Ray ({ "2001" }) zijn coëfficiënten van ongenormaliseerde <c2/> met cosinusfasevertragingen; ze werden gebruikt als volledig genormaliseerd en met de vertraging als de sinusvoorsprong van IERS. Ze gaan nu gedeeld door <c3/> met <c4/> erin; de nieuwe <c5/> reproduceert model A2 van GFZ STR06/01 Table { "5" } voor alle { "21" } golven (slechtst { "0.0005" } cm, { "0.05" }°; VALIDATED). Alleen uitvoer met getijden aan verschuift: de Galileo-CI-fit { "0.132" } → { "0.133" } m, Swarm-A-componenten met { "1" }–{ "2" } mm (vooraf vastgelegd in <c6/>).

seg-6fa076226c01 = Alleen docs: <c1/>, <c2/> en <c3/> zijn gedocumenteerd als legacy-oplossers, numeriek ongewijzigd, met een verwijzing naar <c4/>.

seg-a757fd7ca793 = <b>Status van D9 ronde { "3" } (<c1/>).</b> BIPM Circular T { "465" } verscheen op 2026-10-12. De vooraf vastgelegde prospectieve score is nog niet gedraaid: uitgave { "465" } bevat ongeveer { "285" } testwaarden, en de stopregel vereist er { "1000" }, dus ongeveer de uitgaven { "465" }–{ "468" }. De run heeft ook de gearchiveerde bestanden per laboratorium van 2026-09-30 nodig, omdat BIPM er inmiddels { "87" } van de { "113" } heeft herschreven. De registerrij en de testheader zeggen dat; de test, zijn drempels en zijn splitsing zijn ongewijzigd.

seg-e064546d05ec = <b>Docs-waarheidsronde ({ "0.36" }).</b> Roadmap, mogelijkhedenrijen, statusregels van ontwerpdocs en modulecommentaar in lijn gebracht met de code; geen uitvoer verandert. Onderdelen die al gebouwd zijn maar nog als open stonden, zijn nu als gedaan gemarkeerd: de ITU-T-maskercontroles, het holdover-scenario van { "24" } uur en de inname van klok-logs (telecom-tijdsynchronisatie), de quickstarts voor de eerste minuut, Lense–Thirring en de kruiscontrole van de Orekit-propagator, de precieze ITRF-GCRS-keten, golden- en platformoverschrijdende hashes, herkomst, ARAIM met meerdere fouten (ADD v4.2), FDE met één satelliet, de CRPA-bibliotheek, de grens voor CAI-franje-ambiguïteit, de dimensionering van streets-of-coverage en de 3D-baanweergave, de dynamica van de stand van een star lichaam, de OMM-schrijver en NAIF-kernellezer, de maanlibratie van DE440, de zin over de betekenis van de run in de playground, <c1/>, de strak gekoppelde navigator met 17 toestanden en de soort gravity-map. De rijen vermelden ook precies wat nog open is (bijvoorbeeld JD in twee delen in <c2/>, de lezer <c3/> tegen een echt product en uitsluiting van meerdere satellieten in <c4/>). Het ontbrekende <c5/> is geschreven uit een verse run van zijn tests (M1–M4 slagen), en het IQ-validatieconcept voor partners heeft actuele registertellingen.

seg-e2290a640df7 = De geheugencodes van Galileo E1 worden niet langer meegeleverd.

seg-80f8ca869682 = <c1/> en <c2/> (ICD Annex C.7/C.8) zijn uit de repository en de pakketten verwijderd. De voorwaarden van de ICD (geciteerd in <c3/>) staan een gebruiker toe de codes op te slaan met bronvermelding en in een product te gebruiken, maar staan herdistributie alleen toe voor niet-commerciële doeleinden, en Kshana wordt ook onder een commerciële licentie aangeboden. <c4/> / <c5/> geven nu een <c6/> terug en lezen het eigen exemplaar van de gebruiker uit <c7/> / <c8/>, of, in een source checkout, uit <c9/>, waar het nieuwe <c10/> ze uit de ICD-PDF haalt (met hashcontrole). <c11/> / <c12/> zijn verwijderd. Zonder de tabellen geven de Galileo E1-signalen (<c13/>, <c14/>) een fout terug die uitlegt hoe ze moeten worden aangeleverd, en slaan de E1-tests zichzelf over met een melding. Met de tabellen aanwezig is elke E1-uitvoer ongewijzigd. Geen enkel scenario, golden of spectrumuitvoer gebruikt de codetabellen. De testfixtures van E5a Annex C.3/C.4 (de LFSR-referentie in <c15/>) worden op dezelfde manier behandeld: opgehaald met hetzelfde script, door git genegeerd, en de test slaat zichzelf over zonder ze.

seg-654d0358137b = <b>Draagbare wiskunde overal</b> ({ "0.36" }, STUDIO-15): elke transcendente <c1/>-functie in de bibliotheek, en de normale, gamma- en exponentiële samplers van <c2/>, rekenen nu via de pure-Rust-bibliotheek <c3/> (<c4/>, <c5/>), zodat een native build en de WebAssembly-build byte-identieke resultaat-JSON geven voor alle { "141" } meegeleverde scenario's en voor de korte IQ-run. De prijs is dat de laatste bits van resultaten die met de wiskundebibliotheek van de host werden berekend zijn verschoven: { "98" } van de { "141" } meegeleverde scenario's zijn veranderd, { "43" } niet; { "5" } veranderden met meer dan { "1e-3" } in hun grootste veld, en de rest met minder. Elke verschoven waarde staat oud -> nieuw in <a1><c6/></a1> (met een CSV van alle { "136,127" } verschoven getallen); geen drempel, tolerantie of grenswaarde is veranderd. Gepubliceerde getallen die zijn veranderd: beschikbaarheid van <c7/> met het bereik van de Aarde { "0.719" } -> { "0.713" } en RMS-fout { "86.147" } -> { "86.499" } m (één epoch op de rand van de beschikbaarheid wordt nu overal op dezelfde manier beslist; hij gaf { "0.725" } / { "85.800" } m op macOS arm64); stationsfout van <c8/> { "3.541350" } -> { "3.536885" } m met VLBI en { "2183.558" } -> { "2184.021" } m zonder; <c9/>, acht waarden van <c10/> met { "3" } eenheden in de laatste plaats (erratum in het technisch rapport); het vrijgegeven document <c11/> in grootheden op de afrondingsvloer (acht waarden voorbij zes significante cijfers, tot { "6.8e-5" } relatief; geen rang of drempel verschoof). De vastgepinde hashes van de byte-identiteitsbewakers (<c12/>, <c13/>, <c14/>) zijn opnieuw gebaseerd op een benoemde basislijn "{ "0.36" } portable", waarbij de waarden van { "0.35.0" } als historisch record worden bewaard; de bevroren voorspelling voor het maanreferentiestation is onaangeroerd en haar draagbare herrun is ernaast opgeslagen (<c15/>). <c16/> (de rij voor gezamenlijke maan-OD die aan een onafhankelijke referentie is getoetst): fixtures opnieuw geëxporteerd en de numpy-vergelijking opnieuw gedraaid met numpy { "2.4.6" }, de geregistreerde versie, waarbij script en drempel ongewijzigd zijn; alle zes netwerken slagen (<a2><c17/></a2>). Het werk van batch 2-3 dat na STUDIO-15 is samengevoegd, gebruikt ook draagbare wiskunde ({ "457" } aanroeppunten in { "62" } bestanden); wat dat heeft verschoven staat in <a3><c18/></a3>: { "12" } meegeleverde scenario's (grootste relatieve verandering { "5.2e-8" }, geen afgedrukt cijfer verschuift), { "28" } bewakingsrijen voor skylines opnieuw goedgekeurd, de M2M4-digest van <c19/>, de legacy truth-hashes van <c20/>, de datumsigma van het niet-waargenomen baken ({ "632.3769" } -> { "632.3772" } m), en twee vastgelegde bevindingen (DRO-sluitingen van CR3BP; CRPA A3, { "194" } van { "456" } links). De exacte edf van Greenhall behoudt zijn drempel waarop aan een onafhankelijke referentie is getoetst met een double-double-logaritme in zijn kernel (<a4><c21/></a4>), en de gps-sdr-sim-test-bench-referentie is opnieuw gedraaid op de verschoven NMEA-exports, waarbij elke drempel standhoudt (<a5><c22/></a5>).

seg-a21df3f8e0a6 = README: de rij voor de maansuite vermeldt het bewijsniveau van elk onderdeel (er stond dat alle MODELLED waren).

seg-ffb14764a7a9 = <c1/> geeft <c2/> terug (reeks, griddinglog, tijdsysteem, of het is opgegeven, recordtype) in plaats van een tuple <c3/>. Het valt nu terug van satellietrecords (<c4/>) op ontvanger-/stationsrecords (<c5/>) met de gevraagde naam.

seg-6777ca96624a = Geen score verandert tenzij de geometrie slecht is; het label wordt altijd gerapporteerd. Bij goede of redelijke geometrie (een GPS-only open hemel van { "8" } satellieten inbegrepen) of onbekende geometrie (de monitor draait niet) is elke score als in { "0.35" }: <c1/> houdt de uitvoer van beide voorbeeldsessies en <c2/> elk vastgelegd NMEA-corpus van vaartuigen (ook als GPS-only open hemel) en de bemanningstrainingsscenario's vast op de bytes van { "0.35.0" } zodra de toegevoegde sleutels zijn verwijderd; in de twee trainingsscenario's waarvan de jamming de geometrie slecht maakt, verschillen de slechte epochs alleen door de geometrieaftrek. Een log met slechte geometrie verliest tot { "15" } punten die hij in { "0.35" } niet verloor. Verder zijn de bedoelde wijzigingen allemaal toevoegingen: de bovenstaande sleutels in de resultaat-JSON en de bewijspakketten (<c3/> is ongewijzigd); het schema van de live JSON-regels gaat van { "1.2" } naar { "1.3" } (<c4/> toegevoegd, <c5/> in elke aftrek); de samenvatting van het uittreksel krijgt <c6/>; telemetrie krijgt geometriereeksen, velden en het label <c7/> alleen voor invoer die ze draagt, zodat een stroom of resultaat van { "0.35" } byte voor byte als voorheen wordt weergegeven. <c8/> is de 17e monitornaam; hij staat als laatste in <c9/> wanneer hij heeft beslist (een vaartuig waarvan de log de geometrie geeft; een lijst van { "0.35" } behoudt haar volgorde en het aantal monitoren in de samenvatting gaat met één omhoog) en heeft geen vermelding in <c10/> (er een instellen wordt geweigerd: zijn aftrek wordt ingesteld in <c11/>).

seg-45b44c851937 = <c1/> noemde de licentie van gnss_lib_py Apache-2.0; de release { "1.0.4" } is MIT.

seg-a1a670a9c63e = De NMEA-lezer leest nu GSA (een korte GSA wordt genegeerd, niet als overgeslagen geteld) en bewaart GSV-elevaties en -azimuts, ook voor satellieten die zonder signaal worden vermeld; de UBX-lezer bewaart de elevatie en het azimut van NAV-SAT. C/N0 wordt precies zo gelezen als voorheen.

seg-0bafbea5c75d = <b>Resultaatwijziging: breedband- en gesweepte jammers gebruiken nu Q = { "2" }.</b> De anti-jamvergelijking gebruikt voor deze jammers de leerboekcorrectie Q voor spreidspectrum, waar zij { "1" } gebruikte. Q = { "2" } is witte ruis over de hoofdlob met genormaliseerd signaalvermogen in de band; het is in de tests vastgepind op de gesloten vorm uit <c1/>.

seg-21f31ec302de = <b>Ongewijzigd:</b> CW- en smalbandige jammers (Q = { "1" }), een niet-herkend jammertype (Q = { "1" }, de meest schadelijke waarde) en <c1/>.

seg-f362499d2ed0 = <b>Effect:</b> waar een breedband- of gesweepte jammer werkt, stijgt de effectieve C/N0 met maximaal { "3.0103" } dB, stijgen afgeleide J/S-drempels met { "3.0103" } dB, en krimpen de vrije-ruimte-weigeringsstralen met { "0.7071" }.

seg-088dcd34cc88 = <b>Gewijzigde meegeleverde scenario's:</b> { "12" } van { "144" } veranderen, allemaal zoals vooraf vastgelegd (<c1/>, resultaten in <c2/>):

seg-7b043b400ec8 = <c1/>: C/N0 +{ "3.01" } dB;

seg-afb42538cfde = <c1/>: verloren satellieten { "26" } → { "0" }, mediane standoff voor loss-of-lock { "27.4" } → { "19.4" } km;

seg-8c2691f38d28 = <c1/>: weigeringsstraal voor lusdynamica { "75.2" } → { "53.2" } km;

seg-096a24491872 = en de campagnes en spectrumkruiscontroles die deze bevatten.

seg-ecdf60335064 = <b>Getroffen consumenten:</b> de soorten <c1/>, <c2/>, <c3/> en <c4/>, de <c5/> van de spectrumsoorten, de MODELLED referentiecurve van de IQ-campagne en de standaard-Q van labfit, en de export van interop-scènes.

seg-89672d99e9e2 = JetBrains-plug-in: geen verouderde of voor verwijdering geplande platform-API. De vijf keuzedialogen gebruiken een kleine <c1/> met een keuzelijst in plaats van de verouderde <c2/>; kiezers voor één bestand gebruiken de constructor <c3/> in plaats van de verouderde <c4/>; de animatie opent met <c5/> in plaats van <c6/>, dat het platform { "2026.3" } voor verwijdering plant. Since-build blijft { "243" }. De IntelliJ Plugin Verifier meldt Compatible zonder gebruik van verouderde of voor verwijdering geplande onderdelen tegen { "2024.3" } (IC-243.21565.193), { "2025.2" } (IC-252.23892.409), { "2026.2.3" } (IU-262.10968.63) en { "2026.3" } EAP (IU-263.6259.32); <c7/> controleert standaard { "2024.3" } en elke lijst die in <c8/> wordt gegeven.

seg-58ee61cbd633 = <c1/> en <c2/> geven <c3/> terug: een ongeldige sectie <c4/> is een fout bij rechtstreekse aanroep, zoals zij al was via <c5/>, in plaats van een stille terugval op het vlakke masker. <b>Brekende wijziging</b> voor Rust-aanroepers van deze twee functies.

seg-9b4113258e1e = <b>Campagnescorer: een echte false lock van de tracker werd nooit geteld</b> (<c1/>). De false-lock-controle van de tracker verplaatst een kanaal van LOCKED naar LOST op het moment dat zij afgaat. De scorer markeerde in plaats daarvan de volgende update van het kanaal, die dan ontgrendeld was en dus nooit werd geteld. Een gebeurtenis <c2/> die vanuit LOCKED wordt gemeld, is nu één episode op haar tijdstip, in de run en in elke vermelde gebeurtenis die haar bevat. Een die tijdens de pull-in wordt gevonden, of die wordt herhaald door een kanaal dat al LOST is, is geen nieuwe episode. Een nieuwe test drijft een echte false lock aan: een legitieme GPS L1 C/A-draaggolf die tijdens de lock met 1/(2T) stapt (<c3/>).

seg-ac508954b6a6 = In de referentiecampagne van <c1/> verandert alleen PRN { "11" } van ramp/agc-3bit (false-lock-episodes { "0" } → { "1" }, { "426" } en { "437" } per vergrendeld uur).

seg-cfc47d9d9237 = De cel-DIGESTs zijn opnieuw vastgepind.

seg-fcfa0de18b05 = De vooraf vastgelegde pin voor gescoorde resultaten blijft actief en reproduceert nog steeds exact: in zijn hash worden alleen die zes velden, veranderd door deze fix die na de registratie is gemaakt, teruggezet naar hun waarden van vóór de fix. De gecorrigeerde waarden zijn afzonderlijk vastgepind.

seg-b96d34bb1d36 = Er is geen drempel gewijzigd, en geen VALIDATED rij, cijfer of webgetal is verschoven.

seg-ccbe11bd50b6 = <b>lunar-frame-campaign: een baken zonder waarneming wordt nu gerapporteerd</b> (gevonden door MR-05). Het rapport krijgt <c1/> en <c2/> alleen wanneer een baken geen waarneming heeft, en dan komen de sigma's van de waargenomen bakens uit hun eigen informatie in plaats van allemaal null te zijn. Het datum is ongewijzigd, en geen standaard, meegeleverde of gepubliceerde uitvoer verschuift (<c3/>).

seg-c223c1fc1323 = <b>Hoofdassenstelsel van de Maan</b> (<c1/>, gebruikt door <c2/> en de LRO-fit): de offset van het gemiddelde-Aarde- naar het hoofdassenstelsel van DE421 uit <c3/> werd in de verkeerde richting en met de verkeerde Eulervolgorde toegepast, zodat het analytische PA-stelsel ongeveer { "208" }″ van PA af stond in plaats van erop. Het is nu getranscribeerd zoals Frames Required Reading van SPICE het definieert en komt tot { "2.6e-16" } rad overeen met SPICE <c4/>; het analytische PA-stelsel ligt { "6" }″ tot { "8" }″ van de PA van DE440 (vooraf vastgelegd e1ead19b, opnieuw vastgelegd be33382e nadat de eerste voorgestelde wijziging de drempel van { "1e-12" } miste; <c5/>). Gepubliceerde getallen die verschuiven: de LRO-fit (<c6/>) ruwe overlap { "53.8" } → { "39.9" } m, dynamisch { "12.6" } → { "12.05" } m, gereduceerd-dynamisch { "6.65" } → { "6.67" } m (drempels ongewijzigd). De analytische stack komt nu op beide niveaus overeen met de kruisvalidatie van ANISE op DE-niveau ({ "12.0" } / { "6.67" } m); het eerdere gat op het dynamische niveau was deze fout.

seg-ef2b49d4ad48 = <b>De MCP-server weigert <c1/></b> (follow-up van CAP-06b). Het pad van de terreintegel van de jammingsoort staat nu in <c2/>. Een inline-oppervlak weigert een scenario dat er een noemt, met een melding die noch het pad noch een fout van het besturingssysteem bevat. De test voor de bestandsbronbewaking markeert nu ook velden die eindigen op <c3/>.

seg-ef005d2e3d42 = <c1/> met een gebroken dagdeel liet de breuk vallen in de conversies van UTC, TAI, UT1 en Aardrotatie (één uur dagdeel zette de Aarde { "15" }° fout); het dagdeel wordt nu genormaliseerd tot een geheel getal. Geen aanroeper in de engine werd getroffen: elk geeft een hele dag door, en elke meegeleverde uitvoer is bit-identiek.

seg-144d90307ec6 = Gepland

seg-7ef4cd25cb87 = De geometrie uit een opgegeven skyline ({ "0.36" } onderdeel { "1" }, nu in de engine als <c1/>): <c2/> en <c3/> uit de skyline waar de invoer er een geeft (de azimutkloof als terugval), een gebeurtenis van natuurlijke degradatie (fjord of terminal) in <c4/>, en de twee gemaskeerde geometrieën van de ontwerpnotitie in de rij sigma_UERE x DOP, vooraf vastgelegd als addendum.

seg-49481d2fdf31 = Geometrie voor RINEX-logs met navigatie (uit de eigen positiebepaling van de engine) en Android-logs (uit de rijen <c1/>); beide lezen vandaag <c2/>. Geometrie in <c3/> (versie { "1" } ongewijzigd in { "0.36" }) en de integraties met Signal K en OpenCPN.

seg-57df1332ff87 = Een bestaand gat, niet geïntroduceerd in { "0.36" }: zodra het SNR-veld van elke satelliet leeg is, vuurt geen aftrek voor <c1/> of C/N0; totaal signaalverlies is alleen zichtbaar via <c2/> van de geometriemonitor (ingedeeld als <c3/>). Een aftrek ervoor is gepland.

seg-a5a7a10ee11c = Een schema-{ "1.3" }-stroom in de externe telemetriereferenties (de tekstformaatparser van Prometheus en de OTLP-collector), die vandaag alleen { "1.2" }-stromen dekken.

seg-caa1977b5b5e = Een tweezijdige obstructie (een canyon of smalle fjord) wordt gelezen als signaalverlies in plaats van als geblokkeerde hemel totdat de skyline is geïntegreerd.

seg-4bd0f178ca4e = Een passage die AI-clients van derden noemt is hier weggelaten; ze staat in <a1>CHANGELOG.md</a1> op GitHub.

seg-b2689beaba9e = Galileo OSNMA-verifier

seg-d16c9b4bf537 = <b>Nieuwe module <c1/> en <c2/>: een open verifier in pure Rust aan de ontvangerzijde voor Galileo OSNMA.</b> Hij leest I/NAV-pagina's en meldt, per satelliet en epoch, of de navigatiedata is geauthenticeerd, met een reden voor elke mislukking of vertraging: parsing van HKROOT en MACK, hermontage van DSM-KROOT en DSM-PKR, Merkle-verificatie van de publieke sleutel, verificatie van de TESLA-sleutelketen, MACSEQ- en tagverificatie voor ADKD { "0" }, { "4" } en { "12" } inclusief kruisauthenticatie, en een resultaat in de vorm van <c3/> voor de ontvangervertrouwensmonitor. De uitvoer draagt een advies dat de status geen integriteitsdienst voor navigatie is. <c4/> vermeldt wat wel en niet wordt geverifieerd, de tijdsvereiste, en dat Kshana geen rechten verleent onder de IPR's van de OSNMA-ICD van de EU (gebruikers vertrouwen op de autorisatie in Annex E van de ICD). Geïmplementeerd tegen de SIS ICD Issue { "1.1" } en de Receiver Guidelines Issue { "1.3" }. Pagina's worden op CRC gecontroleerd en een bytestroom UBX-RXM-SFRBX van u-blox kan rechtstreeks worden gelezen (<c5/>). Standaardtests gebruiken synthetische data en gepubliceerde known-answer-tests van primitieven; een test op aanvraag leest een lokaal gedownload exemplaar van de officiële vectoren. Na onafhankelijke beoordeling neemt de verifier zijn tijd alleen uit geverifieerde TESLA-sleutels (een vervalst subframe ver in de toekomst kan een mislukking niet meer wissen), laat hij een authenticatie verlopen en de gebruikte IODnav volgen, eerbiedigt hij geverifieerde alarmberichten (waarvan het Merkle-blad nu het willekeurige NPK-veld bevat) en de NMA-status "don't use", houdt hij dummytags buiten de satellietstatus, houdt hij ketens per CID bij met intrekking en vernieuwing, controleert hij de paddinghash van KROOT, en begrenst hij UBX-framelengten en het TESLA-verificatiewerk. Een satelliet wordt alleen als geauthenticeerd gelezen zolang de nieuwste efemeride- en klokdata die hij verzendt bit voor bit de data is die is geauthenticeerd (niet slechts onder dezelfde IODnav), een status of intrekking uit de niet-geauthenticeerde NMA-header telt alleen wanneer twee satellieten het eens zijn of een geverifieerde KROOT haar draagt, een herhaalde oudere KROOT kan een keten niet vervangen, en een vastgelopen sleutelstroom wordt gemeld.

seg-3e7df5c888ca = Toegevoegd (MCP-serverkanalen)

seg-4e70d8b85211 = <b><c1/>, streambare HTTP, zelf gehost.</b> Standaard loopback; een niet-loopbackadres vereist <c2/> en een bearer-token in <c3/>; geen tool leest of schrijft een pad (de IQ-bestandstools staan uit); limieten voor aanvraaggrootte, tijd en gelijktijdigheid; geen CORS-header; Host- en Origin-controles. Kshana host geen endpoint (<c4/>, met sjablonen voor Docker, Fly.io en Cloud Run).

seg-c392cde151c9 = Toegevoegd (oppervlakken)

seg-19ab5c068b6e = <b><c1/> in Python en WebAssembly.</b> De verifier achter <c2/> op bytes in het geheugen, die de JSON teruggeeft die <c3/> afdrukt (advies in zijn veld <c4/>; alleen authenticatiestatus, geen integriteitsdienst voor navigatie). Dezelfde weigeringen als de opdrachtregel. Niet in MCP: de invoer is een lange ruwe ontvangerstroom die beter door de CLI en Python wordt bediend. <c5/> en <c6/> zeggen dat.

seg-6128929994b4 = <b><c1/> in WebAssembly, Python en MCP, met een plug-in-opdracht en een JetBrains-actie.</b> Rendert een vertrouwensstroom of een resultaat van <c2/> als Prometheus-tekst, syslog-regels in CEF of LEEF, of een OTLP-JSON-payload, met de encoders die <c3/> gebruikt (<c4/>); geen socket en geen klok. Plug-in: <c5/> en de skill <c6/>. JetBrains: Render Trust Telemetry. De features <c7/> en <c8/> en de MCP-server schakelen nu ook <c9/> in, wat geen crate toevoegt.

seg-83d01411c6d4 = <b>Pariteitssweep.</b> JetBrains-acties Validate Scenario, List Scenario Kinds en Assess Receiver Stream; <c1/> noemt nu <c2/>, <c3/>, <c4/> en <c5/>; het notebook <c6/> (compliance mapping en test-bench-export); en elke resterende JetBrains-cel "CLI only" in <c7/> is nu een expliciete N/A met zijn reden.

seg-062ef0cf7ee7 = Toegevoegd (bewijspakketten)

seg-9889575c2df1 = <b><c1/> en <c2/>: ondertekende, verifieerbare bewijspakketten voor een GNSS-vertrouwensgebeurtenis.</b> Een pakket bundelt de ruwe logfragmenten en de SHA-256 van de volledige log, de configuratie met elke drempel, de resultaten en redenen per epoch, de engineversie, een hashgeketend manifest en een zelfstandige HTML-samenvatting, ondertekend met Ed25519 (een sleutel uit <c3/> of uw eigen bestand; sleutels worden nooit in een pakket opgeslagen en <c4/> wordt door git genegeerd). <c5/> controleert elke hash, de keten en de handtekening en noemt precies wat faalt; met <c6/> pint het de ondertekenaar vast. Een RFC-{ "3161" }-token kan worden bijgevoegd en wordt gelezen en aan het manifest gebonden (de eigen handtekening van de autoriteit wordt door deze build niet gecontroleerd; <c7/> doet dat wel). Het logfragment bestaat uit de exacte bytes van het venster waar de lezer bronbereiken meldt (NMEA, UBX, RINEX { "3" }, Android), anders uit de hele log, en het manifest zegt welke. Aanmaken en verifiëren zijn pure publieke functies (<c8/>) die voor <c9/> worden gebouwd. De pakketten stellen dat zij een technisch record zijn, geen juridisch oordeel. De nieuwe afhankelijkheden zijn de boom van <c10/> (BSD-3-Clause en Apache-2.0/MIT, minimale features) en een directe <c11/> (al in die boom) om sleutelmateriaal te wissen. Zie <c12/>.

seg-280fd37126c1 = Toegevoegd (vertrouwenstelemetrie)

seg-ebd269c618b0 = <b><c1/>: GNSS-vertrouwen als bron van beveiligingstelemetrie.</b> Leest de vertrouwensstroom per epoch (JSON-regels: score 0-100, band, redenen) of een batchresultaat van <c2/> en voedt een Prometheus-endpoint <c3/> (standaard localhost), syslog-gebeurtenissen in CEF of LEEF binnen een RFC-{ "5424" }-envelop (UDP of TCP) en, achter de standaard uitgeschakelde feature <c4/>, OTLP/HTTP-JSON-export. Aflevering draait op workerthreads met tijdslimieten voor verbinden en schrijven, begrensde reconnect-backoff en een teller <c5/>, zodat een dode of vastgelopen collector de live beoordeling niet kan stilleggen of <c6/> niet kan bevriezen; redenlabels zijn begrensd op { "64" } reeksen. Geen nieuwe afhankelijkheden. Een voorbeelddashboard voor Grafana staat in <c7/>. Metricnamen, labels en de veldtoewijzing voor CEF/LEEF staan in <c8/>. Het streamformaat is geïsoleerd in <c9/>.

seg-fa5e803edb44 = Vertrouwen op zee: een live vertrouwensscore van 0-100 voor de positiebepaling van een varend vaartuig, uit de NMEA { "0183" } die de ontvanger al uitvoert, met een poort op aanvraag.

seg-c5b3fcb9bba8 = <c1/> accepteert een tabel <c2/> (<c3/> of <c4/>, de maximumsnelheid, versnelling en draaisnelheid van het vaartuig, de hoogte van de antenne boven de waterlijn en een optionele koerssensor; elke standaardwaarde gedocumenteerd met haar reden). Voor een vaartuig wordt de monitor voor statische positiesprongen, die de afstand tot het kalibratiegemiddelde meet en op een varend schip onjuist is, vervangen door causale monitoren voor bewegende platforms: kinematische consistentie van de positie met de gerapporteerde snelheid en koers en met de limieten van het vaartuig, gyrokoers tegen koers over de grond, snelheidslog tegen snelheid over de grond, antennehoogte tegen de opgegeven hoogte boven de waterlijn, C/N0-spreiding die instort en samen stijgt tegen de kalibratiebasislijn, en tijdconsistentie (in de live-modus ook tegen de klok van deze computer). Het leest ook een gerapporteerde authenticatiestatus, in totaal of per satelliet (alleen een gerapporteerde status: geen OSNMA-cryptografie). Elke drempel wordt vóór de run vermeld in een tabel <c5/>. Elke epoch krijgt dan een score van { "0" } tot { "100" } via een deterministische, vooraf vastgelegde afbeelding (geen leren, niets gefit op gebeurtenissen; gewichten, bandgrenzen en het bewijs staan in een tabel <c6/>), afgebeeld op de bestaande vertrouwenstoestanden, met de monitoren die hebben afgetrokken en hun punten. Statische scenario's zijn ongewijzigd en hashen als voorheen. <c7/> leest stdin, een bestand dat wordt aangevuld, TCP of UDP en schrijft één JSON-regel per epoch en een eigen zin <c8/>; met <c9/> geeft het de stroom ongewijzigd door zolang de positiebepaling wordt vertrouwd en markeert het de positiebepaling als ongeldig (GGA-kwaliteit { "0" }, RMC- en GLL-status <c10/>, GNS- en VTG-modus <c11/>) zolang dat niet zo is. De poort staat uit tenzij erom wordt gevraagd; <c12/> levert de gepoorte stroom aan een willekeurig aantal TCP-clients (standaard loopback, een trage client wordt losgekoppeld in plaats van de anderen te blokkeren). Dit is adviserende software, geen typegoedgekeurde navigatieapparatuur (IEC { "61108" }, IEC { "61162" }); de exploitant blijft verantwoordelijk. <c13/> is een synthetisch log van Tallinn naar Helsinki, alleen als tekst geschreven, met halverwege een weglopen van de positie waarbij de ontvanger een geldige positiebepaling blijft melden; de verwachte uitvoer is door een test vastgepind. Gids: <c14/>. De controles kunnen een spoofer niet zien wiens positiebepaling consistent is met alles op de bus; de gids zegt dat.

seg-80f3f0aae42c = Interferentiekaart

seg-8539a42718cb = <b><c1/> en <c2/>: een openbaar beeld van waar vliegtuigen en schepen verslechterde navigatiedata meldden, en hoeveel van een route het raakt.</b> Invoer zijn lokale CSV-bestanden gemaakt van openlijk gelicentieerde data van ADS-B (adsb.lol, ODbL { "1.0" }) en AIS (NOAA MarineCadastre, Kystverket onder NLOD { "2.0" }); elk uitvoerbestand is één bron en één UTC-dag aan GeoJSON met de methode, haar drempels, de datalicentie, de naamsvermelding en de dekkingsbias van de bron. De ADS-B-methode aggregeert NIC en NACp op een vast raster en noemt een cel degraded op grond van het aandeel verschillende vliegtuigen, met bewakingen voor apparatuur die nooit nauwkeurigheid meldt, lage hoogte en oorzaken over een groot gebied. De AIS-methode draait vijf detectoren: posities op land (tegen een door de gebruiker aangeleverde kustlijn), cirkelvormige sporen, onwaarschijnlijke sprongen, onwaarschijnlijke snelheden en veel vaartuigen op één positie. Drempels zijn vooraf vastgelegde constanten van een benoemde methodeversie. Alleen aggregaten: identificatoren worden in het geheugen gehasht en nooit weggeschreven, en cellen met minder dan { "5" } verschillende vliegtuigen of vaartuigen worden niet gepubliceerd. Een degraded cel is geen vaststelling van interferentie. De standaardopdrachten gebruiken geen netwerk; een hulpprogramma <c3/> op aanvraag downloadt landpolygonen van Natural Earth van een aan een commit vastgepind adres en bewaart het bestand alleen als zijn SHA-256 overeenkomt. ADS-B-invoer is een CSV of rechtstreeks de readsb-geschiedenisbestanden van adsb.lol (nieuwe afhankelijkheid: <c4/> met zijn pure-Rust-backend, voor gzip). Beide methoden zijn versie { "2" }: een degraded of afwijkende aanduiding vereist ten minste { "5" } vliegtuigen of vaartuigen (het publicatieminimum), elke telling per cel onder { "5" } wordt achtergehouden als <c5/>, en een dag waarvan de achtergrond niet kan worden geschat, houdt zijn aanduidingen achter. Uitvoerbestanden heten <c6/> en worden nooit overschreven; invoer wordt regel voor regel gestreamd; routeblootstelling verwerkt de antimeridiaan. Tests gebruiken alleen synthetische data. Zie <c7/> en de licentiebeoordeling in <c8/>.

seg-e3eff59db445 = De gestreamde uitvoer is bit voor bit identiek aan de replay in het geheugen.

seg-c602902313f8 = <em>Toestandsmachine voor lock</em> (<c1/>, <c2/>): pull-in → locked → lost → heracquisitie → pull-in, of buiten dienst gesteld zodra een verlies langer duurt dan <c3/> (standaard { "30" } s). Mislukte zoekpogingen worden elke <c4/> ({ "0.1" } s) herhaald, gelijkmatig verdeeld, zodat het herhalingsschema hooguit { "0.1" } s toevoegt aan een gemeten heracquisitietijd. Een optionele back-off (<c5/> boven <c6/>) staat standaard uit, en <c7/> is een optionele limiet ({ "0" }, geen, standaard). Een uitval van { "2" } s op drie PRN's bij { "4.092" } MS/s eindigt nu met alle kanalen opnieuw verworven en gelockt. Bij een budget van 3 pogingen was elk kanaal binnen { "0.2" } s na het verlies buiten dienst gesteld.

seg-56bc109dbef9 = De drempels (<c1/>, <c2/>, het Dopplervenster voor heracquisitie) komen uit het ontwerp. Elke overgang is een gebeurtenis met zijn reden.

seg-b1c551e48389 = De controle op valse lock zoekt de getrackte Doppler af tegen de ±1/(2T) FLL/PLL-alias. Ze vangt de valse lock die PR #38 mat (−{ "2400" } Hz getrackt, { "500" } Hz ernaast). Met heracquisitie aan eindigt het kanaal gelockt op de geïnjecteerde Doppler.

seg-39409dd0b4bc = Een signaalonderbreking van { "0.8" } s wordt als lost gemeld en binnen { "0.3" } s na terugkeer van het signaal opnieuw verworven.

seg-ce3162720ce5 = <c1/> (en de kolom van de tabel) is de toestand na de laatste overgang, zodat een kanaal dat na zijn laatste lusupdate buiten dienst is gesteld <c2/> vermeldt.

seg-520ab6d84a6c = <b>FLL-ondersteuning alleen tijdens pull-in</b> (<c1/>, de standaard; <c2/> behoudt het eerdere gedrag bit voor bit). De FLL draagt over aan de PLL zodra de afgevlakte PLI minstens <c3/> ({ "0.8" }) heeft gehouden gedurende <c4/> ({ "0.1" } s), en keert terug onder <c5/> ({ "0.6" }). Wanneer hij aan bleef, verbrak het { "10" } Hz FLL-pad de fasevergrendeling onder ongeveer { "38" } dB-Hz op schone signalen: bij { "35" } dB-Hz was de fractie met fasevergrendeling { "10" }–{ "16" } %, met een werkelijke faseafwijking van { "38" }–{ "41" }°. Met gating houdt de standaard { "100" } % bij { "35" } dB-Hz met { "4.5" }°, hetzelfde als een PLL alleen. Pull-in vanaf een overdrachtsfout van { "100" } Hz is ongewijzigd. Bewijs met vooraf vastgelegde drempels: <c6/>. <b>De standaardlussen zijn daarom niet bit voor bit gelijk aan eerdere runs van het standaardontwerp.</b> Gebruik <c7/> om ze te reproduceren. Bekende beperking: bij { "35" } dB-Hz volgt de overdracht { "1.9" }–{ "2.6" } s na het begin van de track, en bij { "33" } dB-Hz houdt de { "10" } Hz FLL de PLI onder de overdrachtsdrempel, zodat pull-in nooit voltooid wordt.

seg-1a911b958f8e = Nieuwe sleutels voor het lusontwerp en nieuwe API, opgesomd:

seg-5497722fee70 = <c1/>: <c2/>, <c3/>, <c4/>, waarbij <c5/> is gewijzigd van een standaard van { "3" } naar een optionele limiet (standaard { "0" });

seg-d1dee2f32fc4 = Rust: <c1/> (<c2/>, <c3/>), <c4/>, <c5/>, <c6/>.

seg-eecacf54975b = De ontwerphash wordt berekend over een canonieke JSON-vorm, en de hash van de ingebouwde standaard is <c1/> (vastgezet door een test).

seg-2405be1bc0c6 = Opmerkingen over uitvoercompatibiliteit:

seg-77670b7dd608 = de tabel van <c1/> heeft een afsluitende kolom <c2/>;

seg-a52d9bbdd1a4 = de CSV van <c1/> heeft een afsluitende kolom <c2/>, en de JSON heeft <c3/> en <c4/>;

seg-3fa0f9243806 = de <c1/> van de sweep is nu het gemiddelde over elke update met een NWPR-schatting (samenvatting met begrensd geheugen), niet langer over de tweede helft van de run.

seg-d542c1616f35 = Heracquisitie staat <b>uit in de ingebouwde standaard</b>, waar de toestandsmachine alleen observeert en de lussen bit voor bit draaien zoals zonder haar. (De standaardlussen zelf zijn echter gewijzigd: zie FLL-ondersteuning hierboven.) Schakel haar in per ontwerp (<c1/>), met <c2/> of met <c3/>.

seg-61d6b3122888 = Een <b>waarschuwing <c1/></b>: wanneer fs binnen { "1e-6" } ligt van een veelvoud van de helft van de chipsnelheid (<c2/>), waarschuwen <c3/>/<c4/> (uitvoer, <c5/>, sweep-JSON), het MCP-antwoord van <c6/> en het Python-resultaat van <c7/> dat de jitter en bias van de codelus niet representatief zijn. De hoofdoorzaak is gedocumenteerd met vooraf vastgelegde drempels in <c8/>. Bij precies { "2" } samples per chip met een afstand van 0.5 chip is de DLL-S-curve één enkele stap en dithert de lus: ≈ { "0.09" } chip RMS-codefout (≈ { "26" } m) bij { "45" } dB-Hz, tegenover ≈ { "0.004" } chip bij een incommensurabele snelheid. De ~{ "2" } dB te lage NWPR C/N0 bij die snelheid heeft dezelfde oorzaak. Bij precies { "0" } Hz codeDoppler en { "4" } samples per chip passeert de code nooit de dode zone van ±0.21 chip, zodat een codefasebias tot ongeveer { "0.2" } chip kan blijven bestaan zonder in de jitter zichtbaar te zijn (gemeten: een afstand van 0.5 chip geeft { "2.0" }× de codefout van de controle met een gemiddelde van +{ "0.011" } chip; een afstand van 0.25 chip geeft +{ "0.125" } chip); de waarschuwing omvat de snelheid.

seg-8fbfb3f0bee2 = <b>Bekende beperking: het standaardontwerp draagt FLL→PLL niet over onder ongeveer { "35" } dB-Hz</b> (een pull-in-ondergrens van ~{ "35" } dB-Hz; zie FLL-ondersteuning hierboven en <c1/>).

seg-43f02bc861be = Een zoekpoging naar valse lock of heracquisitie die niet kan draaien (een snelheid zonder geheel aantal samples per codeperiode) stopt het tracken niet langer.

seg-14f4e9edc443 = Tests: <c1/>, <c2/>, <c3/>, <c4/> en de MCP-IQ-round-trip.

seg-60141bb08f64 = C/N0-profielen in synthetische scènes ({ "0.34.0" }).

seg-1b44566881e8 = <c1/> plant in Kshana's eigen scènes een in de tijd variërende C/N0 per satelliet in, als dB-offsets ten opzichte van de C/N0 van de scène. Vormen: stap, helling, stuksgewijs lineair en geseedde scintillatie-achtige Rice-fades met een opgegeven S4 en decorrelatietijd. Ze worden toegepast via de bestaande kanaalhook van de scène (<c2/>, samen te stellen met de effecten van ionosfeer, troposfeer, scintillatie en multipath), zonder wijziging van de scènekern. De <c3/> in het truth-sidecarbestand volgt het profiel.

seg-548eeca516ff = Oppervlakken: <c1/> en <c2/>.

seg-a242e4d9f071 = Waarvoor het dient: lussen, monitors en campagnescoring kunnen worden stresstest worden tegen een bekende referentie. Het wijzigt alleen de sterkte van de legitieme signalen.

seg-ff4df7c343dc = Controles (<c1/>). Drempels: gemiddelde fade-intensiteit binnen { "5" } % van { "1" }, S4 binnen { "8" } % van het doel (bij S4 = { "0.3" }, { "0.7" } en { "1" }), intensiteitscorrelatie boven { "0.9" } bij { "0.05" } τ en onder { "0.05" } bij { "5" } τ; referentie exact de opgegeven C/N0 plus het profiel; een getrackte daling van de NWPR C/N0 binnen { "0.7" } dB van een stap van { "6" } dB. Gemeten: S4 binnen { "1.3" } % van het doel, en een getrackte daling van { "6.26" } dB.

seg-e214458cd1b6 = <b>Detectiemonitors voor het IQ-pad ({ "0.34.0" } "Lab replay").</b> Nieuwe module <c1/>, opdracht <c2/> en binding <c3/>. Ze observeren een opname en rapporteren tijdreeksen plus gemarkeerde gebeurtenissen (start-, alarm- en eindtijden, piek, drempel). Ze detecteren en meten alleen; niets hier genereert een signaal.

seg-5b05b2a54fab = <b>Totaal vermogen / AGC</b>: blokvermogen en de versterking die een ideale AGC zou toepassen; markeert stijgingen en dalingen.

seg-2a84a640d7f1 = <b>Spectrum vóór correlatie</b>: Welch-PSD per blok tegenover een aangeleerde basislijn. De drempel voor het overschot komt uit een doel voor valse alarmen. Ook complexe kurtosis en een pulsdetector. De pulsdetector telt de samples boven een drempel in elk blok en geeft een gebeurtenis wanneer de exacte binomiale bovenstaart van die telling onder <c1/> ligt (standaard { "1e-4" } per blok), niet wanneer een z-score een limiet passeert: bij de kleine verwachte aantallen van korte blokken is één enkele sample al meerdere sigma.

seg-7704ac807c38 = <b>C/N0 per kanaal</b>: twee eenzijdige CUSUM-veranderingsdetectoren (daling en stijging), gevoed met onafhankelijke schattingen (de stride wordt bepaald door het C/N0-venster van de lus).

seg-f965a68d388b = <b>SQM uit de correlatoren</b>: delta <c1/> en verhouding <c2/>, plus asymmetrietests uit extra correlatoren wanneer een kanaal die levert.

seg-a4006c2e8692 = <b>Reeksen van de lock-indicator</b>: PLI en een frequentie-lockindicator uit opeenvolgende prompts, als ruwe signalen. Beslissingen over lock en verlies van lock blijven bij de toestandsmachine voor lock van de trackingengine.

seg-da72318f44cc = Eén streamingronde (<c1/>) draait alles, met een TOML/JSON-instellingenbestand (<c2/>); de campagnerunner gebruikt hetzelfde toegangspunt. Alles MODELLED. Elke statistiek wordt met geseedde simulatie getoetst aan haar gesloten vorm (<c3/>):

seg-0ff96e4c5a20 = overschrijdingen van het blokvermogen tegenover de Gamma-staart;

seg-97b559ea0897 = gemiddelde kurtosis { "2" } en spreiding <c1/>;

seg-2b941c702b7f = pulsfractie <c1/>;

seg-e8f068c41f0c = looplengtes van CUSUM tegenover de benadering van Siegmund (gemeten { "330" } en { "8.46" } samples tegenover { "338" } en { "8.34" });

seg-e2cd6a55e49b = de fasevergrendelingsindicator tegenover het gemiddelde van de Rician-fase;

seg-06291b1c6274 = bij een getrackt C/A-signaal wijken de spreidingen van SQM-delta en -verhouding ongeveer { "6" } % af van de eerste-orde gesloten vormen (gemeten { "5.97" } %; testdrempel { "12" } %).

seg-12deb36a2e3a = De formule voor valse alarmen van het spectrale overschot is een benadering; de gemeten frequentie was { "1.3" }× de formule. End-to-end markeren de monitors:

seg-b002c66c7881 = een C/N0-stap van { "6" } dB (wijzigingstijd binnen één schatting);

seg-2e828d106393 = een gereflecteerd pad dat midden in de opname verschijnt (verhoudingstest);

seg-68063f036e2c = een signaaluitval (PLI daalt tijdens de uitval van { "0.999" } naar −{ "0.3" } en FLI van { "0.93" } naar { "0.03" });

seg-0cd95f0197ec = een smalbandige toon en schaarse samples met hoge amplitude (spectrale, puls- en kurtosistests). Dit zijn generieke DSP-testinvoeren, geen interferentiemodellen.

seg-7128b9000cc2 = <c1/>/<c2/> streamen via de nieuwe sessie (zie Added).

seg-98891d33e48c = <c1/> behoudt zijn { "0.32" }-kolommen maar wordt nu gestreamd, zodat rijen van meerdere kanalen in tijdvolgorde door elkaar lopen in plaats van per kanaal gegroepeerd te zijn. <c2/> behoudt zijn { "0.32" }-vorm en houdt nog steeds elke epoch in het geheugen: gebruik <c3/> voor lange opnames.

seg-2ef2d5771ade = <c1/> meet de jitter over de updates in de tweede helft van de looptijd van de run (voorheen de tweede helft van het aantal updates), en zijn CSV/JSON krijgen een kolom <c2/>.

seg-f23b6db96748 = De tracktabel krijgt een kolom <c1/>.

seg-a5769fbc201e = De gebruikstekst beweert niet langer dat <c1/> de front-endvlaggen accepteert; alleen <c2/> past ze toe.

seg-cf28fa21786a = <c2/> en <c3/> van Python <c1/> krijgen nu standaard <c4/> (de waarden van het ontwerp, { "1" } en { "5000" } Hz in het ingebouwde ontwerp). De epochs krijgen de early/late-correlatoren, <c5/>, <c6/>, <c7/> en <c8/>, en het resultaat krijgt <c9/> en <c10/>.

seg-666b9e3faa5d = <b>De standaard acquisitiestap geeft Galileo E1-tracking geen restfout meer mee die de FLL niet kan binnentrekken.</b> De stap <c1/> laat bij de overdracht tot <c2/> Dopplerfout over, maar de standaard FLL met twee kwadranten trekt slechts <c3/> binnen. Voor elke code van { "4" } ms of langer (<c4/>), waaronder Galileo E1-B en E1-C, lag de restfout ({ "83.3" } Hz bij { "4" } ms) buiten de pull-in van { "62.5" } Hz en vergrendelde het tracken vals op +{ "125" } Hz, met een fasevergrendelingsindicator van { "0.97" } die dit verborg. De standaardstap wordt nu ook begrensd op <c5/> (<c6/>), { "0.8" } van de pull-in, zodat de overdracht binnen de pull-in blijft, ook wanneer de naburige bin wint. ({ "0.4" } werd eerst geprobeerd: dat gaf { "1" } valse lock in { "42" } runs op E1-B, en een coherente GPS L1 C/A-zoekactie van { "1" } ms koos een bin { "350" } Hz ernaast en vergrendelde op +{ "500" } Hz; { "0.25" } en { "0.2" } hadden er in dezelfde runs geen.) Kosten: Galileo E1-B/E1-C gaan van bins van { "166.7" } Hz naar { "50" } Hz, { "201" } bins over ±{ "5" } kHz in plaats van { "61" }; de codes van { "1" } ms ({ "166.7" } Hz, <c7/>) zijn ongewijzigd. <c8/> in een lusontwerp betekent dit; een expliciete <c9/> of <c10/> wordt gebruikt zoals geschreven, en <c11/> (geen overdracht aan tracking) behoudt de leerboekstap. De epochkop en <c12/> leggen nu per kanaal de bepaalde stap en lusbandbreedtes vast (<c13/>). De hash van het standaardontwerp is ongewijzigd. Wijziging in de uitvoer: detecties op codes van { "4" } ms en langer kunnen op andere Dopplerbins terechtkomen.

seg-9150dc89e186 = <b>GPS L2C CM ({ "20" } ms lusupdate) houdt lock met het standaardontwerp.</b> De standaard PLL van { "15" } Hz en FLL van { "10" } Hz hebben <c1/> van { "0.3" } en { "0.2" } bij T = { "20" } ms, en de lus verloor lock zelfs vanuit een perfecte start (PLI −{ "0.08" }, M2M4 { "15.8" } dB-Hz). De nieuwe ontwerpsleutel <c2/> (standaard { "0.1" }) begrenst de ruisbandbreedtes van PLL en FLL op <c3/> wanneer de lusupdatetijd langer is dan { "4" } ms (<c4/>): { "5" } Hz en { "5" } Hz bij { "20" } ms, { "10" } Hz en { "10" } Hz bij { "10" } ms van BeiDou B1C; de codes van { "1" } ms en { "4" } ms behouden { "15" } en { "10" } Hz. Het geldt ook voor expliciete bandbreedtes; <c5/> schakelt het uit. De sleutel wordt bij zijn standaardwaarde weggelaten uit de canonieke vorm, zodat de standaardhash ongewijzigd is; een ontwerp dat een andere waarde instelt heeft een andere hash. Bij { "45" } dB-Hz geeft L2C CM nu PLI { "0.996" }, Dopplerfout { "0.00" } Hz en M2M4 { "42.71" } dB-Hz. Bekend openstaand punt: de NWPR C/N0 leest daar { "1.76" } dB te laag (en { "2.45" } dB te laag op B1C bij { "10" } ms), zodat T5 van de matrix voor L2C een genegeerde bevinding blijft.

seg-74517bee3f6f = <b><c1/> opnieuw gegenereerd: de vastgelegde figuur was verouderd ten opzichte van haar eigen scenario (een gegevenswijziging, geen herschildering).</b> De grafiek werd op 2026-06-02 getekend uit <c2/>; twee dagen later stelde 67fed19e de flicker-FM-ondergrenzen in dat scenario in (quantum <c3/>, CSAC <c4/>) en de figuur werd nooit opnieuw getekend. Ze toonde de run van vóór de ondergrenzen: y-as { "0" } tot { "47" } ns, CSAC-uitval per run p95 van { "10.5" } tot { "47.6" } ns (gemiddelde { "25.2" } ns), klassieke holdover gemiddeld { "4050" } s. Het scenario zoals geleverd (en zoals de tutorial en de CLI-samenvatting al vermelden) geeft y-as { "0" } tot { "407" } ns, CSAC per run p95 { "40.8" } tot { "374.0" } ns (gemiddelde { "167.0" } ns), klassieke holdover { "844" } s [{ "220" } tot { "2130" } s]; de specificatielijn van { "20" } ns ligt op dezelfde { "20" } ns op een ruwweg negen keer hogere as. De engine is ongewijzigd: de huidige engine op het scenariobestand van juni reproduceert de as van de oude figuur exact. De figuur wordt niet vermeld in de README of de documentatie.

seg-75636f9419b2 = Bekende beperkingen

seg-2c607b56048e = <b>De NWPR C/N0 leest te laag bij hoge C/N0·T per prompt, en BOC({ "1,1" }) bij { "5" } MS/s verliest ongeveer { "1" } dB.</b> NWPR is zuiver op ideale prompts, maar de eigen PLL-jitter van de lus kost ongeveer een gefitte { "8" } dB × Bn·T (één scène, vier punten: −0.24/−0.44/−0.77/−{ "1.58" } dB bij 1/2.5/5/10 Hz en { "20" } ms; ongeveer −{ "1" } dB bij de standaard <c1/>); M2M4 is ongevoelig. BeiDou B1C-data bij { "5" } MS/s verliest ook ongeveer { "1" } dB promptvermogen door bandbeperking (gebruik { "10" } MS/s of meer). Geen van beide is een defect van de schatter; de T5-rijen van de signaalmatrix voor GPS L2C en BeiDou B1C blijven genegeerde bevindingen met deze oorzaken.

seg-ff195e575023 = <b>Grafiektekst en overname van grafieken in Studio verhard.</b> Tekst die een scenario in een gegenereerde grafiek meeneemt wordt nu consistent geëscaped door één gedeelde routine, en de Studio neemt uit een grafiek alleen tekenmarkup over. De adresparameters, opzoekingen op soort-sleutel en scenario-ophalingen van de Studio zijn beperkt tot bekende waarden. Meegeleverde grafieken, vastgelegde resultaten en gepubliceerde getallen zijn ongewijzigd. Upgraden wordt aanbevolen voor iedereen die scenariobestanden uit niet-vertrouwde bronnen in de Studio opent of gegenereerde grafieken in webpagina's inbedt. Beveiligingsadvies: <a1>GHSA-h25h-cg9f-v2cg</a1>.

seg-7f566858d036 = <b>Het bereik van interferentie en spoofing in de IQ-laag, nauwkeurig vermeld.</b> De vermeldingen van { "0.31.0" } en { "0.32.0" } hieronder zeggen dat de IQ-laag "geen synthese van interferentie- of spoofingsignalen" toevoegt. Dat geldt voor de IQ-laag zelf (<c1/> genereert uitsluitend legitieme GNSS-signalen), maar het las als een uitspraak over de hele engine, en dat is het niet: sinds { "0.29.0" } schrijft de sectie <c3/> van de soort <c2/> een SigMF-snapshot van haar analytische model met de geconfigureerde jammers erin (ruisachtige jammers bin voor bin, tonen en chirps als golfvormen), en <c4/> telt in het geheugen een authentiek en een spooferreplicasignaal op om lusovername te testen (het samengestelde signaal wordt nooit weggeschreven). De engine bevat sinds { "0.20.0" } ook een software-GNSS-ontvanger (<c5/>: acquisitie en tracking; sinds { "0.31.0" } ook <c6/> en <c7/>). Niets in Kshana zendt uit of stuurt radiohardware aan. De statusregel in de README, <c8/>, <c9/> en de ontwerpnotities van de IQ-laag zeggen dit nu; de gepubliceerde vermeldingen zijn gelaten zoals ze waren gepubliceerd. Er verandert geen gedrag.

seg-61befd8b474d = <b>Bekende beperking: commensurabele bemonstering.</b> Bij een samplesnelheid die een geheel of half geheel veelvoud van de chipsnelheid is, liggen de samples in elke chip op dezelfde chipfasen, en wordt de codediscriminator een trap. Op een synthetisch GPS L1 C/A-signaal van { "45" } dB-Hz met een afstand van 0.5 chip geeft { "2.046" } MHz ({ "2" } samples/chip) ≈ { "0.09" } chip (≈ { "26" } m) RMS-codefout en een bias van −{ "0.09" } chip, tegenover ≈ { "0.003" } chip bij een incommensurabele snelheid. De NWPR C/N0 leest daar ≈ { "2.4" } dB te laag. Bij { "4.092" } MHz hangt het af van de afstand en de codeDoppler. Bij { "0.5" } chip is het onschuldig bij { "1500" } Hz Doppler maar { "2" }× met een bias van { "0.011" } chip bij { "0" } Hz, en bij { "0.25" } of { "0.1" } chip is het { "8" }–{ "10" }× de codefout. Carriertracking is niet aangetast. <c1/> bevat de metingen.

seg-3a30bd47380a = GNSS-IQ-laag op de MCP-server (Phase B.1).

seg-ef81eca03bca = <c1/> krijgt zes tools die de laag <c2/> vanuit een agent aansturen: <c3/> (de geaccepteerde signaalnamen en de IQ-opzet), <c4/> (een opname beschrijven), <c5/> (een scène met opgegeven profiel of broadcast-efemeride genereren, met het optionele kanaal op signaalniveau), <c6/> (FFT-acquisitie, optioneel achter front-endtrappen), <c7/> (verwerven, dan de DLL/PLL/FLL-bank) en <c8/> (bandpass, notch, blanking, excisie, AGC, kwantisator). IQ-samples passeren het protocol nooit: elke tool neemt bestandspaden binnen één werkmap die met <c9/> wordt ingesteld (niet ingesteld laat de IQ-bestandstools uit en tast alle andere tools niet aan), weigert paden die buiten die map uitkomen en uitvoer die al bestaat tenzij <c10/> is ingesteld, dwingt vóór enig werk een samplebudget per aanroep af (<c11/>, standaard { "50 000 000" }), weigert onbekende argumenten en antwoordt met een compacte JSON-samenvatting (detecties, C/N0, lock-toestand en elk weggeschreven bestand met zijn aantal bytes). Uitvoer per epoch gaat alleen naar bestanden die de aanroeper noemt. De tools draaien hetzelfde codepad als de CLI via een nieuwe publieke naad, <c12/>, die het bericht van de CLI teruggeeft in plaats van het af te drukken (stdout is het MCP JSON-RPC-kanaal); <c13/> en <c14/> zijn nu ook publiek. Alleen software en additief: de IQ-laag voegt geen synthese van interferentie of spoofers toe, er wordt nooit iets uitgezonden en er zijn geen nieuwe afhankelijkheden. <c15/> declareert de twee omgevingsvariabelen. Round-trip-tests in <c16/> genereren een korte scène met twee satellieten en toetsen de acquisitie aan het eigen truth-sidecarbestand van de scène, trackinglock en C/N0, de front-end, SigMF-uitvoer, het budget, padbeperking en de uitgeschakelde toestand.

seg-6963f3fa1db7 = <b>De GNSS-IQ-laag in het validatieregister.</b> Een vooraf vastgelegde kruiscontrole met gps-sdr-sim (een onafhankelijke GPS L1 C/A-basisbandgenerator, MIT, commit 28ca29a6) maakt nu deel uit van de altijd actieve testsuite (<c1/>). De vastgelegde referentie-uitvoer (<c2/>: { "20" } ms aan eigen 8-bit-I/Q van gps-sdr-sim, haar kanaallijst en de kanaaltoestand erachter uit een harnas dat tegen dezelfde build is gelinkt) wordt opnieuw gegenereerd door <c3/>. Op testtijd is geen netwerk of extern hulpmiddel nodig. Er worden twee registerrijen toegevoegd ({ "251" } rijen: { "124" } onafhankelijk getoetst, { "123" } berekend uit een model, { "4" } van de partner):

seg-21d005e2ef0e = <em>Signaalgeometrie van een GNSS-IQ-scène tegenover een onafhankelijke basisbandgenerator</em>: <b>Onafhankelijk getoetst</b>. De referentie van de scène (zichtbare set, pseudorange, codefase, Doppler, kijkhoeken) voor een scène met broadcast-efemeride komt op alle { "11" } kanalen overeen met de kanaaltoestand van gps-sdr-sim: slechtste { "1.6" } mm, { "5.5e-6" } chip, { "7.4e-5" } Hz, { "4e-9" } graad, tegenover drempels van { "0.05" } m, { "2e-4" } chip, { "0.02" } Hz en { "1e-4" } graad die vóór de run zijn vastgelegd.

seg-5c8858182d41 = <em>GNSS-IQ-acquisitie op onafhankelijk gegenereerde I/Q-samples</em>: <b>Berekend uit een model, met een bevinding</b>. <c1/> vindt elke gesimuleerde satelliet in de samples van gps-sdr-sim binnen de vastgelegde drempels (codefase binnen { "0.195" } chip, Doppler binnen { "72" } Hz). De vastgelegde drempel "geen andere PRN gedetecteerd" faalt echter: op de ruisvrije uitvoer van gps-sdr-sim wordt de drempel voor Gaussische ruis door de kruiscorrelatie van de andere satellieten overschreden voor alle { "21" } afwezige PRN's. De strikte test wordt behouden, genegeerd met de bevinding, en een vastgezette test legt haar vast. Er verandert geen enginecode of publieke API. De I/Q van de samples wordt niet sample voor sample vergeleken: de gehele-getallen-sinustabel van gps-sdr-sim, de versterkingen, de beginfase nul van de draaggolf en de afgekapte LNAV-velden zijn geen grootheden waarover een ontvanger overeenstemming nodig heeft. De vergelijking wordt gemaakt op de waarnemingsgrootheden die een ontvanger meet.

seg-a2be63287ce4 = <b><c1/> draagt standaard over vanuit een acquisitie van ≈{ "4" } ms (gedragswijziging).</b> De acquisitie die elk trackingkanaal initialiseert integreert nu <c2/> codeperiodes coherent in plaats van één, waarbij <c3/> de volledige periode van de code is (primaire maal secundaire lengte voor een gelaagde code, de eenheid waarover de acquisitie integreert). De ongelaagde codes van { "1" } ms (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) zoeken nu { "4" } periodes ({ "4" } ms), zodat de standaard Dopplerstap <c4/> ~{ "167" } Hz is in plaats van ~{ "667" } Hz. Elke code waarvan de volledige periode al { "4" } ms of langer is, houdt { "1" } periode: Galileo E1-B ({ "4" } ms), BeiDou B1C ({ "10" } ms), en de gelaagde GPS L5-I/L5-Q, Galileo E5a-I/E5a-Q en E1-C ({ "10" } tot { "100" } ms met hun overlaycodes), en GPS L2C. Elk signaal integreert daardoor minstens ~{ "4" } ms. Een zoekactie van één periode kon een kanaal tot ~{ "333" } Hz ernaast overdragen, buiten de pull-in van de FLL, waarna het een valse lock ~{ "500" } Hz verderop trackte terwijl het een schone track meldde. Op een geseede sweep van { "180" } GPS L1 C/A-kanalen (Doppler over ±{ "5" } kHz, { "38" } tot { "47" } dB-Hz, de helft met navigatiedata; <c5/>, opnieuw uitvoerbaar) dalen valse locks van { "27" } van { "180" } naar { "1" } van { "180" } en gemiste acquisities van { "102" } naar { "11" }, voor ~{ "40" } ms extra zoektijd per PRN op GPS L1 ({ "11" } → { "52" } ms). De ene resterende valse lock zit op { "38" } dB-Hz, { "36" } Hz ernaast. Elk oppervlak komt overeen: <c6/> en <c7/> (<c8/>), Python <c9/> (<c10/> is nu auto; stub bijgewerkt) en de MCP-tool <c11/>. Gebruikers die op de oude standaard vertrouwden kunnen <c12/> (<c13/>) opgeven. De eigen standaard van <c14/> voor <c15/> blijft { "1" }. Nieuw publiek: <c16/> en <c17/>; regressietest <c18/>.

seg-52768eb8e3d5 = <b>Elke gegenereerde afbeelding volgt nu het Observatory-thema van de site: de bytes van elke grafiek veranderen.</b> Dit is een bewuste herziening van alleen de gepubliceerde figuren, kleuren en lettertypen; geen enkele uitgezette waarde, coördinaat of label is verschoven. De <c1/> van elk scenario (en dus de grafiekexports van de Studio en de demografieken in de README), de run-rapport-HTML (<c2/>), de tijdlijnanimatie (<c3/>), de HTML-pagina's voor scenarioresultaten en studies, de validatiesamenvatting en de figuren en diagrammen in de documentatie gebruikten het warm-donkere palet van juli (<c4/> ondergrond, <c5/> goud) en een warm-papieren rapportthema. Ze nemen nu elke kleur en elk lettertype uit één module, <c6/>, die <c7/> weerspiegelt: grafieken worden instrument-donker getekend op de Observatory-ondergrond (<c8/>) in de Geist-lettertypestack; het rapport, de animatiespeler en de resultaatpagina's volgen de voorkeur voor licht/donker van de kijker met de lichte en donkere tokens van Observatory. De zes faaldomeinen houden elk één kleur (interferentie koraal, spoofing magenta, tijdsynchronisatie blauw, banen cyaan, integriteit limoen, navigatie amber), en de bewijsniveaus lezen als onafhankelijk getoetst limoen, berekend uit een model amber, van de partner magenta. De waterfallverlopen behouden hun perceptuele (inferno-)volgorde, opnieuw verankerd op de nieuwe ondergrond.

seg-d967e354a966 = <c1/> houdt de module in beide thema's gelijk aan <c2/>, controleert dat <c3/> en <c4/> (beide gegenereerd uit de module, voor de Python-figuurhulpmiddelen en mermaid-cli) actueel zijn, en faalt als er een hex-kleurliteral in <c5/> buiten het palet voorkomt.

seg-fa3e60422ca5 = <c1/> krijgt een derde diagnose, "alleen kleuren en lettertypen zijn verschoven", zodat een palettenrevisie te onderscheiden is van een verschoven uitgezette waarde. Elke opnieuw gerenderde README-grafiek is onder die normaliseerder gelijk bevonden aan haar voorganger.

seg-3bc4056fd57e = <c1/> leest het palet en genereert nu ook de drie resultaatfiguren van de README die geen vastgelegde generator hadden (<c2/>, <c3/>, <c4/>), met echte tekstelementen, uit <c5/>, het resultaat <c6/> en <c7/>. <c8/> leest hetzelfde palet, wat zijn afwijking van de site in het lichte thema corrigeert. De waarden van <c9/> zijn de worstcasekolom <c10/> van die fixture ({ "7.31e-9" }, { "8.05e-9" }, { "8.18e-9" } en { "4.12e-6" } km), ongewijzigd ten opzichte van de Matplotlib-figuur, en <c11/> faalt nu als de vastgelegde figuur en de fixture niet overeenkomen.

seg-3196836a2a0d = <b><c1/> bijgewerkt naar actuele gegevens (een gegevenswijziging, geen herschildering).</b> De figuur vermeldde { "28" } mogelijkheden in { "8" } domeinen ({ "11" } onafhankelijk getoetst, { "17" } berekend uit een model), verouderd ten opzichte van haar eigen vermelde bron; nu getekend door haar nieuwe generator uit <c2/>, toont ze { "46" } mogelijkheden in { "8" } domeinen ({ "17" } onafhankelijk getoetst, { "29" } berekend uit een model).

seg-55d5b16379aa = <b>De Q van CW/smalbandige jammers is nu { "1.0" }, niet { "1.5" }.</b> De leerboekwaarde voor een toon op de draaggolf is { "1" } (een toon behoudt de spectrale piek van het signaal, <c1/>, <c2/>); de oude { "1.5" } maakte een toon minder schadelijk dan breedbandruis bij gelijke J/S. Wijziging in de uitvoer: ongeveer −{ "1.8" } dB effectieve C/N0 onder CW/smalbandige jammers bij hoge J/S in de soorten <c3/>, <c4/> en interop (de toon van het meegeleverde voorbeeld <c5/>: { "17.98" } dB-Hz uit de tabel, was { "19.74" }). De Q van breedband blijft { "1.0" } (conservatief, ongeveer { "3" } dB onder het leerboek-~{ "2" }) in afwachting van de beoordeling van { "0.34" }. Stel <c6/> in om de oude { "1.5" } te behouden.

seg-99fab1936170 = <b>Integeruitvoer van <c1/> gebruikt het integerbereik.</b> Met ruis van eenheidsvermogen en een schrijverschaal van { "1" } kwamen scènes in <c2/>/<c3/> uit op ongeveer { "{" }-1, { "0" }, { "1" }{ "}" } en lagen bij scènes met 2 bits de drempels op { "2.8" } sigma. Integerformaten worden nu zo geschaald dat de verwachte RMS per component een kwart van de volle schaal is ({ "31.75" } LSB in ci8, { "8191.75" } in ci16) of { "2" } LSB bij 2 bits. De schaal en het aantal afgekapte elementen worden afgedrukt en naar het sidecarbestand geschreven. Floatuitvoer is ongewijzigd.

seg-696109ae70f8 = <b>Acht fixturepins in zeven testbestanden falen op macOS niet meer door verschillen in het laatste bit</b> (onderdeel van issue #36). De pins die controleren dat de engine de vastgelegde invoer van een onafhankelijke referentie (Jacobianen, een toestandstabel, lanceerazimuts) nog steeds opbouwt, vergeleken bit voor bit en faalden op macOS arm64 met { "2" } tot enkele duizenden eenheden in de laatste plaats. Ze vergelijken nu binnen { "1e-12" } van een schaal uit de fixture; gehele getallen, sleutels en lengtes worden nog exact vergeleken, en een mutatietest toont dat een relatieve wijziging van { "1e-6" } nog steeds faalt. De pin voor het lanceerazimut vergelijkt <c1/> en de stijgende/dalende tak in plaats van het azimut zelf, omdat <c2/> één ulp van zijn argument versterkt tot ongeveer { "3e-9" } rad waar een inclinatie gelijk is aan de colatitude van een locatie. Er is geen tolerantie van een onafhankelijke referentie of vooraf vastgelegde drempel gewijzigd. Twee tests (lunaire gezamenlijke baanbepaling, lunaire waarneembaarheid) vallen er niet onder: op macOS verschuiven hun vooraf vastgelegde vergelijkingen zelf, en dat wordt aan een vervolg overgelaten.

seg-b6c354fa0c28 = <b><c1/> en <c2/> passen de front-endvlaggen toe.</b> De gebruikstekst adverteerde <c3/>/<c4/>/<c5/>/<c6/>/<c7/>/<c8/> bij <c9/>, maar <c10/> en <c11/> bouwden de keten nooit op: de vlaggen werden stilzwijgend genegeerd, en een vlag zonder waarde zoals <c12/> slikte de vlag erna in. Beide opdrachten verwerken ze nu zoals <c13/> dat doet en plaatsen een verse front-endketen vóór de acquisitieronde en de trackingronde. De uitvoer is gelijk aan het uitvoeren van de opdracht op het bestand dat <c14/> voor dezelfde vlaggen schrijft.

seg-d7238dab610e = IQ-scènedata wordt per signaal geplaatst.

seg-46ace9a3e008 = <c1/> (en <c2/>) zetten bits van { "50" } bit/s op elk signaal, pilots inbegrepen, en op Galileo en BeiDou met de GPS-LNAV-snelheid. Data volgt nu de eigen symbooltiming van elk signaal, vastgelegd door de nieuwe <c3/> (<c4/>, ingesteld door elke constructor in <c5/>). Dat is { "10" } ms bij L5-I5, { "4" } ms bij E1-B, { "2" } ms bij BeiDou B1I GEO (D2), en bits van { "20" } ms met een meander van { "10" } ms bij GLONASS L1OF. Data wordt geweigerd op pilots, op GPS L2C als één CM/CL-stroom, en <c6/> op alles behalve L1 C/A. Eigen codes behouden standaard de vorige timing van { "20" } ms. Een programmatische <c7/> die <c8/> vroeg op een andere code dan L1 C/A, of <c9/> op een pilot, genereerde vroeger stilzwijgend en geeft nu bij de eerste leesbewerking een fout.

seg-9dd38fa39d14 = GLONASS L1OF-kanalen worden verworven en getrackt op hun eigen FDMA-draaggolf.

seg-a775751ed6f6 = <c1/> en de trackingkanalen mixten elke code alleen vanaf <c2/> naar beneden. In een GLONASS-opname met meerdere kanalen vond een zoekactie naar kanaal +{ "3" } daarom het signaal van kanaal { "0" } (alle kanalen delen één rangingcode) en keek nooit { "1.6875" } MHz hoger. Beide gebruiken nu <c3/>. De draaggolfterm is nul voor elke opname die op de eigen draaggolf van het signaal is gecentreerd en wordt weggelaten wanneer het midden onbekend is, zodat CDMA-verwerking ongewijzigd is. Als u het oude gedrag hebt omzeild door <c4/> in de <c5/> van het sidecarbestand te verwerken, verwijder die term dan: de offset wordt nu toegepast vanuit de draaggolf en het midden, dus laten staan past hem tweemaal toe. Bekende beperking, hier ongewijzigd: een GLONASS-scène identificeert elke satelliet aan de hand van zijn frequentiekanaal <c6/>, en de satelliet-id van <c7/> laat een negatief kanaal omslaan. Het truth-sidecarbestand schrijft <c8/> als <c9/> { "4294967289" } (<c10/>). Lees het terug als <c11/> met een cast naar <c12/>.

seg-1c88bffc605b = <b>GNSS-IQ-laag op de CLI en in Python ({ "0.32.0" } Phase A).</b> De bestaande module <c1/> is nu bruikbaar zonder Rust te schrijven. Vijf nieuwe opdrachten van <c2/> voegen zich bij de groep voor gegevensverwerking: <c3/> genereert een lange IQ-scène met meerdere satellieten naar een bestand met een truth-sidecarbestand; <c4/> voert FFT-acquisitie van een of meer PRN's uit over een opname en rapporteert elke detectie (PRN, Doppler, codefase, statistiek, drempel); <c5/> verwerft en laat dan de DLL/PLL/FLL-bank over een opname lopen en geeft tracking-uitvoer per epoch (CSV/JSON) met instelbare lusbandbreedtes, integratietijd en correlatorafstand; <c6/> speelt één opname af over meerdere lusontwerpen en rapporteert de resulterende jitter- en lockmaten per ontwerp; en <c7/> fit het model voor verlies van lock van de trackinglus aan een tijdlijn van ontvangervertrouwen. Dezelfde kern is beschikbaar in Python (<c8/>, <c9/>, <c10/>, <c11/>, <c12/>), met NumPy-vriendelijke lijsten en dicts als resultaat. Alleen software en additief: geen nieuwe afhankelijkheden, geen zenden, geen synthese van interferentie- of spoofingsignalen; de engine, acquisitie, tracking en lusontwerpen zijn die van de crate zelf, zodat een CLI- of Python-aanroeper dezelfde bits krijgt als de Rust-tests. Nieuwe module <c13/>; het eigen truth-sidecarbestand van de scène is de onafhankelijke referentie in <c14/> (acquisitie herstelt elke geïnjecteerde codefase en Doppler, tracking convergeert naar de geïnjecteerde Doppler). Er verandert geen gepubliceerd aantal scenariosoorten of rij van de verificatiematrix.

seg-1971e3e9cfe6 = <b>Resterende mogelijkheden van de GNSS-IQ-bibliotheek op de CLI van <c1/> en in Python ({ "0.32.0" } Phase A.2).</b> Bouwt voort op Phase A en ontsluit de rest van de laag <c2/> zonder Rust te schrijven:

seg-67c485097357 = <b>Propagatiekanaal op <c1/></b> (en de Python-functie <c2/>): een eerste-orde ionosfeer (<c3/>/<c4/> of <c5/>), de Saastamoinen/Niell-troposfeer (<c6/>), het Cornell-scintillatiemodel (<c7/>, <c8/>, <c9/>), spiegelend multipath via de grond (<c10/>/<c11/>), het land-mobiele kanaal met drie toestanden (<c12/>) en een blok zonder zichtlijn (<c13/>) werken op elke satelliet via een nieuwe crate-interne brug (<c14/>) die de absolute paden van de kanaalmodellen omzet naar de vorm van de scène, namelijk het overschot boven de geometrie.

seg-d736671f2251 = <b>SigMF-uitvoer op <c1/></b> (<c2/>): schrijft de samples als een paar <c3/>/<c4/> met een capture en annotaties per satelliet; <c5/>/<c6/> lezen SigMF al, zodat een scène een round trip maakt.

seg-c59ae97779ae = <b>Front-end-DSP</b>: een nieuwe opdracht <c1/> en dezelfde vlaggen op <c2/>/<c3/> (<c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/> 1/2/3/8/14) draaien de trappen van <c10/> (bandpass-FIR, adaptieve notch, pulsblanking, excisie in het frequentiedomein, AGC, kwantisator); in Python gespiegeld als <c11/>.

seg-878d66b73571 = <b>Scènes met broadcast-efemeride</b>: <c1/> (met <c2/>/<c3/>/<c4/>) plaatst elke gezonde GPS-satelliet op zijn ware broadcastgeometrie met de RINEX-lezer van de engine, zodat het truth-sidecarbestand de werkelijke afstand, Doppler en codefase per satelliet bevat; in Python gespiegeld als <c5/>. Alleen software en additief: geen nieuwe afhankelijkheden, geen zenden, geen synthese van interferentie- of spoofingsignalen (kanaalpropagatie-effecten werken alleen op het legitieme signaal). Elke numerieke bewering wordt getoetst aan een onafhankelijke referentie (gesloten vorm of geïnjecteerde referentie) in de unittests van kanaal en front-end en in <c6/>.

seg-1e71370d87d8 = <b>GNSS-IQ-laag: simulatie op signaalniveau en softwareontvangerverwerking.</b> Een nieuwe module <c1/> tilt Kshana van een front-end voor één satelliet en korte blokken op L1 C/A naar een volledige laag op signaalniveau, bereikbaar via de opdrachtgroep <c2/>. Ze genereert lange ruwe IQ-scènes met meerdere satellieten met een truth-sidecarbestand per epoch (<c3/>); past propagatie toe op signaalniveau, namelijk ionosfeer met code-draaggolfdivergentie, troposfeer, amplitude- en fasescintillatie (Cornell-model), Fresnel-multipath en een land-mobiel kanaal met drie toestanden, met non-line-of-sight (<c4/>); verwerft en trackt met FFT-acquisitie en een DLL/PLL/FLL-bank met meerdere kanalen, waarbij één opname door veel lusontwerpen wordt afgespeeld (<c5/>, <c6/>); modelleert de front-end, met FIR/IIR-filtering, kwantisering van 1 tot 14 bits, AGC, notch, pulsblanking en excisie in het frequentiedomein (<c7/>); streamt grote opgenomen datasets met begrensd geheugen, met int8-, int16-, float32-, gepakte 2-bits- en echte-IF-formaten, SigMF met meerdere bestanden, resampling, een datasetinventaris met SHA-256 per bestand en een batchrunner (<c8/>); voegt spreidingscodes toe voor GPS L5/L2C, Galileo E1 (CBOC, echte ICD-geheugencodes) en E5a, BeiDou B1C/B1I en GLONASS L1OF, elk getoetst aan zijn interface control document (<c9/>); en fit het model voor verlies van lock van de trackinglus aan het waargenomen gedrag van een echte ontvanger in labruns, met hold-outfout waarbij één run wordt weggelaten en extrapolatie gelabeld als voorspelling (<c10/>). Elke numerieke bewering wordt getoetst aan een onafhankelijke referentie (een ICD-tabel, een gesloten vorm, of een onafhankelijke ontvanger die de geïnjecteerde referentie herstelt); de fysieke kanaal- en lusmodellen blijven MODELLED. Dit is alleen een softwarelaag: ze schrijft IQ-bestanden voor softwareontvangers en synthetiseert geen interferentie- of spoofingsignalen en stuurt geen radiohardware aan. Er verandert geen gepubliceerd aantal scenariosoorten of rij van de verificatiematrix. Ontwerp: <c11/>.

seg-943e21ccb25f = Ontvangervertrouwen: een log van een echte GNSS-ontvanger beoordelen.

seg-f8274120bff2 = <c1/> leest een u-blox-UBX-, RINEX { "3" }- (met een optioneel broadcast-navigatiebestand), Android GnssLogger- of NMEA { "0183" }-log in tot één tijdgetagde tijdlijn en laat er vertrouwensmonitors op draaien: daling van de draaggolf-ruisdichtheid (C/N0), verlies van lock, automatische versterkingsregeling (AGC), de jamming-indicator van u-blox, positiesprong en, met RINEX en navigatie, de eigen positiebepaling met één punt van de engine met parity-RAIM (receiver autonomous integrity monitoring) en de klokondersteunde monitor. Elke epoch is nominaal, degraded of untrusted, en het resultaat zegt wanneer en waarom. Gebeurtenissen en voorspelde C/N0-dalingen die in het scenario zijn vermeld, worden gescoord tegen toleranties die in hetzelfde bestand staan: gedetecteerd, te laat of gemist, en overeenkomend of afwijkend. De uitvoer bestaat uit de resultaat-JSON, een CSV per epoch en een grafiek; het resultaat bevat de SHA-256 van de log en elke drempel. Ook bereikbaar vanuit Python (<c2/>), het WebAssembly-pakket (<c3/>, logs inline) en de nieuwe tool <c4/> van de Model Context Protocol-server (MCP). Gids: <c5/>; voorbeeld: <c6/>. Op de spoofinglogs van JammerTest { "2024" } reproduceert het enginepad het eerste alarm van de vooraf vastgelegde pijplijn van de onafhankelijke referentie bij elk gepubliceerd begin (<c7/>). De monitors blijven MODELLED; er verandert geen rij van de verificatiematrix.

seg-55669fe92932 = Een minor release. Validatieronden { "2" } en wave-1-pakketten brengen de verificatiematrix van { "223" } rijen ({ "93" } VALIDATED) bij { "0.29.3" } naar { "249" } rijen ({ "123" } VALIDATED, { "122" } MODELLED, { "4" } PARTNER); elke promotie is getoetst aan een onafhankelijke referentie met een tolerantie die vóór de run is vastgelegd, en elke afwijking wordt als bevinding gepubliceerd. Nieuw: een native NAIF-kernellezer en DE440-pad, één onafhankelijk getoetst pad voor SGP4-naar-ITRS-propagatie en tijd, een gemeten klokbibliotheek, een LunaNet AFS-referentiegenerator, oplossers met uitgebreide precisie en square-root information, en echte lunaire IQ-verwerking op LuGRE-data. Gepubliceerde getallen die zijn verschoven staan hieronder als revisies.

seg-f75f1878045e = Zevenentwintig rijen van de verificatiematrix worden VALIDATED nadat een onafhankelijke referentie overeenstemde binnen een tolerantie die vóór de eerste vergelijking was vastgelegd (de promotieregel in <c1/>): tien in een eerste validatieronde en zeventien in een tweede. Eenenvijftig MODELLED-rijen zijn in de eerste ronde aan een externe onafhankelijke referentie voorgelegd en de overige routeerbare rijen in de tweede; elke afwijking wordt hieronder als bevinding vastgelegd in plaats van weggeregeld. Drie rijen zijn gesplitst zodat een onafhankelijk getoetst deel geen niet-getoetste rest meedraagt, waardoor de matrix van { "223" } naar { "226" } rijen gaat; de sindsdien ingevoegde validatiepakketten brengen haar op { "249" }. De aantallen zijn gelezen uit de gegenereerde <c2/>.

seg-8d542741fa77 = na ronde { "1" }

seg-ae3743f976c5 = Rijen van de verificatiematrix

seg-6c4b1fd56a31 = waarvan VALIDATED tegen een externe onafhankelijke referentie

seg-90450fe87280 = waarvan MODELLED

seg-86972e4c7f12 = waarvan PARTNER

seg-61c5c5e308ed = Afkortingen in deze vermelding

seg-5907283b71da = Afkorting

seg-47e2e7d1a000 = ADD, ARAIM, MAAST

seg-0306daa1107f = Airborne Design Document (van ARAIM); advanced receiver autonomous integrity monitoring; de Matlab Algorithm Availability Simulation Tool van Stanford University

seg-f031f12836be = ADEV, VRW, ARW

seg-b32744d6f0c2 = Allan-deviatie; velocity random walk (snelheidsrandomwalk); angle random walk (hoekrandomwalk)

seg-1ac4ba7a2248 = ANISE, SPICE, NAIF, PCK

seg-d10345f7bfab = een opensource-toolkit voor astrodynamica (Nyx Space); de toolkit Spacecraft, Planet, Instrument, C-matrix, Events van NASA, afkomstig van de Navigation and Ancillary Information Facility; kernel met planetaire constanten

seg-0789b1b8dba2 = BCRS, TDB, TT

seg-584e509c80a5 = Barycentric Celestial Reference System; Barycentric Dynamical Time; Terrestrial Time

seg-f03148ef3497 = BIPM, UTC(k)

seg-d6e01fbf4f10 = Internationaal Bureau voor Maten en Gewichten; de realisatie van gecoördineerde wereldtijd (UTC) door een laboratorium

seg-b65c854d8938 = CCSDS, OEM, LTC, TCL

seg-77879f30c86d = Consultative Committee for Space Data Systems; Orbit Ephemeris Message; lunaire tijdsystemen die in het veld TIME_SYSTEM van het bericht staan

seg-bed3cea7e74f = CRLB

seg-525ebb08f4bc = Cramér–Rao-ondergrens

seg-a1fff77503b4 = CW

seg-064470740a35 = relatieve beweging volgens Clohessy–Wiltshire

seg-d70a9b3e92a7 = Development Ephemeris { "440" } van het Jet Propulsion Laboratory

seg-6f6e14685742 = DOP, PDOP

seg-08aad29b6845 = dilution of precision; position dilution of precision

seg-85eeed633f45 = EKF, UKF, INS, GNSS, IMU

seg-e9ecdbb0f600 = extended Kalman filter; unscented Kalman filter; inertiaal navigatiesysteem; globaal navigatiesatellietsysteem; inertiële meeteenheid

seg-86765c7a6bbf = EMT, VPL, HPL

seg-23029e0ceed2 = effective monitor threshold; verticaal en horizontaal beschermingsniveau

seg-27786c406107 = EOP, IERS, PCC, MAE

seg-9d0a1a9fdebc = aardoriëntatieparameters; International Earth Rotation and Reference Systems Service; Prediction Comparison Campaign; gemiddelde absolute fout

seg-1508f3d3a180 = ERFA, SOFA

seg-0b7d6f08efe2 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy

seg-900c7c7e99cd = GMAT

seg-0382d12eabc8 = de General Mission Analysis Tool van NASA

seg-025aec0f5e29 = NTN, SSB

seg-183dca4a747b = niet-terrestrisch netwerk (3GPP); synchronisatiesignaalblok

seg-dcf507ba6e56 = IGS, ILRS, ITRF2020

seg-9cebc1f9338d = International GNSS Service; International Laser Ranging Service; International Terrestrial Reference Frame { "2020" }

seg-eaca07ff8609 = ILS, LAMBDA

seg-b3cb3e6ea499 = geheeltallige kleinste kwadraten; Least-squares AMBiguity Decorrelation Adjustment

seg-c730f9c69d6e = ISB

seg-ef9ba270513c = bias tussen systemen

seg-743c3303e01c = LEO

seg-d7b83e7c427f = lage aardbaan

seg-1f76fe708934 = MHSS, PL, TPL

seg-a93515a6ff89 = multiple-hypothesis solution separation; beschermingsniveau; beschermingsniveau voor tijdsynchronisatie

seg-9e93c8223a11 = PSD, IQ, SigMF

seg-67248a79ac93 = vermogensspectrale dichtheid; in-fase- en quadratuursamples; Signal Metadata Format

seg-7dabf60fd17e = QPN

seg-dae80c23262e = quantumprojectieruis

seg-3ab6fb5e9394 = RAIM

seg-ebda65a9a20f = receiver autonomous integrity monitoring

seg-224d7dfd2b05 = SBAS, WAAS, DFMC, GEO

seg-1aeedd26b9cd = satellietgebaseerd augmentatiesysteem; het Amerikaanse Wide Area Augmentation System; dubbelfrequent met meerdere constellaties; een geostationaire SBAS-satelliet

seg-eabf9641678b = RMS, SISRE

seg-50a677b8e972 = kwadratisch gemiddelde; afstandsfout van het signaal in de ruimte

seg-430b3c681347 = RTKLIB

seg-3e75054c0034 = een opensource-bibliotheek voor GNSS-positiebepaling

seg-051a168f774c = TCXO

seg-ba5d469b1c66 = VLBI

seg-264e9e51b8f8 = interferometrie met zeer lange basislijn

seg-c3bc7d828ecc = Elke rij hieronder noemt haar soort onafhankelijke referentie (Library: een onafhankelijke bibliotheek van derden die een eenduidig gedefinieerde grootheid berekent; Measured: echte gemeten data; P2: een onafhankelijke numerieke bibliotheek die een lineaire-algebragrootheid op vastgelegde invoer herberekent), de onafhankelijke referentie, de tolerantie die vóór de run is vastgelegd, en het resultaat. Elke promotie is opnieuw uitgevoerd door een tweede beoordelaar, die de fixture byte voor byte opnieuw genereerde en aantoonde dat een bewuste mutatie van de engine de test rood maakt.

seg-be0a4e3ac81c = <b>GNSS/INS-sensorfusie</b> (Library), beperkt tot het losgekoppelde EKF met 15 foutentoestanden: NaveGo v1.4 (LGPL-3.0, uitgevoerd onder GNU Octave) op zijn eigen echte Ekinox IMU/GNSS-rit. De RMS van Kshana voor horizontaal, verticaal en positie-innovatie is { "0.912" }, { "0.940" } en { "0.861" } van die van NaveGo (drempel { "1.2" }) en zijn gemiddelde genormaliseerde innovatie is { "0.395" } (drempel { "1.5" }). GNSS is gedurende de hele rit aanwezig, zodat geen uitval is getest. Het strak gekoppelde UKF en het gekoppelde klokfilter vallen buiten de bewering.

seg-0c82afd5ba30 = <b>3-DOF-attitude en foutbudget voor richting</b> (Library), beperkt tot de piek van het zwaartekrachtgradiënt-koppel: Basilisk { "2.9.1" } GravityGradientEffector, { "40" } gevallen, binnen { "1e-12" } relatief (slechtste { "2.1e-15" }). Het RSS-richtbudget is een som van door de aanroeper geleverde getallen en valt erbuiten.

seg-71cf58e91a09 = <b>Lunaire gezamenlijke geometrie voor communicatie en navigatie</b> (Library), beperkt tot locatieplaatsing, azimut, elevatie en afstand: ANISE { "0.10.2" }, { "768" } samples, binnen { "1e-6" } graad en { "1" } mm (slechtste { "2.2e-12" } graad en { "5.6e-9" } m). De parameter voor rangingnauwkeurigheid is een ontwerpinvoer buiten de bewering.

seg-0687c757231b = <b>Krachtvrije attitudedynamica van een star lichaam</b> (Library): de Basilisk { "2.9.1" }-ruimtevaartuighub, { "1e4" } s op twee algemene traagheden, quaternion en rates binnen { "1e-9" } (slechtste { "3.3e-11" } en { "3.4e-12" } rad/s).

seg-d8c3f8cc65ac = <b>Oplossing van geheeltallige ambiguïteit van de GNSS-draaggolffase (LAMBDA)</b> (Library), beperkt tot de ILS-oplossing en haar twee beste normen: RTKLIB v2.4.2-p13 <c1/>, { "300" } covarianties, { "0" } geheeltallige afwijkingen, normen binnen { "1e-9" } relatief (slechtste { "5.6e-13" }). Het bootstrapped succespercentage blijft alleen intern gecontroleerd.

seg-c23196cbdc96 = <b>Samengesteld PL voor tijdsynchronisatie, scalaire MHSS</b> (P2): numpy { "2.3.5" } en scipy { "1.18.1" } op { "300" } vastgelegde invoeren, PL binnen { "1e-9" } relatief (slechtste { "1.2e-10" }), aandrijvende deelverzameling identiek.

seg-8f524d815949 = <b>GLS-whitening van common mode en de Mahalanobis-identiteit</b> (P2): numpy { "2.3.5" } LAPACK op { "201" } vastgelegde covarianties, binnen { "1e-12" } relatief (slechtste { "7.9e-16" }); conditiegetallen tot { "19.3" }.

seg-b4136cdb8a98 = <b>DE440-leverancier van de lunaire hoofdasoriëntatie</b> (Library): SPICE <c1/> op de binaire PCK bij { "2 000" } epochs buiten de knooppunten, binnen { "1.7e-5" } rad (slechtste { "1.7e-6" } rad, ongeveer { "3" } m aan het oppervlak), na de fix die onder "Fixed" staat.

seg-c28de00a491c = <b>SigMF-opname als invoer en uitvoer, en Welch-spectra</b> (Library), beperkt tot lezen en schrijven van SigMF en <c1/>: scipy { "1.18.1" } <c2/> binnen { "1e-12" } relatief per bin (slechtste { "6.0e-14" }); sigmf-python { "1.13.0" }-opnamen bit voor bit identiek gedecodeerd; de metadata van de crate geldig tegen het SigMF { "v1.2.6" }-schema. IQ-synthese en haar modelvergelijkingen vallen erbuiten.

seg-a7756d2e124a = <b>LEO-fitter voor broadcast-efemeride en SISRE tegenover fitinterval</b> (Measured), beperkt tot de Kepler-fit met 16 parameters en haar SISRE die alleen de baan omvat: precieze ITSG-banen van TU Graz van vier satellieten tegenover de statistieken van Liu et al. { "2025" }, componenten binnen 1.5x ({ "0.804" } tot { "1.087" }) en SISRE binnen 1.5x ({ "0.716" } tot { "0.809" }).

seg-99debd58724a = Bevindingen

seg-3f5b2f54c7bf = De onafhankelijke referentie week af van deze rijen, dus ze blijven MODELLED. Elke bevinding is ook in de referentietekst van de rij geschreven (en dus in <c1/>), met een test die haar vastzet.

seg-e28fac875d8c = <b>Schatting van de klokstaat aan boord:</b> op achtergehouden IGS-klokken van { "11" } GPS Block IIF-satellieten is het filter met drie toestanden één stap vooruit consistent maar overmoedig na een uur bij { "9" } van { "11" } (periodieke en flickertermen zitten niet in het model).

seg-5900ce454dc7 = <b>Spoofingdetectie:</b> bij JammerTest { "2024" } sloeg geen enkele monitor op waarnemingsniveau alarm binnen { "10" } s na een van de { "8" } gepubliceerde begintijden, en drie vensters vóór het begin bevatten valse alarmen.

seg-08b6e6aa7d08 = <b>Beschermingsniveau voor tijdsynchronisatie onder spoofing:</b> de gemeten niet-gedetecteerde tijdfout overschrijdt het TPL bij { "3" } van { "8" } gedetecteerde begintijden (1.9x tot 5.3x); een klokkalibratie van { "60" } s dekt de wander van de TCXO van de ontvanger niet.

seg-a2f4df11d9cc = <b>Geometrie van lanceervenster en stijgfase:</b> tegenover Orekit { "12.2" } komt de geometrie op afrondingen overeen, maar de locatiesnelheid door aardrotatie mist { "1e-6" } relatief op { "62.9" } graden breedte ({ "1.12e-6" }, de poolbeweging die het sferische model weglaat). Ronde { "2" }: de snelheid met ware pool en een epoch komt overeen, de standaardsnelheid zonder epoch mist nog steeds (zie hieronder).

seg-f6b6c9251a17 = <b>Ballistische reentry-corridor (Allen–Eggers):</b> de voorspelde piekvertraging voor de Stardust-entry is { "61.8" } g tegenover de gereconstrueerde { "32.89" } g (+{ "88" } %, tolerantie { "15" } %).

seg-5d83648dd867 = <b>Gezamenlijke fout in UT1 en poolbeweging:</b> tegenover de nauwkeurigheidsformule die in { "178" } nummers van IERS Bulletin A is gedrukt, komt de pool binnen 1.5x overeen maar UT1 niet ({ "0.48" } bij { "10" } dagen, { "1.59" } bij { "40" } dagen). Achterhaald in ronde { "2" }: de rij is nu VALIDATED (zie hieronder).

seg-e3336e670d51 = Een patchrelease op { "0.29.2" }. Kshana Studio is herbouwd rond twee weergaven: een eenvoudige weergave die eerst antwoord geeft en in gewone woorden uitlegt, en een geavanceerde weergave met het volledige dashboard. Er horen twee kleine fixes op kshana.dev bij. De engine verandert niet: elk meegeleverd scenario geeft een byte-identiek resultaat aan { "0.29.2" }, afgezien van de versiestempel.

seg-c40ab967ace6 = <b>Kshana Studio heeft een eenvoudige weergave.</b> Daarmee opent de Studio.

seg-6a5ae001d00e = Het antwoord komt eerst: een scenario opent met zijn resultaat, in één gewone zin. Elk meegeleverd scenario heeft een eigen zin, geschreven voor wat dat scenario meet.

seg-375421534e4c = Er zijn hooguit vijf instellingen zichtbaar, die het antwoord het meest veranderen. De rest staat onder "Geavanceerde instellingen", ingeklapt tot u ze opent.

seg-d8650ae64549 = "Hoe dit wordt berekend" legt de methode in een paar regels uit, en "Voor onderzoekers" geeft de eigen cijfers van de engine, het scenariobestand en het bewijs achter het resultaat.

seg-36af7640e6ad = <b>Het volledige dashboard is de geavanceerde weergave.</b> Elk paneel, elke grafiek, export en elk rapport van de eerdere Studio is daar te vinden.

seg-0428d0a7921b = <b>Een schakelaar wisselt tussen de twee weergaven en behoudt uw plaats.</b> Het scenario, de weergave waarin u was en de instellingen die u hebt aangepast gaan mee. De Studio onthoudt welke weergave u het laatst gebruikte. Links vanaf de site en de documentatie openen de eenvoudige weergave; een link met <c1/> opent de geavanceerde weergave, en elke eerdere Studio-link opent nog steeds hetzelfde scenario en dezelfde weergave.

seg-2c98ed084c10 = <b>Een snellere eerste weergave bij trage verbindingen.</b> Het vastgelegde antwoord voor een scenario wordt getekend voordat de rest van de Studio laadt, zodat het antwoord op een trage mobiele verbinding in ongeveer twee seconden verschijnt in plaats van in ongeveer negen.

seg-2214d2dcfab4 = <b>Betere zoekfunctie.</b> Een zoekopdracht toont nu eerst scenario's waarvan het gebied of de titel overeenkomt met de woorden, vóór scenario's die ze alleen in de bestandsnaam of de tekst noemen.

seg-aa8d43280c19 = <b>De globe op de startpagina wordt niet meer leeg als verminderde beweging aanstaat.</b> Als de systeeminstelling voor verminderde beweging aanstond, kon het vergroten of verkleinen van het venster de globe in de hero leeg laten tot de pagina scrolde. De globe wordt nu in hetzelfde frame als de grootteverandering opnieuw getekend.

seg-da4b78816df1 = <b>De L-bandconsole op de startpagina legt uit waarom haar band leeg is.</b> In "Watch a jammer take the band" bleef het GPS L5 / Galileo E5a-paneel de hele minuut donker, wat er stuk uitzag. In dit scenario zendt geen jammer in die band uit en liggen de satellietsignalen onder de ruisvloer, dus er komt daar niets bovenuit. Een rustig label zegt dat nu in elk paneelstuk waarin niets boven de vloer uitkomt (het L5 / E5a-paneel, en het L2C-paneel voordat zijn ruisjammer begint), met per band de C/N0 en de lock-status uit dezelfde run. Het wordt alleen geplaatst waar niets boven de vloer uitkomt, zodat het nooit jammerenergie bedekt.

seg-e353fdee7033 = Een patchrelease op { "0.29.1" }. Ze verwijdert gedupliceerde code in de LEO-navigatieboodschap-, fusie- en spectrummodules, voegt een licht thema toe aan kshana.dev, verplaatst Kshana Studio naar een eigen adres, maakt de site leesbaar voor zoekmachines en AI-assistenten, verhelpt enkele kleine zaken in de Studio en laat npm-releases publiceren zonder opgeslagen token. Er verandert geen engine-uitvoer: elk meegeleverd scenario geeft een byte-identiek resultaat aan { "0.29.1" }, afgezien van de versiestempel.

seg-e8bf0a4fdc35 = <b>Een licht thema voor kshana.dev.</b> Elke pagina kan licht of donker worden gelezen. De site volgt de systeeminstelling van de lezer en heeft een schakelaar om die te wijzigen.

seg-8e7cabc14c40 = <b>Zoekmachines en AI-assistenten kunnen de site lezen.</b> Elke pagina heeft nu een eigen titel, beschrijving, canoniek adres, social-cardtags en gestructureerde schema.org-gegevens, plus platte tekst voor de secties die een script tekent. De site publiceert <c1/>, een <c2/> met de datum waarop elke pagina voor het laatst veranderde, <c3/> en <c4/> (een korte en een volledige platte-tekstgids voor AI-assistenten), en een IndexNow-sleutel zodat een deploy zoekmachines kan laten weten wat er veranderd is.

seg-804ba71be9ed = <b>npm-releases kunnen publiceren zonder opgeslagen token.</b> De npm-job draait nu Node { "24" } en npm { "11.5.1" } of nieuwer, die npm trusted publishing ondersteunen: npm wisselt de GitHub-identiteit van de releasejob in voor een kortlevende inloggegevensset. Het geheim <c1/> werkt nog steeds en wordt gebruikt zolang het is ingesteld, dus er verandert niets totdat trusted publishing voor het pakket op npmjs.com is ingeschakeld. <c2/> noemt de stappen.

seg-81405e5a5e06 = <b>De kop op de startpagina is leesbaar boven de globe.</b> Achter de kop en zijn tekst ligt nu een zachte schaduw, die de baanlijnen en satellietpunten van de geanimeerde globe vervaagt waar ze de kop kruisen.

seg-24b8363acc14 = <b>Kshana Studio heeft een eigen adres: <a1>https://kshana.dev/studio/</a1>.</b> Elke link op de site en in de documentatie wijst daarheen. Het oude adres, <c1/>, werkt nog steeds en stuurt door naar het nieuwe, met behoud van het scenario, de weergave en andere instellingen in de link.

seg-12f223b986bd = <b>Studio-fixes.</b> Het enginebestand wordt eenmaal gedownload in plaats van tweemaal. Tijdens het downloaden toont de Studio meteen het vastgelegde resultaat van het scenario, als vastgelegd gemarkeerd, in plaats van een leeg scherm. Op een telefoon is de header één compacte rij. De kerncijfers lopen door met twee per rij, zodat er geen buiten beeld valt. Veldlabels gebruiken de eigen woorden van het scenario, met de veldnaam ernaast, en de zoekfunctie vindt velden op beide.

seg-c130d8a4dc5e = <b>Minder gedupliceerde code.</b> De eenhedentabel van de LEO-navigatieboodschap schreef dezelfde tien SISRE-statistiekrijen voor vier fitsamenvattingen. Een macro schrijft ze nu eenmaal. De twee spectrum-waterfallgrafieken delen één tijdas, kleurenbalk en C/N0-balkpaneel. De downsampling van het hoofdraster hergebruikt <c1/>, en de Simpson-integraal hergebruikt <c2/>. De twee ingangen van het LEO-passagetype delen één setupstap. <c3/> importeert de vectorhulpfuncties van <c4/> in plaats van ze te kopiëren. Het geavanceerde rapport importeert de HTML-escape van het API-rapport in plaats van die te kopiëren. Elk van de { "139" } scenariobestanden in <c5/> is uitgevoerd op { "0.29.1" } en op deze code, en elk uitvoerbestand is byte-identiek.

seg-166b0435c96f = <b>De eenhedentabellen van leo-navmsg en leo-pvt hebben eigen bestanden.</b> Ze zijn verplaatst uit modules die ook logica bevatten, naar <c1/> en <c2/>. <c3/> behoudt zijn publieke pad. Alleen deze twee tabelbestanden worden toegevoegd aan de uitzonderingen op copy-paste-detectie voor declaratieve catalogi in <c4/>, die <c5/> controleert.

seg-f8b372e08ef9 = <b>De CI-badge van de README toont het resultaat van pushes naar main.</b> De badge telde runs van elke gebeurtenis op main, zodat hij "failing" kon tonen terwijl elke push-run groen was; hij vraagt nu alleen om push-runs (<c1/>).

seg-7c41a482c7d8 = Een patchrelease op { "0.29.0" }: het gemeten dekkingscijfer, de naamregel van het project op kshana.dev, een snellere dekkingsjob en een vernieuwde README. Er verandert geen engine-uitvoer: elk scenario geeft hetzelfde resultaat als op { "0.29.0" }.

seg-997490bd1696 = Herzieningen van gepubliceerde cijfers

seg-ed4b071e4bd9 = <b>Regeldekking: ~{ "96" } % → ~{ "95" } %.</b> De dekkingsjob heeft de uitgebrachte { "0.29.0" }-code opnieuw gemeten (commit <c1/>, CI-run { "36809850252" }, 2026-10-01): <c2/>, { "55,970" } van { "58,697" } regels van <c3/>. Het gepubliceerde cijfer was { "95.63" } % ({ "37,697" } van { "39,419" } regels), gemeten op <c4/> vóór { "0.28.0" }; het rondde af op ~{ "96" } %. Het nieuwe cijfer rondt af op ~{ "95" } %, dus elk oppervlak dat <c5/> vastzet verschuift mee: <c6/>, de README-badge, de Evidence-regel en CI-tabel, de badges van crates.io, PyPI en npm, het technische rapport en de dekkingspagina van kshana.dev. De ondergrens van { "85" } % is ongewijzigd.

seg-577baa03af04 = <b>De naamregel op kshana.dev.</b> "Kshana · क्षण · the precise instant" opent nu de hero van de startpagina en staat onder het merk in de footer van elke pagina. kshana.dev doet nog steeds geen verzoek aan een andere host: het Devanagari is een zelfgehoste subset van Noto Sans Devanagari met de drie letters van क्षण ({ "1,692" } bytes, <c1/>, met de tekst van de SIL Open Font License en zijn SHA-256 in <c2/>). <c3/> kan nu een Google Fonts-subset met <c4/> opslaan onder een inhoudsgeadresseerde bestandsnaam.

seg-35b5bc4ee466 = <b>De links van de site komen aan waar ze naar wijzen, op nette adressen.</b> Een link naar een sectie zet die sectie nu vlak onder de header, op een telefoon en op een desktop: een sectorlink bij Missies opent die sector met zijn paneel bovenaan; links bij Mogelijkheden en Edities blijven op hun plaats terwijl de grafieken erboven worden getekend; Edities voegt geen tweede headeroffset meer toe; en een link naar een ingeklapt deel van een docspagina opent dat. Elke pagina wordt gelinkt met zijn nette adres (<c1/>, <c2/>, <c3/> voor de startpagina), en de canonieke links, de sitemap en de redirects van oude adressen noemen hetzelfde; de adressen met <c4/> werken nog. Onderzoek heeft een eigen link in de header, tussen Bewijs en Ontwikkelaars, en in de footer. De docs tonen de roadmap niet meer (<c5/> blijft in de repository): de groep Project is Changelog, Licensing, Security, Contributing, Governance en Code of conduct, en de Woordenlijst is verplaatst naar Aan de slag.

seg-3da9f00f5ce6 = <b>De dekkingsjob is sneller.</b> Op { "0.29.0" } duurde hij { "143" } minuten tegen gezonde { "91" } tot

seg-85d502773367 = De fuzzer <c1/>, de oorzaak de vorige keer, nam er { "4" } van voor zijn rekening. Het meegeleverde corpus groeide van { "74" } naar { "139" } scenario's, en drie testbinaries liepen er één bestand tegelijk helemaal doorheen (<c2/> tweemaal, <c3/> en <c4/> eenmaal): samen { "37" } minuten onder dekkingsinstrumentatie, tegen { "3" } op { "0.27.2" }. Ze delen nu <c5/>, dat het werk per scenario op elke kern uitvoert en de resultaten gesorteerd teruggeeft; elk scenario en elke assertie blijft. Op een arm64-laptop, debugbuild: <c6/> duurt { "143" } s op { "14" } kernen tegen { "612" } s met <c7/> (de oude seriële doorloop).

seg-bb69dbadbc81 = <b>De README, vernieuwd.</b> Hij opent met dezelfde naamregel als de site; de screenshots van de Studio zijn opnieuw genomen uit de { "0.29.1" }-Studio, met een nieuwe van de Studio op een telefoon en zijn stapbalk onderaan; een nieuwe strook "The site" toont drie pagina's van kshana.dev uit de { "0.29.1" }-build (<c1/>, samengesteld door <c2/> en vastgelegd in <c3/>); het dekkingscijfer luidt ~{ "95" } %; en de alt-tekst van de onderzoeksfiguur, die die van de architectuurfiguur herhaalde, beschrijft nu de papers. De headerbadges zijn kleiner en korter ({ "18" } px hoog; "~{ "95" }%", "83/223", "quality", "AGPL-3.0", "zenodo.20528627"), zodat de elf op twee regels passen; elke link en alt-tekst behoudt zijn volledige betekenis.

seg-f61ef3e16884 = <b>De containerimagejob krijgt { "90" } minuten.</b> Bij { "v0.29.0" } liep de geëmuleerde linux/arm64-build van de <c1/>-image tegen de oude limiet van 45 minuten aan tijdens het compileren van zijn laatste crate, zodat de image, de MCP-registervermelding en de kanaalcontrole niet zijn gepubliceerd. De limiet is nu { "90" } minuten; de image is ongewijzigd.

seg-1688bf9f0fec = <b>Acht float-literals anders gegroepeerd</b> in <c1/> en <c2/> (<c3/> → <c4/>): SonarQube Cloud las een laatste groep van <c5/> of <c6/> als een ontbrekend achtervoegsel <c7/> of <c8/> (regel S7454). De waarden zijn dezelfde getallen, dus elk resultaat blijft ongewijzigd.

seg-81fd160937db = Twaalf nieuwe scenariosoorten en drie nieuwe manieren om een run te lezen. De engine bestrijkt nu het radiospectrum, het hele zonnestelsel, constellaties rond elk lichaam, campagnes die scenario's tot één missie aaneenschakelen, en positiebepaling, navigatie en tijdsynchronisatie (PNT) vanuit een lage baan om de aarde (LEO), van het signaal tot de positiebepaling. Elke run kan ook worden weggeschreven als animatie, als volledig rapport en als set interoperabiliteitsbestanden voor andere hulpmiddelen.

seg-118be64d7cb2 = Rond de engine: een herontworpen kshana.dev (een site met meerdere pagina's en een nieuw Kshana Studio-dashboard dat elke mogelijkheid in de browser uitvoert), een herschreven README, veertien hulpmiddelen op de Model Context Protocol-server (MCP), een browserbuild die dezelfde getallen geeft als de native build, en een openbare pagina voor Kshana Pro.

seg-ea31356bc17d = Scenariobestanden (plus één suitemanifest)

seg-26654cd81de1 = { "138" }, waarvan { "132" } meegeleverd voor <c1/>

seg-3d1a85e93e48 = waarvan MODELLED (vermeld model, gecontroleerd op interne consistentie)

seg-e77f9d273ee1 = waarvan PARTNER (vereist hardware of gegevens van een partner)

seg-e94cd6b3561a = Waar de groei vandaan komt:

seg-1759a8cce7d6 = Soorten

seg-94de9433d99f = Scenariobestanden

seg-03d7aea335dc = Matrixrijen (getoetst + gemodelleerd)

seg-fdd674722717 = Spectrum

seg-59583fa40da3 = Zonnestelsel en positiebepaling rond elk lichaam

seg-fafa167623df = Maritieme, weg- en spoorscenario's

seg-fc571c46e522 = Animatie, rapporten, interoperabiliteitsexports

seg-2746e0d9f787 = LEO-signaalontwerpen en het multibandspectrum

seg-d40ec114d1f9 = LEO-positiebepaling, -tijdsynchronisatie en -fusie

seg-0157f649e65b = LEO-keten van begin tot eind

seg-423283112128 = LEO-veerkracht, aandachtsgebieden en eindgebruikersscenario's

seg-395beca13299 = Totaal toegevoegd

seg-ea9dc4093d8a = De LEO-mogelijkheid is systeemonafhankelijk: ze draait op generieke, vermelde parameters en heeft geen benoemd systeem nodig. Benoemde systemen zijn optionele voorinstellingen, elk in een eigen bestand met zijn openbare bron. Eén voorinstelling, Celeste IOD (in-orbit demonstration), gebruikt cijfers die zijn gepresenteerd op de ESA NAVISP LEO-PNT-workshop, { "2026" } (ESA is het Europees Ruimteagentschap; NAVISP is het Navigation Innovation and Support Programme); ze staat in één bestand, <c1/>, met haar vijf scenario's die alleen in de repository staan, zodat ze zonder broncodewijziging kan worden achtergehouden, en geen van haar workshopcijfers wordt in deze changelog herhaald.

seg-c36a5015c03c = <b>Lees "Herzieningen van gepubliceerde cijfers" voordat u upgradet.</b> Eén engine-uitvoer verandert (de kolommen in het inertiaalstelsel van de soort <c1/>, na een tekenfix in de nutatiematrix), en de documentatie-audit heeft cijfers gecorrigeerd die eerdere documenten hadden afgedrukt.

seg-7fe505d3232b = Statussen: <b>VALIDATED</b> betekent gecontroleerd aan een onafhankelijke externe referentie (een gepubliceerde tabel, de software van een andere groep, of meetgegevens); <b>MODELLED</b> betekent een vermeld model dat alleen op interne consistentie is gecontroleerd; <b>PARTNER</b> betekent dat de controle hardware of gegevens van een partner vereist.

seg-ec7abb62f217 = 3GPP, 5G, NTN

seg-c5eb2d160429 = 3rd Generation Partnership Project; mobiel netwerk van de vijfde generatie; niet-terrestrisch netwerk

seg-9bb1a987fedc = AD, BC

seg-bbe2b5aa0557 = tijdrekeningen (anno Domini, voor Christus)

seg-05bbe79b1991 = AIAA

seg-c7bfdad9ae33 = American Institute of Aeronautics and Astronautics

seg-cfe05e065e19 = AltBOC, BOC, BPSK, MBOC

seg-81799e2a0c43 = alternatieve binaire offsetdraaggolf; binaire offsetdraaggolf; binaire fasesprongmodulatie; gemultiplexte binaire offsetdraaggolf (signaalmodulaties)

seg-b2d165acb4e7 = ATOMIC

seg-ffd6c68bc1b3 = Autonomous Time and Orbit Determination for Microsatellite Constellations (een gepubliceerd LEO-efemeridemodel)

seg-e2e2d80f47a5 = C/A, L1, L2, L2C, L5

seg-7f71a4795674 = coarse/acquisition-code en de namen van de draaggolven en civiele signalen van het Global Positioning System

seg-e464509f3abb = draaggolf-ruisdichtheidsverhouding

seg-d8ba917c09b8 = CIO

seg-4321532214e3 = Celestial Intermediate Origin

seg-de6c33774c9c = CLI

seg-3096eb1d5a15 = opdrachtregelinterface

seg-9aa3c2e54398 = 24-bits cyclische redundantiecontrole (Qualcomm-polynoom)

seg-1e1009e225aa = CSAC

seg-6ff440ff2c0c = CSS, HTML, SVG, XML

seg-bbe86e85e897 = Cascading Style Sheets; HyperText Markup Language; Scalable Vector Graphics; Extensible Markup Language

seg-7f781a23a5a7 = CSV, JSON, PDF, TOML, URL

seg-b4758ea40624 = door komma's gescheiden waarden; JavaScript Object Notation; Portable Document Format; Tom's Obvious Minimal Language; uniform resource locator

seg-3ad592244ea8 = continue golf

seg-287014fdc28d = CZML, KML, GeoJSON

seg-469c9a50992d = Cesium Language; Keyhole Markup Language; Geographic JSON (kaart- en globeformaten)

seg-3415aa029e39 = Development Ephemeris { "441" } van het Jet Propulsion Laboratory

seg-68ff97cfdc03 = DOI

seg-fa299d3dcaad = digital object identifier

seg-02d581f43613 = DOP, GDOP, PDOP, HDOP, VDOP

seg-a149d6e76bcb = verzwakking van precisie: geometrisch, positie, horizontaal, verticaal

seg-bc679de1b3a8 = E1, E5, E5a, E5b

seg-bb2b62a48d99 = namen van Galileo-signalen

seg-544f4fcbd68f = een slotnaam in de constellatietabel van het Global Positioning System

seg-dd9cfd581e5d = ECEF

seg-1a59ad88eca9 = aardgecentreerd, aardvast

seg-7cf8bec6418e = EE

seg-ceacb6924d4d = vergelijking van de equinoxen

seg-5d59005d9757 = Earth Gravitational Model { "2008" }

seg-de3b39993e2a = EIRP

seg-7f1b85286c96 = equivalent isotroop uitgestraald vermogen

seg-9a1bcf99edb4 = Essential Routines for Fundamental Astronomy; Standards of Fundamental Astronomy (referentiebibliotheken voor astronomie)

seg-51f1fda55cc7 = ESA, NAVISP

seg-399a11a6e7c7 = Europees Ruimteagentschap; zijn Navigation Innovation and Support Programme

seg-01eb6fdcdb90 = FDMA

seg-6723fd8624df = frequentieverdeling voor meervoudige toegang

seg-6d5d27174fe9 = GCRF, GCRS

seg-dd326440740d = Geocentric Celestial Reference Frame; Geocentric Celestial Reference System

seg-d41af8f18aed = GLONASS

seg-81f742947af1 = het Global Navigation Satellite System van Rusland

seg-d2a107373b59 = GNSS, GPS

seg-d703f29c82eb = wereldwijd navigatiesatellietsysteem; Global Positioning System

seg-1df73b95ae4d = IAU

seg-0461e1933d23 = Internationale Astronomische Unie

seg-6f1e5949b860 = ICD, OS SIS ICD, OS SDD

seg-a54e0f483ad5 = interfacebeheerdocument; Galileo Open Service Signal-In-Space Interface Control Document; Galileo Open Service Service Definition Document

seg-e78cf68c3f5e = ICRF

seg-f094d5944111 = International Celestial Reference Frame

seg-aa7091bb80e6 = IMO

seg-6a7c8caf2a55 = Internationale Maritieme Organisatie

seg-dbcf65546abf = INS, MEMS

seg-b767f348dab9 = traagheidsnavigatiesysteem; micro-elektromechanisch systeem

seg-1be5a43002db = IOD

seg-7eb2ca980e20 = demonstratie in een baan om de aarde

seg-92cd0058a058 = IQ

seg-c7fa50165400 = in fase en in kwadratuur

seg-41471e51e661 = de interfacespecificatie van het Global Positioning System

seg-70fd83c6e862 = ISS

seg-cc73228e1f0e = Internationaal Ruimtestation

seg-c0d4cf4a1eab = ITRF, ITRS, PEF, TEME

seg-7d5656c0bdc7 = International Terrestrial Reference Frame; International Terrestrial Reference System; pseudo-aardvast; ware evenaar, gemiddelde equinox (referentiestelsels)

seg-8f1cbbae84aa = ITU, ITU-R

seg-d1b7680b4762 = Internationale Telecommunicatie-unie; haar Radiocommunicatiesector

seg-a524e4c4a670 = jammer-signaalverhouding

seg-5d93361e20d4 = J2 tot J6, J2000

seg-50255586b303 = zonale harmonischen van het zwaartekrachtveld; het tijdperk 2000-01-01 { "12" }:{ "00" }

seg-368f7969b33a = JPL

seg-44db8a7ae8f7 = Jet Propulsion Laboratory

seg-e0e589aaa8fe = LEO, MEO

seg-f4b580b88664 = lage baan om de aarde; middelhoge baan om de aarde

seg-aad5b54bfffd = MBSE

seg-800a5f6b96ad = modelgebaseerd systeemontwerp

seg-535ba4896ba4 = NEES

seg-a230ecd2fe39 = genormaliseerde gekwadrateerde schattingsfout

seg-56d5135d987d = het ionosfeermodel van Galileo

seg-408af08fe37b = OEM, SP3, TLE

seg-caac315539e4 = Orbit Ephemeris Message; Standard Product { "3" } (nauwkeurige banen); tweeregelige elementenset

seg-ac4878697ee5 = PNT, PPP

seg-c19b5f77acc5 = positiebepaling, navigatie en tijdsynchronisatie; nauwkeurige puntpositiebepaling

seg-dd94b086ed4b = PSD, SSC

seg-6e937d7e984e = spectrale vermogensdichtheid; spectrale scheidingscoëfficiënt

seg-e0421c657cc1 = RAIM, SQM

seg-d6fee8d2ce49 = autonome integriteitsbewaking door de ontvanger; bewaking van signaalkwaliteit

seg-dc53bead2cf5 = RINEX, RTCM

seg-497d23725a56 = Receiver Independent Exchange Format; Radio Technical Commission for Maritime Services

seg-dcd6afa24ea6 = RMS

seg-0b4fc648e96c = kwadratisch gemiddelde

seg-e1c3c49833fc = een opensource-GNSS-positiebepalingsbibliotheek, hier gebruikt als onafhankelijke referentie

seg-9ead536db4aa = Simplified General Perturbations { "4" } (het baanmodel van tweeregelige elementensets)

seg-865e7d1794b6 = Secure Hash Algorithm, 256 bits

seg-8c718f7f9f5d = SigMF

seg-7830c93a5803 = Signal Metadata Format

seg-d282e836d47b = SISRE

seg-3c48d3ad7b43 = afstandsfout van het signaal in de ruimte

seg-f045a03a5598 = SPS PS

seg-8b51e83d54d3 = Standard Positioning Service Performance Standard

seg-758b51d8d5b6 = SRTM

seg-7e45c32b04e4 = Shuttle Radar Topography Mission

seg-8104773e1484 = STK

seg-f4fca0494aae = Systems Tool Kit (zijn efemeridebestandsformaat <c1/>)

seg-ad20a7bebf23 = STL

seg-e2dbcb4bc5f5 = Satellite Time and Location

seg-1043491566b5 = SVID

seg-d67f9665f054 = identificatie van het ruimtevaartuig

seg-de4e841ce8a2 = het totale aantal satellieten, de vlakken en de fasering van een Walker-constellatie

seg-4d6ebfefc096 = TEC

seg-5149401781dd = totale elektronendichtheid

seg-71aee5eb55c5 = UHF

seg-65e797f8bb42 = ultrahoge frequentie

seg-3cd6018f5b78 = UTC

seg-4d7d6ff2e8a5 = gecoördineerde wereldtijd

seg-41b9b462d434 = WGS { "84" }

seg-ec04054b9f8e = World Geodetic System { "1984" }

seg-613b7c13cd32 = X1, X5

seg-349e041a5a90 = signaalnamen van het Xona Pulsar-systeem

seg-d6a3f210958a = Een gewijzigd gepubliceerd cijfer is een herziening en wordt vastgelegd, nooit stilzwijgend gecorrigeerd. Deze release bevat één herziening van engine-uitvoer en meerdere van cijfers die in de documentatie zijn afgedrukt.

seg-1669eb4224f1 = Engine-uitvoer

seg-185961ebab61 = De reductie van TEME naar GCRS draaide met { "2" }·Δψ te veel: de nutatiematrix had het teken van Δψ omgekeerd.

seg-504b78f30c54 = <c1/> bouwde <c2/> waar <c3/> van SOFA <c4/> bouwt, zodat <c5/>, <c6/>, <c7/> en <c8/> roteerden met tweemaal de nutatie in lengte, ongeveer { "25" } boogseconden. Elke controle op de keten was een eigenschapstest (juiste rotatie, heen-en-terug, een niet-nulbijdrage van de nutatie) die een tekenfout doorlaat; de end-to-end-Vallado-test omvatte TEME→PEF, TEME→ITRF en GCRS→ITRS maar niet TEME→GCRS. In het Vallado-voorbeeld (AIAA 2006-6753, 2004-04-06) miste de keten de gepubliceerde GCRF met { "1 145" } m; nu komt ze { "0.11" } m ervan vandaan, en de matrix is gelijk aan <c9/> van ERFA tot { "1e-14" }. <c10/> en <c11/> falen allebei op het oude teken. De consistentietest van de CIO (Celestial Intermediate Origin) in <c12/> had het resulterende verschil van ~{ "130" } m toegeschreven aan "≈ { "2" }·EE"; het residu is nu { "5" } cm en zijn grens is aangescherpt van { "250" } m tot { "1" } m. <b>Dit verschuift gepubliceerde cijfers, hier als herziening vastgelegd:</b> de kolommen <c14/> en <c15/> van de soort <c13/> (ongeveer { "0.8" }–{ "1.0" } km voor het meegeleverde ISS-scenario (International Space Station); zijn kolommen voor TEME, aardvast, grondspoor, kijkhoek en Doppler veranderen niet), en <c16/> / <c17/> voor de GCRS- en ITRS-stelsels. Geen samenvattingsregel, grafiek of golden hash van een meegeleverd scenario leest deze kolommen. De nieuwe interoperabiliteitsexports gebruiken de gecorrigeerde keten: de CZML-positie van de eerste <c18/>-satelliet komt tot { "2.3" } cm overeen met een ERFA-reductie van dezelfde TLE (gepropageerd door het Python-pakket <c19/>).

seg-a0a4026d22ed = <b>De soort <c1/>, native en in de browserbuild.</b> De soort berekent nu elke transcendente functie via één draagbare wiskundebibliotheek, zodat haar frame op elk platform en in elke build dezelfde bytes heeft (onder Fixed). Elk <c2/>-cijfer verschuift mee, en de fase <c3/> van <c4/>. De soort is nieuw in deze release, dus er verschuift niets uit een eerdere release, maar cijfers die vóór de fix zijn afgedrukt wel: de controlewaarde van <c5/> voor het scenario voor coderen en decoderen was <c6/> en is <c7/>, en haar SISRE van het gedecodeerde bericht is { "0.129" } cm. Op kshana.dev toonde de Missions-kaart voor <c8/> een grootste afstandsfout van { "1.6" } mm bij een fit van { "60" } s en { "40.3" } mm bij een fit van { "900" } s; de site wordt nu gebouwd met de engine van deze release en toont { "1.8" } mm en { "46.6" } mm.

seg-77f441bfc3c3 = <b>De kaart van de jammingvoetafdruk op kshana.dev (Missions).</b> Elk van haar { "875" } cellen is één run van <c1/> waarbij alleen de positie van de ontvanger verandert. De cellen worden nu berekend uit dezelfde coördinaten met drie decimalen die de link "open this run" van de cel aan Kshana Studio geeft, zodat een cel precies toont wat zijn link reproduceert. De gemiddelde jammer-signaalverhouding (J/S) van { "30" } cellen verschuift met { "0.1" } dB, omhoog of omlaag; de trackingbeschikbaarheid van geen enkele cel verandert. De engine geeft identieke resultaten voor elke cel in { "0.28.0" } en { "0.29.0" }.

seg-146588a39e7c = <b>Geseede resampling in het WebAssembly-pakket (WASM).</b> De browserbuild trok andere bootstrap- en shuffle-indices dan de native build uit dezelfde seed (onder Fixed). Het interval <c1/> van de oppervlakte onder de curve in de browser was <c2/> en is nu het native <c3/>. Er verschuift geen enkel native getal.

seg-017810049453 = Cijfers die in de documentatie zijn afgedrukt

seg-85ab2a364a37 = De documentatie is woord voor woord getoetst aan runs van de engine van deze release. Waar een afgedrukt cijfer niet met de run overeenkwam, is het document gecorrigeerd, en elke correctie staat hier vermeld, oud → nieuw. In elk geval hieronder is de engine-uitvoer niet veranderd; het document had haar verkeerd gelezen, verkeerd afgerond of was erdoor achterhaald.

seg-1eacdefbfda2 = <b>Documentatie-audit van de pagina's over spectrum, constellatie, campagne, animatie, rapport en interoperabiliteit, en een nieuw <c1/>.</b> Elk cijfer is opnieuw uitgevoerd met deze engine. Twee gepubliceerde getallen verschuiven: <c2/> gaf de dekkingstest met { "5" } 000 satellieten als "ongeveer { "0.13" } s in een debugbuild"; dat is niet gereproduceerd ({ "1.24" } s op een belaste laptop), dus de pagina geeft nu het aandeel van het voorfilter dat de test afdrukt ({ "9.9" } % van { "19 440 000" } paartests) en de { "0.14" } s van de releasebinary voor de meegeleverde <c3/>. Dezelfde pagina gaf de kruising van E3F als "{ "0.050" } graad ernaast"; geen test drukt dat cijfer af, dus de pagina vermeldt nu alleen de drempel van { "0.06" } graad die de test afdwingt en de afleiding { "7.30" } tegen { "7.36" } graad erachter. Er verandert geen engine-uitvoer.

seg-2ad182e2db15 = LEO-PNT-documenten: herziene gepubliceerde cijfers (opnieuw uitgevoerd op de engine van deze release).

seg-6c2401365dd5 = <c1/> bandafweging: de eerste-orde ionosferische vertraging van <c2/> is { "3.24" } m (was afgedrukt als { "3.25" } m) en van <c3/> { "0.77" } m (was { "0.78" } m). <c4/> coderen en decoderen: de SISRE van het gedecodeerde bericht was afgedrukt als { "0.119" } cm waar de run { "0.122" } cm gaf; de pagina drukt nu { "0.129" } cm af, het cijfer na de fix voor platformonafhankelijkheid onder Fixed hieronder. <c5/> LEO-passage versus GNSS: { "32" } dB minder vrijeruimteverlies op de piek van de passage (was "{ "26" } tot { "32" } dB"). Voor de signaal- en passagecijfers is de engine-uitvoer niet veranderd; de documenten hadden haar verkeerd gelezen of verkeerd afgerond.

seg-fc3c8ba1b789 = <b>Tutorials, het uitgewerkte pijplijnvoorbeeld en de opdracht <c1/>, getoetst aan de engine van deze release.</b> Herzieningen van gepubliceerde cijfers, oud → nieuw: de soorten die <c2/> schrijven zijn er zes, niet vier (<c3/> en <c4/> ontbraken; <c5/>, <c6/>); de koude-atoomkruising ½bT² in Tutorial { "3" } is { "18,443" } s, niet { "18,440" } s; de rondgangsfout van <c7/> in <c8/> is de gemeten { "4.88e-7" } km, niet "~{ "1e-7" } km"; de CSAC-holdoverband van Tutorial { "2" } is de { "2000" }–{ "3200" } s die de test bevestigt, niet "~{ "2600" }–{ "4400" } s"; Tutorial { "1" } citeert de SP3-rijen en het geometrieblok met de precisie waarmee de engine ze schrijft. Er is geen engine-uitvoer veranderd.

seg-4c613cabb87b = Pagina's over validatie, kwantum, SGP4, animatie, beweringen en integriteit.

seg-c49d5cdb36e1 = <c1/>: de afgedwongen drempel voor de gesimuleerde Allan-deviatie van één seconde van een klok met witte frequentieruis is { "20" } % (was afgedrukt als { "25" } %; de drempel van { "25" } % is die op de curve bij { "1" }, { "10" } en { "100" } s); de rij voor de snelheidsrandomwalk vermeldt nu zijn afgedwongen drempel van { "20" } % naast de waargenomen ongeveer { "12" } %; en de beschikbaarheid van de chip-scale atoomklok in <c2/> is ongeveer { "0.73" } (was afgedrukt als ongeveer { "0.83" }). <c3/>: de door trillingen beperkte ruis per schot in het uitgewerkte koude-atoomvoorbeeld van de pagina is ongeveer { "46" } maal zijn schotruisvloer (was "~{ "45" }×"; { "46.49" } herberekend), en het bereik "{ "1" }–{ "50" } µg/√Hz" voor veldtoestellen, dat een toestel tegensprak dat de pagina zelf noemt, is vervangen door de gepubliceerde cijfers van de twee genoemde toestellen. <c4/>: het grootste positieverschil is { "4.12" } mm (was "≈ { "4" } mm"), met vermelding van de satelliet. <c5/>: het voorbeeld van de video-encoder las de frames van { "24" } frames per seconde als { "12" }; het gebruikt nu { "24" }, de snelheid die het framemanifest vermeldt. <c6/>: het jammingmodel heeft { "10" } tests (was { "8" }), en de "{ "2.97" } m tegen { "48.8" } m" van het gekoppelde filter is vervangen door wat zijn test bevestigt (de gekoppelde positiefout onder { "0.6" } maal de ontkoppelde, en wint in ten minste { "90" } van { "100" } trials). <c7/>: de stempel "Today" las { "v0.22.0" }; hij noemt nu deze release, en twee mogelijkheden die sindsdien zijn gebouwd (de constellatiebrede foutmodus en het integriteitsondersteuningsbericht) verlaten zijn lijst van hiaten.

seg-4fde8788f95f = <b>Scenariosoort <c1/>: een L-bandspectrummodel en waterfall</b> (<c2/>, <c3/>, <c4/>). De hele GNSS-L-band als één spectrale vermogensdichtheid (PSD): GPS L1 coarse/acquisition (C/A) en L2 civiel (L2C) (BPSK({ "1" })), Galileo E1 (gemultiplexte binaire offsetdraaggolf, MBOC(6,1,1/11), of BOC({ "1,1" })), GPS L5 en Galileo E5a (BPSK({ "10" })), een kT-ruisvloer met een ruisgetal van de ontvanger, en jammers met continue golf (CW), smalband, chirp en gematchte ruis op een gescripte tijdlijn. Elke jammer wordt per band gescoord met zijn spectrale scheidingscoëfficiënt (SSC), wat per band per rij de jammer-signaalverhouding (J/S) en de effectieve draaggolf-ruisdichtheidsverhouding (C/N0) geeft. De grafiek is een SVG-waterfall met C/N0-balken; result.json bevat het raster in vermogen blokgemiddeld. Optioneel <c5/> tekent het model als IQ-samples, schrijft en leest een Signal Metadata Format-opname (SigMF) (<c6/>, <c7/>) en vergelijkt een Welch-schatting met het model; optioneel <c8/> schat een echt SigMF-bestand. Meegeleverd voorbeeld <c9/>: een chirp haalt L1 C/A en E1 neer op { "10" } s, een CW-toon op de L1-draaggolf houdt C/A na het stoppen van de chirp op { "17.98" } dB-Hz terwijl E1, waarvan het spectrum daar een nul heeft, herstelt; L5 en E5a blijven onaangetast.

seg-fa9976349886 = Nieuwe rij VALIDATED: de signaal-PSD's en SSC's, getoetst aan de hoofdlob van BPSK(n) van 2n x { "1.023" } MHz, de BOC({ "1,1" })-lobben gecentreerd op +/-1.023 MHz, de gesloten vormen van Parseval achter de gepubliceerde SSC's van -61.8 / -64.8 / -67.8 dB/Hz, en de leerboekwaarden Q = { "1" } (CW) en { "1.5" } (gematcht). Het maximum van de BOC({ "1,1" })-PSD ligt op +/-0.759 MHz, niet in het midden van de lob; de test legt beide vast.

seg-411431a9b26b = Twee nieuwe rijen MODELLED: de waterfall en de C/N0-tijdlijn, die exact terugvallen op de keten van de soort <c1/> (in elk rapport gecontroleerd), en de SigMF-codec en de Welch-schatter. Er staat geen opname van een derde partij in de repository.

seg-5c5c695e7c0a = <c1/>: een MBOC-variant en <c2/>.

seg-bb346f4942a9 = Het rapport drukt de C/N0 af die de representatieve Q-tabel van de soort <c1/> zou geven, naast de uit het spectrum afgeleide; voor een CW-toon op de C/A-draaggolf verschillen ze { "1.8" } dB. Drie nieuwe matrixrijen: één getoetst aan een externe referentie (signaalspectra en spectrale scheidingscoëfficiënten) en twee gemodelleerd.

seg-673dfe048dad = <b>Efemeride van het zonnestelsel en positiebepaling rond elk lichaam.</b> Twee nieuwe scenariosoorten.

seg-3e1b0e8e99e9 = <c1/>: de Zon, de acht planeten, Pluto, de Maan, Phobos, Deimos, Io, Europa, Ganymedes, Callisto en Titan op één epoch: heliocentrische positie en snelheid in het International Celestial Reference Frame (ICRF), gravitatieparameter, stralen, J2 (de tweede zonale harmonische) waar gepubliceerd, siderische rotatie, de pool en de nulmeridiaan van de Internationale Astronomische Unie (IAU), een baanspoor over één omwenteling, en de lichttijd, enkele en dubbele afstand, de Shapiro-vertraging door de Zon en de afstand tot de Zon vanaf een waarnemerslichaam en voor elke extra link. De planeten komen uit de Keplerelementen van het Jet Propulsion Laboratory (JPL) van Standish en Williams (Table { "1" }, { "1800" } AD tot { "2050" } AD; Tables 2a/2b, { "3000" } BC tot { "3000" } AD); de manen uit gemiddelde JPL-elementen met de synchrone rotatiesnelheid van de IAU, en Titan uit het rotatiemodel van de IAU. Voorbeeld: <c2/>.

seg-6a094973208b = <c1/>: een orbiter of een landingsvaartuig op het oppervlak rond een van die lichamen, dat navigeert met pseudoafstanden van een Walker-constellatie rond het lichaam en een klokvrije dubbele afstand vanaf de aarde; verzwakking van precisie, formele onzekerheid en geseede kleinste-kwadratenposities met en zonder de aardelink. Voorbeelden: <c2/>, <c3/>.

seg-ed5063379a8b = <c1/> krijgt Mercurius, Venus, Jupiter, Saturnus, Uranus, Neptunus, Pluto en de zeven manen, een naamopzoeking en een fysiek record; <c2/> geeft elk lichaam ten opzichte van elk ander via de bestaande koppeling <c3/>.

seg-8b5c2fbe91f7 = VALIDATED aan JPL Horizons (Development Ephemeris DE441; fixtures en queries in <c1/>): Mercurius tot Saturnus en de Aarde uit Table { "1" } binnen tweemaal de vermelde nominale fout (ergste { "1.87" } maal), alle acht planeten uit Tables 2a/2b (ergste { "1.71" } maal), en de lichttijd van de Aarde naar Mars en Jupiter. MODELLED: Uranus en Neptunus uit Table { "1" }, die de vermelde fout ten opzichte van DE441 overschrijden ({ "2.0" } en { "5.2" } maal), Pluto, de manen, de lichaamsconstanten en de resultaten van <c2/>.

seg-a3c83f6d2078 = Bevinding: de maanreeks van Montenbruck & Gill in <c1/> is door haar eigen precessieterm al naar de equinox van J2000 herleid ({ "0.05" } graad van Horizons), dus ze wordt zonder verdere precessierotatie gebruikt. Zes nieuwe matrixrijen: twee getoetst aan een externe referentie (planeetposities, lichttijd) en vier gemodelleerd.

seg-564133d6a0c4 = Constellaties rond elk lichaam

seg-d1ddb76d8bf3 = <b>Constellatieontwerp op schaal (soort <c1/>, <c2/>).</b> Walker-delta- en Walker-sterpatronen (T/P/F), expliciete elementenlijsten en ontwerpen met meerdere schalen, meerdere constellaties per run, rond de Aarde, de Maan, Mars of een andere planeet, Pluto of een grote maan, uit de lichaamsconstanten die de soort <c3/> heeft toegevoegd. Voorinstellingen uit gepubliceerde nominale elementen: de basislijn en uitbreidbare constellatie met 24 slots van het Global Positioning System (GPS) (Standard Positioning Service Performance Standard, SPS PS, { "2020" }), Galileo Walker 24/3/1 (Open Service Service Definition Document, uitgave { "1.1" }), BeiDou-baan op middelhoge hoogte Walker 24/3/1 plus geostationaire en geneigde geosynchrone satellieten (Open Service Performance Standard { "3.0" }) en GLONASS 24/3/1 (Interface Control Document { "5.1" }). Dekking en verzwakking van precisie (DOP) over een breedte-/lengteraster: satellieten in zicht, GDOP, PDOP, HDOP en VDOP (geometrisch, positie, horizontaal, verticaal) en beschikbaarheid per cel, wereldwijd en op de slechtste locatie, met één ontvangerklok per constellatie. Een zichtbaarheidsvoorfilter (dekkingshalfhoek plus een breedteband onder de satelliet, exact op een bolvormig lichaam) draait { "5 000" } satellieten op een raster van { "10" } graad in ongeveer { "0.13" } s in een debugbuild.

seg-8f4ebd177f3d = VALIDATED: de Walker-generator reproduceert Galileo OS SDD Table { "23" } en de slotformule van de GLONASS-ICD; de GPS-voorinstelling reproduceert de kolom met equatorkruisingen van SPS PS ({ "35" } van { "36" } locaties binnen { "0.0108" } graad; E3F binnen { "0.06" } graad, waarbij de eigen rij van de tabel inconsistent is); de wereldwijde HDOP-verdeling van de GPS-basislijn komt overeen met SPS PS Appendix B (mediaan { "0.940" } tegen { "0.94" }, { "95" } % { "1.255" } tegen { "1.25" }, gemiddelde { "0.965" } tegen { "0.96" }; drempel { "0.03" }).

seg-65658a896a73 = MODELLED: willekeurige ontwerpen, andere lichamen, de fase van BeiDou en de geneigde geosynchrone knopen, tweelichamenbanen met optionele J2, alleen geometrie.

seg-3dfe470e8a5c = Scenario's: <c1/> ({ "102" } satellieten, beschikbaarheid { "100" } %, mediane PDOP { "0.95" }, { "31.0" } in zicht boven { "10" } graad), <c2/> ({ "5 000" } satellieten, beschikbaarheid { "99.22" } % bij PDOP { "3" } of lager boven { "20" } graad, { "0" } % bij de poolkappen, voorfilter houdt { "11.5" } % van de paartests over), <c3/> ({ "14" } satellieten rond de Maan, beschikbaarheid { "21.33" } % in totaal en het hoogst boven het zuidpoolgebied). Alle drie zijn meegeleverd voor <c4/>. Opmerkingen: <c5/>. Drie nieuwe matrixrijen: twee getoetst aan een externe referentie (Walker-generator en GNSS-voorinstellingen, wereldwijde GPS-DOP) en één gemodelleerd.

seg-79e2d2c42166 = Een campagne aangestuurd door het spectrummodel, en constellaties rond elk lichaam.

seg-4ab5f6f6bbbb = <c1/> koppelt de soort <c2/> aan een klok-holdover en een integriteitsmonitor (een chirp haalt L1 C/A en E1 neer; een CW-toon houdt C/A vervolgens laag terwijl E1 herstelt en de ontvanger terugvalt op een hemel met alleen Galileo), vastgelegd tegen het zelfstandige waterfallvoorbeeld in <c3/>. <c4/> bepaalt zijn centrale lichaam nu via <c5/>, zodat een constellatie rond elke planeet, Pluto of grote maan kan worden gelegd met de constanten die de soort <c6/> gebruikt.

seg-dc904f639fed = <b>Campagnes: veel scenario's samengesteld tot één run.</b> Een nieuwe soort <c1/> (<c2/>, gedocumenteerd in <c3/>) voert leden van bestaande soorten uit via dezelfde dispatch als de opdrachtregel en leest getallen uit hun resultaten terug. Vier secties, in elke combinatie:

seg-903ee141047a = <c1/>: een geketende missie op één tijdlijn. Voorinstellingen per soort lezen de klokfout tegen zijn bewakingsgrens, de gemiddelde effectieve draaggolf-ruisdichtheidsverhouding (C/N0) tegen de trackingvloer, het verticale beschermingsniveau tegen de alarmgrens, positiefout, satellieten in tracking en alarmvlaggen, vastgehouden op een gemeenschappelijk raster met fasegrenzen en gebeurtenissen. De toestand wordt doorgegeven door <c2/>, <c3/> en <c4/>.

seg-4eeedde09a77 = <c1/>: één tot drie gepunte sleutels van elke soort, optioneel met een geseed ensemble op elk knooppunt.

seg-4c113198cbb7 = <c1/>: realisatie k op basisseed + k, met gemiddelde, spreiding, percentielen en een bootstrap-betrouwbaarheidsinterval van { "95" }% met vaste seed.

seg-df107253752d = <c1/>: gedeelde waarden die aan meerdere leden zijn gebonden, met een gecombineerde samenvatting van beste en slechtste. Elk resultaat draagt een campagnehash en een digest over elk ledenresultaat. Vier meegeleverde scenario's: <c2/> (nominaal, jamming, spoofing beëindigd bij de detectie na { "370" } s door de klokmonitor, holdover met de gespoofde offset van { "37.0" } ns terwijl een traagheidseenheid doorvaart, een integriteitsalarm, herstel), <c3/>, <c4/> en <c5/>. <c6/> legt de compositie-identiteiten vast: een campagne met één fase reproduceert de zelfstandige run bit voor bit op drie soorten, een ensemble met vaste seed is bytestabiel, en op een klok met witte frequentieruis ligt het ensemblegemiddelde binnen het gerapporteerde interval met de spreiding binnen het chikwadraatinterval van sqrt(q_wf * tau) = { "16.459" } ns. Drie nieuwe gemodelleerde matrixrijen.

seg-c611ee59301a = Animatie

seg-14b2d3cc9e7c = <b>Animatie-export (<c1/>, <c2/>, <a1><c3/></a1>).</b> Elke run waarvan het resultaat een tijdreeks bevat, kan nu worden weggeschreven als een geanimeerd Scalable Vector Graphics-bestand (SVG) (Cascading Style Sheets-keyframes, geen script: de sporen worden getekend achter een bewegende tijdcursor), als één op zichzelf staande HyperText Markup Language-speler (HTML) (afspelen en pauzeren, scrubben, snelheid, elk paneel op één gesynchroniseerde cursor, gebeurtenismarkeringen die bij een klik zoeken; geen extern bestand), of als een genummerde SVG-framereeks met een <c4/> die frames per seconde, duur en frametijden voor een video-encoder vermeldt. Een campagne wordt afgespeeld als haar fasen met haar alarmen gemarkeerd; een spectrumrun animeert zijn waterfall rij voor rij. De speler volgt <c5/>, en onder <c6/> tonen zowel de SVG als de speler het afgewerkte beeld in plaats van te bewegen. <c7/> en <c8/> stellen het afspelen in; <c9/> en <c10/> zijn de ingangen van de bibliotheek, en <c11/> krijgt een blok <c12/> alleen wanneer <c13/> draait. De uitvoer is een zuivere functie van het resultaat en de opties, byte-identiek bij een herhaalde run, zonder tijdstempel. Een soort zonder bemonsterde tijdas wordt geweigerd met "no time series to animate" en er wordt niets geschreven. De exporteur tekent de eigen samples van de run en voegt geen getal toe, dus hij is MODELLED (interne consistentie) en heeft geen rij in de verificatiematrix; er verandert geen gepubliceerd getal. Tests: <c14/> (determinisme, aantal frames, geen extern adres, goedgevormde XML, het pad voor verminderde beweging, en elk meegeleverd scenario met een tijdreeks dat animeert).

seg-c01b78b64065 = Rapporten

seg-2662fdb991f3 = <b>Geavanceerde runrapporten (<c1/>, <a1>docs/REPORTS.md</a1>).</b> Elke run via de opdrachtregelinterface (CLI) schrijft nu <c2/>, een afdrukbaar HyperText Markup Language-rapport (HTML), en <c3/>, dezelfde inhoud als machineleesbaar JavaScript Object Notation-document (JSON). Secties: een managementsamenvatting; elke scenario-invoer met zijn eenheid, gelezen uit het schema van veldeenheden (het blok <c4/> van het resultaat), anders uit het achtervoegsel van de veldnaam, anders als niet vermeld aangegeven; de resultaten met de grafiek van de run, elke scalar en een samenvatting van elke numerieke kolom; voor een campagne de knooppunttabel van de sweep, het Monte Carlo-gemiddelde, de standaarddeviatie, de percentielen 5e / 50e / 95e en het bootstrap-betrouwbaarheidsinterval met een histogram per maat, de fasetabel van de keten, of de leden en gecombineerde samenvatting van de compositie (en het raster van een run van <c5/> of <c6/>); een tijdlijn van gebeurtenissen; het label VALIDATED / MODELLED / PARTNER, de onafhankelijke referentie en het testbewijs van elke rij van de verificatiematrix die de soorten van de run aanspreken, gelezen uit de matrix via een kruistabel van soort naar rij (een rij die één invoerpad beoordeelt, zoals het pad Simplified General Perturbations { "4" } (SGP4) van <c7/> of het pad voor gemeten records van <c8/>, wordt alleen vermeld wanneer de run dat pad nam, en de lezersrij voor de Shuttle Radar Topography Mission (SRTM) wordt voor geen enkele soort vermeld, omdat geen scenarioveld een SRTM-tegel leest); de verklaringen over wat niet is gemodelleerd en de aannames, elk met zijn bron aangehaald; en een reproduceerbaarheidsrecord (engineversie, de bronscommit wanneer de build <c9/> instelt, Secure Hash Algorithm 256-bit-digests (SHA-256) van het scenariobestand en het resultaatdocument, seed, platform en de exacte opdracht). Het rapport leest geen klok: hetzelfde scenario, dezelfde seed en dezelfde enginebuild geven een byte-identiek rapport, en de enige tijdstempel die het kan tonen is die welke <c10/> al schrijft. Een printstijlblad past op A4 en US Letter, herhaalt tabelkoppen en houdt rijen en figuren heel over pagina's; een Portable Document Format-bestand (PDF) wordt gemaakt met "Opslaan als PDF" van de browser. Er is geen optie <c11/>, omdat het renderen van de grafieken naar een PDF een nieuwe, zware afhankelijkheid zou vereisen. Tests: <c12/> rapporteert elk meegeleverd scenario (geen lege sectie, geen plaatshoudertekst, labels gelijk aan de matrix, de scenariodigest gelijk aan die van het bestand, byte-identiek bij een herhaalde run) en <c13/> voert de vastgelegde opdracht opnieuw uit in een verse map en eist een byte-identiek <c14/>. Er verandert geen gepubliceerd getal, en de aantallen soorten, scenariobestanden en matrixrijen blijven ongewijzigd.

seg-ce45e75c6d67 = <b>Het rapport, de animatie en de exports werken samen.</b> Het geavanceerde rapport krijgt een sectie "Animatie en exports": de geanimeerde tekening van de run ingebed als inerte afbeelding (of de reden dat er geen is), links naar de animatie- en exportbestanden die ernaast zijn geschreven, en elk interoperabiliteitsformaat met of het van toepassing is, waarom niet, en zijn specificatie; <c1/> bevat hetzelfde blok <c2/>. De HTML-animatiespeler toont de exportbestanden die ernaast zijn geschreven. De opdrachtregelinterface (CLI) rendert de exports nu voordat ze het rapport schrijft, zodat beide de bestanden kunnen noemen.

seg-c60dc5b92a60 = Interoperabiliteitsexports

seg-5bfce52c5a13 = Interoperabiliteitsexports en -imports (<c1/>, <c2/>, docs/INTEROP.md).

seg-44e7c902490a = <c1/> schrijft de geometrie van het scenario als CZML (de Cesium Language), KML (Keyhole Markup Language { "2.2" }, een standaard van het Open Geospatial Consortium, met <c2/> tijdgetagde sporen), GeoJSON (Request for Comments { "7946" } van de Internet Engineering Task Force) en Ansys STK-efemeriden (Systems Tool Kit) <c3/> (<c4/>, meters, één bestand per bewegend object), en de gesynthetiseerde IQ-snapshot (in fase en in kwadratuur) van de soort <c5/> als SigMF-paar (Signal Metadata Format) via de bestaande <c6/>. <c7/> schrijft elk formaat dat van toepassing is en drukt af waarom de andere dat niet zijn; <c8/> rapporteert zonder te draaien. Bewegende objecten worden geschreven in het Geocentric Celestial Reference System (CZML <c9/>, STK <c10/>) en in aardvaste WGS { "84" } (World Geodetic System { "1984" }) lengte, breedte en hoogte (KML, GeoJSON); vaste locaties in CZML zijn <c11/>. De soort <c12/> voegt twee jammervoetafdrukken toe uit zijn eigen linkvergelijkingen. <c13/> schrijft een GeoJSON-<c14/> in de sporeninvoer van <c15/>, <c16/>, <c17/> en <c18/>. Exports zijn byte-deterministisch en bevatten geen tijdstempel. <c19/> valideert elke export tegen zijn gepubliceerde specificatie, vergelijkt geëxporteerde satelliettoestanden met die van de engine zelf tot { "1" } mm, en voert elk meegeleverd scenario door elk formaat, waarbij elk ofwel exporteert ofwel vermeldt waarom niet (de tabel in docs/INTEROP.md). Er verandert geen gepubliceerd getal: de IQ-synthese van de soort <c20/> is verplaatst naar één gedeelde functie en zijn resultaatdocument is byte-identiek, en <c21/> krijgt <c22/> en <c23/>, gebruikt door zijn eigen run. De aantallen soorten, scenariobestanden en verificatiematrixrijen blijven ongewijzigd. Een baan- of integriteitsscenario zonder <c24/> wordt gedateerd met de eigen gegevens van zijn satellieten: <c25/> is de vroegste epoch van een TLE (tweeregelige elementenset), broadcast-efemeride of SP3 (Standard Product { "3" }), en elke zulke satelliet wordt op zijn eigen tijdstip geroteerd naar het GCRS en de aardvaste stelsels; 2000-01-01T00:{ "00" }:00Z wordt alleen gebruikt als geen enkele satelliet een epoch heeft. De SP3- en OEM-exports (Orbit Ephemeris Message) behouden hun label 2000-01-01. Om dit te ondersteunen zijn <c26/>, <c27/> en <c28/> toegevoegd; niets wat al bestond leest ze.

seg-12c151a800f9 = Navigatie in een lage baan om de aarde: signaal

seg-9b665682695a = <b>LEO-PNT-signaalontwerpen en een multibandspectrum.</b> Een nieuwe soort <c1/> en een soort <c2/> die verder reikt dan de L-band: één soort, vier scenariobestanden (drie meegeleverd; het bestand Celeste IOD staat alleen in de repository) en vier matrixrijen (twee VALIDATED, twee MODELLED).

seg-b355b28bfd1b = <c1/>: geparametriseerde signaalontwerpen voor positiebepaling, navigatie en tijdsynchronisatie (PNT) in een lage baan om de aarde (LEO) voor elk systeem (band, zendbandbreedte, ITU-toewijzing; acquisitie-, data- en pilootcomponenten met BPSK(n), BOC(m,n), MBOC of vlakke spectra, vermogensaandelen, FDMA-subdraaggolven, codelengtes en datasnelheden), uit ingecompileerde openbare voorinstellingsbestanden onder <c2/> (Xona Pulsar X1/X5, Iridium STL, een Starlink-signal of opportunity, CentiSpace, een representatief C-bandontwerp en representatieve UHF/L/S/C/brede-C-ontwerpen, elk met de URL van zijn bron) of inline geschreven. Per signaal: de bandbeperkte PSD en de vermogensfracties in de band, Gabor-bandbreedte, bandbeperkte early-late-codetrackingjitter tegen C/N0 en afstand (Betz & Kolodziejski { "2009" }) en de afstandsnauwkeurigheid, de acquisitiezoekruimte, detectiekans en gemiddelde seriële en codeparallelle acquisitietijd, de SSC naar en van GPS L1 C/A, Galileo E1, GPS L5, Galileo E5a, E5b en AltBOC met het C/N0-verlies, CW-, breedband- en gematchte J/S-tolerantie uit de SSC-code van de spectrumsoort, een bandafweging (ionosferische vertraging, vrijeruimteverlies, afstandsbepaling bij gelijke C/N0 en gelijke EIRP, jammertolerantie), en optionele vormcontroles tegen een beschreven meting. Voorbeelden: <c3/>, <c4/>, <c5/> (de Celeste IOD-banden en signaalconfiguratie zoals gepresenteerd op de ESA NAVISP LEO-PNT-workshop, { "2026" }; achtergehouden met de voorinstelling Celeste IOD, zie "LEO-PNT end to end" hieronder). Notities in <c6/>.

seg-8f58debf721f = <c1/>: banden mogen nu een voorinstelling voor een signaalontwerp zijn (elke component getekend, bandbeperkt, C/N0 en J/S herleid tot de gevolgde component) of een eigen draaggolf en modulatie; <c2/> voegen waterfalls over andere frequentiebereiken toe op één tijdlijn; een jammer van het type <c3/> (barrage) voegt zich bij de vier golfvormen. Het rapport voegt <c4/>, <c5/> en <c6/> toe, en één vermelding <c7/>. Gewone banden geven dezelfde getallen als voorheen. Voorbeeld: <c8/>.

seg-98f74d85c54b = <c1/> krijgt de sinusintegraal, de gesloten vormen voor BPSK-vermogen in de band en de bandbeperkte Gabor-bandbreedte, de bandbeperkte early-late-jitter voor elk spectrum en zijn Gabor-grens, de gesloten vorm van de SSC voor offset-BPSK, het Galileo E5 AltBOC({ "15,10" })-spectrum en een parser voor modulatielabels; <c2/> drukt BPSK(1/3) af als breuk.

seg-78d9e5e2c615 = Vier matrixrijen: VALIDATED bandbeperkte gesloten vormen ({ "90.3" } % van het BPSK-vermogen in de hoofdlob, de jitter die terugvalt op de coherente vorm van Kaplan & Hegarty, { "0.0039564" } chips bij { "45" } dB-Hz, B_L { "1" } Hz, d { "1" } chip, T { "20" } ms, en op zijn Gabor-grens, en de BPSK-eigen-SSC 2/({ "3" } R_c); de gesloten vorm van Gabor en de offset-SSC tegen zijn Parseval-vorm zijn vermeld als interne kruiscontroles); VALIDATED maximale LEO-Doppler (Xona X1 { "33.2" } kHz binnen de gepubliceerde { "32" } tot { "34" } kHz, Iridium binnen { "0.5" } kHz van { "36" } kHz); MODELLED <c1/>; MODELLED multibandspectrum.

seg-45d3d4a46d6b = Navigatie in een lage baan om de aarde: link

seg-1d120db87aae = <b>LEO-PNT-passage en linkbudget per band: de soort <c1/>.</b> LEO-PNT is positiebepaling, navigatie en tijdsynchronisatie vanaf satellieten in een lage baan om de aarde (LEO). Een gebruiker (op de grond, op zee, in de lucht of binnenshuis, stilstaand of bewegend) en een of meer LEO-satellieten uit een ontworpen passage, expliciete elementen, een tweeregelige elementenset (TLE) via SGP4, of een Walker-constellatie uit de code van <c2/>. Per satelliet, band en epoch: kijkhoeken, afstand, gesloten-vorm-afstandssnelheid en -versnelling (elke run gecontroleerd met centrale verschillen), Doppler en Doppler-snelheid, vrijeruimteverlies, EIRP (equivalent isotroop uitgestraald vermogen) met een isoflux-, Gauss-bundel- of vlak satellietpatroon, een patchantenne voor de gebruiker, gasverzwakking volgens ITU-R P.676, regenverzwakking volgens ITU-R P.838/P.618, troposferische scintillatie volgens P.618, ITU-R P.2109-verlies bij binnendringen in gebouwen voor een gebruiker binnenshuis, polarisatiemismatch, systeemruistemperatuur en C/N0 (draaggolf-ruisdichtheid); de eerste-orde ionosferische vertraging per band uit een scheve TEC (totale elektronendichtheid) van Klobuchar of verticale TEC onder de satelliet, en ionosfeervrije bandparen met hun ruisversterking. Galileo- of GPS-satellieten worden met dezelfde ontvanger beoordeeld uit hun ontvangen vermogens volgens het interfacedocument, zodat de klokvormige LEO-passage en de vlakke MEO-draaggolven (medium Earth orbit) één grafiek delen. Een sectie <c3/> geeft tijd tot de eerste positiebepaling, energie per positiebepaling en batterijduur tegen duty cycle (MODELLED).

seg-17f3503e1be3 = Systeemonafhankelijk: de engine heeft geen voorinstelling nodig. Optionele voorinstellingen, elk in een eigen bestand en gemarkeerd als PUBLIC (met URL), REPRESENTATIVE of WORKSHOP: generiek multiband (UHF, L, S, C), generieke C-band, Xona Pulsar X1/X5 (arXiv { "2509.19551" }), Iridium STL, Starlink als signal of opportunity met alleen Doppler, CentiSpace, en Celeste IOD (in-orbit demonstration), waarvan de signaalparameters zijn gepresenteerd op de ESA NAVISP LEO-PNT-workshop, { "2026" }, en die in <c1/> staan zodat ze kunnen worden achtergehouden (zie "LEO-PNT end to end" hieronder).

seg-a338cc46a1e0 = Openbare bouwstenen in <c1/> (geometry, antenna, itu, iono, energy, presets) die andere modules kunnen aanroepen.

seg-887ad03cb6f6 = Scenario's: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>.

seg-a20f1602c236 = Negen matrixrijen. VALIDATED ({ "6" }): ITU-R P.838-3-coëfficiënten tegen zijn Table { "5" }; P.618-14-regenverzwakking en -scintillatie tegen de validatievoorbeelden van ITU-R Study Group { "3" }; P.2109-verlies bij binnendringen in gebouwen tegen het werkboek van Study Group { "3" }; eerste-orde ionosferische schaling tegen de groepsvertragingsverhouding van IS-GPS-200, met het vrijeruimteverlies; de maximale Doppler van een statische gebruiker in een cirkelbaan tegen arXiv { "2509.19551" } Table { "1" }. MODELLED ({ "3" }): de passage en het linkbudget, de voorinstellingen en het energiearme positiebepalingsbudget. Eén soort en zes scenariobestanden. Notities in <c1/>.

seg-ef74b0f08aa1 = Navigatie in een lage baan om de aarde: navigatieboodschap

seg-866ff4ee8b19 = <b>LEO-navigatieboodschap (soort <c1/>, <c2/>).</b> De broadcast-efemeride- en klokboodschap van een satelliet voor positiebepaling, navigatie en tijdsynchronisatie (PNT) in een lage baan om de aarde (LEO), voor elke baan, draaggolf en elk model; benoemde voorinstellingen zijn optionele gegevens en elke mogelijkheid draait zonder ze. Eén soort, vijf scenariobestanden en negen matrixrijen (drie VALIDATED, zes MODELLED). Zie <c3/>.

seg-c42821b6e855 = Inhoud van de boodschap: SVID, uitgifte van gegevens, band en signaalgezondheid; week, tijd van de week en een kloktweedegraadspolynoom; de efemeride in een van vier modellen — de Keplerset met 16 parameters van de Galileo OS SIS ICD, die set plus correctiepolynomen langs het spoor, dwars op het spoor en radiaal, het model met 22 parameters van Liu et al. { "2025" } (doi 10.3390/rs17162894), of de ECEF-polynoom zonder klok van ATOMIC — en een Klobuchar-set, NeQuick-G-coëfficiënten met het effectieve ionisatieniveau, en parameters voor systeemtijd naar UTC met de schrikkelsecondegevallen van de ICD.

seg-e4565696f162 = Fitter: een referentiebaan geïntegreerd met zonale J2–J6- of EGM2008-zwaartekracht en luchtweerstand, een geseede vrije of gestuurde klok, een Levenberg–Marquardt-fit op niet-singuliere elementen, vervolgens lineaire kleinste-kwadraten-correctiepolynomen en een klok gefit na aftrek van de relativistische term van de gebruiker.

seg-a7287b7b336c = Vier analyses en scenario's: <c1/> (afstandsfout van het signaal in de ruimte (SISRE) tegen fitinterval en updateperiode), <c2/> (vier modellen, bits, en de fit van Kshana met 22 parameters op de hoogten van Liu et al. naast de gepubliceerde cijfers, MODELLED), <c3/> (continuïteit bij elke boodschapwissel in een passage) en <c4/> (het eigen gedocumenteerde binaire frame van Kshana met CRC-24Q en een kwantisatiebudget, een blok in RINEX-4-stijl dat als Kshana-extensie is gelabeld, en een CSV-tabel).

seg-e272dce3d10f = VALIDATED: de wereldwijd gemiddelde SISRE-gewichten tegen de gepubliceerde tabel voor middelhoge en geostationaire banen van Montenbruck et al. { "2018" }; het Galileo-gebruikersalgoritme tegen RTKLIB op vier echte Galileo-broadcastefemeriden (<c1/>); CRC-24Q tegen de controlewaarde uit de catalogus en het RTCM { "10403" } { "1005" }-voorbeeldframe.

seg-5c8592195b0d = Voorinstellingen, één bestand per stuk met bronnen: Xona Pulsar en Pulsar-0, Iridium, Starlink, CentiSpace, een representatief C-bandsysteem, ATOMIC, en Celeste IOD (de enige voorinstelling die materiaal gebruikt dat is gepresenteerd op de ESA NAVISP LEO-PNT-workshop, { "2026" }, bewaard in <c1/> met zijn scenario's zodat ze kan worden achtergehouden).

seg-9fb0cbf29cef = Navigatie in een lage baan om de aarde: fusie

seg-071f4db017c5 = <b>Gefuseerde MEO + LEO-positiebepaling, -navigatie en -tijdsynchronisatie: <c1/>, <c2/> en <c3/>.</b> Drie nieuwe scenariosoorten in <c4/>, systeemonafhankelijk: elke constellatie bestaat uit Walker-schalen, elementensets of een GNSS-voorinstelling, elk signaal uit een draaggolf, een chipsnelheid en een omhullende van de draaggolf-ruisdichtheid (C/N0), elk foutbudget uit een expliciete één-sigma, en benoemde systemen in een lage baan om de aarde (LEO) zijn optionele voorinstellingen, één bestand per stuk met hun bronnen gemarkeerd als public, workshop of derived (Xona Pulsar X1/X5, Iridium Satellite Time and Location (STL), Starlink-signals of opportunity, CentiSpace, een representatief C-bandsysteem, het efemeridemodel zonder klok ATOMIC, en één ESA Celeste-voorinstelling voor een demonstratie in een baan om de aarde waarvan de uit de workshop afgeleide parameters in <c5/> staan zodat ze kunnen worden achtergehouden).

seg-f28f7a441263 = <c1/> heeft vier modi: Doppler-positiebepaling (batchgewijze kleinste kwadraten op afstandssnelheid met klokdrift- en snelheidstoestanden, een modus met alleen Doppler voor signals of opportunity, de nauwkeurigheid langs het spoor en dwars op het spoor in één passage, en de omhullende van Doppler, Doppler-snelheid en jerk); gezamenlijke gewogen kleinste kwadraten voor GNSS + LEO met één klok per systeem (de inter-systeembias) of een bekende offset, sigma's per meting als invoer, en de DOP tegen het aantal LEO-satellieten; pool- en Arctische dekking tegen breedte; en LEO-tijdoverdracht naar gecoördineerde wereldtijd (UTC) tegen C/N0 en de oscillator van de ontvanger met de uitdrukking van IS-GPS-200 voor systeemtijd naar UTC.

seg-57afa384aabd = <c1/>: een float-extended-Kalmanfilter voor nauwkeurige puntpositiebepaling (PPP) op ionosfeervrije code en fase, alleen GNSS en met LEO-augmentatie, met zijn convergentietijd en een Monte Carlo-consistentietest met NEES (genormaliseerde gekwadrateerde schattingsfout). Het meegeleverde scenario geeft { "7.4" } min met vier MEO-systemen en { "4.8" }, { "3.2" }, { "2.7" } en { "2.3" } min met { "60" }, { "96" }, { "192" } en { "288" } LEO-satellieten, naast de { "9.6" }, { "7.0" }, { "3.2" }, { "2.1" } en { "1.3" } min van Li et al. (J. Geod. { "93" }:{ "749" }, { "2019" }) als MODELLED vergelijking van de trend.

seg-3fa0556b3737 = <c1/>: 5G-positiebepaling met een niet-terrestrisch netwerk (NTN) in de 3GPP n256 mobiele-satelliet-S-band uit de Cramér-Rao-grens voor aankomsttijd en Doppler.

seg-a0cc2699e276 = Scenario's: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (meegeleverd) en <c8/> (alleen in de repository, achtergehouden met de voorinstelling Celeste IOD).

seg-c0b6b98eeac3 = Acht matrixrijen: de LEO-Doppler-omhullende VALIDATED aan de gepubliceerde cijfers van Iridium (±{ "36" } kHz: { "35.9" } kHz, binnen { "5" }%) en Xona Pulsar X1 ({ "32" } tot { "34" } kHz: { "33.6" } kHz uit de schaal van { "97" } graad, zonder verbreding) (<c1/>); Doppler-positiebepaling, gezamenlijke pseudoafstandpositiebepaling, PPP-convergentie, NTN-grenzen, LEO-tijdsynchronisatie, poolbedekking en de voorinstellingen MODELLED. Drie soorten en acht scenariobestanden. Documentatie: <c2/>.

seg-173793480abc = <b>LEO-PNT van begin tot eind: de soort <c1/>, en de LEO-fasen aan elkaar gekoppeld.</b> Eén positiebepalings-, navigatie- en tijdsynchronisatiesysteem (PNT) in een lage baan om de aarde (LEO), gevolgd van zijn signaalontwerp tot de positie van de gebruiker, elke fase de eigen soort van de engine op zijn eigen scenariotabel, met waarden die in code worden doorgegeven (<a1><c2/></a1>):

seg-41a4a2183ba3 = Banden van <c1/> mogen een ontwerp <c2/> noemen (<c3/>): de band neemt het midden, de zendbandbreedte en de chipsnelheid van de gevolgde component van het ontwerp over, verdeelt zijn EIRP (equivalent isotroop uitgestraald vermogen) over de componenten van het ontwerp, en rapporteert van elk epoch de C/N0 (draaggolf-ruisdichtheid) van de gevolgde component en de bandbeperkte codetrackingjitter (de afstandsfout; de paarruis van <c4/> gebruikt die ook). Een band zonder ontwerp geeft dezelfde uitvoer als voorheen.

seg-a076a43a9d44 = <c1/> voert uit: signaal -> passage -> navigatieboodschap -> gefuseerde gezamenlijke positiebepaling van <c2/> -> optioneel <c3/>. Elk LEO-systeem van de positioneringsfase dat ze niet instelt, neemt een C/N0-lijn in sin(elevatie) gefit aan de passage, de afstandsfout van het signaal in de ruimte (SISRE) van de boodschap (de representatiefout op de baan van de satelliet van de passage, met een vermelde baanbepalingsterm <c4/> als wortel van de som van kwadraten), en de draaggolf en chipsnelheid van het ontwerp; de gevallen van nauwkeurige puntpositiebepaling (PPP) nemen de SISRE. Elke overdracht staat vermeld met haar waarde en eenheid, en <c5/> controleert dat elke gelijk is aan de upstream-uitvoer en dat upstream-wijzigingen de downstream-cijfers laten verschuiven. <c6/> is de nieuwe ingang voor de boodschap.

seg-8c256ed478e9 = Scenario's: <c1/> (een generieke constellatie op { "1080" } km en het representatieve signaal <c2/>), <c3/> (het openbare X5-signaal), beide meegeleverd, en het optionele, alleen in de repository aanwezige <c4/>.

seg-879259c7ff86 = De voorinstellingen voor Celeste IOD (in-orbit demonstration) van de gebieden passage, boodschap en gefuseerde positiebepaling staan nu in één bestand, <c1/>, dat <c2/> alleen inbouwt als het bestaat (de configuratievlag <c3/>). De vijf scenario's (<c4/>) staan alleen in de repository, dus het verwijderen van dat bestand en die scenario's houdt elk getal achter dat op de ESA NAVISP LEO-PNT-workshop, { "2026" }, is gepresenteerd, zonder broncodewijziging; <c5/> controleert welke bestanden de voorinstelling mogen noemen of de getallen van zijn bandplan mogen bevatten.

seg-110b1f7c7c63 = Elke LEO-soort in de kruistabel van het geavanceerde rapport, met zijn padspecifieke rijen alleen vermeld wanneer de run dat pad nam (een regenintensiteit, een gebouw, een analyse of modus die liep). De Doppler-vensters van <c1/> krijgen <c2/> en de gevallen van <c3/> krijgen <c4/>, zodat beide animeren; <c5/> en <c6/> exporteren CZML-, KML-, GeoJSON- en STK-efemeriden, en de andere LEO-soorten vermelden waarom een formaat niet van toepassing is.

seg-1419edea5329 = Navigatie in een lage baan om de aarde: veerkracht, aandachtsgebieden en eindgebruikersscenario's

seg-d084d86044b4 = <b>LEO-PNT-veerkracht, één scenario per aandachtsgebied van het experiment en één per eindgebruikerssector, en <c1/> als overzicht van elke LEO-soort en elk scenario.</b> Elk scenario draait zonder Celeste-gegevens en is meegeleverd.

seg-07e91f076ab2 = <c1/> krijgt een sectie <c2/>: een spoofer vervalst, zelfconsistent in afstand en afstandssnelheid, de signalen van een beweerde positie die springt en/of na een begintijdstip van de ware positie wordt weggeduwd (per LEO-band, en het MEO-GNSS-signaal), met of zonder de ionosfeer. Twee monitoren draaien bij een vermelde kans op vals alarm: consistentie van Doppler en passagegeometrie (gemeten afstandssnelheden tegen die welke uit de banen en een onafhankelijke voorafgaande positie en snelheid worden voorspeld; een gegeneraliseerde kleinste-kwadraten-chikwadraat over een venster, op de GNSS-, LEO- en alle kanalen, ruis van de frequentievergrendelingslus uit C/N0) en consistentie tussen de banden (de stap van de modelgecorrigeerde geometrievrije combinatie van elk LEO-bandpaar). Het resultaat geeft de statistieken per epoch (zodat het animeert), elk paar, en wanneer elke monitor detecteert. Bouwstenen in <c3/>. Ontbrekende sectie, ongewijzigde uitvoer.

seg-6a7852f1f053 = Elk bandpaar van <c1/> rapporteert ook de scheve totale elektronendichtheid (TEC) die zijn geometrievrije combinatie op de piek van de passage terugvindt en de sigma van de coderuis van die schatting (ionosfeerpeiling). Dit voegt twee velden toe aan elk multibandresultaat van <c2/>; er verandert geen bestaand getal.

seg-bdf333f4c978 = De tijdsynchronisatiemodus van <c1/> accepteert <c2/>: elke rij rapporteert dan zijn tijdfout en voorspelde sigma op elk epoch, met dezelfde trekkingen, zodat de rijstatistieken ongewijzigd blijven en de run animeert en in een campagne kan worden geketend.

seg-eb4461740dc5 = Een campagne exporteert nu elk ledenscenario dat geometrie heeft (faseruns, de basisscenario's van de sweep en Monte Carlo, samengestelde leden met hun gedeelde waarden gebonden) als eigen bestandsset, met het ledenlabel in de bestandsnaam; eerder exporteerde een campagne niets. De interoperabiliteitstabel in <c1/> verandert dienovereenkomstig.

seg-c0b1f4d9fed0 = Een sweepsleutel van een campagne mag een array van tabellen op positie indexeren (<c1/>).

seg-4c995017dd9c = Veerkrachtscenario's: <c1/> (een barrage in de L5-band van { "50" } MHz, geveegd in vermogen: elk L-bandsignaal valt weg, de LEO-signalen in UHF, S- en C-band houden hun C/N0), <c2/> (J/S-marge uit ontvangen vermogen: GPS L5, Galileo E5a en Xona X5 verloren bij -105, -100 en -95 dBW, een generiek LEO-signaal van -135 dBW dat bij -90 dBW nog wordt getrackt), <c3/> (een sprong van { "30" } m die de Dopplertest met alleen GNSS mist en die de test op alle kanalen { "105" } s na het begintijdstip detecteert), <c4/> (vier spoofers tegen beide monitoren) en <c5/> (GNSS gejamd, de LEO-laag in S- en C-band getrackt, autonome integriteitsbewaking door de ontvanger op de LEO-laag alleen die bij { "2" } van { "30" } epochs alarm slaat).

seg-bae66dac04cc = Scenario's voor aandachtsgebieden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/> (veerkracht in L, S en C is <c8/>).

seg-c7947d9cc592 = Sectorcampagnes, elk geanimeerd en met export van zijn LEO-passages: <c1/>, <c2/> (de meegeleverde maritieme en spoorscenario's plus LEO), <c3/>, <c4/>, <c5/>, <c6/>. Resultaten in één regel in <c7/>.

seg-222ad0b777f8 = Drie matrixrijen MODELLED: de spoofingmonitor voor Doppler en passagegeometrie, de spoofingmonitor tussen de banden, en ionosfeerpeiling. <c1/> controleert de monitoren (stil vóór het begintijdstip, de Dopplerstatistiek kwadratisch in een sprong, de ionosferische stap van een spoofer op de grond en geen bij een spoofer die de ionosfeer kent), de peilingsidentiteit, het tijdspoor tegen de rijstatistieken, en dat de export van een campagne gelijk is aan die van elk lid zelf.

seg-f650b42bf210 = De pagina <c1/> verhuist naar <c2/>; <c3/> is het overzicht.

seg-00a4ba834f37 = <b>Maritieme, weg- en spoorscenario's.</b> Vijf meegeleverde voorbeelden op bestaande soorten, zodat schepen, wegvoertuigen en treinen elk een uitgewerkt geval hebben. Elk cijfer is MODELLED; geen enkel is getoetst aan gemeten gegevens.

seg-682414bbe0c6 = <c1/> (<c2/>): een breedbandjammer van { "50" } W op een mast van { "30" } m, { "30" } km over open water van een schip. Gemiddelde jammer-signaalverhouding (J/S) ongeveer { "48" } dB, en de beschikbaarheid daalt van { "1.00" } naar { "0.00" }.

seg-4666dcd72c24 = <c1/> (<c2/>): een traagheidsnavigatiesysteem (INS) van navigatiekwaliteit met { "12" } knopen, GNSS verloren en geen ondersteuning. Het overschrijdt { "10" } m na { "281" } s en { "100" } m na { "833" } s, de cijfers voor havenaanloop en oceaanwateren van Resolutie A.1046({ "27" }) van de Internationale Maritieme Organisatie (IMO), hier als budgetten gebruikt.

seg-7407bb97aedd = <c1/> (<c2/>): een spoofer van +{ "2" } dB die niet op de draaggolf is uitgelijnd en vier satellieten duwt om een schip { "500" } m weg te slepen. De gefuseerde monitor detecteert hem (score { "0.70" } tegen een drempel van { "0.50" }) op autonome integriteitsbewaking door de ontvanger (RAIM) en bewaking van signaalkwaliteit (SQM); alleen vermogensbewaking mist hem.

seg-1edc0541930b = <c1/> (<c2/>): een auto door een onderdoorgang van { "15" } s en een uitval van { "60" } s door een jammer langs de weg, tegen een budget van { "1.5" } m voor een halve rijstrook. De gefuseerde kwadratisch gemiddelde fout (RMS) tijdens de uitval is { "1.9" } m voor een micro-elektromechanisch systeem (MEMS) van automotivekwaliteit en { "0.7" } m voor een vergelijkingstoestel van tactische kwaliteit; vrijlopend drijft het MEMS-toestel af tot { "850.8" } m.

seg-f9830a49659f = <c1/> (<c2/>): een INS van tactische kwaliteit op een trein met { "160" } km/h in een tunnel. Het overschrijdt { "2" } m (spooronderscheiding) na { "35.8" } s, ongeveer { "1.6" } km binnen, en { "20" } m na { "107.3" } s. Dit is alleen INS: de engine heeft geen odometermodel, dus dit is de pessimistische grens. Het aantal scenariobestanden in de README verschuift van { "77" } naar { "82" }. Alle vijf zijn meegeleverd voor <c3/> en vermeld in de browserplayground.

seg-77c8c53126fd = Model Context Protocol-server

seg-2deb4b35b41a = De Model Context Protocol-server (MCP) bereikt elke soort en elke weergave van een run: zeven nieuwe hulpmiddelen, veertien in totaal.

seg-7f4035dfd9db = <c1/> verwerkte al elke soort; wat een agent ontbeerde was een weg naar een geldig scenario van een soort, en naar de drie uitvoerbestanden die de opdrachtregel naast een resultaat schrijft. Nieuwe hulpmiddelen:

seg-d9df5ab8817a = <c1/> en <c2/> leveren de meegeleverde referentiescenario's (de tabel <c3/>), elk met zijn soort en de eerste zin van zijn eigen kop, byte voor byte het bestand onder <c4/>. Een scenario dat in de repository staat maar niet is meegeleverd, wordt met de reden geweigerd. Elke soort behalve <c5/> (waarvan het gegevensdeel alleen met de repository meekomt) heeft ten minste één voorbeeld.

seg-cb24ad7147ef = <c1/> geeft het rapport van de run terug als JSON (JavaScript Object Notation) of als afdrukbare HTML-pagina (HyperText Markup Language) (<c2/>).

seg-9264b2f20e15 = <c1/> geeft de tijdreeks van de run terug als geanimeerde SVG-tekening (Scalable Vector Graphics), een HTML-speler of genummerde frames, na een JSON-samenvatting van wat is getekend (<c2/>). Een antwoord bevat hooguit { "120" } frames; de opdrachtregel schrijft elke lengte.

seg-959f23871238 = <c1/>, <c2/> en <c3/> leveren de interoperabiliteitsexports en de GeoJSON-routeimport (<c4/>): CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, de STK-efemeride (Systems Tool Kit) <c5/> en SigMF (Signal Metadata Format), met een JSON-index van de bestanden (achtervoegsel, grootte en SHA-256, de digest van het 256-bits Secure Hash Algorithm) en het binaire SigMF-samplebestand als base64.

seg-9ec3f9639b8c = De bibliotheek krijgt een standaard uitgeschakelde feature <c1/> die de referentiescenariotabel beschikbaar stelt als <c2/>; alleen de MCP-server schakelt die in, zodat het Python-wheel en de WebAssembly-module de scenariotekst nog steeds niet bevatten. Studiesuites (<c3/>) blijven alleen via de opdrachtregel beschikbaar, omdat een suite bestanden op schijf noemt en de server er geen leest. De rondgangstests voeren elk nieuw hulpmiddel uit op meegeleverde scenario's en controleren de getallen van de engine: spectrum, het zonnestelsel, constellaties rond de Maan en Europa, een campagnesweep, en de soorten voor signaal, passage, navigatieboodschap, gefuseerde positiebepaling, nauwkeurige puntpositiebepaling, niet-terrestrisch netwerk en van begin tot eind in een lage baan om de aarde (LEO). Elk oppervlak dat het aantal MCP-hulpmiddelen vermeldt of de hulpmiddelen opsomt, zegt nu veertien, behalve de playgroundpagina onder <c4/>, die door de site wordt vervangen.

seg-c11823028688 = kshana.dev, Kshana Studio en de README

seg-fb584cf84218 = <b>Een herontworpen kshana.dev.</b> De ene playgroundpagina is vervangen door een site met meerdere pagina's: Home, Missies, Mogelijkheden, Bewijs, Ontwikkelaars, Edities en Docs, met Kshana Studio één klik verderop. Elke grafiek, kaart en elk getal erop is een vastgelegde run van de engine van deze release, met het scenario en een link die dezelfde run in de Studio heropent; de sitebuild weigert een opname die door een andere enginecommit is gemaakt. De documentatiepagina's worden gegenereerd uit de <c1/> van de repository, en de installatieopties uit haar kanalen. Lettertypen en scriptbibliotheken worden door kshana.dev zelf geserveerd, dus geen enkele pagina vraagt iets op bij een host van een derde partij. Oude adressen (<c2/>, <c3/>, <c4/>-deellinks, <c5/>-embedlinks en de rest) sturen door naar hun nieuwe plaats, en een onbekend adres krijgt een { "404" }-pagina.

seg-9fa1c542332b = <b>Kshana Studio, een dashboard voor elke mogelijkheid.</b> De Studio opent met een startscherm met domeintegels en goede eerste runs, en leidt een run vervolgens door vijf genummerde stappen: Kies een scenario, Stel de parameters in, Voer de engine lokaal uit in de browser, Lees de resultaten (eerst de kerncijfers, elk met een chip PASS of FAIL waar de run een drempel vermeldt, daarna de panelen) en Deel of exporteer. Eén zoekvak vindt scenario's, domeinen en de velden erin en springt naar het bedieningselement; runs kunnen worden vastgezet en vergeleken; een kruimelpad zegt waar u bent; op een telefoon worden de stappen een stapbalk. Elke scenariosoort heeft zijn weergave, waaronder de spectrumwaterfall, het zonnestelsel, constellatiedekking, campagnes, de animatie, het runrapport, de interoperabiliteitsexports en de keten voor een lage baan om de aarde. Een diepe link (<c1/>) opent dezelfde run op het genoemde paneel.

seg-dcf2788bb430 = <b>Onderzoek en citeren.</b> De pagina Bewijs noemt de vijf papers over Kshana op arXiv ({ "2606.22054" }, { "2606.24210" }, { "2607.02566" }, { "2607.05415" } en { "2607.06212" }), elk met een samenvatting, een door deze engine berekende figuur, de opdracht die ze reproduceert, een Studio-link en BibTeX, naast hoe de software te citeren. De README krijgt dezelfde sectie Onderzoek.

seg-fab395bab130 = Een openbare pagina voor Kshana Pro.

seg-167a59e94101 = <c1/> en de pagina Edities van de site zeggen wat de propriëtaire Pro-laag toevoegt aan dezelfde engine (ontwerpoptimalisator, onzekerheid en gevoeligheid, missiedossier, campagnebewaking, spectrumcoëxistentie, lokale jobservice, traceerbaarheid van eisen), wat elk voortbrengt en wat het niet doet. Elk Pro-cijfer dat de site toont, staat vermeld op die openbare pagina. Pro voegt geen fysisch model toe, en de open engine blijft heel en gratis.

seg-f57f0a610943 = <b>Een herschreven README.</b> Korte secties, één afbeelding per sectie, het Kshana-merkteken, twee rijen badges, gegenereerde afbeeldingen van architectuur, scenarioverloop, keten voor een lage baan om de aarde en verificatie (<c1/>, dat faalt bij een verouderde afbeelding), en Studio-screenshots die door <c2/> uit de draaiende Studio zijn genomen. De README's van crates.io, PyPI, npm en de MCP-server volgen hetzelfde ontwerp. Lang referentiemateriaal is ingeklapt of verplaatst naar <c3/>.

seg-e06522ca762e = <b><c1/> is nu het geavanceerde runrapport</b> dat onder Toegevoegd wordt beschreven, en de regel <c2/> van de CLI noemt ook <c3/>. De scorekaart van één pagina die het verving blijft ongewijzigd als <c4/>, die de Python- en WebAssembly-bindings nog steeds teruggeven. <c5/> maakt de zin beschikbaar die <c6/> afdrukt voor elke rij MODELLED; dat document is ongewijzigd.

seg-77a6f35c5c9a = <b>De README zegt waarop Kshana Pro voortbouwt.</b> De sectie Edities en de regel Kshana Pro onder "Support & professional services" vermelden nu wat de gereedschappen van Pro voor modelgebaseerd systeemontwerp (MBSE) en programmabeheer doen en welke gepubliceerde uitvoer van de open engine ze lezen (de <c1/> en <c2/> van elke run, het scenariobestand, het schema van veldeenheden en de labels van de verificatiematrix), en waarop de digitale klokweergaven (digital twins), afwegingsstudies en bewijspakketten in de open engine berusten. Alleen formulering: er verandert geen engine-uitvoer en geen gepubliceerd getal.

seg-1a19675ffa3b = <b>Compatibiliteit.</b> De publieke enum <c1/> krijgt een variant <c2/>, wat een brekende wijziging is voor een aanroeper die hem uitputtend matcht. De kolommen <c4/> en <c5/> van de soort <c3/> veranderen (zie "Herzieningen van gepubliceerde cijfers"). Een run wordt nog steeds gereproduceerd door de engineversie die haar maakte.

seg-e7c5f77a6602 = <b><c1/> op de MCP-server noemde vier soorten als de enige met een CSV-tabel (door komma's gescheiden waarden); zes publiceren er een.</b> Het hulpmiddel gaf de tabel altijd terug voor <c2/> en voor <c3/> (zijn analyse <c4/> op een boodschapmodel <c5/> of <c6/>), maar zijn beschrijving, zijn weigeringsmelding en de documenten die de soorten opsommen lieten beide weg, zodat een agent werd verteld er niet om te vragen. Ze worden nu genoemd, en een rondgangstest haalt beide tabellen op.

seg-4094f58a5f4b = Het frame van de navigatieboodschap in een lage baan om de aarde (LEO) had niet op elk platform dezelfde bytes, en ook niet in elke build van één platform.

seg-5191262de022 = <c1/> codeerde een frame met cyclische redundantiecontrole <c2/> in de releasebuild op aarch64 macOS, <c3/> in een debugbuild van dezelfde broncode op dezelfde machine, en <c4/> in de WebAssembly-build (WASM); <c5/> gaf native <c6/> tegen <c7/> in de browser. Drie oorzaken, elk herleid tot de eerste afwijkende waarde:

seg-f6501c3cd89d = <em>Tussen platforms.</em> De referentiebaan was op beide bit-identiek; het beginpunt van de fit niet. <c1/> neemt de osculerende inclinatie uit een <c2/> en het argument van het perigeum uit een <c3/>, en de twee wiskundebibliotheken ronden die in de laatste plaats verschillend af (over { "20 000" } argumenten verschillen ze bij { "781" } sinussen, { "858" } cosinussen, { "1 931" } exponentiële functies en { "1 899" } arctangens-functies met twee argumenten).

seg-cd6f05096b8b = <em>Tussen buildprofielen.</em> Een geoptimaliseerde build op macOS voegt een sinus en een cosinus van één argument samen tot één aanroep van de gecombineerde routine van het systeem, en zijn sinus is bij { "379" } van { "200 000" } argumenten niet die van de losse <c1/>; een niet-geoptimaliseerde build doet de twee aanroepen. De soort neemt op dertien plaatsen een sinus en een cosinus samen.

seg-91b0700dcb30 = <em>In de klok.</em> De normale sampler van <c1/> roept de <c2/> en <c3/> van de host aan in zijn twee zeldzame takken: van vier miljoen geseede trekkingen verschilden er drie in het laatste bit tussen de native en de WASM-build.

seg-0a4724333429 = De Levenberg–Marquardt-fit, die op deze boog stopt bij zijn limiet van 80 iteraties en niet bij een minimum, draagt één eenheid in de laatste plaats over naar verschillende gekwantiseerde velden. De soort berekent nu elke transcendente functie via de nieuwe <c1/>, die de pure-Rust-crate <c2/> aanroept (al in de afhankelijkheidsboom, nu genoemd in <c3/>), voor elk doel uit één bron gecompileerd en niet een bibliotheekaanroep die de optimizer herschrijft: <c4/> en de scenariocode. Gehele machten op dat pad worden uitgeschreven als square-and-multiply, omdat <c5/> een niet-gespecificeerde precisie heeft, en de referentieklok trekt zijn normale afwijkingen uit <c6/> (de poolmethode van Marsaglia op de ruwe uitvoer van de generator). De gedeelde routines waardoor de referentiebaan wordt geïntegreerd zijn eenmaal geschreven, generiek over de wiskundebibliotheek, met naast de bestaande een crate-interne ingang <c7/>: de bolfunctieharmonische versnelling, de zonale en luchtweerstandsversnellingen, de seculiere J2-snelheden en de Klobuchar-vertraging. De bestaande ingangen zijn tot op het laatste bit ongewijzigd, dus er verschuift geen getal van een andere soort. <c8/> legt het hele frame van 171 bytes vast en één controlewaarde per efemeridemodel, in het gewone (niet-geoptimaliseerde) testprofiel, op elk platform en zonder poort voor een basislijnhost; <c9/> leest de bronnen van de soort van schijf en faalt bij een inherente transcendente aanroep, bij een sampler <c10/>, of bij een aanroep naar een module die niet is beoordeeld. Na de wijziging leveren een debugbuild, een releasebuild en de WASM-build byte-identieke resultaatdocumenten voor alle vijf de scenario's van <c11/>. <b>Dit verschuift getallen, hier als herziening vastgelegd.</b> De soort <c12/> is nieuw in deze release, dus er verschuift niets wat in een eerdere release is gepubliceerd, maar wel elk cijfer van <c13/>, native en in de WASM-build, en daarmee de fase <c14/> van <c15/>: de baancijfers omdat de fit nu start vanuit de draagbare elementen, de klokcijfers omdat de referentieklok een andere realisatie van hetzelfde proces is. <c16/> is opnieuw gegenereerd uit de nieuwe resultaten; zijn gepubliceerde controlewaarde voor het scenario voor coderen en decoderen was <c17/> en is <c18/> (positie binnen { "1.126" } mm van de exacte boodschap waar het { "0.665" } mm was, klok binnen { "0.185" } mm waar het { "0.451" } mm was). De omvang van de veranderingen in de cijfers onder de millimeter is de gevoeligheid van de fit, geen fout in een van beide sets: de fit is ongewijzigd en stopt nog steeds bij zijn iteratielimiet.

seg-c30f4cef4797 = Geseede resampling trok andere indices op een 32-bitsdoel.

seg-2bf668e23ec1 = <c1/> over <c2/> neemt { "64" } bits van de generator op een 64-bitshost en { "32" } bits op een 32-bitshost, zodat dezelfde seed andere indices gaf, en de stroom elders achterliet, in de WASM-build. Drie plaatsen trokken zo: de percentiel-bootstraps in <c3/> (<c4/>, <c5/>), de shuffle voor elke trainingsronde in <c6/>, en de permutatietest in <c7/>. Ze trekken nu via <c8/>, dat altijd als <c9/> bemonstert: precies wat een 64-bitshost deed, dus er verschuift geen native getal. <b>Dit verschuift gepubliceerde getallen van het WASM-pakket, hier als herziening vastgelegd:</b> het bootstrapinterval <c10/> van de oppervlakte onder de curve (<c11/>, <c12/>) was <c13/> in de browser en is nu het native <c14/>.

seg-80f783da1d4f = <b>Bestandsnamen van STK-efemeriden uit mover-id's.</b> Een mover-id met een <c1/> of een spatie (een constellatieschaal en een satelliet, <c2/>) liet de CLI crashen op <c3/>; elk id gaat nu door een veilig bestandsdeel (letters, cijfers, <c4/>, <c5/>).

seg-a0dc5729d5e9 = <b>Het teken van de nutatie bij TEME→GCRS</b>, hierboven beschreven onder "Herzieningen van gepubliceerde cijfers" omdat het gepubliceerde uitvoer verschuift.

seg-5ecbf0787f39 = <b>Scenariosoort <c1/></b> (<c2/>): seconden tot een vrij lopende klok de bewakingsgrens van een tijdgeïndexeerde routerings- of taakslot verlaat, elke bijdragende term op dat moment met de dominante genoemd, de resterende tijd sinds de laatste positiebepaling, en het grootste interval tussen positiebepalingen dat de klok erbinnen houdt, na aftrek van de latentie van de positiebepaling. De klok komt uit een standaard per klasse, een voorinstelling uit een datasheet voor telecom-timing, een inline datasheet (maxima van de Allan-deviatie, veroudering, temperatuurcoëfficiënt) of een gemeten faserecord. Een overschrijding voorbij de langste middelingstijd die de bron ondersteunt, wordt als geëxtrapoleerd gemarkeerd. Meegeleverd voorbeeld: <c3/>. Zie <c4/>.

seg-40dd4c16b760 = <b>Gemeten roodruisvloer.</b> De overlappende Allan-deviatie van een faserecord wordt gefit met gewogen kleinste kwadraten in de basis voor witte fase en frequentiemodulatie volgens IEEE Std { "1139" } (<c1/>), elk punt gewogen met zijn equivalente vrijheidsgraden, zodat een holdover-antwoord kan berusten op de eigen vloer van de klok in plaats van op de klasse-aanname. Een ongewogen fit legde een valse flikkervloer op een testrecord met witte ruis en verkortte een overschrijding van { "2 000" } s met { "30" } %.

seg-22c09748488b = <b>Validatie met achtergehouden gegevens van de holdover-inversie op een echte klok</b> (<c1/>): gefit op het eerste derde van het record van de 5071A-cesiumklok tegen de waterstofmaser, vallen de voorspelde één-sigma-overschrijdingen bij zes drempels van { "0.5" } tot { "2.5" } ns binnen { "0.84" } tot { "1.03" } van de overschrijdingen die op de andere twee derde zijn gemeten, tegen een drempel van { "1.5" } die vóór de eerste run van de test is vastgelegd. Een controle (de Allan-deviatie van één seconde gelezen als witte ruis) mist met een factor van ongeveer { "1 000" } en haalt de drempel niet. Nieuwe registerrij VALIDATED; de workflow <c2/> voert hem nu uit.

seg-cd73dc87a22f = <b>Dezelfde voorspelling op een echte kristaloscillator</b> (<c1/>, <c2/>): op een gemeten oven-gestuurde kristaloscillator is de voorspelling met achtergehouden gegevens behoudend, op { "0.59" } tot { "0.70" } van de gemeten overschrijding en nooit later, en grotendeels buiten de drempel van { "1.5" }, omdat de ruisvloer van die oscillator halveerde tijdens het record van 5.5 uur; in de steekproef gefit komt ze binnen { "0.98" } tot { "1.17" }. Het kristalgeval is niet getoetst aan een externe referentie en blijft MODELLED. De run bracht ook een ontbrekende term aan het licht: de frequentie van een kristal zwerft, dus het model bevat nu de onzekerheid van de frequentie zoals bekend bij de positiebepaling (<c3/>); zonder die term was de voorspelling tot { "2.5" }× te optimistisch.

seg-8519979d184c = <b>Dezelfde voorspelling op atoomklokken in een baan</b> (<c1/>, <c2/>): { "14" } dagen definitieve klokken van de International GNSS Service voor de GPS Block IIF-satellieten, met het protocol opgeschreven voordat de gegevens werden gedownload. Acht van de tien satellieten vallen binnen de drempel van { "1.5" }; G25 en G30 voorspellen overschrijdingen tot ongeveer tweemaal zo laat als gemeten. Het protocol eist dat elke satelliet slaagt, dus het geval in een baan is niet getoetst aan een externe referentie en blijft MODELLED; de uitkomst is vastgelegd.

seg-0d666a725b77 = <b>Klokklassen voor temperatuurgecompenseerd kristal (TCXO), oven-gestuurd kristal (OCXO) en rubidium-atoomfrequentiestandaard (RAFS)</b> (<c1/>, <c2/>, <c3/>), de onderdelen die een commerciële smallsat-bus of een grondgateway meevoert, elk met één openbare datasheet als bron (<c4/>). <c5/>, <c6/> en <c7/> toegevoegd. <c9/> van <c8/> accepteert de drie nieuwe id's. Het toevoegen van varianten aan een publieke enum is een brekende wijziging voor een aanroeper die hem uitputtend matcht.

seg-24ae82b115f5 = <b>Beschermingsniveau voor tijdsynchronisatie bij een ontvanger in een baan</b> (<c1/>, de optionele sectie <c3/> van de soort <c2/>): hoe lang een spoofer op de grond een satelliet in een lage baan om de aarde per passage kan bereiken, de afwijking die een spoofer met een vermelde maximale rampsnelheid opbouwt voordat de satelliet zijn bereik verlaat of een onafhankelijke controle draait, en of elke controle bij grondcontact of crosslink onafhankelijk is van die spoofer. Valt exact terug op <c4/> voor een klok zonder flikker-, witte-fase- of random-run-ruis. MODELLED.

seg-4032bc03fad5 = <b>Drie notities</b>: <c1/> (waaronder tegen welke zwervingsmaat een slot moet worden geaccepteerd: maximale absolute tijdfout, niet maximale tijdsintervalfout of tijdsdeviatie, en waarom), <c2/> (een ondertekend commando dat op een misleide tijd wordt toegepast, leidt nog steeds verkeerd) en <c3/> (waar Kshana draait; er wordt geen vluchtkern <c4/> aangeboden).

seg-712035e19515 = De release { "v0.27.3" } bereikte crates.io (<c1/> en <c2/>) en PyPI, en stopte toen bij npm, zodat npm, de MCP-image op ghcr.io, het MCP-register, de JetBrains Marketplace en kshana.dev haar nooit ontvingen. { "0.27.4" } brengt dezelfde engine, met de releasefix hieronder, naar elk kanaal.

seg-bab8d4d1bc54 = <b>De npm-publicatiestap noemt de tarball met een expliciet pad.</b> npm leest een kaal <c1/> als de GitHub-afkorting <c2/>, dus de npm-job van { "v0.27.3" } probeerde <c3/> te klonen en faalde met "Permission denied (publickey)". De tarball zelf was gebouwd en geattesteerd. De stap publiceert nu <c4/>. Alles na npm in de releasevolgorde (de MCP-image, de JetBrains-plug-in, de kanaalpariteitscontrole en de site) is overgeslagen, zoals ontworpen.

seg-f9a112755eb1 = <b>De eenhedencatalogi van telecom-timing en <c1/> zijn uitgezonderd van copy-paste-detectie</b>, onder hetzelfde beleid en dezelfde rechtvaardigingstest als de andere catalogi. De kwaliteitspoort van SonarCloud was rood geworden door duplicatie in nieuwe code ({ "4.0" }% tegen { "3" }%), en elk gedupliceerd blok was een eenhedenrij of een ITU-T-maskervermelding.

seg-3c3dacae06d6 = <b><c1/>: hoe lang de navigatie van een kleine drone standhoudt nadat GNSS is gejamd.</b> Het vergelijkt een micro-elektromechanische (MEMS) traagheidseenheid van vluchtcontrollerklasse, een Bosch BMI088, met een eenheid van tactische kwaliteit. Het GNSS-signaal (Global Navigation Satellite System) is { "100" } s nominaal en wordt dan { "60" } s geweigerd (<c2/> laat zien waarom een jammer in de buurt dat doet). De biassen van de BMI088 zijn de residuen die na de kalibratie bij het opstarten overblijven, genomen uit de temperatuurcoëfficiënten in zijn datasheet (BST-BMI088-DS000-19 rev { "1.9" }): { "0.015" } °/s per K voor de gyro en < { "0.2" } mg per K voor de versnellingsmeter. Twee aannames zijn in het bestand gemarkeerd: een opwarming van { "10" } K na de kalibratie, en voortdurende opwarming van { "1" } K per minuut tijdens de vlucht. De drift tijdens de vlucht is de fout die het filter niet kan leren voordat de jamming begint, en zij maakt een einde aan de coast. Elk cijfer is gemodelleerd; om het te toetsen zijn vluchtlogs uit een gejamde omgeving nodig. <c3/> drukt het af.

seg-7154f69a2b8a = <b>Elke sensor van <c1/> kan zijn eigen filterprior instellen</b> (<c2/> of <c3/>, met <c4/> en <c5/>). De standaard is ongewijzigd, dus elk bestaand scenario geeft hetzelfde resultaat. De resterende gyrobias van een eenheid van consumentenkwaliteit ligt ongeveer { "26" } sigma buiten de standaard voor tactische kwaliteit, waar het filter hem nooit zou leren. Een prior die niet eindig en positief is, wordt geweigerd, en het resultaat echoot de prior wanneer er een is ingesteld.

seg-2b54735b19aa = <b><c1/> geeft een gebruiker van het register een scenario om uit te voeren.</b> Een gebruiker van <c2/> heeft het uitvoerbare bestand en geen map <c3/>, dus de eerste opdracht die elke quickstart gaf, faalde. De opdrachtregelinterface (CLI) bevat nu de { "75" } referentiescenario's die op zichzelf draaien, byte voor byte, ingecompileerd uit <c4/> (<c5/>; de tabel staat in de CLI-binary, zodat het Python-wheel en de WebAssembly-module niet groeien). <c6/> somt ze op; <c7/> schrijft er een weg. De andere twee bestanden staan alleen in de repository: <c8/> leest gearchiveerde laserafstandsmetingen naar de Maan die alleen met de repository meekomen, en <c9/> is een studiemanifest dat drie zusterbestanden uitvoert met <c10/>. Om een van beide vragen levert de reden en sluit af met { "2" } in plaats van iets af te drukken wat niet op zichzelf kan draaien. <c11/> houdt de tabel in beide richtingen gelijk aan de map, zodat een nieuw scenariobestand dat niet is meegeleverd en niet als alleen-repository is benoemd, faalt.

seg-43249b6a1f3c = <b>Elke kwaliteitsmaat in een klok-, baan-, hybride- of fusieresultaat zegt nu of ze VALIDATED of MODELLED is, in het resultaat zelf.</b> Het resultaatdocument krijgt een blok <c1/>, altijd zijn laatste sleutel. Het somt elk gerapporteerd cijfer op (bijvoorbeeld <c2/>) met zijn niveau — VALIDATED betekent gecontroleerd aan een onafhankelijke externe referentie, MODELLED betekent een model uit eerste beginselen dat intern is getest — en de rij van de verificatiematrix waaruit het niveau wordt gelezen. Het niveau komt uit <c3/> via <c4/>, dus er is geen tweede tabel die kan afdwalen. Hiervoor kwamen de woorden "getoetst" en "gemodelleerd" nul keer voor in een klok-holdover-resultaat, en een lezer van de ruwe JSON (JavaScript Object Notation) kon de twee niet uit elkaar houden. De positiecijfers van <c5/> en <c6/> hebben geen eigen matrixrij, dus ze staan onder <c7/> in plaats van een niveau te krijgen. Het blok bevat geen getallen. Het is bewezen additief, niet aangenomen: door het te verwijderen krijgt men het document van vóór de wijziging byte voor byte terug, voor alle vijf de soorten (een enginetest), en beide golden-harnassen (<c8/>, <c9/>) strippen nu precies deze sleutel, en alleen als het de laatste is, en hashen de rest tegen hun <b>ongewijzigde</b> bevroren constanten. Een lijst in elk harnas legt vast welke scenario's het blok moeten bevatten, zodat de uitsluiting niet ongemerkt kan groeien.

seg-8faf1981d797 = <b>Een soort <c1/> antwoordt in de eenheden van een timingengineer: tijdfout, maximale tijdsintervalfout (MTIE) en tijdsdeviatie (TDEV), elk met PASS of FAIL en een marge tegen de maskers van de International Telecommunication Union Telecommunication Standardization Sector (ITU-T).</b> De maskers zijn overgenomen uit de geldende edities: G.8272 (07/2025) voor de klassen A en B van de primaire referentietijdklok (PRTC), G.8272.1 ({ "2024" }) Amd. { "1" } (07/2025) voor de verbeterde PRTC in vergrendelde modus en in holdover (waaronder zijn tijdfoutomhullende, die van { "30" } ns tot { "100" } ns stijgt over een holdoverperiode die wordt bepaald door hoe lang de klok vergrendeld was), G.8273.2 ({ "2023" }) Amd. { "2" } (11/2025) voor telecom-boundary- en time-slave-klokken, klassen A tot D, en G.8271.1 ({ "2022" }) Amd. { "3" } (05/2025) voor de netwerkgrenzen op referentiepunt C. Elke vermelding die die Aanbevelingen "for further study" laten, ontbreekt en is niet geschat, en <c2/> somt elk getal op met zijn tabel of clausule en elk item dat is weggelaten. Het rapport geeft ook de tijd tot overschrijding van elk tijdfoutbudget: standaard de { "100" } ns standaard voor ePRTC-holdover, een toewijzing van { "400" } ns voor netwerkholdover, de grens van { "1 100" } ns op punt C en de end-to-end-eis van { "1.5" } microseconde voor klasse { "4" }.

seg-9e5325e1b0ca = De invoer is een synthetische holdover of een reeks van uzelf. De synthetische gebruikt een van vier oscillatorvoorinstellingen (een oven-gestuurde kristaloscillator, een rubidiumstandaard, een cesiumstandaard en een chip-scale atoomklok), elk met de stabiliteits-, verouderings- en temperatuurcijfers van een benoemde Microchip-datasheet. Hoe die cijfers wit, flikker- en random-walk-frequentieruis, veroudering en een temperatuurterm worden, staat in elk rapport vermeld en is gelabeld als MODELLED. Een reeks van uzelf bestaat uit paren <c1/>, inline (zo draait het in de browser) of, bij native builds, uit een bestand met door komma's gescheiden waarden. De MTIE/TDEV-tabel, met naast elke waarde de grens van elk geselecteerd masker, wordt geschreven als het CSV-artefact van de run.

seg-a23a96819dee = <c1/> is een rubidium-holdover van 24 uur met veroudering, flikker en een dagelijkse temperatuurcyclus: de grootste tijdfout is { "603.2" } ns, hij overschrijdt { "100" } ns { "8 206" } s na het verlies en blijft de hele dag binnen { "1.5" } microseconden, en hij haalt de omhullende voor ePRTC-holdover niet, zoals een klok die niet van cesiumklasse is hoort te doen. <c2/> toont de inline invoer. De MTIE en TDEV die de soort rapporteert worden gecontroleerd met het pakket allantools op een vastgelegde holdoverreeks van { "2" } 048 samples, exact voor MTIE en tot { "1.1e-15" } voor TDEV, zodat de matrix één rij VALIDATED en twee rijen MODELLED erbij krijgt (de maskertranscriptie en de voorinstellingen) en nu staat op <b>{ "171" } rijen — { "65" } VALIDATED, { "102" } MODELLED, { "4" } PARTNER</b>. De dekking van veldeenheden gaat van { "60" } van { "61" } soorten naar { "61" } van { "62" }, en van { "1,742" } naar { "1,788" } beschreven velden. De soort is nieuw en additief: geen bestaand scenario, geen pin en geen gepubliceerd cijfer verschuift.

seg-5bb1ad9a34ec = De playground voert de engine uit in een Web Worker op de achtergrond, zodat een traag scenario de pagina niet meer bevriest.

seg-b1ab3546f131 = <c1/> host de WebAssembly-engine en <c2/> stuurt elke scenario-uitvoering ernaar door — runs, parametersweeps en de exports naar SP3 / OMM / OEM / CSV. Een run die langer dan { "150" } ms duurt, toont een bezettoestand (Run uitgeschakeld, "Running… N s") en een knop Annuleren die de worker beëindigt en opnieuw start; een browser die geen modulewerker kan starten, valt terug op het oude pad via de hoofdthread. <c3/>, uit de catalogus weggelaten omdat het de pagina bevroor, staat er weer in, als traag gelabeld: het duurt ongeveer { "13" } s in Chrome (vier engineaanroepen van elk ongeveer { "3" } s), waarin de pagina responsief blijft.

seg-146200dfac7e = <b>Elke gerapporteerde grootheid van <c1/> heeft nu een eenheid, een herkomstklasse en een definitie — de op een na laatste soort op de crate-brede uitzonderingslijst.</b> Alle { "41" } numerieke velden van het UITGEBRACHTE document zijn beschreven, zodat de dekking van veldeenheden van { "59" } van { "61" } soorten naar { "60" } van { "61" } gaat en van { "1,698" } naar { "1,742" } beschreven velden, terwijl de achterstand zonder definitie ongewijzigd { "239" } blijft.

seg-61b1219ae0e3 = Dit werd geblokkeerd door de pin die het uitgebrachte document bevriest, die <c1/> noemde als een sleutel die het document nooit mocht krijgen. Er een toevoegen had betekend dat die assertie werd verwijderd en drie hashes in drie bestanden opnieuw werden vastgelegd — een vorm die niet te onderscheiden is van het toedekken van een regressie. In plaats daarvan <em>bewijzen</em> de twee pins die dit document meten nu dat de toevoeging additief is: elk strip het blok <c2/> er weer af en hasht opnieuw tegen de constante die is bevroren voordat het blok bestond, en <b>beide constanten zijn ongewijzigd</b>. Een mutatie bevestigt dat de garantie echt is — verplaats een uitgebrachte waarde en leg de hash van het hele document opnieuw vast zoals een slordige fix zou doen, en het strippen en opnieuw hashen faalt nog steeds. De derde pin, in het generieke registry-golden-harnas, is opnieuw vastgelegd in lijn met de zes zusters die om precies deze reden opnieuw zijn vastgelegd, en zijn waardedragende literal <c3/> verschuift niet.

seg-a73409e0b664 = <c1/> rapporteert aan welke referentie elke rij voor aarde-oriëntatie is getoetst, en hoe vaak de terugvaloptie werd gebruikt.

seg-6e0493a39f1a = <c1/> krijgen <c2/> en <c3/>. De vloer <c4/> wordt gescoord tegen de definitieve waarden van Bulletin B en kan alleen epochs gebruiken die er een publiceren; elke rij <c5/> wordt gescoord tegen <c6/>/<c7/>, die terugvallen op de snelle waarde van Bulletin A. In het meegeleverde uittreksel van { "2026" } zijn dat { "12" } van { "31" } samples bij één dag, tegen { "0" } bij de vloer — dus de vloerrij en de voorspellingsrijen ernaast berusten aantoonbaar op verschillende referenties, wat het rapport nu vermeldt in plaats van het te laten afleiden uit een aantal samples dat stijgt waar geneste horizons dat niet kunnen.

seg-7ba5be07fa8c = <c1/> geeft een Kepler-basislijn met gelijke grootte.

seg-f9dc8fae6452 = <c1/> voert de illustratieve constellatie opnieuw uit met het eigen aantal satellieten van de OPGEHAALDE set, alleen aanwezig wanneer de aantallen verschillen. Het aantal maakt deel uit van de geometrie van dat ontwerp — RAAN en gemiddelde anomalie worden allebei gespreid als <c2/> — dus zonder dit werd een opgehaalde set van vijf satellieten gescoord tegen een illustratieve van acht satellieten en werden ontwerp en grootte door elkaar gehaald. Voor de LANS-referentieset van vijf satellieten blijkt { "8.68" } van het dekkingsverschil van 14.24 punten te komen door de drie ontbrekende satellieten en slechts { "5.56" } punten door het ontwerp; voor de vier ruimtevaartuigen die werkelijk in een baan om de Maan zijn, bereikt een speciaal gebouwde set van vier satellieten { "4.86" } % waar zij { "0" } % bereiken. Een test legt vast dat de gematchte rij een herbouwde constellatie is en niet de geconfigureerde onder een andere naam, zoals hij eerst was geschreven en wat de run toen rapporteerde.

seg-2e7e4dbbb7f6 = <b>Negen mogelijkhedenkaarten op de openbare site, die { "22" } rijen van de verificatiematrix dekken die zonder kaart op productniveau zijn geleverd.</b> De engine had een familie van mogelijkheden gekregen — de ARAIM-controle tegen gepubliceerde referentievectoren van Working Group C, echte opgehaalde geometrie van een maanconstellatie, de maanontkenningscontour met een gemeten C/N₀-band, de stap van VLBI-schema naar stationscovariantie, optische en RF-overdracht met foutinjectie tussen modaliteiten, voorspelling van aarde-oriëntatie in real time tegen gearchiveerde Bulletin A, het delen van apertuur tussen navigatie en communicatie, INS/TRN-coasting, en dekking van eenheden en herkomst — elk met een matrixrij en een meegeleverd scenario, en geen enkele genoemd op kshana.dev. De dekking van kaart naar rij gaat van { "72" } van { "168" } rijen naar { "94" }.

seg-14599ab79300 = <b>CR3BP-familieleden tegen de Three-Body Periodic Orbits API van JPL: NOT MET</b> (RM-35, vooraf vastgelegd a9074f65). <c1/> (halo-, NRHO- en DRO-correctie, stabiliteitsindex van de monodromie, pseudo-booglengtecontinuering) komt bij { "54" } van de { "58" } API-leden overeen op elke drempel (toestand, periode en Jacobi overal binnen { "1e-10" }). Eén stabiliteitsindex van een L1-halo ({ "9.5e-2" }) en drie sluitingen van kleine DRO's ({ "1.5e-8" } tot { "3.3e-8" } tegen { "1e-8" }) halen de drempel niet, dus de module is <c2/> en geen enkele rij claimt haar. Resultaten: <c3/>.

seg-0cd0e67a2e28 = <b>Optionele DE440-maanoriëntatie en -omgeving</b> (FUT-05, DS-LRO-08; standaardwaarden ongewijzigd): <c1/>, <c2/> / <c3/> (aan de epoche verankerd, DE440-hoofdassen) en <c4/> (ingebedde DE440 PA-oriëntatie plus de geocentrische Zon en Maan uit een door de gebruiker aangeleverde DE440 SPK). Tegen ANISE (vooraf vastgelegd ea537710): oriëntatie binnen { "3.5e-7" } rad en LRO-fits binnen { "1" } mm, maar het efemeridedeel haalde zijn drempel niet (Zon { "30.7" } m, Maan { "1.1" } m, een tijdsverschuiving van ~{ "1" } ms aan de kant van ANISE), dus het is geen getoetste rij. Resultaten: <c5/>.

seg-92cc171c69da = <b>Datum van de maanstelselcampagne, naar conditie geschaalde NumPy-drempel: NOT MET</b> (vooraf vastgelegd b887eb05; blijft MODELLED). Stap { "0" } sluit de pseudo-inverse-terugval uit als oorzaak van het verschil van { "0.30" } in geschatte stations; NumPy komt bij zes van de acht scenario's binnen de drempel overeen, maar stations_estimated haalt hem niet ({ "6.8e-6" } tegen { "5.9e-7" }), en op de nieuwe datum 2026-12-01 maakt een niet-waargenomen bakenpunt op de zuidpool de bakeninformatie rangdeficiënt, wat de ongewijzigde onafhankelijke referentie niet kan evalueren. Resultaten: <c1/>.

seg-8d2f1e9708ff = <b>Maanstelseldatum uit een echte waarnemingscampagne (analytische Maan) VALIDATED</b> op nieuwe EDC-normaalpunten van { "2025" } (vooraf vastgelegd 31f5283 voordat er een was opgehaald): de ongewijzigde SPICE- en NumPy-referentie komt overeen op boekhouding, rangen en nulkoppeling, en binnen { "1.11e-3" } op sigma's (drempel { "1e-2" }), { "8.95e-4" } op de conditie en { "1.79e-3" } op de verhoudingen dwars/langs (drempel { "2e-2" }). Alleen een bibliotheekcontrole van de covariantieberekening; de drempels maken geen onderscheid tussen maanmodellen. Resultaten: <c1/>.

seg-058d7d490111 = <b>IAU-lichaamsoriëntatie en GM van de veertien toegevoegde lichamen van het zonnestelsel</b>, afgesplitst van de rij "Fysische constanten van elk lichaam van het zonnestelsel" tot een VALIDATED rij (vooraf vastgelegd 154bc54): <c1/> komt overeen met SPICE <c2/> op pck00011 binnen { "1e-9" } rad op { "574" } matrices op de oorspronkelijke epochen en op { "574" } op { "41" } nieuwe epochen die nooit eerder zijn vergeleken (slechtste Phobos { "1.38e-10" } rad), en <c3/> is gelijk aan gm_de440 voor alle veertien lichamen. De rest van de oorspronkelijke rij (J2, gemiddelde straal, het rapport) blijft MODELLED. Resultaten: <c4/>.

seg-56c445aa8d9e = <b>Lambert met meerdere omwentelingen</b> (<c1/>): elke oplossing met maximaal drie omwentelingen, beide takken. Nieuwe registerrij, VALIDATED tegen pykep { "3.0.1" } (vooraf vastgelegd a75de851; { "382" } gevallen, { "1058" } oplossingen, grootste snelheidsverschil { "1.6e-13" } tegen { "1e-8" }). De interne Kepler-landingsbewaking vond één beperking van <c2/> op een boog met e = { "0.994" }; die is vastgelegd in <c3/>.

seg-b62dc38b09e9 = Box-wing- en ECOM2-zonnestralingsdruk (DS-PA-14), optioneel.

seg-fd50e846d10e = <c1/>: een box-wing-model met platte panelen met de Galileo FOC/IOV-tabellen uit de GSC-satellietmetadata, bij nominale GNSS-yawsturing, met stralingsfactor en partiële afgeleiden per paneel, en het empirische ECOM2-model met zijn partiële afgeleiden. Te kiezen met <c2/> / <c3/> (velden <c4/>, standaard <c5/>: het kanonskogelpad en elke golden blijven ongewijzigd); bij een box-wing-set is <c6/> de stralingsfactor ervan. Vergeleken met Orekit { "12.2" } onder een preregistratie (<c7/>): elke drempel gehaald, ongeveer { "1e-15" } relatief; VALIDATED als modelevaluatie, de Galileo-SRP-voorspelling blijft MODELLED.

seg-fd7a7fe09705 = <b>SRP-schaduw van de afgeplatte Aarde en zonnerandverduistering (FUT-09, RM-11).</b> Nieuwe module <c1/>: <c2/> (occulterende WGS-84-ellipsoïde), <c3/> (wet van Eddington) en <c4/>, te kiezen met <c5/> (standaard: de bestaande bolvormige kegelschaduw, ongewijzigd); <c6/>. De schaduw van de afgeplatte Aarde komt overeen met de verlichtingsverhouding van Orekit { "12.2" } binnen { "7.4e-9" } over { "2400" } geometrieën (VALIDATED, <c7/>); zonnerandverduistering heeft geen externe onafhankelijke referentie (MODELLED).

seg-f09d4b831dfe = NRLMSISE-00-thermosfeer (FUT-08, RM-10, DS-PA-13).

seg-1f838a403840 = <c1/>: een port van <c2/> en <c3/> (schakelaars, modi met dagelijkse Ap en 3-uurlijkse ap-array) uit de publiekedomeinversie in C van de NRL-Fortran. Hij is bitgelijk aan die C-port en ligt binnen { "1.9e-6" } relatief van pymsis { "0.13.0" } (NRL-Fortran, enkele precisie) op een raster van 720 punten, en hij reproduceert de { "17" } gepubliceerde testgevallen (VALIDATED; <c4/>). Dit toetst de port, niet de nauwkeurigheid van het model ten opzichte van gemeten dichtheid.

seg-9e8e9018dbaf = Optioneel NRLMSISE-00-niveau voor weerstandsdichtheid.

seg-7dd643f46e89 = <c1/>, <c2/>, <c3/> en <c4/>. Het statische exponentiële model blijft de standaard, bit voor bit. Het ruimteweer is constant per model. VALIDATED op baanniveau tegen de eigen NRLMSISE-00-weerstand van Orekit { "12.2" } over { "24" } h (slechtste { "0.03" } m tegen tot { "142" } km weerstandsverplaatsing; <c5/>).

seg-b1b2ac9ac91e = Optionele DE440-Zon en -Maan in de Cowell-propagator (RM-33, FUT-10).

seg-4f323703b251 = <c1/> neemt elke <c2/> (bijv. een DE440 <c3/>) voor de termen van derde lichamen en SRP; hij weigert een provider die de epoche niet kan bedienen, telt terugvallen op de analytische reeks en staat standaard uit. <c4/> behoudt tweedelige precisie. Tegen Orekit { "12.2" } op zijn eigen DE440-lezer komen banen van { "24" } h overeen tot { "0.017" } m; de vooraf vastgelegde drempel voor de positie van Zon/Maan werd niet gehaald ({ "6.4" } m / { "0.24" } m; SPICE toont hetzelfde verschil), dus MODELLED (<c5/>).

seg-6ac7f3f65b33 = Optioneel atmosferisch S1-getij (DS-PA-03).

seg-35da1ed0dc83 = <c1/> en <c2/> (Biancale & Bode { "2006" }, GFZ STR06/01 Tabel { "1" } model N1, graden { "2" }–{ "6" }), ingeschakeld met <c3/> op <c4/> en <c5/>; standaard uit. MODELLED (coëfficiënten opnieuw gecontroleerd aan de gepubliceerde tabel; geen externe onafhankelijke referentie voor het krachteffect).

seg-c62d816a93cf = Batchbaanbepaling met afstandssnelheid en azimut/elevatie met een elevatiemasker (RM-36, FUT-13).

seg-689c4b8d44d0 = <c1/>, <c2/>, <c3/>, <c4/> (variationele STM met analytische tweelichamen- en J2-partiële afgeleiden), <c5/>, <c6/>; <c7/>. Het pad met alleen afstand is ongewijzigd. Vergeleken met de kleinstekwadratenbatch van Orekit { "12.2" } over { "8" } vooraf vastgelegde scenario's: elke drempel gehaald behalve de overeenstemming van de ruisloze toestand (≤ { "1" } cm), die bij { "2" } van de { "4" } scenario's werd gemist met { "1.46" } en { "1.74" } cm, waarbij kshana binnen { "1e-8" } m van de referentie lag; vastgelegd, MODELLED.

seg-223f1e39669f = SP3-nauwkeurigheidsweging (DS-PA-06).

seg-b5560ff1c426 = <c1/> en <c2/> koppelen de nauwkeurigheidscodes uit de header en per record aan sigma's van waarnemingen; een met SP3 gewogen Galileo-fitvariant (Tier-2 3D-RMS { "0.035" } m tegen { "0.070" } m ongewogen) is toegevoegd naast de ongewijzigde vastgelegde runs. MODELLED.

seg-831d35c5f97e = <b>Dispatchjob voor de volledige Swarm-A-boog (DS-PA-08)</b> in <c1/>.

seg-cc5e8af7cb0d = Planetaire zwaartekracht uit PDS SHADR-tabellen (CAP-30, deel van CAP-31).

seg-bc9149c18ea8 = <c1/> (<c2/>) leest Mars GMM-3 (d/o { "120" }) en GRAIL GL0660B (d/o { "660" }); <c3/> koppelt elk geladen veld (standaardwaarden ongewijzigd). Uitsneden tot graad 20 zijn meegeleverd (NASA PDS, publiek domein; <c4/>); de volledige bestanden worden opgehaald door <c5/>. VALIDATED tegen pyshtools { "4.14.1" } (binnen { "4e-15" } van de totale zwaartekracht bij d/o { "120" } over de hele bol, { "5e-14" } bij d/o { "660" } voor |lat| ≤ { "60" }°); de koppeling aan het lichaamsstelsel blijft MODELLED (het eigen stelsel van elk veld is niet het gebruikte IAU-stelsel).

seg-afb5fbf86ffc = Zwaartekracht van hoge graad tot graad { "2190" } (RM-14, FUT-07).

seg-28bc597b06b2 = <c1/> / <c2/> (gemodificeerde voorwaartse kolom van Holmes–Featherstone, geen underflow, geen polaire singulariteit), <c3/>, een streamende ICGEM-lader <c4/> / <c5/> (controles op normering en maximale graad, getijsysteem vastgelegd, tijdvariabele termen geweigerd) en <c6/> (volledige EGM2008, met SHA-256 vastgepind, niet meegeleverd; tests afhankelijk van <c7/>). <c8/> kiest het op de optionele <c9/>. Komt overeen met Orekit { "12.2" } tot { "7.3e-17" } m/s² tot en met graad { "2190" }, en een baan van { "24" } h { "200" }×{ "200" } komt overeen tot { "0.13" } m. MODELLED: pyshtools haalde de vooraf vastgelegde drempel nabij de pool niet (herleid tot pyshtools) en de gevoeligheidscontrole van de baan op graad 70 haalde de drempel niet ({ "0.73" } m < { "1" } m); beide zijn vastgelegd in <c10/>.

seg-4ef4f74f21c1 = DOP853-integrator (FUT-11).

seg-d2bdb4ff5009 = <c1/>, <c2/>, <c3/> (dense output van de 7e orde), <c4/>, <c5/>, met een stapbewaking die bij fouten sluit; <c6/>, <c7/>, <c8/>. De standaarddriver is ongewijzigd. VALIDATED tegen SciPy { "1.18.1" } <c9/>: enkele stappen binnen { "5.6e-15" }, overeenkomende staprijen, eindtoestanden binnen { "1.6e-12" } (<c10/>).

seg-d36f657f93ad = <b>Robuuste Kepler-oplosser (FUT-12).</b> Nieuwe module <c1/>: <c2/> (starter van Markley { "1995" }, residu zonder cancellation) voor alle { "0" } ≤ e < { "1" }, omhuld door <c3/>. VALIDATED tegen wortels van mpmath met 50 cijfers tot { "0.9" } ε·|E| tot e = { "0.999999" } (<c4/>).

seg-5e82deb7c853 = Optionele tesserale aardzwaartekracht in de Cowell-propagator (RM-09).

seg-e1a7ad42211e = <c1/> krijgt <c2/> (<c3/>, <c4/>). Het evalueert een <c5/> (meegeleverde EGM2008 tot graad/orde { "70" }, of elk ICGEM-<c6/>) in een aardvast stelsel dat wordt bereikt via de aardrotatiehoek (<c7/>) of via de CIO GCRS-naar-ITRS-keten (<c8/>). Standaard <c9/>: geen bestaande uitvoer verandert. VALIDATED tegen Orekit { "12.2" } Holmes–Featherstone over { "24" } h ({ "6" } gevallen, slechtste { "0.036" } m), met de drempels vooraf vastgelegd in <c10/>.

seg-957686bb351e = <b>Tweedelige juliaanse datums door de aardrotatie op het baanpad</b>: <c1/>, <c2/>, <c3/> / <c4/>, <c5/> en <c6/>, <c7/>-conversies tussen <c8/> en <c9/>, en een optionele <c10/> voor het scenario <c11/> (ECEF, grondspoor en stationsweergave; standaard uit en ongewijzigd, en de sleutel wordt bij uitgeschakelde stand weggelaten uit de scenariohash). Nieuwe registerrij, VALIDATED tegen pyerfa <c12/>/<c13/> (vooraf vastgelegd b10475ee; { "40" } datums: GMST bitgelijk, matrix binnen { "2.7e-14" }, rotatie over stappen van { "1" } µs binnen { "1.1e-14" } rad, waar het pad met één <c14/> ze niet haalt). De Cowell-krachtmodelepoche blijft met één <c15/>; de reden staat in de bijbehorende documentatie.

seg-0680b1f4c98b = <b>EOP-voorspelling voorbij de tabel</b> (<c1/>, <c2/>): een optionele uitbreiding van een IERS-reeks voor aardoriëntatie met de LS+AR-voorspeller, uitgegeven op de laatste rij ervan, zodat de stelselargumenten van een latere epoche de voorspelling volgen in plaats van op de laatste rij vast te klemmen. Antwoorden binnen de tabel zijn bitgelijk (getest); de reeks klemt nog steeds vast tenzij dit wordt aangeroepen. De nauwkeurigheid van de voorspelling blijft de bestaande LS+AR-bevinding ten opzichte van Bulletin A (MODELLED).

seg-a7d272a1ddd6 = <b>Hemelpooloffsets dX, dY op de CIO-keten</b> (<c1/>), en directe ERFA-vectorcontroles van <c2/>, <c3/> en de nieuwe functie. Nieuwe registerrij, VALIDATED tegen pyerfa (vooraf vastgelegd 979c1e39; { "40" } epochen { "1950" }–{ "2100" }: precessie en CIO bitgelijk, TEME→GCRS binnen { "1.1e-10" } rad, het voorspelde effect van de reeks met twee termen voor de equation of the equinoxes). Bestaande functies zijn ongewijzigd.

seg-20d19a2d65ec = <b>UTC van vóór 1972 op het tweedelige tijdpad</b> (<c1/>, en <c2/>, <c3/> en <c4/> vanaf 1960-01-01): het tijdperk met driftende snelheid ("rubber-second"), met de drifttabel van SOFA, fractionele stappen aan het einde van de dag en de schaling van UTC naar SI van de dagfractie. Nieuwe registerrij, VALIDATED tegen pyerfa <c5/>/<c6/>/<c7/> (vooraf vastgelegd 23c40661; { "117" } momenten { "1960" }–{ "1971" }, slechtste { "2.9e-11" } s tegen een drempel van { "1" } µs). Elk resultaat van { "1972" }+ is bitgelijk (checksum vastgepind vóór de wijziging). Vóór { "1960" } is TAI − UTC gelijk aan { "0" }, zoals in SOFA. De <c9/> met één <c8/> is ongewijzigd.

seg-3ff0d080d9e6 = <b>GLONASS-uitgezonden satellietklok</b> (<c1/>): <c2/> uit het RINEX-record, op een tijd afgelezen op de satellietklok (twee iteraties met vast punt, de RTKLIB-conventie). De ingelezen <c3/> en <c4/> werden voorheen niet gebruikt. Nieuwe registerrij "GLONASS-uitgezonden satellietklok en propagatie van de uitgezonden baan", VALIDATED tegen RTKLIB 2.4.2-p13 <c5/>/<c6/> (vooraf vastgelegd e099c42a; { "292" } gevallen op een echt uitgezonden bestand van { "2013" }: klokverschil { "0" } s, slechtste positie { "1.1" } mm tegen een drempel van { "1" } cm). Bibliotheekfunctie; geen scenariouitvoer verandert. Er wordt geen PZ-90.11 → ITRF-transformatie toegepast, en de module zegt dat.

seg-71ae2ee163e0 = <b>PPP-tijdoplossing tegen de IGS-stationsklok</b> ({ "0.36" }, FUT-19): de ontvangerklok van het float-PPP-filter op WTZR komt overeen met de definitieve gecombineerde IGS-klok voor het station tot { "0.075" } ns (standaardafwijking) met een constante offset van −{ "0.66" } ns over de geconvergeerde twee uur. De drempels werden vooraf vastgelegd in <c1/>. VALIDATED (nieuwe registerrij). Nieuwe fixture <c2/>, de stationsklokrecords van het definitieve IGS-klokbestand dat al voor de satellietklokken wordt gebruikt.

seg-463ac67600b1 = <b>PPP-pariteit met gLAB</b> ({ "0.36" }, WP-07, RM-31): gLAB { "6.0.0" } werd als afzonderlijk hulpmiddel uitgevoerd op dezelfde WTZR-invoer (Apache-2.0-kern; downloadchecksum geverifieerd aan de gepubliceerde lijst), met de opdrachtregel van een procedureel amendement dat vóór de run was vastgelegd. Bij de eerste geregistreerde run komen het float-PPP van Kshana en dat van gLAB binnen { "0.05" } m overeen bij { "240" } van de { "240" } epochen en tot { "5.0" } mm bij de laatste. De SPP-drempel werd niet gehaald (mediaan { "1.187" } m tegen { "0.50" } m) en is als bevinding vastgelegd: de eigen SPP-oplossingen van gLAB en RTKLIB verschillen { "0.852" } m van elkaar. De geregistreerde regel laat daarom de delen van beide hulpmiddelen als geheel niet gehaald, terwijl de PPP-pariteit standhoudt.

seg-158717c78c80 = <b>Lezen van RINEX-{ "4" }-navigatiebestanden</b> ({ "0.36" }, WP-07, PRO-41): <c1/> leest RINEX 4.00-4.02-navigatiebestanden (<c2/> GPS LNAV, Galileo I/NAV en F/NAV, BeiDou D1/D2, QZSS LNAV; andere records overgeslagen tot de volgende recordheader), en <c3/> neemt opties. VALIDATED tegen het samengevoegde RINEX-{ "3" }-bestand van IGS van dezelfde dag: elk gedecodeerd veld identiek en { "0" } m in positie. Het lezen van RINEX 2/3 is ongewijzigd.

seg-57aa5c6ef4f8 = <b>Uitgezonden GEO-posities van BeiDou</b> (optioneel): <c1/> en <c2/> (BDS ICD, helling van −{ "5" } graden). <c3/> slaat GEO's nog steeds over. MODELLED: de vooraf vastgelegde vergelijking met een nauwkeurige baan hangt af van data en is nog niet uitgevoerd.

seg-416f58111d1f = <b>RINEX-{ "4" }-waarnemingsbestanden</b>: een echt RINEX-{ "4.00" }-MGEX-waarnemingsbestand wordt in tests gelezen (MODELLED, formaatcontrole).

seg-64b4664c0ff6 = <b>RTK met LAMBDA op echt RINEX</b> ({ "0.36" }, WP-07 ★): <c1/>, dubbele verschillen over een korte basislijn van GPS-code en -fase op twee frequenties met een float-Kalmanfilter en LAMBDA-fixering van geheeltallige waarden (ratiotest). VALIDATED op de IGS-stations WTZR en WTZZ ({ "1.4" } m uit elkaar) tegen hun ITRF2020-basislijn onder vooraf vastgelegde drempels: gefixeerd op elke epoche na de eerste tien minuten, mediane basislijnfout { "4.5" } mm en 95e percentiel { "5.5" } mm.

seg-69db4437ebbb = <b>RTKLIB-pariteit van de PPP met echte data</b> (RM-31): <c1/> en <c2/> met vooraf vastgelegde drempels. PPP van RTKLIB v2.4.2-p13 op dezelfde WTZR-invoer komt bij de derde registratie overeen met Kshana binnen { "5" } cm op elke epoche van de laatste twee uur ({ "9.7" } mm aan het einde); de eerste twee runs, als bevindingen vastgelegd, hadden het vaste getij uit staan en de ontvangerantenne op de basisslot van RTKLIB. De pariteitsdrempel voor enkelvoudige positiebepaling werd niet gehaald ({ "1.09" } m mediaan tegen { "0.5" } m). Het deel met gLAB is niet uitgevoerd (hangt af van data).

seg-fb6e053a0a9d = <b>Navigatieberichtcoders voorbij LNAV</b> ({ "0.36" }, WP-07, PRO-40): <c1/> codeert GPS CNAV (berichttypen { "10" }, { "11" }, { "30" }; CRC-24Q; continue codering met rate 1/2 K={ "7" }), Galileo I/NAV (woordtypen 1-5 in even/oneven nominale pagina's; 30x8-interleaver; sync <c2/>) en Galileo F/NAV (paginatypen 1-4; 61x8-interleaver; sync <c3/>), met testdecoders. MODELLED: rondgangen en bekende antwoorden uit de ICD; een vooraf vastgelegde controle dat uitgezonden Galileo-efemeriden op het LSB-raster van de coder liggen hield stand (slechtste { "3.6e-3" } LSB) maar haalde de drempel voor het aantal satellieten niet ({ "15" } van { "20" }), vastgelegd. De coders zijn bibliotheekfuncties; koppeling aan de scène maakt geen deel uit van deze wijziging.

seg-562f36eb18e6 = <b>IONEX-bestandslezer</b> ({ "0.36" }, WP-07): <c1/> met <c2/>, <c3/>, <c4/>, <c5/> en <c6/>: een strikte IONEX-{ "1.0" }-lezer met vaste kolommen, met epochen geteld vanaf de dag van de eerste kaart, <c7/> gelezen als ontbrekend, RMS-kaarten en de tijdinterpolaties van het formaat naar de dichtstbijzijnde, opeenvolgende en geroteerde kaart; schuine TEC op de schaalhoogte uit de header. Gecontroleerd op een vastgelegde synthetische kaart en, afhankelijk van data (bij de test opgehaald met een vastgepinde SHA-256, niet meegeleverd), op een uitsnede van een echte CODE-GIM: elk knooppunt exact; interpolatie komt overeen met een formulereferentie tot { "4e-13" } TECU. <c8/> van RTKLIB komt overeen tot { "3.6e-13" } TECU bij { "6885" } punten (vooraf vastgelegd B6). VALIDATED op bewijs dat van data afhangt (besluit van de eigenaar, 2026-10-13): de test faalt bij elke andere kaart dan de met SHA vastgepinde.

seg-9fac2e8535c8 = <b>Hatch-draaggolfafvlakking</b> ({ "0.36" }, WP-07): <c1/> en <c2/>, de divergentievrije (ionosfeervrije) vorm in de nauwkeurige enkelvoudige-positieopbouw. MODELLED met een vastgelegde bevinding: op het IGS-station WTZR verlaagt het de mediane fout van enkelvoudige positiebepaling van { "1.55" } m naar { "1.12" } m en het 95e percentiel van { "3.47" } m naar { "3.21" } m, minder dan de vooraf vastgelegde reductie van { "40" } % (de resterende fout is biasachtig, geen ruis).

seg-7e4c7639d102 = <b>Float-PPP op echt RINEX</b> ({ "0.36" }, WP-07): <c1/>, een statisch float-filter voor nauwkeurige puntpositiebepaling op echte GPS-code en -fase op twee frequenties met definitieve IGS-producten (antenne-offsets en -variaties, vaste-aardegetij, phase wind-up, Shapiro-vertraging, geschatte natte vertraging, detectie van cycle slips), met <c2/>. VALIDATED op het achtergehouden IGS-station WTZR tegen zijn ITRF2020-coördinaat onder vooraf vastgelegde drempels: na { "6" } h is de fout { "1.5" } mm horizontaal en { "2.9" } cm verticaal, en elke epoche van de laatste twee uur ligt binnen { "10" } cm.

seg-173aa308e3e8 = <b>Interpolatie van nauwkeurige SP3-klokken</b> ({ "0.36" }, WP-07): <c1/> en <c2/> interpoleren de getabelleerde SP3-satellietklokken lineair tussen de twee omsluitende geldige knooppunten (sentinel voor slechte klok overgeslagen), en <c3/> voert ze aan <c4/>, zodat de nauwkeurige keten vanuit alleen een SP3 draait. VALIDATED tegen de definitieve IGS-klokken van { "30" } s van 2025-02-24 onder vooraf vastgelegde drempels: { "32" } GPS-satellieten, RMS in het midden { "0.121" } ns (drempel { "0.15" } ns), 95e percentiel { "0.265" } ns (drempel { "0.30" } ns).

seg-e7c4e88d4ba4 = <b>RAIM naast de kwaliteitsmaten van clock-holdover</b> (CAP-05b): een optionele sectie <c1/> bij het kloktype rapporteert een afzonderlijk blok <c2/> (snapshot-RAIM op een voorgeïnstelde hemel vanaf een opgegeven locatie: oordeel per epoche en beschermingsniveaus, beschikbaarheid; niet beschikbaar zolang GNSS wordt geweigerd, nooit geëxtrapoleerd). De holdover-cijfers zijn ongewijzigd; zonder de sectie is de uitvoer byte-identiek. MODELLED.

seg-99d9a67fc2f3 = <b>Ontvangervertrouwensdrempels gekalibreerd op JammerTest { "2024" }</b> (CAP-13): een vooraf vastgelegde kalibratie van de monitoren voor C/N0-daling, AGC en jamming-indicator op de openbare dataset JammerTest { "2024" } (tijdens de run opgehaald, nooit meegeleverd; <c1/>), alleen geleverd als de optionele <c2/> ({ "1.5" } dB, { "3.5" } sigma, { "29" }). Achtergehouden: de drempels voor AGC, jamming-indicator en de unie worden gehaald; de drempel voor valse alarmen van C/N0 niet ({ "0.023" } tegen { "0.02" }), dus de rij is MODELLED (<c3/>). Standaardwaarden en uitvoer zonder het profiel zijn ongewijzigd.

seg-8ccd18c54b4b = <b>ARAIM-foutehypothesen met meerdere satellieten</b> (CAP-05a): de subsetregel van ADD v4.2 gegeneraliseerd voorbij paren (<c1/>, <c2/>; orde { "2" } is precies het bestaande door MAAST gecontroleerde pad) en een optionele geavanceerde RAIM over die hypothesen (<c3/>), die de subset met de grootste scheiding rapporteert wanneer een fout wordt gedetecteerd. Priors die diepere subsets vereisen worden geweigerd, nooit afgekapt. MODELLED.

seg-02f1f2d72263 = <b>Skyline in ontvangervertrouwen</b> (FUT-01): een ontvangervertrouwenssessie kan een <c1/> opgeven; satellieten erachter gaan voor de hemel verloren (<c2/>, <c3/>, <c4/>) en hun verliezen worden als <c5/> ingedeeld, nooit als <c6/>; zonder skyline zijn de terugval op azimutgaten en elke uitvoer als voorheen. De trainingsgenerator voor bemanningen krijgt een gebeurtenis <c7/> (een geblokkeerde hemel, geen interferentie) en het scenario <c8/>. De UERE x DOP Monte Carlo krijgt de twee gemaskeerde skyline-geometrieën uit de ontwerpnotitie, alleen vooraf vastgelegd: alle { "26" } controles slagen.

seg-69fa2ecdc4e9 = <b>Verificatie van RFC-{ "3161" }-tijdstempels</b> (CAP-14): <c1/> controleert de handtekening van een tijdstempeltoken (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 en P-384), de ESS-binding van het ondertekeningscertificaat, het timeStamping-gebruik van de ondertekenaar en zijn keten naar een vertrouwd anker op de genTime van het token, offline; <c2/> past dat toe op de <c3/> van een pakket (optioneel; zonder dit is het rapport ongewijzigd). VALIDATED, in beperkte zin: alle { "27" } zelf gegenereerde gevallen komen overeen met OpenSSL { "3.0.13" } over het oordeel en de genTime, onder een vergelijking die is vastgelegd voordat de verificator werd geschreven. Intrekking wordt niet gecontroleerd.

seg-1b7777e600a8 = <b>Verificatieniveaus per cijfer voor elk type</b> (RM-04): het resultaat van elk scenariotype eindigt nu met een blok <c1/> dat de kerncijfers noemt, de rij van de verificatiematrix die elk ervan bezit en het niveau dat uit die rij wordt gelezen (cijfers die geen rij bezit worden als zonder niveau vermeld). Het blok wordt na de run toegevoegd en valt byte voor byte terug op het vorige document (<c2/>). <c3/> heeft geen <c4/> totdat een nieuwe gedateerde voorspelling de bevroren voorspelling vervangt; <c5/>, <c6/>, <c7/> en <c8/> hebben geen scalair kerncijfer, en <c9/> schrijft compacte JSON. Campagneleden behouden hun documenten zonder niveau.

seg-7a54dfab93dc = Toegevoegd (trainingsstreams)

seg-0b01d1d871e2 = <b><c1/>: synthetische brug-NMEA { "0183" } voor bemanningstraining in het herkennen van GNSS-jamming en -spoofing.</b> Uit een scenario-TOML schrijft het een bestand of streamt het via TCP of UDP (unicast of broadcast; in real time, versneld of zo snel mogelijk) de volledige brugset GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT en VBW voor een vaartuigspoor met limieten voor draaisnelheid, versnelling en stroming, met satellietgeometrie uit de eigen nominale constellaties van de engine. Gescripte gebeurtenissen op een tijdlijn: jamming, wegslepen van de positie (een geldige positiebepaling die wegloopt), tijdspoof en een replay-vertraging, elk met oplopende en aflopende hellingen voor begin en herstel. Een instructeurslogboek (JSON en tekst) legt vast wat wanneer is geïnjecteerd, met het ware spoor naast het gerapporteerde. Een bibliotheek in <c2/> (jamming op open zee, wegslepen aan de kust, tijdspoof bij havenanadering, gecombineerd) bevat trainersnotities. De uitvoer heeft geldige checksums en is deterministisch per seed; tests leggen per scenario een golden uittreksel vast en lezen elke zin met de NMEA-lezer van <c3/>. Alleen tekst: geen RF-, IQ- of golfvormuitvoer; de streams zijn voor training en tests en mogen nooit worden toegevoerd aan de live navigatiesystemen van een vaartuig. Zie <c4/>.

seg-bb8d508c92fa = Maritieme integraties ({ "0.35.0" }, werkstroom B)

seg-538cdf145ac1 = <b>Signal K-plugin</b> (<c1/>, niet op npm gepubliceerd): draait of verbindt met <c2/> (de eigen NMEA-invoer van de server, aangepaste invoerargumenten, een JSON-lines-TCP-feed of de <c3/>-zinnen van een gate-stream), publiceert de vertrouwensscore, de band, de redenen, de alarmen en de gate-status onder <c4/> (inclusief de door de ontvanger gerapporteerde positie als context, nooit <c5/>), en geeft een Signal K-melding (<c6/> bij degraded, <c7/> bij untrusted, met drempels voor vasthouden, wissen en veroudering, allemaal in het configuratieschema). Geen npm-afhankelijkheden. Getest op vastgelegde synthetische uitvoer.

seg-b6eb7110291e = <b>OpenCPN</b>: NMEA in gate-modus wordt rechtstreeks geleverd door <c1/> (aanbevolen); een TCP-relay zonder afhankelijkheden (<c2/>) is het optionele alternatief. In beide gevallen ziet OpenCPN een ongeldige positiebepaling wanneer het vertrouwen instort en <c3/> in zijn NMEA-debugvenster; tests spelen de synthetische gated stream opnieuw af via een echte TCP-socket en controleren wat een afnemer ontvangt. Een native score-paneelplugin (<c4/>, plugin-API { "1.18" }, CMake) leest <c5/> uit de eigen NMEA-stream van OpenCPN en waarschuwt bij de untrusted band; hij wordt gebouwd, zijn logica is met unittests getest en hij is binnen OpenCPN { "5.8.4" } onder een virtueel scherm uitgevoerd (bewijs en een reproductiescript in <c6/>); hij is niet verpakt voor de pluginmanager.

seg-bb26e8c1aff0 = <b>Referentiebuild</b> (<c1/>): generieke onderdelenlijst, OS-inrichting, systemd-units voor de adviserende monitor en de optionele gate (gecontroleerd met <c2/> door <c3/>), een containeroptie, Signal K-bedrading.

seg-6695d4c1f13b = De Signal K-plugin accepteert het live JSON-schema { "1.2" } (een <c1/> en daarna een toegevoegde sleutel <c2/>; onbekende toegevoegde sleutels worden genegeerd), gecontroleerd op echte uitvoer van { "1.2" } en tegen een echte signalk-server.

seg-622c2d3dd8fa = Reviewcorrecties: de systemd-units herstarten altijd en draaien in een sandbox (geen shell, geen netwerk waar dat niet nodig is), een logrotate-snippet, <c1/> faalt bij elke bevinding; de container draait de gate vanuit omgevingsvariabelen met een healthcheck en basisimages die met een digest zijn vastgepind; Signal K-scoremetadata, de verouderde melding wordt vervangen wanneer er weer data komt, fouten van kindprocessen blijven behouden en kills escaleren, onveilige <c2/> worden geweigerd en de melding staat op <c3/>; de relay begrenst een vastgehouden onvolledige regel; de <c4/>-parsers weigeren scores buiten { "0" } tot { "100" }; een controle van documentatielinks; een CI-workflow (<c5/>) die dit alles uitvoert, inclusief de echte binary end-to-end.

seg-7c615a62ca26 = <c1/>. Adviserende software, geen typegoedgekeurde apparatuur; de exploitant blijft verantwoordelijk. Alleen software: er wordt niets uitgezonden en er wordt geen detectie- of valsealarmcijfer geclaimd.

seg-72cb9f45ce99 = Toegevoegd: compliance-mapping en test-bench-export

seg-15aae04a9490 = <b><c1/> en <c2/>.</b> Een mapping van Kshana-uitvoer naar vijf raamwerken en normen voor veerkracht (het Resilient PNT Conformance Framework v2.0 van het Amerikaanse DHS, IMO-richtsnoeren voor schepen, EASA-richtsnoeren voor de luchtvaart, NIS2 artikel { "21" }, EN { "16803" }, een betaalde norm die wordt aangehaald per deel en met de enkele clausulenummers die in de catalogustekst zichtbaar zijn), één tabel per raamwerk: de verwijzing, wat het in onze parafrase vraagt, de uitvoer die er bewijs voor levert en het gat. Bronversies, URL's en wat wel en niet is gelezen worden vastgelegd. <c3/> vult de mapping vanuit de opgegeven runs en markeert elke rij als <c4/>, <c5/>, <c6/> of <c7/>, als Markdown en JSON, met het gat op elke rij bewaard. De formulering is "levert bewijs voor"; er wordt niets beoordeeld of goedgekeurd. Tests gebruiken synthetische runs en falen wanneer een vastgelegde tabel afwijkt van de code.

seg-ee9a0a43e4b0 = <b><c1/>.</b> Schrijft de voertuigbeweging en gebeurtenissen van een scenario <c2/>, <c3/> of <c4/> voor een GNSS-simulator in het laboratorium: een CSV met gebruikersbeweging met gedocumenteerde stelsels en een metadata-sidecar, NMEA { "0183" } <c5/>/<c6/>, waypointtekst en de gebeurtenissen als CSV en als <c7/>-blokken <c8/> (<c9/>). Alleen beweging en gebeurtenissen: er wordt geen signaal geschreven. Elk bestand wordt teruggelezen in <c10/> en vergeleken binnen zijn opgegeven tolerantie. <a1><c11/></a1> beschrijft de methode om de export via een simulator opnieuw af te spelen en het log van de ontvanger te beoordelen met <c12/>.

seg-fc0fe915ed3d = <b>Wat als bewijs telt.</b> Een resultaat telt voor een mogelijkheid alleen wanneer het de velden bevat die zijn type schrijft; een typelabel alleen telt voor niets. Onbekende typen, een resultaat dat afwijkt van zijn zusterscenario, niet-hexadecimale hashes en onjuiste tellingen van ontvangervertrouwen worden met de reden als niet gebruikt vermeld. Het rapport escapet Markdown-cellen en kan niet in paniek raken bij een niet-ASCII-hash. <c1/> en <c2/> nemen teksten, geen paden.

seg-6b46de1164d8 = Test-bench-export.

seg-c48a4dd4134b = <c1/> wordt op bereik gecontroleerd (<c2/>); het waypointbestand controleert elk interval en de opdracht zegt waarom wanneer er een wordt weggelaten; de documentatie vermeldt dat de koers van <c3/> de gier van het lichaam is en niet de koers over de grond, de plaatshaldervelden van <c4/> en de eigen hoogteverandering van het scenario. <c5/> en <c6/> staan in de gebruikstekst.

seg-eb2e415ec540 = <c1/> maakt de ware toestandshistorie van het rijprofiel van <c2/> beschikbaar (dezelfde stapgrootte die de eigen referentie van het type gebruikt), en <c3/> krijgt NMEA-datum- en tijdvelden.

seg-fbfc1a59e99b = Validatie van de interferentiekaart

seg-a68d88381eea = <b>De decoderingssemantiek en de geometrie van de interferentiekaart worden op synthetische invoer getoetst aan onafhankelijke implementaties.</b> NIC- en NACp-codebetekenissen tegen pyModeS-decodering van synthetische ADS-B-frames, de niet-beschikbaar-waarden van AIS tegen pyais-decodering van synthetische AIVDM-zinnen, celtoewijzing in het raster tegen shapely, routelengte per celstatus tegen shapely en GeographicLib, en maskering van het binnenland tegen shapely en pyproj, elk met een tolerantie die vóór de eerste vergelijking is vastgelegd (<c1/>). Dit toetst hoe codes en veldwaarden worden gelezen en de geometrie, niet dat een gemarkeerde cel interferentie is. De lezer van landpolygonen sluit nu een ring die zijn eerste hoekpunt niet herhaalt, die hij voorheen zonder de laatste rand las. De documentatie vermeldt de drempels voor lage nauwkeurigheid van NACp en NIC als de grens die elke code vertegenwoordigt (NACp { "6" } is een EPU-grens van { "556" } m, NIC { "5" } een insluitingsgrens van { "1" } NM).

seg-cf4ffdbba1a6 = Toegevoegd (validatie van de telemetrieformaten en bewijspakketten)

seg-ad6730e0e891 = <b>Externe controles van de cryptografie van het bewijspakket, de pakketverificator en de telemetrie-wireformaten.</b> De Ed25519-testvectoren uit RFC { "8032" } sectie { "7.1" } ({ "1" }, { "2" }, { "3" } en { "1024" }) en de SHA-256-voorbeelden uit FIPS 180-4 lopen door de eigen functies van het pakket voor ondertekenen, verifiëren en hashen, tot exacte gelijkheid. Een in Python geschreven verificator, alleen op basis van de normatieve sectie van <c1/> (hashlib en <c2/>), komt overeen met de Rust-verificator op { "71" } intacte en gemanipuleerde pakketten: oordeel, foutenverzameling, handtekeningoordeel en beide ketenkoppen. Onze Prometheus-weergave wordt gelezen door de parser van de officiële Python-client en onze OTLP-JSON door het officiële bericht <c3/>, strikt, en beide komen overeen met de toestand waaruit ze zijn gemaakt. CEF en LEEF hebben geen onafhankelijke open validator en blijven gemodelleerd. <c4/> kreeg het normatieve pakketformaat en de verificatieprocedure waaruit de clean-room-verificator is geschreven; <c5/> kreeg <c6/>. Onafhankelijke referenties en fixtures: <c7/>, <c8/> met <c9/>, <c10/>; tests <c11/>, <c12/> en <c13/>. CI heeft geen Python nodig.

seg-20d1b02bfda4 = Toegevoegd (validatie van de CEF-gebeurtenissen)

seg-8c464e43e43d = De CEF-telemetriegebeurtenissen worden door twee onafhankelijke opensource-parsers correct teruggelezen.

seg-a6321d13b0ab = <c1/> { "1.11" } en de Logstash-CEF-codec (<c2/> { "6.2.7" } in Logstash { "8.15.3" }) parsen { "157" } CEF-regels (elke bandwisseling en elke epoche van de vastgelegde telemetriestream, plus tegenstrijdige tekst met <c3/>, backslashes, pipes, regeleinden, tabs en tekst met meerdere bytes) en herstellen elk headerveld, de ernst, de exacte verzameling extensiesleutels en elke waarde exact. De Logstash-codec leest ook vier regels waarvan de headertekst escaping nodig heeft, wat <c4/> niet kan. De drempel werd vastgelegd voordat een van beide parsers werd uitgevoerd (<c5/>); fixtures in <c6/>, scripts voor de onafhankelijke referentie <c7/> en <c8/>; CI heeft noch Python noch Logstash nodig. LEEF heeft geen onderhouden open parser en blijft gemodelleerd. De CEF-gebeurtenissen dragen nu de vertrouwensscore en de epocheoffset in de aangepaste kommagetalvelden van het CEF-woordenboek (<c9/>, <c10/>) in plaats van de gehele-getalvelden <c11/> en <c12/>, die voor geen van beide waarden pasten; CEF is nieuw in deze release, dus er verandert niets aan wat al is geleverd.

seg-65b362fa8711 = MCP: <c1/> accepteert het log als <c2/> of <c3/>; toolinvoer is begrensd op { "4" } MiB.

seg-8999974aa1fa = De jamminggrafiek haalt haar kleuren ook uit het palet.

seg-8c8ff384dbf6 = <c1/> was de ene module die de herziening van het Observatory-palet op haar eigen kleuren liet staan terwijl het werk aan jammer-Q landde; haar <c2/> (de <c3/>, <c4/> en andere scenario's van het type <c5/>) leest nu <c6/>, en de allowlist in <c7/> is leeg. Alleen kleuren en lettertype: de grafieken <c8/> en <c9/> zijn gelijk aan hun eerder vastgelegde renders zodra kleur, <c10/> en de versievoettekst zijn genormaliseerd. Er is geen geplotte waarde verschoven. De vastgelegde Studio-kopieën onder <c11/> zijn opnieuw vastgelegd bij de re-ports van { "0.33.0" } en { "0.34.0" } (alleen versiestempel): ze dragen nog de oude kleuren van de jamminggrafiek en nemen het palet over bij de volgende re-port.

seg-a059d10c5330 = <b>De 3-sigmagrens van het klokensemble dekt nu de flickervloer, en de filtergezondheidscontrole ziet die.</b> Met een <c1/> droeg de ware klok flicker-FM, maar het filter met twee toestanden dat de integriteitsgrens levert deed dat niet, dus de 3-sigmadekking van het meegeleverde scenario <c2/> was { "0.41" } (klassiek) en { "0.33" } (kwantum), en de NIS/NEES-controle, die haar eigen waarheid uit het model van het filter trok, meldde identieke waarden met en zonder de vloer. De grens is nu de variantie van twee toestanden plus de exacte variantie van de flickerfase die sinds de laatste synchronisatie is opgebouwd, berekend uit dezelfde bank die de ware klok gebruikt; de NIS/NEES-controle trekt haar waarheid uit het uitgebreide model met die bank en draait het bijpassende uitgebreide filter (en het filter met twee toestanden tegen flickerwaarheid meldt <c3/>). Uitvoerwijziging, alleen voor klokken met een <c4/> ongelijk aan nul: <c5/> op <c6/> gaat van { "0.40866" } / { "0.33026" } naar { "0.99970" } / { "1.0" } (klassiek / kwantum) en de NIS/NEES van <c7/> bevatten nu de flicker; de tijdfout, <c8/> en <c9/> zijn ongewijzigd, en scenario's zonder vloer zijn byte-identiek. <c10/> (baantype, seed { "7" }, vloeren { "1e-16" } / { "2e-11" }) verschuift ook: <c11/> klassiek { "0.7734" } naar { "1.0" } en kwantum { "0.9796" } naar { "1.0" }, en de NIS/NEES van <c12/> en hun banden veranderen. Het kwantum-<c13/> slaat om van <c14/> naar <c15/>: een steekproefgebeurtenis van het flickerensemble van 16 seeds bij 60 stappen (NIS { "0.8815" } tegen een band van [{ "0.9125" }, { "1.0914" }]), geen defect. De band is een band van { "95" } %, dus ongeveer { "5" } % van de seeds markeert van nature een bijpassend filter ({ "40" } nieuwe seeds van dit scenario: kwantum { "1" } en klassiek { "2" } gemarkeerd); bij { "64" } bij { "200" } ligt dezelfde seed voor beide klokken binnen de band (NIS { "0.990" } en { "1.001" }). Bekend vervolg: het type fusion heeft hetzelfde gat (klassieke integriteit { "0.80" } met een vloer); het type hybrid blijft boven { "0.99" }.

seg-c7308350b6d4 = <b>Invoer van de MCP-server verscherpt.</b> De scenariotools van de MCP-server accepteren nu alleen inline inhoud en weigeren bronvelden die naar bestanden verwijzen; de invoergrootte is begrensd. Beveiligingsadvies: <a1>GHSA-8wpf-hqg5-6xjr</a1>.

seg-065c4431197e = Lab replay: een trackingengine, detectiemonitoren en een campagnerunner voor GNSS-IQ-opnamen, met de bijbehorende lusontwerpen, C/N0-schatters en scores. Bewijsklasse: alles hieronder is <b>MODELLED</b> of gecontroleerd op interne consistentie tegen gesloten vormen en geseede simulatie; niets ervan voegt een VALIDATED rij toe, en het verificatieregister is ongewijzigd ({ "251" } rijen: { "124" } getoetst, { "123" } gemodelleerd, { "4" } partner). Het is een softwareanalyselaag: niets hiervan synthetiseert een golfvorm van een jammer of spoofer, en er wordt niets uitgezonden.

seg-912ecb44cee4 = Lab replay: testcondities, campagnerunner en beoordeling ({ "0.34.0" }).

seg-962c50f9ce8d = <c1/> speelt opnamen × front-endketens × lusontwerpen (<c2/>) opnieuw af en beoordeelt elke cel aan de hand van een testconditiebestand per opname (<c3/>, TOML of JSON). Dat bestand vermeldt wat een lab over de opname weet: de verwachte satellieten en, per gebeurtenis, het typelabel, begin en einde, getroffen satellieten en het opgegeven J/S- of jammervermogensprofiel. Het zijn alleen metadata. De scores per satelliet, voor de hele run en per gebeurtenis, zijn:

seg-180447aaf31e = beschikbaarheid, tijd tot verlies van lock en de opgegeven J/S bij het verlies;

seg-1ababddb0d87 = herverwervingstijd, vanaf het einde van de gebeurtenis en vanaf het verlies;

seg-a6468323c971 = gemeten C/N0-degradatie per opgegeven J/S-bin;

seg-4cb6f510e159 = false-lock-episodes per locked uur (de vlag van de tracker, of Doppler tegen een waarheidssidecar);

seg-97c6243bac2e = jitter van de PLL- en DLL-discriminator.

seg-014b28f61db8 = Naast elke gemeten degradatiecurve wordt een analytische referentie voor spectrale scheiding (<c1/> met de <c2/> van het type) getekend en overal waar ze voorkomt gelabeld als MODELLED.

seg-eb5c38197dab = Cellen draaien parallel door de lock-toestandsmachine van de trackingsessie, en elke wordt atomair geschreven onder een sleutel met inhoudshash. De sleutel omvat de SHA-256 van de opname, de hashes van conditie, front-end, ontwerp, run en beoordeling, de vereiste <c1/> (<c2/> | <c3/>) en de engineversie. Met <c4/> ingesteld worden van elke cel ook de stream <c5/> en de lock-gebeurtenissen bewaard, benoemd naar celsleutel en in de cel gehasht. <c6/> en <c7/> zijn openbaar, zodat een afnemer elke sleutel en de digest opnieuw kan afleiden. Een herhaalde run slaat dus voltooide cellen over, en de uitvoer hangt nooit van het aantal workers af. De run schrijft <c8/>/<c9/>, een op zichzelf staande <c10/> en een <c11/>. Drempels voor pass/fail (<c12/>, per opname te overschrijven) worden toegepast wanneer het rapport wordt opgebouwd.

seg-beec1c1264c9 = <c1/> (standaard <c2/>, deel van de beoordelingshash) kiest de C/N0 achter de gerapporteerde C/N0 en de degradatiecurve. Beide schattingen worden altijd beoordeeld en gerapporteerd (mediaan over de hele run en over de basislijn, en per J/S-bin), en de cel en de scorecard leggen de schatter vast. NWPR leest ongeveer { "8" } dB × Bn·T te laag onder de eigen jitter van de lus; M2M4 niet.

seg-baf1a2422a66 = Ook nieuw:

seg-f36e22ff54c3 = <c1/> bouwt de scorecards, het rapport en de digest opnieuw op uit de cellen;

seg-aad7fcc28bc8 = <c1/> controleert een testconditiebestand tegen zijn schema;

seg-c3e5e4461aaa = <c1/> importeert de annotaties <c2/> van een SigMF-opname als gebeurtenissen;

seg-c1a2ebb844c5 = Python krijgt <c1/>, <c2/> en <c3/>;

seg-cd69258ccc09 = <c1/> krijgt <c2/>, dat incrementeel is en hervatbaar onder het samplebudget per aanroep, met elk bestand beperkt tot de werkmap, en <c3/>.

seg-c398b66a7058 = Tests: <c1/> draait een synthetische campagne van { "3" } opnamen × { "2" } front-ends × { "2" } ontwerpen. De scènes bevatten opgegeven C/N0-profielen, en de test dekt:

seg-3f2fbdecb101 = elke metriek gecontroleerd tegen de geïnjecteerde waarheid;

seg-e103a30260db = hervatten na een gedeeltelijke run met één worker met een corrupte cel, byte-identiek aan een ononderbroken run met vier workers;

seg-79164d8b0b22 = epochebestanden per cel;

seg-9470016f056a = een regressietest van { "20" } s met herverwerving van drie satellieten: met <c1/> aan is elk kanaal binnen { "2" } s na een onderbreking van { "2" } s terug; de uitkomst met <c2/> uit is vastgepind;

seg-1deb4ab83054 = drempels opnieuw beoordeeld zonder opnieuw te draaien;

seg-351f9cdcbcd6 = de CLI;

seg-2c35af369a36 = genegeerde doorvoer- en geheugencontroles in release-modus, waaronder een opname van { "4" } GB ({ "5.45" }× real time, piekgeheugen { "2" } MB boven de begin-RSS; metingen op één machine, geen drempels).

seg-efbaf5a00ea2 = Alleen software: er wordt niets uitgezonden en er wordt geen interferentie- of spoofinggolfvorm gesynthetiseerd. Ontwerp- en as-built-notities: <c1/>.

seg-c9871226c82f = Trackingengine voor lab replay ({ "0.34.0" }: B3.1, B3.2, B3.3, B6.1).

seg-cd353717667b = <em>Lusontwerpbestanden</em>: <c1/>-TOML (<c2/>; parser <c3/>). Een of meer benoemde ontwerpen stellen elk lusveld in:

seg-0437148324ca = draaggolftype (PLL, FLL of FLL-ondersteunde PLL), ordes en bandbreedtes;

seg-4e722960f8c6 = PLL/FLL/DLL-discriminatoren en draaggolfondersteuning;

seg-44976e3ad4e7 = spacing en integratie;

seg-5c06173036d6 = lockdrempels en C/N0-vensters, en bitsynchronisatie;

seg-405e693dd757 = de lock-toestandsmachine;

seg-e6908584e2f4 = de overdrachtsacquisitie (<c1/> of expliciet).

seg-8844cc963705 = Ontwerpen kunnen elkaar <c1/>. Onbekende sleutels worden geweigerd. Elk opgelost ontwerp heeft een SHA-256-hash over een canonieke JSON-vorm (sleutels op elk niveau gesorteerd, vaste getalopmaak), zodat de hash niet van de veldvolgorde afhangt; elke uitvoer legt hem vast. Oppervlakken:

seg-5c32182634f7 = <c1/>, waarbij expliciete vlaggen het ontwerp overschrijven en worden vastgelegd;

seg-9356751a6b98 = <c1/>, dat elk ontwerp in het bestand draait;

seg-6815ec9b33c6 = Python <c1/>, <c2/>;

seg-62ebd3646d50 = MCP <c1/> <c2/>/<c3/>.

seg-70d3b295bea0 = <em>M2M4 C/N0</em> (<c1/>, de track-epochekolom <c2/> na <c3/>; Python-epochedicts). De schatting uit het tweede en vierde moment over dezelfde vensters als NWPR, alleen uit prompt-vermogen: NWPR leest te laag onder de eigen draaggolfjitter van de lus (ongeveer { "8" } dB × Bn_PLL·T) en M2M4 niet. Op GPS L2C CM ({ "20" } ms, nominaal { "40" } dB-Hz, PLL { "1" } tot { "10" } Hz) leest hij bij elke bandbreedte { "39.93" } dB-Hz terwijl NWPR daalt van { "39.55" } naar { "38.22" }; op L1 C/A bij { "45" } dB-Hz leest hij { "45.34" }. NWPR en elke andere uitvoer zijn ongewijzigd (een bit-voor-bit-pin). Het binaire record blijft { "184" } bytes (de waarde neemt de gereserveerde float en vlagbit { "6" } in).

seg-c02d07475717 = Extra correlatortaps (multicorrelator / SQM).

seg-70fcdc903413 = <c1/> (offsets in chips vanaf de prompt, positief vroeg; hoogstens { "16" }, elk binnen ±{ "2" }) correleert extra replica's naast E/P/L en geeft ze terug als <c2/> (<c3/> in ontwerpvolgorde). De lussen gebruiken ze nooit. De sleutel wordt uit de canonieke JSON weggelaten wanneer hij leeg is, zodat de hash van het standaardontwerp en elke uitvoer zonder taps ongewijzigd zijn (<c4/> blijft; de CSV/JSONL/binaire uitvoer zonder taps is bitgelijk). Met taps: CSV/JSONL-kolommen en een binair record van <c5/> bytes waarvan de header <c6/> draagt, zodat een oude lezer het bestand weigert in plaats van het verkeerd te parsen. <c7/> (CLI), <c8/> (Python) en <c9/> (MCP <c10/>). De ontwerpen van één run moeten het over de taps eens zijn.

seg-66d494267598 = <em>Parallelle kanalen</em> (<c1/> / <c2/>; Rust <c3/>). De kanalen van elke chunk draaien op maximaal N threads (<c4/>; <c5/> blijft serieel). De correlatie en lock-toestandsmachine van een kanaal raken alleen dat kanaal; de epochen en gebeurtenissen ervan worden gebufferd en in kanaalvolgorde naar de sinks geschreven, zodat de uitvoer (CSV, JSONL, binair, gebeurtenissen, samenvatting) voor elke N byte-identiek is aan de seriële run. De standaard blijft { "1" } thread. Gemeten op een opname van 12 kanalen, { "4" } s, { "4.092" } MHz op { "4" } cores: { "19.5" } s serieel, { "11.5" } s bij { "2" } threads, { "6.3" } s bij { "4" } ({ "3.1" }×; de eerste acquisitie is serieel).

seg-cf59911d458f = <em>Export van het acquisitieoppervlak</em> (<c1/>; <c2/>, <c3/>). <c4/> (één PRN; CSV, JSON of binair), Python <c5/> en MCP <c6/> <c7/> schrijven het hele correlatievermogensoppervlak Doppler × codefase dat de zoekactie berekent (de cellen zijn die van <c8/>, bit voor bit) met de piek en twee verfijningen van fijne Doppler: een parabolische schatting en een fijne zoekactie met 1/16-bin (≈{ "5" } Hz bij { "4" } ms coherent, tegen bins van { "167" } Hz). <c9/> zelf en elke standaardwaarde zijn ongewijzigd.

seg-a01bf371cc4f = <em>Streaming epocheuitvoer</em> (<c1/>; <c2/>). Elke lusupdate bevat:

seg-ff549f07ce78 = de early/prompt/late-correlatoren;

seg-00457c1bb059 = alle drie de discriminatoruitgangen;

seg-b17d335f6cac = de NCO-toestanden van PLL/FLL/DLL en de draaggolffase;

seg-a3bf3f1034cd = de PLI- en lockvlaggen;

seg-7912a72da79b = beide C/N0-schattingen en de bits;

seg-8d105d656041 = de lock-toestand.

seg-6af6331255fb = Hij wordt geschreven terwijl het gebeurt, als CSV, JSON Lines of een versiegebonden binaire vorm met lezers in Rust (<c1/>) en Python (<c2/>).

seg-aa081bfd9878 = <c1/> krijgt <c2/>, <c3/> en <c4/> (<c5/>), en <c6/> krijgt <c7/> en <c8/>. MCP <c9/> krijgt <c10/>/<c11/> en bouwt zijn antwoord op uit de samenvatting met begrensd geheugen.

seg-8cb2f8b27bad = De heap van een run groeit niet meer met de lengte van de opname: <c1/> meet dat met een tellende allocator ({ "6" }× de lengte, dezelfde piek binnen { "64" } KiB), met een controle die laat zien dat het pad in het geheugen wel groeit.

seg-98a99bcba894 = <b>Offline standaardinvoer voor aardoriëntatie:</b> astropy bevestigt de rijtelling, maar de { "12" } rijen die de crate Bulletin A-voorspellingen noemt, zijn gemarkeerd als gemeten (I), niet als voorspeld (P). De overeenstemmingscijfers van de rij met de operationele voorspeller waren dus tegen gemeten rijen. Achterhaald in ronde { "2" }: de engine classificeert rijen op de vlag en de rij is VALIDATED.

seg-d96fbfa4be79 = <b>Voorspellingsfout van aardoriëntatie in operationele stijl:</b> de UT1-fout van de voorspeller is 2.4x tot 12.6x die van Bulletin A bij { "1" } tot { "10" } dagen en { "5.32" } ms bij { "10" } dagen, buiten het bereik van { "0.36" } tot { "3.13" } ms van de 2e EOP PCC.

seg-1833bf6e3b6f = <b>Maangeodetische VLBI:</b> tegen de lichttijden van ANISE via DE440 ligt geen enkele vertraging binnen { "1" } ps; het grootste verschil is { "24" } µs, grotendeels door het analytische maanmiddelpunt (ongeveer { "200" } km van DE440). Ronde { "2" }: het kernelpad is VALIDATED in een eigen rij; dit analytische pad blijft MODELLED.

seg-0ec8a2a91702 = <b>Interoperabiliteitsexport voor de Maan:</b> Orekit { "12.2" } weigert de tijdsystemen LTC en TCL, dus de uitwisseling van de maan-OEM-bestanden met een tweede lezer is niet vastgesteld.

seg-09cfd4e61b7b = <b>Relatieve beweging van Clohessy–Wiltshire:</b> tegen de niet-lineaire beweging van Orekit op { "100" } m is het verschil { "1.2" } tot { "6.3" } mm, boven { "1" } mm; het schaalt als de weggelaten tweede-ordeterm, dus de vooraf vastgelegde tolerantie lag onder de linearisatiefout. Achterhaald in ronde { "2" }: de tweede-ordecorrectie is VALIDATED tegen dezelfde drempel.

seg-af1bdd974ba5 = <b>Foutgroei bij INS/TRN-coasting:</b> tegen een vrij-inertiële Monte Carlo van NaveGo houden de groeiwetten stand binnen { "5" } % tot { "600" } s en overschatten ze daarbuiten (2.2x tot 8x na een uur), omdat ze de Schuler-terugkoppeling weglaten. Achterhaald in ronde { "2" }: het Schuler-foutmodel is VALIDATED.

seg-8459bc50f8b4 = <b>Maanservicevolume uit echte constellatiegeometrie:</b> { "4" } van de { "12" } gepubliceerde beschikbaarheidsstatistieken wijken meer dan { "2" } procentpunten af (tot { "22.5" }).

seg-7a0fd1377b9c = <b>Overbound voor de traceerbaarheidsbias van heterogene UTC(k):</b> op { "105 024" } BIPM-rijen wordt de overbound bij { "50.8" } % van de rijen overschreden; de gepubliceerde onzekerheid begrenst de meting van de offset door het BIPM, niet de offset.

seg-814acf34cffd = <b>Classificatie van de nulruimte van de maandatum:</b> op de gepubliceerde geometrie met vijf reflectoren is de correlatie -0.78 tegen -0.97, en de CRLB van de oorsprong ligt { "96" } tot { "98" } % onder die van het artikel.

seg-da01b5e08a87 = <b>Substraat voor de geometrie van de LLR-datum van de Maan:</b> tegen { "192" } ILRS-maannormaalpunten van { "2024" } was de RMS van het residu in één richting { "96" } m met de eerdere oriëntatie-interpolatie en is { "22.7" } m na de onderstaande correctie, nog steeds boven de drempel van { "10" } m (afgeronde stationscoördinaten, geen poolbeweging). De oriëntatiereeks klemt stilzwijgend buiten 2024-2025. Ronde { "2" }: het model voor gemeten afstanden is VALIDATED in een eigen rij ({ "2.81" } m); de reeks dekt nu 2014-2030 en geeft buiten dat bereik fouten.

seg-fd9ad94680e9 = <b>Koppeling van relativistische klokgang aan het stelsel:</b> de zelfpotentiaalterm ligt { "3.18e-4" } boven de gepubliceerde waarde (tolerantie { "1e-4" }); het artikel evalueert een andere potentiaal, dus er bestaat geen gepubliceerde waarde van deze gesloten vorm. Achterhaald in ronde { "2" }: de equatoriale potentiaal van graad 2 is VALIDATED tegen hetzelfde artikel.

seg-e002819c1e2d = <b>Fysische constanten van elk lichaam van het zonnestelsel:</b> { "12" } van de { "84" } constanten van de toegevoegde lichamen wijken af van NAIF pck00011 en gm_de440 (oudere elementen van Marssatellieten; andere GM-oplossingen voor Uranus, Neptunus en Pluto). Ronde { "2" }: de constanten volgen nu NAIF (een transcriptie, niet meegeteld), en de berekende oriëntatie komt overeen met SPICE; de rij blijft MODELLED.

seg-e722d242e78e = <b>Selecteerbare LEO-efemeridemodellen:</b> de fit met 22 parameters laat 1.71x en 1.86x de gepubliceerde fout in de baanrichting over op bogen van { "20" } min, boven 1.5x. Achterhaald in ronde { "2" }: het model met 22 parameters en de fit zijn VALIDATED in een eigen rij.

seg-c136023752df = <b>Gezamenlijke GNSS- en LEO-positiebepaling:</b> de bias tussen systemen komt overeen met RTKLIB, maar { "93.2" } % van de epochen ligt binnen { "3" } m van ITRF2020 tegen { "95" } %; RTKLIB zelf haalt { "88.2" } % op de data ({ "93.6" } % na de correctie van de groepsvertraging in ronde 2).

seg-e5f0e3c21def = <b>Common-mode-integriteitsblindheid</b> en <b>dekkings- en DOP-kaarten:</b> beide vergelijkingen slaagden maar zijn bij de beoordeling afgewezen omdat een opzettelijk foute engine ze ook doorstaat (de eerste controleert alleen een interne identiteit; de gepubliceerde ondergrenzen van de tweede kunnen een verdubbelde PDOP niet zien). Ronde { "2" }: common-mode-integriteitsblindheid is VALIDATED op inputs met pariteit; de dekkingskaarten blijven een bevinding (zie hieronder).

seg-688e1753cd53 = Validatieronde { "2" }

seg-b320fbdb72c3 = De tweede ronde nam elke rij die de eerste ronde nog routeerbaar liet, met nieuwe preregistraties die zijn vastgelegd voordat een fixture werd opgehaald of een onafhankelijke referentie werd uitgevoerd, een tegenwerkende tweede reviewer die elke vergelijking opnieuw uitvoerde en een opzettelijke engine-mutatie die elke test rood moet laten worden. De eigenaar aanvaardde op 2026-10-02 de gecorrigeerde formulering van de rij voor de grens buiten Omega voordat die werd gepromoveerd (de oude tekst sprak de code tegen).

seg-7b7c584caaaf = <b>Gepromoveerd naar VALIDATED ({ "17" }).</b> Type onafhankelijke referentie tussen haakjes; tolerantie vastgelegd vóór de run.

seg-555e6ad454d2 = <b>Koppeling van relativistische klokgang aan het stelsel</b> (Referentie): L_m van Ashby en Patla { "2024" } binnen { "2.8e-6" } (drempel { "1e-4" }) uit de equatoriale potentiaal van graad 2 van de twee velden die het artikel aanhaalt; pyshtools-zwaartekracht van graad 350 voor de radiale ingang ({ "8.3e-5" }); DE441-maansnelheid ({ "2.5e-3" }).

seg-0c01fac44708 = <b>Offline standaardinvoer voor aardoriëntatie</b> (Bibliotheek): astropy { "8.0.1" } en IERS Bulletin A nr. { "039" } bevestigen de { "30" } definitieve, { "54" } snelle en { "90" } voorspelde rijen van het opnieuw gesneden uittreksel.

seg-b77253dd26b5 = <b>Gezamenlijke fout van UT1 en poolbeweging</b> (Bibliotheek): volledige rotaties van astropy en pyerfa reproduceren de gezamenlijke tabel (UT1 en pool binnen { "6e-16" }, de combinatie binnen { "1.9e-7" }); de gerealiseerde fouten uit het IERS Annual Report { "2019" } geven verhoudingen { "1.001" } tot { "1.100" }.

seg-378414f812c1 = <b>Footprint en dekking van een EO-payload</b> (Bibliotheek): Orekit { "12.2" } en GeographicLib { "2.1" } op elke vooraf vastgelegde drempel, waarbij de nodale regressie door J2 nu in de knooppuntafstand zit.

seg-792bf58a1c1e = <b>Relatieve beweging van Clohessy–Wiltshire</b> (Bibliotheek): met een tweede-ordecorrectie in gesloten vorm binnen { "1.2e-7" } m van de niet-lineaire beweging van Orekit tegen { "1e-3" } m; de lineaire matrix alleen blijft gekarakteriseerd ({ "1.2" } tot { "6.3" } mm).

seg-423437d90022 = <b>B-vlakmikken en zwaartekrachtassist met patched conics</b> (Bibliotheek): GMAT R2026a B-vlak, asymptoten, C3 en heliocentrische elementen; sbpy { "0.6.0" } en Kasuga en Jewitt { "2019" } voor de Tisserand-parameter.

seg-b29b0dfcd3a4 = <b>Foutgroei bij INS/TRN-coasting</b> (Bibliotheek): een Schuler-foutmodel met negen toestanden binnen { "5" } % van gecorrigeerde coastruns van NaveGo op alle { "48" } punten (slechtste { "3.70" } %).

seg-8cc49496b4c6 = <b>Common-mode-integriteitsblindheid</b> (P2): numpy <c1/> op { "1464" } inputs met pariteit binnen { "1e-12" } (slechtste { "1.06e-14" }).

seg-f0ff538b7329 = <b>Gezamenlijke multitechniek-OD en klok van de Maan</b> (P2): numpy herberekent elke Gauss-Newton-stap, sigma en stationsfout op zes netwerken (binnen { "2.4e-11" }) na een correctie van de QR-oplossing.

seg-7ed9b059f888 = <b>Covariantie van stationscoördinaten bij maan-VLBI</b> (Bibliotheek): een met SPICE gebouwde Jacobiaan reproduceert het schema, het spectrum, de sigma's en de nulruimte binnen { "1" } % en { "0.1" } graad; numpy tot { "2e-13" }.

seg-0e4e1c3fc899 = <b>Niet-detecteerbare common-mode-grens van residu buiten Omega</b> (P2, formulering gecorrigeerd door besluit van de eigenaar): numpy LAPACK op { "256" } gevallen binnen { "1e-12" }, zes exacte oneindigheden.

seg-0fc8ce9cde6c = <b>Basisinvariante classificatie van de nulruimte</b> (P2): SciPy en NumPy snijden deelruimten op { "72" } geconstrueerde matrices, gehele getallen exact, projectornorm binnen { "6.0e-15" }.

seg-4e5e7a6072bc = <b>Ionosferische diensten op één frequentie en UTC-diensten van een LEO-navigatiebericht</b> (Bibliotheek): GNSSTk { "15.3.1" } voor Klobuchar, Az en de UTC-drift; ERFA voor de drie schrikkelsecondegevallen.

seg-a644bf49c816 = <b>Grens voor positiebepaling in niet-terrestrische 5G-netwerken</b> (P1): grenzen voor één SSB van Bachl, Lei en Nabeel { "2026" } binnen een half afgedrukt cijfer; numpy voor de covarianties van de positiebepaling.

seg-b326f6fc55ad = <b>Model voor gemeten LLR-afstanden</b> (Gemeten, nieuwe rij afgesplitst van het substraat van de LLR-datum): { "192" } ILRS-maannormaalpunten met { "2.81" } m RMS tegen een drempel van { "10" } m, met de barycentrische lichttijd van IERS { "2010" }; de componenten onder de drempel worden niet een voor een opgelost, en de rij zegt dat.

seg-82e9fba684dc = <b>Maangeodetische VLBI, kernelpad</b> (Bibliotheek, nieuwe rij afgesplitst van de rij voor maan-VLBI): door SPICE geconvergeerde lichttijden binnen { "1" } ps en partiële afgeleiden binnen { "1e-6" } op epochen rond J2000; het analytische standaardpad blijft MODELLED.

seg-03c47d262ff3 = <b>Liu et al. { "2025" } LEO-efemeridemodel met 22 parameters en zijn fit</b> (Gemeten, nieuwe rij afgesplitst van de rij met selecteerbare modellen): echte nauwkeurige banen binnen 1.5x van de gepubliceerde statistieken op artikeldagen en achtergehouden dagen ({ "0.683" } tot { "1.186" }); de schaalconventie van n_dot is getranscribeerd en wordt door deze vergelijking niet getoetst, en de stopregel is de parameterconvergentieregel van Kshana, niet de RMS-veranderingsregel van het artikel. Het ATOMIC-polynoom en de tabel met vijf hoogtes blijven MODELLED.

seg-b49f96eb52ad = Bestaande VALIDATED rijen opnieuw onderbouwd (geen verandering in aantal).

seg-4e26bec3297c = <b>Planeetposities uit de JPL Standish-elementen</b> en <b>lichttijd tussen lichamen van het zonnestelsel</b>: de achteraf bepaalde drempels van tweemaal nominaal worden vervangen door vooraf vastgelegde vergelijkingen met JPL Horizons DE441 (RMS hoogstens het cijfer uit Explanatory Supplement Tabel { "8.10.1" }, slechtste { "0.778" }, inclusief de splitsing van de Aarde en de ICRF-rotatie; lichttijden binnen { "1e-6" } s van Horizons op DE441-posities, slechtste { "6.7e-9" } s). Hun vlaggen "limiet vastgesteld na de vergelijking" zijn verwijderd.

seg-d3b745392d29 = <b>Integriteit (RAIM/ARAIM/SBAS)</b>: de rij berust niet langer op plausibiliteitscontroles. Hij zegt nu: de ARAIM-solution-separation met meerdere hypothesen van ADD v4.2 komt overeen met Stanford MAAST voor ARAIM { "2" } op { "270" } echte gevallen (slechtste VPL-verschil { "2.2e-3" } m tegen { "0.05" } m); snapshot-RAIM-detectie en -uitsluiting komen overeen met RTKLIB <c1/> op { "2016" } van { "2016" } beslissingen, met het beschermingsniveau voor de helling binnen { "2.7e-12" } m; de SBAS DO-229E L1-beschermingsniveaus komen overeen met Stanford MAAST op echte WAAS-uitzendingen ({ "2868" } paren binnen { "1.6e-5" } m). Hij stelt duidelijk dat de functies met uniforme sigma <c2/> en <c3/> NIET in overeenstemming zijn met ADD (verschillen bij gelijke invoer 0.75/4.04 m en 0.39/1.93 m VPL/HPL, een bevinding), dat de DFMC L5 SBAS-vergelijking een bevinding is ({ "308" } paren zonder GEO in zicht worden door Kshana beschermd en niet door MAAST) en dat <c4/> geen externe vergelijking heeft. Zijn zelfvlag is verwijderd.

seg-d059b9953c3f = <b>Fitter voor LEO-uitgezonden efemeriden</b>: de geïntegreerde referentiebaan is toegevoegd aan het getoetste deel (Orekit { "12.2" } binnen { "4.55" } mm over { "6" } h, drempel { "2" } cm); de correctiepolynomen, de klokfit en de afweging over de updateperiode blijven gemodelleerd.

seg-166d511bbba3 = <b>Bevindingen en geblokkeerde rijen (blijven MODELLED).</b> De tekst over de onafhankelijke referentie van elke rij bevat de bevinding en de bijbehorende vastgepinde test.

seg-7f233dbdf110 = Modulatie van navigatiesignalen (Betz { "2001" }, Hein { "2006" }): spectra en correlaties komen overeen; de zijlobben van { "24" } MHz en elke multipathbias ({ "11" } tot { "15" } % te laag) niet, oorzaak onopgelost.

seg-4d5a6bb44d64 = TDOA/FDOA-geolocatie: de grenzen komen overeen met Ho en Chan en Ho en Xu, en met de code van de auteurs tot { "3e-12" }; de Ottawa-factoren uit een Monte Carlo afgedrukt wijken { "1.3" } % en { "4.4" } % af.

seg-5fa189f788ca = GNSS van de Aarde op maanafstand: GENESIS-zenitgemiddelden komen overeen met Montenbruck et al. { "2023" } bij { "5" } van de { "6" }; nadirgemiddelden zijn { "1.0" } tot { "2.4" } satellieten te hoog.

seg-d7e5b5a64f43 = Dekkings- en DOP-kaarten: ontwerpen voor de Aarde komen overeen met Orekit, gnss_lib_py en numpy op elke drempel; ontwerpen voor Maan en Mars overschrijden { "1e-9" } alleen op bijna singuliere cellen.

seg-3c8fb07d83ec = Gezamenlijke GNSS-positiebepaling: twee frequenties { "79.9" } % en nauwkeurige producten { "94.2" } % binnen { "3" } m tegen { "95" } % (RTKLIB { "67.9" } % en { "94.1" } %); het ISB-verschil bij nauwkeurige producten komt doordat RTKLIB antenne-offsets negeert.

seg-5d3d4d99fbc4 = Trackinglussen (GNSS-SDR { "0.0.19" }): komen overeen bij { "35" } tot { "45" } dB-Hz; bij { "30" } dB-Hz PLL +{ "21" } %, DLL -32 %, drempels +{ "1.5" } dB; slip-tijden { "0.5" } tot { "2" } decaden korter.

seg-0dd24947169c = Maanservicevolume (Orekit en Hipparchus): { "155" } van de { "160" } waarden komen overeen; de eis voor de slechtste steekproef faalt op bijna singuliere LNCSS B-geometrie.

seg-74002245287f = Kwantuminertiaalsensor: de vloer met alleen QPN ligt { "21" } tot { "31" } % onder de gemeten ruis van Gauguet { "2009" } (drempel { "30" } %, met { "0.5" } punt gemist).

seg-ab8b17cf325e = Oscillatorvoorinstellingen: gemeten exemplaren overschrijden de voorinstellingen voor rubidium-holdover, kortetermijn bij cesium en het slechtste exemplaar van CSAC; de OCXO-voorinstelling heeft geen gemeten record.

seg-81ad9b839a28 = Dichtheid door ruimteweer: Jacchia { "1971" } ligt binnen een factor { "2" } van accelerometerdichtheden bij zonnemaximum maar is ongeveer 1.7x te dicht in het minimum van { "2008" }.

seg-68e5d0942847 = Geometrievrije schuine TEC: { "33" } van de { "36" } bogen binnen { "3" } TECU van de CODE-kaart (slechtste { "6.84" }).

seg-f410ce9cf195 = Spoofingdetectie en TPL tegen het officiële JammerTest-log van { "2024" }: { "4" } van de { "10" } beginmomenten tijdig gedetecteerd; de TPL wordt bij { "4" } van de { "10" } overschreden.

seg-41eb2c318469 = Klokfilter op nieuwe IGS-klokken: twee van de { "11" } satellieten falen op het criterium van de innovatiesom.

seg-064b623e918b = EOP-voorspeller met kleinste kwadraten plus autoregressie: UT1 { "1.73" } tot 2.11x Bulletin A bij { "2" } tot { "10" } dagen.

seg-d98571cc21f4 = Overbound van de gerealiseerde offset van UTC(k): gepoolde overschrijding { "0.0333" } tegen { "1e-2" }.

seg-527aca91ec7c = Maanstelseldatum uit een campagne: het deel met SPICE komt overeen; het P2-deel met geschatte stations haalt { "1e-9" } niet bij een probleem met conditie 2.1e8.

seg-9805c4c821f9 = Maanstelseldatum uit echte LLR: { "15" } van de { "16" } cijfers komen overeen met SPICE; de sigma van de z-translatie is { "1.03" } % hoog tegen { "1" } %.

seg-08e6c541b59e = Terugkeer in de atmosfeer (Allen-Eggers): de puntmassaoplossing komt overeen met reconstructies van ruimtevaartorganisaties (alleen een kruiscontrole); de vergelijking met de accelerometer is geblokkeerd op een leesbare bron van Hayabusa2.

seg-0bb78ffbd915 = ITU-T-maskers: de afgedrukte uitgewerkte waarden komen overeen; de klasselimieten van G.8273.2 hebben er geen (geblokkeerd).

seg-308c1bca3fd9 = Geometrie van lanceervensters: de snelheid van de locatie bij de ware pool met een epoche komt overeen met Orekit ({ "4.9e-8" }); de standaardsnelheid zonder epoche haalt het nog steeds niet ({ "1.12e-6" }). Niet gepromoveerd; opvolging volgt.

seg-f0b7c3d60df8 = Fysische constanten van elk lichaam: nu wijken { "0" } van de { "84" } af van NAIF (een transcriptie), en de berekende oriëntatie komt tot { "1.4e-10" } rad overeen met SPICE. Niet gepromoveerd; opvolging volgt.

seg-a5a787c9a761 = Geblokkeerd op een afbakeningsbesluit van de eigenaar, elk met de bijbehorende overeenstemmende vergelijking vastgelegd: absolute waarneembaarheid van maanstations, DOP van oppervlaktebakens, de export buiten de boresight, detectievermogen over modaliteiten heen, de consistentiestatistiek voor common-mode en polaire LEO-dekking.

seg-cf638ec9878b = Geblokkeerd op data: foutbudgettering van tijdoverdracht (vraagt een reductie op echte data), JammerTest C/N0 (antennepositie en vermogensverdeling niet gedocumenteerd).

seg-e8709509eef3 = Herzieningen (gepubliceerde getallen die zijn verschoven, oud -> nieuw).

seg-5e93ab237b15 = De beschermingsniveaus van <c1/> liggen nu op het geodetische lokale niveau in plaats van op het radiale: tot { "0.31" } m HPL en { "0.14" } m VPL bij ABMF ({ "16" } graden N); geen golden is verschoven, maar de vastgelegde samenvatting van de tutorial <c2/> gaat van gemiddelde HPL { "22.1" } m / VPL { "40.0" } m naar { "22.2" } m / { "39.9" } m (<c3/>).

seg-c14361b2cb1f = Standaardwaarden voor de koppeling van het maanstelsel aan de klokgang: d_alpha/d_scale { "3.139807e-11" } -> { "3.138801e-11" }; d_alpha/d_radial { "1.807187e-17" } -> { "1.806185e-17" } per meter.

seg-8ac9cb8c5631 = Offline standaard-EOP-run (<c1/>, cellen vermeld in <c2/>): predicted_rows { "12" } -> { "90" }; poolvloer { "0.06776" } -> { "0.05550" } mas; eop_term_m { "14.01601" } -> { "14.01583" }; total_m { "20.09759" } -> { "20.09746" }; total_time_ns { "67.03834" } -> { "67.03790" }; de rijen van Tabel { "2" } van <c3/>; overeenstemming van de operationele voorspeller 0.256/0.695/1.252/3.885 ms -> 0.133/0.421/0.839/2.786 ms.

seg-dd93329245ba = <c1/> liu22 SISRE baan/met klok: { "60" } s 0.011/0.046 -> 0.014/0.046 cm; { "300" } s 0.068/0.139 -> 0.074/0.142 cm; { "600" } s 0.269/0.299 -> 0.258/0.290 cm.

seg-e4205dfdb0d2 = Liu-hoogtetabel, Kshana (verhouding): GRACE-A { "5.40" } ({ "0.61" }) -> { "4.25" } ({ "0.48" }); GRACE-C { "4.12" } ({ "0.66" }) -> { "2.87" } ({ "0.46" }); Sentinel-2A { "2.95" } ({ "1.03" }) -> { "2.20" } ({ "0.77" }); HY-2A { "2.38" } ({ "1.13" }) -> { "1.25" } ({ "0.59" }); Sentinel-6A { "0.70" } ({ "0.94" }) -> { "0.51" } ({ "0.67" }).

seg-4655e8ee7bab = LEO-navigatiebericht <c1/>-schaal { "2" }^-60 -> { "2" }^-58 (niet vooraf vastgelegd, bekendgemaakt; buiten de fitvergelijking); de CRC van het liu22-voorbeeldframe 0x62373A -> 0xDED99C.

seg-3f565c0ca2bf = Verificatietabel van <c1/>: de rij Liu en ATOMIC is gesplitst in een VALIDATED rij met 22 parameters en een MODELLED rij met ATOMIC en vijf hoogtes.

seg-537f5d80b66c = Rijtekst voor de oriëntatie van de hoofdassen van de Maan in DE440: bereik 2024-2025 / { "731" } rijen -> 2014-2030 / { "6 209" } rijen; "klemt stilzwijgend" -> fouten buiten zijn bereik.

seg-17a5dd090566 = Scenario <c1/>: equatorial_ground_track_spacing_km { "2756.37" } -> { "2752.17" } km; nieuwe velden inclination_deg ({ "98.19" }) en nodal_period_min ({ "98.893" }).

seg-6ce48a53df35 = <c1/> (de referentieklok voor TDOP/GDOP is nu de laagstgenummerde constellatie in zicht): globale GDOP max { "2.2236" } -> { "2.1205" }, gemiddelde { "1.122" } -> { "1.131" }, mediaan { "1.115" } -> { "1.125" }, p90 { "1.255" } -> { "1.265" }, p95 { "1.305" } -> { "1.315" }, p99 { "1.41" } -> { "1.42" }, en de GDOP-kaart per cel; mean_visible_by_constellation opgeteld als gehele getallen (ongeveer { "1e-12" } relatief, onzichtbaar bij { "4" } decimalen).

seg-e48b212c4881 = Gezamenlijke GNSS-positiebepaling op één frequentie na de correctie van de uitgezonden groepsvertraging: { "93.2" } % -> { "93.6" } % binnen { "3" } m; mediaan van ISB -0.351 -> -0.114 ns.

seg-f98a1423f328 = <c1/> jitter_table log10_mean_time_to_cycle_slip_s (Costas-lus SNR rho/4): bij de drempel van { "25.47" } dB-Hz { "11.58" } -> { "2.10" }; bij { "25" } dB-Hz { "9.55" } -> { "1.60" }; bij { "22" } dB-Hz { "2.24" } -> -0.14.

seg-789a302679f7 = <c1/>: elke uitvoer verschuift met het Schuler-foutmodel; de TRN-piek van het meegeleverde scenario { "52.932679" } -> { "44.711834" } m (<c2/>).

seg-9d65f2ce8715 = Rapport <c1/>: nieuwe sleutel geometry_path ("analytic" bij de standaardrun, geen numerieke waarde veranderd); nieuwe optionele velden planetary_kernel_path, earth_orientation_kernel_path en moon_orientation_kernel_path, met epoch_partials op het kernelpad; de beschrijving van het type is herschreven. De onafhankelijke referentie van het kernelpad in de verificatierij is SPICE ({ "0.06" } ps); ANISE ({ "0.12" } ps) wordt een kruiscontrole van de kernel-evaluatie.

seg-3631a31e7b26 = Lichaamsconstanten: Phobos GM { "7.087e5" } -> { "7.087546066894452e5" }; Deimos { "9.62e4" } -> { "9.615569648120313e4" }; Uranus { "5.7939506103e15" } -> { "5.793951256527211e15" }; Neptunus { "6.83509997e15" } -> { "6.835103145462294e15" }; Pluto { "8.69326e11" } -> { "8.696138177608748e11" } (m^3/s^{ "2" }); equatoriale straal van Phobos { "13.1" } -> { "13.0" } km; pool en nulmeridiaan van Phobos en Deimos uit pck00011; de prime_meridian_deg van het zonnestelsel bevat nu de kwadratische en periodieke termen.

seg-ac1251d7a0fd = <c1/> (<c2/> op Europa), uit de volledige pck00011-oriëntatie van Europa (7cfd66b4; de oriëntatie komt tot { "1.4e-10" } rad overeen met SPICE pxform), die de lander in de inertiële ruimte verschuift: beschikbaarheid alleen relais / met de afstand tot de Aarde { "0.485" } / { "0.725" } -> { "0.480" } / { "0.719" } ({ "83" } -> { "82" } van { "171" } epochen alleen relais), mediane PDOP { "5.266" } -> { "5.360" }, RMS van de positiebepalingsfout { "129.516" } / { "100.983" } m -> { "112.742" } / { "86.147" } m, mediane formele sigma { "5.266" } / { "4.272" } m -> { "5.360" } / { "4.239" } m. De tabel in <c3/> en de pin in <c4/> volgen; <c5/> is ongewijzigd.

seg-3d9368d3a1bb = <c1/> (f107 { "180" }, f107a { "165" }, kp { "4" }), de gekalibreerde factor vervangen door Jacchia { "1971" }: activity_density_kg_m3 bij 300/400/500/600/800 km { "2.602e-11" } -> { "3.608e-11" }, { "4.176e-12" } -> { "6.929e-12" }, { "8.136e-13" } -> { "1.618e-12" }, { "1.769e-13" } -> { "4.189e-13" }, { "1.544e-14" } -> { "3.781e-14" }; activity_factor 1.076/1.121/1.168/1.216/1.320 -> 1.492/1.860/2.322/2.881/3.232; reference_exospheric_temperature_k verwijderd, mean_exospheric_temperature_k toegevoegd ({ "1186.7" } K); <c2/>: de zonnecyclusschommeling op { "800" } km is nu 10.4x (NRLMSISE-00 13.6x) en de hoogtebewering volgt de stijging van NRLMSISE tot { "500" } km en de daling op { "800" } km.

seg-7dd92ee64b7c = <c1/> toa_median_sigma_3d_m: NR { "5" } MHz { "2.0903959" } -> { "2.0903962" } m; NB { "200" } kHz { "25.938613" } -> { "25.938839" } m (samenvattingstekst ongewijzigd op { "2.09" } / { "25.94" } m).

seg-6a6fb57d177e = <c1/> (QR-oplossing): with_vlbi.station_pos_err_m { "3.541344" } -> { "3.541350" } m; without_vlbi.station_pos_err_m { "2183.119" } -> { "2183.558" } m.

seg-76c94424e828 = <c1/> opnieuw uitgegeven voor de nieuwe en verwijderde velden hierboven.

seg-717c51e1cca0 = Validatiepakketten

seg-4ec44f8a5f8e = D12, uitgebreide precisie en een square-root-oplosser (twee nieuwe VALIDATED rijen: { "226" } -> { "228" } rijen, { "110" } -> { "112" } getoetst).

seg-d28005966948 = Deel { "1" }, onafhankelijke referentie met uitgebreide precisie:

seg-9a5f94973450 = Maanstelseldatum met geschatte stations: een onafhankelijke referentie met mpmath en uitgebreide precisie van 50 cijfers (vooraf vastgelegd 804662d5, naar conditie geschaalde drempels uit een a-priori-formule voor de achterwaartse fout) komt overeen op een nieuwe campagnedatum (2026-03-18) en op het oorspronkelijke scenario van 2024-01-01; nieuwe VALIDATED rij onder P2. Het beslecht het eerdere geschil over dubbele precisie: de datumsigma's van de engine wijken tot { "9.7e-6" } af, de inverse- en eigenroutes van NumPy tot { "6.2e-6" }, en zijn Cholesky- en QR-routes ongeveer { "1e-8" }. De engine ligt binnen zijn foutgrens maar is ongeveer duizend keer minder nauwkeurig dan een factorisatieroute.

seg-b055435a2138 = Omgeving van de onafhankelijke referentie: mpmath { "1.3.0" } toegevoegd.

seg-d0c2b2a8e635 = Herzieningen: geen. Er verandert geen golden bestand of gepubliceerd cijfer; de rij "Maanstelseldatum uit een waarnemingscampagne" blijft MODELLED (besluit van de oprichter 2026-10-02, optie A: hij leent de status van de afzonderlijke rij niet); zijn testtekst noemt de nieuwe test en zijn bevinding.

seg-50b53908fb7c = Deel { "2" }, datumoplosser met square-root-informatie:

seg-4c6089cfac5e = Nieuwe optionele square-root-informatieoplosser (<c1/>; <c2/> in het scenario lunar-frame-campaign): Householder-QR, marginalisatie via de driehoeksfactor, een Jacobi-SVD voor het spectrum en gecompenseerde producten uitsluitend uit correct afgeronde bewerkingen. Tegen de onafhankelijke referentie met 50 cijfers (vooraf vastgelegd b41908c9) komen zijn datumsigma's tot { "3e-13" } overeen op een nieuwe datum (2026-06-09); op de invoer van 2026-03-18 en 2024-01-01 wijkt de standaardoplosser tot { "1e-5" } af. Nieuwe VALIDATED rij onder P2. De standaardoplosser en zijn uitvoer zijn ongewijzigd. De vooraf vastgelegde drempels waarborgen alleen fouten boven ongeveer { "2e-7" } relatief: ze verwerpen de standaardoplosser maar niet een omgekeerd Householder-teken, een ongecompenseerd inproduct of een spectrale eindinverse, en de rij zegt dat.

seg-de9aeb2adde0 = Optionele square-root-paden naast de ongewijzigde standaardwaarden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/> en <c6/>, op nieuwe <c7/> en <c8/>. Elk komt overeen met zijn standaard waar beide nauwkeurig zijn (een interne controle, geen rij; er wordt geen validatie voor geclaimd). <c9/> delegeert nu aan een gedeelde routine; zijn uitvoer en de standaarduitvoer van elk scenario zijn ongewijzigd.

seg-87a632404f32 = Rangbeslissingen van de maanstelselcampagne: een vooraf vastgelegde controle met uitgebreide precisie over { "40" } dagen bevestigt elke beslisbare beslissing over stationsblokken en Helmert met volle rang. De a-priori-grens kan de { "20" } rangdeficiënte Helmert-dagen niet waarborgen; in exacte rekenkunde is hun defect geometrisch, met de drempel van { "1e-9" } binnen het natuurlijke bereik van eigenwaardeverhoudingen van de campagne. Geen rij.

seg-3b24e7fa36bf = De bewering van de rij voor de campagne met uitgebreide precisie is beperkt tot "binnen de slechtste-gevalgrens", en haar controle van de zwakste richting met vaste stations meet nu een echte hoek ({ "6.6e-16" } rad; de vergelijker is van acos in een koorde veranderd, de drempel niet).

seg-4fad02ab4b6d = Herzieningen: geen. Er verandert geen golden bestand of gepubliceerd cijfer; de rij "Maanstelseldatum uit een waarnemingscampagne" is ongewijzigd en blijft MODELLED (besluit van de oprichter 2026-10-02, optie A).

seg-627d3357d620 = D4, ruggengraat voor JPL-kernelefemeriden, fase { "1" } (vier nieuwe VALIDATED rijen: { "228" } -> { "232" } rijen, { "112" } -> { "116" } getoetst).

seg-30e8a645191f = De NAIF-kernellezer heeft een eigen rij.

seg-98ff121aa2a9 = <c1/> (DAF-container, SPK-type { "2" }, binaire PCK van type { "2" }) komt overeen met de SPICE Toolkit (CSPICE N0067 via spiceypy { "8.2.0" }) en met ANISE { "0.10.6" } op alle { "600" } DE440-toestanden en { "200" } maanoriëntatierotaties van een willekeurig raster dat is getrokken uit de eigen hash van de preregistratiecommit (abcd9133), binnen drempels die vooraf zijn afgeleid uit de evaluatie van Chebyshev-polynomen met dubbele precisie (slechtste { "0.6" } % van de drempel, { "1.95e-3" } m). De rij claimt dat de engine JPL-kernels correct leest, niet dat DE440 of de analytische reeks nauwkeurig is (<c2/>).

seg-e0b5ea7af969 = <b><c1/></b>: DE440- (of elke type-2-SPK-)posities via de eigen lezer van de engine, met tweedelige TDB-epochen en de SHA-256 van de kernel bewaard voor rapporten; hij vervangt nooit het zwaartepunt van een systeem voor een planeet. <c2/> laat een geometriepad de analytische reeks (de standaard) of een kernel kiezen.

seg-6c7dae98601e = <b>Optionele kernel-Maan voor <c1/> en <c2/></b>: een sleutel <c3/> leest het geocentrische maanmiddelpunt uit de kernel; verder verandert er niets, en het rapport krijgt een blok <c4/> met de kernel en zijn SHA-256. Zonder de sleutel zijn beide rapporten byte-identiek aan voorheen.

seg-74e8def84747 = <b>Covariantie van een punt op het maanoppervlak op het kernelpad</b> (nieuwe VALIDATED rij): met elk station vastgezet en het baken op de DE440-Maan komt de baken-covariantie overeen met een SPICE-lichttijd-Jacobiaan (slechtste { "1.7e-3" } tegen een drempel van { "1" } %) en een NumPy-inverse ({ "4e-14" } tegen { "1e-9" }), vooraf vastgelegd 4a51256 (<c1/>). De rij voor het analytische pad blijft MODELLED: op de analytische Maan ligt de kleinste bakensigma { "3.9" } % onder de onafhankelijke referentie.

seg-55002d236ab0 = <b>Maanstelseldatum uit een echte campagne, kernel-maanmiddelpunt</b> (nieuwe VALIDATED rij): op { "447" } ongeziene normaalpunten van 2019-Q2, vooraf vastgelegd 830d945a voordat er een werd opgehaald, komt de datumcovariantie op het kernelpad overeen met de ongewijzigde SPICE- en NumPy-referentie binnen { "7.6e-5" } tegen drempels van { "1" } % en { "2" } % (<c1/>). De oprichter besloot dat deze rij alleen op nieuwe punten promoveert; de diagnose op eerder geziene data (c51f8b2) is een bevinding, geen bewijs. De drempel maakt geen onderscheid tussen maanmodellen: de analytische Maan slaagt op dezelfde slice ook (slechtste { "3.8e-3" }), de geplande mutatie (de kernel-Maan een uur te laat) werd niet gedetecteerd, en bij de vouw slaagde ook een maanmiddelpunt dat ongeveer { "4,650" } km fout zat (de Maan genomen om het zwaartepunt van Aarde en Maan). De rij claimt de covariantie op dat pad, niet het maanmiddelpunt, en zegt dat.

seg-f147f9257b8b = <b>Posities van Zon, Maan, Mercurius en Venus uit DE440 op UTC-epochen</b> (nieuwe VALIDATED rij): <c1/> komt overeen met Skyfield { "1.54" } op { "600" } posities tussen { "1973" } en { "2026" }, slechtste { "2.96" } m, binnen een vooraf vastgelegde drempel (0bfafe6d) die wordt bepaald door de reeks met twee termen voor TDB − TT (<c2/>). Planeetposities krijgen nu deze nieuwe kernelrij; de rij van Standish en de rij van de planeetmanen zijn ongewijzigd, en de manen wachten op een scenario dat ze nodig heeft (besluit van de oprichter).

seg-bb840641c655 = Bevindingen: de ene misser van de vergelijking van de LLR-datum (sigma van de z-translatie { "1.025" } % tegen { "1" } %) daalt naar { "0.049" } % wanneer alleen het maanmiddelpunt uit DE440 wordt gelezen, op eerder geziene data (<c1/>); op de nieuwe slice van { "2019" } slaagt de analytische Maan ook, dus de misser van { "2015" } lag aan de rand van de geometrie van dat kwartaal. De analytische rijen "Maanstelseldatum uit een ECHTE waarnemingscampagne" en "Coördinatencovariantie van een punt op het maanoppervlak … apart gehouden van die van het aardstation" blijven MODELLED; hun teksten over de onafhankelijke referentie wijzen nu naar de rijen voor het kernelpad.

seg-64c9f3b96392 = <c1/> zegt niet langer dat de engine geen lezer voor binaire kernels heeft; het verwijst naar de rij van de lezer en legt uit waarom kernels van ruimtevaartuigen (typen { "13" } en { "21" }) nog via Horizons binnenkomen.

seg-841deceb80e6 = Herzieningen: geen. Er verandert geen golden bestand, gepubliceerd cijfer of bestaande testwaarde; de analytische rapporten <c1/>, <c2/> en <c3/> met alle stations vastgezet zijn byte-identiek aan voorheen (SHA-256-prefixen van het resultaat 9927aac2, cf1d2671, 25c357e4).

seg-95b8207466a3 = D9, bibliotheek met gemeten klokken "Clock Atlas" (drie nieuwe rijen, een VALIDATED: { "232" } -> { "235" } rijen, { "116" } -> { "117" } getoetst).

seg-1f8644486f5d = <b>Bibliotheek met gemeten klokken (<c1/>).</b> Apparaatkaarten (witte fase, witte, flicker- en random-walk-frequentiemodulatie, een lineaire frequentiedrift en, optioneel, fasetermen van eens tot viermaal per omwenteling) gefit op een benoemd gemeten klokrecord en beoordeeld op achtergehouden data; gatbewuste Allan- en Hadamard-varianties; een conditioneringsdetector die elk gat, elke faseafwijker, fasestap, burst en frequentiestap logt en niets weet van bestands- of daggrenzen; omzetting van een kaart naar het slot-timingruismodel, het uitgebreide Kalman-klokmodel en de ruisniveaus van de spoofingmonitor. Lezers voor RINEX- en IGS-klokbestanden, BIPM-bestanden per laboratorium en Circular T Sectie { "1" } (<c2/>); een gepoolde, hiërarchische verouderingsgrens voor UTC(k) (<c3/>, nog niet beoordeeld).

seg-93add052ae56 = <b>Ruisidentificatie met lag-1-autocorrelatie</b> (<c1/>, Riley en Greenhall { "2004" }), nieuwe VALIDATED rij (Bibliotheek): komt overeen met allantools { "2024.6" } <c2/> op { "140" } gevallen, gehele getallen identiek, slechtste verschil { "9.6e-13" } tegen een drempel van { "1e-9" } (vooraf vastgelegd 2ec76864; <c3/>).

seg-1fcea6ee6136 = <b>Gemeten apparaatkaarten met voorspelling op achtergehouden data</b>, nieuwe MODELLED rij (een bevinding): fit op een derde, voorspel de Allan-deviatie van de andere twee derde binnen een factor { "1.5" } (vooraf vastgelegd 2ec76864). GPS Block IIF op een nieuw IGS-venster (2026-03-01 tot { "14" }): { "10" } van { "11" }; G27 is optimistisch op de schaal van twee uur (slechtste factor { "1.510" }). Cesium (binnen, { "1.070" }), OCXO (buiten, { "2.348" }) en strontium (binnen) worden gerapporteerd, niet blind. De ontvangerkaart van JammerTest en de kaarten voor de Galileo-maser en de Deep Space Atomic Clock zijn geblokkeerd. Een modelklasse voor de TCXO van een ZED-F9P-ontvanger op { "12" } statische stations in Wroclaw (Zenodo { "6488497" }) faalt: { "1" } van { "11" } blinde stations in een bekendgemaakte gecorrigeerde herhaalrun (<c1/>, <c2/>).

seg-26fa898f6272 = <b>GPS Block IIF-kaarten met termen per omwenteling</b>, nieuwe MODELLED rij (een bevinding): op een tweede nieuw venster (2026-04-01 tot { "14" }) { "9" } van de { "11" } binnen de drempel; G03 ({ "1.947" }) en G25 ({ "1.581" }) zijn optimistisch omdat hun achtergehouden records ruiziger zijn dan hun fitdelen van een derde; het weglaten van de periodieke termen laat alle { "11" } falen (vooraf vastgelegd fb475550; <c1/>).

seg-ef456da29319 = <b>M002, schatting van de klokstatus aan boord, ronde { "3" }</b> (een bevinding, blijft MODELLED): na de bevroren conditioneringsdetector halen het uitgebreide filter van ronde 2, de afstemming en de criteria, ongewijzigd, (a) en (c) voor het eerst op alle { "11" } satellieten; (b) faalt bij G09 ({ "0.894" }) en G26 ({ "0.876" }) (vooraf vastgelegd fb475550; <c1/>).

seg-0014b2629fd2 = <b>M010, spoofingdetectie, rondes { "3" } tot 4b</b> (blijft MODELLED): ronde { "3" } geblokkeerd ({ "167" } trainingsepochen uit de andere sessies van het JammerTest-toestel tegen { "3600" }); met een kaart voor de modelklasse ZED-F9P (rondes { "4" } en 4b) geeft de klokmonitor nul valse alarmen voor het begin bij alle { "10" } gelogde beginmomenten (ronde { "2" }: { "86" }) en worden { "6" } van de { "10" } beginmomenten binnen { "10" } s gedetecteerd (ronde { "2" }: { "4" }); dezelfde vier blijven te laat (<c1/>).

seg-79757abc69e3 = <b>M083, overbound voor UTC(k), ronde { "3" }</b>: prospectief vooraf vastgelegd (fb475550) op Circular T-uitgaven vanaf { "465" }, nog niet uitgevoerd (<c1/>).

seg-09abf996ed16 = Omgeving van de onafhankelijke referentie: het ZED-F9P-record van Wroclaw hangt af van data onder <c1/> (CC BY { "4.0" }, ongeveer { "1.5" } GB); de IGS-klokfixtures zijn meegeleverd (IGS-producten, met bronvermelding).

seg-b05fa0811a3e = Herzieningen: geen. Er verandert geen golden bestand, gepubliceerd cijfer of bestaande testwaarde; op M001 (herverankering van holdover) wordt niet gehandeld omdat geen klokklasse is gepromoveerd.

seg-986f4075210b = D8, een getoetst pad voor propagatie, stelsel en tijd (drie nieuwe VALIDATED rijen en M131 gepromoveerd: { "235" } -> { "238" } rijen, getoetst { "117" } -> { "121" }).

seg-d7a612528765 = De typen voor Aardbanen die hun eigen modellen met alleen tweelichamen, seculiere J2 of sterrentijd hadden, delen nu één pad: SGP4/SDP4-elementensets met tweedelige juliaanse datums, doorgevoerd naar het GCRS en het ITRS (International Terrestrial Reference System) via de keten IAU (International Astronomical Union) 2006/2000A, met optionele parameters voor aardoriëntatie.

seg-016507ccdb8f = Nieuw: <c1/>, <c2/>, <c3/>, <c4/> en <c5/>; <c6/> en <c7/> nemen tweedelige epochen. Nieuw: <c8/> (SOFA-conventie <c9/> voor dagen met een schrikkelseconde), <c10/>, <c11/>, <c12/> (via TAI, zoals SOFA <c13/>), <c14/> en een tweedelige <c15/>.

seg-158c39fff817 = De poolmodus <c1/> propageert met SGP4 op 2026-01-01T00:{ "00" }:{ "00" } UTC op de IAU-keten (<c2/> neemt elke epoche); de SGP4-Walker-generator roteert via de IAU-keten naar het aardvaste stelsel.

seg-86ecad91a601 = Het type <c1/> draait een nieuwe voorspeller voor schijnbare passages (<c2/>, <c3/>): SGP4 op de IAU-keten, refractie volgens ITU-R P.834-9 en de lichttijd van de downlink (nieuwe schakelaars <c4/> en <c5/>, standaard aan), parameters voor aardoriëntatie (<c6/>, <c7/>, <c8/>, standaard { "0" }), kruisingen opgelost tot { "1e-7" } s en de culminatie via gulden-snedezoeken. Het geometrische <c9/> is ongewijzigd.

seg-9ce091899bf1 = <c1/> zorgt ervoor dat de kernels van het pakket voor geometrie, tijd en propagatie geen eigen Kepler-propagatie, seculiere J2-snelheden of rotatie met alleen sterrentijd bevatten; benoemde snelle niveaus en natuurkunde die het onderwerp van een rij is, zijn beredeneerde toegestane uitzonderingen.

seg-cf4ae964c5d1 = Nieuwe VALIDATED rij "Tweedelige juliaanse datums en schrikkelseconden op het tijdpad van Aardbanen": pyerfa { "2.0.1.5" } <c1/>/<c2/>/<c3/> op { "224" } momenten rond alle { "27" } schrikkelseconden binnen { "1e-6" } s (vooraf vastgelegd e947e69d); slechtste { "1.9e-11" } s.

seg-c0dec16ea932 = Nieuwe VALIDATED rij "Eén pad voor Aardbanen": TEME-posities van { "232" } elementensets tegen python-sgp4 { "2.24" } (de referentie-SGP4 van Vallado) binnen { "6.1e-8" } m (drempel { "1" } cm), en de rotaties GCRS -> ITRS en TEME -> ITRS tegen ERFA <c1/>, <c2/> en <c3/> binnen { "2.9e-6" } mas en { "0.41" } mas (drempels { "0.1" } en { "2" } mas), met parameters voor aardoriëntatie (vooraf vastgelegd 72ea9eb0). Bekendgemaakt: de eerste run faalde op 2016-12-31T23:{ "59" }:{ "59.5" } met één seconde rotatie; UT1 werd genomen uit de quasi-juliaanse UTC-datum op een dag met een schrikkelseconde, de engine gaat nu via TAI, en de tweede run komt overeen op de ongewijzigde drempels.

seg-a72ccdc2516e = M131 "LEO-dekking en dilution of precision voor polaire en Arctische gebruikers tegen MEO-GNSS" wordt VALIDATED: Orekit { "13.1.8" } neemt de GCRS-toestanden van de engine, roteert ze en berekent zichtbaarheid en DOP (NumPy voor groepen met meerdere klokken); posities binnen { "6.8e-5" } m (drempel { "0.2" } m), aantallen in zicht identiek op 4040/4040 steekproeven, mediane DOP binnen { "2.3e-11" } relatief.

seg-db498ac8e135 = Nieuwe VALIDATED rij "Voorspelling van schijnbare passages van grondstations met refractie en lichttijd": Orekit { "13.1.8" } propageert dezelfde elementensets in een TEME die het bouwt volgens de vermelde definitie, met ITU-R P.834-refractie en zijn lichttijdmeetmodel, over { "60" } gevallen bij stations op zeeniveau: { "1210" } passages, kruisingen binnen { "3.4e-6" } s (drempel { "5" } ms), maximale elevatie binnen { "5.5e-7" } graad, schijnbare richting binnen { "8.8e-7" } graad (drempel { "1e-4" } graad).

seg-ab87bb0ee63d = Bevindingen, vastgepind gehouden: de eerste volledige vergelijkingen met Orekit van begin tot eind misten hun drempels voor positie en richting, niet door de engine maar omdat de SDP4 van Orekit { "13.1.8" } afwijkt van de referentie-SGP4 voor cirkelvormige (e = { "0" }) diepe-ruimtebanen (tot { "67" } m) en zijn standaard-TEME is gebouwd op de nutatie van IERS { "1996" } (IAU { "1980" }), ongeveer { "72" } milliboogseconden van de keten IAU 2006/2000A ({ "2.7" } m bij LEO). De ITU-R P.834-coëfficiënt van Orekit voor h*theta0^{ "2" } is { "0.011380" } waar de Aanbeveling { "0.01380" } afdrukt; de vergelijking is op zeeniveau, waar de term verdwijnt, en het verschil erboven is vastgepind.

seg-49978e6a73b2 = "Voorspelling van passages van grondstations (grondsegment)" blijft VALIDATED met zijn bewering beperkt tot het geometrische <c1/>; het type <c2/> hoort bij de nieuwe rij.

seg-60d6ac0011f1 = Omgeving van de onafhankelijke referentie: Orekit { "13.1.8" } met Hipparchus { "4.0.3" }, pyerfa { "2.0.1.5" }, python-sgp4 { "2.24" } (<c1/>).

seg-532e10ead5a2 = Herzieningen: meegeleverde <c1/> totale toegang { "1675" } s -> { "1659" } s (vijf passages als voorheen; beste maximale elevatie { "73.25" } graad -> { "70.08" } graad), en elke uitvoer van <c2/> verschuift met het nieuwe pad (de afgedrukte regel in <c3/> en het item <c4/> van <c5/> zeggen dat nu); meegeleverde <c6/> GNSS-VDOP op de evenaar { "1.19669" } -> { "1.19710" }, bij { "89.9" } graad { "1.50645" } -> { "1.50590" }, gefuseerde VDOP bij { "89.9" } graad { "1.14388" } -> { "1.14250" } (de gepubliceerde cijfers met twee decimalen { "1.20" }, { "1.51" } en { "1.14" } zijn ongewijzigd). Er verandert geen golden bestand.

seg-b65f3186a7e9 = Nog niet gerouteerd: <c1/>, de modi doppler, joint en timing van <c2/> en de referentiebaan <c3/> (hun modellen zitten in <c4/> en <c5/>), en ontwerpen voor de Aarde in <c6/> (een benoemd tweelichamenniveau voor snelle berekening).

seg-03f638f20376 = D6, LunaNet AFS-referentiegenerator, LSIS V1.0 (vier nieuwe rijen, twee VALIDATED: { "238" } -> { "242" } rijen, getoetst { "121" } -> { "123" }).

seg-1d09f0582781 = <b>LunaNet Augmented Forward Signal (AFS) referentiegenerator</b> (<c1/>), vastgepind op de LunaNet Signal-In-Space Recommended Standard (LSIS) V1.0 van { "29" } januari { "2025" } en die versie in elke uitvoer noemend: de draaggolf van { "2492.028" } MHz; het AFS-I BPSK({ "1" })-datakanaal met { "500" } symbolen per seconde en zijn Gold-code van 2046 chips; de AFS-Q BPSK({ "5" })-pilot met zijn primaire Weil-code van 10230 chips, secundaire van 4 chips en tertiaire van 1500 chips; het frame met frame-identifier { "0" } (synchronisatiepatroon, BCH ({ "51" }, { "8" }) subframe { "1" }, CRC-24, LDPC-subframes met rate een half { "2" } tot { "4" }, blokinterleaver van { "60" } bij { "98" }) met een uitputtende subframe-1-decoder en een min-sum-LDPC-decoder die uitsluitend uit de pariteitscontrolematrix is geschreven; en basisband-IQ-synthese met waarheidslabels geschreven als een SigMF-opname. Codes worden gegenereerd uit de schuifregisters en de Legendre/Weil-constructies van de standaard. Niets wat uit de standaard is gekopieerd wordt herdistribueerd (hij heeft geen hergebruiksvoorwaarden): de primaire indices van AFS-Q komen uit IS-GPS-800J, en wat alleen de bijlagen van de standaard definiëren (AFS-I G2-vertragingen, tertiaire codes, LDPC-submatrices) wordt tijdens de run gelezen uit een lokale cache die <c2/> vult vanuit de door NASA gehoste PDF, waarbij elk bestand wordt gecontroleerd aan een vastgepinde SHA-256 (<c3/>). Het model is een referentiegenerator voor de standaard, geen kanaal-, propagatie- of linkbudgetmodel.

seg-7b8cb0461377 = <c1/> en <c2/>: een opname kan velden met een naamruimte voor extensies bevatten die in <c3/> zijn gedeclareerd.

seg-a9465820a1fc = Nieuwe VALIDATED rij "LunaNet AFS-basisbandweergave tegen een onafhankelijke generator, gegeven zijn kanaaltoestand": tegen LANS-AFS-SIM (BSD-2-Clause, commit 480c6bf3, S-bandbuild) nul chipafwijkingen over de codes van PRN's { "1" } tot { "210" }, nul symboolafwijkingen over de drie frames van de run, en een genormaliseerde complexe correlatie van { "0.999990" } over { "23.9" } s van zijn eigen samples (slechtste blok van { "2" } ms { "0.999948" }), binnen drempels die vóór de vergelijking zijn vastgelegd (vooraf vastgelegd 986ac280). Hij stuurt de renderer aan met de eigen kanaaltoestand van de simulator en dekt de vermogensverdeling uit de draaggolf-ruisdichtheid en het schrijven van SigMF en 8 bit niet.

seg-07edced2764a = Nieuwe VALIDATED rij "Kanaalcodering van LunaNet AFS-frames, FID { "0" }": de frames van 6000 symbolen zijn symbool voor symbool gelijk aan die van LANS-AFS-SIM (vooraf vastgelegd 986ac280); de subframe-1-code reproduceert het uitgewerkte voorbeeld van LSIS Figuur { "8" } en de CRC-24 de controlewaarde uit de catalogus voor CRC-24/LTE-A.

seg-ab94ac9f41fc = Beide gepromoveerde rijen hangen af van data in de LSIS-cache: hun test voor de onafhankelijke referentie wordt met een melding overgeslagen totdat <c1/> is uitgevoerd.

seg-89a4bc4a766e = Bevinding (nieuwe MODELLED rij), "LunaNet AFS-generatie van spreidingscodes": van { "2 937 232" } gegenereerde chips en bits, vergeleken met de tabellen van de standaard en de bestanden van Annex { "3" }, wijkt er één af, de "laatste { "24" } chips" die Tabel E-5 afdrukt voor tertiaire PRN { "147" }, die de cel van PRN { "151" } dupliceert terwijl het eigen bestand van Annex { "3" } van de standaard met de generator overeenkomt. Het criterium van nul afwijkingen wordt niet gehaald.

seg-d4e76301323f = Bevinding (nieuwe MODELLED rij), "LunaNet AFS-decodeerbaarheid in een gesloten lus": drie vooraf vastgelegde runs tegen PocketSDR-AFS; de derde haalde zijn drempels voor tracking en decodering volledig maar niet zijn bewaking dat een build van de ontvanger met alleen afdrukken het log van de vastgepinde build reproduceert, omdat twee runs van de ongewijzigde ontvanger al verschillen in hun acquisitierecords.

seg-93cfa05a1923 = Gecorrigeerd: de standaarddraaggolf van <c1/> (<c2/>), <c3/> en <c4/> was een afgeronde { "2.4" } GHz; nu is het de AFS-draaggolf van LSIS-020, { "2492.028" } MHz. Bij de oude standaard werd het vrije-ruimteverlies { "0.327" } dB te laag weergegeven.

seg-ed7c170ccc2c = Herzieningen: geen. Elk meegeleverd scenario noemt zijn draaggolf, en de resultaten van alle { "138" } scenariobestanden zijn byte-identiek aan de vorige main.

seg-3ec7f5b17122 = D7, echte maan-IQ en GPS LNAV (zeven nieuwe rijen, geen VALIDATED: { "242" } -> { "249" } rijen, getoetst { "123" } ongewijzigd).

seg-0c3dcf4f2b0f = <c1/>: een snelle Fourier-transformatie (FFT) met gemengde radix waarvan de uitvoer op elk platform dezelfde bits zijn; een SHA-256-pin van de transformaties met 8000 en 24000 punten slaagt op x86_64 en op wasm32-wasip1 (runner in <c2/>).

seg-150d9809c584 = <c1/>: parallelle zoekactie op codefase op bemonsterde IQ (<c2/>, <c3/>) met coherente vouwing, niet-coherente accumulatie, een chi-kwadraatdrempel voor een valsalarmkans over de hele zoekactie en een celgemiddelde statistiek voor ruis met beperkte band; <c4/>, <c5/> met code-Doppler, en de schatters M2M4 en rasterpiek voor de draaggolf-ruisdichtheid (C/N0).

seg-46bda8ecf2cd = <c1/>: een encoder voor het legacy-navigatiebericht (LNAV) van IS-GPS-200 voor subframes { "1" } tot { "3" }, met de pariteit van Tabel 20-XIV en een velddecoder.

seg-43444792974c = <c1/>: een lezer voor de ION GNSS SDR Metadata Standard (<c2/>) en zijn samplebestanden, met <c3/> voor niveaus in tweeën-complement.

seg-a7dfc3475923 = <c1/>: de IQS-batchheader, RAW-, ACQ- en NAV-telemetrie en CLK-bestanden van LuGRE (Lunar GNSS Receiver Experiment), en een controle die opsomt waar metadata van <c2/> de binaire header tegenspreekt.

seg-f0125531c4f8 = <c1/> en, in <c2/>, het yawgestuurde lichaamsstelsel, zendazimut en off-nadirhoeken, en <c3/> voor relatieve C/N0 met gemeten patronen.

seg-679aa02de1d0 = Codering van het GPS LNAV-navigatiebericht (nieuwe rij, blijft MODELLED na de naverificatie van de integrator): op het IGS-uitzendbestand van { "2" } maart { "2025" }, geparst en gedecodeerd door RTKLIB v2.4.2-p13, slagen alle { "960" } woorden voor de pariteit, decoderen alle { "96" } subframes en zijn alle { "608" } uitgezonden gehele getallen gelijk aan die van Kshana (<c1/>), maar de preregistratie (d4d9eb9d) bereikte de publieke branch twee seconden na de commit met het resultaat, dus de volgorde "vastgelegd voordat het bestand werd opgehaald" kan niet worden aangetoond en de rij wordt niet gepromoveerd.

seg-2875ba2d8f5f = <c1/> vult woorden vanaf het meest significante bit (I in het hoge nibble van een LuGRE-byte; de eerdere lezing gaf het geconjugeerde signaal), houdt de oude lezing als <c2/> en leest samples die breder zijn dan een woord.

seg-f6e0e3b9b166 = <c1/>: fasecoherente Doppler-verfijning ({ "0.2" } Hz RMS bij { "30" } dB-Hz over { "200" } ms in simulatie).

seg-b0f6a61acce0 = GPS L1 C/A tegen gps-sdr-sim: chips en pariteit bit-exact; { "230" } van de { "1152" } LNAV-velden verschillen een eenheid omdat gps-sdr-sim afkapt waar het uitgezonden gehele getal afronding vraagt.

seg-1c525ca495c0 = LNAV gedecodeerd door RTKLIB: alle pariteit en subframes slagen en elke parameter ligt binnen een half kwantum; { "41" } geschaalde waarden verschillen enkele eenheden in de laatste plaats door de decimale constante { "2" }^-43 van RTKLIB, boven de vastgelegde drempel.

seg-14e26e69777b = LuGRE-acquisitie tegen GNSS-SDR { "0.0.19" }: { "266" } van de { "266" } beslissingen komen overeen, { "250" } op dezelfde cel; de meeste positieven zijn artefacten van een gemiddelde van −{ "0.5" } in de kale 4-bit-niveaus; het deel voor C/N0 had geen gelijktijdige vluchtdata. Twee batches (OP5, OP12) zijn ten onrechte uitgesloten: hun metadata komt overeen met hun headers, maar de lezer kon toen geen sample breder dan een woord lezen.

seg-3a32ff9d66fc = LuGRE-acquisitie tegen door de baan voorspelde Doppler: met de beslissing op samplevermogen kruist elke zoekactie op ruis met beperkte band; met de celgemiddelde beslissing komen de sterkste paren in grootte overeen met omgekeerd teken, wat laat zien dat de vastgelegde I/Q-volgorde het geconjugeerde van de data is.

seg-2bb618ba4059 = Blinde acquisitie op de batches van het maanoppervlak: vier batches verwerven elk een satelliet (voorspeld zichtbaar, geen vals alarm bij { "1e-7" }), geen twee, dus de drempel voor het Doppler-verschil heeft geen paar om te beoordelen.

seg-f95606e17fd1 = Relatieve C/N0 op maanafstand (M039 opnieuw geformuleerd): { "15" } records van Block IIR/IIR-M en één paar, te weinig voor de vastgelegde drempel.

seg-9306cf44fc44 = Herzieningen: geen; er is geen gepubliceerd getal, golden bestand of docs-cijfer gewijzigd.

seg-2a3cb68c94d6 = De rij M039 "GNSS van de Aarde op maanafstand" formuleert zijn bewering op maanafstand opnieuw als de relatieve C/N0 tussen satellieten op één epoche plus zichtbaarheid (absolute C/N0 wordt niet geclaimd); hij blijft MODELLED. De NOTICE op het hoogste niveau bevat de bronvermelding CC BY { "4.0" } van LuGRE.

seg-e1e4094a186a = De DE440-oriëntatie van de hoofdassen van de Maan wordt nu geïnterpoleerd langs de geodeet tussen dagelijkse knooppunten. De eerdere interpolatie per element zat er tot { "2.0e-4" } rad naast ({ "340" } m op het maanoppervlak) nabij de kwartpunten van elke dag, niet de "ongeveer { "14" } m" die de rij vermeldde. De gebruikers ervan (geometrie van lunar laser ranging, maandatum, waarneembaarheid van maanfouten) krijgen de gecorrigeerde oriëntatie.

seg-a2071d345923 = Engine-correcties van ronde { "2" }, elk opnieuw uitgevoerd tegen zijn ongewijzigde vooraf vastgelegde tolerantie: de IERS-vintage van een EOP-rij wordt uit de I/P-vlaggen gelezen in plaats van uit een leeg Bulletin B-blok; <c1/> gebruikt het geodetische lokale niveau; de koppeling van het maanstelsel aan de klokgang gebruikt de equatoriale straal, J2 en rotatie; de liu22-fit begint met nulcorrecties zonder priors en gebruikt de gemiddelde-bewegingssnelheid van het artikel; de knooppuntafstand van EO bevat de nodale regressie door J2; de cycle-slip-tijd van Costas gebruikt rho/4; de gezamenlijke positiebepaling past de uitgezonden groepsvertraging van het paar toe; de gezamenlijke maanoplossing gebruikt een QR-stap; de NTN-grens wordt op de ware positie geëvalueerd; de klokreferentie bij constellatieontwerp is de laagste constellatie in zicht; de DE440-oriëntatiereeks beslaat 2014-2030 en geeft daarbuiten fouten in plaats van vast te klemmen.

seg-74f397ad9c16 = <c1/>, een referentiebaan gebouwd uit getabelleerde aardvaste toestanden, gebruikt door de vergelijking met de fitter van echte banen.

seg-7293b717d978 = De testbestanden en fixtures van de bovenstaande vergelijkingen, elk met zijn generator en een <c1/> met bron, licentie, ophaaldatum en SHA-256.

seg-920fe965bda9 = Ronde { "2" }: <c1/> en <c2/> (ADD v4.2-foutdetectie, naar Stanford MAAST voor ARAIM { "2" }, BSD-3-melding in de bron); <c3/>; <c4/> en <c5/>; het INS-foutmodel met negen toestanden <c6/>; partiële afgeleiden van <c7/> en de invoer <c8/> voor het kernelpad; <c9/>, een lezer voor SPK-type { "2" } en binaire PCK-kernels; <c10/> met ITRF2020-stations; Jacchia { "1971" }-dichtheid; <c11/> over elke efemeridenprovider; <c12/>; <c13/> en <c14/>; <c15/>; <c16/> (lezers voor RINEX-klok, ANTEX en DCB).

seg-62c3efb54991 = <b>Documentatie/juistheid van aantallen.</b> De aantallen scenariosoorten in de README zijn nu met een <c2/>-test vastgezet op <c1/>, zodat het gedocumenteerde aantal niet meer kan afwijken van de dispatcher.

seg-5f0f497aa643 = <b>Deep-space- en Mars-PNT: open radiometrische navigatie-engine plus GSE-simulatie.</b> Een nieuwe, volledig additieve mogelijkheidsas bovenop de op Aarde getoetste kern (elk bestaand Aarde-scenario is <b>byte-identiek</b>: de reproduceerbaarheidsgoldens slagen ongewijzigd, zonder regeneratie). Voegt toe: een dynamicakern voor meerdere lichamen (<c1/> met tesserale Mars-zwaartekracht GMM-3, een IAU-lichaamsvast Marsstelsel, een inplugbare <c2/>-naad, tweedelige Juliaanse datums met submicroseconde-nauwkeurigheid en TT↔TDB); radiometrische waarnemingen (iteratieve lichttijd plus Shapiro-vertraging, twee-, één- en drieweg-Doppler en afstand via de Moyer-tweebenige oplossing, coherente transponder-omkering, regeneratieve/PN-afstandsmeting volgens CCSDS { "414" }, Δ-DOR volgens CCSDS { "506" }, media van zonneplasma, troposfeer en ionosfeer); CCSDS-TDM ({ "503" }) inlezen en uitvoeren; een reduced-dynamic Square-Root Information Filter met empirische RTN-versnellingen, een onboardklok met drie toestanden en een Mars-luchtweerstandsmodel; een gezamenlijke eenweg- en tweeweg-fusieschatter; het <c3/>-scenario-oppervlak (relaisconstellatie plus LMO/transfer/oppervlak) in CLI, Python, WASM, MCP en de playground; en een end-to-end GSE-prestatiesimulator (geometrie → linkbudget → waarnemingen → SRIF → covariantie). <b>Validatieniveau: simulatiegetoetst:</b> synthetische gesloten-lus-baanbepaling (Mars-LMO ≈ { "0.2" } m) en analytische zelfconsistentie, waarbij de Zon-centrale Marsdynamica onafhankelijk is gecontroleerd tegen JPL <b>DE440</b> (<c4/>, kernel-afhankelijk: { "137" } m bij een boog van 1 dag, het eerlijke residu van niet-gemodelleerde n-lichamen). De gerapporteerde deep-space-nauwkeurigheden zijn <b>simulatie- en covariantiekwaliteitsmaten</b>, geen resultaten van echte missies; validatie met echte DSN/ESTRACK-trackinggegevens staat nog op de roadmap. ANISE (MPL-2.0, edition-2024) blijft beperkt tot een kruiscontrole-crate die buiten de workspace valt, zodat de <c5/>-licentiepoort en de MSRV-1.75-job ongemoeid blijven.

seg-2ab34100a2d7 = <b>Grondsporen op agentschapsniveau uit echte IERS-aardoriëntatie.</b> Het <c1/>-scenario accepteert een optioneel veld <c2/>, de ingevoegde inhoud van een echt IERS-bestand <c3/>, en herleidt het grondspoor via de UT1−UTC en poolbeweging per epoche die daaruit zijn geïnterpoleerd (dezelfde <c4/> die <c5/> gebruikt), waarbij de nominale scalars <c6/>/<c7/>/<c8/> worden overschreven. De gegevens reizen mee in het scenario, zodat de run reproduceerbaar blijft en geen bestandssysteem nodig heeft (hij werkt in de WASM-playground). Een vlag <c9/> voegt vanaf de CLI een echt bestand in het scenario samen. Dit heft de asymmetrie op waarbij alleen <c10/> echte aardoriëntatiegegevens gebruikte.

seg-e778245e7d8f = <b>Consistentie van het referentiestelsel bij afstandssnelheid.</b> Het grondstation wordt nu in het inertiaalstelsel afgebeeld via de exacte inverse van de reductie van de satelliet (<c1/>, die zowel de poolbeweging <em>als</em> de sterrentijdrotatie ongedaan maakt) in plaats van via een GMST-rotatie die poolbeweging negeert, zodat beide eindpunten één stelsel delen. Het effect op de gerapporteerde Doppler ligt onder de validatiedrempel, maar het neemt een echte stelselmismatch weg, evenals een overdreven bewering van „exact” in de broncode.

seg-3b912d8a819d = <b><c1/> wordt gecontroleerd.</b> Een draaggolffrequentie van nul of een niet-eindige waarde geeft nu een foutmelding in plaats van stilzwijgend een Doppler van nul op te leveren (λ = c/draaggolf werd daardoor oneindig), net als de bestaande <c2/>-bewaking.

seg-7d70317ca717 = <b>Validatie van het krachtenmodel door efemeridefitting, kruiselings getoetst aan echte agentschapsproducten.</b> Een nieuwe batch-kleinstekwadratenschatter (<c1/>) met een variationele toestandsovergangsmatrix en uitbijterbewerking, aangestuurd door een volledig krachtenmodel (<c2/>: EGM2008-geopotentiaal, derde lichamen, vaste-aarde-, oceaan- en atmosferische getijden, en empirische CPR/2-per-omloop-versnellingen), gevoed door een echte IERS-aardoriëntatieparser voor <c3/>. Getoetst aan gepubliceerde referentiebanen: <b>Galileo-MEO tot { "13" } cm post-fit</b>, ESA <b>Swarm-A LEO</b> en <b>LRO maan</b> (selenocentrisch, GRAIL-zwaartekracht, IAU-2015-lichaamsstelsel: reduced-dynamic { "6.6" } m, eerlijk gezegd boven de doelwaarde van { "5" } m op het open pad; het DE-klasse ANISE/DE440-pad dat die waarde wel haalt, is een crate buiten de workspace).

seg-bf88a3eb4733 = <b>Scenario <c1/></b>: een geïntegreerde meerlaagse spoofingdetector die RAIM-pariteit per epoche, AGC- en signaalkwaliteitsmonitoren (SQM) en een gefuseerd besluit combineert, getoetst aan de gepubliceerde scenarioparameters van <b>TEXBAT</b> (Humphreys et al., ION GNSS { "2012" }), inclusief het moeilijke geval met uitgelijnde draaggolf.

seg-976036ba124b = <b>Scenario <c1/>: toestand, stelsels, grondspoor en Doppler.</b> Propageer één satelliet (TLE→SGP4 of een analytische baan) en lever per stap de inertiale TEME- en GCRS-toestand (<b>positie <em>en</em> snelheid</b>), de aardvaste ITRF/ECEF-positie, het WGS-84-<b>grondspoor</b> van het subsatellietpunt (breedtegraad / lengtegraad / hoogte) en het topocentrische azimut / elevatie / afstand met afstandssnelheid en <b>Doppler</b> vanaf een grondstation. Bereikbaar via de CLI, Python, WASM en de MCP-server, en meegeleverd als de <b>voorinstelling „Ground track”</b> in de webplayground, waar het spoor <b>over een echte wereldkaart</b> wordt getekend (Natural Earth { "1" }:110m-kustlijnen, ingebed: geen netwerk of externe afhankelijkheid).

seg-761c95f2ede5 = <b>CCSDS OEM-export</b> (<c1/> / <c2/>): het snelheidsdragende Orbit Ephemeris Message dat GMAT / Orekit / STK verwerken, op gelijke voet met de bestaande SP3- en OMM-exporters.

seg-111b0896fdd4 = <b>Vaste-aarde-, oceaan- (FES2004) en atmosferische (Ray { "2001" } S2) aardgetijden</b> op de geopotentiaal (IERS Conventions Ch. { "6" }), ingebouwd in het krachtenmodel.

seg-7e392131261a = <b>ARM64-wheels</b>: de PyPI-build levert nu ook wheels voor Linux aarch64 (manylinux_2_28), macOS arm64 en Windows arm64.

seg-7cc04ea3362b = <b>Uitgebreid technisch rapport (preprint)</b> waarnaar de README verwijst, en het JOSS-artikel indienbaar gemaakt (ORCID van de auteur, bij elke wijziging in CI naar PDF gecompileerd).

seg-3b1e95acc728 = <b>Stelsels tot op de millimeter getoetst aan gepubliceerde Vallado-vectoren.</b> De TEME→PEF/ITRF-reductie, de volledige CIO IAU 2006/2000A GCRS→ITRS-keten en de ECEF→geodetische WGS-84-conversie zijn nu vastgezet op het uitgewerkte voorbeeld in Vallado et al. (AIAA 2006-6753) met de bijbehorende IERS-EOP, en niet alleen op interne zelfconsistentie.

seg-fd9818877a6c = <b>Onafhankelijke kruiscontroles van tijdschalen.</b> ERA en de tijdschalen UTC/TAI/TT komen tot < { "1" } µs overeen met <c1/>, en de planeteefemeride DE440 komt overeen met JPL Horizons (geocentrische posities van Maan en Zon), beide als altijd actieve CI-poorten.

seg-75aeec4cd6d0 = De webplayground verbergt het tabblad met kwaliteitsmaten wanneer een resultaat geen rijen met kwaliteitsmaten bevat, zodat pakketten met alleen een grafiek (efemeride, RAIM, spoof) op hun grafiek openen, bij efemeride op het grondspoor, in plaats van op een lege tabel.

seg-b8ab0cc3ce7f = De geleide schuifregelaars en de <b>parametersweep van de playground werken nu voor het scenario efemeride / grondspoor</b>: de regelaars (breedtegraad / lengtegraad van het station, tijdstap, duur, UT1−UTC) zijn instelbaar, en een sweep kan de geometrie van een overvlucht (maximale elevatie, piek-Doppler, hoogte, snelheid) uitzetten tegen elk daarvan, bijvoorbeeld maximale elevatie tegen breedtegraad van het station. Het tabblad Sweep wordt nu alleen getoond wanneer een scenario daadwerkelijk te sweepen is, zodat geen enkel pakket een regelaar aanbiedt die niets uitzet.

seg-9e7a37e51940 = De SGP4-benadering <c1/> gedocumenteerd op de plek waar GMST wordt aangeroepen (een rotatiefout van ≤ ~{ "13" }″, ruim binnen de eigen modelfout van SGP4) en <c2/> ververst.

seg-174a75e840b0 = De JetBrains-plug-in <b>Kshana — PNT simulator</b> is nu gepubliceerd en geaccepteerd op de <a1>JetBrains Marketplace</a1>. De README, <c1/> en de distributiedocumentatie verwijzen er rechtstreeks naar.

seg-4deaf7918fff = <b>Publicatie in het MCP-register</b> slaagt nu: de <c2/> in <c1/> overschreed de limiet van 100 tekens van het register (HTTP { "422" }). Die is ingekort, en de servernaam (en het eigenaarslabel van de image) is afgestemd op de canonieke namespace <c3/>.

seg-1408961042a1 = <b>Publicatie op de JetBrains Marketplace</b> slaagt nu: de CI uploadde dezelfde pluginversie opnieuw die al handmatig was gepubliceerd, wat de Marketplace weigert. De pluginversie is verhoogd naar <c1/>, en de idempotentiebewaking behandelt een antwoord „already contains version” nu ook als een geslaagde no-op.

seg-74e8cab2f10e = <b>Cache-busting voor <c1/></b>: de van een versiestempel voorziene querystrings voor <c2/>/<c3/> volgen de release, zodat terugkerende bezoekers altijd de actuele build krijgen.

seg-65949229eed7 = <b><c1/>: Kshana als Model Context Protocol-server (MCP)</b> (<c2/>). Een zelfstandige crate buiten de workspace (de <c3/>-SDK is edition { "2024" }) die de getoetste engine via stdio beschikbaar stelt aan AI-agents en -assistenten: Cursor, JetBrains AI Assistant / Junie en elke MCP-client. Tools: <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, elk een dunne wrapper om <c9/>.

seg-bd792f66363c = <b>JetBrains IDE-plug-in</b> (<c1/>). Klik met de rechtermuisknop op een scenario <c2/> → <b>Run Kshana Scenario</b>; kwaliteitsmaten en resultaat-JSON stromen naar een Kshana-toolvenster. Een pure platform-Kotlin-plug-in, compatibel met elke JetBrains IDE { "2024.3" }+.

seg-755358390517 = <b>Openbare distributie en automatische publicatie per release</b> voor beide:

seg-14fc2fd73553 = <c1/> naar <b>crates.io</b> (<c2/>) via <c3/>.

seg-2b39bbfc0581 = <c1/> als <b>OCI-image</b> voor meerdere architecturen op <c2/> (<c3/>) via een nieuwe <c4/>.

seg-c824d1532eb6 = <c1/> naar het <b>officiële MCP-register</b> via GitHub OIDC (zonder secrets); de registervermelding (<c2/>) gebruikt het OCI-pakkettype met een via een label geverifieerde eigenaar.

seg-f90da0c61aac = de IDE-plug-in naar de <b>JetBrains Marketplace</b> via <c1/> (met token als voorwaarde, optionele ondertekening door de ontwikkelaar) bij elke releasetag.

seg-21d7457dad23 = <b>Onafhankelijke kruisvalidatie van referentiestelsels met ANISE/SPICE</b> (<c1/>). Een zelfstandige crate buiten de workspace controleert de IAU 2006/2000A CIO-reductie van <c2/> (<c3/>, GCRS→ITRS) tegen <b>ANISE</b> (de pure-Rust-herimplementatie van NAIF/SPICE) die GCRF→ITRF93 roteert met <c4/> van JPL, waarbij <b>dezelfde IERS-aardoriëntatieparameters <c5/> aan beide kanten worden gevoerd</b>, over acht driemaandelijkse epochen van { "2020" }–{ "2023" }. De twee onafhankelijke stelselrealisaties komen overeen tot een <b>maximale relatieve rotatie van { "0.028" }″: ≤ { "0.86" } m op de grond, ≤ { "0.93" } m in LEO, ≤ { "3.6" } m in GNSS-baan</b>, waarmee de al lang bestaande ROADMAP-stelselkruiscontrole van „< { "10" } m” ruim wordt gehaald (dit vult de bestaande bit-voor-bit-ankers van SOFA/ERFA aan en vervangt ze niet). De crate is geïsoleerd omdat <c6/> + <c7/> MPL-2.0 / edition-2024 zijn en nooit in de afhankelijkhedengraaf van de gepubliceerde <c8/>, de bijbehorende <c9/>, de licentiepoort <c10/> of de MSRV-build mogen belanden; ANISE is vastgezet met <c11/>. Bevat een binary <c12/> (haalt de BPC van ~{ "5" } MB op, drukt een tabel af, schrijft <c13/>), een testpoort die zichzelf overslaat zonder kernel of netwerk, en een optionele CI-job die alleen via <c14/> draait (blokkeert <c15/> nooit). Gedocumenteerd in <c16/> (CIO-rij) en <c17/>.

seg-eb45b43dacc2 = <b>Mobielvriendelijke playground.</b> Horizontale overloop van het <c1/> van de playground op telefoons verholpen (een CSS-grid-item met standaard <c2/> werd ~{ "100" } px breder dan de viewport weergegeven) via <c3/> en breedtebewaakte bedieningselementen; schoon geverifieerd bij { "360" } / { "390" } / { "414" } / { "768" } px. De actieknoppen „Pin to compare” / „Download report” zijn uitgelijnd (gelijke marges in de flexrij). Runknoppen, schuifregelaars, selectievakken en navigatielinks zijn vergroot tot het aanraakdoelminimum van ~{ "44" } px van WCAG { "2.5.5" } / Apple-HIG op telefoons en aanraakapparaten, met ongewijzigde afmetingen op desktop.

seg-fe5095d5e61f = <b>Robuustheidsversterking na een adversariële battle-testronde.</b> ({ "1" }) <c1/> weigert nu niet-eindige elevatie/azimut/variantie en negatieve of niet-eindige covariantiediagonalen (een bijna-singuliere geometrie, opgeschaald door kleine σ, kon eerder de absolute pivotpoort passeren en een NaN-VPL of absurde HPL teruggeven als een <em>geldige</em> <c2/>: een stil integriteitsfalen). ({ "2" }) De numerieke propagator (<c3/>/<c4/>) faalt gesloten bij een niet-eindige begintoestand in plaats van de adaptieve regelaar eindeloos te laten draaien. ({ "3" }) De DEM-celhulpfunctie crasht niet meer op een raster met één sample ({ "1" }×N). ({ "4" }) Het azimut van <c5/> blijft strikt binnen <c6/>. ({ "5" }) <c7/> weigert niet-fysische (NaN / niet-positieve) waarden voor <c8/>/straal.

seg-9ca339d8977a = <b>Binary <c1/> en release-artefact</b>: een generator zonder afhankelijkheden die een afdrukklare HTML-validatiesamenvatting van één pagina uitgeeft, waarin elke in CI afgedwongen validatie (SGP4 666/666, EGM2008, bit-voor-bit-stelsels, NIST Allan, IMU-datasheets, ARAIM/SBAS, reproduceerbaarheid op 3 besturingssystemen, dekking) wordt gekoppeld aan haar test en externe onafhankelijke referentie. De releaseworkflow genereert <c2/> en voegt het (met SLSA-herkomst) toe aan elke getagde release.

seg-bd231d07658f = <b>pytest voor numpy-interoperabiliteit en versterking van wheels</b>: <c1/> (draait in CI) plus een vastgezette manylinux-container en een verificatiestap met <c2/> in de wheel-build.

seg-5427cae6fc39 = <b>Tutorials en onderwijs</b>: <c1/> (drie uitgewerkte tutorials, geannoteerde scenario's per domein, oefeningen van niveau 1/2/3) met <c2/> die elk geciteerd getal vastzet op live engine-uitvoer.

seg-2fad9124c5a6 = <b>Artefacten voor externe indiening</b> (<c1/>, <c2/>, <c3/>): een conceptartikel voor JOSS, een notebook kwantum versus klassiek en kant-en-klare indieningspakketten voor awesome-gnss / ESA Navipedia / NASA ASCL / ESA ESSR / ION/IAC, plus <c4/>, waarmee de externe stappen voor indiening worden voorbereid.

seg-0f88f8bccbc1 = <b>Terreingebonden en gecombineerde alt-PNT-navigatie</b> (module <c1/>): een TERCOM/SITAN-terreinmatchingnavigator over een DEM (<c2/>-lader plus generator van synthetische testdata) en een gecombineerde navigator zonder GPS op basis van zwaartekracht, magnetisme (IGRF) en terrein, beschikbaar als scenariosoorten <c3/> en <c4/>. Getoetst aan convergentie van de terreinmatching (een bekende opgelegde afwijking wordt teruggevonden) en een begrensde fout van het gecombineerde filter over een venster zonder GPS.

seg-bd01ec72fa2a = <b>LunaNet LANS-geometrie</b> (<c1/>): benoemde maanoppervlaklocaties (Apollo 11/15/16, rand van Shackleton) met gezaghebbende selenografische coördinaten, kijkhoeken vanaf het oppervlak (az/el/afstand), zichtbaarheid/dekking en DOP van de locatie, getoetst aan de maanstraal, de gepubliceerde locatiecoördinaten en de identiteit van { "90" }° elevatie bij radiaal zenit.

seg-2dad9cf59ea9 = <b>Geleide browserplayground</b>: schuifregelaars in geleide modus, een uitvoerpaneel met tabbladen, een rondleidingsoverlay bij het eerste gebruik, modi voor parametersweep en overlay van meerdere runs, een 3D-baanweergave in canvas/SVG zonder afhankelijkheden (het baanpakket geeft nu een additieve <c1/> uit), een embed/iframe-modus en download als HTML-rapport, elk met node-unittests in CI.

seg-261604603d67 = <b>Aan datasheets getoetst IMU-foutmodel</b> (<c1/>): ARW/VRW/bias-instabiliteit van ADIS16465/16488/16460 teruggewonnen uit de gesynthetiseerde Allan-deviatie en gecontroleerd tegen de specificaties van de fabrikant (identificatie volgens NIST SP1065 / IEEE { "952" }).

seg-dc7b9bdb3076 = <b>Validatie van Allan-schatters volgens NIST SP1065</b> (<c1/>): de vier schatters reproduceren de gepubliceerde referentiedeviaties van 1000 punten en de betrouwbaarheidsgrenzen van Tabel 32.

seg-5d50be22aacd = <b>SBAS / DO-229E-beschermingsniveaus, ionosfeervrij L1/L5 en een DO-316 compliance-map</b> (module <c1/>). <c2/> vormt de gewogen geometriematrix uit elevatie/azimut van elke satelliet en het foutbudget van UDRE/GIVE/airborne/troposfeer, inverteert de normaalmatrix (gedeelde <c3/>) en projecteert de varianties naar HPL/VPL via de K-factoren van DO-229E (PA 6.0/5.33, NPA { "6.18" }). <c4/> voegt de ionosfeervrije GPS L1/L5-pseudo-afstand toe (IS-GPS-705, <c5/>), getoetst op het opheffen van de onafhankelijke eerste-orde-ionosfeervertraging van de engine. <c6/> herleidt eisen uit DO-316/DO-229E naar de implementerende functies. Getoetst aan gesloten-vormdefinities van de K-factoren, de numpy-referentiegeometrie <c7/> en de identiteit van twee covariantieroutes; de kruiscontrole van gepubliceerde PL-waarden met RTKLIB/gLAB is gedocumenteerd als in afwachting van beoordeling in <c8/>.

seg-e9e60b40e42a = <b>Volledige tesserale sferisch-harmonische zwaartekracht: het EGM2008-veld tot graad/orde { "70" }.</b> Een nieuw <c1/> evalueert de geopotentiaal en de bijbehorende versnelling in het aardvaste stelsel uit volledig genormaliseerde coëfficiënten <c2/>, met de stabiele genormaliseerde Legendre-recurrentie van Holmes–Featherstone (denormaliseren zou bij deze graad overlopen). De meegeleverde coëfficiënten zijn het NGA EGM2008-product (publiek domein, via ICGEM), gebundeld in <c3/> en bit-voor-bit gereproduceerd door <c4/> uit het vastgelegde <c5/>; elk ICGEM-model in <c6/>-formaat laadt via <c7/>. Getoetst aan drie onafhankelijke referenties: instorting tot een puntmassa (alleen <c8/> = <c9/>), een veld met alleen zonale termen dat de bestaande <c10/> reproduceert tot ~{ "1e-9" }, en de analytische versnelling die overeenkomt met de eindige-verschilgradiënt van de direct gesommeerde potentiaal tot <{ "1e-6" }.

seg-c33a2dbf851d = <b>Algemeen-relativistische Lense–Thirring-versnelling (frame dragging)</b> (<c1/>, IERS { "2010" } Eq. { "10.12" }), de gravitomagnetische term bovenop de bestaande Schwarzschild-correctie, via een nieuwe vlag <c2/> ingebouwd in de numerieke propagator. Getoetst als lineair in het impulsmoment van de Aarde en { "1" }–{ "2" } ordes van grootte onder de Schwarzschild-term, het regime van de metingen van LAGEOS / Gravity Probe B.

seg-909562023109 = <b>Een trait <c1/> die de analytische en numerieke baanpropagators verenigt.</b> De numerieke Cowell-propagator met krachtenmodel is nu een volwaardige gelijke van SGP4: een nieuw type <c2/> (begintoestand + <c3/> + <c4/> + keuze van stapverdubbelende of Dormand–Prince-<c5/>) en <c6/> implementeren beide <c7/>, waarvan <c8/> de inertiale TEME-toestand in SI-eenheden (m, m/s) teruggeeft, zodat de twee uitwisselbaar zijn achter een <c9/>. De SGP4-impl is de exacte omrekening van km/min naar SI van de inherente methode (geverifieerd met een gelijkheidstest); de numerieke impl haalt via de trait dezelfde exact-Kepler-poort onder de meter, de twee adaptieve drivers komen overeen, en een <c10/> brengt de onderliggende SGP4-code naar boven.

seg-d094880df57b = Deze release dicht de grootste correctheidskloof in de engine: aardoriëntatie en referentiestelselreductie gebeuren nu op het niveau van een referentie-implementatie (<b>bit-voor-bit getoetst aan ERFA/SOFA</b>), de integriteitsstack krijgt <b>ARAIM voor twee constellaties</b> op echte GPS+Galileo-TLE's, en de lagen voor propagatie, kwantumsensoren, maan/cislunair en geomagnetisme worden allemaal verdiept, naast een getypeerde Python-API, een rijkere browserplayground en een reproduceerbaarheidsmatrix op drie besturingssystemen. Hoogtepunten:

seg-bfe1d4a7cabd = <b>Referentiestelsels, bit-voor-bit.</b> Volledige IAU 2000A- en 2000B-nutatie, IAU { "2006" }-precessie, de op CIO gebaseerde (X, Y, s) IAU 2006/2000A GCRS↔ITRS-reductie, IERS-poolbeweging en TEME→GCRS/ITRS-uitvoerstelsels, elk bit-voor-bit getoetst aan ERFA/SOFA-referentieroutines.

seg-bb5705347a24 = <b>ARAIM voor twee constellaties</b> (GPS + Galileo) op echte TLE's, met HPL/VPL, uitvoer als Stanford-diagram en een open <c1/>.

seg-2865dadcd4c8 = <b>Cislunaire PNT</b>: een Aarde–Maan-CR3BP-propagator, MCI↔MCMF-stelsels, selenografische coördinaten en een uitvoerbaar LunaNet-scenario voor maanintegriteit.

seg-3b636707a158 = <b>Kwantumsensing</b>: Coriolis- en AC-Stark-systematiek voor de koude-atoominterferometer, een driftsweep en validatie tegen het budget van Freier ({ "2016" }).

seg-10bc94801a6a = Het geomagnetische hoofdveldmodel <b>IGRF-14</b>, zelfstandig en getoetst.

seg-6485f627d793 = <b>Getypeerde Python-API</b> (PyO3 <c1/>/<c2/>, <c3/>, <c4/>, <c5/>, typestubs) met een CI-wheelbuild, plus eersteklas GCRS/ITRS-propagatoruitvoer en CCSDS OMM-export.

seg-2b7693641333 = <b>Geloofwaardigheid en reproduceerbaarheid</b>: een rechtstreekse vergelijking van de SGP4-nauwkeurigheid met de onafhankelijke crate <c1/>, een CI-dekkingspoort (~{ "97" }% regels op <c2/>) en een reproduceerbaarheidsmatrix op drie besturingssystemen (<c3/>/<c4/>/<c5/>).

seg-32e53ac66056 = <b>Elke playground-grafiek past nu bij het sitethema.</b> Alle twaalf SVG-grafiekgeneratoren, de resultaat-/holdover-grafiek (<c1/> + <c2/>), de Allan-deviatiegrafiek (<c3/>) en elke scenariografiek (<c4/>, <c5/>, <c6/>, <c7/>, <c8/> Stanford + beschikbaarheid, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>), gebruikten koele marineblauwe panelen (<c15/>), koelgrijze assen en tekst en een botsend rood/blauw/paars reekspalet. Ze gebruiken nu overal het warme grafietpalet: panelen met <c16/>, warm raster met <c17/>, labels met <c18/>, met een consistente toewijzing van reeksen: kwantum = honinggoud (<c19/>), klassiek = warm amber (<c20/>), specificatie/limiet = <c21/>. Weergaven met veiligheidskleuren behouden hun betekenis: het RAIM-Stanford-diagram blijft groen (beschikbaar) / amber (misleidend) / rood (gevaarlijk) / gedempt staalgrijs (niet beschikbaar), en HPL/VPL lezen als goud/brons.

seg-2bb31dfc7756 = <b>Grafieken beschrijven zichzelf nu bij opslaan/downloaden.</b> Beide grafieken bakken hun titel in de SVG (de titel van de Allan-grafiek en de ondertitel „lower is better” stonden eerder alleen als HTML rond de afbeelding, zodat een opgeslagen afbeelding geen bijschrift had), en beide dragen een herkomstvoettekst, <c1/>, zodat een gedownloade grafiek op zichzelf staat en reproduceerbaar blijft.

seg-9f528e334cd8 = <b>Elke grafiek draagt nu de herkomstvoettekst.</b> De voettekst, <c1/>, wordt centraal gestempeld voor alle scenariosoorten in <c2/> (eerder stond hij alleen op de holdover- en Allan-grafieken), zodat elke opgeslagen of gedownloade afbeelding, uit de playground, uit de <c3/>-export van de CLI of uit de HTML-scorecard, haar versie, scenariovingerafdruk en bron vermeldt. De hash is voor de duidelijkheid gelabeld als <c4/> en komt uit <c5/> van het resultaat waar aanwezig, met een terugval op een bron-hash voor de integriteits- en maanrapporten. Wat de vingerafdruk is en waarom hij er staat, is beschreven in de README-sectie „Output” en in <a1><c6/></a1>.

seg-635697ed3fb1 = <b><c1/> en de RAIM Stanford-ruissampler geven nu geen panic meer bij waarden buiten bereik of niet-eindige waarden</b> (een bevinding uit fuzzing die afhing van de <c2/>-volgorde, afkomstig van de nieuwe ARAIM-scenario's). <c3/> bewaakt <c4/>/<c5/> nu zoals <c6/> (en geeft een grenswaarde terug in plaats van met <c7/> te crashen), en de beschikbaarheids-<c8/> van de Stanford-ruis begrenst tot een strikt positieve σ, zodat de integriteits-/ARAIM-stack nooit crasht op gemuteerde of verkeerd geconfigureerde scenario's.

seg-b36a0c42845e = <b>CI-matrix voor reproduceerbaarheid over platforms.</b> Een nieuwe job <c1/> draait de reproduceerbaarheidstests bij elke push op <b>ubuntu-latest, macos-latest en windows-latest</b>. Omdat het volledige resultaat-JSON niet byte-identiek is over besturingssystemen heen (afwijking in de laatste ULP van libm), bevestigt hij exact de platformonafhankelijke projectie, de invoervingerafdruk plus de vorm van de uitvoer, per scenario vastgezet als SHA-256-goldens in <c2/> door de nieuwe <c3/>, naast de numerieke pins (<c4/>, tot { "1e-6" }), de SGP4-toestanden (<c5/>, tot { "2e-5" } km) en determinisme binnen hetzelfde proces (<c6/>). Samen bewijzen deze reproduceerbaarheid over platforms op drie besturingssystemen, zonder de broosheid van exacte byte-hashing van de volledige uitvoer. <c7/> documenteert de scheiding.

seg-9b8c0a407387 = <b>Dekkingspoort voor code in CI.</b> Een nieuwe job <c1/> draait <c2/> met de op LLVM-bron gebaseerde engine, publiceert een lcov-rapport als build-artefact en handhaaft een ondergrens voor regeldekking op <c3/> (gegenereerde gegevenstabellen, het CLI-startpunt, de tests en webassets uitgesloten). De gemeten regeldekking is ~{ "97" }% op <c4/> (SGP4 en de klokmodules ≥{ "95" }%); de poort staat op { "85" }%, boven het doel van ≥{ "80" }% en ruim onder de gemeten waarde, zodat hij regressies opvangt zonder onbetrouwbaar te zijn. Een dekkingsbadge wordt gepubliceerd in de README.

seg-1dfc4beb239a = <b>SGP4/SDP4 rechtstreeks vergeleken met de onafhankelijke crate <c1/>.</b> Een nieuwe test (<c2/>) toetst de propagator van Kshana kruiselings aan de meest gebruikte Rust-SGP4-bibliotheek (neuromorphicsystems/sgp4, toegevoegd als dev-dependency alleen voor tests) over dezelfde { "666" } AIAA 2006-6753-vectoren. Met beide aangestuurd op het WGS72-zwaartekrachtmodel dat de vectoren gebruiken, komen de twee onafhankelijke implementaties overeen tot <b>submicron</b> bij banen nabij de aarde en resonante banen en tot <b>{ "4.12" } mm in het slechtste geval</b> over alle regimes, en reproduceren beide de referentietabel <c3/>. De vastgelegde vergelijkingstabel (<c4/>, opnieuw gegenereerd via <c5/>) splitst het resultaat uit per regime (LEO/MEO, deep-space, resonantie van ½ dag en 1 dag) en vermeldt de vier bewust pathologische gevallen die de crate bij constructie weigert. De live-asserties houden beide binnen { "2e-5" } km van de referentie en laten ze onderling binnen { "4e-5" } km overeenkomen: een regressiebewaking, geen eenmalige controle. Dit is concurrerende stamboom: juistheid tegenover een onafhankelijke codebase, niet alleen een statische tabel. (De standaard <c6/> van de crate gebruikt WGS84 en wijkt daardoor ~km af van de WGS72-referentie; dit wordt eerlijk vermeld in de tekst bij de tabel.)

seg-dc75162ecd64 = <b>CCSDS OMM-export is nu end-to-end bereikbaar.</b> De OMM-schrijver (<c1/>) had eerder geen CLI/API-pad; de gemiddelde elementen van een scenario <c2/> kunnen nu worden gepubliceerd als een CCSDS 502.0-B-2 OMM-catalogus, één OMM-KVN-bericht per satelliet die via een TLE is gedefinieerd, via <c3/>, of <c4/> in het scenario schrijft automatisch <c5/> (naar het voorbeeld van de bestaande <c6/>). Elk bericht bevat het <b>echte</b> NORAD-catalogusnummer van de satelliet, de internationale COSPAR-aanduiding (<c7/>) en de epoche (CCSDS-vorm met dag van het jaar), ingelezen uit TLE-regel { "1" } door de nieuwe <c8/>; de naamregel wordt <c9/> (anders <c10/>). <c11/> is de scenario-epoche, niet de wandklok, zodat de uitvoer reproduceerbaar is. Nieuwe API: <c12/> / <c13/>, <c14/>, <c15/>. Een synthetisch Walker- of RINEX-scenario (zonder gemiddelde TLE-elementen) geeft een fout in plaats van een leeg bestand uit te geven. Getoetst aan de meegeleverde momentopname van 30 satellieten <c16/> (<c17/>).

seg-036782a2b65e = <b>Interactieve hover-uitlezingen op de playground-grafieken.</b> Wanneer de cursor over een grafiek beweegt, springt een haarkruis naar de dichtstbijzijnde sample en verschijnt een waarde-tooltip (<c1/>, aangesloten in <c2/>). Op de Allan-grafiek toont hij τ en de σ_y(τ) van elke klok; op de tijdreeksgrafieken van scenario's (klok-holdover, dead-reckoning, tijdoverdracht, hybride PNT, GNSS/INS) toont hij de tijd en de waarde van elke suite in de eigen eenheden van de grafiek (ns / m / ps / benuttingsgraad), uit het resultaat ingelezen zodat de uitlezing bij de curve past. Gespecialiseerde diagrammen (RAIM, spoof, sweep) krijgen geen overlay. De grafieken blijven zichzelf beschrijvende blob-<c3/>s: de overlay is een transparant haarkruis plus tooltip erbovenop, zodat downloaden/vergelijken/exporteren ongemoeid blijven. De coördinatenwiskunde (dichtstbijzijnde sample, cursor→plotfractie, polylijn-parsing) is unit-getest (<c4/>, draait in CI).

seg-1588ae024e5d = <b>A/B-vergelijkingsmodus in de playground.</b> Zet een willekeurige run vast als basislijn A, voer een tweede scenario uit, en de twee worden naast elkaar getoond met een deltatabel van kwaliteitsmaten (holdover, tijdsynchronisatie-RMS/p95, beschikbaarheid) die per maat de winnaar kleurt (<c1/>, aangesloten in <c2/>; deltalogica unit-getest in <c3/>, draait in CI). Alle waarden worden als tekst ingevoegd en alle grafieken via blob-<c4/>, zodat niets uit een scenariotekenreeks ooit als opmaak wordt geïnjecteerd.

seg-6e7a99f8f275 = <b>Downloadknoppen voor grafieken (SVG + PNG).</b> Elke playground-grafiek heeft nu een werkbalk „Download SVG / PNG” die bij het thema past (<c1/>, aangesloten in <c2/>). SVG levert het getrouwe, schaalbare origineel terug; PNG rastert dezelfde zichzelf beschrijvende afbeelding op 2x voor dia's en documenten. Bestanden krijgen een naam met hun herkomst, <c3/>, en de logica voor bestandsnaam en grootte is unit-getest (<c4/>, draait in CI).

seg-4cb87e7dc892 = <b>Geomagnetisch hoofdveldmodel IGRF-14 (<c1/>).</b> Het IAGA-standaardveld in sferische harmonischen (graad/orde { "13" }, epoche { "2025.0" } + secundaire variatie { "2025" }–{ "2030" }; coëfficiënten machinaal gegenereerd uit het officiële <c2/> door <c3/> in <c4/>, bit-voor-bit reproduceerbaar). Een Schmidt-genormaliseerde synthese geeft de veldvector (noord/oost/omlaag) en afgeleide elementen (declinatie, inclinatie, horizontale/totale intensiteit) op elke geodetische locatie en datum, plus de geomagnetische pool en de dipoolsterkte: het magnetische tegenstuk van de zwaartekrachtkaartmatcher voor alternatieve PNT-navigatie. Zelfstandig getoetst: de synthese komt overeen met de exacte gesloten-vorm gekantelde dipool, het volledige analytische veld van graad 13 komt overeen met een eindig verschil van de scalaire potentiaal, de dipoolas reproduceert de bekende geomagnetische pool (~{ "80.7" }°N, −{ "72.7" }°E) en een sterkte van ~{ "29.7" } µT, en het globale veld is fysisch.

seg-c69d50031da4 = <b>Getypeerde Python-bindingen (<c1/>).</b> Naast de string-in/string-uit-functies <c2/>/<c3/> biedt de module nu een getypeerde klasse <c4/> (<c5/>, <c6/>, <c7/> en een accessor <c8/> die het resultaat ingelezen teruggeeft als een native Python-dict: geen JSON-herparsing, geschikt voor NumPy-omhulling), plus <c9/>, <c10/> (ingelezen lijst van metadata-dicts) en <c11/> (een lijst foutmeldingen die geen uitzondering werpt). Bevat een PEP { "561" }-typestub (<c12/> + <c13/>) voor mypy/pyright/editors en een quickstart <c14/>. De bestaande functies zijn ongewijzigd.

seg-fb65ac14344c = <b>Eersteklas uitvoerstelsels voor propagators (<c1/> enum <c2/> + <c3/> + <c4/>).</b> Elke <c5/> (Kepler, SGP4, RINEX, GLONASS, SP3) kan nu zijn positie uitgeven in TEME, <b>GCRS</b> (≈ J2000) of <b>ITRS</b> (aardvast): TEME natief, GCRS via de getoetste TEME→GCRS-reductie, ITRS door die te koppelen aan de IAU 2006/2000A CIO-rotatie <c6/>, en zijn volledige GCRS-toestand (positie + snelheid) via <c7/>. De inertiale uitvoer van de datum is niet langer beperkt tot TEME.

seg-8f596733c439 = <b>Op CIO gebaseerde IAU 2006/2000A-reductie van hemels naar aards stelsel (<c1/>).</b> De moderne, equinoxvrije keten GCRS↔CIRS↔ITRS: CIP-coördinaten <c2/> afgelezen uit de IAU 2006/2000A bias-precessie-nutatiematrix (hergebruik van de getoetste FW-precessie + 2000A-nutatie met de <c3/> P03-aanpassing), de reeks van 66 termen voor de CIO-locator <c4/> (<c5/>, machinaal gegenereerd uit de ERFA-referentie door <c6/> in <c7/>, bit-voor-bit reproduceerbaar), de GCRS→CIRS-matrix (<c8/>), de aardrotatiehoek (<c9/>) en de volledige GCRS→ITRS-rotatie (<c10/>, samengesteld met de bestaande IERS-poolbeweging). <b>Bit-voor-bit</b> getoetst aan de gepubliceerde <c11/> (X={ "0.5791308482835292617e-3" }, Y={ "0.4020580099454020310e-4" }, s=-0.1220032294164579896e-7 bij JD_TT { "2453736.5" }) en aan de testvectoren van <c12/> en <c13/>. De CIO-keten en de oudere equinox/GMST-1982-TEME-reductie blijken overeen te komen op het verschil in sterrentijdconventie na, gedocumenteerd als ≈{ "2" }·(equinoxvergelijking). Dit is de rigoureuze reductie die het equinox/GMST-pad benaderde.

seg-32e6d8dfcebc = <b>Volledige IAU 2000A-nutatiereeks (<c1/> <c2/>, <c3/>).</b> Het complete MHB2000-model, { "678" } luni-solaire + { "687" } planetaire termen, nauwkeurig tot < { "0.1" } mas, naast de bestaande afkapping 2000B van 77 termen. De tabellen zijn machinaal gegenereerd uit de IAU SOFA / ERFA-referentie <c4/> door <c5/> in <c6/> (de generator reproduceert het vastgelegde bestand bit-voor-bit), en de hele reeks, zowel de fundamentele-argumentenverzamelingen van IERS-2003 en MHB2000 als de planetaire lengtes, is <b>bit-voor-bit</b> getoetst aan de gepubliceerde testvector <c7/> (Δψ = −{ "0.9630909107115518e-5" }, Δε = { "0.4063239174001679e-4" } bij JD_TT { "2453736.5" }, tot { "1e-13" } rad). De standaardreductie TEME→GCRS houdt de 2000B-reeks aan (~{ "1" } mas, onder de vereenvoudiging van de snelheidsstelselrotatie in de keten); <c8/> biedt de matrix van de datum met < { "0.1" } mas voor aanroepers die die nodig hebben.

seg-35e9e419d2ae = <b>Uitvoerbaar scenario voor maanintegriteit (<c1/>, <c2/>).</b> Sluit de beschermingsniveaupas voor de zuidpool van de Maan (<c3/> <c4/> → <c5/>) aan op de scenariorunner met een JSON-<c6/> en een SVG-grafiek van HPL tegen tijd, zodat het cislunaire integriteitsgeval rechtstreeks vanaf de CLI bereikbaar is. Het toont eerlijk de kloof: met de LANS σ_URE van { "30" } m overschrijdt de HPL aan de zuidpool (≈ { "260" }–{ "450" } m) een alarmlimiet van { "50" } m ({ "0" } % beschikbaar): PNT-integriteit op de Maan is nog niet gehaald.

seg-1910e8110b43 = <b>ARAIM-beschikbaarheid voor twee constellaties op echte GPS+Galileo-TLE's, en aansluiting op de scenariorunner (<c1/>, <c2/>, <c3/>).</b> Voegt <c4/> toe (de geavanceerde ARAIM-engine, met storingen van één satelliet <em>en</em> van een hele constellatie, uitgevoerd over een tijdraster) en <c5/>, en sluit die via een vlag <c7/> aan op de runner <c6/>, zodat een multi-GNSS-ARAIM-studie rechtstreeks vanuit TOML bereikbaar is. Een test met echte gegevens (<c8/>) op meegeleverde momentopnamen van Celestrak GPS+Galileo van 2026-06-07 toont dat het poolen van Galileo de ARAIM-beschikbaarheid optilt van { "0.21" } naar { "0.67" } bij een veeleisende VAL van { "12" } m ({ "10.5" }→{ "21.8" } satellieten in zicht), terwijl de modus die robuust is tegen constellatiestoringen met slechts twee constellaties fundamenteel beperkt is: de kwantitatieve reden waarom robuuste integriteit met twee constellaties richting een derde constellatie of SBAS drijft. Eerlijk restant: de numeriek exacte reproductie van EU ARAIM TN Tabel A-3 tegen één versievastgezette epoche, en een Zenodo-fixturerecord.

seg-78ab887a4543 = <b>Het circulaire beperkte driebodenprobleem (CR3BP) voor het Aarde–Maan-systeem (<c1/>).</b> Een nieuwe kern voor cislunaire dynamica die de tweelichamen-/SGP4-propagators niet kunnen bieden: bewegingsvergelijkingen in het roterende stelsel (<c2/>), een RK4-propagator (<c3/>), de integraal van de Jacobi-constante (<c4/>) en de vijf Lagrangepunten (<c5/>). Getoetst aan gesloten-vorm- en gepubliceerde ankers: de collineaire Aarde–Maan-punten (L1 ≈ { "0.83692" }, L2 ≈ { "1.15568" }, L3 ≈ −{ "1.00506" }), de exacte gelijkzijdige L4/L5 = (½−μ, ±√3/2, { "0" }), alle vijf bevestigd als veldevenwichten, Jacobi behouden tot op integratorprecisie onder propagatie, en de herstelkracht buiten het vlak die halo-/NRHO-banen mogelijk maakt. Dit is de basis voor het weergeven van een echte NRHO. Eerlijk restant: met differentiële correctie bepaalde periodieke beginvoorwaarden van de NRHO { "9" }:{ "2" }, het excentrische/efemeride-(DE-)model en de gedenormaliseerde transformatie naar de selenocentrische stelsels van <c6/>.

seg-14f4572144f3 = <b>IERS-poolbeweging en de TEME→ITRF-reductie (<c1/>).</b> Voegt <c2/> toe (SOFA <c3/>: <c4/> met de TIO-locator <c5/>), <c6/> / <c7/> en <c8/>, de op GMST gebaseerde TEME→PEF-rotatie gevolgd door poolbeweging, wat een ITRF-precieze aardvaste positie compleet maakt bovenop de uitsluitend op GMST gebaseerde <c9/> (poolbeweging is op baanstraal een effect van tientallen meters). <c10/>/<c11/> zijn waargenomen IERS-grootheden die de aanroeper aanlevert. Eerlijk restant: een volledig op CIO gebaseerde (X, Y, s)-keten en een numerieke ANISE/SPICE-kruiscontrole van <{ "10" } m blijven vervolgwerk.

seg-b5e84faf880c = <b>Systematiek van de koude-atoominterferometer, driftsweep en validatie tegen een gepubliceerd apparaat (<c1/>, <c2/>).</b> Breidt de CAI-versnellingsmeter vanuit eerste beginselen uit met de twee belangrijkste deterministische systematische effecten: de <b>Coriolis-/rotatiefase</b> <c3/> (<c4/>, met de equivalente versnellingsbias <c5/> via <c6/>) en de <b>AC-Stark-lichtverschuivingsfase</b> <c7/> (<c8/>, die bij een constante verschuiving door de π/2–π–π/2-symmetrie wegvalt). Voegt <c9/> toe (drift van de dead-reckoning-positie tegen cyclustijd: de kern van een vergelijking kwantum tegenover klassiek) en een validatietest tegen de mobiele gravimeter van Freier et al. { "2016" } (arXiv:{ "1512.05660" }): de gemodelleerde ondergrens van kwantumprojectieruis ligt onder, en binnen ~{ "2" } ordes van, de gepubliceerde kortetermijnruis van { "96" } nm/s²/√Hz. <c10/> bijgewerkt. Eerlijk restant: systematiek van golffront/bundelrichting, oplossing van franjeambiguïteit, de exacte reproductie van de vliegtest van CARIOQA-PMP / Boeing-AOSense (vereist gepubliceerde PSD's van het platform) en een JS-playground-voorinstelling.

seg-f32829ed9cf1 = <b>Cislunaire stelselreductie en een integriteitspas voor de zuidpool van de Maan (<c1/>).</b> Breidt de lunaire ARAIM-engine uit met de MCI↔MCMF-rotatie (Moon-centered inertial ↔ Moon-fixed) (<c2/> / <c3/>, een vereenvoudigd gemiddeld-rotatiemodel met de lunaire sterrentijdsnelheid), selenografische breedtegraad/lengtegraad/hoogte (<c4/> / <c5/>) en <c6/>: een geland ontvanger in de Artemis-regio tegenover een representatieve LunaNet-relaisset over een pas van { "24" } uur, wat de integriteitskloof eerlijk kwantificeert: met de nominale LANS σ_URE van { "30" } m is het beschermingsniveau eindig maar overschrijdt het een alarmlimiet van { "50" } m voor oppervlakteoperaties. Eerlijk restant: de nauwkeurige LANS NRHO-efemeride (een cislunaire 3-lichamenbaan), de fysische libratie / precesserende maanpool (DE421/SPICE) en een LunaNet-TOML-scenario blijven vervolgwerk.

seg-5ef720855cc4 = <b>ARAIM-integriteitsondersteuningsbericht, Stanford-diagram-SVG en de open ARAIM-referentie (<c1/>, <c2/>).</b> Voegt een expliciet <c3/> toe (σ_URA / σ_URE / b_nom / P_sat / P_const, met de referentiewaarden van WG-C voor GPS+Galileo en omzetters <c4/> / <c5/> naar de engines <c6/> voor één storing en <c7/> voor storingen van een hele constellatie), een zelfstandige <c8/>-renderer van het Stanford-integriteitsdiagram (de vier zones, de grens <c9/>, de hulplijnen voor de alarmlimiet, één kleurgecodeerde markering per epoche) en <c10/> waarin het algoritme, de ISM, de storingshypothesen, het contract voor het beschermingsniveau en het voordeel van twee constellaties worden beschreven. Tests tonen de winst in geometrie/redundantie (het poolen van een tweede constellatie verkleint de HPL voor één storing) en tolerantie voor constellatiestoringen (de gebruiker met twee constellaties overleeft het verlies van een hele constellatie; een gebruiker met één constellatie niet). Eerlijk restant: de numerieke reproductie van EU ARAIM TN Tabel A-3 / het beschikbaarheidscijfer van { "15" }–{ "25" } % tegen een versievastgezette momentopname van echte TLE's, een Zenodo-fixturerecord en het aansluiten van <c11/> op de scenariobestandsrunner.

seg-3607eb34acd9 = <b>IAU 2000B-nutatie en de volledige inertiale reductie TEME→GCRS/J2000 (<c1/>).</b> Voegt het tweede en derde onderdeel toe van een echte inertiale stelselreductie bovenop de meegeleverde IAU { "2006" }-precessie: de luni-solaire MHB2000-nutatiereeks van 77 termen (<c2/>, de standaardafkapping IAU 2000B, nauwkeurig tot ~{ "1" } mas) met de fundamentele argumenten van Delaunay en de SOFA-nutatiematrix <c3/>, en de keten van Vallado AIAA-2006-6980 TEME→TOD (equinoxvergelijking) → TOD→MOD (nutatie) → MOD→GCRS (bias-precessie), beschikbaar als <c4/> / <c5/>. De reeks, argumenten en eenheidsconstanten zijn overgenomen uit de IAU SOFA / ERFA-referentie <c6/> en <b>bit-voor-bit</b> getoetst aan de gepubliceerde testvector <c7/> (Δψ, Δε tot { "1e-13" } rad). Eerlijk restant: de volledige IAU 2000A-reeks van 678 termen (<{ "0.1" } mas), een numerieke ANISE/SPICE-kruiscontrole van <{ "10" } m en poolbeweging blijven vervolgwerk (zie <c8/>).

seg-d9b5e459f6eb = Deze release brengt de eerste <b>niet-analytische baanpropagator</b> van Kshana: een Cowell-integrator met een hiërarchisch krachtenmodel van zes storingen (tweelichamen + zonale J2–J6 + epochegestuurde derde lichamen Zon/Maan + stralingsdruk van de Zon met een conische umbra-/penumbraschaduw + atmosferische weerstand + de post-Newtoniaanse relativistische Schwarzschild-correctie), aangestuurd door een keuze uit twee adaptieve integratoren (RK4 met stapverdubbeling en het ingebedde paar Dormand–Prince RK5({ "4" })), naast een laag voor manoeuvres / baanontwerp (impulsieve en eindige brandperioden, een Lambert-oplosser van Izzo en een porkchop-sweep), een alt-PNT-laag met zwaartekrachtkaartmatching die een GPS-vrij spoor van 60 minuten herstelt tot onder { "500" } m, een batch- en sequentiële pijplijn voor baanbepaling en een volledig strak gekoppeld GNSS/INS-UKF met 17 toestanden en kwantum-CAI-dead-reckoning. Elke numerieke mogelijkheid is vastgezet op analytische waarheid of een met de hand afgeleide gesloten vorm; de standaard uitgeschakelde storingen laten de vrijgegeven goldens ongemoeid.

seg-aa8d478f5c10 = <b>Post-Newtoniaanse (Schwarzschild) relativistische correctie (<c1/> + <c2/>).</b> Voegt de dominante algemeen-relativistische storing op een baan nabij de aarde toe, de belangrijkste oorzaak van de relativistische perigeumvoortgang, in de IERS-/Montenbruck–Gill-vorm <c3/> <c4/>. Net als atmosferische weerstand is zij <b>snelheidsafhankelijk</b>, en loopt zij dus mee in de rechterzijde van de integrator voor <c5/> via [<c6/>], opt-in en standaard uitgeschakeld. Zelfstandig getoetst: op een cirkelbaan valt zij terug op de gesloten vorm <c7/> (zuiver radiaal en <b>naar buiten</b> gericht, componenten buiten de as exact nul); haar <b>verhouding tot tweelichamen is de leerboekwaarde <c8/> in LEO</b> (de signatuur van <c9/>); een geval met radiale snelheid komt overeen met de met de hand vereenvoudigde <c10/>; en in de propagator <b>verstoort zij de baan zonder die te dissiperen</b>: de halve lange as blijft behouden tot ruim onder een meter per dag, het structurele tegendeel van het monotone verval door weerstand. Omdat zij standaard uit staat, blijven de goldens voor tweelichamen/J2/zonaal ongemoeid. Het afstemmen van de PPN-parameters (<c11/>,<c12/>) en de Lense–Thirring-frame-draggingterm blijven vervolgwerk.

seg-043e831224ab = <b>Conisch schaduwmodel met umbra en penumbra (<c1/>), nu gebruikt door de stralingsdruk van de Zon.</b> Verbetert de binaire eclips met umbracilinder tot een gladde factor <c2/>: de Zon en de Aarde worden gemodelleerd als schijven met schijnbare hoekstralen <c3/>, <c4/> en een schijnbare middelpuntsafstand <c5/>, en <c6/> is één min de fractie van de zonneschijf die door de aardschijf wordt bedekt (de overlappende lensoppervlakte van de twee cirkels): volledig zonlicht voor <c7/>, totale umbra voor <c8/>, annulair voor <c9/> en een doorlopende penumbra daartussen. <c10/> gebruikt dit nu, zodat de SRP-kracht soepel afneemt door de eclips in plaats van aan/uit te schakelen. Voegt de nominale IAU-waarde <c11/> toe. Zelfstandig getoetst: <c12/> in volledig zonlicht en <c13/> diep in de umbra (exact), een <b>gladde monotone penumbra</b> (<c14/> stijgt van { "0" } → ~½ bij <c15/> → { "1" } over de band <c16/>), en de conische penumbra <b>reikt voorbij de umbracilinder</b> (een punt dat de binaire cilinder volledig verlicht noemt, is <c17/> voor de kegel). De eenvoudigere <c18/> blijft beschikbaar; limb darkening van de Zon en de schaduw van de afgeplatte Aarde blijven vervolgwerk.

seg-8d1c16019f3c = <b>Ingebedde integrator Dormand–Prince RK5({ "4" }) (<c1/> / <c2/> + <c3/>).</b> Voegt het standaard ingebedde Butcher-tableaupaar van Dormand–Prince ({ "1980" }) toe naast de bestaande RK4-driver met stapverdubbeling: zeven FSAL-stadia leveren een oplossing van de 5e orde en een foutschatting van de 4e orde uit één set evaluaties ({ "7" } tegenover { "11" } functie-aanroepen per stap), een goedkopere schatting van de lokale fout. De adaptieve driver hergebruikt dezelfde RMS-foutnorm en stapregelaar <c4/>, en is dus een directe alternatieve vervanger; <c5/> maakt hem beschikbaar op het krachtenmodel van de baan. Zelfstandig getoetst: de ingebedde foutschatting is <b>O(h⁵)</b> (halvering van de stap verkleint haar ~{ "32" }×); DP5({ "4" }) integreert <c6/> tot <c7/> en de harmonische oscillator over { "50" } perioden met behoud van energie tot <{ "1e-6" }; hij bereikt hetzelfde eindpunt bij dezelfde tolerantie in <b>minder functie-evaluaties</b> dan stapverdubbeling (zonder in te leveren op nauwkeurigheid); en <c8/> haalt dezelfde poort van analytische waarheid als het RK4-pad: <b>submeter tegenover de exacte Kepleroplossing met universele variabelen over een LEO-baan van { "24" } uur</b>, terwijl de twee drivers op een J2..J6-baan (geen gesloten vorm) binnen <{ "1" } m overeenkomen. Hogere ingebedde paren (RKF7({ "8" }) / DOP853) blijven vervolgwerk.

seg-cca3c00757d6 = <b>Atmosferische weerstand aangesloten op de propagator als eerste snelheidsafhankelijke kracht (<c1/> + <c2/> + <c3/>).</b> Voegt de <b>stuksgewijs exponentiële atmosfeer van Vallado Tabel 8-4</b> <c4/> toe ({ "28" } banden vanaf zeeniveau tot voorbij { "1000" } km, onder het oppervlak begrensd) en de kwadratische weerstand <c5/> tegenover de <b>meeroterende atmosfeer</b> <c6/> (<c7/>). Omdat weerstand van snelheid afhangt, krijgt <c8/> een nieuwe <c9/> en geeft de rechterzijde van de integrator nu de snelheid door (<c10/>); de alleen op positie gebaseerde <c11/> is ongewijzigd, zodat de conservatieve termen en goldens ongemoeid blijven. Zelfstandig getoetst: de dichtheid <b>verankert op de zeeniveauwaarde van { "1.225" } kg/m³</b>, wordt onder het oppervlak begrensd, <b>neemt monotoon af</b> door LEO, ligt bij { "400" } km in de zonnegemiddelde band van ~{ "1e-12" } kg/m³, en haar <b>teruggewonnen lokale schaalhoogte (≈ { "58" } km bij { "400" } km)</b> is fysisch; weerstand <b>werkt de meeroterende relatieve snelheid tegen</b> met de LEO-grootte van ~{ "2e-6" } m/s² voor <c12/>; en, de sleutelsignatuur, weerstand is <b>dissipatief</b>: een baan van { "300" } km verliest specifieke energie <b>monotoon</b> en haar halve lange as <b>neemt af met een begrensd ~km/dag</b>, terwijl de vacuümbasislijn de energie behoudt tot <{ "1e-9" }. De thermosferische dichtheid van NRLMSISE-00 (de clausule over weerstandsdichtheid < { "5" } %) blijft vervolgwerk.

seg-0d20f02ef85f = <b>Stralingsdruk van de Zon epochegestuurd aangesloten op het krachtenmodel van de propagator (<c1/> + <c2/>).</b> Voegt het <b>kanonskogel-SRP-model</b> <c3/> toe met een <b>eclipsfactor van een cilindrische schaduw</b> (<c4/>, ν ∈ { "{" }{ "0,1" }{ "}" }): de stralingsdruk <c5/> uit de moderne totale zonne-irradiantie van { "1361" } W/m² (≈ { "4.5398" }·{ "10" }⁻⁶ N/m²), de afname van de flux met het kwadraat van de afstand <c6/> en de radiale duw <b>van de Zon af</b>. Hij loopt mee in dezelfde <b>epochegestuurde rechterzijde</b> als het derde lichaam, waarbij de Zon van <c7/> één keer wordt bemonsterd op de voortgeschreden epoche <c8/>, gedeeld door de derde lichaam Zon en SRP. Combineerbaar: <c9/>. Zelfstandig getoetst aan met de hand afgeleide signaturen: de <b>stralingsdruk op 1 AU komt uit op de leerboekwaarde van ≈ { "4.5398" }·{ "10" }⁻⁶ N/m²</b>; de SRP van een volledig verlichte LEO-satelliet is <b>bit-identiek</b> aan de kanonskogelformule, wijst <b>van de Zon af</b> en ligt in de <b>band van ~{ "1.36" }·{ "10" }⁻⁷ m/s²</b> voor cᵣ = { "1.5" }, A/m = { "0.02" } m²/kg; <b>een verdubbeling van de afstand tot de Zon verkleint de grootte tot een kwart</b> (omgekeerd kwadraat); de <b>cilindrische schaduw verduistert alleen de umbracilinder</b> (anti-zonwaarts <em>en</em> binnen één aardstraal van de lijn Aarde–Zon) en geeft <b>exact nul</b> SRP in de eclips; en in de propagator <b>verstoort SRP een LEO-baan met een kleine begrensde hoeveelheid die ~lineair meeschaalt met A/m</b>, terwijl een model zonder storingen bit-voor-bit tijdonafhankelijk blijft, zodat de goldens voor tweelichamen/J2/zonaal ongemoeid blijven. De conische umbra/penumbra (gladde ν ∈ [{ "0,1" }]), atmosferische weerstand en externe kruisvalidatie met GMAT/Orekit blijven vervolgwerk.

seg-d3f819c21660 = <b>Epochegestuurde derde lichamen Zon/Maan aangesloten op de tijdvarierende rechterzijde van de propagator (<c1/> / <c2/>).</b> De storing door het derde lichaam is niet langer een op zichzelf staande krachtterm: zij wordt nu door de Cowell-propagator geïntegreerd als een echt <em>tijdvarierende</em> kracht: elke evaluatie van de rechterzijde bemonstert de posities van Zon/Maan uit <c3/> op de <b>voortgeschreden epoche <c4/></b> (met hergebruik van <c5/> voor de omrekening tussen dagen en eeuwen), zodat de storende lichamen tijdens de integratie langs hun banen bewegen in plaats van bij de start te zijn bevroren. Combineerbaar met elk zwaartekrachtmodel (<c6/>). Zelfstandig getoetst: de Zon-term in de rechterzijde is <b>bit-identiek</b> aan <c7/>, geëvalueerd op de efemeridepositie voor dat moment, zowel bij <c8/> als bij <c9/> (wat de koppeling { "86400" } s ↔ { "1" } dag ↔ 1/36525 eeuw exact bewijst), het storende lichaam <b>schuift ~{ "2.6" }·10⁹ m/dag op</b> tussen samples (niet bevroren), de <b>ogenblikkelijke getijdengroottes in LEO</b> halen de leerboekbanden van ~{ "5" }·{ "10" }⁻⁷ m/s² (Zon) en ~{ "1.1" }·{ "10" }⁻⁶ m/s² (Maan, ≈ { "2" }× de Zon), elk lichaam <b>verstoort het etmaallange traject meetbaar en blijft toch begrensd</b>, en dezelfde begintoestand gepropageerd op <b>epochen een kwartjaar uit elkaar geeft een ander traject</b> (de getijdenas draait { "90" }°), terwijl een model waarin geen van beide lichamen is ingeschakeld bit-voor-bit tijdonafhankelijk is, zodat de goldens voor tweelichamen/J2/zonaal ongemoeid blijven. Efemeridenauwkeurigheid van DE-klasse en externe kruisvalidatie met GMAT/Orekit blijven vervolgwerk.

seg-0a517f6c4b1b = <b>Maanefemeride met lage precisie (<c1/>), die het paar derde lichamen Zon/Maan completeert.</b> Voegt de lunaire reeks met lage precisie van Montenbruck & Gill toe (<c2/>) naast het Zonmodel, zodat de lichaamsonafhankelijke <c3/> nu door beide hemellichamen kan worden aangestuurd <b>zonder externe DE/SPK-kernel</b>. Zelfstandig getoetst aan met de hand afgeleide lunaire signaturen: de geocentrische afstand blijft over een maand binnen de echte <b>perigeum-/apogeumomhulling (~{ "356 500" }–{ "406 700" } km)</b> en haar <b>maandgemiddelde herstelt de halve lange as van ~{ "384 400" } km</b>; de <b>ecliptische breedte overschrijdt nooit de baanhelling van ~{ "5.3" }° van de Maan</b> (gecontroleerd door te projecteren op de ecliptische pool in equatoriale coördinaten, waarmee de breedtereeks en de schuinterotatie samen worden getoetst); de <b>richting van de Maan keert na één siderische maand ({ "27.3217" } d) terug tot binnen { "1" }°</b> en haar <b>dagelijkse beweging blijft binnen de fysische band van { "12" }–{ "15" }°/dag</b>; en de lunaire storing door het derde lichaam op een LEO-satelliet heeft de <b>leerboekgrootte van ~{ "1.1" }·{ "10" }⁻⁶ m/s²</b> (≈ tweemaal die van de Zon). Positienauwkeurigheid van DE-klasse, atmosferische weerstand en SRP blijven vervolgwerk.

seg-8b7025e00dd1 = <b>Zwaartekracht van een derde lichaam (Zon) met een ingebouwde efemeride met lage precisie (<c1/>, <c2/>).</b> Voegt de storing door een derde lichaam toe aan het krachtenmodel: <c3/> (directe aantrekking min de indirecte term die het geocentrische stelsel moet aftrekken), waarbij de positie van de Zon wordt geleverd door de analytische reeks met lage precisie van Montenbruck & Gill in de nieuwe module <c4/>, <b>zonder externe DE/SPK-kernel</b> voor een run met lage getrouwheid. Zelfstandig getoetst: de versnelling <b>komt overeen met de exacte gradiënt van haar eigen storingspotentiaal</b> (<c5/>), de storing <b>verdwijnt in het geocentrum</b> en heeft de <b>leerboekgrootte van ~{ "5" }·{ "10" }⁻⁷ m/s² op een LEO-satelliet</b>, en de Zonefemeride haalt met de hand afgeleide J2000-ankers: een <b>perihelium-afstand van ≈ { "1.471" }·10¹¹ m</b>, een <b>declinatie van ≈ −{ "23" }° nabij de decemberzonnewende</b>, een schijnbare beweging van <b>≈ { "1" }°/dag</b> (≈ { "90" }° per kwartjaar) en een afstand die over een heel jaar binnen de omhulling van { "0.983" }–{ "1.017" } AU van de aardbaan blijft. Levert de helft voor het derde lichaam van de stap krachtenmodel in de mijlpaal van de numerieke propagator (de Maan wordt geleverd in een begeleidend item hierboven); positienauwkeurigheid van DE-klasse, atmosferische weerstand en SRP blijven vervolgwerk.

seg-99fd6ae1ea09 = <b>Krachtenmodel met zonale harmonischen J2–J6 (<c1/> / <c2/>).</b> Breidt het krachtenmodel van de Cowell-propagator uit voorbij J2 tot het volledige zonale aardveld tot en met graad { "6" } (de gepubliceerde standaard niet-genormaliseerde EGM-96-<c3/>), aangesloten op de propagator als <c4/>. De versnelling is de <b>exacte analytische gradiënt</b> van de zonale storingspotentiaal <c5/> (Legendre-polynomen door opwaartse recurrentie), op drie onafhankelijke manieren getoetst: zij <b>valt tot machineprecisie terug op de aan de hand van 666 vectoren getoetste <c6/></b> wanneer zij tot <c7/> wordt beperkt; zij <b>komt overeen met de numerieke gradiënt van haar eigen potentiaal</b> over het volledige J2..J6-veld (de gouden-standaardcontrole voor een conservatief veld); en de oneven termen <c8/> tegenover de even termen <c9/>/<c10/> vertonen hun <b>kenmerkende noord–zuid-(anti)symmetrie</b> onder <c11/>, de peervormige asymmetrie. Een gepropageerde J2..J6-baan behoudt de totale energie (kinetisch + centraal + zonale potentiaal) tot ~{ "1e-8" } over een dag en verstoort de baan met alleen J2 met een kleine hoeveelheid ongelijk aan nul. Dit levert stap 2 („J2–J6 zonale harmonischen”) van de mijlpaal van de numerieke propagator; het tesserale EGM-veld van hoge graad, weerstand, SRP, derde lichamen en externe kruisvalidatie met GMAT/Orekit blijven vervolgwerk.

seg-59f0ba5a6269 = <b>Numerieke (Cowell-)baanpropagator (<c1/>).</b> De eerste <b>niet-analytische</b> propagator van Kshana (de rest van de baanstack is analytisch SGP4/SDP4): hij sluit het krachtenmodel tweelichamen + J2 (<c2/>) aan op de adaptieve RK4-driver met stapverdubbeling (<c3/>) als <c4/>, met een schakelaar <c5/>. Getoetst aan <b>analytische waarheid die sterker is dan een numerieke kruistool zou zijn</b>: de ongestoorde baan reproduceert de <b>exacte Kepleroplossing met universele variabelen tot submeter over een LEO-baan van 24 uur</b> (een strengere poort dan het „tegenover een numerieke referentie < { "10" } m” waarin de mijlpaal is verwoord), specifieke energie en impulsmoment blijven behouden tot ~{ "1e-9" } relatief, en de nodale regressie door J2 reproduceert de gesloten-vorm-<c6/> tot de eerste-ordetheorie (binnen { "2" } %, het O(J2²)-restant). Voegt ook <c7/> toe, een Newton-oplosser voor de vergelijking van Kepler die <b><c8/> teruggeeft in plaats van een stilzwijgend onjuist antwoord</b> wanneer hij niet convergeert binnen een begrensd iteratiebudget (het geval <c9/> nabij het perigeum). Eerlijke reikwijdte: het krachtenmodel is alleen tweelichamen + J2; het tesserale EGM-veld van hoge graad ({ "200" }×{ "200" } + lader), weerstand (NRLMSISE-00), SRP, krachten van derde lichamen en een externe kruisvalidatie met GMAT/Orekit blijven vervolgwerk.

seg-d4c7c29f09d1 = <b>Gravimetrische kaartmatching zonder GPS gedurende 60 minuten tot < { "500" } m (<c1/>).</b> Verdiept de alt-PNT-laag tot het validatiedoel <em>Quantum Wayfarer</em> van ESA NAVISP: een voertuig vliegt een spoor van ~{ "700" } km tijdens een volledige GNSS-uitval van één uur, waarbij de inertiale oplossing wegdrijft tot <b>≈ { "70" } km</b>, en een koude-atoomgravimeter plus een <b>hiërarchische grof-naar-fijn</b> deeltjes-/rastermatcher herstelt de constante INS-drift tot <b>≈ { "145" } m</b> (< { "500" } m), een reductie van > { "480" }×. De echte witteruisondergrens van de gravimeter wordt geïnjecteerd als een <b>deterministische, met een seed bepaalde</b> reeks, zodat de matcher nooit ruisvrije waarheid krijgt aangereikt en de run toch exact reproduceerbaar is (bit-identiek geverifieerd, en stabiel tot op enkele meters over ruisrealisaties). Een test van regressieniveau toont dat de verfijning <em>noodzakelijk</em> is: een enkel grof raster loopt vast op ~{ "2" } km, alleen de verfijning in drie stappen doorbreekt de grens van { "500" } m. Nieuw vastgelegd scenario <c2/>. De rij <c3/> blijft eerlijk <b>gedeeltelijk</b> (nog steeds geen meegeleverde EGM2008-kaart), met haar bewijs bijgewerkt naar het resultaat van 60 min < { "500" } m. Eerlijke reikwijdte ongewijzigd: veld in sferische harmonischen van lage graad + synthetische mascons; een Monte Carlo over realisaties van de representatiefout van de kaart is vervolgwerk.

seg-4262a99328bb = <b>Register van overclaims + regressiebewaking (<c1/>, <c2/>).</b> Sluit het spoor van eerlijkheid/terugnemen van claims af: de veertien overclaims die een eerdere audit heeft gecatalogiseerd (<c3/>…<c4/>) zijn nu allemaal GREEN; de sterke claims (<c5/> gekoppelde klok+positie-Kalman, <c6/> jamming J/S→C/N₀→verlies van lock, <c7/> Mach–Zehnder-CAI-fysica, <c8/> ARAIM HPL/VPL) zijn <b>vervangen door geleverde, geteste mogelijkheden</b> en niet door afgezwakte formuleringen, en de overige rijen zijn teruggebracht tot wat de code waarmaakt. Een nieuwe CI-test scant de live publieke oppervlakken (<c9/>, <c10/>, <c11/>, <c12/>) en faalt als een ingetrokken kale overclaim-formulering zonder voorbehoud terugkeert, zodat een GREEN-rij niet stilzwijgend kan terugvallen. De FoM „integriteit” per run blijft eerlijk gelabeld als <em>zelfconsistentie van het filter</em> (niet luchtvaartintegriteit); de echte ARAIM HPL/VPL wordt apart getoond, zodat de twee nooit door elkaar worden gehaald.

seg-27da62a7ff63 = <b>Navigatie met zwaartekrachtkaartmatching (alt-PNT zonder GPS).</b> Nieuw <c1/> voegt de alt-PNT-mogelijkheidslaag toe waar de studies naar zwaartekrachtkaartmatching van ESA NAVISP, <em>Quantum Wayfarer</em> / QT-CCI, om vragen: een <b>meetmodel voor een koude-atoomgravimeter</b> waarvan de witteruisondergrens is afgeleid uit de ASD van de CAI-versnellingsmeter (<c2/>); een volledig genormaliseerd <b>zwaartekrachtanomalieveld in sferische harmonischen</b> van lage graad (getoetst aan de gesloten-vorm-Legendrefuncties <c3/>, <c4/>, <c5/> en een met de hand afgeleide anomalie met één term van { "1.897" } mGal) plus synthetische <b>mascons</b> voor de lokale kenmerken van hoge graad; en een <b>deeltjesfilter voor zwaartekrachtkaartmatching</b> (samengesteld uit <c6/> + <c7/>) dat een spoor zonder GPS herstelt uit de reeks anomalieën waar het doorheen vliegt. Een vastgelegde NAVISP-benchmark (<c8/>) verkleint een vrije inertiale drift van ~{ "73" } km tot enkele km. Eerlijke reikwijdte: Kshana bundelt <b>niet</b> de volledige EGM2008-coëfficiëntenset van { "2190" }°; het veld is van lage graad + mascons, geen echte kaart met hoge resolutie; de EGM/EIGEN-lader, een magnetische kaart, terreingebonden SLAM en aansluiting op de scenario-engine <c9/> met een SVG-driftgrafiek blijven vervolgwerk. <c10/> „Gravity-map / alt-PNT navigation” → <b>gedeeltelijk</b>.

seg-d028a2db7837 = <b>Manoeuvremodellering en brugkop voor baanontwerp.</b> Nieuw <c1/> voegt de eerste laag voor baanontwerp boven SGP4 toe: impulsieve ΔV-knopen die een snelheidsdiscontinuïteit toepassen en een covariantie van { "6" }×{ "6" } doorgeven (deterministische brandperiode ⇒ identiteit als toestandsovergang; de covariantie van de uitvoeringsfout roteert van het brandstelsel, ECI of LVLH, naar het snelheidsblok), een integratie van eindige brandperioden (constante stuwkracht over een brandboog met massa als toestand) waarvan de bereikte ΔV wordt gecontroleerd aan de gesloten-vorm-<b>Tsiolkovski</b>-raketvergelijking tot beter dan { "0.01" } %, een <b>Lambert</b>-oplosser van <b>Izzo-2015</b> voor één omloop (<c2/>, <c3/>, vliegtijd ⇒ <c4/>, <c5/>), een exacte <b>Kepler-propagator</b> met universele variabelen (tweelichamenwaarheid) en een <b>porkchop</b>-sweep die een raster van lanceerepoche × aankomstepoche afbeeldt op vertrek-C3 en aankomst-V∞, uitgegeven als 2-D-JSON-array voor contourweergave in de browser. De validatie is zelfstandig en sterker dan een uitlezing uit een tutorial: elke Lambert-uitvoer wordt rondgevoerd door de Kepler-propagator (hij moet weer op <c6/> landen), en het porkchop-minimum wordt gecontroleerd aan de analytische ondergrens van de Hohmann-overgangs-C3 voor twee coplanaire cirkelbanen. Kshana positioneert dit als de prestatiesimulatielaag boven GMAT/Orekit, niet als vervanging ervan (takken met meerdere omlopen en een echte planeteefemeride blijven buiten bereik). Tien tests.

seg-cbdd0e56d89f = <b>Volledig strak gekoppeld GNSS/INS-UKF met 17 toestanden en kwantum-CAI-dead-reckoning.</b> Nieuw <c1/> bevat de complete inertiale navigatietoestand die een strak gekoppeld filter schat, <c2/> ({ "17" } toestanden), gepropageerd door de strapdown-mechanisatie die wordt aangestuurd door de gemeten specifieke kracht en hoeksnelheid, met de kleinehoek-rotatie <c3/> van lichaam naar inertiaal, zodat de houdingsfout doorwerkt in de horizontale versnelling (de standaard INS-kantelkoppeling). Tijdens een GNSS-uitval drijft het alleen op de IMU; de procesruis van de snelheidsrandomwalk is de afgeleide <c4/> van de koude-atoominterferometer-versnellingsmeter (<c5/>), zodat de dead-reckoning-drift die is welke door de kwantumsensor wordt begrensd: een uitval van 120 seconden blijft beperkt tot enkele honderden meters, tegenover de kilometers die een vrije INS van navigatieklasse zou bereiken. De update met pseudo-afstand/afstandssnelheid loopt via het gedeelde unscented filter (met α = { "1" } voor goed geconditioneerde gewichten bij deze toestandsgrootte). Vijf tests: identiteit van het meetmodel, integratie met constante snelheid met een perfecte IMU, GNSS-ondersteuning, schatting van de accelerometerbias en de door CAI begrensde benchmark van 120-s uitval.

seg-087521bb32b7 = <b>Eerlijke formulering van de kwantumpositionering.</b> De kopaanduiding is nu overal een <b>„PNT-resilience simulator with quantum-sensor performance models”</b>, in de tagline van de README, de citatieregel, <c1/> (titel + samenvatting) en de bannergrafiek, ter vervanging van de losser marketingformulering „hybrid quantum/classical PNT simulator”. In het onderdeel <em>What it is / is not</em> van de README staat nu een expliciete reikwijdteverklaring <b>„It is not (yet)”</b> (geen atoominterferometriefysica-engine vanuit eerste beginselen, geen GNSS-ontvanger/PVT-oplosser, geen hulpmiddel voor missieontwerp), en een nieuwe <c2/> op het hoogste niveau maakt van de <b>kwantumfysicalaag een P2-item</b> (Mach–Zehnder-CAI-fase, projectieruis, trillingstensor), zodat lezers weten dat de fysica vanuit eerste beginselen gepland en op komst is, niet verlaten. Geen wijziging in gedrag of API.

seg-f8fa36190ec7 = Afwegingsstudie voor constellatieontwerp: Walker-ontwerpsweep met een Pareto-front, JSON met hertijd en een validatie van de Walker-formule tot onder een kilometer.

seg-31518e92d8cf = <c1/> krijgt <c2/>, dat een raster <c3/> doorloopt (bijvoorbeeld een afweging van { "3" }×{ "3" }) bij een vaste inclinatie en per ontwerp de dekkingsfractie, de slechtste PDOP en de maximale/gemiddelde hertijdkloof tabelleert; <c4/> markeert de niet-gedomineerde ontwerpen (minder satellieten, meer dekking, lagere PDOP, kortere hertijd), en <c5/> serialiseert de cellen en het Pareto-front, inclusief de velden voor hertijd, als JSON. Nieuwe validatie legt de generator vast op de Walker-formule <c6/>: satellieten op dezelfde positie in aangrenzende vlakken blijken door een exacte rotatie <c7/> op elkaar af te beelden tot <b>onder { "1" } km over een volledige { "24" } uur</b> SGP4-propagatie (de korteperiodieke J2-ademing is gemeenschappelijk en valt weg), en de posities binnen het vlak blijken gemiddeld op een afstand van <c8/> te liggen. Bouwt voort op de vastgelegde echte momentopname van Celestrak <c9/> van 2021-07-28 (<c10/>, gebruikt door de scenariodekkings- en SP3-roundtriptests).

seg-71d257587c28 = <b>Geavanceerde tijd- en frequentieoverdracht: TWSTFT, GNSS common-view, PPP, optisch, IEEE-1139-machtswetfit en een klokensemble.</b> Nieuw <c1/> bouwt de operationele overdrachtsmethoden op de meegeleverde gesloten vormen voor Sagnac/common-view en de Allan-stabiliteitshulpmiddelen. <c2/> geeft de Sagnac-correctie voor Two-Way Satellite Time and Frequency Transfer als de lussom van drie sprongen, exact gelijk aan de BIPM-gesloten vorm <c3/> (kruiselings gecontroleerd door de onafhankelijke <c4/>); <c5/> geeft een reeks <c6/> van één dag uit en haar TDEV. <c7/> neemt enkelvoudige verschillen van twee synthetische grondstations, zodat de satellietklok wegvalt. <c8/> + <c9/> zijn de ionosfeervrije PPP-combinatie en de oplossing van de ontvangerklok tegen een (synthetische) waarheid van SP3-klasse, waarbij de eerste-orde-ionosfeer exact wegvalt. <c10/>, <c11/> en het <c12/>-model met gemiddelde één modelleren de door turbulentie veroorzaakte scintillatie van een optische vrije-ruimteverbinding. <c13/> is een volledige IEEE-1139-kleinstekwadratenfit van <c14/> met vijf coëfficiënten aan de Allan-variantiecurve (alle vijf canonieke ruisprocessen tegelijk), waarbij per τ-decade het dominante proces wordt gerapporteerd. <c15/> vormt een met de inverse variantie gewogen papieren tijdschaal waarvan de Allan-deviatie strikt onder die van de beste bijdragende klok ligt. { "31" } unittests; de validatiedoelen zijn gesloten vormen en synthetische waarheid; een echte inlezing van BIPM Circular-T / IGS SP3 volgt nog.

seg-c3ab93e7324f = Ionosfeerkaarten IONEX: bestandsparser, interpolatie in de tijd en afbeelding van de schuinheidsfactor op een schuin pad.

seg-7b94a515ce2b = <c1/> krijgt <c2/>, dat het IONEX-bestandsformaat leest (rasterdefinitie in de kop + blokken <c3/>) tot een reeks <c4/>s, waarbij de noord-naar-zuid-volgorde van de breedtegraden in het bestand wordt genormaliseerd tot een <c5/> met positieve stap en waarden worden geschaald met <c6/>. <c7/> mengt twee opeenvolgende kaarten tot een opgevraagde epoche, en <c8/> / <c9/> beelden de verticale TEC af op een schuine straal via de enkellaags dunne-schilfactor <c10/> (<c11/>). Samen met het meegeleverde rastermodel maken deze van een gemeten wereldwijde IGS-ionosfeerkaart een bruikbare schuine vertraging.

seg-2ed90763cf11 = Constellatieontwerp: dimensionering van streets-of-coverage en vergelijking van meerdere constellaties.

seg-326e8957bb10 = <c1/> krijgt <c2/>, een geïdealiseerde oplosser voor het minimale aantal satellieten bij streets-of-coverage: uit de meegeleverde halve dekkingshoek <c3/> en halve straatbreedte <c4/> dimensioneert hij de bijna-polaire constellatie voor continue enkelvoudige wereldwijde dekking als <c5/> vlakken (bijvoorbeeld een vlak met 4 satellieten op GPS-hoogte vraagt { "2" } vlakken, { "8" } satellieten), en meldt <c6/> wanneer de satellieten te schaars zijn om een aaneengesloten straat te vormen. <c7/> is het hulpmiddel voor vergelijking van meerdere constellaties: het beoordeelt elk benoemd Walker-ontwerp op hetzelfde station en venster via <c8/> en geeft hun dekking / PDOP / omvang naast elkaar terug. Eerlijke reikwijdte: de naadexacte Rider-correctie op de grens van tegengesteld roterende vlakken en een 3-D-dekkingsglobe blijven vervolgwerk.

seg-90f5ec9ff4ae = Spoofdetectie in meerdere lagen: pariteitsdetector voor RAIM-consistentie + laagfusie.

seg-a0e4878bea45 = <c1/> krijgt de derde en laatste detectielaag en de fusiestap: <c2/> past de positie-/klokoplossing met kleinste kwadraten aan een redundante set pseudo-afstanden aan en toetst de resterende gewogen kwadratensom van de residuen aan haar drempel <c3/> van χ², waarbij een met bias behepte <em>deelverzameling</em> van satellieten wordt gemarkeerd en een <em>gemeenschappelijke</em> bias (opgenomen door de ontvangerklok) terecht RAIM-onzichtbaar blijft, zonder die te verbergen. <c4/> combineert de lagen voor pariteit, AGC en SQM tot één gewogen besluit dat vastlegt welke lagen hebben aangeslagen. Een Monte Carlo karakteriseert de detector: empirische <b>P_fa ≈ { "0.068" }</b> tegenover een ontwerppunt van { "0.05" }, met <b>gemiste detectie die daalt van { "0.885" } bij een spoofbias van 2σ naar { "0.16" } bij 8σ</b>. Eerlijke reikwijdte: kruisvalidatie tegen specifieke gepubliceerde spoofingtestvectoren (Spirent / ION GNSS+) vereist die externe datasets en blijft vervolgwerk.

seg-2413b3d10f5b = <b>Validatie-ensemble gekoppelde tegenover ontkoppelde Kalman.</b> Een Monte Carlo met 100 trials in <c1/> kwantificeert de waarde van het meedragen van de kruiscovariantie positie↔klok: een getrouwe inline ontkoppelde basislijn (bit-voor-bit getoetst aan de meegeleverde <c2/>) verwerkt dezelfde gegevens met de kruisblokken op nul, en na bijna-gedegenereerde pseudo-afstanden plus een klokalleen-fix herstelt het gekoppelde filter de positie tot <b>{ "2.97" } m RMS tegenover { "48.8" } m voor het ontkoppelde filter, en wint in { "97" } van { "100" } trials</b>: de klokfix scherpt de positie alleen aan via de correlatie die het ontkoppelde pakket weggooit. Dit completeert de validatiesuite voor Kalman-juistheid (Joseph-vorm, PSD-veiligheid, NEES/NIS-consistentie en nu het ensemble voor gekoppelde filters).

seg-804f35695553 = <b>Pijplijn voor baanbepaling (batch + sequentieel).</b> Een nieuwe <c1/> herstelt de baantoestand <c2/> van een satelliet uit afstandsmetingen van grondstations, en combineert drie meegeleverde onderdelen: het krachtenmodel tweelichamen + J2 (<c3/>) en de RK4-integrator (<c4/>) propageren een kandidaattoestand over de boog, een afstandsmeetmodel voorspelt elke stationsafstand, en de Gauss–Newton-batchcorrector (<c5/>) drijft de kandidaat naar de best passende toestand (<c6/>). Dezelfde dynamica en hetzelfde afstandsmodel sturen ook een <b>sequentiële</b> recursieve bepaling aan op het meegeleverde unscented filter (<c7/>). Vier tests valideren dit: afstandsvoorspelling over de boog; <b>batchherstel tot submeter / mm·s⁻¹ uit ruisvrije afstanden</b>; batchherstel tot <b>~{ "2" } m met een post-fit-residu op de ruisondergrens van { "5" } m</b> (de signatuur van een consistente kleinstekwadratenfit); en sequentieel herstel tot binnen tientallen meters. Eerlijke reikwijdte: metingen van afstandssnelheid/Doppler en hoeken, een analytische J2-toestandsovergangsmatrix en zichtbaarheidsmaskering van stations blijven vervolgwerk.

seg-0a81039e510c = <b>Strak gekoppelde GNSS/INS-UKF-navigator.</b> Een nieuwe <c1/> sluit de meegeleverde unscented Kalman-kern (<c2/>) aan op een werkende strak gekoppelde navigator over de <c3/> met acht toestanden (ECEF-positie/snelheid plus klokbias en klokdrift in afstandseenheden). Hij neemt de <b>ruwe satellietmetingen</b> op, <c4/> (<c5/>) en <c6/>/Doppler (<c7/>), in plaats van een vooraf gevormde positiebepaling, zodat <c8/> (met <c9/>/<c10/>/ <c11/>) <b>met minder dan vier satellieten</b> blijft corrigeren en GNSS-uitval overbrugt op zijn gepropageerde dynamica. Vijf tests valideren dit end-to-end, inclusief de acceptatiescenario's van de mijlpaal: de geometrie van pseudo-afstand/Doppler tegenover handwaarden; ruisvrije convergentie tot <b>submeter</b> met vijf satellieten; een geval met <b>drie satellieten</b> dat convergeert van ~{ "212" } m naar ~{ "13" } m, waar een momentopname-PVT niet eens kan worden gevormd; een <b>uitval van 120 seconden</b> bij constante snelheid binnen { "50" } m; en, de hoofdacceptatie, een <b>bochtige LEO-pas van 30 minuten</b> (echte baan met tweelichamen + J2) met een <b>GNSS-uitval van 120 seconden</b>, gehouden op <b>{ "0.77" } m RMS over de pas</b> en <b>{ "2.9" } m in het slechtste geval tijdens de uitval</b>. Die orbitale overbrugging combineert het meegeleverde zwaartekrachtmodel (<c12/>) en de RK4-integrator (<c13/>) tot het procesmodel van de UKF (<c14/>), zodat het filter de kromming van de baan volgt, wat een overbrugging met constante snelheid niet kan (de kromming alleen is ~{ "58" } km over { "120" } s in LEO). Eerlijke reikwijdte: de orbitale overbrugging gebruikt het krachtenmodel tweelichamen + J2 in plaats van ruwe specifieke kracht van een IMU (voor een niet-aangedreven orbitaal platform vallen die samen); het inbrengen van een strapdown-IMU-foutentoestand en ionosfeer-/troposfeercorrecties in de lus blijven vervolgwerk.

seg-792f25a4a1da = <b>Meetmodel voor mapmatching (navigatie met terrein- of zwaartekrachtreferentie).</b> Een nieuwe <c1/> levert het meetmodel dat het meegeleverde deeltjesfilter met sequentiële importance-resampling (<c2/>) verandert in een werkende navigator zonder GPS: <c3/> (een Gaussiaanse waarschijnlijkheid voor veldmatch) en <c4/>, dat elk georeferentieveld bemonstert, terreinhoogte (TRN) of een zwaartekrachtanomalie, op de positie van een deeltje en het weegt naar de overeenstemming met de gemeten waarde van het voertuig. Het veld is elke sampler <c5/>, zodat het te combineren is met het bilineaire raster in <c6/> of een closure. Twee tests verankeren het: de waarschijnlijkheid piekt (={ "1" }) bij een perfecte match en daalt tot <c7/> bij één sigma, en een deeltjesfilter over een kenmerkend synthetisch terreinstuk herstelt de ware positie tot binnen { "0.1" }. Eerlijke reikwijdte: de echte referentiekaarten (SRTM-hoogte, EGM/EIGEN-zwaartekrachtanomalie) en hun laders blijven vervolgwerk.

seg-9240e95a5058 = <b>Cislunaire PNT-integriteit (lunaire ARAIM).</b> Een nieuwe <c1/> past de MHSS-ARAIM-engine voor de Aarde toe op een navigatiedienst op de Maan in LunaNet-stijl met de lunaire parameters (<c2/> tegenover { "0.6" } m voor GPS, <c3/>): lunaire constanten, een selenocentrische Oost/Noord/Omhoog-basis en hulpfunctie voor hemelgeometrie, en <c4/> (HPL/VPL). Drie tests verankeren het: de orthonormale selenocentrische basis, de geometrie van de schuine afstand en de exacte lineaire schaling van het beschermingsniveau met <c5/> (lunair { "30" } m geeft een { "50" }× groter beschermingsniveau dan dezelfde geometrie bij de GPS-waarde van { "0.6" } m: de kwantitatieve reden waarom PNT-integriteit op de Maan moeilijk is). Eerlijke reikwijdte: de nauwkeurige LANS NRHO-efemeride, het foutbudget van het signaal in de ruimte en de MCI↔MCMF-stelselreductie blijven vervolgwerk.

seg-4a43e2ff83d7 = <b>Tweedelige Juliaanse datums (hoge precisie).</b> Een nieuwe <c1/> voegt <c2/> toe, een Juliaanse datum gesplitst in een geheel <c3/> en een fractioneel <c4/> in <c5/> (de conventie van SOFA/hifitime), met <c6/>/<c7/>/<c8/>/<c9/>/<c10/>. Verschillen tussen nabije epochen blijven exact tot de ondergrens van <c11/>, waar een JD met een enkele <c12/> nabij J2000 ~{ "50" } µs verliest. Vier tests verankeren het: de roundtrip, normalisatie van de fractie, exact herstel van microseconden (met het falen van de enkele <c13/> ernaast gedemonstreerd) en additieve/omkeerbare rekenkunde met seconden.

seg-8eef92a85711 = <b>CCSDS OMM-schrijver (Orbit Mean-Elements Message).</b> Een nieuwe <c1/> vult de efemeridenschrijver <c2/> aan met het bericht met gemiddelde elementen: <c3/> beeldt de gemiddelde elementen van SGP4/TLE af op de OMM-eenheden (gemiddelde beweging in omw/dag, hoeken in graden, plus <c4/>), en <c5/> serialiseert de KVN-vorm van de CCSDS 502.0-B-2-standaard, zodat een Kshana-baan door elk OMM-bewust hulpmiddel kan worden gebruikt in plaats van als een eigen TLE. Twee tests verankeren de eenhedenomzetting van TLE naar OMM (≈ { "15.5" } omw/dag, { "51.6" }° inclinatie, enzovoort) en de aanwezigheid van de vereiste KVN-sleutelwoorden. Eerlijke reikwijdte: de KVN-vorm en de TLE-afbeelding worden hier geleverd; de XML-weergave (<c6/>) en een roundtrip met een referentieparser blijven vervolgwerk.

seg-ca2b730b5cc3 = <b>Deeltjesfilter met sequentiële importance-resampling.</b> Een nieuwe <c1/> voegt de niet-lineaire, niet-Gaussiaanse schatter toe achter kaartondersteunde navigatie zonder GPS (terreingebonden matching of matching van zwaartekrachtkaarten): <c2/> (deeltjes propageren door de dynamica + Gaussiaanse procesruis), <c3/> (herweging met een waarschijnlijkheid van de meting per deeltje), systematische <c4/>, de degeneratiemonitor <c5/> en de gewogen-gemiddeldeschatting. Zes tests verankeren de deterministische kern exact: ESS dat { "1" }…N bestrijkt, systematische resampling die indices kiest naar rato van het gewicht, de convexe combinatie van het gewogen gemiddelde, een Gaussiaanse waarschijnlijkheid die de schatting naar de meting trekt, het gedrag van resamplen naar uniform en determinisme van predict met seed. Eerlijke reikwijdte: de engine wordt hier geleverd; de referentiekaarten (SRTM-hoogte, EGM-zwaartekrachtanomalie) en het kaartmeetmodel blijven vervolgwerk (de sampler met raster+bilineair in <c6/> zou een zwaartekracht- of terreinkaart even goed bedienen).

seg-564ad319685e = <b>TEC-ionosfeerkaarten in IONEX-stijl.</b> Een nieuwe <c1/> voegt het gemeten-ionosfeeralternatief voor het uitgezonden Klobuchar-model toe: een <c2/> (een regelmatig breedte-/lengteraster van verticale TEC, een wereldwijde IGS-ionosfeerkaart) met bilineaire interpolatie in een doorborings-punt (<c3/>, buiten het raster begrensd) en de eerste-ordevertraging <c4/> (<c5/>, <c6/>). Vier tests verankeren het: <c7/> op L1 met de schaling <c8/>, knoopexacte interpolatie, bilineaire middelpunten die het gemiddelde van de hoeken geven en aan de rand begrensde opvragingen buiten het raster. Eerlijke reikwijdte: het raster en de interpolatie worden hier geleverd; het inlezen van het IONEX-bestandsformaat, interpolatie in de tijd tussen kaarten en de afbeeldingsfunctie voor het schuine pad blijven vervolgwerk.

seg-26c7b53cbc8c = <b>Geometrische correcties voor tijdoverdracht (Sagnac + GNSS common-view).</b> Een nieuwe <c1/> voegt de twee deterministische effecten toe waarmee een echte klokvergelijking rekening moet houden, als aanvulling op het stochastische tweewegmodel in <c2/>: <c3/> (<c4/>, de vertraging door de roterende Aarde: tientallen ns voor continentale basislijnen) en <c5/>, het enkelvoudige GNSS-common-view-verschil dat de fout van de satellietklok exact opheft en de offset tussen de stations herstelt. Drie tests verankeren ze op exacte referenties: de ≈ { "33" } ns Sagnac van een equatoriale kwartslag, antisymmetrie en de nulgevallen radiaal/polair, en de exacte opheffing van de satellietklok. Eerlijke reikwijdte: een volledig TWSTFT-budget voor transponder/hardwarevertraging en een ionosfeervrije PPP-oplossing voor tijdoverdracht blijven vervolgwerk.

seg-098e7ea0ee13 = <b>Krachtenmodel voor banen (tweelichamen + J2).</b> Een nieuwe <c1/> voegt het versnellingsmodel toe dat een numerieke propagator integreert: <c2/> (<c3/>), de storing door afplatting <c4/> (de ECI-gesloten vorm) en <c5/> die ze optelt, te combineren met <c6/> als <c7/>. Het biedt ook de analytische J2-<b>seculiere snelheden</b> (<c8/>): de nodale regressie <c9/>, de apsidale rotatie <c10/> en de drift van de gemiddelde anomalie <c11/>. Zes tests verankeren de fysica op exacte referenties: <c12/> voor de tweelichamenterm, de gesloten vorm van J2 op de evenaar (~{ "10" }⁻³ van de grootte van de tweelichamenterm), de <b>kritieke inclinatie</b> ({ "63.4349" }°) die het perigeum bevriest (<c13/>), de nodale regressie van het ISS (<c14/>) en de oostwaartse drift van een retrograde zonsynchrone baan. Eerlijke reikwijdte: alleen tweelichamen + J2; J3–J6, weerstand, SRP en derde lichamen blijven vervolgwerk.

seg-d5c03ebc5707 = <b>Deelbare permalinks voor scenario's.</b> Een nieuwe <c1/> voegt een Base64-codec volgens RFC { "4648" } zonder afhankelijkheden toe (het standaardalfabet <c2/> met padding en een URL-veilig alfabet <c3/> zonder padding) en wrappers <c4/> / <c5/>, zodat een TOML uit de playground kan worden gecodeerd in een queryparameter <c6/> en als URL kan worden gedeeld. Beschikbaar gesteld aan de browser als wasm-bindingen <c7/> / <c8/>. Vier tests verankeren het op de canonieke RFC { "4648" }-vectoren (<c9/> → <c10/>, enzovoort), een URL-veilige roundtrip van een scenario (geen <c11/>/<c12/>/<c13/> om te escapen), weigering van ongeldige symbolen en een roundtrip over alle 256 bytes. Eerlijke reikwijdte: de codec en de bindingen worden hier geleverd; de Share-knop in de playground, de Plotly/D3-grafiek met meerdere reeksen en de A/B-vergelijkingsmodus blijven vervolgwerk.

seg-b615fb16d547 = <b>Gauss–Newton-batch-kleinstekwadraten (de differentiële batchcorrector).</b> Een nieuwe <c1/> voegt de schattingskern toe waarop een batch-<em>baanbepaling</em> (of elke parameterfit) rust: <c2/> linealiseert een door de gebruiker aangeleverd model <c3/> met een Jacobiaan van centrale eindige verschillen, vormt en lost de gewogen normaalvergelijkingen <c4/> op (met hergebruik van de geteste matrixinverse) en itereert tot convergentie met gewichten per meting. Vier tests verankeren het: een lineaire lijnfit die de exacte gewogen-kleinstekwadratenoplossing bereikt, een niet-lineaire fit <c5/> die de ware parameters herstelt, een 3-D-afstandsmultilateratie die uit ruisvrije afstanden een bekende positie herstelt (de variant voor baanbepaling) en weigering van onderbepaalde/niet-passende invoer. Eerlijke reikwijdte: dit is de generieke correctorengine; het baanspecifieke meetmodel voor afstand/afstandssnelheid/azimut-elevatie, de analytische J2-toestandsovergangsmatrix en de validatie op gepubliceerde gevallen blijven vervolgwerk.

seg-0ada87934135 = <b>Spoofingmonitors op RF-laag (AGC-vermogen en SQM).</b> Een nieuwe <c1/> voegt twee onafhankelijke spoofdetectoren in de ontvangerfrontend toe, als aanvulling op de klokondersteunde tijdspoofmonitor in <c2/>: een <b>AGC-vermogensmonitor</b> (<c3/> incoherente vermogenssom + <c4/>) die het overtollige ontvangen vermogen markeert dat een spoofzender toevoegt boven een instelbare dB-marge, en een <b>signaalkwaliteitsmonitor</b> (<c5/> driehoekige code-autocorrelatie + <c6/>) die de Early-minus-Late-correlatoronbalans markeert die multipath/meaconing/replay veroorzaakt. Vier tests verankeren de exacte gesloten vormen ({ "3.01" } dB voor een verdubbeling van het vermogen, het aggregaat <c7/>, de driehoekige <c8/> en de alarmdrempel van { "10" } % voor Early/Late). Eerlijke reikwijdte: de volledige RAIM-consistentie-pariteitsdetector voor spoofing, de fusie van de monitoruitvoer in meerdere lagen en validatie tegen gepubliceerde spoofingvectoren van Spirent/ION GNSS+ blijven vervolgwerk.

seg-b1ff62d88cd2 = <b>Adaptieve numerieke ODE-integrator.</b> Een nieuwe <c1/> voegt het eerste onderdeel van een <em>numerieke</em> propagator toe (de baanpropagatie van Kshana is verder analytisch SGP4/SDP4): een generieke Runge–Kutta-stap van de vierde orde (<c2/>) over elk eerste-ordesysteem <c3/>, en een adaptieve driver (<c4/>) die de lokale fout beheerst door <b>stapverdubbeling</b> (Richardson-extrapolatie) met de standaardstapregelaar <c5/> en de logica voor accepteren/verwerpen. Zes tests verankeren het op exacte oplossingen: de exponentiële <c6/> tot <c7/>, de foutreductie van ~{ "16" }× per gehalveerde stap die convergentie van de vierde orde bewijst, behoud van energie/terugkeer van de harmonische oscillator over een volledige periode, en de adaptieve driver die met variabele stappen een strakke tolerantie haalt. Eerlijke reikwijdte: dit is de integratorkern en haar foutbeheersing; de ingebedde tableaus Dormand–Prince RK5({ "4" })/RKF7({ "8" }) en het hiërarchische krachtenmodel voor banen (tweelichamen + J2–J6 + weerstand + SRP + derde lichamen) die er een <c8/> van maken, blijven vervolgwerk.

seg-ca53c62839d8 = <b>Unscented (sigmapunt-)Kalmanfilter.</b> Een nieuwe <c1/> voegt het geschaalde unscented Kalmanfilter toe (Julier & Uhlmann; Wan & van der Merwe) als algemene schatter met <c2/> toestanden over door de gebruiker aangeleverde proces- en meetfuncties: de sigmapuntschatter die een strak gekoppelde GNSS/INS-navigator gebruikt wanneer het model voor pseudo-afstand/Doppler sterk niet-lineair is en de Jacobiaan van een EKF verslechtert. Het bevat de ondersteunende dichte lineaire algebra (Choleskyfactor voor de spreiding van de sigmapunten, Gauss–Jordan-inverse voor de innovatiecovariantie) en een Joseph-vrije update <c3/>. Zes tests leggen het vast, waarvan de belangrijkste gebruikmaken van de exacte eigenschap dat de unscented transformatie voor een <em>lineair</em> model het Kalmanfilter tot numerieke precisie reproduceert (voorspelling, update en een volledige cyclus van voorspelling + update, allemaal vergeleken met een met de hand gedraaid lineair KF, plus een analytische Bayesiaanse posteriorcontrole in 1-D en de identiteiten van Cholesky/inverse). Eerlijke reikwijdte: dit is de schattingsengine; de strak gekoppelde GNSS/INS-navigator met 17 toestanden, het meetmodel voor pseudo-afstand/Doppler en het validatiescenario voor uitval blijven vervolgwerk.

seg-da92d32b5715 = <b>Beschermingsniveaus voor ARAIM met twee constellaties.</b> Een nieuwe <c1/> breidt de Advanced RAIM voor één storing (<c2/>) uit met de <b>storingsmodus voor een hele constellatie</b> van EU ARAIM / DO-316: naast de hypothesen zonder storing en per satelliet draagt elke constellatie (per satelliet gelabeld) één hypothese bij die al haar satellieten tegelijk verwijdert, met prior <c3/> (een nieuwe <c4/>). Elke hypothese voegt een term toe aan dezelfde MHSS-integriteitssom, zodat VPL/HPL de kleinste grenzen zijn waarvan de totale <c5/> het budget haalt over storingsvrij + enkele SV + storingen per constellatie (de Bonferroni-verdeling van valse alarmen loopt over alle <c6/> hypothesen). Met <c7/> is het resultaat bit-voor-bit <c8/>; een gebruiker met één constellatie krijgt <c9/> terug bij een storing van zijn eigen constellatie (die kan niet worden uitgesloten), en dat is precies waarom dekking met twee constellaties ertoe doet. Vier tests dekken de equivalentie, de verruiming van het beschermingsniveau, de niet-beschikbaarheid voor één constellatie en de invoervalidatie, met hergebruik van de bestaande machinerie voor deeloplossingen met oplossingsscheiding.

seg-d06c5f88282b = <b>IAU { "2006" }-precessie (Fukushima–Williams-hoeken en bias-precessiematrix).</b> Een nieuwe <c1/> implementeert de IAU { "2006" }-precessie (P03; Capitaine, Wallace & Chapront { "2003" }): de vier Fukushima–Williams-hoeken <c2/> als polynomen in Juliaanse eeuwen van TT (<c3/>), en de rotatiematrix voor bias-precessie van GCRS naar gemiddeld-van-de-datum, daaruit opgebouwd via de SOFA-constructie <c4/> (<c5/>, met hulpfuncties <c6/> / <c7/>). Dit is het eerste onderdeel voor een inertiaalstelsel bovenop de bestaande op GMST gebaseerde reductie <c8/>. Acht tests valideren aan gesloten-vormankers: de gemiddelde schuinte van de ecliptica op J2000 <c9/>, de gepubliceerde constante termen van de hoeken, de accumulatie van de algemene precessie <c10/> over een eeuw, orthonormaliteit van de matrix en <c11/>, de bijna-identiteitswaarde (alleen stelselbias) op J2000 en de netto rotatiehoek van <c12/>/eeuw. Eerlijke reikwijdte (<c13/>): alleen precessie; de IAU 2000A-nutatie met 678 termen, de volledige keten TEME→GCRS en een numerieke SOFA/ANISE-kruiscontrole van µas/<{ "10" } m blijven vervolgwerk.

seg-14c0a863eef1 = Fysica van de koude-atoominterferometer (CAI) als versnellingsmeter vanuit eerste beginselen.

seg-408fc6feb284 = <c1/> modelleert een Mach–Zehnder-atoominterferometer met drie pulsen vanuit eerste beginselen in plaats van uit een datasheet: effectieve golfvector <c2/>, interferometerfase <c3/>, kwantumprojectieruis (shotruis) <c4/>, gevoeligheid voor versnelling per shot, contrastverval <c5/> en, waar het om gaat, <c6/>, dat de witte versnellings-PSD die de klassieke <c7/> al verwerkt uit het aantal atomen, de interrogatietijd en het contrast <b>afleidt</b>. Het model omvat nu ook <b>trillingskoppeling</b>, de dominante term in echte apparaten: de overdrachtsfunctie van versnelling naar fase van de interferometer <c8/> (<c9/>), de fasevariantie bij witte PSD <c10/> (<c11/>, met een numerieke bandintegraal als kruiscontrole <c12/>), de rang-1-<c13/> langs de bundel, en <c14/> / <c15/> (die laatste valt terug op de van <c16/> onafhankelijke ondergrens <c17/>). Elf tests controleren de fysica met de hand (Rb-87 <c18/>, <c19/>, <c20/>/shot ondergrens van shotruis tegenover een trillingsondergrens van ≈ { "5.9" } µg, de schalingswetten <c21/>, <c22/> en <c23/>). Eerlijke reikwijdte in <c24/>: dit omvat de projectieruisondergrens en het door trillingen begrensde regime daarboven; laserfaseruis, Coriolis- en lichtverschuivingssystematiek en de validatiescenario's PHARAO/CARIOQA blijven vervolgwerk.

seg-ed668459d019 = <b>Kwantum-CAI-versnellingsmeter aangesloten op het inertiale scenario.</b> Een versnellingsmeter in een inertiaal dead-reckoning-scenario wordt nu opgelost tot een nieuwe <c1/>: <c2/> (de bestaande sensor met datasheetcoëfficiënten) of <c3/> wanneer hij een optioneel blok <c4/> draagt (<c5/>: golflengte, pulsscheiding, aantal atomen, contrast, cyclustijd en een optionele <c6/> van het platform). De PSD van de snelheidsrandomwalk <c8/> van een sensor <c7/> wordt uit de fysica van de interferometer <b>afgeleid</b>, de ondergrens van shotruis plus, wanneer een trillings-PSD is opgegeven, de door trillingen begrensde bijdrage in kwadratuur, in plaats van uit een aangeleverde coëfficiënt, en de herkomst van de run legt vast dat de ruis uit de fysica is afgeleid. Het veld <c9/> is <c10/>, zodat bestaande scenario's het weglaten en byte-identiek serialiseren (de scenariohash is ongewijzigd). Vijf tests dekken de afleiding, de kwadratuursom van trillingen, de keuze tussen <c11/>/<c12/>, hash-stabiele serialisatie en een end-to-end run met CAI.

seg-c3978a122010 = Optimalisatie van constellatieontwerp en geometrie van streets-of-coverage.

seg-aae519e71c00 = <c1/> krijgt <c2/>, een gradiëntvrije rasteroptimalisator die de ontwerpruimte <c3/> doorzoekt en het beste Walker-ontwerp teruggeeft onder een gekozen <c4/> (<c5/>, <c6/> of <c7/>) over de al getoetste PDOP-sweep (een test bevestigt dat hij de winnaar van de brute-forcemethode teruggeeft). Daarnaast de analytische gesloten vormen voor <b>streets-of-coverage</b> <c8/> (<c9/>) en <c10/> (<c11/>, Rider/Beste), met de hand gecontroleerd aan leerboekgeometrie en detectie van de onderbezettingskloof. De volledige Rider-oplosser voor het minimale aantal satellieten bij wereldwijde dekking, een 3-D-playgroundglobe en een kruiscontrole van DOP met een extern hulpmiddel blijven vervolgwerk.

seg-7b8468636dea = <b>Export van de precieze SP3-efemeride vanuit de CLI.</b> Een gepropageerd baan-/constellatiescenario kan nu naar een SP3-c-bestand worden geschreven: <c1/>, of <c2/> in het scenario schrijft automatisch <c3/> (<c4/> / <c5/>, <c6/>, optioneel <c7/>). Een roundtriptest (<c8/>) propageert de echte momentopname van Celestrak <c9/>, exporteert die, leest haar opnieuw in en bevestigt dat de teruggewonnen ECEF-posities over { "24" } uur tot <b>< { "0.5" } m</b> overeenkomen met de SGP4-waarheid (ruim binnen de tolerantie van { "10" } m op TLE-niveau). De README beschrijft de interoperabiliteitsrol (RINEX → RTKLIB/gLAB, SP3 → Ginan/producten met precieze banen).

seg-56c729ba110f = Gekoppeld Kalmanfilter voor klok+positie (kruisblokcovariantie).

seg-0a424875131d = <c1/> is één gestapeld <c2/>-filter (updates in Joseph-vorm) waarvan de meting van de <b>pseudo-afstand</b> <c3/> de blokken positie en klok echt koppelt, anders dan de twee onafhankelijke tweetoestandsfilters van het oudere fusiepakket, die de kruisblokcovariantie exact op nul houden. Getoetst: een gedeelde pseudo-afstand brengt <c4/> op een waarde ongelijk aan nul; twee verschillende geometrieën lossen samen opgelegde offsets van positie+klok op die één enkele afstand niet kan scheiden; een <b>fix met alleen de klok scherpt de positie aan</b> via de kruiscovariantie (het voordeel dat ontkoppelde filters niet kunnen bieden); en de Monte-Carlo-NEES is <b>consistent met χ²({ "4" })</b>. Dit is de realisatie met 1 vrijheidsgraad (de dimensionaliteit van het fusiepakket); de 3-D-uitbreiding met 8 toestanden en de aansluiting op het uitvoerbare pakket worden bijgehouden als vervolgwerk.

seg-3983794a9584 = <b>Bewaking van de filterconsistentie van het Kalmanfilter (NIS/NEES).</b> De covariantie-update van het klokfilter met twee toestanden is nu in <b>gestabiliseerde Joseph-vorm</b> `P⁺ = (I−KH)P(I−KH)ᵀ

seg-a60a8c0fb6b0 = KRKᵀ<c1/>R={ "1e-26" } / Q≈{ "1e-30" }<c2/>src/filter_health.rs<c3/>filter_health { "{" } nis_mean, nis_chi2_lower_95, nis_chi2_upper_95, nees_mean, nees_chi2_lower_95, nees_chi2_upper_95, consistent { "}" }<c4/>detection::chi2_inv_cdf`, Wilson–Hilferty, table-checked).

seg-f9689061a1d2 = <b><c1/>: één citeerbare herkomsttabel.</b> Bundelt elke sensorparameter (klokken, inertiaal, tijdoverdracht), elk fysisch/algoritmisch model (baan, tijdsystemen, stelsels, iono/tropo, integriteit, detectie, jamming, Allan) en elke validatiedataset (AIAA 2006-6753, Celestrak <c2/>) met haar gepubliceerde bron (datasheet, artikel, ICD of standaard) en een eerlijk volwassenheidslabel (voor vluchten gekwalificeerd / grondlab / ruimtedoel op grondhardware). Gelinkt vanuit de inleiding van de README en de documentatietabel; vult de strings <c3/> per run aan die al meereizen in het resultaat-JSON.

seg-55c7b52b5fdb = <b>Getypeerde scenario-API.</b> Dispatch gebeurt nu op een getypeerde enum <c1/> in plaats van op een ruwe stringmatch op <c2/> (<c3/> + uitputtende dispatch), zodat het toevoegen van een pakket door de compiler wordt gecontroleerd. Nieuwe getypeerde oppervlakken naast de ongewijzigde <c4/> die een string teruggeeft: <c5/> met een gestructureerde foutentaxonomie (<c6/> / <c7/> / <c8/> / <c9/>, elk met een stabiele <c10/>); een trait <c11/> en uitbreidingspunt <c12/> (het pakket <c13/> is daar als uitgewerkt voorbeeld doorheen aangesloten); en introspectie met <c14/> (naam, beschrijving, verplichte/optionele velden per soort). De Python- en WebAssembly-bindingen krijgen <c15/> en <c16/>. Gedocumenteerd in <c17/>.

seg-2b86391b753e = Echte GPS-constellatie + dekking van de bedrijfsomhulling.

seg-288f2b1872c8 = <c1/> levert nu een <b>echte momentopname van Celestrak <c2/></b> (2021-07-28, { "30" } satellieten) in plaats van synthetische Walker-TLE's, met <c3/> zodat het alleen laadt wanneer elke TLE-checksum geldig is; <c4/> documenteert reproduceerbaar verversen en de README vermeldt de open databron. Nieuw <c5/> oefent elk pakket uit over ≥{ "5" } varianten van de omhulling en toetst op eindige/begrensde uitvoer, bevestigt dat de <b>flicker-FM-ondergrens de coast van een klok meetbaar verslechtert</b> wanneer die is ingeschakeld (nu ingesteld in drie meegeleverde scenario's), en bevestigt dat het <b>fusiefilter convergeert met een realistische accelerometerbias ongelijk aan nul</b> (binnen { "3" }× het geval met bias op nul), waarmee de realismekloof „fusion only works with zeroed biases” wordt gedicht. <c6/> krijgt een tabel Operating Envelope.

seg-f78d7dce7bfa = <b>GNSS-simulatie in het meetdomein (soort <c1/>).</b> Een voorwaarts model op pseudo-afstandsniveau: per zichtbare satelliet synthetiseert het <c2/> en de L1-Doppler, met de enkelvoudige-frequentie-ionosfeer van <b>Klobuchar</b> (IS-GPS-200 §{ "20.3.3.5.2.5" }) en de zenittroposfeer van <b>Saastamoinen</b>, geprojecteerd met de afbeeldingsfunctie van <b>Niell ({ "1996" })</b>, beschikbaar als TOML-blokken <c3/> en <c4/>. De residuen voeden momentopname-RAIM voor HPL/VPL per epoche, en een JSON-array <c5/> draagt per SV de pseudo-afstand, Doppler, C/N₀ en de correcties voor iono/tropo. Een run zonder ruis reproduceert geometrie + correcties tot submillimeter (CI-test). Nieuw <c6/> en <c7/>.

seg-833249802c56 = <b>Stochastische detector voor tijdspoofing (soort <c1/>).</b> Het spoofpakket draait nu een echte detector in plaats van een deterministische vergelijking van helling tegenover grens: vier injectievormen (<c2/>, <c3/>, <c4/>, <c5/>), een tweezijdige χ²₁-energietest / Neyman–Pearson-test op de monitorstatistiek met klokondersteuning, met de drempel bepaald uit een doelbudget voor valse alarmen <c6/>, en de kans op gemiste detectie <c7/> gerapporteerd in gesloten vorm en via Monte Carlo (<c8/> trials per hypothese; de twee komen overeen tot enkele ×1/√N). De kwaliteitsmaat Security is nu <c9/> bij de operationeel schadelijke (spec-)grootte. Nieuw <c10/> (Gaussische staartfuncties, NP-/energietest, Monte-Carlo P_fa/P_md) en <c11/>. Achterwaarts compatibel: een kale <c12/> wordt nog steeds geaccepteerd als lineaire helling.

seg-b3f3d2ca8a3d = <b>Definitie van de Security-FoM (soort <c1/>):</b> van de analytische detecteerbaarheidsgrens <c2/> naar de <c3/> van de stochastische detector. Het veld <c4/> van het klokpakket blijft de snellere analytische benadering.

seg-ee1268975b2c = Toegevoegd (vervolg)

seg-f71696b7fa20 = <b>RF-jammingmodel (soort <c1/>).</b> Een linkbudgetmodel voor interferentie dat het vermogen en de geometrie van een jammer omzet in verlies van lock per satelliet: de jammer-tot-signaalverhouding uit de padverzwakking in vrije ruimte en de ontvangstantennewinst per richting, de effectieve C/N₀ via de standaard anti-jamvergelijking (ontspreidingsprocesgewinst × de spectrale scheidingsfactor <c2/>; Kaplan & Hegarty §{ "9.4" }) en een instelbare trackingdrempel, gescoord over een Walker-constellatie als kwaliteitsmaat <c3/>. Nieuw <c4/> en <c5/>. De eerlijke reikwijdte (geen multipath, terreinschaduw, AGC of adaptieve nulsturing) is gedocumenteerd in <c6/> / <c7/>.

seg-d4dc36011ea1 = <b>Generieke N-D-parametersweep over elke scenariosoort (<c1/>).</b> De vorige N-D-sweep was alleen voor het klokpakket. <c2/> varieert gepunte TOML-sleutels van een scenario <c3/> over het cartesische product van zijn assen, verstuurt elk roosterknooppunt opnieuw via het normale runpad en leest één of meer maten uit het resultaat via een gepunt JSON-pad, zodat het voor elk pakket werkt (inertiaal, gnss-ins, integriteit, spoof, …) zonder koppeling aan het Rust-type van elk pakket. Roosterknooppunten worden op native doelen parallel over OS-threads geëvalueerd (zonder extra afhankelijkheid); wasm valt terug op sequentieel. Deterministisch en rijgewijs, ongeacht het aantal threads. Nieuw voorbeeld <c4/>.

seg-1c42e15d65a9 = <b>Via TOML configureerbaar deterministisch IMU-foutmodel in het pakket <c1/>.</b> De strapdown-foutketen met drie assen (schaalfactor, misalignement, g-gevoeligheid, kwantisatie, snelheidshelling; IEEE Std 952-1997 §A.2, Groves { "2013" } §{ "4.3" }) is nu per sensor bereikbaar vanuit een scenariobestand via een optioneel blok <c2/>, bovenop de constante inschakelbiases. Wie het blok weglaat, houdt per sensor een zuivere bron met constante bias, zodat bestaande runs van <c3/> ongewijzigd zijn. Dit sluit het eerder alleen in de bibliotheek aanwezige foutmodel aan op een uitvoerbaar pakket en kwaliteitsmaat.

seg-e035371fbe58 = <b>Validatie met echte gegevens.</b> De multi-GNSS-RINEX-navigatieparser, de GLONASS-RK4-propagator en de SP3-lezer worden nu geoefend op echte IGS/DLR-bestanden (een echt gemengd RINEX { "3" }-broadcastnavigatiebestand en een IGS SP3-c-baanproduct), en niet alleen op zelfgeschreven voorbeelden, met controle op niet-lege satellietverzamelingen en eindige, fysisch plausibele ECEF-posities. De fixtures dienen alleen voor tests (uitgesloten van de gepubliceerde crate); zie <c1/>.

seg-2a807ae8e194 = <b>RAIM op de geometrie van echte referentiebanen.</b> De kernen voor momentopname, oplossingsscheiding (MHSS) en ARAIM-beschermingsniveau zijn nu getoetst aan de echte geometrie van precieze IGS-banen (SP3), en niet alleen aan synthetische constellaties: de zichtlijngeometrie wordt opgebouwd uit de eerste SP3-epoche op een echt grondstation, en de tests controleren beschermingsniveaus op meterniveau die APV-I-beschikbaar zijn, dat een pseudo-afstandsbias van { "60" } m de χ²-monitor laat aanslaan, dat oplossingsscheiding de gestoorde satelliet <b>identificeert</b> en dat de niveaus van ARAIM de toegewezen <c1/> halen. Dit dicht de kloof van alleen op synthetische geometrie getoetsen (gLAB-pariteit op ontvangerniveau over een volledige RINEX-boog blijft een roadmap-item, omdat er een pseudo-afstandsoplossing voor nodig is).

seg-651cc4af4872 = <b>Betrouwbaarheidsintervallen per knooppunt voor de N-D-parametersweep</b> (<c1/>). Elk roosterknooppunt van de N-dimensionale sweep over het cartesische product kan nu worden geëvalueerd als een Monte-Carlo-ensemble van seeds, waarbij per knooppunt (voor beide klokken) het gemiddelde, de percentielen en een percentiel-bootstrap-BI van { "95" }% van de maat worden gerapporteerd: een statistisch eerlijke sweep in plaats van één trekking per knooppunt. Hergebruikt de ensemble-/bootstrapmachinerie (<c2/>); deterministisch; <c3/> valt exact terug op de <c4/> met één seed. (Het veralgemenen van de sweep over alle pakketten, verweven met de refactoring naar typed-Scenario, en parallelle uitvoering volgen nog.)

seg-3dc189224fe8 = <b>Acht scenario's toegevoegd aan de playground-catalogus.</b> De knop Run van een mogelijkhedenkaart verschijnt alleen als <c1/> het bestand ook bevat; zes kaarten noemden een scenario dat daar niet in stond, waardoor ze zonder mogelijkheid om ze uit te voeren werden getoond — een daarvan, het datum voor echte laserafstandsmeting, verkeerde in die toestand sinds de oplevering. <c2/> bewaakt de invariant nu in beide helften: het <c3/>-doel van een kaart moet onder <c4/> zijn meegeleverd <em>en</em> door de catalogus worden aangeboden. Mutatiegetest tegen beide faalwijzen.

seg-2d69334516e9 = <b><c1/> geeft zijn geometrie per satelliet uit als <c2/></b> wanneer een exportlocatie is ingesteld (G11). Het is de grootste array die de crate publiceert — { "2304" } rijen in de uitgebrachte gezamenlijke communicatie- en navigatietabel — en hij bereikte gebruikers alleen binnen JSON, de vorm die de curve van 57 punten van een zusterscenario inkortte tot { "23" } punten onder een kolom die beweerde ze allemaal te bevatten. Eén rij per verbinding, het aantal rijen op de kopregel, de antennekolommen alleen aanwezig als er een antenne is ingesteld. Een run zonder exportlocatie is byte voor byte ongewijzigd en schrijft geen bestand.

seg-7958d26072f7 = De SBOM beschrijft nu wat er wordt geleverd: { "60" } componenten werden { "66" }.

seg-219cd333b000 = <c1/> vermeldde elk pakket van de resolve met standaardfeatures, ontwikkelafhankelijkheden inbegrepen. Daardoor stonden <c2/> en <c3/> — crates die alleen voor tests dienen en in geen enkel artefact worden gecompileerd — in de materiaallijst, en ontbrak de keten van <c4/> die het PyPI-wheel linkt (<c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>), de foreign-function-grens van dat wheel. Het script doorloopt nu de resolve-graaf vanaf het pakket kshana, uitsluitend langs normale en buildverbindingen, over de unie van de featuresets default, <c13/> en <c14/> (het npm-pakket bevat dezelfde SBOM), voor elk doelplatform. Het vastgelegde oordeel van de CycloneDX-formaatcontrole is opnieuw als basislijn vastgesteld via de gecommitte generator: { "60" } → { "66" } componenten, { "53" } → { "60" } samengestelde licentie-expressies, en nog steeds nul schemafouten zodra die in de standaard <c15/>-vorm zijn gezet.

seg-23c98d31f749 = <b>De CSV-reproduceerbaarheidstabel bereikt elke toegang, niet alleen de CLI en het Python-wheel.</b> De MCP-server krijgt een zevende tool, <c1/>, die een scenario uitvoert en de byte-stabiele tabel teruggeeft die de CLI als <c2/> schrijft — of een fout die de soorten noemt die er een publiceren (<c3/>, <c4/>, <c5/>, en <c6/> alleen als <c7/> + <c8/> zijn ingesteld). De WebAssembly-module krijgt <c9/>, dat dezelfde tekst teruggeeft of <c10/>. De MCP-round-triptest en de Python-bindingtests leggen de teruggegeven CSV nu byte voor byte vast tegen <c11/>, en leggen vast dat <c12/> het aantal geschreven bytes teruggeeft, en { "0" } zonder aangemaakt bestand voor een soort zonder tabel. Elk oppervlak dat het aantal MCP-tools vermeldt of de tools opsomt, zegt nu zeven.

seg-86c3fed5e23a = <c1/> in de WebAssembly-module: één enginerun voor alle uitvoer.

seg-3f2677cd280b = <c1/>, <c2/>, <c3/> en <c4/> voeren het scenario elk helemaal opnieuw uit, dus de playground betaalde per klik voor vier volledige runs — ongeveer { "12" } s in plaats van { "3" } s voor <c5/> in een browser. <c6/> geeft <c7/> terug uit één run, en de playground gebruikt dat nu. Het komt byte voor byte overeen met de vier afzonderlijke aanroepen.

seg-fa05c9ee0c6a = <b>HERZIENING: de koppeling van de gyro-bias in het GNSS/INS-filter had het verkeerde teken, en de cijfers voor een uitval in <c1/> veranderen.</b> Het extended Kalman-filter (EKF) met foutstatus houdt beide inertiale biassen bij als residuen (waar min de lopende schatting, teruggekoppeld door optelling). De versnellingsmeterkolom stuurde de snelheidsfout aan met <c2/>, maar de gyrokolom stuurde de standfout aan met <c3/>. Een resterende gyro-bias draait de berekende stand in werkelijkheid met <c4/>, zodat elke schatting van de gyro-bias de verkeerde kant op duwde. Het pakket bleef alleen stabiel doordat de standaard a-priori van de gyro-bias ({ "1e-4" } rad/s, 1-sigma) strak genoeg was om die toestanden vast te houden. Met een bredere a-priori divergeerde het filter zelfs als de werkelijke gyro-bias nul was: { "93" } m gefuseerde uitvalfout werd { "4.3" } km. De gepubliceerde cijfers voor <c5/> veranderen als volgt:

seg-47e22e713df6 = voor (≤ { "0.27.2" })

seg-5215a0a41b89 = na

seg-f58aecc6864c = koude-atoom-IMU, gefuseerde RMS tijdens uitval

seg-c4fbd933ddb2 = { "96.1" } m

seg-002d765fca02 = { "1.9" } m

seg-d14616d4ea1b = koude-atoom-IMU, coast binnen specificatie ({ "50" } m)

seg-35f8f623ea28 = { "30" } s

seg-91645c14401b = { "60" } s (de hele uitval)

seg-f297a2652cf8 = tactische IMU, gefuseerde RMS tijdens uitval

seg-0ac27c6d4206 = { "62.5" } m

seg-eda895cc3b86 = { "3.1" } m

seg-e0ab83f1d8d7 = tactische IMU, coast binnen specificatie ({ "50" } m)

seg-5c526991a521 = { "37" } s

seg-743060da5543 = De cijfers voor vrij lopen ({ "130.7" } m en { "314.3" } m) veranderen niet; die gebruikten het filter nooit. De eerdere lezing van het pakket, dat de gefuseerde coast wordt beperkt door een overdracht-standvloer en dus niet verbetert met een betere sensor, was een artefact van deze bug en wordt ingetrokken. Met constante, ruisvrije biassen leert het filter ze nu terwijl GNSS beschikbaar is, dus de gefuseerde coast is een beste geval. De externe filterpy-referentie (<c1/>) controleert alleen de meetupdates, waardoor ze de propagatie nooit zag. Twee tests controleren het teken nu rechtstreeks en beide falen op het oude. De eerste, in <c2/>, voert een bekende resterende gyro-bias door de strapdown en eist dat het filter de resulterende standfout voorspelt binnen { "2" } %. De tweede eist dat een brede a-priori een gyro-bias van { "1e-3" } rad/s leert en binnen { "6" } m blijft. De platformoverschrijdende golden van <c3/> is om deze reden opnieuw vastgelegd en om geen andere.

seg-f764678e3376 = <b>Elke quickstart van een register draait nu zoals geschreven op een schone machine.</b> Gemeten vóór deze wijziging bevatten de voorbeelden voor crates.io en PyPI (Python Package Index) <c1/>, dat een registerinstallatie niet heeft, en het npm-voorbeeld crashte onder Node.js met <c2/>, omdat de <c3/> van het pakket zijn WebAssembly-binary ophaalt en de <c4/> van Node geen lokaal bestand kan lezen. Nu:

seg-e77a540d2f90 = <c1/> en <c2/> bevatten dat scenario inline, zoals <c3/> al deed. De Rust-fence is een heel programma met een eigen <c4/>, omdat de voor rustdoc verborgen regel <c5/> waarmee ze eindigde op crates.io wordt getoond en niet compileert wanneer ze wordt geplakt. <c6/> compileert haar nog steeds byte voor byte en weigert nu ook een verborgen regel in de fence.

seg-ea5204ced0d2 = <c1/> scheidt de browser van Node.js en geeft een Node-recept dat de binary van schijf leest en aan <c2/> doorgeeft. De doc-sync-test accepteert <c3/> als de loader die wasm-bindgen genereert.

seg-ebb763695c59 = Alle drie nemen het scenario op met zijn herkomststrings onverkort, zodat de scenario-hash op elk oppervlak <c1/> is. Het npm-voorbeeld kortte ze vroeger in, waardoor het een andere hash had dan de CLI.

seg-dc52363432f8 = Gereproduceerd uit lokale builds van deze boom: een nieuw <c1/>-project met een padafhankelijkheid op de verpakte crate bouwde en draaide het Rust-voorbeeld; een met maturin uit de verpakte bronnen gebouwd wheel, geïnstalleerd in een nieuwe virtuele omgeving, draaide het Python-voorbeeld; en het pakket <c2/>, ingepakt en met npm geïnstalleerd, draaide het Node-recept. Alle drie drukten dezelfde samenvattingsregel af.

seg-07e465a602f1 = <c1/> werkt vanuit een clone.

seg-77ce31300b69 = <c1/> stelt <c2/> in. Zonder dat weigerde cargo met “could not determine which binary to run”, waar elke regel met <c3/> in de documentatie tegenaan liep.

seg-2d516597b5f5 = <b>De foutmeldingen van de CLI in de eerste minuut zeggen wat u hierna moet doen.</b> Een scenariopad dat niet bestaat, voegt nu een hint toe die naar <c1/> wijst, en een tweede positioneel argument drukt de gebruikstekst af en noemt ook het argument. <c2/>, <c3/>, de foutmelding voor een onbekende optie (exit { "2" }) en de eenregelige <c5/> van <c4/> bij succes bestonden al op main. <c6/> dekt ze nu allemaal, aangezien geen enkele test de binary er eerder voor draaide.

seg-fdd9a27ccfc4 = <b><c1/> in Python is gedocumenteerd als een JSON-string die wordt teruggegeven, niet als een lijst.</b> Het geeft dezelfde metadata terug als <c2/>, geserialiseerd, dus erover itereren doorloopt tekens. Het behoudt zijn string als retourwaarde zodat bestaande aanroepers niet breken. <c3/>, de doccomment van de binding, <c4/> en <c5/> zeggen dat nu en verwijzen naar <c6/>.

seg-f0e0c8c12f8a = <b>De drie register-README's schrijven elke afkorting bij het eerste gebruik voluit.</b> PNT wordt nu uitgeschreven in de tagline, waar het voor het eerst voorkomt, en CLI, TOML, JSON, SVG, CSV, CSAC, HTML, URL en API worden uitgeschreven in de bestanden die ze gebruiken. De kop van de tabel met onafhankelijke referenties zegt niet langer “CI-gated” voordat CI is gedefinieerd.

seg-554c5b0c9c60 = Een gepubliceerd cijfer gecorrigeerd: de beschikbaarheid van ARAIM met twee constellaties op de meegeleverde Celestrak-TLE's voor GPS + Galileo.

seg-1f023a822c91 = <c1/> stelde dat het poolen van Galileo de beschikbaarheid verhoogt van { "0.21" } naar { "0.67" } bij een VAL van { "12" } m en dat de constellatiefout-robuuste modus beperkt is met slechts twee constellaties. Dat kwam doordat <c2/> elke satelliet propageerde vanaf zijn eigen TLE-epoch (<c3/> laat de epoch weg), en de epochs in die bestanden beslaan { "70.6" } h (GPS) en { "335.7" } h (Galileo), zodat de satellieten op onderling inconsistente tijdstippen stonden. De test behoudt nu elke epoch (<c4/>) en evalueert elke satelliet op één gemeenschappelijk UTC-tijdstip, de laatste TLE-epoch in de set (2026-06-07T07:{ "21" }:{ "04" }). De gemeten beschikbaarheid over hetzelfde raster van { "24" } h en 289 samples wordt voor alleen GPS { "0.993" } (was { "0.208" }), gepoold { "1.000" } (was { "0.671" }) en constellatiefout-robuust dubbel { "0.990" } (was { "0.031" }); bij de APV-I-limiet gaat de dubbele modus van { "0.180" } naar { "1.000" }. De conclusie keert om: op een consistente hemel dragen twee constellaties de constellatiefout-hypothese bij een VAL van { "12" } m. Dezelfde cijfers ontstaan met de vroegste TLE-epoch als referentie. Een zelfcontrole in de test legt haar beschikbaarheidslus sample voor sample vast op <c5/>, dus het enige verschil is de tijdsuitlijning. <c6/> en <c7/> §{ "3" } bevatten de nieuwe cijfers; de vermelding voor { "0.13.0" } hieronder blijft zoals uitgebracht.

seg-3173a2e03521 = <b>De openbare oppervlakken adverteren RINEX { "4" } niet langer als getoetst.</b> De engine weigert een RINEX { "4" }-navigatiebestand nu bij naam in plaats van het verkeerd te decoderen, maar het standaardenoverzicht toonde nog steeds een kaart “RINEX { "3" } / { "4" }” met een label <em>getoetst aan een onafhankelijke externe referentie</em>, gekoppeld aan het RINEX-3-bewijs van de navigatieparser. De kaart is nu “RINEX { "3" }”, en README, <c1/>, <c2/>, <c3/> en de samenvatting van de mogelijkheden vermelden wat waar is: RINEX 3.0x-observatiebestanden worden geparseerd, de observatie-indeling { "4.00" } wordt verwacht te werken maar er is nog geen { "4.00" }-bestand door de code gelezen, en RINEX { "4" }-navigatiebestanden worden geweigerd.

seg-c9bb514acb7a = <b><c1/> zegt wanneer “ok” betekent dat er niets te controleren was.</b> Ongeveer twee derde van de catalogus publiceert geen verplicht veld — die pakketten draaien hun referentieconfiguratie vanuit een lege body — dus de lint kon er alleen “ok” voor afdrukken, in dezelfde woorden als na het controleren van zes velden. De succesregel vermeldt nu het aantal verplichte velden dat aanwezig bleek, of dat de soort er geen vereist.

seg-06b324d00285 = <b><c1/> weigert een niet-numerieke <c2/> of <c3/>.</b> Onder bash { "3.2" } liet <c4/> de numerieke vergelijking falen en onwaar opleveren, zodat de gate “repeatability loop SKIPPED (REPEAT={ "0" })” meldde voor een waarde die niet { "0" } was en toch een bon schreef. Beide knoppen stoppen nu met exit { "2" } tenzij het gewone gehele getallen zijn.

seg-09d04ffdd9ac = De MSRV wordt overal waar een mens haar leest als { "1.85" } vermeld.

seg-dafc23725315 = <c1/> ging bij de vorige release naar { "1.85" }; de README-badge, de install- en troubleshootingtekst, <c2/> en de eigen onderbouwing van de MCP-crate zeiden nog { "1.75" }.

seg-c2fa8a31058c = <b><c1/> in de Python-binding rapporteert bytes, niet “chars”.</b> Het drukte <c2/> van UTF-8-strings af, wat een aantal bytes is: { "710" } “chars” voor een tabel van 708 tekens.

seg-6b4452a4e340 = De README documenteert <c1/> niet langer samen.

seg-47d83e4d847b = <c1/> is een vlag voor één scenario, die met <c2/> wordt genegeerd (de binary waarschuwt). De twee kopieervoorbeelden in README.md en README.crates.md tonen nu alleen de studieopdracht.

seg-5ed7f8330b2d = <b>Het klokstabiliteitsbewijs van de site vermeldt beide waargenomen toleranties.</b> De caesiumreeks 5071A wordt gereproduceerd tot ≤ { "3e-5" } en PHASE.DAT tot ≤ { "5e-5" }; de alinea gaf { "3e-5" } voor beide.

seg-8bba7f1171f3 = Twee uitvoerbestanden van de engine worden niet langer bijgehouden.

seg-ea9bf1d14371 = <c1/> waren gestempeld door engine { "0.20.0" } met elke kwaliteitsmaat leeg, en de eigen studieopdracht van de README overschreef ze, waardoor de boom vervuild raakte en de push-gate werd geblokkeerd. <c2/> / <c3/> worden nu genegeerd zoals de andere vier engine-uitvoerbestanden.

seg-77ce9b90859d = <b>Een seed-sweep in de playground faalt niet langer bij elke run.</b> De sweep doorliep de integer-knop <c1/> lineair ({ "1" }, { "10.9" }, { "20.8" }, …), en de engine, die hem als <c2/> las, verwierp elke gebroken waarde. Integer-knoppen doorlopen nu verschillende gehele getallen.

seg-e1b1e1360eb9 = <b>Elke download uit de playground zegt welke engine en welke invoer hem maakte.</b> Een paar soorten (bijv. <c1/>) geven geen <c2/> of <c3/> uit, dus hun downloads heetten gewoon <c4/>. De naam valt nu terug op de versie van de geladen engine en een FNV-1a-64-vingerafdruk van 12 hexadecimale tekens van de scenariotekst.

seg-0181e86b576a = <b>De gepubliceerde crate is minder dan de helft zo groot als voorheen, en <c1/> bouwt alleen de CLI.</b> Het pakket bevatte vroeger de papers, hun indieningspakketten, de artefacten van de papergrafieken, de notebooks, <c2/>, de onderhoudsscripts en de voorbeeldprogramma's. Geen ervan wordt door de bibliotheek of de CLI gecompileerd. Het bevatte ook de drie interne generatoren onder <c3/> (<c4/>, <c5/>, <c6/>), zodat een registerinstallatie vier uitvoerbare bestanden compileerde en installeerde, waarvan drie alleen nuttig binnen een checkout. Die bomen en de drie generatorbronnen zijn nu uitgesloten. Cargo leidt de binaries van een pakket af uit de bestanden die het bevat, dus het gepubliceerde manifest noemt alleen <c7/>. In een clone worden de generatoren nog steeds automatisch gevonden, zodat <c8/> en de releasejob die <c9/> draait ongewijzigd zijn. Gemeten met <c10/>: { "763" } bestanden, { "16.7" } MiB, { "6.8" } MiB gecomprimeerd ervoor; { "591" } bestanden, { "10.5" } MiB, { "3.0" } MiB gecomprimeerd erna. De verificatiebuild, die alleen de verpakte bestanden compileert, slaagt. <c11/> op de verpakte crate installeerde één uitvoerbaar bestand, <c12/>.

seg-567c7059286f = <b>Uitvoer die een tijdsynchronisatie-ingenieur kan lezen: geen <c1/> meer, geen <c2/> meer zonder aanval, en aantallen per site die met de README's overeenkomen.</b> Dit is een weergaveherziening. Er verandert geen gepubliceerd getal; de JSON-waarden zijn identiek, wat de golden-hashes hierboven bewijzen.

seg-849fa9a29f07 = De eenregelige samenvatting drukte de tijdsynchronisatiefout van de optische klok op het 95e percentiel (p95) af als <c1/> terwijl de tabel ernaast { "1.20e-4" } ns toonde. Een tijdsynchronisatiecijfer ongelijk aan nul dat te klein is voor één decimaal wordt nu afgedrukt met drie significante cijfers (<c2/>); een exacte nul wordt nog steeds afgedrukt als <c3/>. Het HTML-rapport (HyperText Markup Language), de vergelijkingstabel van de studie en het downloadbare rapport van de playground gebruiken dezelfde regel, dus geen enkel cijfer ongelijk aan nul wordt nog als <c4/> afgedrukt.

seg-c44323babd1e = <c1/> is een analytische grens voor de detecteerbaarheid van spoofing die alleen iets betekent tegen een ingestelde aanval. De soorten <c2/>, <c3/>, <c4/> en <c5/> stellen er geen in, dus hun samenvatting drukt nu <c6/> af in plaats van een getal zoals <c7/> dat leest als een mislukte detectie. De waarde blijft in <c8/>, gemarkeerd met <c9/> en de reden in <c10/>, en de rapporttabellen tonen “not applicable”. De soort <c11/> scoort detectie nog steeds.

seg-f54d5ffb7dff = Twee samenvattingspins in <c1/> veranderden om precies deze twee redenen en om geen andere: <c2/> (de kwantum-p95 en beide waarden van <c3/>) en <c4/> (beide waarden van <c5/>; de p95-waarden zijn exact nul). Hun hashes van het hele document veranderden niet. De verwachte samenvattingen in de README, de drie tutorials en hun lesscenario's zijn bijgewerkt om overeen te komen, en <c6/> controleert de lesexemplaren tegen de engine.

seg-e8e012376fa3 = De begeleide rondleiding van de playground opent niet langer bij het eerste laden. Het modaal venster ving de eerste klikken op en de spotlight scrolde de pagina weg van waar de bezoeker was geland. Ze start vanaf de knop “Take the 60-second tour” of de zwevende knop Tour.

seg-4d60d4ea4d7d = De pagina scrolt op een telefoon niet langer zijwaarts. Bij { "390" } px kwamen de merkrij en de GitHub-knop op ongeveer { "410" } px inhoud, een overloop van { "4" } px; de header past nu vanaf { "320" } px, en de tabel met kwaliteitsmaten scrolt binnen zijn eigen vak in plaats van de pagina te verbreden.

seg-f6ec6a64071d = De mogelijkhedenverkenner opende met zijn eigen aantal kaarten (“{ "46" } capability cards … { "17" } backed by an external oracle”) naast README's die { "64" } van { "168" } zeggen. Hij opent nu met de verificatiematrix, gelezen uit de gegenereerde <c1/> (dezelfde matrix waaraan de aantallen in de README zijn vastgepind), en noemt de kaarten daarna als de samenvattingslaag die ze zijn. <c2/>, een nieuwe stap in de continuous-integration-workflow (CI), controleert de rekensom en vergelijkt README.md en de beschrijvingen van de pagina onderling; <c3/> legt de koppeling vanaf de Rust-kant vast.

seg-606098743e57 = <b>De openbare beschrijving opent nu met tijdsynchronisatie en holdover, het best getoetste domein.</b> De opening van de README en <c1/> presenteren Kshana als een open, reproduceerbare, herkomstgelabelde bewijsengine voor PNT-veerkracht: tijdsynchronisatie en holdover van kritieke infrastructuur eerst (de schatters voor Allan, gemodificeerde Allan, tijdsdeviatie en maximale tijdsintervalfout en de inversie van de coast-variantie bij holdover zijn de VALIDATED-rijen daarachter), kwantum als neutrale afwegingsmethode kwantum-versus-klassiek waarvan de resultaten MODELLED zijn gelabeld, en lunaire / cislunaire en deep-space-navigatie als onderhouden mogelijkheden in plaats van het hoofdpunt. Beide pagina's zeggen nu wat Kshana niet is — geen simulator van radiofrequente signalen of hardware-in-the-loop-opstelling, geen vervanging voor MATLAB/Simulink, STK of Orekit — en verwijzen naar de nieuwe soort <c2/> en <c3/>. De oude zin “there is no good open tool” is verdwenen: een zoekopdracht die niets vindt is geen bewijs dat er niets bestaat. <c4/> krijgt een ongedateerde prioriteitsvolgorde (tijdsynchronisatie eerst, de kwantumafweging tweede, lunair onderhouden) en laat drie verouderde punten vallen (Coriolis- en lichtverschuivingssystematiek, de beginvoorwaarden voor NRHO en het lunaire scenario, alle opgeleverd); de regel in de README “Coriolis and light-shift remain roadmap” is op dezelfde manier gecorrigeerd.

seg-7bc48692be0b = <b><c1/> onderschat zichzelf niet langer.</b> De rij voor aardvaste stelsels zei “none” terwijl de matrix GCRS→ITRS als VALIDATED beoordeelt; ze is nu “full”, en de rij voor kernstelsels legt de ANISE-kruiscontrole vast als geleverd. De begeleide modus stond als roadmap vermeld; de playground heeft begeleide schuifregelaars en een begeleide rondleiding opgeleverd. Een controle tegen <c2/> corrigeerde vijf andere rijen die ouder waren dan hun validaties: het Cowell-krachtenmodel en batch/sequentiële baanbepaling tegen Orekit { "12.2" }, grondstationpassages tegen de elevatiedetector van Orekit, de kernel voor verzwakking van precisie (DOP) tegen gnss_lib_py, en OEM-import tegen de onafhankelijke parser <c3/>; de rij voor verificatie en validatie noemt nu de bewakers die controleren dat elke geciteerde test bestaat.

seg-9d144df304ca = De woordenlijst legt uit wat een resultaatbestand zegt.

seg-eed672b2f8fd = <c1/> krijgt begrijpelijke vermeldingen voor de uitvoertermen (holdover, p95, integriteit, de beveiligingsscore, PDOP, <c2/>, <c3/>), de tijdsynchronisatietermen voor telecom (tijdsfout, max|TE|, cTE, dTE, MTIE, TDEV, PRTC, ePRTC, T-BC, T-TSC, OCXO, CSAC) en de drie bewijsniveaus (VALIDATED, MODELLED, PARTNER).

seg-1a4f9d5eef96 = <b>Afkortingen worden bij het eerste gebruik voluit geschreven in elk met de hand geschreven openbaar document.</b> De README en { "24" } bestanden onder <c1/> hadden enkele honderden afkortingen die vóór, of zonder, hun uitleg werden gebruikt; elke is nu uitgeschreven waar ze in dat bestand voor het eerst voorkomt. De drie gegenereerde bestanden (<c2/>, <c3/>, <c4/>) blijven ongemoeid: ze worden geschreven uit <c5/> en <c6/>, dus hun formulering moet bij de bron veranderen.

seg-2889ce118381 = Regeldekking heeft een vastgelegde meting.

seg-9c4684c0a4ef = <c1/> legt { "95.63" } % vast ({ "37,697" } van { "39,419" } regels) uit de CI-job <c2/> op <c3/>, en <c4/> pint de vijf openbare oppervlakken “~{ "96" }%” daaraan vast — het ene kopgetal dat met de hand werd bijgehouden en al eens ongemerkt was verschoven.

seg-ebd36b7291df = Nieuwe doc-sync-gates voor oppervlakken die niets las.

seg-3dd44fc69a28 = <c1/> controleert elke <c2/> in een JavaScript-fence tegen de WebAssembly-exports, en pint het Rust-voorbeeld van README.crates.md byte voor byte vast aan een kopie die de testbinary compileert. <c3/> faalt als <c4/> <c5/> verliest of SECURITY.md het niet meer vermeldt. <c6/> scant nu ook <c7/> en de drie register-README's, en elke standaard op de site moet zijn <c8/> expliciet vermelden.

seg-a506d14f3447 = De twee controles van echte-hardwareklokken draaien op een runner.

seg-c7f8b8627137 = <c1/> (maandelijks en bij dispatch) haalt de reeksen 5071A en PHASE.DAT op en draait beide tests met <c2/>, zodat een ontbrekende invoer faalt in plaats van wordt overgeslagen. Beide fetchscripts zijn vastgepind op één allantools-commit en verifiëren SHA-256.

seg-3b4a7fee3cd0 = <b>De Python-typestub wordt gecontroleerd tegen het gebouwde wheel</b> (<c1/> in de bindingsjob), waardoor <c2/>/<c3/> zonder stub werden uitgeleverd.

seg-24c2ccf3634a = <b>De woordenlijst definieert URE, EOP, FoM, CTI en TIB</b>, die de README en het register zonder uitleg gebruikten.

seg-ae044195cd47 = <b>Het gepubliceerde veldcontract van elke soort is nu waar, en een test houdt het zo.</b> Vijf van de { "61" } soorten veranderden. Soorten met een niet-lege <c1/> gaan van { "21" } naar { "22" }: <c2/> vereist nu <c3/> (een kale <c4/> slaagde vroeger voor <c5/> en liet de run daarna falen), en <c6/> voegt <c7/> toe, wat de run al eiste. Een verplichte vermelding mag <c8/> (een van deze) en <c9/> (allemaal samen) gebruiken; <c10/> begrijpt beide. <c11/>, <c12/> en <c13/> publiceren { "9" } echte optionele velden die ze hadden weggelaten. <c14/> zegt nu dat <c15/> voor elke soort verplicht is behalve <c16/>. <c17/> controleert elke soort tegen zijn meegeleverde scenario: het verwijderen van een verplichte vermelding moet de run laten falen, en een document met alleen de verplichte velden moet draaien.

seg-09ba716f3e97 = De notities voor de JetBrains Marketplace worden bewaakt.

seg-938ff48e7a2d = <c1/> faalt nu tenzij de nieuwste <c2/>-vermelding in <c3/> de te leveren versie noemt; zeven gepubliceerde versies hadden de notities van { "0.22.0" } ongewijzigd geleverd.

seg-3d38550854e0 = Het dekkingscijfer van het technisch rapport is het gemeten cijfer.

seg-bd312cd26746 = <c1/> zei “near { "97" } %”; het zegt nu near { "96" } % ({ "95.63" } % gemeten, <c2/>) en is het zesde oppervlak dat de dekkingstest vastpint.

seg-934680d402da = <b>De engineclient buiten de hoofdthread wordt getest</b> (<c1/>, in CI): dispatch-allowlist, annuleren en opnieuw starten, de drie terugvalroutes op de hoofdthread en herstel na een crash, tegen een nepworker.

seg-fd5f9a8a4f43 = <b>Er wordt niets gepubliceerd voordat de getagde commit zijn tests heeft doorstaan, en een release is pas klaar als elk register hem aanbiedt.</b> De volgorde is nu tag, verifiëren, publiceren, pariteit, site, in één run van <c1/> (<a1><c2/></a1>).

seg-745b11c8ed74 = Publiceren wacht op het oordeel.

seg-e66c890cf6c0 = <c1/>, <c2/> en <c3/> starten niet langer bij de tag-push; <c4/> roept ze aan vanuit jobs die <c5/> hebben. Eerder liepen ze er een race mee: bij { "v0.27.2" } hadden crates.io, npm en de Python Package Index (PyPI) allemaal binnen { "4.5" } minuten na de tag gepubliceerd, en <c6/> kwam { "84" } minuten erna terug; bij { "v0.27.0" } publiceerden npm en PyPI terwijl de job van crates.io faalde. Een handmatige herpoging op een tag wordt tegengehouden door de nieuwe <c7/>, die een groene <c8/> voor precies die commit vanuit de Actions-interface eist en bij al het andere gesloten faalt.

seg-3800247c81f2 = <em>Alles wordt gebouwd voordat er iets wordt geüpload</em>, en crates.io, waarvan de verpakkingsstap degene is die halverwege een release faalde, publiceert als eerste.

seg-6929a7608da7 = <em>Een ontbrekend registertoken laat de job falen</em> in plaats van de upload over te slaan en succes te melden.

seg-460811602293 = Een pariteitscontrole na het publiceren.

seg-86eb0fab2f7c = <c1/> bevraagt crates.io (<c2/> en <c3/>), npm, PyPI (de brondistributie en alle zes de platformwheels) en ghcr.io totdat elk de versie aanbiedt, of laat de run falen; docs.rs en het Model Context Protocol-register (MCP) worden gerapporteerd, niet vereist. Tegen eerdere releases gedraaid vindt het { "0.22.0" } ontbrekend op npm en PyPI, { "0.23.0" } op PyPI en { "0.27.0" } op crates.io.

seg-79578a00fd78 = <em>Vooraf gebouwde opdrachtregelbinaries voor macOS (Apple silicon en Intel) en Windows x86-64</em>, benoemd naar doelplatform (<c1/> enzovoort), naast de Linux-<c2/>, waarvan de naam ongewijzigd is. Een bestand <c3/> dekt elk onderdeel, en <c4/> controleert het en draait de binaries voor macOS en Windows op hun eigen systemen.

seg-3e1f5afa9f2a = <em>kshana.dev toont een release, niet <c1/>.</em> Het werd vroeger bij elke push naar <c2/> opnieuw uitgerold terwijl zijn pagina's de laatste release noemden. <c3/> bouwt nu alleen een releasetag: de release start het zodra elk kanaal de versie aanbiedt, en een handmatige dispatch rolt de laatste release (of een genoemde) opnieuw uit.

seg-43da8f3f171e = Eén bron voor wheels.

seg-b911ac65e231 = De met de hand gekopieerde matrix met zes doelplatforms van <c1/> is verdwenen; het roept <c2/> aan, zodat de auditwheel-taggate en de controle op byte-reproduceerbaarheid nu de wheels beoordelen die PyPI ontvangt, en een falen in een van beide de release stopt.

seg-194c4b019a4c = <em>Vastgepinde buildtools.</em> Elke workflow vraagt Rust { "1.93.0" } aan (de msrv-job zijn eigen versie); <c1/> en <c2/> hadden <c3/> aangevraagd, en het log van { "v0.27.2" } toont dat rustup { "1.98.1" } installeerde en daarna met { "1.93.0" } compileerde, alleen omdat <c4/> zwaarder weegt. wasm-pack is vastgepind op { "0.13.1" } (de versie die { "v0.27.2" } bouwde, die het niet-vastgepinde installatiescript koos) met een controle van de checksum, en mcp-publisher op { "1.8.1" } met zijn gepubliceerde SHA-256. <c5/> faalt nu als een workflow om een andere compiler vraagt of een gedownload script in een shell pijpt. Er is geen verificatiejob, golden pin of lokaal gatescript verwijderd of versoepeld.

seg-9e2a7376367e = <b>Elke GitHub Action van derden is vastgepind op commit-SHA</b> — { "93" } verwijzingen in { "15" } workflows, { "92" } ervan nieuw — waarbij de tag als afsluitend commentaar blijft staan zodat Dependabot kan bijwerken. De uitzondering is <c1/>, waarvan de tag de toolchainkiezer is.

seg-6afb4a8770b0 = <b>De basislagen van het image van de MCP-server zijn vastgepind op multi-arch-digest</b>, en Dependabot bewaakt nu de Dockerfile van <c1/>, zodat de OS-lagen nog steeds beveiligingsupdates ontvangen — via een beoordeelde PR.

seg-4ea8b158b408 = De controle van tag tegen manifest draait in de twee publicatieworkflows die de versie van de tag leveren.

seg-4b77764e955d = <c1/> (ghcr-image, MCP-register) en <c2/> (Marketplace) lopen een race met <c3/> in plaats van erop te wachten, dus een verkeerd gemaakte tag werd alleen in een zusterworkflow bewaakt. Beide draaien nu <c4/> vóór het bouwen.

seg-bf90c4063843 = <b>Vier advisories die Dependabot opwierp op de dag dat zijn meldingen werden ingeschakeld, zijn verholpen.</b> De MCP-server gaat van <c1/> { "1.7" } naar { "2.2" }: drie advisories tegen <c2/> < { "2.1" } (een lek in de sessietabel van Streamable-HTTP, ontbrekende validatie van OAuth protected-resource, aangepaste headers die een cross-origin-redirect volgen) — hier geen enkele bereikbaar, aangezien de server alleen stdio spreekt, maar een gepubliceerde crate hoort geen kwetsbare SDK vast te pinnen. De macro's van <c3/> { "2" } hebben Rust { "1.88" } nodig, dus alleen <c4/> declareert nu <c5/>; de bibliotheek <c6/> blijft op { "1.85" }. De ene API-wijziging (<c7/> → <c8/>) is doorgevoerd, en de round-triptests slagen. De SonarQube-scanactie gaat van v5 naar v6, wat een advisory over argumentinjectie verhelpt (≥ { "4.0" }, < { "6.0" }).

seg-2652aaad177e = <b>Elk Rust-item dat een rij van de verificatiematrix citeert, wordt nu tegen de crate opgelost.</b> De bestaande bewaker controleerde de citaten in de vorm van bestandspaden; { "63" } van de { "164" } niet-partnerrijen noemen hun bewijs in plaats daarvan als item in de crate — <c1/>, <c2/>, <c3/> — en een token zonder achtervoegsel <c4/> was onzichtbaar voor een padscanner. Die rijen hadden een hernoemde module, een geleegde testmodule of een functie die nooit bestond kunnen noemen, en elke gate was groen gebleven.

seg-01eee5115e3f = <c1/> lost alle { "339" } van zulke citaten op via de moduleboom, eist dat elke niet-partnerrij ten minste één test noemt die daadwerkelijk <c2/> draagt, en eist dat partnerrijen er geen noemen. Vier mutaties dienden om hem te beoordelen: een geciteerde module hernoemen, het enige testcitaat van een rij naar een functie zonder test laten wijzen, de echte <c3/> hernoemen en de attributen <c4/> eruit strippen — elk gaat rood op de bewering die erover gaat.

seg-7731d549c739 = Eén rij was al fout: <em>Alternative / complementary PNT</em> citeerde <c1/>, een glob, wat geen citaat is. Ze noemt nu <c2/> en de drie testmodules in de crate daarachter.

seg-cf6fd64368de = <b>De gepubliceerde cijfers worden bij elke build opnieuw tegen de engine gecontroleerd</b> (<c1/>). De drie demogrammen in de README zijn de eigen <c2/>-uitvoer van de engine en niets voerde het scenario opnieuw uit; de twee crossover-studies van het paper werden eenmaal gegenereerd en gecommit; en de README vermeldt vier kwaliteitsmaten in proza naast <c3/>. Alle drie zijn nu vastgepind aan live engine-uitvoer.

seg-276b65a8f76a = Het afstemmen leverde het nuttige resultaat op: de demogrammen waren getekend met engine { "0.22.0" } en de crossover-JSON van het paper met { "0.20.0" }, en bij { "0.27.1" } is <b>elke geplotte waarde in alle vijf artefacten identiek</b> — de drie grafiek-SVG's verschillen van een nieuwe run in precies twee tekens elk, de versiestempel in de voettekst. De grafieken zijn opnieuw gerenderd zodat de voettekst klopt. De JSON van het paper blijft bewust gestempeld met { "0.20.0" }: het is het verslag van de run waarvan een gepubliceerd paper een cijfer insluit, en opnieuw stempelen zou een herkomst claimen die de PDF niet heeft. De bewaker stelt in plaats daarvan de sterkere eigenschap vast — dat de huidige engine elke gepubliceerde waarde nog steeds reproduceert.

seg-c88647c5f2fc = SonarCloud-analyses werden vastgelegd als <c1/>, zodat de periode voor nieuwe code van <c2/> nooit vorderde: ze was nog verankerd aan de analyse van 2026-07-02, beoordeelde tweeëntachtig dagen werk als één enkele delta en mat { "7877" } “nieuwe” gedupliceerde regels tegen een drempel van { "3" } %. De scan geeft nu de crateversie mee. De onderliggende duplicatie is echt en wordt hierdoor niet verborgen: ze is geconcentreerd in de declaratieve <c3/>-registers die in <c4/>, <c5/>, <c6/>, <c7/> en <c8/> worden herhaald, en in de verificatietabel met 168 rijen, en ze wordt hier als werk benoemd in plaats van van de meting te worden uitgesloten.

seg-f2a0960a6f11 = <b><c1/> had geen lock voor één schrijver, en elke run schreef hetzelfde log.</b> Dat is geen netheid: de <c2/>, <c3/> en <c4/> van de bon worden UIT dat log teruggelezen, en de pre-push-hook vertrouwt de bon. Een gate die was gedood maar waarvan de testbinary nog leefde, bleef schrijven in het bestand dat de volgende run net had afgekapt — zodat de aantallen van de ene run als die van een andere run konden worden aangemerkt, waarmee een push werd toegestaan op grond van een suite die nooit had gedraaid op de boom die werd gepusht. Het is nu één gate per checkout (weigeren met exit { "75" } naast een levende, een verouderde lock opruimen waarvan de pid weg is) en één log per run, waarbij <c5/> bij het afronden wordt ververst vanuit de eindigende run. Beide richtingen zijn getest: een levende pid weigert, een dode wordt opgeruimd.

seg-687d6fe87221 = <c1/> beweerde dat zijn tests “<b>niet</b> bewijzen dat de genoemde test-/oracle-strings naar live code verwijzen”. Twee bewakers doen nu precies dat, dus de moduledoc zei het tegenovergestelde van de waarheid; ze vermeldt nu wat machinaal wordt gecontroleerd en wat aan menselijk oordeel wordt overgelaten. Een verouderde verwijzing naar <c2/> — de module is <c3/> — is gecorrigeerd in de eigen documentatie van de zusterbewaker.

seg-014070f0873c = <b><c1/> is op 2026-09-22 herschreven en geforceerd gepusht.</b> Tien commits werden vier. De herschrijving voegde elke commit die een gate rood liet in de commit die hem weer opruimde, zodat elke commit op <c2/> nu een boom heeft die slaagt, en verwijderde de geannuleerde runs die een concurrency-groep voor de hele branch op elke vervangen commit had achtergelaten.

seg-b48d6cfc3b42 = Er is niets weggegooid. De commits van vóór de herschrijving blijven bereikbaar via de tags die ernaar wijzen, en de uiteindelijke boom is byte voor byte identiek aan de boom waarmee de herschrijving begon — <c1/> tussen de oude top en de nieuwe is leeg, afgezien van de drie workflowbestanden die deze release wijzigt.

seg-0549cfdc6d69 = De vervangen SHA's, voor iedereen die naar een ervan verwijst:

seg-14812deb1b6b = oud

seg-c63f549e6a1d = onderwerp

seg-57bfbb773299 = docs(changelog): disclose the authorship rewrite and the two dangling crate sha1s

seg-02aa1be872d2 = fix(docs): the engine-flow diagram said { "6" } figures of merit; the engine scores { "7" }

seg-f3a598ff3349 = fix(test): two more cross-platform pins, and two wrong assumptions of my own

seg-e9054c4801ff = feat(web): surface the lunar cluster on the site — seven capability cards

seg-3f1f16502fdf = docs(lunar): document { "42" } public fields and ratchet the ceiling down to { "985" }

seg-f97ce0978cc3 = chore(release): { "v0.27.0" }

seg-cbe63ab92c6a = test(docs): guard the distribution diagram, the last unguarded one

seg-70c84ea0a5bd = chore(release): { "v0.27.1" }

seg-9c220336c895 = <b>De tags { "v0.27.0" } en { "v0.27.1" } zijn bewust NIET verplaatst.</b> Ze wijzen nog steeds naar <c1/> en <c2/>, de exacte commits waarvan de bomen de artefacten voortbrachten die nu live staan op crates.io, npm, PyPI, ghcr.io en het MCP-register. De <c3/> van een crate legt de sha1 vast waaruit hij is verpakt, registers zijn onveranderlijk, en de SLSA-attestatie van de buildherkomst op de releaseonderdelen van { "v0.27.1" } is aan die commit gebonden. Het verplaatsen van de tags had al die gepubliceerde artefacten laten wijzen naar een commit die niet meer bestaat. Ze laten staan houdt de oude commits bereikbaar en elke gepubliceerde herkomstketen oplosbaar, ten koste van twee tags die geen voorouders meer zijn van <c4/> — en daarom bestaat deze release: { "v0.27.2" } geeft <c5/> een eigen tag, verpakt uit een commit die erop staat.

seg-3c644384256f = Dit is de tweede bekendgemaakte herschrijving van deze geschiedenis; de eerste, op 2026-09-21, maakte het auteurschap canoniek en is vastgelegd in de notities van { "0.27.0" } met zijn eigen twee losse crate-sha1's. Een herschrijving wordt hier elke keer bekendgemaakt, omdat een repository die verifieerbare herkomst verkoopt niet stilletjes de grond onder een gepubliceerd artefact kan verschuiven.

seg-d82d7a3c9054 = De gepubliceerde crate compileerde niet.

seg-ebc99c9df1ef = <c1/> bevat een <c2/> op het hoogste niveau van <c3/>, en het manifest sluit <c4/> uit van het pakket, zodat de tarball die crates.io ontving een bestand miste dat de bibliotheek zelf insluit. De publicatie van { "v0.27.0" } faalde om die reden in zijn verificatiebuild en er kwam geen { "0.27.0" } op crates.io; npm en PyPI, waarvan de jobs er niet van afhangen, publiceerden normaal. De uitsluiting kent nu een uitzondering voor die ene catalogus.

seg-6ff9cdb976e8 = Elke andere <c1/> van een fixture in <c2/> staat binnen een module <c3/> en bereikt dus nooit de verpakte bibliotheek. Alleen een op het hoogste niveau doet dat.

seg-7f0975453b8f = <b>Niets in CI draaide <c1/>,</b> en daarom werd een tarball die niet kan compileren pas ontdekt door de publicatiejob, nadat twee andere registers al hadden geleverd. Een job <c2/> bouwt en compileert nu bij elke push precies die tarball.

seg-1f2df48821fc = De emissiepins van de lunar-frame-realisatie verschuiven niet langer bij een versieverhoging. De SVG-voettekst bevat de engineversie, zodat elke release drie hashes opnieuw als basislijn vaststelde — twee keer op één dag — en een pin die uit routine opnieuw wordt vastgelegd niet meer wordt gelezen. De versiestring wordt vóór het hashen genormaliseerd tot een plaatsaanduiding, en van de emissie wordt apart vastgesteld dat ze de draaiende versie vermeldt, zodat dat feit nauwkeuriger wordt gecontroleerd dan de hash het ooit controleerde.

seg-56309487ea7e = <c1/> — het datum van het lunaire referentiestelsel uit een echte waarnemingscampagne.

seg-966a2cc4e40d = <c1/> verving een geïnjecteerde Helmert-transformatie door een <em>gesimuleerde</em> campagne en zei dat ook: het stationsnetwerk, het schema en de sigma per waarneming zijn illustratieve invoer. Dit scenario haalt de simulatie weg uit de twee plaatsen waar een schema en een foutmodel in het antwoord doorwerken. De epochs zijn de zendtijden van { "337" } gearchiveerde normal points van ILRS-laserafstandsmeting naar de maan (2015-04-08 .. 2015-06-27, Grasse MeO { "7845" } en Matera MLRO { "7941" }, alle vijf retroreflectorarrays), en elk waarnemingsgewicht is de eigen gearchiveerde precisie van dat normal point, <c2/> — een mediaan van { "5.13" } mm enkele-weg-afstand, uit het bestand gehaald in plaats van hier gekozen. De stationscoördinaten komen uit IERS ITRF2020 en de reflectorcoördinaten uit JPL DE430 Tabel { "7" }; elke fixture legt een URL, een ophaaldatum en een SHA-256 vast en wordt uit zijn bron geregenereerd door een gecommitte generator die de bron verifieert en afbreekt in plaats van een getal uit te geven. Het rapport noemt welke schakels gemeten zijn en welke gemodelleerd blijven, en de gemodelleerde zijn <em>gemeten</em>: de waargenomen-min-berekende enkele-weg-afstand over de echte data is { "156 494" } m RMS, wat dezelfde testset bevestigt tegen JPL Horizons over dezelfde periode ({ "195 655" } m RMS-vector, slechtste epoch { "0.054" }° — binnen de ~{ "0.3" }° die de ingebouwde analytische lunaire reeks voor zichzelf claimt). Additief: een nieuwe soort, een nieuwe lezer (<c3/>) en een nieuwe module (<c4/>); de bestaande lunar-frame-pakketten zijn bit voor bit vastgepind.

seg-7fcd2af0a688 = <b><c1/> als scenarioparameter</b> op <c2/> en <c3/>. De nauwkeurigheid van signal-in-space-afstandsmeting was een constante tijdens het compileren (<c4/>), dus een sweep van het servicevolume kon slechts één vaste waarde als geslaagd of gefaald beantwoorden. Beschermingsniveaus zijn er exact lineair van afhankelijk, dus door hem beschikbaar te stellen wordt de sweep een <b>eis</b> aan de afstandsmetingsnauwkeurigheid over het hele volume. De standaardwaarde reproduceert het eerdere gedrag bit voor bit.

seg-c3ccc1e89a2d = <b>Export van geometrie per satelliet</b> op <c1/>: <c2/> + <c3/> voegen een array <c4/> toe met azimut, elevatie en schuine afstand naar elke satelliet op elke epoch voor één genoemde selenografische locatie, plus de zichtbaarheidsvlag. De samenvatting van de aggregaatdekking laat de geometrie per satelliet bewust samenvallen, maar de schuine afstand is precies wat een linkbudget verbruikt, dus een gezamenlijke communicatie- en navigatieanalyse was niet mogelijk uit de samenvatting alleen. Uit tenzij beide coördinaten zijn gegeven; puur additief.

seg-ae7886fbca9d = <c1/>, de openbare kijkhoekhelper achter de export.

seg-b187bade5f04 = Een rij in de verificatiematrix voor de nieuwe geometriemogelijkheid.

seg-14ef785b6c12 = <b>Het echte antennepatroon in de geometrie-export.</b> De engine bevat sinds P1 een patroon van een uniform belichte cirkelvormige apertuur (<c1/>, de Airy-vorm <c2/>) en <b>niets buiten <c3/> gebruikte het</b> — in plaats daarvan deed een boresight-gain gekoppeld aan een vuistregel voor gain en bundelbreedte het werk. Een optionele tabel <c4/> op <c5/> (alleen gelezen als de exportlocatie is ingesteld) geeft nu aan elke geëxporteerde rij de <b>hoek buiten de boresight bij de satelliet</b> en de <b>zendgain naar de locatie uit dat patroon</b>, en voegt een blok <c6/> toe dat het <b>aantal satellieten in de bundel onder het echte patroon naast het aantal in de bundel onder de symmetrische benadering</b> rapporteert (<c7/>) met het verschil als een genoemde correctie. Beide getallen worden uitgegeven; geen van beide vervangt het andere. Gemeten bij de eigen representatieve lunaire apertuur van de engine (schotel van { "1" } m, { "2.4" } GHz, η = { "0.60" }) over een locatie nabij de zuidpool en de illustratieve schil van het LCNS-type, <b>verschillen de twee met meer dan één satelliet</b>: het echte patroon plaatst { "0" } van { "76" } zichtbare verbindingen binnen de halfvermogensbundel, de benadering claimt er { "28" } — een correctie van −{ "2.33" } satellieten per epoch, slechtste enkele epoch { "3" }. De benadering heeft een eigen aperturerendement ({ "0.641" } tegenover de regel <c8/> graden waarmee ze gewoonlijk wordt aangehaald, { "0.920" } tegenover een uniforme cirkelvormige apertuur), dus op een schotel met η = { "0.60" } levert ze een bundel die { "1.238" }× te breed is; het blok geeft beide impliciete rendementen uit in plaats van ze aan afleiding over te laten. Puur additief: gemeten over het gedocumenteerde werkpunt, { "597" } reeds bestaande bladen, <b>{ "0" } gewijzigd, { "0" } verwijderd, { "494" } toegevoegd</b>.

seg-3149d17a8ffa = <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/> en <c7/>, de openbare onderdelen erachter. Het patroon is nu ook verankerd aan de gepubliceerde Airy-constanten in plaats van alleen aan zichzelf: de halfvermogensovergang wordt door bisectie gelokaliseerd en vergeleken met <c8/>, wat de exacte halfvermogensbreedte <c9/> maakt en eerlijk vastlegt dat de conventionele coëfficiënt <c10/> <c11/> op <b>−{ "2.955" } dB</b> brengt, niet op −{ "3.010" } dB.

seg-bac7217bb128 = <b>Een langevormtabel voor reproduceerbaarheid voor <c1/>.</b> De array-uitvoer van het scenario — het raster van middelingstijden, de zeven <c2/>-curves per term en hun wortel-som-kwadraat-totaal — bereikte gebruikers alleen als JSON-arrays. Eén uitgebrachte tabel werd bij { "400" } tekens afgekapt en publiceerde { "23" } van zijn { "57" } middelingstijden onder een kolom die beweerde ze allemaal te bevatten, en het manuscript bouwde de curves per term opnieuw op uit gesloten vormen omdat de engine ze nooit uitgaf. Een gewone run schrijft nu ook <c3/> met één rij per (rasterindex, middelingstijd, term), wat niet kan worden afgekapt tot iets dat er nog heel uitziet. De rasterindex is een exacte joinsleutel; <c4/> wordt geschreven met { "13" } significante cijfers en elke <c5/> met { "7" }, zodat de bytes niet uiteenlopen tussen builds van dezelfde bron. Puur additief: de rapport-JSON is byte voor byte identiek.

seg-ab9209297ec2 = <b>Het rapport van <c1/> beschrijft zichzelf nu.</b> Een blok <c2/> herhaalt de opgeloste linkinvoer — draaggolflengte, zend- en ontvangapertuur, afstand, pulsbreedte, integratietijd, rendementen en verliezen — met toegepaste standaardwaarden, zodat een paper de configuratie vermeldt waarmee het draaide in plaats van een standaardwaarde aan te halen die uit de broncode is gelezen. Een blok <c3/> geeft de eenheid en herkomstklasse van elke grootheid die een paper waarschijnlijk citeert. De sporen van de covariantie bij overdracht zijn de reden dat het bestaat: ze werden uitgegeven als kale <c4/> en een manuscript leidde vierkante meters af uit een interne consistentiecontrole. De afleiding klopte, en juist daarom was het een defect — niets had gevangen dat ze onjuist was. Puur additief: gemeten over vier configuraties, { "456" } reeds bestaande velden, <b>{ "0" } gewijzigd, { "0" } verwijderd, { "196" } toegevoegd</b>.

seg-5c810155300c = Een rij in de verificatiematrix voor de reproduceerbaarheidstabel van het tijdsbudget, eerlijk <c1/> / <b>MODELLED</b> — het totaal wordt gecontroleerd tegen de wortel-som-kwadraat van de termen in hetzelfde bestand, dat de eigen termdefinities van de engine deelt en daarom geen onafhankelijke referentie is. Samen voegen deze drie rijen toe. Het lopende totaal voor deze nog niet uitgebrachte sectie is <b>{ "168" } rijen — { "64" } VALIDATED, { "100" } MODELLED, { "4" } PARTNER</b>.

seg-ed290a85ab0e = <b>Het auteurschap van commits in de hele geschiedenis is nu één enkele identiteit, en twee gepubliceerde crates wijzen naar een commit die niet meer bestaat.</b> Op 2026-09-21 is de git-geschiedenis herschreven zodat elke menselijke commit is geschreven en gecommit door <c1/>. Eerder droeg ze drie spellingen van één persoon — { "688" } commits als <c2/>, { "34" } als <c3/> en { "94" } al canoniek. De ene commit van <c4/> is bewust als eigen auteur gelaten: het herlabelen van de afhankelijkheidsverhoging van een bot zou het auteurschap claimen van werk dat hier niemand deed.

seg-ec4e75f94462 = <b>Er is geen inhoud veranderd.</b> De herschrijving raakte alleen auteur- en committerheaders, en dat is controleerbaar in plaats van beweerd: de boom van elke tag en elke branch is bit-identiek aan wat hij eerder was. <c1/> wordt nog steeds opgelost tot boom <c2/>, precies zoals voorheen.

seg-bc0f4fa0a009 = <b>Wat het kostte.</b> De naam van een commit is een hash over zijn boom, zijn ouders en zijn auteurheaders, dus het wijzigen van een voorouder hernoemt elke afstammeling. De releasecommit van <c1/> was <c2/> en is nu <c3/>. Twee artefacten legden de oude naam vast bij het publiceren en kunnen niet worden gecorrigeerd, omdat een gepubliceerde registerversie van nature onveranderlijk is:

seg-52e096332738 = <c1/> { "0.26.0" } op crates.io — <c2/> legt <c3/> vast

seg-8ec39d2f136c = <c1/> { "0.26.0" } op crates.io — dezelfde sha1, <c2/>

seg-9a21b7c7b41c = Niets anders wordt geraakt. Het npm-pakket legt geen <c1/> vast, en de PyPI-distributie legt helemaal geen commit vast; beide zijn gecontroleerd in plaats van aangenomen.

seg-9c51c5fb0d80 = Er is geen herstel waardoor <c1/> de herschreven commit noemt: die string <em>is</em> de oude voorgeschiedenis, en de enige manier waarop ze wordt opgelost is de geschiedenis van vóór de herschrijving gepubliceerd te houden, wat het auteurschap zou herstellen dat de herschrijving verwijderde. De herkomst van { "0.26.0" } loopt daarom via de tag in plaats van via de vastgelegde sha1 — en de tag levert dezelfde bytes waaruit de crate is gebouwd. De volgende release legt een geldige commit vast zonder dat actie nodig is.

seg-30ecea86118a = <b><c1/> gebruikte standaard een EOP-bestand zonder voorspellingsrijen (G12).</b> Het scenario bevatte een uittreksel van vijf rijen <em>alleen definitief</em> uit <c2/> als offline standaardwaarde, dus een kale run rapporteerde <c3/> en de tabel per horizon rustte op paren van { "5" }, { "4" }, { "3" } en { "2" }. De engine kon altijd een voorspellingsrij lezen — de invoer had er simpelweg geen. De standaardwaarde is nu het letterlijke IERS-uittreksel van { "2026" } (<c4/>, MJD { "61173" }–{ "61204" }): { "20" } definitieven van Bulletin B en <b>{ "12" } rijen van Bulletin A met alleen voorspellingen</b>, zodat een kale run zonder bestandsargument en zonder netwerk <c5/> rapporteert en een tabel per horizon bij n = { "20" } / { "31" } / { "30" } / { "29" }, en ook de vergelijking met de operationele voorspeller en de overeenstemming met de eigen gepubliceerde voorspellingen van het product worden gevuld. Het langere uittreksel van 45 rijen is als alternatief gemeten en verworpen: ook dat is alleen definitief, dus <c6/> was op { "0" } gebleven. <b>Dit verplaatst gepubliceerde getallen</b>, onder regel R4 en met toestemming van de oprichter: tien van de { "22" } cellen van de uitgebrachte <c7/> en { "24" } van de { "42" } gevulde cellen van <c8/>. De gemeten pooldrempel voor snel-min-definitief wordt { "0.0678" } mas (van { "0.0769" } mas), wat de waarde is die de eigen poolbewegingstabel van paper P4 al publiceert bij n = { "20" } — de twee komen nu overeen in plaats van { "13.5" } % te verschillen. Elk ander cijfer dat P4 uit deze tabel afdrukt is op de afgedrukte precisie ongewijzigd. De volledige opsomming oud → nieuw, inclusief de velden die <em>niet</em> veranderden, staat in <a1><c9/></a1>. Het uittreksel met alleen definitieve waarden blijft meegeleverd, byte voor byte vastgepind en in gebruik: een aantal van nul voorspellingsrijen daarop is de eigenschap van het bestand, en een test bewijst dat nog steeds.

seg-17fbc566dc5b = <b>Een verouderde begrenzing van het aantal satellieten in <c1/>.</b> Het scenario begrensde <c2/> op { "12" } hoewel de eigen constellatiebouwer { "24" } ondersteunt en een test { "24" } afdwingt, zodat elk gevraagd aantal boven { "12" } stilzwijgend werd verlaagd en een sweep over het aantal satellieten boven { "12" } identieke waarden teruggaf — niet te onderscheiden van echte geometrische verzadiging. Nu begrensd op de limiet van de bouwer. Dit is alleen voor <c3/> een gedragswijziging.

seg-4df7d4d61b40 = Dezelfde verouderde begrenzing in <c1/>.

seg-8adfbd27c4f8 = <c1/> begrensde <c2/> op { "12" } met hetzelfde gevolg, en deze bereikte een gepubliceerde tabel: <c3/> bevat een rij <c4/> die byte voor byte identiek is aan zijn rij <c5/>, omdat de engine een antwoord met twaalf satellieten teruggaf onder een label van zestien satellieten. Nu begrensd op de limiet van de bouwer van { "24" }, en een nieuwe test pint het vast — elke grotere constellatie moet zowel haar eigen aantal rapporteren als het beschermingsniveau strikt verbeteren, zodat de begrenzing niet ongemerkt kan terugkeren. <b>Dit verplaatst gepubliceerde getallen</b>: het beschermingsniveau bij <c6/> wordt { "16.92" } m → { "14.57" } m. Doorgesweept tot { "24" } is de curve strikt monotoon ({ "11.94" } m bij { "24" } satellieten, { "29.5" } % beter dan bij { "12" }), dus er is geen verzadiging bij { "12" } — het ogenschijnlijke plateau was de begrenzing. Gedragswijziging alleen voor <c7/>.

seg-ebee158b73c8 = Een release voor documentatie, transparantie en playground. Er verandert geen enginegedrag: de verificatiematrix staat op <b>{ "102" } rijen — { "56" } VALIDATED, { "42" } MODELLED, { "4" } PARTNER</b>, ongewijzigd ten opzichte van { "0.25.0" }.

seg-7af422ed6d89 = <b>Rustdoc op het niveau van de crate</b> (<c1/> in <c2/>) die de toegangspunten, het model van eerlijkheid en niveaus en de reproduceerbaarheid beschrijft, zodat docs.rs opent op een echte landingspagina in plaats van een kale muur van modules.

seg-dd44c25f3af5 = <b><c1/></b> — een referentie per soort voor alle <c2/> scenariosoorten, gegenereerd uit <c3/> (de enige bron van waarheid) door <c4/> en bewaakt door <c5/>, zodat ze niet kan afwijken van de dispatcher.

seg-e2cc77d3b413 = <b>Moduledocs</b> voor de { "11" } eerder ongedocumenteerde openbare modules (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>).

seg-8d156713799d = <b>Literatuurbronnen</b> voor vijf formulemodules die een vergelijking vermeldden maar geen referentie noemden: <c1/> (Tapley/Schutz/Born; Bjorck), <c2/> (Szebehely; Koon et al.), <c3/> (Kay), <c4/> (Wertz; Sidi), <c5/> (Allen-Eggers, NACA TR-1381).

seg-832b4bfbc48a = <b>Een gepubliceerde <c1/></b> op kshana.dev voor gecoördineerde bekendmaking.

seg-30603f59e27d = <b>Validatieniveau per run in de playground.</b> De tabel met kwaliteitsmaten van één run bevat nu een label VALIDATED/MODELLED per cijfer, gelezen uit dezelfde opzoeking <c1/> die het downloadbare rapport gebruikt (die <c2/> spiegelt, zelf afgeleid uit de verificatiematrix), zodat het niveau naast een live getal nooit kan afwijken van het register.

seg-93b203f3a1c0 = <b><c1/></b> in het playground-menu — alle { "50" } te dispatchen soorten zijn nu één klik weg (was 49/50).

seg-1ec0830db404 = <b>Vijf extra uitvoerbare mogelijkhedenkaarten</b> (ruimteweer, evaluatie van RF-verstoringen, veerkracht, CCSDS OEM-interoperabiliteit, KIF), waarmee het aantal uitvoerbare kaarten van { "11" } naar { "16" } gaat. Kaarten die alleen API of bibliotheek zijn, houden een eerlijke link naar de documentatie in plaats van een nepknop voor uitvoeren.

seg-977ea074dd9d = De documentatiedekking wordt nu in CI als ratel bewaakt.

seg-beb308bcaafb = <c1/> compileert de bibliotheek met <c2/>, telt de waarschuwingen en faalt alleen als het aantal boven een vastgepind maximum ({ "986" }) komt. Een harde <c3/> onder <c4/> had ~{ "1000" } op dit moment ongedocumenteerde openbare items veranderd in een build-onderbreking van de ene op de andere dag; zo laten nieuwe ongedocumenteerde openbare items de build falen terwijl de bestaande achterstand bewust wordt afgelost.

seg-27668072a608 = <b>De rij voor de MCP-tool <c1/> adverteerde “~{ "17" } built-in scenario kinds”</b> terwijl <c2/> al enige tijd { "50" } had blootgesteld — een voor agents bedoeld document dat de werkelijke mogelijkheden driemaal onderschat. Vastgepind op het ware aantal.

seg-1ffc9f9816e8 = De referentie voor de formaatcontrole van de CycloneDX-SBOM is opnieuw gegenereerd voor de bijgewerkte afhankelijkheidsgraaf ({ "60" } componenten). Het oordeel van de formaatcontrole is ongewijzigd: nul genormaliseerde schemafouten en elke afzonderlijke licentie-id staat nog steeds in de officiële SPDX-opsomming.

seg-a6db590bbcbe = <b>Vijf mogelijkheden bevorderd tot extern VALIDATED</b>, elk nu kruiselings gecontroleerd tegen een onafhankelijke implementatie door een derde van dezelfde eenduidig gedefinieerde grootheid (niet-circulair, met offline regenereerbare fixtures):

seg-98588143b4bb = <b>Conversie van IEEE-1139-machtswet → Allan-deviatie</b> tegen de gesloten vormen van <c1/> voor alle vijf ruistypen (<c2/>);

seg-ce37d70fa8bc = <b>Gewichten van de CRPA MVDR- / minimum-norm-nulsturingsbundelvormer</b> tegen numpy/scipy LAPACK (<c1/>);

seg-0f033d1027f8 = <b>Standbepaling met Wahba / TRIAD / QUEST</b> tegen de SVD <c1/> van SciPy op ruisvrije waarnemingen (<c2/>);

seg-e1e2283cb524 = <b>Uitwisseling van OEM-covariantieblokken volgens CCSDS { "502.0" }</b>, heen en terug gevoerd door de parser van de onafhankelijke bibliotheek <c1/> (<c2/>);

seg-579eefbb646f = de <b>detectiestatistiekkernel voor kwadratische-wet-acquisitie</b> (gegeneraliseerde Marcum-Q / P_d / P_fa / drempel) tegen SciPy <c1/>/<c2/> (<c3/>). De machinaal gecontroleerde validatiematrix gaat naar <b>{ "56" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> over <b>{ "102" } rijen</b> (was { "51" } · { "47" } · { "4" }). Eerlijke kanttekeningen over de reikwijdte blijven behouden — bijv. de bevordering van acquisitie betreft alleen de detectiestatistiekkernel; CFAR/straddling-verlies blijft MODELLED.

seg-b6a140d55580 = <b>Kwaliteitsmaten in het positiedomein</b> (<c1/>): exacte CEP, SEP en 2DRMS uit de 3D-ENU-positiecovariantie van een navigatieoplossing plus een horizontaal beschermingsniveau. CEP/SEP zijn de <em>exacte</em> mediane radiale fouten (niet de lineaire regel <c2/>), kruiselings gecontroleerd tegen de rayleigh/maxwell-kwantielen van <c3/> en een onafhankelijke NumPy-Monte-Carlo-mediaan (<c4/>). Vervangt de vorige eerlijke stub zonder implementatie — <b>de functiesignatuur is gewijzigd</b> van <c5/> die een fout teruggeeft naar <c6/> die een <c7/> teruggeeft.

seg-1551afa17154 = <b>Equivalente vrijheidsgraden (EDF) voor betrouwbaarheidsintervallen zijn voltooid voor alle schatters uit de Allan-familie</b> (<c1/>): de EDF voor modified Allan, Hadamard en total variance gebruikt nu het gecombineerde EDF-algoritme van Greenhall & Riley en de TOTVAR-vorm uit Tabel 7 van NIST SP { "1065" } (eerder was alleen de EDF van overlappende Allan geïmplementeerd; de andere hergebruikten die stilzwijgend), kruiselings gecontroleerd tegen <c2/> <c3/>/<c4/> (<c5/>).

seg-39753e7919cc = <b>Onafhankelijke externe kruiscontroles voor de mogelijkheden voor geometrie, DOP, EOP, DRO en RF-afstandsmeting bij lunaire PNT</b> (<c1/>, met fixtures en oraclegeneratoren onder <c2/>). Elke controle laat een al meegeleverde <b>gemodelleerde</b> mogelijkheid tegen een referentie lopen die door een <em>andere</em> implementatie is geproduceerd, zodat overeenstemming niet-circulair is: de orbitale zend-/vangstvoetafdruk tegen <c3/> (Cephes — een werkelijk andere Bessel J1); de DOP van de geometrie van oppervlaktebakens tegen een onafhankelijke NumPy-oplossing van <c4/>; de groei van de voorspellingsfout van UT1/EOP-persistentie tegen een afzonderlijke NumPy-herparsing van dezelfde letterlijke IERS-rijen van <c5/>; de vlakke familie van distant retrograde orbits tegen de NASA/JPL Three-Body Periodic Orbit Database; en het budget voor RF-afstandsmetingsprecisie tegen een referentie uit eerste beginselen. Dit is aanvullend regressiebewijs voor bestaande modules; het toevoegen van deze kruiscontroletests labelt zelf geen enkele mogelijkheid om (de vijf bevorderingen hierboven zijn afzonderlijke, door een referentie ondersteunde statuswijzigingen in <c6/>).

seg-662c04f0552f = <b>Scenario <c1/></b> (<c2/>, <c3/>): een samengestelde, via binaries bereikbare (CLI / Python / MCP / wasm via <c4/>) lunaire P1-signaalbeveiligingsrun die het tekort aan vermogen in het linkbudget en zijn gevoeligheidsband van { "12" }–{ "18" } dB, het vereiste jam-/spoofzendvermogen versus standoff, de orbitale vangstvoetafdruk onder een echt antennepatroon, de uitkomst van de pull-in bij het vangen door spoofing van de trackinglus, het bereik tot de horizon van een lichaam zonder atmosfeer en het authenticatiebudget van OSNMA/TESLA aan elkaar rijgt. Een lege body reproduceert de P1-basislijn.

seg-a9b7ee942a23 = <b>Gevoeligheidsband van het vermogenstekort</b> (<c1/>, <c2/>): een echte sweep over meerdere assen (referentie × EIRP × schuine afstand) gebouwd op <c3/> en geëvalueerd via <c4/>, die de P1-band van { "12" }–{ "18" } dB reproduceert en de lineaire factoren { "32" }× (afgerond) / { "36" }× (niet afgerond) met elkaar verzoent.

seg-0734a4ca7535 = <b>Driedimensionale spoof-vangstkubus</b> (<c1/>): voegt de as van carrier-/Doppler-offset toe aan de vangstkaart (J/S × code-offset × carrier-offset, lock-tijd per cel); de snede met nul carrier reduceert exact tot de 2D-<c2/>.

seg-3b9bbc25b114 = <b>Detectie door een schaars monitornetwerk</b> (<c1/>) combineert nu de fysieke AGC-statistiek van <c2/> en het selenografische zichtbaarheidsraster van <c3/> om de detectiestatistiek en geometrie van elk station af te leiden, in plaats van vrije parameters en een ad-hoc overlap langs een grootcirkel; de detectiekansen per monitor en voor het netwerk blijven de gesloten vormen van <c4/> met chi-kwadraat/Marcum-Q. <b>De velden <c5/> / <c6/> zijn gewijzigd</b> naar fysieke grootheden (lat/lon/hoogte/vermogen).

seg-54c36267382c = <b>Dimensionering van de authenticatieoverhead van OSNMA/TESLA</b> (<c1/>): de OSNMA-veldaandelen per pagina (8-bit HKROOT + 32-bit MACK per pagina van { "2" } s) waren verkeerd gelabeld als totalen per subframe, waardoor de overhead { "15" }× werd onderschat ({ "1.33" } bit/s). Gecorrigeerd naar de gepubliceerde totalen per subframe van 30 s uit de SIS-ICD (HKROOT { "120" } + MACK { "480" } bits ⇒ <b>{ "20" } bit/s</b>). Het gevolg wordt nu eerlijk vermeld: bij een navigatiesnelheid van { "50" } bit/s voor AFS is de authenticatieoverhead een kostenpost van <b>de eerste orde, ≈{ "40" } %</b>, niet een te verwaarlozen paar procent; het veld <c2/> is gedocumenteerd als de vertraging van de sleutelvrijgave (een ondergrens voor de end-to-end-tijd tot de eerste geauthenticeerde positiebepaling).

seg-0cf179a34252 = Een brede release van mogelijkheden. Ze brengt twee volledig <b>extern getoetste</b> analysesuites — een complete familie voor <b>multicriteria-beslissingsanalyse (MCDA)</b> en de schatters voor <b>Allan-wander en klokstabiliteit bij lange τ</b> — en opent een nieuwe uitvoerbare scenariolaag voor <b>lunair tijdsbudget, real-time frame/EOP, optisch/RF-hybride, cislunaire waarneembaarheid en veerkracht van gelaagde PNT bij conflict</b> bovenop het substraat, plus een substraat van mogelijkheden voor <b>lunaire oppervlaktebakens</b> en <b>signaalbeveiliging</b>. De machinaal gecontroleerde validatiematrix groeit tot <b>{ "51" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> over <b>{ "102" } rijen</b> (was { "40" } · { "47" } · { "4" } over { "91" }): alle elf nieuwe rijen zijn validaties tegen een externe referentie van de beslissingsanalyse- en tijdsschatters, gecontroleerd tegen onafhankelijke bibliotheken (SciPy, pymcdm, pyDecision, allantools) met een nauwe tolerantie, terwijl het nieuwe PNT-oppervlak eerlijk als MODELLED wordt getoond. Zoals altijd wordt geen numerieke modelclaim opgewaardeerd zonder externe dataset erachter.

seg-267e50f8dd56 = <b>Uitvoerbare scenario's</b> — elk een geregistreerd scenario <c1/>, via de engine gedispatcht en end-to-end bewezen door CI via <c2/> (die elke meegeleverde <c3/> draait en hard faalt bij elke niet-uitvoerbare fixture):

seg-c87fc11dd86b = <b>Veerkracht van gelaagde PNT bij conflict</b> (<c1/>, <c2/>) — een Monte-Carlo-engine met seed voor een PNT-architectuur met meerdere lagen, met een model van <b>overleving bij geleidelijke degradatie per vector</b> volgens §{ "4.2" } (vier genoemde dreigingsvectoren, de gesloten vorm voor overleving van bruikbare PNT waartoe de Monte-Carlo per laag convergeert, uitgegeven in de resultaat-JSON) en gedocumenteerde, tegen afwijking bewaakte herkomst van dreigingsparameters (<c3/>). Architecturen zijn MODELLED; de convergentie van de overlevings-Monte-Carlo → gesloten vorm is de getoetste kern.

seg-9c69e4d8ade9 = <b>Cislunaire waarneembaarheid</b> (<c1/>, <c2/>) — een eigenspectrum van de waarneembaarheids-Gramiaan over een boog, een door differentiële correctie verkregen seeder voor distant retrograde orbits (DRO), en een onafhankelijke kruiscontrole met een square-root-informatiefilter waarvan de posterior-covariantie precies bij volledige waarneembare rang eindig wordt. De constellatie is MODELLED; de invarianten van rang/Gramiaan/STM/SRIF zijn de getoetste kern.

seg-92fb333483e5 = <b>Heterogene optische/RF-hybride continuïteit en integriteit</b> (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>) — beschikbaarheid en integriteit over domeinen heen wanneer optische en RF-PNT worden gecombineerd. MODELLED.

seg-08e2f640ae14 = <b>Endogeen lunair tijdsbudget</b> (<c1/>, <c2/>) en <b>real-time frame- / EOP-budget</b> (<c3/>, <c4/>, <c5/>) — de lunaire tijds- en aardoriëntatiebudgetten van P3/P4, endogeen afgeleid uit de tijdsynchronisatieketen in plaats van beweerd. MODELLED.

seg-52c2f9c2c9a7 = <b>Extern getoetste analysesuites</b> — bibliotheekmogelijkheden, die elk als nieuwe VALIDATED-rijen in de matrix komen (gecontroleerd tegen een onafhankelijke externe referentie, geen zelfcontrole):

seg-709789e8fb04 = <b>Volledige suite voor multicriteria-beslissingsanalyse (MCDA)</b> (<c1/>) — de vier methodefamilies: waardeaggregatie (<b>WSM</b>, <b>WPM</b>, <b>WASPAS</b>), ratiosysteem (<b>MOORA</b>) en proportioneel (<b>COPRAS</b>), afstand tot het ideaal (<b>TOPSIS</b>), compromisprogrammering (<b>VIKOR</b>) en outranking (<b>PROMETHEE II</b> met zes gegeneraliseerde criteriumvormen, <b>ELECTRE I</b> concordantie/discordantie) — plus <b>AHP</b>-prioriteitsgewichten uit de Perron-eigenvector met de poort voor de Saaty-consistentieratio (CR < { "0.10" }), <b>MAUT</b>-nut, extractie van het Pareto-front en <b>gevoeligheids</b>analyse van gewichten. De negen aggregators reproduceren <b>pymcdm</b> / <b>pyDecision</b> en de AHP-eigenvector komt overeen met SciPy/LAPACK, alles tot < { "1e-9" } (<c2/>). De gevoeligheidstornado wordt ook getoond binnen het veerkrachtscenario voor conflict.

seg-2ce49cbfd8bf = <b>Schatters voor Allan-wander en klokstabiliteit bij lange τ</b> (<c1/>) — <b>MTIE</b> (de piek-tot-piek-wanderstatistiek van de tijdsfout waartegen ITU-T G.810/G.823/G.8261-synchronisatiemaskers zijn geschreven), <b>MDEV</b> en <b>TDEV</b> als wander in het tijdsdomein, en <b>Theo1 / TOTVAR</b> als schatters met uitgebreid bereik. VALIDATED tegen <b>allantools</b> op de reeks van NIST SP { "1065" }; de van bias ontdane hybride <b>ThéoH</b> gebouwd op TOTVAR blijft eerlijk MODELLED.

seg-68bcdf8bd5de = <b>Harnas voor zekerheid / externe referentie</b> (<c1/>) — een referentieharnas dat rechtstreeks aan de CI-eerlijkheidspoort is gekoppeld, een herkomstrecord volgens <b>W3C-PROV</b> met een deterministische Merkle-wortel, en <b>Greenhall</b> equivalente vrijheidsgraden + chi-kwadraat-betrouwbaarheidsintervallen op stabiliteitsschatters.

seg-dcb91813b24c = <b>PackRegistry / ExternalPack-uitbreidingsnaad</b> (<c1/>, <c2/>) — een dispatchnaad zodat mogelijkheidspakketten via één register lopen (de ingebouwde dispatch ligt op het hete pad van de CLI; pakketten buiten de boom hechten zich erachter aan een <c3/> met standaardwaarde), bewaakt door een golden-suite voor byte-identiteit en standalone / wasm32 CI-poorten.

seg-16b1f5d249ed = <b>Substraat van gemodelleerde mogelijkheden</b> — nieuwe bibliotheekmodules die de scenario's hierboven voeden en toekomstige (nog geen op zichzelf staand scenario <c1/>):

seg-f8c9ffbc56cf = <b>DOP van lunaire oppervlaktebakens</b> (<c1/>) met een budget voor gerealiseerde nauwkeurigheid, een sweep over N satellieten en een GDOP-kaart, plus een verstoorde lunaire efemeride (<c2/>) en geometrie van de horizon zonder atmosfeer / inverse van spoofvermogen / band van het AFS-tekort (<c3/>, <c4/>). Hergebruikt de door gnss_lib_py getoetste DOP-kernel.

seg-28209a2747d5 = <b>Inlezen van DEM in LOLA-formaat</b> + zichtlijn over terrein (<c1/>).

seg-6e98ac90a0e2 = <b>Driedelige verdediging voor signaalbeveiliging</b> — spoof-vangst, kruissensorintegriteit en dimensionering van het monitornetwerk (<c1/>, <c2/>, <c3/>) met een antennevoetafdruk van de orbitale bundel en een OSNMA-authenticatiebudget (<c4/>, <c5/>). MODELLED.

seg-bd5b9511accb = De validatiematrix en elk afgeleid artefact zijn opnieuw gegenereerd uit de enige bron van waarheid (<c1/>): het register op de site, de diagrammen van modulekaart en validatieherkomst, en de tellingstrings in de README en per oppervlak geven nu <b>{ "51" } / { "47" } / { "4" } van { "102" }</b> (was { "40" } / { "47" } / { "4" } van { "91" }); de bewaker voor eerlijke tellingen scant nu de volledige git-geschiedenis, en de README-figuren zijn verenigd op het donkere merkpalet.

seg-c2ec7e2b6296 = Eén gedeelde adaptieve integratiedriver ondersteunt nu zowel <c1/> als <c2/> (<c3/>), waarmee de gedupliceerde stapper verdwijnt.

seg-85cfb0f10268 = Statische analyse met <b>SonarQube Cloud</b> aan CI toegevoegd (Rust + geïmporteerde dekking), met badges voor beveiliging / onderhoudbaarheid / betrouwbaarheid in de README.

seg-deeef8318367 = Discipline voor release en verpakking: CI registreert per publicatie van een pakket/register een deploymentomgeving, en de gerichte openbare standalone-job is losgekoppeld van de trage validatiebinaries.

seg-30181148b098 = De hygiënebewaker voor niet-vermelding is beperkt tot alleen markeringen van auteurschap, zodat het noemen van een integratiehost of product de build niet meer laat falen.

seg-6eb3868fdce0 = Documentatie: de sectie <b>Citing</b> van de README somt nu de vier gepubliceerde arXiv-preprints op, en de mogelijkheid van de DOP van oppervlaktebakens is gedocumenteerd in de lunaire rij.

seg-d12533cbf1f2 = Integer-lustellers voor lussen die door floats worden aangestuurd (Sonar S2193).

seg-3c213354187f = Nauwkeurige inverse van chi-kwadraat bij weinig vrijheidsgraden via Newton-verfijning in het pad van het betrouwbaarheidsinterval voor zekerheid.

seg-386b7094d34d = kshana.dev: de sectie met standaarden opent nu standaard en de terugvalwaarde voor het aantal in het register is gecorrigeerd; verouderde strings in README en site rond de waarneembaarheidslaag zijn gesynchroniseerd.

seg-33448f46894f = Een release van mogelijkheden die een algemene laag voor <b>Fisher-informatie / Cramér–Rao-waarneembaarheid en optimaal experimentontwerp</b> toevoegt, en de release waarop het paper over lunaire PNT-waarneembaarheid rust. De machinaal gecontroleerde validatiematrix groeit tot <b>{ "40" } VALIDATED · { "47" } MODELLED · { "4" } PARTNER</b> over <b>{ "91" } rijen</b> (was { "39" } · { "46" } · { "4" } over { "89" }): de nieuwe schattingsengine is gecontroleerd tegen een externe referentie en is VALIDATED; de lunaire toepassing ervan is eerlijk MODELLED. Zoals altijd wordt geen numerieke modelclaim opgewaardeerd zonder externe dataset erachter.

seg-c377207026f4 = <b><c1/> — Fisher-informatie, Cramér–Rao-grenzen en optimaal experimentontwerp.</b> Een algemene, herbruikbare engine voor schattingstheorie: de Fisher-informatiematrix <c2/> uit een meetjacobiaan en gewichten; een symmetrische eigenwaardeoplosser (cyclische Jacobi); de Cramér–Rao-ondergrens via de inverse, of de Moore–Penrose-pseudo-inverse plus een basis van de nulruimte wanneer de informatie rangdeficiënt is (het geval van vrij netwerk / datumdefect); en D-, A-, E- en T-optimale metrieken voor experimentontwerp met een selector <c3/> over kandidaatgeometrieën. <b>VALIDATED</b> tegen NumPy (<c4/>/<c5/>) en de gepubliceerde gesloten-vormgrenzen van Kay ({ "1993" }) tot { "1e-9" } (<c6/>), zodat het als rij met een externe referentie in de matrix komt in plaats van als zelfcontrole.

seg-91d09b4e737f = <b>Waarneembaarheid van lunaire gezamenlijke baanbepaling</b> (<c1/> in <c2/>, getoond in het rapport over lunaire combinaties): past de FIM/CRLB-engine toe op de gezamenlijke oplossing van baan en klok om het datumdefect van het absolute station bloot te leggen, het herstel van de rang naarmate stations op Aardebasislijnen worden toegevoegd, de bereikte CRLB van de stationspositie en de E-optimale conditionering. Eerlijk <b>MODELLED</b> — de schattingsengine is extern getoetst, maar het lunaire netwerk waarop ze wordt toegepast is een representatieve simulatie, en geen enkele huidige dataset kan die geometrie in een meting omzetten.

seg-6b1cd00aca8c = <b>Representatieve geometrie van de elliptische bevroren lunaire baan (ELFO)</b> voor het scenario voor lunaire combinaties (<c1/>, <c2/>, <c3/>, <c4/>; cirkelvormige plaatsing blijft de standaard) en een veld voor waarneembaarheid zonder VLBI in het rapport, zodat kan worden getoond dat het resultaat van het datumdefect voor elke geometrie geldt. Dezelfde ladder { "3" }→{ "1" }→{ "0" } en drempel van drie stations gelden op een ELFO uit de familie Moonlight/LCNS, en met drie VLBI-basislijnen op Aarde is de absolute stationspositie waarneembaar met een grens onder een meter — vastgelegd door <c5/>. Nog steeds MODELLED.

seg-9e6627c0c417 = De validatiematrix en elk gegenereerd bewijsartefact zijn opnieuw gegenereerd uit de enige bron van waarheid (<c1/>): het register (<c2/>), <c3/>, <c4/>, de figuren voor validatie-uitsplitsing en soort referentie, en de tellingstrings in de README op alle distributieoppervlakken geven nu <b>{ "40" } / { "47" } / { "4" } van { "91" }</b>.

seg-6f90233290a2 = Een patchrelease die alleen verpakking betreft. Geen wijzigingen in engine, scenario of resultaten; de validatiematrix is ongewijzigd op { "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER over { "89" } rijen.

seg-9d41e1412d1f = npm-publicatie: het pakket <c1/> dat uit het cratemanifest was afgeleid, gebruikte de GitHub-eigenaar met verkeerde hoofdletters (<c2/>), waardoor de sigstore-herkomstverificatie van npm faalde (die vergelijkt de eigenaar hoofdlettergevoelig). Het manifest <c3/> is nu de canonieke kleine letters <c4/>, zodat de gegenereerde <c5/> overeenkomt met het onderwerp van de herkomst en de npm-release wordt gepubliceerd.

seg-fe1f8aae99f4 = De wheel-build pint <c1/> vast zodat het manylinux-wheel byte-reproduceerbaar is over herbouwingen heen (de reproduceerbaarheidscontrole door herbouwen en vergelijken).

seg-b87075b47007 = Een consolidatierelease gericht op <b>bewijs, herkomst en distributiediscipline</b>. De machinaal gecontroleerde validatiematrix groeit tot <b>{ "39" } VALIDATED · { "46" } MODELLED · { "4" } PARTNER</b> over zijn <b>{ "89" } rijen</b> (was { "15" } · { "42" } · { "4" } over { "61" }), aangedreven door kruisvalidatie van gemodelleerde mogelijkheden tegen onafhankelijke externe referenties. Elk gedistribueerd artefact draagt nu een cryptografische SLSA-attestatie van de buildherkomst, levert een CycloneDX-SBOM mee en wordt in gelijke pas over alle oppervlakken gepubliceerd. Geen numerieke modelclaim wordt opgewaardeerd zonder externe dataset erachter; nieuwe mogelijkheden blijven eerlijk MODELLED.

seg-f6de783bfd29 = <b>Standdynamica</b> (<c1/>, MODELLED) — vrije starre-lichaams-Euler-vergelijkingen zonder koppel + kwaternionkinematica (RK4), met zelftests op behoudswetten (kwaternionnorm, kinetische energie, |Iω|, precessie van een symmetrische tol).

seg-339bc18b9fc4 = <b>Kruisvalidatie van gemodelleerde mogelijkheden</b> tegen onafhankelijke externe referenties, waarmee de validatiematrix op { "39" } VALIDATED-rijen komt, elk gedekt door een externe dataset (de CI-eerlijkheidspoort verbiedt een status VALIDATED zonder dataset). De nieuwste validaties tegen een externe referentie: de <b>gemeten stabiliteitscurve van de optische klok</b> (de ADEV-curvefit van <c1/> reproduceert de gepubliceerde σ_y(τ) van de ⁸⁸Sr-optische-roosterklok van Norcia et al., <em>Science</em> { "366" }:{ "93" } ({ "2019" }), Zenodo 10.5281/zenodo.3382347, CC-BY-4.0, meegeleverd onder <c2/>); <b>generatie van de GPS L1 C/A-spreidingscode</b> (de G1/G2-LFSR van <c3/> reproduceert de octalen van de codefase uit Tabel 3-Ia van IS-GPS-200 voor PRN { "1" }–{ "9" }); en de <b>SRTM-lezer voor digitale hoogtemodellen op echt terrein</b> (<c4/> leest een meegeleverde SRTM v3-tegel van NASA/USGS in het publieke domein, N36W117 / Death Valley, en plaatst Badwater Basin binnen zijn gedocumenteerde meetband).

seg-665d0dde637b = <b>Nieuwe MODELLED-mogelijkheden</b>, elk intern kruiselings gecontroleerd tegen een gesloten vorm of een zusterpad in de code: relatieve bewegingsdynamica van Clohessy–Wiltshire / Hill, passieve geolocatie van zenders met TDOA/FDOA, standbepaling met Wahba/TRIAD/QUEST, geheeltallige ambiguïteitsoplossing van de draaggolffase bij GNSS (LAMBDA), B-plane-sturing en patched-conic-zwaartekrachtassistentie, bundelvorming met CRPA-arrays tegen jamming, acquisitiestatistieken met kwadratische wet voor GNSS, franjeambiguïteit / dynamisch bereik van kwantum-inertiaalsensoren, machtswetruis van klokken volgens IEEE-1139 + flicker-FM-vloer, en uitwisseling van CCSDS-OEM-covariantieblokken.

seg-b3f53d5e3c3a = <b>Register van bewijs uit één bron</b> met gegenereerde verificatiedocumenten en een bewaker tegen afwijking; een doorbladerbaar validatieregister op kshana.dev met directe links naar het bewijs per kaart.

seg-b3c0545157b3 = <b>Machineleesbare citatiemetadata</b> — <c1/> (CodeMeta { "2.0" }) en <c2/>, door <c3/> vastgepind aan het Cargo-manifest.

seg-2ca8875da9de = <b>Herkomst van de toeleveringsketen</b> — SLSA-attestatie van de buildherkomst voor de crate-tarball, wheels, sdist en npm-tarball; Trusted Publishing van PyPI via OIDC; CycloneDX-SBOM meegeleverd in het wheel en het npm-pakket; diff van reproduceerbare builds en verificatie na de release.

seg-18fdecf7f2fa = <b>Vindbaarheid</b> — <c1/>, <c2/> en Open Graph / JSON-LD-metadata op kshana.dev; een gegenereerde figuur <c3/> afgeleid uit de matrix.

seg-f80db0b0f545 = <b>README's per oppervlak</b> voor crates.io / PyPI / npm met een bewaker voor eerlijke tellingen.

seg-bd33b21f8f91 = De referentie voor <b>Sagnac-tijdoverdracht</b> is opgewaardeerd naar ExternalDataset — de Sagnac-correctie voor een omloop om de evenaar wordt nu gecontroleerd tegen de door Ashby gepubliceerde { "207.4" } ns (<em>Living Reviews in Relativity</em> { "6" }:{ "1" }, { "2003" }, Vgl. { "1.29" }; gereproduceerd tot < { "0.05" } ns). De samengestelde mogelijkheid voor tijdoverdracht blijft eerlijk MODELLED.

seg-882133bf1fcc = <b>Documentatie, diagrammen en figuren vernieuwd</b> naar de live matrix (39/46/4/89): het diagram van de validatieherkomst, de figuur <c1/> (nu uit de matrix gegenereerd met een CI-bewaker tegen afwijking), VALIDATION/PROVENANCE/CAPABILITY/QUANTUM-MODELS/WHEEL_TAGS, de architectuur- en tutorialdocumenten en het totaal in het register op kshana.dev.

seg-a9be3d71a52c = De broncodeboom is opnieuw geformatteerd met de vastgepinde rustfmt (toolchain { "1.93.0" }) — puur stijl, geen gedragswijziging.

seg-4542eb4fabfc = <b>Versiebeheer in gelijke pas.</b> Elk distributieoppervlak (crate, PyPI, npm, MCP-crate + OCI-image, JetBrains-plugin) volgt nu de versies van de engine in gelijke pas, afgedwongen door <c1/> in CI.

seg-792df0cdc8a7 = <b>JetBrains-plugin</b> opnieuw gelicentieerd onder <b>AGPL-3.0-only</b> (de gepubliceerde { "0.1.1" } adverteerde nog Apache-2.0) en leidt zijn Marketplace-versie nu af van de releasetag.

seg-171f5649c90f = <b>Verharding van de robuustheid</b> — <c1/>-aanroepen buiten tests verwijderd of verantwoord; <c2/> afgedwongen op code buiten tests.

seg-0e5abb2fad02 = <b>kshana.dev</b> volledig vernieuwd met bewijs eerst: dominante hero, architectuurdiagrammen en resultaatfiguren, i18n, inklapbare/responsieve secties voor register en standaarden.

seg-05ef9b9f3653 = <b>SP3 precieze efemeride</b> — pas de IGS-correctie voor aardrotatie op de knooppunten toe tijdens interpolatie.

seg-bbd0dc3dd9cb = <b>Afbeeldingen in registers</b> — de README's van PyPI/crates.io/npm gebruiken absolute afbeeldings-URL's; de relatieve afbeeldingspaden van de hoofd-README werden als kapotte afbeeldingen weergegeven op de PyPI-pagina van { "0.21.0" }. Een CI-bewaker (<c1/>) voorkomt de regressie.

seg-6d044971dbc8 = <b>CI</b> — <c1/> + <c2/> groen; stop met compileren tegen echte data die door git wordt genegeerd.

seg-c3c260b7063e = Tests

seg-5dca3defcfe3 = De covariantie van de Kalman-klok blijft PSD en symmetrisch (eigenschapstest, <c1/>).

seg-c861779f04ca = Doc-sync-bewakers: elke openbare string met een validatietelling, de citatiemetadata, de gegenereerde figuur en de afbeeldings-URL's in README's per oppervlak zijn allemaal vastgepind aan hun bron van waarheid.

seg-0540044c92a6 = Deze release voegt twee MODELLED toepassingssuites toe aan de open engine — een <b>demonstrator voor Quantum-Enabled PNT</b> (vertrouwde kwantumtijdoverdracht, GNSS-vrije kwantumnavigatie, kwantumdetectie van fouten/afwijkingen) en een <b>suite voor lunaire / cislunaire PNT</b> (lunaire coördinatentijd, lunaire VLBI, gezamenlijke OD+klok, realisatie van het referentiestelsel, servicevolume, differentiële PNT, export voor interoperabiliteit) — elk uitvoerbaar vanuit één <c1/>, elk met een eerlijk record <c2/> plus een register van representativiteit / hiaten tot vlucht. Ze brengt ook <b>zes nieuwe validaties tegen een externe referentie</b>, waarmee de machinaal gecontroleerde validatiematrix op <b>{ "15" } VALIDATED · { "42" } MODELLED · { "4" } PARTNER</b> komt over zijn { "61" } rijen. De nieuwe toepassingscijfers zijn MODELLED uit illustratieve parameters uit openbare bronnen — geen TRL, geen vluchterfgoed, geen certificering of goedkeuring door een ruimtevaartagentschap — en de getoetste kernels die ze hergebruiken zijn als zodanig gelabeld.

seg-82a1822f53e2 = <b>Demonstratorsuite voor Quantum-Enabled PNT</b> (<c1/>, <c2/>, <c3/>). Drie uitvoerbare MODELLED toepassingsgebieden achter de engine, die elk <c4/> uitgeven plus een record van representativiteit / hiaten tot vlucht:

seg-07532f03a1f1 = <b>Vertrouwde kwantumtijdoverdracht</b> (<c1/>) — een budget voor optische-roosterklok + fotonische link versus CSAC + RF-tweewegverbinding, dat het beschermingsniveau voor tijdsynchronisatie hergebruikt, met een beveiligingskwaliteitsmaat voor vertragings-/replay-aanvallen ({ "1" } − P_md) en detectie van klokafwijkingen + CUSUM-latentie.

seg-4c9036cffe1b = <b>GNSS-vrije kwantumnavigatie</b> (<c1/>) — een inertiale coast met koude-atoominterferometer versus een INS van navigatiekwaliteit over een GNSS-uitval, eerlijk over het feit dat de bias van de versnellingsmeter zonder externe positiebepaling niet waarneembaar blijft, zodat de fout nog steeds groeit.

seg-6188f1c6893a = <b>Kwantumdetectie van fouten / afwijkingen</b> (<c1/>) — een gelabelde foutencatalogus met een ROC AUC met bootstrap-betrouwbaarheidsinterval en een minimaal detecteerbare fout bij een vaste kans op vals alarm.

seg-9e22314b1337 = Een gedeelde bibliotheek met foutmodellen van kwantumapparaten (<c1/>) en een uniform harnas voor de afweging kwantum-versus-klassiek (<c2/>) ondersteunen alle drie.

seg-808e20f28556 = <b>Suite voor lunaire / cislunaire PNT.</b> Zeven uitvoerbare MODELLED <c1/>-soorten, gelaagd op de CR3BP-kern: <b>Lunar Coordinate Time</b> (seculiere snelheid LTC/TCL − TT, <c2/>), geodetische <b>lunaire VLBI</b>-vertragingsobservabele (<c3/>), <b>gezamenlijke multitechniek-OD + klok</b>-batchschatter (<c4/>), <b>realisatie van het referentiestelsel</b> (Helmert met 7 parameters + IAU { "2015" } WGCCRE-koppeling, <c5/>), analyse van het <b>servicevolume van het type Moonlight / LCNS</b> (<c6/>), <b>lunaire differentiële PNT</b> (<c7/>) en een <b>export voor interoperabiliteit, afgestemd op LunaNet / IOAG</b> (CCSDS-OEM + lunaire tijdschaal in de KIF-envelop, <c8/>). Alles MODELLED uit illustratieve parameters uit openbare bronnen; niet getoetst aan echte VLBI- of Gateway-tracking; geen verbondenheid met of goedkeuring door een ruimtevaartagentschap.

seg-a892ce052e3c = <b>Zes nieuwe validaties tegen een externe referentie</b> (de validatiematrix staat nu op { "15" } getoetst):

seg-c30ae6767c6c = <b>ADEV / HDEV op een echte 5071A-caesiumklok</b> — getoetst aan decadepuntreferenties van Stable32 (<c1/>).

seg-dd0e2be52340 = <b>OADEV / MDEV / TDEV op de Stable32-referentie <c1/></b> — getoetst aan de gepubliceerde tabellen van Stable32 (<c2/>).

seg-e8728f57effa = <b>ROC AUC voor detectie van afwijkingen op echte telemetrie van ESA OPS-SAT</b> — getoetst aan scikit-learn (<c1/>).

seg-5446957ac631 = <b>Synthese van ICGEM-zwaartekrachtfunctionalen</b> — getoetst aan de GRS80-normaalzwaartekrachtstandaard (Somigliana γ tot { "3.5e-12" }; verstoringskaart van EGM2008, <c1/>).

seg-751c5ac90229 = <b>Klobuchar-ionosfeermodel uit de broadcast</b> — getoetst aan RTKLIB (<c1/>).

seg-dcc6d4e04a5c = <b>RAIM-detectiekernel</b> ({ "171" } gevallen, <c1/>) en het <b>SBAS DO-229E-beschermingsniveau</b> op echte EGNOS-data (RTKLIB SBAS-PL-fork, <c2/>) — beide getoetst aan hun externe referenties.

seg-3f6c1ff0b3a4 = <b>Register van representativiteit en hiaten tot vlucht</b> (<c1/>). Een gestructureerd record dat elke demonstrator uitgeeft — wat representatief is, wat vereenvoudigd is en wat er tussen het model en de vlucht staat — de eerlijke metgezel van elke MODELLED afweging.

seg-6b4c78bdaf35 = <b>Studie-aggregatie en ergonomie van de CLI.</b> Een manifest van een scenariosuite met studie-aggregatie in één opdracht, hash-stabiele studiemetadata + <c1/>, linting van scenario's met <c2/>, en weergave van het validatieniveau per kwaliteitsmaat in studierapporten.

seg-e24230b80a89 = <b>kshana.dev opnieuw ontworpen rond een gedeelde domeinruggengraat</b> — mogelijkheden en validatie samengevoegd in één domeinverkenner met een gemeenschappelijk vocabulaire, de nieuwe getoetste eilanden zichtbaar gemaakt, een landnauwkeurig geanimeerd Aardeinstrument en een CTA om een studie aan te vragen, en de branding/links van Ashforde OÜ.

seg-79b5ea5d1dd7 = <b>README + ARCHITECTURE gecontroleerd op volledigheid en eerlijkheid</b> — verouderde tellingen van getoetste items gecorrigeerd (nu { "15" } externe referenties), de diagrammen uitgebreid, en de preprints over het Conditional Timing Protection Level (arXiv:{ "2606.24210" }) en de optimismekloof bij RF-verstoringen (arXiv:{ "2606.22054" }) geciteerd.

seg-42a317c6ce06 = De bronnen in <c1/> en de pijplijn voor het JOSS-concept worden bewaard in de openbare repo.

seg-8ed5cf845b00 = Deze release voegt vier studiemogelijkheden toe aan de open engine — een voorwaardelijk Timing Protection Level, op raamwerken afgestemde scoring van PNT-veerkracht, een evaluatie van de optimismekloof bij RF-verstoringen en een front-end voor software-defined receivers / echte data — elk reproduceerbaar vanuit één opdracht en schrijvend naar een byte-deterministisch artefact. Alle studies zijn MODELLED (synthetische of kalibratie met een openbare dataset), dragen hun eerlijke herkomst (engineversie, seeds, confighash) en validatielabels, en zijn geen certificeringen.

seg-0c9f0c665491 = <b>Voorwaardelijk Timing Protection Level (<c1/>).</b> Een door holdover beperkte grens op de niet-gedetecteerde tijdsfout bij GNSS-spoofing, met een monitorondergrens van k sigma, een coastvariantie van van Loan over de detectielatentie en een CUSUM-tijd tot alarm. Gekalibreerd op een echte vastgelegde aanval (JammerTest { "2024" }, scenario { "2.1.1" }) via <c2/>, die zijn referentietabel reproduceert uit scalairen die zijn teruggewonnen uit de openbare opname (de ruwe dataset wordt niet herverspreid).

seg-d874d7f13f28 = <b>Op raamwerken afgestemde scoring van PNT-veerkracht + studie naar beslissingsinstabiliteit (<c1/>).</b> Architectuurmodel, scoring afgestemd op RPCF, Dirichlet-gewichtensimplex, Kendall-tau en top-1-flipfrequentie als instabiliteit, en instorting van diversiteit in gemeenschappelijke modus (Hill-N2), met <c2/>. Crosswalk in <a1><c3/></a1>.

seg-343f7af54503 = <b>Studie naar de optimismekloof bij RF-verstoringen (<c1/>, <c2/>, <c3/>).</b> Een panel van 13 detectoren over een synthetisch corpus met gegronde parameters, een optimismekloof tussen in- en out-of-distribution, schaalwettrends met een permutatienul, en een leave-one-out-voorspeller van degradatie, via <c4/>.

seg-6eed55859bbf = <b>Front-end voor software-defined receivers (<c1/>) en adapters voor echte data (<c2/>).</b> Ruwe IQ/IF tot correlatortaps en SQM, plus inleesadapters (RINEX, u-blox UBX, GnssLogger, JammerTest, Yunnan, SatGrid) en probe-voorbeelden. Deze lezen opnames die de gebruiker lokaal aanlevert; er worden geen opnames gecommit.

seg-afe2282fa771 = <b>Gecommitte studie-artefacten.</b> De byte-deterministische <c1/> en <c2/> worden nu bijgehouden onder <c3/> zodat de studiegetallen kunnen worden gecontroleerd zonder opnieuw te bouwen; ze blijven regenereerbaar uit de generatoren hierboven. Ruwe datasets blijven buiten de repo (<c4/>).

seg-450d82cddc28 = Versie verhoogd naar { "0.20.0" } in <c1/>, <c2/> en <c3/>; de artefacten van de crossover-studie zijn opnieuw gegenereerd zodat hun stempel overeenkomt met de uitgebrachte versie.

seg-a0a66af8fd14 = <b>Opnieuw gelicentieerd van Apache-2.0 naar de GNU AGPL-3.0-only, met een commerciële licentie beschikbaar bij Ashforde OÜ (dual-licensing).</b> De open engine blijft volledig open en openbaar verifieerbaar; de netwerk-copyleft van de AGPL (§{ "13" }) betekent dat een gesloten of gehoste afgeleide terug moet naar open source — of een commerciële licentie moet nemen. Dit beschermt de getoetste kern tegen fork-and-close en behoudt tegelijk de geloofwaardigheid van een openbare, uitvoerbare, controleerbare engine. Zie <a1><c1/></a1> (AGPL) en het nieuwe <a2><c2/></a2> (wat elke licentie dekt en wanneer ze van toepassing is).

seg-ffa799fdb814 = <c1/> bevat nu de AGPL-3.0-tekst; SPDX-headers in alle bronnen bijgewerkt naar <c2/>; <c3/>, <c4/>, <c5/>, <c6/>, de website en de metadata van crate/pakket (<c7/>, <c8/>, <c9/>, de MCP-crate + image) dienovereenkomstig bijgewerkt.

seg-8d67aba2af0b = <b>Bijdragevoorwaarden</b> (<a1><c1/></a1>) licentiëren inkomende bijdragen nu onder de AGPL <b>en</b> verlenen Ashforde OÜ het recht bijdragen op te nemen in de commercieel gelicentieerde editie, zodat de dual-licentie blijft werken.

seg-93644d1c1420 = <b>Afhankelijkhedenbeleid ongewijzigd maar opnieuw verantwoord</b> (<a1><c1/></a1>, <c2/>): afhankelijkheden blijven permissief (Apache/MIT/BSD/ISC). AGPL is alleen toegestaan voor de eigen crate van kshana — een copyleft-<em>afhankelijkheid</em> zou de commerciële editie besmetten en dual-licensing breken.

seg-9b77c2d36241 = <b>Let op voor downstream:</b> dit is een copyleft-herlicentiëring. Gebruikers die op de permissieve voorwaarden van Apache-2.0 vertrouwden, kunnen de laatste Apache-2.0-release blijven gebruiken (<c1/> en eerder, zoals gepubliceerd); vanaf <c2/> is het AGPL-3.0 / commercieel.

seg-51e32f15b7ea = <b><c1/> verhoogd van { "0.24" } → { "0.29" }</b> om RUSTSEC-2026-0176 / RUSTSEC-2026-0177 (GHSA-36hh-v3qg-5jq4 / GHSA-chgr-c6px-7xpp) uit externe OSV-/afhankelijkheidsscans te halen. Beide zijn <em>advisories op functieniveau</em> waarvan de getroffen functies (<c2/>/<c3/>, <c4/>) door Kshana nooit worden aangeroepen, en <c5/> is een optionele afhankelijkheid (feature <c6/>) — dus de werkelijke blootstelling was nul — maar de verhoging houdt de scan schoon voor downstream-auditors. <c7/> gemigreerd naar de pyo3-{ "0.29" }-API (Bound-retourtype voor <c8/>; expliciete <c9/> op de pyclass <c10/>). Alle { "11" } tests van de Python-binding slagen tegen de opnieuw gebouwde extensie.

seg-8d9332df5c74 = <b>Elf nieuwe uitvoerbare scenariosoorten — demonstrators met twee tenders, een CCSDS-interoperabiliteitsbrug en een suite voor missieanalyse / omgeving van de eerste orde (alle MODELLED, additief; bestaande reproduceerbaarheids-goldens ongewijzigd).</b> Elk is via CLI / Python / WASM / MCP te dispatchen, levert een <c1/> mee en draagt een expliciet label MODELLED in zijn resultaat-JSON en samenvattingsregel (een test per soort in <c2/> stelt vast dat het label aanwezig is en dat de uitvoer nooit de string <c3/> bevat):

seg-20b74caf58cc = <c1/> (<c2/>) — Testbank voor de evaluatie van detectie van RF-verstoringen met machine learning: een gelabeld <b>synthetisch</b> corpus + een detectoronafhankelijk <b>ROC/AUC</b>-harnas + een rapport over de <b>optimismekloof</b> tussen in- en out-of-distribution (alleen operationele kenmerken — nooit veld-/IQ-data).

seg-0253656a0ecf = <c1/> (<c2/>) — PNT-afweging kwantum-versus-klassiek met inlezen van gemeten ADEV en een veerkrachtenvelop voor GNSS-geweigerde omstandigheden.

seg-901bd713bd62 = <c1/> (<c2/>) — zonne-/geomagnetische indices (Kp↔ap IAGA-tabel, dagelijkse Ap, gecentreerde F10.7a over 81 dagen), exosferische temperatuur volgens <b>Jacchia-71</b> en een door activiteit aangestuurde koppeling van de thermosferische dichtheid over een statische atmosfeer (GEEN absoluut dichtheidsmodel van NRLMSISE).

seg-2323b43c0ffc = <c1/> (<c2/>) — <b>CCSDS { "502.0" } OEM</b>-import + round-trip-brug voor efemeriden van GMAT / Orekit / STK (de lezer <c3/>, exacte inverse van de schrijver).

seg-188aeb3e8219 = <c1/> (<c2/>) — <b>lanceerazimut</b> voor twee lichamen (<c3/>), Δv voor vlakwijziging, bonus van de rotatie van de locatie en geometrie van dagelijkse kansen.

seg-6200a47276e6 = <c1/> (<c2/>) — ballistische re-entrycorridor volgens <b>Allen-Eggers</b>: piekvertraging, snelheden bij piek-g en piekverhitting, hoogte bij piek-g.

seg-0874c2241748 = <c1/> (<c2/>) — EO-geometrie voor <b>zwad / GSD / toegang / revisit</b> (SMAD-ruimtedriehoek).

seg-83c7588ff074 = <c1/> (<c2/>) — <b>CCSDS 133.0-B Space Packet</b> primary-header coderen/decoderen met bitexacte round-trip.

seg-ae1bcad02880 = <c1/> (<c2/>) — 3-DOF <b>zwaartekrachtgradiëntkoppel</b> + <b>RSS-budget voor wijzfout</b> (scalair budget vóór hardware, geen regellus).

seg-65f59cc12e02 = <c1/> (<c2/>) — <b>voorspelling van op-/ondergangspassages</b> voor grondstations (AOS/TCA/LOS, maximale elevatie, toegang).

seg-178776497627 = <c1/> (<c2/>) — <b>CCSDS-401 / DSN-810-005</b>-linkvergelijking in één richting (<c3/>, FSPL / Eb·N₀ / marge / sluiting).

seg-e7fee32a00f5 = <b>Hybride kwantum + klassieke strak gekoppelde UKF met 17 toestanden — als uitvoerbaar scenario beschikbaar gemaakt (MODELLED).</b> Een nieuwe scenariosoort <c1/> (<c2/>, <c3/>) die het eerder alleen via de API beschikbare strak gekoppelde GNSS/INS-unscented-filter met 17 toestanden (<c4/>) verandert in een scenario dat de bindings voor CLI/Python/WASM/MCP kunnen dispatchen. De foutvector met 17 toestanden bestaat uit de <b>{ "15" } INS-foutstatussen</b> (positie, snelheid, standsfout, bias van versnellingsmeter + gyro), aangevuld met de <b>door CAI afgeleide correctie van de bias van de versnellingsmeter</b> — de koude-atoominterferometer (<c5/>) bepaalt de ondergrens van de snelheidsrandomwalk <c6/>, dus de langetermijndrift van de coast is die welke door de kwantumsensor wordt begrensd — en een <b>klok met 2 toestanden voor fase + frequentie</b> waarvan de procesruis komt uit de <b>q-parameter-klokengine</b> (<c7/>, die het Allan-deviatieprofiel van een klok afbeeldt op de PSD's <c8/>/<c9/>, geschaald naar afstandseenheden). Het platform wordt voor een aanloop door GNSS ondersteund (het filter leert de biassen, snelheid en klok), en coast dan door een GNSS-uitval op alleen de CAI-IMU + klok, dus de run toont <b>klassieke-IMU op korte termijn + kwantum op lange termijn</b> als hybridisering. De kwaliteitsmaat is de <b>zelfconsistentie van het filter</b>: gepoolde <b>NEES</b> (Normalised Estimation Error Squared, over de schatbare deelverzameling van positie/snelheid/klok) en <b>innovatie-witheid NIS</b> (Normalised Innovation Squared) over een Monte-Carlo-ensemble, gecontroleerd tegen hun χ²-banden van { "95" }% (Bar-Shalom §{ "5.4" }). Het afgestemde filter komt binnen de banden uit; een opzettelijk verkeerd afgesteld filter (de knoppen <c10/> / <c11/>) wordt gemarkeerd — een objectief controleerbare, onderscheidende poort, geen stempel zonder inhoud. <b>De controle op NEES/innovatie-witheid is de STATISTISCHE REFERENTIE: een uitspraak over zelfconsistentie (de gerapporteerde covariantie van het filter komt eerlijk overeen met de spreiding van zijn eigen fouten onder de gemodelleerde ruis), GEEN garantie voor nauwkeurigheid in de praktijk.</b> Eerlijke reikwijdte: alles is <b>gemodelleerd / simulatie</b> — de CAI- en klokinvoer zijn begrensde, representatieve waarden uit de literatuur, geen gemeten hardware; de CAI-hardware en de bijbehorende Key-Person blijven in handen van de partner; niets hier impliceert TRL > { "3" }, vluchterfgoed of externe validatie (de resultaat-JSON en de samenvattingsregel dragen deze labels expliciet). Het enkele traject met constante snelheid op gelijke hoogte laat de toestanden van stand en IMU-bias slechts zwak waarneembaar, dus NEES wordt beoordeeld over de { "8" } schatbare toestanden; een manoeuvrerend traject voor volledige waarneembaarheid van alle 17 staat op de roadmap. Voegt ook instrumentatie voor consistentie toe met <c12/> (geeft de NIS per update terug) en <c13/>. Alle bestaande scenario's blijven ongemoeid (additief; reproduceerbaarheids-goldens ongewijzigd).

seg-9b55f4ac5053 = <b>Sequentiële (recursieve) navigatie op basis van terreinreferentie — SITAN als lopend filter.</b> Een nieuwe scenariosoort <c1/> (<c2/>, <c3/>) die het bestaande meetmodel van hoogtemeter versus DEM <b>epoch voor epoch</b> door de SIR-engine <c4/> laat lopen, in plaats van de batchmatige grof-naar-fijn-zoekactie die <c5/> gebruikt om één <em>constante</em> INS-offset te herstellen. Bij elk waypoint wordt de wolk voortgeplant met de door de INS gerapporteerde toename (zelf bedorven door de groei van de drift per stap), opnieuw gewogen met de terreinovereenkomst en bij degeneratie opnieuw gesampled — zodat een <b>in de tijd variërende</b> INS-drift langs het spoor wordt <em>gevolgd</em>, wat een fit met een constante offset structureel niet kan. Op de synthetische DEM blijft de recursieve schatting begrensd en convergeert opnieuw (eindwaarde ≈ { "70" } m) terwijl de oplossing met alleen inertiaal onbegrensd divergeert tot ≈ { "5" } km; de fout per epoch volgt de onderscheidendheid van het terrein (ze coast op de beïnvloede INS over vlakke zadels en vergrendelt opnieuw boven onderscheidend reliëf), en de monitor van de effectieve steekproefgrootte bevestigt een gezonde wolk. Eerlijke reikwijdte: de kaart is <b>bekend en vast</b> — recursieve <em>lokalisatie</em> tegen een opgeslagen DEM (de lokalisatiehelft van terrein-SLAM), geen gezamenlijke kaartschatting; van nature niet-circulair (de ingevoerde driftramp is de onafhankelijke referentie). Alle bestaande scenario's blijven ongemoeid (additief; reproduceerbaarheids-goldens ongewijzigd).

seg-87ba3bc926fa = <b>Ruggengraat voor GNSS-geweigerde veerkracht + demonstratorsneden voor FutureNAV</b> (<c1/>, en fundamenten voor veerkrachtenveloppen onder <c2/>, <c3/>, <c4/>, <c5/>, met FutureNAV-verificatiesneden in <c6/>). Voegt de bouwstenen voor alternatieve PNT — klok-holdover, signaaltracking, inertiale coast, terrein — samen tot één verhaal over veerkracht bij GNSS-uitval. MODELLED; additief.

seg-071bb6654f24 = <b>Kshana Interchange Format (KIF) — een geversioneerde, zelfbeschrijvende artefactenvelop</b> (<c1/>). Een met een schema getagde wrapper rond scenarioresultaten zodat een opgeslagen artefact zijn soort, schemaversie en labels MODELLED/VALIDATED met zich meedraagt, en oudere enveloppen voorwaarts compatibel leesbaar blijven. Additief; bestaande resultaat-JSON ongewijzigd.

seg-07147766ab22 = <b>Modulatie / tracking van navigatiesignalen + CR3BP-differentiële corrector voor halo/NRHO</b> (<c1/>, <c2/>). Een model van de eerste orde voor modulatie en tracking van navigatiesignalen, en een differentiële corrector voor het circulaire beperkte driebodenprobleem voor halobanen / bijna-rechtlijnige halobanen, getoond op de bestaande as voor deep-space-mogelijkheden. MODELLED.

seg-d0d2366e3351 = <b>Evaluatiemodus voor distributieverschuiving + knop voor de ernstschaal van het corpus voor <c1/></b> (<c2/>). Voegt een expliciete splitsing in/out-of-distribution en een instelbare ernstschaal van het corpus toe aan het harnas voor de ROC/AUC-optimismekloof (alleen operationele kenmerken — nooit veld-/IQ-data).

seg-9bb8ee93e70b = <b>ROI van kosten per dekking + koppeling van gemiste detectie aan integriteitsimpact</b> (<c1/>, <c2/>). Een ROI-lens voor frugale engineering (kosten per eenheid dekking) en een koppeling van de frequentie van gemiste detecties aan de impact op integriteit. MODELLED; additief.

seg-55f8ba5b52ee = <b>Geciteerd parameterblad voor het foutmodel van de koude-atoominterferometer (CAI)</b> (<c1/>). Een met literatuur onderbouwd, begrensd parameterblad voor het inertiale CAI-model — de invoer is <b>geciteerd, geen gemeten hardware</b> (geen claim over TRL of vlucht); het voedt de ondergrens van de snelheidsrandomwalk van <c2/>.

seg-cfbff4acc64c = Projectbestuur.

seg-982f9ea3eee8 = <c1/> die het beslismodel en de grens tussen open en gesloten documenteert; de rij voor gemeenschap/bestuur in de mogelijkhedenkaart verschuift <c2/> om dit weer te geven.

seg-c9ff6a7183eb = <b>Beschermingsniveau voor ARAIM-integriteit — nominale bias (<c1/>) en σ_URA nu toegepast.</b> Het MHSS-beschermingsniveau trekt nu per foutmodus de eenzijdige projectie van de nominale bias <c2/> af, en gebruikt de <b>integriteits</b>-sigma σ_URA (onderscheiden van de <b>nauwkeurigheids</b>-sigma σ_URE) die in het Integrity Support Message wordt meegegeven. Dit maakt het beschermingsniveau conservatiever en correct volgens de standaarden, en <b>wijzigt daarom de PL-waarden die bestaande integriteitsscenario's rapporteren</b>. Het ISM/scenario krijgt de velden <c3/> <c4/> / <c5/>, dus invoer die ze ongezet laat behoudt het eerdere gedrag. Zie <c6/> voor de herstelde formule <c7/> en de eerlijke implementatienotitie.

seg-c408f8944ac6 = Consistentie van de χ² van de spoofmonitor.

seg-92e2b5c5458c = <c1/> gebruikt nu het gedeelde pad voor inverse-χ² van <c2/>, waarmee een tweede afwijkende χ²-implementatie verdwijnt zodat RAIM en de pariteitsspoofmonitor het over hun drempels eens zijn.

seg-6d424034e500 = <b><c1/> aangesloten op de dispatcher van de CLI.</b> Het scenario was eerder alleen via de API bereikbaar; het wordt nu gedispatcht als een <c2/> zoals elk ander scenario.

seg-815eda56aad9 = <b>NaveGo-kruisvalidatie van de IMU-ruispipeline</b> (<c1/>). Een externe kruiscontrole tegen NaveGo (de opensource INS/GNSS-toolbox van R. Gonzalez): reproduceert de synthetische rondgang van <c2/> op het gepubliceerde Microstrain 3DM-GX3-35-referentieprofiel en bevestigt dat onze overlappende ADEV-schatter de coëfficiënten van NaveGo voor snelheids- en hoekrandomwalk (<c3/>) tot op minder dan { "5" }% terugvindt, met de verwachte −1/2-helling van witte ruis. (Het opgenomen STIM300-<c4/>-logbestand van { "40" } MB wordt niet ingelezen: het is afhankelijk van een binair formaat.)

seg-b67b3ec240de = Strak gekoppelde (pseudorange) GNSS/INS-update.

seg-c926dddc5256 = <c1/> (en de wrapper <c2/>) implementeren de eerder als stub aanwezige meting in het afstandsdomein: de innovatie is de voorspelde afstand van de INS-positie tot elke satelliet ten opzichte van de gemeten pseudorange, met een zichtlijn-Jacobiaan op de positiefout. Omdat elke satelliet een scalaire meting is, blijft het filter corrigeren met <b>minder dan vier satellieten</b>, waar een losjes gekoppelde PVT-positiebepaling niet bestaat. Vijf tests dekken nulling met vier satellieten, correctie met twee satellieten (geen PVT mogelijk), waarneembaarheid langs de zichtlijn met één satelliet en invoervalidatie. Alleen pseudorange; draaggolffase en een expliciete ontvangerklokstatus blijven roadmap. De ongebruikte cargo-feature <c3/> (die de oude foutstub afschermde) is verwijderd.

seg-94ebfac3bbc3 = <b>Losjes gekoppeld GNSS/INS-scenariopakket (<c1/>, <c2/>).</b> Koppelt de driedimensionale strapdown-navigator en de EKF met 15 foutstatussen (<c3/> / <c4/>) aan een uitvoerbaar scenario met een kwaliteitsmaat: de EKF stuurt de mechanisatie bij met ruisende GNSS-positiebepalingen zolang er dekking is en houdt daarna de uitval vol, waarbij het reset-naar-referentie-mechanisme van het oude scalaire 1-DOF-pakket wordt vervangen door echte fusie. Het resultaat geeft de gefuseerde horizontale foutreeks, de gescoorde positie-FoM (beschikbaarheid / RMS tijdens uitval / holdover) en de RMS van de open-lus vrije INS ter vergelijking; een kwantum/klassiek IMU-paar verschilt alleen in de werkelijke bias. Aangeroepen vanuit het CLI/Python/wasm-toegangspunt met een voorbeeld <c5/>. Eerlijke kadering: alleen losjes gekoppeld, één deterministisch traject, en de gefuseerde fout tijdens uitval wordt begrensd door de attitudefout bij overdracht (er wordt dus niet beweerd dat hij met de bias schaalt); de robuuste bevindingen zijn dat fusie beter presteert dan onondersteunde dode rekening voor een sensor met bias en dat een sensor met lagere bias de betere onondersteunde uitloop heeft.

seg-0a2df01f99d8 = <b>Constellatieontwerp op de getoetste SGP4-kern (<c1/>).</b> Een nieuwe module <c2/> genereert een ontworpen Walker-delta-patroon (<c3/>) als SGP4-<b>gemiddelde elementen</b>, zodat de synthetische constellatie wordt gepropageerd via hetzelfde SGP4-pad dat tot op { "4.12" } mm is getoetst aan de AIAA 2006-6753-vectoren, en niet via de analytische Kepler-generator. Daarbovenop: <c4/> tabelleert dekking en mediane/slechtste PDOP over een ontwerpraster <c5/>, en <c6/> geeft de dekkingsfractie en de herbezoekgaten (slechtste/gemiddeld) op een grondpunt. Getoetst aan de fysische monotoniciteiten waaraan een afweging moet voldoen (meer satellieten ⇒ hogere dekking, lagere PDOP, kortere herbezoektijd). Daarnaast is een echte <b>Celestrak-<c7/>-TLE-momentopname</b> (2021-07-28, { "30" } operationele GPS-satellieten) toegevoegd als fixture uitsluitend voor tests, en het echte pad TLE → SGP4 → ECEF-geometrie is ertegen getoetst (volledige MEO-schil binnen { "1" }%, negen satellieten tegelijk in zicht bij PDOP { "1.64" }), naast de bestaande echte-datapaden voor SP3 en RINEX.

seg-9e051f3725df = Ruistypespecifieke effectieve vrijheidsgraden voor de Allan-betrouwbaarheidsintervallen.

seg-2392bec8f0b6 = <c1/> implementeert de gesloten vormen uit NIST SP { "1065" } Tabel { "5" } (de eenvoudige set van Stable32) voor alle vijf canonieke machtswetruistypen: witte/flicker-PM, witte/flicker-FM en random-walk-FM, ter vervanging van het conservatieve niet-overlappende aantal als χ²-vrijheidsgraden. Een nieuwe enum <c2/> en <c3/> bepalen het dominante type uit de helling van de <b>gemodificeerde</b> Allan-deviatie van de opname (MDEV scheidt witte van flicker-PM waar ADEV dat niet kan), en <c4/> koppelt nu het geïdentificeerde ruistype, de edf en een { "95" }%-betrouwbaarheidsband aan elk punt van de geëxporteerde ADEV-curve (<c5/> krijgt <c6/>/<c7/>/<c8/>/<c9/>, additief met serde-standaardwaarden). Op twee manieren getoetst: de vijf formules komen tot op { "1e-12" } overeen met met de hand berekende waarden, en een Monte-Carlo-ensemble van { "4" } 000 opnamen met witte FM bevestigt dat de formule de werkelijke chi-kwadraat-edf van de schatter voorspelt binnen { "20" }% (en dat hij het conservatieve aantal duidelijk overtreft). Acht nieuwe tests.

seg-df59cc71120f = Stochastisch model voor tweewegtijdoverdracht.

seg-d2add1ce01e1 = <c1/> vervangt de sampler met alleen witte ruis door een fysisch onderbouwd model: de reciproke (common-mode) padvertraging valt weg in de schatting <c2/> (<c3/>, zodat twee onafhankelijke eenwegmetingen middelen tot <c4/>), en wat overblijft is de <b>niet-reciproke</b> differentiële vertraging, gemodelleerd als een gekleurd witte-FM- plus random-walk-FM-proces (het getoetste <c5/>), wat de reeks van de synchronisatiefout een realistische Allan-signatuur geeft (<c6/>) in plaats van vlakke witte ruis. <c7/> krijgt <c8/>/<c9/> (serde-standaardwaarde { "0" } ⇒ het oude gedrag met alleen witte ruis, bit voor bit), de link-FoM geeft <c10/> weer (de Allan-deviatie van het model bij de basisstap) en het scenario en de CLI van <c11/> maken dit beschikbaar. Golden-FoM opnieuw vastgezet. Zes met de hand afgeleide tests (common-mode-opheffing, de tweewegwinst sqrt({ "2" }), de RWFM-wet <c12/> via de eigen <c13/> van de link, gelijkwaardigheid met het oude gedrag bij <c14/>, determinisme en end-to-end weergave van de FoM).

seg-6c7a1dd63be0 = Numerieke pariteit met Stable32 voor de schatters uit de Allan-familie (NBS14).

seg-adbb47ca87b4 = <c1/> toetst de overlappende ADEV, gemodificeerde ADEV, tijdsdeviatie en overlappende Hadamard-schatters aan de referentiedeviaties van Stable32 voor de canonieke dataset <b>NBS14</b> (W. J. Riley, <em>Handbook of Frequency Stability Analysis</em>, NIST SP { "1065" }, ~p.107) bij tau = { "1" }, { "2" } met een relatieve tolerantie van { "1e-4" }; de werkelijke overeenstemming is ~{ "1e-6" }. Dit legt de schattingswiskunde vast tegen de feitelijke referentie-implementatie, en niet alleen tegen de eigen analytische samenhang van de schatters. Alleen de openbare referentiegetallen worden gebruikt; er is geen code van derden.

seg-35b0c0644fa2 = <b>Verticaal Stanford-integriteitsdiagram, geëxporteerd door het scenario <c1/>.</b> Het uitvoerbare scenariotype <c2/> exporteert nu een verticaal Stanford(-ESA)-diagram naast de HPL/VPL-beschikbaarheidskaart: op elk beschermd tijdstip wordt een geseede, reproduceerbare foutloze afstandsfoutentrekking via de geometrie omgezet in een werkelijke verticale positiefout en ingedeeld ten opzichte van de VPL en de verticale alarmgrens (Available / System-Unavailable / Misleading / Hazardously-Misleading). Het diagram (punten per tijdstip + gebiedstellingen) zit in de resultaat-JSON en de tellingen van integriteitsgebeurtenissen en HMI in de CLI-samenvatting, zodat de Stanford-classificator, die eerder alleen in de bibliotheek bestond, end-to-end bereikbaar is. <c3/> krijgt een veld <c4/> (standaard { "0" }) dat de foutrealisatie bepaalt; de beschikbaarheidskaart zelf blijft puur geometrisch en onafhankelijk van de seed.

seg-5d76a638ae77 = ARAIM-integriteitsrisicobudget (P_HMI) voor de beschermingsniveaus.

seg-449adb9ad6e6 = <c1/> leidt de horizontale en verticale beschermingsniveaus af uit een expliciet integriteitsrisicobudget in plaats van een vaste vermenigvuldiger <c2/>: voor de oplossing met alle satellieten in zicht en elke enkelvoudige satellietuitsluitings-deeloplossing bouwt het per modus de <c3/> op elke as, waarna <c4/> het kleinste PL oplost waarvan de opgetelde kans op gevaarlijk misleidende informatie (<c5/>, <c6/>, Blanch et al. <em>Baseline ARAIM</em>) het toegewezen <c7/> haalt. Het resultaat geeft het integriteitsrisico dat de niveaus daadwerkelijk bereiken, zodat een gebruiker integriteit en alarmgrens expliciet tegen elkaar kan afwegen. Zes met de hand afgeleide tests (gesloten vormen voor foutvrije en gedrempelde enkelvoudige modi, sommatie en monotoniciteit over meerdere modi, end-to-end foutvrije bescherming waarbij een 10⁵× strakker budget het PL verhoogt, foutdetectie en -identificatie, en de redundantiedrempel van zes satellieten). Enkelvoudige-fout-MHSS is de ARAIM-basislijn; gelijktijdige fouten in meerdere SV-deelverzamelingen, de constellatiebrede foutmodus en validatie met de gLAB-referentiedataset zijn gedocumenteerde uitbreidingen.

seg-3e33581644a5 = Tweesnelheden-coning/sculling-compensatie voor de strapdown-mechanisatie.

seg-c900e193ac29 = <c1/> vouwt de hoogfrequente coning- (attitude) en rotatie-plus-scullingtermen (snelheid) uit de geordende IMU-incrementen van de subintervallen van een grove update, zodat een <c2/> met gematigde snelheid de door trillingen gerectificeerde beweging reproduceert die een grove stap over de ruwe sommen mist. Een validatietest drijft een coning+sculling-omgeving van { "10" } Hz gedurende { "60" } s aan en vergelijkt fijnsnelheidsreferentie, naïeve grove integratie en de gevouwen grove integratie: het vouwen verlaagt de positiefout ongeveer { "18" }× (van meters naïeve drift naar minder dan een decimeter), wat bevestigt dat de coning/sculling-termen dragend zijn. Een typealias <c3/> noemt het oude 1-DOF-model <c4/> bij zijn naam, onderscheiden van de driedimensionale navigator <c5/>.

seg-ceb037e7a6ea = <b>Parser voor RINEX-observatiebestanden.</b> Een nieuwe module <c1/> leest het RINEX 3.0x / { "4.00" }-<em>observatiebestand</em>, de werkelijke metingen van de ontvanger, en completeert zo het RINEX-paar naast de bestaande parser voor navigatieberichten. <c2/> decodeert de header (versie/type, de per-systeem <c3/>-lijsten met vervolgregels, benaderde positie, interval, tijdstip van de eerste observatie) en de records per satelliet van elk tijdstip: pseudorange, draaggolffase, Doppler en signaalsterkte, geïndexeerd op hun RINEX-{ "3" }-observatiecode (<c4/>, <c5/>, …) met de vlaggen voor lock-verlies (LLI) en signaalsterkte (SSI), waarbij een leeg veld als afwezig wordt bewaard en niet als nul. Eerlijke reikwijdte: dit is de <em>inlezing</em> van het standaardformaat (een echt observatielogbestand van RTKLIB/gLAB/IGS-stations erin, getypeerde metingen eruit), geen positioneringsengine; hier is geen pseudorange-oplossing, PPP of RTK.

seg-60efb0c44522 = <b>CCSDS OEM-schrijver (Orbit Ephemeris Message).</b> Een nieuwe module <c1/> exporteert een gepropageerde constellatie als een geldig CCSDS 502.0-B OEM-bericht { "2.0" }, het KVN-efemerideformaat dat GMAT, Orekit, STK en de meeste vluchtdynamicatools inlezen. <c2/> bemonstert de inertiale (TEME) toestand van elke satelliet, positie <b>en</b> snelheid, rechtstreeks uit de propagator zonder aardvaste rotatie, anders dan bij de SP3-export, op een tijdraster, en <c3/> serialiseert de header <c4/>/<c5/>/ <c6/> plus één segment <c7/> per satelliet (<c8/>/<c9/>/<c10/>/<c11/>/<c12/>/ <c13/>/<c14/>), gevolgd door de regels <c15/> (km, km/s). De <c16/> wordt door de aanroeper geleverd, nooit uit de systeemklok genomen, zodat de uitvoer bytegelijk is over runs heen (het reproduceerbaarheidscontract). Dit is het tegenstuk voor ruimtevaartuigefemeriden van de GNSS-SP3-export: een Kshana-baan kan nu in een standaardformaat aan een vluchtdynamicatool worden overgedragen.

seg-f8538db4a17c = SP3-precisie-efemeride als propagatiebron.

seg-2cf2e224deb9 = <c1/> bouwt per satelliet een <c2/> die de positie tussen de getabelleerde SP3-tijdstippen invult met een Lagrange-polynoom van de 9e orde (standaardpraktijk bij de IGS) en deze naar het gedeelde TEME-stelsel draait, beschikbaar als <c3/>. Een precisiebaanbestand van de IGS of een analysecentrum kan nu dezelfde geometrie-, zichtbaarheids- en integriteitspipeline aansturen als de broadcast- en analytische propagatoren. Getoetst met een rondgang: een Kepler-baan die naar SP3 is geschreven en via de interpolator weer is ingelezen, komt op de knooppunten tot onder een meter overeen met het origineel en binnen < { "100" } m halverwege het interval. Klokinterpolatie volgt.

seg-8d50fd42f53c = <b>GLONASS-broadcast-efemeride (completeert multi-GNSS RINEX-nav).</b> Nieuwe module <c1/>: GLONASS zendt geen Kepler-elementen uit maar een aardvaste <b>toestandsvector</b> in PZ-90 (positie, snelheid, luni-solaire versnelling). <c2/> leest de RINEX-{ "3" }-records <c3/>, en de satellietpositie op elk tijdstip volgt uit <b>Runge-Kutta-integratie van de 4e orde</b> van de bewegingsvergelijkingen uit de GLONASS-ICD (centrale zwaartekracht + <c4/> + Coriolis- en middelpuntvliedende termen door aardrotatie + de uitgezonden versnelling). Beschikbaar als <c5/>, zodat GLONASS-satellieten samen met de Kepler-systemen door de constellatie-, zichtbaarheids- en integriteitspipeline stromen; één <c6/>-constellatieblok kan nu GPS, Galileo, QZSS, BeiDou en GLONASS mengen.

seg-8d88144e3726 = <b>Multi-GNSS RINEX-navigatie (GPS, Galileo, QZSS, BeiDou).</b> De RINEX-{ "3" }-navigatieparser decodeert nu records van Galileo (<c1/>), QZSS (<c2/>) en BeiDou (<c3/>, MEO/IGSO) naast GPS (<c4/>); ze delen de Kepler-indeling en het gebruikersalgoritme en worden elk geëvalueerd met hun eigen gravitatieconstante en aardrotatiesnelheid (μ van Galileo/BeiDou, Ω̇ₑ van BeiDou). Een bestand met gemengde constellaties levert ze allemaal op, die als <c5/> door de constellatie-, zichtbaarheids- en integriteitspipeline stromen. Geostationaire BeiDou-satellieten gebruiken een andere coördinatenrotatie en worden overgeslagen tot er een referentiefixture is om tegen te toetsen. De recordlezer gebruikt regelaantallen per systeem, wat een sluimerende fout verhelpt waarbij GLONASS/SBAS-records van vier regels werden overgeslagen alsof ze acht regels lang waren. GLONASS (een toestandsvectormodel) volgt.

seg-91a6907acc8d = <b>Lezer en schrijver voor SP3-c/d-precisie-efemeriden.</b> Een nieuwe module <c1/> leest SP3-precisiebaanbestanden van de IGS of analysecentra (<c2/>), het nabewerkte ECEF-positie-/klokproduct dat PPP-engines (Ginan, RTKLIB, gLAB) als referentie beschouwen, in een gestructureerd <c3/> (header, tijdstipraster, positie per satelliet km→m, klok µs en snelheid dm/s→m/s voor <c4/>-producten), met behoud van de SP3-sentinelwaarden voor ongeldige waarden. De omgekeerde richting is ook gedekt: <c5/> bouwt een SP3 uit een gepropageerde constellatie (TEME→ECEF per tijdstip) en <c6/> serialiseert die, zodat Kshana-banen kunnen worden geëxporteerd in het formaat dat externe PPP-tools inlezen: de rondgang lezen↔schrijven. Tijdstipinterpolatie en een SP3-propagatorbron volgen.

seg-7d51d1b6f39f = <b>RINEX-broadcast-efemeride als uitvoerbare constellatiebron.</b> Een constellatie accepteert nu een inline blok <c1/> (RINEX-{ "3" }-GPS-navigatietekst) naast de bestaande optie <c2/>, zodat een echt broadcastbestand een scenario end-to-end aanstuurt vanuit de CLI, Python of de playground in de browser: RINEX erin, PNT-geometrie eruit. Het nieuwe <c3/> toont GNSS-beschikbaarheid en DOP voor acht GPS-satellieten die rechtstreeks uit broadcastrecords zijn opgebouwd. (Alleen GPS LNAV; multi-GNSS en SP3 volgen.)

seg-9730835bfc64 = <b>RINEX-broadcast-efemeride als propagatiebron.</b> Een geparste <c1/> wordt nu omgezet naar een <c2/> (<c3/>): de positie is de IS-GPS-200-broadcastbaan, geroteerd van ECEF naar het gedeelde inertiale TEME-stelsel (<c4/>, met schrikkelseconde-correcte GPS→UT1-tijd), de snelheid volgt uit een centraal eindig verschil en de omloopperiode is de Kepler-periode. Echte GPS-broadcastdata kunnen nu dezelfde geometrie-, zichtbaarheids- en integriteitspipeline (RAIM) aansturen als de analytische SGP4/Kepler-propagatoren. (Nog niet beschikbaar als scenariotype voor RINEX-bestanden; dat en multi-GNSS/SP3 volgen.)

seg-a355e3e52ec3 = <b>Archief-DOI.</b> Releases worden nu bij Zenodo gedeponeerd en krijgen een citeerbare DOI.

seg-c6e4556e1ce5 = <b>Documentatie.</b> De README is bijgewerkt tot institutioneel niveau: een overzicht van de mogelijkheden van de volledige { "v0.9.0" }-stack, een sectie Versiebeheer en releases, een schone header met het nieuwe merkteken en een beknopte statusregel. Geen wijzigingen aan de engine.

seg-1bfc4e965d2b = Deze release voegt drie substantiële mogelijkheden toe bovenop het SGP4-fundament van { "0.8.0" }: een echt driedimensionaal strapdown-INS, een losjes gekoppelde GNSS/INS-foutstatus-EKF met gesloten-lus-terugkoppeling, echte snapshot- en oplossingsscheidings-RAIM (ARAIM-stijl) met HPL/VPL en een uitvoerbaar scenario <c1/>, en de eerste stap naar interoperabiliteit van GNSS-formaten (inlezen van RINEX-3-GPS-efemeriden).

seg-7fa2f68d436a = <b>Parser voor RINEX-{ "3" }-GPS-navigatieberichten (<c1/>).</b> Eerste stap naar interoperabiliteit van GNSS-formaten: <c2/> leest een RINEX-{ "3" }.x-navigatiebestand en decodeert elk GPS-broadcastefemeriderecord (<c3/>), het blok van acht regels SV/tijdstip + <c4/>, naar een <c5/> met Kepler-elementen en klokcorrecties, met veldnamen en eenheden volgens IS-GPS-200. Verwerkt het Fortran-floatformaat met <c6/>-exponent (<c7/>) en de kolomindeling met vaste breedte; records van niet-GPS-systemen worden overgeslagen en niet geweigerd, zodat een gemengd bestand toch zijn GPS-efemeriden oplevert. Vier tests: parsing van de <c8/>-exponent (inclusief lege velden en fouten), een volledig record gedecodeerd tegen bekende veldwaarden met een controle van de GPS-halve lange as (√A² ≈ { "26 560" } km), het overslaan van niet-GPS en het geval van een leeg bestand.

seg-9c4a068f204c = GPS-broadcastefemeride → ECEF-positie (<c1/>).

seg-5deeec4b8cc9 = <c1/> berekent de aardvaste positie van de satelliet uit de geparste efemeride via het gebruikersalgoritme van IS-GPS-200 §{ "20.3.3.4.3.1" }: een Newton-oplossing van de vergelijking van Kepler voor de excentrische anomalie, de tweede-harmonische correcties op argument van breedte, straal en inclinatie, en de rotatie naar ECEF met aardrotatie sinds het referentietijdstip (met de door de specificatie voorgeschreven GPS-<c2/> en <c3/>, en een vouwing van <c4/> bij weekovergang). Drie tests: de geocentrische straal blijft in de GPS-band (≈ { "26 560" } km), de aardvaste snelheid is ~{ "3.9" } km/s, en evaluatie een volle week verder reproduceert dezelfde positie.

seg-583433389a70 = GPS-SV-klokbias met de relativistische correctie (<c1/>).

seg-957588ed5dff = <c1/> berekent het broadcast-klokpolynoom <c2/> rond <c3/> plus de relativistische excentriciteitsterm <c4/> (IS-GPS-200 §{ "20.3.3.3.3.1" }). Een nieuwe <c5/> zet het kalendertijdstip van het record om naar GPS-tijd van de week via Juliaanse-dagrekenkunde vanaf het GPS-tijdstip nul (1980-01-06), en de Kepler-oplossing wordt gedeeld met de positieberekening. Tests: GPS-tijd van de week voor een zondag/dinsdag/zaterdag (weekgrenzen), en een klokbias die door af0 wordt gedomineerd met een aanwezige, begrensde relativistische term. De L1-groepsvertraging <c6/> is beschikbaar maar wordt bewust niet meegenomen. Eerlijke reikwijdte: een bron <c7/>, Galileo/BeiDou/GLONASS en SP3 blijven vervolgstappen. (<c8/> is hierop aangepast.)

seg-ef971feff16c = <b>Door gebruikers uitvoerbaar scenariotype <c1/> (<c2/>).</b> De beschikbaarheidsmogelijkheid van RAIM is nu net als elk ander pakket bereikbaar vanuit de CLI/TOML: <c3/> parst een <c4/> (gebruikersbaan, een of meer GNSS-constellaties, elevatiemasker en de integriteitsconfiguratie <c5/>), voert <c6/> uit en geeft de HPL/VPL-beschikbaarheidskaart per tijdstip als JSON plus een zelfstandige SVG: beschermingsniveaus in de tijd ten opzichte van de alarmgrenzen, met een groen/rode beschikbaarheidsstrook. <c7/> schrijft de JSON, de grafiek en een HTML-rapport. Het meegeleverde scenario (Walker met 24 satellites, tweefrequente afstandsmeting van { "1" } m, APV-I-grenzen) geeft ~{ "95" } % beschikbaarheid; het documenteert dat RAIM met één frequentie niet voldoet aan de verticale APV-I-grens met één constellatie, en daarom wordt voor verticale geleiding SBAS/tweefrequent/ARAIM gebruikt. Tests dekken de aanroep, de JSON van de beschikbaarheidskaart en de SVG.

seg-bbe5721c1785 = <b>Uitvoerbare RAIM-beschikbaarheid over een constellatie (<c1/>).</b> De integriteitsmodule had geen aanroeper; <c2/> maakt er een echt end-to-end toegangspunt van: op elk tijdstip van een tijdraster propageert het de zichtbare satellieten (dezelfde SGP4/Kepler-<c3/>s die de engine gebruikt), berekent het de foutloze beschermingsniveaus en beoordeelt het de beschikbaarheid aan de horizontale/verticale alarmgrenzen, en geeft het een met <c4/> serialiseerbaar <c5/> terug (per tijdstip <c6/>/HPL/VPL/<c7/> plus de beschikbaarheidsfractie). Een <c8/> bundelt <c9/> en de <c10/> per tijdstip is beschikbaar voor aanroepers die hun eigen geometrie oplossen. Drie tests: een tijdstip dat beschikbaar wordt bevonden onder APV-I-grenzen bij een geometrie van tien satellieten, onbeschikbaar gemaakt door een onmogelijk strakke grens, en <c11/>-niveaus onder vijf satellieten; en een end-to-end run over een Walker-constellatie van 24 satellieten die een eindige beschikbaarheidskaart oplevert en serialiseert. (Zes satellieten, de redundantiedrempel van residuele RAIM, voldoen eerlijk gezegd <em>niet</em> aan APV-I, zelfs niet bij afstandsmeting van { "1" } m; APV-I-beschikbaarheid vraagt de dichtere geometrie die de test gebruikt.)

seg-91e32e587cb6 = <b>Accumulator voor het Stanford(-ESA)-integriteitsdiagram (<c1/>).</b> De standaardmanier om een integriteitsmonitor over veel tijdstippen samen te vatten: het zet de werkelijke positiefout (x) uit tegen het beschermingsniveau (y) en deelt elk tijdstip, via de diagonaal <c2/> en de alarmgrens, in bij <c3/> (PL begrenst de fout, binnen AL), <c4/> (PL begrenst de fout maar overschrijdt AL: veilig, onbruikbaar), <c5/> (PL < fout ≤ AL) of <c6/> (PL < fout en fout > AL: het onveilige falen). <c7/> is de pure classificator; <c8/> verzamelt <c9/>-punten tegen een vaste alarmgrens en geeft gebiedstellingen, beschikbaarheid, totalen van integriteitsgebeurtenissen en met <c10/> serialiseerbare punten voor plots/JSON-export. Vier tests: elk gebied (inclusief de begrensde grens <c11/>), opbouw van tellingen/beschikbaarheid en JSON-rondgang. Dit is het rapportageoppervlak voor de RAIM-beschermingsniveaus; het aansluiten op het constellatiescenario en validatie met een openbare dataset blijven roadmap-onderdelen.

seg-cdeb3a5a4acf = <b>Oplossingsscheidings-RAIM (ARAIM-stijl) (<c1/>).</b> Een integriteitsmonitor met meerdere hypothesen naast de bestaande residu-/pariteits-chi-kwadraat-<c2/>. Voor de kleinstekwadratenoplossing met alle satellieten in zicht en elke enkelvoudige satellietuitsluitings-deeloplossing vormt hij de scheiding <c3/>, nulgemiddeld Gaussisch zonder fout met covariantie <c4/> (de identiteit van geneste schatters, geldig omdat de oplossing met alle satellieten in zicht BLUE is), en zo <b>detecteert</b> hij een fout én <b>identificeert</b> hij de foute satelliet (degene waarvan de uitsluiting de grootste genormaliseerde scheiding geeft). Horizontale/verticale beschermingsniveaus volgen uit de standaard MHSS-toewijzing <c5/>, met <c6/>, <c7/>. Nieuw, afhankelijkheidsvrij <c8/>/<c9/>, gebouwd op de bestaande geregulariseerde onvolledige gamma van de module (<c10/>). Vier met de hand afgeleide tests: normale CDF / kwantiel tegen leerboekwaarden (Φ({ "1.95996" })={ "0.975" }, de staart van { "1e-7" } = { "5.1993" }, symmetrie); een foutvrije geometrie die geen alarm geeft en eindige, positieve HPL/VPL oplevert; een bias van 60 σ op één satelliet die wordt gedetecteerd <em>en</em> correct geïdentificeerd (<c11/>); en de redundantiedrempel van zes satellieten. Sluit aan de algoritmekant het gat uit de audit "tautologische integriteit: geen echte RAIM/HPL/VPL" (P0); validatie met de gLAB-dataset en de Stanford-diagramaccumulator blijven roadmap-onderdelen.

seg-67e771fc0a48 = Gesloten-lus GNSS/INS-integratie (<c1/>).

seg-5aa467783b99 = <c1/> koppelt de foutstatus-EKF-kern aan de driedimensionale strapdown-mechanisatie: elk IMU-sample wordt gecorrigeerd met de lopende biasschattingen, voorwaarts gemechaniseerd, en de EKF-covariantie wordt in de tijd gepropageerd met de bijbehorende navigatiecontext; elke GNSS-positie-/snelheidsbepaling vormt de INS−GNSS-innovatie en voert de geschatte <b>positie, snelheid, attitudefout (ψ, als quaternionrotatie) en versnellingsmeter-/gyrobiassen</b> terug in de oplossing, waarbij het gemiddelde van de foutstatus wordt gereset. De attitude terugvoeren (niet alleen de biassen) is nodig voor stabiliteit: de kanteling en de versnellingsmeterbias vormen een gekoppeld paar, dus het corrigeren van de ene zonder de andere divergeert. INS en GNSS worden vergeleken in een lokaal raakvlak-NED-stelsel met de eigen kromtestralen van de mechanisatie (nieuw <c2/>; <c3/>/<c4/> beschikbaar). Dit is de eerlijke vervanging van het <em>reset-naar-referentie-mechanisme</em> van het hybride pakket. Drie tests: een gesloten lus die een geïnjecteerde positiefout van { "8" } m / −{ "5" } m nult tot <{ "0.1" } m; een ondersteunde oplossing die op een rijdend traject binnen de meter blijft (<{ "6" } m) terwijl een vrijlopende INS boven { "100" } m divergeert; en de mijlpaalbenchmark: de <b>Monte-Carlo-positie-RMS van de gefuseerde oplossing over een GNSS-uitval van { "60" } s is >{ "2" }× beter dan die van een onondersteunde open-lus dode-rekening (≈{ "4" }× over seeds)</b>. Gedocumenteerde eerlijke beperking in de module: in losjes gekoppelde modus zijn de versnellingsmeterbias en de kanteling slechts zwak scheidbaar (beide koppelen via de zwaartekracht), dus de geleverde waarde is de begrensde, gecorrigeerde toestand en een schone start bij uitval, geen nauwkeurige inertiale kalibratie; rijkere dynamica en de strak gekoppelde uitbreiding blijven roadmap-onderdelen.

seg-aa9bf0ff6f84 = <b>Losjes gekoppelde GNSS/INS-foutstatus-EKF-kern (<c1/>).</b> Een uitgebreid Kalman-filter met 15 foutstatussen, <c2/>, met de strapdown-foutdynamica uit Groves { "2013" } §{ "14.2" } (koppeling van specifieke kracht en kanteling, Coriolis, projectie van de bias van lichaams- naar navigatiestelsel, Gauss–Markov-biasmodellen), een discrete overgang van de eerste orde <c3/> en een losjes gekoppelde meetupdate voor positie+snelheid (<c4/>) in Joseph-vorm. Afhankelijkheidsvrije dichte lineaire algebra (Gauss–Jordan-inverse, Joseph-covariantie-update). Een cargo-feature <c5/> schermt een gedocumenteerde, nog niet geïmplementeerde pseudorange-/Doppler-update af. { "7" } tests met met de hand afgeleide verwachtingen: de scheef-/kruisproductidentiteit, een geverifieerde inverse van { "3" }×{ "3" }, covariantie die symmetrisch/PSD blijft onder predictie (en positieonzekerheid die zonder ondersteuning groeit), een positiebepaling die de positiecovariantie verkleint, exacte terugvinding van een bekende positiefout bij de analytische Kalman-versterking <c6/>, en kleinere correcties bij grotere meetruis. Dit is de kern die het reset-naar-referentie-mechanisme met open lus van het hybride pakket zal vervangen door terugkoppeling met gesloten lus (koppeling aan het pakket + NaveGo-validatie volgen).

seg-5be84079b8b6 = Deterministisch IMU-foutmodel voor de 3-assige strapdown-navigator (<c1/>).

seg-492e670736b2 = <c1/> vervormt een ware paar <c2/> in het lichaamsstelsel tot een gemeten paar via vijf systematische categorieën (IEEE Std 952-1997 §A.2; Groves { "2013" } §{ "4.3" }, Tabel { "4.1" }): <b>schaalfactor</b> (versterkingsfout per as in ppm), <b>misalignment / kruiskoppeling</b> (niet-orthogonaliteit van het drietal buiten de diagonaal), <b>g-gevoeligheid</b> (een gyrohoeksnelheidsbias evenredig met de specifieke kracht), <b>kwantisatie</b> (afronding op de uitvoer-LSB) en <b>rate-ramp</b> (een in de tijd lineaire drift: het derde Allan-gebied), plus een constante inschakelbias. Elke term staat standaard op nul, zodat <c3/> een transparante doorgifte is en bestaande scenario's niet worden beïnvloed. Elke foutbron heeft een isolatietest (schaal lineair tot <{ "0.01" }%, misalignment tussen de assen boven de VRW-ondergrens, g-gevoeligheidsbias, LSB-raster, lineaire ramp), en een end-to-end test laat een navigatiefout via de mechanisatie ontstaan uit een vervormde IMU. Niet gemodelleerd: fout door trillingsrectificatie, drift door temperatuurgradiënt. (Het meegeleverde scenariopakket <c4/> draait nog steeds het oude scalaire 1-DOF-budget; dit model voedt de 3-assige bibliotheek.)

seg-f57bc89d4688 = <b>Coning- en sculling-compensatie voor de strapdown-integrator.</b> Het attitudepad voegt de tweesamples-<c1/> toe (<c2/>); een integratie met grove snelheid ({ "30" } Hz, 5 samples/cyclus) van een coning-omgeving van { "5" } Hz volgt, zo is geverifieerd, de fijnsnelheidsreferentie ≥ { "3" }× beter met de correctie dan met naïef optellen van incrementen. Het snelheidspad voegt <c3/> toe (<c4/>, Groves vgl. { "5.82" }) en herleidt het snelheidsincrement in het lichaamsstelsel via een nieuwe incrementgebaseerde update <c5/> met de lichaamsrelatieve rotatie <c6/>, zodat een aardvast platform geen valse sculling oploopt terwijl een echte trilling de volledige term activeert.

seg-56c599250ed4 = Volledige driedimensionale strapdown-mechanisatie in het NED-stelsel (<c1/>).

seg-d0897492e89b = <c1/> wordt voortgezet met <c2/> volgens de standaard NED-vergelijkingen in het aardse stelsel (Groves §{ "5.4" }): attitude van lichaams- naar NED-stelsel gecorrigeerd voor de inertiaal-naar-navigatie-hoeksnelheid <c3/> (aardrotatie + transportsnelheid); specifieke kracht van lichaams- naar NED-stelsel herleid via de DCM; snelheid die <c4/> integreert (Coriolis/transport + zwaartekracht); en geodetische positie via de meridiaan- en dwarskromtestralen. De zwaartekracht is de gesloten vorm van WGS-84 volgens Somigliana, de <b>normale (schietlood-)zwaartekracht</b>, met een NIMA-vrije-luchtcorrectie voor de hoogte, nooit een hardgecodeerde constante. Dit is de echte driedimensionale navigator die het scalaire foutbudgetpad met 1 DOF vervangt. Geverifieerd met fysische invarianten: een platform dat aan de roterende aarde is bevestigd op { "45" }°N (en de aardrotatiesnelheid + { "1" } g meet) blijft binnen { "1" } mm gedurende { "60" } s; een horizontale specifieke kracht naar het noorden geeft <c5/> en een verplaatsing <c6/>; de normale zwaartekracht komt overeen met de bekende oppervlaktewaarden op de evenaar, de pool en 45° en met de vrije-luchtgradiënt.

seg-290b08199bfb = <b>Driedimensionale attituderepresentatie voor strapdown-INS (<c1/>).</b> Een type <c2/> met eenheidsquaternion (scalar-first, Hamilton-conventie) dat de rotatie van lichaams- naar navigatiestelsel draagt, met een DCM-weergave (<c3/>/<c4/> via de methode van Shepperd), Hamilton-product, constructors voor as-hoek en rotatievector (exacte exp-map) en quaternionkinematica: zowel een RK-snelheidsupdate van de eerste orde (<c5/>) als een rotatievectorupdate met coning-correctie. De tweesamples-<c6/> (Savage / Bryan–Lewantowski, <c7/>) levert de kruiskoppelingsterm van de rotatiesnelheid die scalaire dode rekening weglaat. Dit is het attitudefundament voor de volledige 3-assige mechanisatie die het oude foutbudgetpad met 1 DOF vervangt. Geverifieerd met rotaties in gesloten vorm: propagatie met constante snelheid komt tot { "1e-6" } overeen met de as-hoek-quaternion, DCM's zijn orthonormaal met determinant één en coning verdwijnt bij beweging om één as. (<c8/> is nu de moduledirectory <c9/>; het openbare pad <c10/> is ongewijzigd.)

seg-5e6e5bba25a5 = Geodetisch correcte zichtbaarheid vanaf grondstations (<c1/>).

seg-69bdb1e5bfc8 = <c1/>, <c2/> en <c3/> berekenen de elevatie van een satelliet boven de horizon van een grondstation ten opzichte van de <b>normaal van de WGS-84-ellipsoïde</b> (de ware lokale verticaal) en niet de geocentrische radiaal; die twee verschillen tot de geodetische afbuiging van ~{ "0.19" }°, genoeg om satellieten dicht bij de horizon in of uit een elevatiemasker te laten vallen. Geverifieerd end-to-end (een Walker-constellatie gepropageerd, van TEME naar ECEF geroteerd en geteld vanaf een geodetische locatie) en tegen de geocentrische benadering.

seg-4de1d79d2e76 = <b>Betrouwbaarheid van CI.</b> De job <c1/> bouwt het wheel nu met <c2/> (manylinux-container) in plaats van met een ruwe <c3/> op de host, wat een sporadisch rustup-conflict <c4/>/<c5/> op het runner-image verhelpt. De job <c6/> installeert <c7/> als vooraf gebouwd binaryprogramma via <c8/> in plaats van via de op Docker gebaseerde <c9/>, wat een time-out bij het ophalen uit het Docker Hub-register verwijdert. Geen van beide wijzigingen beïnvloedt de uitgevoerde controles.

seg-05055c993904 = Inertiale snelheid wordt stroomafwaarts beschikbaar gesteld.

seg-1228235c99b6 = <c1/> en <c2/> (die <c3/> teruggeeft) voeren de analytische TEME-snelheid die SGP4 al berekent, en die eerder werd weggegooid, in m/s door naar aanroepers; <c4/> geeft het Kepler-pad een consistente snelheid. De verificatietest van AIAA 2006-6753 controleert nu ook de snelheid voor elke referentierij (slechtste snelheidsfout { "1.85e-9" } km/s over alle { "666" } toestanden) en legt het aantal vergeleken rijen vast op precies { "666" }.

seg-8ac2598291b8 = <b>Strengere TLE-parsing zonder panics.</b> Regels moeten ASCII zijn en worden veilig gesneden (geen byte-indexpanics meer bij multibyte-invoer); elementen worden op bereik gecontroleerd (inclinatie, excentriciteit, gemiddelde beweging); de checksum in kolom 69 kan worden afgedwongen via <c1/> / <c2/> en de nieuwe vlag <c3/> op <c4/> (standaard soepel).

seg-1cd2c6621a04 = <b>Allan-deviatiecurve in de uitvoer.</b> Elke klokrun geeft nu een <c1/> (<c2/>) weer en de playground in de browser toont een log-log-grafiek "Klokstabiliteit (ADEV)".

seg-c76ff20811e7 = Invoervalidatie van het tijdraster.

seg-75436d067802 = <c1/> weigert een niet-eindig, nul, negatief of te groot tijdraster (een stap groter dan de duur, of meer dan <c2/> samples) vóór enige allocatie, zodat een foutief scenario een fout teruggeeft in plaats van te paniekeren of het geheugen uit te putten.

seg-d0a8ce50cf6e = Monte Carlo-ensembles voor het inertiale pakket.

seg-3225674ce4ea = <c1/> op een inertiaal scenario draait N seeds en geeft per metriek het gemiddelde, de standaarddeviatie, percentielen en een percentiel-bootstrap-betrouwbaarheidsinterval van { "95" }% (<c2/>). Elke inertiale run draagt nu een vlag <c3/>, zodat een FoM uit één realisatie niet langer voor een verdeling wordt aangezien. (CEP/2DRMS worden bewust niet gerapporteerd; daarvoor is het 3-assige model nodig dat op de roadmap staat.)

seg-2967872bfca1 = <b>Begeleide playground-modus.</b> De playground in de browser zet u niet langer voor een muur van ruwe TOML: een strook "Begin hier" met scenariokaarten die met één klik een uitgewerkt voorbeeld laden en uitvoeren, schuifregelaars voor de universele instellingen (seed, tijdsynchronisatiedrempel) zonder de TOML aan te raken, een toelichting "Zo leest u dit" bij het resultaat, en de volledige TOML is één uitklapbaar paneel verder. Elke run is deelbaar: <b>Deellink kopiëren</b> codeert het hele scenario in het URL-fragment (er wordt niets geüpload), zodat een link bij het laden exact dezelfde run reproduceert. De codec is met unittests getest (<c1/>, uitgevoerd in CI).

seg-2e47e8864718 = N-dimensionale parametersweeps (<c1/>).

seg-5076a9ad20d7 = <c1/> evalueert een metriek over het volledige cartesische product van meerdere bereiken <c2/> (de afwegingsstudie met meerdere parameters), in rij-hoofdvolgorde, deterministisch. Additief: de bestaande 1-D-sweep-API is ongewijzigd. Betrouwbaarheidsintervallen via bootstrap per knooppunt en generalisatie voorbij het klokpakket blijven op de roadmap.

seg-958718831037 = <b>Echte snapshot-RAIM (<c1/>).</b> Echte Receiver Autonomous Integrity Monitoring in het positiedomein: het bouwt de zichtlijngeometrie naar de zichtbare satellieten, vormt de kleinstekwadratenoplossing en de residuen, voert een χ²-residutest voor foutdetectie uit (exacte drempel uit een afhankelijkheidsvrije onvolledige gamma-χ²/niet-centrale-χ²) en berekent hellinggebaseerde horizontale en verticale beschermingsniveaus (HPL/VPL) met de bias bij gemiste detectie afgeleid voor de ingestelde P_fa/P_md. Dit staat los van, en is <b>nog niet gekoppeld aan</b>, de integriteitsmaat van de scenariopipeline die de interne consistentie van het filter beoordeelt; foutuitsluiting, budgettering van alarmgrens/P_HMI en ARAIM blijven op de roadmap.

seg-1675540acbd9 = <b>Suite voor frequentiestabiliteit: MDEV, TDEV, HDEV + betrouwbaarheidsintervallen</b> (<c1/>). Naast de overlappende ADEV: de gemodificeerde Allan-deviatie (scheidt witte van flicker-faseruis), de tijdsdeviatie (<c2/>) en de Hadamard-deviatie (onderdrukt lineaire frequentiedrift exact en convergeert voor divergente roodruistypen). Op χ² gebaseerde betrouwbaarheidsintervallen (<c3/>) gebruiken een afhankelijkheidsvrij paar normaal/χ²-kwantielen (Acklam + Wilson-Hilferty) met een conservatieve niet-overlappende edf; ruistypespecifieke edf en numerieke pariteit met Stable32 blijven op de roadmap.

seg-446a9ed4467c = <b>Reductie van referentiestelsels (<c1/>).</b> Op GMST gebaseerde TEME↔ECEF-rotatie (met dezelfde IAU-1982-sterrentijd als de propagator), exacte geodetische WGS-84↔ECEF met een iteratieve inverse die met Bowring is gezaaid (machineprecisie op alle hoogten, ook MEO/GEO), en een geodetische waarnemer op een grondstation die azimut / elevatie / afstand teruggeeft in het lokale East-North-Up-stelsel. Poolbeweging en nutatie onder de boogseconde worden niet toegepast (alleen GMST, onder de kilometer op het grondspoor); een ITRF-nauwkeurige CIO-keten staat op de roadmap.

seg-9f6f53583cf5 = <b>Fundament voor tijdschalen (<c1/>).</b> Een afhankelijkheidsvrije API voor Juliaanse datums (Gregoriaans burgerlijk ↔ JD, MJD), de volledige IERS-geschiedenis van gehele schrikkelseconden (UTC↔TAI, { "10" } s in { "1972" } tot { "37" } s sinds { "2017" }), de gedefinieerde TAI→TT-offset, de UT1-correctie via een aangeleverde DUT1 en de IAU-2000 Earth Rotation Angle. Dit is het tijdsubstraat waarop de reductie naar aardvaste stelsels (gepland) rust. Tijdstippen zijn Juliaanse datums met één <c2/> (~{ "50" } µs resolutie rond het huidige tijdstip; een JD in twee delen staat op de roadmap), en het tijdperk vóór 1972 met rubberseconden wordt niet gemodelleerd; beide zijn in de module gedocumenteerd.

seg-6ecc053f101f = <b>Reproduceerbaarheid en herkomst.</b> Een deterministische CycloneDX-SBOM-generator (<c1/>) en een SLSA-bouwherkomstverklaring op het release-binaryprogramma en de SBOM; de release-toolchain is vastgezet zodat hij overeenkomt met CI. Garanties van determinisme, het platformoverschrijdende voorbehoud bij <c2/> en de aanpak van het vastzetten van golden-waarden zijn gedocumenteerd in <c3/>.

seg-3e98dcdcb82b = <b>Eigenschapsgebaseerde tests en fuzztests</b> (<c1/>). Deterministische gerandomiseerde tests (zonder nieuwe afhankelijkheid) toetsen invarianten over duizenden invoeren: de TLE- en scenarioparsers paniekeren nooit op rommel, niet-ASCII, gemuteerde of afgekapte invoer; <c2/> paniekeert nooit op NaN/inf/negatieve rasters; de TLE-checksum is consistent en betreft alleen kolom 69; rondgangen geodetisch↔ECEF en de TEME→ECEF-rotatie behouden de norm over de hele wereld en een brede hoogteband.

seg-ea252b5d7427 = Golden-tests leggen nu de <b>kwaliteitsmaten veld voor veld vast</b> voor de vier referentiescenario's (met een tolerantie die platformoverschrijdende <c1/>-jitter opvangt), ter vervanging van de eerdere controles met alleen ongelijkheden, zodat een stille numerieke regressie meteen wordt opgemerkt.

seg-4b2a0b78984b = <c1/> in resultaatartefacten is verhoogd van <c2/> naar <c3/> (hij was bevroren terwijl de engine verderging).

seg-ecafa9d44810 = <c1/> <b>weigert</b> nu (waarschuwt niet bij) ingetrokken (yanked) afhankelijkheden.

seg-c48af44de5b4 = Nieuwe documentatie: <c1/> (kaart van de eerlijke reikwijdte), <c2/> (naslag van resultaatvelden), <c3/>, <c4/>, <c5/>. Een CI-controle faalt als de versiebadge in de README afwijkt van <c6/>.

seg-8ef32ebec7f5 = <b>SGP4/SDP4-baanpropagatie.</b> Een volledige, afhankelijkheidsvrije implementatie van de standaard propagator met vereenvoudigde verstoringen: SGP4 voor banen dicht bij de aarde samen met de deep-space-uitbreiding SDP4 (lunisolaire seculaire en periodieke verstoringen en geopotentiaalresonantie van { "12" } h / { "24" } h). Hij is getoetst aan de officiële verificatievectoren van AIAA 2006-6753 ("Revisiting Spacetrack Report #3"): alle { "666" } referentietoestanden in de gevallen dicht bij de aarde, deep-space, resonant en foutcodes komen overeen met een positiefout in het slechtste geval van ongeveer { "4" } mm. Dit is het model waartegen two-line element sets zijn gedefinieerd, zodat het echte constellaties weergeeft, met name de GNSS-banen van ~{ "12" } h, die deep-space en resonant zijn en die het eerdere tweelichamen + J2-seculaire model niet kan vastleggen.

seg-06a77fb9233e = Een constellatie die als <b>volledige two-line element sets</b> (regel { "1" } + regel { "2" }) wordt gegeven, wordt nu gepropageerd met SGP4/SDP4; een constellatie die als elementen met alleen regel 2 wordt gegeven, behoudt de analytische Kepler-tweelichamenpropagatie, ongewijzigd. De twee vormen kunnen in één blok worden gemengd. Nieuw referentiescenario <c1/> (een GPS-achtige MEO-constellatie in echt two-line-formaat, gepropageerd met SGP4); voeg een actuele Celestrak-set "gps-ops" toe om de actuele constellatie te bestuderen.

seg-2dbb4054e9b8 = <b>Demonstrator voor actieve spoofing-aanvallen.</b> Een nieuw scenariotype <c1/> injecteert een oplopende valse-tijd-spoof en draait de kloksteunende integriteitsmonitor van elke klok, en meldt of en wanneer de spoof wordt gedetecteerd en of hij de operationele specificatie ongedetecteerd bereikt, waarmee de kwaliteitsmaat Security een concrete aanvals-/verdedigingsdemonstratie wordt. Nieuw referentiescenario <c2/>.

seg-aa0cb8038baa = <b>Beschikbaarheid met meerdere constellaties.</b> Een baanscenario kan meerdere constellaties combineren (een lijst <c1/> naast de primaire <c2/>) voor multi-GNSS-beschikbaarheid en verdunning van precisie, bijvoorbeeld GPS plus Galileo. Nieuw referentiescenario <c3/>.

seg-9b9dcd5be0a7 = <b>HTML-scorecardrapport.</b> Elke run levert nu ook een zelfstandige scorecard in HTML met huisstijl op: de samenvatting in één regel, de grafiek (ingebed als inerte data-URI-afbeelding) en de volledige JSON, door de CLI geschreven naast de JSON en SVG. Een deelbaar bestand in één stuk voor een studieresultaat of bijlage.

seg-76c573048a91 = <b>Gezamenlijke sensorfusieschatter.</b> Een nieuw scenariotype <c1/> draait één recursief Kalman-filter als navigatieoplossing: het fuseert de klokstatus <c2/> en de positiestatus <c3/>, gestuurd door GNSS (dat de frequentie-offset en snelheid leert) en ondersteund door optische tijdoverdracht tijdens de uitval, in plaats van onafhankelijke voorspellers samen te stellen. Het geeft gefuseerde holdover voor tijdsynchronisatie en positie en een integriteit op basis van de gezamenlijke covariantie. Nieuw referentiescenario <c4/>.

seg-10f0501c91ef = <b>Uitgebreider IMU-ruismodel.</b> De versnellingsmeter modelleert nu de overige Allan-variantietermen naast de constante bias en de snelheidsrandomwalk: <b>biasinstabiliteit</b> (een 1/f-flickervloer bij de standaard Allan-biasinstabiliteitscoëfficiënt, met hergebruik van de flickersynthese van de klok) en <b>versnellingsrandomwalk</b>. Nieuwe optionele velden <c1/> en <c2/> voor inertiale scenario's; een nieuwe GNSS-positiebepaling kalibreert de resterende biasdrift opnieuw.

seg-251ffc7b7722 = <b>Echte constellatiegeometrie uit TLE's.</b> Een constellatie kan via een veld <c1/> als blok two-line element sets worden gegeven (het standaardformaat van NORAD/Celestrak), zodat beschikbaarheid en verdunning van precisie de gepubliceerde geometrie van een echte constellatie gebruiken in plaats van een synthetisch Walker-patroon. De engine leest de gemiddelde Kepler-elementen van elke TLE en propageert ze als tweelichamenprobleem, niet met SGP4, wat deugdelijk is voor een momentopnamestudie vanaf een gemeenschappelijk tijdstip. Nieuw referentiescenario <c2/>.

seg-7deb93b51cc7 = <b>Parametersweeps voor afwegingsstudies.</b> Een nieuw scenariotype <c1/> varieert één parameter (<c2/>, <c3/>, <c4/> of <c5/>) over een lineair of logaritmisch bereik en legt op elk punt voor beide klokken een gekozen kwaliteitsmaat vast, wat de vergelijkingsgrafiek "hoe schaalt holdover met klokstabiliteit?" oplevert die een ontwerpafweging nodig heeft. Nieuw referentiescenario <c6/>.

seg-ef6f3e77b476 = <b>Monte Carlo-betrouwbaarheidsbanden.</b> Het scenario voor klok-holdover kan veel realisaties draaien (nieuw optioneel veld <c1/>): elke kwaliteitsmaat wordt dan gerapporteerd als gemiddelde met een spreiding tussen het 5e en 95e percentiel, en de grafiek arceert de foutenvelop van { "5" }–{ "95" }% rond de mediaan voor elke klok. Eén run blijft de standaard. Nieuw referentiescenario <c2/>.

seg-e70cc0973fa3 = <b>Excentrische banen en J2-drift.</b> Het baantype is nu een volledige Kepler-baan (halve lange as, excentriciteit, inclinatie, RAAN, argument van perigeum, gemiddelde anomalie), gepropageerd door de vergelijking van Kepler op te lossen, met optionele seculaire J2-knoopregressie en apsidenprecessie. Nieuwe optionele scenariovelden <c1/>, <c2/> en <c3/>, en een referentiescenario <c4/> (een gebruiker op een sterk excentrische baan met kritieke inclinatie van { "12" } h). Cirkelbanen behouden het oorspronkelijke pad in gesloten vorm bit voor bit.

seg-cc041e16d418 = Het hybride pakket (gecombineerde PNT) geeft nu <b>Integriteit</b> en <b>Security</b> weer, zodat alle vier de pakketten de volledige set operationele kwaliteitsmaten dekken. Integriteit is de insluiting binnen de beschermingsgrens van het tijdsynchronisatiekanaal, afkomstig van een Kalman-schatter die op de referentie wordt gestuurd zolang GNSS nominaal is en (losser) opnieuw wordt verankerd bij elke optische hersynchronisatie; de grens omvat de meetruisvloer van de link, zodat een klok die veel beter is dan de link wordt beoordeeld aan de werkelijke ruis van de geleverde oplossing. Security is de score voor kloksteunende spoofdetectie ten opzichte van de tijdsynchronisatiespecificatie.

seg-e0b666457d6e = Releasenotes worden nu gegenereerd uit de samengestelde sectie CHANGELOG voor de tag (<c1/>), zodat elke GitHub-release laat zien wat er is veranderd in plaats van ruwe commits op te sommen.

seg-f785718e9454 = Kwaliteitsmaat <b>Security</b> (voorheen niet ingevuld): een score voor kloksteunende spoofdetectie voor de pakketten voor klok-holdover en baan. Hij modelleert een integriteitsmonitor die over een coherent venster de uit GNSS afgeleide tijd vergelijkt met de eigen uitgelopen voorspelling van de klok; de detectievloer combineert de gemiddelde meetruis met de uitloponzekerheid van de klok, zodat een stillere klok kleinere, tragere tijdspoofs detecteert. De score wordt gerapporteerd in <c1/> ten opzichte van de tijdsynchronisatiespecificatie, waarmee de zes operationele kwaliteitsmaten compleet zijn.

seg-9164140872c8 = Uit de geometrie afgeleide <b>positienauwkeurigheid</b> voor het baanpakket: uit de zichtlijngeometrie naar de zichtbare satellieten vormt het de ontwerpmatrix en haar covariantiefactor <c1/>, wat de verdunningsfactoren van precisie oplevert (GDOP/PDOP/HDOP/VDOP/TDOP). Positienauwkeurigheid is de positie-DOP geschaald met een instelbare gebruikersequivalente afstandsfout (nieuw optioneel scenarioveld <c2/>). Een baanresultaat bevat nu een geometriesamenvatting (fractie van de samples met een positiebepaling, beste en mediane PDOP en positiesigma).

seg-3285502161c6 = Een <b>playground</b> in de browser (<c1/>) die de engine aan de clientzijde als WebAssembly draait: kies een referentiescenario of bewerk de TOML, voer het uit en bekijk de samenvatting, de grafiek en de volledige JSON, zonder dat er iets wordt geüpload. Een workflow <c2/> bouwt en publiceert hem op GitHub Pages, en een nieuwe WebAssembly-export <c3/> ondersteunt de weergave.

seg-0dca5318f7ce = Gelabelde y-assen op de SVG-grafieken: rasterlijnen, numerieke ticklabels en een astitel met eenheden (via een gedeelde helper <c1/>), zodat grootheden leesbaar zijn.

seg-ce84a3d61f19 = Publicatieworkflow voor pakketten (<c1/>) voor crates.io, PyPI en npm, elk afhankelijk van zijn registertoken en geactiveerd door een gepubliceerde release.

seg-0f01369fc29b = Flicker-FM-vloer (1/f) voor het klokfoutmodel, gesynthetiseerd als som van logaritmisch gespreide Ornstein-Uhlenbeck-processen en zo gekalibreerd dat de vlakke Allan-deviatievloer op een instelbaar niveau ligt. Standaard uit; per klok in te schakelen via het optionele scenarioveld <c1/>.

seg-5b7fcd386fd3 = Gyrokanaal voor het inertiale model: resterende gyrobias en hoekrandomwalk veroorzaken een attitudefout (kanteling) die de zwaartekracht koppelt aan een horizontale fout in de specifieke kracht, het dominante foutgroeimechanisme van strapdown. Standaard uit; per sensor in te schakelen via de optionele velden <c1/> en <c2/>.

seg-efe9f10d2641 = Kalman-klokschatter met twee statussen (fase, frequentie) met exacte discretisatie van procesruis volgens van Loan. Uitlopen vanuit een bekende toestand reproduceert de analytische groei van de holdoverfout (<c1/>) exact, en het filter levert bovendien een online onzekerheidsgrens van 1 sigma.

seg-539e24f34ed1 = De klokrun geeft nu de kwaliteitsmaat <b>Integriteit</b> weer (voorheen niet ingevuld): het aandeel uitvalsamples waarvan de fout binnen de beschermingsgrens van 3 sigma van het filter blijft, weergegeven in het JSON-resultaat en de CLI-samenvatting.

seg-80620c97e3f5 = Uit de geometrie afgeleide GNSS-beschikbaarheid: propagatie van cirkelbanen, een Walker-delta-constellatiegenerator en zichtlijnzichtbaarheid (aardocclusie plus elevatiemasker) leveren de beschikbaarheidstijdlijn uit echte baangeometrie. Nieuw scenariotype <c1/> en het referentiescenario <c2/> (een ruimtevaartuig binnen de GNSS-schil met onderbroken dekking).

seg-67549163ad7d = Optionele Python-extensie (PyO3, abi3) die <c1/>, <c2/> en <c3/> beschikbaar stelt, verpakt met maturin (<c4/>) en door een workflow <c5/> op release-tags gebouwd voor Linux, macOS en Windows. De binding is een optionele afhankelijkheid achter een feature-vlag: de standaardbuild, de tests en de poort voor afhankelijkheidsaudits worden niet beïnvloed.

seg-c76dc363f0b1 = Optionele WebAssembly-module (wasm-bindgen) die <c1/>, <c2/> en <c3/> beschikbaar stelt, gebouwd met wasm-pack onder de feature <c4/>; <c5/> is per doelplatform afgeschermd zodat op <c6/> de entropiebron van de browser wordt gebruikt.

seg-cf1b0eef2201 = Gedeelde dispatch <c1/> die de CLI en beide bindings gebruiken, zodat de opdrachtregel en de bindings niet uiteen kunnen lopen.

seg-8d4f855d11bd = Holdover-scoring is nu segmentbewust: uitvaltijdlijnen worden bij GNSS-heracquisitie in aaneengesloten segmenten verdeeld, en de gerapporteerde holdover is de uitloop in het slechtste geval (de kortste) over die segmenten. Scenario's met één uitval zijn ongewijzigd. Geldt voor de scorers voor klok, inertiaal en hybride.

seg-8b3556d125ed = De gerapporteerde <c1/> van het inertiale model is nu <c2/> (was <c3/>), wat de gecombineerde kanalen van versnellingsmeter en gyro weerspiegelt.

seg-d842f9cc0a9c = Eerste release.

seg-962b75c38735 = <b>Deterministische simulatie-engine</b> voor hybride kwantum/klassieke PNT: een gemeenschappelijke foutmodelinterface, declaratieve GNSS-beschikbaarheidsscenario's, schatters voor holdover / dode rekening en scoring van kwaliteitsmaten aan de standaard operationele PNT-criteria. Resultaten zijn reproduceerbaar uit <c1/> (versiebeheerde, zelfbeschrijvende JSON met een scenariohash) en worden weergegeven als SVG-grafieken. De CLI roept scenario's aan op <c2/>.

seg-16e574edc3a8 = <b>Vier sensorpakketten</b>, elk gekalibreerd op gepubliceerde data en getoetst aan de standaardrelatie:

seg-b49bbb60c2cd = <b>Klok-holdover</b>: witte FM, random-walk-FM en lineaire veroudering; getoetst met de overlappende Allan-deviatie (Riley, NIST SP { "1065" }). Atoomklok op chipschaal versus optische strontiumroosterklok.

seg-be2c5f28b256 = <b>Inertiale dode rekening</b>: resterende bias + snelheidsrandomwalk, tweemaal geïntegreerd tot positiefout; getoetst aan de foutgroeirelaties van Groves. Koude-atoomversnellingsmeter versus versnellingsmeter van navigatiekwaliteit.

seg-fcb0f72db736 = <b>Tijdoverdracht</b>: tijdsynchronisatiejitter van optische versus RF-link → synchronisatieprecisie → eenwegafstandsmeting.

seg-93e5f2f70b58 = <b>Hybride fusie (slotstuk)</b>: een gecombineerde PNT-suite die zowel tijdsynchronisatie als positie moet vasthouden, met optionele klokondersteuning door optische tijdoverdracht tussen satellieten.

seg-e0a8cbe0c105 = <b>Eén gedocumenteerd referentiescenario per pakket</b> onder <c1/>, waarbij elke numerieke parameter een peer-reviewde <c2/> draagt.

seg-8f1cc09b2513 = <b>Controles op reproduceerbaarheid en repositoryhygiëne</b>; CI (opmaak, clippy, tests, controles, MSRV) en een door tags geactiveerde releasepipeline die alle controles opnieuw uitvoert.

seg-8b4e21f56334 = <b>Documentatie</b>: README met architectuurdiagrammen, validatiestatusrapport, bijdragergids, beveiligingsbeleid en gedragscode; Apache-2.0-licentie; sjablonen voor issues/PR's en Dependabot-configuratie.

seg-e26d94f06ead = Overal leveranciersneutraal; peer-reviewde wetenschappelijke en metrologische bronvermeldingen blijven behouden.

seg-84cb67686edf = Hygiëne van de Apache-2.0-licentie: SPDX-headers op alle bronbestanden, een <c1/> met merkvermelding, ondertekening volgens het Developer Certificate of Origin (DCO) voor bijdragen, en afdwinging van licenties en advisories van afhankelijkheden door <c2/> in CI.

seg-a0f14bea7532 = Open-core-positionering (README): een gratis Apache-2.0-engine plus beschikbare commerciële ondersteuning, integratie en eigen uitbreidingen van Ashforde OÜ, gedragen door diensten en niet door licentieopbrengsten.

seg-899815063eb1 = <c1/> zodat de software kan worden geciteerd.

seg-15f45d8ccb0f = <s1>Vorige</s1>Waar Kshana staat

seg-cd8a14a9e8ec = <s1>Volgende</s1>Licenties
