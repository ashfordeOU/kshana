# docs--kind-lunar-time-offset: translations (sv)

seg-1f17ef6a853e = Scenariotyp i motor v{ $version }, familj <a1>Måne och cislunart</a1>. Rådgivande: analysutdata från ett forsknings- och ingenjörsverktyg, inte typgodkänd navigationsutrustning och inte en livräddande säkerhetstjänst. Varje etikett här är motorns eller verifieringsmatrisens; en typ är MODELLED om inte matrisen säger något annat (hur en etikett förtjänas: avsnittet Evidens i README).

seg-1c1eeb2dcaa0 = Familjesida: <a1>Måne och cislunart</a1>

seg-619127334cf3 = Ingen matrisrad nämner den här typen vid namn; etiketten på dess resultat är motorns egen, ovan.

seg-4d208b6c0eb8 = dygn

seg-64813e3da228 = Källa: <c1/>

seg-000bb13909f1 = <c1/> (scenariotyp)

seg-7f3e13712f10 = Modellerad relativistisk klockgång mellan jorden och månen (Lunar Coordinate Time, LTC/TCL): den sekulära LTC−TT-gången utifrån skillnaden i egenpotential och månens kinetiska term, angiven med det publicerade bandet { "56" }–{ "59" } µs/dygn, samt den ackumulerade offseten över en horisont.

seg-9efcf3e1be04 = En körning av <c1/> sammanfattas som: lunar-time-offset | secular LTC−TT rate { "57.04" } µs/day (band { "56" }–{ "59" }) | self-pot { "57.50" } kinetic -0.46 | offset @ { "1.00" } d = { "57.04" } µs

seg-9367773c4889 = Valfria fält: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Exemplet <c1/> anger bland annat:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = Diagrammet som motorn skriver för scenarios/lunar-time-offset.toml, typ lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relativistisk klockgång mellan jorden och månen (LTC/TCL) + kedjning av TT/TAI/UTC + ensemble. Oberoende referens (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; underlag för IAU/IAG LunaNets LTC): månytans egenpotential L_m = { "3.13881e-11" } och den sekulära totalen { "56.02" } µs/dygn återgivna som publicerade numeriska värden; månens geocentriska hastighet kontrollerad mot JPL DE440 (de440s.bsp via SPICE)

seg-96b65f604cc2 = Ärlighet: MODELLED, inte certifierad. Siffran us/dygn i rubriken beror på referensen (jordens geoid W0 mot en lunar selenoid, tidsmedelsfönstret, försummade centrifugal-/J2-korrektioner under us/dygn) -> ett band, inte ett enskilt tal, är det ärliga utdata. Ingenting här är validerat till absolut noggrannhet under en nanosekund eller certifierat för operativ tidshållning. Rapporten anger också den ackumulerade LTC-TT-offseten över hori (kommentar i scenariofilen, rad { "11" } till { "16" })

seg-e4552368a6a7 = <s1>Föregående</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Nästa</s1>lunar-vlbi-fim
