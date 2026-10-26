# docs--kind-sweep: translations (nl)

seg-4636d450ef60 = <b>MODELLED</b> Eén run neemt een contactplan (een lijst van aos_s/los_s-vensters, elk met een verzoek aan de apertuur om navigatie of communicatie — dezelfde vensterwoordenschat die <c1/> uitgeeft, omgezet door <c2/>), een apert

seg-fa3ad6babe54 = <b>MODELLED</b> De sweep van het kind <c1/> (één tot drie gepunte sleutels van elk kind, op de aswaarden van de generieke sweep, optioneel een ensemble bij elk knooppunt) en de sectie monte_carlo. Onafhankelijke referentie (InternalConsistency): De gesloten vorm van de fase-randomwalk onder witte frequentieruis, variantie q_wf tau (NIST Technical Note { "1337" }), voor de statistiekmachinerie, en byte-gelijkheid met de zelfstandige runs voor de seeding. Het controleert de ensemblerekenkunde op het eigen klokmodel van de engine, geen externe dataset

seg-d1c11e493795 = Parametersweeps en geseede Monte-Carlo-ensembles over elk scenariokind is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-cb91473bfdda = Onderwerppagina: <a1>LEO-PNT.md</a1>

seg-c61e88721556 = Scenariokind van de engine v{ $version }, familie <a1>Klokken, tijdsynchronisatie en holdover</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-a8d92406e428 = Optische strontiumroosterklok, op de ruimte gericht doel sigma_y

seg-5278ccdaf16f = <b>MODELLED</b> Gesloten-vorm-groei van de driftfout tijdens coasting + holdover-tot-drempel; kwantumklasseklokken. Onafhankelijke referentie (ReferenceImpl): Recursie van de covariantie van clock_state in meerdere stappen (kruiscontrole binnen dezelfde codebase); de onderliggende kernel voor coast-variantie en holdover-inversie is extern getoetst tegen scipy (zie 'Clock-holdover coast-variance & threshold inversion'). De holdovercijfers per klasse met rode-ruisbodem blijven MODELLED

seg-e12f672ae71d = Klok-holdover bij GNSS-uitval is MODELLED, niet extern getoetst: gecontroleerd tegen een afzonderlijke implementatie in dezelfde codebase — onafhankelijk van de geteste eenheid, maar niet extern gezaghebbend. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-849c08d3ce70 = Familiepagina: <a1>Klokken, tijdsynchronisatie en holdover</a1>

seg-ee7dd15019d0 = Onderwerppagina: <a1>CAMPAIGNS.md</a1>

seg-0aae0574c5e6 = <b>MODELLED</b> De beschikbaarheidssweeps van de soort <c1/>: per constellatie (GPS, GLONASS, Galileo, BDS, QZSS, NavIC) en gecombineerd, het aandeel (gebruiker, epoche)-paren met ten minste één en ten minste vier signalen en de langste uitval, voor een gebruiker op een bol

seg-de72ae48731d = Bron: <c1/>

seg-81c2da4650c9 = <c1/> (scenariosoort)

seg-e7ab7b55c969 = 1-D-sweep voor een afwegingsstudie over een parameter van een klokpakket.

seg-0412c0dbfb75 = Eén run van <c1/> vat samen als: sweep holdover_s over classical_q_wf ({ "1.00e-24" }..1.00e-18, { "25" } punten, logaritmische schaal) | quantum 6600.000->{ "6600.000" } | klassiek 2610.000->{ "250.000" }

seg-d2a441254bcd = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-2b8d8159bdaf = Optionele velden: <c1/>

seg-73c2e732b0c1 = Het voorbeeld <c1/> stelt onder meer in:

seg-f8a627a78bdb = Microchip SA.45s CSAC-datasheet sigma_y(1s)={ "3e-10" }; q_wf is s

seg-c784b8f22f12 = De grafiek die de engine schrijft voor scenarios/sweep-clock-stability.toml, soort sweep

seg-cb00aca0268d = <b>MODELLED</b> De sweep van de soort <c1/> (één tot drie sleutels met punten van elke soort, op de aswaarden van de generieke sweep, optioneel met een ensemble op elk knooppunt) en de secties monte_carlo: realisatie k draait op base_seed + k; elke metriek rapporteert gemiddelde, standaardafwijking, Tests: <a1>campaign_composition_reference.rs</a1>.

seg-1750fbfc4a99 = <s1>Vorige</s1>sweep-nd

seg-de5468ac32fc = <s1>Volgende</s1>telecom-timing

seg-8b701f465117 = log
