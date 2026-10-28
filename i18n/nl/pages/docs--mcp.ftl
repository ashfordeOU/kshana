# docs--mcp: translations (nl)

seg-261c059bec54 = Adviserend, geen typegoedgekeurde navigatieapparatuur: de exploitant blijft verantwoordelijk voor de navigatie. De server draait op uw computer; er wordt niets naar Ashforde OÜ verzonden.

seg-13641146503d = Cursor (één klik)

seg-3bd13fe295f4 = VS Code (één klik)

seg-fea7b394cdde = npx

seg-76fcc8024f2f = uvx / pipx

seg-deb5187472d1 = Homebrew

seg-491167f2310c = Scoop

seg-5c425ea185ee = Vooraf gebouwde binary

seg-d107bc8e1950 = MCP-register

seg-842b77a21c5f = Kanaal

seg-d6476863f862 = Mogelijkheid

seg-fdbb9db68f1d = geen

seg-1759a8cce7d6 = Soorten

seg-564133d6a0c4 = Constellaties rond elk lichaam

seg-b88a2a9497c2 = Hulpmiddel

seg-a683980168f7 = Docker

seg-f3a2279d6df7 = Opdracht of knop

seg-20c5ae650eb7 = Vereist

seg-af4d3ce85e11 = Vastgepinde vorm

seg-0fdd85a80584 = <a1>npx (Node)</a1> · <a2>Docker</a2>

seg-b02bdf7c7661 = Node, of Docker

seg-de23dcdd2647 = <a1>npx (Node)</a1> · <a2>Docker</a2> · <a3>Insiders (npx)</a3>

seg-abf8b5fe685a = Node { "18" }+

seg-06299cefbf9e = Python { "3.9" }+ met uv of pipx

seg-26795c302f8a = brew

seg-ded975fa67fa = formula voor v{ $version }

seg-667d6dde705b = <c1/> en daarna <c2/>

seg-f6e9fc5f46fe = Scoop (Windows)

seg-bc4762d20004 = manifest voor v{ $version }

seg-f7c0a2fbb0b5 = winget

seg-9e599ab3c0a3 = winget (Windows)

seg-091d1404bb8a = cargo

seg-145ddf98e77f = Rust { "1.88" }+

seg-b308519d4c8d = <a1>de releasepagina</a1>: <c1/> (Linux x86-64), <c2/>, gecontroleerd met <c3/> en <c4/>

seg-c39cac69f700 = v{ $version }

seg-e8f5e2b6580b = <c1/> (gevonden door clients die het register gebruiken)

seg-b1a6e807f06f = een client die het register gebruikt

seg-d5a3818ac3b6 = Op afstand (streamable HTTP)

seg-5f1397b1ea30 = uw eigen host

seg-e7acd0ff4c84 = Bron: <c1/>

seg-81a87d14efda = Kshana: het merkteken, een kompasvizier dat het precieze moment markeert, naast het woordmerk kshana

seg-3d5232472e42 = kshana-mcp: vraag het aan uw AI-assistent en de engine antwoordt

seg-ef90bf1e0b51 = <c1/> is een <a1>Model Context Protocol</a1>-server (MCP) voor <b>Kshana</b>, de opensource-simulator voor de veerkracht van PNT (positiebepaling, navigatie en tijdsynchronisatie). Hij laat een AI-assistent (kunstmatige intelligentie) de echte engine draaien en de JSON (JavaScript Object Notation) teruglezen, in plaats van de wiskunde te raden. Hij communiceert via stdio (standaard in- en uitvoer) met elke MCP-compatibele client, waaronder Cursor en JetBrains AI Assistant / Junie.

seg-1fddef4e9a49 = De wiskunde waarvoor Kshana aan een onafhankelijke externe referentie is getoetst, is precies waar een taalmodel slecht raadt: SGP4 (Simplified General Perturbations { "4" }) baanpropagatie, referentiestelsels van de IAU (International Astronomical Union), Allan-deviaties, beschikbaarheid van GNSS (Global Navigation Satellite System) en DOP (dilution of precision), beschermingsniveaus van ARAIM (advanced receiver autonomous integrity monitoring), fusie van GNSS en INS (inertial navigation system) en modellen van kwantumsensoren. Stel een vraag; de assistent draait een echt scenario en krijgt kwaliteitsmaten met hun herkomst en hun label VALIDATED of MODELLED.

