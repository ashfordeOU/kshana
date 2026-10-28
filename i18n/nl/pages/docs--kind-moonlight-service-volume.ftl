# docs--kind-moonlight-service-volume: translations (nl)

seg-1f17ef6a853e = Scenariokind van de engine v{ $version }, familie <a1>Maan en cislunair</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen veiligheidskritieke dienst. Elk label hier is dat van de engine of van de verificatiematrix; een kind is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-1c1eeb2dcaa0 = Familiepagina: <a1>Maan en cislunair</a1>

seg-619127334cf3 = Geen rij van de matrix noemt dit kind bij naam; het label op het resultaat is dat van de engine zelf, hierboven.

seg-eb9f9a422d38 = Bron: <c1/>

seg-f8988314faf2 = <c1/> (scenariosoort)

seg-28c6a5644152 = Gemodelleerde analyse van het lunaire navigatieservicevolume voor een ILLUSTRATIVE constellatie in een lunaire baan van het type Moonlight/LCNS, op basis van openbare bronnen (niet verbonden aan ESA): zij doorloopt een selenografisch breedte-/lengteraster over een tijdshorizon en rapporteert DOP / dekking / beschikbaarheid (≥{ "4" } sats EN PDOP < drempel) plus een gegeneraliseerde lunaire ARAIM-beschermingsniveau-envelop (HPL/VPL) over het volume. De DOP-geometrie HERGEBRUIKT de gnss_lib_py-VALIDATED kernel (crate::orbit::dop); het beschermingsniveau HERGEBRUIKT de lunaire ARAIM-machinerie van LunaNet LNIS (crate::lunar, σ_URE≈{ "30" } m) en gaat als bijzonder geval over in het bestaande beschermingsniveau voor de zuidpool. MODELLED samenstelling: een cirkelvormige/elliptische Kepler-relaisverzameling (niet de echte, differentieel gecorrigeerde LCNS/NRHO-efemeride), een Maan met gemiddelde rotatie (geen libratie/precesserende pool). Deterministisch (zuivere geometrie). Geen TRL, geen vluchtervaring, geen goedkeuring door een ruimtevaartorganisatie.

seg-8516d1ded5dd = Eén run van <c1/> vat samen als: moonlight-service-volume | { "8" } sats (illustratief, LCNS-type, niet verbonden) | { "24" } punten × { "12" } epochs | dekking { "37.8" }% (PDOP<{ "6.0" }) | sats { "4" }–{ "7" } | PDOP 2.19/13.74/180.30 | HPL { "139" }–{ "4177" } m | PL-beschikbaarheid { "0.0" }% | MODELLED

seg-b59e8773bcb9 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>, <c7/>, <c8/>, <c9/>, <c10/>, <c11/>, <c12/>, <c13/>, <c14/>, <c15/>, <c16/>, <c17/>, <c18/>, <c19/>, <c20/>, <c21/>, <c22/>, <c23/>, <c24/>, <c25/>, <c26/>

seg-0d935e7c43da = Het voorbeeld <c1/> stelt onder meer in:

seg-edb738273a3a = De grafiek die de engine schrijft voor scenarios/moonlight-service-volume.toml, soort moonlight-service-volume

seg-1974d1d64c9c = <b>VALIDATED</b> Moonlight-type lunaire DOP / dekking / beschikbaarheid + gegeneraliseerde lunaire ARAIM-beschermingsniveaus over een servicevolume. Onafhankelijke referentie (ExternalDataset): onafhankelijke externe autoriteit, de Kepler-propagator ANISE { "0.10.2" } astro::Orbit (Nyx Space, MPL-2.0) — een equinoctiaal tweelichamenpad dat verschilt van de Newton-Raphson-Kepler van kshana; de MCI-positie per satelliet komt overeen tot <{ "1e-3" } m en het afgeleide aantal/de afgeleide set zichtbare satellieten komt in elk rasterpunt exact overeen. De DOP-kernel is door gnss_lib_py getoetst; de integriteit gebruikt gepubliceerde LunaNet/LCNS-parameters

seg-47f496c1d603 = <b>VALIDATED</b> Topocentrische kijkhoeken per satelliet (azimut met de klok mee vanaf noord, elevatie) en schuine afstand op een benoemde selenografische locatie, gegeven de satelliet in het van de locatie. Onafhankelijke referentie (ExternalDataset): ANISE { "0.10.2" } (Nyx Space, MPL-2.0, als hulpmiddel gedraaid vanuit xval/anise-service-geometry, binary lunar-look-angles-xval, dat geen Kshana-code aanroept): de eigen routine van ANISE voor azimut, elevatie en afstand (azimuth_elevation_range_sez) vanaf locaties die zijn opgebouwd met de constructor voor breedte, lengte en hoogte op de pck00011-Maan (bol { "1737.4" } km), waarbij de satellieten via moon_pa_de440_200625.bpc naar MOON_PA_DE440 zijn gedraaid. { "768" } samples o

seg-1f12671176ad = MODELLED samenstelling: een cirkelvormige/elliptische Kepler-relaisverzameling (niet de echte, differentieel gecorrigeerde LCNS/NRHO-efemeride), een Maan met gemiddelde rotatie (geen libratie/precesserende pool). (soortencatalogus (<c1/>))

seg-2ff91fe31123 = EERLIJKHEID: MODELLED samenstelling. De DOP-geometrie is getoetst DOOR HERGEBRUIK van de getoetste kernel; de samenstelling van dekking / beschikbaarheid / integriteit is MODELLED — een cirkelvormige/elliptische Kepler-relaisverzameling (niet een differentieel gecorrigeerde LCNS / { "9" }:{ "2" } NRHO-efemeride), een Maan met gemiddelde rotatie (geen fysieke libratie / precesserende pool) en gepubliceerde LunaNet LNIS-integriteitsparameters. Dit toont het lunaire servicevolume M (opmerking in het scenariobestand, regels { "27" } tot { "32" })

seg-f3279128de3b = <s1>Vorige</s1>mars-pnt

seg-92cd937a3fb7 = <s1>Volgende</s1>ntn-positioning

seg-8f8871ac8a0f = Onderwerppagina: <a1>LUNAR-REFERENCE-STATION.md</a1>

seg-a2889fb2b42a = Onderwerppagina: <a1>integrations.md</a1>

seg-e66e2ca31e54 = Onderwerppagina: <a1>MISSION-THREAD-LUNAR.md</a1>

seg-25040e105bf7 = <b>MODELLED</b> De soort en fase <c1/>: beschikbaarheid van relais en PDOP, zicht op aarde en zon en een gestuurde oppervlakteklok voor elke locatie en elk seizoen, met de terreinhorizon van <c2/>; een run voor één locatie is gelijk aan die van die soort

seg-6730fa1b9820 = <s1>Vorige</s1>mission-thread
