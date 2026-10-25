# docs--kind-launch-window: translations (sv)

seg-99ef7c1d552c = Scenariotyp i motor v{ $version }, familj <a1>Uppdragsanalys, länkar och rymdoperationer</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-37d29d8303fe = km

seg-8f1e7d3f5a07 = Familjesida: <a1>Uppdragsanalys, länkar och rymdoperationer</a1>

seg-b054c73f22e5 = inget värde

seg-8e62cc4af6ea = Ämnessida: <a1>ENTRY-EO-ASCENT.md</a1>

seg-1c385961d594 = Källa: <c1/>

seg-e0990c5f14da = <c1/> (scenario kind)

seg-7a4e6215a488 = Tvåkropps-geometri för uppskjutning och uppstigning: uppskjutningsazimut(er) (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, jordrotationens östliga bonus, Δv för planbyte med dogleg när målinklinationen är lägre än platsens latitud, och antalet dagliga uppskjutningstillfällen. MODELLED geometri för en sfärisk jord (ingen korrektion för hastighetstriangeln med roterande jord, ingen modell för uppstignings-/dragförluster).

seg-e24b0ae723c7 = En körning av <c1/> sammanfattas som: launch-window: lat { "28.5" }° -> i { "51.6" }°: Az { "45.0" }° asc, v_circ { "7669" } m/s, +{ "409" } m/s Earth-rotation bonus, { "2" } opportunities/day (MODELLED)

seg-6f955816b5c6 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>, <c5/>, <c6/>

seg-aaadee0743ee = Exemplet <c1/> anger bland annat:

seg-58d26f083b8f = Resultatetikett (motorns egen): MODELLED — tvåkropps-uppskjutningsgeometri för en sfärisk jord; azimut är det geometriska sambandet sin(Az)=cos(i)/cos(lat) (ingen korrektion för hastighetstriangeln med roterande jord, ingen modell för uppstignings-/dragförluster)

seg-9696283a95ae = Diagrammet som motorn skriver för scenarios/launch-window.toml, kind launch-window

seg-38175030f689 = <b>MODELLED</b> Tvåkropps-uppskjutningsazimut(er) (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, jordrotationens östliga bonus, Δv för planbyte med dogleg och dagliga tillfällen, och, givet en epok och IERS finals2000A-rader, platsen

seg-53bc589c7ed6 = <b>MODELLED</b> Tvåkropps-uppskjutningsazimut(er) (sin Az = cos i / cos lat), lägsta nåbara inklination, cirkulär hastighet, jordrotationens östliga bonus, Δv för planbyte med dogleg a. Oracle (InternalConsistency): Uppskjutningsgeometri med sfärisk trigonometri i sluten form mot publicerade räknade exempelankare (Vallado, Fundamentals of Astrodynamics 4th ed., Algorithm { "37" } uppskjutningsazimut + Ch.6 planbyte; tests/launch_window_ascent_geometry_reference.rs). Dessa återanvänder samma slutna form som kshana implementerar (en paritets-/avskriftskontroll mot publicerade värden, InternalConsistency); MODELLED tvåkropp, ingen hastighetstriangel med roterande jord / uppstignings- / drag

seg-12396619d3e5 = MODELLED — tvåkropps-uppskjutningsgeometri för en sfärisk jord; azimut är det geometriska sambandet sin(Az)=cos(i)/cos(lat) (ingen korrektion för hastighetstriangeln med roterande jord, ingen modell för uppstignings-/dragförluster) (result <c1/>)

seg-715f1856bd37 = MODELLED geometri för en sfärisk jord (ingen korrektion för hastighetstriangeln med roterande jord, ingen modell för uppstignings-/dragförluster). (kind catalogue (<c1/>))

seg-4e9a215e3918 = ÄRLIG AVGRÄNSNING: MODELLED. Enbart geometrisk azimut -- ingen korrektion för hastighetstriangeln med roterande jord (bonusen redovisas separat för att räknas in), ingen modell för uppstigningsbana / dragförluster / styrning. Geometri för pre-Phase-A. Run: kshana scenarios/launch-window.toml (scenario file comment, lines { "8" } to { "11" })

seg-12332d181de4 = Uppskjutningsfönster och uppstigningsgeometri (uppdragsanalys) är MODELLED, inte validerade: kontrollerade mot sin egen slutna/analytiska identitet. Det fångar transkriptions- och koefficientfel men är ingen extern oberoende referens. (verification matrix (docs/MODELLED-RATIONALE.md))

seg-1a3841380d88 = <s1>Föregående</s1>jamming

seg-78411b85f301 = <s1>Nästa</s1>leo-navmsg
