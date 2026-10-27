# docs--positioning: translations (nl)

seg-6555ff9a6d8e = Uitvoer

seg-0be9b5747c00 = Kshana

seg-94058315dfe4 = Invoer

seg-09721fbcf7fc = Bron: <c1/>

seg-5b362d7b0903 = Kshana is een open, reproduceerbare <b>evidence-engine voor de veerkracht van PNT (positiebepaling, navigatie en tijdsynchronisatie)</b>. U beschrijft een scenario — de sensoren of klokken, een uitval van GNSS (global navigation satellite system), een jamming- of spoofingaanval, een budget — en de engine vertelt hoe goed tijd en positie standhouden, afgemeten aan operationele kwaliteitsmaten (FoM's). Elke mogelijkheid achter die cijfers is in een machinaal gecontroleerde matrix gelabeld als <b>VALIDATED</b> (getoetst aan een onafhankelijke externe referentie), <b>MODELLED</b> (intern consistent, niet extern gecontroleerd) of <b>PARTNER</b> (in handen van een hardwarepartner). Deze pagina zegt waar Kshana vooroploopt, waarvoor het dient en wat het niet is.

seg-48d576a345e3 = Waar het vooroploopt: tijdsynchronisatie en holdover voor kritieke infrastructuur

seg-f41d8a48ff13 = Het best getoetste deel van de engine is tijdsynchronisatie. Telecomnetwerken, elektriciteitsnetten en financiële handelsplaatsen ontlenen hun tijd aan GNSS, en elk moet de <b>holdover</b> dimensioneren: hoe lang een lokale klok vrij kan doorlopen tijdens een GNSS-verlies voordat haar tijdfout het budget overschrijdt.

seg-70d00c5fe203 = <b>Wat VALIDATED is.</b> De schatters voor frequentiestabiliteit waarop een holdover-antwoord is gebouwd — Allan-deviatie (ADEV), gemodificeerde Allan-deviatie (MDEV), tijdsdeviatie (TDEV), maximale tijdintervalfout (MTIE) en de Theo1-schatter met uitgebreid bereik — worden gecontroleerd aan de referentiedeviaties van Stable32, de onafhankelijke bibliotheek <c1/> en een echte gemeten cesiumklok. De berekening van de coast-variantie voor holdover en de inversie ervan naar een holdovertijd worden gecontroleerd aan SciPy. Zie <a1><c2/></a1> voor elke rij, de bijbehorende test en het orakel.

seg-9fbedc930565 = <b>Wat MODELLED blijft.</b> De ruisvloeren per klokklasse (bijvoorbeeld de langetermijnvloer van een bepaalde oscillatorklasse) bepalen het antwoord voor een stabiele klok, en het zijn representatieve cijfers, geen metingen van uw apparaat. Lever gemeten vloeren aan voor een getal dat u wilt verdedigen.

seg-700df4898ede = <b>Telecom-eenheden.</b> Het scenariotype <c1/> rapporteert MTIE en TDEV, toetst ze aan de maskers van de International Telecommunication Union Telecommunication Standardization Sector (ITU-T) — G.8272 voor een primaire referentietijdklok (PRTC), G.8272.1 voor een verbeterde PRTC (ePRTC), G.8273.2 voor een telecom-boundaryklok (T-BC) en G.8271.1 voor de netwerklimieten bij referentiepunt C — en rapporteert hoe lang een holdover binnen elk tijdfoutbudget blijft. Zie <a1><c2/></a1>.

seg-50421d8247ab = Wat het anders maakt

seg-7ec913b140ed = De fysica en de standaarden maken het verschil niet: Simplified General Perturbations { "4" } (SGP4)-propagatie, Allan-deviatie, referentiestelsels en dilution of precision zijn in andere bibliotheken beschikbaar, gratis en correct, en Kshana controleert zichzelf aan verschillende ervan. Het verschil is de bewijsdiscipline:

seg-f7d466d5215b = <b>Open.</b> De engine valt onder de GNU Affero General Public License (AGPL), zodat iedereen haar kan lezen en opnieuw kan uitvoeren. Voor gesloten integratie bestaat een commerciële licentie.

seg-76ff24c1939b = <b>Reproduceerbaar.</b> Een resultaat wordt bit voor bit bepaald door <c1/>, en een run kan als link naar de browserplayground worden gedeeld.

seg-6df34e089b53 = <b>Met herkomstlabel.</b> Elke sensorparameter is herleid tot een gepubliceerde bron (<a1><c1/></a1>), en elke mogelijkheid draagt haar niveau VALIDATED / MODELLED / PARTNER. Een bewaking in de continue integratie (CI) weigert een VALIDATED-rij zonder onafhankelijk extern orakel, zodat een interne zelfcontrole niet als validatie kan worden gepresenteerd.

seg-8bccfe110f4c = Wij hebben geen andere open tool gevonden die dit combineert voor holdover, integriteit, traagheidsoverbrugging en kwantumsensoren, maar een zoekopdracht die niets vindt, bewijst niet dat er niets bestaat; wij beweren niet de enige te zijn.

seg-e942b2474960 = Quantum: een neutrale afwegingsmethode, resultaten gelabeld MODELLED

seg-655769464447 = Kshana vergelijkt quantum- en klassieke klokken en traagheidssensoren op hetzelfde scenario met dezelfde code: elk apparaat is een foutmodel en de engine weet niet welk daarvan "quantum" is. Beschouw het als <b>een neutrale afwegingsmethode tussen quantum en klassiek waarvan de resultaten zijn gelabeld MODELLED</b>. De meeste invoer bestaat uit gepubliceerde Allan-/ruisbudgetcoëfficiënten; de versnellingsmeter met koude-atoominterferometer heeft een laag op basis van eerste principes dat zijn ruiscoëfficiënt afleidt. Gemeten Allan-deviatiegegevens van een partner kunnen via het type <c1/> worden ingevoerd; dat is de route om de cijfers van een specifiek apparaat te bevorderen. Zie <a1><c2/></a1> en <a2><c3/></a2>.

seg-eb5d247b42aa = Maan, cislunair en diepe ruimte: onderhouden, niet de kopattractie

seg-4b9bd68b7fb1 = De suite voor de Maan en het cislunaire gebied (integriteitsbewaking op de Maan, de drielichamenkern Aarde–Maan, maantijdschalen, analyse van het servicevolume) en de engine voor radiometrische navigatie in de diepe ruimte zijn onderhouden mogelijkheden. De meeste van hun rijen zijn MODELLED, en er bestaan al speciale tools voor navigatie op de Maan, dus ze worden aangeboden als mogelijkheden van dezelfde engine, elk met een eigen niveau, en niet als voornaamste aanbod.

seg-26f242f1bef8 = De rest van de engine

seg-b9b2e29e51d9 = Dezelfde engine, met dezelfde niveaus, dekt ook:

seg-89d1923b3ed9 = <b>PNT in een lage baan om de aarde (LEO), van begin tot eind.</b> Signaalontwerp (<c1/>), passage en linkbudget per band (<c2/>), uitgezonden navigatiebericht (<c3/>), gefuseerde positiebepaling in middelhoge en lage aardbanen (<c4/>), convergentie van precise point positioning (PPP) met LEO-aanvulling (<c5/>), positiebepaling vanuit een niet-terrestrisch 5G-netwerk (<c6/>) en <c7/>, dat de uitvoer van elke fase doorgeeft aan de volgende voor één systeem.

seg-2e5b57ccd454 = <b>Spectrum.</b> Een waterval van de vermogensspectrale dichtheid in L-band (en ultrahoge frequentie (UHF), S- en C-band) onder een gescripte jammertijdlijn, met per band de jammer-tot-signaalverhouding en de effectieve draaggolf-ruisdichtheid (<c1/>), plus opname en weergave in Signal Metadata Format (SigMF).

seg-0e7fd993a838 = <b>Het zonnestelsel en elk centraal hemellichaam.</b> Posities en fysische constanten van de planeten en grote manen (<c1/>), positiebepaling rond elk van die lichamen (<c2/>), en ontwerp van Walker- en uit gepubliceerde slots opgebouwde constellaties met dekkings- en dilution-of-precision-kaarten rond elk ervan (<c3/>).

seg-9d993a356eb0 = <b>Campagnes.</b> Bestaande typen aaneengeschakeld op één gedeelde tijdlijn, doorgerekend met een sweep, uitgevoerd als Monte Carlo-ensembles met seed, of naast elkaar uitgevoerd onder gedeelde omstandigheden (<c1/>).

seg-905a9aa8c47c = <b>Uitvoer.</b> Elke run schrijft een resultaatdocument, een grafiek en een rapport in HTML (HyperText Markup Language) en JSON (JavaScript Object Notation); <c1/> schrijft een animatie als SVG (Scalable Vector Graphics), HTML of reeks frames; <c2/> schrijft CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON of STK-efemeriden (Systems Tool Kit) voor de typen die dingen op de Aarde plaatsen, en SigMF voor <c3/>.

seg-75206591a52a = De meeste van deze rijen zijn MODELLED; de verificatiematrix noemt de enkele die VALIDATED zijn (bijvoorbeeld de aanbevelingen van de International Telecommunication Union voor regen en scintillatie, het algoritme voor de uitgezonden Galileo-efemeride, de CRC-24Q-framecontrole (24-bits cyclische redundantiecontrole) en de oplosser voor de lichttijd van planeten).

seg-785218a0ea66 = Wat Kshana niet is

seg-fae54ec38477 = <b>Geen simulator voor radiofrequente (RF) signalen en geen hardware-in-the-loop-opstelling (HIL).</b> Kshana stuurt geen radiohardware aan en zendt niets uit. Het grootste deel werkt op het niveau van foutmodellen en linkbudgetten, voordat hardware of laboratoriumtijd wordt aangeschaft. Op signaalniveau is het uitsluitend software: de GNSS-IQ-laag (<c1/>) schrijft basisband-IQ-samplebestanden (in-phase/quadrature) van legitieme GNSS-signalen voor software-ontvangers en draait er haar eigen software-ontvanger op; de sectie <c3/> van het type <c2/> (sinds { "0.29.0" }) schrijft een SigMF-snapshot (Signal Metadata Format) van haar analytische model inclusief de geconfigureerde jammers (ruisachtige jammers per bin, tonen en chirps als golfvormen); en <c4/> telt in het geheugen een authentiek signaal en een replicasignaal van een spoofer op om het vastlopen van de lus te testen, zonder het weg te schrijven. Een hardware-ontvanger testen met een echte RF-stimulus is het werk van een RF-simulator.

seg-ca243f3f8e8d = <b>Geen vervanging voor MATLAB/Simulink, STK of Orekit.</b> Het staat ernaast. Het leest en schrijft de uitwisselingsformaten die zij gebruiken — CCSDS-orbit-efemeridenberichten (Consultative Committee for Space Data Systems), nauwkeurige SP3-banen (Standard Product { "3" }), RINEX (Receiver Independent Exchange Format) — schrijft CZML, KML, GeoJSON en STK-efemeriden voor hun viewers, en het numerieke krachtmodel wordt gecontroleerd tegen Orekit in plaats van in zijn plaats aangeboden.

seg-8fa4e93c3d0e = <b>Geen verwerkingsengine voor GNSS-draaggolffase en geen positioneringsdienst</b> (zie hieronder).

seg-8ba4b67bc813 = <b>Geen certificeringsinstantie.</b> Een label VALIDATED betekent dat een mogelijkheid overeenkomt met een extern orakel; het is geen certificering van enig product of enige exploitant.

seg-362b857140b9 = Wat Kshana is, en niet is, naast een GNSS-verwerkingsengine

seg-f50951b2e9c8 = Kshana is <b>geen</b> <em>verwerkings</em>engine voor GNSS-draaggolffase, en geen enkel scenariotype is een positioneringsdienst. Het heeft wel een voet in het meetdomein, als bibliotheekcode waarop de prestatiestudie leunt en die aan onafhankelijke referenties wordt gecontroleerd. Real-time kinematische positiebepaling (RTK) op korte basislijn met geheeltallige fixatie via LAMBDA (least-squares ambiguity decorrelation adjustment) draait op echte dubbelfrequente RINEX-waarnemingen, evenals een statisch float-filter voor precise point positioning (PPP) met definitieve IGS-banen en -klokken, en de ontvangerklok die dat filter schat is een tijdoplossing ten opzichte van de definitieve IGS-stationsklok. Elk van de drie is een VALIDATED-rij van de <a1>verificatiematrix</a1>, getoetst aan de IGS-stationsgegevens die daar worden genoemd, en elk draait op statische, korte waarnemingsvensters, niet als streamingdienst met ambiguïteitsoplossing over lange basislijnen, draaggolfafvlakking of een kinematische rover. Het type <c1/> draait een float-PPP-filter op code en draaggolffase, maar op metingen die het zelf simuleert, om de convergentietijd met en zonder LEO-aanvulling te bestuderen; het verwerkt geen waarnemingsbestand. Het type <c2/> (positie, snelheid en tijd) lost een ontvangerpositie op uit echte RINEX-codepseudoranges plus uitgezonden efemeriden, getoetst aan een ingemeten coördinaat van de International GNSS Service (IGS) (station ABMF, 2018-05-13) tot <b>{ "5.7" } m 3D-RMS (root mean square) / { "1.1" } m horizontaal</b>. Maar het product is de prestatiestudie, niet de positioneringsdienst, en de onderstaande kadering is bedoeld om een toekomstige gebruiker de teleurstelling van het verkeerde gereedschap te besparen.

seg-169dd778c45f = Een GNSS-verwerkingsengine (RTKLIB, een opensource-bibliotheek voor real-time kinematische positiebepaling; gLAB, de GNSS-laboratoriumtoolsuite van de gAGE-groep van de Technische Universiteit van Catalonië)

seg-4faa1de0ef70 = een scenario: foutmodellen van sensoren, uitvalvensters, geometrie — of, voor <c1/>, een echt RINEX-waarnemingsbestand plus uitgezonden navigatiegegevens

seg-ae60d0def8af = echte GNSS-waarnemingen (RINEX), efemeriden, correcties

seg-5fce99bb803d = prestatie-FoM's: holdover, tijd- en positiefout, beschikbaarheid, grenzen voor integriteit en beveiliging — plus een code-single-point-positioning-positie (SPP) uit het type <c1/>

seg-b752bb5c3f64 = een <b>oplossing</b> voor positie, snelheid en tijd (SPP, PPP, RTK)

seg-dd8a47d4f618 = Vraag die het beantwoordt

seg-b52fd8e0c856 = "hoe goed <em>zou</em> deze architectuur zijn, en waar breekt ze?"

seg-09672ca004ac = "waar ben ik <em>nu</em>, gegeven deze metingen?"

seg-00d5ebd56088 = Quantum- / optische sensoren

seg-a55f2bd6c1bf = gemodelleerd als foutmodellen (optische klokken, koude-atoom-traagheidsmeeteenheid (IMU), optische tijdoverdracht), resultaten gelabeld MODELLED

seg-7ccfb3395d84 = niet gemodelleerd

seg-ec21dbf4b910 = Verwerking van echte waarnemingen

seg-324ef9a933d5 = code-SPP uit echte RINEX-waarnemingen (<c1/>, op meterniveau); RTK op korte basislijn met LAMBDA en statische float-PPP op echte draaggolffase, als bibliotheekcode gecontroleerd aan IGS-stations (VALIDATED, statische en korte vensters, geen streamingdienst); plus geometrie / dilution of precision (DOP) / beschikbaarheid

seg-e15db8a33a9a = de kerncompetentie, tot en met PPP/RTK op draaggolffase

seg-e6df7ccdba96 = nul — draait in een browsertabblad (WebAssembly)

seg-812c1c70ce63 = native build / toolchain

seg-58df67617e1a = Aanvullend, niet concurrerend — RTKLIB en gLAB

seg-29aeb97bd509 = <a1>RTKLIB</a1> en <a2>gLAB</a2> zijn volwassen, veelgebruikte GNSS-verwerkingssuites. Ze nemen echte metingen en leveren een positieoplossing (SPP/PPP/RTK; gLAB is ook een uitstekend onderwijsinstrument met een sterke staat van dienst bij de European Space Agency (ESA) en de European Geostationary Navigation Overlay Service (EGNOS)). Kshana vervangt ze <b>niet</b> en probeert dat ook niet. Het waarnemingspad is smal: code-single-point-positioning (<c1/>) en, als gecontroleerde bibliotheekcode, RTK op korte basislijn met geheeltallige fixatie via LAMBDA en een statisch float-PPP-filter op echte dubbelfrequente waarnemingen, elk VALIDATED aan IGS-stationsgegevens (het PPP-filter ook aan een RTKLIB-run op dezelfde invoer). Het heeft geen draaggolfafvlakking, geen kinematische of streamingverwerking en geen ambiguïteitsoplossing op lange basislijnen, en <c2/> schat de troposfeer of ionosfeer niet — het past de troposfeermodellen van Saastamoinen/Niell en de ionosfeervrije L1/L2-combinatie toe, het lost ze niet op als toestanden.

seg-9c4e70ce8a55 = De pijplijn is aanvullend:

seg-01f43da4858c = <b>RTKLIB / gLAB</b> beantwoorden <em>"waar ben ik, op basis van deze signalen?"</em>

seg-f5370894cdd1 = <b>Kshana</b> beantwoordt <em>"hoe lang houd ik een goed antwoord als die signalen wegvallen — en wat levert een betere klok of traagheidssensor, klassiek of quantum, mij op?"</em>

seg-2403d6b115de = Een natuurlijke werkwijze gebruikt een verwerkingsengine voor het segment waarin GNSS beschikbaar is en Kshana om het <b>holdover</b>-gedrag en de ruimte voor sensorafwegingen eromheen te bestuderen. Als u een positioneringsdienst op draaggolffase nodig hebt — kinematische PPP of RTK, lange basislijnen, netwerkambiguïteitsoplossing — gebruik dan RTKLIB of gLAB; als u reproduceerbaar, gelabeld bewijs nodig hebt over veerkracht en holdover, is dat het werk waarvoor Kshana is gebouwd.

seg-21631e5c6be3 = Een browserniveau zonder installatie

seg-9b01dd6721ed = De meeste simulatietools op dit gebied (RTKLIB, gLAB, de General Mission Analysis Tool (GMAT), Orekit, STK) vereisen een native installatie of een licentie, en een leercurve voor het eerste resultaat. Kshana compileert naar WebAssembly en draait <b>volledig in de browser</b> — de <a1>playground</a1> laadt een uitgewerkt scenario, voert de echte engine aan de clientzijde uit (er wordt niets geüpload) en toont het resultaat in seconden. Begeleide schuifregelaars en scenario's met één klik betekenen dat het eerste bruikbare resultaat geen TOML (Tom's Obvious Minimal Language, het bestandsformaat van scenario's) en geen toolchain vereist.

seg-b1cb4b8f0ef1 = Dat browserniveau zonder installatie is een bewuste keuze:

seg-33b361bde50d = <b>Bereik</b> — een beoordelaar, student of inkoper kan de werkelijke engine via een link uitproberen, op elk apparaat, zonder installatie.

seg-a4a4ebf89cee = <b>Reproduceerbaarheid</b> — dezelfde engine die in de browser wordt geleverd is de bibliotheek die op crates.io, de Python Package Index (PyPI) en npm wordt geleverd; een resultaat is reproduceerbaar uit <c1/>, en een run kan als URL (webadres) worden gedeeld.

seg-3d3d4bda606c = <b>Eerlijkheid</b> — de engine zelf, openlijk, uitvoeren is het sterkste tegenwicht tegen "vertrouw de getallen": het browserniveau <em>is</em> het auditoppervlak.

seg-6095bcacb725 = Het browserniveau maakt van Kshana geen vervanging voor een desktopverwerkingssuite — het maakt de vraag naar de prestatie-afwegingsstudie toegankelijk voor mensen die er nooit een zouden installeren.

seg-938ca8eab04c = <a1><c1/></a1> — de scopekaart rij voor rij (de volledige scope en de residuen van de solver <c2/> staan in de rij <b>GNSS- / PNT-verwerking</b>).

seg-9e94b1740386 = <a1><c1/></a1> — wat is getoetst, met bewijs.

seg-3a02f39bd90a = <a1><c1/></a1> — het type voor telecomtijdsynchronisatie en zijn maskers.

seg-c5aa08e4ca55 = <a1><c1/></a1> — definities in gewone taal van de hier gebruikte termen.

seg-85aaaa34ea7c = <a1><c1/></a1> — de browserplayground.

seg-54e2deeffc7d = <s1>Vorige</s1>Architectuur

seg-b2f93c49d5c6 = <s1>Volgende</s1>Wijzigingslogboek
