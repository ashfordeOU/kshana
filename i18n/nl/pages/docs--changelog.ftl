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

seg-66749e5be121 = [{ $version }] - 2026-10-22

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
