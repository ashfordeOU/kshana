# docs--kind-launch-window: translations (nl)

seg-99ef7c1d552c = Scenariotype van de engine v{ $version }, familie <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>. Adviserend: analyse-uitvoer van een onderzoeks- en engineeringhulpmiddel, geen typegoedgekeurde navigatieapparatuur en geen dienst voor het redden van mensenlevens. Elk label hier is dat van de engine of van de verificatiematrix; een type is MODELLED tenzij de matrix anders zegt (hoe een label wordt verdiend: de sectie Evidence van de README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familiepagina: <a1>Missieanalyse, verbindingen en ruimteoperaties</a1>

seg-b054c73f22e5 = geen waarde

seg-8e62cc4af6ea = Onderwerppagina: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Bron: <c1/>

seg-e0990c5f14da = <c1/> (scenariosoort)

seg-7a4e6215a488 = Lanceer- en stijggeometrie met twee lichamen: lanceerazimut(s) (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, de oostwaartse bonus van de aardrotatie, Δv voor een dogleg-vlakwijziging wanneer de doelinclinatie lager is dan de breedtegraad van de locatie, en het aantal dagelijkse lanceermogelijkheden. MODELLED geometrie met een bolvormige aarde (geen correctie met snelheidsdriehoek voor de roterende aarde, geen model voor stijg-/weerstandsverlies).

seg-e24b0ae723c7 = Eén run van <c1/> vat samen als: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = Optionele velden: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Het voorbeeld <c1/> stelt onder meer in:

seg-58d26f083b8f = Resultaatlabel (van de engine): MODELLED — lanceergeometrie met twee lichamen en een bolvormige aarde; het azimut is de geometrische relatie sin(Az)=cos(i)/cos(lat) (geen correctie met snelheidsdriehoek voor de roterende aarde, geen model voor stijg-/weerstandsverlies)

seg-9696283a95ae = De grafiek die de engine schrijft voor scenarios/launch-window.toml, soort launch-window

seg-38175030f689 = <b>MODELLED</b> Lanceerazimut(s) met twee lichamen (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, oostwaartse bonus van de aardrotatie, Δv voor dogleg-vlakwijziging en dagelijkse mogelijkheden, en, gegeven een epoche en IERS-finals2000A-rijen, de locatie

seg-53bc589c7ed6 = <b>MODELLED</b> Lanceerazimut(s) met twee lichamen (sin Az = cos i / cos lat), minimaal bereikbare inclinatie, cirkelsnelheid, oostwaartse bonus van de aardrotatie, Δv voor dogleg-vlakwijziging a. Onafhankelijke referentie (InternalConsistency): Gesloten-vorm-lanceergeometrie met boldriehoeksmeting tegenover gepubliceerde ankers van uitgewerkte voorbeelden (Vallado, Fundamentals of Astrodynamics 4e druk, Algorithm { "37" } lanceerazimut + hfdst. 6 vlakwijziging; tests/launch_window_ascent_geometry_reference.rs). Deze hergebruiken dezelfde gesloten vorm die kshana implementeert (een pariteits-/transcriptiecontrole op gepubliceerde waarden, InternalConsistency); MODELLED met twee lichamen, geen snelheidsdriehoek voor de roterende aarde / stijg- / weerstan

seg-12396619d3e5 = MODELLED — lanceergeometrie met twee lichamen en een bolvormige aarde; het azimut is de geometrische relatie sin(Az)=cos(i)/cos(lat) (geen correctie met snelheidsdriehoek voor de roterende aarde, geen model voor stijg-/weerstandsverlies) (resultaat <c1/>)

seg-715f1856bd37 = MODELLED geometrie met een bolvormige aarde (geen correctie met snelheidsdriehoek voor de roterende aarde, geen model voor stijg-/weerstandsverlies). (soortencatalogus (<c1/>))

seg-4e9a215e3918 = EERLIJKE REIKWIJDTE: MODELLED. Alleen geometrisch azimut -- geen correctie met snelheidsdriehoek voor de roterende aarde (de bonus wordt apart gerapporteerd om erin te verwerken), geen stijgtraject-, weerstandsverlies- of stuurmodel. Pre-Phase-A-geometrie. Uitvoeren: kshana scenarios/launch-window.toml (opmerking in het scenariobestand, regels { "8" } tot { "11" })

seg-12332d181de4 = Lanceervenster- en stijggeometrie (missieanalyse) is MODELLED, niet getoetst aan een onafhankelijke externe referentie: gecontroleerd tegen een eigen gesloten-vorm- of analytische identiteit, wat transcriptie- en coëfficiëntfouten opvangt maar geen externe onafhankelijke referentie is. (verificatiematrix (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Vorige</s1>jamming

seg-78411b85f301 = <s1>Volgende</s1>leo-navmsg
