# docs--kind-terrain-slam: translations (nl)

seg-216efc4e6fba = Scenariokind van de engine v{ $version }, familie <a1>GPS-denied alternatieve PNT</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-0df60ac6343f = <b>MODELLED</b> Zwaartekrachtkaartmatching, terreingerefereerd (TERCOM/SITAN), magnetische anomalie. Onafhankelijke referentie (InternalConsistency): IGRF-14-coëfficiënten; matched-filter-CRLB uit eerste principes. Het veld van de zwaartekrachtbenchmark met echt veld is extern gecontroleerd (rij 'Gravity-anomaly synthesis from a spherical-harmonic model'), maar het navigatieresultaat ervan heeft geen externe referentie

seg-d776abd5691c = Alternatieve / complementaire PNT is MODELLED, niet extern getoetst: gecontroleerd tegen zijn eigen gesloten-vorm- of analytische identiteit — dat vangt transcriptie- en coëfficiëntfouten, maar is geen externe referentie. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-98133e74f88a = Familiepagina: <a1>GPS-denied alternatieve PNT</a1>

seg-bb7c9c4d4b5d = Bron: <c1/>

seg-562e59d703e3 = <c1/> (scenariosoort)

seg-6bdc150ab25b = GPS-ontzegde sequentiële (recursieve) terreingebonden navigatie: een deeltjesfilter draait het terreinmatch-meetmodel epoch voor epoch (SITAN als lopend filter), zodat een in de tijd variërende INS-drift langs het spoor wordt gevolgd, waar de batch-soort terrain-nav slechts één constante offset herstelt.

seg-1e4350c2c5f0 = Eén run van <c1/> vat samen als: terrain-slam | { "60" } waypoints | vrij-inertiale RMS { "2947" } m (eind { "5082" } m) | terreinafgestemde RMS { "1241" } m (eind { "69" } m, 2x kleiner) | gemiddelde ESS 2599/4000 | matching-sigma { "17.0" } m

seg-939d877137f6 = Verplichte velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>

seg-5ceb5b8597ac = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>

seg-48e022b0945e = Het voorbeeld <c1/> stelt onder meer in:

seg-4aca87f022dc = De grafiek die de engine schrijft voor scenarios/terrain-slam.toml, soort terrain-slam

seg-832919783819 = <s1>Vorige</s1>terrain-nav

seg-1693abd546fe = <s1>Volgende</s1>time-transfer-budget
