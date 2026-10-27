# docs--kind-lunar-time-offset: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-4d208b6c0eb8 = dag

seg-64813e3da228 = Bron: <c1/>

seg-000bb13909f1 = <c1/> (scenariosoort)

seg-7f3e13712f10 = Gemodelleerde relativistische klokgang aarde–maan (Lunar Coordinate Time, LTC/TCL): de seculiere LTC−TT-snelheid uit het verschil in zelfpotentiaal en de kinetische term van de maan, gerapporteerd met de gepubliceerde band van { "56" }–{ "59" } µs/dag, plus de opgebouwde offset over een horizon.

seg-9efcf3e1be04 = Eén run van <c1/> vat zich samen als: lunar-time-offset | seculiere LTC−TT-snelheid { "57.04" } µs/dag (band { "56" }–{ "59" }) | zelfpot { "57.50" } kinetisch -0.46 | offset @ { "1.00" } d = { "57.04" } µs

seg-9367773c4889 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Het voorbeeld <c1/> stelt onder meer in:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = De grafiek die de engine schrijft voor scenarios/lunar-time-offset.toml, soort lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relativistische klokgang aarde–maan (LTC/TCL) + ketening van TT/TAI/UTC + ensemble. Onafhankelijke referentie (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; basis voor de IAU/IAG LunaNet LTC): zelfpotentiaal op het maanoppervlak L_m = { "3.13881e-11" } en seculier totaal { "56.02" } µs/dag komen overeen als gepubliceerde numerieke waarden; geocentrische maansnelheid gecontroleerd aan JPL DE440 (de440s.bsp via SPICE)

seg-96b65f604cc2 = Eerlijkheid: MODELLED, niet gecertificeerd. Het kerncijfer in us/dag hangt van de referentie af (geoïde W0 van de aarde tegenover een selenoïde van de maan, het tijdmiddelingsvenster, verwaarloosde centrifugale/J2-correcties onder de us/dag) -> een band, geen enkel getal, is de eerlijke uitvoer. Niets hier is getoetst tot een absolute nauwkeurigheid onder de nanoseconde of gecertificeerd voor operationele tijdhouding. Het rapport geeft ook de opgebouwde LTC-TT-offset over de hori (commentaar in het scenariobestand, regels { "11" } tot { "16" })

seg-e4552368a6a7 = <s1>Vorige</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Volgende</s1>lunar-vlbi-fim