seg-d51681f30e8f = Eén open engine in het midden, met de MCP-server als een van zijn oppervlakken naast de opdrachtregel, de Rust-bibliotheek, Python, WebAssembly en Kshana Studio, het Docker-image en de JetBrains-plug-in; elk oppervlak draait dezelfde engine en Kshana Pro is ervan afhankelijk zonder hem te forken

seg-2a56e1f52830 = Hulpmiddelen

seg-b847694d91b5 = Een scenario draaien vanuit een TOML-definitie (Tom's Obvious, Minimal Language); geeft de samenvatting plus de volledige resultaat-JSON (JavaScript Object Notation: kwaliteitsmaten, curven) terug. Met de optionele <c1/> komt de grafiek terug als SVG (Scalable Vector Graphics).

seg-3c00da00ec30 = Controle vooraf: de TOML parsen en de soort ervan bepalen, zonder te draaien.

seg-4516fd1e665c = De meegeleverde referentiescenario's als JSON: elk met zijn <c1/>, zijn <c2/> en één zin over wat het toont. Optioneel filter <c3/>. Elk voorbeeld draait zoals het is, dus dit is de snelste weg naar een geldige TOML voor een soort.

seg-61db4a94ad72 = De TOML-tekst van één meegeleverd referentiescenario, byte voor byte het bestand onder <c1/>.

seg-306f7a835bb9 = Een scenario draaien en het rapport teruggeven: samenvatting voor het management, invoer, elk cijfer met zijn eenheid en zijn label VALIDATED of MODELLED, gebeurtenissen, de uitgeoefende mogelijkheden en een reproduceerbaarheidsrecord. <c1/> is <c2/> (standaard) of <c3/> (de afdrukbare pagina in één bestand).

seg-bdacef6d5133 = Een scenario draaien en zijn tijdreeks als animatie teruggeven: <c1/> (standaard), <c2/> (een zelfstandige speler) of <c3/> (hoogstens { "120" } in een antwoord). Het eerste inhoudsitem is een JSON-samenvatting van wat is getekend; de bestanden volgen. Een soort zonder bemonsterde tijdas wordt met de reden geweigerd.

seg-313f7594bd81 = Welke uitwisselingsformaten van toepassing zijn op een scenario (<c1/>, <c2/>, <c3/>, <c4/>, <c5/>), de reden wanneer een formaat niet van toepassing is, en de specificatie die elke schrijver volgt. Draait het scenario niet.

seg-e63b7853bb96 = Een scenario exporteren als CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON, STK (Systems Tool Kit)-efemeride <c1/>, of SigMF (Signal Metadata Format, voor een <c2/>-scenario met een <c3/>-blok). Het eerste inhoudsitem is een JSON-index van de bestanden (achtervoegsel, grootte, codering en de SHA-256-digest, de 256-bit Secure Hash Algorithm); de bestanden volgen, het binaire SigMF-samplebestand als base64.

seg-074e914789c5 = Een GeoJSON-route <c1/> in een scenario schrijven dat een waypointtraject vliegt (<c2/>, <c3/>, <c4/>, <c5/>) en de nieuwe TOML teruggeven.

seg-ae58a8577aa7 = De constellatie van een <c1/>-scenario exporteren als SP3-c (Standard Product { "3" }, revisie c) precieze efemeride.

seg-6a59aacf26bb = De elementen van een <c1/>-scenario exporteren als CCSDS (Consultative Committee for Space Data Systems) 502.0-B-2 OMM-catalogus (Orbit Mean-elements Message).

seg-5562b319968b = De toestandsreeks van een <c1/>-scenario exporteren als CCSDS OEM-efemeride (Orbit Ephemeris Message) { "2.0" } — de TEME-reeks (true equator, mean equinox) van positie <em>en</em> snelheid die vluchtdynamicahulpmiddelen (GMAT, de General Mission Analysis Tool; Orekit; STK, de Systems Tool Kit) lezen; het aanvullende formaat met snelheid naast het alleen-positieformaat <c2/>.

seg-b0cf13e530b7 = Een scenario draaien en zijn reproduceerbaarheidstabel als CSV (comma-separated values) teruggeven — de byte-stabiele tabel die de CLI (command-line interface) schrijft als <c1/>. Alleen <c2/>, <c3/>, <c4/>, <c5/>, <c6/> (zijn <c7/>-analyse op een <c8/>- of <c9/>-berichtmodel) en <c10/> met <c11/> + <c12/> ingesteld leveren er een; elke andere soort geeft een fout die deze noemt.

seg-ab242cd0259c = Hemelgeometrie onder een azimutafhankelijke skyline: vanaf een locatie, een tijdstip en constellatievoorinstellingen, two-line element sets (<c1/>, door SGP4 gepropageerd naar een UTC-<c2/>) of satellieten als azimut/elevatie of ECEF, de zichtbare satellieten en de door de skyline verborgen satellieten, GDOP/PDOP/HDOP/VDOP/TDOP uit de door gnss_lib_py gecontroleerde DOP-kernel, de east-north-up-cofactor en -covariantie (één klok per systeem of één gemeenschappelijke) en de horizontale foutellips; met <c3/> in plaats van <c4/>, een REPRESENTATIVE voorinstelling met haar herkomst en haar afsnijding per graad. MODELLED; draagt het advies; geen Monte Carlo via MCP. Zie <a1><c5/></a1>.

seg-d6ed4e8d56e5 = Een echt GNSS-ontvangerlog (global navigation satellite system) beoordelen op vertrouwen. De TOML noemt het <c1/> van het log (<c2/>, <c3/>, <c4/>, <c5/> of <c6/>) en geeft de bytes ervan inline als <c7/> of <c8/>; het hulpmiddel draait de vertrouwensmonitors (daling van de draaggolf-ruisdichtheid, verlies van lock, AGC (automatic gain control), jamming-indicator, positiesprong en, met RINEX plus broadcast-navigatie, RAIM (receiver autonomous integrity monitoring) en een klokondersteunde monitor) en geeft terug wanneer en waarom de positiebepaling niet meer betrouwbaar was. Optionele secties <c9/> en <c10/> scoren opgegeven gebeurtenissen en voorspelde C/N0-dalingen tegen opgegeven toleranties. Een tabel <c11/> kiest de maritieme monitors en voegt per epoch een vertrouwensscore van 0-100 toe met de monitors die hebben afgetrokken (adviserend; MODELLED). Het log gaat inline als <c12/> of <c13/> (hoogstens { "4" } MiB). Grafiek en CSV per epoch op verzoek. Zie <a1><c14/></a1>.

seg-d1a967a443ea = Een begrensd NMEA { "0183" }-fragment scoren (hoogstens { "2" } MiB en { "20,000" } epochs; het moet het kalibratievenster bevatten) zoals <c1/> het scoort: vertrouwenstoestand en score van 0-100 per epoch met de monitors die hebben afgetrokken, een samenvatting en de laatste <c2/>. De begrensde vorm van de live-opdracht: er wordt geen socket geopend en er wordt niets naar een poort geschreven; de gate, <c3/> en de telemetrie-exporters (Prometheus, OTLP, syslog) zijn alleen via de opdrachtregel beschikbaar. Alleen adviserend; MODELLED. Zie <a1><c4/></a1>.

seg-89e894d4b416 = Het NMEA { "0183" }-log van een vaartuig (hoogstens { "4" } MiB) als batchrun, met de sessie-TOML die de grenzen van het vaartuig vermeldt: het scoremodel en de score van 0-100 van elke epoch met zijn aftrekposten (het antwoord houdt aantallen per toestand bij en de eerste { "200" } gedegradeerde of onbetrouwbare epochs). Alleen adviserend; MODELLED.

seg-27698c80b7f1 = De gepubliceerde Jammertest-testcatalogus en zendplanning (NPRA/jammertest-plan, MIT) lezen als geplande referentie (<c1/>): de slots van één testgebied worden ontvangervertrouwen-gebeurtenissen met de catalogus-id en het jaar in elk label. Geplande slots, geen opgenomen uitzendtijden; er wordt geen contactveld van het plan gelezen. MODELLED. Zie <a1><c2/></a1>.

seg-23daf6121ca0 = Een ontvangerlog scoren tegen die planning (<c1/>): per test de detectielatentie, gemiste alarmen en hersteltijd, en de valse alarmen buiten elk slot. Tekstlogs als <c2/>, binaire (<c3/>, <c4/>) als <c5/>. Een ondertekend pakket vereist een sleutel: opdrachtregel. Alleen adviserend; MODELLED.

seg-0ca5b319e850 = Een ondertekend bewijspakket voor een venster van het log van een vaartuig (<c1/>): de ruwe logbytes voor het venster, de configuratie, de resultaten en redenen per epoch, een samenvattingspagina en een manifest met elke SHA-256 en een hashketen, ondertekend met Ed25519. De ondertekeningsseed wordt nooit teruggegeven of gelogd; zonder seed wordt een eenmalige sleutel gebruikt, dus het pakket bewijst integriteit, geen identiteit. Een technisch record, geen juridisch oordeel. Zie <a1><c2/></a1>.

seg-8df4c6fb851d = Een RFC { "3161" }-tijdstempeltoken (base64 van de <c1/>-bytes) aan een pakket koppelen, in het geheugen (<c2/>); het pakket met het token moet nog steeds verifiëren. De handtekening van de tijdstempelautoriteit wordt niet gecontroleerd: gebruik <c3/>.

seg-1f7a6f7f005a = Een pakket verifiëren (<c1/>): elke hash, de keten, de handtekening en, met de publieke sleutel van de ondertekenaar en het volledige log, wie het heeft ondertekend en dat het fragment uit dat log komt. Noemt elke fout en elk bestand. Het <c2/> is <c3/> (ondertekenaar vastgepind), <c4/> (alles klopt, maar er is geen publieke sleutel opgegeven, dus de ondertekenaar is niet vastgesteld) of <c5/>; <c6/> laat een pakket zonder tijdstempeltoken falen.

seg-c43761e01f63 = Synthetisch brug-NMEA { "0183" } voor bemanningstraining uit een <c1/>-TOML (jamming, positie-wegtrekken, tijdspoofing, replay-vertraging) met het instructeurslog (<c2/>); deterministisch per seed. Alleen tekst: er wordt niets gesynthetiseerd op RF- of IQ-niveau en niets uitgezonden; nooit voor de actieve navigatiesystemen van een vaartuig. Het antwoord bevat de eerste { "2000" } regels.

seg-8aec8f61dab2 = Een GNSS-interferentiekaart uit ADS-B- of AIS-positiemeldingen als CSV-tekst (hoogstens { "4" } MiB): één <c1/> GeoJSON per UTC-dag, alleen geaggregeerd (geen identificatiegegevens, cellen met minder dan { "5" } verschillende vliegtuigen of vaartuigen achtergehouden), met de licentie van de dataset ingebed. Een gedegradeerde cel wijst interferentie niet aan als oorzaak; geen voorspelling. MODELLED. Zie <a1><c2/></a1>.

seg-d5959e4f1c96 = De voertuigbeweging en gebeurtenissen van een scenario voor een laboratorium-GNSS-simulator (<c1/>): bewegings-CSV en JSON, NMEA, waypoints en gebeurtenissen als tekst, niets naar schijf geschreven. Soorten <c2/>, <c3/>, <c4/>. Geen signaal: niets van wat wordt geëxporteerd is, modelleert of stuurt een radiofrequent signaal of basisbandsignaal aan; de simulator en zijn operator leveren de signalen. Zie <a1><c5/></a1>.

seg-1076916237f0 = Het ondertekende laboratorium-round-trippakket (<c1/>): het scenario, het document <a1><c2/></a1> van het laboratorium, het ontvangerlog en de score ervan tegen de opgegeven gebeurtenissen, door hashes gekoppeld. Weigert omstandigheden en scoregebeurtenissen die elkaar tegenspreken. Geen signaal; een technisch record, geen certificering.

seg-9e1df2016cd7 = Eén IQ-opname in de werkmap afspelen over meerdere ontwerpen van volglussen (<c1/>): per ontwerp en PRN de stationaire fase- en codejitter, lock-fracties en gemiddelde C/N0. Hoogstens { "256" } (ontwerp, PRN)-kanalen per aanroep; het bereik moet binnen het samplebudget passen.

seg-a5af1743f993 = De monitors voor detectie van interferentie en spoofing draaien over een IQ-opname in de werkmap (<c1/>): breedband- en spectrummonitors en C/N0- en signaalkwaliteitsmonitors per satelliet tegen een geleerde basislijn. Reeksnamen en -lengten en tot { "200" } gebeurtenissen in het antwoord; het hele rapport op verzoek als bestanden. Een gebeurtenis zegt dat een gemeten grootheid zijn basislijn verliet, niet waarom. MODELLED.

seg-c9c9c909c621 = Het verliezen-van-lock-model van de volglus fitten op labruns (<c1/>) uit een <c2/>-scenario waarvan de logs inline zijn (<c3/> of <c4/>; een <c5/> wordt geweigerd). Leest en schrijft geen bestand. MODELLED.

seg-4f231cd18d37 = Een <c1/>-bestand dat als tekst is opgegeven valideren en de opgeloste omstandigheden met hun hash teruggeven. Alleen inline.

seg-2851f2858910 = De afbeelding op openbare raamwerken, ingevuld uit resultaatdocumenten die als tekst zijn opgegeven (<c1/>): voor welke rijen van zes raamwerken en standaarden voor veerkracht (US DHS Resilient PNT framework v2.0, IMO-scheepvaart, EASA-luchtvaart, NIS2 artikel { "21" }, EN { "16803" }, NIST IR 8323r1) de runs bewijs leveren, voor welke niet, en de lacune per rij. Neemt <c2/> van <c3/> (hoogstens { "64" }, in totaal { "4" } MiB). Een status zegt dat de runs bewijs leveren voor de mogelijkheden van de rij; het is geen vaststelling dat een raamwerk is gehaald en geen beoordeling of goedkeuring van enig product. De <c4/> wordt bij elk rapport teruggegeven; toon hem woordelijk. MODELLED. Zie <a1><c5/></a1>.

seg-0a5161ddea94 = De statische afbeeldingstabellen (of, met <c1/>, de brondocumenten die ze aanhalen met versies en URL's) als Markdown, voorafgegaan door dezelfde verklaring. Vereist geen runs.

seg-ffcc6c72dc1e = Een vertrouwensstroom (JSON-regels) of <c1/>-resultaat weergegeven als Prometheus-tekst, CEF- of LEEF-syslogregels, een OTLP-JSON-payload of Home Assistant MQTT-discovery- en statusregels, met de encoders van <c2/>. Tekst in het antwoord: er wordt niets verzonden of aangeboden en er wordt geen klok gelezen. Alleen adviserend.

seg-2b82a8a22298 = Versnellingsmeter- en gyroparameters van de scenario's <c1/> en <c2/>, gefit uit een stilstaand IMU-log (CSV of EuRoC) met Allan-deviatie, met een kant-en-klare tabel <c3/> om te plakken en de SHA-256 van het log (<c4/>). Tekst erin, JSON eruit; MODELLED.

seg-30d5bb6b34cb = De standaardenpakketten (<c1/>): gescoorde scenariosets voor de testprofielen van het DHS Resilient PNT framework (niveaus { "1" } tot { "4" }), IMO MSC.1/Circ.1575 en ICAO Doc { "9849" } Appendix F.

seg-767a05e5df9f = Eén pakket gedraaid tegen zijn drempels die vóór de run zijn vastgelegd (<c1/>): elke test <c2/>, <c3/> of <c4/>, met gemeten en verwachte waarden; geef het rapport aan <c5/> om de rijen te zien. MODELLED; beoordeelt geen enkel product.

seg-74110e6b530f = Het LunaNet Augmented Forward Signal getoetst aan LNIS V5 AD1 Volume A (LSIS-AFS V1.0, { "29" } januari { "2025" }): <c1/> (de implementatie tegen de afgedrukte codetabellen en uitgewerkte voorbeelden van het document), <c2/> (een symboolstroom: synchronisatiepatroon, SB1, FID, TOI-continuïteit) of <c3/> (een teststroom). LDPC en CRC-24Q van subframes { "2" } tot { "4" } worden niet geverifieerd; er wordt geen signaal geschreven.

seg-b6abad1f2c9d = Een kshana-bench-inzending gescoord tegen een referentiebestand, beide JSON-tekst (<c1/>, <c2/>): het resultaatbestand met de specificatieversie, de split, de invoerhashes en de metrieken van de taak. MODELLED; beschrijft een log of corpus, nooit een product.

seg-c7a0d7981bfd = kshana-bench-resultaatbestanden weergegeven als de statische ranglijstpagina (HTML-tekst), elk eerst getoetst.

seg-1ec7117c7825 = Een vertrouwensstroom (JSON-regels) of <c1/>-resultaat weergegeven als Prometheus-tekst, CEF- of LEEF-syslogregels of een OTLP-JSON-payload, met de encoders van <c2/>. Tekst in het antwoord: er wordt niets verzonden of aangeboden en er wordt geen klok gelezen. Alleen adviserend.

seg-0fc2e3928768 = Het aandeel van de lengte van een route in gedegradeerde, niet-gedegradeerde, niet-beoordeelde en niet-waargenomen cellen van een of meer interferentiekaarten, optioneel binnen een datumbereik. Niet-waargenomen cellen zijn geen bewijs van een vrije route.

seg-62756ba18cf5 = De inrichting van de GNSS-IQ-laag: de signaalnamen die de IQ-hulpmiddelen accepteren, of de IQ-bestandshulpmiddelen aanstaan, de werkmap en het samplebudget per aanroep. Roep dit eerst aan.

seg-98939638409f = Eén IQ-opname (in-phase en quadrature) in de werkmap beschrijven zonder haar te verwerken: formaat, samplefrequentie, middenfrequentie, samples, duur, databestanden en groottes (<c1/>).

seg-c529b1a7ee53 = Een GNSS-IQ-scène met meerdere satellieten genereren in de werkmap (<c1/>): opgegeven Doppler/C/N0-profielen, of echte geometrie van broadcast-efemeriden uit een RINEX-navigatiebestand, met optioneel een propagatiekanaal op signaalniveau. Antwoordt met de geschreven bestanden en hun aantallen bytes en de eerste epoch van de referentie per satelliet.

seg-0c6f5e26367f = FFT-acquisitie (fast Fourier transform) van een of meer PRN's (pseudo-random noise-codes) over een opname (<c1/>), optioneel achter front-endtrappen: per PRN, verworven of niet, Doppler, codefase, piekstatistiek en drempel; <c2/> (één PRN) bewaart het hele correlatieoppervlak Doppler × codefase met verfijningen van de fijne Doppler.

seg-1da73ad326de = Verwerven en daarna volgen met de DLL/PLL/FLL-bank (delay-, phase- en frequency-locked loop) (<c1/>), met de lussen uit een <c2/>-TOML-bestand in de werkmap (<c3/>) of het ingebouwde ontwerp, en optionele heracquisitie (<c4/>): per kanaal, epochs, eindelijke Doppler, eindelijke en gemiddelde C/N0, fase- en codelock-fracties, aan het eind vergrendeld, de eindelijke lock-toestand, valse locks en heracquisities, plus de naam en hash van het ontwerp. Het volgen streamt in begrensd geheugen; uitvoer per epoch gaat alleen naar bestanden (<c5/>: E/P/L, discriminatoren, lustoestanden, C/N0, lock-toestand als .csv/.jsonl/.bin; <c6/>).

seg-262bb9c592c0 = Front-end- en interferentie-onderdrukkings-DSP (digital signal processing: banddoorlaat, notch, blanking, excisie, AGC, kwantiseerder) op een opname toepassen en een nieuwe schrijven (<c1/>).

seg-cf33e101b144 = Een lab-replaycampagne draaien (<c1/>): opnamen, elk met een testomstandighedenbestand dat de bekende referentie van het lab vermeldt, × front-endketens × lusontwerpen. Elke cel wordt gescoord op tijd tot verlies van lock, heracquisitietijd, C/N0-degradatie tegen de opgegeven J/S (naast een analytische referentie met het label MODELLED), valse-lockfrequentie, PLL/DLL-jitter en beschikbaarheid. Incrementeel en hervatbaar: elke aanroep draait de openstaande cellen die in het samplebudget passen (of <c2/>).

seg-8112428c6226 = De voortgang van een campagne-uitvoermap: voltooide en openstaande cellen, en de digest zodra de campagne klaar is. Leest alleen bestanden.

seg-8bd76f017ae4 = Elk hulpmiddel is een dunne, getrouwe omhulling van een openbare functie van de bibliotheek <c1/> — hier zit geen nieuwe simulatielogica, dus een agent draait precies de engine die aan een onafhankelijke externe referentie is getoetst.

seg-b37bbaf38900 = De GNSS-IQ-hulpmiddelen: bestanden erin, compacte JSON eruit

seg-ecf2ec0eb66d = IQ-opnamen lopen op tot gigabytes, dus de <c1/>-hulpmiddelen laten nooit samples door het protocol lopen. Ze volgen één contract:

seg-31a173dfe40d = <b>Een werkmap.</b> De server leest en schrijft IQ-bestanden alleen binnen de map die door <c1/> wordt genoemd. Elk padargument is ten opzichte daarvan (een absoluut pad moet erbinnen uitkomen); invoer wordt vóór de controle via symlinks opgelost, de map van een uitvoer moet er al in bestaan, en een bestaande uitvoer wordt alleen vervangen met <c2/>. Als de variabele niet is ingesteld, staan de IQ-bestandshulpmiddelen uit en zeggen ze hoe ze aan te zetten; elk ander hulpmiddel blijft ongemoeid.

seg-4f734b84a91a = <b>Een samplebudget.</b> Eén aanroep genereert of verwerkt hoogstens <c1/> complexe samples (standaard { "50 000 000" }). In bytes is dat { "400" } MB als <c2/> ({ "8" } bytes per complexe sample), { "200" } MB als <c3/> ({ "4" } bytes) en { "100" } MB als <c4/> ({ "2" } bytes); een scène wordt als <c5/> geschreven tenzij <c6/> anders bepaalt. De controle vindt plaats vóór enig werk en de weigering noemt de duur of <c7/> die past.

seg-178284ddfee0 = <b>Compacte antwoorden.</b> Elk hulpmiddel antwoordt met één JSON-samenvatting: acquisitiepieken, C/N0, lock-toestand en elk geschreven bestand met zijn pad en aantal bytes. Tabellen per epoch gaan naar de bestanden <c1/> / <c2/> die u noemt.

seg-f375643798e9 = <b>Onbekende argumenten worden geweigerd</b>, niet genegeerd, zodat een verkeerd gespelde optie een fout is.

seg-41040247770d = Elk hulpmiddel draait hetzelfde codepad als <c1/> op de opdrachtregel, in hetzelfde proces. De laag is alleen software: ze schrijft bestanden voor softwareontvangers en stuurt geen radiohardware aan. De IQ-laag voegt geen synthese van interferentie of spoofers toe en er wordt nooit iets uitgezonden. (De aparte scenariosoort <c2/> kan analytische IQ-momentopnamen van jammers naar een bestand schrijven.)

seg-f02d2f6bac7c = Koppel bij het Docker-image de map en laat de variabele ernaar wijzen: <c1/>.

seg-721079aa25e7 = Elke soort is bereikbaar

seg-116ada4f4498 = <c1/> verdeelt op de <c2/> van het scenario, dus elke soort die <c3/> noemt, draait erdoorheen. Dat omvat de nieuwere families, elk met meegeleverde voorbeelden die een agent kan ophalen:

seg-c7047f5750a9 = Een voorbeeld om mee te beginnen

seg-b45752760eca = Het zonnestelsel

seg-1ccf38ab6e24 = Campagnes: geketende fasen, sweeps, Monte Carlo (gezaaide willekeurige ensembles), compositie

seg-67fe14962e1c = Navigatie met lage aardbaan (LEO): signaalontwerp

seg-c555e5b73203 = LEO-navigatie: linkbudget per overpassing

seg-67de12cac6f0 = LEO-navigatie: navigatiebericht

seg-b8badd962245 = LEO-navigatie: gefuseerde positiebepaling en tijdsynchronisatie

seg-0561cfd970d8 = <c1/> met een <c2/> noemt elk meegeleverd voorbeeld van die soort. Animaties, rapporten en interoperabiliteitsexports zijn geen soorten: het zijn weergaven van een run, en <c3/>, <c4/> en <c5/> leveren ze voor elk scenario waarop ze van toepassing zijn.

seg-62d106ca4a89 = Niet aangeboden: studiesuites (<c1/>), omdat een suite naburige scenariobestanden op schijf noemt en de scenariohulpmiddelen geen bestand lezen. Draai elk lid met <c2/>. (De IQ-hulpmiddelen lezen en schrijven wel bestanden, maar alleen binnen hun werkmap.)

seg-57f592bb676b = De MCP-server installeren

seg-77fc92e21295 = Een passage waarin AI-clients van derden worden genoemd, is hier weggelaten; ze staat in <a1>mcp/kshana-mcp/README.md</a1> op GitHub.

seg-9ec78559983f = <c1/>, zelf gehost: zie <a1>https://github.com/ashfordeOU/kshana/blob/main/docs/deploy/mcp-http.md</a1>

seg-b32b9d4e0f8b = Vanuit een checkout of git (ontwikkeling):

seg-73a73af88f08 = HTTP-modus (zelf gehost)

seg-4f248ed3e597 = <c1/> biedt dezelfde hulpmiddelen via streamable HTTP op <c2/>. Hij bindt alleen aan loopback; een niet-loopbackadres vereist <c3/> en een bearer-token in <c4/>; de IQ-bestandshulpmiddelen staan uit; omvang, tijd en gelijktijdigheid van verzoeken zijn begrensd; er wordt geen CORS-header verzonden. Kshana host geen endpoint: u host het zelf. Zie <a1>docs/deploy/mcp-http.md</a1>.

seg-60f55b197ac2 = <c1/> zet <c2/> op uw <c3/> (meestal <c4/>). De server praat JSON-RPC (JSON remote procedure call) via stdio; logs gaan naar stderr. Bouwen uit de broncode vereist een Rust-toolchain ≥ { "1.88" } (de gepatchte <c5/> { "2" }.x-SDK heeft die nodig; de bibliotheek <c6/> zelf heeft slechts { "1.85" } nodig); het Docker-image heeft er geen nodig.

seg-2f3216082425 = Registreer hem bij een client

seg-1090ae3f689c = Vrijwel elke MCP-client gebruikt hetzelfde configuratieblok <c1/> — registreer het binaire bestand <c2/> met zijn absolute pad:

seg-2da393482666 = Of, met het Docker-image in plaats van een lokaal binair bestand (geen <c1/> nodig):

seg-a4f1295bb27a = Waar dat blok staat, hangt van de client af:

seg-154c7e09063d = <b>Cursor</b> — <c1/> (globaal) of <c2/> (per project).

seg-d4a06077c606 = <b>JetBrains AI Assistant / Junie</b> — Settings → Tools → AI Assistant → Model Context Protocol → Add → <em>As JSON</em>, plak het blok en start de IDE (integrated development environment) daarna volledig opnieuw.

seg-daf0ea451b11 = <b>Desktopassistenten</b> — de meeste gebruiken een <c1/> met dezelfde <c2/>-vorm; raadpleeg de documentatie van uw client voor de bestandslocatie.

seg-fc80286aa9bf = <b>CLI-agents</b> — veel accepteren dezelfde JSON via een mechanisme <c1/> / <c2/>.

seg-9f3ef8d76e05 = Gebruik altijd een absoluut pad naar het binaire bestand. Stel <c1/> in <c2/> in om problemen op te sporen (diagnostiek gaat naar stderr; stdout is gereserveerd voor het JSON-RPC-protocol).

seg-283d1eba838a = Probeer het

seg-61739e9b6515 = Eenmaal geregistreerd, kunt u uw assistent zulke dingen vragen als:

seg-256276ac933d = <em>"Geef de Kshana-scenariosoorten weer."</em> → <c1/>

seg-2a8e3c76b939 = <em>"Toon me een Kshana-spectrumvoorbeeld en draai het."</em> → <c1/>, <c2/>, <c3/>

seg-d2e1e4148589 = <em>"Draai het Kshana-scenario voor klok-holdover met een drempel van { "20" } ns en een GNSS-uitval van 2 uur; wat is de holdover kwantum versus klassiek?"</em> → <c1/>

seg-f4b83873e280 = <em>"Exporteer die GPS-constellatie (Global Positioning System) als SP3."</em> → <c1/>

seg-54e01c1af45f = <em>"Geef me de tabel realtime-frame-eop als CSV."</em> → <c1/>

seg-478e6fa0e8d8 = <em>"Zet die Iridium-overpassing op een Cesium-globe."</em> → <c1/>, <c2/>

seg-90829388d5d9 = <em>"Animeer de jamming-campagne."</em> → <c1/>

seg-9eb1b97ad2fd = <em>"Geef me het rapport voor die run, met zijn reproduceerbaarheidsrecord."</em> → <c1/>

seg-dc60d64a3bb8 = <em>"Maak een GPS L1-scène van een seconde met PRN's { "3" } en { "17" }, en verwerf en volg die daarna."</em> → <c1/>, <c2/>, <c3/>, <c4/>

seg-942dc8abe0ec = Ontwerpnotitie — waarom een aparte crate

seg-ce6d0ecab448 = De server is een <b>zelfstandige crate buiten de workspace</b> met een eigen <c1/>, zodat de officiële Rust MCP-SDK (software development kit) <c2/> en zijn asynchrone runtime nooit in de afhankelijkheidsgraaf van de gepubliceerde crate <c3/> terechtkomen: een gebruiker van de bibliotheek of van Python compileert geen server die hij niet draait. (Hij werd eerst afgesplitst omdat <c4/> <b>edition { "2024" }</b> is en rustc ≥ { "1.85" } vereist, terwijl de hoofdcrate toen { "1.75" } beloofde. De bibliotheek verklaart nu { "1.85" }; deze server verklaart { "1.88" }, de ondergrens van de beveiligingsgepatchte <c5/> { "2" }.x.) Continue integratie (CI) toetst deze crate afzonderlijk — tests en <c6/> tegen zijn lockfile. De licentieboom van rmcp is schoon (Apache-2.0/MIT/BSD), dus anders dan de kruisvalidatiecrate <c7/>, die hij verder nabootst, gaat de afsplitsing niet om licenties.

seg-75bf2d74642d = Licentie: alleen AGPL-3.0, de GNU Affero General Public License versie { "3" } (of een commerciële licentie van Ashforde OÜ; zie <a1>LICENSING.md</a1> van de repository).

seg-490ebbefb561 = <s1>Vorige</s1>Rust-crate

seg-350b6b914734 = <s1>Volgende</s1>MCP-server: elk installatiekanaal

seg-492888115662 = De { "92" } ingebouwde scenariosoorten met beschrijvingen + vereiste/optionele velden — zodat de agent een geldig scenario kan opstellen.
