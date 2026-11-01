# docs--kind-lunar-joint-od-clock: translations (nl)

seg-37d29d8303fe = km

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-593938ee5995 = Bron: <c1/>

seg-d54a85227f43 = <c1/> (scenariosoort)

seg-200e58e189c2 = Gemodelleerde gezamenlijke multitechniekschatter voor baanbepaling op de maan + klok (batch) op een GESIMULEERD netwerk: een Gauss-Newton-momentopname-fit die geodetische VLBI-vertragingen op aardbasislijnen, lokale afstanden tussen station en satelliet op de maan en afstanden tussen satellieten samenvoegt om samen de 3D-positie van een station op het maanoppervlak, de posities van een kleine constellatie en de klokoffset van elk object terug te vinden uit een geïnjecteerde referentie. Het belangrijkste eerlijke resultaat — VLBI maakt de volledige 3D-positie van het station waarneembaar waar afstandsmeting alleen op de maan een zwak waargenomen richting overlaat — wordt gerapporteerd als het contrast in stationsfout met en zonder VLBI. MODELLED gesimuleerd herstel in een gesloten lus (de referentie deelt het waarnemingsmodel), deterministisch (geseed), NIET getoetst aan echte gegevens; geen voortplanting met een krachtmodel binnen de solver; geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie.

seg-6419390eeae4 = Eén run van <c1/> vat zich samen als: lunar-joint-od-clock | { "3" } sats, { "6" } aardstations | 3D-fout van het station met VLBI { "3.54" } m tegenover alleen afstand { "2184.02" } m ({ "617.5" }× scherper) | sat-pos RMS { "2.20" } m | stationsklokfout { "2.87e-10" } s | obs 40/16 params

seg-be3bcad756cc = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>

seg-ef164af52468 = Het voorbeeld <c1/> stelt onder meer in:

seg-6f788a1278b9 = 1/({ "10" }^{ "6" } m)^{ "2" }

seg-cfa051b87e59 = De grafiek die de engine schrijft voor scenarios/lunar-joint-od-clock.toml, soort lunar-joint-od-clock

seg-4c6914c162d1 = <b>VALIDATED</b> Batchfusie van VLBI + lokale afstand op de maan + afstand tussen satellieten om de posities en klokken van station en constellatie terug te vinden. Onafhankelijke referentie (ExternalDataset): P2: numpy { "2.4.6" } (numpy.linalg.lstsq met LAPACK gelsd, numpy.linalg.inv; BSD-3) berekent elke Gauss-Newton-stap, de geconvergeerde gewogen-kleinste-kwadratenoplossing, de formele sigma's en de stationsfout opnieuw op de vastgelegde Jacobianen en waarnemingen van zes gesimuleerde netwerken, preregistratie (5094bc31) op max({ "1e-8" }, { "100" } kappa eps) relatief. De eerste run faalde op het netwerk zonder VLBI ({ "6.1e-7" } tegenover { "1e-8" }, een normaalvergelijking

seg-5b3f6008f5a7 = <b>VALIDATED</b> Fisher-informatie M=HᵀWH, Cramér–Rao-ondergrens, waarneembaarheidsrang / nulruimte van het datumdefect (pseudo-inverse van Moore–Penrose) en D/A/E/T-optimaal experimentontwerp. Onafhankelijke referentie (ExternalDataset): NumPy { "2.4.1" } (numpy.linalg.eigh / .inv; BSD-3-Clause, met LAPACK) — een onafhankelijke autoriteit van een derde partij die dezelfde eenduidig gedefinieerde eigenwaarden, de Cramér–Rao-covariantie σ²(XᵀX)⁻¹ en de GNSS-factoren voor dilution of precision berekent met een ander algoritme (LAPACK-verdeel-en-heers + LU) dan de cyclische Jacobi-sweep en spectrale pseudo-inverse van Kshana; overeenkomend tot { "1e-9" }. Dezelfde klasse externe bibliotheken toetst al de D

seg-af12da412a10 = <b>MODELLED</b> Waarneembaarheid via Fisher-informatie van de gezamenlijke oplossing voor de maan: zonder aardbasislijnen ligt het datum van het absolute stelsel in de nulruimte van HᵀWH (stationspositie onw. Onafhankelijke referentie (InternalConsistency): Analytische structuur van het datumdefect — de onwaarneembare modus van het absolute stelsel ligt in de nulruimte van de Fisher-informatie (gesloten vorm), de rangdrempel komt overeen met de gepubliceerde ontwerpmotivering voor 3 stations, en de schatter bereikt de resulterende CRLB in Monte Carlo. De maangeometrie zelf is een representatief netwerk (geen gevlogen efemeride), dus de rij blijft MODELLED; de onderliggende FIM/CRLB-engine wordt gecontroleerd aan

seg-865ba2668582 = MODELLED gesimuleerd herstel in een gesloten lus (de referentie deelt het waarnemingsmodel), deterministisch (geseed), NIET getoetst aan echte gegevens; geen voortplanting met een krachtmodel binnen de solver; geen TRL, geen heritage, geen onderschrijving door een ruimtevaartorganisatie. (soortencatalogus (<c1/>))

seg-a0d4350a1c66 = Eerlijkheid: MODELLED gesimuleerd herstel in een gesloten lus. Een geïnjecteerde referentie wordt via HETZELFDE geometriemodel dat de solver inverteert afgebeeld op synthetische waarneembare grootheden, geseede gaussische ruis wordt toegevoegd, en de schatter herstelt de geïnjecteerde referentie binnen de ruis. De onafhankelijke referentie is interne consistentie (herstel van de referentie + realisme van de NEES-covariantie), GEEN validatie aan echte gegevens. Binnen de solver is er geen voortplanting met een krachtmodel — de sat (commentaar in het scenariobestand, regels { "24" } tot { "29" })

seg-1465694e7e4f = De waarneembaarheid van het absolute station op de maan (datumdefect) is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd aan de hand van de eigen gesloten-vorm- of analytische identiteit; dit vangt transcriptie- en coëfficiëntfouten op, maar is geen externe onafhankelijke referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-e6962535ee72 = <s1>Vorige</s1>lunar-jamming

seg-2ef5c8112d1b = <s1>Volgende</s1>lunar-llr-datum
