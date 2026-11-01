# docs--kind-lunar-orbit-rendezvous: translations (nl)

seg-34bdcfd66ded = In de repositorytak waaruit deze documentatie komt; nog niet op GitHub

seg-f942b36a11c4 = Nog niet op GitHub

seg-51362910dcb7 = { "2" } meegeleverde scenario's gebruiken deze soort; de andere staan in <a1><c1/></a1>.

seg-1f17ef6a853e = Scenariosoort van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is dat van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Bewijs van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-6a26b9ab59fe = Onderwerppagina: <a1>MISSION-THREAD.md</a1>

seg-2d84b341a41f = Resultaatlabel (van de engine): MODELLED

seg-8732ad9f7e07 = <b>MODELLED</b> De propagator die de maansoorten delen (GRAIL GL0660B graad en orde { "150" }, aarde en zon als derde lichamen, relativiteit, DE440-maanoriëntatie) vergeleken met de openb. Onafhankelijke referentie (ExternalDataset): JPL Horizons-ephemeriden van ruimtevaartuigen voor LRO en CAPSTONE, tegen drempels die vooraf zijn vastgelegd in xval/mission-thread-lunar/PREREGISTRATION.md (Amendementen { "1" } tot { "6" }). LRO: MET, { "33" } m grootste 3D-verschil en { "2.4" } m RMS radiaal tegen { "500" } m en { "60" } m. CAPSTONE: NOT MET, een eindpositieverschil van { "136.8" } km tegen { "25" } km en een periapsisverschil van { "28.4" } km tegen { "10" } km, de oorzaken niet afgezonderd. De rij is gemodelleerd omdat de CAPSTON

seg-626ab55f0424 = MODELLED (resultaat <c1/>)

seg-e482c9896140 = De voortplanting met het maankrachtenmodel tegen openbare gereconstrueerde trajecten van maanorbiters en cislunaire trajecten is MODELLED, niet gevalideerd: een deelbewering wordt extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e66e2ca31e54 = Onderwerppagina: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-9e494e8809e5 = Bron: <c1/>

seg-8beb22a0eb0b = <c1/> (scenariosoort)

seg-2deefd8c547b = MODELLED relatieve navigatie voor een koppeling in de stijl van Orion en lander in een lage maanbaan of een elliptische poolbaan (Artemis-klasse). Een achtervolger en een doel vliegen dezelfde baan onder het maankrachtenmodel van de crate; een gezamenlijke batch-Gauss-Newton-schatting met 21 parameters over de boog (twee voertuigtoestanden en blijvende biassen van het signaal in de ruimte) voegt een absolute positiebepaling per voertuig uit een ILLUSTRATIVE relaisset van LCNS-klasse (relais achter de maan vervallen, vier nodig, de gemeenschappelijke fout in het signaal in de ruimte heft tussen de voertuigen op) en een crosslink-afstand samen, met afstandsprecisie uit de code-trackinggrens op de LunaNet AFS-piloot. Rapporteert de formele en Monte Carlo-fout in relatieve positie en snelheid in de LVLH-assen van het doel, de beschikbaarheid van positiebepalingen, de gemiddelde genormaliseerde gekwadrateerde schattingsfout tegenover de verwachte waarde, en elke poging waarvan de iteratie niet convergeerde, de drift door het negeren van de zwaartekrachtharmonischen en de volledige doorgegeven 6x6-covariantie. Een Hill/Clohessy-Wiltshire-controle in gesloten vorm geldt voor het cirkelvormige geval. MODELLED: illustratieve relaisset, foutenbudget en priors; de referentie en de schatter delen één krachtenmodel, dus de NEES controleert zelfconsistentie en geen modelfout. Niet door een ruimtevaartorganisatie onderschreven; adviserende software, geen gecertificeerde navigatieapparatuur.

seg-a6d29fc5f19b = Eén run van <c1/> vat samen als: lunar-orbit-rendezvous | llo 100x100 km | afstand { "2000" } m | positiebepalingen { "74" }% | rel. pos. 1-sigma R/A/C 0.03/0.06/0.04 m | gemiddelde NEES { "6.51" } ({ "6" } verwacht) | geconvergeerd bij { "2000" } s (MODELLED)

seg-b7c86affeac1 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>

seg-42fe2ad9cfba = Het voorbeeld <c1/> stelt onder meer in:

seg-60bd49f09fbc = llo

seg-bf92597fdba4 = Adviserende software, geen gecertificeerde navigat

seg-4466fb6f4043 = batch-Gauss-Newton over de boog

seg-d97b2505ac72 = De grafiek die de engine schrijft voor scenarios/lunar-orbit-rendezvous.toml, soort lunar-orbit-rendezvous

seg-7ea832b979c9 = <b>MODELLED</b> De soort en fase <c1/>: een gezamenlijke batch-Gauss-Newton-schatting voor twee voertuigen over de boog (eenentwintig parameters: beide toestanden en blijvende positiebiassen in het signaal in de ruimte, gemeenschappelijk en onafhankelijk), opgebouwd over een kwart, een h Tests: <s1>mission_thread_lunar_oracles.rs</s1>.

seg-826fd7fd44b9 = <b>MODELLED</b> De soort en fase <c1/>: een gezamenlijke batch-Gauss-Newton-schatting voor twee voertuigen over de boog (eenentwintig parameters: beide toestanden en blijvende positiebiassen in het sig. Onafhankelijke referentie (InternalConsistency): Zelfconsistentie onder een preregistratie (xval/mission-thread-lunar/PREREGISTRATION.md, resultaten en de geschiedenis van de schatter in RESULTS.md): de gemiddelde NEES van de relatieve toestand is { "5.85" } tot { "5.93" } tegen de band { "5.2" } tot { "6.8" } in vier configuraties, MET bij het vierde schatterontwerp nadat drie ontwerpen met een opeenvolgend filter hadden gemist; de referentie en de schatter delen één krachtenmodel, dus dit zegt niets over modelfouten. De p

seg-b2f273ea732d = MODELLED relatieve navigatie voor een koppeling in de stijl van Orion en lander in een lage maanbaan of een elliptische poolbaan (Artemis-klasse). (soortencatalogus (<c1/>))

seg-9d4f99557cc5 = MODELLED: illustratieve relaisset, foutenbudget en priors; de referentie en de schatter delen één krachtenmodel, dus de NEES controleert zelfconsistentie en geen modelfout. (soortencatalogus (<c1/>))

seg-158e44d47c0b = EERLIJKHEID: MODELLED. De relaisset, de fout in het signaal in de ruimte, de gemeenschappelijke fractie en de priors zijn ILLUSTRATIVE invoer, geen metingen; de referentie en de schatter delen het krachtenmodel (een ingebouwde centrale term, J2 en C22). De vooraf vastgelegde consistentiecontrole B1 (gemiddelde NEES in [{ "5.2" }, { "6.8" }]) is gehaald in alle vier de configuraties op het batchontwerp: zie xval/mission-thread-lunar/RESULTS.md. Er wordt geen overeenstemming met enig re (commentaar in het scenariobestand, regels { "10" } tot { "14" })

seg-2a88a9650804 = Relatieve navigatie tot koppeling in een maanbaan (<c1/>) is MODELLED, niet gevalideerd: gecontroleerd tegen zijn eigen identiteit in gesloten vorm of analytisch — vangt transcriptie- en coëfficiëntfouten, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-6ac5bd1500a8 = <s1>Vorige</s1>lunar-llr-datum

seg-54b1c9200aae = <s1>Volgende</s1>lunar-station-coverage
