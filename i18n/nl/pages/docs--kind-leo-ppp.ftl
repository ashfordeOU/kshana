# docs--kind-leo-ppp: translations (nl)

seg-37d29d8303fe = km

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-a849735fcc6e = Onderwerppagina: <a1>LEO-PNT-FUSION.md</a1>

seg-49964654d5f4 = Scenariosoort van de engine v{ $version }, familie <a1>Navigatie in een lage baan om de aarde</a1>. Adviserend: uitvoer van een analyse door een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen safety-of-life-dienst. Elk label hier is van de engine of van de verificatiematrix; een soort is MODELLED tenzij de matrix anders vermeldt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-c5478f572d21 = Familiepagina: <a1>Navigatie in een lage baan om de aarde</a1>

seg-8f0aab32310b = Bron: <c1/>

seg-c9852d3b79c8 = <c1/> (scenariosoort)

seg-32a570f1a4fa = Convergentie van precieze puntpositiebepaling (PPP) met alleen GNSS en met LEO-aanvulling: een float extended Kalman-filter op ionosfeervrije code en draaggolffase met de statische stationscoördinaten, een witte klok van de ontvanger, één inter-systeembias per extra systeem, een zenitale natte vertraging als random walk, afgebeeld met 1/sin(elevatie), en een float-ambiguïteit per satellietboog; de fout van de precieze baan en klok is wit en gemeenschappelijk voor code en fase van een satelliet, dus elke satelliet is één gecorreleerde update met twee rijen in een Joseph-gestabiliseerde vorm. Metingen worden gesimuleerd uit hetzelfde model met geseede ruis over meerdere locaties en seeds, en elk geval (eerst alleen GNSS, daarna elke [[case]] van LEO-systemen, elke constellatie of voorinstelling) rapporteert de mediane convergentietijd (het eerste epoche waarna de horizontale en verticale fouten onder de drempels blijven, standaard { "10" } cm), de fractie die is geconvergeerd, de mediane foutcurven en de consistentie van het filter (de over runs gemiddelde NEES van de positie tegen de tweezijdige chikwadraatband van { "95" }%). Optioneel naast de gepubliceerde cijfers voor gematigde breedtegraden van Li et al. ({ "2019" }, J. Geod. { "93" }:{ "749" }, doi 10.1007/s00190-018-1195-2): { "9.6" } min voor multi-GNSS verkort tot { "7.0" }, { "3.2" }, { "2.1" } en { "1.3" } min met { "60" }, { "96" }, { "192" } en { "288" } LEO-satellieten. MODELLED: een consistentievergelijking van de trend, geen reproductie van de constellaties, ruis of stations van die studie; geen ambiguïteitsoplossing, cycle slips, phase wind-up, getijden of tijdgecorreleerde productfouten.

seg-8126f4edf6b6 = Eén run van <c1/> vat samen als: PPP convergence to { "0.10" } m horizontal / { "0.10" } m vertical, { "12" } runs per case, { "96" } GNSS satellites GNSS only { "0" } LEO median { "7.4" } min converged { "100" }% NEES mean { "3.13" } { "60" } LEO { "60" } LEO median { "4.8" } min converged { "100" }% NEES mean { "3.08" } { "96" } LEO { "96" } LEO median { "3.2" } min converged { "100" }% NEES mean { "2.74" } { "192" } LEO { "192" } LEO median { "2.7" } min converged { "100" }% NEES mean { "2.65" } { "288" } LEO { "288" } LEO median { "2.3" } min converged { "100" }% NEES mean { "3.06" } Li et al. { "2019" } (published, min) vs modelled: { "0" }:9.6/7.4 { "60" }:7.0/4.8 { "96" }:3.2/3.2 { "192" }:2.1/2.7 { "288" }:1.3/2.3

seg-aee2e93b2c20 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>

seg-3589a089c89d = Het voorbeeld <c1/> stelt onder meer in:

seg-4dbe1423bb57 = { "60" } LEO

seg-85b65d194f0d = { "96" } LEO

seg-2750ec8c218f = Resultaatlabel (van de engine): MODELLED float-PPP (ionosfeervrije code en fase, witte klok, natte vertraging als random walk, float-ambiguïteiten per boog) op gesimuleerde metingen uit hetzelfde model; de cijfers van Li et al. ({ "2019" }) zijn een vergelijking van de trend, geen reproductie

seg-225ef04c64af = De grafiek die de engine schrijft voor scenarios/leo-ppp-convergence.toml, soort leo-ppp

seg-c75ca72ca711 = <b>MODELLED</b> Een float-PPP extended Kalman-filter op ionosfeervrije code en fase: statische coördinaten, een witte klok van de ontvanger, één inter-systeembias per extra systeem, een zenitale natte vertraging als random walk afgebeeld met 1/sin(elevatie), een float-ambiguïteit per satel Tests: <a1>leo_fusion_scenarios.rs</a1>.

seg-b55fd1cda5fa = <b>MODELLED</b> Een float-PPP extended Kalman-filter op ionosfeervrije code en fase: statische coördinaten, een witte klok van de ontvanger, één inter-systeembias per extra systeem, een rand. Onafhankelijke referentie (ExternalDataset): De NEES-chikwadraattoets is een interne consistentiecontrole (referentiewaarheid en filter delen het model). De trend wordt vergeleken met Li et al., LEO constellation-augmented multi-GNSS for rapid PPP convergence, J. Geod. { "93" }:749-764 ({ "2019" }), doi 10.1007/s00190-018-1195-2: multi-GNSS { "9.6" } min verkort tot { "7.0" }, { "3.2" }, { "2.1" } en { "1.3" } min met { "60" }, { "96" }, { "192" } en { "288" } LEO-satellieten. Het meegeleverde scenario geeft { "7.4" }, { "4.8" }, { "3.2" }, { "2.7" } en { "2.3" } min met i

seg-302365809dbf = MODELLED float-PPP (ionosfeervrije code en fase, witte klok, natte vertraging als random walk, float-ambiguïteiten per boog) op gesimuleerde metingen uit hetzelfde model; de cijfers van Li et al. ({ "2019" }) zijn een vergelijking van de trend, geen reproductie (resultaat <c1/>)

seg-6ce77bce8946 = MODELLED: een consistentievergelijking van de trend, geen reproductie van de constellaties, ruis of stations van die studie; geen ambiguïteitsoplossing, cycle slips, phase wind-up, getijden of tijdgecorreleerde productfouten. (soortencatalogus (<c1/>))

seg-ba2fd25fdcff = De vier LEO-constellaties hier zijn representatieve Walker-deltaschillen op { "1000" } km en { "60" } deg met { "60" }, { "96" }, { "192" } en { "288" } satellieten; het zijn GEEN ontwerpen uit het artikel, en de ruis, stations en convergentiedefinitie (horizontale en verticale fouten onder { "10" } cm tot het einde van de run) zijn die van dit model. De vergelijking is daarom een MODELLED consistentiecontrole op de trend: de convergentie moet monotoon korter worden met t (opmerking in het scenariobestand, regels { "10" } tot { "14" })

seg-b641b835570c = Convergentie van precieze puntpositiebepaling met alleen GNSS en met LEO-aanvulling is MODELLED, niet getoetst aan een onafhankelijke externe referentie: een deelclaim is extern gecontroleerd, maar de hele mogelijkheid is samengesteld uit gemodelleerde onderdelen, dus de mogelijkheid blijft gemodelleerd. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-368eb6979183 = <s1>Vorige</s1>leo-pnt-chain

seg-2458954d9c22 = <s1>Volgende</s1>leo-pvt
