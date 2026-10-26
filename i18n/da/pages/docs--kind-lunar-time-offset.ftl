# docs--kind-lunar-time-offset: translations (da)

seg-1f17ef6a853e = Scenarietype i motoren v{ $version }, familie <a1>Måne og cislunart rum</a1>. Vejledende: analyseoutput fra et forsknings- og ingeniørværktøj, ikke typegodkendt navigationsudstyr og ikke en sikkerhedskritisk tjeneste (safety-of-life). Hver mærkat her er motorens eller verifikationsmatrixens; en type er MODELLED, medmindre matrixen siger andet (hvordan en mærkat opnås: README'ens afsnit Evidence).

seg-1c1eeb2dcaa0 = Familieside: <a1>Måne og cislunart rum</a1>

seg-4d208b6c0eb8 = day

seg-64813e3da228 = Kilde: <c1/>

seg-000bb13909f1 = <c1/> (scenarietype)

seg-7f3e13712f10 = Modelleret relativistisk urrate mellem Jorden og Månen (Lunar Coordinate Time, LTC/TCL): den sekulære rate LTC−TT ud fra forskellen i selvpotentiale og Månens kinetiske led, rapporteret med det offentliggjorte bånd på { "56" }–{ "59" } µs/dag, plus den akkumulerede forskydning over en horisont.

seg-9efcf3e1be04 = Én kørsel af <c1/> opsummeres som: lunar-time-offset | secular LTC−TT rate { "57.04" } µs/day (band { "56" }–{ "59" }) | self-pot { "57.50" } kinetic -0.46 | offset @ { "1.00" } d = { "57.04" } µs

seg-9367773c4889 = Valgfrie felter: <c1/>, <c2/>, <c3/>, <c4/>

seg-4731141e6aac = Eksemplet <c1/> sætter blandt andet:

seg-3843825d0733 = us

seg-e9deb6ed41c1 = Diagrammet, som motoren skriver for scenarios/lunar-time-offset.toml, type lunar-time-offset

seg-982426693747 = <b>VALIDATED</b> Relativistisk urrate mellem Jorden og Månen (LTC/TCL) + kædning af TT/TAI/UTC + ensemble. Uafhængig reference (ExternalDataset): Ashby & Patla { "2024" }, 'A Relativistic Framework to Estimate Clock Rates on the Moon', Astronomical Journal { "167" }:{ "149" } (NIST; grundlag for IAU/IAG's LunaNet LTC): Månens selvpotentiale på overfladen L_m = { "3.13881e-11" } og sekulær total { "56.02" } µs/dag stemmer som offentliggjorte numeriske værdier; Månens geocentriske hastighed krydskontrolleret mod JPL DE440 (de440s.bsp via SPICE)

seg-96b65f604cc2 = Ærlighed: MODELLED, ikke certificeret. Hovedtallet i us/dag afhænger af referencen (Jordens geoide W0 mod en lunar selenoide, middelværdivinduet i tid, forsømte korrektioner under us/dag for centrifugalkraft/J2) -> et bånd, ikke ét enkelt tal, er det ærlige output. Intet her er valideret til absolut nøjagtighed under nanosekundet eller certificeret til operationel tidshold. Rapporten angiver også den akkumulerede LTC-TT-forskydning over hori (kommentar i scenariefilen, linje { "11" } til { "16" })

seg-e4552368a6a7 = <s1>Forrige</s1>lunar-time-budget

seg-777dc23bac6a = <s1>Næste</s1>lunar-vlbi-fim
